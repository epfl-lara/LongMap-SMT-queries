; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8316 () Bool)

(assert start!8316)

(declare-fun b!54450 () Bool)

(declare-fun b_free!1789 () Bool)

(declare-fun b_next!1789 () Bool)

(assert (=> b!54450 (= b_free!1789 (not b_next!1789))))

(declare-fun tp!7469 () Bool)

(declare-fun b_and!3117 () Bool)

(assert (=> b!54450 (= tp!7469 b_and!3117)))

(declare-fun b!54459 () Bool)

(declare-fun b_free!1791 () Bool)

(declare-fun b_next!1791 () Bool)

(assert (=> b!54459 (= b_free!1791 (not b_next!1791))))

(declare-fun tp!7470 () Bool)

(declare-fun b_and!3119 () Bool)

(assert (=> b!54459 (= tp!7470 b_and!3119)))

(declare-fun b!54445 () Bool)

(declare-fun e!35574 () Bool)

(declare-fun tp_is_empty!2311 () Bool)

(assert (=> b!54445 (= e!35574 tp_is_empty!2311)))

(declare-fun mapIsEmpty!2603 () Bool)

(declare-fun mapRes!2604 () Bool)

(assert (=> mapIsEmpty!2603 mapRes!2604))

(declare-fun b!54446 () Bool)

(declare-fun e!35571 () Bool)

(declare-fun e!35568 () Bool)

(assert (=> b!54446 (= e!35571 e!35568)))

(declare-fun b!54448 () Bool)

(declare-fun e!35578 () Bool)

(assert (=> b!54448 (= e!35578 tp_is_empty!2311)))

(declare-fun b!54449 () Bool)

(declare-fun res!30811 () Bool)

(declare-fun e!35570 () Bool)

(assert (=> b!54449 (=> (not res!30811) (not e!35570))))

(declare-datatypes ((V!2729 0))(
  ( (V!2730 (val!1200 Int)) )
))
(declare-datatypes ((array!3531 0))(
  ( (array!3532 (arr!1688 (Array (_ BitVec 32) (_ BitVec 64))) (size!1917 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!812 0))(
  ( (ValueCellFull!812 (v!2289 V!2729)) (EmptyCell!812) )
))
(declare-datatypes ((array!3533 0))(
  ( (array!3534 (arr!1689 (Array (_ BitVec 32) ValueCell!812)) (size!1918 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!532 0))(
  ( (LongMapFixedSize!533 (defaultEntry!1980 Int) (mask!5827 (_ BitVec 32)) (extraKeys!1871 (_ BitVec 32)) (zeroValue!1898 V!2729) (minValue!1898 V!2729) (_size!315 (_ BitVec 32)) (_keys!3600 array!3531) (_values!1963 array!3533) (_vacant!315 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!532)

(declare-datatypes ((Cell!352 0))(
  ( (Cell!353 (v!2290 LongMapFixedSize!532)) )
))
(declare-datatypes ((LongMap!352 0))(
  ( (LongMap!353 (underlying!187 Cell!352)) )
))
(declare-fun thiss!992 () LongMap!352)

(assert (=> b!54449 (= res!30811 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5827 newMap!16)) (_size!315 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun e!35563 () Bool)

(declare-fun e!35573 () Bool)

(declare-fun array_inv!1035 (array!3531) Bool)

(declare-fun array_inv!1036 (array!3533) Bool)

(assert (=> b!54450 (= e!35563 (and tp!7469 tp_is_empty!2311 (array_inv!1035 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) (array_inv!1036 (_values!1963 (v!2290 (underlying!187 thiss!992)))) e!35573))))

(declare-fun b!54451 () Bool)

(declare-fun e!35576 () Bool)

(declare-fun e!35572 () Bool)

(assert (=> b!54451 (= e!35576 e!35572)))

(declare-fun res!30808 () Bool)

(assert (=> b!54451 (=> (not res!30808) (not e!35572))))

(declare-datatypes ((tuple2!1922 0))(
  ( (tuple2!1923 (_1!972 (_ BitVec 64)) (_2!972 V!2729)) )
))
(declare-datatypes ((List!1366 0))(
  ( (Nil!1363) (Cons!1362 (h!1942 tuple2!1922) (t!4524 List!1366)) )
))
(declare-datatypes ((ListLongMap!1291 0))(
  ( (ListLongMap!1292 (toList!661 List!1366)) )
))
(declare-fun lt!21622 () ListLongMap!1291)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!639 (ListLongMap!1291 (_ BitVec 64)) Bool)

(assert (=> b!54451 (= res!30808 (contains!639 lt!21622 (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1924 0))(
  ( (tuple2!1925 (_1!973 Bool) (_2!973 LongMapFixedSize!532)) )
))
(declare-fun lt!21625 () tuple2!1924)

(declare-fun update!66 (LongMapFixedSize!532 (_ BitVec 64) V!2729) tuple2!1924)

(declare-fun get!1019 (ValueCell!812 V!2729) V!2729)

(declare-fun dynLambda!284 (Int (_ BitVec 64)) V!2729)

(assert (=> b!54451 (= lt!21625 (update!66 newMap!16 (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355) (get!1019 (select (arr!1689 (_values!1963 (v!2290 (underlying!187 thiss!992)))) from!355) (dynLambda!284 (defaultEntry!1980 (v!2290 (underlying!187 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54452 () Bool)

(declare-fun e!35566 () Bool)

(assert (=> b!54452 (= e!35572 (not e!35566))))

(declare-fun res!30813 () Bool)

(assert (=> b!54452 (=> res!30813 e!35566)))

(assert (=> b!54452 (= res!30813 (or (bvsge (size!1917 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1917 (_keys!3600 (v!2290 (underlying!187 thiss!992))))) (bvsgt from!355 (size!1917 (_keys!3600 (v!2290 (underlying!187 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54452 (arrayContainsKey!0 (_keys!3600 (v!2290 (underlying!187 thiss!992))) (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1442 0))(
  ( (Unit!1443) )
))
(declare-fun lt!21626 () Unit!1442)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!5 (array!3531 array!3533 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 64) (_ BitVec 32) Int) Unit!1442)

(assert (=> b!54452 (= lt!21626 (lemmaListMapContainsThenArrayContainsFrom!5 (_keys!3600 (v!2290 (underlying!187 thiss!992))) (_values!1963 (v!2290 (underlying!187 thiss!992))) (mask!5827 (v!2290 (underlying!187 thiss!992))) (extraKeys!1871 (v!2290 (underlying!187 thiss!992))) (zeroValue!1898 (v!2290 (underlying!187 thiss!992))) (minValue!1898 (v!2290 (underlying!187 thiss!992))) (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun b!54453 () Bool)

(declare-fun mapRes!2603 () Bool)

(assert (=> b!54453 (= e!35573 (and e!35578 mapRes!2603))))

(declare-fun condMapEmpty!2603 () Bool)

(declare-fun mapDefault!2604 () ValueCell!812)

(assert (=> b!54453 (= condMapEmpty!2603 (= (arr!1689 (_values!1963 (v!2290 (underlying!187 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!812)) mapDefault!2604)))))

(declare-fun mapIsEmpty!2604 () Bool)

(assert (=> mapIsEmpty!2604 mapRes!2603))

(declare-fun b!54454 () Bool)

(assert (=> b!54454 (= e!35566 true)))

(declare-fun lt!21623 () Bool)

(declare-datatypes ((List!1367 0))(
  ( (Nil!1364) (Cons!1363 (h!1943 (_ BitVec 64)) (t!4525 List!1367)) )
))
(declare-fun arrayNoDuplicates!0 (array!3531 (_ BitVec 32) List!1367) Bool)

(assert (=> b!54454 (= lt!21623 (arrayNoDuplicates!0 (_keys!3600 (v!2290 (underlying!187 thiss!992))) #b00000000000000000000000000000000 Nil!1364))))

(declare-fun b!54455 () Bool)

(assert (=> b!54455 (= e!35570 e!35576)))

(declare-fun res!30812 () Bool)

(assert (=> b!54455 (=> (not res!30812) (not e!35576))))

(declare-fun lt!21624 () ListLongMap!1291)

(assert (=> b!54455 (= res!30812 (and (= lt!21624 lt!21622) (not (= (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1688 (_keys!3600 (v!2290 (underlying!187 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1056 (LongMapFixedSize!532) ListLongMap!1291)

(assert (=> b!54455 (= lt!21622 (map!1056 newMap!16))))

(declare-fun getCurrentListMap!364 (array!3531 array!3533 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 32) Int) ListLongMap!1291)

(assert (=> b!54455 (= lt!21624 (getCurrentListMap!364 (_keys!3600 (v!2290 (underlying!187 thiss!992))) (_values!1963 (v!2290 (underlying!187 thiss!992))) (mask!5827 (v!2290 (underlying!187 thiss!992))) (extraKeys!1871 (v!2290 (underlying!187 thiss!992))) (zeroValue!1898 (v!2290 (underlying!187 thiss!992))) (minValue!1898 (v!2290 (underlying!187 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2290 (underlying!187 thiss!992)))))))

(declare-fun res!30810 () Bool)

(assert (=> start!8316 (=> (not res!30810) (not e!35570))))

(declare-fun valid!217 (LongMap!352) Bool)

(assert (=> start!8316 (= res!30810 (valid!217 thiss!992))))

(assert (=> start!8316 e!35570))

(assert (=> start!8316 e!35571))

(assert (=> start!8316 true))

(declare-fun e!35567 () Bool)

(assert (=> start!8316 e!35567))

(declare-fun b!54447 () Bool)

(declare-fun e!35577 () Bool)

(assert (=> b!54447 (= e!35577 tp_is_empty!2311)))

(declare-fun mapNonEmpty!2603 () Bool)

(declare-fun tp!7467 () Bool)

(declare-fun e!35569 () Bool)

(assert (=> mapNonEmpty!2603 (= mapRes!2603 (and tp!7467 e!35569))))

(declare-fun mapKey!2603 () (_ BitVec 32))

(declare-fun mapRest!2603 () (Array (_ BitVec 32) ValueCell!812))

(declare-fun mapValue!2603 () ValueCell!812)

(assert (=> mapNonEmpty!2603 (= (arr!1689 (_values!1963 (v!2290 (underlying!187 thiss!992)))) (store mapRest!2603 mapKey!2603 mapValue!2603))))

(declare-fun b!54456 () Bool)

(assert (=> b!54456 (= e!35569 tp_is_empty!2311)))

(declare-fun b!54457 () Bool)

(declare-fun e!35575 () Bool)

(assert (=> b!54457 (= e!35575 (and e!35574 mapRes!2604))))

(declare-fun condMapEmpty!2604 () Bool)

(declare-fun mapDefault!2603 () ValueCell!812)

(assert (=> b!54457 (= condMapEmpty!2604 (= (arr!1689 (_values!1963 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!812)) mapDefault!2603)))))

(declare-fun mapNonEmpty!2604 () Bool)

(declare-fun tp!7468 () Bool)

(assert (=> mapNonEmpty!2604 (= mapRes!2604 (and tp!7468 e!35577))))

(declare-fun mapValue!2604 () ValueCell!812)

(declare-fun mapRest!2604 () (Array (_ BitVec 32) ValueCell!812))

(declare-fun mapKey!2604 () (_ BitVec 32))

(assert (=> mapNonEmpty!2604 (= (arr!1689 (_values!1963 newMap!16)) (store mapRest!2604 mapKey!2604 mapValue!2604))))

(declare-fun b!54458 () Bool)

(declare-fun res!30809 () Bool)

(assert (=> b!54458 (=> (not res!30809) (not e!35570))))

(assert (=> b!54458 (= res!30809 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1917 (_keys!3600 (v!2290 (underlying!187 thiss!992)))))))))

(assert (=> b!54459 (= e!35567 (and tp!7470 tp_is_empty!2311 (array_inv!1035 (_keys!3600 newMap!16)) (array_inv!1036 (_values!1963 newMap!16)) e!35575))))

(declare-fun b!54460 () Bool)

(assert (=> b!54460 (= e!35568 e!35563)))

(declare-fun b!54461 () Bool)

(declare-fun res!30814 () Bool)

(assert (=> b!54461 (=> (not res!30814) (not e!35570))))

(declare-fun valid!218 (LongMapFixedSize!532) Bool)

(assert (=> b!54461 (= res!30814 (valid!218 newMap!16))))

(assert (= (and start!8316 res!30810) b!54458))

(assert (= (and b!54458 res!30809) b!54461))

(assert (= (and b!54461 res!30814) b!54449))

(assert (= (and b!54449 res!30811) b!54455))

(assert (= (and b!54455 res!30812) b!54451))

(assert (= (and b!54451 res!30808) b!54452))

(assert (= (and b!54452 (not res!30813)) b!54454))

(assert (= (and b!54453 condMapEmpty!2603) mapIsEmpty!2604))

(assert (= (and b!54453 (not condMapEmpty!2603)) mapNonEmpty!2603))

(get-info :version)

(assert (= (and mapNonEmpty!2603 ((_ is ValueCellFull!812) mapValue!2603)) b!54456))

(assert (= (and b!54453 ((_ is ValueCellFull!812) mapDefault!2604)) b!54448))

(assert (= b!54450 b!54453))

(assert (= b!54460 b!54450))

(assert (= b!54446 b!54460))

(assert (= start!8316 b!54446))

(assert (= (and b!54457 condMapEmpty!2604) mapIsEmpty!2603))

(assert (= (and b!54457 (not condMapEmpty!2604)) mapNonEmpty!2604))

(assert (= (and mapNonEmpty!2604 ((_ is ValueCellFull!812) mapValue!2604)) b!54447))

(assert (= (and b!54457 ((_ is ValueCellFull!812) mapDefault!2603)) b!54445))

(assert (= b!54459 b!54457))

(assert (= start!8316 b!54459))

(declare-fun b_lambda!2405 () Bool)

(assert (=> (not b_lambda!2405) (not b!54451)))

(declare-fun t!4521 () Bool)

(declare-fun tb!1133 () Bool)

(assert (=> (and b!54450 (= (defaultEntry!1980 (v!2290 (underlying!187 thiss!992))) (defaultEntry!1980 (v!2290 (underlying!187 thiss!992)))) t!4521) tb!1133))

(declare-fun result!2097 () Bool)

(assert (=> tb!1133 (= result!2097 tp_is_empty!2311)))

(assert (=> b!54451 t!4521))

(declare-fun b_and!3121 () Bool)

(assert (= b_and!3117 (and (=> t!4521 result!2097) b_and!3121)))

(declare-fun t!4523 () Bool)

(declare-fun tb!1135 () Bool)

(assert (=> (and b!54459 (= (defaultEntry!1980 newMap!16) (defaultEntry!1980 (v!2290 (underlying!187 thiss!992)))) t!4523) tb!1135))

(declare-fun result!2101 () Bool)

(assert (= result!2101 result!2097))

(assert (=> b!54451 t!4523))

(declare-fun b_and!3123 () Bool)

(assert (= b_and!3119 (and (=> t!4523 result!2101) b_and!3123)))

(declare-fun m!45961 () Bool)

(assert (=> b!54450 m!45961))

(declare-fun m!45963 () Bool)

(assert (=> b!54450 m!45963))

(declare-fun m!45965 () Bool)

(assert (=> mapNonEmpty!2603 m!45965))

(declare-fun m!45967 () Bool)

(assert (=> b!54451 m!45967))

(declare-fun m!45969 () Bool)

(assert (=> b!54451 m!45969))

(declare-fun m!45971 () Bool)

(assert (=> b!54451 m!45971))

(declare-fun m!45973 () Bool)

(assert (=> b!54451 m!45973))

(declare-fun m!45975 () Bool)

(assert (=> b!54451 m!45975))

(assert (=> b!54451 m!45967))

(assert (=> b!54451 m!45973))

(assert (=> b!54451 m!45967))

(assert (=> b!54451 m!45975))

(declare-fun m!45977 () Bool)

(assert (=> b!54451 m!45977))

(assert (=> b!54451 m!45971))

(declare-fun m!45979 () Bool)

(assert (=> b!54461 m!45979))

(assert (=> b!54455 m!45967))

(declare-fun m!45981 () Bool)

(assert (=> b!54455 m!45981))

(declare-fun m!45983 () Bool)

(assert (=> b!54455 m!45983))

(declare-fun m!45985 () Bool)

(assert (=> mapNonEmpty!2604 m!45985))

(declare-fun m!45987 () Bool)

(assert (=> start!8316 m!45987))

(declare-fun m!45989 () Bool)

(assert (=> b!54459 m!45989))

(declare-fun m!45991 () Bool)

(assert (=> b!54459 m!45991))

(declare-fun m!45993 () Bool)

(assert (=> b!54454 m!45993))

(assert (=> b!54452 m!45967))

(assert (=> b!54452 m!45967))

(declare-fun m!45995 () Bool)

(assert (=> b!54452 m!45995))

(assert (=> b!54452 m!45967))

(declare-fun m!45997 () Bool)

(assert (=> b!54452 m!45997))

(check-sat (not b_lambda!2405) (not mapNonEmpty!2604) (not b!54451) (not b!54452) (not mapNonEmpty!2603) (not b!54461) (not b!54450) tp_is_empty!2311 (not b!54455) (not b_next!1791) b_and!3123 (not b!54454) (not b_next!1789) (not start!8316) b_and!3121 (not b!54459))
(check-sat b_and!3121 b_and!3123 (not b_next!1789) (not b_next!1791))
