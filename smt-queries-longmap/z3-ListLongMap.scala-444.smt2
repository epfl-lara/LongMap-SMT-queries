; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8278 () Bool)

(assert start!8278)

(declare-fun b!53418 () Bool)

(declare-fun b_free!1721 () Bool)

(declare-fun b_next!1721 () Bool)

(assert (=> b!53418 (= b_free!1721 (not b_next!1721))))

(declare-fun tp!7265 () Bool)

(declare-fun b_and!2983 () Bool)

(assert (=> b!53418 (= tp!7265 b_and!2983)))

(declare-fun b!53414 () Bool)

(declare-fun b_free!1723 () Bool)

(declare-fun b_next!1723 () Bool)

(assert (=> b!53414 (= b_free!1723 (not b_next!1723))))

(declare-fun tp!7264 () Bool)

(declare-fun b_and!2985 () Bool)

(assert (=> b!53414 (= tp!7264 b_and!2985)))

(declare-fun b!53405 () Bool)

(declare-fun res!30290 () Bool)

(declare-fun e!34841 () Bool)

(assert (=> b!53405 (=> (not res!30290) (not e!34841))))

(declare-datatypes ((V!2683 0))(
  ( (V!2684 (val!1183 Int)) )
))
(declare-datatypes ((array!3477 0))(
  ( (array!3478 (arr!1661 (Array (_ BitVec 32) (_ BitVec 64))) (size!1890 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!795 0))(
  ( (ValueCellFull!795 (v!2254 V!2683)) (EmptyCell!795) )
))
(declare-datatypes ((array!3479 0))(
  ( (array!3480 (arr!1662 (Array (_ BitVec 32) ValueCell!795)) (size!1891 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!498 0))(
  ( (LongMapFixedSize!499 (defaultEntry!1963 Int) (mask!5798 (_ BitVec 32)) (extraKeys!1854 (_ BitVec 32)) (zeroValue!1881 V!2683) (minValue!1881 V!2683) (_size!298 (_ BitVec 32)) (_keys!3583 array!3477) (_values!1946 array!3479) (_vacant!298 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!318 0))(
  ( (Cell!319 (v!2255 LongMapFixedSize!498)) )
))
(declare-datatypes ((LongMap!318 0))(
  ( (LongMap!319 (underlying!170 Cell!318)) )
))
(declare-fun thiss!992 () LongMap!318)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53405 (= res!30290 (validMask!0 (mask!5798 (v!2255 (underlying!170 thiss!992)))))))

(declare-fun b!53406 () Bool)

(declare-fun e!34838 () Bool)

(declare-fun e!34834 () Bool)

(assert (=> b!53406 (= e!34838 e!34834)))

(declare-fun b!53407 () Bool)

(declare-fun e!34842 () Bool)

(declare-fun e!34836 () Bool)

(declare-fun mapRes!2501 () Bool)

(assert (=> b!53407 (= e!34842 (and e!34836 mapRes!2501))))

(declare-fun condMapEmpty!2501 () Bool)

(declare-fun mapDefault!2501 () ValueCell!795)

(assert (=> b!53407 (= condMapEmpty!2501 (= (arr!1662 (_values!1946 (v!2255 (underlying!170 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!795)) mapDefault!2501)))))

(declare-fun b!53408 () Bool)

(declare-fun e!34833 () Bool)

(declare-fun tp_is_empty!2277 () Bool)

(assert (=> b!53408 (= e!34833 tp_is_empty!2277)))

(declare-fun b!53409 () Bool)

(declare-fun res!30281 () Bool)

(assert (=> b!53409 (=> (not res!30281) (not e!34841))))

(assert (=> b!53409 (= res!30281 (and (= (size!1891 (_values!1946 (v!2255 (underlying!170 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5798 (v!2255 (underlying!170 thiss!992))))) (= (size!1890 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) (size!1891 (_values!1946 (v!2255 (underlying!170 thiss!992))))) (bvsge (mask!5798 (v!2255 (underlying!170 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1854 (v!2255 (underlying!170 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1854 (v!2255 (underlying!170 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53410 () Bool)

(assert (=> b!53410 (= e!34841 false)))

(declare-fun lt!21462 () Bool)

(declare-datatypes ((tuple2!1884 0))(
  ( (tuple2!1885 (_1!953 (_ BitVec 64)) (_2!953 V!2683)) )
))
(declare-datatypes ((List!1357 0))(
  ( (Nil!1354) (Cons!1353 (h!1933 tuple2!1884) (t!4447 List!1357)) )
))
(declare-datatypes ((ListLongMap!1287 0))(
  ( (ListLongMap!1288 (toList!659 List!1357)) )
))
(declare-fun lt!21461 () ListLongMap!1287)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!634 (ListLongMap!1287 (_ BitVec 64)) Bool)

(assert (=> b!53410 (= lt!21462 (contains!634 lt!21461 (select (arr!1661 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) from!355)))))

(declare-fun b!53411 () Bool)

(declare-fun res!30283 () Bool)

(assert (=> b!53411 (=> (not res!30283) (not e!34841))))

(declare-datatypes ((List!1358 0))(
  ( (Nil!1355) (Cons!1354 (h!1934 (_ BitVec 64)) (t!4448 List!1358)) )
))
(declare-fun arrayNoDuplicates!0 (array!3477 (_ BitVec 32) List!1358) Bool)

(assert (=> b!53411 (= res!30283 (arrayNoDuplicates!0 (_keys!3583 (v!2255 (underlying!170 thiss!992))) #b00000000000000000000000000000000 Nil!1355))))

(declare-fun mapNonEmpty!2501 () Bool)

(declare-fun tp!7266 () Bool)

(declare-fun e!34840 () Bool)

(assert (=> mapNonEmpty!2501 (= mapRes!2501 (and tp!7266 e!34840))))

(declare-fun mapRest!2501 () (Array (_ BitVec 32) ValueCell!795))

(declare-fun mapKey!2501 () (_ BitVec 32))

(declare-fun mapValue!2502 () ValueCell!795)

(assert (=> mapNonEmpty!2501 (= (arr!1662 (_values!1946 (v!2255 (underlying!170 thiss!992)))) (store mapRest!2501 mapKey!2501 mapValue!2502))))

(declare-fun b!53412 () Bool)

(declare-fun res!30285 () Bool)

(declare-fun e!34837 () Bool)

(assert (=> b!53412 (=> (not res!30285) (not e!34837))))

(declare-fun newMap!16 () LongMapFixedSize!498)

(assert (=> b!53412 (= res!30285 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5798 newMap!16)) (_size!298 (v!2255 (underlying!170 thiss!992)))))))

(declare-fun b!53413 () Bool)

(declare-fun res!30282 () Bool)

(assert (=> b!53413 (=> (not res!30282) (not e!34841))))

(assert (=> b!53413 (= res!30282 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1890 (_keys!3583 (v!2255 (underlying!170 thiss!992)))))))))

(declare-fun res!30286 () Bool)

(assert (=> start!8278 (=> (not res!30286) (not e!34837))))

(declare-fun valid!187 (LongMap!318) Bool)

(assert (=> start!8278 (= res!30286 (valid!187 thiss!992))))

(assert (=> start!8278 e!34837))

(declare-fun e!34847 () Bool)

(assert (=> start!8278 e!34847))

(assert (=> start!8278 true))

(declare-fun e!34845 () Bool)

(assert (=> start!8278 e!34845))

(declare-fun e!34846 () Bool)

(declare-fun array_inv!1029 (array!3477) Bool)

(declare-fun array_inv!1030 (array!3479) Bool)

(assert (=> b!53414 (= e!34845 (and tp!7264 tp_is_empty!2277 (array_inv!1029 (_keys!3583 newMap!16)) (array_inv!1030 (_values!1946 newMap!16)) e!34846))))

(declare-fun b!53415 () Bool)

(declare-fun res!30287 () Bool)

(assert (=> b!53415 (=> (not res!30287) (not e!34837))))

(declare-fun valid!188 (LongMapFixedSize!498) Bool)

(assert (=> b!53415 (= res!30287 (valid!188 newMap!16))))

(declare-fun mapIsEmpty!2501 () Bool)

(assert (=> mapIsEmpty!2501 mapRes!2501))

(declare-fun b!53416 () Bool)

(declare-fun e!34835 () Bool)

(assert (=> b!53416 (= e!34835 tp_is_empty!2277)))

(declare-fun b!53417 () Bool)

(assert (=> b!53417 (= e!34847 e!34838)))

(assert (=> b!53418 (= e!34834 (and tp!7265 tp_is_empty!2277 (array_inv!1029 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) (array_inv!1030 (_values!1946 (v!2255 (underlying!170 thiss!992)))) e!34842))))

(declare-fun b!53419 () Bool)

(assert (=> b!53419 (= e!34840 tp_is_empty!2277)))

(declare-fun b!53420 () Bool)

(declare-fun res!30289 () Bool)

(assert (=> b!53420 (=> (not res!30289) (not e!34837))))

(assert (=> b!53420 (= res!30289 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1890 (_keys!3583 (v!2255 (underlying!170 thiss!992)))))))))

(declare-fun mapNonEmpty!2502 () Bool)

(declare-fun mapRes!2502 () Bool)

(declare-fun tp!7263 () Bool)

(assert (=> mapNonEmpty!2502 (= mapRes!2502 (and tp!7263 e!34835))))

(declare-fun mapRest!2502 () (Array (_ BitVec 32) ValueCell!795))

(declare-fun mapValue!2501 () ValueCell!795)

(declare-fun mapKey!2502 () (_ BitVec 32))

(assert (=> mapNonEmpty!2502 (= (arr!1662 (_values!1946 newMap!16)) (store mapRest!2502 mapKey!2502 mapValue!2501))))

(declare-fun b!53421 () Bool)

(declare-fun e!34843 () Bool)

(assert (=> b!53421 (= e!34837 e!34843)))

(declare-fun res!30288 () Bool)

(assert (=> b!53421 (=> (not res!30288) (not e!34843))))

(declare-fun lt!21460 () ListLongMap!1287)

(assert (=> b!53421 (= res!30288 (and (= lt!21461 lt!21460) (not (= (select (arr!1661 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1661 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1033 (LongMapFixedSize!498) ListLongMap!1287)

(assert (=> b!53421 (= lt!21460 (map!1033 newMap!16))))

(declare-fun getCurrentListMap!370 (array!3477 array!3479 (_ BitVec 32) (_ BitVec 32) V!2683 V!2683 (_ BitVec 32) Int) ListLongMap!1287)

(assert (=> b!53421 (= lt!21461 (getCurrentListMap!370 (_keys!3583 (v!2255 (underlying!170 thiss!992))) (_values!1946 (v!2255 (underlying!170 thiss!992))) (mask!5798 (v!2255 (underlying!170 thiss!992))) (extraKeys!1854 (v!2255 (underlying!170 thiss!992))) (zeroValue!1881 (v!2255 (underlying!170 thiss!992))) (minValue!1881 (v!2255 (underlying!170 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1963 (v!2255 (underlying!170 thiss!992)))))))

(declare-fun b!53422 () Bool)

(declare-fun res!30280 () Bool)

(assert (=> b!53422 (=> (not res!30280) (not e!34841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3477 (_ BitVec 32)) Bool)

(assert (=> b!53422 (= res!30280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3583 (v!2255 (underlying!170 thiss!992))) (mask!5798 (v!2255 (underlying!170 thiss!992)))))))

(declare-fun mapIsEmpty!2502 () Bool)

(assert (=> mapIsEmpty!2502 mapRes!2502))

(declare-fun b!53423 () Bool)

(assert (=> b!53423 (= e!34843 e!34841)))

(declare-fun res!30284 () Bool)

(assert (=> b!53423 (=> (not res!30284) (not e!34841))))

(assert (=> b!53423 (= res!30284 (contains!634 lt!21460 (select (arr!1661 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1886 0))(
  ( (tuple2!1887 (_1!954 Bool) (_2!954 LongMapFixedSize!498)) )
))
(declare-fun lt!21459 () tuple2!1886)

(declare-fun update!43 (LongMapFixedSize!498 (_ BitVec 64) V!2683) tuple2!1886)

(declare-fun get!991 (ValueCell!795 V!2683) V!2683)

(declare-fun dynLambda!274 (Int (_ BitVec 64)) V!2683)

(assert (=> b!53423 (= lt!21459 (update!43 newMap!16 (select (arr!1661 (_keys!3583 (v!2255 (underlying!170 thiss!992)))) from!355) (get!991 (select (arr!1662 (_values!1946 (v!2255 (underlying!170 thiss!992)))) from!355) (dynLambda!274 (defaultEntry!1963 (v!2255 (underlying!170 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53424 () Bool)

(assert (=> b!53424 (= e!34846 (and e!34833 mapRes!2502))))

(declare-fun condMapEmpty!2502 () Bool)

(declare-fun mapDefault!2502 () ValueCell!795)

(assert (=> b!53424 (= condMapEmpty!2502 (= (arr!1662 (_values!1946 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!795)) mapDefault!2502)))))

(declare-fun b!53425 () Bool)

(assert (=> b!53425 (= e!34836 tp_is_empty!2277)))

(assert (= (and start!8278 res!30286) b!53420))

(assert (= (and b!53420 res!30289) b!53415))

(assert (= (and b!53415 res!30287) b!53412))

(assert (= (and b!53412 res!30285) b!53421))

(assert (= (and b!53421 res!30288) b!53423))

(assert (= (and b!53423 res!30284) b!53405))

(assert (= (and b!53405 res!30290) b!53409))

(assert (= (and b!53409 res!30281) b!53422))

(assert (= (and b!53422 res!30280) b!53411))

(assert (= (and b!53411 res!30283) b!53413))

(assert (= (and b!53413 res!30282) b!53410))

(assert (= (and b!53407 condMapEmpty!2501) mapIsEmpty!2501))

(assert (= (and b!53407 (not condMapEmpty!2501)) mapNonEmpty!2501))

(get-info :version)

(assert (= (and mapNonEmpty!2501 ((_ is ValueCellFull!795) mapValue!2502)) b!53419))

(assert (= (and b!53407 ((_ is ValueCellFull!795) mapDefault!2501)) b!53425))

(assert (= b!53418 b!53407))

(assert (= b!53406 b!53418))

(assert (= b!53417 b!53406))

(assert (= start!8278 b!53417))

(assert (= (and b!53424 condMapEmpty!2502) mapIsEmpty!2502))

(assert (= (and b!53424 (not condMapEmpty!2502)) mapNonEmpty!2502))

(assert (= (and mapNonEmpty!2502 ((_ is ValueCellFull!795) mapValue!2501)) b!53416))

(assert (= (and b!53424 ((_ is ValueCellFull!795) mapDefault!2502)) b!53408))

(assert (= b!53414 b!53424))

(assert (= start!8278 b!53414))

(declare-fun b_lambda!2371 () Bool)

(assert (=> (not b_lambda!2371) (not b!53423)))

(declare-fun t!4444 () Bool)

(declare-fun tb!1065 () Bool)

(assert (=> (and b!53418 (= (defaultEntry!1963 (v!2255 (underlying!170 thiss!992))) (defaultEntry!1963 (v!2255 (underlying!170 thiss!992)))) t!4444) tb!1065))

(declare-fun result!1995 () Bool)

(assert (=> tb!1065 (= result!1995 tp_is_empty!2277)))

(assert (=> b!53423 t!4444))

(declare-fun b_and!2987 () Bool)

(assert (= b_and!2983 (and (=> t!4444 result!1995) b_and!2987)))

(declare-fun tb!1067 () Bool)

(declare-fun t!4446 () Bool)

(assert (=> (and b!53414 (= (defaultEntry!1963 newMap!16) (defaultEntry!1963 (v!2255 (underlying!170 thiss!992)))) t!4446) tb!1067))

(declare-fun result!1999 () Bool)

(assert (= result!1999 result!1995))

(assert (=> b!53423 t!4446))

(declare-fun b_and!2989 () Bool)

(assert (= b_and!2985 (and (=> t!4446 result!1999) b_and!2989)))

(declare-fun m!45405 () Bool)

(assert (=> b!53421 m!45405))

(declare-fun m!45407 () Bool)

(assert (=> b!53421 m!45407))

(declare-fun m!45409 () Bool)

(assert (=> b!53421 m!45409))

(declare-fun m!45411 () Bool)

(assert (=> b!53418 m!45411))

(declare-fun m!45413 () Bool)

(assert (=> b!53418 m!45413))

(declare-fun m!45415 () Bool)

(assert (=> b!53411 m!45415))

(assert (=> b!53410 m!45405))

(assert (=> b!53410 m!45405))

(declare-fun m!45417 () Bool)

(assert (=> b!53410 m!45417))

(declare-fun m!45419 () Bool)

(assert (=> b!53405 m!45419))

(declare-fun m!45421 () Bool)

(assert (=> mapNonEmpty!2502 m!45421))

(declare-fun m!45423 () Bool)

(assert (=> b!53422 m!45423))

(declare-fun m!45425 () Bool)

(assert (=> mapNonEmpty!2501 m!45425))

(declare-fun m!45427 () Bool)

(assert (=> b!53414 m!45427))

(declare-fun m!45429 () Bool)

(assert (=> b!53414 m!45429))

(declare-fun m!45431 () Bool)

(assert (=> start!8278 m!45431))

(declare-fun m!45433 () Bool)

(assert (=> b!53415 m!45433))

(declare-fun m!45435 () Bool)

(assert (=> b!53423 m!45435))

(declare-fun m!45437 () Bool)

(assert (=> b!53423 m!45437))

(declare-fun m!45439 () Bool)

(assert (=> b!53423 m!45439))

(assert (=> b!53423 m!45405))

(assert (=> b!53423 m!45437))

(assert (=> b!53423 m!45405))

(declare-fun m!45441 () Bool)

(assert (=> b!53423 m!45441))

(assert (=> b!53423 m!45405))

(assert (=> b!53423 m!45439))

(declare-fun m!45443 () Bool)

(assert (=> b!53423 m!45443))

(assert (=> b!53423 m!45435))

(check-sat (not b_next!1721) (not b!53421) (not b!53415) (not b!53422) (not b_lambda!2371) b_and!2989 (not b!53423) b_and!2987 (not b!53411) (not b!53414) (not b!53405) (not b_next!1723) (not mapNonEmpty!2501) (not mapNonEmpty!2502) (not b!53418) tp_is_empty!2277 (not b!53410) (not start!8278))
(check-sat b_and!2987 b_and!2989 (not b_next!1721) (not b_next!1723))
