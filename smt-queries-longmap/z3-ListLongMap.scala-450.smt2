; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8316 () Bool)

(assert start!8316)

(declare-fun b!54450 () Bool)

(declare-fun b_free!1789 () Bool)

(declare-fun b_next!1789 () Bool)

(assert (=> b!54450 (= b_free!1789 (not b_next!1789))))

(declare-fun tp!7468 () Bool)

(declare-fun b_and!3121 () Bool)

(assert (=> b!54450 (= tp!7468 b_and!3121)))

(declare-fun b!54447 () Bool)

(declare-fun b_free!1791 () Bool)

(declare-fun b_next!1791 () Bool)

(assert (=> b!54447 (= b_free!1791 (not b_next!1791))))

(declare-fun tp!7469 () Bool)

(declare-fun b_and!3123 () Bool)

(assert (=> b!54447 (= tp!7469 b_and!3123)))

(declare-fun b!54436 () Bool)

(declare-fun e!35570 () Bool)

(assert (=> b!54436 (= e!35570 true)))

(declare-fun lt!21649 () Bool)

(declare-datatypes ((V!2729 0))(
  ( (V!2730 (val!1200 Int)) )
))
(declare-datatypes ((array!3525 0))(
  ( (array!3526 (arr!1684 (Array (_ BitVec 32) (_ BitVec 64))) (size!1914 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!812 0))(
  ( (ValueCellFull!812 (v!2283 V!2729)) (EmptyCell!812) )
))
(declare-datatypes ((array!3527 0))(
  ( (array!3528 (arr!1685 (Array (_ BitVec 32) ValueCell!812)) (size!1915 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!532 0))(
  ( (LongMapFixedSize!533 (defaultEntry!1980 Int) (mask!5826 (_ BitVec 32)) (extraKeys!1871 (_ BitVec 32)) (zeroValue!1898 V!2729) (minValue!1898 V!2729) (_size!315 (_ BitVec 32)) (_keys!3599 array!3525) (_values!1963 array!3527) (_vacant!315 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!346 0))(
  ( (Cell!347 (v!2284 LongMapFixedSize!532)) )
))
(declare-datatypes ((LongMap!346 0))(
  ( (LongMap!347 (underlying!184 Cell!346)) )
))
(declare-fun thiss!992 () LongMap!346)

(declare-datatypes ((List!1381 0))(
  ( (Nil!1378) (Cons!1377 (h!1957 (_ BitVec 64)) (t!4538 List!1381)) )
))
(declare-fun arrayNoDuplicates!0 (array!3525 (_ BitVec 32) List!1381) Bool)

(assert (=> b!54436 (= lt!21649 (arrayNoDuplicates!0 (_keys!3599 (v!2284 (underlying!184 thiss!992))) #b00000000000000000000000000000000 Nil!1378))))

(declare-fun b!54437 () Bool)

(declare-fun e!35562 () Bool)

(declare-fun e!35563 () Bool)

(declare-fun mapRes!2604 () Bool)

(assert (=> b!54437 (= e!35562 (and e!35563 mapRes!2604))))

(declare-fun condMapEmpty!2603 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!532)

(declare-fun mapDefault!2603 () ValueCell!812)

(assert (=> b!54437 (= condMapEmpty!2603 (= (arr!1685 (_values!1963 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!812)) mapDefault!2603)))))

(declare-fun mapIsEmpty!2603 () Bool)

(assert (=> mapIsEmpty!2603 mapRes!2604))

(declare-fun mapNonEmpty!2603 () Bool)

(declare-fun mapRes!2603 () Bool)

(declare-fun tp!7470 () Bool)

(declare-fun e!35567 () Bool)

(assert (=> mapNonEmpty!2603 (= mapRes!2603 (and tp!7470 e!35567))))

(declare-fun mapRest!2604 () (Array (_ BitVec 32) ValueCell!812))

(declare-fun mapValue!2603 () ValueCell!812)

(declare-fun mapKey!2603 () (_ BitVec 32))

(assert (=> mapNonEmpty!2603 (= (arr!1685 (_values!1963 (v!2284 (underlying!184 thiss!992)))) (store mapRest!2604 mapKey!2603 mapValue!2603))))

(declare-fun b!54438 () Bool)

(declare-fun e!35558 () Bool)

(declare-fun e!35569 () Bool)

(assert (=> b!54438 (= e!35558 e!35569)))

(declare-fun mapNonEmpty!2604 () Bool)

(declare-fun tp!7467 () Bool)

(declare-fun e!35560 () Bool)

(assert (=> mapNonEmpty!2604 (= mapRes!2604 (and tp!7467 e!35560))))

(declare-fun mapKey!2604 () (_ BitVec 32))

(declare-fun mapValue!2604 () ValueCell!812)

(declare-fun mapRest!2603 () (Array (_ BitVec 32) ValueCell!812))

(assert (=> mapNonEmpty!2604 (= (arr!1685 (_values!1963 newMap!16)) (store mapRest!2603 mapKey!2604 mapValue!2604))))

(declare-fun b!54439 () Bool)

(declare-fun res!30814 () Bool)

(declare-fun e!35566 () Bool)

(assert (=> b!54439 (=> (not res!30814) (not e!35566))))

(declare-fun valid!208 (LongMapFixedSize!532) Bool)

(assert (=> b!54439 (= res!30814 (valid!208 newMap!16))))

(declare-fun b!54440 () Bool)

(declare-fun e!35571 () Bool)

(assert (=> b!54440 (= e!35569 e!35571)))

(declare-fun b!54441 () Bool)

(declare-fun tp_is_empty!2311 () Bool)

(assert (=> b!54441 (= e!35560 tp_is_empty!2311)))

(declare-fun b!54442 () Bool)

(declare-fun e!35561 () Bool)

(assert (=> b!54442 (= e!35566 e!35561)))

(declare-fun res!30817 () Bool)

(assert (=> b!54442 (=> (not res!30817) (not e!35561))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1938 0))(
  ( (tuple2!1939 (_1!980 (_ BitVec 64)) (_2!980 V!2729)) )
))
(declare-datatypes ((List!1382 0))(
  ( (Nil!1379) (Cons!1378 (h!1958 tuple2!1938) (t!4539 List!1382)) )
))
(declare-datatypes ((ListLongMap!1305 0))(
  ( (ListLongMap!1306 (toList!668 List!1382)) )
))
(declare-fun lt!21652 () ListLongMap!1305)

(declare-fun lt!21651 () ListLongMap!1305)

(assert (=> b!54442 (= res!30817 (and (= lt!21652 lt!21651) (not (= (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1056 (LongMapFixedSize!532) ListLongMap!1305)

(assert (=> b!54442 (= lt!21651 (map!1056 newMap!16))))

(declare-fun getCurrentListMap!370 (array!3525 array!3527 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 32) Int) ListLongMap!1305)

(assert (=> b!54442 (= lt!21652 (getCurrentListMap!370 (_keys!3599 (v!2284 (underlying!184 thiss!992))) (_values!1963 (v!2284 (underlying!184 thiss!992))) (mask!5826 (v!2284 (underlying!184 thiss!992))) (extraKeys!1871 (v!2284 (underlying!184 thiss!992))) (zeroValue!1898 (v!2284 (underlying!184 thiss!992))) (minValue!1898 (v!2284 (underlying!184 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun b!54443 () Bool)

(declare-fun e!35565 () Bool)

(assert (=> b!54443 (= e!35565 tp_is_empty!2311)))

(declare-fun b!54444 () Bool)

(declare-fun e!35568 () Bool)

(assert (=> b!54444 (= e!35568 (not e!35570))))

(declare-fun res!30815 () Bool)

(assert (=> b!54444 (=> res!30815 e!35570)))

(assert (=> b!54444 (= res!30815 (or (bvsge (size!1914 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1914 (_keys!3599 (v!2284 (underlying!184 thiss!992))))) (bvsgt from!355 (size!1914 (_keys!3599 (v!2284 (underlying!184 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54444 (arrayContainsKey!0 (_keys!3599 (v!2284 (underlying!184 thiss!992))) (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1436 0))(
  ( (Unit!1437) )
))
(declare-fun lt!21653 () Unit!1436)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!5 (array!3525 array!3527 (_ BitVec 32) (_ BitVec 32) V!2729 V!2729 (_ BitVec 64) (_ BitVec 32) Int) Unit!1436)

(assert (=> b!54444 (= lt!21653 (lemmaListMapContainsThenArrayContainsFrom!5 (_keys!3599 (v!2284 (underlying!184 thiss!992))) (_values!1963 (v!2284 (underlying!184 thiss!992))) (mask!5826 (v!2284 (underlying!184 thiss!992))) (extraKeys!1871 (v!2284 (underlying!184 thiss!992))) (zeroValue!1898 (v!2284 (underlying!184 thiss!992))) (minValue!1898 (v!2284 (underlying!184 thiss!992))) (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1980 (v!2284 (underlying!184 thiss!992)))))))

(declare-fun b!54445 () Bool)

(assert (=> b!54445 (= e!35563 tp_is_empty!2311)))

(declare-fun b!54446 () Bool)

(assert (=> b!54446 (= e!35561 e!35568)))

(declare-fun res!30813 () Bool)

(assert (=> b!54446 (=> (not res!30813) (not e!35568))))

(declare-fun contains!642 (ListLongMap!1305 (_ BitVec 64)) Bool)

(assert (=> b!54446 (= res!30813 (contains!642 lt!21651 (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1940 0))(
  ( (tuple2!1941 (_1!981 Bool) (_2!981 LongMapFixedSize!532)) )
))
(declare-fun lt!21650 () tuple2!1940)

(declare-fun update!61 (LongMapFixedSize!532 (_ BitVec 64) V!2729) tuple2!1940)

(declare-fun get!1017 (ValueCell!812 V!2729) V!2729)

(declare-fun dynLambda!285 (Int (_ BitVec 64)) V!2729)

(assert (=> b!54446 (= lt!21650 (update!61 newMap!16 (select (arr!1684 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) from!355) (get!1017 (select (arr!1685 (_values!1963 (v!2284 (underlying!184 thiss!992)))) from!355) (dynLambda!285 (defaultEntry!1980 (v!2284 (underlying!184 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!35559 () Bool)

(declare-fun array_inv!1037 (array!3525) Bool)

(declare-fun array_inv!1038 (array!3527) Bool)

(assert (=> b!54447 (= e!35559 (and tp!7469 tp_is_empty!2311 (array_inv!1037 (_keys!3599 newMap!16)) (array_inv!1038 (_values!1963 newMap!16)) e!35562))))

(declare-fun b!54448 () Bool)

(declare-fun res!30816 () Bool)

(assert (=> b!54448 (=> (not res!30816) (not e!35566))))

(assert (=> b!54448 (= res!30816 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1914 (_keys!3599 (v!2284 (underlying!184 thiss!992)))))))))

(declare-fun b!54449 () Bool)

(declare-fun e!35572 () Bool)

(assert (=> b!54449 (= e!35572 (and e!35565 mapRes!2603))))

(declare-fun condMapEmpty!2604 () Bool)

(declare-fun mapDefault!2604 () ValueCell!812)

(assert (=> b!54449 (= condMapEmpty!2604 (= (arr!1685 (_values!1963 (v!2284 (underlying!184 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!812)) mapDefault!2604)))))

(assert (=> b!54450 (= e!35571 (and tp!7468 tp_is_empty!2311 (array_inv!1037 (_keys!3599 (v!2284 (underlying!184 thiss!992)))) (array_inv!1038 (_values!1963 (v!2284 (underlying!184 thiss!992)))) e!35572))))

(declare-fun mapIsEmpty!2604 () Bool)

(assert (=> mapIsEmpty!2604 mapRes!2603))

(declare-fun res!30819 () Bool)

(assert (=> start!8316 (=> (not res!30819) (not e!35566))))

(declare-fun valid!209 (LongMap!346) Bool)

(assert (=> start!8316 (= res!30819 (valid!209 thiss!992))))

(assert (=> start!8316 e!35566))

(assert (=> start!8316 e!35558))

(assert (=> start!8316 true))

(assert (=> start!8316 e!35559))

(declare-fun b!54451 () Bool)

(assert (=> b!54451 (= e!35567 tp_is_empty!2311)))

(declare-fun b!54452 () Bool)

(declare-fun res!30818 () Bool)

(assert (=> b!54452 (=> (not res!30818) (not e!35566))))

(assert (=> b!54452 (= res!30818 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5826 newMap!16)) (_size!315 (v!2284 (underlying!184 thiss!992)))))))

(assert (= (and start!8316 res!30819) b!54448))

(assert (= (and b!54448 res!30816) b!54439))

(assert (= (and b!54439 res!30814) b!54452))

(assert (= (and b!54452 res!30818) b!54442))

(assert (= (and b!54442 res!30817) b!54446))

(assert (= (and b!54446 res!30813) b!54444))

(assert (= (and b!54444 (not res!30815)) b!54436))

(assert (= (and b!54449 condMapEmpty!2604) mapIsEmpty!2604))

(assert (= (and b!54449 (not condMapEmpty!2604)) mapNonEmpty!2603))

(get-info :version)

(assert (= (and mapNonEmpty!2603 ((_ is ValueCellFull!812) mapValue!2603)) b!54451))

(assert (= (and b!54449 ((_ is ValueCellFull!812) mapDefault!2604)) b!54443))

(assert (= b!54450 b!54449))

(assert (= b!54440 b!54450))

(assert (= b!54438 b!54440))

(assert (= start!8316 b!54438))

(assert (= (and b!54437 condMapEmpty!2603) mapIsEmpty!2603))

(assert (= (and b!54437 (not condMapEmpty!2603)) mapNonEmpty!2604))

(assert (= (and mapNonEmpty!2604 ((_ is ValueCellFull!812) mapValue!2604)) b!54441))

(assert (= (and b!54437 ((_ is ValueCellFull!812) mapDefault!2603)) b!54445))

(assert (= b!54447 b!54437))

(assert (= start!8316 b!54447))

(declare-fun b_lambda!2409 () Bool)

(assert (=> (not b_lambda!2409) (not b!54446)))

(declare-fun t!4535 () Bool)

(declare-fun tb!1133 () Bool)

(assert (=> (and b!54450 (= (defaultEntry!1980 (v!2284 (underlying!184 thiss!992))) (defaultEntry!1980 (v!2284 (underlying!184 thiss!992)))) t!4535) tb!1133))

(declare-fun result!2097 () Bool)

(assert (=> tb!1133 (= result!2097 tp_is_empty!2311)))

(assert (=> b!54446 t!4535))

(declare-fun b_and!3125 () Bool)

(assert (= b_and!3121 (and (=> t!4535 result!2097) b_and!3125)))

(declare-fun tb!1135 () Bool)

(declare-fun t!4537 () Bool)

(assert (=> (and b!54447 (= (defaultEntry!1980 newMap!16) (defaultEntry!1980 (v!2284 (underlying!184 thiss!992)))) t!4537) tb!1135))

(declare-fun result!2101 () Bool)

(assert (= result!2101 result!2097))

(assert (=> b!54446 t!4537))

(declare-fun b_and!3127 () Bool)

(assert (= b_and!3123 (and (=> t!4537 result!2101) b_and!3127)))

(declare-fun m!46003 () Bool)

(assert (=> b!54442 m!46003))

(declare-fun m!46005 () Bool)

(assert (=> b!54442 m!46005))

(declare-fun m!46007 () Bool)

(assert (=> b!54442 m!46007))

(declare-fun m!46009 () Bool)

(assert (=> b!54436 m!46009))

(declare-fun m!46011 () Bool)

(assert (=> start!8316 m!46011))

(declare-fun m!46013 () Bool)

(assert (=> b!54446 m!46013))

(declare-fun m!46015 () Bool)

(assert (=> b!54446 m!46015))

(declare-fun m!46017 () Bool)

(assert (=> b!54446 m!46017))

(assert (=> b!54446 m!46003))

(assert (=> b!54446 m!46015))

(assert (=> b!54446 m!46003))

(declare-fun m!46019 () Bool)

(assert (=> b!54446 m!46019))

(assert (=> b!54446 m!46003))

(assert (=> b!54446 m!46017))

(declare-fun m!46021 () Bool)

(assert (=> b!54446 m!46021))

(assert (=> b!54446 m!46013))

(declare-fun m!46023 () Bool)

(assert (=> b!54447 m!46023))

(declare-fun m!46025 () Bool)

(assert (=> b!54447 m!46025))

(declare-fun m!46027 () Bool)

(assert (=> b!54450 m!46027))

(declare-fun m!46029 () Bool)

(assert (=> b!54450 m!46029))

(declare-fun m!46031 () Bool)

(assert (=> mapNonEmpty!2603 m!46031))

(declare-fun m!46033 () Bool)

(assert (=> b!54439 m!46033))

(assert (=> b!54444 m!46003))

(assert (=> b!54444 m!46003))

(declare-fun m!46035 () Bool)

(assert (=> b!54444 m!46035))

(assert (=> b!54444 m!46003))

(declare-fun m!46037 () Bool)

(assert (=> b!54444 m!46037))

(declare-fun m!46039 () Bool)

(assert (=> mapNonEmpty!2604 m!46039))

(check-sat (not b!54439) (not b_next!1789) (not mapNonEmpty!2603) tp_is_empty!2311 b_and!3125 (not b!54447) (not start!8316) (not mapNonEmpty!2604) (not b!54450) (not b!54436) (not b!54442) b_and!3127 (not b!54446) (not b_lambda!2409) (not b!54444) (not b_next!1791))
(check-sat b_and!3125 b_and!3127 (not b_next!1789) (not b_next!1791))
