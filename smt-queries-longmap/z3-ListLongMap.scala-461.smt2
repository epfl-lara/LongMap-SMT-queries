; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8382 () Bool)

(assert start!8382)

(declare-fun b!56433 () Bool)

(declare-fun b_free!1921 () Bool)

(declare-fun b_next!1921 () Bool)

(assert (=> b!56433 (= b_free!1921 (not b_next!1921))))

(declare-fun tp!7864 () Bool)

(declare-fun b_and!3381 () Bool)

(assert (=> b!56433 (= tp!7864 b_and!3381)))

(declare-fun b!56425 () Bool)

(declare-fun b_free!1923 () Bool)

(declare-fun b_next!1923 () Bool)

(assert (=> b!56425 (= b_free!1923 (not b_next!1923))))

(declare-fun tp!7866 () Bool)

(declare-fun b_and!3383 () Bool)

(assert (=> b!56425 (= tp!7866 b_and!3383)))

(declare-fun b!56418 () Bool)

(declare-fun res!31732 () Bool)

(declare-fun e!37156 () Bool)

(assert (=> b!56418 (=> (not res!31732) (not e!37156))))

(declare-datatypes ((V!2817 0))(
  ( (V!2818 (val!1233 Int)) )
))
(declare-datatypes ((array!3663 0))(
  ( (array!3664 (arr!1754 (Array (_ BitVec 32) (_ BitVec 64))) (size!1983 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!845 0))(
  ( (ValueCellFull!845 (v!2351 V!2817)) (EmptyCell!845) )
))
(declare-datatypes ((array!3665 0))(
  ( (array!3666 (arr!1755 (Array (_ BitVec 32) ValueCell!845)) (size!1984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!598 0))(
  ( (LongMapFixedSize!599 (defaultEntry!2013 Int) (mask!5882 (_ BitVec 32)) (extraKeys!1904 (_ BitVec 32)) (zeroValue!1931 V!2817) (minValue!1931 V!2817) (_size!348 (_ BitVec 32)) (_keys!3633 array!3663) (_values!1996 array!3665) (_vacant!348 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!598)

(declare-fun valid!255 (LongMapFixedSize!598) Bool)

(assert (=> b!56418 (= res!31732 (valid!255 newMap!16))))

(declare-fun b!56419 () Bool)

(declare-fun res!31730 () Bool)

(assert (=> b!56419 (=> (not res!31730) (not e!37156))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!410 0))(
  ( (Cell!411 (v!2352 LongMapFixedSize!598)) )
))
(declare-datatypes ((LongMap!410 0))(
  ( (LongMap!411 (underlying!216 Cell!410)) )
))
(declare-fun thiss!992 () LongMap!410)

(assert (=> b!56419 (= res!31730 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1983 (_keys!3633 (v!2352 (underlying!216 thiss!992)))))))))

(declare-fun b!56420 () Bool)

(declare-fun e!37151 () Bool)

(declare-fun tp_is_empty!2377 () Bool)

(assert (=> b!56420 (= e!37151 tp_is_empty!2377)))

(declare-fun mapNonEmpty!2801 () Bool)

(declare-fun mapRes!2802 () Bool)

(declare-fun tp!7863 () Bool)

(declare-fun e!37157 () Bool)

(assert (=> mapNonEmpty!2801 (= mapRes!2802 (and tp!7863 e!37157))))

(declare-fun mapRest!2801 () (Array (_ BitVec 32) ValueCell!845))

(declare-fun mapKey!2802 () (_ BitVec 32))

(declare-fun mapValue!2801 () ValueCell!845)

(assert (=> mapNonEmpty!2801 (= (arr!1755 (_values!1996 newMap!16)) (store mapRest!2801 mapKey!2802 mapValue!2801))))

(declare-fun b!56421 () Bool)

(declare-fun e!37155 () Bool)

(assert (=> b!56421 (= e!37155 (and e!37151 mapRes!2802))))

(declare-fun condMapEmpty!2801 () Bool)

(declare-fun mapDefault!2801 () ValueCell!845)

(assert (=> b!56421 (= condMapEmpty!2801 (= (arr!1755 (_values!1996 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!845)) mapDefault!2801)))))

(declare-fun mapIsEmpty!2801 () Bool)

(assert (=> mapIsEmpty!2801 mapRes!2802))

(declare-fun b!56422 () Bool)

(declare-fun e!37154 () Bool)

(declare-fun e!37161 () Bool)

(declare-fun mapRes!2801 () Bool)

(assert (=> b!56422 (= e!37154 (and e!37161 mapRes!2801))))

(declare-fun condMapEmpty!2802 () Bool)

(declare-fun mapDefault!2802 () ValueCell!845)

(assert (=> b!56422 (= condMapEmpty!2802 (= (arr!1755 (_values!1996 (v!2352 (underlying!216 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!845)) mapDefault!2802)))))

(declare-fun mapNonEmpty!2802 () Bool)

(declare-fun tp!7865 () Bool)

(declare-fun e!37160 () Bool)

(assert (=> mapNonEmpty!2802 (= mapRes!2801 (and tp!7865 e!37160))))

(declare-fun mapRest!2802 () (Array (_ BitVec 32) ValueCell!845))

(declare-fun mapKey!2801 () (_ BitVec 32))

(declare-fun mapValue!2802 () ValueCell!845)

(assert (=> mapNonEmpty!2802 (= (arr!1755 (_values!1996 (v!2352 (underlying!216 thiss!992)))) (store mapRest!2802 mapKey!2801 mapValue!2802))))

(declare-fun b!56424 () Bool)

(declare-fun e!37148 () Bool)

(declare-fun e!37150 () Bool)

(assert (=> b!56424 (= e!37148 e!37150)))

(declare-fun e!37149 () Bool)

(declare-fun array_inv!1077 (array!3663) Bool)

(declare-fun array_inv!1078 (array!3665) Bool)

(assert (=> b!56425 (= e!37149 (and tp!7866 tp_is_empty!2377 (array_inv!1077 (_keys!3633 newMap!16)) (array_inv!1078 (_values!1996 newMap!16)) e!37155))))

(declare-fun b!56426 () Bool)

(assert (=> b!56426 (= e!37161 tp_is_empty!2377)))

(declare-fun b!56427 () Bool)

(declare-fun res!31735 () Bool)

(assert (=> b!56427 (=> (not res!31735) (not e!37156))))

(assert (=> b!56427 (= res!31735 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5882 newMap!16)) (_size!348 (v!2352 (underlying!216 thiss!992)))))))

(declare-fun b!56428 () Bool)

(assert (=> b!56428 (= e!37160 tp_is_empty!2377)))

(declare-fun b!56429 () Bool)

(declare-fun e!37152 () Bool)

(declare-fun e!37159 () Bool)

(assert (=> b!56429 (= e!37152 e!37159)))

(declare-fun res!31734 () Bool)

(assert (=> b!56429 (=> (not res!31734) (not e!37159))))

(declare-datatypes ((tuple2!1994 0))(
  ( (tuple2!1995 (_1!1008 (_ BitVec 64)) (_2!1008 V!2817)) )
))
(declare-datatypes ((List!1411 0))(
  ( (Nil!1408) (Cons!1407 (h!1987 tuple2!1994) (t!4701 List!1411)) )
))
(declare-datatypes ((ListLongMap!1331 0))(
  ( (ListLongMap!1332 (toList!681 List!1411)) )
))
(declare-fun lt!22230 () ListLongMap!1331)

(declare-fun contains!668 (ListLongMap!1331 (_ BitVec 64)) Bool)

(assert (=> b!56429 (= res!31734 (contains!668 lt!22230 (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1996 0))(
  ( (tuple2!1997 (_1!1009 Bool) (_2!1009 LongMapFixedSize!598)) )
))
(declare-fun lt!22235 () tuple2!1996)

(declare-fun update!82 (LongMapFixedSize!598 (_ BitVec 64) V!2817) tuple2!1996)

(declare-fun get!1057 (ValueCell!845 V!2817) V!2817)

(declare-fun dynLambda!300 (Int (_ BitVec 64)) V!2817)

(assert (=> b!56429 (= lt!22235 (update!82 newMap!16 (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) (get!1057 (select (arr!1755 (_values!1996 (v!2352 (underlying!216 thiss!992)))) from!355) (dynLambda!300 (defaultEntry!2013 (v!2352 (underlying!216 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56430 () Bool)

(assert (=> b!56430 (= e!37157 tp_is_empty!2377)))

(declare-fun b!56431 () Bool)

(declare-fun e!37147 () Bool)

(assert (=> b!56431 (= e!37150 e!37147)))

(declare-fun b!56432 () Bool)

(assert (=> b!56432 (= e!37156 e!37152)))

(declare-fun res!31729 () Bool)

(assert (=> b!56432 (=> (not res!31729) (not e!37152))))

(declare-fun lt!22234 () ListLongMap!1331)

(assert (=> b!56432 (= res!31729 (and (= lt!22234 lt!22230) (not (= (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1097 (LongMapFixedSize!598) ListLongMap!1331)

(assert (=> b!56432 (= lt!22230 (map!1097 newMap!16))))

(declare-fun getCurrentListMap!383 (array!3663 array!3665 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 32) Int) ListLongMap!1331)

(assert (=> b!56432 (= lt!22234 (getCurrentListMap!383 (_keys!3633 (v!2352 (underlying!216 thiss!992))) (_values!1996 (v!2352 (underlying!216 thiss!992))) (mask!5882 (v!2352 (underlying!216 thiss!992))) (extraKeys!1904 (v!2352 (underlying!216 thiss!992))) (zeroValue!1931 (v!2352 (underlying!216 thiss!992))) (minValue!1931 (v!2352 (underlying!216 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2352 (underlying!216 thiss!992)))))))

(assert (=> b!56433 (= e!37147 (and tp!7864 tp_is_empty!2377 (array_inv!1077 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) (array_inv!1078 (_values!1996 (v!2352 (underlying!216 thiss!992)))) e!37154))))

(declare-fun b!56434 () Bool)

(declare-fun res!31726 () Bool)

(declare-fun e!37162 () Bool)

(assert (=> b!56434 (=> res!31726 e!37162)))

(declare-datatypes ((List!1412 0))(
  ( (Nil!1409) (Cons!1408 (h!1988 (_ BitVec 64)) (t!4702 List!1412)) )
))
(declare-fun lt!22232 () List!1412)

(declare-fun contains!669 (List!1412 (_ BitVec 64)) Bool)

(assert (=> b!56434 (= res!31726 (contains!669 lt!22232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56435 () Bool)

(declare-fun res!31727 () Bool)

(assert (=> b!56435 (=> res!31727 e!37162)))

(declare-fun arrayNoDuplicates!0 (array!3663 (_ BitVec 32) List!1412) Bool)

(assert (=> b!56435 (= res!31727 (not (arrayNoDuplicates!0 (_keys!3633 (v!2352 (underlying!216 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22232)))))

(declare-fun res!31731 () Bool)

(assert (=> start!8382 (=> (not res!31731) (not e!37156))))

(declare-fun valid!256 (LongMap!410) Bool)

(assert (=> start!8382 (= res!31731 (valid!256 thiss!992))))

(assert (=> start!8382 e!37156))

(assert (=> start!8382 e!37148))

(assert (=> start!8382 true))

(assert (=> start!8382 e!37149))

(declare-fun b!56423 () Bool)

(assert (=> b!56423 (= e!37162 true)))

(declare-fun lt!22229 () Bool)

(assert (=> b!56423 (= lt!22229 (contains!669 lt!22232 (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2802 () Bool)

(assert (=> mapIsEmpty!2802 mapRes!2801))

(declare-fun b!56436 () Bool)

(declare-fun res!31725 () Bool)

(assert (=> b!56436 (=> res!31725 e!37162)))

(declare-fun noDuplicate!46 (List!1412) Bool)

(assert (=> b!56436 (= res!31725 (not (noDuplicate!46 lt!22232)))))

(declare-fun b!56437 () Bool)

(assert (=> b!56437 (= e!37159 (not e!37162))))

(declare-fun res!31733 () Bool)

(assert (=> b!56437 (=> res!31733 e!37162)))

(assert (=> b!56437 (= res!31733 (or (bvsge (size!1983 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1983 (_keys!3633 (v!2352 (underlying!216 thiss!992)))))))))

(assert (=> b!56437 (= lt!22232 (Cons!1408 (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) Nil!1409))))

(assert (=> b!56437 (arrayNoDuplicates!0 (_keys!3633 (v!2352 (underlying!216 thiss!992))) from!355 Nil!1409)))

(declare-datatypes ((Unit!1474 0))(
  ( (Unit!1475) )
))
(declare-fun lt!22233 () Unit!1474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3663 (_ BitVec 32) (_ BitVec 32)) Unit!1474)

(assert (=> b!56437 (= lt!22233 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3633 (v!2352 (underlying!216 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56437 (arrayContainsKey!0 (_keys!3633 (v!2352 (underlying!216 thiss!992))) (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22231 () Unit!1474)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!21 (array!3663 array!3665 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 64) (_ BitVec 32) Int) Unit!1474)

(assert (=> b!56437 (= lt!22231 (lemmaListMapContainsThenArrayContainsFrom!21 (_keys!3633 (v!2352 (underlying!216 thiss!992))) (_values!1996 (v!2352 (underlying!216 thiss!992))) (mask!5882 (v!2352 (underlying!216 thiss!992))) (extraKeys!1904 (v!2352 (underlying!216 thiss!992))) (zeroValue!1931 (v!2352 (underlying!216 thiss!992))) (minValue!1931 (v!2352 (underlying!216 thiss!992))) (select (arr!1754 (_keys!3633 (v!2352 (underlying!216 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2352 (underlying!216 thiss!992)))))))

(declare-fun b!56438 () Bool)

(declare-fun res!31728 () Bool)

(assert (=> b!56438 (=> res!31728 e!37162)))

(assert (=> b!56438 (= res!31728 (contains!669 lt!22232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!8382 res!31731) b!56419))

(assert (= (and b!56419 res!31730) b!56418))

(assert (= (and b!56418 res!31732) b!56427))

(assert (= (and b!56427 res!31735) b!56432))

(assert (= (and b!56432 res!31729) b!56429))

(assert (= (and b!56429 res!31734) b!56437))

(assert (= (and b!56437 (not res!31733)) b!56436))

(assert (= (and b!56436 (not res!31725)) b!56438))

(assert (= (and b!56438 (not res!31728)) b!56434))

(assert (= (and b!56434 (not res!31726)) b!56435))

(assert (= (and b!56435 (not res!31727)) b!56423))

(assert (= (and b!56422 condMapEmpty!2802) mapIsEmpty!2802))

(assert (= (and b!56422 (not condMapEmpty!2802)) mapNonEmpty!2802))

(get-info :version)

(assert (= (and mapNonEmpty!2802 ((_ is ValueCellFull!845) mapValue!2802)) b!56428))

(assert (= (and b!56422 ((_ is ValueCellFull!845) mapDefault!2802)) b!56426))

(assert (= b!56433 b!56422))

(assert (= b!56431 b!56433))

(assert (= b!56424 b!56431))

(assert (= start!8382 b!56424))

(assert (= (and b!56421 condMapEmpty!2801) mapIsEmpty!2801))

(assert (= (and b!56421 (not condMapEmpty!2801)) mapNonEmpty!2801))

(assert (= (and mapNonEmpty!2801 ((_ is ValueCellFull!845) mapValue!2801)) b!56430))

(assert (= (and b!56421 ((_ is ValueCellFull!845) mapDefault!2801)) b!56420))

(assert (= b!56425 b!56421))

(assert (= start!8382 b!56425))

(declare-fun b_lambda!2471 () Bool)

(assert (=> (not b_lambda!2471) (not b!56429)))

(declare-fun t!4698 () Bool)

(declare-fun tb!1265 () Bool)

(assert (=> (and b!56433 (= (defaultEntry!2013 (v!2352 (underlying!216 thiss!992))) (defaultEntry!2013 (v!2352 (underlying!216 thiss!992)))) t!4698) tb!1265))

(declare-fun result!2295 () Bool)

(assert (=> tb!1265 (= result!2295 tp_is_empty!2377)))

(assert (=> b!56429 t!4698))

(declare-fun b_and!3385 () Bool)

(assert (= b_and!3381 (and (=> t!4698 result!2295) b_and!3385)))

(declare-fun t!4700 () Bool)

(declare-fun tb!1267 () Bool)

(assert (=> (and b!56425 (= (defaultEntry!2013 newMap!16) (defaultEntry!2013 (v!2352 (underlying!216 thiss!992)))) t!4700) tb!1267))

(declare-fun result!2299 () Bool)

(assert (= result!2299 result!2295))

(assert (=> b!56429 t!4700))

(declare-fun b_and!3387 () Bool)

(assert (= b_and!3383 (and (=> t!4700 result!2299) b_and!3387)))

(declare-fun m!47431 () Bool)

(assert (=> b!56418 m!47431))

(declare-fun m!47433 () Bool)

(assert (=> b!56432 m!47433))

(declare-fun m!47435 () Bool)

(assert (=> b!56432 m!47435))

(declare-fun m!47437 () Bool)

(assert (=> b!56432 m!47437))

(declare-fun m!47439 () Bool)

(assert (=> b!56425 m!47439))

(declare-fun m!47441 () Bool)

(assert (=> b!56425 m!47441))

(declare-fun m!47443 () Bool)

(assert (=> b!56429 m!47443))

(declare-fun m!47445 () Bool)

(assert (=> b!56429 m!47445))

(declare-fun m!47447 () Bool)

(assert (=> b!56429 m!47447))

(assert (=> b!56429 m!47433))

(declare-fun m!47449 () Bool)

(assert (=> b!56429 m!47449))

(assert (=> b!56429 m!47433))

(assert (=> b!56429 m!47445))

(assert (=> b!56429 m!47433))

(assert (=> b!56429 m!47447))

(declare-fun m!47451 () Bool)

(assert (=> b!56429 m!47451))

(assert (=> b!56429 m!47443))

(declare-fun m!47453 () Bool)

(assert (=> b!56438 m!47453))

(declare-fun m!47455 () Bool)

(assert (=> b!56437 m!47455))

(declare-fun m!47457 () Bool)

(assert (=> b!56437 m!47457))

(assert (=> b!56437 m!47433))

(declare-fun m!47459 () Bool)

(assert (=> b!56437 m!47459))

(assert (=> b!56437 m!47433))

(assert (=> b!56437 m!47433))

(declare-fun m!47461 () Bool)

(assert (=> b!56437 m!47461))

(declare-fun m!47463 () Bool)

(assert (=> b!56433 m!47463))

(declare-fun m!47465 () Bool)

(assert (=> b!56433 m!47465))

(assert (=> b!56423 m!47433))

(assert (=> b!56423 m!47433))

(declare-fun m!47467 () Bool)

(assert (=> b!56423 m!47467))

(declare-fun m!47469 () Bool)

(assert (=> mapNonEmpty!2801 m!47469))

(declare-fun m!47471 () Bool)

(assert (=> b!56435 m!47471))

(declare-fun m!47473 () Bool)

(assert (=> b!56436 m!47473))

(declare-fun m!47475 () Bool)

(assert (=> b!56434 m!47475))

(declare-fun m!47477 () Bool)

(assert (=> mapNonEmpty!2802 m!47477))

(declare-fun m!47479 () Bool)

(assert (=> start!8382 m!47479))

(check-sat (not start!8382) (not b!56432) b_and!3385 (not b_next!1923) (not b!56436) (not b!56434) (not b!56435) (not b!56425) (not mapNonEmpty!2801) (not mapNonEmpty!2802) b_and!3387 (not b!56418) tp_is_empty!2377 (not b_next!1921) (not b!56429) (not b!56423) (not b!56437) (not b_lambda!2471) (not b!56433) (not b!56438))
(check-sat b_and!3385 b_and!3387 (not b_next!1921) (not b_next!1923))
