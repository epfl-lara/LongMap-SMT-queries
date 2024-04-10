; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8380 () Bool)

(assert start!8380)

(declare-fun b!56559 () Bool)

(declare-fun b_free!1925 () Bool)

(declare-fun b_next!1925 () Bool)

(assert (=> b!56559 (= b_free!1925 (not b_next!1925))))

(declare-fun tp!7875 () Bool)

(declare-fun b_and!3391 () Bool)

(assert (=> b!56559 (= tp!7875 b_and!3391)))

(declare-fun b!56549 () Bool)

(declare-fun b_free!1927 () Bool)

(declare-fun b_next!1927 () Bool)

(assert (=> b!56549 (= b_free!1927 (not b_next!1927))))

(declare-fun tp!7877 () Bool)

(declare-fun b_and!3393 () Bool)

(assert (=> b!56549 (= tp!7877 b_and!3393)))

(declare-fun b!56540 () Bool)

(declare-fun res!31783 () Bool)

(declare-fun e!37243 () Bool)

(assert (=> b!56540 (=> res!31783 e!37243)))

(declare-datatypes ((List!1418 0))(
  ( (Nil!1415) (Cons!1414 (h!1994 (_ BitVec 64)) (t!4712 List!1418)) )
))
(declare-fun lt!22296 () List!1418)

(declare-fun noDuplicate!50 (List!1418) Bool)

(assert (=> b!56540 (= res!31783 (not (noDuplicate!50 lt!22296)))))

(declare-fun b!56541 () Bool)

(declare-fun e!37246 () Bool)

(declare-fun e!37237 () Bool)

(assert (=> b!56541 (= e!37246 e!37237)))

(declare-fun b!56542 () Bool)

(declare-fun e!37245 () Bool)

(declare-fun e!37234 () Bool)

(declare-fun mapRes!2807 () Bool)

(assert (=> b!56542 (= e!37245 (and e!37234 mapRes!2807))))

(declare-fun condMapEmpty!2808 () Bool)

(declare-datatypes ((V!2819 0))(
  ( (V!2820 (val!1234 Int)) )
))
(declare-datatypes ((array!3681 0))(
  ( (array!3682 (arr!1763 (Array (_ BitVec 32) (_ BitVec 64))) (size!1992 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!846 0))(
  ( (ValueCellFull!846 (v!2353 V!2819)) (EmptyCell!846) )
))
(declare-datatypes ((array!3683 0))(
  ( (array!3684 (arr!1764 (Array (_ BitVec 32) ValueCell!846)) (size!1993 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!600 0))(
  ( (LongMapFixedSize!601 (defaultEntry!2014 Int) (mask!5883 (_ BitVec 32)) (extraKeys!1905 (_ BitVec 32)) (zeroValue!1932 V!2819) (minValue!1932 V!2819) (_size!349 (_ BitVec 32)) (_keys!3634 array!3681) (_values!1997 array!3683) (_vacant!349 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!414 0))(
  ( (Cell!415 (v!2354 LongMapFixedSize!600)) )
))
(declare-datatypes ((LongMap!414 0))(
  ( (LongMap!415 (underlying!218 Cell!414)) )
))
(declare-fun thiss!992 () LongMap!414)

(declare-fun mapDefault!2808 () ValueCell!846)

(assert (=> b!56542 (= condMapEmpty!2808 (= (arr!1764 (_values!1997 (v!2354 (underlying!218 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!846)) mapDefault!2808)))))

(declare-fun b!56543 () Bool)

(declare-fun e!37239 () Bool)

(declare-fun e!37241 () Bool)

(assert (=> b!56543 (= e!37239 e!37241)))

(declare-fun res!31784 () Bool)

(assert (=> b!56543 (=> (not res!31784) (not e!37241))))

(declare-datatypes ((tuple2!2000 0))(
  ( (tuple2!2001 (_1!1011 (_ BitVec 64)) (_2!1011 V!2819)) )
))
(declare-datatypes ((List!1419 0))(
  ( (Nil!1416) (Cons!1415 (h!1995 tuple2!2000) (t!4713 List!1419)) )
))
(declare-datatypes ((ListLongMap!1351 0))(
  ( (ListLongMap!1352 (toList!691 List!1419)) )
))
(declare-fun lt!22298 () ListLongMap!1351)

(declare-fun lt!22299 () ListLongMap!1351)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56543 (= res!31784 (and (= lt!22298 lt!22299) (not (= (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!600)

(declare-fun map!1094 (LongMapFixedSize!600) ListLongMap!1351)

(assert (=> b!56543 (= lt!22299 (map!1094 newMap!16))))

(declare-fun getCurrentListMap!397 (array!3681 array!3683 (_ BitVec 32) (_ BitVec 32) V!2819 V!2819 (_ BitVec 32) Int) ListLongMap!1351)

(assert (=> b!56543 (= lt!22298 (getCurrentListMap!397 (_keys!3634 (v!2354 (underlying!218 thiss!992))) (_values!1997 (v!2354 (underlying!218 thiss!992))) (mask!5883 (v!2354 (underlying!218 thiss!992))) (extraKeys!1905 (v!2354 (underlying!218 thiss!992))) (zeroValue!1932 (v!2354 (underlying!218 thiss!992))) (minValue!1932 (v!2354 (underlying!218 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2014 (v!2354 (underlying!218 thiss!992)))))))

(declare-fun b!56544 () Bool)

(declare-fun res!31790 () Bool)

(assert (=> b!56544 (=> (not res!31790) (not e!37239))))

(assert (=> b!56544 (= res!31790 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1992 (_keys!3634 (v!2354 (underlying!218 thiss!992)))))))))

(declare-fun b!56545 () Bool)

(declare-fun e!37238 () Bool)

(declare-fun tp_is_empty!2379 () Bool)

(assert (=> b!56545 (= e!37238 tp_is_empty!2379)))

(declare-fun b!56546 () Bool)

(declare-fun res!31789 () Bool)

(assert (=> b!56546 (=> res!31789 e!37243)))

(declare-fun arrayNoDuplicates!0 (array!3681 (_ BitVec 32) List!1418) Bool)

(assert (=> b!56546 (= res!31789 (not (arrayNoDuplicates!0 (_keys!3634 (v!2354 (underlying!218 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22296)))))

(declare-fun mapIsEmpty!2807 () Bool)

(assert (=> mapIsEmpty!2807 mapRes!2807))

(declare-fun res!31786 () Bool)

(assert (=> start!8380 (=> (not res!31786) (not e!37239))))

(declare-fun valid!244 (LongMap!414) Bool)

(assert (=> start!8380 (= res!31786 (valid!244 thiss!992))))

(assert (=> start!8380 e!37239))

(declare-fun e!37233 () Bool)

(assert (=> start!8380 e!37233))

(assert (=> start!8380 true))

(declare-fun e!37247 () Bool)

(assert (=> start!8380 e!37247))

(declare-fun b!56547 () Bool)

(assert (=> b!56547 (= e!37233 e!37246)))

(declare-fun b!56548 () Bool)

(declare-fun e!37240 () Bool)

(assert (=> b!56548 (= e!37241 e!37240)))

(declare-fun res!31787 () Bool)

(assert (=> b!56548 (=> (not res!31787) (not e!37240))))

(declare-fun contains!674 (ListLongMap!1351 (_ BitVec 64)) Bool)

(assert (=> b!56548 (= res!31787 (contains!674 lt!22299 (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2002 0))(
  ( (tuple2!2003 (_1!1012 Bool) (_2!1012 LongMapFixedSize!600)) )
))
(declare-fun lt!22297 () tuple2!2002)

(declare-fun update!69 (LongMapFixedSize!600 (_ BitVec 64) V!2819) tuple2!2002)

(declare-fun get!1051 (ValueCell!846 V!2819) V!2819)

(declare-fun dynLambda!300 (Int (_ BitVec 64)) V!2819)

(assert (=> b!56548 (= lt!22297 (update!69 newMap!16 (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) (get!1051 (select (arr!1764 (_values!1997 (v!2354 (underlying!218 thiss!992)))) from!355) (dynLambda!300 (defaultEntry!2014 (v!2354 (underlying!218 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!37236 () Bool)

(declare-fun array_inv!1091 (array!3681) Bool)

(declare-fun array_inv!1092 (array!3683) Bool)

(assert (=> b!56549 (= e!37247 (and tp!7877 tp_is_empty!2379 (array_inv!1091 (_keys!3634 newMap!16)) (array_inv!1092 (_values!1997 newMap!16)) e!37236))))

(declare-fun b!56550 () Bool)

(declare-fun res!31788 () Bool)

(assert (=> b!56550 (=> res!31788 e!37243)))

(declare-fun contains!675 (List!1418 (_ BitVec 64)) Bool)

(assert (=> b!56550 (= res!31788 (contains!675 lt!22296 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56551 () Bool)

(declare-fun res!31792 () Bool)

(assert (=> b!56551 (=> (not res!31792) (not e!37239))))

(declare-fun valid!245 (LongMapFixedSize!600) Bool)

(assert (=> b!56551 (= res!31792 (valid!245 newMap!16))))

(declare-fun b!56552 () Bool)

(declare-fun e!37232 () Bool)

(assert (=> b!56552 (= e!37232 tp_is_empty!2379)))

(declare-fun mapNonEmpty!2807 () Bool)

(declare-fun mapRes!2808 () Bool)

(declare-fun tp!7876 () Bool)

(declare-fun e!37244 () Bool)

(assert (=> mapNonEmpty!2807 (= mapRes!2808 (and tp!7876 e!37244))))

(declare-fun mapRest!2808 () (Array (_ BitVec 32) ValueCell!846))

(declare-fun mapKey!2807 () (_ BitVec 32))

(declare-fun mapValue!2808 () ValueCell!846)

(assert (=> mapNonEmpty!2807 (= (arr!1764 (_values!1997 newMap!16)) (store mapRest!2808 mapKey!2807 mapValue!2808))))

(declare-fun b!56553 () Bool)

(assert (=> b!56553 (= e!37240 (not e!37243))))

(declare-fun res!31791 () Bool)

(assert (=> b!56553 (=> res!31791 e!37243)))

(assert (=> b!56553 (= res!31791 (or (bvsge (size!1992 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1992 (_keys!3634 (v!2354 (underlying!218 thiss!992)))))))))

(assert (=> b!56553 (= lt!22296 (Cons!1414 (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) Nil!1415))))

(assert (=> b!56553 (arrayNoDuplicates!0 (_keys!3634 (v!2354 (underlying!218 thiss!992))) from!355 Nil!1415)))

(declare-datatypes ((Unit!1469 0))(
  ( (Unit!1470) )
))
(declare-fun lt!22293 () Unit!1469)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3681 (_ BitVec 32) (_ BitVec 32)) Unit!1469)

(assert (=> b!56553 (= lt!22293 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3634 (v!2354 (underlying!218 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56553 (arrayContainsKey!0 (_keys!3634 (v!2354 (underlying!218 thiss!992))) (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22295 () Unit!1469)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!24 (array!3681 array!3683 (_ BitVec 32) (_ BitVec 32) V!2819 V!2819 (_ BitVec 64) (_ BitVec 32) Int) Unit!1469)

(assert (=> b!56553 (= lt!22295 (lemmaListMapContainsThenArrayContainsFrom!24 (_keys!3634 (v!2354 (underlying!218 thiss!992))) (_values!1997 (v!2354 (underlying!218 thiss!992))) (mask!5883 (v!2354 (underlying!218 thiss!992))) (extraKeys!1905 (v!2354 (underlying!218 thiss!992))) (zeroValue!1932 (v!2354 (underlying!218 thiss!992))) (minValue!1932 (v!2354 (underlying!218 thiss!992))) (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2014 (v!2354 (underlying!218 thiss!992)))))))

(declare-fun b!56554 () Bool)

(assert (=> b!56554 (= e!37243 true)))

(declare-fun lt!22294 () Bool)

(assert (=> b!56554 (= lt!22294 (contains!675 lt!22296 (select (arr!1763 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) from!355)))))

(declare-fun b!56555 () Bool)

(declare-fun res!31785 () Bool)

(assert (=> b!56555 (=> (not res!31785) (not e!37239))))

(assert (=> b!56555 (= res!31785 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5883 newMap!16)) (_size!349 (v!2354 (underlying!218 thiss!992)))))))

(declare-fun b!56556 () Bool)

(assert (=> b!56556 (= e!37244 tp_is_empty!2379)))

(declare-fun b!56557 () Bool)

(assert (=> b!56557 (= e!37236 (and e!37238 mapRes!2808))))

(declare-fun condMapEmpty!2807 () Bool)

(declare-fun mapDefault!2807 () ValueCell!846)

(assert (=> b!56557 (= condMapEmpty!2807 (= (arr!1764 (_values!1997 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!846)) mapDefault!2807)))))

(declare-fun mapIsEmpty!2808 () Bool)

(assert (=> mapIsEmpty!2808 mapRes!2808))

(declare-fun b!56558 () Bool)

(declare-fun res!31793 () Bool)

(assert (=> b!56558 (=> res!31793 e!37243)))

(assert (=> b!56558 (= res!31793 (contains!675 lt!22296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!2808 () Bool)

(declare-fun tp!7878 () Bool)

(assert (=> mapNonEmpty!2808 (= mapRes!2807 (and tp!7878 e!37232))))

(declare-fun mapRest!2807 () (Array (_ BitVec 32) ValueCell!846))

(declare-fun mapKey!2808 () (_ BitVec 32))

(declare-fun mapValue!2807 () ValueCell!846)

(assert (=> mapNonEmpty!2808 (= (arr!1764 (_values!1997 (v!2354 (underlying!218 thiss!992)))) (store mapRest!2807 mapKey!2808 mapValue!2807))))

(assert (=> b!56559 (= e!37237 (and tp!7875 tp_is_empty!2379 (array_inv!1091 (_keys!3634 (v!2354 (underlying!218 thiss!992)))) (array_inv!1092 (_values!1997 (v!2354 (underlying!218 thiss!992)))) e!37245))))

(declare-fun b!56560 () Bool)

(assert (=> b!56560 (= e!37234 tp_is_empty!2379)))

(assert (= (and start!8380 res!31786) b!56544))

(assert (= (and b!56544 res!31790) b!56551))

(assert (= (and b!56551 res!31792) b!56555))

(assert (= (and b!56555 res!31785) b!56543))

(assert (= (and b!56543 res!31784) b!56548))

(assert (= (and b!56548 res!31787) b!56553))

(assert (= (and b!56553 (not res!31791)) b!56540))

(assert (= (and b!56540 (not res!31783)) b!56558))

(assert (= (and b!56558 (not res!31793)) b!56550))

(assert (= (and b!56550 (not res!31788)) b!56546))

(assert (= (and b!56546 (not res!31789)) b!56554))

(assert (= (and b!56542 condMapEmpty!2808) mapIsEmpty!2807))

(assert (= (and b!56542 (not condMapEmpty!2808)) mapNonEmpty!2808))

(get-info :version)

(assert (= (and mapNonEmpty!2808 ((_ is ValueCellFull!846) mapValue!2807)) b!56552))

(assert (= (and b!56542 ((_ is ValueCellFull!846) mapDefault!2808)) b!56560))

(assert (= b!56559 b!56542))

(assert (= b!56541 b!56559))

(assert (= b!56547 b!56541))

(assert (= start!8380 b!56547))

(assert (= (and b!56557 condMapEmpty!2807) mapIsEmpty!2808))

(assert (= (and b!56557 (not condMapEmpty!2807)) mapNonEmpty!2807))

(assert (= (and mapNonEmpty!2807 ((_ is ValueCellFull!846) mapValue!2808)) b!56556))

(assert (= (and b!56557 ((_ is ValueCellFull!846) mapDefault!2807)) b!56545))

(assert (= b!56549 b!56557))

(assert (= start!8380 b!56549))

(declare-fun b_lambda!2473 () Bool)

(assert (=> (not b_lambda!2473) (not b!56548)))

(declare-fun t!4709 () Bool)

(declare-fun tb!1269 () Bool)

(assert (=> (and b!56559 (= (defaultEntry!2014 (v!2354 (underlying!218 thiss!992))) (defaultEntry!2014 (v!2354 (underlying!218 thiss!992)))) t!4709) tb!1269))

(declare-fun result!2301 () Bool)

(assert (=> tb!1269 (= result!2301 tp_is_empty!2379)))

(assert (=> b!56548 t!4709))

(declare-fun b_and!3395 () Bool)

(assert (= b_and!3391 (and (=> t!4709 result!2301) b_and!3395)))

(declare-fun t!4711 () Bool)

(declare-fun tb!1271 () Bool)

(assert (=> (and b!56549 (= (defaultEntry!2014 newMap!16) (defaultEntry!2014 (v!2354 (underlying!218 thiss!992)))) t!4711) tb!1271))

(declare-fun result!2305 () Bool)

(assert (= result!2305 result!2301))

(assert (=> b!56548 t!4711))

(declare-fun b_and!3397 () Bool)

(assert (= b_and!3393 (and (=> t!4711 result!2305) b_and!3397)))

(declare-fun m!47605 () Bool)

(assert (=> b!56553 m!47605))

(declare-fun m!47607 () Bool)

(assert (=> b!56553 m!47607))

(declare-fun m!47609 () Bool)

(assert (=> b!56553 m!47609))

(declare-fun m!47611 () Bool)

(assert (=> b!56553 m!47611))

(assert (=> b!56553 m!47609))

(assert (=> b!56553 m!47609))

(declare-fun m!47613 () Bool)

(assert (=> b!56553 m!47613))

(declare-fun m!47615 () Bool)

(assert (=> b!56551 m!47615))

(declare-fun m!47617 () Bool)

(assert (=> mapNonEmpty!2808 m!47617))

(declare-fun m!47619 () Bool)

(assert (=> mapNonEmpty!2807 m!47619))

(declare-fun m!47621 () Bool)

(assert (=> b!56559 m!47621))

(declare-fun m!47623 () Bool)

(assert (=> b!56559 m!47623))

(declare-fun m!47625 () Bool)

(assert (=> b!56549 m!47625))

(declare-fun m!47627 () Bool)

(assert (=> b!56549 m!47627))

(declare-fun m!47629 () Bool)

(assert (=> start!8380 m!47629))

(assert (=> b!56543 m!47609))

(declare-fun m!47631 () Bool)

(assert (=> b!56543 m!47631))

(declare-fun m!47633 () Bool)

(assert (=> b!56543 m!47633))

(declare-fun m!47635 () Bool)

(assert (=> b!56558 m!47635))

(assert (=> b!56554 m!47609))

(assert (=> b!56554 m!47609))

(declare-fun m!47637 () Bool)

(assert (=> b!56554 m!47637))

(declare-fun m!47639 () Bool)

(assert (=> b!56546 m!47639))

(declare-fun m!47641 () Bool)

(assert (=> b!56540 m!47641))

(declare-fun m!47643 () Bool)

(assert (=> b!56548 m!47643))

(declare-fun m!47645 () Bool)

(assert (=> b!56548 m!47645))

(declare-fun m!47647 () Bool)

(assert (=> b!56548 m!47647))

(assert (=> b!56548 m!47609))

(assert (=> b!56548 m!47645))

(assert (=> b!56548 m!47609))

(declare-fun m!47649 () Bool)

(assert (=> b!56548 m!47649))

(assert (=> b!56548 m!47609))

(assert (=> b!56548 m!47647))

(declare-fun m!47651 () Bool)

(assert (=> b!56548 m!47651))

(assert (=> b!56548 m!47643))

(declare-fun m!47653 () Bool)

(assert (=> b!56550 m!47653))

(check-sat (not b!56549) (not b!56550) (not b_lambda!2473) (not b!56540) (not b!56554) b_and!3397 (not start!8380) (not b!56551) (not b!56559) (not b_next!1927) (not b!56558) (not b_next!1925) (not b!56548) (not b!56546) b_and!3395 (not b!56543) (not mapNonEmpty!2807) (not mapNonEmpty!2808) (not b!56553) tp_is_empty!2379)
(check-sat b_and!3395 b_and!3397 (not b_next!1925) (not b_next!1927))
