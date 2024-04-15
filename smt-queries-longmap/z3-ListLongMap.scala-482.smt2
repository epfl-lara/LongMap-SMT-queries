; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10146 () Bool)

(assert start!10146)

(declare-fun b!77160 () Bool)

(declare-fun b_free!2173 () Bool)

(declare-fun b_next!2173 () Bool)

(assert (=> b!77160 (= b_free!2173 (not b_next!2173))))

(declare-fun tp!8716 () Bool)

(declare-fun b_and!4725 () Bool)

(assert (=> b!77160 (= tp!8716 b_and!4725)))

(declare-fun b!77161 () Bool)

(declare-fun b_free!2175 () Bool)

(declare-fun b_next!2175 () Bool)

(assert (=> b!77161 (= b_free!2175 (not b_next!2175))))

(declare-fun tp!8715 () Bool)

(declare-fun b_and!4727 () Bool)

(assert (=> b!77161 (= tp!8715 b_and!4727)))

(declare-fun b!77150 () Bool)

(declare-fun res!40532 () Bool)

(declare-fun e!50438 () Bool)

(assert (=> b!77150 (=> (not res!40532) (not e!50438))))

(declare-datatypes ((V!2985 0))(
  ( (V!2986 (val!1296 Int)) )
))
(declare-datatypes ((array!3937 0))(
  ( (array!3938 (arr!1876 (Array (_ BitVec 32) (_ BitVec 64))) (size!2118 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!908 0))(
  ( (ValueCellFull!908 (v!2576 V!2985)) (EmptyCell!908) )
))
(declare-datatypes ((array!3939 0))(
  ( (array!3940 (arr!1877 (Array (_ BitVec 32) ValueCell!908)) (size!2119 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!724 0))(
  ( (LongMapFixedSize!725 (defaultEntry!2265 Int) (mask!6257 (_ BitVec 32)) (extraKeys!2116 (_ BitVec 32)) (zeroValue!2163 V!2985) (minValue!2163 V!2985) (_size!411 (_ BitVec 32)) (_keys!3924 array!3937) (_values!2248 array!3939) (_vacant!411 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!724)

(declare-fun valid!319 (LongMapFixedSize!724) Bool)

(assert (=> b!77150 (= res!40532 (valid!319 newMap!16))))

(declare-fun b!77151 () Bool)

(declare-fun e!50433 () Bool)

(declare-fun e!50430 () Bool)

(declare-fun mapRes!3276 () Bool)

(assert (=> b!77151 (= e!50433 (and e!50430 mapRes!3276))))

(declare-fun condMapEmpty!3276 () Bool)

(declare-datatypes ((Cell!520 0))(
  ( (Cell!521 (v!2577 LongMapFixedSize!724)) )
))
(declare-datatypes ((LongMap!520 0))(
  ( (LongMap!521 (underlying!271 Cell!520)) )
))
(declare-fun thiss!992 () LongMap!520)

(declare-fun mapDefault!3275 () ValueCell!908)

(assert (=> b!77151 (= condMapEmpty!3276 (= (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3275)))))

(declare-fun b!77152 () Bool)

(declare-fun e!50434 () Bool)

(declare-fun e!50427 () Bool)

(assert (=> b!77152 (= e!50434 e!50427)))

(declare-fun res!40536 () Bool)

(assert (=> b!77152 (=> (not res!40536) (not e!50427))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!77152 (= res!40536 (and (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35276 () V!2985)

(declare-fun get!1172 (ValueCell!908 V!2985) V!2985)

(declare-fun dynLambda!336 (Int (_ BitVec 64)) V!2985)

(assert (=> b!77152 (= lt!35276 (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) from!355) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77153 () Bool)

(declare-fun e!50436 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77153 (= e!50436 (not (validMask!0 (mask!6257 (v!2577 (underlying!271 thiss!992))))))))

(declare-datatypes ((tuple2!2166 0))(
  ( (tuple2!2167 (_1!1094 (_ BitVec 64)) (_2!1094 V!2985)) )
))
(declare-datatypes ((List!1507 0))(
  ( (Nil!1504) (Cons!1503 (h!2091 tuple2!2166) (t!5132 List!1507)) )
))
(declare-datatypes ((ListLongMap!1429 0))(
  ( (ListLongMap!1430 (toList!730 List!1507)) )
))
(declare-fun lt!35281 () ListLongMap!1429)

(declare-fun lt!35280 () tuple2!2166)

(declare-fun lt!35267 () ListLongMap!1429)

(declare-fun lt!35265 () tuple2!2166)

(declare-fun +!102 (ListLongMap!1429 tuple2!2166) ListLongMap!1429)

(assert (=> b!77153 (= (+!102 lt!35267 lt!35265) (+!102 (+!102 lt!35281 lt!35265) lt!35280))))

(assert (=> b!77153 (= lt!35265 (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(declare-datatypes ((Unit!2232 0))(
  ( (Unit!2233) )
))
(declare-fun lt!35277 () Unit!2232)

(declare-fun addCommutativeForDiffKeys!21 (ListLongMap!1429 (_ BitVec 64) V!2985 (_ BitVec 64) V!2985) Unit!2232)

(assert (=> b!77153 (= lt!35277 (addCommutativeForDiffKeys!21 lt!35281 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun lt!35273 () ListLongMap!1429)

(assert (=> b!77153 (= lt!35273 lt!35267)))

(assert (=> b!77153 (= lt!35267 (+!102 lt!35281 lt!35280))))

(declare-fun lt!35266 () ListLongMap!1429)

(declare-fun lt!35282 () tuple2!2166)

(assert (=> b!77153 (= lt!35273 (+!102 lt!35266 lt!35282))))

(declare-fun lt!35274 () ListLongMap!1429)

(assert (=> b!77153 (= lt!35281 (+!102 lt!35274 lt!35282))))

(assert (=> b!77153 (= lt!35282 (tuple2!2167 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(assert (=> b!77153 (= lt!35266 (+!102 lt!35274 lt!35280))))

(assert (=> b!77153 (= lt!35280 (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276))))

(declare-fun lt!35279 () Unit!2232)

(assert (=> b!77153 (= lt!35279 (addCommutativeForDiffKeys!21 lt!35274 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!66 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) ListLongMap!1429)

(assert (=> b!77153 (= lt!35274 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77154 () Bool)

(declare-fun res!40531 () Bool)

(assert (=> b!77154 (=> (not res!40531) (not e!50438))))

(assert (=> b!77154 (= res!40531 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6257 newMap!16)) (_size!411 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77155 () Bool)

(declare-fun e!50435 () Bool)

(declare-fun tp_is_empty!2503 () Bool)

(assert (=> b!77155 (= e!50435 tp_is_empty!2503)))

(declare-fun b!77156 () Bool)

(declare-fun e!50431 () Bool)

(assert (=> b!77156 (= e!50431 tp_is_empty!2503)))

(declare-fun b!77157 () Bool)

(assert (=> b!77157 (= e!50427 e!50436)))

(declare-fun res!40534 () Bool)

(assert (=> b!77157 (=> (not res!40534) (not e!50436))))

(declare-datatypes ((tuple2!2168 0))(
  ( (tuple2!2169 (_1!1095 Bool) (_2!1095 LongMapFixedSize!724)) )
))
(declare-fun lt!35272 () tuple2!2168)

(assert (=> b!77157 (= res!40534 (and (_1!1095 lt!35272) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35278 () Unit!2232)

(declare-fun e!50428 () Unit!2232)

(assert (=> b!77157 (= lt!35278 e!50428)))

(declare-fun c!11759 () Bool)

(declare-fun lt!35275 () ListLongMap!1429)

(declare-fun contains!735 (ListLongMap!1429 (_ BitVec 64)) Bool)

(assert (=> b!77157 (= c!11759 (contains!735 lt!35275 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun update!113 (LongMapFixedSize!724 (_ BitVec 64) V!2985) tuple2!2168)

(assert (=> b!77157 (= lt!35272 (update!113 newMap!16 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276))))

(declare-fun mapIsEmpty!3275 () Bool)

(assert (=> mapIsEmpty!3275 mapRes!3276))

(declare-fun b!77158 () Bool)

(declare-fun e!50429 () Bool)

(declare-fun e!50437 () Bool)

(assert (=> b!77158 (= e!50429 e!50437)))

(declare-fun b!77159 () Bool)

(declare-fun e!50442 () Bool)

(declare-fun e!50443 () Bool)

(declare-fun mapRes!3275 () Bool)

(assert (=> b!77159 (= e!50442 (and e!50443 mapRes!3275))))

(declare-fun condMapEmpty!3275 () Bool)

(declare-fun mapDefault!3276 () ValueCell!908)

(assert (=> b!77159 (= condMapEmpty!3275 (= (arr!1877 (_values!2248 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3276)))))

(declare-fun array_inv!1177 (array!3937) Bool)

(declare-fun array_inv!1178 (array!3939) Bool)

(assert (=> b!77160 (= e!50437 (and tp!8716 tp_is_empty!2503 (array_inv!1177 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (array_inv!1178 (_values!2248 (v!2577 (underlying!271 thiss!992)))) e!50433))))

(declare-fun mapNonEmpty!3275 () Bool)

(declare-fun tp!8718 () Bool)

(assert (=> mapNonEmpty!3275 (= mapRes!3276 (and tp!8718 e!50431))))

(declare-fun mapValue!3275 () ValueCell!908)

(declare-fun mapRest!3276 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapKey!3276 () (_ BitVec 32))

(assert (=> mapNonEmpty!3275 (= (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (store mapRest!3276 mapKey!3276 mapValue!3275))))

(declare-fun e!50441 () Bool)

(assert (=> b!77161 (= e!50441 (and tp!8715 tp_is_empty!2503 (array_inv!1177 (_keys!3924 newMap!16)) (array_inv!1178 (_values!2248 newMap!16)) e!50442))))

(declare-fun res!40530 () Bool)

(assert (=> start!10146 (=> (not res!40530) (not e!50438))))

(declare-fun valid!320 (LongMap!520) Bool)

(assert (=> start!10146 (= res!40530 (valid!320 thiss!992))))

(assert (=> start!10146 e!50438))

(declare-fun e!50432 () Bool)

(assert (=> start!10146 e!50432))

(assert (=> start!10146 true))

(assert (=> start!10146 e!50441))

(declare-fun b!77149 () Bool)

(assert (=> b!77149 (= e!50443 tp_is_empty!2503)))

(declare-fun mapIsEmpty!3276 () Bool)

(assert (=> mapIsEmpty!3276 mapRes!3275))

(declare-fun b!77162 () Bool)

(assert (=> b!77162 (= e!50432 e!50429)))

(declare-fun b!77163 () Bool)

(declare-fun Unit!2234 () Unit!2232)

(assert (=> b!77163 (= e!50428 Unit!2234)))

(declare-fun lt!35270 () Unit!2232)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!58 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) (_ BitVec 32) Int) Unit!2232)

(assert (=> b!77163 (= lt!35270 (lemmaListMapContainsThenArrayContainsFrom!58 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77163 (arrayContainsKey!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35269 () Unit!2232)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3937 (_ BitVec 32) (_ BitVec 32)) Unit!2232)

(assert (=> b!77163 (= lt!35269 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1508 0))(
  ( (Nil!1505) (Cons!1504 (h!2092 (_ BitVec 64)) (t!5133 List!1508)) )
))
(declare-fun arrayNoDuplicates!0 (array!3937 (_ BitVec 32) List!1508) Bool)

(assert (=> b!77163 (arrayNoDuplicates!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) from!355 Nil!1505)))

(declare-fun lt!35268 () Unit!2232)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3937 (_ BitVec 32) (_ BitVec 64) List!1508) Unit!2232)

(assert (=> b!77163 (= lt!35268 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (Cons!1504 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) Nil!1505)))))

(assert (=> b!77163 false))

(declare-fun b!77164 () Bool)

(declare-fun Unit!2235 () Unit!2232)

(assert (=> b!77164 (= e!50428 Unit!2235)))

(declare-fun mapNonEmpty!3276 () Bool)

(declare-fun tp!8717 () Bool)

(assert (=> mapNonEmpty!3276 (= mapRes!3275 (and tp!8717 e!50435))))

(declare-fun mapValue!3276 () ValueCell!908)

(declare-fun mapKey!3275 () (_ BitVec 32))

(declare-fun mapRest!3275 () (Array (_ BitVec 32) ValueCell!908))

(assert (=> mapNonEmpty!3276 (= (arr!1877 (_values!2248 newMap!16)) (store mapRest!3275 mapKey!3275 mapValue!3276))))

(declare-fun b!77165 () Bool)

(assert (=> b!77165 (= e!50430 tp_is_empty!2503)))

(declare-fun b!77166 () Bool)

(assert (=> b!77166 (= e!50438 e!50434)))

(declare-fun res!40533 () Bool)

(assert (=> b!77166 (=> (not res!40533) (not e!50434))))

(declare-fun lt!35271 () ListLongMap!1429)

(assert (=> b!77166 (= res!40533 (= lt!35271 lt!35275))))

(declare-fun map!1170 (LongMapFixedSize!724) ListLongMap!1429)

(assert (=> b!77166 (= lt!35275 (map!1170 newMap!16))))

(declare-fun getCurrentListMap!420 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) ListLongMap!1429)

(assert (=> b!77166 (= lt!35271 (getCurrentListMap!420 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77167 () Bool)

(declare-fun res!40535 () Bool)

(assert (=> b!77167 (=> (not res!40535) (not e!50438))))

(assert (=> b!77167 (= res!40535 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992)))))))))

(assert (= (and start!10146 res!40530) b!77167))

(assert (= (and b!77167 res!40535) b!77150))

(assert (= (and b!77150 res!40532) b!77154))

(assert (= (and b!77154 res!40531) b!77166))

(assert (= (and b!77166 res!40533) b!77152))

(assert (= (and b!77152 res!40536) b!77157))

(assert (= (and b!77157 c!11759) b!77163))

(assert (= (and b!77157 (not c!11759)) b!77164))

(assert (= (and b!77157 res!40534) b!77153))

(assert (= (and b!77151 condMapEmpty!3276) mapIsEmpty!3275))

(assert (= (and b!77151 (not condMapEmpty!3276)) mapNonEmpty!3275))

(get-info :version)

(assert (= (and mapNonEmpty!3275 ((_ is ValueCellFull!908) mapValue!3275)) b!77156))

(assert (= (and b!77151 ((_ is ValueCellFull!908) mapDefault!3275)) b!77165))

(assert (= b!77160 b!77151))

(assert (= b!77158 b!77160))

(assert (= b!77162 b!77158))

(assert (= start!10146 b!77162))

(assert (= (and b!77159 condMapEmpty!3275) mapIsEmpty!3276))

(assert (= (and b!77159 (not condMapEmpty!3275)) mapNonEmpty!3276))

(assert (= (and mapNonEmpty!3276 ((_ is ValueCellFull!908) mapValue!3276)) b!77155))

(assert (= (and b!77159 ((_ is ValueCellFull!908) mapDefault!3276)) b!77149))

(assert (= b!77161 b!77159))

(assert (= start!10146 b!77161))

(declare-fun b_lambda!3449 () Bool)

(assert (=> (not b_lambda!3449) (not b!77152)))

(declare-fun t!5129 () Bool)

(declare-fun tb!1597 () Bool)

(assert (=> (and b!77160 (= (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))) t!5129) tb!1597))

(declare-fun result!2781 () Bool)

(assert (=> tb!1597 (= result!2781 tp_is_empty!2503)))

(assert (=> b!77152 t!5129))

(declare-fun b_and!4729 () Bool)

(assert (= b_and!4725 (and (=> t!5129 result!2781) b_and!4729)))

(declare-fun t!5131 () Bool)

(declare-fun tb!1599 () Bool)

(assert (=> (and b!77161 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))) t!5131) tb!1599))

(declare-fun result!2785 () Bool)

(assert (= result!2785 result!2781))

(assert (=> b!77152 t!5131))

(declare-fun b_and!4731 () Bool)

(assert (= b_and!4727 (and (=> t!5131 result!2785) b_and!4731)))

(declare-fun m!76987 () Bool)

(assert (=> mapNonEmpty!3276 m!76987))

(declare-fun m!76989 () Bool)

(assert (=> start!10146 m!76989))

(declare-fun m!76991 () Bool)

(assert (=> b!77152 m!76991))

(declare-fun m!76993 () Bool)

(assert (=> b!77152 m!76993))

(declare-fun m!76995 () Bool)

(assert (=> b!77152 m!76995))

(assert (=> b!77152 m!76993))

(assert (=> b!77152 m!76995))

(declare-fun m!76997 () Bool)

(assert (=> b!77152 m!76997))

(declare-fun m!76999 () Bool)

(assert (=> b!77166 m!76999))

(declare-fun m!77001 () Bool)

(assert (=> b!77166 m!77001))

(declare-fun m!77003 () Bool)

(assert (=> mapNonEmpty!3275 m!77003))

(declare-fun m!77005 () Bool)

(assert (=> b!77150 m!77005))

(declare-fun m!77007 () Bool)

(assert (=> b!77163 m!77007))

(declare-fun m!77009 () Bool)

(assert (=> b!77163 m!77009))

(assert (=> b!77163 m!76991))

(declare-fun m!77011 () Bool)

(assert (=> b!77163 m!77011))

(assert (=> b!77163 m!76991))

(assert (=> b!77163 m!76991))

(declare-fun m!77013 () Bool)

(assert (=> b!77163 m!77013))

(assert (=> b!77163 m!76991))

(declare-fun m!77015 () Bool)

(assert (=> b!77163 m!77015))

(declare-fun m!77017 () Bool)

(assert (=> b!77161 m!77017))

(declare-fun m!77019 () Bool)

(assert (=> b!77161 m!77019))

(declare-fun m!77021 () Bool)

(assert (=> b!77153 m!77021))

(assert (=> b!77153 m!77021))

(declare-fun m!77023 () Bool)

(assert (=> b!77153 m!77023))

(declare-fun m!77025 () Bool)

(assert (=> b!77153 m!77025))

(assert (=> b!77153 m!76991))

(declare-fun m!77027 () Bool)

(assert (=> b!77153 m!77027))

(declare-fun m!77029 () Bool)

(assert (=> b!77153 m!77029))

(declare-fun m!77031 () Bool)

(assert (=> b!77153 m!77031))

(declare-fun m!77033 () Bool)

(assert (=> b!77153 m!77033))

(assert (=> b!77153 m!76991))

(declare-fun m!77035 () Bool)

(assert (=> b!77153 m!77035))

(declare-fun m!77037 () Bool)

(assert (=> b!77153 m!77037))

(declare-fun m!77039 () Bool)

(assert (=> b!77153 m!77039))

(assert (=> b!77153 m!76991))

(declare-fun m!77041 () Bool)

(assert (=> b!77153 m!77041))

(assert (=> b!77157 m!76991))

(assert (=> b!77157 m!76991))

(declare-fun m!77043 () Bool)

(assert (=> b!77157 m!77043))

(assert (=> b!77157 m!76991))

(declare-fun m!77045 () Bool)

(assert (=> b!77157 m!77045))

(declare-fun m!77047 () Bool)

(assert (=> b!77160 m!77047))

(declare-fun m!77049 () Bool)

(assert (=> b!77160 m!77049))

(check-sat (not mapNonEmpty!3275) (not b_lambda!3449) b_and!4731 (not b!77160) (not b!77163) b_and!4729 tp_is_empty!2503 (not b!77166) (not b!77150) (not b!77153) (not b_next!2175) (not b!77152) (not b!77157) (not b_next!2173) (not start!10146) (not mapNonEmpty!3276) (not b!77161))
(check-sat b_and!4729 b_and!4731 (not b_next!2173) (not b_next!2175))
(get-model)

(declare-fun b_lambda!3455 () Bool)

(assert (= b_lambda!3449 (or (and b!77160 b_free!2173) (and b!77161 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))))) b_lambda!3455)))

(check-sat (not mapNonEmpty!3275) b_and!4731 (not b!77160) (not b!77163) b_and!4729 (not b_lambda!3455) tp_is_empty!2503 (not b!77166) (not b!77150) (not b!77153) (not b_next!2175) (not b!77152) (not b!77157) (not b_next!2173) (not start!10146) (not mapNonEmpty!3276) (not b!77161))
(check-sat b_and!4729 b_and!4731 (not b_next!2173) (not b_next!2175))
(get-model)

(declare-fun d!18293 () Bool)

(assert (=> d!18293 (= (+!102 (+!102 lt!35281 (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276)) (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992))))) (+!102 (+!102 lt!35281 (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992))))) (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276)))))

(declare-fun lt!35393 () Unit!2232)

(declare-fun choose!458 (ListLongMap!1429 (_ BitVec 64) V!2985 (_ BitVec 64) V!2985) Unit!2232)

(assert (=> d!18293 (= lt!35393 (choose!458 lt!35281 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(assert (=> d!18293 (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18293 (= (addCommutativeForDiffKeys!21 lt!35281 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992)))) lt!35393)))

(declare-fun bs!3283 () Bool)

(assert (= bs!3283 d!18293))

(declare-fun m!77179 () Bool)

(assert (=> bs!3283 m!77179))

(declare-fun m!77181 () Bool)

(assert (=> bs!3283 m!77181))

(assert (=> bs!3283 m!76991))

(declare-fun m!77183 () Bool)

(assert (=> bs!3283 m!77183))

(assert (=> bs!3283 m!77181))

(declare-fun m!77185 () Bool)

(assert (=> bs!3283 m!77185))

(assert (=> bs!3283 m!77179))

(declare-fun m!77187 () Bool)

(assert (=> bs!3283 m!77187))

(assert (=> b!77153 d!18293))

(declare-fun d!18295 () Bool)

(declare-fun e!50564 () Bool)

(assert (=> d!18295 e!50564))

(declare-fun res!40589 () Bool)

(assert (=> d!18295 (=> (not res!40589) (not e!50564))))

(declare-fun lt!35409 () ListLongMap!1429)

(assert (=> d!18295 (= res!40589 (not (contains!735 lt!35409 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!50562 () ListLongMap!1429)

(assert (=> d!18295 (= lt!35409 e!50562)))

(declare-fun c!11777 () Bool)

(assert (=> d!18295 (= c!11777 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(assert (=> d!18295 (validMask!0 (mask!6257 (v!2577 (underlying!271 thiss!992))))))

(assert (=> d!18295 (= (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))) lt!35409)))

(declare-fun bm!6956 () Bool)

(declare-fun call!6959 () ListLongMap!1429)

(assert (=> bm!6956 (= call!6959 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77312 () Bool)

(declare-fun e!50566 () Bool)

(declare-fun e!50563 () Bool)

(assert (=> b!77312 (= e!50566 e!50563)))

(assert (=> b!77312 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun res!40588 () Bool)

(assert (=> b!77312 (= res!40588 (contains!735 lt!35409 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77312 (=> (not res!40588) (not e!50563))))

(declare-fun b!77313 () Bool)

(declare-fun e!50560 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!77313 (= e!50560 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77313 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!77314 () Bool)

(declare-fun res!40590 () Bool)

(assert (=> b!77314 (=> (not res!40590) (not e!50564))))

(assert (=> b!77314 (= res!40590 (not (contains!735 lt!35409 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77315 () Bool)

(declare-fun e!50565 () Bool)

(assert (=> b!77315 (= e!50566 e!50565)))

(declare-fun c!11775 () Bool)

(assert (=> b!77315 (= c!11775 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77316 () Bool)

(assert (=> b!77316 (= e!50565 (= lt!35409 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77317 () Bool)

(declare-fun e!50561 () ListLongMap!1429)

(assert (=> b!77317 (= e!50562 e!50561)))

(declare-fun c!11776 () Bool)

(assert (=> b!77317 (= c!11776 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77318 () Bool)

(assert (=> b!77318 (= e!50564 e!50566)))

(declare-fun c!11774 () Bool)

(assert (=> b!77318 (= c!11774 e!50560)))

(declare-fun res!40587 () Bool)

(assert (=> b!77318 (=> (not res!40587) (not e!50560))))

(assert (=> b!77318 (= res!40587 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77319 () Bool)

(declare-fun lt!35410 () Unit!2232)

(declare-fun lt!35411 () Unit!2232)

(assert (=> b!77319 (= lt!35410 lt!35411)))

(declare-fun lt!35414 () ListLongMap!1429)

(declare-fun lt!35408 () (_ BitVec 64))

(declare-fun lt!35412 () (_ BitVec 64))

(declare-fun lt!35413 () V!2985)

(assert (=> b!77319 (not (contains!735 (+!102 lt!35414 (tuple2!2167 lt!35408 lt!35413)) lt!35412))))

(declare-fun addStillNotContains!28 (ListLongMap!1429 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2232)

(assert (=> b!77319 (= lt!35411 (addStillNotContains!28 lt!35414 lt!35408 lt!35413 lt!35412))))

(assert (=> b!77319 (= lt!35412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!77319 (= lt!35413 (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77319 (= lt!35408 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!77319 (= lt!35414 call!6959)))

(assert (=> b!77319 (= e!50561 (+!102 call!6959 (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!77320 () Bool)

(assert (=> b!77320 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(assert (=> b!77320 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2119 (_values!2248 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun apply!78 (ListLongMap!1429 (_ BitVec 64)) V!2985)

(assert (=> b!77320 (= e!50563 (= (apply!78 lt!35409 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!77321 () Bool)

(assert (=> b!77321 (= e!50561 call!6959)))

(declare-fun b!77322 () Bool)

(assert (=> b!77322 (= e!50562 (ListLongMap!1430 Nil!1504))))

(declare-fun b!77323 () Bool)

(declare-fun isEmpty!329 (ListLongMap!1429) Bool)

(assert (=> b!77323 (= e!50565 (isEmpty!329 lt!35409))))

(assert (= (and d!18295 c!11777) b!77322))

(assert (= (and d!18295 (not c!11777)) b!77317))

(assert (= (and b!77317 c!11776) b!77319))

(assert (= (and b!77317 (not c!11776)) b!77321))

(assert (= (or b!77319 b!77321) bm!6956))

(assert (= (and d!18295 res!40589) b!77314))

(assert (= (and b!77314 res!40590) b!77318))

(assert (= (and b!77318 res!40587) b!77313))

(assert (= (and b!77318 c!11774) b!77312))

(assert (= (and b!77318 (not c!11774)) b!77315))

(assert (= (and b!77312 res!40588) b!77320))

(assert (= (and b!77315 c!11775) b!77316))

(assert (= (and b!77315 (not c!11775)) b!77323))

(declare-fun b_lambda!3457 () Bool)

(assert (=> (not b_lambda!3457) (not b!77319)))

(assert (=> b!77319 t!5129))

(declare-fun b_and!4749 () Bool)

(assert (= b_and!4729 (and (=> t!5129 result!2781) b_and!4749)))

(assert (=> b!77319 t!5131))

(declare-fun b_and!4751 () Bool)

(assert (= b_and!4731 (and (=> t!5131 result!2785) b_and!4751)))

(declare-fun b_lambda!3459 () Bool)

(assert (=> (not b_lambda!3459) (not b!77320)))

(assert (=> b!77320 t!5129))

(declare-fun b_and!4753 () Bool)

(assert (= b_and!4749 (and (=> t!5129 result!2781) b_and!4753)))

(assert (=> b!77320 t!5131))

(declare-fun b_and!4755 () Bool)

(assert (= b_and!4751 (and (=> t!5131 result!2785) b_and!4755)))

(declare-fun m!77189 () Bool)

(assert (=> bm!6956 m!77189))

(assert (=> b!77316 m!77189))

(declare-fun m!77191 () Bool)

(assert (=> b!77319 m!77191))

(declare-fun m!77193 () Bool)

(assert (=> b!77319 m!77193))

(assert (=> b!77319 m!76995))

(declare-fun m!77195 () Bool)

(assert (=> b!77319 m!77195))

(declare-fun m!77197 () Bool)

(assert (=> b!77319 m!77197))

(assert (=> b!77319 m!76995))

(declare-fun m!77199 () Bool)

(assert (=> b!77319 m!77199))

(assert (=> b!77319 m!77191))

(declare-fun m!77201 () Bool)

(assert (=> b!77319 m!77201))

(declare-fun m!77203 () Bool)

(assert (=> b!77319 m!77203))

(assert (=> b!77319 m!77193))

(assert (=> b!77313 m!77197))

(assert (=> b!77313 m!77197))

(declare-fun m!77205 () Bool)

(assert (=> b!77313 m!77205))

(assert (=> b!77317 m!77197))

(assert (=> b!77317 m!77197))

(assert (=> b!77317 m!77205))

(declare-fun m!77207 () Bool)

(assert (=> b!77314 m!77207))

(assert (=> b!77320 m!77197))

(declare-fun m!77209 () Bool)

(assert (=> b!77320 m!77209))

(assert (=> b!77320 m!77193))

(assert (=> b!77320 m!77193))

(assert (=> b!77320 m!76995))

(assert (=> b!77320 m!77195))

(assert (=> b!77320 m!77197))

(assert (=> b!77320 m!76995))

(declare-fun m!77211 () Bool)

(assert (=> b!77323 m!77211))

(assert (=> b!77312 m!77197))

(assert (=> b!77312 m!77197))

(declare-fun m!77213 () Bool)

(assert (=> b!77312 m!77213))

(declare-fun m!77215 () Bool)

(assert (=> d!18295 m!77215))

(assert (=> d!18295 m!77025))

(assert (=> b!77153 d!18295))

(declare-fun d!18297 () Bool)

(declare-fun e!50569 () Bool)

(assert (=> d!18297 e!50569))

(declare-fun res!40596 () Bool)

(assert (=> d!18297 (=> (not res!40596) (not e!50569))))

(declare-fun lt!35426 () ListLongMap!1429)

(assert (=> d!18297 (= res!40596 (contains!735 lt!35426 (_1!1094 lt!35265)))))

(declare-fun lt!35425 () List!1507)

(assert (=> d!18297 (= lt!35426 (ListLongMap!1430 lt!35425))))

(declare-fun lt!35423 () Unit!2232)

(declare-fun lt!35424 () Unit!2232)

(assert (=> d!18297 (= lt!35423 lt!35424)))

(declare-datatypes ((Option!140 0))(
  ( (Some!139 (v!2582 V!2985)) (None!138) )
))
(declare-fun getValueByKey!134 (List!1507 (_ BitVec 64)) Option!140)

(assert (=> d!18297 (= (getValueByKey!134 lt!35425 (_1!1094 lt!35265)) (Some!139 (_2!1094 lt!35265)))))

(declare-fun lemmaContainsTupThenGetReturnValue!54 (List!1507 (_ BitVec 64) V!2985) Unit!2232)

(assert (=> d!18297 (= lt!35424 (lemmaContainsTupThenGetReturnValue!54 lt!35425 (_1!1094 lt!35265) (_2!1094 lt!35265)))))

(declare-fun insertStrictlySorted!57 (List!1507 (_ BitVec 64) V!2985) List!1507)

(assert (=> d!18297 (= lt!35425 (insertStrictlySorted!57 (toList!730 lt!35281) (_1!1094 lt!35265) (_2!1094 lt!35265)))))

(assert (=> d!18297 (= (+!102 lt!35281 lt!35265) lt!35426)))

(declare-fun b!77328 () Bool)

(declare-fun res!40595 () Bool)

(assert (=> b!77328 (=> (not res!40595) (not e!50569))))

(assert (=> b!77328 (= res!40595 (= (getValueByKey!134 (toList!730 lt!35426) (_1!1094 lt!35265)) (Some!139 (_2!1094 lt!35265))))))

(declare-fun b!77329 () Bool)

(declare-fun contains!737 (List!1507 tuple2!2166) Bool)

(assert (=> b!77329 (= e!50569 (contains!737 (toList!730 lt!35426) lt!35265))))

(assert (= (and d!18297 res!40596) b!77328))

(assert (= (and b!77328 res!40595) b!77329))

(declare-fun m!77217 () Bool)

(assert (=> d!18297 m!77217))

(declare-fun m!77219 () Bool)

(assert (=> d!18297 m!77219))

(declare-fun m!77221 () Bool)

(assert (=> d!18297 m!77221))

(declare-fun m!77223 () Bool)

(assert (=> d!18297 m!77223))

(declare-fun m!77225 () Bool)

(assert (=> b!77328 m!77225))

(declare-fun m!77227 () Bool)

(assert (=> b!77329 m!77227))

(assert (=> b!77153 d!18297))

(declare-fun d!18299 () Bool)

(declare-fun e!50570 () Bool)

(assert (=> d!18299 e!50570))

(declare-fun res!40598 () Bool)

(assert (=> d!18299 (=> (not res!40598) (not e!50570))))

(declare-fun lt!35430 () ListLongMap!1429)

(assert (=> d!18299 (= res!40598 (contains!735 lt!35430 (_1!1094 lt!35265)))))

(declare-fun lt!35429 () List!1507)

(assert (=> d!18299 (= lt!35430 (ListLongMap!1430 lt!35429))))

(declare-fun lt!35427 () Unit!2232)

(declare-fun lt!35428 () Unit!2232)

(assert (=> d!18299 (= lt!35427 lt!35428)))

(assert (=> d!18299 (= (getValueByKey!134 lt!35429 (_1!1094 lt!35265)) (Some!139 (_2!1094 lt!35265)))))

(assert (=> d!18299 (= lt!35428 (lemmaContainsTupThenGetReturnValue!54 lt!35429 (_1!1094 lt!35265) (_2!1094 lt!35265)))))

(assert (=> d!18299 (= lt!35429 (insertStrictlySorted!57 (toList!730 lt!35267) (_1!1094 lt!35265) (_2!1094 lt!35265)))))

(assert (=> d!18299 (= (+!102 lt!35267 lt!35265) lt!35430)))

(declare-fun b!77330 () Bool)

(declare-fun res!40597 () Bool)

(assert (=> b!77330 (=> (not res!40597) (not e!50570))))

(assert (=> b!77330 (= res!40597 (= (getValueByKey!134 (toList!730 lt!35430) (_1!1094 lt!35265)) (Some!139 (_2!1094 lt!35265))))))

(declare-fun b!77331 () Bool)

(assert (=> b!77331 (= e!50570 (contains!737 (toList!730 lt!35430) lt!35265))))

(assert (= (and d!18299 res!40598) b!77330))

(assert (= (and b!77330 res!40597) b!77331))

(declare-fun m!77229 () Bool)

(assert (=> d!18299 m!77229))

(declare-fun m!77231 () Bool)

(assert (=> d!18299 m!77231))

(declare-fun m!77233 () Bool)

(assert (=> d!18299 m!77233))

(declare-fun m!77235 () Bool)

(assert (=> d!18299 m!77235))

(declare-fun m!77237 () Bool)

(assert (=> b!77330 m!77237))

(declare-fun m!77239 () Bool)

(assert (=> b!77331 m!77239))

(assert (=> b!77153 d!18299))

(declare-fun d!18301 () Bool)

(declare-fun e!50571 () Bool)

(assert (=> d!18301 e!50571))

(declare-fun res!40600 () Bool)

(assert (=> d!18301 (=> (not res!40600) (not e!50571))))

(declare-fun lt!35434 () ListLongMap!1429)

(assert (=> d!18301 (= res!40600 (contains!735 lt!35434 (_1!1094 lt!35282)))))

(declare-fun lt!35433 () List!1507)

(assert (=> d!18301 (= lt!35434 (ListLongMap!1430 lt!35433))))

(declare-fun lt!35431 () Unit!2232)

(declare-fun lt!35432 () Unit!2232)

(assert (=> d!18301 (= lt!35431 lt!35432)))

(assert (=> d!18301 (= (getValueByKey!134 lt!35433 (_1!1094 lt!35282)) (Some!139 (_2!1094 lt!35282)))))

(assert (=> d!18301 (= lt!35432 (lemmaContainsTupThenGetReturnValue!54 lt!35433 (_1!1094 lt!35282) (_2!1094 lt!35282)))))

(assert (=> d!18301 (= lt!35433 (insertStrictlySorted!57 (toList!730 lt!35266) (_1!1094 lt!35282) (_2!1094 lt!35282)))))

(assert (=> d!18301 (= (+!102 lt!35266 lt!35282) lt!35434)))

(declare-fun b!77332 () Bool)

(declare-fun res!40599 () Bool)

(assert (=> b!77332 (=> (not res!40599) (not e!50571))))

(assert (=> b!77332 (= res!40599 (= (getValueByKey!134 (toList!730 lt!35434) (_1!1094 lt!35282)) (Some!139 (_2!1094 lt!35282))))))

(declare-fun b!77333 () Bool)

(assert (=> b!77333 (= e!50571 (contains!737 (toList!730 lt!35434) lt!35282))))

(assert (= (and d!18301 res!40600) b!77332))

(assert (= (and b!77332 res!40599) b!77333))

(declare-fun m!77241 () Bool)

(assert (=> d!18301 m!77241))

(declare-fun m!77243 () Bool)

(assert (=> d!18301 m!77243))

(declare-fun m!77245 () Bool)

(assert (=> d!18301 m!77245))

(declare-fun m!77247 () Bool)

(assert (=> d!18301 m!77247))

(declare-fun m!77249 () Bool)

(assert (=> b!77332 m!77249))

(declare-fun m!77251 () Bool)

(assert (=> b!77333 m!77251))

(assert (=> b!77153 d!18301))

(declare-fun d!18303 () Bool)

(assert (=> d!18303 (= (+!102 (+!102 lt!35274 (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276)) (tuple2!2167 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))))) (+!102 (+!102 lt!35274 (tuple2!2167 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))))) (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276)))))

(declare-fun lt!35435 () Unit!2232)

(assert (=> d!18303 (= lt!35435 (choose!458 lt!35274 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(assert (=> d!18303 (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18303 (= (addCommutativeForDiffKeys!21 lt!35274 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))) lt!35435)))

(declare-fun bs!3284 () Bool)

(assert (= bs!3284 d!18303))

(declare-fun m!77253 () Bool)

(assert (=> bs!3284 m!77253))

(declare-fun m!77255 () Bool)

(assert (=> bs!3284 m!77255))

(assert (=> bs!3284 m!76991))

(declare-fun m!77257 () Bool)

(assert (=> bs!3284 m!77257))

(assert (=> bs!3284 m!77255))

(declare-fun m!77259 () Bool)

(assert (=> bs!3284 m!77259))

(assert (=> bs!3284 m!77253))

(declare-fun m!77261 () Bool)

(assert (=> bs!3284 m!77261))

(assert (=> b!77153 d!18303))

(declare-fun d!18305 () Bool)

(declare-fun e!50572 () Bool)

(assert (=> d!18305 e!50572))

(declare-fun res!40602 () Bool)

(assert (=> d!18305 (=> (not res!40602) (not e!50572))))

(declare-fun lt!35439 () ListLongMap!1429)

(assert (=> d!18305 (= res!40602 (contains!735 lt!35439 (_1!1094 lt!35280)))))

(declare-fun lt!35438 () List!1507)

(assert (=> d!18305 (= lt!35439 (ListLongMap!1430 lt!35438))))

(declare-fun lt!35436 () Unit!2232)

(declare-fun lt!35437 () Unit!2232)

(assert (=> d!18305 (= lt!35436 lt!35437)))

(assert (=> d!18305 (= (getValueByKey!134 lt!35438 (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280)))))

(assert (=> d!18305 (= lt!35437 (lemmaContainsTupThenGetReturnValue!54 lt!35438 (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18305 (= lt!35438 (insertStrictlySorted!57 (toList!730 (+!102 lt!35281 lt!35265)) (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18305 (= (+!102 (+!102 lt!35281 lt!35265) lt!35280) lt!35439)))

(declare-fun b!77334 () Bool)

(declare-fun res!40601 () Bool)

(assert (=> b!77334 (=> (not res!40601) (not e!50572))))

(assert (=> b!77334 (= res!40601 (= (getValueByKey!134 (toList!730 lt!35439) (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280))))))

(declare-fun b!77335 () Bool)

(assert (=> b!77335 (= e!50572 (contains!737 (toList!730 lt!35439) lt!35280))))

(assert (= (and d!18305 res!40602) b!77334))

(assert (= (and b!77334 res!40601) b!77335))

(declare-fun m!77263 () Bool)

(assert (=> d!18305 m!77263))

(declare-fun m!77265 () Bool)

(assert (=> d!18305 m!77265))

(declare-fun m!77267 () Bool)

(assert (=> d!18305 m!77267))

(declare-fun m!77269 () Bool)

(assert (=> d!18305 m!77269))

(declare-fun m!77271 () Bool)

(assert (=> b!77334 m!77271))

(declare-fun m!77273 () Bool)

(assert (=> b!77335 m!77273))

(assert (=> b!77153 d!18305))

(declare-fun d!18307 () Bool)

(declare-fun e!50573 () Bool)

(assert (=> d!18307 e!50573))

(declare-fun res!40604 () Bool)

(assert (=> d!18307 (=> (not res!40604) (not e!50573))))

(declare-fun lt!35443 () ListLongMap!1429)

(assert (=> d!18307 (= res!40604 (contains!735 lt!35443 (_1!1094 lt!35280)))))

(declare-fun lt!35442 () List!1507)

(assert (=> d!18307 (= lt!35443 (ListLongMap!1430 lt!35442))))

(declare-fun lt!35440 () Unit!2232)

(declare-fun lt!35441 () Unit!2232)

(assert (=> d!18307 (= lt!35440 lt!35441)))

(assert (=> d!18307 (= (getValueByKey!134 lt!35442 (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280)))))

(assert (=> d!18307 (= lt!35441 (lemmaContainsTupThenGetReturnValue!54 lt!35442 (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18307 (= lt!35442 (insertStrictlySorted!57 (toList!730 lt!35281) (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18307 (= (+!102 lt!35281 lt!35280) lt!35443)))

(declare-fun b!77336 () Bool)

(declare-fun res!40603 () Bool)

(assert (=> b!77336 (=> (not res!40603) (not e!50573))))

(assert (=> b!77336 (= res!40603 (= (getValueByKey!134 (toList!730 lt!35443) (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280))))))

(declare-fun b!77337 () Bool)

(assert (=> b!77337 (= e!50573 (contains!737 (toList!730 lt!35443) lt!35280))))

(assert (= (and d!18307 res!40604) b!77336))

(assert (= (and b!77336 res!40603) b!77337))

(declare-fun m!77275 () Bool)

(assert (=> d!18307 m!77275))

(declare-fun m!77277 () Bool)

(assert (=> d!18307 m!77277))

(declare-fun m!77279 () Bool)

(assert (=> d!18307 m!77279))

(declare-fun m!77281 () Bool)

(assert (=> d!18307 m!77281))

(declare-fun m!77283 () Bool)

(assert (=> b!77336 m!77283))

(declare-fun m!77285 () Bool)

(assert (=> b!77337 m!77285))

(assert (=> b!77153 d!18307))

(declare-fun d!18309 () Bool)

(assert (=> d!18309 (= (validMask!0 (mask!6257 (v!2577 (underlying!271 thiss!992)))) (and (or (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000001111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000011111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000001111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000011111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000001111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000011111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000001111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000011111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000000111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000001111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000011111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000000111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000001111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000011111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000000111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000001111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000011111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000000111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000001111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000011111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00000111111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00001111111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00011111111111111111111111111111) (= (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6257 (v!2577 (underlying!271 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!77153 d!18309))

(declare-fun d!18311 () Bool)

(declare-fun e!50574 () Bool)

(assert (=> d!18311 e!50574))

(declare-fun res!40606 () Bool)

(assert (=> d!18311 (=> (not res!40606) (not e!50574))))

(declare-fun lt!35447 () ListLongMap!1429)

(assert (=> d!18311 (= res!40606 (contains!735 lt!35447 (_1!1094 lt!35282)))))

(declare-fun lt!35446 () List!1507)

(assert (=> d!18311 (= lt!35447 (ListLongMap!1430 lt!35446))))

(declare-fun lt!35444 () Unit!2232)

(declare-fun lt!35445 () Unit!2232)

(assert (=> d!18311 (= lt!35444 lt!35445)))

(assert (=> d!18311 (= (getValueByKey!134 lt!35446 (_1!1094 lt!35282)) (Some!139 (_2!1094 lt!35282)))))

(assert (=> d!18311 (= lt!35445 (lemmaContainsTupThenGetReturnValue!54 lt!35446 (_1!1094 lt!35282) (_2!1094 lt!35282)))))

(assert (=> d!18311 (= lt!35446 (insertStrictlySorted!57 (toList!730 lt!35274) (_1!1094 lt!35282) (_2!1094 lt!35282)))))

(assert (=> d!18311 (= (+!102 lt!35274 lt!35282) lt!35447)))

(declare-fun b!77338 () Bool)

(declare-fun res!40605 () Bool)

(assert (=> b!77338 (=> (not res!40605) (not e!50574))))

(assert (=> b!77338 (= res!40605 (= (getValueByKey!134 (toList!730 lt!35447) (_1!1094 lt!35282)) (Some!139 (_2!1094 lt!35282))))))

(declare-fun b!77339 () Bool)

(assert (=> b!77339 (= e!50574 (contains!737 (toList!730 lt!35447) lt!35282))))

(assert (= (and d!18311 res!40606) b!77338))

(assert (= (and b!77338 res!40605) b!77339))

(declare-fun m!77287 () Bool)

(assert (=> d!18311 m!77287))

(declare-fun m!77289 () Bool)

(assert (=> d!18311 m!77289))

(declare-fun m!77291 () Bool)

(assert (=> d!18311 m!77291))

(declare-fun m!77293 () Bool)

(assert (=> d!18311 m!77293))

(declare-fun m!77295 () Bool)

(assert (=> b!77338 m!77295))

(declare-fun m!77297 () Bool)

(assert (=> b!77339 m!77297))

(assert (=> b!77153 d!18311))

(declare-fun d!18313 () Bool)

(declare-fun e!50575 () Bool)

(assert (=> d!18313 e!50575))

(declare-fun res!40608 () Bool)

(assert (=> d!18313 (=> (not res!40608) (not e!50575))))

(declare-fun lt!35451 () ListLongMap!1429)

(assert (=> d!18313 (= res!40608 (contains!735 lt!35451 (_1!1094 lt!35280)))))

(declare-fun lt!35450 () List!1507)

(assert (=> d!18313 (= lt!35451 (ListLongMap!1430 lt!35450))))

(declare-fun lt!35448 () Unit!2232)

(declare-fun lt!35449 () Unit!2232)

(assert (=> d!18313 (= lt!35448 lt!35449)))

(assert (=> d!18313 (= (getValueByKey!134 lt!35450 (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280)))))

(assert (=> d!18313 (= lt!35449 (lemmaContainsTupThenGetReturnValue!54 lt!35450 (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18313 (= lt!35450 (insertStrictlySorted!57 (toList!730 lt!35274) (_1!1094 lt!35280) (_2!1094 lt!35280)))))

(assert (=> d!18313 (= (+!102 lt!35274 lt!35280) lt!35451)))

(declare-fun b!77340 () Bool)

(declare-fun res!40607 () Bool)

(assert (=> b!77340 (=> (not res!40607) (not e!50575))))

(assert (=> b!77340 (= res!40607 (= (getValueByKey!134 (toList!730 lt!35451) (_1!1094 lt!35280)) (Some!139 (_2!1094 lt!35280))))))

(declare-fun b!77341 () Bool)

(assert (=> b!77341 (= e!50575 (contains!737 (toList!730 lt!35451) lt!35280))))

(assert (= (and d!18313 res!40608) b!77340))

(assert (= (and b!77340 res!40607) b!77341))

(declare-fun m!77299 () Bool)

(assert (=> d!18313 m!77299))

(declare-fun m!77301 () Bool)

(assert (=> d!18313 m!77301))

(declare-fun m!77303 () Bool)

(assert (=> d!18313 m!77303))

(declare-fun m!77305 () Bool)

(assert (=> d!18313 m!77305))

(declare-fun m!77307 () Bool)

(assert (=> b!77340 m!77307))

(declare-fun m!77309 () Bool)

(assert (=> b!77341 m!77309))

(assert (=> b!77153 d!18313))

(declare-fun d!18315 () Bool)

(assert (=> d!18315 (= (array_inv!1177 (_keys!3924 newMap!16)) (bvsge (size!2118 (_keys!3924 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77161 d!18315))

(declare-fun d!18317 () Bool)

(assert (=> d!18317 (= (array_inv!1178 (_values!2248 newMap!16)) (bvsge (size!2119 (_values!2248 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77161 d!18317))

(declare-fun d!18319 () Bool)

(assert (=> d!18319 (= (valid!320 thiss!992) (valid!319 (v!2577 (underlying!271 thiss!992))))))

(declare-fun bs!3285 () Bool)

(assert (= bs!3285 d!18319))

(declare-fun m!77311 () Bool)

(assert (=> bs!3285 m!77311))

(assert (=> start!10146 d!18319))

(declare-fun d!18321 () Bool)

(declare-fun e!50581 () Bool)

(assert (=> d!18321 e!50581))

(declare-fun res!40611 () Bool)

(assert (=> d!18321 (=> res!40611 e!50581)))

(declare-fun lt!35463 () Bool)

(assert (=> d!18321 (= res!40611 (not lt!35463))))

(declare-fun lt!35460 () Bool)

(assert (=> d!18321 (= lt!35463 lt!35460)))

(declare-fun lt!35461 () Unit!2232)

(declare-fun e!50580 () Unit!2232)

(assert (=> d!18321 (= lt!35461 e!50580)))

(declare-fun c!11780 () Bool)

(assert (=> d!18321 (= c!11780 lt!35460)))

(declare-fun containsKey!138 (List!1507 (_ BitVec 64)) Bool)

(assert (=> d!18321 (= lt!35460 (containsKey!138 (toList!730 lt!35275) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(assert (=> d!18321 (= (contains!735 lt!35275 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)) lt!35463)))

(declare-fun b!77348 () Bool)

(declare-fun lt!35462 () Unit!2232)

(assert (=> b!77348 (= e!50580 lt!35462)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!87 (List!1507 (_ BitVec 64)) Unit!2232)

(assert (=> b!77348 (= lt!35462 (lemmaContainsKeyImpliesGetValueByKeyDefined!87 (toList!730 lt!35275) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun isDefined!88 (Option!140) Bool)

(assert (=> b!77348 (isDefined!88 (getValueByKey!134 (toList!730 lt!35275) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun b!77349 () Bool)

(declare-fun Unit!2238 () Unit!2232)

(assert (=> b!77349 (= e!50580 Unit!2238)))

(declare-fun b!77350 () Bool)

(assert (=> b!77350 (= e!50581 (isDefined!88 (getValueByKey!134 (toList!730 lt!35275) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355))))))

(assert (= (and d!18321 c!11780) b!77348))

(assert (= (and d!18321 (not c!11780)) b!77349))

(assert (= (and d!18321 (not res!40611)) b!77350))

(assert (=> d!18321 m!76991))

(declare-fun m!77313 () Bool)

(assert (=> d!18321 m!77313))

(assert (=> b!77348 m!76991))

(declare-fun m!77315 () Bool)

(assert (=> b!77348 m!77315))

(assert (=> b!77348 m!76991))

(declare-fun m!77317 () Bool)

(assert (=> b!77348 m!77317))

(assert (=> b!77348 m!77317))

(declare-fun m!77319 () Bool)

(assert (=> b!77348 m!77319))

(assert (=> b!77350 m!76991))

(assert (=> b!77350 m!77317))

(assert (=> b!77350 m!77317))

(assert (=> b!77350 m!77319))

(assert (=> b!77157 d!18321))

(declare-fun call!7011 () Bool)

(declare-fun bm!7005 () Bool)

(assert (=> bm!7005 (= call!7011 (arrayContainsKey!0 (_keys!3924 newMap!16) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!77431 () Bool)

(declare-fun e!50624 () Bool)

(declare-fun call!7027 () Bool)

(assert (=> b!77431 (= e!50624 (not call!7027))))

(declare-fun e!50631 () Bool)

(declare-fun b!77432 () Bool)

(declare-datatypes ((SeekEntryResult!242 0))(
  ( (MissingZero!242 (index!3102 (_ BitVec 32))) (Found!242 (index!3103 (_ BitVec 32))) (Intermediate!242 (undefined!1054 Bool) (index!3104 (_ BitVec 32)) (x!11507 (_ BitVec 32))) (Undefined!242) (MissingVacant!242 (index!3105 (_ BitVec 32))) )
))
(declare-fun lt!35529 () SeekEntryResult!242)

(assert (=> b!77432 (= e!50631 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3103 lt!35529)) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun bm!7006 () Bool)

(declare-fun call!7021 () Bool)

(declare-fun call!7017 () Bool)

(assert (=> bm!7006 (= call!7021 call!7017)))

(declare-fun c!11811 () Bool)

(declare-fun c!11817 () Bool)

(declare-fun lt!35530 () SeekEntryResult!242)

(declare-fun call!7013 () ListLongMap!1429)

(declare-fun lt!35536 () (_ BitVec 32))

(declare-fun bm!7007 () Bool)

(assert (=> bm!7007 (= call!7013 (getCurrentListMap!420 (_keys!3924 newMap!16) (ite c!11811 (_values!2248 newMap!16) (array!3940 (store (arr!1877 (_values!2248 newMap!16)) (index!3103 lt!35530) (ValueCellFull!908 lt!35276)) (size!2119 (_values!2248 newMap!16)))) (mask!6257 newMap!16) (ite c!11811 (ite c!11817 (extraKeys!2116 newMap!16) lt!35536) (extraKeys!2116 newMap!16)) (zeroValue!2163 newMap!16) (ite c!11811 (ite c!11817 (minValue!2163 newMap!16) lt!35276) (minValue!2163 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun b!77433 () Bool)

(declare-fun e!50635 () tuple2!2168)

(declare-fun e!50641 () tuple2!2168)

(assert (=> b!77433 (= e!50635 e!50641)))

(assert (=> b!77433 (= c!11817 (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77434 () Bool)

(declare-fun c!11808 () Bool)

(declare-fun lt!35521 () SeekEntryResult!242)

(assert (=> b!77434 (= c!11808 ((_ is MissingVacant!242) lt!35521))))

(declare-fun e!50636 () Bool)

(declare-fun e!50625 () Bool)

(assert (=> b!77434 (= e!50636 e!50625)))

(declare-fun b!77435 () Bool)

(declare-fun res!40645 () Bool)

(declare-fun lt!35541 () SeekEntryResult!242)

(assert (=> b!77435 (= res!40645 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3105 lt!35541)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77435 (=> (not res!40645) (not e!50624))))

(declare-fun bm!7008 () Bool)

(declare-fun call!7028 () SeekEntryResult!242)

(declare-fun call!7018 () SeekEntryResult!242)

(assert (=> bm!7008 (= call!7028 call!7018)))

(declare-fun bm!7009 () Bool)

(declare-fun call!7031 () ListLongMap!1429)

(declare-fun lt!35527 () array!3939)

(declare-fun c!11814 () Bool)

(declare-fun lt!35535 () (_ BitVec 32))

(assert (=> bm!7009 (= call!7031 (getCurrentListMap!420 (_keys!3924 newMap!16) (ite (or c!11811 c!11814) (_values!2248 newMap!16) lt!35527) (mask!6257 newMap!16) (ite (and c!11811 c!11817) lt!35535 (extraKeys!2116 newMap!16)) (ite (and c!11811 c!11817) lt!35276 (zeroValue!2163 newMap!16)) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun b!77436 () Bool)

(declare-fun e!50633 () Bool)

(declare-fun e!50626 () Bool)

(assert (=> b!77436 (= e!50633 e!50626)))

(declare-fun call!7029 () ListLongMap!1429)

(declare-fun res!40650 () Bool)

(assert (=> b!77436 (= res!40650 (contains!735 call!7029 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(assert (=> b!77436 (=> (not res!40650) (not e!50626))))

(declare-fun b!77437 () Bool)

(declare-fun e!50644 () Unit!2232)

(declare-fun Unit!2239 () Unit!2232)

(assert (=> b!77437 (= e!50644 Unit!2239)))

(declare-fun lt!35532 () Unit!2232)

(declare-fun call!7019 () Unit!2232)

(assert (=> b!77437 (= lt!35532 call!7019)))

(declare-fun lt!35519 () SeekEntryResult!242)

(declare-fun call!7009 () SeekEntryResult!242)

(assert (=> b!77437 (= lt!35519 call!7009)))

(declare-fun res!40648 () Bool)

(assert (=> b!77437 (= res!40648 ((_ is Found!242) lt!35519))))

(declare-fun e!50630 () Bool)

(assert (=> b!77437 (=> (not res!40648) (not e!50630))))

(assert (=> b!77437 e!50630))

(declare-fun lt!35544 () Unit!2232)

(assert (=> b!77437 (= lt!35544 lt!35532)))

(assert (=> b!77437 false))

(declare-fun bm!7010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3937 (_ BitVec 32)) SeekEntryResult!242)

(assert (=> bm!7010 (= call!7018 (seekEntryOrOpen!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (_keys!3924 newMap!16) (mask!6257 newMap!16)))))

(declare-fun bm!7011 () Bool)

(declare-fun call!7020 () Bool)

(assert (=> bm!7011 (= call!7020 call!7017)))

(declare-fun bm!7012 () Bool)

(declare-fun call!7010 () Bool)

(assert (=> bm!7012 (= call!7010 call!7011)))

(declare-fun b!77438 () Bool)

(declare-fun c!11818 () Bool)

(assert (=> b!77438 (= c!11818 ((_ is MissingVacant!242) lt!35541))))

(declare-fun e!50637 () Bool)

(declare-fun e!50632 () Bool)

(assert (=> b!77438 (= e!50637 e!50632)))

(declare-fun bm!7013 () Bool)

(declare-fun call!7023 () ListLongMap!1429)

(assert (=> bm!7013 (= call!7023 call!7031)))

(declare-fun bm!7014 () Bool)

(assert (=> bm!7014 (= call!7009 call!7018)))

(declare-fun b!77439 () Bool)

(declare-fun e!50634 () ListLongMap!1429)

(assert (=> b!77439 (= e!50634 (getCurrentListMap!420 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun b!77440 () Bool)

(declare-fun res!40644 () Bool)

(assert (=> b!77440 (= res!40644 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3105 lt!35521)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50629 () Bool)

(assert (=> b!77440 (=> (not res!40644) (not e!50629))))

(declare-fun bm!7015 () Bool)

(declare-fun lt!35523 () tuple2!2168)

(assert (=> bm!7015 (= call!7029 (map!1170 (_2!1095 lt!35523)))))

(declare-fun b!77441 () Bool)

(declare-fun e!50640 () tuple2!2168)

(assert (=> b!77441 (= e!50635 e!50640)))

(assert (=> b!77441 (= lt!35530 (seekEntryOrOpen!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (_keys!3924 newMap!16) (mask!6257 newMap!16)))))

(assert (=> b!77441 (= c!11814 ((_ is Undefined!242) lt!35530))))

(declare-fun b!77442 () Bool)

(declare-fun c!11809 () Bool)

(assert (=> b!77442 (= c!11809 ((_ is MissingVacant!242) lt!35530))))

(declare-fun e!50642 () tuple2!2168)

(assert (=> b!77442 (= e!50640 e!50642)))

(declare-fun bm!7016 () Bool)

(declare-fun call!7024 () ListLongMap!1429)

(assert (=> bm!7016 (= call!7024 call!7031)))

(declare-fun b!77443 () Bool)

(declare-fun res!40640 () Bool)

(assert (=> b!77443 (= res!40640 call!7021)))

(assert (=> b!77443 (=> (not res!40640) (not e!50630))))

(declare-fun b!77444 () Bool)

(declare-fun lt!35520 () tuple2!2168)

(assert (=> b!77444 (= e!50642 (tuple2!2169 (_1!1095 lt!35520) (_2!1095 lt!35520)))))

(declare-fun call!7022 () tuple2!2168)

(assert (=> b!77444 (= lt!35520 call!7022)))

(declare-fun b!77445 () Bool)

(declare-fun call!7030 () ListLongMap!1429)

(assert (=> b!77445 (= e!50634 (ite c!11817 call!7030 call!7023))))

(declare-fun b!77446 () Bool)

(assert (=> b!77446 (= e!50632 e!50624)))

(declare-fun res!40652 () Bool)

(declare-fun call!7015 () Bool)

(assert (=> b!77446 (= res!40652 call!7015)))

(assert (=> b!77446 (=> (not res!40652) (not e!50624))))

(declare-fun b!77447 () Bool)

(assert (=> b!77447 (= e!50625 e!50629)))

(declare-fun res!40647 () Bool)

(declare-fun call!7016 () Bool)

(assert (=> b!77447 (= res!40647 call!7016)))

(assert (=> b!77447 (=> (not res!40647) (not e!50629))))

(declare-fun bm!7017 () Bool)

(declare-fun updateHelperNewKey!27 (LongMapFixedSize!724 (_ BitVec 64) V!2985 (_ BitVec 32)) tuple2!2168)

(assert (=> bm!7017 (= call!7022 (updateHelperNewKey!27 newMap!16 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 (ite c!11809 (index!3105 lt!35530) (index!3102 lt!35530))))))

(declare-fun b!77448 () Bool)

(declare-fun res!40641 () Bool)

(declare-fun e!50639 () Bool)

(assert (=> b!77448 (=> (not res!40641) (not e!50639))))

(assert (=> b!77448 (= res!40641 call!7015)))

(assert (=> b!77448 (= e!50637 e!50639)))

(declare-fun b!77449 () Bool)

(assert (=> b!77449 (= e!50639 (not call!7027))))

(declare-fun b!77450 () Bool)

(declare-fun e!50628 () Unit!2232)

(declare-fun lt!35534 () Unit!2232)

(assert (=> b!77450 (= e!50628 lt!35534)))

(assert (=> b!77450 (= lt!35534 call!7019)))

(assert (=> b!77450 (= lt!35529 call!7028)))

(declare-fun res!40651 () Bool)

(assert (=> b!77450 (= res!40651 ((_ is Found!242) lt!35529))))

(assert (=> b!77450 (=> (not res!40651) (not e!50631))))

(assert (=> b!77450 e!50631))

(declare-fun bm!7018 () Bool)

(declare-fun call!7012 () ListLongMap!1429)

(declare-fun call!7014 () ListLongMap!1429)

(assert (=> bm!7018 (= call!7012 call!7014)))

(declare-fun b!77451 () Bool)

(declare-fun lt!35540 () Unit!2232)

(declare-fun lt!35539 () Unit!2232)

(assert (=> b!77451 (= lt!35540 lt!35539)))

(assert (=> b!77451 (= call!7012 call!7030)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 V!2985 Int) Unit!2232)

(assert (=> b!77451 (= lt!35539 (lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) lt!35536 (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) lt!35276 (defaultEntry!2265 newMap!16)))))

(assert (=> b!77451 (= lt!35536 (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!77451 (= e!50641 (tuple2!2169 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6257 newMap!16) (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000010) (zeroValue!2163 newMap!16) lt!35276 (_size!411 newMap!16) (_keys!3924 newMap!16) (_values!2248 newMap!16) (_vacant!411 newMap!16))))))

(declare-fun bm!7019 () Bool)

(assert (=> bm!7019 (= call!7030 call!7013)))

(declare-fun b!77452 () Bool)

(declare-fun res!40653 () Bool)

(declare-fun e!50643 () Bool)

(assert (=> b!77452 (=> (not res!40653) (not e!50643))))

(assert (=> b!77452 (= res!40653 call!7016)))

(assert (=> b!77452 (= e!50636 e!50643)))

(declare-fun b!77453 () Bool)

(declare-fun lt!35531 () Unit!2232)

(declare-fun lt!35524 () Unit!2232)

(assert (=> b!77453 (= lt!35531 lt!35524)))

(assert (=> b!77453 (= call!7012 call!7023)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!27 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 V!2985 Int) Unit!2232)

(assert (=> b!77453 (= lt!35524 (lemmaChangeZeroKeyThenAddPairToListMap!27 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) lt!35535 (zeroValue!2163 newMap!16) lt!35276 (minValue!2163 newMap!16) (defaultEntry!2265 newMap!16)))))

(assert (=> b!77453 (= lt!35535 (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!77453 (= e!50641 (tuple2!2169 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6257 newMap!16) (bvor (extraKeys!2116 newMap!16) #b00000000000000000000000000000001) lt!35276 (minValue!2163 newMap!16) (_size!411 newMap!16) (_keys!3924 newMap!16) (_values!2248 newMap!16) (_vacant!411 newMap!16))))))

(declare-fun b!77454 () Bool)

(declare-fun res!40643 () Bool)

(assert (=> b!77454 (=> (not res!40643) (not e!50639))))

(assert (=> b!77454 (= res!40643 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3102 lt!35541)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77455 () Bool)

(assert (=> b!77455 (= e!50643 (not call!7010))))

(declare-fun b!77456 () Bool)

(declare-fun e!50638 () tuple2!2168)

(assert (=> b!77456 (= e!50642 e!50638)))

(declare-fun c!11815 () Bool)

(assert (=> b!77456 (= c!11815 ((_ is MissingZero!242) lt!35530))))

(declare-fun b!77457 () Bool)

(declare-fun call!7026 () ListLongMap!1429)

(assert (=> b!77457 (= e!50633 (= call!7029 call!7026))))

(declare-fun b!77458 () Bool)

(declare-fun lt!35542 () Unit!2232)

(assert (=> b!77458 (= lt!35542 e!50644)))

(declare-fun c!11816 () Bool)

(declare-fun call!7008 () Bool)

(assert (=> b!77458 (= c!11816 call!7008)))

(assert (=> b!77458 (= e!50640 (tuple2!2169 false newMap!16))))

(declare-fun bm!7020 () Bool)

(declare-fun call!7025 () Unit!2232)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) Int) Unit!2232)

(assert (=> bm!7020 (= call!7025 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (defaultEntry!2265 newMap!16)))))

(declare-fun b!77459 () Bool)

(declare-fun res!40646 () Bool)

(assert (=> b!77459 (= res!40646 call!7020)))

(assert (=> b!77459 (=> (not res!40646) (not e!50631))))

(declare-fun b!77460 () Bool)

(declare-fun lt!35538 () tuple2!2168)

(assert (=> b!77460 (= lt!35538 call!7022)))

(assert (=> b!77460 (= e!50638 (tuple2!2169 (_1!1095 lt!35538) (_2!1095 lt!35538)))))

(declare-fun bm!7021 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) Int) Unit!2232)

(assert (=> bm!7021 (= call!7019 (lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (defaultEntry!2265 newMap!16)))))

(declare-fun bm!7022 () Bool)

(assert (=> bm!7022 (= call!7016 call!7020)))

(declare-fun b!77461 () Bool)

(declare-fun lt!35537 () Unit!2232)

(assert (=> b!77461 (= e!50644 lt!35537)))

(assert (=> b!77461 (= lt!35537 call!7025)))

(assert (=> b!77461 (= lt!35541 call!7009)))

(declare-fun c!11819 () Bool)

(assert (=> b!77461 (= c!11819 ((_ is MissingZero!242) lt!35541))))

(assert (=> b!77461 e!50637))

(declare-fun c!11812 () Bool)

(declare-fun c!11810 () Bool)

(declare-fun bm!7023 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!7023 (= call!7017 (inRange!0 (ite c!11814 (ite c!11816 (index!3103 lt!35519) (ite c!11819 (index!3102 lt!35541) (index!3105 lt!35541))) (ite c!11810 (index!3103 lt!35529) (ite c!11812 (index!3102 lt!35521) (index!3105 lt!35521)))) (mask!6257 newMap!16)))))

(declare-fun b!77462 () Bool)

(declare-fun e!50627 () Bool)

(assert (=> b!77462 (= e!50627 e!50633)))

(declare-fun c!11813 () Bool)

(assert (=> b!77462 (= c!11813 (_1!1095 lt!35523))))

(declare-fun b!77463 () Bool)

(assert (=> b!77463 (= e!50630 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3103 lt!35519)) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun bm!7024 () Bool)

(assert (=> bm!7024 (= call!7027 call!7011)))

(declare-fun bm!7025 () Bool)

(assert (=> bm!7025 (= call!7008 (contains!735 call!7024 (ite c!11814 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (select (arr!1876 (_keys!3924 newMap!16)) (index!3103 lt!35530)))))))

(declare-fun d!18323 () Bool)

(assert (=> d!18323 e!50627))

(declare-fun res!40649 () Bool)

(assert (=> d!18323 (=> (not res!40649) (not e!50627))))

(assert (=> d!18323 (= res!40649 (valid!319 (_2!1095 lt!35523)))))

(assert (=> d!18323 (= lt!35523 e!50635)))

(assert (=> d!18323 (= c!11811 (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvneg (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355))))))

(assert (=> d!18323 (valid!319 newMap!16)))

(assert (=> d!18323 (= (update!113 newMap!16 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276) lt!35523)))

(declare-fun b!77464 () Bool)

(assert (=> b!77464 (= e!50629 (not call!7010))))

(declare-fun b!77465 () Bool)

(assert (=> b!77465 (= e!50626 (= call!7029 (+!102 call!7026 (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276))))))

(declare-fun bm!7026 () Bool)

(assert (=> bm!7026 (= call!7026 (map!1170 newMap!16))))

(declare-fun bm!7027 () Bool)

(assert (=> bm!7027 (= call!7014 (+!102 e!50634 (ite c!11811 (ite c!11817 (tuple2!2167 #b0000000000000000000000000000000000000000000000000000000000000000 lt!35276) (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 lt!35276)) (tuple2!2167 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276))))))

(declare-fun c!11807 () Bool)

(assert (=> bm!7027 (= c!11807 c!11811)))

(declare-fun bm!7028 () Bool)

(assert (=> bm!7028 (= call!7015 call!7021)))

(declare-fun b!77466 () Bool)

(declare-fun res!40642 () Bool)

(assert (=> b!77466 (=> (not res!40642) (not e!50643))))

(assert (=> b!77466 (= res!40642 (= (select (arr!1876 (_keys!3924 newMap!16)) (index!3102 lt!35521)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77467 () Bool)

(declare-fun lt!35543 () Unit!2232)

(declare-fun lt!35528 () Unit!2232)

(assert (=> b!77467 (= lt!35543 lt!35528)))

(assert (=> b!77467 call!7008))

(declare-fun lemmaValidKeyInArrayIsInListMap!86 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) Int) Unit!2232)

(assert (=> b!77467 (= lt!35528 (lemmaValidKeyInArrayIsInListMap!86 (_keys!3924 newMap!16) lt!35527 (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (index!3103 lt!35530) (defaultEntry!2265 newMap!16)))))

(assert (=> b!77467 (= lt!35527 (array!3940 (store (arr!1877 (_values!2248 newMap!16)) (index!3103 lt!35530) (ValueCellFull!908 lt!35276)) (size!2119 (_values!2248 newMap!16))))))

(declare-fun lt!35522 () Unit!2232)

(declare-fun lt!35533 () Unit!2232)

(assert (=> b!77467 (= lt!35522 lt!35533)))

(assert (=> b!77467 (= call!7014 call!7013)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 32) (_ BitVec 64) V!2985 Int) Unit!2232)

(assert (=> b!77467 (= lt!35533 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (index!3103 lt!35530) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) lt!35276 (defaultEntry!2265 newMap!16)))))

(declare-fun lt!35526 () Unit!2232)

(assert (=> b!77467 (= lt!35526 e!50628)))

(assert (=> b!77467 (= c!11810 (contains!735 (getCurrentListMap!420 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(assert (=> b!77467 (= e!50638 (tuple2!2169 true (LongMapFixedSize!725 (defaultEntry!2265 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) (_size!411 newMap!16) (_keys!3924 newMap!16) (array!3940 (store (arr!1877 (_values!2248 newMap!16)) (index!3103 lt!35530) (ValueCellFull!908 lt!35276)) (size!2119 (_values!2248 newMap!16))) (_vacant!411 newMap!16))))))

(declare-fun b!77468 () Bool)

(assert (=> b!77468 (= e!50632 ((_ is Undefined!242) lt!35541))))

(declare-fun b!77469 () Bool)

(declare-fun Unit!2240 () Unit!2232)

(assert (=> b!77469 (= e!50628 Unit!2240)))

(declare-fun lt!35525 () Unit!2232)

(assert (=> b!77469 (= lt!35525 call!7025)))

(assert (=> b!77469 (= lt!35521 call!7028)))

(assert (=> b!77469 (= c!11812 ((_ is MissingZero!242) lt!35521))))

(assert (=> b!77469 e!50636))

(declare-fun lt!35518 () Unit!2232)

(assert (=> b!77469 (= lt!35518 lt!35525)))

(assert (=> b!77469 false))

(declare-fun b!77470 () Bool)

(assert (=> b!77470 (= e!50625 ((_ is Undefined!242) lt!35521))))

(assert (= (and d!18323 c!11811) b!77433))

(assert (= (and d!18323 (not c!11811)) b!77441))

(assert (= (and b!77433 c!11817) b!77453))

(assert (= (and b!77433 (not c!11817)) b!77451))

(assert (= (or b!77453 b!77451) bm!7013))

(assert (= (or b!77453 b!77451) bm!7019))

(assert (= (or b!77453 b!77451) bm!7018))

(assert (= (and b!77441 c!11814) b!77458))

(assert (= (and b!77441 (not c!11814)) b!77442))

(assert (= (and b!77458 c!11816) b!77437))

(assert (= (and b!77458 (not c!11816)) b!77461))

(assert (= (and b!77437 res!40648) b!77443))

(assert (= (and b!77443 res!40640) b!77463))

(assert (= (and b!77461 c!11819) b!77448))

(assert (= (and b!77461 (not c!11819)) b!77438))

(assert (= (and b!77448 res!40641) b!77454))

(assert (= (and b!77454 res!40643) b!77449))

(assert (= (and b!77438 c!11818) b!77446))

(assert (= (and b!77438 (not c!11818)) b!77468))

(assert (= (and b!77446 res!40652) b!77435))

(assert (= (and b!77435 res!40645) b!77431))

(assert (= (or b!77448 b!77446) bm!7028))

(assert (= (or b!77449 b!77431) bm!7024))

(assert (= (or b!77443 bm!7028) bm!7006))

(assert (= (or b!77437 b!77461) bm!7014))

(assert (= (and b!77442 c!11809) b!77444))

(assert (= (and b!77442 (not c!11809)) b!77456))

(assert (= (and b!77456 c!11815) b!77460))

(assert (= (and b!77456 (not c!11815)) b!77467))

(assert (= (and b!77467 c!11810) b!77450))

(assert (= (and b!77467 (not c!11810)) b!77469))

(assert (= (and b!77450 res!40651) b!77459))

(assert (= (and b!77459 res!40646) b!77432))

(assert (= (and b!77469 c!11812) b!77452))

(assert (= (and b!77469 (not c!11812)) b!77434))

(assert (= (and b!77452 res!40653) b!77466))

(assert (= (and b!77466 res!40642) b!77455))

(assert (= (and b!77434 c!11808) b!77447))

(assert (= (and b!77434 (not c!11808)) b!77470))

(assert (= (and b!77447 res!40647) b!77440))

(assert (= (and b!77440 res!40644) b!77464))

(assert (= (or b!77452 b!77447) bm!7022))

(assert (= (or b!77455 b!77464) bm!7012))

(assert (= (or b!77459 bm!7022) bm!7011))

(assert (= (or b!77450 b!77469) bm!7008))

(assert (= (or b!77444 b!77460) bm!7017))

(assert (= (or bm!7024 bm!7012) bm!7005))

(assert (= (or b!77461 b!77469) bm!7020))

(assert (= (or b!77437 b!77450) bm!7021))

(assert (= (or bm!7014 bm!7008) bm!7010))

(assert (= (or b!77458 b!77467) bm!7016))

(assert (= (or bm!7006 bm!7011) bm!7023))

(assert (= (or b!77458 b!77467) bm!7025))

(assert (= (or bm!7019 b!77467) bm!7007))

(assert (= (or bm!7013 bm!7016) bm!7009))

(assert (= (or bm!7018 b!77467) bm!7027))

(assert (= (and bm!7027 c!11807) b!77445))

(assert (= (and bm!7027 (not c!11807)) b!77439))

(assert (= (and d!18323 res!40649) b!77462))

(assert (= (and b!77462 c!11813) b!77436))

(assert (= (and b!77462 (not c!11813)) b!77457))

(assert (= (and b!77436 res!40650) b!77465))

(assert (= (or b!77436 b!77465 b!77457) bm!7015))

(assert (= (or b!77465 b!77457) bm!7026))

(declare-fun m!77321 () Bool)

(assert (=> d!18323 m!77321))

(assert (=> d!18323 m!77005))

(declare-fun m!77323 () Bool)

(assert (=> b!77435 m!77323))

(declare-fun m!77325 () Bool)

(assert (=> bm!7007 m!77325))

(declare-fun m!77327 () Bool)

(assert (=> bm!7007 m!77327))

(declare-fun m!77329 () Bool)

(assert (=> bm!7025 m!77329))

(declare-fun m!77331 () Bool)

(assert (=> bm!7025 m!77331))

(declare-fun m!77333 () Bool)

(assert (=> b!77454 m!77333))

(assert (=> b!77441 m!76991))

(declare-fun m!77335 () Bool)

(assert (=> b!77441 m!77335))

(declare-fun m!77337 () Bool)

(assert (=> bm!7009 m!77337))

(declare-fun m!77339 () Bool)

(assert (=> b!77466 m!77339))

(declare-fun m!77341 () Bool)

(assert (=> b!77467 m!77341))

(declare-fun m!77343 () Bool)

(assert (=> b!77467 m!77343))

(assert (=> b!77467 m!76991))

(declare-fun m!77345 () Bool)

(assert (=> b!77467 m!77345))

(assert (=> b!77467 m!76991))

(declare-fun m!77347 () Bool)

(assert (=> b!77467 m!77347))

(assert (=> b!77467 m!77343))

(assert (=> b!77467 m!77325))

(assert (=> bm!7010 m!76991))

(assert (=> bm!7010 m!77335))

(declare-fun m!77349 () Bool)

(assert (=> bm!7015 m!77349))

(assert (=> b!77439 m!77343))

(declare-fun m!77351 () Bool)

(assert (=> b!77451 m!77351))

(declare-fun m!77353 () Bool)

(assert (=> b!77440 m!77353))

(declare-fun m!77355 () Bool)

(assert (=> b!77432 m!77355))

(declare-fun m!77357 () Bool)

(assert (=> bm!7023 m!77357))

(declare-fun m!77359 () Bool)

(assert (=> bm!7027 m!77359))

(assert (=> bm!7017 m!76991))

(declare-fun m!77361 () Bool)

(assert (=> bm!7017 m!77361))

(declare-fun m!77363 () Bool)

(assert (=> b!77463 m!77363))

(assert (=> b!77436 m!76991))

(declare-fun m!77365 () Bool)

(assert (=> b!77436 m!77365))

(assert (=> bm!7020 m!76991))

(declare-fun m!77367 () Bool)

(assert (=> bm!7020 m!77367))

(declare-fun m!77369 () Bool)

(assert (=> b!77453 m!77369))

(declare-fun m!77371 () Bool)

(assert (=> b!77465 m!77371))

(assert (=> bm!7021 m!76991))

(declare-fun m!77373 () Bool)

(assert (=> bm!7021 m!77373))

(assert (=> bm!7026 m!76999))

(assert (=> bm!7005 m!76991))

(declare-fun m!77375 () Bool)

(assert (=> bm!7005 m!77375))

(assert (=> b!77157 d!18323))

(declare-fun d!18325 () Bool)

(declare-fun c!11822 () Bool)

(assert (=> d!18325 (= c!11822 ((_ is ValueCellFull!908) (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun e!50647 () V!2985)

(assert (=> d!18325 (= (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) from!355) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!50647)))

(declare-fun b!77475 () Bool)

(declare-fun get!1173 (ValueCell!908 V!2985) V!2985)

(assert (=> b!77475 (= e!50647 (get!1173 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) from!355) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77476 () Bool)

(declare-fun get!1174 (ValueCell!908 V!2985) V!2985)

(assert (=> b!77476 (= e!50647 (get!1174 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) from!355) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18325 c!11822) b!77475))

(assert (= (and d!18325 (not c!11822)) b!77476))

(assert (=> b!77475 m!76993))

(assert (=> b!77475 m!76995))

(declare-fun m!77377 () Bool)

(assert (=> b!77475 m!77377))

(assert (=> b!77476 m!76993))

(assert (=> b!77476 m!76995))

(declare-fun m!77379 () Bool)

(assert (=> b!77476 m!77379))

(assert (=> b!77152 d!18325))

(declare-fun d!18327 () Bool)

(assert (=> d!18327 (= (array_inv!1177 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvsge (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77160 d!18327))

(declare-fun d!18329 () Bool)

(assert (=> d!18329 (= (array_inv!1178 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (bvsge (size!2119 (_values!2248 (v!2577 (underlying!271 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77160 d!18329))

(declare-fun d!18331 () Bool)

(declare-fun res!40660 () Bool)

(declare-fun e!50650 () Bool)

(assert (=> d!18331 (=> (not res!40660) (not e!50650))))

(declare-fun simpleValid!54 (LongMapFixedSize!724) Bool)

(assert (=> d!18331 (= res!40660 (simpleValid!54 newMap!16))))

(assert (=> d!18331 (= (valid!319 newMap!16) e!50650)))

(declare-fun b!77483 () Bool)

(declare-fun res!40661 () Bool)

(assert (=> b!77483 (=> (not res!40661) (not e!50650))))

(declare-fun arrayCountValidKeys!0 (array!3937 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!77483 (= res!40661 (= (arrayCountValidKeys!0 (_keys!3924 newMap!16) #b00000000000000000000000000000000 (size!2118 (_keys!3924 newMap!16))) (_size!411 newMap!16)))))

(declare-fun b!77484 () Bool)

(declare-fun res!40662 () Bool)

(assert (=> b!77484 (=> (not res!40662) (not e!50650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3937 (_ BitVec 32)) Bool)

(assert (=> b!77484 (= res!40662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3924 newMap!16) (mask!6257 newMap!16)))))

(declare-fun b!77485 () Bool)

(assert (=> b!77485 (= e!50650 (arrayNoDuplicates!0 (_keys!3924 newMap!16) #b00000000000000000000000000000000 Nil!1505))))

(assert (= (and d!18331 res!40660) b!77483))

(assert (= (and b!77483 res!40661) b!77484))

(assert (= (and b!77484 res!40662) b!77485))

(declare-fun m!77381 () Bool)

(assert (=> d!18331 m!77381))

(declare-fun m!77383 () Bool)

(assert (=> b!77483 m!77383))

(declare-fun m!77385 () Bool)

(assert (=> b!77484 m!77385))

(declare-fun m!77387 () Bool)

(assert (=> b!77485 m!77387))

(assert (=> b!77150 d!18331))

(declare-fun d!18333 () Bool)

(assert (=> d!18333 (not (arrayContainsKey!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35547 () Unit!2232)

(declare-fun choose!68 (array!3937 (_ BitVec 32) (_ BitVec 64) List!1508) Unit!2232)

(assert (=> d!18333 (= lt!35547 (choose!68 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (Cons!1504 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) Nil!1505)))))

(assert (=> d!18333 (bvslt (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18333 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (Cons!1504 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) Nil!1505)) lt!35547)))

(declare-fun bs!3286 () Bool)

(assert (= bs!3286 d!18333))

(assert (=> bs!3286 m!76991))

(assert (=> bs!3286 m!77013))

(assert (=> bs!3286 m!76991))

(declare-fun m!77389 () Bool)

(assert (=> bs!3286 m!77389))

(assert (=> b!77163 d!18333))

(declare-fun d!18335 () Bool)

(assert (=> d!18335 (arrayNoDuplicates!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) from!355 Nil!1505)))

(declare-fun lt!35550 () Unit!2232)

(declare-fun choose!39 (array!3937 (_ BitVec 32) (_ BitVec 32)) Unit!2232)

(assert (=> d!18335 (= lt!35550 (choose!39 (_keys!3924 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18335 (bvslt (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18335 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000000 from!355) lt!35550)))

(declare-fun bs!3287 () Bool)

(assert (= bs!3287 d!18335))

(assert (=> bs!3287 m!77009))

(declare-fun m!77391 () Bool)

(assert (=> bs!3287 m!77391))

(assert (=> b!77163 d!18335))

(declare-fun d!18337 () Bool)

(declare-fun res!40667 () Bool)

(declare-fun e!50655 () Bool)

(assert (=> d!18337 (=> res!40667 e!50655)))

(assert (=> d!18337 (= res!40667 (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(assert (=> d!18337 (= (arrayContainsKey!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!50655)))

(declare-fun b!77490 () Bool)

(declare-fun e!50656 () Bool)

(assert (=> b!77490 (= e!50655 e!50656)))

(declare-fun res!40668 () Bool)

(assert (=> b!77490 (=> (not res!40668) (not e!50656))))

(assert (=> b!77490 (= res!40668 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77491 () Bool)

(assert (=> b!77491 (= e!50656 (arrayContainsKey!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18337 (not res!40667)) b!77490))

(assert (= (and b!77490 res!40668) b!77491))

(assert (=> d!18337 m!77197))

(assert (=> b!77491 m!76991))

(declare-fun m!77393 () Bool)

(assert (=> b!77491 m!77393))

(assert (=> b!77163 d!18337))

(declare-fun d!18339 () Bool)

(declare-fun e!50659 () Bool)

(assert (=> d!18339 e!50659))

(declare-fun c!11825 () Bool)

(assert (=> d!18339 (= c!11825 (and (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35553 () Unit!2232)

(declare-fun choose!459 (array!3937 array!3939 (_ BitVec 32) (_ BitVec 32) V!2985 V!2985 (_ BitVec 64) (_ BitVec 32) Int) Unit!2232)

(assert (=> d!18339 (= lt!35553 (choose!459 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(assert (=> d!18339 (validMask!0 (mask!6257 (v!2577 (underlying!271 thiss!992))))))

(assert (=> d!18339 (= (lemmaListMapContainsThenArrayContainsFrom!58 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))) lt!35553)))

(declare-fun b!77496 () Bool)

(assert (=> b!77496 (= e!50659 (arrayContainsKey!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!77497 () Bool)

(assert (=> b!77497 (= e!50659 (ite (= (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18339 c!11825) b!77496))

(assert (= (and d!18339 (not c!11825)) b!77497))

(assert (=> d!18339 m!76991))

(declare-fun m!77395 () Bool)

(assert (=> d!18339 m!77395))

(assert (=> d!18339 m!77025))

(assert (=> b!77496 m!76991))

(assert (=> b!77496 m!77013))

(assert (=> b!77163 d!18339))

(declare-fun b!77508 () Bool)

(declare-fun e!50669 () Bool)

(declare-fun call!7034 () Bool)

(assert (=> b!77508 (= e!50669 call!7034)))

(declare-fun c!11828 () Bool)

(declare-fun bm!7031 () Bool)

(assert (=> bm!7031 (= call!7034 (arrayNoDuplicates!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11828 (Cons!1504 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355) Nil!1505) Nil!1505)))))

(declare-fun b!77510 () Bool)

(declare-fun e!50668 () Bool)

(assert (=> b!77510 (= e!50668 e!50669)))

(assert (=> b!77510 (= c!11828 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun b!77511 () Bool)

(declare-fun e!50670 () Bool)

(assert (=> b!77511 (= e!50670 e!50668)))

(declare-fun res!40677 () Bool)

(assert (=> b!77511 (=> (not res!40677) (not e!50668))))

(declare-fun e!50671 () Bool)

(assert (=> b!77511 (= res!40677 (not e!50671))))

(declare-fun res!40676 () Bool)

(assert (=> b!77511 (=> (not res!40676) (not e!50671))))

(assert (=> b!77511 (= res!40676 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun b!77512 () Bool)

(declare-fun contains!738 (List!1508 (_ BitVec 64)) Bool)

(assert (=> b!77512 (= e!50671 (contains!738 Nil!1505 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) from!355)))))

(declare-fun d!18341 () Bool)

(declare-fun res!40675 () Bool)

(assert (=> d!18341 (=> res!40675 e!50670)))

(assert (=> d!18341 (= res!40675 (bvsge from!355 (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(assert (=> d!18341 (= (arrayNoDuplicates!0 (_keys!3924 (v!2577 (underlying!271 thiss!992))) from!355 Nil!1505) e!50670)))

(declare-fun b!77509 () Bool)

(assert (=> b!77509 (= e!50669 call!7034)))

(assert (= (and d!18341 (not res!40675)) b!77511))

(assert (= (and b!77511 res!40676) b!77512))

(assert (= (and b!77511 res!40677) b!77510))

(assert (= (and b!77510 c!11828) b!77509))

(assert (= (and b!77510 (not c!11828)) b!77508))

(assert (= (or b!77509 b!77508) bm!7031))

(assert (=> bm!7031 m!76991))

(declare-fun m!77397 () Bool)

(assert (=> bm!7031 m!77397))

(assert (=> b!77510 m!76991))

(assert (=> b!77510 m!76991))

(declare-fun m!77399 () Bool)

(assert (=> b!77510 m!77399))

(assert (=> b!77511 m!76991))

(assert (=> b!77511 m!76991))

(assert (=> b!77511 m!77399))

(assert (=> b!77512 m!76991))

(assert (=> b!77512 m!76991))

(declare-fun m!77401 () Bool)

(assert (=> b!77512 m!77401))

(assert (=> b!77163 d!18341))

(declare-fun d!18343 () Bool)

(assert (=> d!18343 (= (map!1170 newMap!16) (getCurrentListMap!420 (_keys!3924 newMap!16) (_values!2248 newMap!16) (mask!6257 newMap!16) (extraKeys!2116 newMap!16) (zeroValue!2163 newMap!16) (minValue!2163 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2265 newMap!16)))))

(declare-fun bs!3288 () Bool)

(assert (= bs!3288 d!18343))

(assert (=> bs!3288 m!77343))

(assert (=> b!77166 d!18343))

(declare-fun b!77555 () Bool)

(declare-fun e!50708 () Bool)

(declare-fun lt!35607 () ListLongMap!1429)

(assert (=> b!77555 (= e!50708 (= (apply!78 lt!35607 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77556 () Bool)

(declare-fun e!50704 () Bool)

(declare-fun call!7051 () Bool)

(assert (=> b!77556 (= e!50704 (not call!7051))))

(declare-fun b!77557 () Bool)

(declare-fun e!50701 () Bool)

(assert (=> b!77557 (= e!50701 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77558 () Bool)

(declare-fun e!50709 () Bool)

(declare-fun call!7052 () Bool)

(assert (=> b!77558 (= e!50709 (not call!7052))))

(declare-fun b!77559 () Bool)

(declare-fun c!11846 () Bool)

(assert (=> b!77559 (= c!11846 (and (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50699 () ListLongMap!1429)

(declare-fun e!50698 () ListLongMap!1429)

(assert (=> b!77559 (= e!50699 e!50698)))

(declare-fun b!77560 () Bool)

(declare-fun res!40696 () Bool)

(declare-fun e!50700 () Bool)

(assert (=> b!77560 (=> (not res!40696) (not e!50700))))

(assert (=> b!77560 (= res!40696 e!50709)))

(declare-fun c!11841 () Bool)

(assert (=> b!77560 (= c!11841 (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!77561 () Bool)

(declare-fun call!7049 () ListLongMap!1429)

(assert (=> b!77561 (= e!50699 call!7049)))

(declare-fun b!77562 () Bool)

(declare-fun res!40699 () Bool)

(assert (=> b!77562 (=> (not res!40699) (not e!50700))))

(declare-fun e!50706 () Bool)

(assert (=> b!77562 (= res!40699 e!50706)))

(declare-fun res!40703 () Bool)

(assert (=> b!77562 (=> res!40703 e!50706)))

(declare-fun e!50703 () Bool)

(assert (=> b!77562 (= res!40703 (not e!50703))))

(declare-fun res!40704 () Bool)

(assert (=> b!77562 (=> (not res!40704) (not e!50703))))

(assert (=> b!77562 (= res!40704 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun bm!7046 () Bool)

(assert (=> bm!7046 (= call!7052 (contains!735 lt!35607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7047 () Bool)

(declare-fun call!7055 () ListLongMap!1429)

(assert (=> bm!7047 (= call!7049 call!7055)))

(declare-fun b!77564 () Bool)

(declare-fun e!50702 () Unit!2232)

(declare-fun Unit!2241 () Unit!2232)

(assert (=> b!77564 (= e!50702 Unit!2241)))

(declare-fun b!77565 () Bool)

(declare-fun lt!35604 () Unit!2232)

(assert (=> b!77565 (= e!50702 lt!35604)))

(declare-fun lt!35598 () ListLongMap!1429)

(assert (=> b!77565 (= lt!35598 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun lt!35611 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35618 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35618 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35600 () Unit!2232)

(declare-fun addStillContains!54 (ListLongMap!1429 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2232)

(assert (=> b!77565 (= lt!35600 (addStillContains!54 lt!35598 lt!35611 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) lt!35618))))

(assert (=> b!77565 (contains!735 (+!102 lt!35598 (tuple2!2167 lt!35611 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))))) lt!35618)))

(declare-fun lt!35603 () Unit!2232)

(assert (=> b!77565 (= lt!35603 lt!35600)))

(declare-fun lt!35619 () ListLongMap!1429)

(assert (=> b!77565 (= lt!35619 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun lt!35617 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35617 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35614 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35614 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35605 () Unit!2232)

(declare-fun addApplyDifferent!54 (ListLongMap!1429 (_ BitVec 64) V!2985 (_ BitVec 64)) Unit!2232)

(assert (=> b!77565 (= lt!35605 (addApplyDifferent!54 lt!35619 lt!35617 (minValue!2163 (v!2577 (underlying!271 thiss!992))) lt!35614))))

(assert (=> b!77565 (= (apply!78 (+!102 lt!35619 (tuple2!2167 lt!35617 (minValue!2163 (v!2577 (underlying!271 thiss!992))))) lt!35614) (apply!78 lt!35619 lt!35614))))

(declare-fun lt!35613 () Unit!2232)

(assert (=> b!77565 (= lt!35613 lt!35605)))

(declare-fun lt!35608 () ListLongMap!1429)

(assert (=> b!77565 (= lt!35608 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun lt!35599 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35609 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35609 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35601 () Unit!2232)

(assert (=> b!77565 (= lt!35601 (addApplyDifferent!54 lt!35608 lt!35599 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) lt!35609))))

(assert (=> b!77565 (= (apply!78 (+!102 lt!35608 (tuple2!2167 lt!35599 (zeroValue!2163 (v!2577 (underlying!271 thiss!992))))) lt!35609) (apply!78 lt!35608 lt!35609))))

(declare-fun lt!35606 () Unit!2232)

(assert (=> b!77565 (= lt!35606 lt!35601)))

(declare-fun lt!35616 () ListLongMap!1429)

(assert (=> b!77565 (= lt!35616 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun lt!35602 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35602 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35612 () (_ BitVec 64))

(assert (=> b!77565 (= lt!35612 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!77565 (= lt!35604 (addApplyDifferent!54 lt!35616 lt!35602 (minValue!2163 (v!2577 (underlying!271 thiss!992))) lt!35612))))

(assert (=> b!77565 (= (apply!78 (+!102 lt!35616 (tuple2!2167 lt!35602 (minValue!2163 (v!2577 (underlying!271 thiss!992))))) lt!35612) (apply!78 lt!35616 lt!35612))))

(declare-fun bm!7048 () Bool)

(declare-fun call!7054 () ListLongMap!1429)

(declare-fun call!7050 () ListLongMap!1429)

(assert (=> bm!7048 (= call!7054 call!7050)))

(declare-fun b!77566 () Bool)

(declare-fun e!50707 () Bool)

(assert (=> b!77566 (= e!50704 e!50707)))

(declare-fun res!40698 () Bool)

(assert (=> b!77566 (= res!40698 call!7051)))

(assert (=> b!77566 (=> (not res!40698) (not e!50707))))

(declare-fun b!77567 () Bool)

(assert (=> b!77567 (= e!50698 call!7049)))

(declare-fun bm!7049 () Bool)

(assert (=> bm!7049 (= call!7051 (contains!735 lt!35607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7050 () Bool)

(declare-fun call!7053 () ListLongMap!1429)

(assert (=> bm!7050 (= call!7053 (getCurrentListMapNoExtraKeys!66 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77568 () Bool)

(declare-fun e!50710 () ListLongMap!1429)

(assert (=> b!77568 (= e!50710 (+!102 call!7055 (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77569 () Bool)

(assert (=> b!77569 (= e!50700 e!50704)))

(declare-fun c!11844 () Bool)

(assert (=> b!77569 (= c!11844 (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!77570 () Bool)

(assert (=> b!77570 (= e!50703 (validKeyInArray!0 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77571 () Bool)

(assert (=> b!77571 (= e!50698 call!7054)))

(declare-fun c!11842 () Bool)

(declare-fun c!11843 () Bool)

(declare-fun bm!7051 () Bool)

(assert (=> bm!7051 (= call!7055 (+!102 (ite c!11842 call!7053 (ite c!11843 call!7050 call!7054)) (ite (or c!11842 c!11843) (tuple2!2167 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2163 (v!2577 (underlying!271 thiss!992)))) (tuple2!2167 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2163 (v!2577 (underlying!271 thiss!992)))))))))

(declare-fun bm!7052 () Bool)

(assert (=> bm!7052 (= call!7050 call!7053)))

(declare-fun b!77572 () Bool)

(declare-fun e!50705 () Bool)

(assert (=> b!77572 (= e!50705 (= (apply!78 lt!35607 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1172 (select (arr!1877 (_values!2248 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!336 (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!77572 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2119 (_values!2248 (v!2577 (underlying!271 thiss!992))))))))

(assert (=> b!77572 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77573 () Bool)

(assert (=> b!77573 (= e!50707 (= (apply!78 lt!35607 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2163 (v!2577 (underlying!271 thiss!992)))))))

(declare-fun b!77574 () Bool)

(assert (=> b!77574 (= e!50709 e!50708)))

(declare-fun res!40702 () Bool)

(assert (=> b!77574 (= res!40702 call!7052)))

(assert (=> b!77574 (=> (not res!40702) (not e!50708))))

(declare-fun b!77575 () Bool)

(assert (=> b!77575 (= e!50706 e!50705)))

(declare-fun res!40700 () Bool)

(assert (=> b!77575 (=> (not res!40700) (not e!50705))))

(assert (=> b!77575 (= res!40700 (contains!735 lt!35607 (select (arr!1876 (_keys!3924 (v!2577 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77575 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(declare-fun b!77563 () Bool)

(assert (=> b!77563 (= e!50710 e!50699)))

(assert (=> b!77563 (= c!11843 (and (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!18345 () Bool)

(assert (=> d!18345 e!50700))

(declare-fun res!40697 () Bool)

(assert (=> d!18345 (=> (not res!40697) (not e!50700))))

(assert (=> d!18345 (= res!40697 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))))

(declare-fun lt!35610 () ListLongMap!1429)

(assert (=> d!18345 (= lt!35607 lt!35610)))

(declare-fun lt!35615 () Unit!2232)

(assert (=> d!18345 (= lt!35615 e!50702)))

(declare-fun c!11845 () Bool)

(assert (=> d!18345 (= c!11845 e!50701)))

(declare-fun res!40701 () Bool)

(assert (=> d!18345 (=> (not res!40701) (not e!50701))))

(assert (=> d!18345 (= res!40701 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2118 (_keys!3924 (v!2577 (underlying!271 thiss!992))))))))

(assert (=> d!18345 (= lt!35610 e!50710)))

(assert (=> d!18345 (= c!11842 (and (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18345 (validMask!0 (mask!6257 (v!2577 (underlying!271 thiss!992))))))

(assert (=> d!18345 (= (getCurrentListMap!420 (_keys!3924 (v!2577 (underlying!271 thiss!992))) (_values!2248 (v!2577 (underlying!271 thiss!992))) (mask!6257 (v!2577 (underlying!271 thiss!992))) (extraKeys!2116 (v!2577 (underlying!271 thiss!992))) (zeroValue!2163 (v!2577 (underlying!271 thiss!992))) (minValue!2163 (v!2577 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992)))) lt!35607)))

(assert (= (and d!18345 c!11842) b!77568))

(assert (= (and d!18345 (not c!11842)) b!77563))

(assert (= (and b!77563 c!11843) b!77561))

(assert (= (and b!77563 (not c!11843)) b!77559))

(assert (= (and b!77559 c!11846) b!77567))

(assert (= (and b!77559 (not c!11846)) b!77571))

(assert (= (or b!77567 b!77571) bm!7048))

(assert (= (or b!77561 bm!7048) bm!7052))

(assert (= (or b!77561 b!77567) bm!7047))

(assert (= (or b!77568 bm!7052) bm!7050))

(assert (= (or b!77568 bm!7047) bm!7051))

(assert (= (and d!18345 res!40701) b!77557))

(assert (= (and d!18345 c!11845) b!77565))

(assert (= (and d!18345 (not c!11845)) b!77564))

(assert (= (and d!18345 res!40697) b!77562))

(assert (= (and b!77562 res!40704) b!77570))

(assert (= (and b!77562 (not res!40703)) b!77575))

(assert (= (and b!77575 res!40700) b!77572))

(assert (= (and b!77562 res!40699) b!77560))

(assert (= (and b!77560 c!11841) b!77574))

(assert (= (and b!77560 (not c!11841)) b!77558))

(assert (= (and b!77574 res!40702) b!77555))

(assert (= (or b!77574 b!77558) bm!7046))

(assert (= (and b!77560 res!40696) b!77569))

(assert (= (and b!77569 c!11844) b!77566))

(assert (= (and b!77569 (not c!11844)) b!77556))

(assert (= (and b!77566 res!40698) b!77573))

(assert (= (or b!77566 b!77556) bm!7049))

(declare-fun b_lambda!3461 () Bool)

(assert (=> (not b_lambda!3461) (not b!77572)))

(assert (=> b!77572 t!5129))

(declare-fun b_and!4757 () Bool)

(assert (= b_and!4753 (and (=> t!5129 result!2781) b_and!4757)))

(assert (=> b!77572 t!5131))

(declare-fun b_and!4759 () Bool)

(assert (= b_and!4755 (and (=> t!5131 result!2785) b_and!4759)))

(assert (=> b!77572 m!77193))

(assert (=> b!77572 m!77193))

(assert (=> b!77572 m!76995))

(assert (=> b!77572 m!77195))

(assert (=> b!77572 m!77197))

(declare-fun m!77403 () Bool)

(assert (=> b!77572 m!77403))

(assert (=> b!77572 m!77197))

(assert (=> b!77572 m!76995))

(assert (=> b!77570 m!77197))

(assert (=> b!77570 m!77197))

(assert (=> b!77570 m!77205))

(declare-fun m!77405 () Bool)

(assert (=> b!77573 m!77405))

(declare-fun m!77407 () Bool)

(assert (=> bm!7051 m!77407))

(declare-fun m!77409 () Bool)

(assert (=> bm!7046 m!77409))

(assert (=> bm!7050 m!77039))

(declare-fun m!77411 () Bool)

(assert (=> b!77568 m!77411))

(assert (=> b!77575 m!77197))

(assert (=> b!77575 m!77197))

(declare-fun m!77413 () Bool)

(assert (=> b!77575 m!77413))

(assert (=> d!18345 m!77025))

(declare-fun m!77415 () Bool)

(assert (=> b!77555 m!77415))

(assert (=> b!77557 m!77197))

(assert (=> b!77557 m!77197))

(assert (=> b!77557 m!77205))

(declare-fun m!77417 () Bool)

(assert (=> b!77565 m!77417))

(declare-fun m!77419 () Bool)

(assert (=> b!77565 m!77419))

(declare-fun m!77421 () Bool)

(assert (=> b!77565 m!77421))

(declare-fun m!77423 () Bool)

(assert (=> b!77565 m!77423))

(declare-fun m!77425 () Bool)

(assert (=> b!77565 m!77425))

(declare-fun m!77427 () Bool)

(assert (=> b!77565 m!77427))

(declare-fun m!77429 () Bool)

(assert (=> b!77565 m!77429))

(declare-fun m!77431 () Bool)

(assert (=> b!77565 m!77431))

(declare-fun m!77433 () Bool)

(assert (=> b!77565 m!77433))

(declare-fun m!77435 () Bool)

(assert (=> b!77565 m!77435))

(declare-fun m!77437 () Bool)

(assert (=> b!77565 m!77437))

(assert (=> b!77565 m!77423))

(assert (=> b!77565 m!77429))

(assert (=> b!77565 m!77433))

(declare-fun m!77439 () Bool)

(assert (=> b!77565 m!77439))

(declare-fun m!77441 () Bool)

(assert (=> b!77565 m!77441))

(assert (=> b!77565 m!77197))

(assert (=> b!77565 m!77039))

(declare-fun m!77443 () Bool)

(assert (=> b!77565 m!77443))

(assert (=> b!77565 m!77419))

(declare-fun m!77445 () Bool)

(assert (=> b!77565 m!77445))

(declare-fun m!77447 () Bool)

(assert (=> bm!7049 m!77447))

(assert (=> b!77166 d!18345))

(declare-fun mapNonEmpty!3291 () Bool)

(declare-fun mapRes!3291 () Bool)

(declare-fun tp!8745 () Bool)

(declare-fun e!50716 () Bool)

(assert (=> mapNonEmpty!3291 (= mapRes!3291 (and tp!8745 e!50716))))

(declare-fun mapRest!3291 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapValue!3291 () ValueCell!908)

(declare-fun mapKey!3291 () (_ BitVec 32))

(assert (=> mapNonEmpty!3291 (= mapRest!3275 (store mapRest!3291 mapKey!3291 mapValue!3291))))

(declare-fun b!77583 () Bool)

(declare-fun e!50715 () Bool)

(assert (=> b!77583 (= e!50715 tp_is_empty!2503)))

(declare-fun condMapEmpty!3291 () Bool)

(declare-fun mapDefault!3291 () ValueCell!908)

(assert (=> mapNonEmpty!3276 (= condMapEmpty!3291 (= mapRest!3275 ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3291)))))

(assert (=> mapNonEmpty!3276 (= tp!8717 (and e!50715 mapRes!3291))))

(declare-fun mapIsEmpty!3291 () Bool)

(assert (=> mapIsEmpty!3291 mapRes!3291))

(declare-fun b!77582 () Bool)

(assert (=> b!77582 (= e!50716 tp_is_empty!2503)))

(assert (= (and mapNonEmpty!3276 condMapEmpty!3291) mapIsEmpty!3291))

(assert (= (and mapNonEmpty!3276 (not condMapEmpty!3291)) mapNonEmpty!3291))

(assert (= (and mapNonEmpty!3291 ((_ is ValueCellFull!908) mapValue!3291)) b!77582))

(assert (= (and mapNonEmpty!3276 ((_ is ValueCellFull!908) mapDefault!3291)) b!77583))

(declare-fun m!77449 () Bool)

(assert (=> mapNonEmpty!3291 m!77449))

(declare-fun mapNonEmpty!3292 () Bool)

(declare-fun mapRes!3292 () Bool)

(declare-fun tp!8746 () Bool)

(declare-fun e!50718 () Bool)

(assert (=> mapNonEmpty!3292 (= mapRes!3292 (and tp!8746 e!50718))))

(declare-fun mapRest!3292 () (Array (_ BitVec 32) ValueCell!908))

(declare-fun mapValue!3292 () ValueCell!908)

(declare-fun mapKey!3292 () (_ BitVec 32))

(assert (=> mapNonEmpty!3292 (= mapRest!3276 (store mapRest!3292 mapKey!3292 mapValue!3292))))

(declare-fun b!77585 () Bool)

(declare-fun e!50717 () Bool)

(assert (=> b!77585 (= e!50717 tp_is_empty!2503)))

(declare-fun condMapEmpty!3292 () Bool)

(declare-fun mapDefault!3292 () ValueCell!908)

(assert (=> mapNonEmpty!3275 (= condMapEmpty!3292 (= mapRest!3276 ((as const (Array (_ BitVec 32) ValueCell!908)) mapDefault!3292)))))

(assert (=> mapNonEmpty!3275 (= tp!8718 (and e!50717 mapRes!3292))))

(declare-fun mapIsEmpty!3292 () Bool)

(assert (=> mapIsEmpty!3292 mapRes!3292))

(declare-fun b!77584 () Bool)

(assert (=> b!77584 (= e!50718 tp_is_empty!2503)))

(assert (= (and mapNonEmpty!3275 condMapEmpty!3292) mapIsEmpty!3292))

(assert (= (and mapNonEmpty!3275 (not condMapEmpty!3292)) mapNonEmpty!3292))

(assert (= (and mapNonEmpty!3292 ((_ is ValueCellFull!908) mapValue!3292)) b!77584))

(assert (= (and mapNonEmpty!3275 ((_ is ValueCellFull!908) mapDefault!3292)) b!77585))

(declare-fun m!77451 () Bool)

(assert (=> mapNonEmpty!3292 m!77451))

(declare-fun b_lambda!3463 () Bool)

(assert (= b_lambda!3457 (or (and b!77160 b_free!2173) (and b!77161 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))))) b_lambda!3463)))

(declare-fun b_lambda!3465 () Bool)

(assert (= b_lambda!3459 (or (and b!77160 b_free!2173) (and b!77161 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))))) b_lambda!3465)))

(declare-fun b_lambda!3467 () Bool)

(assert (= b_lambda!3461 (or (and b!77160 b_free!2173) (and b!77161 b_free!2175 (= (defaultEntry!2265 newMap!16) (defaultEntry!2265 (v!2577 (underlying!271 thiss!992))))) b_lambda!3467)))

(check-sat (not bm!7026) (not b!77496) (not b!77555) (not b!77572) (not b_lambda!3455) (not d!18331) (not bm!7020) (not b!77329) (not d!18297) (not bm!7021) (not b!77312) (not b!77334) (not d!18311) (not b!77436) (not b!77575) (not b!77320) (not b!77485) (not d!18319) (not b!77333) (not b!77323) (not b!77335) (not b_next!2173) (not b!77317) (not b!77484) (not b!77316) (not b!77568) (not bm!7010) (not b!77336) (not bm!6956) (not b!77565) (not b!77313) (not b!77557) (not d!18299) (not mapNonEmpty!3292) (not b!77451) (not d!18323) (not b!77483) (not b!77339) (not b!77439) (not d!18303) (not b!77350) (not b!77331) (not d!18321) (not d!18293) (not b_lambda!3467) (not b!77512) (not bm!7009) (not d!18307) (not b!77328) (not b!77340) (not bm!7023) (not b!77338) (not d!18339) (not b!77453) (not b!77348) (not b!77570) (not d!18333) (not bm!7049) (not b!77510) (not d!18305) (not mapNonEmpty!3291) (not d!18345) (not d!18343) (not b!77475) (not b!77441) (not d!18301) (not b!77491) (not b!77465) (not b!77573) (not b!77337) b_and!4757 tp_is_empty!2503 (not bm!7007) (not b!77511) (not b!77332) (not b_lambda!3465) (not b!77330) (not bm!7051) (not d!18295) (not b!77314) (not bm!7027) (not d!18335) (not bm!7050) (not bm!7005) (not bm!7046) (not b_next!2175) (not b!77467) (not b!77341) (not b!77476) (not b!77319) (not b_lambda!3463) (not bm!7025) (not bm!7031) (not bm!7015) (not bm!7017) (not d!18313) b_and!4759)
(check-sat b_and!4757 b_and!4759 (not b_next!2173) (not b_next!2175))
