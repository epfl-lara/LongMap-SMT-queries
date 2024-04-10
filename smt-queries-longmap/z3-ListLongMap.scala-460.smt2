; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8374 () Bool)

(assert start!8374)

(declare-fun b!56357 () Bool)

(declare-fun b_free!1913 () Bool)

(declare-fun b_next!1913 () Bool)

(assert (=> b!56357 (= b_free!1913 (not b_next!1913))))

(declare-fun tp!7840 () Bool)

(declare-fun b_and!3367 () Bool)

(assert (=> b!56357 (= tp!7840 b_and!3367)))

(declare-fun b!56347 () Bool)

(declare-fun b_free!1915 () Bool)

(declare-fun b_next!1915 () Bool)

(assert (=> b!56347 (= b_free!1915 (not b_next!1915))))

(declare-fun tp!7842 () Bool)

(declare-fun b_and!3369 () Bool)

(assert (=> b!56347 (= tp!7842 b_and!3369)))

(declare-fun b!56345 () Bool)

(declare-fun e!37097 () Bool)

(declare-fun e!37100 () Bool)

(declare-fun mapRes!2789 () Bool)

(assert (=> b!56345 (= e!37097 (and e!37100 mapRes!2789))))

(declare-fun condMapEmpty!2789 () Bool)

(declare-datatypes ((V!2811 0))(
  ( (V!2812 (val!1231 Int)) )
))
(declare-datatypes ((array!3669 0))(
  ( (array!3670 (arr!1757 (Array (_ BitVec 32) (_ BitVec 64))) (size!1986 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!843 0))(
  ( (ValueCellFull!843 (v!2348 V!2811)) (EmptyCell!843) )
))
(declare-datatypes ((array!3671 0))(
  ( (array!3672 (arr!1758 (Array (_ BitVec 32) ValueCell!843)) (size!1987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!594 0))(
  ( (LongMapFixedSize!595 (defaultEntry!2011 Int) (mask!5878 (_ BitVec 32)) (extraKeys!1902 (_ BitVec 32)) (zeroValue!1929 V!2811) (minValue!1929 V!2811) (_size!346 (_ BitVec 32)) (_keys!3631 array!3669) (_values!1994 array!3671) (_vacant!346 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!410 0))(
  ( (Cell!411 (v!2349 LongMapFixedSize!594)) )
))
(declare-datatypes ((LongMap!410 0))(
  ( (LongMap!411 (underlying!216 Cell!410)) )
))
(declare-fun thiss!992 () LongMap!410)

(declare-fun mapDefault!2790 () ValueCell!843)

(assert (=> b!56345 (= condMapEmpty!2789 (= (arr!1758 (_values!1994 (v!2349 (underlying!216 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!843)) mapDefault!2790)))))

(declare-fun b!56346 () Bool)

(declare-fun res!31686 () Bool)

(declare-fun e!37088 () Bool)

(assert (=> b!56346 (=> res!31686 e!37088)))

(declare-datatypes ((List!1414 0))(
  ( (Nil!1411) (Cons!1410 (h!1990 (_ BitVec 64)) (t!4696 List!1414)) )
))
(declare-fun lt!22235 () List!1414)

(declare-fun contains!671 (List!1414 (_ BitVec 64)) Bool)

(assert (=> b!56346 (= res!31686 (contains!671 lt!22235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37103 () Bool)

(declare-fun e!37093 () Bool)

(declare-fun tp_is_empty!2373 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!594)

(declare-fun array_inv!1089 (array!3669) Bool)

(declare-fun array_inv!1090 (array!3671) Bool)

(assert (=> b!56347 (= e!37103 (and tp!7842 tp_is_empty!2373 (array_inv!1089 (_keys!3631 newMap!16)) (array_inv!1090 (_values!1994 newMap!16)) e!37093))))

(declare-fun mapIsEmpty!2789 () Bool)

(declare-fun mapRes!2790 () Bool)

(assert (=> mapIsEmpty!2789 mapRes!2790))

(declare-fun mapNonEmpty!2789 () Bool)

(declare-fun tp!7839 () Bool)

(declare-fun e!37095 () Bool)

(assert (=> mapNonEmpty!2789 (= mapRes!2789 (and tp!7839 e!37095))))

(declare-fun mapRest!2789 () (Array (_ BitVec 32) ValueCell!843))

(declare-fun mapValue!2790 () ValueCell!843)

(declare-fun mapKey!2789 () (_ BitVec 32))

(assert (=> mapNonEmpty!2789 (= (arr!1758 (_values!1994 (v!2349 (underlying!216 thiss!992)))) (store mapRest!2789 mapKey!2789 mapValue!2790))))

(declare-fun b!56349 () Bool)

(declare-fun e!37091 () Bool)

(assert (=> b!56349 (= e!37093 (and e!37091 mapRes!2790))))

(declare-fun condMapEmpty!2790 () Bool)

(declare-fun mapDefault!2789 () ValueCell!843)

(assert (=> b!56349 (= condMapEmpty!2790 (= (arr!1758 (_values!1994 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!843)) mapDefault!2789)))))

(declare-fun b!56350 () Bool)

(declare-fun e!37096 () Bool)

(declare-fun e!37101 () Bool)

(assert (=> b!56350 (= e!37096 e!37101)))

(declare-fun mapIsEmpty!2790 () Bool)

(assert (=> mapIsEmpty!2790 mapRes!2789))

(declare-fun mapNonEmpty!2790 () Bool)

(declare-fun tp!7841 () Bool)

(declare-fun e!37094 () Bool)

(assert (=> mapNonEmpty!2790 (= mapRes!2790 (and tp!7841 e!37094))))

(declare-fun mapRest!2790 () (Array (_ BitVec 32) ValueCell!843))

(declare-fun mapValue!2789 () ValueCell!843)

(declare-fun mapKey!2790 () (_ BitVec 32))

(assert (=> mapNonEmpty!2790 (= (arr!1758 (_values!1994 newMap!16)) (store mapRest!2790 mapKey!2790 mapValue!2789))))

(declare-fun b!56351 () Bool)

(declare-fun e!37089 () Bool)

(declare-fun e!37102 () Bool)

(assert (=> b!56351 (= e!37089 e!37102)))

(declare-fun res!31685 () Bool)

(assert (=> b!56351 (=> (not res!31685) (not e!37102))))

(declare-datatypes ((tuple2!1994 0))(
  ( (tuple2!1995 (_1!1008 (_ BitVec 64)) (_2!1008 V!2811)) )
))
(declare-datatypes ((List!1415 0))(
  ( (Nil!1412) (Cons!1411 (h!1991 tuple2!1994) (t!4697 List!1415)) )
))
(declare-datatypes ((ListLongMap!1347 0))(
  ( (ListLongMap!1348 (toList!689 List!1415)) )
))
(declare-fun lt!22233 () ListLongMap!1347)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!22232 () ListLongMap!1347)

(assert (=> b!56351 (= res!31685 (and (= lt!22232 lt!22233) (not (= (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1090 (LongMapFixedSize!594) ListLongMap!1347)

(assert (=> b!56351 (= lt!22233 (map!1090 newMap!16))))

(declare-fun getCurrentListMap!395 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2811 V!2811 (_ BitVec 32) Int) ListLongMap!1347)

(assert (=> b!56351 (= lt!22232 (getCurrentListMap!395 (_keys!3631 (v!2349 (underlying!216 thiss!992))) (_values!1994 (v!2349 (underlying!216 thiss!992))) (mask!5878 (v!2349 (underlying!216 thiss!992))) (extraKeys!1902 (v!2349 (underlying!216 thiss!992))) (zeroValue!1929 (v!2349 (underlying!216 thiss!992))) (minValue!1929 (v!2349 (underlying!216 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2011 (v!2349 (underlying!216 thiss!992)))))))

(declare-fun b!56352 () Bool)

(declare-fun res!31688 () Bool)

(assert (=> b!56352 (=> (not res!31688) (not e!37089))))

(declare-fun valid!241 (LongMapFixedSize!594) Bool)

(assert (=> b!56352 (= res!31688 (valid!241 newMap!16))))

(declare-fun b!56353 () Bool)

(declare-fun res!31694 () Bool)

(assert (=> b!56353 (=> res!31694 e!37088)))

(declare-fun arrayNoDuplicates!0 (array!3669 (_ BitVec 32) List!1414) Bool)

(assert (=> b!56353 (= res!31694 (not (arrayNoDuplicates!0 (_keys!3631 (v!2349 (underlying!216 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22235)))))

(declare-fun b!56354 () Bool)

(assert (=> b!56354 (= e!37088 true)))

(declare-fun lt!22236 () Bool)

(assert (=> b!56354 (= lt!22236 (contains!671 lt!22235 (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355)))))

(declare-fun b!56355 () Bool)

(declare-fun res!31693 () Bool)

(assert (=> b!56355 (=> res!31693 e!37088)))

(declare-fun noDuplicate!49 (List!1414) Bool)

(assert (=> b!56355 (= res!31693 (not (noDuplicate!49 lt!22235)))))

(declare-fun b!56356 () Bool)

(assert (=> b!56356 (= e!37091 tp_is_empty!2373)))

(assert (=> b!56357 (= e!37101 (and tp!7840 tp_is_empty!2373 (array_inv!1089 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) (array_inv!1090 (_values!1994 (v!2349 (underlying!216 thiss!992)))) e!37097))))

(declare-fun b!56358 () Bool)

(declare-fun res!31691 () Bool)

(assert (=> b!56358 (=> res!31691 e!37088)))

(assert (=> b!56358 (= res!31691 (contains!671 lt!22235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56359 () Bool)

(declare-fun e!37092 () Bool)

(assert (=> b!56359 (= e!37092 (not e!37088))))

(declare-fun res!31692 () Bool)

(assert (=> b!56359 (=> res!31692 e!37088)))

(assert (=> b!56359 (= res!31692 (or (bvsge (size!1986 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3631 (v!2349 (underlying!216 thiss!992)))))))))

(assert (=> b!56359 (= lt!22235 (Cons!1410 (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) Nil!1411))))

(assert (=> b!56359 (arrayNoDuplicates!0 (_keys!3631 (v!2349 (underlying!216 thiss!992))) from!355 Nil!1411)))

(declare-datatypes ((Unit!1465 0))(
  ( (Unit!1466) )
))
(declare-fun lt!22231 () Unit!1465)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3669 (_ BitVec 32) (_ BitVec 32)) Unit!1465)

(assert (=> b!56359 (= lt!22231 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3631 (v!2349 (underlying!216 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56359 (arrayContainsKey!0 (_keys!3631 (v!2349 (underlying!216 thiss!992))) (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22234 () Unit!1465)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!22 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2811 V!2811 (_ BitVec 64) (_ BitVec 32) Int) Unit!1465)

(assert (=> b!56359 (= lt!22234 (lemmaListMapContainsThenArrayContainsFrom!22 (_keys!3631 (v!2349 (underlying!216 thiss!992))) (_values!1994 (v!2349 (underlying!216 thiss!992))) (mask!5878 (v!2349 (underlying!216 thiss!992))) (extraKeys!1902 (v!2349 (underlying!216 thiss!992))) (zeroValue!1929 (v!2349 (underlying!216 thiss!992))) (minValue!1929 (v!2349 (underlying!216 thiss!992))) (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2011 (v!2349 (underlying!216 thiss!992)))))))

(declare-fun b!56360 () Bool)

(declare-fun res!31689 () Bool)

(assert (=> b!56360 (=> (not res!31689) (not e!37089))))

(assert (=> b!56360 (= res!31689 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1986 (_keys!3631 (v!2349 (underlying!216 thiss!992)))))))))

(declare-fun b!56361 () Bool)

(assert (=> b!56361 (= e!37095 tp_is_empty!2373)))

(declare-fun res!31690 () Bool)

(assert (=> start!8374 (=> (not res!31690) (not e!37089))))

(declare-fun valid!242 (LongMap!410) Bool)

(assert (=> start!8374 (= res!31690 (valid!242 thiss!992))))

(assert (=> start!8374 e!37089))

(declare-fun e!37099 () Bool)

(assert (=> start!8374 e!37099))

(assert (=> start!8374 true))

(assert (=> start!8374 e!37103))

(declare-fun b!56348 () Bool)

(assert (=> b!56348 (= e!37102 e!37092)))

(declare-fun res!31684 () Bool)

(assert (=> b!56348 (=> (not res!31684) (not e!37092))))

(declare-fun contains!672 (ListLongMap!1347 (_ BitVec 64)) Bool)

(assert (=> b!56348 (= res!31684 (contains!672 lt!22233 (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1996 0))(
  ( (tuple2!1997 (_1!1009 Bool) (_2!1009 LongMapFixedSize!594)) )
))
(declare-fun lt!22230 () tuple2!1996)

(declare-fun update!68 (LongMapFixedSize!594 (_ BitVec 64) V!2811) tuple2!1996)

(declare-fun get!1048 (ValueCell!843 V!2811) V!2811)

(declare-fun dynLambda!299 (Int (_ BitVec 64)) V!2811)

(assert (=> b!56348 (= lt!22230 (update!68 newMap!16 (select (arr!1757 (_keys!3631 (v!2349 (underlying!216 thiss!992)))) from!355) (get!1048 (select (arr!1758 (_values!1994 (v!2349 (underlying!216 thiss!992)))) from!355) (dynLambda!299 (defaultEntry!2011 (v!2349 (underlying!216 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56362 () Bool)

(declare-fun res!31687 () Bool)

(assert (=> b!56362 (=> (not res!31687) (not e!37089))))

(assert (=> b!56362 (= res!31687 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5878 newMap!16)) (_size!346 (v!2349 (underlying!216 thiss!992)))))))

(declare-fun b!56363 () Bool)

(assert (=> b!56363 (= e!37099 e!37096)))

(declare-fun b!56364 () Bool)

(assert (=> b!56364 (= e!37100 tp_is_empty!2373)))

(declare-fun b!56365 () Bool)

(assert (=> b!56365 (= e!37094 tp_is_empty!2373)))

(assert (= (and start!8374 res!31690) b!56360))

(assert (= (and b!56360 res!31689) b!56352))

(assert (= (and b!56352 res!31688) b!56362))

(assert (= (and b!56362 res!31687) b!56351))

(assert (= (and b!56351 res!31685) b!56348))

(assert (= (and b!56348 res!31684) b!56359))

(assert (= (and b!56359 (not res!31692)) b!56355))

(assert (= (and b!56355 (not res!31693)) b!56358))

(assert (= (and b!56358 (not res!31691)) b!56346))

(assert (= (and b!56346 (not res!31686)) b!56353))

(assert (= (and b!56353 (not res!31694)) b!56354))

(assert (= (and b!56345 condMapEmpty!2789) mapIsEmpty!2790))

(assert (= (and b!56345 (not condMapEmpty!2789)) mapNonEmpty!2789))

(get-info :version)

(assert (= (and mapNonEmpty!2789 ((_ is ValueCellFull!843) mapValue!2790)) b!56361))

(assert (= (and b!56345 ((_ is ValueCellFull!843) mapDefault!2790)) b!56364))

(assert (= b!56357 b!56345))

(assert (= b!56350 b!56357))

(assert (= b!56363 b!56350))

(assert (= start!8374 b!56363))

(assert (= (and b!56349 condMapEmpty!2790) mapIsEmpty!2789))

(assert (= (and b!56349 (not condMapEmpty!2790)) mapNonEmpty!2790))

(assert (= (and mapNonEmpty!2790 ((_ is ValueCellFull!843) mapValue!2789)) b!56365))

(assert (= (and b!56349 ((_ is ValueCellFull!843) mapDefault!2789)) b!56356))

(assert (= b!56347 b!56349))

(assert (= start!8374 b!56347))

(declare-fun b_lambda!2467 () Bool)

(assert (=> (not b_lambda!2467) (not b!56348)))

(declare-fun t!4693 () Bool)

(declare-fun tb!1257 () Bool)

(assert (=> (and b!56357 (= (defaultEntry!2011 (v!2349 (underlying!216 thiss!992))) (defaultEntry!2011 (v!2349 (underlying!216 thiss!992)))) t!4693) tb!1257))

(declare-fun result!2283 () Bool)

(assert (=> tb!1257 (= result!2283 tp_is_empty!2373)))

(assert (=> b!56348 t!4693))

(declare-fun b_and!3371 () Bool)

(assert (= b_and!3367 (and (=> t!4693 result!2283) b_and!3371)))

(declare-fun t!4695 () Bool)

(declare-fun tb!1259 () Bool)

(assert (=> (and b!56347 (= (defaultEntry!2011 newMap!16) (defaultEntry!2011 (v!2349 (underlying!216 thiss!992)))) t!4695) tb!1259))

(declare-fun result!2287 () Bool)

(assert (= result!2287 result!2283))

(assert (=> b!56348 t!4695))

(declare-fun b_and!3373 () Bool)

(assert (= b_and!3369 (and (=> t!4695 result!2287) b_and!3373)))

(declare-fun m!47455 () Bool)

(assert (=> b!56353 m!47455))

(declare-fun m!47457 () Bool)

(assert (=> mapNonEmpty!2790 m!47457))

(declare-fun m!47459 () Bool)

(assert (=> b!56355 m!47459))

(declare-fun m!47461 () Bool)

(assert (=> b!56359 m!47461))

(declare-fun m!47463 () Bool)

(assert (=> b!56359 m!47463))

(declare-fun m!47465 () Bool)

(assert (=> b!56359 m!47465))

(declare-fun m!47467 () Bool)

(assert (=> b!56359 m!47467))

(assert (=> b!56359 m!47465))

(assert (=> b!56359 m!47465))

(declare-fun m!47469 () Bool)

(assert (=> b!56359 m!47469))

(assert (=> b!56351 m!47465))

(declare-fun m!47471 () Bool)

(assert (=> b!56351 m!47471))

(declare-fun m!47473 () Bool)

(assert (=> b!56351 m!47473))

(declare-fun m!47475 () Bool)

(assert (=> b!56358 m!47475))

(declare-fun m!47477 () Bool)

(assert (=> b!56357 m!47477))

(declare-fun m!47479 () Bool)

(assert (=> b!56357 m!47479))

(declare-fun m!47481 () Bool)

(assert (=> mapNonEmpty!2789 m!47481))

(declare-fun m!47483 () Bool)

(assert (=> b!56346 m!47483))

(declare-fun m!47485 () Bool)

(assert (=> b!56352 m!47485))

(declare-fun m!47487 () Bool)

(assert (=> b!56348 m!47487))

(declare-fun m!47489 () Bool)

(assert (=> b!56348 m!47489))

(declare-fun m!47491 () Bool)

(assert (=> b!56348 m!47491))

(assert (=> b!56348 m!47465))

(assert (=> b!56348 m!47489))

(assert (=> b!56348 m!47465))

(declare-fun m!47493 () Bool)

(assert (=> b!56348 m!47493))

(assert (=> b!56348 m!47465))

(assert (=> b!56348 m!47491))

(declare-fun m!47495 () Bool)

(assert (=> b!56348 m!47495))

(assert (=> b!56348 m!47487))

(declare-fun m!47497 () Bool)

(assert (=> b!56347 m!47497))

(declare-fun m!47499 () Bool)

(assert (=> b!56347 m!47499))

(declare-fun m!47501 () Bool)

(assert (=> start!8374 m!47501))

(assert (=> b!56354 m!47465))

(assert (=> b!56354 m!47465))

(declare-fun m!47503 () Bool)

(assert (=> b!56354 m!47503))

(check-sat (not b_next!1913) (not b!56354) (not b!56358) (not mapNonEmpty!2789) (not b!56353) (not b!56351) (not b_lambda!2467) (not b!56352) (not b!56348) (not start!8374) (not b!56346) tp_is_empty!2373 (not b!56359) (not b_next!1915) b_and!3371 (not b!56357) (not b!56347) (not mapNonEmpty!2790) (not b!56355) b_and!3373)
(check-sat b_and!3371 b_and!3373 (not b_next!1913) (not b_next!1915))
