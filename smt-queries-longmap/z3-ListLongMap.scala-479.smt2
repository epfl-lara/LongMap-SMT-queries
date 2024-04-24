; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10026 () Bool)

(assert start!10026)

(declare-fun b!75896 () Bool)

(declare-fun b_free!2137 () Bool)

(declare-fun b_next!2137 () Bool)

(assert (=> b!75896 (= b_free!2137 (not b_next!2137))))

(declare-fun tp!8603 () Bool)

(declare-fun b_and!4641 () Bool)

(assert (=> b!75896 (= tp!8603 b_and!4641)))

(declare-fun b!75913 () Bool)

(declare-fun b_free!2139 () Bool)

(declare-fun b_next!2139 () Bool)

(assert (=> b!75913 (= b_free!2139 (not b_next!2139))))

(declare-fun tp!8604 () Bool)

(declare-fun b_and!4643 () Bool)

(assert (=> b!75913 (= tp!8604 b_and!4643)))

(declare-fun b!75895 () Bool)

(declare-fun res!39994 () Bool)

(declare-fun e!49577 () Bool)

(assert (=> b!75895 (=> res!39994 e!49577)))

(declare-datatypes ((V!2961 0))(
  ( (V!2962 (val!1287 Int)) )
))
(declare-datatypes ((array!3905 0))(
  ( (array!3906 (arr!1862 (Array (_ BitVec 32) (_ BitVec 64))) (size!2102 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!899 0))(
  ( (ValueCellFull!899 (v!2560 V!2961)) (EmptyCell!899) )
))
(declare-datatypes ((array!3907 0))(
  ( (array!3908 (arr!1863 (Array (_ BitVec 32) ValueCell!899)) (size!2103 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!706 0))(
  ( (LongMapFixedSize!707 (defaultEntry!2246 Int) (mask!6229 (_ BitVec 32)) (extraKeys!2099 (_ BitVec 32)) (zeroValue!2145 V!2961) (minValue!2145 V!2961) (_size!402 (_ BitVec 32)) (_keys!3904 array!3905) (_values!2229 array!3907) (_vacant!402 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!514 0))(
  ( (Cell!515 (v!2561 LongMapFixedSize!706)) )
))
(declare-datatypes ((LongMap!514 0))(
  ( (LongMap!515 (underlying!268 Cell!514)) )
))
(declare-fun thiss!992 () LongMap!514)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3905 (_ BitVec 32)) Bool)

(assert (=> b!75895 (= res!39994 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun res!39997 () Bool)

(declare-fun e!49575 () Bool)

(assert (=> start!10026 (=> (not res!39997) (not e!49575))))

(declare-fun valid!311 (LongMap!514) Bool)

(assert (=> start!10026 (= res!39997 (valid!311 thiss!992))))

(assert (=> start!10026 e!49575))

(declare-fun e!49573 () Bool)

(assert (=> start!10026 e!49573))

(assert (=> start!10026 true))

(declare-fun e!49569 () Bool)

(assert (=> start!10026 e!49569))

(declare-fun e!49565 () Bool)

(declare-fun tp_is_empty!2485 () Bool)

(declare-fun e!49578 () Bool)

(declare-fun array_inv!1145 (array!3905) Bool)

(declare-fun array_inv!1146 (array!3907) Bool)

(assert (=> b!75896 (= e!49578 (and tp!8603 tp_is_empty!2485 (array_inv!1145 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (array_inv!1146 (_values!2229 (v!2561 (underlying!268 thiss!992)))) e!49565))))

(declare-fun b!75897 () Bool)

(declare-fun e!49563 () Bool)

(assert (=> b!75897 (= e!49563 e!49578)))

(declare-fun b!75898 () Bool)

(declare-datatypes ((List!1481 0))(
  ( (Nil!1478) (Cons!1477 (h!2065 (_ BitVec 64)) (t!5067 List!1481)) )
))
(declare-fun arrayNoDuplicates!0 (array!3905 (_ BitVec 32) List!1481) Bool)

(assert (=> b!75898 (= e!49577 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 Nil!1478))))

(declare-fun b!75899 () Bool)

(declare-fun res!39989 () Bool)

(assert (=> b!75899 (=> (not res!39989) (not e!49575))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!75899 (= res!39989 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun b!75900 () Bool)

(declare-fun e!49564 () Bool)

(assert (=> b!75900 (= e!49564 tp_is_empty!2485)))

(declare-fun b!75901 () Bool)

(declare-fun mapRes!3215 () Bool)

(assert (=> b!75901 (= e!49565 (and e!49564 mapRes!3215))))

(declare-fun condMapEmpty!3216 () Bool)

(declare-fun mapDefault!3216 () ValueCell!899)

(assert (=> b!75901 (= condMapEmpty!3216 (= (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3216)))))

(declare-fun b!75902 () Bool)

(declare-fun res!39993 () Bool)

(assert (=> b!75902 (=> (not res!39993) (not e!49575))))

(declare-fun newMap!16 () LongMapFixedSize!706)

(declare-fun valid!312 (LongMapFixedSize!706) Bool)

(assert (=> b!75902 (= res!39993 (valid!312 newMap!16))))

(declare-fun b!75903 () Bool)

(declare-fun e!49579 () Bool)

(assert (=> b!75903 (= e!49579 tp_is_empty!2485)))

(declare-fun mapIsEmpty!3215 () Bool)

(declare-fun mapRes!3216 () Bool)

(assert (=> mapIsEmpty!3215 mapRes!3216))

(declare-fun b!75904 () Bool)

(declare-fun res!39998 () Bool)

(assert (=> b!75904 (=> res!39998 e!49577)))

(assert (=> b!75904 (= res!39998 (or (not (= (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6229 (v!2561 (underlying!268 thiss!992)))))) (not (= (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992)))))) (bvslt (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!75905 () Bool)

(declare-fun e!49574 () Bool)

(declare-fun e!49570 () Bool)

(assert (=> b!75905 (= e!49574 e!49570)))

(declare-fun res!39992 () Bool)

(assert (=> b!75905 (=> (not res!39992) (not e!49570))))

(declare-datatypes ((tuple2!2134 0))(
  ( (tuple2!2135 (_1!1078 Bool) (_2!1078 LongMapFixedSize!706)) )
))
(declare-fun lt!34457 () tuple2!2134)

(assert (=> b!75905 (= res!39992 (and (_1!1078 lt!34457) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2186 0))(
  ( (Unit!2187) )
))
(declare-fun lt!34454 () Unit!2186)

(declare-fun e!49576 () Unit!2186)

(assert (=> b!75905 (= lt!34454 e!49576)))

(declare-fun c!11555 () Bool)

(declare-datatypes ((tuple2!2136 0))(
  ( (tuple2!2137 (_1!1079 (_ BitVec 64)) (_2!1079 V!2961)) )
))
(declare-datatypes ((List!1482 0))(
  ( (Nil!1479) (Cons!1478 (h!2066 tuple2!2136) (t!5068 List!1482)) )
))
(declare-datatypes ((ListLongMap!1411 0))(
  ( (ListLongMap!1412 (toList!721 List!1482)) )
))
(declare-fun lt!34453 () ListLongMap!1411)

(declare-fun contains!726 (ListLongMap!1411 (_ BitVec 64)) Bool)

(assert (=> b!75905 (= c!11555 (contains!726 lt!34453 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun lt!34462 () V!2961)

(declare-fun update!112 (LongMapFixedSize!706 (_ BitVec 64) V!2961) tuple2!2134)

(assert (=> b!75905 (= lt!34457 (update!112 newMap!16 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))

(declare-fun b!75906 () Bool)

(assert (=> b!75906 (= e!49573 e!49563)))

(declare-fun b!75907 () Bool)

(declare-fun Unit!2188 () Unit!2186)

(assert (=> b!75907 (= e!49576 Unit!2188)))

(declare-fun lt!34459 () Unit!2186)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!47 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2186)

(assert (=> b!75907 (= lt!34459 (lemmaListMapContainsThenArrayContainsFrom!47 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75907 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!34455 () Unit!2186)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3905 (_ BitVec 32) (_ BitVec 32)) Unit!2186)

(assert (=> b!75907 (= lt!34455 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!75907 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) from!355 Nil!1478)))

(declare-fun lt!34461 () Unit!2186)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3905 (_ BitVec 32) (_ BitVec 64) List!1481) Unit!2186)

(assert (=> b!75907 (= lt!34461 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478)))))

(assert (=> b!75907 false))

(declare-fun b!75908 () Bool)

(declare-fun res!39996 () Bool)

(assert (=> b!75908 (=> (not res!39996) (not e!49575))))

(assert (=> b!75908 (= res!39996 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6229 newMap!16)) (_size!402 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!75909 () Bool)

(declare-fun e!49571 () Bool)

(assert (=> b!75909 (= e!49575 e!49571)))

(declare-fun res!39991 () Bool)

(assert (=> b!75909 (=> (not res!39991) (not e!49571))))

(declare-fun lt!34458 () ListLongMap!1411)

(assert (=> b!75909 (= res!39991 (= lt!34458 lt!34453))))

(declare-fun map!1168 (LongMapFixedSize!706) ListLongMap!1411)

(assert (=> b!75909 (= lt!34453 (map!1168 newMap!16))))

(declare-fun getCurrentListMap!418 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) ListLongMap!1411)

(assert (=> b!75909 (= lt!34458 (getCurrentListMap!418 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun mapNonEmpty!3215 () Bool)

(declare-fun tp!8601 () Bool)

(declare-fun e!49572 () Bool)

(assert (=> mapNonEmpty!3215 (= mapRes!3216 (and tp!8601 e!49572))))

(declare-fun mapValue!3216 () ValueCell!899)

(declare-fun mapKey!3215 () (_ BitVec 32))

(declare-fun mapRest!3215 () (Array (_ BitVec 32) ValueCell!899))

(assert (=> mapNonEmpty!3215 (= (arr!1863 (_values!2229 newMap!16)) (store mapRest!3215 mapKey!3215 mapValue!3216))))

(declare-fun b!75910 () Bool)

(declare-fun e!49567 () Bool)

(assert (=> b!75910 (= e!49567 tp_is_empty!2485)))

(declare-fun mapIsEmpty!3216 () Bool)

(assert (=> mapIsEmpty!3216 mapRes!3215))

(declare-fun b!75911 () Bool)

(assert (=> b!75911 (= e!49571 e!49574)))

(declare-fun res!39995 () Bool)

(assert (=> b!75911 (=> (not res!39995) (not e!49574))))

(assert (=> b!75911 (= res!39995 (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1162 (ValueCell!899 V!2961) V!2961)

(declare-fun dynLambda!332 (Int (_ BitVec 64)) V!2961)

(assert (=> b!75911 (= lt!34462 (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75912 () Bool)

(assert (=> b!75912 (= e!49570 (not e!49577))))

(declare-fun res!39990 () Bool)

(assert (=> b!75912 (=> res!39990 e!49577)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75912 (= res!39990 (not (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun lt!34452 () ListLongMap!1411)

(declare-fun lt!34456 () tuple2!2136)

(declare-fun lt!34463 () tuple2!2136)

(declare-fun +!96 (ListLongMap!1411 tuple2!2136) ListLongMap!1411)

(assert (=> b!75912 (= (+!96 (+!96 lt!34452 lt!34456) lt!34463) (+!96 (+!96 lt!34452 lt!34463) lt!34456))))

(assert (=> b!75912 (= lt!34463 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))

(assert (=> b!75912 (= lt!34456 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))

(declare-fun lt!34460 () Unit!2186)

(declare-fun addCommutativeForDiffKeys!16 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64) V!2961) Unit!2186)

(assert (=> b!75912 (= lt!34460 (addCommutativeForDiffKeys!16 lt!34452 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!61 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) ListLongMap!1411)

(assert (=> b!75912 (= lt!34452 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun e!49580 () Bool)

(assert (=> b!75913 (= e!49569 (and tp!8604 tp_is_empty!2485 (array_inv!1145 (_keys!3904 newMap!16)) (array_inv!1146 (_values!2229 newMap!16)) e!49580))))

(declare-fun b!75914 () Bool)

(assert (=> b!75914 (= e!49572 tp_is_empty!2485)))

(declare-fun b!75915 () Bool)

(assert (=> b!75915 (= e!49580 (and e!49579 mapRes!3216))))

(declare-fun condMapEmpty!3215 () Bool)

(declare-fun mapDefault!3215 () ValueCell!899)

(assert (=> b!75915 (= condMapEmpty!3215 (= (arr!1863 (_values!2229 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3215)))))

(declare-fun b!75916 () Bool)

(declare-fun Unit!2189 () Unit!2186)

(assert (=> b!75916 (= e!49576 Unit!2189)))

(declare-fun mapNonEmpty!3216 () Bool)

(declare-fun tp!8602 () Bool)

(assert (=> mapNonEmpty!3216 (= mapRes!3215 (and tp!8602 e!49567))))

(declare-fun mapValue!3215 () ValueCell!899)

(declare-fun mapRest!3216 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapKey!3216 () (_ BitVec 32))

(assert (=> mapNonEmpty!3216 (= (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (store mapRest!3216 mapKey!3216 mapValue!3215))))

(assert (= (and start!10026 res!39997) b!75899))

(assert (= (and b!75899 res!39989) b!75902))

(assert (= (and b!75902 res!39993) b!75908))

(assert (= (and b!75908 res!39996) b!75909))

(assert (= (and b!75909 res!39991) b!75911))

(assert (= (and b!75911 res!39995) b!75905))

(assert (= (and b!75905 c!11555) b!75907))

(assert (= (and b!75905 (not c!11555)) b!75916))

(assert (= (and b!75905 res!39992) b!75912))

(assert (= (and b!75912 (not res!39990)) b!75904))

(assert (= (and b!75904 (not res!39998)) b!75895))

(assert (= (and b!75895 (not res!39994)) b!75898))

(assert (= (and b!75901 condMapEmpty!3216) mapIsEmpty!3216))

(assert (= (and b!75901 (not condMapEmpty!3216)) mapNonEmpty!3216))

(get-info :version)

(assert (= (and mapNonEmpty!3216 ((_ is ValueCellFull!899) mapValue!3215)) b!75910))

(assert (= (and b!75901 ((_ is ValueCellFull!899) mapDefault!3216)) b!75900))

(assert (= b!75896 b!75901))

(assert (= b!75897 b!75896))

(assert (= b!75906 b!75897))

(assert (= start!10026 b!75906))

(assert (= (and b!75915 condMapEmpty!3215) mapIsEmpty!3215))

(assert (= (and b!75915 (not condMapEmpty!3215)) mapNonEmpty!3215))

(assert (= (and mapNonEmpty!3215 ((_ is ValueCellFull!899) mapValue!3216)) b!75914))

(assert (= (and b!75915 ((_ is ValueCellFull!899) mapDefault!3215)) b!75903))

(assert (= b!75913 b!75915))

(assert (= start!10026 b!75913))

(declare-fun b_lambda!3417 () Bool)

(assert (=> (not b_lambda!3417) (not b!75911)))

(declare-fun t!5064 () Bool)

(declare-fun tb!1557 () Bool)

(assert (=> (and b!75896 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) t!5064) tb!1557))

(declare-fun result!2721 () Bool)

(assert (=> tb!1557 (= result!2721 tp_is_empty!2485)))

(assert (=> b!75911 t!5064))

(declare-fun b_and!4645 () Bool)

(assert (= b_and!4641 (and (=> t!5064 result!2721) b_and!4645)))

(declare-fun tb!1559 () Bool)

(declare-fun t!5066 () Bool)

(assert (=> (and b!75913 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) t!5066) tb!1559))

(declare-fun result!2725 () Bool)

(assert (= result!2725 result!2721))

(assert (=> b!75911 t!5066))

(declare-fun b_and!4647 () Bool)

(assert (= b_and!4643 (and (=> t!5066 result!2725) b_and!4647)))

(declare-fun m!75741 () Bool)

(assert (=> b!75912 m!75741))

(declare-fun m!75743 () Bool)

(assert (=> b!75912 m!75743))

(declare-fun m!75745 () Bool)

(assert (=> b!75912 m!75745))

(declare-fun m!75747 () Bool)

(assert (=> b!75912 m!75747))

(declare-fun m!75749 () Bool)

(assert (=> b!75912 m!75749))

(assert (=> b!75912 m!75745))

(assert (=> b!75912 m!75741))

(declare-fun m!75751 () Bool)

(assert (=> b!75912 m!75751))

(assert (=> b!75912 m!75749))

(declare-fun m!75753 () Bool)

(assert (=> b!75912 m!75753))

(declare-fun m!75755 () Bool)

(assert (=> b!75912 m!75755))

(declare-fun m!75757 () Bool)

(assert (=> b!75913 m!75757))

(declare-fun m!75759 () Bool)

(assert (=> b!75913 m!75759))

(declare-fun m!75761 () Bool)

(assert (=> b!75902 m!75761))

(declare-fun m!75763 () Bool)

(assert (=> b!75898 m!75763))

(declare-fun m!75765 () Bool)

(assert (=> b!75895 m!75765))

(assert (=> b!75911 m!75749))

(declare-fun m!75767 () Bool)

(assert (=> b!75911 m!75767))

(declare-fun m!75769 () Bool)

(assert (=> b!75911 m!75769))

(assert (=> b!75911 m!75767))

(assert (=> b!75911 m!75769))

(declare-fun m!75771 () Bool)

(assert (=> b!75911 m!75771))

(declare-fun m!75773 () Bool)

(assert (=> b!75907 m!75773))

(declare-fun m!75775 () Bool)

(assert (=> b!75907 m!75775))

(assert (=> b!75907 m!75749))

(declare-fun m!75777 () Bool)

(assert (=> b!75907 m!75777))

(assert (=> b!75907 m!75749))

(assert (=> b!75907 m!75749))

(declare-fun m!75779 () Bool)

(assert (=> b!75907 m!75779))

(assert (=> b!75907 m!75749))

(declare-fun m!75781 () Bool)

(assert (=> b!75907 m!75781))

(assert (=> b!75905 m!75749))

(assert (=> b!75905 m!75749))

(declare-fun m!75783 () Bool)

(assert (=> b!75905 m!75783))

(assert (=> b!75905 m!75749))

(declare-fun m!75785 () Bool)

(assert (=> b!75905 m!75785))

(declare-fun m!75787 () Bool)

(assert (=> start!10026 m!75787))

(declare-fun m!75789 () Bool)

(assert (=> mapNonEmpty!3215 m!75789))

(declare-fun m!75791 () Bool)

(assert (=> b!75896 m!75791))

(declare-fun m!75793 () Bool)

(assert (=> b!75896 m!75793))

(declare-fun m!75795 () Bool)

(assert (=> mapNonEmpty!3216 m!75795))

(declare-fun m!75797 () Bool)

(assert (=> b!75909 m!75797))

(declare-fun m!75799 () Bool)

(assert (=> b!75909 m!75799))

(check-sat (not b_next!2139) b_and!4645 (not b!75905) (not mapNonEmpty!3216) (not b!75907) (not b!75896) (not b!75913) (not start!10026) (not b!75911) (not b!75912) b_and!4647 (not b!75902) (not b!75898) (not b!75909) (not b!75895) (not b_lambda!3417) (not b_next!2137) tp_is_empty!2485 (not mapNonEmpty!3215))
(check-sat b_and!4645 b_and!4647 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun b_lambda!3423 () Bool)

(assert (= b_lambda!3417 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3423)))

(check-sat (not b_next!2139) b_and!4645 (not b!75905) (not mapNonEmpty!3216) (not b_lambda!3423) (not b!75895) (not b!75907) (not b!75896) (not b!75913) (not start!10026) (not b!75911) (not b!75912) b_and!4647 (not b!75902) (not b!75898) (not b!75909) (not b_next!2137) tp_is_empty!2485 (not mapNonEmpty!3215))
(check-sat b_and!4645 b_and!4647 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun d!18125 () Bool)

(declare-fun e!49693 () Bool)

(assert (=> d!18125 e!49693))

(declare-fun res!40061 () Bool)

(assert (=> d!18125 (=> res!40061 e!49693)))

(declare-fun lt!34546 () Bool)

(assert (=> d!18125 (= res!40061 (not lt!34546))))

(declare-fun lt!34544 () Bool)

(assert (=> d!18125 (= lt!34546 lt!34544)))

(declare-fun lt!34547 () Unit!2186)

(declare-fun e!49694 () Unit!2186)

(assert (=> d!18125 (= lt!34547 e!49694)))

(declare-fun c!11564 () Bool)

(assert (=> d!18125 (= c!11564 lt!34544)))

(declare-fun containsKey!139 (List!1482 (_ BitVec 64)) Bool)

(assert (=> d!18125 (= lt!34544 (containsKey!139 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18125 (= (contains!726 lt!34453 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) lt!34546)))

(declare-fun b!76061 () Bool)

(declare-fun lt!34545 () Unit!2186)

(assert (=> b!76061 (= e!49694 lt!34545)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!87 (List!1482 (_ BitVec 64)) Unit!2186)

(assert (=> b!76061 (= lt!34545 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-datatypes ((Option!142 0))(
  ( (Some!141 (v!2567 V!2961)) (None!140) )
))
(declare-fun isDefined!88 (Option!142) Bool)

(declare-fun getValueByKey!136 (List!1482 (_ BitVec 64)) Option!142)

(assert (=> b!76061 (isDefined!88 (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76062 () Bool)

(declare-fun Unit!2190 () Unit!2186)

(assert (=> b!76062 (= e!49694 Unit!2190)))

(declare-fun b!76063 () Bool)

(assert (=> b!76063 (= e!49693 (isDefined!88 (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (= (and d!18125 c!11564) b!76061))

(assert (= (and d!18125 (not c!11564)) b!76062))

(assert (= (and d!18125 (not res!40061)) b!76063))

(assert (=> d!18125 m!75749))

(declare-fun m!75921 () Bool)

(assert (=> d!18125 m!75921))

(assert (=> b!76061 m!75749))

(declare-fun m!75923 () Bool)

(assert (=> b!76061 m!75923))

(assert (=> b!76061 m!75749))

(declare-fun m!75925 () Bool)

(assert (=> b!76061 m!75925))

(assert (=> b!76061 m!75925))

(declare-fun m!75927 () Bool)

(assert (=> b!76061 m!75927))

(assert (=> b!76063 m!75749))

(assert (=> b!76063 m!75925))

(assert (=> b!76063 m!75925))

(assert (=> b!76063 m!75927))

(assert (=> b!75905 d!18125))

(declare-fun bm!6836 () Bool)

(declare-fun call!6857 () Unit!2186)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2186)

(assert (=> bm!6836 (= call!6857 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(declare-fun d!18127 () Bool)

(declare-fun e!49747 () Bool)

(assert (=> d!18127 e!49747))

(declare-fun res!40095 () Bool)

(assert (=> d!18127 (=> (not res!40095) (not e!49747))))

(declare-fun lt!34618 () tuple2!2134)

(assert (=> d!18127 (= res!40095 (valid!312 (_2!1078 lt!34618)))))

(declare-fun e!49753 () tuple2!2134)

(assert (=> d!18127 (= lt!34618 e!49753)))

(declare-fun c!11594 () Bool)

(assert (=> d!18127 (= c!11594 (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvneg (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (=> d!18127 (valid!312 newMap!16)))

(assert (=> d!18127 (= (update!112 newMap!16 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462) lt!34618)))

(declare-fun b!76144 () Bool)

(declare-fun e!49755 () Unit!2186)

(declare-fun lt!34616 () Unit!2186)

(assert (=> b!76144 (= e!49755 lt!34616)))

(assert (=> b!76144 (= lt!34616 call!6857)))

(declare-datatypes ((SeekEntryResult!232 0))(
  ( (MissingZero!232 (index!3061 (_ BitVec 32))) (Found!232 (index!3062 (_ BitVec 32))) (Intermediate!232 (undefined!1044 Bool) (index!3063 (_ BitVec 32)) (x!11381 (_ BitVec 32))) (Undefined!232) (MissingVacant!232 (index!3064 (_ BitVec 32))) )
))
(declare-fun lt!34627 () SeekEntryResult!232)

(declare-fun call!6841 () SeekEntryResult!232)

(assert (=> b!76144 (= lt!34627 call!6841)))

(declare-fun c!11600 () Bool)

(assert (=> b!76144 (= c!11600 ((_ is MissingZero!232) lt!34627))))

(declare-fun e!49754 () Bool)

(assert (=> b!76144 e!49754))

(declare-fun b!76145 () Bool)

(declare-fun res!40098 () Bool)

(declare-fun call!6851 () Bool)

(assert (=> b!76145 (= res!40098 call!6851)))

(declare-fun e!49750 () Bool)

(assert (=> b!76145 (=> (not res!40098) (not e!49750))))

(declare-fun bm!6837 () Bool)

(declare-fun call!6858 () ListLongMap!1411)

(declare-fun call!6844 () ListLongMap!1411)

(assert (=> bm!6837 (= call!6858 call!6844)))

(declare-fun b!76146 () Bool)

(declare-fun e!49744 () tuple2!2134)

(declare-fun e!49738 () tuple2!2134)

(assert (=> b!76146 (= e!49744 e!49738)))

(declare-fun c!11596 () Bool)

(declare-fun lt!34603 () SeekEntryResult!232)

(assert (=> b!76146 (= c!11596 ((_ is MissingZero!232) lt!34603))))

(declare-fun b!76147 () Bool)

(declare-fun res!40090 () Bool)

(declare-fun e!49756 () Bool)

(assert (=> b!76147 (=> (not res!40090) (not e!49756))))

(declare-fun lt!34605 () SeekEntryResult!232)

(assert (=> b!76147 (= res!40090 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3061 lt!34605)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6838 () Bool)

(declare-fun call!6849 () ListLongMap!1411)

(declare-fun call!6843 () ListLongMap!1411)

(assert (=> bm!6838 (= call!6849 call!6843)))

(declare-fun b!76148 () Bool)

(declare-fun lt!34613 () Unit!2186)

(declare-fun lt!34617 () Unit!2186)

(assert (=> b!76148 (= lt!34613 lt!34617)))

(declare-fun call!6854 () ListLongMap!1411)

(assert (=> b!76148 (= call!6854 call!6849)))

(declare-fun lt!34625 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!26 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2186)

(assert (=> b!76148 (= lt!34617 (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34625 (zeroValue!2145 newMap!16) lt!34462 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76148 (= lt!34625 (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!49740 () tuple2!2134)

(assert (=> b!76148 (= e!49740 (tuple2!2135 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6229 newMap!16) (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) lt!34462 (minValue!2145 newMap!16) (_size!402 newMap!16) (_keys!3904 newMap!16) (_values!2229 newMap!16) (_vacant!402 newMap!16))))))

(declare-fun b!76149 () Bool)

(declare-fun e!49746 () tuple2!2134)

(assert (=> b!76149 (= e!49753 e!49746)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3905 (_ BitVec 32)) SeekEntryResult!232)

(assert (=> b!76149 (= lt!34603 (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun c!11599 () Bool)

(assert (=> b!76149 (= c!11599 ((_ is Undefined!232) lt!34603))))

(declare-fun b!76150 () Bool)

(declare-fun lt!34604 () Unit!2186)

(assert (=> b!76150 (= lt!34604 e!49755)))

(declare-fun c!11592 () Bool)

(declare-fun call!6855 () Bool)

(assert (=> b!76150 (= c!11592 call!6855)))

(assert (=> b!76150 (= e!49746 (tuple2!2135 false newMap!16))))

(declare-fun b!76151 () Bool)

(assert (=> b!76151 (= e!49753 e!49740)))

(declare-fun c!11591 () Bool)

(assert (=> b!76151 (= c!11591 (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6839 () Bool)

(declare-fun lt!34623 () array!3907)

(assert (=> bm!6839 (= call!6843 (getCurrentListMap!418 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun call!6845 () SeekEntryResult!232)

(declare-fun bm!6840 () Bool)

(assert (=> bm!6840 (= call!6845 (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun bm!6841 () Bool)

(declare-fun call!6850 () Bool)

(declare-fun call!6840 () Bool)

(assert (=> bm!6841 (= call!6850 call!6840)))

(declare-fun bm!6842 () Bool)

(declare-fun call!6853 () ListLongMap!1411)

(assert (=> bm!6842 (= call!6853 (map!1168 (_2!1078 lt!34618)))))

(declare-fun b!76152 () Bool)

(declare-fun e!49742 () Bool)

(declare-fun call!6860 () Bool)

(assert (=> b!76152 (= e!49742 (not call!6860))))

(declare-fun b!76153 () Bool)

(declare-fun e!49743 () Bool)

(assert (=> b!76153 (= e!49743 ((_ is Undefined!232) lt!34627))))

(declare-fun b!76154 () Bool)

(declare-fun e!49741 () Bool)

(declare-fun call!6839 () Bool)

(assert (=> b!76154 (= e!49741 (not call!6839))))

(declare-fun b!76155 () Bool)

(declare-fun res!40094 () Bool)

(declare-fun e!49749 () Bool)

(assert (=> b!76155 (=> (not res!40094) (not e!49749))))

(declare-fun call!6856 () Bool)

(assert (=> b!76155 (= res!40094 call!6856)))

(assert (=> b!76155 (= e!49754 e!49749)))

(declare-fun e!49757 () Bool)

(declare-fun lt!34626 () SeekEntryResult!232)

(declare-fun b!76156 () Bool)

(assert (=> b!76156 (= e!49757 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34626)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun bm!6843 () Bool)

(assert (=> bm!6843 (= call!6841 call!6845)))

(declare-fun b!76157 () Bool)

(declare-fun res!40103 () Bool)

(assert (=> b!76157 (=> (not res!40103) (not e!49756))))

(declare-fun call!6842 () Bool)

(assert (=> b!76157 (= res!40103 call!6842)))

(declare-fun e!49739 () Bool)

(assert (=> b!76157 (= e!49739 e!49756)))

(declare-fun bm!6844 () Bool)

(declare-fun call!6847 () ListLongMap!1411)

(assert (=> bm!6844 (= call!6854 call!6847)))

(declare-fun b!76158 () Bool)

(declare-fun e!49751 () Unit!2186)

(declare-fun lt!34608 () Unit!2186)

(assert (=> b!76158 (= e!49751 lt!34608)))

(declare-fun call!6862 () Unit!2186)

(assert (=> b!76158 (= lt!34608 call!6862)))

(declare-fun lt!34609 () SeekEntryResult!232)

(declare-fun call!6846 () SeekEntryResult!232)

(assert (=> b!76158 (= lt!34609 call!6846)))

(declare-fun res!40097 () Bool)

(assert (=> b!76158 (= res!40097 ((_ is Found!232) lt!34609))))

(assert (=> b!76158 (=> (not res!40097) (not e!49750))))

(assert (=> b!76158 e!49750))

(declare-fun b!76159 () Bool)

(declare-fun e!49745 () Bool)

(declare-fun e!49752 () Bool)

(assert (=> b!76159 (= e!49745 e!49752)))

(declare-fun res!40102 () Bool)

(assert (=> b!76159 (= res!40102 (contains!726 call!6853 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76159 (=> (not res!40102) (not e!49752))))

(declare-fun bm!6845 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2186)

(assert (=> bm!6845 (= call!6862 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(declare-fun b!76160 () Bool)

(declare-fun Unit!2191 () Unit!2186)

(assert (=> b!76160 (= e!49755 Unit!2191)))

(declare-fun lt!34621 () Unit!2186)

(assert (=> b!76160 (= lt!34621 call!6862)))

(assert (=> b!76160 (= lt!34626 call!6841)))

(declare-fun res!40092 () Bool)

(assert (=> b!76160 (= res!40092 ((_ is Found!232) lt!34626))))

(assert (=> b!76160 (=> (not res!40092) (not e!49757))))

(assert (=> b!76160 e!49757))

(declare-fun lt!34611 () Unit!2186)

(assert (=> b!76160 (= lt!34611 lt!34621)))

(assert (=> b!76160 false))

(declare-fun bm!6846 () Bool)

(declare-fun call!6861 () ListLongMap!1411)

(assert (=> bm!6846 (= call!6861 call!6844)))

(declare-fun b!76161 () Bool)

(declare-fun e!49748 () Bool)

(assert (=> b!76161 (= e!49748 ((_ is Undefined!232) lt!34605))))

(declare-fun bm!6847 () Bool)

(declare-fun c!11593 () Bool)

(assert (=> bm!6847 (= c!11593 c!11599)))

(declare-fun e!49737 () ListLongMap!1411)

(assert (=> bm!6847 (= call!6855 (contains!726 e!49737 (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603)))))))

(declare-fun bm!6848 () Bool)

(assert (=> bm!6848 (= call!6846 call!6845)))

(declare-fun b!76162 () Bool)

(assert (=> b!76162 (= e!49748 e!49741)))

(declare-fun res!40100 () Bool)

(assert (=> b!76162 (= res!40100 call!6842)))

(assert (=> b!76162 (=> (not res!40100) (not e!49741))))

(declare-fun b!76163 () Bool)

(assert (=> b!76163 (= e!49747 e!49745)))

(declare-fun c!11597 () Bool)

(assert (=> b!76163 (= c!11597 (_1!1078 lt!34618))))

(declare-fun b!76164 () Bool)

(declare-fun call!6848 () ListLongMap!1411)

(assert (=> b!76164 (= e!49745 (= call!6853 call!6848))))

(declare-fun b!76165 () Bool)

(assert (=> b!76165 (= e!49737 call!6861)))

(declare-fun b!76166 () Bool)

(declare-fun res!40101 () Bool)

(assert (=> b!76166 (= res!40101 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3064 lt!34605)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76166 (=> (not res!40101) (not e!49741))))

(declare-fun bm!6849 () Bool)

(declare-fun c!11595 () Bool)

(declare-fun c!11601 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6849 (= call!6840 (inRange!0 (ite c!11599 (ite c!11592 (index!3062 lt!34626) (ite c!11600 (index!3061 lt!34627) (index!3064 lt!34627))) (ite c!11601 (index!3062 lt!34609) (ite c!11595 (index!3061 lt!34605) (index!3064 lt!34605)))) (mask!6229 newMap!16)))))

(declare-fun b!76167 () Bool)

(declare-fun c!11598 () Bool)

(assert (=> b!76167 (= c!11598 ((_ is MissingVacant!232) lt!34605))))

(assert (=> b!76167 (= e!49739 e!49748)))

(declare-fun bm!6850 () Bool)

(declare-fun call!6852 () tuple2!2134)

(declare-fun c!11602 () Bool)

(declare-fun updateHelperNewKey!26 (LongMapFixedSize!706 (_ BitVec 64) V!2961 (_ BitVec 32)) tuple2!2134)

(assert (=> bm!6850 (= call!6852 (updateHelperNewKey!26 newMap!16 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603))))))

(declare-fun b!76168 () Bool)

(declare-fun res!40093 () Bool)

(assert (=> b!76168 (= res!40093 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3064 lt!34627)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76168 (=> (not res!40093) (not e!49742))))

(declare-fun b!76169 () Bool)

(assert (=> b!76169 (= c!11602 ((_ is MissingVacant!232) lt!34603))))

(assert (=> b!76169 (= e!49746 e!49744)))

(declare-fun b!76170 () Bool)

(assert (=> b!76170 (= e!49750 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34609)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun lt!34620 () (_ BitVec 32))

(declare-fun bm!6851 () Bool)

(assert (=> bm!6851 (= call!6844 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76171 () Bool)

(declare-fun res!40099 () Bool)

(assert (=> b!76171 (= res!40099 call!6850)))

(assert (=> b!76171 (=> (not res!40099) (not e!49757))))

(declare-fun b!76172 () Bool)

(assert (=> b!76172 (= e!49743 e!49742)))

(declare-fun res!40096 () Bool)

(assert (=> b!76172 (= res!40096 call!6856)))

(assert (=> b!76172 (=> (not res!40096) (not e!49742))))

(declare-fun bm!6852 () Bool)

(assert (=> bm!6852 (= call!6847 (+!96 (ite c!11594 (ite c!11591 call!6858 call!6849) call!6861) (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun b!76173 () Bool)

(assert (=> b!76173 (= e!49752 (= call!6853 (+!96 call!6848 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun b!76174 () Bool)

(declare-fun lt!34624 () tuple2!2134)

(assert (=> b!76174 (= e!49744 (tuple2!2135 (_1!1078 lt!34624) (_2!1078 lt!34624)))))

(assert (=> b!76174 (= lt!34624 call!6852)))

(declare-fun bm!6853 () Bool)

(declare-fun call!6859 () Bool)

(assert (=> bm!6853 (= call!6839 call!6859)))

(declare-fun bm!6854 () Bool)

(assert (=> bm!6854 (= call!6848 (map!1168 newMap!16))))

(declare-fun b!76175 () Bool)

(assert (=> b!76175 (= e!49737 call!6843)))

(declare-fun bm!6855 () Bool)

(assert (=> bm!6855 (= call!6851 call!6840)))

(declare-fun b!76176 () Bool)

(declare-fun lt!34614 () Unit!2186)

(declare-fun lt!34607 () Unit!2186)

(assert (=> b!76176 (= lt!34614 lt!34607)))

(assert (=> b!76176 call!6855))

(declare-fun lemmaValidKeyInArrayIsInListMap!86 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) Unit!2186)

(assert (=> b!76176 (= lt!34607 (lemmaValidKeyInArrayIsInListMap!86 (_keys!3904 newMap!16) lt!34623 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76176 (= lt!34623 (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))))))

(declare-fun lt!34615 () Unit!2186)

(declare-fun lt!34610 () Unit!2186)

(assert (=> b!76176 (= lt!34615 lt!34610)))

(assert (=> b!76176 (= call!6847 (getCurrentListMap!418 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2186)

(assert (=> b!76176 (= lt!34610 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34628 () Unit!2186)

(assert (=> b!76176 (= lt!34628 e!49751)))

(assert (=> b!76176 (= c!11601 (contains!726 call!6861 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76176 (= e!49738 (tuple2!2135 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (_size!402 newMap!16) (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (_vacant!402 newMap!16))))))

(declare-fun b!76177 () Bool)

(assert (=> b!76177 (= e!49756 (not call!6839))))

(declare-fun b!76178 () Bool)

(declare-fun c!11603 () Bool)

(assert (=> b!76178 (= c!11603 ((_ is MissingVacant!232) lt!34627))))

(assert (=> b!76178 (= e!49754 e!49743)))

(declare-fun b!76179 () Bool)

(declare-fun res!40091 () Bool)

(assert (=> b!76179 (=> (not res!40091) (not e!49749))))

(assert (=> b!76179 (= res!40091 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3061 lt!34627)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6856 () Bool)

(assert (=> bm!6856 (= call!6859 (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76180 () Bool)

(declare-fun Unit!2192 () Unit!2186)

(assert (=> b!76180 (= e!49751 Unit!2192)))

(declare-fun lt!34619 () Unit!2186)

(assert (=> b!76180 (= lt!34619 call!6857)))

(assert (=> b!76180 (= lt!34605 call!6846)))

(assert (=> b!76180 (= c!11595 ((_ is MissingZero!232) lt!34605))))

(assert (=> b!76180 e!49739))

(declare-fun lt!34606 () Unit!2186)

(assert (=> b!76180 (= lt!34606 lt!34619)))

(assert (=> b!76180 false))

(declare-fun b!76181 () Bool)

(declare-fun lt!34622 () Unit!2186)

(declare-fun lt!34612 () Unit!2186)

(assert (=> b!76181 (= lt!34622 lt!34612)))

(assert (=> b!76181 (= call!6854 call!6858)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2186)

(assert (=> b!76181 (= lt!34612 (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34620 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34462 (defaultEntry!2246 newMap!16)))))

(assert (=> b!76181 (= lt!34620 (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!76181 (= e!49740 (tuple2!2135 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6229 newMap!16) (bvor (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) (zeroValue!2145 newMap!16) lt!34462 (_size!402 newMap!16) (_keys!3904 newMap!16) (_values!2229 newMap!16) (_vacant!402 newMap!16))))))

(declare-fun bm!6857 () Bool)

(assert (=> bm!6857 (= call!6860 call!6859)))

(declare-fun bm!6858 () Bool)

(assert (=> bm!6858 (= call!6856 call!6850)))

(declare-fun bm!6859 () Bool)

(assert (=> bm!6859 (= call!6842 call!6851)))

(declare-fun b!76182 () Bool)

(assert (=> b!76182 (= e!49749 (not call!6860))))

(declare-fun b!76183 () Bool)

(declare-fun lt!34602 () tuple2!2134)

(assert (=> b!76183 (= lt!34602 call!6852)))

(assert (=> b!76183 (= e!49738 (tuple2!2135 (_1!1078 lt!34602) (_2!1078 lt!34602)))))

(assert (= (and d!18127 c!11594) b!76151))

(assert (= (and d!18127 (not c!11594)) b!76149))

(assert (= (and b!76151 c!11591) b!76148))

(assert (= (and b!76151 (not c!11591)) b!76181))

(assert (= (or b!76148 b!76181) bm!6838))

(assert (= (or b!76148 b!76181) bm!6837))

(assert (= (or b!76148 b!76181) bm!6844))

(assert (= (and b!76149 c!11599) b!76150))

(assert (= (and b!76149 (not c!11599)) b!76169))

(assert (= (and b!76150 c!11592) b!76160))

(assert (= (and b!76150 (not c!11592)) b!76144))

(assert (= (and b!76160 res!40092) b!76171))

(assert (= (and b!76171 res!40099) b!76156))

(assert (= (and b!76144 c!11600) b!76155))

(assert (= (and b!76144 (not c!11600)) b!76178))

(assert (= (and b!76155 res!40094) b!76179))

(assert (= (and b!76179 res!40091) b!76182))

(assert (= (and b!76178 c!11603) b!76172))

(assert (= (and b!76178 (not c!11603)) b!76153))

(assert (= (and b!76172 res!40096) b!76168))

(assert (= (and b!76168 res!40093) b!76152))

(assert (= (or b!76155 b!76172) bm!6858))

(assert (= (or b!76182 b!76152) bm!6857))

(assert (= (or b!76171 bm!6858) bm!6841))

(assert (= (or b!76160 b!76144) bm!6843))

(assert (= (and b!76169 c!11602) b!76174))

(assert (= (and b!76169 (not c!11602)) b!76146))

(assert (= (and b!76146 c!11596) b!76183))

(assert (= (and b!76146 (not c!11596)) b!76176))

(assert (= (and b!76176 c!11601) b!76158))

(assert (= (and b!76176 (not c!11601)) b!76180))

(assert (= (and b!76158 res!40097) b!76145))

(assert (= (and b!76145 res!40098) b!76170))

(assert (= (and b!76180 c!11595) b!76157))

(assert (= (and b!76180 (not c!11595)) b!76167))

(assert (= (and b!76157 res!40103) b!76147))

(assert (= (and b!76147 res!40090) b!76177))

(assert (= (and b!76167 c!11598) b!76162))

(assert (= (and b!76167 (not c!11598)) b!76161))

(assert (= (and b!76162 res!40100) b!76166))

(assert (= (and b!76166 res!40101) b!76154))

(assert (= (or b!76157 b!76162) bm!6859))

(assert (= (or b!76177 b!76154) bm!6853))

(assert (= (or b!76145 bm!6859) bm!6855))

(assert (= (or b!76158 b!76180) bm!6848))

(assert (= (or b!76174 b!76183) bm!6850))

(assert (= (or b!76150 b!76176) bm!6846))

(assert (= (or bm!6857 bm!6853) bm!6856))

(assert (= (or b!76144 b!76180) bm!6836))

(assert (= (or bm!6841 bm!6855) bm!6849))

(assert (= (or bm!6843 bm!6848) bm!6840))

(assert (= (or b!76160 b!76158) bm!6845))

(assert (= (or b!76150 b!76176) bm!6847))

(assert (= (and bm!6847 c!11593) b!76165))

(assert (= (and bm!6847 (not c!11593)) b!76175))

(assert (= (or bm!6838 b!76175) bm!6839))

(assert (= (or bm!6837 bm!6846) bm!6851))

(assert (= (or bm!6844 b!76176) bm!6852))

(assert (= (and d!18127 res!40095) b!76163))

(assert (= (and b!76163 c!11597) b!76159))

(assert (= (and b!76163 (not c!11597)) b!76164))

(assert (= (and b!76159 res!40102) b!76173))

(assert (= (or b!76173 b!76164) bm!6854))

(assert (= (or b!76159 b!76173 b!76164) bm!6842))

(declare-fun m!75929 () Bool)

(assert (=> b!76179 m!75929))

(declare-fun m!75931 () Bool)

(assert (=> bm!6839 m!75931))

(declare-fun m!75933 () Bool)

(assert (=> bm!6849 m!75933))

(declare-fun m!75935 () Bool)

(assert (=> b!76166 m!75935))

(declare-fun m!75937 () Bool)

(assert (=> b!76168 m!75937))

(assert (=> bm!6845 m!75749))

(declare-fun m!75939 () Bool)

(assert (=> bm!6845 m!75939))

(assert (=> b!76176 m!75749))

(declare-fun m!75941 () Bool)

(assert (=> b!76176 m!75941))

(declare-fun m!75943 () Bool)

(assert (=> b!76176 m!75943))

(declare-fun m!75945 () Bool)

(assert (=> b!76176 m!75945))

(declare-fun m!75947 () Bool)

(assert (=> b!76176 m!75947))

(assert (=> b!76176 m!75749))

(declare-fun m!75949 () Bool)

(assert (=> b!76176 m!75949))

(assert (=> bm!6854 m!75797))

(assert (=> b!76159 m!75749))

(declare-fun m!75951 () Bool)

(assert (=> b!76159 m!75951))

(declare-fun m!75953 () Bool)

(assert (=> bm!6851 m!75953))

(declare-fun m!75955 () Bool)

(assert (=> bm!6847 m!75955))

(declare-fun m!75957 () Bool)

(assert (=> bm!6847 m!75957))

(assert (=> b!76149 m!75749))

(declare-fun m!75959 () Bool)

(assert (=> b!76149 m!75959))

(declare-fun m!75961 () Bool)

(assert (=> b!76181 m!75961))

(declare-fun m!75963 () Bool)

(assert (=> b!76173 m!75963))

(assert (=> bm!6840 m!75749))

(assert (=> bm!6840 m!75959))

(assert (=> bm!6850 m!75749))

(declare-fun m!75965 () Bool)

(assert (=> bm!6850 m!75965))

(declare-fun m!75967 () Bool)

(assert (=> b!76148 m!75967))

(declare-fun m!75969 () Bool)

(assert (=> bm!6842 m!75969))

(assert (=> bm!6856 m!75749))

(declare-fun m!75971 () Bool)

(assert (=> bm!6856 m!75971))

(declare-fun m!75973 () Bool)

(assert (=> d!18127 m!75973))

(assert (=> d!18127 m!75761))

(assert (=> bm!6836 m!75749))

(declare-fun m!75975 () Bool)

(assert (=> bm!6836 m!75975))

(declare-fun m!75977 () Bool)

(assert (=> b!76170 m!75977))

(declare-fun m!75979 () Bool)

(assert (=> b!76147 m!75979))

(declare-fun m!75981 () Bool)

(assert (=> b!76156 m!75981))

(declare-fun m!75983 () Bool)

(assert (=> bm!6852 m!75983))

(assert (=> b!75905 d!18127))

(declare-fun d!18129 () Bool)

(assert (=> d!18129 (= (array_inv!1145 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvsge (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75896 d!18129))

(declare-fun d!18131 () Bool)

(assert (=> d!18131 (= (array_inv!1146 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvsge (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!75896 d!18131))

(declare-fun d!18133 () Bool)

(assert (=> d!18133 (= (map!1168 newMap!16) (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun bs!3270 () Bool)

(assert (= bs!3270 d!18133))

(declare-fun m!75985 () Bool)

(assert (=> bs!3270 m!75985))

(assert (=> b!75909 d!18133))

(declare-fun b!76226 () Bool)

(declare-fun e!49784 () ListLongMap!1411)

(declare-fun call!6880 () ListLongMap!1411)

(assert (=> b!76226 (= e!49784 call!6880)))

(declare-fun b!76227 () Bool)

(declare-fun e!49787 () Bool)

(declare-fun lt!34692 () ListLongMap!1411)

(declare-fun apply!77 (ListLongMap!1411 (_ BitVec 64)) V!2961)

(assert (=> b!76227 (= e!49787 (= (apply!77 lt!34692 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun bm!6874 () Bool)

(declare-fun call!6881 () ListLongMap!1411)

(declare-fun call!6879 () ListLongMap!1411)

(assert (=> bm!6874 (= call!6881 call!6879)))

(declare-fun d!18135 () Bool)

(declare-fun e!49786 () Bool)

(assert (=> d!18135 e!49786))

(declare-fun res!40128 () Bool)

(assert (=> d!18135 (=> (not res!40128) (not e!49786))))

(assert (=> d!18135 (= res!40128 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun lt!34674 () ListLongMap!1411)

(assert (=> d!18135 (= lt!34692 lt!34674)))

(declare-fun lt!34688 () Unit!2186)

(declare-fun e!49794 () Unit!2186)

(assert (=> d!18135 (= lt!34688 e!49794)))

(declare-fun c!11618 () Bool)

(declare-fun e!49789 () Bool)

(assert (=> d!18135 (= c!11618 e!49789)))

(declare-fun res!40127 () Bool)

(assert (=> d!18135 (=> (not res!40127) (not e!49789))))

(assert (=> d!18135 (= res!40127 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun e!49795 () ListLongMap!1411)

(assert (=> d!18135 (= lt!34674 e!49795)))

(declare-fun c!11619 () Bool)

(assert (=> d!18135 (= c!11619 (and (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18135 (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18135 (= (getCurrentListMap!418 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) lt!34692)))

(declare-fun b!76228 () Bool)

(declare-fun res!40130 () Bool)

(assert (=> b!76228 (=> (not res!40130) (not e!49786))))

(declare-fun e!49788 () Bool)

(assert (=> b!76228 (= res!40130 e!49788)))

(declare-fun res!40124 () Bool)

(assert (=> b!76228 (=> res!40124 e!49788)))

(declare-fun e!49796 () Bool)

(assert (=> b!76228 (= res!40124 (not e!49796))))

(declare-fun res!40126 () Bool)

(assert (=> b!76228 (=> (not res!40126) (not e!49796))))

(assert (=> b!76228 (= res!40126 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76229 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!76229 (= e!49789 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76230 () Bool)

(declare-fun e!49785 () Bool)

(assert (=> b!76230 (= e!49785 (= (apply!77 lt!34692 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76231 () Bool)

(declare-fun res!40123 () Bool)

(assert (=> b!76231 (=> (not res!40123) (not e!49786))))

(declare-fun e!49793 () Bool)

(assert (=> b!76231 (= res!40123 e!49793)))

(declare-fun c!11621 () Bool)

(assert (=> b!76231 (= c!11621 (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6875 () Bool)

(assert (=> bm!6875 (= call!6880 call!6881)))

(declare-fun b!76232 () Bool)

(declare-fun Unit!2193 () Unit!2186)

(assert (=> b!76232 (= e!49794 Unit!2193)))

(declare-fun b!76233 () Bool)

(declare-fun e!49790 () ListLongMap!1411)

(declare-fun call!6883 () ListLongMap!1411)

(assert (=> b!76233 (= e!49790 call!6883)))

(declare-fun b!76234 () Bool)

(declare-fun c!11617 () Bool)

(assert (=> b!76234 (= c!11617 (and (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76234 (= e!49790 e!49784)))

(declare-fun bm!6876 () Bool)

(declare-fun c!11620 () Bool)

(declare-fun call!6878 () ListLongMap!1411)

(assert (=> bm!6876 (= call!6878 (+!96 (ite c!11619 call!6879 (ite c!11620 call!6881 call!6880)) (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun b!76235 () Bool)

(assert (=> b!76235 (= e!49796 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6877 () Bool)

(assert (=> bm!6877 (= call!6879 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76236 () Bool)

(assert (=> b!76236 (= e!49793 e!49787)))

(declare-fun res!40125 () Bool)

(declare-fun call!6877 () Bool)

(assert (=> b!76236 (= res!40125 call!6877)))

(assert (=> b!76236 (=> (not res!40125) (not e!49787))))

(declare-fun bm!6878 () Bool)

(assert (=> bm!6878 (= call!6883 call!6878)))

(declare-fun b!76237 () Bool)

(assert (=> b!76237 (= e!49793 (not call!6877))))

(declare-fun b!76238 () Bool)

(declare-fun e!49792 () Bool)

(assert (=> b!76238 (= e!49788 e!49792)))

(declare-fun res!40122 () Bool)

(assert (=> b!76238 (=> (not res!40122) (not e!49792))))

(assert (=> b!76238 (= res!40122 (contains!726 lt!34692 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76238 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76239 () Bool)

(declare-fun lt!34683 () Unit!2186)

(assert (=> b!76239 (= e!49794 lt!34683)))

(declare-fun lt!34682 () ListLongMap!1411)

(assert (=> b!76239 (= lt!34682 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun lt!34685 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34680 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34680 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34676 () Unit!2186)

(declare-fun addStillContains!53 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> b!76239 (= lt!34676 (addStillContains!53 lt!34682 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34680))))

(assert (=> b!76239 (contains!726 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34680)))

(declare-fun lt!34693 () Unit!2186)

(assert (=> b!76239 (= lt!34693 lt!34676)))

(declare-fun lt!34677 () ListLongMap!1411)

(assert (=> b!76239 (= lt!34677 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun lt!34673 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34694 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34694 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34690 () Unit!2186)

(declare-fun addApplyDifferent!53 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> b!76239 (= lt!34690 (addApplyDifferent!53 lt!34677 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34694))))

(assert (=> b!76239 (= (apply!77 (+!96 lt!34677 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34694) (apply!77 lt!34677 lt!34694))))

(declare-fun lt!34681 () Unit!2186)

(assert (=> b!76239 (= lt!34681 lt!34690)))

(declare-fun lt!34678 () ListLongMap!1411)

(assert (=> b!76239 (= lt!34678 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun lt!34684 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34691 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34691 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34686 () Unit!2186)

(assert (=> b!76239 (= lt!34686 (addApplyDifferent!53 lt!34678 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34691))))

(assert (=> b!76239 (= (apply!77 (+!96 lt!34678 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34691) (apply!77 lt!34678 lt!34691))))

(declare-fun lt!34687 () Unit!2186)

(assert (=> b!76239 (= lt!34687 lt!34686)))

(declare-fun lt!34675 () ListLongMap!1411)

(assert (=> b!76239 (= lt!34675 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun lt!34679 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34679 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34689 () (_ BitVec 64))

(assert (=> b!76239 (= lt!34689 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!76239 (= lt!34683 (addApplyDifferent!53 lt!34675 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34689))))

(assert (=> b!76239 (= (apply!77 (+!96 lt!34675 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34689) (apply!77 lt!34675 lt!34689))))

(declare-fun b!76240 () Bool)

(assert (=> b!76240 (= e!49784 call!6883)))

(declare-fun bm!6879 () Bool)

(declare-fun call!6882 () Bool)

(assert (=> bm!6879 (= call!6882 (contains!726 lt!34692 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76241 () Bool)

(assert (=> b!76241 (= e!49795 e!49790)))

(assert (=> b!76241 (= c!11620 (and (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6880 () Bool)

(assert (=> bm!6880 (= call!6877 (contains!726 lt!34692 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76242 () Bool)

(assert (=> b!76242 (= e!49792 (= (apply!77 lt!34692 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76242 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> b!76242 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76243 () Bool)

(declare-fun e!49791 () Bool)

(assert (=> b!76243 (= e!49786 e!49791)))

(declare-fun c!11616 () Bool)

(assert (=> b!76243 (= c!11616 (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76244 () Bool)

(assert (=> b!76244 (= e!49791 (not call!6882))))

(declare-fun b!76245 () Bool)

(assert (=> b!76245 (= e!49791 e!49785)))

(declare-fun res!40129 () Bool)

(assert (=> b!76245 (= res!40129 call!6882)))

(assert (=> b!76245 (=> (not res!40129) (not e!49785))))

(declare-fun b!76246 () Bool)

(assert (=> b!76246 (= e!49795 (+!96 call!6878 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18135 c!11619) b!76246))

(assert (= (and d!18135 (not c!11619)) b!76241))

(assert (= (and b!76241 c!11620) b!76233))

(assert (= (and b!76241 (not c!11620)) b!76234))

(assert (= (and b!76234 c!11617) b!76240))

(assert (= (and b!76234 (not c!11617)) b!76226))

(assert (= (or b!76240 b!76226) bm!6875))

(assert (= (or b!76233 bm!6875) bm!6874))

(assert (= (or b!76233 b!76240) bm!6878))

(assert (= (or b!76246 bm!6874) bm!6877))

(assert (= (or b!76246 bm!6878) bm!6876))

(assert (= (and d!18135 res!40127) b!76229))

(assert (= (and d!18135 c!11618) b!76239))

(assert (= (and d!18135 (not c!11618)) b!76232))

(assert (= (and d!18135 res!40128) b!76228))

(assert (= (and b!76228 res!40126) b!76235))

(assert (= (and b!76228 (not res!40124)) b!76238))

(assert (= (and b!76238 res!40122) b!76242))

(assert (= (and b!76228 res!40130) b!76231))

(assert (= (and b!76231 c!11621) b!76236))

(assert (= (and b!76231 (not c!11621)) b!76237))

(assert (= (and b!76236 res!40125) b!76227))

(assert (= (or b!76236 b!76237) bm!6880))

(assert (= (and b!76231 res!40123) b!76243))

(assert (= (and b!76243 c!11616) b!76245))

(assert (= (and b!76243 (not c!11616)) b!76244))

(assert (= (and b!76245 res!40129) b!76230))

(assert (= (or b!76245 b!76244) bm!6879))

(declare-fun b_lambda!3425 () Bool)

(assert (=> (not b_lambda!3425) (not b!76242)))

(assert (=> b!76242 t!5064))

(declare-fun b_and!4665 () Bool)

(assert (= b_and!4645 (and (=> t!5064 result!2721) b_and!4665)))

(assert (=> b!76242 t!5066))

(declare-fun b_and!4667 () Bool)

(assert (= b_and!4647 (and (=> t!5066 result!2725) b_and!4667)))

(declare-fun m!75987 () Bool)

(assert (=> b!76242 m!75987))

(declare-fun m!75989 () Bool)

(assert (=> b!76242 m!75989))

(declare-fun m!75991 () Bool)

(assert (=> b!76242 m!75991))

(assert (=> b!76242 m!75769))

(assert (=> b!76242 m!75987))

(assert (=> b!76242 m!75769))

(declare-fun m!75993 () Bool)

(assert (=> b!76242 m!75993))

(assert (=> b!76242 m!75989))

(declare-fun m!75995 () Bool)

(assert (=> bm!6879 m!75995))

(assert (=> bm!6877 m!75751))

(declare-fun m!75997 () Bool)

(assert (=> b!76239 m!75997))

(assert (=> b!76239 m!75989))

(declare-fun m!75999 () Bool)

(assert (=> b!76239 m!75999))

(declare-fun m!76001 () Bool)

(assert (=> b!76239 m!76001))

(declare-fun m!76003 () Bool)

(assert (=> b!76239 m!76003))

(declare-fun m!76005 () Bool)

(assert (=> b!76239 m!76005))

(declare-fun m!76007 () Bool)

(assert (=> b!76239 m!76007))

(assert (=> b!76239 m!75751))

(assert (=> b!76239 m!76005))

(declare-fun m!76009 () Bool)

(assert (=> b!76239 m!76009))

(assert (=> b!76239 m!75999))

(declare-fun m!76011 () Bool)

(assert (=> b!76239 m!76011))

(declare-fun m!76013 () Bool)

(assert (=> b!76239 m!76013))

(declare-fun m!76015 () Bool)

(assert (=> b!76239 m!76015))

(declare-fun m!76017 () Bool)

(assert (=> b!76239 m!76017))

(declare-fun m!76019 () Bool)

(assert (=> b!76239 m!76019))

(assert (=> b!76239 m!76019))

(declare-fun m!76021 () Bool)

(assert (=> b!76239 m!76021))

(declare-fun m!76023 () Bool)

(assert (=> b!76239 m!76023))

(declare-fun m!76025 () Bool)

(assert (=> b!76239 m!76025))

(assert (=> b!76239 m!76023))

(declare-fun m!76027 () Bool)

(assert (=> b!76230 m!76027))

(declare-fun m!76029 () Bool)

(assert (=> b!76246 m!76029))

(assert (=> d!18135 m!75755))

(assert (=> b!76229 m!75989))

(assert (=> b!76229 m!75989))

(declare-fun m!76031 () Bool)

(assert (=> b!76229 m!76031))

(declare-fun m!76033 () Bool)

(assert (=> bm!6880 m!76033))

(assert (=> b!76235 m!75989))

(assert (=> b!76235 m!75989))

(assert (=> b!76235 m!76031))

(declare-fun m!76035 () Bool)

(assert (=> bm!6876 m!76035))

(assert (=> b!76238 m!75989))

(assert (=> b!76238 m!75989))

(declare-fun m!76037 () Bool)

(assert (=> b!76238 m!76037))

(declare-fun m!76039 () Bool)

(assert (=> b!76227 m!76039))

(assert (=> b!75909 d!18135))

(declare-fun b!76255 () Bool)

(declare-fun e!49804 () Bool)

(declare-fun e!49805 () Bool)

(assert (=> b!76255 (= e!49804 e!49805)))

(declare-fun c!11624 () Bool)

(assert (=> b!76255 (= c!11624 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76256 () Bool)

(declare-fun call!6886 () Bool)

(assert (=> b!76256 (= e!49805 call!6886)))

(declare-fun d!18137 () Bool)

(declare-fun res!40135 () Bool)

(assert (=> d!18137 (=> res!40135 e!49804)))

(assert (=> d!18137 (= res!40135 (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18137 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))) e!49804)))

(declare-fun b!76257 () Bool)

(declare-fun e!49803 () Bool)

(assert (=> b!76257 (= e!49805 e!49803)))

(declare-fun lt!34703 () (_ BitVec 64))

(assert (=> b!76257 (= lt!34703 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!34702 () Unit!2186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3905 (_ BitVec 64) (_ BitVec 32)) Unit!2186)

(assert (=> b!76257 (= lt!34702 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000))))

(assert (=> b!76257 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000)))

(declare-fun lt!34701 () Unit!2186)

(assert (=> b!76257 (= lt!34701 lt!34702)))

(declare-fun res!40136 () Bool)

(assert (=> b!76257 (= res!40136 (= (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))) (Found!232 #b00000000000000000000000000000000)))))

(assert (=> b!76257 (=> (not res!40136) (not e!49803))))

(declare-fun bm!6883 () Bool)

(assert (=> bm!6883 (= call!6886 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76258 () Bool)

(assert (=> b!76258 (= e!49803 call!6886)))

(assert (= (and d!18137 (not res!40135)) b!76255))

(assert (= (and b!76255 c!11624) b!76257))

(assert (= (and b!76255 (not c!11624)) b!76256))

(assert (= (and b!76257 res!40136) b!76258))

(assert (= (or b!76258 b!76256) bm!6883))

(declare-fun m!76041 () Bool)

(assert (=> b!76255 m!76041))

(assert (=> b!76255 m!76041))

(declare-fun m!76043 () Bool)

(assert (=> b!76255 m!76043))

(assert (=> b!76257 m!76041))

(declare-fun m!76045 () Bool)

(assert (=> b!76257 m!76045))

(declare-fun m!76047 () Bool)

(assert (=> b!76257 m!76047))

(assert (=> b!76257 m!76041))

(declare-fun m!76049 () Bool)

(assert (=> b!76257 m!76049))

(declare-fun m!76051 () Bool)

(assert (=> bm!6883 m!76051))

(assert (=> b!75895 d!18137))

(declare-fun d!18139 () Bool)

(assert (=> d!18139 (= (array_inv!1145 (_keys!3904 newMap!16)) (bvsge (size!2102 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75913 d!18139))

(declare-fun d!18141 () Bool)

(assert (=> d!18141 (= (array_inv!1146 (_values!2229 newMap!16)) (bvsge (size!2103 (_values!2229 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75913 d!18141))

(declare-fun d!18143 () Bool)

(assert (=> d!18143 (= (valid!311 thiss!992) (valid!312 (v!2561 (underlying!268 thiss!992))))))

(declare-fun bs!3271 () Bool)

(assert (= bs!3271 d!18143))

(declare-fun m!76053 () Bool)

(assert (=> bs!3271 m!76053))

(assert (=> start!10026 d!18143))

(declare-fun d!18145 () Bool)

(declare-fun c!11627 () Bool)

(assert (=> d!18145 (= c!11627 ((_ is ValueCellFull!899) (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun e!49808 () V!2961)

(assert (=> d!18145 (= (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49808)))

(declare-fun b!76263 () Bool)

(declare-fun get!1164 (ValueCell!899 V!2961) V!2961)

(assert (=> b!76263 (= e!49808 (get!1164 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76264 () Bool)

(declare-fun get!1165 (ValueCell!899 V!2961) V!2961)

(assert (=> b!76264 (= e!49808 (get!1165 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18145 c!11627) b!76263))

(assert (= (and d!18145 (not c!11627)) b!76264))

(assert (=> b!76263 m!75767))

(assert (=> b!76263 m!75769))

(declare-fun m!76055 () Bool)

(assert (=> b!76263 m!76055))

(assert (=> b!76264 m!75767))

(assert (=> b!76264 m!75769))

(declare-fun m!76057 () Bool)

(assert (=> b!76264 m!76057))

(assert (=> b!75911 d!18145))

(declare-fun b!76275 () Bool)

(declare-fun e!49818 () Bool)

(declare-fun contains!727 (List!1481 (_ BitVec 64)) Bool)

(assert (=> b!76275 (= e!49818 (contains!727 Nil!1478 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76276 () Bool)

(declare-fun e!49817 () Bool)

(declare-fun call!6889 () Bool)

(assert (=> b!76276 (= e!49817 call!6889)))

(declare-fun d!18147 () Bool)

(declare-fun res!40143 () Bool)

(declare-fun e!49820 () Bool)

(assert (=> d!18147 (=> res!40143 e!49820)))

(assert (=> d!18147 (= res!40143 (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18147 (= (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 Nil!1478) e!49820)))

(declare-fun b!76277 () Bool)

(declare-fun e!49819 () Bool)

(assert (=> b!76277 (= e!49819 e!49817)))

(declare-fun c!11630 () Bool)

(assert (=> b!76277 (= c!11630 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76278 () Bool)

(assert (=> b!76278 (= e!49817 call!6889)))

(declare-fun b!76279 () Bool)

(assert (=> b!76279 (= e!49820 e!49819)))

(declare-fun res!40144 () Bool)

(assert (=> b!76279 (=> (not res!40144) (not e!49819))))

(assert (=> b!76279 (= res!40144 (not e!49818))))

(declare-fun res!40145 () Bool)

(assert (=> b!76279 (=> (not res!40145) (not e!49818))))

(assert (=> b!76279 (= res!40145 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!6886 () Bool)

(assert (=> bm!6886 (= call!6889 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11630 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) Nil!1478) Nil!1478)))))

(assert (= (and d!18147 (not res!40143)) b!76279))

(assert (= (and b!76279 res!40145) b!76275))

(assert (= (and b!76279 res!40144) b!76277))

(assert (= (and b!76277 c!11630) b!76278))

(assert (= (and b!76277 (not c!11630)) b!76276))

(assert (= (or b!76278 b!76276) bm!6886))

(assert (=> b!76275 m!76041))

(assert (=> b!76275 m!76041))

(declare-fun m!76059 () Bool)

(assert (=> b!76275 m!76059))

(assert (=> b!76277 m!76041))

(assert (=> b!76277 m!76041))

(assert (=> b!76277 m!76043))

(assert (=> b!76279 m!76041))

(assert (=> b!76279 m!76041))

(assert (=> b!76279 m!76043))

(assert (=> bm!6886 m!76041))

(declare-fun m!76061 () Bool)

(assert (=> bm!6886 m!76061))

(assert (=> b!75898 d!18147))

(declare-fun d!18149 () Bool)

(declare-fun e!49823 () Bool)

(assert (=> d!18149 e!49823))

(declare-fun res!40151 () Bool)

(assert (=> d!18149 (=> (not res!40151) (not e!49823))))

(declare-fun lt!34712 () ListLongMap!1411)

(assert (=> d!18149 (= res!40151 (contains!726 lt!34712 (_1!1079 lt!34463)))))

(declare-fun lt!34715 () List!1482)

(assert (=> d!18149 (= lt!34712 (ListLongMap!1412 lt!34715))))

(declare-fun lt!34714 () Unit!2186)

(declare-fun lt!34713 () Unit!2186)

(assert (=> d!18149 (= lt!34714 lt!34713)))

(assert (=> d!18149 (= (getValueByKey!136 lt!34715 (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463)))))

(declare-fun lemmaContainsTupThenGetReturnValue!53 (List!1482 (_ BitVec 64) V!2961) Unit!2186)

(assert (=> d!18149 (= lt!34713 (lemmaContainsTupThenGetReturnValue!53 lt!34715 (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(declare-fun insertStrictlySorted!56 (List!1482 (_ BitVec 64) V!2961) List!1482)

(assert (=> d!18149 (= lt!34715 (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(assert (=> d!18149 (= (+!96 lt!34452 lt!34463) lt!34712)))

(declare-fun b!76284 () Bool)

(declare-fun res!40150 () Bool)

(assert (=> b!76284 (=> (not res!40150) (not e!49823))))

(assert (=> b!76284 (= res!40150 (= (getValueByKey!136 (toList!721 lt!34712) (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463))))))

(declare-fun b!76285 () Bool)

(declare-fun contains!728 (List!1482 tuple2!2136) Bool)

(assert (=> b!76285 (= e!49823 (contains!728 (toList!721 lt!34712) lt!34463))))

(assert (= (and d!18149 res!40151) b!76284))

(assert (= (and b!76284 res!40150) b!76285))

(declare-fun m!76063 () Bool)

(assert (=> d!18149 m!76063))

(declare-fun m!76065 () Bool)

(assert (=> d!18149 m!76065))

(declare-fun m!76067 () Bool)

(assert (=> d!18149 m!76067))

(declare-fun m!76069 () Bool)

(assert (=> d!18149 m!76069))

(declare-fun m!76071 () Bool)

(assert (=> b!76284 m!76071))

(declare-fun m!76073 () Bool)

(assert (=> b!76285 m!76073))

(assert (=> b!75912 d!18149))

(declare-fun b!76310 () Bool)

(declare-fun res!40160 () Bool)

(declare-fun e!49839 () Bool)

(assert (=> b!76310 (=> (not res!40160) (not e!49839))))

(declare-fun lt!34732 () ListLongMap!1411)

(assert (=> b!76310 (= res!40160 (not (contains!726 lt!34732 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!6889 () Bool)

(declare-fun call!6892 () ListLongMap!1411)

(assert (=> bm!6889 (= call!6892 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun d!18151 () Bool)

(assert (=> d!18151 e!49839))

(declare-fun res!40163 () Bool)

(assert (=> d!18151 (=> (not res!40163) (not e!49839))))

(assert (=> d!18151 (= res!40163 (not (contains!726 lt!34732 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!49844 () ListLongMap!1411)

(assert (=> d!18151 (= lt!34732 e!49844)))

(declare-fun c!11640 () Bool)

(assert (=> d!18151 (= c!11640 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18151 (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18151 (= (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) lt!34732)))

(declare-fun b!76311 () Bool)

(declare-fun e!49840 () Bool)

(assert (=> b!76311 (= e!49839 e!49840)))

(declare-fun c!11639 () Bool)

(declare-fun e!49842 () Bool)

(assert (=> b!76311 (= c!11639 e!49842)))

(declare-fun res!40161 () Bool)

(assert (=> b!76311 (=> (not res!40161) (not e!49842))))

(assert (=> b!76311 (= res!40161 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76312 () Bool)

(assert (=> b!76312 (= e!49842 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76312 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!76313 () Bool)

(declare-fun e!49838 () Bool)

(assert (=> b!76313 (= e!49840 e!49838)))

(declare-fun c!11641 () Bool)

(assert (=> b!76313 (= c!11641 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76314 () Bool)

(assert (=> b!76314 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> b!76314 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun e!49843 () Bool)

(assert (=> b!76314 (= e!49843 (= (apply!77 lt!34732 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76315 () Bool)

(declare-fun e!49841 () ListLongMap!1411)

(assert (=> b!76315 (= e!49841 call!6892)))

(declare-fun b!76316 () Bool)

(assert (=> b!76316 (= e!49838 (= lt!34732 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76317 () Bool)

(assert (=> b!76317 (= e!49844 e!49841)))

(declare-fun c!11642 () Bool)

(assert (=> b!76317 (= c!11642 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76318 () Bool)

(declare-fun lt!34733 () Unit!2186)

(declare-fun lt!34731 () Unit!2186)

(assert (=> b!76318 (= lt!34733 lt!34731)))

(declare-fun lt!34735 () (_ BitVec 64))

(declare-fun lt!34730 () V!2961)

(declare-fun lt!34734 () (_ BitVec 64))

(declare-fun lt!34736 () ListLongMap!1411)

(assert (=> b!76318 (not (contains!726 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730)) lt!34734))))

(declare-fun addStillNotContains!28 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> b!76318 (= lt!34731 (addStillNotContains!28 lt!34736 lt!34735 lt!34730 lt!34734))))

(assert (=> b!76318 (= lt!34734 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76318 (= lt!34730 (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76318 (= lt!34735 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!76318 (= lt!34736 call!6892)))

(assert (=> b!76318 (= e!49841 (+!96 call!6892 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!76319 () Bool)

(assert (=> b!76319 (= e!49840 e!49843)))

(assert (=> b!76319 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun res!40162 () Bool)

(assert (=> b!76319 (= res!40162 (contains!726 lt!34732 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76319 (=> (not res!40162) (not e!49843))))

(declare-fun b!76320 () Bool)

(assert (=> b!76320 (= e!49844 (ListLongMap!1412 Nil!1479))))

(declare-fun b!76321 () Bool)

(declare-fun isEmpty!328 (ListLongMap!1411) Bool)

(assert (=> b!76321 (= e!49838 (isEmpty!328 lt!34732))))

(assert (= (and d!18151 c!11640) b!76320))

(assert (= (and d!18151 (not c!11640)) b!76317))

(assert (= (and b!76317 c!11642) b!76318))

(assert (= (and b!76317 (not c!11642)) b!76315))

(assert (= (or b!76318 b!76315) bm!6889))

(assert (= (and d!18151 res!40163) b!76310))

(assert (= (and b!76310 res!40160) b!76311))

(assert (= (and b!76311 res!40161) b!76312))

(assert (= (and b!76311 c!11639) b!76319))

(assert (= (and b!76311 (not c!11639)) b!76313))

(assert (= (and b!76319 res!40162) b!76314))

(assert (= (and b!76313 c!11641) b!76316))

(assert (= (and b!76313 (not c!11641)) b!76321))

(declare-fun b_lambda!3427 () Bool)

(assert (=> (not b_lambda!3427) (not b!76314)))

(assert (=> b!76314 t!5064))

(declare-fun b_and!4669 () Bool)

(assert (= b_and!4665 (and (=> t!5064 result!2721) b_and!4669)))

(assert (=> b!76314 t!5066))

(declare-fun b_and!4671 () Bool)

(assert (= b_and!4667 (and (=> t!5066 result!2725) b_and!4671)))

(declare-fun b_lambda!3429 () Bool)

(assert (=> (not b_lambda!3429) (not b!76318)))

(assert (=> b!76318 t!5064))

(declare-fun b_and!4673 () Bool)

(assert (= b_and!4669 (and (=> t!5064 result!2721) b_and!4673)))

(assert (=> b!76318 t!5066))

(declare-fun b_and!4675 () Bool)

(assert (= b_and!4671 (and (=> t!5066 result!2725) b_and!4675)))

(declare-fun m!76075 () Bool)

(assert (=> b!76321 m!76075))

(declare-fun m!76077 () Bool)

(assert (=> d!18151 m!76077))

(assert (=> d!18151 m!75755))

(assert (=> b!76319 m!75989))

(assert (=> b!76319 m!75989))

(declare-fun m!76079 () Bool)

(assert (=> b!76319 m!76079))

(declare-fun m!76081 () Bool)

(assert (=> b!76310 m!76081))

(declare-fun m!76083 () Bool)

(assert (=> bm!6889 m!76083))

(assert (=> b!76312 m!75989))

(assert (=> b!76312 m!75989))

(assert (=> b!76312 m!76031))

(assert (=> b!76316 m!76083))

(assert (=> b!76314 m!75769))

(assert (=> b!76314 m!75987))

(assert (=> b!76314 m!75989))

(declare-fun m!76085 () Bool)

(assert (=> b!76314 m!76085))

(assert (=> b!76314 m!75989))

(assert (=> b!76314 m!75987))

(assert (=> b!76314 m!75769))

(assert (=> b!76314 m!75993))

(assert (=> b!76317 m!75989))

(assert (=> b!76317 m!75989))

(assert (=> b!76317 m!76031))

(assert (=> b!76318 m!75769))

(assert (=> b!76318 m!75987))

(declare-fun m!76087 () Bool)

(assert (=> b!76318 m!76087))

(assert (=> b!76318 m!75989))

(declare-fun m!76089 () Bool)

(assert (=> b!76318 m!76089))

(assert (=> b!76318 m!76087))

(declare-fun m!76091 () Bool)

(assert (=> b!76318 m!76091))

(declare-fun m!76093 () Bool)

(assert (=> b!76318 m!76093))

(assert (=> b!76318 m!75987))

(assert (=> b!76318 m!75769))

(assert (=> b!76318 m!75993))

(assert (=> b!75912 d!18151))

(declare-fun d!18153 () Bool)

(assert (=> d!18153 (= (+!96 (+!96 lt!34452 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (+!96 (+!96 lt!34452 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))

(declare-fun lt!34739 () Unit!2186)

(declare-fun choose!445 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64) V!2961) Unit!2186)

(assert (=> d!18153 (= lt!34739 (choose!445 lt!34452 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))

(assert (=> d!18153 (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18153 (= (addCommutativeForDiffKeys!16 lt!34452 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) lt!34739)))

(declare-fun bs!3272 () Bool)

(assert (= bs!3272 d!18153))

(declare-fun m!76095 () Bool)

(assert (=> bs!3272 m!76095))

(declare-fun m!76097 () Bool)

(assert (=> bs!3272 m!76097))

(declare-fun m!76099 () Bool)

(assert (=> bs!3272 m!76099))

(declare-fun m!76101 () Bool)

(assert (=> bs!3272 m!76101))

(assert (=> bs!3272 m!76099))

(assert (=> bs!3272 m!76095))

(assert (=> bs!3272 m!75749))

(declare-fun m!76103 () Bool)

(assert (=> bs!3272 m!76103))

(assert (=> b!75912 d!18153))

(declare-fun d!18155 () Bool)

(declare-fun e!49845 () Bool)

(assert (=> d!18155 e!49845))

(declare-fun res!40165 () Bool)

(assert (=> d!18155 (=> (not res!40165) (not e!49845))))

(declare-fun lt!34740 () ListLongMap!1411)

(assert (=> d!18155 (= res!40165 (contains!726 lt!34740 (_1!1079 lt!34456)))))

(declare-fun lt!34743 () List!1482)

(assert (=> d!18155 (= lt!34740 (ListLongMap!1412 lt!34743))))

(declare-fun lt!34742 () Unit!2186)

(declare-fun lt!34741 () Unit!2186)

(assert (=> d!18155 (= lt!34742 lt!34741)))

(assert (=> d!18155 (= (getValueByKey!136 lt!34743 (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456)))))

(assert (=> d!18155 (= lt!34741 (lemmaContainsTupThenGetReturnValue!53 lt!34743 (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(assert (=> d!18155 (= lt!34743 (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 lt!34463)) (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(assert (=> d!18155 (= (+!96 (+!96 lt!34452 lt!34463) lt!34456) lt!34740)))

(declare-fun b!76322 () Bool)

(declare-fun res!40164 () Bool)

(assert (=> b!76322 (=> (not res!40164) (not e!49845))))

(assert (=> b!76322 (= res!40164 (= (getValueByKey!136 (toList!721 lt!34740) (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456))))))

(declare-fun b!76323 () Bool)

(assert (=> b!76323 (= e!49845 (contains!728 (toList!721 lt!34740) lt!34456))))

(assert (= (and d!18155 res!40165) b!76322))

(assert (= (and b!76322 res!40164) b!76323))

(declare-fun m!76105 () Bool)

(assert (=> d!18155 m!76105))

(declare-fun m!76107 () Bool)

(assert (=> d!18155 m!76107))

(declare-fun m!76109 () Bool)

(assert (=> d!18155 m!76109))

(declare-fun m!76111 () Bool)

(assert (=> d!18155 m!76111))

(declare-fun m!76113 () Bool)

(assert (=> b!76322 m!76113))

(declare-fun m!76115 () Bool)

(assert (=> b!76323 m!76115))

(assert (=> b!75912 d!18155))

(declare-fun d!18157 () Bool)

(assert (=> d!18157 (= (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992)))) (and (or (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000001111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000011111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000001111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000011111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000001111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000011111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000001111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000011111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000000111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000001111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000011111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000000111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000001111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000011111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000000111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000001111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000011111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000000111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000001111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000011111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00000111111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00001111111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00011111111111111111111111111111) (= (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6229 (v!2561 (underlying!268 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!75912 d!18157))

(declare-fun d!18159 () Bool)

(declare-fun e!49846 () Bool)

(assert (=> d!18159 e!49846))

(declare-fun res!40167 () Bool)

(assert (=> d!18159 (=> (not res!40167) (not e!49846))))

(declare-fun lt!34744 () ListLongMap!1411)

(assert (=> d!18159 (= res!40167 (contains!726 lt!34744 (_1!1079 lt!34456)))))

(declare-fun lt!34747 () List!1482)

(assert (=> d!18159 (= lt!34744 (ListLongMap!1412 lt!34747))))

(declare-fun lt!34746 () Unit!2186)

(declare-fun lt!34745 () Unit!2186)

(assert (=> d!18159 (= lt!34746 lt!34745)))

(assert (=> d!18159 (= (getValueByKey!136 lt!34747 (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456)))))

(assert (=> d!18159 (= lt!34745 (lemmaContainsTupThenGetReturnValue!53 lt!34747 (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(assert (=> d!18159 (= lt!34747 (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(assert (=> d!18159 (= (+!96 lt!34452 lt!34456) lt!34744)))

(declare-fun b!76324 () Bool)

(declare-fun res!40166 () Bool)

(assert (=> b!76324 (=> (not res!40166) (not e!49846))))

(assert (=> b!76324 (= res!40166 (= (getValueByKey!136 (toList!721 lt!34744) (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456))))))

(declare-fun b!76325 () Bool)

(assert (=> b!76325 (= e!49846 (contains!728 (toList!721 lt!34744) lt!34456))))

(assert (= (and d!18159 res!40167) b!76324))

(assert (= (and b!76324 res!40166) b!76325))

(declare-fun m!76117 () Bool)

(assert (=> d!18159 m!76117))

(declare-fun m!76119 () Bool)

(assert (=> d!18159 m!76119))

(declare-fun m!76121 () Bool)

(assert (=> d!18159 m!76121))

(declare-fun m!76123 () Bool)

(assert (=> d!18159 m!76123))

(declare-fun m!76125 () Bool)

(assert (=> b!76324 m!76125))

(declare-fun m!76127 () Bool)

(assert (=> b!76325 m!76127))

(assert (=> b!75912 d!18159))

(declare-fun d!18161 () Bool)

(declare-fun e!49847 () Bool)

(assert (=> d!18161 e!49847))

(declare-fun res!40169 () Bool)

(assert (=> d!18161 (=> (not res!40169) (not e!49847))))

(declare-fun lt!34748 () ListLongMap!1411)

(assert (=> d!18161 (= res!40169 (contains!726 lt!34748 (_1!1079 lt!34463)))))

(declare-fun lt!34751 () List!1482)

(assert (=> d!18161 (= lt!34748 (ListLongMap!1412 lt!34751))))

(declare-fun lt!34750 () Unit!2186)

(declare-fun lt!34749 () Unit!2186)

(assert (=> d!18161 (= lt!34750 lt!34749)))

(assert (=> d!18161 (= (getValueByKey!136 lt!34751 (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463)))))

(assert (=> d!18161 (= lt!34749 (lemmaContainsTupThenGetReturnValue!53 lt!34751 (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(assert (=> d!18161 (= lt!34751 (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 lt!34456)) (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(assert (=> d!18161 (= (+!96 (+!96 lt!34452 lt!34456) lt!34463) lt!34748)))

(declare-fun b!76326 () Bool)

(declare-fun res!40168 () Bool)

(assert (=> b!76326 (=> (not res!40168) (not e!49847))))

(assert (=> b!76326 (= res!40168 (= (getValueByKey!136 (toList!721 lt!34748) (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463))))))

(declare-fun b!76327 () Bool)

(assert (=> b!76327 (= e!49847 (contains!728 (toList!721 lt!34748) lt!34463))))

(assert (= (and d!18161 res!40169) b!76326))

(assert (= (and b!76326 res!40168) b!76327))

(declare-fun m!76129 () Bool)

(assert (=> d!18161 m!76129))

(declare-fun m!76131 () Bool)

(assert (=> d!18161 m!76131))

(declare-fun m!76133 () Bool)

(assert (=> d!18161 m!76133))

(declare-fun m!76135 () Bool)

(assert (=> d!18161 m!76135))

(declare-fun m!76137 () Bool)

(assert (=> b!76326 m!76137))

(declare-fun m!76139 () Bool)

(assert (=> b!76327 m!76139))

(assert (=> b!75912 d!18161))

(declare-fun d!18163 () Bool)

(declare-fun res!40176 () Bool)

(declare-fun e!49850 () Bool)

(assert (=> d!18163 (=> (not res!40176) (not e!49850))))

(declare-fun simpleValid!53 (LongMapFixedSize!706) Bool)

(assert (=> d!18163 (= res!40176 (simpleValid!53 newMap!16))))

(assert (=> d!18163 (= (valid!312 newMap!16) e!49850)))

(declare-fun b!76334 () Bool)

(declare-fun res!40177 () Bool)

(assert (=> b!76334 (=> (not res!40177) (not e!49850))))

(declare-fun arrayCountValidKeys!0 (array!3905 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!76334 (= res!40177 (= (arrayCountValidKeys!0 (_keys!3904 newMap!16) #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (_size!402 newMap!16)))))

(declare-fun b!76335 () Bool)

(declare-fun res!40178 () Bool)

(assert (=> b!76335 (=> (not res!40178) (not e!49850))))

(assert (=> b!76335 (= res!40178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun b!76336 () Bool)

(assert (=> b!76336 (= e!49850 (arrayNoDuplicates!0 (_keys!3904 newMap!16) #b00000000000000000000000000000000 Nil!1478))))

(assert (= (and d!18163 res!40176) b!76334))

(assert (= (and b!76334 res!40177) b!76335))

(assert (= (and b!76335 res!40178) b!76336))

(declare-fun m!76141 () Bool)

(assert (=> d!18163 m!76141))

(declare-fun m!76143 () Bool)

(assert (=> b!76334 m!76143))

(declare-fun m!76145 () Bool)

(assert (=> b!76335 m!76145))

(declare-fun m!76147 () Bool)

(assert (=> b!76336 m!76147))

(assert (=> b!75902 d!18163))

(declare-fun d!18165 () Bool)

(assert (=> d!18165 (not (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34754 () Unit!2186)

(declare-fun choose!68 (array!3905 (_ BitVec 32) (_ BitVec 64) List!1481) Unit!2186)

(assert (=> d!18165 (= lt!34754 (choose!68 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478)))))

(assert (=> d!18165 (bvslt (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18165 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478)) lt!34754)))

(declare-fun bs!3273 () Bool)

(assert (= bs!3273 d!18165))

(assert (=> bs!3273 m!75749))

(assert (=> bs!3273 m!75779))

(assert (=> bs!3273 m!75749))

(declare-fun m!76149 () Bool)

(assert (=> bs!3273 m!76149))

(assert (=> b!75907 d!18165))

(declare-fun d!18167 () Bool)

(assert (=> d!18167 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) from!355 Nil!1478)))

(declare-fun lt!34757 () Unit!2186)

(declare-fun choose!39 (array!3905 (_ BitVec 32) (_ BitVec 32)) Unit!2186)

(assert (=> d!18167 (= lt!34757 (choose!39 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18167 (bvslt (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18167 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 from!355) lt!34757)))

(declare-fun bs!3274 () Bool)

(assert (= bs!3274 d!18167))

(assert (=> bs!3274 m!75775))

(declare-fun m!76151 () Bool)

(assert (=> bs!3274 m!76151))

(assert (=> b!75907 d!18167))

(declare-fun d!18169 () Bool)

(declare-fun res!40183 () Bool)

(declare-fun e!49855 () Bool)

(assert (=> d!18169 (=> res!40183 e!49855)))

(assert (=> d!18169 (= res!40183 (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18169 (= (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49855)))

(declare-fun b!76341 () Bool)

(declare-fun e!49856 () Bool)

(assert (=> b!76341 (= e!49855 e!49856)))

(declare-fun res!40184 () Bool)

(assert (=> b!76341 (=> (not res!40184) (not e!49856))))

(assert (=> b!76341 (= res!40184 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76342 () Bool)

(assert (=> b!76342 (= e!49856 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18169 (not res!40183)) b!76341))

(assert (= (and b!76341 res!40184) b!76342))

(assert (=> d!18169 m!75989))

(assert (=> b!76342 m!75749))

(declare-fun m!76153 () Bool)

(assert (=> b!76342 m!76153))

(assert (=> b!75907 d!18169))

(declare-fun d!18171 () Bool)

(declare-fun e!49859 () Bool)

(assert (=> d!18171 e!49859))

(declare-fun c!11645 () Bool)

(assert (=> d!18171 (= c!11645 (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34760 () Unit!2186)

(declare-fun choose!446 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2186)

(assert (=> d!18171 (= lt!34760 (choose!446 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(assert (=> d!18171 (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18171 (= (lemmaListMapContainsThenArrayContainsFrom!47 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) lt!34760)))

(declare-fun b!76347 () Bool)

(assert (=> b!76347 (= e!49859 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!76348 () Bool)

(assert (=> b!76348 (= e!49859 (ite (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18171 c!11645) b!76347))

(assert (= (and d!18171 (not c!11645)) b!76348))

(assert (=> d!18171 m!75749))

(declare-fun m!76155 () Bool)

(assert (=> d!18171 m!76155))

(assert (=> d!18171 m!75755))

(assert (=> b!76347 m!75749))

(assert (=> b!76347 m!75779))

(assert (=> b!75907 d!18171))

(declare-fun b!76349 () Bool)

(declare-fun e!49861 () Bool)

(assert (=> b!76349 (= e!49861 (contains!727 Nil!1478 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76350 () Bool)

(declare-fun e!49860 () Bool)

(declare-fun call!6893 () Bool)

(assert (=> b!76350 (= e!49860 call!6893)))

(declare-fun d!18173 () Bool)

(declare-fun res!40185 () Bool)

(declare-fun e!49863 () Bool)

(assert (=> d!18173 (=> res!40185 e!49863)))

(assert (=> d!18173 (= res!40185 (bvsge from!355 (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18173 (= (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) from!355 Nil!1478) e!49863)))

(declare-fun b!76351 () Bool)

(declare-fun e!49862 () Bool)

(assert (=> b!76351 (= e!49862 e!49860)))

(declare-fun c!11646 () Bool)

(assert (=> b!76351 (= c!11646 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76352 () Bool)

(assert (=> b!76352 (= e!49860 call!6893)))

(declare-fun b!76353 () Bool)

(assert (=> b!76353 (= e!49863 e!49862)))

(declare-fun res!40186 () Bool)

(assert (=> b!76353 (=> (not res!40186) (not e!49862))))

(assert (=> b!76353 (= res!40186 (not e!49861))))

(declare-fun res!40187 () Bool)

(assert (=> b!76353 (=> (not res!40187) (not e!49861))))

(assert (=> b!76353 (= res!40187 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun bm!6890 () Bool)

(assert (=> bm!6890 (= call!6893 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11646 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478) Nil!1478)))))

(assert (= (and d!18173 (not res!40185)) b!76353))

(assert (= (and b!76353 res!40187) b!76349))

(assert (= (and b!76353 res!40186) b!76351))

(assert (= (and b!76351 c!11646) b!76352))

(assert (= (and b!76351 (not c!11646)) b!76350))

(assert (= (or b!76352 b!76350) bm!6890))

(assert (=> b!76349 m!75749))

(assert (=> b!76349 m!75749))

(declare-fun m!76157 () Bool)

(assert (=> b!76349 m!76157))

(assert (=> b!76351 m!75749))

(assert (=> b!76351 m!75749))

(declare-fun m!76159 () Bool)

(assert (=> b!76351 m!76159))

(assert (=> b!76353 m!75749))

(assert (=> b!76353 m!75749))

(assert (=> b!76353 m!76159))

(assert (=> bm!6890 m!75749))

(declare-fun m!76161 () Bool)

(assert (=> bm!6890 m!76161))

(assert (=> b!75907 d!18173))

(declare-fun b!76360 () Bool)

(declare-fun e!49868 () Bool)

(assert (=> b!76360 (= e!49868 tp_is_empty!2485)))

(declare-fun b!76361 () Bool)

(declare-fun e!49869 () Bool)

(assert (=> b!76361 (= e!49869 tp_is_empty!2485)))

(declare-fun condMapEmpty!3231 () Bool)

(declare-fun mapDefault!3231 () ValueCell!899)

(assert (=> mapNonEmpty!3215 (= condMapEmpty!3231 (= mapRest!3215 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3231)))))

(declare-fun mapRes!3231 () Bool)

(assert (=> mapNonEmpty!3215 (= tp!8601 (and e!49869 mapRes!3231))))

(declare-fun mapNonEmpty!3231 () Bool)

(declare-fun tp!8631 () Bool)

(assert (=> mapNonEmpty!3231 (= mapRes!3231 (and tp!8631 e!49868))))

(declare-fun mapKey!3231 () (_ BitVec 32))

(declare-fun mapRest!3231 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapValue!3231 () ValueCell!899)

(assert (=> mapNonEmpty!3231 (= mapRest!3215 (store mapRest!3231 mapKey!3231 mapValue!3231))))

(declare-fun mapIsEmpty!3231 () Bool)

(assert (=> mapIsEmpty!3231 mapRes!3231))

(assert (= (and mapNonEmpty!3215 condMapEmpty!3231) mapIsEmpty!3231))

(assert (= (and mapNonEmpty!3215 (not condMapEmpty!3231)) mapNonEmpty!3231))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!899) mapValue!3231)) b!76360))

(assert (= (and mapNonEmpty!3215 ((_ is ValueCellFull!899) mapDefault!3231)) b!76361))

(declare-fun m!76163 () Bool)

(assert (=> mapNonEmpty!3231 m!76163))

(declare-fun b!76362 () Bool)

(declare-fun e!49870 () Bool)

(assert (=> b!76362 (= e!49870 tp_is_empty!2485)))

(declare-fun b!76363 () Bool)

(declare-fun e!49871 () Bool)

(assert (=> b!76363 (= e!49871 tp_is_empty!2485)))

(declare-fun condMapEmpty!3232 () Bool)

(declare-fun mapDefault!3232 () ValueCell!899)

(assert (=> mapNonEmpty!3216 (= condMapEmpty!3232 (= mapRest!3216 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3232)))))

(declare-fun mapRes!3232 () Bool)

(assert (=> mapNonEmpty!3216 (= tp!8602 (and e!49871 mapRes!3232))))

(declare-fun mapNonEmpty!3232 () Bool)

(declare-fun tp!8632 () Bool)

(assert (=> mapNonEmpty!3232 (= mapRes!3232 (and tp!8632 e!49870))))

(declare-fun mapValue!3232 () ValueCell!899)

(declare-fun mapKey!3232 () (_ BitVec 32))

(declare-fun mapRest!3232 () (Array (_ BitVec 32) ValueCell!899))

(assert (=> mapNonEmpty!3232 (= mapRest!3216 (store mapRest!3232 mapKey!3232 mapValue!3232))))

(declare-fun mapIsEmpty!3232 () Bool)

(assert (=> mapIsEmpty!3232 mapRes!3232))

(assert (= (and mapNonEmpty!3216 condMapEmpty!3232) mapIsEmpty!3232))

(assert (= (and mapNonEmpty!3216 (not condMapEmpty!3232)) mapNonEmpty!3232))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!899) mapValue!3232)) b!76362))

(assert (= (and mapNonEmpty!3216 ((_ is ValueCellFull!899) mapDefault!3232)) b!76363))

(declare-fun m!76165 () Bool)

(assert (=> mapNonEmpty!3232 m!76165))

(declare-fun b_lambda!3431 () Bool)

(assert (= b_lambda!3425 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3431)))

(declare-fun b_lambda!3433 () Bool)

(assert (= b_lambda!3427 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3433)))

(declare-fun b_lambda!3435 () Bool)

(assert (= b_lambda!3429 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3435)))

(check-sat (not b!76176) (not b!76347) (not b!76322) (not b!76239) (not d!18155) (not b!76275) (not bm!6851) (not b!76284) (not b!76235) (not b!76227) (not d!18149) (not b_next!2139) (not b!76255) (not b!76318) (not b!76061) (not d!18135) (not bm!6879) (not b!76063) (not b!76334) (not d!18161) (not d!18153) (not b_lambda!3433) (not b!76312) (not b!76321) (not b!76325) (not b!76279) (not b!76264) (not b!76323) (not b!76324) (not bm!6886) (not d!18159) (not b!76342) b_and!4673 (not mapNonEmpty!3232) (not b!76349) (not bm!6847) (not b!76317) (not d!18127) (not b_lambda!3431) (not bm!6854) (not bm!6889) (not b!76327) (not b!76319) (not bm!6850) (not bm!6840) (not bm!6852) (not b!76246) (not d!18163) (not b!76257) (not bm!6890) (not bm!6856) (not b!76314) (not b!76242) (not b!76351) (not bm!6839) (not b_lambda!3423) (not d!18125) (not b!76285) (not b!76316) (not bm!6880) (not bm!6876) (not b_lambda!3435) (not b!76148) (not d!18133) (not d!18171) (not b!76173) (not bm!6836) (not bm!6877) (not b!76336) b_and!4675 (not b!76238) (not bm!6845) (not bm!6883) (not b!76263) (not d!18167) (not d!18165) (not b_next!2137) (not mapNonEmpty!3231) tp_is_empty!2485 (not b!76149) (not bm!6849) (not d!18143) (not b!76310) (not d!18151) (not b!76159) (not b!76277) (not b!76229) (not bm!6842) (not b!76230) (not b!76335) (not b!76353) (not b!76326) (not b!76181))
(check-sat b_and!4673 b_and!4675 (not b_next!2137) (not b_next!2139))
(get-model)

(declare-fun b!76373 () Bool)

(declare-fun e!49876 () Option!142)

(declare-fun e!49877 () Option!142)

(assert (=> b!76373 (= e!49876 e!49877)))

(declare-fun c!11652 () Bool)

(assert (=> b!76373 (= c!11652 (and ((_ is Cons!1478) (toList!721 lt!34740)) (not (= (_1!1079 (h!2066 (toList!721 lt!34740))) (_1!1079 lt!34456)))))))

(declare-fun b!76374 () Bool)

(assert (=> b!76374 (= e!49877 (getValueByKey!136 (t!5068 (toList!721 lt!34740)) (_1!1079 lt!34456)))))

(declare-fun b!76372 () Bool)

(assert (=> b!76372 (= e!49876 (Some!141 (_2!1079 (h!2066 (toList!721 lt!34740)))))))

(declare-fun b!76375 () Bool)

(assert (=> b!76375 (= e!49877 None!140)))

(declare-fun d!18175 () Bool)

(declare-fun c!11651 () Bool)

(assert (=> d!18175 (= c!11651 (and ((_ is Cons!1478) (toList!721 lt!34740)) (= (_1!1079 (h!2066 (toList!721 lt!34740))) (_1!1079 lt!34456))))))

(assert (=> d!18175 (= (getValueByKey!136 (toList!721 lt!34740) (_1!1079 lt!34456)) e!49876)))

(assert (= (and d!18175 c!11651) b!76372))

(assert (= (and d!18175 (not c!11651)) b!76373))

(assert (= (and b!76373 c!11652) b!76374))

(assert (= (and b!76373 (not c!11652)) b!76375))

(declare-fun m!76167 () Bool)

(assert (=> b!76374 m!76167))

(assert (=> b!76322 d!18175))

(declare-fun d!18177 () Bool)

(assert (=> d!18177 (= (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76229 d!18177))

(declare-fun b!76376 () Bool)

(declare-fun e!49879 () Bool)

(assert (=> b!76376 (= e!49879 (contains!727 (ite c!11630 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) Nil!1478) Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76377 () Bool)

(declare-fun e!49878 () Bool)

(declare-fun call!6894 () Bool)

(assert (=> b!76377 (= e!49878 call!6894)))

(declare-fun d!18179 () Bool)

(declare-fun res!40188 () Bool)

(declare-fun e!49881 () Bool)

(assert (=> d!18179 (=> res!40188 e!49881)))

(assert (=> d!18179 (= res!40188 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18179 (= (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11630 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) Nil!1478) Nil!1478)) e!49881)))

(declare-fun b!76378 () Bool)

(declare-fun e!49880 () Bool)

(assert (=> b!76378 (= e!49880 e!49878)))

(declare-fun c!11653 () Bool)

(assert (=> b!76378 (= c!11653 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76379 () Bool)

(assert (=> b!76379 (= e!49878 call!6894)))

(declare-fun b!76380 () Bool)

(assert (=> b!76380 (= e!49881 e!49880)))

(declare-fun res!40189 () Bool)

(assert (=> b!76380 (=> (not res!40189) (not e!49880))))

(assert (=> b!76380 (= res!40189 (not e!49879))))

(declare-fun res!40190 () Bool)

(assert (=> b!76380 (=> (not res!40190) (not e!49879))))

(assert (=> b!76380 (= res!40190 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!6891 () Bool)

(assert (=> bm!6891 (= call!6894 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11653 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!11630 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) Nil!1478) Nil!1478)) (ite c!11630 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) Nil!1478) Nil!1478))))))

(assert (= (and d!18179 (not res!40188)) b!76380))

(assert (= (and b!76380 res!40190) b!76376))

(assert (= (and b!76380 res!40189) b!76378))

(assert (= (and b!76378 c!11653) b!76379))

(assert (= (and b!76378 (not c!11653)) b!76377))

(assert (= (or b!76379 b!76377) bm!6891))

(declare-fun m!76169 () Bool)

(assert (=> b!76376 m!76169))

(assert (=> b!76376 m!76169))

(declare-fun m!76171 () Bool)

(assert (=> b!76376 m!76171))

(assert (=> b!76378 m!76169))

(assert (=> b!76378 m!76169))

(declare-fun m!76173 () Bool)

(assert (=> b!76378 m!76173))

(assert (=> b!76380 m!76169))

(assert (=> b!76380 m!76169))

(assert (=> b!76380 m!76173))

(assert (=> bm!6891 m!76169))

(declare-fun m!76175 () Bool)

(assert (=> bm!6891 m!76175))

(assert (=> bm!6886 d!18179))

(declare-fun d!18181 () Bool)

(declare-fun res!40191 () Bool)

(declare-fun e!49882 () Bool)

(assert (=> d!18181 (=> (not res!40191) (not e!49882))))

(assert (=> d!18181 (= res!40191 (simpleValid!53 (_2!1078 lt!34618)))))

(assert (=> d!18181 (= (valid!312 (_2!1078 lt!34618)) e!49882)))

(declare-fun b!76381 () Bool)

(declare-fun res!40192 () Bool)

(assert (=> b!76381 (=> (not res!40192) (not e!49882))))

(assert (=> b!76381 (= res!40192 (= (arrayCountValidKeys!0 (_keys!3904 (_2!1078 lt!34618)) #b00000000000000000000000000000000 (size!2102 (_keys!3904 (_2!1078 lt!34618)))) (_size!402 (_2!1078 lt!34618))))))

(declare-fun b!76382 () Bool)

(declare-fun res!40193 () Bool)

(assert (=> b!76382 (=> (not res!40193) (not e!49882))))

(assert (=> b!76382 (= res!40193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 (_2!1078 lt!34618)) (mask!6229 (_2!1078 lt!34618))))))

(declare-fun b!76383 () Bool)

(assert (=> b!76383 (= e!49882 (arrayNoDuplicates!0 (_keys!3904 (_2!1078 lt!34618)) #b00000000000000000000000000000000 Nil!1478))))

(assert (= (and d!18181 res!40191) b!76381))

(assert (= (and b!76381 res!40192) b!76382))

(assert (= (and b!76382 res!40193) b!76383))

(declare-fun m!76177 () Bool)

(assert (=> d!18181 m!76177))

(declare-fun m!76179 () Bool)

(assert (=> b!76381 m!76179))

(declare-fun m!76181 () Bool)

(assert (=> b!76382 m!76181))

(declare-fun m!76183 () Bool)

(assert (=> b!76383 m!76183))

(assert (=> d!18127 d!18181))

(assert (=> d!18127 d!18163))

(declare-fun d!18183 () Bool)

(assert (=> d!18183 (= (+!96 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) lt!34620 (zeroValue!2145 newMap!16) lt!34462 #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34763 () Unit!2186)

(declare-fun choose!447 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2186)

(assert (=> d!18183 (= lt!34763 (choose!447 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34620 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34462 (defaultEntry!2246 newMap!16)))))

(assert (=> d!18183 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18183 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34620 (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) lt!34462 (defaultEntry!2246 newMap!16)) lt!34763)))

(declare-fun bs!3275 () Bool)

(assert (= bs!3275 d!18183))

(declare-fun m!76185 () Bool)

(assert (=> bs!3275 m!76185))

(declare-fun m!76187 () Bool)

(assert (=> bs!3275 m!76187))

(assert (=> bs!3275 m!75985))

(declare-fun m!76189 () Bool)

(assert (=> bs!3275 m!76189))

(declare-fun m!76191 () Bool)

(assert (=> bs!3275 m!76191))

(assert (=> bs!3275 m!75985))

(assert (=> b!76181 d!18183))

(declare-fun d!18185 () Bool)

(declare-fun e!49883 () Bool)

(assert (=> d!18185 e!49883))

(declare-fun res!40194 () Bool)

(assert (=> d!18185 (=> res!40194 e!49883)))

(declare-fun lt!34766 () Bool)

(assert (=> d!18185 (= res!40194 (not lt!34766))))

(declare-fun lt!34764 () Bool)

(assert (=> d!18185 (= lt!34766 lt!34764)))

(declare-fun lt!34767 () Unit!2186)

(declare-fun e!49884 () Unit!2186)

(assert (=> d!18185 (= lt!34767 e!49884)))

(declare-fun c!11654 () Bool)

(assert (=> d!18185 (= c!11654 lt!34764)))

(assert (=> d!18185 (= lt!34764 (containsKey!139 (toList!721 lt!34732) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18185 (= (contains!726 lt!34732 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34766)))

(declare-fun b!76384 () Bool)

(declare-fun lt!34765 () Unit!2186)

(assert (=> b!76384 (= e!49884 lt!34765)))

(assert (=> b!76384 (= lt!34765 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34732) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76384 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76385 () Bool)

(declare-fun Unit!2194 () Unit!2186)

(assert (=> b!76385 (= e!49884 Unit!2194)))

(declare-fun b!76386 () Bool)

(assert (=> b!76386 (= e!49883 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18185 c!11654) b!76384))

(assert (= (and d!18185 (not c!11654)) b!76385))

(assert (= (and d!18185 (not res!40194)) b!76386))

(assert (=> d!18185 m!75989))

(declare-fun m!76193 () Bool)

(assert (=> d!18185 m!76193))

(assert (=> b!76384 m!75989))

(declare-fun m!76195 () Bool)

(assert (=> b!76384 m!76195))

(assert (=> b!76384 m!75989))

(declare-fun m!76197 () Bool)

(assert (=> b!76384 m!76197))

(assert (=> b!76384 m!76197))

(declare-fun m!76199 () Bool)

(assert (=> b!76384 m!76199))

(assert (=> b!76386 m!75989))

(assert (=> b!76386 m!76197))

(assert (=> b!76386 m!76197))

(assert (=> b!76386 m!76199))

(assert (=> b!76319 d!18185))

(declare-fun d!18187 () Bool)

(declare-fun get!1166 (Option!142) V!2961)

(assert (=> d!18187 (= (apply!77 lt!34692 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1166 (getValueByKey!136 (toList!721 lt!34692) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3276 () Bool)

(assert (= bs!3276 d!18187))

(assert (=> bs!3276 m!75989))

(declare-fun m!76201 () Bool)

(assert (=> bs!3276 m!76201))

(assert (=> bs!3276 m!76201))

(declare-fun m!76203 () Bool)

(assert (=> bs!3276 m!76203))

(assert (=> b!76242 d!18187))

(declare-fun d!18189 () Bool)

(declare-fun c!11655 () Bool)

(assert (=> d!18189 (= c!11655 ((_ is ValueCellFull!899) (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49885 () V!2961)

(assert (=> d!18189 (= (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49885)))

(declare-fun b!76387 () Bool)

(assert (=> b!76387 (= e!49885 (get!1164 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76388 () Bool)

(assert (=> b!76388 (= e!49885 (get!1165 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18189 c!11655) b!76387))

(assert (= (and d!18189 (not c!11655)) b!76388))

(assert (=> b!76387 m!75987))

(assert (=> b!76387 m!75769))

(declare-fun m!76205 () Bool)

(assert (=> b!76387 m!76205))

(assert (=> b!76388 m!75987))

(assert (=> b!76388 m!75769))

(declare-fun m!76207 () Bool)

(assert (=> b!76388 m!76207))

(assert (=> b!76242 d!18189))

(declare-fun d!18191 () Bool)

(declare-fun isEmpty!329 (List!1482) Bool)

(assert (=> d!18191 (= (isEmpty!328 lt!34732) (isEmpty!329 (toList!721 lt!34732)))))

(declare-fun bs!3277 () Bool)

(assert (= bs!3277 d!18191))

(declare-fun m!76209 () Bool)

(assert (=> bs!3277 m!76209))

(assert (=> b!76321 d!18191))

(declare-fun d!18193 () Bool)

(assert (=> d!18193 (= (map!1168 (_2!1078 lt!34618)) (getCurrentListMap!418 (_keys!3904 (_2!1078 lt!34618)) (_values!2229 (_2!1078 lt!34618)) (mask!6229 (_2!1078 lt!34618)) (extraKeys!2099 (_2!1078 lt!34618)) (zeroValue!2145 (_2!1078 lt!34618)) (minValue!2145 (_2!1078 lt!34618)) #b00000000000000000000000000000000 (defaultEntry!2246 (_2!1078 lt!34618))))))

(declare-fun bs!3278 () Bool)

(assert (= bs!3278 d!18193))

(declare-fun m!76211 () Bool)

(assert (=> bs!3278 m!76211))

(assert (=> bm!6842 d!18193))

(assert (=> b!76317 d!18177))

(declare-fun d!18195 () Bool)

(declare-fun res!40195 () Bool)

(declare-fun e!49886 () Bool)

(assert (=> d!18195 (=> res!40195 e!49886)))

(assert (=> d!18195 (= res!40195 (= (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18195 (= (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000) e!49886)))

(declare-fun b!76389 () Bool)

(declare-fun e!49887 () Bool)

(assert (=> b!76389 (= e!49886 e!49887)))

(declare-fun res!40196 () Bool)

(assert (=> b!76389 (=> (not res!40196) (not e!49887))))

(assert (=> b!76389 (= res!40196 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76390 () Bool)

(assert (=> b!76390 (= e!49887 (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18195 (not res!40195)) b!76389))

(assert (= (and b!76389 res!40196) b!76390))

(declare-fun m!76213 () Bool)

(assert (=> d!18195 m!76213))

(assert (=> b!76390 m!75749))

(declare-fun m!76215 () Bool)

(assert (=> b!76390 m!76215))

(assert (=> bm!6856 d!18195))

(declare-fun b!76403 () Bool)

(declare-fun e!49896 () SeekEntryResult!232)

(declare-fun e!49895 () SeekEntryResult!232)

(assert (=> b!76403 (= e!49896 e!49895)))

(declare-fun lt!34775 () (_ BitVec 64))

(declare-fun lt!34774 () SeekEntryResult!232)

(assert (=> b!76403 (= lt!34775 (select (arr!1862 (_keys!3904 newMap!16)) (index!3063 lt!34774)))))

(declare-fun c!11663 () Bool)

(assert (=> b!76403 (= c!11663 (= lt!34775 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76404 () Bool)

(declare-fun e!49894 () SeekEntryResult!232)

(assert (=> b!76404 (= e!49894 (MissingZero!232 (index!3063 lt!34774)))))

(declare-fun b!76405 () Bool)

(declare-fun c!11662 () Bool)

(assert (=> b!76405 (= c!11662 (= lt!34775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76405 (= e!49895 e!49894)))

(declare-fun b!76406 () Bool)

(assert (=> b!76406 (= e!49896 Undefined!232)))

(declare-fun d!18197 () Bool)

(declare-fun lt!34776 () SeekEntryResult!232)

(assert (=> d!18197 (and (or ((_ is Undefined!232) lt!34776) (not ((_ is Found!232) lt!34776)) (and (bvsge (index!3062 lt!34776) #b00000000000000000000000000000000) (bvslt (index!3062 lt!34776) (size!2102 (_keys!3904 newMap!16))))) (or ((_ is Undefined!232) lt!34776) ((_ is Found!232) lt!34776) (not ((_ is MissingZero!232) lt!34776)) (and (bvsge (index!3061 lt!34776) #b00000000000000000000000000000000) (bvslt (index!3061 lt!34776) (size!2102 (_keys!3904 newMap!16))))) (or ((_ is Undefined!232) lt!34776) ((_ is Found!232) lt!34776) ((_ is MissingZero!232) lt!34776) (not ((_ is MissingVacant!232) lt!34776)) (and (bvsge (index!3064 lt!34776) #b00000000000000000000000000000000) (bvslt (index!3064 lt!34776) (size!2102 (_keys!3904 newMap!16))))) (or ((_ is Undefined!232) lt!34776) (ite ((_ is Found!232) lt!34776) (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34776)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (ite ((_ is MissingZero!232) lt!34776) (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3061 lt!34776)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!232) lt!34776) (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3064 lt!34776)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18197 (= lt!34776 e!49896)))

(declare-fun c!11664 () Bool)

(assert (=> d!18197 (= c!11664 (and ((_ is Intermediate!232) lt!34774) (undefined!1044 lt!34774)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3905 (_ BitVec 32)) SeekEntryResult!232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!18197 (= lt!34774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (mask!6229 newMap!16)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(assert (=> d!18197 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18197 (= (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)) lt!34776)))

(declare-fun b!76407 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3905 (_ BitVec 32)) SeekEntryResult!232)

(assert (=> b!76407 (= e!49894 (seekKeyOrZeroReturnVacant!0 (x!11381 lt!34774) (index!3063 lt!34774) (index!3063 lt!34774) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun b!76408 () Bool)

(assert (=> b!76408 (= e!49895 (Found!232 (index!3063 lt!34774)))))

(assert (= (and d!18197 c!11664) b!76406))

(assert (= (and d!18197 (not c!11664)) b!76403))

(assert (= (and b!76403 c!11663) b!76408))

(assert (= (and b!76403 (not c!11663)) b!76405))

(assert (= (and b!76405 c!11662) b!76404))

(assert (= (and b!76405 (not c!11662)) b!76407))

(declare-fun m!76217 () Bool)

(assert (=> b!76403 m!76217))

(assert (=> d!18197 m!75749))

(declare-fun m!76219 () Bool)

(assert (=> d!18197 m!76219))

(declare-fun m!76221 () Bool)

(assert (=> d!18197 m!76221))

(declare-fun m!76223 () Bool)

(assert (=> d!18197 m!76223))

(assert (=> d!18197 m!76219))

(assert (=> d!18197 m!75749))

(declare-fun m!76225 () Bool)

(assert (=> d!18197 m!76225))

(assert (=> d!18197 m!76191))

(declare-fun m!76227 () Bool)

(assert (=> d!18197 m!76227))

(assert (=> b!76407 m!75749))

(declare-fun m!76229 () Bool)

(assert (=> b!76407 m!76229))

(assert (=> bm!6840 d!18197))

(declare-fun d!18199 () Bool)

(declare-fun e!49897 () Bool)

(assert (=> d!18199 e!49897))

(declare-fun res!40197 () Bool)

(assert (=> d!18199 (=> res!40197 e!49897)))

(declare-fun lt!34779 () Bool)

(assert (=> d!18199 (= res!40197 (not lt!34779))))

(declare-fun lt!34777 () Bool)

(assert (=> d!18199 (= lt!34779 lt!34777)))

(declare-fun lt!34780 () Unit!2186)

(declare-fun e!49898 () Unit!2186)

(assert (=> d!18199 (= lt!34780 e!49898)))

(declare-fun c!11665 () Bool)

(assert (=> d!18199 (= c!11665 lt!34777)))

(assert (=> d!18199 (= lt!34777 (containsKey!139 (toList!721 lt!34692) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!18199 (= (contains!726 lt!34692 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34779)))

(declare-fun b!76409 () Bool)

(declare-fun lt!34778 () Unit!2186)

(assert (=> b!76409 (= e!49898 lt!34778)))

(assert (=> b!76409 (= lt!34778 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34692) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!76409 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!76410 () Bool)

(declare-fun Unit!2195 () Unit!2186)

(assert (=> b!76410 (= e!49898 Unit!2195)))

(declare-fun b!76411 () Bool)

(assert (=> b!76411 (= e!49897 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!18199 c!11665) b!76409))

(assert (= (and d!18199 (not c!11665)) b!76410))

(assert (= (and d!18199 (not res!40197)) b!76411))

(assert (=> d!18199 m!75989))

(declare-fun m!76231 () Bool)

(assert (=> d!18199 m!76231))

(assert (=> b!76409 m!75989))

(declare-fun m!76233 () Bool)

(assert (=> b!76409 m!76233))

(assert (=> b!76409 m!75989))

(assert (=> b!76409 m!76201))

(assert (=> b!76409 m!76201))

(declare-fun m!76235 () Bool)

(assert (=> b!76409 m!76235))

(assert (=> b!76411 m!75989))

(assert (=> b!76411 m!76201))

(assert (=> b!76411 m!76201))

(assert (=> b!76411 m!76235))

(assert (=> b!76238 d!18199))

(declare-fun d!18201 () Bool)

(declare-fun e!49899 () Bool)

(assert (=> d!18201 e!49899))

(declare-fun res!40198 () Bool)

(assert (=> d!18201 (=> res!40198 e!49899)))

(declare-fun lt!34783 () Bool)

(assert (=> d!18201 (= res!40198 (not lt!34783))))

(declare-fun lt!34781 () Bool)

(assert (=> d!18201 (= lt!34783 lt!34781)))

(declare-fun lt!34784 () Unit!2186)

(declare-fun e!49900 () Unit!2186)

(assert (=> d!18201 (= lt!34784 e!49900)))

(declare-fun c!11666 () Bool)

(assert (=> d!18201 (= c!11666 lt!34781)))

(assert (=> d!18201 (= lt!34781 (containsKey!139 (toList!721 lt!34740) (_1!1079 lt!34456)))))

(assert (=> d!18201 (= (contains!726 lt!34740 (_1!1079 lt!34456)) lt!34783)))

(declare-fun b!76412 () Bool)

(declare-fun lt!34782 () Unit!2186)

(assert (=> b!76412 (= e!49900 lt!34782)))

(assert (=> b!76412 (= lt!34782 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34740) (_1!1079 lt!34456)))))

(assert (=> b!76412 (isDefined!88 (getValueByKey!136 (toList!721 lt!34740) (_1!1079 lt!34456)))))

(declare-fun b!76413 () Bool)

(declare-fun Unit!2196 () Unit!2186)

(assert (=> b!76413 (= e!49900 Unit!2196)))

(declare-fun b!76414 () Bool)

(assert (=> b!76414 (= e!49899 (isDefined!88 (getValueByKey!136 (toList!721 lt!34740) (_1!1079 lt!34456))))))

(assert (= (and d!18201 c!11666) b!76412))

(assert (= (and d!18201 (not c!11666)) b!76413))

(assert (= (and d!18201 (not res!40198)) b!76414))

(declare-fun m!76237 () Bool)

(assert (=> d!18201 m!76237))

(declare-fun m!76239 () Bool)

(assert (=> b!76412 m!76239))

(assert (=> b!76412 m!76113))

(assert (=> b!76412 m!76113))

(declare-fun m!76241 () Bool)

(assert (=> b!76412 m!76241))

(assert (=> b!76414 m!76113))

(assert (=> b!76414 m!76113))

(assert (=> b!76414 m!76241))

(assert (=> d!18155 d!18201))

(declare-fun b!76416 () Bool)

(declare-fun e!49901 () Option!142)

(declare-fun e!49902 () Option!142)

(assert (=> b!76416 (= e!49901 e!49902)))

(declare-fun c!11668 () Bool)

(assert (=> b!76416 (= c!11668 (and ((_ is Cons!1478) lt!34743) (not (= (_1!1079 (h!2066 lt!34743)) (_1!1079 lt!34456)))))))

(declare-fun b!76417 () Bool)

(assert (=> b!76417 (= e!49902 (getValueByKey!136 (t!5068 lt!34743) (_1!1079 lt!34456)))))

(declare-fun b!76415 () Bool)

(assert (=> b!76415 (= e!49901 (Some!141 (_2!1079 (h!2066 lt!34743))))))

(declare-fun b!76418 () Bool)

(assert (=> b!76418 (= e!49902 None!140)))

(declare-fun d!18203 () Bool)

(declare-fun c!11667 () Bool)

(assert (=> d!18203 (= c!11667 (and ((_ is Cons!1478) lt!34743) (= (_1!1079 (h!2066 lt!34743)) (_1!1079 lt!34456))))))

(assert (=> d!18203 (= (getValueByKey!136 lt!34743 (_1!1079 lt!34456)) e!49901)))

(assert (= (and d!18203 c!11667) b!76415))

(assert (= (and d!18203 (not c!11667)) b!76416))

(assert (= (and b!76416 c!11668) b!76417))

(assert (= (and b!76416 (not c!11668)) b!76418))

(declare-fun m!76243 () Bool)

(assert (=> b!76417 m!76243))

(assert (=> d!18155 d!18203))

(declare-fun d!18205 () Bool)

(assert (=> d!18205 (= (getValueByKey!136 lt!34743 (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456)))))

(declare-fun lt!34787 () Unit!2186)

(declare-fun choose!448 (List!1482 (_ BitVec 64) V!2961) Unit!2186)

(assert (=> d!18205 (= lt!34787 (choose!448 lt!34743 (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(declare-fun e!49905 () Bool)

(assert (=> d!18205 e!49905))

(declare-fun res!40203 () Bool)

(assert (=> d!18205 (=> (not res!40203) (not e!49905))))

(declare-fun isStrictlySorted!281 (List!1482) Bool)

(assert (=> d!18205 (= res!40203 (isStrictlySorted!281 lt!34743))))

(assert (=> d!18205 (= (lemmaContainsTupThenGetReturnValue!53 lt!34743 (_1!1079 lt!34456) (_2!1079 lt!34456)) lt!34787)))

(declare-fun b!76423 () Bool)

(declare-fun res!40204 () Bool)

(assert (=> b!76423 (=> (not res!40204) (not e!49905))))

(assert (=> b!76423 (= res!40204 (containsKey!139 lt!34743 (_1!1079 lt!34456)))))

(declare-fun b!76424 () Bool)

(assert (=> b!76424 (= e!49905 (contains!728 lt!34743 (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456))))))

(assert (= (and d!18205 res!40203) b!76423))

(assert (= (and b!76423 res!40204) b!76424))

(assert (=> d!18205 m!76107))

(declare-fun m!76245 () Bool)

(assert (=> d!18205 m!76245))

(declare-fun m!76247 () Bool)

(assert (=> d!18205 m!76247))

(declare-fun m!76249 () Bool)

(assert (=> b!76423 m!76249))

(declare-fun m!76251 () Bool)

(assert (=> b!76424 m!76251))

(assert (=> d!18155 d!18205))

(declare-fun b!76445 () Bool)

(declare-fun e!49916 () Bool)

(declare-fun lt!34790 () List!1482)

(assert (=> b!76445 (= e!49916 (contains!728 lt!34790 (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456))))))

(declare-fun bm!6898 () Bool)

(declare-fun call!6902 () List!1482)

(declare-fun call!6903 () List!1482)

(assert (=> bm!6898 (= call!6902 call!6903)))

(declare-fun b!76446 () Bool)

(declare-fun c!11680 () Bool)

(assert (=> b!76446 (= c!11680 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34463))) (bvsgt (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34463)))) (_1!1079 lt!34456))))))

(declare-fun e!49919 () List!1482)

(declare-fun e!49917 () List!1482)

(assert (=> b!76446 (= e!49919 e!49917)))

(declare-fun b!76447 () Bool)

(assert (=> b!76447 (= e!49917 call!6902)))

(declare-fun e!49920 () List!1482)

(declare-fun c!11678 () Bool)

(declare-fun bm!6899 () Bool)

(declare-fun call!6901 () List!1482)

(declare-fun $colon$colon!67 (List!1482 tuple2!2136) List!1482)

(assert (=> bm!6899 (= call!6901 ($colon$colon!67 e!49920 (ite c!11678 (h!2066 (toList!721 (+!96 lt!34452 lt!34463))) (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456)))))))

(declare-fun c!11677 () Bool)

(assert (=> bm!6899 (= c!11677 c!11678)))

(declare-fun b!76449 () Bool)

(declare-fun e!49918 () List!1482)

(assert (=> b!76449 (= e!49918 call!6901)))

(declare-fun b!76450 () Bool)

(assert (=> b!76450 (= e!49917 call!6902)))

(declare-fun b!76451 () Bool)

(assert (=> b!76451 (= e!49920 (insertStrictlySorted!56 (t!5068 (toList!721 (+!96 lt!34452 lt!34463))) (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(declare-fun b!76452 () Bool)

(assert (=> b!76452 (= e!49918 e!49919)))

(declare-fun c!11679 () Bool)

(assert (=> b!76452 (= c!11679 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34463))) (= (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34463)))) (_1!1079 lt!34456))))))

(declare-fun bm!6900 () Bool)

(assert (=> bm!6900 (= call!6903 call!6901)))

(declare-fun d!18207 () Bool)

(assert (=> d!18207 e!49916))

(declare-fun res!40209 () Bool)

(assert (=> d!18207 (=> (not res!40209) (not e!49916))))

(assert (=> d!18207 (= res!40209 (isStrictlySorted!281 lt!34790))))

(assert (=> d!18207 (= lt!34790 e!49918)))

(assert (=> d!18207 (= c!11678 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34463))) (bvslt (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34463)))) (_1!1079 lt!34456))))))

(assert (=> d!18207 (isStrictlySorted!281 (toList!721 (+!96 lt!34452 lt!34463)))))

(assert (=> d!18207 (= (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 lt!34463)) (_1!1079 lt!34456) (_2!1079 lt!34456)) lt!34790)))

(declare-fun b!76448 () Bool)

(assert (=> b!76448 (= e!49919 call!6903)))

(declare-fun b!76453 () Bool)

(assert (=> b!76453 (= e!49920 (ite c!11679 (t!5068 (toList!721 (+!96 lt!34452 lt!34463))) (ite c!11680 (Cons!1478 (h!2066 (toList!721 (+!96 lt!34452 lt!34463))) (t!5068 (toList!721 (+!96 lt!34452 lt!34463)))) Nil!1479)))))

(declare-fun b!76454 () Bool)

(declare-fun res!40210 () Bool)

(assert (=> b!76454 (=> (not res!40210) (not e!49916))))

(assert (=> b!76454 (= res!40210 (containsKey!139 lt!34790 (_1!1079 lt!34456)))))

(assert (= (and d!18207 c!11678) b!76449))

(assert (= (and d!18207 (not c!11678)) b!76452))

(assert (= (and b!76452 c!11679) b!76448))

(assert (= (and b!76452 (not c!11679)) b!76446))

(assert (= (and b!76446 c!11680) b!76450))

(assert (= (and b!76446 (not c!11680)) b!76447))

(assert (= (or b!76450 b!76447) bm!6898))

(assert (= (or b!76448 bm!6898) bm!6900))

(assert (= (or b!76449 bm!6900) bm!6899))

(assert (= (and bm!6899 c!11677) b!76451))

(assert (= (and bm!6899 (not c!11677)) b!76453))

(assert (= (and d!18207 res!40209) b!76454))

(assert (= (and b!76454 res!40210) b!76445))

(declare-fun m!76253 () Bool)

(assert (=> d!18207 m!76253))

(declare-fun m!76255 () Bool)

(assert (=> d!18207 m!76255))

(declare-fun m!76257 () Bool)

(assert (=> b!76451 m!76257))

(declare-fun m!76259 () Bool)

(assert (=> bm!6899 m!76259))

(declare-fun m!76261 () Bool)

(assert (=> b!76454 m!76261))

(declare-fun m!76263 () Bool)

(assert (=> b!76445 m!76263))

(assert (=> d!18155 d!18207))

(declare-fun b!76456 () Bool)

(declare-fun e!49921 () Option!142)

(declare-fun e!49922 () Option!142)

(assert (=> b!76456 (= e!49921 e!49922)))

(declare-fun c!11682 () Bool)

(assert (=> b!76456 (= c!11682 (and ((_ is Cons!1478) (toList!721 lt!34712)) (not (= (_1!1079 (h!2066 (toList!721 lt!34712))) (_1!1079 lt!34463)))))))

(declare-fun b!76457 () Bool)

(assert (=> b!76457 (= e!49922 (getValueByKey!136 (t!5068 (toList!721 lt!34712)) (_1!1079 lt!34463)))))

(declare-fun b!76455 () Bool)

(assert (=> b!76455 (= e!49921 (Some!141 (_2!1079 (h!2066 (toList!721 lt!34712)))))))

(declare-fun b!76458 () Bool)

(assert (=> b!76458 (= e!49922 None!140)))

(declare-fun d!18209 () Bool)

(declare-fun c!11681 () Bool)

(assert (=> d!18209 (= c!11681 (and ((_ is Cons!1478) (toList!721 lt!34712)) (= (_1!1079 (h!2066 (toList!721 lt!34712))) (_1!1079 lt!34463))))))

(assert (=> d!18209 (= (getValueByKey!136 (toList!721 lt!34712) (_1!1079 lt!34463)) e!49921)))

(assert (= (and d!18209 c!11681) b!76455))

(assert (= (and d!18209 (not c!11681)) b!76456))

(assert (= (and b!76456 c!11682) b!76457))

(assert (= (and b!76456 (not c!11682)) b!76458))

(declare-fun m!76265 () Bool)

(assert (=> b!76457 m!76265))

(assert (=> b!76284 d!18209))

(declare-fun d!18211 () Bool)

(declare-fun e!49925 () Bool)

(assert (=> d!18211 e!49925))

(declare-fun res!40213 () Bool)

(assert (=> d!18211 (=> (not res!40213) (not e!49925))))

(assert (=> d!18211 (= res!40213 (and (bvsge (index!3062 lt!34603) #b00000000000000000000000000000000) (bvslt (index!3062 lt!34603) (size!2102 (_keys!3904 newMap!16)))))))

(declare-fun lt!34793 () Unit!2186)

(declare-fun choose!449 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) Int) Unit!2186)

(assert (=> d!18211 (= lt!34793 (choose!449 (_keys!3904 newMap!16) lt!34623 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18211 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18211 (= (lemmaValidKeyInArrayIsInListMap!86 (_keys!3904 newMap!16) lt!34623 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (defaultEntry!2246 newMap!16)) lt!34793)))

(declare-fun b!76461 () Bool)

(assert (=> b!76461 (= e!49925 (contains!726 (getCurrentListMap!418 (_keys!3904 newMap!16) lt!34623 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603))))))

(assert (= (and d!18211 res!40213) b!76461))

(declare-fun m!76267 () Bool)

(assert (=> d!18211 m!76267))

(assert (=> d!18211 m!76191))

(declare-fun m!76269 () Bool)

(assert (=> b!76461 m!76269))

(assert (=> b!76461 m!75955))

(assert (=> b!76461 m!76269))

(assert (=> b!76461 m!75955))

(declare-fun m!76271 () Bool)

(assert (=> b!76461 m!76271))

(assert (=> b!76176 d!18211))

(declare-fun b!76462 () Bool)

(declare-fun e!49926 () ListLongMap!1411)

(declare-fun call!6907 () ListLongMap!1411)

(assert (=> b!76462 (= e!49926 call!6907)))

(declare-fun b!76463 () Bool)

(declare-fun e!49929 () Bool)

(declare-fun lt!34813 () ListLongMap!1411)

(assert (=> b!76463 (= e!49929 (= (apply!77 lt!34813 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 newMap!16)))))

(declare-fun bm!6901 () Bool)

(declare-fun call!6908 () ListLongMap!1411)

(declare-fun call!6906 () ListLongMap!1411)

(assert (=> bm!6901 (= call!6908 call!6906)))

(declare-fun d!18213 () Bool)

(declare-fun e!49928 () Bool)

(assert (=> d!18213 e!49928))

(declare-fun res!40220 () Bool)

(assert (=> d!18213 (=> (not res!40220) (not e!49928))))

(assert (=> d!18213 (= res!40220 (or (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))))

(declare-fun lt!34795 () ListLongMap!1411)

(assert (=> d!18213 (= lt!34813 lt!34795)))

(declare-fun lt!34809 () Unit!2186)

(declare-fun e!49936 () Unit!2186)

(assert (=> d!18213 (= lt!34809 e!49936)))

(declare-fun c!11685 () Bool)

(declare-fun e!49931 () Bool)

(assert (=> d!18213 (= c!11685 e!49931)))

(declare-fun res!40219 () Bool)

(assert (=> d!18213 (=> (not res!40219) (not e!49931))))

(assert (=> d!18213 (= res!40219 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun e!49937 () ListLongMap!1411)

(assert (=> d!18213 (= lt!34795 e!49937)))

(declare-fun c!11686 () Bool)

(assert (=> d!18213 (= c!11686 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18213 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18213 (= (getCurrentListMap!418 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!34813)))

(declare-fun b!76464 () Bool)

(declare-fun res!40222 () Bool)

(assert (=> b!76464 (=> (not res!40222) (not e!49928))))

(declare-fun e!49930 () Bool)

(assert (=> b!76464 (= res!40222 e!49930)))

(declare-fun res!40216 () Bool)

(assert (=> b!76464 (=> res!40216 e!49930)))

(declare-fun e!49938 () Bool)

(assert (=> b!76464 (= res!40216 (not e!49938))))

(declare-fun res!40218 () Bool)

(assert (=> b!76464 (=> (not res!40218) (not e!49938))))

(assert (=> b!76464 (= res!40218 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76465 () Bool)

(assert (=> b!76465 (= e!49931 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76466 () Bool)

(declare-fun e!49927 () Bool)

(assert (=> b!76466 (= e!49927 (= (apply!77 lt!34813 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 newMap!16)))))

(declare-fun b!76467 () Bool)

(declare-fun res!40215 () Bool)

(assert (=> b!76467 (=> (not res!40215) (not e!49928))))

(declare-fun e!49935 () Bool)

(assert (=> b!76467 (= res!40215 e!49935)))

(declare-fun c!11688 () Bool)

(assert (=> b!76467 (= c!11688 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6902 () Bool)

(assert (=> bm!6902 (= call!6907 call!6908)))

(declare-fun b!76468 () Bool)

(declare-fun Unit!2197 () Unit!2186)

(assert (=> b!76468 (= e!49936 Unit!2197)))

(declare-fun b!76469 () Bool)

(declare-fun e!49932 () ListLongMap!1411)

(declare-fun call!6910 () ListLongMap!1411)

(assert (=> b!76469 (= e!49932 call!6910)))

(declare-fun b!76470 () Bool)

(declare-fun c!11684 () Bool)

(assert (=> b!76470 (= c!11684 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76470 (= e!49932 e!49926)))

(declare-fun call!6905 () ListLongMap!1411)

(declare-fun bm!6903 () Bool)

(declare-fun c!11687 () Bool)

(assert (=> bm!6903 (= call!6905 (+!96 (ite c!11686 call!6906 (ite c!11687 call!6908 call!6907)) (ite (or c!11686 c!11687) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 newMap!16)) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16)))))))

(declare-fun b!76471 () Bool)

(assert (=> b!76471 (= e!49938 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6904 () Bool)

(assert (=> bm!6904 (= call!6906 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76472 () Bool)

(assert (=> b!76472 (= e!49935 e!49929)))

(declare-fun res!40217 () Bool)

(declare-fun call!6904 () Bool)

(assert (=> b!76472 (= res!40217 call!6904)))

(assert (=> b!76472 (=> (not res!40217) (not e!49929))))

(declare-fun bm!6905 () Bool)

(assert (=> bm!6905 (= call!6910 call!6905)))

(declare-fun b!76473 () Bool)

(assert (=> b!76473 (= e!49935 (not call!6904))))

(declare-fun b!76474 () Bool)

(declare-fun e!49934 () Bool)

(assert (=> b!76474 (= e!49930 e!49934)))

(declare-fun res!40214 () Bool)

(assert (=> b!76474 (=> (not res!40214) (not e!49934))))

(assert (=> b!76474 (= res!40214 (contains!726 lt!34813 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76474 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76475 () Bool)

(declare-fun lt!34804 () Unit!2186)

(assert (=> b!76475 (= e!49936 lt!34804)))

(declare-fun lt!34803 () ListLongMap!1411)

(assert (=> b!76475 (= lt!34803 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34806 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34801 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34801 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34797 () Unit!2186)

(assert (=> b!76475 (= lt!34797 (addStillContains!53 lt!34803 lt!34806 (zeroValue!2145 newMap!16) lt!34801))))

(assert (=> b!76475 (contains!726 (+!96 lt!34803 (tuple2!2137 lt!34806 (zeroValue!2145 newMap!16))) lt!34801)))

(declare-fun lt!34814 () Unit!2186)

(assert (=> b!76475 (= lt!34814 lt!34797)))

(declare-fun lt!34798 () ListLongMap!1411)

(assert (=> b!76475 (= lt!34798 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34794 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34794 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34815 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34815 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34811 () Unit!2186)

(assert (=> b!76475 (= lt!34811 (addApplyDifferent!53 lt!34798 lt!34794 (minValue!2145 newMap!16) lt!34815))))

(assert (=> b!76475 (= (apply!77 (+!96 lt!34798 (tuple2!2137 lt!34794 (minValue!2145 newMap!16))) lt!34815) (apply!77 lt!34798 lt!34815))))

(declare-fun lt!34802 () Unit!2186)

(assert (=> b!76475 (= lt!34802 lt!34811)))

(declare-fun lt!34799 () ListLongMap!1411)

(assert (=> b!76475 (= lt!34799 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34805 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34812 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34812 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34807 () Unit!2186)

(assert (=> b!76475 (= lt!34807 (addApplyDifferent!53 lt!34799 lt!34805 (zeroValue!2145 newMap!16) lt!34812))))

(assert (=> b!76475 (= (apply!77 (+!96 lt!34799 (tuple2!2137 lt!34805 (zeroValue!2145 newMap!16))) lt!34812) (apply!77 lt!34799 lt!34812))))

(declare-fun lt!34808 () Unit!2186)

(assert (=> b!76475 (= lt!34808 lt!34807)))

(declare-fun lt!34796 () ListLongMap!1411)

(assert (=> b!76475 (= lt!34796 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34800 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34800 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34810 () (_ BitVec 64))

(assert (=> b!76475 (= lt!34810 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76475 (= lt!34804 (addApplyDifferent!53 lt!34796 lt!34800 (minValue!2145 newMap!16) lt!34810))))

(assert (=> b!76475 (= (apply!77 (+!96 lt!34796 (tuple2!2137 lt!34800 (minValue!2145 newMap!16))) lt!34810) (apply!77 lt!34796 lt!34810))))

(declare-fun b!76476 () Bool)

(assert (=> b!76476 (= e!49926 call!6910)))

(declare-fun bm!6906 () Bool)

(declare-fun call!6909 () Bool)

(assert (=> bm!6906 (= call!6909 (contains!726 lt!34813 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76477 () Bool)

(assert (=> b!76477 (= e!49937 e!49932)))

(assert (=> b!76477 (= c!11687 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6907 () Bool)

(assert (=> bm!6907 (= call!6904 (contains!726 lt!34813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76478 () Bool)

(assert (=> b!76478 (= e!49934 (= (apply!77 lt!34813 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)) (get!1162 (select (arr!1863 (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!332 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2103 (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))))))))

(assert (=> b!76478 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76479 () Bool)

(declare-fun e!49933 () Bool)

(assert (=> b!76479 (= e!49928 e!49933)))

(declare-fun c!11683 () Bool)

(assert (=> b!76479 (= c!11683 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76480 () Bool)

(assert (=> b!76480 (= e!49933 (not call!6909))))

(declare-fun b!76481 () Bool)

(assert (=> b!76481 (= e!49933 e!49927)))

(declare-fun res!40221 () Bool)

(assert (=> b!76481 (= res!40221 call!6909)))

(assert (=> b!76481 (=> (not res!40221) (not e!49927))))

(declare-fun b!76482 () Bool)

(assert (=> b!76482 (= e!49937 (+!96 call!6905 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16))))))

(assert (= (and d!18213 c!11686) b!76482))

(assert (= (and d!18213 (not c!11686)) b!76477))

(assert (= (and b!76477 c!11687) b!76469))

(assert (= (and b!76477 (not c!11687)) b!76470))

(assert (= (and b!76470 c!11684) b!76476))

(assert (= (and b!76470 (not c!11684)) b!76462))

(assert (= (or b!76476 b!76462) bm!6902))

(assert (= (or b!76469 bm!6902) bm!6901))

(assert (= (or b!76469 b!76476) bm!6905))

(assert (= (or b!76482 bm!6901) bm!6904))

(assert (= (or b!76482 bm!6905) bm!6903))

(assert (= (and d!18213 res!40219) b!76465))

(assert (= (and d!18213 c!11685) b!76475))

(assert (= (and d!18213 (not c!11685)) b!76468))

(assert (= (and d!18213 res!40220) b!76464))

(assert (= (and b!76464 res!40218) b!76471))

(assert (= (and b!76464 (not res!40216)) b!76474))

(assert (= (and b!76474 res!40214) b!76478))

(assert (= (and b!76464 res!40222) b!76467))

(assert (= (and b!76467 c!11688) b!76472))

(assert (= (and b!76467 (not c!11688)) b!76473))

(assert (= (and b!76472 res!40217) b!76463))

(assert (= (or b!76472 b!76473) bm!6907))

(assert (= (and b!76467 res!40215) b!76479))

(assert (= (and b!76479 c!11683) b!76481))

(assert (= (and b!76479 (not c!11683)) b!76480))

(assert (= (and b!76481 res!40221) b!76466))

(assert (= (or b!76481 b!76480) bm!6906))

(declare-fun b_lambda!3437 () Bool)

(assert (=> (not b_lambda!3437) (not b!76478)))

(declare-fun t!5079 () Bool)

(declare-fun tb!1569 () Bool)

(assert (=> (and b!75896 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 newMap!16)) t!5079) tb!1569))

(declare-fun result!2741 () Bool)

(assert (=> tb!1569 (= result!2741 tp_is_empty!2485)))

(assert (=> b!76478 t!5079))

(declare-fun b_and!4677 () Bool)

(assert (= b_and!4673 (and (=> t!5079 result!2741) b_and!4677)))

(declare-fun t!5081 () Bool)

(declare-fun tb!1571 () Bool)

(assert (=> (and b!75913 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 newMap!16)) t!5081) tb!1571))

(declare-fun result!2743 () Bool)

(assert (= result!2743 result!2741))

(assert (=> b!76478 t!5081))

(declare-fun b_and!4679 () Bool)

(assert (= b_and!4675 (and (=> t!5081 result!2743) b_and!4679)))

(declare-fun m!76273 () Bool)

(assert (=> b!76478 m!76273))

(assert (=> b!76478 m!76213))

(declare-fun m!76275 () Bool)

(assert (=> b!76478 m!76275))

(declare-fun m!76277 () Bool)

(assert (=> b!76478 m!76277))

(assert (=> b!76478 m!76273))

(assert (=> b!76478 m!76277))

(declare-fun m!76279 () Bool)

(assert (=> b!76478 m!76279))

(assert (=> b!76478 m!76213))

(declare-fun m!76281 () Bool)

(assert (=> bm!6906 m!76281))

(declare-fun m!76283 () Bool)

(assert (=> bm!6904 m!76283))

(declare-fun m!76285 () Bool)

(assert (=> b!76475 m!76285))

(assert (=> b!76475 m!76213))

(declare-fun m!76287 () Bool)

(assert (=> b!76475 m!76287))

(declare-fun m!76289 () Bool)

(assert (=> b!76475 m!76289))

(declare-fun m!76291 () Bool)

(assert (=> b!76475 m!76291))

(declare-fun m!76293 () Bool)

(assert (=> b!76475 m!76293))

(declare-fun m!76295 () Bool)

(assert (=> b!76475 m!76295))

(assert (=> b!76475 m!76283))

(assert (=> b!76475 m!76293))

(declare-fun m!76297 () Bool)

(assert (=> b!76475 m!76297))

(assert (=> b!76475 m!76287))

(declare-fun m!76299 () Bool)

(assert (=> b!76475 m!76299))

(declare-fun m!76301 () Bool)

(assert (=> b!76475 m!76301))

(declare-fun m!76303 () Bool)

(assert (=> b!76475 m!76303))

(declare-fun m!76305 () Bool)

(assert (=> b!76475 m!76305))

(declare-fun m!76307 () Bool)

(assert (=> b!76475 m!76307))

(assert (=> b!76475 m!76307))

(declare-fun m!76309 () Bool)

(assert (=> b!76475 m!76309))

(declare-fun m!76311 () Bool)

(assert (=> b!76475 m!76311))

(declare-fun m!76313 () Bool)

(assert (=> b!76475 m!76313))

(assert (=> b!76475 m!76311))

(declare-fun m!76315 () Bool)

(assert (=> b!76466 m!76315))

(declare-fun m!76317 () Bool)

(assert (=> b!76482 m!76317))

(assert (=> d!18213 m!76191))

(assert (=> b!76465 m!76213))

(assert (=> b!76465 m!76213))

(declare-fun m!76319 () Bool)

(assert (=> b!76465 m!76319))

(declare-fun m!76321 () Bool)

(assert (=> bm!6907 m!76321))

(assert (=> b!76471 m!76213))

(assert (=> b!76471 m!76213))

(assert (=> b!76471 m!76319))

(declare-fun m!76323 () Bool)

(assert (=> bm!6903 m!76323))

(assert (=> b!76474 m!76213))

(assert (=> b!76474 m!76213))

(declare-fun m!76325 () Bool)

(assert (=> b!76474 m!76325))

(declare-fun m!76327 () Bool)

(assert (=> b!76463 m!76327))

(assert (=> b!76176 d!18213))

(declare-fun d!18215 () Bool)

(declare-fun e!49941 () Bool)

(assert (=> d!18215 e!49941))

(declare-fun res!40225 () Bool)

(assert (=> d!18215 (=> (not res!40225) (not e!49941))))

(assert (=> d!18215 (= res!40225 (and (bvsge (index!3062 lt!34603) #b00000000000000000000000000000000) (bvslt (index!3062 lt!34603) (size!2103 (_values!2229 newMap!16)))))))

(declare-fun lt!34818 () Unit!2186)

(declare-fun choose!450 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2186)

(assert (=> d!18215 (= lt!34818 (choose!450 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (defaultEntry!2246 newMap!16)))))

(assert (=> d!18215 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18215 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (index!3062 lt!34603) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (defaultEntry!2246 newMap!16)) lt!34818)))

(declare-fun b!76485 () Bool)

(assert (=> b!76485 (= e!49941 (= (+!96 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (getCurrentListMap!418 (_keys!3904 newMap!16) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (index!3062 lt!34603) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16))))))

(assert (= (and d!18215 res!40225) b!76485))

(assert (=> d!18215 m!75749))

(declare-fun m!76329 () Bool)

(assert (=> d!18215 m!76329))

(assert (=> d!18215 m!76191))

(assert (=> b!76485 m!75985))

(assert (=> b!76485 m!75985))

(declare-fun m!76331 () Bool)

(assert (=> b!76485 m!76331))

(assert (=> b!76485 m!75945))

(assert (=> b!76485 m!75947))

(assert (=> b!76176 d!18215))

(declare-fun d!18217 () Bool)

(declare-fun e!49942 () Bool)

(assert (=> d!18217 e!49942))

(declare-fun res!40226 () Bool)

(assert (=> d!18217 (=> res!40226 e!49942)))

(declare-fun lt!34821 () Bool)

(assert (=> d!18217 (= res!40226 (not lt!34821))))

(declare-fun lt!34819 () Bool)

(assert (=> d!18217 (= lt!34821 lt!34819)))

(declare-fun lt!34822 () Unit!2186)

(declare-fun e!49943 () Unit!2186)

(assert (=> d!18217 (= lt!34822 e!49943)))

(declare-fun c!11689 () Bool)

(assert (=> d!18217 (= c!11689 lt!34819)))

(assert (=> d!18217 (= lt!34819 (containsKey!139 (toList!721 call!6861) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18217 (= (contains!726 call!6861 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) lt!34821)))

(declare-fun b!76486 () Bool)

(declare-fun lt!34820 () Unit!2186)

(assert (=> b!76486 (= e!49943 lt!34820)))

(assert (=> b!76486 (= lt!34820 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 call!6861) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76486 (isDefined!88 (getValueByKey!136 (toList!721 call!6861) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76487 () Bool)

(declare-fun Unit!2198 () Unit!2186)

(assert (=> b!76487 (= e!49943 Unit!2198)))

(declare-fun b!76488 () Bool)

(assert (=> b!76488 (= e!49942 (isDefined!88 (getValueByKey!136 (toList!721 call!6861) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (= (and d!18217 c!11689) b!76486))

(assert (= (and d!18217 (not c!11689)) b!76487))

(assert (= (and d!18217 (not res!40226)) b!76488))

(assert (=> d!18217 m!75749))

(declare-fun m!76333 () Bool)

(assert (=> d!18217 m!76333))

(assert (=> b!76486 m!75749))

(declare-fun m!76335 () Bool)

(assert (=> b!76486 m!76335))

(assert (=> b!76486 m!75749))

(declare-fun m!76337 () Bool)

(assert (=> b!76486 m!76337))

(assert (=> b!76486 m!76337))

(declare-fun m!76339 () Bool)

(assert (=> b!76486 m!76339))

(assert (=> b!76488 m!75749))

(assert (=> b!76488 m!76337))

(assert (=> b!76488 m!76337))

(assert (=> b!76488 m!76339))

(assert (=> b!76176 d!18217))

(declare-fun d!18219 () Bool)

(assert (=> d!18219 (= (+!96 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) lt!34625 lt!34462 (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34825 () Unit!2186)

(declare-fun choose!451 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 V!2961 Int) Unit!2186)

(assert (=> d!18219 (= lt!34825 (choose!451 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34625 (zeroValue!2145 newMap!16) lt!34462 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18219 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18219 (= (lemmaChangeZeroKeyThenAddPairToListMap!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) lt!34625 (zeroValue!2145 newMap!16) lt!34462 (minValue!2145 newMap!16) (defaultEntry!2246 newMap!16)) lt!34825)))

(declare-fun bs!3279 () Bool)

(assert (= bs!3279 d!18219))

(declare-fun m!76341 () Bool)

(assert (=> bs!3279 m!76341))

(assert (=> bs!3279 m!76191))

(declare-fun m!76343 () Bool)

(assert (=> bs!3279 m!76343))

(assert (=> bs!3279 m!75985))

(declare-fun m!76345 () Bool)

(assert (=> bs!3279 m!76345))

(assert (=> bs!3279 m!75985))

(assert (=> b!76148 d!18219))

(assert (=> bm!6854 d!18133))

(assert (=> b!76312 d!18177))

(assert (=> b!76235 d!18177))

(declare-fun d!18221 () Bool)

(declare-fun lt!34828 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!82 (List!1482) (InoxSet tuple2!2136))

(assert (=> d!18221 (= lt!34828 (select (content!82 (toList!721 lt!34744)) lt!34456))))

(declare-fun e!49949 () Bool)

(assert (=> d!18221 (= lt!34828 e!49949)))

(declare-fun res!40232 () Bool)

(assert (=> d!18221 (=> (not res!40232) (not e!49949))))

(assert (=> d!18221 (= res!40232 ((_ is Cons!1478) (toList!721 lt!34744)))))

(assert (=> d!18221 (= (contains!728 (toList!721 lt!34744) lt!34456) lt!34828)))

(declare-fun b!76493 () Bool)

(declare-fun e!49948 () Bool)

(assert (=> b!76493 (= e!49949 e!49948)))

(declare-fun res!40231 () Bool)

(assert (=> b!76493 (=> res!40231 e!49948)))

(assert (=> b!76493 (= res!40231 (= (h!2066 (toList!721 lt!34744)) lt!34456))))

(declare-fun b!76494 () Bool)

(assert (=> b!76494 (= e!49948 (contains!728 (t!5068 (toList!721 lt!34744)) lt!34456))))

(assert (= (and d!18221 res!40232) b!76493))

(assert (= (and b!76493 (not res!40231)) b!76494))

(declare-fun m!76347 () Bool)

(assert (=> d!18221 m!76347))

(declare-fun m!76349 () Bool)

(assert (=> d!18221 m!76349))

(declare-fun m!76351 () Bool)

(assert (=> b!76494 m!76351))

(assert (=> b!76325 d!18221))

(declare-fun b!76495 () Bool)

(declare-fun e!49951 () Bool)

(declare-fun e!49952 () Bool)

(assert (=> b!76495 (= e!49951 e!49952)))

(declare-fun c!11690 () Bool)

(assert (=> b!76495 (= c!11690 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!76496 () Bool)

(declare-fun call!6911 () Bool)

(assert (=> b!76496 (= e!49952 call!6911)))

(declare-fun d!18223 () Bool)

(declare-fun res!40233 () Bool)

(assert (=> d!18223 (=> res!40233 e!49951)))

(assert (=> d!18223 (= res!40233 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18223 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))) e!49951)))

(declare-fun b!76497 () Bool)

(declare-fun e!49950 () Bool)

(assert (=> b!76497 (= e!49952 e!49950)))

(declare-fun lt!34831 () (_ BitVec 64))

(assert (=> b!76497 (= lt!34831 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!34830 () Unit!2186)

(assert (=> b!76497 (= lt!34830 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!76497 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34831 #b00000000000000000000000000000000)))

(declare-fun lt!34829 () Unit!2186)

(assert (=> b!76497 (= lt!34829 lt!34830)))

(declare-fun res!40234 () Bool)

(assert (=> b!76497 (= res!40234 (= (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))) (Found!232 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!76497 (=> (not res!40234) (not e!49950))))

(declare-fun bm!6908 () Bool)

(assert (=> bm!6908 (= call!6911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76498 () Bool)

(assert (=> b!76498 (= e!49950 call!6911)))

(assert (= (and d!18223 (not res!40233)) b!76495))

(assert (= (and b!76495 c!11690) b!76497))

(assert (= (and b!76495 (not c!11690)) b!76496))

(assert (= (and b!76497 res!40234) b!76498))

(assert (= (or b!76498 b!76496) bm!6908))

(assert (=> b!76495 m!76169))

(assert (=> b!76495 m!76169))

(assert (=> b!76495 m!76173))

(assert (=> b!76497 m!76169))

(declare-fun m!76353 () Bool)

(assert (=> b!76497 m!76353))

(declare-fun m!76355 () Bool)

(assert (=> b!76497 m!76355))

(assert (=> b!76497 m!76169))

(declare-fun m!76357 () Bool)

(assert (=> b!76497 m!76357))

(declare-fun m!76359 () Bool)

(assert (=> bm!6908 m!76359))

(assert (=> bm!6883 d!18223))

(declare-fun b!76499 () Bool)

(declare-fun e!49953 () ListLongMap!1411)

(declare-fun call!6915 () ListLongMap!1411)

(assert (=> b!76499 (= e!49953 call!6915)))

(declare-fun b!76500 () Bool)

(declare-fun e!49956 () Bool)

(declare-fun lt!34851 () ListLongMap!1411)

(assert (=> b!76500 (= e!49956 (= (apply!77 lt!34851 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 newMap!16)))))

(declare-fun bm!6909 () Bool)

(declare-fun call!6916 () ListLongMap!1411)

(declare-fun call!6914 () ListLongMap!1411)

(assert (=> bm!6909 (= call!6916 call!6914)))

(declare-fun d!18225 () Bool)

(declare-fun e!49955 () Bool)

(assert (=> d!18225 e!49955))

(declare-fun res!40241 () Bool)

(assert (=> d!18225 (=> (not res!40241) (not e!49955))))

(assert (=> d!18225 (= res!40241 (or (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))))

(declare-fun lt!34833 () ListLongMap!1411)

(assert (=> d!18225 (= lt!34851 lt!34833)))

(declare-fun lt!34847 () Unit!2186)

(declare-fun e!49963 () Unit!2186)

(assert (=> d!18225 (= lt!34847 e!49963)))

(declare-fun c!11693 () Bool)

(declare-fun e!49958 () Bool)

(assert (=> d!18225 (= c!11693 e!49958)))

(declare-fun res!40240 () Bool)

(assert (=> d!18225 (=> (not res!40240) (not e!49958))))

(assert (=> d!18225 (= res!40240 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun e!49964 () ListLongMap!1411)

(assert (=> d!18225 (= lt!34833 e!49964)))

(declare-fun c!11694 () Bool)

(assert (=> d!18225 (= c!11694 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18225 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18225 (= (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!34851)))

(declare-fun b!76501 () Bool)

(declare-fun res!40243 () Bool)

(assert (=> b!76501 (=> (not res!40243) (not e!49955))))

(declare-fun e!49957 () Bool)

(assert (=> b!76501 (= res!40243 e!49957)))

(declare-fun res!40237 () Bool)

(assert (=> b!76501 (=> res!40237 e!49957)))

(declare-fun e!49965 () Bool)

(assert (=> b!76501 (= res!40237 (not e!49965))))

(declare-fun res!40239 () Bool)

(assert (=> b!76501 (=> (not res!40239) (not e!49965))))

(assert (=> b!76501 (= res!40239 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76502 () Bool)

(assert (=> b!76502 (= e!49958 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76503 () Bool)

(declare-fun e!49954 () Bool)

(assert (=> b!76503 (= e!49954 (= (apply!77 lt!34851 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 newMap!16)))))

(declare-fun b!76504 () Bool)

(declare-fun res!40236 () Bool)

(assert (=> b!76504 (=> (not res!40236) (not e!49955))))

(declare-fun e!49962 () Bool)

(assert (=> b!76504 (= res!40236 e!49962)))

(declare-fun c!11696 () Bool)

(assert (=> b!76504 (= c!11696 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6910 () Bool)

(assert (=> bm!6910 (= call!6915 call!6916)))

(declare-fun b!76505 () Bool)

(declare-fun Unit!2199 () Unit!2186)

(assert (=> b!76505 (= e!49963 Unit!2199)))

(declare-fun b!76506 () Bool)

(declare-fun e!49959 () ListLongMap!1411)

(declare-fun call!6918 () ListLongMap!1411)

(assert (=> b!76506 (= e!49959 call!6918)))

(declare-fun b!76507 () Bool)

(declare-fun c!11692 () Bool)

(assert (=> b!76507 (= c!11692 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76507 (= e!49959 e!49953)))

(declare-fun c!11695 () Bool)

(declare-fun bm!6911 () Bool)

(declare-fun call!6913 () ListLongMap!1411)

(assert (=> bm!6911 (= call!6913 (+!96 (ite c!11694 call!6914 (ite c!11695 call!6916 call!6915)) (ite (or c!11694 c!11695) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 newMap!16)) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16)))))))

(declare-fun b!76508 () Bool)

(assert (=> b!76508 (= e!49965 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6912 () Bool)

(assert (=> bm!6912 (= call!6914 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76509 () Bool)

(assert (=> b!76509 (= e!49962 e!49956)))

(declare-fun res!40238 () Bool)

(declare-fun call!6912 () Bool)

(assert (=> b!76509 (= res!40238 call!6912)))

(assert (=> b!76509 (=> (not res!40238) (not e!49956))))

(declare-fun bm!6913 () Bool)

(assert (=> bm!6913 (= call!6918 call!6913)))

(declare-fun b!76510 () Bool)

(assert (=> b!76510 (= e!49962 (not call!6912))))

(declare-fun b!76511 () Bool)

(declare-fun e!49961 () Bool)

(assert (=> b!76511 (= e!49957 e!49961)))

(declare-fun res!40235 () Bool)

(assert (=> b!76511 (=> (not res!40235) (not e!49961))))

(assert (=> b!76511 (= res!40235 (contains!726 lt!34851 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76512 () Bool)

(declare-fun lt!34842 () Unit!2186)

(assert (=> b!76512 (= e!49963 lt!34842)))

(declare-fun lt!34841 () ListLongMap!1411)

(assert (=> b!76512 (= lt!34841 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34844 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34839 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34839 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34835 () Unit!2186)

(assert (=> b!76512 (= lt!34835 (addStillContains!53 lt!34841 lt!34844 (zeroValue!2145 newMap!16) lt!34839))))

(assert (=> b!76512 (contains!726 (+!96 lt!34841 (tuple2!2137 lt!34844 (zeroValue!2145 newMap!16))) lt!34839)))

(declare-fun lt!34852 () Unit!2186)

(assert (=> b!76512 (= lt!34852 lt!34835)))

(declare-fun lt!34836 () ListLongMap!1411)

(assert (=> b!76512 (= lt!34836 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34832 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34853 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34853 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34849 () Unit!2186)

(assert (=> b!76512 (= lt!34849 (addApplyDifferent!53 lt!34836 lt!34832 (minValue!2145 newMap!16) lt!34853))))

(assert (=> b!76512 (= (apply!77 (+!96 lt!34836 (tuple2!2137 lt!34832 (minValue!2145 newMap!16))) lt!34853) (apply!77 lt!34836 lt!34853))))

(declare-fun lt!34840 () Unit!2186)

(assert (=> b!76512 (= lt!34840 lt!34849)))

(declare-fun lt!34837 () ListLongMap!1411)

(assert (=> b!76512 (= lt!34837 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34843 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34850 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34850 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34845 () Unit!2186)

(assert (=> b!76512 (= lt!34845 (addApplyDifferent!53 lt!34837 lt!34843 (zeroValue!2145 newMap!16) lt!34850))))

(assert (=> b!76512 (= (apply!77 (+!96 lt!34837 (tuple2!2137 lt!34843 (zeroValue!2145 newMap!16))) lt!34850) (apply!77 lt!34837 lt!34850))))

(declare-fun lt!34846 () Unit!2186)

(assert (=> b!76512 (= lt!34846 lt!34845)))

(declare-fun lt!34834 () ListLongMap!1411)

(assert (=> b!76512 (= lt!34834 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34838 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34838 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34848 () (_ BitVec 64))

(assert (=> b!76512 (= lt!34848 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76512 (= lt!34842 (addApplyDifferent!53 lt!34834 lt!34838 (minValue!2145 newMap!16) lt!34848))))

(assert (=> b!76512 (= (apply!77 (+!96 lt!34834 (tuple2!2137 lt!34838 (minValue!2145 newMap!16))) lt!34848) (apply!77 lt!34834 lt!34848))))

(declare-fun b!76513 () Bool)

(assert (=> b!76513 (= e!49953 call!6918)))

(declare-fun bm!6914 () Bool)

(declare-fun call!6917 () Bool)

(assert (=> bm!6914 (= call!6917 (contains!726 lt!34851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76514 () Bool)

(assert (=> b!76514 (= e!49964 e!49959)))

(assert (=> b!76514 (= c!11695 (and (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6915 () Bool)

(assert (=> bm!6915 (= call!6912 (contains!726 lt!34851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76515 () Bool)

(assert (=> b!76515 (= e!49961 (= (apply!77 lt!34851 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)) (get!1162 (select (arr!1863 (_values!2229 newMap!16)) #b00000000000000000000000000000000) (dynLambda!332 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2103 (_values!2229 newMap!16))))))

(assert (=> b!76515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76516 () Bool)

(declare-fun e!49960 () Bool)

(assert (=> b!76516 (= e!49955 e!49960)))

(declare-fun c!11691 () Bool)

(assert (=> b!76516 (= c!11691 (not (= (bvand (extraKeys!2099 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76517 () Bool)

(assert (=> b!76517 (= e!49960 (not call!6917))))

(declare-fun b!76518 () Bool)

(assert (=> b!76518 (= e!49960 e!49954)))

(declare-fun res!40242 () Bool)

(assert (=> b!76518 (= res!40242 call!6917)))

(assert (=> b!76518 (=> (not res!40242) (not e!49954))))

(declare-fun b!76519 () Bool)

(assert (=> b!76519 (= e!49964 (+!96 call!6913 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16))))))

(assert (= (and d!18225 c!11694) b!76519))

(assert (= (and d!18225 (not c!11694)) b!76514))

(assert (= (and b!76514 c!11695) b!76506))

(assert (= (and b!76514 (not c!11695)) b!76507))

(assert (= (and b!76507 c!11692) b!76513))

(assert (= (and b!76507 (not c!11692)) b!76499))

(assert (= (or b!76513 b!76499) bm!6910))

(assert (= (or b!76506 bm!6910) bm!6909))

(assert (= (or b!76506 b!76513) bm!6913))

(assert (= (or b!76519 bm!6909) bm!6912))

(assert (= (or b!76519 bm!6913) bm!6911))

(assert (= (and d!18225 res!40240) b!76502))

(assert (= (and d!18225 c!11693) b!76512))

(assert (= (and d!18225 (not c!11693)) b!76505))

(assert (= (and d!18225 res!40241) b!76501))

(assert (= (and b!76501 res!40239) b!76508))

(assert (= (and b!76501 (not res!40237)) b!76511))

(assert (= (and b!76511 res!40235) b!76515))

(assert (= (and b!76501 res!40243) b!76504))

(assert (= (and b!76504 c!11696) b!76509))

(assert (= (and b!76504 (not c!11696)) b!76510))

(assert (= (and b!76509 res!40238) b!76500))

(assert (= (or b!76509 b!76510) bm!6915))

(assert (= (and b!76504 res!40236) b!76516))

(assert (= (and b!76516 c!11691) b!76518))

(assert (= (and b!76516 (not c!11691)) b!76517))

(assert (= (and b!76518 res!40242) b!76503))

(assert (= (or b!76518 b!76517) bm!6914))

(declare-fun b_lambda!3439 () Bool)

(assert (=> (not b_lambda!3439) (not b!76515)))

(assert (=> b!76515 t!5079))

(declare-fun b_and!4681 () Bool)

(assert (= b_and!4677 (and (=> t!5079 result!2741) b_and!4681)))

(assert (=> b!76515 t!5081))

(declare-fun b_and!4683 () Bool)

(assert (= b_and!4679 (and (=> t!5081 result!2743) b_and!4683)))

(declare-fun m!76361 () Bool)

(assert (=> b!76515 m!76361))

(assert (=> b!76515 m!76213))

(declare-fun m!76363 () Bool)

(assert (=> b!76515 m!76363))

(assert (=> b!76515 m!76277))

(assert (=> b!76515 m!76361))

(assert (=> b!76515 m!76277))

(declare-fun m!76365 () Bool)

(assert (=> b!76515 m!76365))

(assert (=> b!76515 m!76213))

(declare-fun m!76367 () Bool)

(assert (=> bm!6914 m!76367))

(declare-fun m!76369 () Bool)

(assert (=> bm!6912 m!76369))

(declare-fun m!76371 () Bool)

(assert (=> b!76512 m!76371))

(assert (=> b!76512 m!76213))

(declare-fun m!76373 () Bool)

(assert (=> b!76512 m!76373))

(declare-fun m!76375 () Bool)

(assert (=> b!76512 m!76375))

(declare-fun m!76377 () Bool)

(assert (=> b!76512 m!76377))

(declare-fun m!76379 () Bool)

(assert (=> b!76512 m!76379))

(declare-fun m!76381 () Bool)

(assert (=> b!76512 m!76381))

(assert (=> b!76512 m!76369))

(assert (=> b!76512 m!76379))

(declare-fun m!76383 () Bool)

(assert (=> b!76512 m!76383))

(assert (=> b!76512 m!76373))

(declare-fun m!76385 () Bool)

(assert (=> b!76512 m!76385))

(declare-fun m!76387 () Bool)

(assert (=> b!76512 m!76387))

(declare-fun m!76389 () Bool)

(assert (=> b!76512 m!76389))

(declare-fun m!76391 () Bool)

(assert (=> b!76512 m!76391))

(declare-fun m!76393 () Bool)

(assert (=> b!76512 m!76393))

(assert (=> b!76512 m!76393))

(declare-fun m!76395 () Bool)

(assert (=> b!76512 m!76395))

(declare-fun m!76397 () Bool)

(assert (=> b!76512 m!76397))

(declare-fun m!76399 () Bool)

(assert (=> b!76512 m!76399))

(assert (=> b!76512 m!76397))

(declare-fun m!76401 () Bool)

(assert (=> b!76503 m!76401))

(declare-fun m!76403 () Bool)

(assert (=> b!76519 m!76403))

(assert (=> d!18225 m!76191))

(assert (=> b!76502 m!76213))

(assert (=> b!76502 m!76213))

(assert (=> b!76502 m!76319))

(declare-fun m!76405 () Bool)

(assert (=> bm!6915 m!76405))

(assert (=> b!76508 m!76213))

(assert (=> b!76508 m!76213))

(assert (=> b!76508 m!76319))

(declare-fun m!76407 () Bool)

(assert (=> bm!6911 m!76407))

(assert (=> b!76511 m!76213))

(assert (=> b!76511 m!76213))

(declare-fun m!76409 () Bool)

(assert (=> b!76511 m!76409))

(declare-fun m!76411 () Bool)

(assert (=> b!76500 m!76411))

(assert (=> d!18133 d!18225))

(declare-fun d!18227 () Bool)

(declare-fun lt!34854 () Bool)

(assert (=> d!18227 (= lt!34854 (select (content!82 (toList!721 lt!34748)) lt!34463))))

(declare-fun e!49967 () Bool)

(assert (=> d!18227 (= lt!34854 e!49967)))

(declare-fun res!40245 () Bool)

(assert (=> d!18227 (=> (not res!40245) (not e!49967))))

(assert (=> d!18227 (= res!40245 ((_ is Cons!1478) (toList!721 lt!34748)))))

(assert (=> d!18227 (= (contains!728 (toList!721 lt!34748) lt!34463) lt!34854)))

(declare-fun b!76520 () Bool)

(declare-fun e!49966 () Bool)

(assert (=> b!76520 (= e!49967 e!49966)))

(declare-fun res!40244 () Bool)

(assert (=> b!76520 (=> res!40244 e!49966)))

(assert (=> b!76520 (= res!40244 (= (h!2066 (toList!721 lt!34748)) lt!34463))))

(declare-fun b!76521 () Bool)

(assert (=> b!76521 (= e!49966 (contains!728 (t!5068 (toList!721 lt!34748)) lt!34463))))

(assert (= (and d!18227 res!40245) b!76520))

(assert (= (and b!76520 (not res!40244)) b!76521))

(declare-fun m!76413 () Bool)

(assert (=> d!18227 m!76413))

(declare-fun m!76415 () Bool)

(assert (=> d!18227 m!76415))

(declare-fun m!76417 () Bool)

(assert (=> b!76521 m!76417))

(assert (=> b!76327 d!18227))

(declare-fun b!76522 () Bool)

(declare-fun res!40246 () Bool)

(declare-fun e!49969 () Bool)

(assert (=> b!76522 (=> (not res!40246) (not e!49969))))

(declare-fun lt!34857 () ListLongMap!1411)

(assert (=> b!76522 (= res!40246 (not (contains!726 lt!34857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!6916 () Bool)

(declare-fun call!6919 () ListLongMap!1411)

(assert (=> bm!6916 (= call!6919 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun d!18229 () Bool)

(assert (=> d!18229 e!49969))

(declare-fun res!40249 () Bool)

(assert (=> d!18229 (=> (not res!40249) (not e!49969))))

(assert (=> d!18229 (= res!40249 (not (contains!726 lt!34857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!49974 () ListLongMap!1411)

(assert (=> d!18229 (= lt!34857 e!49974)))

(declare-fun c!11698 () Bool)

(assert (=> d!18229 (= c!11698 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18229 (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18229 (= (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) lt!34857)))

(declare-fun b!76523 () Bool)

(declare-fun e!49970 () Bool)

(assert (=> b!76523 (= e!49969 e!49970)))

(declare-fun c!11697 () Bool)

(declare-fun e!49972 () Bool)

(assert (=> b!76523 (= c!11697 e!49972)))

(declare-fun res!40247 () Bool)

(assert (=> b!76523 (=> (not res!40247) (not e!49972))))

(assert (=> b!76523 (= res!40247 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76524 () Bool)

(assert (=> b!76524 (= e!49972 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76524 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!76525 () Bool)

(declare-fun e!49968 () Bool)

(assert (=> b!76525 (= e!49970 e!49968)))

(declare-fun c!11699 () Bool)

(assert (=> b!76525 (= c!11699 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76526 () Bool)

(assert (=> b!76526 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> b!76526 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2103 (_values!2229 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun e!49973 () Bool)

(assert (=> b!76526 (= e!49973 (= (apply!77 lt!34857 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!76527 () Bool)

(declare-fun e!49971 () ListLongMap!1411)

(assert (=> b!76527 (= e!49971 call!6919)))

(declare-fun b!76528 () Bool)

(assert (=> b!76528 (= e!49968 (= lt!34857 (getCurrentListMapNoExtraKeys!61 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76529 () Bool)

(assert (=> b!76529 (= e!49974 e!49971)))

(declare-fun c!11700 () Bool)

(assert (=> b!76529 (= c!11700 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76530 () Bool)

(declare-fun lt!34858 () Unit!2186)

(declare-fun lt!34856 () Unit!2186)

(assert (=> b!76530 (= lt!34858 lt!34856)))

(declare-fun lt!34861 () ListLongMap!1411)

(declare-fun lt!34860 () (_ BitVec 64))

(declare-fun lt!34859 () (_ BitVec 64))

(declare-fun lt!34855 () V!2961)

(assert (=> b!76530 (not (contains!726 (+!96 lt!34861 (tuple2!2137 lt!34860 lt!34855)) lt!34859))))

(assert (=> b!76530 (= lt!34856 (addStillNotContains!28 lt!34861 lt!34860 lt!34855 lt!34859))))

(assert (=> b!76530 (= lt!34859 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!76530 (= lt!34855 (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76530 (= lt!34860 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!76530 (= lt!34861 call!6919)))

(assert (=> b!76530 (= e!49971 (+!96 call!6919 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!76531 () Bool)

(assert (=> b!76531 (= e!49970 e!49973)))

(assert (=> b!76531 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun res!40248 () Bool)

(assert (=> b!76531 (= res!40248 (contains!726 lt!34857 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!76531 (=> (not res!40248) (not e!49973))))

(declare-fun b!76532 () Bool)

(assert (=> b!76532 (= e!49974 (ListLongMap!1412 Nil!1479))))

(declare-fun b!76533 () Bool)

(assert (=> b!76533 (= e!49968 (isEmpty!328 lt!34857))))

(assert (= (and d!18229 c!11698) b!76532))

(assert (= (and d!18229 (not c!11698)) b!76529))

(assert (= (and b!76529 c!11700) b!76530))

(assert (= (and b!76529 (not c!11700)) b!76527))

(assert (= (or b!76530 b!76527) bm!6916))

(assert (= (and d!18229 res!40249) b!76522))

(assert (= (and b!76522 res!40246) b!76523))

(assert (= (and b!76523 res!40247) b!76524))

(assert (= (and b!76523 c!11697) b!76531))

(assert (= (and b!76523 (not c!11697)) b!76525))

(assert (= (and b!76531 res!40248) b!76526))

(assert (= (and b!76525 c!11699) b!76528))

(assert (= (and b!76525 (not c!11699)) b!76533))

(declare-fun b_lambda!3441 () Bool)

(assert (=> (not b_lambda!3441) (not b!76526)))

(assert (=> b!76526 t!5064))

(declare-fun b_and!4685 () Bool)

(assert (= b_and!4681 (and (=> t!5064 result!2721) b_and!4685)))

(assert (=> b!76526 t!5066))

(declare-fun b_and!4687 () Bool)

(assert (= b_and!4683 (and (=> t!5066 result!2725) b_and!4687)))

(declare-fun b_lambda!3443 () Bool)

(assert (=> (not b_lambda!3443) (not b!76530)))

(assert (=> b!76530 t!5064))

(declare-fun b_and!4689 () Bool)

(assert (= b_and!4685 (and (=> t!5064 result!2721) b_and!4689)))

(assert (=> b!76530 t!5066))

(declare-fun b_and!4691 () Bool)

(assert (= b_and!4687 (and (=> t!5066 result!2725) b_and!4691)))

(declare-fun m!76419 () Bool)

(assert (=> b!76533 m!76419))

(declare-fun m!76421 () Bool)

(assert (=> d!18229 m!76421))

(assert (=> d!18229 m!75755))

(declare-fun m!76423 () Bool)

(assert (=> b!76531 m!76423))

(assert (=> b!76531 m!76423))

(declare-fun m!76425 () Bool)

(assert (=> b!76531 m!76425))

(declare-fun m!76427 () Bool)

(assert (=> b!76522 m!76427))

(declare-fun m!76429 () Bool)

(assert (=> bm!6916 m!76429))

(assert (=> b!76524 m!76423))

(assert (=> b!76524 m!76423))

(declare-fun m!76431 () Bool)

(assert (=> b!76524 m!76431))

(assert (=> b!76528 m!76429))

(assert (=> b!76526 m!75769))

(declare-fun m!76433 () Bool)

(assert (=> b!76526 m!76433))

(assert (=> b!76526 m!76423))

(declare-fun m!76435 () Bool)

(assert (=> b!76526 m!76435))

(assert (=> b!76526 m!76423))

(assert (=> b!76526 m!76433))

(assert (=> b!76526 m!75769))

(declare-fun m!76437 () Bool)

(assert (=> b!76526 m!76437))

(assert (=> b!76529 m!76423))

(assert (=> b!76529 m!76423))

(assert (=> b!76529 m!76431))

(assert (=> b!76530 m!75769))

(assert (=> b!76530 m!76433))

(declare-fun m!76439 () Bool)

(assert (=> b!76530 m!76439))

(assert (=> b!76530 m!76423))

(declare-fun m!76441 () Bool)

(assert (=> b!76530 m!76441))

(assert (=> b!76530 m!76439))

(declare-fun m!76443 () Bool)

(assert (=> b!76530 m!76443))

(declare-fun m!76445 () Bool)

(assert (=> b!76530 m!76445))

(assert (=> b!76530 m!76433))

(assert (=> b!76530 m!75769))

(assert (=> b!76530 m!76437))

(assert (=> bm!6889 d!18229))

(declare-fun d!18231 () Bool)

(declare-fun e!49975 () Bool)

(assert (=> d!18231 e!49975))

(declare-fun res!40250 () Bool)

(assert (=> d!18231 (=> res!40250 e!49975)))

(declare-fun lt!34864 () Bool)

(assert (=> d!18231 (= res!40250 (not lt!34864))))

(declare-fun lt!34862 () Bool)

(assert (=> d!18231 (= lt!34864 lt!34862)))

(declare-fun lt!34865 () Unit!2186)

(declare-fun e!49976 () Unit!2186)

(assert (=> d!18231 (= lt!34865 e!49976)))

(declare-fun c!11701 () Bool)

(assert (=> d!18231 (= c!11701 lt!34862)))

(assert (=> d!18231 (= lt!34862 (containsKey!139 (toList!721 lt!34712) (_1!1079 lt!34463)))))

(assert (=> d!18231 (= (contains!726 lt!34712 (_1!1079 lt!34463)) lt!34864)))

(declare-fun b!76534 () Bool)

(declare-fun lt!34863 () Unit!2186)

(assert (=> b!76534 (= e!49976 lt!34863)))

(assert (=> b!76534 (= lt!34863 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34712) (_1!1079 lt!34463)))))

(assert (=> b!76534 (isDefined!88 (getValueByKey!136 (toList!721 lt!34712) (_1!1079 lt!34463)))))

(declare-fun b!76535 () Bool)

(declare-fun Unit!2200 () Unit!2186)

(assert (=> b!76535 (= e!49976 Unit!2200)))

(declare-fun b!76536 () Bool)

(assert (=> b!76536 (= e!49975 (isDefined!88 (getValueByKey!136 (toList!721 lt!34712) (_1!1079 lt!34463))))))

(assert (= (and d!18231 c!11701) b!76534))

(assert (= (and d!18231 (not c!11701)) b!76535))

(assert (= (and d!18231 (not res!40250)) b!76536))

(declare-fun m!76447 () Bool)

(assert (=> d!18231 m!76447))

(declare-fun m!76449 () Bool)

(assert (=> b!76534 m!76449))

(assert (=> b!76534 m!76071))

(assert (=> b!76534 m!76071))

(declare-fun m!76451 () Bool)

(assert (=> b!76534 m!76451))

(assert (=> b!76536 m!76071))

(assert (=> b!76536 m!76071))

(assert (=> b!76536 m!76451))

(assert (=> d!18149 d!18231))

(declare-fun b!76538 () Bool)

(declare-fun e!49977 () Option!142)

(declare-fun e!49978 () Option!142)

(assert (=> b!76538 (= e!49977 e!49978)))

(declare-fun c!11703 () Bool)

(assert (=> b!76538 (= c!11703 (and ((_ is Cons!1478) lt!34715) (not (= (_1!1079 (h!2066 lt!34715)) (_1!1079 lt!34463)))))))

(declare-fun b!76539 () Bool)

(assert (=> b!76539 (= e!49978 (getValueByKey!136 (t!5068 lt!34715) (_1!1079 lt!34463)))))

(declare-fun b!76537 () Bool)

(assert (=> b!76537 (= e!49977 (Some!141 (_2!1079 (h!2066 lt!34715))))))

(declare-fun b!76540 () Bool)

(assert (=> b!76540 (= e!49978 None!140)))

(declare-fun d!18233 () Bool)

(declare-fun c!11702 () Bool)

(assert (=> d!18233 (= c!11702 (and ((_ is Cons!1478) lt!34715) (= (_1!1079 (h!2066 lt!34715)) (_1!1079 lt!34463))))))

(assert (=> d!18233 (= (getValueByKey!136 lt!34715 (_1!1079 lt!34463)) e!49977)))

(assert (= (and d!18233 c!11702) b!76537))

(assert (= (and d!18233 (not c!11702)) b!76538))

(assert (= (and b!76538 c!11703) b!76539))

(assert (= (and b!76538 (not c!11703)) b!76540))

(declare-fun m!76453 () Bool)

(assert (=> b!76539 m!76453))

(assert (=> d!18149 d!18233))

(declare-fun d!18235 () Bool)

(assert (=> d!18235 (= (getValueByKey!136 lt!34715 (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463)))))

(declare-fun lt!34866 () Unit!2186)

(assert (=> d!18235 (= lt!34866 (choose!448 lt!34715 (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(declare-fun e!49979 () Bool)

(assert (=> d!18235 e!49979))

(declare-fun res!40251 () Bool)

(assert (=> d!18235 (=> (not res!40251) (not e!49979))))

(assert (=> d!18235 (= res!40251 (isStrictlySorted!281 lt!34715))))

(assert (=> d!18235 (= (lemmaContainsTupThenGetReturnValue!53 lt!34715 (_1!1079 lt!34463) (_2!1079 lt!34463)) lt!34866)))

(declare-fun b!76541 () Bool)

(declare-fun res!40252 () Bool)

(assert (=> b!76541 (=> (not res!40252) (not e!49979))))

(assert (=> b!76541 (= res!40252 (containsKey!139 lt!34715 (_1!1079 lt!34463)))))

(declare-fun b!76542 () Bool)

(assert (=> b!76542 (= e!49979 (contains!728 lt!34715 (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463))))))

(assert (= (and d!18235 res!40251) b!76541))

(assert (= (and b!76541 res!40252) b!76542))

(assert (=> d!18235 m!76065))

(declare-fun m!76455 () Bool)

(assert (=> d!18235 m!76455))

(declare-fun m!76457 () Bool)

(assert (=> d!18235 m!76457))

(declare-fun m!76459 () Bool)

(assert (=> b!76541 m!76459))

(declare-fun m!76461 () Bool)

(assert (=> b!76542 m!76461))

(assert (=> d!18149 d!18235))

(declare-fun b!76543 () Bool)

(declare-fun e!49980 () Bool)

(declare-fun lt!34867 () List!1482)

(assert (=> b!76543 (= e!49980 (contains!728 lt!34867 (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463))))))

(declare-fun bm!6917 () Bool)

(declare-fun call!6921 () List!1482)

(declare-fun call!6922 () List!1482)

(assert (=> bm!6917 (= call!6921 call!6922)))

(declare-fun b!76544 () Bool)

(declare-fun c!11707 () Bool)

(assert (=> b!76544 (= c!11707 (and ((_ is Cons!1478) (toList!721 lt!34452)) (bvsgt (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34463))))))

(declare-fun e!49983 () List!1482)

(declare-fun e!49981 () List!1482)

(assert (=> b!76544 (= e!49983 e!49981)))

(declare-fun b!76545 () Bool)

(assert (=> b!76545 (= e!49981 call!6921)))

(declare-fun bm!6918 () Bool)

(declare-fun c!11705 () Bool)

(declare-fun call!6920 () List!1482)

(declare-fun e!49984 () List!1482)

(assert (=> bm!6918 (= call!6920 ($colon$colon!67 e!49984 (ite c!11705 (h!2066 (toList!721 lt!34452)) (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463)))))))

(declare-fun c!11704 () Bool)

(assert (=> bm!6918 (= c!11704 c!11705)))

(declare-fun b!76547 () Bool)

(declare-fun e!49982 () List!1482)

(assert (=> b!76547 (= e!49982 call!6920)))

(declare-fun b!76548 () Bool)

(assert (=> b!76548 (= e!49981 call!6921)))

(declare-fun b!76549 () Bool)

(assert (=> b!76549 (= e!49984 (insertStrictlySorted!56 (t!5068 (toList!721 lt!34452)) (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(declare-fun b!76550 () Bool)

(assert (=> b!76550 (= e!49982 e!49983)))

(declare-fun c!11706 () Bool)

(assert (=> b!76550 (= c!11706 (and ((_ is Cons!1478) (toList!721 lt!34452)) (= (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34463))))))

(declare-fun bm!6919 () Bool)

(assert (=> bm!6919 (= call!6922 call!6920)))

(declare-fun d!18237 () Bool)

(assert (=> d!18237 e!49980))

(declare-fun res!40253 () Bool)

(assert (=> d!18237 (=> (not res!40253) (not e!49980))))

(assert (=> d!18237 (= res!40253 (isStrictlySorted!281 lt!34867))))

(assert (=> d!18237 (= lt!34867 e!49982)))

(assert (=> d!18237 (= c!11705 (and ((_ is Cons!1478) (toList!721 lt!34452)) (bvslt (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34463))))))

(assert (=> d!18237 (isStrictlySorted!281 (toList!721 lt!34452))))

(assert (=> d!18237 (= (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 lt!34463) (_2!1079 lt!34463)) lt!34867)))

(declare-fun b!76546 () Bool)

(assert (=> b!76546 (= e!49983 call!6922)))

(declare-fun b!76551 () Bool)

(assert (=> b!76551 (= e!49984 (ite c!11706 (t!5068 (toList!721 lt!34452)) (ite c!11707 (Cons!1478 (h!2066 (toList!721 lt!34452)) (t!5068 (toList!721 lt!34452))) Nil!1479)))))

(declare-fun b!76552 () Bool)

(declare-fun res!40254 () Bool)

(assert (=> b!76552 (=> (not res!40254) (not e!49980))))

(assert (=> b!76552 (= res!40254 (containsKey!139 lt!34867 (_1!1079 lt!34463)))))

(assert (= (and d!18237 c!11705) b!76547))

(assert (= (and d!18237 (not c!11705)) b!76550))

(assert (= (and b!76550 c!11706) b!76546))

(assert (= (and b!76550 (not c!11706)) b!76544))

(assert (= (and b!76544 c!11707) b!76548))

(assert (= (and b!76544 (not c!11707)) b!76545))

(assert (= (or b!76548 b!76545) bm!6917))

(assert (= (or b!76546 bm!6917) bm!6919))

(assert (= (or b!76547 bm!6919) bm!6918))

(assert (= (and bm!6918 c!11704) b!76549))

(assert (= (and bm!6918 (not c!11704)) b!76551))

(assert (= (and d!18237 res!40253) b!76552))

(assert (= (and b!76552 res!40254) b!76543))

(declare-fun m!76463 () Bool)

(assert (=> d!18237 m!76463))

(declare-fun m!76465 () Bool)

(assert (=> d!18237 m!76465))

(declare-fun m!76467 () Bool)

(assert (=> b!76549 m!76467))

(declare-fun m!76469 () Bool)

(assert (=> bm!6918 m!76469))

(declare-fun m!76471 () Bool)

(assert (=> b!76552 m!76471))

(declare-fun m!76473 () Bool)

(assert (=> b!76543 m!76473))

(assert (=> d!18149 d!18237))

(declare-fun d!18239 () Bool)

(declare-fun e!49985 () Bool)

(assert (=> d!18239 e!49985))

(declare-fun res!40256 () Bool)

(assert (=> d!18239 (=> (not res!40256) (not e!49985))))

(declare-fun lt!34868 () ListLongMap!1411)

(assert (=> d!18239 (= res!40256 (contains!726 lt!34868 (_1!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(declare-fun lt!34871 () List!1482)

(assert (=> d!18239 (= lt!34868 (ListLongMap!1412 lt!34871))))

(declare-fun lt!34870 () Unit!2186)

(declare-fun lt!34869 () Unit!2186)

(assert (=> d!18239 (= lt!34870 lt!34869)))

(assert (=> d!18239 (= (getValueByKey!136 lt!34871 (_1!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))) (Some!141 (_2!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(assert (=> d!18239 (= lt!34869 (lemmaContainsTupThenGetReturnValue!53 lt!34871 (_1!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (_2!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(assert (=> d!18239 (= lt!34871 (insertStrictlySorted!56 (toList!721 (ite c!11594 (ite c!11591 call!6858 call!6849) call!6861)) (_1!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (_2!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(assert (=> d!18239 (= (+!96 (ite c!11594 (ite c!11591 call!6858 call!6849) call!6861) (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) lt!34868)))

(declare-fun b!76553 () Bool)

(declare-fun res!40255 () Bool)

(assert (=> b!76553 (=> (not res!40255) (not e!49985))))

(assert (=> b!76553 (= res!40255 (= (getValueByKey!136 (toList!721 lt!34868) (_1!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))) (Some!141 (_2!1079 (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))))

(declare-fun b!76554 () Bool)

(assert (=> b!76554 (= e!49985 (contains!728 (toList!721 lt!34868) (ite c!11594 (ite c!11591 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 lt!34462) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 lt!34462)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (= (and d!18239 res!40256) b!76553))

(assert (= (and b!76553 res!40255) b!76554))

(declare-fun m!76475 () Bool)

(assert (=> d!18239 m!76475))

(declare-fun m!76477 () Bool)

(assert (=> d!18239 m!76477))

(declare-fun m!76479 () Bool)

(assert (=> d!18239 m!76479))

(declare-fun m!76481 () Bool)

(assert (=> d!18239 m!76481))

(declare-fun m!76483 () Bool)

(assert (=> b!76553 m!76483))

(declare-fun m!76485 () Bool)

(assert (=> b!76554 m!76485))

(assert (=> bm!6852 d!18239))

(declare-fun d!18241 () Bool)

(declare-fun res!40257 () Bool)

(declare-fun e!49986 () Bool)

(assert (=> d!18241 (=> (not res!40257) (not e!49986))))

(assert (=> d!18241 (= res!40257 (simpleValid!53 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18241 (= (valid!312 (v!2561 (underlying!268 thiss!992))) e!49986)))

(declare-fun b!76555 () Bool)

(declare-fun res!40258 () Bool)

(assert (=> b!76555 (=> (not res!40258) (not e!49986))))

(assert (=> b!76555 (= res!40258 (= (arrayCountValidKeys!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))) (_size!402 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76556 () Bool)

(declare-fun res!40259 () Bool)

(assert (=> b!76556 (=> (not res!40259) (not e!49986))))

(assert (=> b!76556 (= res!40259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76557 () Bool)

(assert (=> b!76557 (= e!49986 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 Nil!1478))))

(assert (= (and d!18241 res!40257) b!76555))

(assert (= (and b!76555 res!40258) b!76556))

(assert (= (and b!76556 res!40259) b!76557))

(declare-fun m!76487 () Bool)

(assert (=> d!18241 m!76487))

(declare-fun m!76489 () Bool)

(assert (=> b!76555 m!76489))

(assert (=> b!76556 m!75765))

(assert (=> b!76557 m!75763))

(assert (=> d!18143 d!18241))

(declare-fun d!18243 () Bool)

(declare-fun e!49987 () Bool)

(assert (=> d!18243 e!49987))

(declare-fun res!40260 () Bool)

(assert (=> d!18243 (=> res!40260 e!49987)))

(declare-fun lt!34874 () Bool)

(assert (=> d!18243 (= res!40260 (not lt!34874))))

(declare-fun lt!34872 () Bool)

(assert (=> d!18243 (= lt!34874 lt!34872)))

(declare-fun lt!34875 () Unit!2186)

(declare-fun e!49988 () Unit!2186)

(assert (=> d!18243 (= lt!34875 e!49988)))

(declare-fun c!11708 () Bool)

(assert (=> d!18243 (= c!11708 lt!34872)))

(assert (=> d!18243 (= lt!34872 (containsKey!139 (toList!721 call!6853) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18243 (= (contains!726 call!6853 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) lt!34874)))

(declare-fun b!76558 () Bool)

(declare-fun lt!34873 () Unit!2186)

(assert (=> b!76558 (= e!49988 lt!34873)))

(assert (=> b!76558 (= lt!34873 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 call!6853) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76558 (isDefined!88 (getValueByKey!136 (toList!721 call!6853) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76559 () Bool)

(declare-fun Unit!2201 () Unit!2186)

(assert (=> b!76559 (= e!49988 Unit!2201)))

(declare-fun b!76560 () Bool)

(assert (=> b!76560 (= e!49987 (isDefined!88 (getValueByKey!136 (toList!721 call!6853) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (= (and d!18243 c!11708) b!76558))

(assert (= (and d!18243 (not c!11708)) b!76559))

(assert (= (and d!18243 (not res!40260)) b!76560))

(assert (=> d!18243 m!75749))

(declare-fun m!76491 () Bool)

(assert (=> d!18243 m!76491))

(assert (=> b!76558 m!75749))

(declare-fun m!76493 () Bool)

(assert (=> b!76558 m!76493))

(assert (=> b!76558 m!75749))

(declare-fun m!76495 () Bool)

(assert (=> b!76558 m!76495))

(assert (=> b!76558 m!76495))

(declare-fun m!76497 () Bool)

(assert (=> b!76558 m!76497))

(assert (=> b!76560 m!75749))

(assert (=> b!76560 m!76495))

(assert (=> b!76560 m!76495))

(assert (=> b!76560 m!76497))

(assert (=> b!76159 d!18243))

(declare-fun b!76561 () Bool)

(declare-fun e!49990 () Bool)

(assert (=> b!76561 (= e!49990 (contains!727 Nil!1478 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76562 () Bool)

(declare-fun e!49989 () Bool)

(declare-fun call!6923 () Bool)

(assert (=> b!76562 (= e!49989 call!6923)))

(declare-fun d!18245 () Bool)

(declare-fun res!40261 () Bool)

(declare-fun e!49992 () Bool)

(assert (=> d!18245 (=> res!40261 e!49992)))

(assert (=> d!18245 (= res!40261 (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(assert (=> d!18245 (= (arrayNoDuplicates!0 (_keys!3904 newMap!16) #b00000000000000000000000000000000 Nil!1478) e!49992)))

(declare-fun b!76563 () Bool)

(declare-fun e!49991 () Bool)

(assert (=> b!76563 (= e!49991 e!49989)))

(declare-fun c!11709 () Bool)

(assert (=> b!76563 (= c!11709 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76564 () Bool)

(assert (=> b!76564 (= e!49989 call!6923)))

(declare-fun b!76565 () Bool)

(assert (=> b!76565 (= e!49992 e!49991)))

(declare-fun res!40262 () Bool)

(assert (=> b!76565 (=> (not res!40262) (not e!49991))))

(assert (=> b!76565 (= res!40262 (not e!49990))))

(declare-fun res!40263 () Bool)

(assert (=> b!76565 (=> (not res!40263) (not e!49990))))

(assert (=> b!76565 (= res!40263 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6920 () Bool)

(assert (=> bm!6920 (= call!6923 (arrayNoDuplicates!0 (_keys!3904 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11709 (Cons!1477 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000) Nil!1478) Nil!1478)))))

(assert (= (and d!18245 (not res!40261)) b!76565))

(assert (= (and b!76565 res!40263) b!76561))

(assert (= (and b!76565 res!40262) b!76563))

(assert (= (and b!76563 c!11709) b!76564))

(assert (= (and b!76563 (not c!11709)) b!76562))

(assert (= (or b!76564 b!76562) bm!6920))

(assert (=> b!76561 m!76213))

(assert (=> b!76561 m!76213))

(declare-fun m!76499 () Bool)

(assert (=> b!76561 m!76499))

(assert (=> b!76563 m!76213))

(assert (=> b!76563 m!76213))

(assert (=> b!76563 m!76319))

(assert (=> b!76565 m!76213))

(assert (=> b!76565 m!76213))

(assert (=> b!76565 m!76319))

(assert (=> bm!6920 m!76213))

(declare-fun m!76501 () Bool)

(assert (=> bm!6920 m!76501))

(assert (=> b!76336 d!18245))

(declare-fun b!76566 () Bool)

(declare-fun e!49994 () Bool)

(assert (=> b!76566 (= e!49994 (contains!727 (ite c!11646 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478) Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76567 () Bool)

(declare-fun e!49993 () Bool)

(declare-fun call!6924 () Bool)

(assert (=> b!76567 (= e!49993 call!6924)))

(declare-fun d!18247 () Bool)

(declare-fun res!40264 () Bool)

(declare-fun e!49996 () Bool)

(assert (=> d!18247 (=> res!40264 e!49996)))

(assert (=> d!18247 (= res!40264 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(assert (=> d!18247 (= (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11646 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478) Nil!1478)) e!49996)))

(declare-fun b!76568 () Bool)

(declare-fun e!49995 () Bool)

(assert (=> b!76568 (= e!49995 e!49993)))

(declare-fun c!11710 () Bool)

(assert (=> b!76568 (= c!11710 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!76569 () Bool)

(assert (=> b!76569 (= e!49993 call!6924)))

(declare-fun b!76570 () Bool)

(assert (=> b!76570 (= e!49996 e!49995)))

(declare-fun res!40265 () Bool)

(assert (=> b!76570 (=> (not res!40265) (not e!49995))))

(assert (=> b!76570 (= res!40265 (not e!49994))))

(declare-fun res!40266 () Bool)

(assert (=> b!76570 (=> (not res!40266) (not e!49994))))

(assert (=> b!76570 (= res!40266 (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!6921 () Bool)

(assert (=> bm!6921 (= call!6924 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11710 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11646 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478) Nil!1478)) (ite c!11646 (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478) Nil!1478))))))

(assert (= (and d!18247 (not res!40264)) b!76570))

(assert (= (and b!76570 res!40266) b!76566))

(assert (= (and b!76570 res!40265) b!76568))

(assert (= (and b!76568 c!11710) b!76569))

(assert (= (and b!76568 (not c!11710)) b!76567))

(assert (= (or b!76569 b!76567) bm!6921))

(declare-fun m!76503 () Bool)

(assert (=> b!76566 m!76503))

(assert (=> b!76566 m!76503))

(declare-fun m!76505 () Bool)

(assert (=> b!76566 m!76505))

(assert (=> b!76568 m!76503))

(assert (=> b!76568 m!76503))

(declare-fun m!76507 () Bool)

(assert (=> b!76568 m!76507))

(assert (=> b!76570 m!76503))

(assert (=> b!76570 m!76503))

(assert (=> b!76570 m!76507))

(assert (=> bm!6921 m!76503))

(declare-fun m!76509 () Bool)

(assert (=> bm!6921 m!76509))

(assert (=> bm!6890 d!18247))

(declare-fun d!18249 () Bool)

(assert (=> d!18249 (= (get!1164 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2560 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76263 d!18249))

(declare-fun b!76579 () Bool)

(declare-fun e!50002 () (_ BitVec 32))

(declare-fun e!50001 () (_ BitVec 32))

(assert (=> b!76579 (= e!50002 e!50001)))

(declare-fun c!11716 () Bool)

(assert (=> b!76579 (= c!11716 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!18251 () Bool)

(declare-fun lt!34878 () (_ BitVec 32))

(assert (=> d!18251 (and (bvsge lt!34878 #b00000000000000000000000000000000) (bvsle lt!34878 (bvsub (size!2102 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!18251 (= lt!34878 e!50002)))

(declare-fun c!11715 () Bool)

(assert (=> d!18251 (= c!11715 (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(assert (=> d!18251 (and (bvsle #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2102 (_keys!3904 newMap!16)) (size!2102 (_keys!3904 newMap!16))))))

(assert (=> d!18251 (= (arrayCountValidKeys!0 (_keys!3904 newMap!16) #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) lt!34878)))

(declare-fun b!76580 () Bool)

(assert (=> b!76580 (= e!50002 #b00000000000000000000000000000000)))

(declare-fun b!76581 () Bool)

(declare-fun call!6927 () (_ BitVec 32))

(assert (=> b!76581 (= e!50001 (bvadd #b00000000000000000000000000000001 call!6927))))

(declare-fun b!76582 () Bool)

(assert (=> b!76582 (= e!50001 call!6927)))

(declare-fun bm!6924 () Bool)

(assert (=> bm!6924 (= call!6927 (arrayCountValidKeys!0 (_keys!3904 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2102 (_keys!3904 newMap!16))))))

(assert (= (and d!18251 c!11715) b!76580))

(assert (= (and d!18251 (not c!11715)) b!76579))

(assert (= (and b!76579 c!11716) b!76581))

(assert (= (and b!76579 (not c!11716)) b!76582))

(assert (= (or b!76581 b!76582) bm!6924))

(assert (=> b!76579 m!76213))

(assert (=> b!76579 m!76213))

(assert (=> b!76579 m!76319))

(declare-fun m!76511 () Bool)

(assert (=> bm!6924 m!76511))

(assert (=> b!76334 d!18251))

(declare-fun d!18253 () Bool)

(declare-fun e!50003 () Bool)

(assert (=> d!18253 e!50003))

(declare-fun res!40268 () Bool)

(assert (=> d!18253 (=> (not res!40268) (not e!50003))))

(declare-fun lt!34879 () ListLongMap!1411)

(assert (=> d!18253 (= res!40268 (contains!726 lt!34879 (_1!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!34882 () List!1482)

(assert (=> d!18253 (= lt!34879 (ListLongMap!1412 lt!34882))))

(declare-fun lt!34881 () Unit!2186)

(declare-fun lt!34880 () Unit!2186)

(assert (=> d!18253 (= lt!34881 lt!34880)))

(assert (=> d!18253 (= (getValueByKey!136 lt!34882 (_1!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18253 (= lt!34880 (lemmaContainsTupThenGetReturnValue!53 lt!34882 (_1!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18253 (= lt!34882 (insertStrictlySorted!56 (toList!721 call!6878) (_1!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18253 (= (+!96 call!6878 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34879)))

(declare-fun b!76583 () Bool)

(declare-fun res!40267 () Bool)

(assert (=> b!76583 (=> (not res!40267) (not e!50003))))

(assert (=> b!76583 (= res!40267 (= (getValueByKey!136 (toList!721 lt!34879) (_1!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76584 () Bool)

(assert (=> b!76584 (= e!50003 (contains!728 (toList!721 lt!34879) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18253 res!40268) b!76583))

(assert (= (and b!76583 res!40267) b!76584))

(declare-fun m!76513 () Bool)

(assert (=> d!18253 m!76513))

(declare-fun m!76515 () Bool)

(assert (=> d!18253 m!76515))

(declare-fun m!76517 () Bool)

(assert (=> d!18253 m!76517))

(declare-fun m!76519 () Bool)

(assert (=> d!18253 m!76519))

(declare-fun m!76521 () Bool)

(assert (=> b!76583 m!76521))

(declare-fun m!76523 () Bool)

(assert (=> b!76584 m!76523))

(assert (=> b!76246 d!18253))

(declare-fun d!18255 () Bool)

(declare-fun e!50004 () Bool)

(assert (=> d!18255 e!50004))

(declare-fun res!40269 () Bool)

(assert (=> d!18255 (=> res!40269 e!50004)))

(declare-fun lt!34885 () Bool)

(assert (=> d!18255 (= res!40269 (not lt!34885))))

(declare-fun lt!34883 () Bool)

(assert (=> d!18255 (= lt!34885 lt!34883)))

(declare-fun lt!34886 () Unit!2186)

(declare-fun e!50005 () Unit!2186)

(assert (=> d!18255 (= lt!34886 e!50005)))

(declare-fun c!11717 () Bool)

(assert (=> d!18255 (= c!11717 lt!34883)))

(assert (=> d!18255 (= lt!34883 (containsKey!139 (toList!721 lt!34748) (_1!1079 lt!34463)))))

(assert (=> d!18255 (= (contains!726 lt!34748 (_1!1079 lt!34463)) lt!34885)))

(declare-fun b!76585 () Bool)

(declare-fun lt!34884 () Unit!2186)

(assert (=> b!76585 (= e!50005 lt!34884)))

(assert (=> b!76585 (= lt!34884 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34748) (_1!1079 lt!34463)))))

(assert (=> b!76585 (isDefined!88 (getValueByKey!136 (toList!721 lt!34748) (_1!1079 lt!34463)))))

(declare-fun b!76586 () Bool)

(declare-fun Unit!2202 () Unit!2186)

(assert (=> b!76586 (= e!50005 Unit!2202)))

(declare-fun b!76587 () Bool)

(assert (=> b!76587 (= e!50004 (isDefined!88 (getValueByKey!136 (toList!721 lt!34748) (_1!1079 lt!34463))))))

(assert (= (and d!18255 c!11717) b!76585))

(assert (= (and d!18255 (not c!11717)) b!76586))

(assert (= (and d!18255 (not res!40269)) b!76587))

(declare-fun m!76525 () Bool)

(assert (=> d!18255 m!76525))

(declare-fun m!76527 () Bool)

(assert (=> b!76585 m!76527))

(assert (=> b!76585 m!76137))

(assert (=> b!76585 m!76137))

(declare-fun m!76529 () Bool)

(assert (=> b!76585 m!76529))

(assert (=> b!76587 m!76137))

(assert (=> b!76587 m!76137))

(assert (=> b!76587 m!76529))

(assert (=> d!18161 d!18255))

(declare-fun b!76589 () Bool)

(declare-fun e!50006 () Option!142)

(declare-fun e!50007 () Option!142)

(assert (=> b!76589 (= e!50006 e!50007)))

(declare-fun c!11719 () Bool)

(assert (=> b!76589 (= c!11719 (and ((_ is Cons!1478) lt!34751) (not (= (_1!1079 (h!2066 lt!34751)) (_1!1079 lt!34463)))))))

(declare-fun b!76590 () Bool)

(assert (=> b!76590 (= e!50007 (getValueByKey!136 (t!5068 lt!34751) (_1!1079 lt!34463)))))

(declare-fun b!76588 () Bool)

(assert (=> b!76588 (= e!50006 (Some!141 (_2!1079 (h!2066 lt!34751))))))

(declare-fun b!76591 () Bool)

(assert (=> b!76591 (= e!50007 None!140)))

(declare-fun d!18257 () Bool)

(declare-fun c!11718 () Bool)

(assert (=> d!18257 (= c!11718 (and ((_ is Cons!1478) lt!34751) (= (_1!1079 (h!2066 lt!34751)) (_1!1079 lt!34463))))))

(assert (=> d!18257 (= (getValueByKey!136 lt!34751 (_1!1079 lt!34463)) e!50006)))

(assert (= (and d!18257 c!11718) b!76588))

(assert (= (and d!18257 (not c!11718)) b!76589))

(assert (= (and b!76589 c!11719) b!76590))

(assert (= (and b!76589 (not c!11719)) b!76591))

(declare-fun m!76531 () Bool)

(assert (=> b!76590 m!76531))

(assert (=> d!18161 d!18257))

(declare-fun d!18259 () Bool)

(assert (=> d!18259 (= (getValueByKey!136 lt!34751 (_1!1079 lt!34463)) (Some!141 (_2!1079 lt!34463)))))

(declare-fun lt!34887 () Unit!2186)

(assert (=> d!18259 (= lt!34887 (choose!448 lt!34751 (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(declare-fun e!50008 () Bool)

(assert (=> d!18259 e!50008))

(declare-fun res!40270 () Bool)

(assert (=> d!18259 (=> (not res!40270) (not e!50008))))

(assert (=> d!18259 (= res!40270 (isStrictlySorted!281 lt!34751))))

(assert (=> d!18259 (= (lemmaContainsTupThenGetReturnValue!53 lt!34751 (_1!1079 lt!34463) (_2!1079 lt!34463)) lt!34887)))

(declare-fun b!76592 () Bool)

(declare-fun res!40271 () Bool)

(assert (=> b!76592 (=> (not res!40271) (not e!50008))))

(assert (=> b!76592 (= res!40271 (containsKey!139 lt!34751 (_1!1079 lt!34463)))))

(declare-fun b!76593 () Bool)

(assert (=> b!76593 (= e!50008 (contains!728 lt!34751 (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463))))))

(assert (= (and d!18259 res!40270) b!76592))

(assert (= (and b!76592 res!40271) b!76593))

(assert (=> d!18259 m!76131))

(declare-fun m!76533 () Bool)

(assert (=> d!18259 m!76533))

(declare-fun m!76535 () Bool)

(assert (=> d!18259 m!76535))

(declare-fun m!76537 () Bool)

(assert (=> b!76592 m!76537))

(declare-fun m!76539 () Bool)

(assert (=> b!76593 m!76539))

(assert (=> d!18161 d!18259))

(declare-fun b!76594 () Bool)

(declare-fun e!50009 () Bool)

(declare-fun lt!34888 () List!1482)

(assert (=> b!76594 (= e!50009 (contains!728 lt!34888 (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463))))))

(declare-fun bm!6925 () Bool)

(declare-fun call!6929 () List!1482)

(declare-fun call!6930 () List!1482)

(assert (=> bm!6925 (= call!6929 call!6930)))

(declare-fun b!76595 () Bool)

(declare-fun c!11723 () Bool)

(assert (=> b!76595 (= c!11723 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34456))) (bvsgt (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34456)))) (_1!1079 lt!34463))))))

(declare-fun e!50012 () List!1482)

(declare-fun e!50010 () List!1482)

(assert (=> b!76595 (= e!50012 e!50010)))

(declare-fun b!76596 () Bool)

(assert (=> b!76596 (= e!50010 call!6929)))

(declare-fun e!50013 () List!1482)

(declare-fun c!11721 () Bool)

(declare-fun call!6928 () List!1482)

(declare-fun bm!6926 () Bool)

(assert (=> bm!6926 (= call!6928 ($colon$colon!67 e!50013 (ite c!11721 (h!2066 (toList!721 (+!96 lt!34452 lt!34456))) (tuple2!2137 (_1!1079 lt!34463) (_2!1079 lt!34463)))))))

(declare-fun c!11720 () Bool)

(assert (=> bm!6926 (= c!11720 c!11721)))

(declare-fun b!76598 () Bool)

(declare-fun e!50011 () List!1482)

(assert (=> b!76598 (= e!50011 call!6928)))

(declare-fun b!76599 () Bool)

(assert (=> b!76599 (= e!50010 call!6929)))

(declare-fun b!76600 () Bool)

(assert (=> b!76600 (= e!50013 (insertStrictlySorted!56 (t!5068 (toList!721 (+!96 lt!34452 lt!34456))) (_1!1079 lt!34463) (_2!1079 lt!34463)))))

(declare-fun b!76601 () Bool)

(assert (=> b!76601 (= e!50011 e!50012)))

(declare-fun c!11722 () Bool)

(assert (=> b!76601 (= c!11722 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34456))) (= (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34456)))) (_1!1079 lt!34463))))))

(declare-fun bm!6927 () Bool)

(assert (=> bm!6927 (= call!6930 call!6928)))

(declare-fun d!18261 () Bool)

(assert (=> d!18261 e!50009))

(declare-fun res!40272 () Bool)

(assert (=> d!18261 (=> (not res!40272) (not e!50009))))

(assert (=> d!18261 (= res!40272 (isStrictlySorted!281 lt!34888))))

(assert (=> d!18261 (= lt!34888 e!50011)))

(assert (=> d!18261 (= c!11721 (and ((_ is Cons!1478) (toList!721 (+!96 lt!34452 lt!34456))) (bvslt (_1!1079 (h!2066 (toList!721 (+!96 lt!34452 lt!34456)))) (_1!1079 lt!34463))))))

(assert (=> d!18261 (isStrictlySorted!281 (toList!721 (+!96 lt!34452 lt!34456)))))

(assert (=> d!18261 (= (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 lt!34456)) (_1!1079 lt!34463) (_2!1079 lt!34463)) lt!34888)))

(declare-fun b!76597 () Bool)

(assert (=> b!76597 (= e!50012 call!6930)))

(declare-fun b!76602 () Bool)

(assert (=> b!76602 (= e!50013 (ite c!11722 (t!5068 (toList!721 (+!96 lt!34452 lt!34456))) (ite c!11723 (Cons!1478 (h!2066 (toList!721 (+!96 lt!34452 lt!34456))) (t!5068 (toList!721 (+!96 lt!34452 lt!34456)))) Nil!1479)))))

(declare-fun b!76603 () Bool)

(declare-fun res!40273 () Bool)

(assert (=> b!76603 (=> (not res!40273) (not e!50009))))

(assert (=> b!76603 (= res!40273 (containsKey!139 lt!34888 (_1!1079 lt!34463)))))

(assert (= (and d!18261 c!11721) b!76598))

(assert (= (and d!18261 (not c!11721)) b!76601))

(assert (= (and b!76601 c!11722) b!76597))

(assert (= (and b!76601 (not c!11722)) b!76595))

(assert (= (and b!76595 c!11723) b!76599))

(assert (= (and b!76595 (not c!11723)) b!76596))

(assert (= (or b!76599 b!76596) bm!6925))

(assert (= (or b!76597 bm!6925) bm!6927))

(assert (= (or b!76598 bm!6927) bm!6926))

(assert (= (and bm!6926 c!11720) b!76600))

(assert (= (and bm!6926 (not c!11720)) b!76602))

(assert (= (and d!18261 res!40272) b!76603))

(assert (= (and b!76603 res!40273) b!76594))

(declare-fun m!76541 () Bool)

(assert (=> d!18261 m!76541))

(declare-fun m!76543 () Bool)

(assert (=> d!18261 m!76543))

(declare-fun m!76545 () Bool)

(assert (=> b!76600 m!76545))

(declare-fun m!76547 () Bool)

(assert (=> bm!6926 m!76547))

(declare-fun m!76549 () Bool)

(assert (=> b!76603 m!76549))

(declare-fun m!76551 () Bool)

(assert (=> b!76594 m!76551))

(assert (=> d!18161 d!18261))

(declare-fun b!76638 () Bool)

(declare-fun res!40299 () Bool)

(declare-fun e!50031 () Bool)

(assert (=> b!76638 (=> (not res!40299) (not e!50031))))

(declare-fun lt!34964 () SeekEntryResult!232)

(assert (=> b!76638 (= res!40299 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3061 lt!34964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76639 () Bool)

(declare-fun call!6942 () Bool)

(assert (=> b!76639 (= e!50031 (not call!6942))))

(declare-fun call!6939 () SeekEntryResult!232)

(declare-fun bm!6936 () Bool)

(assert (=> bm!6936 (= call!6939 (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun b!76641 () Bool)

(declare-fun e!50034 () Unit!2186)

(declare-fun Unit!2203 () Unit!2186)

(assert (=> b!76641 (= e!50034 Unit!2203)))

(declare-fun lt!34954 () Unit!2186)

(declare-fun lemmaArrayContainsKeyThenInListMap!15 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) (_ BitVec 32) Int) Unit!2186)

(assert (=> b!76641 (= lt!34954 (lemmaArrayContainsKeyThenInListMap!15 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(assert (=> b!76641 (contains!726 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))

(declare-fun lt!34978 () Unit!2186)

(assert (=> b!76641 (= lt!34978 lt!34954)))

(assert (=> b!76641 false))

(declare-fun b!76642 () Bool)

(declare-fun res!40300 () Bool)

(declare-fun e!50032 () Bool)

(assert (=> b!76642 (=> (not res!40300) (not e!50032))))

(declare-fun lt!34958 () tuple2!2134)

(assert (=> b!76642 (= res!40300 (contains!726 (map!1168 (_2!1078 lt!34958)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76643 () Bool)

(declare-fun e!50037 () Bool)

(declare-fun lt!34957 () SeekEntryResult!232)

(assert (=> b!76643 (= e!50037 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34957)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76644 () Bool)

(declare-fun e!50035 () Unit!2186)

(declare-fun lt!34963 () Unit!2186)

(assert (=> b!76644 (= e!50035 lt!34963)))

(assert (=> b!76644 (= lt!34963 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76644 (= lt!34964 call!6939)))

(declare-fun c!11734 () Bool)

(assert (=> b!76644 (= c!11734 ((_ is MissingZero!232) lt!34964))))

(declare-fun e!50033 () Bool)

(assert (=> b!76644 e!50033))

(declare-fun b!76645 () Bool)

(declare-fun e!50030 () Bool)

(declare-fun e!50036 () Bool)

(assert (=> b!76645 (= e!50030 e!50036)))

(declare-fun res!40298 () Bool)

(declare-fun call!6941 () Bool)

(assert (=> b!76645 (= res!40298 call!6941)))

(assert (=> b!76645 (=> (not res!40298) (not e!50036))))

(declare-fun b!76646 () Bool)

(declare-fun Unit!2204 () Unit!2186)

(assert (=> b!76646 (= e!50034 Unit!2204)))

(declare-fun b!76647 () Bool)

(assert (=> b!76647 (= e!50030 ((_ is Undefined!232) lt!34964))))

(declare-fun b!76648 () Bool)

(declare-fun Unit!2205 () Unit!2186)

(assert (=> b!76648 (= e!50035 Unit!2205)))

(declare-fun lt!34966 () Unit!2186)

(assert (=> b!76648 (= lt!34966 (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> b!76648 (= lt!34957 call!6939)))

(declare-fun res!40296 () Bool)

(assert (=> b!76648 (= res!40296 ((_ is Found!232) lt!34957))))

(assert (=> b!76648 (=> (not res!40296) (not e!50037))))

(assert (=> b!76648 e!50037))

(declare-fun lt!34973 () Unit!2186)

(assert (=> b!76648 (= lt!34973 lt!34966)))

(assert (=> b!76648 false))

(declare-fun bm!6937 () Bool)

(assert (=> bm!6937 (= call!6942 (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!18263 () Bool)

(assert (=> d!18263 e!50032))

(declare-fun res!40293 () Bool)

(assert (=> d!18263 (=> (not res!40293) (not e!50032))))

(assert (=> d!18263 (= res!40293 (_1!1078 lt!34958))))

(assert (=> d!18263 (= lt!34958 (tuple2!2135 true (LongMapFixedSize!707 (defaultEntry!2246 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (bvadd (_size!402 newMap!16) #b00000000000000000000000000000001) (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (_vacant!402 newMap!16))))))

(declare-fun lt!34960 () Unit!2186)

(declare-fun lt!34967 () Unit!2186)

(assert (=> d!18263 (= lt!34960 lt!34967)))

(declare-fun lt!34949 () array!3907)

(declare-fun lt!34965 () array!3905)

(assert (=> d!18263 (contains!726 (getCurrentListMap!418 lt!34965 lt!34949 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603))))))

(assert (=> d!18263 (= lt!34967 (lemmaValidKeyInArrayIsInListMap!86 lt!34965 lt!34949 (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18263 (= lt!34949 (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))))))

(assert (=> d!18263 (= lt!34965 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun lt!34959 () Unit!2186)

(declare-fun lt!34953 () Unit!2186)

(assert (=> d!18263 (= lt!34959 lt!34953)))

(declare-fun lt!34971 () array!3905)

(assert (=> d!18263 (= (arrayCountValidKeys!0 lt!34971 (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (bvadd (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3905 (_ BitVec 32)) Unit!2186)

(assert (=> d!18263 (= lt!34953 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!34971 (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603))))))

(assert (=> d!18263 (= lt!34971 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun lt!34970 () Unit!2186)

(declare-fun lt!34951 () Unit!2186)

(assert (=> d!18263 (= lt!34970 lt!34951)))

(declare-fun lt!34962 () array!3905)

(assert (=> d!18263 (arrayContainsKey!0 lt!34962 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!18263 (= lt!34951 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!34962 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603))))))

(assert (=> d!18263 (= lt!34962 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun lt!34974 () Unit!2186)

(declare-fun lt!34961 () Unit!2186)

(assert (=> d!18263 (= lt!34974 lt!34961)))

(assert (=> d!18263 (= (+!96 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (getCurrentListMap!418 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))) (array!3908 (store (arr!1863 (_values!2229 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (ValueCellFull!899 lt!34462)) (size!2103 (_values!2229 newMap!16))) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!15 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 32) (_ BitVec 64) V!2961 Int) Unit!2186)

(assert (=> d!18263 (= lt!34961 (lemmaAddValidKeyToArrayThenAddPairToListMap!15 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!34955 () Unit!2186)

(declare-fun lt!34972 () Unit!2186)

(assert (=> d!18263 (= lt!34955 lt!34972)))

(assert (=> d!18263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))) (mask!6229 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3905 (_ BitVec 32) (_ BitVec 32)) Unit!2186)

(assert (=> d!18263 (= lt!34972 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (mask!6229 newMap!16)))))

(declare-fun lt!34975 () Unit!2186)

(declare-fun lt!34968 () Unit!2186)

(assert (=> d!18263 (= lt!34975 lt!34968)))

(assert (=> d!18263 (= (arrayCountValidKeys!0 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))) #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3904 newMap!16) #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3905 (_ BitVec 32) (_ BitVec 64)) Unit!2186)

(assert (=> d!18263 (= lt!34968 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3904 newMap!16) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun lt!34969 () Unit!2186)

(declare-fun lt!34950 () Unit!2186)

(assert (=> d!18263 (= lt!34969 lt!34950)))

(declare-fun lt!34976 () List!1481)

(declare-fun lt!34977 () (_ BitVec 32))

(assert (=> d!18263 (arrayNoDuplicates!0 (array!3906 (store (arr!1862 (_keys!3904 newMap!16)) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (size!2102 (_keys!3904 newMap!16))) lt!34977 lt!34976)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3905 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1481) Unit!2186)

(assert (=> d!18263 (= lt!34950 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603)) lt!34977 lt!34976))))

(assert (=> d!18263 (= lt!34976 Nil!1478)))

(assert (=> d!18263 (= lt!34977 #b00000000000000000000000000000000)))

(declare-fun lt!34956 () Unit!2186)

(assert (=> d!18263 (= lt!34956 e!50034)))

(declare-fun c!11732 () Bool)

(assert (=> d!18263 (= c!11732 (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!34952 () Unit!2186)

(assert (=> d!18263 (= lt!34952 e!50035)))

(declare-fun c!11733 () Bool)

(assert (=> d!18263 (= c!11733 (contains!726 (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18263 (valid!312 newMap!16)))

(assert (=> d!18263 (= (updateHelperNewKey!26 newMap!16 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 (ite c!11602 (index!3064 lt!34603) (index!3061 lt!34603))) lt!34958)))

(declare-fun b!76640 () Bool)

(assert (=> b!76640 (= e!50032 (= (map!1168 (_2!1078 lt!34958)) (+!96 (map!1168 newMap!16) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun bm!6938 () Bool)

(declare-fun call!6940 () Bool)

(assert (=> bm!6938 (= call!6941 call!6940)))

(declare-fun b!76649 () Bool)

(declare-fun res!40297 () Bool)

(assert (=> b!76649 (= res!40297 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3064 lt!34964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76649 (=> (not res!40297) (not e!50036))))

(declare-fun b!76650 () Bool)

(declare-fun res!40292 () Bool)

(assert (=> b!76650 (= res!40292 call!6940)))

(assert (=> b!76650 (=> (not res!40292) (not e!50037))))

(declare-fun b!76651 () Bool)

(declare-fun c!11735 () Bool)

(assert (=> b!76651 (= c!11735 ((_ is MissingVacant!232) lt!34964))))

(assert (=> b!76651 (= e!50033 e!50030)))

(declare-fun b!76652 () Bool)

(declare-fun res!40295 () Bool)

(assert (=> b!76652 (=> (not res!40295) (not e!50031))))

(assert (=> b!76652 (= res!40295 call!6941)))

(assert (=> b!76652 (= e!50033 e!50031)))

(declare-fun b!76653 () Bool)

(declare-fun res!40294 () Bool)

(assert (=> b!76653 (=> (not res!40294) (not e!50032))))

(assert (=> b!76653 (= res!40294 (valid!312 (_2!1078 lt!34958)))))

(declare-fun b!76654 () Bool)

(assert (=> b!76654 (= e!50036 (not call!6942))))

(declare-fun bm!6939 () Bool)

(assert (=> bm!6939 (= call!6940 (inRange!0 (ite c!11733 (index!3062 lt!34957) (ite c!11734 (index!3061 lt!34964) (index!3064 lt!34964))) (mask!6229 newMap!16)))))

(assert (= (and d!18263 c!11733) b!76648))

(assert (= (and d!18263 (not c!11733)) b!76644))

(assert (= (and b!76648 res!40296) b!76650))

(assert (= (and b!76650 res!40292) b!76643))

(assert (= (and b!76644 c!11734) b!76652))

(assert (= (and b!76644 (not c!11734)) b!76651))

(assert (= (and b!76652 res!40295) b!76638))

(assert (= (and b!76638 res!40299) b!76639))

(assert (= (and b!76651 c!11735) b!76645))

(assert (= (and b!76651 (not c!11735)) b!76647))

(assert (= (and b!76645 res!40298) b!76649))

(assert (= (and b!76649 res!40297) b!76654))

(assert (= (or b!76652 b!76645) bm!6938))

(assert (= (or b!76639 b!76654) bm!6937))

(assert (= (or b!76650 bm!6938) bm!6939))

(assert (= (or b!76648 b!76644) bm!6936))

(assert (= (and d!18263 c!11732) b!76641))

(assert (= (and d!18263 (not c!11732)) b!76646))

(assert (= (and d!18263 res!40293) b!76653))

(assert (= (and b!76653 res!40294) b!76642))

(assert (= (and b!76642 res!40300) b!76640))

(assert (=> b!76644 m!75749))

(assert (=> b!76644 m!75975))

(declare-fun m!76553 () Bool)

(assert (=> b!76643 m!76553))

(declare-fun m!76555 () Bool)

(assert (=> b!76653 m!76555))

(declare-fun m!76557 () Bool)

(assert (=> bm!6939 m!76557))

(assert (=> bm!6936 m!75749))

(assert (=> bm!6936 m!75959))

(assert (=> b!76641 m!75749))

(declare-fun m!76559 () Bool)

(assert (=> b!76641 m!76559))

(assert (=> b!76641 m!75985))

(assert (=> b!76641 m!75985))

(assert (=> b!76641 m!75749))

(declare-fun m!76561 () Bool)

(assert (=> b!76641 m!76561))

(assert (=> b!76648 m!75749))

(assert (=> b!76648 m!75939))

(declare-fun m!76563 () Bool)

(assert (=> b!76638 m!76563))

(declare-fun m!76565 () Bool)

(assert (=> b!76642 m!76565))

(assert (=> b!76642 m!76565))

(assert (=> b!76642 m!75749))

(declare-fun m!76567 () Bool)

(assert (=> b!76642 m!76567))

(assert (=> b!76640 m!76565))

(assert (=> b!76640 m!75797))

(assert (=> b!76640 m!75797))

(declare-fun m!76569 () Bool)

(assert (=> b!76640 m!76569))

(assert (=> d!18263 m!75749))

(declare-fun m!76571 () Bool)

(assert (=> d!18263 m!76571))

(declare-fun m!76573 () Bool)

(assert (=> d!18263 m!76573))

(declare-fun m!76575 () Bool)

(assert (=> d!18263 m!76575))

(assert (=> d!18263 m!75749))

(declare-fun m!76577 () Bool)

(assert (=> d!18263 m!76577))

(declare-fun m!76579 () Bool)

(assert (=> d!18263 m!76579))

(assert (=> d!18263 m!75985))

(declare-fun m!76581 () Bool)

(assert (=> d!18263 m!76581))

(assert (=> d!18263 m!75749))

(declare-fun m!76583 () Bool)

(assert (=> d!18263 m!76583))

(assert (=> d!18263 m!75985))

(assert (=> d!18263 m!75749))

(assert (=> d!18263 m!76561))

(assert (=> d!18263 m!75749))

(declare-fun m!76585 () Bool)

(assert (=> d!18263 m!76585))

(declare-fun m!76587 () Bool)

(assert (=> d!18263 m!76587))

(assert (=> d!18263 m!75749))

(assert (=> d!18263 m!75971))

(assert (=> d!18263 m!75761))

(declare-fun m!76589 () Bool)

(assert (=> d!18263 m!76589))

(assert (=> d!18263 m!75985))

(assert (=> d!18263 m!76331))

(assert (=> d!18263 m!76581))

(assert (=> d!18263 m!76579))

(declare-fun m!76591 () Bool)

(assert (=> d!18263 m!76591))

(assert (=> d!18263 m!75749))

(declare-fun m!76593 () Bool)

(assert (=> d!18263 m!76593))

(declare-fun m!76595 () Bool)

(assert (=> d!18263 m!76595))

(assert (=> d!18263 m!75749))

(declare-fun m!76597 () Bool)

(assert (=> d!18263 m!76597))

(assert (=> d!18263 m!76143))

(declare-fun m!76599 () Bool)

(assert (=> d!18263 m!76599))

(declare-fun m!76601 () Bool)

(assert (=> d!18263 m!76601))

(declare-fun m!76603 () Bool)

(assert (=> d!18263 m!76603))

(declare-fun m!76605 () Bool)

(assert (=> d!18263 m!76605))

(assert (=> bm!6937 m!75749))

(assert (=> bm!6937 m!75971))

(declare-fun m!76607 () Bool)

(assert (=> b!76649 m!76607))

(assert (=> bm!6850 d!18263))

(declare-fun d!18265 () Bool)

(declare-fun lt!34979 () Bool)

(assert (=> d!18265 (= lt!34979 (select (content!82 (toList!721 lt!34740)) lt!34456))))

(declare-fun e!50039 () Bool)

(assert (=> d!18265 (= lt!34979 e!50039)))

(declare-fun res!40302 () Bool)

(assert (=> d!18265 (=> (not res!40302) (not e!50039))))

(assert (=> d!18265 (= res!40302 ((_ is Cons!1478) (toList!721 lt!34740)))))

(assert (=> d!18265 (= (contains!728 (toList!721 lt!34740) lt!34456) lt!34979)))

(declare-fun b!76655 () Bool)

(declare-fun e!50038 () Bool)

(assert (=> b!76655 (= e!50039 e!50038)))

(declare-fun res!40301 () Bool)

(assert (=> b!76655 (=> res!40301 e!50038)))

(assert (=> b!76655 (= res!40301 (= (h!2066 (toList!721 lt!34740)) lt!34456))))

(declare-fun b!76656 () Bool)

(assert (=> b!76656 (= e!50038 (contains!728 (t!5068 (toList!721 lt!34740)) lt!34456))))

(assert (= (and d!18265 res!40302) b!76655))

(assert (= (and b!76655 (not res!40301)) b!76656))

(declare-fun m!76609 () Bool)

(assert (=> d!18265 m!76609))

(declare-fun m!76611 () Bool)

(assert (=> d!18265 m!76611))

(declare-fun m!76613 () Bool)

(assert (=> b!76656 m!76613))

(assert (=> b!76323 d!18265))

(declare-fun d!18267 () Bool)

(declare-fun res!40303 () Bool)

(declare-fun e!50040 () Bool)

(assert (=> d!18267 (=> res!40303 e!50040)))

(assert (=> d!18267 (= res!40303 (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> d!18267 (= (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!50040)))

(declare-fun b!76657 () Bool)

(declare-fun e!50041 () Bool)

(assert (=> b!76657 (= e!50040 e!50041)))

(declare-fun res!40304 () Bool)

(assert (=> b!76657 (=> (not res!40304) (not e!50041))))

(assert (=> b!76657 (= res!40304 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76658 () Bool)

(assert (=> b!76658 (= e!50041 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!18267 (not res!40303)) b!76657))

(assert (= (and b!76657 res!40304) b!76658))

(assert (=> d!18267 m!76423))

(assert (=> b!76658 m!75749))

(declare-fun m!76615 () Bool)

(assert (=> b!76658 m!76615))

(assert (=> b!76342 d!18267))

(declare-fun d!18269 () Bool)

(declare-fun e!50042 () Bool)

(assert (=> d!18269 e!50042))

(declare-fun res!40305 () Bool)

(assert (=> d!18269 (=> res!40305 e!50042)))

(declare-fun lt!34982 () Bool)

(assert (=> d!18269 (= res!40305 (not lt!34982))))

(declare-fun lt!34980 () Bool)

(assert (=> d!18269 (= lt!34982 lt!34980)))

(declare-fun lt!34983 () Unit!2186)

(declare-fun e!50043 () Unit!2186)

(assert (=> d!18269 (= lt!34983 e!50043)))

(declare-fun c!11736 () Bool)

(assert (=> d!18269 (= c!11736 lt!34980)))

(assert (=> d!18269 (= lt!34980 (containsKey!139 (toList!721 lt!34692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18269 (= (contains!726 lt!34692 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34982)))

(declare-fun b!76659 () Bool)

(declare-fun lt!34981 () Unit!2186)

(assert (=> b!76659 (= e!50043 lt!34981)))

(assert (=> b!76659 (= lt!34981 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76659 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76660 () Bool)

(declare-fun Unit!2206 () Unit!2186)

(assert (=> b!76660 (= e!50043 Unit!2206)))

(declare-fun b!76661 () Bool)

(assert (=> b!76661 (= e!50042 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18269 c!11736) b!76659))

(assert (= (and d!18269 (not c!11736)) b!76660))

(assert (= (and d!18269 (not res!40305)) b!76661))

(declare-fun m!76617 () Bool)

(assert (=> d!18269 m!76617))

(declare-fun m!76619 () Bool)

(assert (=> b!76659 m!76619))

(declare-fun m!76621 () Bool)

(assert (=> b!76659 m!76621))

(assert (=> b!76659 m!76621))

(declare-fun m!76623 () Bool)

(assert (=> b!76659 m!76623))

(assert (=> b!76661 m!76621))

(assert (=> b!76661 m!76621))

(assert (=> b!76661 m!76623))

(assert (=> bm!6880 d!18269))

(declare-fun d!18271 () Bool)

(assert (=> d!18271 (= (apply!77 lt!34692 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1166 (getValueByKey!136 (toList!721 lt!34692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3280 () Bool)

(assert (= bs!3280 d!18271))

(assert (=> bs!3280 m!76621))

(assert (=> bs!3280 m!76621))

(declare-fun m!76625 () Bool)

(assert (=> bs!3280 m!76625))

(assert (=> b!76227 d!18271))

(declare-fun d!18273 () Bool)

(assert (=> d!18273 (= (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76277 d!18273))

(declare-fun d!18275 () Bool)

(declare-fun e!50044 () Bool)

(assert (=> d!18275 e!50044))

(declare-fun res!40306 () Bool)

(assert (=> d!18275 (=> res!40306 e!50044)))

(declare-fun lt!34986 () Bool)

(assert (=> d!18275 (= res!40306 (not lt!34986))))

(declare-fun lt!34984 () Bool)

(assert (=> d!18275 (= lt!34986 lt!34984)))

(declare-fun lt!34987 () Unit!2186)

(declare-fun e!50045 () Unit!2186)

(assert (=> d!18275 (= lt!34987 e!50045)))

(declare-fun c!11737 () Bool)

(assert (=> d!18275 (= c!11737 lt!34984)))

(assert (=> d!18275 (= lt!34984 (containsKey!139 (toList!721 lt!34744) (_1!1079 lt!34456)))))

(assert (=> d!18275 (= (contains!726 lt!34744 (_1!1079 lt!34456)) lt!34986)))

(declare-fun b!76662 () Bool)

(declare-fun lt!34985 () Unit!2186)

(assert (=> b!76662 (= e!50045 lt!34985)))

(assert (=> b!76662 (= lt!34985 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34744) (_1!1079 lt!34456)))))

(assert (=> b!76662 (isDefined!88 (getValueByKey!136 (toList!721 lt!34744) (_1!1079 lt!34456)))))

(declare-fun b!76663 () Bool)

(declare-fun Unit!2207 () Unit!2186)

(assert (=> b!76663 (= e!50045 Unit!2207)))

(declare-fun b!76664 () Bool)

(assert (=> b!76664 (= e!50044 (isDefined!88 (getValueByKey!136 (toList!721 lt!34744) (_1!1079 lt!34456))))))

(assert (= (and d!18275 c!11737) b!76662))

(assert (= (and d!18275 (not c!11737)) b!76663))

(assert (= (and d!18275 (not res!40306)) b!76664))

(declare-fun m!76627 () Bool)

(assert (=> d!18275 m!76627))

(declare-fun m!76629 () Bool)

(assert (=> b!76662 m!76629))

(assert (=> b!76662 m!76125))

(assert (=> b!76662 m!76125))

(declare-fun m!76631 () Bool)

(assert (=> b!76662 m!76631))

(assert (=> b!76664 m!76125))

(assert (=> b!76664 m!76125))

(assert (=> b!76664 m!76631))

(assert (=> d!18159 d!18275))

(declare-fun b!76666 () Bool)

(declare-fun e!50046 () Option!142)

(declare-fun e!50047 () Option!142)

(assert (=> b!76666 (= e!50046 e!50047)))

(declare-fun c!11739 () Bool)

(assert (=> b!76666 (= c!11739 (and ((_ is Cons!1478) lt!34747) (not (= (_1!1079 (h!2066 lt!34747)) (_1!1079 lt!34456)))))))

(declare-fun b!76667 () Bool)

(assert (=> b!76667 (= e!50047 (getValueByKey!136 (t!5068 lt!34747) (_1!1079 lt!34456)))))

(declare-fun b!76665 () Bool)

(assert (=> b!76665 (= e!50046 (Some!141 (_2!1079 (h!2066 lt!34747))))))

(declare-fun b!76668 () Bool)

(assert (=> b!76668 (= e!50047 None!140)))

(declare-fun d!18277 () Bool)

(declare-fun c!11738 () Bool)

(assert (=> d!18277 (= c!11738 (and ((_ is Cons!1478) lt!34747) (= (_1!1079 (h!2066 lt!34747)) (_1!1079 lt!34456))))))

(assert (=> d!18277 (= (getValueByKey!136 lt!34747 (_1!1079 lt!34456)) e!50046)))

(assert (= (and d!18277 c!11738) b!76665))

(assert (= (and d!18277 (not c!11738)) b!76666))

(assert (= (and b!76666 c!11739) b!76667))

(assert (= (and b!76666 (not c!11739)) b!76668))

(declare-fun m!76633 () Bool)

(assert (=> b!76667 m!76633))

(assert (=> d!18159 d!18277))

(declare-fun d!18279 () Bool)

(assert (=> d!18279 (= (getValueByKey!136 lt!34747 (_1!1079 lt!34456)) (Some!141 (_2!1079 lt!34456)))))

(declare-fun lt!34988 () Unit!2186)

(assert (=> d!18279 (= lt!34988 (choose!448 lt!34747 (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(declare-fun e!50048 () Bool)

(assert (=> d!18279 e!50048))

(declare-fun res!40307 () Bool)

(assert (=> d!18279 (=> (not res!40307) (not e!50048))))

(assert (=> d!18279 (= res!40307 (isStrictlySorted!281 lt!34747))))

(assert (=> d!18279 (= (lemmaContainsTupThenGetReturnValue!53 lt!34747 (_1!1079 lt!34456) (_2!1079 lt!34456)) lt!34988)))

(declare-fun b!76669 () Bool)

(declare-fun res!40308 () Bool)

(assert (=> b!76669 (=> (not res!40308) (not e!50048))))

(assert (=> b!76669 (= res!40308 (containsKey!139 lt!34747 (_1!1079 lt!34456)))))

(declare-fun b!76670 () Bool)

(assert (=> b!76670 (= e!50048 (contains!728 lt!34747 (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456))))))

(assert (= (and d!18279 res!40307) b!76669))

(assert (= (and b!76669 res!40308) b!76670))

(assert (=> d!18279 m!76119))

(declare-fun m!76635 () Bool)

(assert (=> d!18279 m!76635))

(declare-fun m!76637 () Bool)

(assert (=> d!18279 m!76637))

(declare-fun m!76639 () Bool)

(assert (=> b!76669 m!76639))

(declare-fun m!76641 () Bool)

(assert (=> b!76670 m!76641))

(assert (=> d!18159 d!18279))

(declare-fun b!76671 () Bool)

(declare-fun e!50049 () Bool)

(declare-fun lt!34989 () List!1482)

(assert (=> b!76671 (= e!50049 (contains!728 lt!34989 (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456))))))

(declare-fun bm!6940 () Bool)

(declare-fun call!6944 () List!1482)

(declare-fun call!6945 () List!1482)

(assert (=> bm!6940 (= call!6944 call!6945)))

(declare-fun b!76672 () Bool)

(declare-fun c!11743 () Bool)

(assert (=> b!76672 (= c!11743 (and ((_ is Cons!1478) (toList!721 lt!34452)) (bvsgt (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34456))))))

(declare-fun e!50052 () List!1482)

(declare-fun e!50050 () List!1482)

(assert (=> b!76672 (= e!50052 e!50050)))

(declare-fun b!76673 () Bool)

(assert (=> b!76673 (= e!50050 call!6944)))

(declare-fun bm!6941 () Bool)

(declare-fun c!11741 () Bool)

(declare-fun call!6943 () List!1482)

(declare-fun e!50053 () List!1482)

(assert (=> bm!6941 (= call!6943 ($colon$colon!67 e!50053 (ite c!11741 (h!2066 (toList!721 lt!34452)) (tuple2!2137 (_1!1079 lt!34456) (_2!1079 lt!34456)))))))

(declare-fun c!11740 () Bool)

(assert (=> bm!6941 (= c!11740 c!11741)))

(declare-fun b!76675 () Bool)

(declare-fun e!50051 () List!1482)

(assert (=> b!76675 (= e!50051 call!6943)))

(declare-fun b!76676 () Bool)

(assert (=> b!76676 (= e!50050 call!6944)))

(declare-fun b!76677 () Bool)

(assert (=> b!76677 (= e!50053 (insertStrictlySorted!56 (t!5068 (toList!721 lt!34452)) (_1!1079 lt!34456) (_2!1079 lt!34456)))))

(declare-fun b!76678 () Bool)

(assert (=> b!76678 (= e!50051 e!50052)))

(declare-fun c!11742 () Bool)

(assert (=> b!76678 (= c!11742 (and ((_ is Cons!1478) (toList!721 lt!34452)) (= (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34456))))))

(declare-fun bm!6942 () Bool)

(assert (=> bm!6942 (= call!6945 call!6943)))

(declare-fun d!18281 () Bool)

(assert (=> d!18281 e!50049))

(declare-fun res!40309 () Bool)

(assert (=> d!18281 (=> (not res!40309) (not e!50049))))

(assert (=> d!18281 (= res!40309 (isStrictlySorted!281 lt!34989))))

(assert (=> d!18281 (= lt!34989 e!50051)))

(assert (=> d!18281 (= c!11741 (and ((_ is Cons!1478) (toList!721 lt!34452)) (bvslt (_1!1079 (h!2066 (toList!721 lt!34452))) (_1!1079 lt!34456))))))

(assert (=> d!18281 (isStrictlySorted!281 (toList!721 lt!34452))))

(assert (=> d!18281 (= (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 lt!34456) (_2!1079 lt!34456)) lt!34989)))

(declare-fun b!76674 () Bool)

(assert (=> b!76674 (= e!50052 call!6945)))

(declare-fun b!76679 () Bool)

(assert (=> b!76679 (= e!50053 (ite c!11742 (t!5068 (toList!721 lt!34452)) (ite c!11743 (Cons!1478 (h!2066 (toList!721 lt!34452)) (t!5068 (toList!721 lt!34452))) Nil!1479)))))

(declare-fun b!76680 () Bool)

(declare-fun res!40310 () Bool)

(assert (=> b!76680 (=> (not res!40310) (not e!50049))))

(assert (=> b!76680 (= res!40310 (containsKey!139 lt!34989 (_1!1079 lt!34456)))))

(assert (= (and d!18281 c!11741) b!76675))

(assert (= (and d!18281 (not c!11741)) b!76678))

(assert (= (and b!76678 c!11742) b!76674))

(assert (= (and b!76678 (not c!11742)) b!76672))

(assert (= (and b!76672 c!11743) b!76676))

(assert (= (and b!76672 (not c!11743)) b!76673))

(assert (= (or b!76676 b!76673) bm!6940))

(assert (= (or b!76674 bm!6940) bm!6942))

(assert (= (or b!76675 bm!6942) bm!6941))

(assert (= (and bm!6941 c!11740) b!76677))

(assert (= (and bm!6941 (not c!11740)) b!76679))

(assert (= (and d!18281 res!40309) b!76680))

(assert (= (and b!76680 res!40310) b!76671))

(declare-fun m!76643 () Bool)

(assert (=> d!18281 m!76643))

(assert (=> d!18281 m!76465))

(declare-fun m!76645 () Bool)

(assert (=> b!76677 m!76645))

(declare-fun m!76647 () Bool)

(assert (=> bm!6941 m!76647))

(declare-fun m!76649 () Bool)

(assert (=> b!76680 m!76649))

(declare-fun m!76651 () Bool)

(assert (=> b!76671 m!76651))

(assert (=> d!18159 d!18281))

(assert (=> b!76279 d!18273))

(declare-fun d!18283 () Bool)

(assert (=> d!18283 (= (inRange!0 (ite c!11599 (ite c!11592 (index!3062 lt!34626) (ite c!11600 (index!3061 lt!34627) (index!3064 lt!34627))) (ite c!11601 (index!3062 lt!34609) (ite c!11595 (index!3061 lt!34605) (index!3064 lt!34605)))) (mask!6229 newMap!16)) (and (bvsge (ite c!11599 (ite c!11592 (index!3062 lt!34626) (ite c!11600 (index!3061 lt!34627) (index!3064 lt!34627))) (ite c!11601 (index!3062 lt!34609) (ite c!11595 (index!3061 lt!34605) (index!3064 lt!34605)))) #b00000000000000000000000000000000) (bvslt (ite c!11599 (ite c!11592 (index!3062 lt!34626) (ite c!11600 (index!3061 lt!34627) (index!3064 lt!34627))) (ite c!11601 (index!3062 lt!34609) (ite c!11595 (index!3061 lt!34605) (index!3064 lt!34605)))) (bvadd (mask!6229 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6849 d!18283))

(declare-fun d!18285 () Bool)

(declare-fun res!40315 () Bool)

(declare-fun e!50058 () Bool)

(assert (=> d!18285 (=> res!40315 e!50058)))

(assert (=> d!18285 (= res!40315 (and ((_ is Cons!1478) (toList!721 lt!34453)) (= (_1!1079 (h!2066 (toList!721 lt!34453))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (=> d!18285 (= (containsKey!139 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) e!50058)))

(declare-fun b!76685 () Bool)

(declare-fun e!50059 () Bool)

(assert (=> b!76685 (= e!50058 e!50059)))

(declare-fun res!40316 () Bool)

(assert (=> b!76685 (=> (not res!40316) (not e!50059))))

(assert (=> b!76685 (= res!40316 (and (or (not ((_ is Cons!1478) (toList!721 lt!34453))) (bvsle (_1!1079 (h!2066 (toList!721 lt!34453))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))) ((_ is Cons!1478) (toList!721 lt!34453)) (bvslt (_1!1079 (h!2066 (toList!721 lt!34453))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(declare-fun b!76686 () Bool)

(assert (=> b!76686 (= e!50059 (containsKey!139 (t!5068 (toList!721 lt!34453)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (= (and d!18285 (not res!40315)) b!76685))

(assert (= (and b!76685 res!40316) b!76686))

(assert (=> b!76686 m!75749))

(declare-fun m!76653 () Bool)

(assert (=> b!76686 m!76653))

(assert (=> d!18125 d!18285))

(declare-fun d!18287 () Bool)

(declare-fun lt!34992 () Bool)

(declare-fun content!83 (List!1481) (InoxSet (_ BitVec 64)))

(assert (=> d!18287 (= lt!34992 (select (content!83 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!50065 () Bool)

(assert (=> d!18287 (= lt!34992 e!50065)))

(declare-fun res!40321 () Bool)

(assert (=> d!18287 (=> (not res!40321) (not e!50065))))

(assert (=> d!18287 (= res!40321 ((_ is Cons!1477) Nil!1478))))

(assert (=> d!18287 (= (contains!727 Nil!1478 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)) lt!34992)))

(declare-fun b!76691 () Bool)

(declare-fun e!50064 () Bool)

(assert (=> b!76691 (= e!50065 e!50064)))

(declare-fun res!40322 () Bool)

(assert (=> b!76691 (=> res!40322 e!50064)))

(assert (=> b!76691 (= res!40322 (= (h!2065 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76692 () Bool)

(assert (=> b!76692 (= e!50064 (contains!727 (t!5067 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!18287 res!40321) b!76691))

(assert (= (and b!76691 (not res!40322)) b!76692))

(declare-fun m!76655 () Bool)

(assert (=> d!18287 m!76655))

(assert (=> d!18287 m!76041))

(declare-fun m!76657 () Bool)

(assert (=> d!18287 m!76657))

(assert (=> b!76692 m!76041))

(declare-fun m!76659 () Bool)

(assert (=> b!76692 m!76659))

(assert (=> b!76275 d!18287))

(declare-fun d!18289 () Bool)

(declare-fun e!50066 () Bool)

(assert (=> d!18289 e!50066))

(declare-fun res!40323 () Bool)

(assert (=> d!18289 (=> res!40323 e!50066)))

(declare-fun lt!34995 () Bool)

(assert (=> d!18289 (= res!40323 (not lt!34995))))

(declare-fun lt!34993 () Bool)

(assert (=> d!18289 (= lt!34995 lt!34993)))

(declare-fun lt!34996 () Unit!2186)

(declare-fun e!50067 () Unit!2186)

(assert (=> d!18289 (= lt!34996 e!50067)))

(declare-fun c!11744 () Bool)

(assert (=> d!18289 (= c!11744 lt!34993)))

(assert (=> d!18289 (= lt!34993 (containsKey!139 (toList!721 lt!34692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18289 (= (contains!726 lt!34692 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34995)))

(declare-fun b!76693 () Bool)

(declare-fun lt!34994 () Unit!2186)

(assert (=> b!76693 (= e!50067 lt!34994)))

(assert (=> b!76693 (= lt!34994 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76693 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76694 () Bool)

(declare-fun Unit!2208 () Unit!2186)

(assert (=> b!76694 (= e!50067 Unit!2208)))

(declare-fun b!76695 () Bool)

(assert (=> b!76695 (= e!50066 (isDefined!88 (getValueByKey!136 (toList!721 lt!34692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18289 c!11744) b!76693))

(assert (= (and d!18289 (not c!11744)) b!76694))

(assert (= (and d!18289 (not res!40323)) b!76695))

(declare-fun m!76661 () Bool)

(assert (=> d!18289 m!76661))

(declare-fun m!76663 () Bool)

(assert (=> b!76693 m!76663))

(declare-fun m!76665 () Bool)

(assert (=> b!76693 m!76665))

(assert (=> b!76693 m!76665))

(declare-fun m!76667 () Bool)

(assert (=> b!76693 m!76667))

(assert (=> b!76695 m!76665))

(assert (=> b!76695 m!76665))

(assert (=> b!76695 m!76667))

(assert (=> bm!6879 d!18289))

(assert (=> b!76316 d!18229))

(declare-fun d!18291 () Bool)

(declare-fun lt!34997 () Bool)

(assert (=> d!18291 (= lt!34997 (select (content!82 (toList!721 lt!34712)) lt!34463))))

(declare-fun e!50069 () Bool)

(assert (=> d!18291 (= lt!34997 e!50069)))

(declare-fun res!40325 () Bool)

(assert (=> d!18291 (=> (not res!40325) (not e!50069))))

(assert (=> d!18291 (= res!40325 ((_ is Cons!1478) (toList!721 lt!34712)))))

(assert (=> d!18291 (= (contains!728 (toList!721 lt!34712) lt!34463) lt!34997)))

(declare-fun b!76696 () Bool)

(declare-fun e!50068 () Bool)

(assert (=> b!76696 (= e!50069 e!50068)))

(declare-fun res!40324 () Bool)

(assert (=> b!76696 (=> res!40324 e!50068)))

(assert (=> b!76696 (= res!40324 (= (h!2066 (toList!721 lt!34712)) lt!34463))))

(declare-fun b!76697 () Bool)

(assert (=> b!76697 (= e!50068 (contains!728 (t!5068 (toList!721 lt!34712)) lt!34463))))

(assert (= (and d!18291 res!40325) b!76696))

(assert (= (and b!76696 (not res!40324)) b!76697))

(declare-fun m!76669 () Bool)

(assert (=> d!18291 m!76669))

(declare-fun m!76671 () Bool)

(assert (=> d!18291 m!76671))

(declare-fun m!76673 () Bool)

(assert (=> b!76697 m!76673))

(assert (=> b!76285 d!18291))

(assert (=> b!76239 d!18151))

(declare-fun d!18293 () Bool)

(declare-fun e!50070 () Bool)

(assert (=> d!18293 e!50070))

(declare-fun res!40327 () Bool)

(assert (=> d!18293 (=> (not res!40327) (not e!50070))))

(declare-fun lt!34998 () ListLongMap!1411)

(assert (=> d!18293 (= res!40327 (contains!726 lt!34998 (_1!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35001 () List!1482)

(assert (=> d!18293 (= lt!34998 (ListLongMap!1412 lt!35001))))

(declare-fun lt!35000 () Unit!2186)

(declare-fun lt!34999 () Unit!2186)

(assert (=> d!18293 (= lt!35000 lt!34999)))

(assert (=> d!18293 (= (getValueByKey!136 lt!35001 (_1!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18293 (= lt!34999 (lemmaContainsTupThenGetReturnValue!53 lt!35001 (_1!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18293 (= lt!35001 (insertStrictlySorted!56 (toList!721 lt!34675) (_1!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18293 (= (+!96 lt!34675 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34998)))

(declare-fun b!76698 () Bool)

(declare-fun res!40326 () Bool)

(assert (=> b!76698 (=> (not res!40326) (not e!50070))))

(assert (=> b!76698 (= res!40326 (= (getValueByKey!136 (toList!721 lt!34998) (_1!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76699 () Bool)

(assert (=> b!76699 (= e!50070 (contains!728 (toList!721 lt!34998) (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18293 res!40327) b!76698))

(assert (= (and b!76698 res!40326) b!76699))

(declare-fun m!76675 () Bool)

(assert (=> d!18293 m!76675))

(declare-fun m!76677 () Bool)

(assert (=> d!18293 m!76677))

(declare-fun m!76679 () Bool)

(assert (=> d!18293 m!76679))

(declare-fun m!76681 () Bool)

(assert (=> d!18293 m!76681))

(declare-fun m!76683 () Bool)

(assert (=> b!76698 m!76683))

(declare-fun m!76685 () Bool)

(assert (=> b!76699 m!76685))

(assert (=> b!76239 d!18293))

(declare-fun d!18295 () Bool)

(assert (=> d!18295 (= (apply!77 (+!96 lt!34678 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34691) (apply!77 lt!34678 lt!34691))))

(declare-fun lt!35004 () Unit!2186)

(declare-fun choose!452 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> d!18295 (= lt!35004 (choose!452 lt!34678 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34691))))

(declare-fun e!50073 () Bool)

(assert (=> d!18295 e!50073))

(declare-fun res!40330 () Bool)

(assert (=> d!18295 (=> (not res!40330) (not e!50073))))

(assert (=> d!18295 (= res!40330 (contains!726 lt!34678 lt!34691))))

(assert (=> d!18295 (= (addApplyDifferent!53 lt!34678 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34691) lt!35004)))

(declare-fun b!76703 () Bool)

(assert (=> b!76703 (= e!50073 (not (= lt!34691 lt!34684)))))

(assert (= (and d!18295 res!40330) b!76703))

(declare-fun m!76687 () Bool)

(assert (=> d!18295 m!76687))

(declare-fun m!76689 () Bool)

(assert (=> d!18295 m!76689))

(assert (=> d!18295 m!75999))

(assert (=> d!18295 m!76001))

(assert (=> d!18295 m!75999))

(assert (=> d!18295 m!76011))

(assert (=> b!76239 d!18295))

(declare-fun d!18297 () Bool)

(declare-fun e!50074 () Bool)

(assert (=> d!18297 e!50074))

(declare-fun res!40332 () Bool)

(assert (=> d!18297 (=> (not res!40332) (not e!50074))))

(declare-fun lt!35005 () ListLongMap!1411)

(assert (=> d!18297 (= res!40332 (contains!726 lt!35005 (_1!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35008 () List!1482)

(assert (=> d!18297 (= lt!35005 (ListLongMap!1412 lt!35008))))

(declare-fun lt!35007 () Unit!2186)

(declare-fun lt!35006 () Unit!2186)

(assert (=> d!18297 (= lt!35007 lt!35006)))

(assert (=> d!18297 (= (getValueByKey!136 lt!35008 (_1!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18297 (= lt!35006 (lemmaContainsTupThenGetReturnValue!53 lt!35008 (_1!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18297 (= lt!35008 (insertStrictlySorted!56 (toList!721 lt!34677) (_1!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18297 (= (+!96 lt!34677 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!35005)))

(declare-fun b!76704 () Bool)

(declare-fun res!40331 () Bool)

(assert (=> b!76704 (=> (not res!40331) (not e!50074))))

(assert (=> b!76704 (= res!40331 (= (getValueByKey!136 (toList!721 lt!35005) (_1!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76705 () Bool)

(assert (=> b!76705 (= e!50074 (contains!728 (toList!721 lt!35005) (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18297 res!40332) b!76704))

(assert (= (and b!76704 res!40331) b!76705))

(declare-fun m!76691 () Bool)

(assert (=> d!18297 m!76691))

(declare-fun m!76693 () Bool)

(assert (=> d!18297 m!76693))

(declare-fun m!76695 () Bool)

(assert (=> d!18297 m!76695))

(declare-fun m!76697 () Bool)

(assert (=> d!18297 m!76697))

(declare-fun m!76699 () Bool)

(assert (=> b!76704 m!76699))

(declare-fun m!76701 () Bool)

(assert (=> b!76705 m!76701))

(assert (=> b!76239 d!18297))

(declare-fun d!18299 () Bool)

(declare-fun e!50075 () Bool)

(assert (=> d!18299 e!50075))

(declare-fun res!40333 () Bool)

(assert (=> d!18299 (=> res!40333 e!50075)))

(declare-fun lt!35011 () Bool)

(assert (=> d!18299 (= res!40333 (not lt!35011))))

(declare-fun lt!35009 () Bool)

(assert (=> d!18299 (= lt!35011 lt!35009)))

(declare-fun lt!35012 () Unit!2186)

(declare-fun e!50076 () Unit!2186)

(assert (=> d!18299 (= lt!35012 e!50076)))

(declare-fun c!11745 () Bool)

(assert (=> d!18299 (= c!11745 lt!35009)))

(assert (=> d!18299 (= lt!35009 (containsKey!139 (toList!721 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34680))))

(assert (=> d!18299 (= (contains!726 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34680) lt!35011)))

(declare-fun b!76706 () Bool)

(declare-fun lt!35010 () Unit!2186)

(assert (=> b!76706 (= e!50076 lt!35010)))

(assert (=> b!76706 (= lt!35010 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34680))))

(assert (=> b!76706 (isDefined!88 (getValueByKey!136 (toList!721 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34680))))

(declare-fun b!76707 () Bool)

(declare-fun Unit!2209 () Unit!2186)

(assert (=> b!76707 (= e!50076 Unit!2209)))

(declare-fun b!76708 () Bool)

(assert (=> b!76708 (= e!50075 (isDefined!88 (getValueByKey!136 (toList!721 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34680)))))

(assert (= (and d!18299 c!11745) b!76706))

(assert (= (and d!18299 (not c!11745)) b!76707))

(assert (= (and d!18299 (not res!40333)) b!76708))

(declare-fun m!76703 () Bool)

(assert (=> d!18299 m!76703))

(declare-fun m!76705 () Bool)

(assert (=> b!76706 m!76705))

(declare-fun m!76707 () Bool)

(assert (=> b!76706 m!76707))

(assert (=> b!76706 m!76707))

(declare-fun m!76709 () Bool)

(assert (=> b!76706 m!76709))

(assert (=> b!76708 m!76707))

(assert (=> b!76708 m!76707))

(assert (=> b!76708 m!76709))

(assert (=> b!76239 d!18299))

(declare-fun d!18301 () Bool)

(declare-fun e!50077 () Bool)

(assert (=> d!18301 e!50077))

(declare-fun res!40335 () Bool)

(assert (=> d!18301 (=> (not res!40335) (not e!50077))))

(declare-fun lt!35013 () ListLongMap!1411)

(assert (=> d!18301 (= res!40335 (contains!726 lt!35013 (_1!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35016 () List!1482)

(assert (=> d!18301 (= lt!35013 (ListLongMap!1412 lt!35016))))

(declare-fun lt!35015 () Unit!2186)

(declare-fun lt!35014 () Unit!2186)

(assert (=> d!18301 (= lt!35015 lt!35014)))

(assert (=> d!18301 (= (getValueByKey!136 lt!35016 (_1!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18301 (= lt!35014 (lemmaContainsTupThenGetReturnValue!53 lt!35016 (_1!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18301 (= lt!35016 (insertStrictlySorted!56 (toList!721 lt!34678) (_1!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18301 (= (+!96 lt!34678 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!35013)))

(declare-fun b!76709 () Bool)

(declare-fun res!40334 () Bool)

(assert (=> b!76709 (=> (not res!40334) (not e!50077))))

(assert (=> b!76709 (= res!40334 (= (getValueByKey!136 (toList!721 lt!35013) (_1!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76710 () Bool)

(assert (=> b!76710 (= e!50077 (contains!728 (toList!721 lt!35013) (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18301 res!40335) b!76709))

(assert (= (and b!76709 res!40334) b!76710))

(declare-fun m!76711 () Bool)

(assert (=> d!18301 m!76711))

(declare-fun m!76713 () Bool)

(assert (=> d!18301 m!76713))

(declare-fun m!76715 () Bool)

(assert (=> d!18301 m!76715))

(declare-fun m!76717 () Bool)

(assert (=> d!18301 m!76717))

(declare-fun m!76719 () Bool)

(assert (=> b!76709 m!76719))

(declare-fun m!76721 () Bool)

(assert (=> b!76710 m!76721))

(assert (=> b!76239 d!18301))

(declare-fun d!18303 () Bool)

(declare-fun e!50078 () Bool)

(assert (=> d!18303 e!50078))

(declare-fun res!40337 () Bool)

(assert (=> d!18303 (=> (not res!40337) (not e!50078))))

(declare-fun lt!35017 () ListLongMap!1411)

(assert (=> d!18303 (= res!40337 (contains!726 lt!35017 (_1!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35020 () List!1482)

(assert (=> d!18303 (= lt!35017 (ListLongMap!1412 lt!35020))))

(declare-fun lt!35019 () Unit!2186)

(declare-fun lt!35018 () Unit!2186)

(assert (=> d!18303 (= lt!35019 lt!35018)))

(assert (=> d!18303 (= (getValueByKey!136 lt!35020 (_1!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18303 (= lt!35018 (lemmaContainsTupThenGetReturnValue!53 lt!35020 (_1!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18303 (= lt!35020 (insertStrictlySorted!56 (toList!721 lt!34682) (_1!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18303 (= (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!35017)))

(declare-fun b!76711 () Bool)

(declare-fun res!40336 () Bool)

(assert (=> b!76711 (=> (not res!40336) (not e!50078))))

(assert (=> b!76711 (= res!40336 (= (getValueByKey!136 (toList!721 lt!35017) (_1!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76712 () Bool)

(assert (=> b!76712 (= e!50078 (contains!728 (toList!721 lt!35017) (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18303 res!40337) b!76711))

(assert (= (and b!76711 res!40336) b!76712))

(declare-fun m!76723 () Bool)

(assert (=> d!18303 m!76723))

(declare-fun m!76725 () Bool)

(assert (=> d!18303 m!76725))

(declare-fun m!76727 () Bool)

(assert (=> d!18303 m!76727))

(declare-fun m!76729 () Bool)

(assert (=> d!18303 m!76729))

(declare-fun m!76731 () Bool)

(assert (=> b!76711 m!76731))

(declare-fun m!76733 () Bool)

(assert (=> b!76712 m!76733))

(assert (=> b!76239 d!18303))

(declare-fun d!18305 () Bool)

(assert (=> d!18305 (= (apply!77 lt!34678 lt!34691) (get!1166 (getValueByKey!136 (toList!721 lt!34678) lt!34691)))))

(declare-fun bs!3281 () Bool)

(assert (= bs!3281 d!18305))

(declare-fun m!76735 () Bool)

(assert (=> bs!3281 m!76735))

(assert (=> bs!3281 m!76735))

(declare-fun m!76737 () Bool)

(assert (=> bs!3281 m!76737))

(assert (=> b!76239 d!18305))

(declare-fun d!18307 () Bool)

(assert (=> d!18307 (= (apply!77 (+!96 lt!34677 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34694) (apply!77 lt!34677 lt!34694))))

(declare-fun lt!35021 () Unit!2186)

(assert (=> d!18307 (= lt!35021 (choose!452 lt!34677 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34694))))

(declare-fun e!50079 () Bool)

(assert (=> d!18307 e!50079))

(declare-fun res!40338 () Bool)

(assert (=> d!18307 (=> (not res!40338) (not e!50079))))

(assert (=> d!18307 (= res!40338 (contains!726 lt!34677 lt!34694))))

(assert (=> d!18307 (= (addApplyDifferent!53 lt!34677 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34694) lt!35021)))

(declare-fun b!76713 () Bool)

(assert (=> b!76713 (= e!50079 (not (= lt!34694 lt!34673)))))

(assert (= (and d!18307 res!40338) b!76713))

(declare-fun m!76739 () Bool)

(assert (=> d!18307 m!76739))

(declare-fun m!76741 () Bool)

(assert (=> d!18307 m!76741))

(assert (=> d!18307 m!76019))

(assert (=> d!18307 m!76021))

(assert (=> d!18307 m!76019))

(assert (=> d!18307 m!76003))

(assert (=> b!76239 d!18307))

(declare-fun d!18309 () Bool)

(assert (=> d!18309 (= (apply!77 lt!34677 lt!34694) (get!1166 (getValueByKey!136 (toList!721 lt!34677) lt!34694)))))

(declare-fun bs!3282 () Bool)

(assert (= bs!3282 d!18309))

(declare-fun m!76743 () Bool)

(assert (=> bs!3282 m!76743))

(assert (=> bs!3282 m!76743))

(declare-fun m!76745 () Bool)

(assert (=> bs!3282 m!76745))

(assert (=> b!76239 d!18309))

(declare-fun d!18311 () Bool)

(assert (=> d!18311 (= (apply!77 lt!34675 lt!34689) (get!1166 (getValueByKey!136 (toList!721 lt!34675) lt!34689)))))

(declare-fun bs!3283 () Bool)

(assert (= bs!3283 d!18311))

(declare-fun m!76747 () Bool)

(assert (=> bs!3283 m!76747))

(assert (=> bs!3283 m!76747))

(declare-fun m!76749 () Bool)

(assert (=> bs!3283 m!76749))

(assert (=> b!76239 d!18311))

(declare-fun d!18313 () Bool)

(assert (=> d!18313 (= (apply!77 (+!96 lt!34677 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34694) (get!1166 (getValueByKey!136 (toList!721 (+!96 lt!34677 (tuple2!2137 lt!34673 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34694)))))

(declare-fun bs!3284 () Bool)

(assert (= bs!3284 d!18313))

(declare-fun m!76751 () Bool)

(assert (=> bs!3284 m!76751))

(assert (=> bs!3284 m!76751))

(declare-fun m!76753 () Bool)

(assert (=> bs!3284 m!76753))

(assert (=> b!76239 d!18313))

(declare-fun d!18315 () Bool)

(assert (=> d!18315 (= (apply!77 (+!96 lt!34678 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34691) (get!1166 (getValueByKey!136 (toList!721 (+!96 lt!34678 (tuple2!2137 lt!34684 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34691)))))

(declare-fun bs!3285 () Bool)

(assert (= bs!3285 d!18315))

(declare-fun m!76755 () Bool)

(assert (=> bs!3285 m!76755))

(assert (=> bs!3285 m!76755))

(declare-fun m!76757 () Bool)

(assert (=> bs!3285 m!76757))

(assert (=> b!76239 d!18315))

(declare-fun d!18317 () Bool)

(assert (=> d!18317 (= (apply!77 (+!96 lt!34675 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34689) (get!1166 (getValueByKey!136 (toList!721 (+!96 lt!34675 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!34689)))))

(declare-fun bs!3286 () Bool)

(assert (= bs!3286 d!18317))

(declare-fun m!76759 () Bool)

(assert (=> bs!3286 m!76759))

(assert (=> bs!3286 m!76759))

(declare-fun m!76761 () Bool)

(assert (=> bs!3286 m!76761))

(assert (=> b!76239 d!18317))

(declare-fun d!18319 () Bool)

(assert (=> d!18319 (= (apply!77 (+!96 lt!34675 (tuple2!2137 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34689) (apply!77 lt!34675 lt!34689))))

(declare-fun lt!35022 () Unit!2186)

(assert (=> d!18319 (= lt!35022 (choose!452 lt!34675 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34689))))

(declare-fun e!50080 () Bool)

(assert (=> d!18319 e!50080))

(declare-fun res!40339 () Bool)

(assert (=> d!18319 (=> (not res!40339) (not e!50080))))

(assert (=> d!18319 (= res!40339 (contains!726 lt!34675 lt!34689))))

(assert (=> d!18319 (= (addApplyDifferent!53 lt!34675 lt!34679 (minValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34689) lt!35022)))

(declare-fun b!76714 () Bool)

(assert (=> b!76714 (= e!50080 (not (= lt!34689 lt!34679)))))

(assert (= (and d!18319 res!40339) b!76714))

(declare-fun m!76763 () Bool)

(assert (=> d!18319 m!76763))

(declare-fun m!76765 () Bool)

(assert (=> d!18319 m!76765))

(assert (=> d!18319 m!76023))

(assert (=> d!18319 m!76025))

(assert (=> d!18319 m!76023))

(assert (=> d!18319 m!76013))

(assert (=> b!76239 d!18319))

(declare-fun d!18321 () Bool)

(assert (=> d!18321 (contains!726 (+!96 lt!34682 (tuple2!2137 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!34680)))

(declare-fun lt!35025 () Unit!2186)

(declare-fun choose!453 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> d!18321 (= lt!35025 (choose!453 lt!34682 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34680))))

(assert (=> d!18321 (contains!726 lt!34682 lt!34680)))

(assert (=> d!18321 (= (addStillContains!53 lt!34682 lt!34685 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) lt!34680) lt!35025)))

(declare-fun bs!3287 () Bool)

(assert (= bs!3287 d!18321))

(assert (=> bs!3287 m!76005))

(assert (=> bs!3287 m!76005))

(assert (=> bs!3287 m!76007))

(declare-fun m!76767 () Bool)

(assert (=> bs!3287 m!76767))

(declare-fun m!76769 () Bool)

(assert (=> bs!3287 m!76769))

(assert (=> b!76239 d!18321))

(declare-fun b!76716 () Bool)

(declare-fun e!50081 () ListLongMap!1411)

(declare-fun call!6949 () ListLongMap!1411)

(assert (=> b!76716 (= e!50081 call!6949)))

(declare-fun lt!35045 () ListLongMap!1411)

(declare-fun b!76717 () Bool)

(declare-fun e!50084 () Bool)

(assert (=> b!76717 (= e!50084 (= (apply!77 lt!35045 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16))))))

(declare-fun bm!6943 () Bool)

(declare-fun call!6950 () ListLongMap!1411)

(declare-fun call!6948 () ListLongMap!1411)

(assert (=> bm!6943 (= call!6950 call!6948)))

(declare-fun d!18323 () Bool)

(declare-fun e!50083 () Bool)

(assert (=> d!18323 e!50083))

(declare-fun res!40346 () Bool)

(assert (=> d!18323 (=> (not res!40346) (not e!50083))))

(assert (=> d!18323 (= res!40346 (or (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))))

(declare-fun lt!35027 () ListLongMap!1411)

(assert (=> d!18323 (= lt!35045 lt!35027)))

(declare-fun lt!35041 () Unit!2186)

(declare-fun e!50091 () Unit!2186)

(assert (=> d!18323 (= lt!35041 e!50091)))

(declare-fun c!11748 () Bool)

(declare-fun e!50086 () Bool)

(assert (=> d!18323 (= c!11748 e!50086)))

(declare-fun res!40345 () Bool)

(assert (=> d!18323 (=> (not res!40345) (not e!50086))))

(assert (=> d!18323 (= res!40345 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun e!50092 () ListLongMap!1411)

(assert (=> d!18323 (= lt!35027 e!50092)))

(declare-fun c!11749 () Bool)

(assert (=> d!18323 (= c!11749 (and (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18323 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18323 (= (getCurrentListMap!418 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!35045)))

(declare-fun b!76718 () Bool)

(declare-fun res!40348 () Bool)

(assert (=> b!76718 (=> (not res!40348) (not e!50083))))

(declare-fun e!50085 () Bool)

(assert (=> b!76718 (= res!40348 e!50085)))

(declare-fun res!40342 () Bool)

(assert (=> b!76718 (=> res!40342 e!50085)))

(declare-fun e!50093 () Bool)

(assert (=> b!76718 (= res!40342 (not e!50093))))

(declare-fun res!40344 () Bool)

(assert (=> b!76718 (=> (not res!40344) (not e!50093))))

(assert (=> b!76718 (= res!40344 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76719 () Bool)

(assert (=> b!76719 (= e!50086 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76720 () Bool)

(declare-fun e!50082 () Bool)

(assert (=> b!76720 (= e!50082 (= (apply!77 lt!35045 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2145 newMap!16)))))

(declare-fun b!76721 () Bool)

(declare-fun res!40341 () Bool)

(assert (=> b!76721 (=> (not res!40341) (not e!50083))))

(declare-fun e!50090 () Bool)

(assert (=> b!76721 (= res!40341 e!50090)))

(declare-fun c!11751 () Bool)

(assert (=> b!76721 (= c!11751 (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6944 () Bool)

(assert (=> bm!6944 (= call!6949 call!6950)))

(declare-fun b!76722 () Bool)

(declare-fun Unit!2210 () Unit!2186)

(assert (=> b!76722 (= e!50091 Unit!2210)))

(declare-fun b!76723 () Bool)

(declare-fun e!50087 () ListLongMap!1411)

(declare-fun call!6952 () ListLongMap!1411)

(assert (=> b!76723 (= e!50087 call!6952)))

(declare-fun c!11747 () Bool)

(declare-fun b!76724 () Bool)

(assert (=> b!76724 (= c!11747 (and (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76724 (= e!50087 e!50081)))

(declare-fun bm!6945 () Bool)

(declare-fun call!6947 () ListLongMap!1411)

(declare-fun c!11750 () Bool)

(assert (=> bm!6945 (= call!6947 (+!96 (ite c!11749 call!6948 (ite c!11750 call!6950 call!6949)) (ite (or c!11749 c!11750) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16)))))))

(declare-fun b!76725 () Bool)

(assert (=> b!76725 (= e!50093 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6946 () Bool)

(assert (=> bm!6946 (= call!6948 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76726 () Bool)

(assert (=> b!76726 (= e!50090 e!50084)))

(declare-fun res!40343 () Bool)

(declare-fun call!6946 () Bool)

(assert (=> b!76726 (= res!40343 call!6946)))

(assert (=> b!76726 (=> (not res!40343) (not e!50084))))

(declare-fun bm!6947 () Bool)

(assert (=> bm!6947 (= call!6952 call!6947)))

(declare-fun b!76727 () Bool)

(assert (=> b!76727 (= e!50090 (not call!6946))))

(declare-fun b!76728 () Bool)

(declare-fun e!50089 () Bool)

(assert (=> b!76728 (= e!50085 e!50089)))

(declare-fun res!40340 () Bool)

(assert (=> b!76728 (=> (not res!40340) (not e!50089))))

(assert (=> b!76728 (= res!40340 (contains!726 lt!35045 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76729 () Bool)

(declare-fun lt!35036 () Unit!2186)

(assert (=> b!76729 (= e!50091 lt!35036)))

(declare-fun lt!35035 () ListLongMap!1411)

(assert (=> b!76729 (= lt!35035 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35038 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35038 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35033 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35033 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35029 () Unit!2186)

(assert (=> b!76729 (= lt!35029 (addStillContains!53 lt!35035 lt!35038 (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) lt!35033))))

(assert (=> b!76729 (contains!726 (+!96 lt!35035 (tuple2!2137 lt!35038 (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)))) lt!35033)))

(declare-fun lt!35046 () Unit!2186)

(assert (=> b!76729 (= lt!35046 lt!35029)))

(declare-fun lt!35030 () ListLongMap!1411)

(assert (=> b!76729 (= lt!35030 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35026 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35026 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35047 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35047 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35043 () Unit!2186)

(assert (=> b!76729 (= lt!35043 (addApplyDifferent!53 lt!35030 lt!35026 (minValue!2145 newMap!16) lt!35047))))

(assert (=> b!76729 (= (apply!77 (+!96 lt!35030 (tuple2!2137 lt!35026 (minValue!2145 newMap!16))) lt!35047) (apply!77 lt!35030 lt!35047))))

(declare-fun lt!35034 () Unit!2186)

(assert (=> b!76729 (= lt!35034 lt!35043)))

(declare-fun lt!35031 () ListLongMap!1411)

(assert (=> b!76729 (= lt!35031 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35037 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35044 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35044 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35039 () Unit!2186)

(assert (=> b!76729 (= lt!35039 (addApplyDifferent!53 lt!35031 lt!35037 (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) lt!35044))))

(assert (=> b!76729 (= (apply!77 (+!96 lt!35031 (tuple2!2137 lt!35037 (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)))) lt!35044) (apply!77 lt!35031 lt!35044))))

(declare-fun lt!35040 () Unit!2186)

(assert (=> b!76729 (= lt!35040 lt!35039)))

(declare-fun lt!35028 () ListLongMap!1411)

(assert (=> b!76729 (= lt!35028 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (ite c!11594 (_values!2229 newMap!16) lt!34623) (mask!6229 newMap!16) (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) (ite (and c!11594 c!11591) lt!34462 (zeroValue!2145 newMap!16)) (minValue!2145 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35032 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35032 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35042 () (_ BitVec 64))

(assert (=> b!76729 (= lt!35042 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76729 (= lt!35036 (addApplyDifferent!53 lt!35028 lt!35032 (minValue!2145 newMap!16) lt!35042))))

(assert (=> b!76729 (= (apply!77 (+!96 lt!35028 (tuple2!2137 lt!35032 (minValue!2145 newMap!16))) lt!35042) (apply!77 lt!35028 lt!35042))))

(declare-fun b!76730 () Bool)

(assert (=> b!76730 (= e!50081 call!6952)))

(declare-fun bm!6948 () Bool)

(declare-fun call!6951 () Bool)

(assert (=> bm!6948 (= call!6951 (contains!726 lt!35045 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76731 () Bool)

(assert (=> b!76731 (= e!50092 e!50087)))

(assert (=> b!76731 (= c!11750 (and (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6949 () Bool)

(assert (=> bm!6949 (= call!6946 (contains!726 lt!35045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76732 () Bool)

(assert (=> b!76732 (= e!50089 (= (apply!77 lt!35045 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)) (get!1162 (select (arr!1863 (ite c!11594 (_values!2229 newMap!16) lt!34623)) #b00000000000000000000000000000000) (dynLambda!332 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2103 (ite c!11594 (_values!2229 newMap!16) lt!34623))))))

(assert (=> b!76732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76733 () Bool)

(declare-fun e!50088 () Bool)

(assert (=> b!76733 (= e!50083 e!50088)))

(declare-fun c!11746 () Bool)

(assert (=> b!76733 (= c!11746 (not (= (bvand (ite (and c!11594 c!11591) lt!34625 (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76734 () Bool)

(assert (=> b!76734 (= e!50088 (not call!6951))))

(declare-fun b!76735 () Bool)

(assert (=> b!76735 (= e!50088 e!50082)))

(declare-fun res!40347 () Bool)

(assert (=> b!76735 (= res!40347 call!6951)))

(assert (=> b!76735 (=> (not res!40347) (not e!50082))))

(declare-fun b!76736 () Bool)

(assert (=> b!76736 (= e!50092 (+!96 call!6947 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 newMap!16))))))

(assert (= (and d!18323 c!11749) b!76736))

(assert (= (and d!18323 (not c!11749)) b!76731))

(assert (= (and b!76731 c!11750) b!76723))

(assert (= (and b!76731 (not c!11750)) b!76724))

(assert (= (and b!76724 c!11747) b!76730))

(assert (= (and b!76724 (not c!11747)) b!76716))

(assert (= (or b!76730 b!76716) bm!6944))

(assert (= (or b!76723 bm!6944) bm!6943))

(assert (= (or b!76723 b!76730) bm!6947))

(assert (= (or b!76736 bm!6943) bm!6946))

(assert (= (or b!76736 bm!6947) bm!6945))

(assert (= (and d!18323 res!40345) b!76719))

(assert (= (and d!18323 c!11748) b!76729))

(assert (= (and d!18323 (not c!11748)) b!76722))

(assert (= (and d!18323 res!40346) b!76718))

(assert (= (and b!76718 res!40344) b!76725))

(assert (= (and b!76718 (not res!40342)) b!76728))

(assert (= (and b!76728 res!40340) b!76732))

(assert (= (and b!76718 res!40348) b!76721))

(assert (= (and b!76721 c!11751) b!76726))

(assert (= (and b!76721 (not c!11751)) b!76727))

(assert (= (and b!76726 res!40343) b!76717))

(assert (= (or b!76726 b!76727) bm!6949))

(assert (= (and b!76721 res!40341) b!76733))

(assert (= (and b!76733 c!11746) b!76735))

(assert (= (and b!76733 (not c!11746)) b!76734))

(assert (= (and b!76735 res!40347) b!76720))

(assert (= (or b!76735 b!76734) bm!6948))

(declare-fun b_lambda!3445 () Bool)

(assert (=> (not b_lambda!3445) (not b!76732)))

(assert (=> b!76732 t!5079))

(declare-fun b_and!4693 () Bool)

(assert (= b_and!4689 (and (=> t!5079 result!2741) b_and!4693)))

(assert (=> b!76732 t!5081))

(declare-fun b_and!4695 () Bool)

(assert (= b_and!4691 (and (=> t!5081 result!2743) b_and!4695)))

(declare-fun m!76771 () Bool)

(assert (=> b!76732 m!76771))

(assert (=> b!76732 m!76213))

(declare-fun m!76773 () Bool)

(assert (=> b!76732 m!76773))

(assert (=> b!76732 m!76277))

(assert (=> b!76732 m!76771))

(assert (=> b!76732 m!76277))

(declare-fun m!76775 () Bool)

(assert (=> b!76732 m!76775))

(assert (=> b!76732 m!76213))

(declare-fun m!76777 () Bool)

(assert (=> bm!6948 m!76777))

(declare-fun m!76779 () Bool)

(assert (=> bm!6946 m!76779))

(declare-fun m!76781 () Bool)

(assert (=> b!76729 m!76781))

(assert (=> b!76729 m!76213))

(declare-fun m!76783 () Bool)

(assert (=> b!76729 m!76783))

(declare-fun m!76785 () Bool)

(assert (=> b!76729 m!76785))

(declare-fun m!76787 () Bool)

(assert (=> b!76729 m!76787))

(declare-fun m!76789 () Bool)

(assert (=> b!76729 m!76789))

(declare-fun m!76791 () Bool)

(assert (=> b!76729 m!76791))

(assert (=> b!76729 m!76779))

(assert (=> b!76729 m!76789))

(declare-fun m!76793 () Bool)

(assert (=> b!76729 m!76793))

(assert (=> b!76729 m!76783))

(declare-fun m!76795 () Bool)

(assert (=> b!76729 m!76795))

(declare-fun m!76797 () Bool)

(assert (=> b!76729 m!76797))

(declare-fun m!76799 () Bool)

(assert (=> b!76729 m!76799))

(declare-fun m!76801 () Bool)

(assert (=> b!76729 m!76801))

(declare-fun m!76803 () Bool)

(assert (=> b!76729 m!76803))

(assert (=> b!76729 m!76803))

(declare-fun m!76805 () Bool)

(assert (=> b!76729 m!76805))

(declare-fun m!76807 () Bool)

(assert (=> b!76729 m!76807))

(declare-fun m!76809 () Bool)

(assert (=> b!76729 m!76809))

(assert (=> b!76729 m!76807))

(declare-fun m!76811 () Bool)

(assert (=> b!76720 m!76811))

(declare-fun m!76813 () Bool)

(assert (=> b!76736 m!76813))

(assert (=> d!18323 m!76191))

(assert (=> b!76719 m!76213))

(assert (=> b!76719 m!76213))

(assert (=> b!76719 m!76319))

(declare-fun m!76815 () Bool)

(assert (=> bm!6949 m!76815))

(assert (=> b!76725 m!76213))

(assert (=> b!76725 m!76213))

(assert (=> b!76725 m!76319))

(declare-fun m!76817 () Bool)

(assert (=> bm!6945 m!76817))

(assert (=> b!76728 m!76213))

(assert (=> b!76728 m!76213))

(declare-fun m!76819 () Bool)

(assert (=> b!76728 m!76819))

(declare-fun m!76821 () Bool)

(assert (=> b!76717 m!76821))

(assert (=> bm!6839 d!18323))

(assert (=> d!18135 d!18157))

(declare-fun d!18325 () Bool)

(declare-fun e!50094 () Bool)

(assert (=> d!18325 e!50094))

(declare-fun res!40350 () Bool)

(assert (=> d!18325 (=> (not res!40350) (not e!50094))))

(declare-fun lt!35048 () ListLongMap!1411)

(assert (=> d!18325 (= res!40350 (contains!726 lt!35048 (_1!1079 (tuple2!2137 lt!34735 lt!34730))))))

(declare-fun lt!35051 () List!1482)

(assert (=> d!18325 (= lt!35048 (ListLongMap!1412 lt!35051))))

(declare-fun lt!35050 () Unit!2186)

(declare-fun lt!35049 () Unit!2186)

(assert (=> d!18325 (= lt!35050 lt!35049)))

(assert (=> d!18325 (= (getValueByKey!136 lt!35051 (_1!1079 (tuple2!2137 lt!34735 lt!34730))) (Some!141 (_2!1079 (tuple2!2137 lt!34735 lt!34730))))))

(assert (=> d!18325 (= lt!35049 (lemmaContainsTupThenGetReturnValue!53 lt!35051 (_1!1079 (tuple2!2137 lt!34735 lt!34730)) (_2!1079 (tuple2!2137 lt!34735 lt!34730))))))

(assert (=> d!18325 (= lt!35051 (insertStrictlySorted!56 (toList!721 lt!34736) (_1!1079 (tuple2!2137 lt!34735 lt!34730)) (_2!1079 (tuple2!2137 lt!34735 lt!34730))))))

(assert (=> d!18325 (= (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730)) lt!35048)))

(declare-fun b!76737 () Bool)

(declare-fun res!40349 () Bool)

(assert (=> b!76737 (=> (not res!40349) (not e!50094))))

(assert (=> b!76737 (= res!40349 (= (getValueByKey!136 (toList!721 lt!35048) (_1!1079 (tuple2!2137 lt!34735 lt!34730))) (Some!141 (_2!1079 (tuple2!2137 lt!34735 lt!34730)))))))

(declare-fun b!76738 () Bool)

(assert (=> b!76738 (= e!50094 (contains!728 (toList!721 lt!35048) (tuple2!2137 lt!34735 lt!34730)))))

(assert (= (and d!18325 res!40350) b!76737))

(assert (= (and b!76737 res!40349) b!76738))

(declare-fun m!76823 () Bool)

(assert (=> d!18325 m!76823))

(declare-fun m!76825 () Bool)

(assert (=> d!18325 m!76825))

(declare-fun m!76827 () Bool)

(assert (=> d!18325 m!76827))

(declare-fun m!76829 () Bool)

(assert (=> d!18325 m!76829))

(declare-fun m!76831 () Bool)

(assert (=> b!76737 m!76831))

(declare-fun m!76833 () Bool)

(assert (=> b!76738 m!76833))

(assert (=> b!76318 d!18325))

(assert (=> b!76318 d!18189))

(declare-fun d!18327 () Bool)

(declare-fun e!50095 () Bool)

(assert (=> d!18327 e!50095))

(declare-fun res!40351 () Bool)

(assert (=> d!18327 (=> res!40351 e!50095)))

(declare-fun lt!35054 () Bool)

(assert (=> d!18327 (= res!40351 (not lt!35054))))

(declare-fun lt!35052 () Bool)

(assert (=> d!18327 (= lt!35054 lt!35052)))

(declare-fun lt!35055 () Unit!2186)

(declare-fun e!50096 () Unit!2186)

(assert (=> d!18327 (= lt!35055 e!50096)))

(declare-fun c!11752 () Bool)

(assert (=> d!18327 (= c!11752 lt!35052)))

(assert (=> d!18327 (= lt!35052 (containsKey!139 (toList!721 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730))) lt!34734))))

(assert (=> d!18327 (= (contains!726 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730)) lt!34734) lt!35054)))

(declare-fun b!76739 () Bool)

(declare-fun lt!35053 () Unit!2186)

(assert (=> b!76739 (= e!50096 lt!35053)))

(assert (=> b!76739 (= lt!35053 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730))) lt!34734))))

(assert (=> b!76739 (isDefined!88 (getValueByKey!136 (toList!721 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730))) lt!34734))))

(declare-fun b!76740 () Bool)

(declare-fun Unit!2211 () Unit!2186)

(assert (=> b!76740 (= e!50096 Unit!2211)))

(declare-fun b!76741 () Bool)

(assert (=> b!76741 (= e!50095 (isDefined!88 (getValueByKey!136 (toList!721 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730))) lt!34734)))))

(assert (= (and d!18327 c!11752) b!76739))

(assert (= (and d!18327 (not c!11752)) b!76740))

(assert (= (and d!18327 (not res!40351)) b!76741))

(declare-fun m!76835 () Bool)

(assert (=> d!18327 m!76835))

(declare-fun m!76837 () Bool)

(assert (=> b!76739 m!76837))

(declare-fun m!76839 () Bool)

(assert (=> b!76739 m!76839))

(assert (=> b!76739 m!76839))

(declare-fun m!76841 () Bool)

(assert (=> b!76739 m!76841))

(assert (=> b!76741 m!76839))

(assert (=> b!76741 m!76839))

(assert (=> b!76741 m!76841))

(assert (=> b!76318 d!18327))

(declare-fun d!18329 () Bool)

(declare-fun e!50097 () Bool)

(assert (=> d!18329 e!50097))

(declare-fun res!40353 () Bool)

(assert (=> d!18329 (=> (not res!40353) (not e!50097))))

(declare-fun lt!35056 () ListLongMap!1411)

(assert (=> d!18329 (= res!40353 (contains!726 lt!35056 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!35059 () List!1482)

(assert (=> d!18329 (= lt!35056 (ListLongMap!1412 lt!35059))))

(declare-fun lt!35058 () Unit!2186)

(declare-fun lt!35057 () Unit!2186)

(assert (=> d!18329 (= lt!35058 lt!35057)))

(assert (=> d!18329 (= (getValueByKey!136 lt!35059 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18329 (= lt!35057 (lemmaContainsTupThenGetReturnValue!53 lt!35059 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18329 (= lt!35059 (insertStrictlySorted!56 (toList!721 call!6892) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18329 (= (+!96 call!6892 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!35056)))

(declare-fun b!76742 () Bool)

(declare-fun res!40352 () Bool)

(assert (=> b!76742 (=> (not res!40352) (not e!50097))))

(assert (=> b!76742 (= res!40352 (= (getValueByKey!136 (toList!721 lt!35056) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!76743 () Bool)

(assert (=> b!76743 (= e!50097 (contains!728 (toList!721 lt!35056) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1162 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!18329 res!40353) b!76742))

(assert (= (and b!76742 res!40352) b!76743))

(declare-fun m!76843 () Bool)

(assert (=> d!18329 m!76843))

(declare-fun m!76845 () Bool)

(assert (=> d!18329 m!76845))

(declare-fun m!76847 () Bool)

(assert (=> d!18329 m!76847))

(declare-fun m!76849 () Bool)

(assert (=> d!18329 m!76849))

(declare-fun m!76851 () Bool)

(assert (=> b!76742 m!76851))

(declare-fun m!76853 () Bool)

(assert (=> b!76743 m!76853))

(assert (=> b!76318 d!18329))

(declare-fun d!18331 () Bool)

(assert (=> d!18331 (not (contains!726 (+!96 lt!34736 (tuple2!2137 lt!34735 lt!34730)) lt!34734))))

(declare-fun lt!35062 () Unit!2186)

(declare-fun choose!454 (ListLongMap!1411 (_ BitVec 64) V!2961 (_ BitVec 64)) Unit!2186)

(assert (=> d!18331 (= lt!35062 (choose!454 lt!34736 lt!34735 lt!34730 lt!34734))))

(declare-fun e!50100 () Bool)

(assert (=> d!18331 e!50100))

(declare-fun res!40356 () Bool)

(assert (=> d!18331 (=> (not res!40356) (not e!50100))))

(assert (=> d!18331 (= res!40356 (not (contains!726 lt!34736 lt!34734)))))

(assert (=> d!18331 (= (addStillNotContains!28 lt!34736 lt!34735 lt!34730 lt!34734) lt!35062)))

(declare-fun b!76747 () Bool)

(assert (=> b!76747 (= e!50100 (not (= lt!34735 lt!34734)))))

(assert (= (and d!18331 res!40356) b!76747))

(assert (=> d!18331 m!76087))

(assert (=> d!18331 m!76087))

(assert (=> d!18331 m!76091))

(declare-fun m!76855 () Bool)

(assert (=> d!18331 m!76855))

(declare-fun m!76857 () Bool)

(assert (=> d!18331 m!76857))

(assert (=> b!76318 d!18331))

(declare-fun d!18333 () Bool)

(assert (=> d!18333 (= (apply!77 lt!34732 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1166 (getValueByKey!136 (toList!721 lt!34732) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3288 () Bool)

(assert (= bs!3288 d!18333))

(assert (=> bs!3288 m!75989))

(assert (=> bs!3288 m!76197))

(assert (=> bs!3288 m!76197))

(declare-fun m!76859 () Bool)

(assert (=> bs!3288 m!76859))

(assert (=> b!76314 d!18333))

(assert (=> b!76314 d!18189))

(assert (=> d!18165 d!18169))

(declare-fun d!18335 () Bool)

(assert (=> d!18335 (not (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!18335 true))

(declare-fun _$68!61 () Unit!2186)

(assert (=> d!18335 (= (choose!68 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (Cons!1477 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) Nil!1478)) _$68!61)))

(declare-fun bs!3289 () Bool)

(assert (= bs!3289 d!18335))

(assert (=> bs!3289 m!75749))

(assert (=> bs!3289 m!75779))

(assert (=> d!18165 d!18335))

(declare-fun d!18337 () Bool)

(declare-fun isEmpty!330 (Option!142) Bool)

(assert (=> d!18337 (= (isDefined!88 (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))) (not (isEmpty!330 (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))))

(declare-fun bs!3290 () Bool)

(assert (= bs!3290 d!18337))

(assert (=> bs!3290 m!75925))

(declare-fun m!76861 () Bool)

(assert (=> bs!3290 m!76861))

(assert (=> b!76063 d!18337))

(declare-fun b!76749 () Bool)

(declare-fun e!50101 () Option!142)

(declare-fun e!50102 () Option!142)

(assert (=> b!76749 (= e!50101 e!50102)))

(declare-fun c!11754 () Bool)

(assert (=> b!76749 (= c!11754 (and ((_ is Cons!1478) (toList!721 lt!34453)) (not (= (_1!1079 (h!2066 (toList!721 lt!34453))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))))

(declare-fun b!76750 () Bool)

(assert (=> b!76750 (= e!50102 (getValueByKey!136 (t!5068 (toList!721 lt!34453)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76748 () Bool)

(assert (=> b!76748 (= e!50101 (Some!141 (_2!1079 (h!2066 (toList!721 lt!34453)))))))

(declare-fun b!76751 () Bool)

(assert (=> b!76751 (= e!50102 None!140)))

(declare-fun c!11753 () Bool)

(declare-fun d!18339 () Bool)

(assert (=> d!18339 (= c!11753 (and ((_ is Cons!1478) (toList!721 lt!34453)) (= (_1!1079 (h!2066 (toList!721 lt!34453))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355))))))

(assert (=> d!18339 (= (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) e!50101)))

(assert (= (and d!18339 c!11753) b!76748))

(assert (= (and d!18339 (not c!11753)) b!76749))

(assert (= (and b!76749 c!11754) b!76750))

(assert (= (and b!76749 (not c!11754)) b!76751))

(assert (=> b!76750 m!75749))

(declare-fun m!76863 () Bool)

(assert (=> b!76750 m!76863))

(assert (=> b!76063 d!18339))

(declare-fun d!18341 () Bool)

(declare-fun e!50103 () Bool)

(assert (=> d!18341 e!50103))

(declare-fun res!40357 () Bool)

(assert (=> d!18341 (=> res!40357 e!50103)))

(declare-fun lt!35065 () Bool)

(assert (=> d!18341 (= res!40357 (not lt!35065))))

(declare-fun lt!35063 () Bool)

(assert (=> d!18341 (= lt!35065 lt!35063)))

(declare-fun lt!35066 () Unit!2186)

(declare-fun e!50104 () Unit!2186)

(assert (=> d!18341 (= lt!35066 e!50104)))

(declare-fun c!11755 () Bool)

(assert (=> d!18341 (= c!11755 lt!35063)))

(assert (=> d!18341 (= lt!35063 (containsKey!139 (toList!721 e!49737) (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603)))))))

(assert (=> d!18341 (= (contains!726 e!49737 (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603)))) lt!35065)))

(declare-fun b!76752 () Bool)

(declare-fun lt!35064 () Unit!2186)

(assert (=> b!76752 (= e!50104 lt!35064)))

(assert (=> b!76752 (= lt!35064 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 e!49737) (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603)))))))

(assert (=> b!76752 (isDefined!88 (getValueByKey!136 (toList!721 e!49737) (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603)))))))

(declare-fun b!76753 () Bool)

(declare-fun Unit!2212 () Unit!2186)

(assert (=> b!76753 (= e!50104 Unit!2212)))

(declare-fun b!76754 () Bool)

(assert (=> b!76754 (= e!50103 (isDefined!88 (getValueByKey!136 (toList!721 e!49737) (ite c!11599 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!34603))))))))

(assert (= (and d!18341 c!11755) b!76752))

(assert (= (and d!18341 (not c!11755)) b!76753))

(assert (= (and d!18341 (not res!40357)) b!76754))

(declare-fun m!76865 () Bool)

(assert (=> d!18341 m!76865))

(declare-fun m!76867 () Bool)

(assert (=> b!76752 m!76867))

(declare-fun m!76869 () Bool)

(assert (=> b!76752 m!76869))

(assert (=> b!76752 m!76869))

(declare-fun m!76871 () Bool)

(assert (=> b!76752 m!76871))

(assert (=> b!76754 m!76869))

(assert (=> b!76754 m!76869))

(assert (=> b!76754 m!76871))

(assert (=> bm!6847 d!18341))

(assert (=> b!76149 d!18197))

(assert (=> bm!6877 d!18151))

(declare-fun d!18343 () Bool)

(assert (=> d!18343 (= (+!96 (+!96 lt!34452 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (+!96 (+!96 lt!34452 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))

(assert (=> d!18343 true))

(declare-fun _$28!127 () Unit!2186)

(assert (=> d!18343 (= (choose!445 lt!34452 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) _$28!127)))

(declare-fun bs!3291 () Bool)

(assert (= bs!3291 d!18343))

(assert (=> bs!3291 m!76095))

(assert (=> bs!3291 m!76095))

(assert (=> bs!3291 m!76097))

(assert (=> bs!3291 m!76099))

(assert (=> bs!3291 m!76099))

(assert (=> bs!3291 m!76101))

(assert (=> d!18153 d!18343))

(declare-fun d!18345 () Bool)

(declare-fun e!50105 () Bool)

(assert (=> d!18345 e!50105))

(declare-fun res!40359 () Bool)

(assert (=> d!18345 (=> (not res!40359) (not e!50105))))

(declare-fun lt!35067 () ListLongMap!1411)

(assert (=> d!18345 (= res!40359 (contains!726 lt!35067 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35070 () List!1482)

(assert (=> d!18345 (= lt!35067 (ListLongMap!1412 lt!35070))))

(declare-fun lt!35069 () Unit!2186)

(declare-fun lt!35068 () Unit!2186)

(assert (=> d!18345 (= lt!35069 lt!35068)))

(assert (=> d!18345 (= (getValueByKey!136 lt!35070 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18345 (= lt!35068 (lemmaContainsTupThenGetReturnValue!53 lt!35070 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18345 (= lt!35070 (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18345 (= (+!96 lt!34452 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!35067)))

(declare-fun b!76755 () Bool)

(declare-fun res!40358 () Bool)

(assert (=> b!76755 (=> (not res!40358) (not e!50105))))

(assert (=> b!76755 (= res!40358 (= (getValueByKey!136 (toList!721 lt!35067) (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76756 () Bool)

(assert (=> b!76756 (= e!50105 (contains!728 (toList!721 lt!35067) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18345 res!40359) b!76755))

(assert (= (and b!76755 res!40358) b!76756))

(declare-fun m!76873 () Bool)

(assert (=> d!18345 m!76873))

(declare-fun m!76875 () Bool)

(assert (=> d!18345 m!76875))

(declare-fun m!76877 () Bool)

(assert (=> d!18345 m!76877))

(declare-fun m!76879 () Bool)

(assert (=> d!18345 m!76879))

(declare-fun m!76881 () Bool)

(assert (=> b!76755 m!76881))

(declare-fun m!76883 () Bool)

(assert (=> b!76756 m!76883))

(assert (=> d!18153 d!18345))

(declare-fun d!18347 () Bool)

(declare-fun e!50106 () Bool)

(assert (=> d!18347 e!50106))

(declare-fun res!40361 () Bool)

(assert (=> d!18347 (=> (not res!40361) (not e!50106))))

(declare-fun lt!35071 () ListLongMap!1411)

(assert (=> d!18347 (= res!40361 (contains!726 lt!35071 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(declare-fun lt!35074 () List!1482)

(assert (=> d!18347 (= lt!35071 (ListLongMap!1412 lt!35074))))

(declare-fun lt!35073 () Unit!2186)

(declare-fun lt!35072 () Unit!2186)

(assert (=> d!18347 (= lt!35073 lt!35072)))

(assert (=> d!18347 (= (getValueByKey!136 lt!35074 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18347 (= lt!35072 (lemmaContainsTupThenGetReturnValue!53 lt!35074 (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18347 (= lt!35074 (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (=> d!18347 (= (+!96 (+!96 lt!34452 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) lt!35071)))

(declare-fun b!76757 () Bool)

(declare-fun res!40360 () Bool)

(assert (=> b!76757 (=> (not res!40360) (not e!50106))))

(assert (=> b!76757 (= res!40360 (= (getValueByKey!136 (toList!721 lt!35071) (_1!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (Some!141 (_2!1079 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun b!76758 () Bool)

(assert (=> b!76758 (= e!50106 (contains!728 (toList!721 lt!35071) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))))))

(assert (= (and d!18347 res!40361) b!76757))

(assert (= (and b!76757 res!40360) b!76758))

(declare-fun m!76885 () Bool)

(assert (=> d!18347 m!76885))

(declare-fun m!76887 () Bool)

(assert (=> d!18347 m!76887))

(declare-fun m!76889 () Bool)

(assert (=> d!18347 m!76889))

(declare-fun m!76891 () Bool)

(assert (=> d!18347 m!76891))

(declare-fun m!76893 () Bool)

(assert (=> b!76757 m!76893))

(declare-fun m!76895 () Bool)

(assert (=> b!76758 m!76895))

(assert (=> d!18153 d!18347))

(declare-fun d!18349 () Bool)

(declare-fun e!50107 () Bool)

(assert (=> d!18349 e!50107))

(declare-fun res!40363 () Bool)

(assert (=> d!18349 (=> (not res!40363) (not e!50107))))

(declare-fun lt!35075 () ListLongMap!1411)

(assert (=> d!18349 (= res!40363 (contains!726 lt!35075 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun lt!35078 () List!1482)

(assert (=> d!18349 (= lt!35075 (ListLongMap!1412 lt!35078))))

(declare-fun lt!35077 () Unit!2186)

(declare-fun lt!35076 () Unit!2186)

(assert (=> d!18349 (= lt!35077 lt!35076)))

(assert (=> d!18349 (= (getValueByKey!136 lt!35078 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18349 (= lt!35076 (lemmaContainsTupThenGetReturnValue!53 lt!35078 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18349 (= lt!35078 (insertStrictlySorted!56 (toList!721 (+!96 lt!34452 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))))) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18349 (= (+!96 (+!96 lt!34452 (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992))))) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) lt!35075)))

(declare-fun b!76759 () Bool)

(declare-fun res!40362 () Bool)

(assert (=> b!76759 (=> (not res!40362) (not e!50107))))

(assert (=> b!76759 (= res!40362 (= (getValueByKey!136 (toList!721 lt!35075) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(declare-fun b!76760 () Bool)

(assert (=> b!76760 (= e!50107 (contains!728 (toList!721 lt!35075) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))

(assert (= (and d!18349 res!40363) b!76759))

(assert (= (and b!76759 res!40362) b!76760))

(declare-fun m!76897 () Bool)

(assert (=> d!18349 m!76897))

(declare-fun m!76899 () Bool)

(assert (=> d!18349 m!76899))

(declare-fun m!76901 () Bool)

(assert (=> d!18349 m!76901))

(declare-fun m!76903 () Bool)

(assert (=> d!18349 m!76903))

(declare-fun m!76905 () Bool)

(assert (=> b!76759 m!76905))

(declare-fun m!76907 () Bool)

(assert (=> b!76760 m!76907))

(assert (=> d!18153 d!18349))

(declare-fun d!18351 () Bool)

(declare-fun e!50108 () Bool)

(assert (=> d!18351 e!50108))

(declare-fun res!40365 () Bool)

(assert (=> d!18351 (=> (not res!40365) (not e!50108))))

(declare-fun lt!35079 () ListLongMap!1411)

(assert (=> d!18351 (= res!40365 (contains!726 lt!35079 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun lt!35082 () List!1482)

(assert (=> d!18351 (= lt!35079 (ListLongMap!1412 lt!35082))))

(declare-fun lt!35081 () Unit!2186)

(declare-fun lt!35080 () Unit!2186)

(assert (=> d!18351 (= lt!35081 lt!35080)))

(assert (=> d!18351 (= (getValueByKey!136 lt!35082 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18351 (= lt!35080 (lemmaContainsTupThenGetReturnValue!53 lt!35082 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18351 (= lt!35082 (insertStrictlySorted!56 (toList!721 lt!34452) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18351 (= (+!96 lt!34452 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) lt!35079)))

(declare-fun b!76761 () Bool)

(declare-fun res!40364 () Bool)

(assert (=> b!76761 (=> (not res!40364) (not e!50108))))

(assert (=> b!76761 (= res!40364 (= (getValueByKey!136 (toList!721 lt!35079) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(declare-fun b!76762 () Bool)

(assert (=> b!76762 (= e!50108 (contains!728 (toList!721 lt!35079) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))

(assert (= (and d!18351 res!40365) b!76761))

(assert (= (and b!76761 res!40364) b!76762))

(declare-fun m!76909 () Bool)

(assert (=> d!18351 m!76909))

(declare-fun m!76911 () Bool)

(assert (=> d!18351 m!76911))

(declare-fun m!76913 () Bool)

(assert (=> d!18351 m!76913))

(declare-fun m!76915 () Bool)

(assert (=> d!18351 m!76915))

(declare-fun m!76917 () Bool)

(assert (=> b!76761 m!76917))

(declare-fun m!76919 () Bool)

(assert (=> b!76762 m!76919))

(assert (=> d!18153 d!18351))

(assert (=> b!76347 d!18169))

(declare-fun b!76764 () Bool)

(declare-fun e!50109 () Option!142)

(declare-fun e!50110 () Option!142)

(assert (=> b!76764 (= e!50109 e!50110)))

(declare-fun c!11757 () Bool)

(assert (=> b!76764 (= c!11757 (and ((_ is Cons!1478) (toList!721 lt!34748)) (not (= (_1!1079 (h!2066 (toList!721 lt!34748))) (_1!1079 lt!34463)))))))

(declare-fun b!76765 () Bool)

(assert (=> b!76765 (= e!50110 (getValueByKey!136 (t!5068 (toList!721 lt!34748)) (_1!1079 lt!34463)))))

(declare-fun b!76763 () Bool)

(assert (=> b!76763 (= e!50109 (Some!141 (_2!1079 (h!2066 (toList!721 lt!34748)))))))

(declare-fun b!76766 () Bool)

(assert (=> b!76766 (= e!50110 None!140)))

(declare-fun d!18353 () Bool)

(declare-fun c!11756 () Bool)

(assert (=> d!18353 (= c!11756 (and ((_ is Cons!1478) (toList!721 lt!34748)) (= (_1!1079 (h!2066 (toList!721 lt!34748))) (_1!1079 lt!34463))))))

(assert (=> d!18353 (= (getValueByKey!136 (toList!721 lt!34748) (_1!1079 lt!34463)) e!50109)))

(assert (= (and d!18353 c!11756) b!76763))

(assert (= (and d!18353 (not c!11756)) b!76764))

(assert (= (and b!76764 c!11757) b!76765))

(assert (= (and b!76764 (not c!11757)) b!76766))

(declare-fun m!76921 () Bool)

(assert (=> b!76765 m!76921))

(assert (=> b!76326 d!18353))

(declare-fun d!18355 () Bool)

(declare-fun e!50111 () Bool)

(assert (=> d!18355 e!50111))

(declare-fun res!40366 () Bool)

(assert (=> d!18355 (=> res!40366 e!50111)))

(declare-fun lt!35085 () Bool)

(assert (=> d!18355 (= res!40366 (not lt!35085))))

(declare-fun lt!35083 () Bool)

(assert (=> d!18355 (= lt!35085 lt!35083)))

(declare-fun lt!35086 () Unit!2186)

(declare-fun e!50112 () Unit!2186)

(assert (=> d!18355 (= lt!35086 e!50112)))

(declare-fun c!11758 () Bool)

(assert (=> d!18355 (= c!11758 lt!35083)))

(assert (=> d!18355 (= lt!35083 (containsKey!139 (toList!721 lt!34732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18355 (= (contains!726 lt!34732 #b1000000000000000000000000000000000000000000000000000000000000000) lt!35085)))

(declare-fun b!76767 () Bool)

(declare-fun lt!35084 () Unit!2186)

(assert (=> b!76767 (= e!50112 lt!35084)))

(assert (=> b!76767 (= lt!35084 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76767 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76768 () Bool)

(declare-fun Unit!2213 () Unit!2186)

(assert (=> b!76768 (= e!50112 Unit!2213)))

(declare-fun b!76769 () Bool)

(assert (=> b!76769 (= e!50111 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18355 c!11758) b!76767))

(assert (= (and d!18355 (not c!11758)) b!76768))

(assert (= (and d!18355 (not res!40366)) b!76769))

(declare-fun m!76923 () Bool)

(assert (=> d!18355 m!76923))

(declare-fun m!76925 () Bool)

(assert (=> b!76767 m!76925))

(declare-fun m!76927 () Bool)

(assert (=> b!76767 m!76927))

(assert (=> b!76767 m!76927))

(declare-fun m!76929 () Bool)

(assert (=> b!76767 m!76929))

(assert (=> b!76769 m!76927))

(assert (=> b!76769 m!76927))

(assert (=> b!76769 m!76929))

(assert (=> b!76310 d!18355))

(declare-fun d!18357 () Bool)

(declare-fun e!50113 () Bool)

(assert (=> d!18357 e!50113))

(declare-fun res!40367 () Bool)

(assert (=> d!18357 (=> res!40367 e!50113)))

(declare-fun lt!35089 () Bool)

(assert (=> d!18357 (= res!40367 (not lt!35089))))

(declare-fun lt!35087 () Bool)

(assert (=> d!18357 (= lt!35089 lt!35087)))

(declare-fun lt!35090 () Unit!2186)

(declare-fun e!50114 () Unit!2186)

(assert (=> d!18357 (= lt!35090 e!50114)))

(declare-fun c!11759 () Bool)

(assert (=> d!18357 (= c!11759 lt!35087)))

(assert (=> d!18357 (= lt!35087 (containsKey!139 (toList!721 lt!34732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18357 (= (contains!726 lt!34732 #b0000000000000000000000000000000000000000000000000000000000000000) lt!35089)))

(declare-fun b!76770 () Bool)

(declare-fun lt!35088 () Unit!2186)

(assert (=> b!76770 (= e!50114 lt!35088)))

(assert (=> b!76770 (= lt!35088 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76770 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76771 () Bool)

(declare-fun Unit!2214 () Unit!2186)

(assert (=> b!76771 (= e!50114 Unit!2214)))

(declare-fun b!76772 () Bool)

(assert (=> b!76772 (= e!50113 (isDefined!88 (getValueByKey!136 (toList!721 lt!34732) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18357 c!11759) b!76770))

(assert (= (and d!18357 (not c!11759)) b!76771))

(assert (= (and d!18357 (not res!40367)) b!76772))

(declare-fun m!76931 () Bool)

(assert (=> d!18357 m!76931))

(declare-fun m!76933 () Bool)

(assert (=> b!76770 m!76933))

(declare-fun m!76935 () Bool)

(assert (=> b!76770 m!76935))

(assert (=> b!76770 m!76935))

(declare-fun m!76937 () Bool)

(assert (=> b!76770 m!76937))

(assert (=> b!76772 m!76935))

(assert (=> b!76772 m!76935))

(assert (=> b!76772 m!76937))

(assert (=> d!18151 d!18357))

(assert (=> d!18151 d!18157))

(declare-fun d!18359 () Bool)

(assert (=> d!18359 (isDefined!88 (getValueByKey!136 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun lt!35093 () Unit!2186)

(declare-fun choose!455 (List!1482 (_ BitVec 64)) Unit!2186)

(assert (=> d!18359 (= lt!35093 (choose!455 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun e!50117 () Bool)

(assert (=> d!18359 e!50117))

(declare-fun res!40370 () Bool)

(assert (=> d!18359 (=> (not res!40370) (not e!50117))))

(assert (=> d!18359 (= res!40370 (isStrictlySorted!281 (toList!721 lt!34453)))))

(assert (=> d!18359 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) lt!35093)))

(declare-fun b!76775 () Bool)

(assert (=> b!76775 (= e!50117 (containsKey!139 (toList!721 lt!34453) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (= (and d!18359 res!40370) b!76775))

(assert (=> d!18359 m!75749))

(assert (=> d!18359 m!75925))

(assert (=> d!18359 m!75925))

(assert (=> d!18359 m!75927))

(assert (=> d!18359 m!75749))

(declare-fun m!76939 () Bool)

(assert (=> d!18359 m!76939))

(declare-fun m!76941 () Bool)

(assert (=> d!18359 m!76941))

(assert (=> b!76775 m!75749))

(assert (=> b!76775 m!75921))

(assert (=> b!76061 d!18359))

(assert (=> b!76061 d!18337))

(assert (=> b!76061 d!18339))

(declare-fun d!18361 () Bool)

(assert (=> d!18361 (= (get!1165 (select (arr!1863 (_values!2229 (v!2561 (underlying!268 thiss!992)))) from!355) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!332 (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76264 d!18361))

(assert (=> d!18167 d!18173))

(declare-fun d!18363 () Bool)

(assert (=> d!18363 (arrayNoDuplicates!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) from!355 Nil!1478)))

(assert (=> d!18363 true))

(declare-fun _$71!102 () Unit!2186)

(assert (=> d!18363 (= (choose!39 (_keys!3904 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!102)))

(declare-fun bs!3292 () Bool)

(assert (= bs!3292 d!18363))

(assert (=> bs!3292 m!75775))

(assert (=> d!18167 d!18363))

(declare-fun d!18365 () Bool)

(declare-fun e!50118 () Bool)

(assert (=> d!18365 e!50118))

(declare-fun res!40372 () Bool)

(assert (=> d!18365 (=> (not res!40372) (not e!50118))))

(declare-fun lt!35094 () ListLongMap!1411)

(assert (=> d!18365 (= res!40372 (contains!726 lt!35094 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(declare-fun lt!35097 () List!1482)

(assert (=> d!18365 (= lt!35094 (ListLongMap!1412 lt!35097))))

(declare-fun lt!35096 () Unit!2186)

(declare-fun lt!35095 () Unit!2186)

(assert (=> d!18365 (= lt!35096 lt!35095)))

(assert (=> d!18365 (= (getValueByKey!136 lt!35097 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18365 (= lt!35095 (lemmaContainsTupThenGetReturnValue!53 lt!35097 (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18365 (= lt!35097 (insertStrictlySorted!56 (toList!721 call!6848) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))))))

(assert (=> d!18365 (= (+!96 call!6848 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)) lt!35094)))

(declare-fun b!76776 () Bool)

(declare-fun res!40371 () Bool)

(assert (=> b!76776 (=> (not res!40371) (not e!50118))))

(assert (=> b!76776 (= res!40371 (= (getValueByKey!136 (toList!721 lt!35094) (_1!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462))) (Some!141 (_2!1079 (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))))

(declare-fun b!76777 () Bool)

(assert (=> b!76777 (= e!50118 (contains!728 (toList!721 lt!35094) (tuple2!2137 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) lt!34462)))))

(assert (= (and d!18365 res!40372) b!76776))

(assert (= (and b!76776 res!40371) b!76777))

(declare-fun m!76943 () Bool)

(assert (=> d!18365 m!76943))

(declare-fun m!76945 () Bool)

(assert (=> d!18365 m!76945))

(declare-fun m!76947 () Bool)

(assert (=> d!18365 m!76947))

(declare-fun m!76949 () Bool)

(assert (=> d!18365 m!76949))

(declare-fun m!76951 () Bool)

(assert (=> b!76776 m!76951))

(declare-fun m!76953 () Bool)

(assert (=> b!76777 m!76953))

(assert (=> b!76173 d!18365))

(declare-fun d!18367 () Bool)

(declare-fun e!50121 () Bool)

(assert (=> d!18367 e!50121))

(declare-fun res!40378 () Bool)

(assert (=> d!18367 (=> (not res!40378) (not e!50121))))

(declare-fun lt!35103 () SeekEntryResult!232)

(assert (=> d!18367 (= res!40378 ((_ is Found!232) lt!35103))))

(assert (=> d!18367 (= lt!35103 (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun lt!35102 () Unit!2186)

(declare-fun choose!456 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2186)

(assert (=> d!18367 (= lt!35102 (choose!456 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18367 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18367 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)) lt!35102)))

(declare-fun b!76782 () Bool)

(declare-fun res!40377 () Bool)

(assert (=> b!76782 (=> (not res!40377) (not e!50121))))

(assert (=> b!76782 (= res!40377 (inRange!0 (index!3062 lt!35103) (mask!6229 newMap!16)))))

(declare-fun b!76783 () Bool)

(assert (=> b!76783 (= e!50121 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3062 lt!35103)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (=> b!76783 (and (bvsge (index!3062 lt!35103) #b00000000000000000000000000000000) (bvslt (index!3062 lt!35103) (size!2102 (_keys!3904 newMap!16))))))

(assert (= (and d!18367 res!40378) b!76782))

(assert (= (and b!76782 res!40377) b!76783))

(assert (=> d!18367 m!75749))

(assert (=> d!18367 m!75959))

(assert (=> d!18367 m!75749))

(declare-fun m!76955 () Bool)

(assert (=> d!18367 m!76955))

(assert (=> d!18367 m!76191))

(declare-fun m!76957 () Bool)

(assert (=> b!76782 m!76957))

(declare-fun m!76959 () Bool)

(assert (=> b!76783 m!76959))

(assert (=> bm!6845 d!18367))

(declare-fun d!18369 () Bool)

(declare-fun e!50122 () Bool)

(assert (=> d!18369 e!50122))

(declare-fun res!40380 () Bool)

(assert (=> d!18369 (=> (not res!40380) (not e!50122))))

(declare-fun lt!35104 () ListLongMap!1411)

(assert (=> d!18369 (= res!40380 (contains!726 lt!35104 (_1!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(declare-fun lt!35107 () List!1482)

(assert (=> d!18369 (= lt!35104 (ListLongMap!1412 lt!35107))))

(declare-fun lt!35106 () Unit!2186)

(declare-fun lt!35105 () Unit!2186)

(assert (=> d!18369 (= lt!35106 lt!35105)))

(assert (=> d!18369 (= (getValueByKey!136 lt!35107 (_1!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))) (Some!141 (_2!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(assert (=> d!18369 (= lt!35105 (lemmaContainsTupThenGetReturnValue!53 lt!35107 (_1!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (_2!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(assert (=> d!18369 (= lt!35107 (insertStrictlySorted!56 (toList!721 (ite c!11619 call!6879 (ite c!11620 call!6881 call!6880))) (_1!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) (_2!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))))))

(assert (=> d!18369 (= (+!96 (ite c!11619 call!6879 (ite c!11620 call!6881 call!6880)) (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))) lt!35104)))

(declare-fun b!76784 () Bool)

(declare-fun res!40379 () Bool)

(assert (=> b!76784 (=> (not res!40379) (not e!50122))))

(assert (=> b!76784 (= res!40379 (= (getValueByKey!136 (toList!721 lt!35104) (_1!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992))))))) (Some!141 (_2!1079 (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))))

(declare-fun b!76785 () Bool)

(assert (=> b!76785 (= e!50122 (contains!728 (toList!721 lt!35104) (ite (or c!11619 c!11620) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 (v!2561 (underlying!268 thiss!992)))) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2145 (v!2561 (underlying!268 thiss!992)))))))))

(assert (= (and d!18369 res!40380) b!76784))

(assert (= (and b!76784 res!40379) b!76785))

(declare-fun m!76961 () Bool)

(assert (=> d!18369 m!76961))

(declare-fun m!76963 () Bool)

(assert (=> d!18369 m!76963))

(declare-fun m!76965 () Bool)

(assert (=> d!18369 m!76965))

(declare-fun m!76967 () Bool)

(assert (=> d!18369 m!76967))

(declare-fun m!76969 () Bool)

(assert (=> b!76784 m!76969))

(declare-fun m!76971 () Bool)

(assert (=> b!76785 m!76971))

(assert (=> bm!6876 d!18369))

(declare-fun d!18371 () Bool)

(declare-fun e!50125 () Bool)

(assert (=> d!18371 e!50125))

(declare-fun c!11762 () Bool)

(assert (=> d!18371 (= c!11762 (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!18371 true))

(declare-fun _$29!96 () Unit!2186)

(assert (=> d!18371 (= (choose!446 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (_values!2229 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992))) (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) (zeroValue!2145 (v!2561 (underlying!268 thiss!992))) (minValue!2145 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992)))) _$29!96)))

(declare-fun b!76790 () Bool)

(assert (=> b!76790 (= e!50125 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!76791 () Bool)

(assert (=> b!76791 (= e!50125 (ite (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2099 (v!2561 (underlying!268 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18371 c!11762) b!76790))

(assert (= (and d!18371 (not c!11762)) b!76791))

(assert (=> b!76790 m!75749))

(assert (=> b!76790 m!75779))

(assert (=> d!18171 d!18371))

(assert (=> d!18171 d!18157))

(declare-fun b!76793 () Bool)

(declare-fun e!50126 () Option!142)

(declare-fun e!50127 () Option!142)

(assert (=> b!76793 (= e!50126 e!50127)))

(declare-fun c!11764 () Bool)

(assert (=> b!76793 (= c!11764 (and ((_ is Cons!1478) (toList!721 lt!34744)) (not (= (_1!1079 (h!2066 (toList!721 lt!34744))) (_1!1079 lt!34456)))))))

(declare-fun b!76794 () Bool)

(assert (=> b!76794 (= e!50127 (getValueByKey!136 (t!5068 (toList!721 lt!34744)) (_1!1079 lt!34456)))))

(declare-fun b!76792 () Bool)

(assert (=> b!76792 (= e!50126 (Some!141 (_2!1079 (h!2066 (toList!721 lt!34744)))))))

(declare-fun b!76795 () Bool)

(assert (=> b!76795 (= e!50127 None!140)))

(declare-fun d!18373 () Bool)

(declare-fun c!11763 () Bool)

(assert (=> d!18373 (= c!11763 (and ((_ is Cons!1478) (toList!721 lt!34744)) (= (_1!1079 (h!2066 (toList!721 lt!34744))) (_1!1079 lt!34456))))))

(assert (=> d!18373 (= (getValueByKey!136 (toList!721 lt!34744) (_1!1079 lt!34456)) e!50126)))

(assert (= (and d!18373 c!11763) b!76792))

(assert (= (and d!18373 (not c!11763)) b!76793))

(assert (= (and b!76793 c!11764) b!76794))

(assert (= (and b!76793 (not c!11764)) b!76795))

(declare-fun m!76973 () Bool)

(assert (=> b!76794 m!76973))

(assert (=> b!76324 d!18373))

(declare-fun d!18375 () Bool)

(assert (=> d!18375 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000)))

(declare-fun lt!35110 () Unit!2186)

(declare-fun choose!13 (array!3905 (_ BitVec 64) (_ BitVec 32)) Unit!2186)

(assert (=> d!18375 (= lt!35110 (choose!13 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000))))

(assert (=> d!18375 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!18375 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000) lt!35110)))

(declare-fun bs!3293 () Bool)

(assert (= bs!3293 d!18375))

(assert (=> bs!3293 m!76047))

(declare-fun m!76975 () Bool)

(assert (=> bs!3293 m!76975))

(assert (=> b!76257 d!18375))

(declare-fun d!18377 () Bool)

(declare-fun res!40381 () Bool)

(declare-fun e!50128 () Bool)

(assert (=> d!18377 (=> res!40381 e!50128)))

(assert (=> d!18377 (= res!40381 (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) lt!34703))))

(assert (=> d!18377 (= (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 #b00000000000000000000000000000000) e!50128)))

(declare-fun b!76796 () Bool)

(declare-fun e!50129 () Bool)

(assert (=> b!76796 (= e!50128 e!50129)))

(declare-fun res!40382 () Bool)

(assert (=> b!76796 (=> (not res!40382) (not e!50129))))

(assert (=> b!76796 (= res!40382 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))))

(declare-fun b!76797 () Bool)

(assert (=> b!76797 (= e!50129 (arrayContainsKey!0 (_keys!3904 (v!2561 (underlying!268 thiss!992))) lt!34703 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18377 (not res!40381)) b!76796))

(assert (= (and b!76796 res!40382) b!76797))

(assert (=> d!18377 m!76041))

(declare-fun m!76977 () Bool)

(assert (=> b!76797 m!76977))

(assert (=> b!76257 d!18377))

(declare-fun b!76798 () Bool)

(declare-fun e!50132 () SeekEntryResult!232)

(declare-fun e!50131 () SeekEntryResult!232)

(assert (=> b!76798 (= e!50132 e!50131)))

(declare-fun lt!35112 () (_ BitVec 64))

(declare-fun lt!35111 () SeekEntryResult!232)

(assert (=> b!76798 (= lt!35112 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (index!3063 lt!35111)))))

(declare-fun c!11766 () Bool)

(assert (=> b!76798 (= c!11766 (= lt!35112 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!76799 () Bool)

(declare-fun e!50130 () SeekEntryResult!232)

(assert (=> b!76799 (= e!50130 (MissingZero!232 (index!3063 lt!35111)))))

(declare-fun b!76800 () Bool)

(declare-fun c!11765 () Bool)

(assert (=> b!76800 (= c!11765 (= lt!35112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76800 (= e!50131 e!50130)))

(declare-fun b!76801 () Bool)

(assert (=> b!76801 (= e!50132 Undefined!232)))

(declare-fun d!18379 () Bool)

(declare-fun lt!35113 () SeekEntryResult!232)

(assert (=> d!18379 (and (or ((_ is Undefined!232) lt!35113) (not ((_ is Found!232) lt!35113)) (and (bvsge (index!3062 lt!35113) #b00000000000000000000000000000000) (bvslt (index!3062 lt!35113) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))) (or ((_ is Undefined!232) lt!35113) ((_ is Found!232) lt!35113) (not ((_ is MissingZero!232) lt!35113)) (and (bvsge (index!3061 lt!35113) #b00000000000000000000000000000000) (bvslt (index!3061 lt!35113) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))) (or ((_ is Undefined!232) lt!35113) ((_ is Found!232) lt!35113) ((_ is MissingZero!232) lt!35113) (not ((_ is MissingVacant!232) lt!35113)) (and (bvsge (index!3064 lt!35113) #b00000000000000000000000000000000) (bvslt (index!3064 lt!35113) (size!2102 (_keys!3904 (v!2561 (underlying!268 thiss!992))))))) (or ((_ is Undefined!232) lt!35113) (ite ((_ is Found!232) lt!35113) (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (index!3062 lt!35113)) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!232) lt!35113) (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (index!3061 lt!35113)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!232) lt!35113) (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) (index!3064 lt!35113)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18379 (= lt!35113 e!50132)))

(declare-fun c!11767 () Bool)

(assert (=> d!18379 (= c!11767 (and ((_ is Intermediate!232) lt!35111) (undefined!1044 lt!35111)))))

(assert (=> d!18379 (= lt!35111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) (mask!6229 (v!2561 (underlying!268 thiss!992)))) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))))))

(assert (=> d!18379 (validMask!0 (mask!6229 (v!2561 (underlying!268 thiss!992))))))

(assert (=> d!18379 (= (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))) lt!35113)))

(declare-fun b!76802 () Bool)

(assert (=> b!76802 (= e!50130 (seekKeyOrZeroReturnVacant!0 (x!11381 lt!35111) (index!3063 lt!35111) (index!3063 lt!35111) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) #b00000000000000000000000000000000) (_keys!3904 (v!2561 (underlying!268 thiss!992))) (mask!6229 (v!2561 (underlying!268 thiss!992)))))))

(declare-fun b!76803 () Bool)

(assert (=> b!76803 (= e!50131 (Found!232 (index!3063 lt!35111)))))

(assert (= (and d!18379 c!11767) b!76801))

(assert (= (and d!18379 (not c!11767)) b!76798))

(assert (= (and b!76798 c!11766) b!76803))

(assert (= (and b!76798 (not c!11766)) b!76800))

(assert (= (and b!76800 c!11765) b!76799))

(assert (= (and b!76800 (not c!11765)) b!76802))

(declare-fun m!76979 () Bool)

(assert (=> b!76798 m!76979))

(assert (=> d!18379 m!76041))

(declare-fun m!76981 () Bool)

(assert (=> d!18379 m!76981))

(declare-fun m!76983 () Bool)

(assert (=> d!18379 m!76983))

(declare-fun m!76985 () Bool)

(assert (=> d!18379 m!76985))

(assert (=> d!18379 m!76981))

(assert (=> d!18379 m!76041))

(declare-fun m!76987 () Bool)

(assert (=> d!18379 m!76987))

(assert (=> d!18379 m!75755))

(declare-fun m!76989 () Bool)

(assert (=> d!18379 m!76989))

(assert (=> b!76802 m!76041))

(declare-fun m!76991 () Bool)

(assert (=> b!76802 m!76991))

(assert (=> b!76257 d!18379))

(declare-fun d!18381 () Bool)

(assert (=> d!18381 (= (validKeyInArray!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) (and (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76353 d!18381))

(declare-fun b!76804 () Bool)

(declare-fun e!50133 () ListLongMap!1411)

(declare-fun call!6956 () ListLongMap!1411)

(assert (=> b!76804 (= e!50133 call!6956)))

(declare-fun b!76805 () Bool)

(declare-fun e!50136 () Bool)

(declare-fun lt!35133 () ListLongMap!1411)

(assert (=> b!76805 (= e!50136 (= (apply!77 lt!35133 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2145 newMap!16)))))

(declare-fun bm!6950 () Bool)

(declare-fun call!6957 () ListLongMap!1411)

(declare-fun call!6955 () ListLongMap!1411)

(assert (=> bm!6950 (= call!6957 call!6955)))

(declare-fun d!18383 () Bool)

(declare-fun e!50135 () Bool)

(assert (=> d!18383 e!50135))

(declare-fun res!40389 () Bool)

(assert (=> d!18383 (=> (not res!40389) (not e!50135))))

(assert (=> d!18383 (= res!40389 (or (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))))

(declare-fun lt!35115 () ListLongMap!1411)

(assert (=> d!18383 (= lt!35133 lt!35115)))

(declare-fun lt!35129 () Unit!2186)

(declare-fun e!50143 () Unit!2186)

(assert (=> d!18383 (= lt!35129 e!50143)))

(declare-fun c!11770 () Bool)

(declare-fun e!50138 () Bool)

(assert (=> d!18383 (= c!11770 e!50138)))

(declare-fun res!40388 () Bool)

(assert (=> d!18383 (=> (not res!40388) (not e!50138))))

(assert (=> d!18383 (= res!40388 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun e!50144 () ListLongMap!1411)

(assert (=> d!18383 (= lt!35115 e!50144)))

(declare-fun c!11771 () Bool)

(assert (=> d!18383 (= c!11771 (and (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18383 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18383 (= (getCurrentListMap!418 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)) lt!35133)))

(declare-fun b!76806 () Bool)

(declare-fun res!40391 () Bool)

(assert (=> b!76806 (=> (not res!40391) (not e!50135))))

(declare-fun e!50137 () Bool)

(assert (=> b!76806 (= res!40391 e!50137)))

(declare-fun res!40385 () Bool)

(assert (=> b!76806 (=> res!40385 e!50137)))

(declare-fun e!50145 () Bool)

(assert (=> b!76806 (= res!40385 (not e!50145))))

(declare-fun res!40387 () Bool)

(assert (=> b!76806 (=> (not res!40387) (not e!50145))))

(assert (=> b!76806 (= res!40387 (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76807 () Bool)

(assert (=> b!76807 (= e!50138 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76808 () Bool)

(declare-fun e!50134 () Bool)

(assert (=> b!76808 (= e!50134 (= (apply!77 lt!35133 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16))))))

(declare-fun b!76809 () Bool)

(declare-fun res!40384 () Bool)

(assert (=> b!76809 (=> (not res!40384) (not e!50135))))

(declare-fun e!50142 () Bool)

(assert (=> b!76809 (= res!40384 e!50142)))

(declare-fun c!11773 () Bool)

(assert (=> b!76809 (= c!11773 (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6951 () Bool)

(assert (=> bm!6951 (= call!6956 call!6957)))

(declare-fun b!76810 () Bool)

(declare-fun Unit!2215 () Unit!2186)

(assert (=> b!76810 (= e!50143 Unit!2215)))

(declare-fun b!76811 () Bool)

(declare-fun e!50139 () ListLongMap!1411)

(declare-fun call!6959 () ListLongMap!1411)

(assert (=> b!76811 (= e!50139 call!6959)))

(declare-fun b!76812 () Bool)

(declare-fun c!11769 () Bool)

(assert (=> b!76812 (= c!11769 (and (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!76812 (= e!50139 e!50133)))

(declare-fun call!6954 () ListLongMap!1411)

(declare-fun c!11772 () Bool)

(declare-fun bm!6952 () Bool)

(assert (=> bm!6952 (= call!6954 (+!96 (ite c!11771 call!6955 (ite c!11772 call!6957 call!6956)) (ite (or c!11771 c!11772) (tuple2!2137 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2145 newMap!16)) (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16))))))))

(declare-fun b!76813 () Bool)

(assert (=> b!76813 (= e!50145 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6953 () Bool)

(assert (=> bm!6953 (= call!6955 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun b!76814 () Bool)

(assert (=> b!76814 (= e!50142 e!50136)))

(declare-fun res!40386 () Bool)

(declare-fun call!6953 () Bool)

(assert (=> b!76814 (= res!40386 call!6953)))

(assert (=> b!76814 (=> (not res!40386) (not e!50136))))

(declare-fun bm!6954 () Bool)

(assert (=> bm!6954 (= call!6959 call!6954)))

(declare-fun b!76815 () Bool)

(assert (=> b!76815 (= e!50142 (not call!6953))))

(declare-fun b!76816 () Bool)

(declare-fun e!50141 () Bool)

(assert (=> b!76816 (= e!50137 e!50141)))

(declare-fun res!40383 () Bool)

(assert (=> b!76816 (=> (not res!40383) (not e!50141))))

(assert (=> b!76816 (= res!40383 (contains!726 lt!35133 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!76816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76817 () Bool)

(declare-fun lt!35124 () Unit!2186)

(assert (=> b!76817 (= e!50143 lt!35124)))

(declare-fun lt!35123 () ListLongMap!1411)

(assert (=> b!76817 (= lt!35123 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35126 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35121 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35121 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35117 () Unit!2186)

(assert (=> b!76817 (= lt!35117 (addStillContains!53 lt!35123 lt!35126 (zeroValue!2145 newMap!16) lt!35121))))

(assert (=> b!76817 (contains!726 (+!96 lt!35123 (tuple2!2137 lt!35126 (zeroValue!2145 newMap!16))) lt!35121)))

(declare-fun lt!35134 () Unit!2186)

(assert (=> b!76817 (= lt!35134 lt!35117)))

(declare-fun lt!35118 () ListLongMap!1411)

(assert (=> b!76817 (= lt!35118 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35114 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35135 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35135 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35131 () Unit!2186)

(assert (=> b!76817 (= lt!35131 (addApplyDifferent!53 lt!35118 lt!35114 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) lt!35135))))

(assert (=> b!76817 (= (apply!77 (+!96 lt!35118 (tuple2!2137 lt!35114 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)))) lt!35135) (apply!77 lt!35118 lt!35135))))

(declare-fun lt!35122 () Unit!2186)

(assert (=> b!76817 (= lt!35122 lt!35131)))

(declare-fun lt!35119 () ListLongMap!1411)

(assert (=> b!76817 (= lt!35119 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35125 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35125 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35132 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35132 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35127 () Unit!2186)

(assert (=> b!76817 (= lt!35127 (addApplyDifferent!53 lt!35119 lt!35125 (zeroValue!2145 newMap!16) lt!35132))))

(assert (=> b!76817 (= (apply!77 (+!96 lt!35119 (tuple2!2137 lt!35125 (zeroValue!2145 newMap!16))) lt!35132) (apply!77 lt!35119 lt!35132))))

(declare-fun lt!35128 () Unit!2186)

(assert (=> b!76817 (= lt!35128 lt!35127)))

(declare-fun lt!35116 () ListLongMap!1411)

(assert (=> b!76817 (= lt!35116 (getCurrentListMapNoExtraKeys!61 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) (zeroValue!2145 newMap!16) (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2246 newMap!16)))))

(declare-fun lt!35120 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35130 () (_ BitVec 64))

(assert (=> b!76817 (= lt!35130 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!76817 (= lt!35124 (addApplyDifferent!53 lt!35116 lt!35120 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)) lt!35130))))

(assert (=> b!76817 (= (apply!77 (+!96 lt!35116 (tuple2!2137 lt!35120 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)))) lt!35130) (apply!77 lt!35116 lt!35130))))

(declare-fun b!76818 () Bool)

(assert (=> b!76818 (= e!50133 call!6959)))

(declare-fun bm!6955 () Bool)

(declare-fun call!6958 () Bool)

(assert (=> bm!6955 (= call!6958 (contains!726 lt!35133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76819 () Bool)

(assert (=> b!76819 (= e!50144 e!50139)))

(assert (=> b!76819 (= c!11772 (and (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!6956 () Bool)

(assert (=> bm!6956 (= call!6953 (contains!726 lt!35133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!76820 () Bool)

(assert (=> b!76820 (= e!50141 (= (apply!77 lt!35133 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)) (get!1162 (select (arr!1863 (_values!2229 newMap!16)) #b00000000000000000000000000000000) (dynLambda!332 (defaultEntry!2246 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!76820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2103 (_values!2229 newMap!16))))))

(assert (=> b!76820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76821 () Bool)

(declare-fun e!50140 () Bool)

(assert (=> b!76821 (= e!50135 e!50140)))

(declare-fun c!11768 () Bool)

(assert (=> b!76821 (= c!11768 (not (= (bvand (ite c!11594 (ite c!11591 (extraKeys!2099 newMap!16) lt!34620) (extraKeys!2099 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!76822 () Bool)

(assert (=> b!76822 (= e!50140 (not call!6958))))

(declare-fun b!76823 () Bool)

(assert (=> b!76823 (= e!50140 e!50134)))

(declare-fun res!40390 () Bool)

(assert (=> b!76823 (= res!40390 call!6958)))

(assert (=> b!76823 (=> (not res!40390) (not e!50134))))

(declare-fun b!76824 () Bool)

(assert (=> b!76824 (= e!50144 (+!96 call!6954 (tuple2!2137 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11594 (ite c!11591 (minValue!2145 newMap!16) lt!34462) (minValue!2145 newMap!16)))))))

(assert (= (and d!18383 c!11771) b!76824))

(assert (= (and d!18383 (not c!11771)) b!76819))

(assert (= (and b!76819 c!11772) b!76811))

(assert (= (and b!76819 (not c!11772)) b!76812))

(assert (= (and b!76812 c!11769) b!76818))

(assert (= (and b!76812 (not c!11769)) b!76804))

(assert (= (or b!76818 b!76804) bm!6951))

(assert (= (or b!76811 bm!6951) bm!6950))

(assert (= (or b!76811 b!76818) bm!6954))

(assert (= (or b!76824 bm!6950) bm!6953))

(assert (= (or b!76824 bm!6954) bm!6952))

(assert (= (and d!18383 res!40388) b!76807))

(assert (= (and d!18383 c!11770) b!76817))

(assert (= (and d!18383 (not c!11770)) b!76810))

(assert (= (and d!18383 res!40389) b!76806))

(assert (= (and b!76806 res!40387) b!76813))

(assert (= (and b!76806 (not res!40385)) b!76816))

(assert (= (and b!76816 res!40383) b!76820))

(assert (= (and b!76806 res!40391) b!76809))

(assert (= (and b!76809 c!11773) b!76814))

(assert (= (and b!76809 (not c!11773)) b!76815))

(assert (= (and b!76814 res!40386) b!76805))

(assert (= (or b!76814 b!76815) bm!6956))

(assert (= (and b!76809 res!40384) b!76821))

(assert (= (and b!76821 c!11768) b!76823))

(assert (= (and b!76821 (not c!11768)) b!76822))

(assert (= (and b!76823 res!40390) b!76808))

(assert (= (or b!76823 b!76822) bm!6955))

(declare-fun b_lambda!3447 () Bool)

(assert (=> (not b_lambda!3447) (not b!76820)))

(assert (=> b!76820 t!5079))

(declare-fun b_and!4697 () Bool)

(assert (= b_and!4693 (and (=> t!5079 result!2741) b_and!4697)))

(assert (=> b!76820 t!5081))

(declare-fun b_and!4699 () Bool)

(assert (= b_and!4695 (and (=> t!5081 result!2743) b_and!4699)))

(assert (=> b!76820 m!76361))

(assert (=> b!76820 m!76213))

(declare-fun m!76993 () Bool)

(assert (=> b!76820 m!76993))

(assert (=> b!76820 m!76277))

(assert (=> b!76820 m!76361))

(assert (=> b!76820 m!76277))

(assert (=> b!76820 m!76365))

(assert (=> b!76820 m!76213))

(declare-fun m!76995 () Bool)

(assert (=> bm!6955 m!76995))

(declare-fun m!76997 () Bool)

(assert (=> bm!6953 m!76997))

(declare-fun m!76999 () Bool)

(assert (=> b!76817 m!76999))

(assert (=> b!76817 m!76213))

(declare-fun m!77001 () Bool)

(assert (=> b!76817 m!77001))

(declare-fun m!77003 () Bool)

(assert (=> b!76817 m!77003))

(declare-fun m!77005 () Bool)

(assert (=> b!76817 m!77005))

(declare-fun m!77007 () Bool)

(assert (=> b!76817 m!77007))

(declare-fun m!77009 () Bool)

(assert (=> b!76817 m!77009))

(assert (=> b!76817 m!76997))

(assert (=> b!76817 m!77007))

(declare-fun m!77011 () Bool)

(assert (=> b!76817 m!77011))

(assert (=> b!76817 m!77001))

(declare-fun m!77013 () Bool)

(assert (=> b!76817 m!77013))

(declare-fun m!77015 () Bool)

(assert (=> b!76817 m!77015))

(declare-fun m!77017 () Bool)

(assert (=> b!76817 m!77017))

(declare-fun m!77019 () Bool)

(assert (=> b!76817 m!77019))

(declare-fun m!77021 () Bool)

(assert (=> b!76817 m!77021))

(assert (=> b!76817 m!77021))

(declare-fun m!77023 () Bool)

(assert (=> b!76817 m!77023))

(declare-fun m!77025 () Bool)

(assert (=> b!76817 m!77025))

(declare-fun m!77027 () Bool)

(assert (=> b!76817 m!77027))

(assert (=> b!76817 m!77025))

(declare-fun m!77029 () Bool)

(assert (=> b!76808 m!77029))

(declare-fun m!77031 () Bool)

(assert (=> b!76824 m!77031))

(assert (=> d!18383 m!76191))

(assert (=> b!76807 m!76213))

(assert (=> b!76807 m!76213))

(assert (=> b!76807 m!76319))

(declare-fun m!77033 () Bool)

(assert (=> bm!6956 m!77033))

(assert (=> b!76813 m!76213))

(assert (=> b!76813 m!76213))

(assert (=> b!76813 m!76319))

(declare-fun m!77035 () Bool)

(assert (=> bm!6952 m!77035))

(assert (=> b!76816 m!76213))

(assert (=> b!76816 m!76213))

(declare-fun m!77037 () Bool)

(assert (=> b!76816 m!77037))

(declare-fun m!77039 () Bool)

(assert (=> b!76805 m!77039))

(assert (=> bm!6851 d!18383))

(declare-fun b!76841 () Bool)

(declare-fun res!40402 () Bool)

(declare-fun e!50156 () Bool)

(assert (=> b!76841 (=> (not res!40402) (not e!50156))))

(declare-fun lt!35141 () SeekEntryResult!232)

(assert (=> b!76841 (= res!40402 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3064 lt!35141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76841 (and (bvsge (index!3064 lt!35141) #b00000000000000000000000000000000) (bvslt (index!3064 lt!35141) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun b!76842 () Bool)

(declare-fun e!50155 () Bool)

(declare-fun e!50157 () Bool)

(assert (=> b!76842 (= e!50155 e!50157)))

(declare-fun res!40401 () Bool)

(declare-fun call!6965 () Bool)

(assert (=> b!76842 (= res!40401 call!6965)))

(assert (=> b!76842 (=> (not res!40401) (not e!50157))))

(declare-fun bm!6961 () Bool)

(declare-fun call!6964 () Bool)

(assert (=> bm!6961 (= call!6964 (arrayContainsKey!0 (_keys!3904 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!76843 () Bool)

(assert (=> b!76843 (and (bvsge (index!3061 lt!35141) #b00000000000000000000000000000000) (bvslt (index!3061 lt!35141) (size!2102 (_keys!3904 newMap!16))))))

(declare-fun res!40403 () Bool)

(assert (=> b!76843 (= res!40403 (= (select (arr!1862 (_keys!3904 newMap!16)) (index!3061 lt!35141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!76843 (=> (not res!40403) (not e!50157))))

(declare-fun c!11778 () Bool)

(declare-fun bm!6962 () Bool)

(assert (=> bm!6962 (= call!6965 (inRange!0 (ite c!11778 (index!3061 lt!35141) (index!3064 lt!35141)) (mask!6229 newMap!16)))))

(declare-fun b!76845 () Bool)

(declare-fun e!50154 () Bool)

(assert (=> b!76845 (= e!50155 e!50154)))

(declare-fun c!11779 () Bool)

(assert (=> b!76845 (= c!11779 ((_ is MissingVacant!232) lt!35141))))

(declare-fun b!76846 () Bool)

(assert (=> b!76846 (= e!50156 (not call!6964))))

(declare-fun b!76847 () Bool)

(assert (=> b!76847 (= e!50154 ((_ is Undefined!232) lt!35141))))

(declare-fun b!76848 () Bool)

(assert (=> b!76848 (= e!50157 (not call!6964))))

(declare-fun b!76844 () Bool)

(declare-fun res!40400 () Bool)

(assert (=> b!76844 (=> (not res!40400) (not e!50156))))

(assert (=> b!76844 (= res!40400 call!6965)))

(assert (=> b!76844 (= e!50154 e!50156)))

(declare-fun d!18385 () Bool)

(assert (=> d!18385 e!50155))

(assert (=> d!18385 (= c!11778 ((_ is MissingZero!232) lt!35141))))

(assert (=> d!18385 (= lt!35141 (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun lt!35140 () Unit!2186)

(declare-fun choose!457 (array!3905 array!3907 (_ BitVec 32) (_ BitVec 32) V!2961 V!2961 (_ BitVec 64) Int) Unit!2186)

(assert (=> d!18385 (= lt!35140 (choose!457 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)))))

(assert (=> d!18385 (validMask!0 (mask!6229 newMap!16))))

(assert (=> d!18385 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!26 (_keys!3904 newMap!16) (_values!2229 newMap!16) (mask!6229 newMap!16) (extraKeys!2099 newMap!16) (zeroValue!2145 newMap!16) (minValue!2145 newMap!16) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355) (defaultEntry!2246 newMap!16)) lt!35140)))

(assert (= (and d!18385 c!11778) b!76842))

(assert (= (and d!18385 (not c!11778)) b!76845))

(assert (= (and b!76842 res!40401) b!76843))

(assert (= (and b!76843 res!40403) b!76848))

(assert (= (and b!76845 c!11779) b!76844))

(assert (= (and b!76845 (not c!11779)) b!76847))

(assert (= (and b!76844 res!40400) b!76841))

(assert (= (and b!76841 res!40402) b!76846))

(assert (= (or b!76842 b!76844) bm!6962))

(assert (= (or b!76848 b!76846) bm!6961))

(declare-fun m!77041 () Bool)

(assert (=> b!76843 m!77041))

(assert (=> bm!6961 m!75749))

(assert (=> bm!6961 m!75971))

(assert (=> d!18385 m!75749))

(assert (=> d!18385 m!75959))

(assert (=> d!18385 m!75749))

(declare-fun m!77043 () Bool)

(assert (=> d!18385 m!77043))

(assert (=> d!18385 m!76191))

(declare-fun m!77045 () Bool)

(assert (=> b!76841 m!77045))

(declare-fun m!77047 () Bool)

(assert (=> bm!6962 m!77047))

(assert (=> bm!6836 d!18385))

(declare-fun d!18387 () Bool)

(declare-fun lt!35142 () Bool)

(assert (=> d!18387 (= lt!35142 (select (content!83 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun e!50159 () Bool)

(assert (=> d!18387 (= lt!35142 e!50159)))

(declare-fun res!40404 () Bool)

(assert (=> d!18387 (=> (not res!40404) (not e!50159))))

(assert (=> d!18387 (= res!40404 ((_ is Cons!1477) Nil!1478))))

(assert (=> d!18387 (= (contains!727 Nil!1478 (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)) lt!35142)))

(declare-fun b!76849 () Bool)

(declare-fun e!50158 () Bool)

(assert (=> b!76849 (= e!50159 e!50158)))

(declare-fun res!40405 () Bool)

(assert (=> b!76849 (=> res!40405 e!50158)))

(assert (=> b!76849 (= res!40405 (= (h!2065 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(declare-fun b!76850 () Bool)

(assert (=> b!76850 (= e!50158 (contains!727 (t!5067 Nil!1478) (select (arr!1862 (_keys!3904 (v!2561 (underlying!268 thiss!992)))) from!355)))))

(assert (= (and d!18387 res!40404) b!76849))

(assert (= (and b!76849 (not res!40405)) b!76850))

(assert (=> d!18387 m!76655))

(assert (=> d!18387 m!75749))

(declare-fun m!77049 () Bool)

(assert (=> d!18387 m!77049))

(assert (=> b!76850 m!75749))

(declare-fun m!77051 () Bool)

(assert (=> b!76850 m!77051))

(assert (=> b!76349 d!18387))

(declare-fun d!18389 () Bool)

(declare-fun res!40414 () Bool)

(declare-fun e!50162 () Bool)

(assert (=> d!18389 (=> (not res!40414) (not e!50162))))

(assert (=> d!18389 (= res!40414 (validMask!0 (mask!6229 newMap!16)))))

(assert (=> d!18389 (= (simpleValid!53 newMap!16) e!50162)))

(declare-fun b!76862 () Bool)

(assert (=> b!76862 (= e!50162 (and (bvsge (extraKeys!2099 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2099 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!402 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!76860 () Bool)

(declare-fun res!40415 () Bool)

(assert (=> b!76860 (=> (not res!40415) (not e!50162))))

(declare-fun size!2108 (LongMapFixedSize!706) (_ BitVec 32))

(assert (=> b!76860 (= res!40415 (bvsge (size!2108 newMap!16) (_size!402 newMap!16)))))

(declare-fun b!76859 () Bool)

(declare-fun res!40417 () Bool)

(assert (=> b!76859 (=> (not res!40417) (not e!50162))))

(assert (=> b!76859 (= res!40417 (and (= (size!2103 (_values!2229 newMap!16)) (bvadd (mask!6229 newMap!16) #b00000000000000000000000000000001)) (= (size!2102 (_keys!3904 newMap!16)) (size!2103 (_values!2229 newMap!16))) (bvsge (_size!402 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!402 newMap!16) (bvadd (mask!6229 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!76861 () Bool)

(declare-fun res!40416 () Bool)

(assert (=> b!76861 (=> (not res!40416) (not e!50162))))

(assert (=> b!76861 (= res!40416 (= (size!2108 newMap!16) (bvadd (_size!402 newMap!16) (bvsdiv (bvadd (extraKeys!2099 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!18389 res!40414) b!76859))

(assert (= (and b!76859 res!40417) b!76860))

(assert (= (and b!76860 res!40415) b!76861))

(assert (= (and b!76861 res!40416) b!76862))

(assert (=> d!18389 m!76191))

(declare-fun m!77053 () Bool)

(assert (=> b!76860 m!77053))

(assert (=> b!76861 m!77053))

(assert (=> d!18163 d!18389))

(assert (=> b!76255 d!18273))

(declare-fun d!18391 () Bool)

(assert (=> d!18391 (= (apply!77 lt!34692 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1166 (getValueByKey!136 (toList!721 lt!34692) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3294 () Bool)

(assert (= bs!3294 d!18391))

(assert (=> bs!3294 m!76665))

(assert (=> bs!3294 m!76665))

(declare-fun m!77055 () Bool)

(assert (=> bs!3294 m!77055))

(assert (=> b!76230 d!18391))

(assert (=> b!76351 d!18381))

(declare-fun b!76863 () Bool)

(declare-fun e!50164 () Bool)

(declare-fun e!50165 () Bool)

(assert (=> b!76863 (= e!50164 e!50165)))

(declare-fun c!11780 () Bool)

(assert (=> b!76863 (= c!11780 (validKeyInArray!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!76864 () Bool)

(declare-fun call!6966 () Bool)

(assert (=> b!76864 (= e!50165 call!6966)))

(declare-fun d!18393 () Bool)

(declare-fun res!40418 () Bool)

(assert (=> d!18393 (=> res!40418 e!50164)))

(assert (=> d!18393 (= res!40418 (bvsge #b00000000000000000000000000000000 (size!2102 (_keys!3904 newMap!16))))))

(assert (=> d!18393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3904 newMap!16) (mask!6229 newMap!16)) e!50164)))

(declare-fun b!76865 () Bool)

(declare-fun e!50163 () Bool)

(assert (=> b!76865 (= e!50165 e!50163)))

(declare-fun lt!35145 () (_ BitVec 64))

(assert (=> b!76865 (= lt!35145 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!35144 () Unit!2186)

(assert (=> b!76865 (= lt!35144 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3904 newMap!16) lt!35145 #b00000000000000000000000000000000))))

(assert (=> b!76865 (arrayContainsKey!0 (_keys!3904 newMap!16) lt!35145 #b00000000000000000000000000000000)))

(declare-fun lt!35143 () Unit!2186)

(assert (=> b!76865 (= lt!35143 lt!35144)))

(declare-fun res!40419 () Bool)

(assert (=> b!76865 (= res!40419 (= (seekEntryOrOpen!0 (select (arr!1862 (_keys!3904 newMap!16)) #b00000000000000000000000000000000) (_keys!3904 newMap!16) (mask!6229 newMap!16)) (Found!232 #b00000000000000000000000000000000)))))

(assert (=> b!76865 (=> (not res!40419) (not e!50163))))

(declare-fun bm!6963 () Bool)

(assert (=> bm!6963 (= call!6966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3904 newMap!16) (mask!6229 newMap!16)))))

(declare-fun b!76866 () Bool)

(assert (=> b!76866 (= e!50163 call!6966)))

(assert (= (and d!18393 (not res!40418)) b!76863))

(assert (= (and b!76863 c!11780) b!76865))

(assert (= (and b!76863 (not c!11780)) b!76864))

(assert (= (and b!76865 res!40419) b!76866))

(assert (= (or b!76866 b!76864) bm!6963))

(assert (=> b!76863 m!76213))

(assert (=> b!76863 m!76213))

(assert (=> b!76863 m!76319))

(assert (=> b!76865 m!76213))

(declare-fun m!77057 () Bool)

(assert (=> b!76865 m!77057))

(declare-fun m!77059 () Bool)

(assert (=> b!76865 m!77059))

(assert (=> b!76865 m!76213))

(declare-fun m!77061 () Bool)

(assert (=> b!76865 m!77061))

(declare-fun m!77063 () Bool)

(assert (=> bm!6963 m!77063))

(assert (=> b!76335 d!18393))

(declare-fun b!76867 () Bool)

(declare-fun e!50166 () Bool)

(assert (=> b!76867 (= e!50166 tp_is_empty!2485)))

(declare-fun b!76868 () Bool)

(declare-fun e!50167 () Bool)

(assert (=> b!76868 (= e!50167 tp_is_empty!2485)))

(declare-fun condMapEmpty!3233 () Bool)

(declare-fun mapDefault!3233 () ValueCell!899)

(assert (=> mapNonEmpty!3232 (= condMapEmpty!3233 (= mapRest!3232 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3233)))))

(declare-fun mapRes!3233 () Bool)

(assert (=> mapNonEmpty!3232 (= tp!8632 (and e!50167 mapRes!3233))))

(declare-fun mapNonEmpty!3233 () Bool)

(declare-fun tp!8633 () Bool)

(assert (=> mapNonEmpty!3233 (= mapRes!3233 (and tp!8633 e!50166))))

(declare-fun mapRest!3233 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapKey!3233 () (_ BitVec 32))

(declare-fun mapValue!3233 () ValueCell!899)

(assert (=> mapNonEmpty!3233 (= mapRest!3232 (store mapRest!3233 mapKey!3233 mapValue!3233))))

(declare-fun mapIsEmpty!3233 () Bool)

(assert (=> mapIsEmpty!3233 mapRes!3233))

(assert (= (and mapNonEmpty!3232 condMapEmpty!3233) mapIsEmpty!3233))

(assert (= (and mapNonEmpty!3232 (not condMapEmpty!3233)) mapNonEmpty!3233))

(assert (= (and mapNonEmpty!3233 ((_ is ValueCellFull!899) mapValue!3233)) b!76867))

(assert (= (and mapNonEmpty!3232 ((_ is ValueCellFull!899) mapDefault!3233)) b!76868))

(declare-fun m!77065 () Bool)

(assert (=> mapNonEmpty!3233 m!77065))

(declare-fun b!76869 () Bool)

(declare-fun e!50168 () Bool)

(assert (=> b!76869 (= e!50168 tp_is_empty!2485)))

(declare-fun b!76870 () Bool)

(declare-fun e!50169 () Bool)

(assert (=> b!76870 (= e!50169 tp_is_empty!2485)))

(declare-fun condMapEmpty!3234 () Bool)

(declare-fun mapDefault!3234 () ValueCell!899)

(assert (=> mapNonEmpty!3231 (= condMapEmpty!3234 (= mapRest!3231 ((as const (Array (_ BitVec 32) ValueCell!899)) mapDefault!3234)))))

(declare-fun mapRes!3234 () Bool)

(assert (=> mapNonEmpty!3231 (= tp!8631 (and e!50169 mapRes!3234))))

(declare-fun mapNonEmpty!3234 () Bool)

(declare-fun tp!8634 () Bool)

(assert (=> mapNonEmpty!3234 (= mapRes!3234 (and tp!8634 e!50168))))

(declare-fun mapRest!3234 () (Array (_ BitVec 32) ValueCell!899))

(declare-fun mapValue!3234 () ValueCell!899)

(declare-fun mapKey!3234 () (_ BitVec 32))

(assert (=> mapNonEmpty!3234 (= mapRest!3231 (store mapRest!3234 mapKey!3234 mapValue!3234))))

(declare-fun mapIsEmpty!3234 () Bool)

(assert (=> mapIsEmpty!3234 mapRes!3234))

(assert (= (and mapNonEmpty!3231 condMapEmpty!3234) mapIsEmpty!3234))

(assert (= (and mapNonEmpty!3231 (not condMapEmpty!3234)) mapNonEmpty!3234))

(assert (= (and mapNonEmpty!3234 ((_ is ValueCellFull!899) mapValue!3234)) b!76869))

(assert (= (and mapNonEmpty!3231 ((_ is ValueCellFull!899) mapDefault!3234)) b!76870))

(declare-fun m!77067 () Bool)

(assert (=> mapNonEmpty!3234 m!77067))

(declare-fun b_lambda!3449 () Bool)

(assert (= b_lambda!3447 (or (and b!75896 b_free!2137 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75913 b_free!2139) b_lambda!3449)))

(declare-fun b_lambda!3451 () Bool)

(assert (= b_lambda!3439 (or (and b!75896 b_free!2137 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75913 b_free!2139) b_lambda!3451)))

(declare-fun b_lambda!3453 () Bool)

(assert (= b_lambda!3441 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3453)))

(declare-fun b_lambda!3455 () Bool)

(assert (= b_lambda!3437 (or (and b!75896 b_free!2137 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75913 b_free!2139) b_lambda!3455)))

(declare-fun b_lambda!3457 () Bool)

(assert (= b_lambda!3445 (or (and b!75896 b_free!2137 (= (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))) (defaultEntry!2246 newMap!16))) (and b!75913 b_free!2139) b_lambda!3457)))

(declare-fun b_lambda!3459 () Bool)

(assert (= b_lambda!3443 (or (and b!75896 b_free!2137) (and b!75913 b_free!2139 (= (defaultEntry!2246 newMap!16) (defaultEntry!2246 (v!2561 (underlying!268 thiss!992))))) b_lambda!3459)))

(check-sat (not d!18385) (not bm!6956) (not b!76710) (not d!18379) (not b!76409) (not d!18227) (not b!76556) (not d!18347) (not b!76769) (not b!76752) (not b!76531) (not b!76728) (not d!18365) (not b!76594) (not b!76772) (not d!18205) (not b!76644) (not b!76648) (not b!76692) (not b!76463) (not b!76549) (not d!18375) (not bm!6961) (not bm!6903) (not b!76561) (not b!76813) (not b!76381) (not b!76417) (not b!76759) (not b!76600) (not b_next!2139) (not bm!6946) (not d!18241) (not b!76659) (not b!76485) (not b!76802) (not b!76709) (not b!76494) (not d!18331) (not b_lambda!3451) (not b!76706) (not b!76743) (not b!76658) (not d!18255) (not b!76541) (not b!76775) (not b!76860) (not d!18279) (not b!76794) (not bm!6941) (not b!76454) (not b!76756) (not d!18261) (not b!76776) (not b!76558) (not bm!6904) (not d!18265) (not b!76554) (not b!76824) (not d!18225) (not bm!6936) (not b!76557) (not bm!6906) (not bm!6918) (not b!76699) (not b!76503) (not d!18303) (not b!76670) (not b!76414) (not b!76790) (not b!76755) (not d!18213) (not d!18215) (not b!76376) (not b!76761) (not b!76653) (not b!76386) (not d!18183) (not b_lambda!3457) (not d!18243) (not b!76725) (not b!76777) (not b_lambda!3453) (not d!18351) (not b_lambda!3433) (not b!76482) (not b!76757) (not bm!6921) (not d!18323) (not d!18301) (not b!76495) (not d!18293) (not b!76805) (not mapNonEmpty!3234) (not b!76478) (not b!76816) (not b!76465) (not b!76817) (not b!76704) (not d!18317) (not b!76412) (not bm!6962) (not b!76500) (not b!76555) (not bm!6955) b_and!4699 (not b!76732) (not b!76568) (not b!76380) (not b!76765) (not b!76563) (not b!76461) (not d!18307) (not b!76457) (not b!76384) (not b!76697) b_and!4697 (not b!76584) (not b!76667) (not b!76534) (not d!18275) (not b!76387) (not b!76738) (not b!76664) (not b!76539) (not d!18335) (not b!76741) (not b!76374) (not b!76511) (not b_lambda!3431) (not d!18253) (not b!76770) (not d!18235) (not bm!6915) (not b!76782) (not b!76720) (not d!18211) (not bm!6912) (not b!76524) (not b!76662) (not b!76762) (not b!76502) (not d!18193) (not b!76533) (not b_lambda!3455) (not b!76560) (not b!76807) (not bm!6952) (not bm!6891) (not b!76423) (not d!18309) (not b!76424) (not b!76553) (not b!76705) (not bm!6937) (not b!76680) (not d!18341) (not d!18327) (not b!76552) (not d!18349) (not d!18325) (not d!18363) (not mapNonEmpty!3233) (not d!18229) (not b!76642) (not b_lambda!3459) (not b!76865) (not d!18387) (not b!76542) (not d!18291) (not b!76742) (not d!18369) (not b!76536) (not d!18197) (not bm!6911) (not d!18319) (not b!76758) (not d!18367) (not d!18263) (not d!18187) (not b!76512) (not d!18343) (not b_lambda!3423) (not bm!6899) (not b!76641) (not b!76736) (not b!76488) (not b!76570) (not d!18201) (not d!18299) (not d!18219) (not b!76863) (not b!76808) (not b!76717) (not d!18297) (not b!76526) (not b!76686) (not b_lambda!3435) (not d!18329) (not d!18321) (not d!18289) (not d!18359) (not b!76451) (not bm!6908) (not d!18389) (not b!76695) (not b!76669) (not b!76850) (not d!18191) (not d!18259) (not b!76737) (not b!76378) (not b!76754) (not b!76407) (not bm!6948) (not d!18271) (not b!76390) (not bm!6953) (not b!76760) (not b!76585) (not b!76565) (not d!18391) (not b!76579) (not b!76711) (not b!76698) (not d!18295) (not b!76677) (not b!76543) (not b!76671) (not b!76497) (not b!76797) (not b!76661) (not bm!6924) (not b!76528) (not b!76521) (not bm!6939) (not b!76474) (not bm!6945) (not b!76593) (not d!18357) (not d!18237) (not b!76820) (not bm!6907) (not b!76445) (not b!76785) (not b!76784) (not d!18345) (not d!18355) (not b!76590) (not b!76861) (not b!76712) (not d!18313) (not b!76583) (not d!18217) (not b!76693) (not b!76383) (not d!18269) (not d!18207) (not b!76515) (not d!18333) (not b_next!2137) (not b!76530) (not b!76388) tp_is_empty!2485 (not d!18221) (not b!76382) (not d!18181) (not bm!6914) (not b!76739) (not b!76587) (not b!76708) (not bm!6926) (not b!76750) (not b!76475) (not b!76411) (not b!76592) (not bm!6920) (not b!76519) (not b!76719) (not d!18281) (not d!18311) (not b!76640) (not d!18231) (not b!76729) (not b!76508) (not d!18287) (not b_lambda!3449) (not d!18383) (not b!76767) (not b!76471) (not b!76566) (not b!76522) (not bm!6949) (not bm!6916) (not d!18185) (not d!18239) (not b!76486) (not d!18315) (not d!18199) (not bm!6963) (not b!76603) (not b!76529) (not d!18305) (not d!18337) (not b!76656) (not b!76466))
(check-sat b_and!4697 b_and!4699 (not b_next!2137) (not b_next!2139))
