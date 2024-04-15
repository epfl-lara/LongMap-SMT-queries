; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12138 () Bool)

(assert start!12138)

(declare-fun b!102112 () Bool)

(declare-fun b_free!2473 () Bool)

(declare-fun b_next!2473 () Bool)

(assert (=> b!102112 (= b_free!2473 (not b_next!2473))))

(declare-fun tp!9730 () Bool)

(declare-fun b_and!6269 () Bool)

(assert (=> b!102112 (= tp!9730 b_and!6269)))

(declare-fun b!102107 () Bool)

(declare-fun b_free!2475 () Bool)

(declare-fun b_next!2475 () Bool)

(assert (=> b!102107 (= b_free!2475 (not b_next!2475))))

(declare-fun tp!9731 () Bool)

(declare-fun b_and!6271 () Bool)

(assert (=> b!102107 (= tp!9731 b_and!6271)))

(declare-fun b!102095 () Bool)

(declare-datatypes ((Unit!3114 0))(
  ( (Unit!3115) )
))
(declare-fun e!66454 () Unit!3114)

(declare-fun Unit!3116 () Unit!3114)

(assert (=> b!102095 (= e!66454 Unit!3116)))

(declare-fun lt!51857 () Unit!3114)

(declare-datatypes ((V!3185 0))(
  ( (V!3186 (val!1371 Int)) )
))
(declare-datatypes ((array!4273 0))(
  ( (array!4274 (arr!2026 (Array (_ BitVec 32) (_ BitVec 64))) (size!2281 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!983 0))(
  ( (ValueCellFull!983 (v!2846 V!3185)) (EmptyCell!983) )
))
(declare-datatypes ((array!4275 0))(
  ( (array!4276 (arr!2027 (Array (_ BitVec 32) ValueCell!983)) (size!2282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!874 0))(
  ( (LongMapFixedSize!875 (defaultEntry!2548 Int) (mask!6676 (_ BitVec 32)) (extraKeys!2357 (_ BitVec 32)) (zeroValue!2425 V!3185) (minValue!2425 V!3185) (_size!486 (_ BitVec 32)) (_keys!4249 array!4273) (_values!2531 array!4275) (_vacant!486 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!664 0))(
  ( (Cell!665 (v!2847 LongMapFixedSize!874)) )
))
(declare-datatypes ((LongMap!664 0))(
  ( (LongMap!665 (underlying!343 Cell!664)) )
))
(declare-fun thiss!992 () LongMap!664)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!104 (array!4273 array!4275 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 64) (_ BitVec 32) Int) Unit!3114)

(assert (=> b!102095 (= lt!51857 (lemmaListMapContainsThenArrayContainsFrom!104 (_keys!4249 (v!2847 (underlying!343 thiss!992))) (_values!2531 (v!2847 (underlying!343 thiss!992))) (mask!6676 (v!2847 (underlying!343 thiss!992))) (extraKeys!2357 (v!2847 (underlying!343 thiss!992))) (zeroValue!2425 (v!2847 (underlying!343 thiss!992))) (minValue!2425 (v!2847 (underlying!343 thiss!992))) (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2847 (underlying!343 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102095 (arrayContainsKey!0 (_keys!4249 (v!2847 (underlying!343 thiss!992))) (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51858 () Unit!3114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4273 (_ BitVec 32) (_ BitVec 32)) Unit!3114)

(assert (=> b!102095 (= lt!51858 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4249 (v!2847 (underlying!343 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1602 0))(
  ( (Nil!1599) (Cons!1598 (h!2194 (_ BitVec 64)) (t!5619 List!1602)) )
))
(declare-fun arrayNoDuplicates!0 (array!4273 (_ BitVec 32) List!1602) Bool)

(assert (=> b!102095 (arrayNoDuplicates!0 (_keys!4249 (v!2847 (underlying!343 thiss!992))) from!355 Nil!1599)))

(declare-fun lt!51860 () Unit!3114)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4273 (_ BitVec 32) (_ BitVec 64) List!1602) Unit!3114)

(assert (=> b!102095 (= lt!51860 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4249 (v!2847 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) (Cons!1598 (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) Nil!1599)))))

(assert (=> b!102095 false))

(declare-fun b!102096 () Bool)

(declare-fun e!66446 () Bool)

(declare-fun e!66455 () Bool)

(declare-fun mapRes!3840 () Bool)

(assert (=> b!102096 (= e!66446 (and e!66455 mapRes!3840))))

(declare-fun condMapEmpty!3840 () Bool)

(declare-fun mapDefault!3840 () ValueCell!983)

(assert (=> b!102096 (= condMapEmpty!3840 (= (arr!2027 (_values!2531 (v!2847 (underlying!343 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!983)) mapDefault!3840)))))

(declare-fun b!102098 () Bool)

(declare-fun e!66447 () Bool)

(declare-fun tp_is_empty!2653 () Bool)

(assert (=> b!102098 (= e!66447 tp_is_empty!2653)))

(declare-fun b!102099 () Bool)

(declare-fun e!66445 () Bool)

(declare-fun e!66448 () Bool)

(assert (=> b!102099 (= e!66445 e!66448)))

(declare-fun mapIsEmpty!3839 () Bool)

(assert (=> mapIsEmpty!3839 mapRes!3840))

(declare-fun b!102100 () Bool)

(declare-fun res!51104 () Bool)

(declare-fun e!66442 () Bool)

(assert (=> b!102100 (=> (not res!51104) (not e!66442))))

(assert (=> b!102100 (= res!51104 (arrayNoDuplicates!0 (_keys!4249 (v!2847 (underlying!343 thiss!992))) #b00000000000000000000000000000000 Nil!1599))))

(declare-fun b!102101 () Bool)

(declare-fun e!66443 () Bool)

(assert (=> b!102101 (= e!66443 e!66445)))

(declare-fun b!102102 () Bool)

(declare-fun e!66457 () Bool)

(declare-fun e!66449 () Bool)

(declare-fun mapRes!3839 () Bool)

(assert (=> b!102102 (= e!66457 (and e!66449 mapRes!3839))))

(declare-fun condMapEmpty!3839 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!874)

(declare-fun mapDefault!3839 () ValueCell!983)

(assert (=> b!102102 (= condMapEmpty!3839 (= (arr!2027 (_values!2531 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!983)) mapDefault!3839)))))

(declare-fun mapNonEmpty!3839 () Bool)

(declare-fun tp!9732 () Bool)

(assert (=> mapNonEmpty!3839 (= mapRes!3839 (and tp!9732 e!66447))))

(declare-fun mapKey!3839 () (_ BitVec 32))

(declare-fun mapRest!3839 () (Array (_ BitVec 32) ValueCell!983))

(declare-fun mapValue!3839 () ValueCell!983)

(assert (=> mapNonEmpty!3839 (= (arr!2027 (_values!2531 newMap!16)) (store mapRest!3839 mapKey!3839 mapValue!3839))))

(declare-fun b!102103 () Bool)

(declare-fun res!51110 () Bool)

(declare-fun e!66444 () Bool)

(assert (=> b!102103 (=> (not res!51110) (not e!66444))))

(declare-fun valid!408 (LongMapFixedSize!874) Bool)

(assert (=> b!102103 (= res!51110 (valid!408 newMap!16))))

(declare-fun b!102104 () Bool)

(declare-fun res!51105 () Bool)

(assert (=> b!102104 (=> (not res!51105) (not e!66442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!102104 (= res!51105 (validMask!0 (mask!6676 (v!2847 (underlying!343 thiss!992)))))))

(declare-fun b!102105 () Bool)

(declare-fun res!51103 () Bool)

(assert (=> b!102105 (=> (not res!51103) (not e!66442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4273 (_ BitVec 32)) Bool)

(assert (=> b!102105 (= res!51103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4249 (v!2847 (underlying!343 thiss!992))) (mask!6676 (v!2847 (underlying!343 thiss!992)))))))

(declare-fun b!102106 () Bool)

(declare-fun Unit!3117 () Unit!3114)

(assert (=> b!102106 (= e!66454 Unit!3117)))

(declare-fun e!66456 () Bool)

(declare-fun array_inv!1275 (array!4273) Bool)

(declare-fun array_inv!1276 (array!4275) Bool)

(assert (=> b!102107 (= e!66456 (and tp!9731 tp_is_empty!2653 (array_inv!1275 (_keys!4249 newMap!16)) (array_inv!1276 (_values!2531 newMap!16)) e!66457))))

(declare-fun res!51109 () Bool)

(assert (=> start!12138 (=> (not res!51109) (not e!66444))))

(declare-fun valid!409 (LongMap!664) Bool)

(assert (=> start!12138 (= res!51109 (valid!409 thiss!992))))

(assert (=> start!12138 e!66444))

(assert (=> start!12138 e!66443))

(assert (=> start!12138 true))

(assert (=> start!12138 e!66456))

(declare-fun b!102097 () Bool)

(assert (=> b!102097 (= e!66455 tp_is_empty!2653)))

(declare-fun b!102108 () Bool)

(assert (=> b!102108 (= e!66442 (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun b!102109 () Bool)

(declare-fun res!51107 () Bool)

(assert (=> b!102109 (=> (not res!51107) (not e!66444))))

(assert (=> b!102109 (= res!51107 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6676 newMap!16)) (_size!486 (v!2847 (underlying!343 thiss!992)))))))

(declare-fun mapIsEmpty!3840 () Bool)

(assert (=> mapIsEmpty!3840 mapRes!3839))

(declare-fun b!102110 () Bool)

(declare-fun e!66453 () Bool)

(assert (=> b!102110 (= e!66453 e!66442)))

(declare-fun res!51106 () Bool)

(assert (=> b!102110 (=> (not res!51106) (not e!66442))))

(declare-datatypes ((tuple2!2352 0))(
  ( (tuple2!2353 (_1!1187 Bool) (_2!1187 LongMapFixedSize!874)) )
))
(declare-fun lt!51855 () tuple2!2352)

(assert (=> b!102110 (= res!51106 (and (_1!1187 lt!51855) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!51861 () Unit!3114)

(assert (=> b!102110 (= lt!51861 e!66454)))

(declare-fun c!17589 () Bool)

(declare-datatypes ((tuple2!2354 0))(
  ( (tuple2!2355 (_1!1188 (_ BitVec 64)) (_2!1188 V!3185)) )
))
(declare-datatypes ((List!1603 0))(
  ( (Nil!1600) (Cons!1599 (h!2195 tuple2!2354) (t!5620 List!1603)) )
))
(declare-datatypes ((ListLongMap!1527 0))(
  ( (ListLongMap!1528 (toList!779 List!1603)) )
))
(declare-fun lt!51856 () ListLongMap!1527)

(declare-fun contains!810 (ListLongMap!1527 (_ BitVec 64)) Bool)

(assert (=> b!102110 (= c!17589 (contains!810 lt!51856 (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355)))))

(declare-fun update!153 (LongMapFixedSize!874 (_ BitVec 64) V!3185) tuple2!2352)

(declare-fun get!1311 (ValueCell!983 V!3185) V!3185)

(declare-fun dynLambda!376 (Int (_ BitVec 64)) V!3185)

(assert (=> b!102110 (= lt!51855 (update!153 newMap!16 (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) (get!1311 (select (arr!2027 (_values!2531 (v!2847 (underlying!343 thiss!992)))) from!355) (dynLambda!376 (defaultEntry!2548 (v!2847 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!102111 () Bool)

(declare-fun e!66450 () Bool)

(assert (=> b!102111 (= e!66450 tp_is_empty!2653)))

(assert (=> b!102112 (= e!66448 (and tp!9730 tp_is_empty!2653 (array_inv!1275 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) (array_inv!1276 (_values!2531 (v!2847 (underlying!343 thiss!992)))) e!66446))))

(declare-fun b!102113 () Bool)

(declare-fun res!51111 () Bool)

(assert (=> b!102113 (=> (not res!51111) (not e!66444))))

(assert (=> b!102113 (= res!51111 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2281 (_keys!4249 (v!2847 (underlying!343 thiss!992)))))))))

(declare-fun b!102114 () Bool)

(assert (=> b!102114 (= e!66449 tp_is_empty!2653)))

(declare-fun b!102115 () Bool)

(declare-fun res!51112 () Bool)

(assert (=> b!102115 (=> (not res!51112) (not e!66442))))

(assert (=> b!102115 (= res!51112 (and (= (size!2282 (_values!2531 (v!2847 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6676 (v!2847 (underlying!343 thiss!992))))) (= (size!2281 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) (size!2282 (_values!2531 (v!2847 (underlying!343 thiss!992))))) (bvsge (mask!6676 (v!2847 (underlying!343 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2357 (v!2847 (underlying!343 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2357 (v!2847 (underlying!343 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!3840 () Bool)

(declare-fun tp!9729 () Bool)

(assert (=> mapNonEmpty!3840 (= mapRes!3840 (and tp!9729 e!66450))))

(declare-fun mapRest!3840 () (Array (_ BitVec 32) ValueCell!983))

(declare-fun mapValue!3840 () ValueCell!983)

(declare-fun mapKey!3840 () (_ BitVec 32))

(assert (=> mapNonEmpty!3840 (= (arr!2027 (_values!2531 (v!2847 (underlying!343 thiss!992)))) (store mapRest!3840 mapKey!3840 mapValue!3840))))

(declare-fun b!102116 () Bool)

(assert (=> b!102116 (= e!66444 e!66453)))

(declare-fun res!51108 () Bool)

(assert (=> b!102116 (=> (not res!51108) (not e!66453))))

(declare-fun lt!51859 () ListLongMap!1527)

(assert (=> b!102116 (= res!51108 (and (= lt!51859 lt!51856) (not (= (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2026 (_keys!4249 (v!2847 (underlying!343 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1256 (LongMapFixedSize!874) ListLongMap!1527)

(assert (=> b!102116 (= lt!51856 (map!1256 newMap!16))))

(declare-fun getCurrentListMap!458 (array!4273 array!4275 (_ BitVec 32) (_ BitVec 32) V!3185 V!3185 (_ BitVec 32) Int) ListLongMap!1527)

(assert (=> b!102116 (= lt!51859 (getCurrentListMap!458 (_keys!4249 (v!2847 (underlying!343 thiss!992))) (_values!2531 (v!2847 (underlying!343 thiss!992))) (mask!6676 (v!2847 (underlying!343 thiss!992))) (extraKeys!2357 (v!2847 (underlying!343 thiss!992))) (zeroValue!2425 (v!2847 (underlying!343 thiss!992))) (minValue!2425 (v!2847 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2548 (v!2847 (underlying!343 thiss!992)))))))

(assert (= (and start!12138 res!51109) b!102113))

(assert (= (and b!102113 res!51111) b!102103))

(assert (= (and b!102103 res!51110) b!102109))

(assert (= (and b!102109 res!51107) b!102116))

(assert (= (and b!102116 res!51108) b!102110))

(assert (= (and b!102110 c!17589) b!102095))

(assert (= (and b!102110 (not c!17589)) b!102106))

(assert (= (and b!102110 res!51106) b!102104))

(assert (= (and b!102104 res!51105) b!102115))

(assert (= (and b!102115 res!51112) b!102105))

(assert (= (and b!102105 res!51103) b!102100))

(assert (= (and b!102100 res!51104) b!102108))

(assert (= (and b!102096 condMapEmpty!3840) mapIsEmpty!3839))

(assert (= (and b!102096 (not condMapEmpty!3840)) mapNonEmpty!3840))

(get-info :version)

(assert (= (and mapNonEmpty!3840 ((_ is ValueCellFull!983) mapValue!3840)) b!102111))

(assert (= (and b!102096 ((_ is ValueCellFull!983) mapDefault!3840)) b!102097))

(assert (= b!102112 b!102096))

(assert (= b!102099 b!102112))

(assert (= b!102101 b!102099))

(assert (= start!12138 b!102101))

(assert (= (and b!102102 condMapEmpty!3839) mapIsEmpty!3840))

(assert (= (and b!102102 (not condMapEmpty!3839)) mapNonEmpty!3839))

(assert (= (and mapNonEmpty!3839 ((_ is ValueCellFull!983) mapValue!3839)) b!102098))

(assert (= (and b!102102 ((_ is ValueCellFull!983) mapDefault!3839)) b!102114))

(assert (= b!102107 b!102102))

(assert (= start!12138 b!102107))

(declare-fun b_lambda!4561 () Bool)

(assert (=> (not b_lambda!4561) (not b!102110)))

(declare-fun t!5616 () Bool)

(declare-fun tb!1985 () Bool)

(assert (=> (and b!102112 (= (defaultEntry!2548 (v!2847 (underlying!343 thiss!992))) (defaultEntry!2548 (v!2847 (underlying!343 thiss!992)))) t!5616) tb!1985))

(declare-fun result!3355 () Bool)

(assert (=> tb!1985 (= result!3355 tp_is_empty!2653)))

(assert (=> b!102110 t!5616))

(declare-fun b_and!6273 () Bool)

(assert (= b_and!6269 (and (=> t!5616 result!3355) b_and!6273)))

(declare-fun t!5618 () Bool)

(declare-fun tb!1987 () Bool)

(assert (=> (and b!102107 (= (defaultEntry!2548 newMap!16) (defaultEntry!2548 (v!2847 (underlying!343 thiss!992)))) t!5618) tb!1987))

(declare-fun result!3359 () Bool)

(assert (= result!3359 result!3355))

(assert (=> b!102110 t!5618))

(declare-fun b_and!6275 () Bool)

(assert (= b_and!6271 (and (=> t!5618 result!3359) b_and!6275)))

(declare-fun m!112863 () Bool)

(assert (=> b!102104 m!112863))

(declare-fun m!112865 () Bool)

(assert (=> b!102105 m!112865))

(declare-fun m!112867 () Bool)

(assert (=> b!102110 m!112867))

(declare-fun m!112869 () Bool)

(assert (=> b!102110 m!112869))

(declare-fun m!112871 () Bool)

(assert (=> b!102110 m!112871))

(declare-fun m!112873 () Bool)

(assert (=> b!102110 m!112873))

(assert (=> b!102110 m!112873))

(assert (=> b!102110 m!112871))

(declare-fun m!112875 () Bool)

(assert (=> b!102110 m!112875))

(assert (=> b!102110 m!112867))

(assert (=> b!102110 m!112873))

(declare-fun m!112877 () Bool)

(assert (=> b!102110 m!112877))

(assert (=> b!102110 m!112869))

(declare-fun m!112879 () Bool)

(assert (=> b!102112 m!112879))

(declare-fun m!112881 () Bool)

(assert (=> b!102112 m!112881))

(declare-fun m!112883 () Bool)

(assert (=> start!12138 m!112883))

(assert (=> b!102116 m!112873))

(declare-fun m!112885 () Bool)

(assert (=> b!102116 m!112885))

(declare-fun m!112887 () Bool)

(assert (=> b!102116 m!112887))

(declare-fun m!112889 () Bool)

(assert (=> b!102100 m!112889))

(declare-fun m!112891 () Bool)

(assert (=> mapNonEmpty!3840 m!112891))

(declare-fun m!112893 () Bool)

(assert (=> b!102095 m!112893))

(declare-fun m!112895 () Bool)

(assert (=> b!102095 m!112895))

(assert (=> b!102095 m!112873))

(declare-fun m!112897 () Bool)

(assert (=> b!102095 m!112897))

(assert (=> b!102095 m!112873))

(assert (=> b!102095 m!112873))

(declare-fun m!112899 () Bool)

(assert (=> b!102095 m!112899))

(assert (=> b!102095 m!112873))

(declare-fun m!112901 () Bool)

(assert (=> b!102095 m!112901))

(declare-fun m!112903 () Bool)

(assert (=> b!102103 m!112903))

(declare-fun m!112905 () Bool)

(assert (=> mapNonEmpty!3839 m!112905))

(declare-fun m!112907 () Bool)

(assert (=> b!102107 m!112907))

(declare-fun m!112909 () Bool)

(assert (=> b!102107 m!112909))

(check-sat b_and!6275 (not mapNonEmpty!3839) (not b!102116) (not b!102104) (not b!102105) (not b_next!2473) (not b!102107) tp_is_empty!2653 (not b!102095) (not b_lambda!4561) (not b!102103) (not mapNonEmpty!3840) (not b_next!2475) (not b!102110) (not start!12138) (not b!102100) (not b!102112) b_and!6273)
(check-sat b_and!6273 b_and!6275 (not b_next!2473) (not b_next!2475))
