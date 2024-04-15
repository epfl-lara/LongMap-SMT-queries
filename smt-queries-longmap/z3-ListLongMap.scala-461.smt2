; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8382 () Bool)

(assert start!8382)

(declare-fun b!56418 () Bool)

(declare-fun b_free!1921 () Bool)

(declare-fun b_next!1921 () Bool)

(assert (=> b!56418 (= b_free!1921 (not b_next!1921))))

(declare-fun tp!7866 () Bool)

(declare-fun b_and!3385 () Bool)

(assert (=> b!56418 (= tp!7866 b_and!3385)))

(declare-fun b!56412 () Bool)

(declare-fun b_free!1923 () Bool)

(declare-fun b_next!1923 () Bool)

(assert (=> b!56412 (= b_free!1923 (not b_next!1923))))

(declare-fun tp!7864 () Bool)

(declare-fun b_and!3387 () Bool)

(assert (=> b!56412 (= tp!7864 b_and!3387)))

(declare-fun mapNonEmpty!2801 () Bool)

(declare-fun mapRes!2802 () Bool)

(declare-fun tp!7865 () Bool)

(declare-fun e!37154 () Bool)

(assert (=> mapNonEmpty!2801 (= mapRes!2802 (and tp!7865 e!37154))))

(declare-datatypes ((V!2817 0))(
  ( (V!2818 (val!1233 Int)) )
))
(declare-datatypes ((array!3657 0))(
  ( (array!3658 (arr!1750 (Array (_ BitVec 32) (_ BitVec 64))) (size!1980 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!845 0))(
  ( (ValueCellFull!845 (v!2346 V!2817)) (EmptyCell!845) )
))
(declare-datatypes ((array!3659 0))(
  ( (array!3660 (arr!1751 (Array (_ BitVec 32) ValueCell!845)) (size!1981 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!598 0))(
  ( (LongMapFixedSize!599 (defaultEntry!2013 Int) (mask!5881 (_ BitVec 32)) (extraKeys!1904 (_ BitVec 32)) (zeroValue!1931 V!2817) (minValue!1931 V!2817) (_size!348 (_ BitVec 32)) (_keys!3632 array!3657) (_values!1996 array!3659) (_vacant!348 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!406 0))(
  ( (Cell!407 (v!2347 LongMapFixedSize!598)) )
))
(declare-datatypes ((LongMap!406 0))(
  ( (LongMap!407 (underlying!214 Cell!406)) )
))
(declare-fun thiss!992 () LongMap!406)

(declare-fun mapRest!2801 () (Array (_ BitVec 32) ValueCell!845))

(declare-fun mapValue!2802 () ValueCell!845)

(declare-fun mapKey!2801 () (_ BitVec 32))

(assert (=> mapNonEmpty!2801 (= (arr!1751 (_values!1996 (v!2347 (underlying!214 thiss!992)))) (store mapRest!2801 mapKey!2801 mapValue!2802))))

(declare-fun b!56409 () Bool)

(declare-fun e!37155 () Bool)

(declare-fun e!37151 () Bool)

(assert (=> b!56409 (= e!37155 e!37151)))

(declare-fun b!56410 () Bool)

(declare-fun res!31739 () Bool)

(declare-fun e!37148 () Bool)

(assert (=> b!56410 (=> (not res!31739) (not e!37148))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56410 (= res!31739 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1980 (_keys!3632 (v!2347 (underlying!214 thiss!992)))))))))

(declare-fun b!56411 () Bool)

(declare-fun res!31735 () Bool)

(declare-fun e!37147 () Bool)

(assert (=> b!56411 (=> res!31735 e!37147)))

(declare-datatypes ((List!1422 0))(
  ( (Nil!1419) (Cons!1418 (h!1998 (_ BitVec 64)) (t!4711 List!1422)) )
))
(declare-fun lt!22259 () List!1422)

(declare-fun contains!672 (List!1422 (_ BitVec 64)) Bool)

(assert (=> b!56411 (= res!31735 (contains!672 lt!22259 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!2801 () Bool)

(declare-fun mapRes!2801 () Bool)

(assert (=> mapIsEmpty!2801 mapRes!2801))

(declare-fun newMap!16 () LongMapFixedSize!598)

(declare-fun e!37144 () Bool)

(declare-fun e!37145 () Bool)

(declare-fun tp_is_empty!2377 () Bool)

(declare-fun array_inv!1083 (array!3657) Bool)

(declare-fun array_inv!1084 (array!3659) Bool)

(assert (=> b!56412 (= e!37145 (and tp!7864 tp_is_empty!2377 (array_inv!1083 (_keys!3632 newMap!16)) (array_inv!1084 (_values!1996 newMap!16)) e!37144))))

(declare-fun b!56413 () Bool)

(declare-fun e!37150 () Bool)

(assert (=> b!56413 (= e!37144 (and e!37150 mapRes!2801))))

(declare-fun condMapEmpty!2801 () Bool)

(declare-fun mapDefault!2801 () ValueCell!845)

(assert (=> b!56413 (= condMapEmpty!2801 (= (arr!1751 (_values!1996 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!845)) mapDefault!2801)))))

(declare-fun b!56414 () Bool)

(declare-fun res!31737 () Bool)

(assert (=> b!56414 (=> (not res!31737) (not e!37148))))

(assert (=> b!56414 (= res!31737 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5881 newMap!16)) (_size!348 (v!2347 (underlying!214 thiss!992)))))))

(declare-fun b!56415 () Bool)

(declare-fun e!37146 () Bool)

(assert (=> b!56415 (= e!37151 e!37146)))

(declare-fun b!56416 () Bool)

(assert (=> b!56416 (= e!37154 tp_is_empty!2377)))

(declare-fun b!56417 () Bool)

(declare-fun res!31731 () Bool)

(assert (=> b!56417 (=> res!31731 e!37147)))

(assert (=> b!56417 (= res!31731 (contains!672 lt!22259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37143 () Bool)

(assert (=> b!56418 (= e!37146 (and tp!7866 tp_is_empty!2377 (array_inv!1083 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) (array_inv!1084 (_values!1996 (v!2347 (underlying!214 thiss!992)))) e!37143))))

(declare-fun b!56419 () Bool)

(declare-fun e!37141 () Bool)

(assert (=> b!56419 (= e!37141 tp_is_empty!2377)))

(declare-fun b!56420 () Bool)

(declare-fun e!37142 () Bool)

(assert (=> b!56420 (= e!37148 e!37142)))

(declare-fun res!31733 () Bool)

(assert (=> b!56420 (=> (not res!31733) (not e!37142))))

(declare-datatypes ((tuple2!2008 0))(
  ( (tuple2!2009 (_1!1015 (_ BitVec 64)) (_2!1015 V!2817)) )
))
(declare-datatypes ((List!1423 0))(
  ( (Nil!1420) (Cons!1419 (h!1999 tuple2!2008) (t!4712 List!1423)) )
))
(declare-datatypes ((ListLongMap!1341 0))(
  ( (ListLongMap!1342 (toList!686 List!1423)) )
))
(declare-fun lt!22257 () ListLongMap!1341)

(declare-fun lt!22256 () ListLongMap!1341)

(assert (=> b!56420 (= res!31733 (and (= lt!22256 lt!22257) (not (= (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1092 (LongMapFixedSize!598) ListLongMap!1341)

(assert (=> b!56420 (= lt!22257 (map!1092 newMap!16))))

(declare-fun getCurrentListMap!384 (array!3657 array!3659 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 32) Int) ListLongMap!1341)

(assert (=> b!56420 (= lt!22256 (getCurrentListMap!384 (_keys!3632 (v!2347 (underlying!214 thiss!992))) (_values!1996 (v!2347 (underlying!214 thiss!992))) (mask!5881 (v!2347 (underlying!214 thiss!992))) (extraKeys!1904 (v!2347 (underlying!214 thiss!992))) (zeroValue!1931 (v!2347 (underlying!214 thiss!992))) (minValue!1931 (v!2347 (underlying!214 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2347 (underlying!214 thiss!992)))))))

(declare-fun mapNonEmpty!2802 () Bool)

(declare-fun tp!7863 () Bool)

(assert (=> mapNonEmpty!2802 (= mapRes!2801 (and tp!7863 e!37141))))

(declare-fun mapValue!2801 () ValueCell!845)

(declare-fun mapKey!2802 () (_ BitVec 32))

(declare-fun mapRest!2802 () (Array (_ BitVec 32) ValueCell!845))

(assert (=> mapNonEmpty!2802 (= (arr!1751 (_values!1996 newMap!16)) (store mapRest!2802 mapKey!2802 mapValue!2801))))

(declare-fun b!56421 () Bool)

(assert (=> b!56421 (= e!37150 tp_is_empty!2377)))

(declare-fun b!56422 () Bool)

(declare-fun res!31738 () Bool)

(assert (=> b!56422 (=> (not res!31738) (not e!37148))))

(declare-fun valid!243 (LongMapFixedSize!598) Bool)

(assert (=> b!56422 (= res!31738 (valid!243 newMap!16))))

(declare-fun b!56423 () Bool)

(declare-fun e!37153 () Bool)

(assert (=> b!56423 (= e!37153 tp_is_empty!2377)))

(declare-fun b!56424 () Bool)

(assert (=> b!56424 (= e!37143 (and e!37153 mapRes!2802))))

(declare-fun condMapEmpty!2802 () Bool)

(declare-fun mapDefault!2802 () ValueCell!845)

(assert (=> b!56424 (= condMapEmpty!2802 (= (arr!1751 (_values!1996 (v!2347 (underlying!214 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!845)) mapDefault!2802)))))

(declare-fun b!56425 () Bool)

(declare-fun e!37152 () Bool)

(assert (=> b!56425 (= e!37142 e!37152)))

(declare-fun res!31734 () Bool)

(assert (=> b!56425 (=> (not res!31734) (not e!37152))))

(declare-fun contains!673 (ListLongMap!1341 (_ BitVec 64)) Bool)

(assert (=> b!56425 (= res!31734 (contains!673 lt!22257 (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2010 0))(
  ( (tuple2!2011 (_1!1016 Bool) (_2!1016 LongMapFixedSize!598)) )
))
(declare-fun lt!22258 () tuple2!2010)

(declare-fun update!78 (LongMapFixedSize!598 (_ BitVec 64) V!2817) tuple2!2010)

(declare-fun get!1056 (ValueCell!845 V!2817) V!2817)

(declare-fun dynLambda!302 (Int (_ BitVec 64)) V!2817)

(assert (=> b!56425 (= lt!22258 (update!78 newMap!16 (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) (get!1056 (select (arr!1751 (_values!1996 (v!2347 (underlying!214 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2013 (v!2347 (underlying!214 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56426 () Bool)

(declare-fun res!31730 () Bool)

(assert (=> b!56426 (=> res!31730 e!37147)))

(declare-fun arrayNoDuplicates!0 (array!3657 (_ BitVec 32) List!1422) Bool)

(assert (=> b!56426 (= res!31730 (not (arrayNoDuplicates!0 (_keys!3632 (v!2347 (underlying!214 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22259)))))

(declare-fun b!56427 () Bool)

(assert (=> b!56427 (= e!37147 true)))

(declare-fun lt!22262 () Bool)

(assert (=> b!56427 (= lt!22262 (contains!672 lt!22259 (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2802 () Bool)

(assert (=> mapIsEmpty!2802 mapRes!2802))

(declare-fun res!31740 () Bool)

(assert (=> start!8382 (=> (not res!31740) (not e!37148))))

(declare-fun valid!244 (LongMap!406) Bool)

(assert (=> start!8382 (= res!31740 (valid!244 thiss!992))))

(assert (=> start!8382 e!37148))

(assert (=> start!8382 e!37155))

(assert (=> start!8382 true))

(assert (=> start!8382 e!37145))

(declare-fun b!56428 () Bool)

(assert (=> b!56428 (= e!37152 (not e!37147))))

(declare-fun res!31732 () Bool)

(assert (=> b!56428 (=> res!31732 e!37147)))

(assert (=> b!56428 (= res!31732 (or (bvsge (size!1980 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1980 (_keys!3632 (v!2347 (underlying!214 thiss!992)))))))))

(assert (=> b!56428 (= lt!22259 (Cons!1418 (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) Nil!1419))))

(assert (=> b!56428 (arrayNoDuplicates!0 (_keys!3632 (v!2347 (underlying!214 thiss!992))) from!355 Nil!1419)))

(declare-datatypes ((Unit!1468 0))(
  ( (Unit!1469) )
))
(declare-fun lt!22261 () Unit!1468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3657 (_ BitVec 32) (_ BitVec 32)) Unit!1468)

(assert (=> b!56428 (= lt!22261 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3632 (v!2347 (underlying!214 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56428 (arrayContainsKey!0 (_keys!3632 (v!2347 (underlying!214 thiss!992))) (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22260 () Unit!1468)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!21 (array!3657 array!3659 (_ BitVec 32) (_ BitVec 32) V!2817 V!2817 (_ BitVec 64) (_ BitVec 32) Int) Unit!1468)

(assert (=> b!56428 (= lt!22260 (lemmaListMapContainsThenArrayContainsFrom!21 (_keys!3632 (v!2347 (underlying!214 thiss!992))) (_values!1996 (v!2347 (underlying!214 thiss!992))) (mask!5881 (v!2347 (underlying!214 thiss!992))) (extraKeys!1904 (v!2347 (underlying!214 thiss!992))) (zeroValue!1931 (v!2347 (underlying!214 thiss!992))) (minValue!1931 (v!2347 (underlying!214 thiss!992))) (select (arr!1750 (_keys!3632 (v!2347 (underlying!214 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2013 (v!2347 (underlying!214 thiss!992)))))))

(declare-fun b!56429 () Bool)

(declare-fun res!31736 () Bool)

(assert (=> b!56429 (=> res!31736 e!37147)))

(declare-fun noDuplicate!50 (List!1422) Bool)

(assert (=> b!56429 (= res!31736 (not (noDuplicate!50 lt!22259)))))

(assert (= (and start!8382 res!31740) b!56410))

(assert (= (and b!56410 res!31739) b!56422))

(assert (= (and b!56422 res!31738) b!56414))

(assert (= (and b!56414 res!31737) b!56420))

(assert (= (and b!56420 res!31733) b!56425))

(assert (= (and b!56425 res!31734) b!56428))

(assert (= (and b!56428 (not res!31732)) b!56429))

(assert (= (and b!56429 (not res!31736)) b!56417))

(assert (= (and b!56417 (not res!31731)) b!56411))

(assert (= (and b!56411 (not res!31735)) b!56426))

(assert (= (and b!56426 (not res!31730)) b!56427))

(assert (= (and b!56424 condMapEmpty!2802) mapIsEmpty!2802))

(assert (= (and b!56424 (not condMapEmpty!2802)) mapNonEmpty!2801))

(get-info :version)

(assert (= (and mapNonEmpty!2801 ((_ is ValueCellFull!845) mapValue!2802)) b!56416))

(assert (= (and b!56424 ((_ is ValueCellFull!845) mapDefault!2802)) b!56423))

(assert (= b!56418 b!56424))

(assert (= b!56415 b!56418))

(assert (= b!56409 b!56415))

(assert (= start!8382 b!56409))

(assert (= (and b!56413 condMapEmpty!2801) mapIsEmpty!2801))

(assert (= (and b!56413 (not condMapEmpty!2801)) mapNonEmpty!2802))

(assert (= (and mapNonEmpty!2802 ((_ is ValueCellFull!845) mapValue!2801)) b!56419))

(assert (= (and b!56413 ((_ is ValueCellFull!845) mapDefault!2801)) b!56421))

(assert (= b!56412 b!56413))

(assert (= start!8382 b!56412))

(declare-fun b_lambda!2475 () Bool)

(assert (=> (not b_lambda!2475) (not b!56425)))

(declare-fun t!4708 () Bool)

(declare-fun tb!1265 () Bool)

(assert (=> (and b!56418 (= (defaultEntry!2013 (v!2347 (underlying!214 thiss!992))) (defaultEntry!2013 (v!2347 (underlying!214 thiss!992)))) t!4708) tb!1265))

(declare-fun result!2295 () Bool)

(assert (=> tb!1265 (= result!2295 tp_is_empty!2377)))

(assert (=> b!56425 t!4708))

(declare-fun b_and!3389 () Bool)

(assert (= b_and!3385 (and (=> t!4708 result!2295) b_and!3389)))

(declare-fun t!4710 () Bool)

(declare-fun tb!1267 () Bool)

(assert (=> (and b!56412 (= (defaultEntry!2013 newMap!16) (defaultEntry!2013 (v!2347 (underlying!214 thiss!992)))) t!4710) tb!1267))

(declare-fun result!2299 () Bool)

(assert (= result!2299 result!2295))

(assert (=> b!56425 t!4710))

(declare-fun b_and!3391 () Bool)

(assert (= b_and!3387 (and (=> t!4710 result!2299) b_and!3391)))

(declare-fun m!47473 () Bool)

(assert (=> mapNonEmpty!2801 m!47473))

(declare-fun m!47475 () Bool)

(assert (=> b!56417 m!47475))

(declare-fun m!47477 () Bool)

(assert (=> b!56422 m!47477))

(declare-fun m!47479 () Bool)

(assert (=> b!56427 m!47479))

(assert (=> b!56427 m!47479))

(declare-fun m!47481 () Bool)

(assert (=> b!56427 m!47481))

(declare-fun m!47483 () Bool)

(assert (=> start!8382 m!47483))

(declare-fun m!47485 () Bool)

(assert (=> b!56425 m!47485))

(declare-fun m!47487 () Bool)

(assert (=> b!56425 m!47487))

(declare-fun m!47489 () Bool)

(assert (=> b!56425 m!47489))

(assert (=> b!56425 m!47479))

(assert (=> b!56425 m!47479))

(declare-fun m!47491 () Bool)

(assert (=> b!56425 m!47491))

(assert (=> b!56425 m!47487))

(assert (=> b!56425 m!47479))

(assert (=> b!56425 m!47489))

(declare-fun m!47493 () Bool)

(assert (=> b!56425 m!47493))

(assert (=> b!56425 m!47485))

(declare-fun m!47495 () Bool)

(assert (=> b!56411 m!47495))

(declare-fun m!47497 () Bool)

(assert (=> b!56418 m!47497))

(declare-fun m!47499 () Bool)

(assert (=> b!56418 m!47499))

(declare-fun m!47501 () Bool)

(assert (=> b!56429 m!47501))

(declare-fun m!47503 () Bool)

(assert (=> b!56428 m!47503))

(declare-fun m!47505 () Bool)

(assert (=> b!56428 m!47505))

(assert (=> b!56428 m!47479))

(declare-fun m!47507 () Bool)

(assert (=> b!56428 m!47507))

(assert (=> b!56428 m!47479))

(assert (=> b!56428 m!47479))

(declare-fun m!47509 () Bool)

(assert (=> b!56428 m!47509))

(declare-fun m!47511 () Bool)

(assert (=> b!56412 m!47511))

(declare-fun m!47513 () Bool)

(assert (=> b!56412 m!47513))

(assert (=> b!56420 m!47479))

(declare-fun m!47515 () Bool)

(assert (=> b!56420 m!47515))

(declare-fun m!47517 () Bool)

(assert (=> b!56420 m!47517))

(declare-fun m!47519 () Bool)

(assert (=> b!56426 m!47519))

(declare-fun m!47521 () Bool)

(assert (=> mapNonEmpty!2802 m!47521))

(check-sat (not mapNonEmpty!2801) (not start!8382) (not b!56427) (not b_lambda!2475) (not b!56418) (not b!56425) (not b!56411) (not b!56422) (not b_next!1921) (not b!56417) (not b!56429) (not mapNonEmpty!2802) b_and!3389 (not b_next!1923) tp_is_empty!2377 (not b!56420) b_and!3391 (not b!56428) (not b!56412) (not b!56426))
(check-sat b_and!3389 b_and!3391 (not b_next!1921) (not b_next!1923))
