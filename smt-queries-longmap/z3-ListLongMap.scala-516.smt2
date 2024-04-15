; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12954 () Bool)

(assert start!12954)

(declare-fun b!112626 () Bool)

(declare-fun b_free!2581 () Bool)

(declare-fun b_next!2581 () Bool)

(assert (=> b!112626 (= b_free!2581 (not b_next!2581))))

(declare-fun tp!10096 () Bool)

(declare-fun b_and!6909 () Bool)

(assert (=> b!112626 (= tp!10096 b_and!6909)))

(declare-fun b!112621 () Bool)

(declare-fun b_free!2583 () Bool)

(declare-fun b_next!2583 () Bool)

(assert (=> b!112621 (= b_free!2583 (not b_next!2583))))

(declare-fun tp!10097 () Bool)

(declare-fun b_and!6911 () Bool)

(assert (=> b!112621 (= tp!10097 b_and!6911)))

(declare-fun b!112615 () Bool)

(declare-fun e!73203 () Bool)

(declare-fun tp_is_empty!2707 () Bool)

(assert (=> b!112615 (= e!73203 tp_is_empty!2707)))

(declare-fun res!55538 () Bool)

(declare-fun e!73198 () Bool)

(assert (=> start!12954 (=> (not res!55538) (not e!73198))))

(declare-datatypes ((V!3257 0))(
  ( (V!3258 (val!1398 Int)) )
))
(declare-datatypes ((array!4393 0))(
  ( (array!4394 (arr!2080 (Array (_ BitVec 32) (_ BitVec 64))) (size!2340 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1010 0))(
  ( (ValueCellFull!1010 (v!2948 V!3257)) (EmptyCell!1010) )
))
(declare-datatypes ((array!4395 0))(
  ( (array!4396 (arr!2081 (Array (_ BitVec 32) ValueCell!1010)) (size!2341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!928 0))(
  ( (LongMapFixedSize!929 (defaultEntry!2660 Int) (mask!6843 (_ BitVec 32)) (extraKeys!2451 (_ BitVec 32)) (zeroValue!2528 V!3257) (minValue!2528 V!3257) (_size!513 (_ BitVec 32)) (_keys!4379 array!4393) (_values!2643 array!4395) (_vacant!513 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!716 0))(
  ( (Cell!717 (v!2949 LongMapFixedSize!928)) )
))
(declare-datatypes ((LongMap!716 0))(
  ( (LongMap!717 (underlying!369 Cell!716)) )
))
(declare-fun thiss!992 () LongMap!716)

(declare-fun valid!434 (LongMap!716) Bool)

(assert (=> start!12954 (= res!55538 (valid!434 thiss!992))))

(assert (=> start!12954 e!73198))

(declare-fun e!73194 () Bool)

(assert (=> start!12954 e!73194))

(assert (=> start!12954 true))

(declare-fun e!73206 () Bool)

(assert (=> start!12954 e!73206))

(declare-fun b!112616 () Bool)

(declare-fun e!73191 () Bool)

(declare-datatypes ((List!1632 0))(
  ( (Nil!1629) (Cons!1628 (h!2228 (_ BitVec 64)) (t!5797 List!1632)) )
))
(declare-fun arrayNoDuplicates!0 (array!4393 (_ BitVec 32) List!1632) Bool)

(assert (=> b!112616 (= e!73191 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 Nil!1629))))

(declare-fun b!112617 () Bool)

(declare-fun e!73195 () Bool)

(declare-fun mapRes!4044 () Bool)

(assert (=> b!112617 (= e!73195 (and e!73203 mapRes!4044))))

(declare-fun condMapEmpty!4043 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!928)

(declare-fun mapDefault!4044 () ValueCell!1010)

(assert (=> b!112617 (= condMapEmpty!4043 (= (arr!2081 (_values!2643 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4044)))))

(declare-fun b!112618 () Bool)

(declare-fun res!55545 () Bool)

(assert (=> b!112618 (=> (not res!55545) (not e!73198))))

(assert (=> b!112618 (= res!55545 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6843 newMap!16)) (_size!513 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!112619 () Bool)

(declare-fun res!55544 () Bool)

(assert (=> b!112619 (=> res!55544 e!73191)))

(assert (=> b!112619 (= res!55544 (or (not (= (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6843 (v!2949 (underlying!369 thiss!992)))))) (not (= (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992)))))) (bvslt (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!112620 () Bool)

(declare-fun e!73201 () Bool)

(assert (=> b!112620 (= e!73201 (not e!73191))))

(declare-fun res!55546 () Bool)

(assert (=> b!112620 (=> res!55546 e!73191)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!112620 (= res!55546 (not (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))))

(declare-datatypes ((tuple2!2410 0))(
  ( (tuple2!2411 (_1!1216 (_ BitVec 64)) (_2!1216 V!3257)) )
))
(declare-datatypes ((List!1633 0))(
  ( (Nil!1630) (Cons!1629 (h!2229 tuple2!2410) (t!5798 List!1633)) )
))
(declare-datatypes ((ListLongMap!1561 0))(
  ( (ListLongMap!1562 (toList!796 List!1633)) )
))
(declare-fun lt!58288 () ListLongMap!1561)

(declare-fun lt!58285 () tuple2!2410)

(declare-fun lt!58284 () tuple2!2410)

(declare-fun +!142 (ListLongMap!1561 tuple2!2410) ListLongMap!1561)

(assert (=> b!112620 (= (+!142 (+!142 lt!58288 lt!58285) lt!58284) (+!142 (+!142 lt!58288 lt!58284) lt!58285))))

(assert (=> b!112620 (= lt!58284 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!58293 () V!3257)

(assert (=> b!112620 (= lt!58285 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))

(declare-datatypes ((Unit!3503 0))(
  ( (Unit!3504) )
))
(declare-fun lt!58290 () Unit!3503)

(declare-fun addCommutativeForDiffKeys!54 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64) V!3257) Unit!3503)

(assert (=> b!112620 (= lt!58290 (addCommutativeForDiffKeys!54 lt!58288 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!107 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) ListLongMap!1561)

(assert (=> b!112620 (= lt!58288 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun mapIsEmpty!4043 () Bool)

(declare-fun mapRes!4043 () Bool)

(assert (=> mapIsEmpty!4043 mapRes!4043))

(declare-fun array_inv!1315 (array!4393) Bool)

(declare-fun array_inv!1316 (array!4395) Bool)

(assert (=> b!112621 (= e!73206 (and tp!10097 tp_is_empty!2707 (array_inv!1315 (_keys!4379 newMap!16)) (array_inv!1316 (_values!2643 newMap!16)) e!73195))))

(declare-fun b!112622 () Bool)

(declare-fun e!73205 () Bool)

(assert (=> b!112622 (= e!73198 e!73205)))

(declare-fun res!55547 () Bool)

(assert (=> b!112622 (=> (not res!55547) (not e!73205))))

(declare-fun lt!58291 () ListLongMap!1561)

(declare-fun lt!58287 () ListLongMap!1561)

(assert (=> b!112622 (= res!55547 (= lt!58291 lt!58287))))

(declare-fun map!1288 (LongMapFixedSize!928) ListLongMap!1561)

(assert (=> b!112622 (= lt!58287 (map!1288 newMap!16))))

(declare-fun getCurrentListMap!472 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) ListLongMap!1561)

(assert (=> b!112622 (= lt!58291 (getCurrentListMap!472 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun mapIsEmpty!4044 () Bool)

(assert (=> mapIsEmpty!4044 mapRes!4044))

(declare-fun b!112623 () Bool)

(declare-fun e!73204 () Bool)

(assert (=> b!112623 (= e!73205 e!73204)))

(declare-fun res!55540 () Bool)

(assert (=> b!112623 (=> (not res!55540) (not e!73204))))

(assert (=> b!112623 (= res!55540 (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1359 (ValueCell!1010 V!3257) V!3257)

(declare-fun dynLambda!389 (Int (_ BitVec 64)) V!3257)

(assert (=> b!112623 (= lt!58293 (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!4043 () Bool)

(declare-fun tp!10098 () Bool)

(declare-fun e!73196 () Bool)

(assert (=> mapNonEmpty!4043 (= mapRes!4044 (and tp!10098 e!73196))))

(declare-fun mapKey!4044 () (_ BitVec 32))

(declare-fun mapValue!4043 () ValueCell!1010)

(declare-fun mapRest!4043 () (Array (_ BitVec 32) ValueCell!1010))

(assert (=> mapNonEmpty!4043 (= (arr!2081 (_values!2643 newMap!16)) (store mapRest!4043 mapKey!4044 mapValue!4043))))

(declare-fun b!112624 () Bool)

(declare-fun res!55541 () Bool)

(assert (=> b!112624 (=> (not res!55541) (not e!73198))))

(assert (=> b!112624 (= res!55541 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun b!112625 () Bool)

(declare-fun e!73208 () Bool)

(assert (=> b!112625 (= e!73208 tp_is_empty!2707)))

(declare-fun e!73200 () Bool)

(declare-fun e!73192 () Bool)

(assert (=> b!112626 (= e!73192 (and tp!10096 tp_is_empty!2707 (array_inv!1315 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (array_inv!1316 (_values!2643 (v!2949 (underlying!369 thiss!992)))) e!73200))))

(declare-fun b!112627 () Bool)

(declare-fun e!73199 () Bool)

(assert (=> b!112627 (= e!73194 e!73199)))

(declare-fun b!112628 () Bool)

(assert (=> b!112628 (= e!73204 e!73201)))

(declare-fun res!55539 () Bool)

(assert (=> b!112628 (=> (not res!55539) (not e!73201))))

(declare-datatypes ((tuple2!2412 0))(
  ( (tuple2!2413 (_1!1217 Bool) (_2!1217 LongMapFixedSize!928)) )
))
(declare-fun lt!58292 () tuple2!2412)

(assert (=> b!112628 (= res!55539 (and (_1!1217 lt!58292) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!58286 () Unit!3503)

(declare-fun e!73207 () Unit!3503)

(assert (=> b!112628 (= lt!58286 e!73207)))

(declare-fun c!20140 () Bool)

(declare-fun contains!834 (ListLongMap!1561 (_ BitVec 64)) Bool)

(assert (=> b!112628 (= c!20140 (contains!834 lt!58287 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun update!165 (LongMapFixedSize!928 (_ BitVec 64) V!3257) tuple2!2412)

(assert (=> b!112628 (= lt!58292 (update!165 newMap!16 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))

(declare-fun b!112629 () Bool)

(assert (=> b!112629 (= e!73199 e!73192)))

(declare-fun mapNonEmpty!4044 () Bool)

(declare-fun tp!10095 () Bool)

(assert (=> mapNonEmpty!4044 (= mapRes!4043 (and tp!10095 e!73208))))

(declare-fun mapRest!4044 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapKey!4043 () (_ BitVec 32))

(declare-fun mapValue!4044 () ValueCell!1010)

(assert (=> mapNonEmpty!4044 (= (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (store mapRest!4044 mapKey!4043 mapValue!4044))))

(declare-fun b!112630 () Bool)

(declare-fun Unit!3505 () Unit!3503)

(assert (=> b!112630 (= e!73207 Unit!3505)))

(declare-fun lt!58294 () Unit!3503)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!117 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3503)

(assert (=> b!112630 (= lt!58294 (lemmaListMapContainsThenArrayContainsFrom!117 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!112630 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!58289 () Unit!3503)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4393 (_ BitVec 32) (_ BitVec 32)) Unit!3503)

(assert (=> b!112630 (= lt!58289 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!112630 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) from!355 Nil!1629)))

(declare-fun lt!58295 () Unit!3503)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4393 (_ BitVec 32) (_ BitVec 64) List!1632) Unit!3503)

(assert (=> b!112630 (= lt!58295 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629)))))

(assert (=> b!112630 false))

(declare-fun b!112631 () Bool)

(assert (=> b!112631 (= e!73196 tp_is_empty!2707)))

(declare-fun b!112632 () Bool)

(declare-fun res!55543 () Bool)

(assert (=> b!112632 (=> (not res!55543) (not e!73198))))

(declare-fun valid!435 (LongMapFixedSize!928) Bool)

(assert (=> b!112632 (= res!55543 (valid!435 newMap!16))))

(declare-fun b!112633 () Bool)

(declare-fun Unit!3506 () Unit!3503)

(assert (=> b!112633 (= e!73207 Unit!3506)))

(declare-fun b!112634 () Bool)

(declare-fun res!55542 () Bool)

(assert (=> b!112634 (=> res!55542 e!73191)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4393 (_ BitVec 32)) Bool)

(assert (=> b!112634 (= res!55542 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!112635 () Bool)

(declare-fun e!73197 () Bool)

(assert (=> b!112635 (= e!73200 (and e!73197 mapRes!4043))))

(declare-fun condMapEmpty!4044 () Bool)

(declare-fun mapDefault!4043 () ValueCell!1010)

(assert (=> b!112635 (= condMapEmpty!4044 (= (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4043)))))

(declare-fun b!112636 () Bool)

(assert (=> b!112636 (= e!73197 tp_is_empty!2707)))

(assert (= (and start!12954 res!55538) b!112624))

(assert (= (and b!112624 res!55541) b!112632))

(assert (= (and b!112632 res!55543) b!112618))

(assert (= (and b!112618 res!55545) b!112622))

(assert (= (and b!112622 res!55547) b!112623))

(assert (= (and b!112623 res!55540) b!112628))

(assert (= (and b!112628 c!20140) b!112630))

(assert (= (and b!112628 (not c!20140)) b!112633))

(assert (= (and b!112628 res!55539) b!112620))

(assert (= (and b!112620 (not res!55546)) b!112619))

(assert (= (and b!112619 (not res!55544)) b!112634))

(assert (= (and b!112634 (not res!55542)) b!112616))

(assert (= (and b!112635 condMapEmpty!4044) mapIsEmpty!4043))

(assert (= (and b!112635 (not condMapEmpty!4044)) mapNonEmpty!4044))

(get-info :version)

(assert (= (and mapNonEmpty!4044 ((_ is ValueCellFull!1010) mapValue!4044)) b!112625))

(assert (= (and b!112635 ((_ is ValueCellFull!1010) mapDefault!4043)) b!112636))

(assert (= b!112626 b!112635))

(assert (= b!112629 b!112626))

(assert (= b!112627 b!112629))

(assert (= start!12954 b!112627))

(assert (= (and b!112617 condMapEmpty!4043) mapIsEmpty!4044))

(assert (= (and b!112617 (not condMapEmpty!4043)) mapNonEmpty!4043))

(assert (= (and mapNonEmpty!4043 ((_ is ValueCellFull!1010) mapValue!4043)) b!112631))

(assert (= (and b!112617 ((_ is ValueCellFull!1010) mapDefault!4044)) b!112615))

(assert (= b!112621 b!112617))

(assert (= start!12954 b!112621))

(declare-fun b_lambda!5043 () Bool)

(assert (=> (not b_lambda!5043) (not b!112623)))

(declare-fun t!5794 () Bool)

(declare-fun tb!2129 () Bool)

(assert (=> (and b!112626 (= (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) t!5794) tb!2129))

(declare-fun result!3565 () Bool)

(assert (=> tb!2129 (= result!3565 tp_is_empty!2707)))

(assert (=> b!112623 t!5794))

(declare-fun b_and!6913 () Bool)

(assert (= b_and!6909 (and (=> t!5794 result!3565) b_and!6913)))

(declare-fun tb!2131 () Bool)

(declare-fun t!5796 () Bool)

(assert (=> (and b!112621 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) t!5796) tb!2131))

(declare-fun result!3569 () Bool)

(assert (= result!3569 result!3565))

(assert (=> b!112623 t!5796))

(declare-fun b_and!6915 () Bool)

(assert (= b_and!6911 (and (=> t!5796 result!3569) b_and!6915)))

(declare-fun m!128507 () Bool)

(assert (=> b!112630 m!128507))

(declare-fun m!128509 () Bool)

(assert (=> b!112630 m!128509))

(declare-fun m!128511 () Bool)

(assert (=> b!112630 m!128511))

(declare-fun m!128513 () Bool)

(assert (=> b!112630 m!128513))

(assert (=> b!112630 m!128511))

(assert (=> b!112630 m!128511))

(declare-fun m!128515 () Bool)

(assert (=> b!112630 m!128515))

(assert (=> b!112630 m!128511))

(declare-fun m!128517 () Bool)

(assert (=> b!112630 m!128517))

(declare-fun m!128519 () Bool)

(assert (=> b!112634 m!128519))

(declare-fun m!128521 () Bool)

(assert (=> mapNonEmpty!4044 m!128521))

(declare-fun m!128523 () Bool)

(assert (=> b!112626 m!128523))

(declare-fun m!128525 () Bool)

(assert (=> b!112626 m!128525))

(declare-fun m!128527 () Bool)

(assert (=> b!112622 m!128527))

(declare-fun m!128529 () Bool)

(assert (=> b!112622 m!128529))

(declare-fun m!128531 () Bool)

(assert (=> b!112620 m!128531))

(assert (=> b!112620 m!128511))

(declare-fun m!128533 () Bool)

(assert (=> b!112620 m!128533))

(declare-fun m!128535 () Bool)

(assert (=> b!112620 m!128535))

(declare-fun m!128537 () Bool)

(assert (=> b!112620 m!128537))

(declare-fun m!128539 () Bool)

(assert (=> b!112620 m!128539))

(assert (=> b!112620 m!128511))

(assert (=> b!112620 m!128537))

(assert (=> b!112620 m!128531))

(declare-fun m!128541 () Bool)

(assert (=> b!112620 m!128541))

(declare-fun m!128543 () Bool)

(assert (=> b!112620 m!128543))

(declare-fun m!128545 () Bool)

(assert (=> start!12954 m!128545))

(assert (=> b!112628 m!128511))

(assert (=> b!112628 m!128511))

(declare-fun m!128547 () Bool)

(assert (=> b!112628 m!128547))

(assert (=> b!112628 m!128511))

(declare-fun m!128549 () Bool)

(assert (=> b!112628 m!128549))

(declare-fun m!128551 () Bool)

(assert (=> b!112616 m!128551))

(declare-fun m!128553 () Bool)

(assert (=> mapNonEmpty!4043 m!128553))

(declare-fun m!128555 () Bool)

(assert (=> b!112621 m!128555))

(declare-fun m!128557 () Bool)

(assert (=> b!112621 m!128557))

(declare-fun m!128559 () Bool)

(assert (=> b!112632 m!128559))

(assert (=> b!112623 m!128511))

(declare-fun m!128561 () Bool)

(assert (=> b!112623 m!128561))

(declare-fun m!128563 () Bool)

(assert (=> b!112623 m!128563))

(assert (=> b!112623 m!128561))

(assert (=> b!112623 m!128563))

(declare-fun m!128565 () Bool)

(assert (=> b!112623 m!128565))

(check-sat (not b_next!2583) (not mapNonEmpty!4044) (not b!112622) (not b!112616) (not b!112621) (not b!112626) (not b!112630) (not start!12954) (not b!112634) b_and!6915 (not b!112628) (not b!112620) (not mapNonEmpty!4043) tp_is_empty!2707 (not b_next!2581) b_and!6913 (not b!112632) (not b_lambda!5043) (not b!112623))
(check-sat b_and!6913 b_and!6915 (not b_next!2581) (not b_next!2583))
(get-model)

(declare-fun b_lambda!5049 () Bool)

(assert (= b_lambda!5043 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5049)))

(check-sat (not b_next!2583) (not mapNonEmpty!4044) (not b!112622) (not b!112616) (not b!112621) (not b!112626) (not b!112630) (not start!12954) (not b!112634) b_and!6915 (not b!112628) (not b_lambda!5049) (not b!112620) (not mapNonEmpty!4043) tp_is_empty!2707 (not b_next!2581) b_and!6913 (not b!112632) (not b!112623))
(check-sat b_and!6913 b_and!6915 (not b_next!2581) (not b_next!2583))
(get-model)

(declare-fun d!32029 () Bool)

(assert (=> d!32029 (= (+!142 (+!142 lt!58288 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (+!142 (+!142 lt!58288 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))

(declare-fun lt!58370 () Unit!3503)

(declare-fun choose!717 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64) V!3257) Unit!3503)

(assert (=> d!32029 (= lt!58370 (choose!717 lt!58288 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))

(assert (=> d!32029 (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32029 (= (addCommutativeForDiffKeys!54 lt!58288 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) lt!58370)))

(declare-fun bs!4630 () Bool)

(assert (= bs!4630 d!32029))

(declare-fun m!128687 () Bool)

(assert (=> bs!4630 m!128687))

(declare-fun m!128689 () Bool)

(assert (=> bs!4630 m!128689))

(assert (=> bs!4630 m!128511))

(declare-fun m!128691 () Bool)

(assert (=> bs!4630 m!128691))

(declare-fun m!128693 () Bool)

(assert (=> bs!4630 m!128693))

(assert (=> bs!4630 m!128693))

(declare-fun m!128695 () Bool)

(assert (=> bs!4630 m!128695))

(assert (=> bs!4630 m!128687))

(assert (=> b!112620 d!32029))

(declare-fun d!32031 () Bool)

(declare-fun e!73319 () Bool)

(assert (=> d!32031 e!73319))

(declare-fun res!55613 () Bool)

(assert (=> d!32031 (=> (not res!55613) (not e!73319))))

(declare-fun lt!58379 () ListLongMap!1561)

(assert (=> d!32031 (= res!55613 (contains!834 lt!58379 (_1!1216 lt!58285)))))

(declare-fun lt!58382 () List!1633)

(assert (=> d!32031 (= lt!58379 (ListLongMap!1562 lt!58382))))

(declare-fun lt!58381 () Unit!3503)

(declare-fun lt!58380 () Unit!3503)

(assert (=> d!32031 (= lt!58381 lt!58380)))

(declare-datatypes ((Option!164 0))(
  ( (Some!163 (v!2955 V!3257)) (None!162) )
))
(declare-fun getValueByKey!158 (List!1633 (_ BitVec 64)) Option!164)

(assert (=> d!32031 (= (getValueByKey!158 lt!58382 (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285)))))

(declare-fun lemmaContainsTupThenGetReturnValue!77 (List!1633 (_ BitVec 64) V!3257) Unit!3503)

(assert (=> d!32031 (= lt!58380 (lemmaContainsTupThenGetReturnValue!77 lt!58382 (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(declare-fun insertStrictlySorted!80 (List!1633 (_ BitVec 64) V!3257) List!1633)

(assert (=> d!32031 (= lt!58382 (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(assert (=> d!32031 (= (+!142 lt!58288 lt!58285) lt!58379)))

(declare-fun b!112779 () Bool)

(declare-fun res!55612 () Bool)

(assert (=> b!112779 (=> (not res!55612) (not e!73319))))

(assert (=> b!112779 (= res!55612 (= (getValueByKey!158 (toList!796 lt!58379) (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285))))))

(declare-fun b!112780 () Bool)

(declare-fun contains!835 (List!1633 tuple2!2410) Bool)

(assert (=> b!112780 (= e!73319 (contains!835 (toList!796 lt!58379) lt!58285))))

(assert (= (and d!32031 res!55613) b!112779))

(assert (= (and b!112779 res!55612) b!112780))

(declare-fun m!128697 () Bool)

(assert (=> d!32031 m!128697))

(declare-fun m!128699 () Bool)

(assert (=> d!32031 m!128699))

(declare-fun m!128701 () Bool)

(assert (=> d!32031 m!128701))

(declare-fun m!128703 () Bool)

(assert (=> d!32031 m!128703))

(declare-fun m!128705 () Bool)

(assert (=> b!112779 m!128705))

(declare-fun m!128707 () Bool)

(assert (=> b!112780 m!128707))

(assert (=> b!112620 d!32031))

(declare-fun d!32033 () Bool)

(declare-fun e!73337 () Bool)

(assert (=> d!32033 e!73337))

(declare-fun res!55622 () Bool)

(assert (=> d!32033 (=> (not res!55622) (not e!73337))))

(declare-fun lt!58399 () ListLongMap!1561)

(assert (=> d!32033 (= res!55622 (not (contains!834 lt!58399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!73340 () ListLongMap!1561)

(assert (=> d!32033 (= lt!58399 e!73340)))

(declare-fun c!20156 () Bool)

(assert (=> d!32033 (= c!20156 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32033 (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32033 (= (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) lt!58399)))

(declare-fun b!112805 () Bool)

(declare-fun e!73335 () Bool)

(declare-fun e!73339 () Bool)

(assert (=> b!112805 (= e!73335 e!73339)))

(declare-fun c!20155 () Bool)

(assert (=> b!112805 (= c!20155 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!112806 () Bool)

(declare-fun lt!58400 () Unit!3503)

(declare-fun lt!58402 () Unit!3503)

(assert (=> b!112806 (= lt!58400 lt!58402)))

(declare-fun lt!58403 () (_ BitVec 64))

(declare-fun lt!58397 () ListLongMap!1561)

(declare-fun lt!58401 () V!3257)

(declare-fun lt!58398 () (_ BitVec 64))

(assert (=> b!112806 (not (contains!834 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401)) lt!58398))))

(declare-fun addStillNotContains!51 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> b!112806 (= lt!58402 (addStillNotContains!51 lt!58397 lt!58403 lt!58401 lt!58398))))

(assert (=> b!112806 (= lt!58398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!112806 (= lt!58401 (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112806 (= lt!58403 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!12089 () ListLongMap!1561)

(assert (=> b!112806 (= lt!58397 call!12089)))

(declare-fun e!73338 () ListLongMap!1561)

(assert (=> b!112806 (= e!73338 (+!142 call!12089 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!112807 () Bool)

(assert (=> b!112807 (= e!73340 (ListLongMap!1562 Nil!1630))))

(declare-fun b!112808 () Bool)

(assert (=> b!112808 (= e!73337 e!73335)))

(declare-fun c!20157 () Bool)

(declare-fun e!73336 () Bool)

(assert (=> b!112808 (= c!20157 e!73336)))

(declare-fun res!55624 () Bool)

(assert (=> b!112808 (=> (not res!55624) (not e!73336))))

(assert (=> b!112808 (= res!55624 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!112809 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!112809 (= e!73336 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112809 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!112810 () Bool)

(assert (=> b!112810 (= e!73338 call!12089)))

(declare-fun b!112811 () Bool)

(declare-fun e!73334 () Bool)

(assert (=> b!112811 (= e!73335 e!73334)))

(assert (=> b!112811 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun res!55623 () Bool)

(assert (=> b!112811 (= res!55623 (contains!834 lt!58399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112811 (=> (not res!55623) (not e!73334))))

(declare-fun bm!12086 () Bool)

(assert (=> bm!12086 (= call!12089 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!112812 () Bool)

(assert (=> b!112812 (= e!73339 (= lt!58399 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!112813 () Bool)

(declare-fun isEmpty!386 (ListLongMap!1561) Bool)

(assert (=> b!112813 (= e!73339 (isEmpty!386 lt!58399))))

(declare-fun b!112814 () Bool)

(declare-fun res!55625 () Bool)

(assert (=> b!112814 (=> (not res!55625) (not e!73337))))

(assert (=> b!112814 (= res!55625 (not (contains!834 lt!58399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!112815 () Bool)

(assert (=> b!112815 (= e!73340 e!73338)))

(declare-fun c!20158 () Bool)

(assert (=> b!112815 (= c!20158 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!112816 () Bool)

(assert (=> b!112816 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> b!112816 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun apply!102 (ListLongMap!1561 (_ BitVec 64)) V!3257)

(assert (=> b!112816 (= e!73334 (= (apply!102 lt!58399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!32033 c!20156) b!112807))

(assert (= (and d!32033 (not c!20156)) b!112815))

(assert (= (and b!112815 c!20158) b!112806))

(assert (= (and b!112815 (not c!20158)) b!112810))

(assert (= (or b!112806 b!112810) bm!12086))

(assert (= (and d!32033 res!55622) b!112814))

(assert (= (and b!112814 res!55625) b!112808))

(assert (= (and b!112808 res!55624) b!112809))

(assert (= (and b!112808 c!20157) b!112811))

(assert (= (and b!112808 (not c!20157)) b!112805))

(assert (= (and b!112811 res!55623) b!112816))

(assert (= (and b!112805 c!20155) b!112812))

(assert (= (and b!112805 (not c!20155)) b!112813))

(declare-fun b_lambda!5051 () Bool)

(assert (=> (not b_lambda!5051) (not b!112806)))

(assert (=> b!112806 t!5794))

(declare-fun b_and!6933 () Bool)

(assert (= b_and!6913 (and (=> t!5794 result!3565) b_and!6933)))

(assert (=> b!112806 t!5796))

(declare-fun b_and!6935 () Bool)

(assert (= b_and!6915 (and (=> t!5796 result!3569) b_and!6935)))

(declare-fun b_lambda!5053 () Bool)

(assert (=> (not b_lambda!5053) (not b!112816)))

(assert (=> b!112816 t!5794))

(declare-fun b_and!6937 () Bool)

(assert (= b_and!6933 (and (=> t!5794 result!3565) b_and!6937)))

(assert (=> b!112816 t!5796))

(declare-fun b_and!6939 () Bool)

(assert (= b_and!6935 (and (=> t!5796 result!3569) b_and!6939)))

(declare-fun m!128709 () Bool)

(assert (=> b!112815 m!128709))

(assert (=> b!112815 m!128709))

(declare-fun m!128711 () Bool)

(assert (=> b!112815 m!128711))

(declare-fun m!128713 () Bool)

(assert (=> bm!12086 m!128713))

(assert (=> b!112811 m!128709))

(assert (=> b!112811 m!128709))

(declare-fun m!128715 () Bool)

(assert (=> b!112811 m!128715))

(assert (=> b!112806 m!128709))

(declare-fun m!128717 () Bool)

(assert (=> b!112806 m!128717))

(declare-fun m!128719 () Bool)

(assert (=> b!112806 m!128719))

(assert (=> b!112806 m!128717))

(declare-fun m!128721 () Bool)

(assert (=> b!112806 m!128721))

(declare-fun m!128723 () Bool)

(assert (=> b!112806 m!128723))

(assert (=> b!112806 m!128563))

(declare-fun m!128725 () Bool)

(assert (=> b!112806 m!128725))

(assert (=> b!112806 m!128721))

(assert (=> b!112806 m!128563))

(declare-fun m!128727 () Bool)

(assert (=> b!112806 m!128727))

(assert (=> b!112812 m!128713))

(declare-fun m!128729 () Bool)

(assert (=> b!112814 m!128729))

(assert (=> b!112816 m!128709))

(assert (=> b!112816 m!128721))

(assert (=> b!112816 m!128563))

(assert (=> b!112816 m!128727))

(assert (=> b!112816 m!128721))

(assert (=> b!112816 m!128709))

(declare-fun m!128731 () Bool)

(assert (=> b!112816 m!128731))

(assert (=> b!112816 m!128563))

(assert (=> b!112809 m!128709))

(assert (=> b!112809 m!128709))

(assert (=> b!112809 m!128711))

(declare-fun m!128733 () Bool)

(assert (=> b!112813 m!128733))

(declare-fun m!128735 () Bool)

(assert (=> d!32033 m!128735))

(assert (=> d!32033 m!128535))

(assert (=> b!112620 d!32033))

(declare-fun d!32035 () Bool)

(declare-fun e!73341 () Bool)

(assert (=> d!32035 e!73341))

(declare-fun res!55627 () Bool)

(assert (=> d!32035 (=> (not res!55627) (not e!73341))))

(declare-fun lt!58404 () ListLongMap!1561)

(assert (=> d!32035 (= res!55627 (contains!834 lt!58404 (_1!1216 lt!58284)))))

(declare-fun lt!58407 () List!1633)

(assert (=> d!32035 (= lt!58404 (ListLongMap!1562 lt!58407))))

(declare-fun lt!58406 () Unit!3503)

(declare-fun lt!58405 () Unit!3503)

(assert (=> d!32035 (= lt!58406 lt!58405)))

(assert (=> d!32035 (= (getValueByKey!158 lt!58407 (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284)))))

(assert (=> d!32035 (= lt!58405 (lemmaContainsTupThenGetReturnValue!77 lt!58407 (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(assert (=> d!32035 (= lt!58407 (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 lt!58285)) (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(assert (=> d!32035 (= (+!142 (+!142 lt!58288 lt!58285) lt!58284) lt!58404)))

(declare-fun b!112817 () Bool)

(declare-fun res!55626 () Bool)

(assert (=> b!112817 (=> (not res!55626) (not e!73341))))

(assert (=> b!112817 (= res!55626 (= (getValueByKey!158 (toList!796 lt!58404) (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284))))))

(declare-fun b!112818 () Bool)

(assert (=> b!112818 (= e!73341 (contains!835 (toList!796 lt!58404) lt!58284))))

(assert (= (and d!32035 res!55627) b!112817))

(assert (= (and b!112817 res!55626) b!112818))

(declare-fun m!128737 () Bool)

(assert (=> d!32035 m!128737))

(declare-fun m!128739 () Bool)

(assert (=> d!32035 m!128739))

(declare-fun m!128741 () Bool)

(assert (=> d!32035 m!128741))

(declare-fun m!128743 () Bool)

(assert (=> d!32035 m!128743))

(declare-fun m!128745 () Bool)

(assert (=> b!112817 m!128745))

(declare-fun m!128747 () Bool)

(assert (=> b!112818 m!128747))

(assert (=> b!112620 d!32035))

(declare-fun d!32037 () Bool)

(declare-fun e!73342 () Bool)

(assert (=> d!32037 e!73342))

(declare-fun res!55629 () Bool)

(assert (=> d!32037 (=> (not res!55629) (not e!73342))))

(declare-fun lt!58408 () ListLongMap!1561)

(assert (=> d!32037 (= res!55629 (contains!834 lt!58408 (_1!1216 lt!58285)))))

(declare-fun lt!58411 () List!1633)

(assert (=> d!32037 (= lt!58408 (ListLongMap!1562 lt!58411))))

(declare-fun lt!58410 () Unit!3503)

(declare-fun lt!58409 () Unit!3503)

(assert (=> d!32037 (= lt!58410 lt!58409)))

(assert (=> d!32037 (= (getValueByKey!158 lt!58411 (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285)))))

(assert (=> d!32037 (= lt!58409 (lemmaContainsTupThenGetReturnValue!77 lt!58411 (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(assert (=> d!32037 (= lt!58411 (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 lt!58284)) (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(assert (=> d!32037 (= (+!142 (+!142 lt!58288 lt!58284) lt!58285) lt!58408)))

(declare-fun b!112819 () Bool)

(declare-fun res!55628 () Bool)

(assert (=> b!112819 (=> (not res!55628) (not e!73342))))

(assert (=> b!112819 (= res!55628 (= (getValueByKey!158 (toList!796 lt!58408) (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285))))))

(declare-fun b!112820 () Bool)

(assert (=> b!112820 (= e!73342 (contains!835 (toList!796 lt!58408) lt!58285))))

(assert (= (and d!32037 res!55629) b!112819))

(assert (= (and b!112819 res!55628) b!112820))

(declare-fun m!128749 () Bool)

(assert (=> d!32037 m!128749))

(declare-fun m!128751 () Bool)

(assert (=> d!32037 m!128751))

(declare-fun m!128753 () Bool)

(assert (=> d!32037 m!128753))

(declare-fun m!128755 () Bool)

(assert (=> d!32037 m!128755))

(declare-fun m!128757 () Bool)

(assert (=> b!112819 m!128757))

(declare-fun m!128759 () Bool)

(assert (=> b!112820 m!128759))

(assert (=> b!112620 d!32037))

(declare-fun d!32039 () Bool)

(declare-fun e!73343 () Bool)

(assert (=> d!32039 e!73343))

(declare-fun res!55631 () Bool)

(assert (=> d!32039 (=> (not res!55631) (not e!73343))))

(declare-fun lt!58412 () ListLongMap!1561)

(assert (=> d!32039 (= res!55631 (contains!834 lt!58412 (_1!1216 lt!58284)))))

(declare-fun lt!58415 () List!1633)

(assert (=> d!32039 (= lt!58412 (ListLongMap!1562 lt!58415))))

(declare-fun lt!58414 () Unit!3503)

(declare-fun lt!58413 () Unit!3503)

(assert (=> d!32039 (= lt!58414 lt!58413)))

(assert (=> d!32039 (= (getValueByKey!158 lt!58415 (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284)))))

(assert (=> d!32039 (= lt!58413 (lemmaContainsTupThenGetReturnValue!77 lt!58415 (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(assert (=> d!32039 (= lt!58415 (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(assert (=> d!32039 (= (+!142 lt!58288 lt!58284) lt!58412)))

(declare-fun b!112821 () Bool)

(declare-fun res!55630 () Bool)

(assert (=> b!112821 (=> (not res!55630) (not e!73343))))

(assert (=> b!112821 (= res!55630 (= (getValueByKey!158 (toList!796 lt!58412) (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284))))))

(declare-fun b!112822 () Bool)

(assert (=> b!112822 (= e!73343 (contains!835 (toList!796 lt!58412) lt!58284))))

(assert (= (and d!32039 res!55631) b!112821))

(assert (= (and b!112821 res!55630) b!112822))

(declare-fun m!128761 () Bool)

(assert (=> d!32039 m!128761))

(declare-fun m!128763 () Bool)

(assert (=> d!32039 m!128763))

(declare-fun m!128765 () Bool)

(assert (=> d!32039 m!128765))

(declare-fun m!128767 () Bool)

(assert (=> d!32039 m!128767))

(declare-fun m!128769 () Bool)

(assert (=> b!112821 m!128769))

(declare-fun m!128771 () Bool)

(assert (=> b!112822 m!128771))

(assert (=> b!112620 d!32039))

(declare-fun d!32041 () Bool)

(assert (=> d!32041 (= (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992)))) (and (or (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000001111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000011111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000001111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000011111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000001111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000011111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000001111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000011111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000000111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000001111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000011111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000000111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000001111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000011111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000000111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000001111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000011111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000000111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000001111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000011111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00000111111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00001111111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00011111111111111111111111111111) (= (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6843 (v!2949 (underlying!369 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!112620 d!32041))

(declare-fun d!32043 () Bool)

(declare-fun res!55638 () Bool)

(declare-fun e!73346 () Bool)

(assert (=> d!32043 (=> (not res!55638) (not e!73346))))

(declare-fun simpleValid!78 (LongMapFixedSize!928) Bool)

(assert (=> d!32043 (= res!55638 (simpleValid!78 newMap!16))))

(assert (=> d!32043 (= (valid!435 newMap!16) e!73346)))

(declare-fun b!112829 () Bool)

(declare-fun res!55639 () Bool)

(assert (=> b!112829 (=> (not res!55639) (not e!73346))))

(declare-fun arrayCountValidKeys!0 (array!4393 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!112829 (= res!55639 (= (arrayCountValidKeys!0 (_keys!4379 newMap!16) #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (_size!513 newMap!16)))))

(declare-fun b!112830 () Bool)

(declare-fun res!55640 () Bool)

(assert (=> b!112830 (=> (not res!55640) (not e!73346))))

(assert (=> b!112830 (= res!55640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun b!112831 () Bool)

(assert (=> b!112831 (= e!73346 (arrayNoDuplicates!0 (_keys!4379 newMap!16) #b00000000000000000000000000000000 Nil!1629))))

(assert (= (and d!32043 res!55638) b!112829))

(assert (= (and b!112829 res!55639) b!112830))

(assert (= (and b!112830 res!55640) b!112831))

(declare-fun m!128773 () Bool)

(assert (=> d!32043 m!128773))

(declare-fun m!128775 () Bool)

(assert (=> b!112829 m!128775))

(declare-fun m!128777 () Bool)

(assert (=> b!112830 m!128777))

(declare-fun m!128779 () Bool)

(assert (=> b!112831 m!128779))

(assert (=> b!112632 d!32043))

(declare-fun d!32045 () Bool)

(declare-fun e!73351 () Bool)

(assert (=> d!32045 e!73351))

(declare-fun res!55643 () Bool)

(assert (=> d!32045 (=> res!55643 e!73351)))

(declare-fun lt!58425 () Bool)

(assert (=> d!32045 (= res!55643 (not lt!58425))))

(declare-fun lt!58427 () Bool)

(assert (=> d!32045 (= lt!58425 lt!58427)))

(declare-fun lt!58426 () Unit!3503)

(declare-fun e!73352 () Unit!3503)

(assert (=> d!32045 (= lt!58426 e!73352)))

(declare-fun c!20161 () Bool)

(assert (=> d!32045 (= c!20161 lt!58427)))

(declare-fun containsKey!162 (List!1633 (_ BitVec 64)) Bool)

(assert (=> d!32045 (= lt!58427 (containsKey!162 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32045 (= (contains!834 lt!58287 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) lt!58425)))

(declare-fun b!112838 () Bool)

(declare-fun lt!58424 () Unit!3503)

(assert (=> b!112838 (= e!73352 lt!58424)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!111 (List!1633 (_ BitVec 64)) Unit!3503)

(assert (=> b!112838 (= lt!58424 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun isDefined!112 (Option!164) Bool)

(assert (=> b!112838 (isDefined!112 (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!112839 () Bool)

(declare-fun Unit!3509 () Unit!3503)

(assert (=> b!112839 (= e!73352 Unit!3509)))

(declare-fun b!112840 () Bool)

(assert (=> b!112840 (= e!73351 (isDefined!112 (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(assert (= (and d!32045 c!20161) b!112838))

(assert (= (and d!32045 (not c!20161)) b!112839))

(assert (= (and d!32045 (not res!55643)) b!112840))

(assert (=> d!32045 m!128511))

(declare-fun m!128781 () Bool)

(assert (=> d!32045 m!128781))

(assert (=> b!112838 m!128511))

(declare-fun m!128783 () Bool)

(assert (=> b!112838 m!128783))

(assert (=> b!112838 m!128511))

(declare-fun m!128785 () Bool)

(assert (=> b!112838 m!128785))

(assert (=> b!112838 m!128785))

(declare-fun m!128787 () Bool)

(assert (=> b!112838 m!128787))

(assert (=> b!112840 m!128511))

(assert (=> b!112840 m!128785))

(assert (=> b!112840 m!128785))

(assert (=> b!112840 m!128787))

(assert (=> b!112628 d!32045))

(declare-fun b!112925 () Bool)

(declare-fun e!73399 () ListLongMap!1561)

(declare-fun call!12142 () ListLongMap!1561)

(assert (=> b!112925 (= e!73399 call!12142)))

(declare-fun b!112926 () Bool)

(declare-fun res!55683 () Bool)

(declare-fun call!12145 () Bool)

(assert (=> b!112926 (= res!55683 call!12145)))

(declare-fun e!73415 () Bool)

(assert (=> b!112926 (=> (not res!55683) (not e!73415))))

(declare-fun bm!12135 () Bool)

(declare-fun call!12143 () Bool)

(assert (=> bm!12135 (= call!12145 call!12143)))

(declare-fun b!112927 () Bool)

(declare-fun e!73408 () tuple2!2412)

(declare-fun e!73403 () tuple2!2412)

(assert (=> b!112927 (= e!73408 e!73403)))

(declare-fun c!20203 () Bool)

(assert (=> b!112927 (= c!20203 (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112928 () Bool)

(declare-fun e!73417 () Bool)

(declare-fun e!73406 () Bool)

(assert (=> b!112928 (= e!73417 e!73406)))

(declare-fun res!55674 () Bool)

(declare-fun call!12159 () ListLongMap!1561)

(assert (=> b!112928 (= res!55674 (contains!834 call!12159 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> b!112928 (=> (not res!55674) (not e!73406))))

(declare-fun b!112929 () Bool)

(declare-fun e!73413 () Unit!3503)

(declare-fun lt!58488 () Unit!3503)

(assert (=> b!112929 (= e!73413 lt!58488)))

(declare-fun call!12148 () Unit!3503)

(assert (=> b!112929 (= lt!58488 call!12148)))

(declare-datatypes ((SeekEntryResult!266 0))(
  ( (MissingZero!266 (index!3216 (_ BitVec 32))) (Found!266 (index!3217 (_ BitVec 32))) (Intermediate!266 (undefined!1078 Bool) (index!3218 (_ BitVec 32)) (x!14186 (_ BitVec 32))) (Undefined!266) (MissingVacant!266 (index!3219 (_ BitVec 32))) )
))
(declare-fun lt!58484 () SeekEntryResult!266)

(declare-fun call!12151 () SeekEntryResult!266)

(assert (=> b!112929 (= lt!58484 call!12151)))

(declare-fun c!20194 () Bool)

(assert (=> b!112929 (= c!20194 ((_ is MissingZero!266) lt!58484))))

(declare-fun e!73405 () Bool)

(assert (=> b!112929 e!73405))

(declare-fun bm!12136 () Bool)

(declare-fun call!12152 () Bool)

(declare-fun call!12144 () Bool)

(assert (=> bm!12136 (= call!12152 call!12144)))

(declare-fun bm!12137 () Bool)

(declare-fun call!12161 () ListLongMap!1561)

(declare-fun call!12138 () ListLongMap!1561)

(assert (=> bm!12137 (= call!12161 call!12138)))

(declare-fun call!12140 () Unit!3503)

(declare-fun bm!12138 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3503)

(assert (=> bm!12138 (= call!12140 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun b!112930 () Bool)

(declare-fun e!73400 () Bool)

(declare-fun call!12160 () Bool)

(assert (=> b!112930 (= e!73400 (not call!12160))))

(declare-fun lt!58496 () SeekEntryResult!266)

(declare-fun b!112931 () Bool)

(declare-fun e!73401 () Bool)

(assert (=> b!112931 (= e!73401 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58496)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun lt!58503 () SeekEntryResult!266)

(declare-fun b!112932 () Bool)

(assert (=> b!112932 (= e!73415 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58503)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!112933 () Bool)

(declare-fun res!55678 () Bool)

(declare-fun lt!58504 () SeekEntryResult!266)

(assert (=> b!112933 (= res!55678 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3219 lt!58504)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73418 () Bool)

(assert (=> b!112933 (=> (not res!55678) (not e!73418))))

(declare-fun b!112934 () Bool)

(declare-fun res!55679 () Bool)

(declare-fun call!12146 () Bool)

(assert (=> b!112934 (= res!55679 call!12146)))

(assert (=> b!112934 (=> (not res!55679) (not e!73401))))

(declare-fun bm!12139 () Bool)

(declare-fun call!12149 () ListLongMap!1561)

(assert (=> bm!12139 (= call!12149 (map!1288 newMap!16))))

(declare-fun b!112935 () Bool)

(declare-fun res!55680 () Bool)

(assert (=> b!112935 (=> (not res!55680) (not e!73400))))

(declare-fun call!12158 () Bool)

(assert (=> b!112935 (= res!55680 call!12158)))

(assert (=> b!112935 (= e!73405 e!73400)))

(declare-fun b!112936 () Bool)

(declare-fun e!73409 () Unit!3503)

(declare-fun lt!58487 () Unit!3503)

(assert (=> b!112936 (= e!73409 lt!58487)))

(assert (=> b!112936 (= lt!58487 call!12140)))

(declare-fun call!12154 () SeekEntryResult!266)

(assert (=> b!112936 (= lt!58496 call!12154)))

(declare-fun res!55676 () Bool)

(assert (=> b!112936 (= res!55676 ((_ is Found!266) lt!58496))))

(assert (=> b!112936 (=> (not res!55676) (not e!73401))))

(assert (=> b!112936 e!73401))

(declare-fun b!112937 () Bool)

(declare-fun c!20196 () Bool)

(declare-fun lt!58502 () SeekEntryResult!266)

(assert (=> b!112937 (= c!20196 ((_ is MissingVacant!266) lt!58502))))

(declare-fun e!73407 () tuple2!2412)

(declare-fun e!73411 () tuple2!2412)

(assert (=> b!112937 (= e!73407 e!73411)))

(declare-fun b!112938 () Bool)

(declare-fun c!20201 () Bool)

(assert (=> b!112938 (= c!20201 ((_ is MissingVacant!266) lt!58504))))

(declare-fun e!73397 () Bool)

(declare-fun e!73410 () Bool)

(assert (=> b!112938 (= e!73397 e!73410)))

(declare-fun b!112939 () Bool)

(declare-fun res!55673 () Bool)

(declare-fun e!73404 () Bool)

(assert (=> b!112939 (=> (not res!55673) (not e!73404))))

(assert (=> b!112939 (= res!55673 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3216 lt!58504)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112940 () Bool)

(assert (=> b!112940 (= e!73418 (not call!12152))))

(declare-fun b!112941 () Bool)

(declare-fun lt!58485 () Unit!3503)

(declare-fun lt!58500 () Unit!3503)

(assert (=> b!112941 (= lt!58485 lt!58500)))

(assert (=> b!112941 (contains!834 call!12138 (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502)))))

(declare-fun lt!58498 () array!4395)

(declare-fun lemmaValidKeyInArrayIsInListMap!110 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) Unit!3503)

(assert (=> b!112941 (= lt!58500 (lemmaValidKeyInArrayIsInListMap!110 (_keys!4379 newMap!16) lt!58498 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (defaultEntry!2660 newMap!16)))))

(assert (=> b!112941 (= lt!58498 (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))))))

(declare-fun lt!58489 () Unit!3503)

(declare-fun lt!58492 () Unit!3503)

(assert (=> b!112941 (= lt!58489 lt!58492)))

(declare-fun call!12153 () ListLongMap!1561)

(assert (=> b!112941 (= call!12153 call!12142)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3503)

(assert (=> b!112941 (= lt!58492 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58507 () Unit!3503)

(assert (=> b!112941 (= lt!58507 e!73409)))

(declare-fun c!20190 () Bool)

(declare-fun call!12139 () Bool)

(assert (=> b!112941 (= c!20190 call!12139)))

(declare-fun e!73412 () tuple2!2412)

(assert (=> b!112941 (= e!73412 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (_size!513 newMap!16) (_keys!4379 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))) (_vacant!513 newMap!16))))))

(declare-fun bm!12140 () Bool)

(declare-fun call!12147 () SeekEntryResult!266)

(assert (=> bm!12140 (= call!12151 call!12147)))

(declare-fun b!112942 () Bool)

(declare-fun c!20199 () Bool)

(assert (=> b!112942 (= c!20199 ((_ is MissingVacant!266) lt!58484))))

(declare-fun e!73416 () Bool)

(assert (=> b!112942 (= e!73405 e!73416)))

(declare-fun b!112943 () Bool)

(declare-fun res!55675 () Bool)

(assert (=> b!112943 (=> (not res!55675) (not e!73404))))

(declare-fun call!12150 () Bool)

(assert (=> b!112943 (= res!55675 call!12150)))

(assert (=> b!112943 (= e!73397 e!73404)))

(declare-fun bm!12141 () Bool)

(assert (=> bm!12141 (= call!12158 call!12145)))

(declare-fun bm!12142 () Bool)

(assert (=> bm!12142 (= call!12146 call!12143)))

(declare-fun b!112944 () Bool)

(assert (=> b!112944 (= e!73406 (= call!12159 (+!142 call!12149 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun b!112945 () Bool)

(declare-fun e!73398 () Bool)

(assert (=> b!112945 (= e!73398 (not call!12160))))

(declare-fun bm!12143 () Bool)

(declare-fun c!20200 () Bool)

(declare-fun c!20195 () Bool)

(assert (=> bm!12143 (= c!20200 c!20195)))

(assert (=> bm!12143 (= call!12139 (contains!834 e!73399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!112946 () Bool)

(assert (=> b!112946 (= e!73399 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12144 () Bool)

(declare-fun call!12156 () ListLongMap!1561)

(assert (=> bm!12144 (= call!12142 call!12156)))

(declare-fun b!112947 () Bool)

(assert (=> b!112947 (= e!73408 e!73407)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4393 (_ BitVec 32)) SeekEntryResult!266)

(assert (=> b!112947 (= lt!58502 (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(assert (=> b!112947 (= c!20195 ((_ is Undefined!266) lt!58502))))

(declare-fun b!112948 () Bool)

(assert (=> b!112948 (= e!73410 e!73418)))

(declare-fun res!55685 () Bool)

(assert (=> b!112948 (= res!55685 call!12150)))

(assert (=> b!112948 (=> (not res!55685) (not e!73418))))

(declare-fun b!112949 () Bool)

(declare-fun e!73414 () ListLongMap!1561)

(assert (=> b!112949 (= e!73414 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12145 () Bool)

(declare-fun c!20192 () Bool)

(assert (=> bm!12145 (= call!12156 (getCurrentListMap!472 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!112950 () Bool)

(declare-fun Unit!3510 () Unit!3503)

(assert (=> b!112950 (= e!73413 Unit!3510)))

(declare-fun lt!58499 () Unit!3503)

(assert (=> b!112950 (= lt!58499 call!12140)))

(assert (=> b!112950 (= lt!58503 call!12151)))

(declare-fun res!55672 () Bool)

(assert (=> b!112950 (= res!55672 ((_ is Found!266) lt!58503))))

(assert (=> b!112950 (=> (not res!55672) (not e!73415))))

(assert (=> b!112950 e!73415))

(declare-fun lt!58497 () Unit!3503)

(assert (=> b!112950 (= lt!58497 lt!58499)))

(assert (=> b!112950 false))

(declare-fun bm!12146 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3503)

(assert (=> bm!12146 (= call!12148 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12147 () Bool)

(declare-fun lt!58490 () tuple2!2412)

(assert (=> bm!12147 (= call!12159 (map!1288 (_2!1217 lt!58490)))))

(declare-fun b!112951 () Bool)

(assert (=> b!112951 (= e!73411 e!73412)))

(declare-fun c!20191 () Bool)

(assert (=> b!112951 (= c!20191 ((_ is MissingZero!266) lt!58502))))

(declare-fun bm!12148 () Bool)

(declare-fun c!20202 () Bool)

(declare-fun c!20198 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12148 (= call!12143 (inRange!0 (ite c!20195 (ite c!20198 (index!3217 lt!58503) (ite c!20194 (index!3216 lt!58484) (index!3219 lt!58484))) (ite c!20190 (index!3217 lt!58496) (ite c!20202 (index!3216 lt!58504) (index!3219 lt!58504)))) (mask!6843 newMap!16)))))

(declare-fun b!112952 () Bool)

(declare-fun lt!58508 () Unit!3503)

(assert (=> b!112952 (= lt!58508 e!73413)))

(assert (=> b!112952 (= c!20198 call!12139)))

(assert (=> b!112952 (= e!73407 (tuple2!2413 false newMap!16))))

(declare-fun bm!12149 () Bool)

(declare-fun lt!58494 () (_ BitVec 32))

(declare-fun lt!58493 () (_ BitVec 32))

(assert (=> bm!12149 (= call!12138 (getCurrentListMap!472 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12150 () Bool)

(declare-fun call!12157 () ListLongMap!1561)

(assert (=> bm!12150 (= call!12157 call!12156)))

(declare-fun b!112953 () Bool)

(assert (=> b!112953 (= e!73416 ((_ is Undefined!266) lt!58484))))

(declare-fun bm!12151 () Bool)

(assert (=> bm!12151 (= call!12154 call!12147)))

(declare-fun b!112954 () Bool)

(declare-fun lt!58483 () tuple2!2412)

(assert (=> b!112954 (= e!73411 (tuple2!2413 (_1!1217 lt!58483) (_2!1217 lt!58483)))))

(declare-fun call!12141 () tuple2!2412)

(assert (=> b!112954 (= lt!58483 call!12141)))

(declare-fun bm!12152 () Bool)

(assert (=> bm!12152 (= call!12150 call!12146)))

(declare-fun b!112955 () Bool)

(assert (=> b!112955 (= e!73410 ((_ is Undefined!266) lt!58504))))

(declare-fun b!112956 () Bool)

(declare-fun Unit!3511 () Unit!3503)

(assert (=> b!112956 (= e!73409 Unit!3511)))

(declare-fun lt!58491 () Unit!3503)

(assert (=> b!112956 (= lt!58491 call!12148)))

(assert (=> b!112956 (= lt!58504 call!12154)))

(assert (=> b!112956 (= c!20202 ((_ is MissingZero!266) lt!58504))))

(assert (=> b!112956 e!73397))

(declare-fun lt!58505 () Unit!3503)

(assert (=> b!112956 (= lt!58505 lt!58491)))

(assert (=> b!112956 false))

(declare-fun d!32047 () Bool)

(declare-fun e!73402 () Bool)

(assert (=> d!32047 e!73402))

(declare-fun res!55681 () Bool)

(assert (=> d!32047 (=> (not res!55681) (not e!73402))))

(assert (=> d!32047 (= res!55681 (valid!435 (_2!1217 lt!58490)))))

(assert (=> d!32047 (= lt!58490 e!73408)))

(assert (=> d!32047 (= c!20192 (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvneg (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(assert (=> d!32047 (valid!435 newMap!16)))

(assert (=> d!32047 (= (update!165 newMap!16 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293) lt!58490)))

(declare-fun b!112957 () Bool)

(declare-fun res!55684 () Bool)

(assert (=> b!112957 (= res!55684 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3219 lt!58484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!112957 (=> (not res!55684) (not e!73398))))

(declare-fun b!112958 () Bool)

(assert (=> b!112958 (= e!73402 e!73417)))

(declare-fun c!20193 () Bool)

(assert (=> b!112958 (= c!20193 (_1!1217 lt!58490))))

(declare-fun b!112959 () Bool)

(assert (=> b!112959 (= e!73416 e!73398)))

(declare-fun res!55677 () Bool)

(assert (=> b!112959 (= res!55677 call!12158)))

(assert (=> b!112959 (=> (not res!55677) (not e!73398))))

(declare-fun b!112960 () Bool)

(assert (=> b!112960 (= e!73417 (= call!12159 call!12149))))

(declare-fun bm!12153 () Bool)

(declare-fun updateHelperNewKey!51 (LongMapFixedSize!928 (_ BitVec 64) V!3257 (_ BitVec 32)) tuple2!2412)

(assert (=> bm!12153 (= call!12141 (updateHelperNewKey!51 newMap!16 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502))))))

(declare-fun bm!12154 () Bool)

(assert (=> bm!12154 (= call!12160 call!12144)))

(declare-fun bm!12155 () Bool)

(declare-fun call!12155 () ListLongMap!1561)

(assert (=> bm!12155 (= call!12155 call!12153)))

(declare-fun b!112961 () Bool)

(declare-fun res!55682 () Bool)

(assert (=> b!112961 (=> (not res!55682) (not e!73400))))

(assert (=> b!112961 (= res!55682 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3216 lt!58484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112962 () Bool)

(declare-fun lt!58482 () Unit!3503)

(declare-fun lt!58486 () Unit!3503)

(assert (=> b!112962 (= lt!58482 lt!58486)))

(assert (=> b!112962 (= call!12155 call!12161)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!51 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3503)

(assert (=> b!112962 (= lt!58486 (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58494 (zeroValue!2528 newMap!16) lt!58293 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)))))

(assert (=> b!112962 (= lt!58494 (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!112962 (= e!73403 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6843 newMap!16) (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) lt!58293 (minValue!2528 newMap!16) (_size!513 newMap!16) (_keys!4379 newMap!16) (_values!2643 newMap!16) (_vacant!513 newMap!16))))))

(declare-fun bm!12156 () Bool)

(assert (=> bm!12156 (= call!12147 (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun b!112963 () Bool)

(declare-fun lt!58501 () tuple2!2412)

(assert (=> b!112963 (= lt!58501 call!12141)))

(assert (=> b!112963 (= e!73412 (tuple2!2413 (_1!1217 lt!58501) (_2!1217 lt!58501)))))

(declare-fun b!112964 () Bool)

(assert (=> b!112964 (= e!73404 (not call!12152))))

(declare-fun bm!12157 () Bool)

(assert (=> bm!12157 (= call!12144 (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!12158 () Bool)

(assert (=> bm!12158 (= call!12153 (+!142 e!73414 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun c!20197 () Bool)

(assert (=> bm!12158 (= c!20197 c!20192)))

(declare-fun b!112965 () Bool)

(assert (=> b!112965 (= e!73414 call!12157)))

(declare-fun b!112966 () Bool)

(declare-fun lt!58506 () Unit!3503)

(declare-fun lt!58495 () Unit!3503)

(assert (=> b!112966 (= lt!58506 lt!58495)))

(assert (=> b!112966 (= call!12155 call!12161)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3503)

(assert (=> b!112966 (= lt!58495 (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58493 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58293 (defaultEntry!2660 newMap!16)))))

(assert (=> b!112966 (= lt!58493 (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!112966 (= e!73403 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6843 newMap!16) (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) (zeroValue!2528 newMap!16) lt!58293 (_size!513 newMap!16) (_keys!4379 newMap!16) (_values!2643 newMap!16) (_vacant!513 newMap!16))))))

(assert (= (and d!32047 c!20192) b!112927))

(assert (= (and d!32047 (not c!20192)) b!112947))

(assert (= (and b!112927 c!20203) b!112962))

(assert (= (and b!112927 (not c!20203)) b!112966))

(assert (= (or b!112962 b!112966) bm!12137))

(assert (= (or b!112962 b!112966) bm!12150))

(assert (= (or b!112962 b!112966) bm!12155))

(assert (= (and b!112947 c!20195) b!112952))

(assert (= (and b!112947 (not c!20195)) b!112937))

(assert (= (and b!112952 c!20198) b!112950))

(assert (= (and b!112952 (not c!20198)) b!112929))

(assert (= (and b!112950 res!55672) b!112926))

(assert (= (and b!112926 res!55683) b!112932))

(assert (= (and b!112929 c!20194) b!112935))

(assert (= (and b!112929 (not c!20194)) b!112942))

(assert (= (and b!112935 res!55680) b!112961))

(assert (= (and b!112961 res!55682) b!112930))

(assert (= (and b!112942 c!20199) b!112959))

(assert (= (and b!112942 (not c!20199)) b!112953))

(assert (= (and b!112959 res!55677) b!112957))

(assert (= (and b!112957 res!55684) b!112945))

(assert (= (or b!112935 b!112959) bm!12141))

(assert (= (or b!112930 b!112945) bm!12154))

(assert (= (or b!112926 bm!12141) bm!12135))

(assert (= (or b!112950 b!112929) bm!12140))

(assert (= (and b!112937 c!20196) b!112954))

(assert (= (and b!112937 (not c!20196)) b!112951))

(assert (= (and b!112951 c!20191) b!112963))

(assert (= (and b!112951 (not c!20191)) b!112941))

(assert (= (and b!112941 c!20190) b!112936))

(assert (= (and b!112941 (not c!20190)) b!112956))

(assert (= (and b!112936 res!55676) b!112934))

(assert (= (and b!112934 res!55679) b!112931))

(assert (= (and b!112956 c!20202) b!112943))

(assert (= (and b!112956 (not c!20202)) b!112938))

(assert (= (and b!112943 res!55675) b!112939))

(assert (= (and b!112939 res!55673) b!112964))

(assert (= (and b!112938 c!20201) b!112948))

(assert (= (and b!112938 (not c!20201)) b!112955))

(assert (= (and b!112948 res!55685) b!112933))

(assert (= (and b!112933 res!55678) b!112940))

(assert (= (or b!112943 b!112948) bm!12152))

(assert (= (or b!112964 b!112940) bm!12136))

(assert (= (or b!112934 bm!12152) bm!12142))

(assert (= (or b!112936 b!112956) bm!12151))

(assert (= (or b!112954 b!112963) bm!12153))

(assert (= (or bm!12135 bm!12142) bm!12148))

(assert (= (or b!112929 b!112956) bm!12146))

(assert (= (or b!112952 b!112941) bm!12144))

(assert (= (or bm!12154 bm!12136) bm!12157))

(assert (= (or bm!12140 bm!12151) bm!12156))

(assert (= (or b!112950 b!112936) bm!12138))

(assert (= (or b!112952 b!112941) bm!12143))

(assert (= (and bm!12143 c!20200) b!112925))

(assert (= (and bm!12143 (not c!20200)) b!112946))

(assert (= (or bm!12150 bm!12144) bm!12145))

(assert (= (or bm!12137 b!112941) bm!12149))

(assert (= (or bm!12155 b!112941) bm!12158))

(assert (= (and bm!12158 c!20197) b!112965))

(assert (= (and bm!12158 (not c!20197)) b!112949))

(assert (= (and d!32047 res!55681) b!112958))

(assert (= (and b!112958 c!20193) b!112928))

(assert (= (and b!112958 (not c!20193)) b!112960))

(assert (= (and b!112928 res!55674) b!112944))

(assert (= (or b!112944 b!112960) bm!12139))

(assert (= (or b!112928 b!112944 b!112960) bm!12147))

(declare-fun m!128789 () Bool)

(assert (=> b!112939 m!128789))

(declare-fun m!128791 () Bool)

(assert (=> bm!12149 m!128791))

(declare-fun m!128793 () Bool)

(assert (=> bm!12145 m!128793))

(declare-fun m!128795 () Bool)

(assert (=> bm!12145 m!128795))

(declare-fun m!128797 () Bool)

(assert (=> b!112966 m!128797))

(declare-fun m!128799 () Bool)

(assert (=> b!112944 m!128799))

(declare-fun m!128801 () Bool)

(assert (=> b!112961 m!128801))

(declare-fun m!128803 () Bool)

(assert (=> bm!12147 m!128803))

(declare-fun m!128805 () Bool)

(assert (=> b!112941 m!128805))

(declare-fun m!128807 () Bool)

(assert (=> b!112941 m!128807))

(assert (=> b!112941 m!128805))

(assert (=> b!112941 m!128511))

(declare-fun m!128809 () Bool)

(assert (=> b!112941 m!128809))

(declare-fun m!128811 () Bool)

(assert (=> b!112941 m!128811))

(assert (=> b!112941 m!128793))

(assert (=> bm!12156 m!128511))

(declare-fun m!128813 () Bool)

(assert (=> bm!12156 m!128813))

(declare-fun m!128815 () Bool)

(assert (=> b!112957 m!128815))

(assert (=> bm!12157 m!128511))

(declare-fun m!128817 () Bool)

(assert (=> bm!12157 m!128817))

(declare-fun m!128819 () Bool)

(assert (=> b!112962 m!128819))

(assert (=> b!112928 m!128511))

(declare-fun m!128821 () Bool)

(assert (=> b!112928 m!128821))

(declare-fun m!128823 () Bool)

(assert (=> bm!12148 m!128823))

(declare-fun m!128825 () Bool)

(assert (=> b!112932 m!128825))

(assert (=> b!112947 m!128511))

(assert (=> b!112947 m!128813))

(assert (=> bm!12153 m!128511))

(declare-fun m!128827 () Bool)

(assert (=> bm!12153 m!128827))

(assert (=> bm!12139 m!128527))

(declare-fun m!128829 () Bool)

(assert (=> b!112931 m!128829))

(assert (=> bm!12143 m!128511))

(declare-fun m!128831 () Bool)

(assert (=> bm!12143 m!128831))

(assert (=> bm!12146 m!128511))

(declare-fun m!128833 () Bool)

(assert (=> bm!12146 m!128833))

(declare-fun m!128835 () Bool)

(assert (=> b!112949 m!128835))

(declare-fun m!128837 () Bool)

(assert (=> d!32047 m!128837))

(assert (=> d!32047 m!128559))

(declare-fun m!128839 () Bool)

(assert (=> b!112933 m!128839))

(declare-fun m!128841 () Bool)

(assert (=> bm!12158 m!128841))

(assert (=> bm!12138 m!128511))

(declare-fun m!128843 () Bool)

(assert (=> bm!12138 m!128843))

(assert (=> b!112946 m!128835))

(assert (=> b!112628 d!32047))

(declare-fun bm!12161 () Bool)

(declare-fun call!12164 () Bool)

(declare-fun c!20206 () Bool)

(assert (=> bm!12161 (= call!12164 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20206 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) Nil!1629) Nil!1629)))))

(declare-fun b!112977 () Bool)

(declare-fun e!73430 () Bool)

(declare-fun e!73428 () Bool)

(assert (=> b!112977 (= e!73430 e!73428)))

(declare-fun res!55692 () Bool)

(assert (=> b!112977 (=> (not res!55692) (not e!73428))))

(declare-fun e!73427 () Bool)

(assert (=> b!112977 (= res!55692 (not e!73427))))

(declare-fun res!55694 () Bool)

(assert (=> b!112977 (=> (not res!55694) (not e!73427))))

(assert (=> b!112977 (= res!55694 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112978 () Bool)

(declare-fun e!73429 () Bool)

(assert (=> b!112978 (= e!73428 e!73429)))

(assert (=> b!112978 (= c!20206 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!32049 () Bool)

(declare-fun res!55693 () Bool)

(assert (=> d!32049 (=> res!55693 e!73430)))

(assert (=> d!32049 (= res!55693 (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32049 (= (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 Nil!1629) e!73430)))

(declare-fun b!112979 () Bool)

(assert (=> b!112979 (= e!73429 call!12164)))

(declare-fun b!112980 () Bool)

(assert (=> b!112980 (= e!73429 call!12164)))

(declare-fun b!112981 () Bool)

(declare-fun contains!836 (List!1632 (_ BitVec 64)) Bool)

(assert (=> b!112981 (= e!73427 (contains!836 Nil!1629 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32049 (not res!55693)) b!112977))

(assert (= (and b!112977 res!55694) b!112981))

(assert (= (and b!112977 res!55692) b!112978))

(assert (= (and b!112978 c!20206) b!112980))

(assert (= (and b!112978 (not c!20206)) b!112979))

(assert (= (or b!112980 b!112979) bm!12161))

(declare-fun m!128845 () Bool)

(assert (=> bm!12161 m!128845))

(declare-fun m!128847 () Bool)

(assert (=> bm!12161 m!128847))

(assert (=> b!112977 m!128845))

(assert (=> b!112977 m!128845))

(declare-fun m!128849 () Bool)

(assert (=> b!112977 m!128849))

(assert (=> b!112978 m!128845))

(assert (=> b!112978 m!128845))

(assert (=> b!112978 m!128849))

(assert (=> b!112981 m!128845))

(assert (=> b!112981 m!128845))

(declare-fun m!128851 () Bool)

(assert (=> b!112981 m!128851))

(assert (=> b!112616 d!32049))

(declare-fun d!32051 () Bool)

(assert (=> d!32051 (= (array_inv!1315 (_keys!4379 newMap!16)) (bvsge (size!2340 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112621 d!32051))

(declare-fun d!32053 () Bool)

(assert (=> d!32053 (= (array_inv!1316 (_values!2643 newMap!16)) (bvsge (size!2341 (_values!2643 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112621 d!32053))

(declare-fun d!32055 () Bool)

(declare-fun res!55700 () Bool)

(declare-fun e!73437 () Bool)

(assert (=> d!32055 (=> res!55700 e!73437)))

(assert (=> d!32055 (= res!55700 (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))) e!73437)))

(declare-fun bm!12164 () Bool)

(declare-fun call!12167 () Bool)

(assert (=> bm!12164 (= call!12167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!112990 () Bool)

(declare-fun e!73439 () Bool)

(declare-fun e!73438 () Bool)

(assert (=> b!112990 (= e!73439 e!73438)))

(declare-fun lt!58516 () (_ BitVec 64))

(assert (=> b!112990 (= lt!58516 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!58515 () Unit!3503)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4393 (_ BitVec 64) (_ BitVec 32)) Unit!3503)

(assert (=> b!112990 (= lt!58515 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000))))

(assert (=> b!112990 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000)))

(declare-fun lt!58517 () Unit!3503)

(assert (=> b!112990 (= lt!58517 lt!58515)))

(declare-fun res!55699 () Bool)

(assert (=> b!112990 (= res!55699 (= (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))) (Found!266 #b00000000000000000000000000000000)))))

(assert (=> b!112990 (=> (not res!55699) (not e!73438))))

(declare-fun b!112991 () Bool)

(assert (=> b!112991 (= e!73438 call!12167)))

(declare-fun b!112992 () Bool)

(assert (=> b!112992 (= e!73437 e!73439)))

(declare-fun c!20209 () Bool)

(assert (=> b!112992 (= c!20209 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112993 () Bool)

(assert (=> b!112993 (= e!73439 call!12167)))

(assert (= (and d!32055 (not res!55700)) b!112992))

(assert (= (and b!112992 c!20209) b!112990))

(assert (= (and b!112992 (not c!20209)) b!112993))

(assert (= (and b!112990 res!55699) b!112991))

(assert (= (or b!112991 b!112993) bm!12164))

(declare-fun m!128853 () Bool)

(assert (=> bm!12164 m!128853))

(assert (=> b!112990 m!128845))

(declare-fun m!128855 () Bool)

(assert (=> b!112990 m!128855))

(declare-fun m!128857 () Bool)

(assert (=> b!112990 m!128857))

(assert (=> b!112990 m!128845))

(declare-fun m!128859 () Bool)

(assert (=> b!112990 m!128859))

(assert (=> b!112992 m!128845))

(assert (=> b!112992 m!128845))

(assert (=> b!112992 m!128849))

(assert (=> b!112634 d!32055))

(declare-fun d!32057 () Bool)

(assert (=> d!32057 (= (map!1288 newMap!16) (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bs!4631 () Bool)

(assert (= bs!4631 d!32057))

(assert (=> bs!4631 m!128835))

(assert (=> b!112622 d!32057))

(declare-fun bm!12179 () Bool)

(declare-fun call!12185 () ListLongMap!1561)

(assert (=> bm!12179 (= call!12185 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113036 () Bool)

(declare-fun e!73476 () ListLongMap!1561)

(declare-fun call!12182 () ListLongMap!1561)

(assert (=> b!113036 (= e!73476 call!12182)))

(declare-fun b!113038 () Bool)

(declare-fun e!73477 () Bool)

(declare-fun lt!58568 () ListLongMap!1561)

(assert (=> b!113038 (= e!73477 (= (apply!102 lt!58568 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113039 () Bool)

(declare-fun res!55723 () Bool)

(declare-fun e!73474 () Bool)

(assert (=> b!113039 (=> (not res!55723) (not e!73474))))

(declare-fun e!73467 () Bool)

(assert (=> b!113039 (= res!55723 e!73467)))

(declare-fun res!55719 () Bool)

(assert (=> b!113039 (=> res!55719 e!73467)))

(declare-fun e!73478 () Bool)

(assert (=> b!113039 (= res!55719 (not e!73478))))

(declare-fun res!55722 () Bool)

(assert (=> b!113039 (=> (not res!55722) (not e!73478))))

(assert (=> b!113039 (= res!55722 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun bm!12180 () Bool)

(declare-fun call!12188 () ListLongMap!1561)

(declare-fun call!12186 () ListLongMap!1561)

(assert (=> bm!12180 (= call!12188 call!12186)))

(declare-fun bm!12181 () Bool)

(assert (=> bm!12181 (= call!12186 call!12185)))

(declare-fun b!113040 () Bool)

(declare-fun e!73472 () Bool)

(assert (=> b!113040 (= e!73472 e!73477)))

(declare-fun res!55725 () Bool)

(declare-fun call!12187 () Bool)

(assert (=> b!113040 (= res!55725 call!12187)))

(assert (=> b!113040 (=> (not res!55725) (not e!73477))))

(declare-fun b!113041 () Bool)

(declare-fun e!73471 () Bool)

(assert (=> b!113041 (= e!73471 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113042 () Bool)

(declare-fun e!73466 () Bool)

(assert (=> b!113042 (= e!73474 e!73466)))

(declare-fun c!20226 () Bool)

(assert (=> b!113042 (= c!20226 (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113043 () Bool)

(declare-fun e!73469 () ListLongMap!1561)

(assert (=> b!113043 (= e!73469 call!12188)))

(declare-fun b!113044 () Bool)

(declare-fun e!73468 () Bool)

(assert (=> b!113044 (= e!73468 (= (apply!102 lt!58568 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113044 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> b!113044 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun bm!12182 () Bool)

(assert (=> bm!12182 (= call!12187 (contains!834 lt!58568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!32059 () Bool)

(assert (=> d!32059 e!73474))

(declare-fun res!55721 () Bool)

(assert (=> d!32059 (=> (not res!55721) (not e!73474))))

(assert (=> d!32059 (= res!55721 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun lt!58575 () ListLongMap!1561)

(assert (=> d!32059 (= lt!58568 lt!58575)))

(declare-fun lt!58570 () Unit!3503)

(declare-fun e!73470 () Unit!3503)

(assert (=> d!32059 (= lt!58570 e!73470)))

(declare-fun c!20224 () Bool)

(assert (=> d!32059 (= c!20224 e!73471)))

(declare-fun res!55724 () Bool)

(assert (=> d!32059 (=> (not res!55724) (not e!73471))))

(assert (=> d!32059 (= res!55724 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun e!73473 () ListLongMap!1561)

(assert (=> d!32059 (= lt!58575 e!73473)))

(declare-fun c!20225 () Bool)

(assert (=> d!32059 (= c!20225 (and (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32059 (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32059 (= (getCurrentListMap!472 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) lt!58568)))

(declare-fun b!113037 () Bool)

(declare-fun e!73475 () Bool)

(assert (=> b!113037 (= e!73466 e!73475)))

(declare-fun res!55726 () Bool)

(declare-fun call!12183 () Bool)

(assert (=> b!113037 (= res!55726 call!12183)))

(assert (=> b!113037 (=> (not res!55726) (not e!73475))))

(declare-fun b!113045 () Bool)

(declare-fun lt!58573 () Unit!3503)

(assert (=> b!113045 (= e!73470 lt!58573)))

(declare-fun lt!58574 () ListLongMap!1561)

(assert (=> b!113045 (= lt!58574 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun lt!58579 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58579 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58565 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58565 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58571 () Unit!3503)

(declare-fun addStillContains!78 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> b!113045 (= lt!58571 (addStillContains!78 lt!58574 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58565))))

(assert (=> b!113045 (contains!834 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58565)))

(declare-fun lt!58562 () Unit!3503)

(assert (=> b!113045 (= lt!58562 lt!58571)))

(declare-fun lt!58566 () ListLongMap!1561)

(assert (=> b!113045 (= lt!58566 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun lt!58576 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58576 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58567 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58567 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58582 () Unit!3503)

(declare-fun addApplyDifferent!78 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> b!113045 (= lt!58582 (addApplyDifferent!78 lt!58566 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58567))))

(assert (=> b!113045 (= (apply!102 (+!142 lt!58566 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58567) (apply!102 lt!58566 lt!58567))))

(declare-fun lt!58572 () Unit!3503)

(assert (=> b!113045 (= lt!58572 lt!58582)))

(declare-fun lt!58564 () ListLongMap!1561)

(assert (=> b!113045 (= lt!58564 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun lt!58563 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58580 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58580 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58583 () Unit!3503)

(assert (=> b!113045 (= lt!58583 (addApplyDifferent!78 lt!58564 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58580))))

(assert (=> b!113045 (= (apply!102 (+!142 lt!58564 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58580) (apply!102 lt!58564 lt!58580))))

(declare-fun lt!58569 () Unit!3503)

(assert (=> b!113045 (= lt!58569 lt!58583)))

(declare-fun lt!58578 () ListLongMap!1561)

(assert (=> b!113045 (= lt!58578 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun lt!58577 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58581 () (_ BitVec 64))

(assert (=> b!113045 (= lt!58581 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!113045 (= lt!58573 (addApplyDifferent!78 lt!58578 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58581))))

(assert (=> b!113045 (= (apply!102 (+!142 lt!58578 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58581) (apply!102 lt!58578 lt!58581))))

(declare-fun b!113046 () Bool)

(assert (=> b!113046 (= e!73466 (not call!12183))))

(declare-fun b!113047 () Bool)

(assert (=> b!113047 (= e!73467 e!73468)))

(declare-fun res!55727 () Bool)

(assert (=> b!113047 (=> (not res!55727) (not e!73468))))

(assert (=> b!113047 (= res!55727 (contains!834 lt!58568 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun bm!12183 () Bool)

(declare-fun call!12184 () ListLongMap!1561)

(declare-fun c!20222 () Bool)

(assert (=> bm!12183 (= call!12184 (+!142 (ite c!20225 call!12185 (ite c!20222 call!12186 call!12188)) (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun bm!12184 () Bool)

(assert (=> bm!12184 (= call!12183 (contains!834 lt!58568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113048 () Bool)

(assert (=> b!113048 (= e!73469 call!12182)))

(declare-fun b!113049 () Bool)

(assert (=> b!113049 (= e!73473 (+!142 call!12184 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113050 () Bool)

(assert (=> b!113050 (= e!73472 (not call!12187))))

(declare-fun b!113051 () Bool)

(declare-fun c!20223 () Bool)

(assert (=> b!113051 (= c!20223 (and (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!113051 (= e!73476 e!73469)))

(declare-fun b!113052 () Bool)

(declare-fun res!55720 () Bool)

(assert (=> b!113052 (=> (not res!55720) (not e!73474))))

(assert (=> b!113052 (= res!55720 e!73472)))

(declare-fun c!20227 () Bool)

(assert (=> b!113052 (= c!20227 (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12185 () Bool)

(assert (=> bm!12185 (= call!12182 call!12184)))

(declare-fun b!113053 () Bool)

(assert (=> b!113053 (= e!73478 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113054 () Bool)

(declare-fun Unit!3512 () Unit!3503)

(assert (=> b!113054 (= e!73470 Unit!3512)))

(declare-fun b!113055 () Bool)

(assert (=> b!113055 (= e!73473 e!73476)))

(assert (=> b!113055 (= c!20222 (and (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113056 () Bool)

(assert (=> b!113056 (= e!73475 (= (apply!102 lt!58568 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))

(assert (= (and d!32059 c!20225) b!113049))

(assert (= (and d!32059 (not c!20225)) b!113055))

(assert (= (and b!113055 c!20222) b!113036))

(assert (= (and b!113055 (not c!20222)) b!113051))

(assert (= (and b!113051 c!20223) b!113048))

(assert (= (and b!113051 (not c!20223)) b!113043))

(assert (= (or b!113048 b!113043) bm!12180))

(assert (= (or b!113036 bm!12180) bm!12181))

(assert (= (or b!113036 b!113048) bm!12185))

(assert (= (or b!113049 bm!12181) bm!12179))

(assert (= (or b!113049 bm!12185) bm!12183))

(assert (= (and d!32059 res!55724) b!113041))

(assert (= (and d!32059 c!20224) b!113045))

(assert (= (and d!32059 (not c!20224)) b!113054))

(assert (= (and d!32059 res!55721) b!113039))

(assert (= (and b!113039 res!55722) b!113053))

(assert (= (and b!113039 (not res!55719)) b!113047))

(assert (= (and b!113047 res!55727) b!113044))

(assert (= (and b!113039 res!55723) b!113052))

(assert (= (and b!113052 c!20227) b!113040))

(assert (= (and b!113052 (not c!20227)) b!113050))

(assert (= (and b!113040 res!55725) b!113038))

(assert (= (or b!113040 b!113050) bm!12182))

(assert (= (and b!113052 res!55720) b!113042))

(assert (= (and b!113042 c!20226) b!113037))

(assert (= (and b!113042 (not c!20226)) b!113046))

(assert (= (and b!113037 res!55726) b!113056))

(assert (= (or b!113037 b!113046) bm!12184))

(declare-fun b_lambda!5055 () Bool)

(assert (=> (not b_lambda!5055) (not b!113044)))

(assert (=> b!113044 t!5794))

(declare-fun b_and!6941 () Bool)

(assert (= b_and!6937 (and (=> t!5794 result!3565) b_and!6941)))

(assert (=> b!113044 t!5796))

(declare-fun b_and!6943 () Bool)

(assert (= b_and!6939 (and (=> t!5796 result!3569) b_and!6943)))

(declare-fun m!128861 () Bool)

(assert (=> b!113049 m!128861))

(declare-fun m!128863 () Bool)

(assert (=> b!113038 m!128863))

(assert (=> b!113044 m!128721))

(assert (=> b!113044 m!128721))

(assert (=> b!113044 m!128563))

(assert (=> b!113044 m!128727))

(assert (=> b!113044 m!128709))

(assert (=> b!113044 m!128709))

(declare-fun m!128865 () Bool)

(assert (=> b!113044 m!128865))

(assert (=> b!113044 m!128563))

(assert (=> d!32059 m!128535))

(declare-fun m!128867 () Bool)

(assert (=> bm!12183 m!128867))

(assert (=> b!113041 m!128709))

(assert (=> b!113041 m!128709))

(assert (=> b!113041 m!128711))

(declare-fun m!128869 () Bool)

(assert (=> bm!12182 m!128869))

(assert (=> b!113047 m!128709))

(assert (=> b!113047 m!128709))

(declare-fun m!128871 () Bool)

(assert (=> b!113047 m!128871))

(declare-fun m!128873 () Bool)

(assert (=> b!113056 m!128873))

(assert (=> b!113053 m!128709))

(assert (=> b!113053 m!128709))

(assert (=> b!113053 m!128711))

(assert (=> bm!12179 m!128543))

(declare-fun m!128875 () Bool)

(assert (=> bm!12184 m!128875))

(assert (=> b!113045 m!128543))

(declare-fun m!128877 () Bool)

(assert (=> b!113045 m!128877))

(declare-fun m!128879 () Bool)

(assert (=> b!113045 m!128879))

(declare-fun m!128881 () Bool)

(assert (=> b!113045 m!128881))

(declare-fun m!128883 () Bool)

(assert (=> b!113045 m!128883))

(declare-fun m!128885 () Bool)

(assert (=> b!113045 m!128885))

(declare-fun m!128887 () Bool)

(assert (=> b!113045 m!128887))

(declare-fun m!128889 () Bool)

(assert (=> b!113045 m!128889))

(declare-fun m!128891 () Bool)

(assert (=> b!113045 m!128891))

(declare-fun m!128893 () Bool)

(assert (=> b!113045 m!128893))

(assert (=> b!113045 m!128709))

(assert (=> b!113045 m!128889))

(declare-fun m!128895 () Bool)

(assert (=> b!113045 m!128895))

(declare-fun m!128897 () Bool)

(assert (=> b!113045 m!128897))

(declare-fun m!128899 () Bool)

(assert (=> b!113045 m!128899))

(assert (=> b!113045 m!128891))

(assert (=> b!113045 m!128883))

(assert (=> b!113045 m!128877))

(declare-fun m!128901 () Bool)

(assert (=> b!113045 m!128901))

(declare-fun m!128903 () Bool)

(assert (=> b!113045 m!128903))

(declare-fun m!128905 () Bool)

(assert (=> b!113045 m!128905))

(assert (=> b!112622 d!32059))

(declare-fun d!32061 () Bool)

(assert (=> d!32061 (not (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58586 () Unit!3503)

(declare-fun choose!68 (array!4393 (_ BitVec 32) (_ BitVec 64) List!1632) Unit!3503)

(assert (=> d!32061 (= lt!58586 (choose!68 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629)))))

(assert (=> d!32061 (bvslt (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32061 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629)) lt!58586)))

(declare-fun bs!4632 () Bool)

(assert (= bs!4632 d!32061))

(assert (=> bs!4632 m!128511))

(assert (=> bs!4632 m!128515))

(assert (=> bs!4632 m!128511))

(declare-fun m!128907 () Bool)

(assert (=> bs!4632 m!128907))

(assert (=> b!112630 d!32061))

(declare-fun d!32063 () Bool)

(assert (=> d!32063 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) from!355 Nil!1629)))

(declare-fun lt!58589 () Unit!3503)

(declare-fun choose!39 (array!4393 (_ BitVec 32) (_ BitVec 32)) Unit!3503)

(assert (=> d!32063 (= lt!58589 (choose!39 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32063 (bvslt (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32063 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 from!355) lt!58589)))

(declare-fun bs!4633 () Bool)

(assert (= bs!4633 d!32063))

(assert (=> bs!4633 m!128509))

(declare-fun m!128909 () Bool)

(assert (=> bs!4633 m!128909))

(assert (=> b!112630 d!32063))

(declare-fun d!32065 () Bool)

(declare-fun res!55732 () Bool)

(declare-fun e!73483 () Bool)

(assert (=> d!32065 (=> res!55732 e!73483)))

(assert (=> d!32065 (= res!55732 (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32065 (= (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!73483)))

(declare-fun b!113061 () Bool)

(declare-fun e!73484 () Bool)

(assert (=> b!113061 (= e!73483 e!73484)))

(declare-fun res!55733 () Bool)

(assert (=> b!113061 (=> (not res!55733) (not e!73484))))

(assert (=> b!113061 (= res!55733 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113062 () Bool)

(assert (=> b!113062 (= e!73484 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32065 (not res!55732)) b!113061))

(assert (= (and b!113061 res!55733) b!113062))

(assert (=> d!32065 m!128709))

(assert (=> b!113062 m!128511))

(declare-fun m!128911 () Bool)

(assert (=> b!113062 m!128911))

(assert (=> b!112630 d!32065))

(declare-fun d!32067 () Bool)

(declare-fun e!73487 () Bool)

(assert (=> d!32067 e!73487))

(declare-fun c!20230 () Bool)

(assert (=> d!32067 (= c!20230 (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58592 () Unit!3503)

(declare-fun choose!718 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3503)

(assert (=> d!32067 (= lt!58592 (choose!718 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(assert (=> d!32067 (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32067 (= (lemmaListMapContainsThenArrayContainsFrom!117 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) lt!58592)))

(declare-fun b!113067 () Bool)

(assert (=> b!113067 (= e!73487 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!113068 () Bool)

(assert (=> b!113068 (= e!73487 (ite (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32067 c!20230) b!113067))

(assert (= (and d!32067 (not c!20230)) b!113068))

(assert (=> d!32067 m!128511))

(declare-fun m!128913 () Bool)

(assert (=> d!32067 m!128913))

(assert (=> d!32067 m!128535))

(assert (=> b!113067 m!128511))

(assert (=> b!113067 m!128515))

(assert (=> b!112630 d!32067))

(declare-fun call!12189 () Bool)

(declare-fun bm!12186 () Bool)

(declare-fun c!20231 () Bool)

(assert (=> bm!12186 (= call!12189 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20231 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629) Nil!1629)))))

(declare-fun b!113069 () Bool)

(declare-fun e!73491 () Bool)

(declare-fun e!73489 () Bool)

(assert (=> b!113069 (= e!73491 e!73489)))

(declare-fun res!55734 () Bool)

(assert (=> b!113069 (=> (not res!55734) (not e!73489))))

(declare-fun e!73488 () Bool)

(assert (=> b!113069 (= res!55734 (not e!73488))))

(declare-fun res!55736 () Bool)

(assert (=> b!113069 (=> (not res!55736) (not e!73488))))

(assert (=> b!113069 (= res!55736 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113070 () Bool)

(declare-fun e!73490 () Bool)

(assert (=> b!113070 (= e!73489 e!73490)))

(assert (=> b!113070 (= c!20231 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun d!32069 () Bool)

(declare-fun res!55735 () Bool)

(assert (=> d!32069 (=> res!55735 e!73491)))

(assert (=> d!32069 (= res!55735 (bvsge from!355 (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32069 (= (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) from!355 Nil!1629) e!73491)))

(declare-fun b!113071 () Bool)

(assert (=> b!113071 (= e!73490 call!12189)))

(declare-fun b!113072 () Bool)

(assert (=> b!113072 (= e!73490 call!12189)))

(declare-fun b!113073 () Bool)

(assert (=> b!113073 (= e!73488 (contains!836 Nil!1629 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (= (and d!32069 (not res!55735)) b!113069))

(assert (= (and b!113069 res!55736) b!113073))

(assert (= (and b!113069 res!55734) b!113070))

(assert (= (and b!113070 c!20231) b!113072))

(assert (= (and b!113070 (not c!20231)) b!113071))

(assert (= (or b!113072 b!113071) bm!12186))

(assert (=> bm!12186 m!128511))

(declare-fun m!128915 () Bool)

(assert (=> bm!12186 m!128915))

(assert (=> b!113069 m!128511))

(assert (=> b!113069 m!128511))

(declare-fun m!128917 () Bool)

(assert (=> b!113069 m!128917))

(assert (=> b!113070 m!128511))

(assert (=> b!113070 m!128511))

(assert (=> b!113070 m!128917))

(assert (=> b!113073 m!128511))

(assert (=> b!113073 m!128511))

(declare-fun m!128919 () Bool)

(assert (=> b!113073 m!128919))

(assert (=> b!112630 d!32069))

(declare-fun d!32071 () Bool)

(assert (=> d!32071 (= (array_inv!1315 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvsge (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112626 d!32071))

(declare-fun d!32073 () Bool)

(assert (=> d!32073 (= (array_inv!1316 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvsge (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112626 d!32073))

(declare-fun d!32075 () Bool)

(assert (=> d!32075 (= (valid!434 thiss!992) (valid!435 (v!2949 (underlying!369 thiss!992))))))

(declare-fun bs!4634 () Bool)

(assert (= bs!4634 d!32075))

(declare-fun m!128921 () Bool)

(assert (=> bs!4634 m!128921))

(assert (=> start!12954 d!32075))

(declare-fun d!32077 () Bool)

(declare-fun c!20234 () Bool)

(assert (=> d!32077 (= c!20234 ((_ is ValueCellFull!1010) (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun e!73494 () V!3257)

(assert (=> d!32077 (= (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73494)))

(declare-fun b!113078 () Bool)

(declare-fun get!1360 (ValueCell!1010 V!3257) V!3257)

(assert (=> b!113078 (= e!73494 (get!1360 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113079 () Bool)

(declare-fun get!1361 (ValueCell!1010 V!3257) V!3257)

(assert (=> b!113079 (= e!73494 (get!1361 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32077 c!20234) b!113078))

(assert (= (and d!32077 (not c!20234)) b!113079))

(assert (=> b!113078 m!128561))

(assert (=> b!113078 m!128563))

(declare-fun m!128923 () Bool)

(assert (=> b!113078 m!128923))

(assert (=> b!113079 m!128561))

(assert (=> b!113079 m!128563))

(declare-fun m!128925 () Bool)

(assert (=> b!113079 m!128925))

(assert (=> b!112623 d!32077))

(declare-fun mapNonEmpty!4059 () Bool)

(declare-fun mapRes!4059 () Bool)

(declare-fun tp!10125 () Bool)

(declare-fun e!73500 () Bool)

(assert (=> mapNonEmpty!4059 (= mapRes!4059 (and tp!10125 e!73500))))

(declare-fun mapRest!4059 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapKey!4059 () (_ BitVec 32))

(declare-fun mapValue!4059 () ValueCell!1010)

(assert (=> mapNonEmpty!4059 (= mapRest!4043 (store mapRest!4059 mapKey!4059 mapValue!4059))))

(declare-fun b!113086 () Bool)

(assert (=> b!113086 (= e!73500 tp_is_empty!2707)))

(declare-fun b!113087 () Bool)

(declare-fun e!73499 () Bool)

(assert (=> b!113087 (= e!73499 tp_is_empty!2707)))

(declare-fun mapIsEmpty!4059 () Bool)

(assert (=> mapIsEmpty!4059 mapRes!4059))

(declare-fun condMapEmpty!4059 () Bool)

(declare-fun mapDefault!4059 () ValueCell!1010)

(assert (=> mapNonEmpty!4043 (= condMapEmpty!4059 (= mapRest!4043 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4059)))))

(assert (=> mapNonEmpty!4043 (= tp!10098 (and e!73499 mapRes!4059))))

(assert (= (and mapNonEmpty!4043 condMapEmpty!4059) mapIsEmpty!4059))

(assert (= (and mapNonEmpty!4043 (not condMapEmpty!4059)) mapNonEmpty!4059))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1010) mapValue!4059)) b!113086))

(assert (= (and mapNonEmpty!4043 ((_ is ValueCellFull!1010) mapDefault!4059)) b!113087))

(declare-fun m!128927 () Bool)

(assert (=> mapNonEmpty!4059 m!128927))

(declare-fun mapNonEmpty!4060 () Bool)

(declare-fun mapRes!4060 () Bool)

(declare-fun tp!10126 () Bool)

(declare-fun e!73502 () Bool)

(assert (=> mapNonEmpty!4060 (= mapRes!4060 (and tp!10126 e!73502))))

(declare-fun mapRest!4060 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapValue!4060 () ValueCell!1010)

(declare-fun mapKey!4060 () (_ BitVec 32))

(assert (=> mapNonEmpty!4060 (= mapRest!4044 (store mapRest!4060 mapKey!4060 mapValue!4060))))

(declare-fun b!113088 () Bool)

(assert (=> b!113088 (= e!73502 tp_is_empty!2707)))

(declare-fun b!113089 () Bool)

(declare-fun e!73501 () Bool)

(assert (=> b!113089 (= e!73501 tp_is_empty!2707)))

(declare-fun mapIsEmpty!4060 () Bool)

(assert (=> mapIsEmpty!4060 mapRes!4060))

(declare-fun condMapEmpty!4060 () Bool)

(declare-fun mapDefault!4060 () ValueCell!1010)

(assert (=> mapNonEmpty!4044 (= condMapEmpty!4060 (= mapRest!4044 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4060)))))

(assert (=> mapNonEmpty!4044 (= tp!10095 (and e!73501 mapRes!4060))))

(assert (= (and mapNonEmpty!4044 condMapEmpty!4060) mapIsEmpty!4060))

(assert (= (and mapNonEmpty!4044 (not condMapEmpty!4060)) mapNonEmpty!4060))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1010) mapValue!4060)) b!113088))

(assert (= (and mapNonEmpty!4044 ((_ is ValueCellFull!1010) mapDefault!4060)) b!113089))

(declare-fun m!128929 () Bool)

(assert (=> mapNonEmpty!4060 m!128929))

(declare-fun b_lambda!5057 () Bool)

(assert (= b_lambda!5053 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5057)))

(declare-fun b_lambda!5059 () Bool)

(assert (= b_lambda!5055 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5059)))

(declare-fun b_lambda!5061 () Bool)

(assert (= b_lambda!5051 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5061)))

(check-sat (not d!32057) (not b!113049) (not b!112829) (not b!112981) (not bm!12086) (not b!112817) (not d!32035) (not d!32033) (not d!32067) (not b_next!2583) (not d!32047) (not d!32075) (not d!32045) (not b!113079) (not bm!12153) (not b!113041) (not b!112822) (not b!112780) (not bm!12184) (not b!112944) (not bm!12149) (not b!112831) (not d!32043) (not b!112962) (not bm!12146) (not b!112821) (not d!32029) (not b!113078) (not b!113070) (not b!112819) (not bm!12145) (not bm!12179) (not bm!12147) (not b!112815) (not bm!12186) (not bm!12139) (not b!112809) (not b!112813) (not b!112941) (not bm!12161) b_and!6943 (not bm!12138) (not bm!12156) (not b!112818) (not b!113056) (not b!112978) (not b!113053) (not b!112806) (not d!32031) (not bm!12183) (not d!32063) (not d!32059) (not b!112928) (not b!113073) (not d!32037) (not bm!12148) (not b!113045) (not b!112814) (not b!113062) (not bm!12182) (not b!112838) (not b!113047) (not b!112779) (not b!112812) (not bm!12157) (not b!113069) (not b!112990) (not b!113067) (not b!112977) tp_is_empty!2707 (not b_next!2581) (not d!32061) (not mapNonEmpty!4060) (not b!112830) (not b!112811) (not bm!12164) (not b_lambda!5061) (not b!112820) (not b_lambda!5057) (not b!112946) (not b!112949) (not b!113044) (not b!112992) (not b!112840) (not bm!12158) (not bm!12143) (not b!112966) (not b_lambda!5059) b_and!6941 (not b!113038) (not b!112947) (not d!32039) (not b!112816) (not mapNonEmpty!4059) (not b_lambda!5049))
(check-sat b_and!6941 b_and!6943 (not b_next!2581) (not b_next!2583))
(get-model)

(assert (=> bm!12139 d!32057))

(declare-fun bm!12187 () Bool)

(declare-fun call!12190 () Bool)

(declare-fun c!20235 () Bool)

(assert (=> bm!12187 (= call!12190 (arrayNoDuplicates!0 (_keys!4379 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20235 (Cons!1628 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000) Nil!1629) Nil!1629)))))

(declare-fun b!113090 () Bool)

(declare-fun e!73506 () Bool)

(declare-fun e!73504 () Bool)

(assert (=> b!113090 (= e!73506 e!73504)))

(declare-fun res!55737 () Bool)

(assert (=> b!113090 (=> (not res!55737) (not e!73504))))

(declare-fun e!73503 () Bool)

(assert (=> b!113090 (= res!55737 (not e!73503))))

(declare-fun res!55739 () Bool)

(assert (=> b!113090 (=> (not res!55739) (not e!73503))))

(assert (=> b!113090 (= res!55739 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113091 () Bool)

(declare-fun e!73505 () Bool)

(assert (=> b!113091 (= e!73504 e!73505)))

(assert (=> b!113091 (= c!20235 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32079 () Bool)

(declare-fun res!55738 () Bool)

(assert (=> d!32079 (=> res!55738 e!73506)))

(assert (=> d!32079 (= res!55738 (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(assert (=> d!32079 (= (arrayNoDuplicates!0 (_keys!4379 newMap!16) #b00000000000000000000000000000000 Nil!1629) e!73506)))

(declare-fun b!113092 () Bool)

(assert (=> b!113092 (= e!73505 call!12190)))

(declare-fun b!113093 () Bool)

(assert (=> b!113093 (= e!73505 call!12190)))

(declare-fun b!113094 () Bool)

(assert (=> b!113094 (= e!73503 (contains!836 Nil!1629 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32079 (not res!55738)) b!113090))

(assert (= (and b!113090 res!55739) b!113094))

(assert (= (and b!113090 res!55737) b!113091))

(assert (= (and b!113091 c!20235) b!113093))

(assert (= (and b!113091 (not c!20235)) b!113092))

(assert (= (or b!113093 b!113092) bm!12187))

(declare-fun m!128931 () Bool)

(assert (=> bm!12187 m!128931))

(declare-fun m!128933 () Bool)

(assert (=> bm!12187 m!128933))

(assert (=> b!113090 m!128931))

(assert (=> b!113090 m!128931))

(declare-fun m!128935 () Bool)

(assert (=> b!113090 m!128935))

(assert (=> b!113091 m!128931))

(assert (=> b!113091 m!128931))

(assert (=> b!113091 m!128935))

(assert (=> b!113094 m!128931))

(assert (=> b!113094 m!128931))

(declare-fun m!128937 () Bool)

(assert (=> b!113094 m!128937))

(assert (=> b!112831 d!32079))

(declare-fun d!32081 () Bool)

(assert (=> d!32081 (= (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113041 d!32081))

(declare-fun bm!12188 () Bool)

(declare-fun call!12194 () ListLongMap!1561)

(assert (=> bm!12188 (= call!12194 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113095 () Bool)

(declare-fun e!73517 () ListLongMap!1561)

(declare-fun call!12191 () ListLongMap!1561)

(assert (=> b!113095 (= e!73517 call!12191)))

(declare-fun b!113097 () Bool)

(declare-fun e!73518 () Bool)

(declare-fun lt!58599 () ListLongMap!1561)

(assert (=> b!113097 (= e!73518 (= (apply!102 lt!58599 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 newMap!16)))))

(declare-fun b!113098 () Bool)

(declare-fun res!55744 () Bool)

(declare-fun e!73515 () Bool)

(assert (=> b!113098 (=> (not res!55744) (not e!73515))))

(declare-fun e!73508 () Bool)

(assert (=> b!113098 (= res!55744 e!73508)))

(declare-fun res!55740 () Bool)

(assert (=> b!113098 (=> res!55740 e!73508)))

(declare-fun e!73519 () Bool)

(assert (=> b!113098 (= res!55740 (not e!73519))))

(declare-fun res!55743 () Bool)

(assert (=> b!113098 (=> (not res!55743) (not e!73519))))

(assert (=> b!113098 (= res!55743 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12189 () Bool)

(declare-fun call!12197 () ListLongMap!1561)

(declare-fun call!12195 () ListLongMap!1561)

(assert (=> bm!12189 (= call!12197 call!12195)))

(declare-fun bm!12190 () Bool)

(assert (=> bm!12190 (= call!12195 call!12194)))

(declare-fun b!113099 () Bool)

(declare-fun e!73513 () Bool)

(assert (=> b!113099 (= e!73513 e!73518)))

(declare-fun res!55746 () Bool)

(declare-fun call!12196 () Bool)

(assert (=> b!113099 (= res!55746 call!12196)))

(assert (=> b!113099 (=> (not res!55746) (not e!73518))))

(declare-fun b!113100 () Bool)

(declare-fun e!73512 () Bool)

(assert (=> b!113100 (= e!73512 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113101 () Bool)

(declare-fun e!73507 () Bool)

(assert (=> b!113101 (= e!73515 e!73507)))

(declare-fun c!20240 () Bool)

(assert (=> b!113101 (= c!20240 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113102 () Bool)

(declare-fun e!73510 () ListLongMap!1561)

(assert (=> b!113102 (= e!73510 call!12197)))

(declare-fun b!113103 () Bool)

(declare-fun e!73509 () Bool)

(assert (=> b!113103 (= e!73509 (= (apply!102 lt!58599 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2081 (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!389 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2341 (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))))))))

(assert (=> b!113103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12191 () Bool)

(assert (=> bm!12191 (= call!12196 (contains!834 lt!58599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!32083 () Bool)

(assert (=> d!32083 e!73515))

(declare-fun res!55742 () Bool)

(assert (=> d!32083 (=> (not res!55742) (not e!73515))))

(assert (=> d!32083 (= res!55742 (or (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))))

(declare-fun lt!58606 () ListLongMap!1561)

(assert (=> d!32083 (= lt!58599 lt!58606)))

(declare-fun lt!58601 () Unit!3503)

(declare-fun e!73511 () Unit!3503)

(assert (=> d!32083 (= lt!58601 e!73511)))

(declare-fun c!20238 () Bool)

(assert (=> d!32083 (= c!20238 e!73512)))

(declare-fun res!55745 () Bool)

(assert (=> d!32083 (=> (not res!55745) (not e!73512))))

(assert (=> d!32083 (= res!55745 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun e!73514 () ListLongMap!1561)

(assert (=> d!32083 (= lt!58606 e!73514)))

(declare-fun c!20239 () Bool)

(assert (=> d!32083 (= c!20239 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32083 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32083 (= (getCurrentListMap!472 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58599)))

(declare-fun b!113096 () Bool)

(declare-fun e!73516 () Bool)

(assert (=> b!113096 (= e!73507 e!73516)))

(declare-fun res!55747 () Bool)

(declare-fun call!12192 () Bool)

(assert (=> b!113096 (= res!55747 call!12192)))

(assert (=> b!113096 (=> (not res!55747) (not e!73516))))

(declare-fun b!113104 () Bool)

(declare-fun lt!58604 () Unit!3503)

(assert (=> b!113104 (= e!73511 lt!58604)))

(declare-fun lt!58605 () ListLongMap!1561)

(assert (=> b!113104 (= lt!58605 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58610 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58596 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58596 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58602 () Unit!3503)

(assert (=> b!113104 (= lt!58602 (addStillContains!78 lt!58605 lt!58610 (zeroValue!2528 newMap!16) lt!58596))))

(assert (=> b!113104 (contains!834 (+!142 lt!58605 (tuple2!2411 lt!58610 (zeroValue!2528 newMap!16))) lt!58596)))

(declare-fun lt!58593 () Unit!3503)

(assert (=> b!113104 (= lt!58593 lt!58602)))

(declare-fun lt!58597 () ListLongMap!1561)

(assert (=> b!113104 (= lt!58597 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58607 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58607 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58598 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58598 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58613 () Unit!3503)

(assert (=> b!113104 (= lt!58613 (addApplyDifferent!78 lt!58597 lt!58607 (minValue!2528 newMap!16) lt!58598))))

(assert (=> b!113104 (= (apply!102 (+!142 lt!58597 (tuple2!2411 lt!58607 (minValue!2528 newMap!16))) lt!58598) (apply!102 lt!58597 lt!58598))))

(declare-fun lt!58603 () Unit!3503)

(assert (=> b!113104 (= lt!58603 lt!58613)))

(declare-fun lt!58595 () ListLongMap!1561)

(assert (=> b!113104 (= lt!58595 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58594 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58611 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58611 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58614 () Unit!3503)

(assert (=> b!113104 (= lt!58614 (addApplyDifferent!78 lt!58595 lt!58594 (zeroValue!2528 newMap!16) lt!58611))))

(assert (=> b!113104 (= (apply!102 (+!142 lt!58595 (tuple2!2411 lt!58594 (zeroValue!2528 newMap!16))) lt!58611) (apply!102 lt!58595 lt!58611))))

(declare-fun lt!58600 () Unit!3503)

(assert (=> b!113104 (= lt!58600 lt!58614)))

(declare-fun lt!58609 () ListLongMap!1561)

(assert (=> b!113104 (= lt!58609 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite (or c!20192 c!20195) (_values!2643 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16)))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58608 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58612 () (_ BitVec 64))

(assert (=> b!113104 (= lt!58612 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113104 (= lt!58604 (addApplyDifferent!78 lt!58609 lt!58608 (minValue!2528 newMap!16) lt!58612))))

(assert (=> b!113104 (= (apply!102 (+!142 lt!58609 (tuple2!2411 lt!58608 (minValue!2528 newMap!16))) lt!58612) (apply!102 lt!58609 lt!58612))))

(declare-fun b!113105 () Bool)

(assert (=> b!113105 (= e!73507 (not call!12192))))

(declare-fun b!113106 () Bool)

(assert (=> b!113106 (= e!73508 e!73509)))

(declare-fun res!55748 () Bool)

(assert (=> b!113106 (=> (not res!55748) (not e!73509))))

(assert (=> b!113106 (= res!55748 (contains!834 lt!58599 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113106 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12192 () Bool)

(declare-fun c!20236 () Bool)

(declare-fun call!12193 () ListLongMap!1561)

(assert (=> bm!12192 (= call!12193 (+!142 (ite c!20239 call!12194 (ite c!20236 call!12195 call!12197)) (ite (or c!20239 c!20236) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16)))))))

(declare-fun bm!12193 () Bool)

(assert (=> bm!12193 (= call!12192 (contains!834 lt!58599 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113107 () Bool)

(assert (=> b!113107 (= e!73510 call!12191)))

(declare-fun b!113108 () Bool)

(assert (=> b!113108 (= e!73514 (+!142 call!12193 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16))))))

(declare-fun b!113109 () Bool)

(assert (=> b!113109 (= e!73513 (not call!12196))))

(declare-fun b!113110 () Bool)

(declare-fun c!20237 () Bool)

(assert (=> b!113110 (= c!20237 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!113110 (= e!73517 e!73510)))

(declare-fun b!113111 () Bool)

(declare-fun res!55741 () Bool)

(assert (=> b!113111 (=> (not res!55741) (not e!73515))))

(assert (=> b!113111 (= res!55741 e!73513)))

(declare-fun c!20241 () Bool)

(assert (=> b!113111 (= c!20241 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12194 () Bool)

(assert (=> bm!12194 (= call!12191 call!12193)))

(declare-fun b!113112 () Bool)

(assert (=> b!113112 (= e!73519 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113113 () Bool)

(declare-fun Unit!3513 () Unit!3503)

(assert (=> b!113113 (= e!73511 Unit!3513)))

(declare-fun b!113114 () Bool)

(assert (=> b!113114 (= e!73514 e!73517)))

(assert (=> b!113114 (= c!20236 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113115 () Bool)

(assert (=> b!113115 (= e!73516 (= (apply!102 lt!58599 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 newMap!16)))))

(assert (= (and d!32083 c!20239) b!113108))

(assert (= (and d!32083 (not c!20239)) b!113114))

(assert (= (and b!113114 c!20236) b!113095))

(assert (= (and b!113114 (not c!20236)) b!113110))

(assert (= (and b!113110 c!20237) b!113107))

(assert (= (and b!113110 (not c!20237)) b!113102))

(assert (= (or b!113107 b!113102) bm!12189))

(assert (= (or b!113095 bm!12189) bm!12190))

(assert (= (or b!113095 b!113107) bm!12194))

(assert (= (or b!113108 bm!12190) bm!12188))

(assert (= (or b!113108 bm!12194) bm!12192))

(assert (= (and d!32083 res!55745) b!113100))

(assert (= (and d!32083 c!20238) b!113104))

(assert (= (and d!32083 (not c!20238)) b!113113))

(assert (= (and d!32083 res!55742) b!113098))

(assert (= (and b!113098 res!55743) b!113112))

(assert (= (and b!113098 (not res!55740)) b!113106))

(assert (= (and b!113106 res!55748) b!113103))

(assert (= (and b!113098 res!55744) b!113111))

(assert (= (and b!113111 c!20241) b!113099))

(assert (= (and b!113111 (not c!20241)) b!113109))

(assert (= (and b!113099 res!55746) b!113097))

(assert (= (or b!113099 b!113109) bm!12191))

(assert (= (and b!113111 res!55741) b!113101))

(assert (= (and b!113101 c!20240) b!113096))

(assert (= (and b!113101 (not c!20240)) b!113105))

(assert (= (and b!113096 res!55747) b!113115))

(assert (= (or b!113096 b!113105) bm!12193))

(declare-fun b_lambda!5063 () Bool)

(assert (=> (not b_lambda!5063) (not b!113103)))

(declare-fun t!5809 () Bool)

(declare-fun tb!2141 () Bool)

(assert (=> (and b!112626 (= (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) (defaultEntry!2660 newMap!16)) t!5809) tb!2141))

(declare-fun result!3585 () Bool)

(assert (=> tb!2141 (= result!3585 tp_is_empty!2707)))

(assert (=> b!113103 t!5809))

(declare-fun b_and!6945 () Bool)

(assert (= b_and!6941 (and (=> t!5809 result!3585) b_and!6945)))

(declare-fun t!5811 () Bool)

(declare-fun tb!2143 () Bool)

(assert (=> (and b!112621 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 newMap!16)) t!5811) tb!2143))

(declare-fun result!3587 () Bool)

(assert (= result!3587 result!3585))

(assert (=> b!113103 t!5811))

(declare-fun b_and!6947 () Bool)

(assert (= b_and!6943 (and (=> t!5811 result!3587) b_and!6947)))

(declare-fun m!128939 () Bool)

(assert (=> b!113108 m!128939))

(declare-fun m!128941 () Bool)

(assert (=> b!113097 m!128941))

(declare-fun m!128943 () Bool)

(assert (=> b!113103 m!128943))

(assert (=> b!113103 m!128943))

(declare-fun m!128945 () Bool)

(assert (=> b!113103 m!128945))

(declare-fun m!128947 () Bool)

(assert (=> b!113103 m!128947))

(assert (=> b!113103 m!128931))

(assert (=> b!113103 m!128931))

(declare-fun m!128949 () Bool)

(assert (=> b!113103 m!128949))

(assert (=> b!113103 m!128945))

(declare-fun m!128951 () Bool)

(assert (=> d!32083 m!128951))

(declare-fun m!128953 () Bool)

(assert (=> bm!12192 m!128953))

(assert (=> b!113100 m!128931))

(assert (=> b!113100 m!128931))

(assert (=> b!113100 m!128935))

(declare-fun m!128955 () Bool)

(assert (=> bm!12191 m!128955))

(assert (=> b!113106 m!128931))

(assert (=> b!113106 m!128931))

(declare-fun m!128957 () Bool)

(assert (=> b!113106 m!128957))

(declare-fun m!128959 () Bool)

(assert (=> b!113115 m!128959))

(assert (=> b!113112 m!128931))

(assert (=> b!113112 m!128931))

(assert (=> b!113112 m!128935))

(declare-fun m!128961 () Bool)

(assert (=> bm!12188 m!128961))

(declare-fun m!128963 () Bool)

(assert (=> bm!12193 m!128963))

(assert (=> b!113104 m!128961))

(declare-fun m!128965 () Bool)

(assert (=> b!113104 m!128965))

(declare-fun m!128967 () Bool)

(assert (=> b!113104 m!128967))

(declare-fun m!128969 () Bool)

(assert (=> b!113104 m!128969))

(declare-fun m!128971 () Bool)

(assert (=> b!113104 m!128971))

(declare-fun m!128973 () Bool)

(assert (=> b!113104 m!128973))

(declare-fun m!128975 () Bool)

(assert (=> b!113104 m!128975))

(declare-fun m!128977 () Bool)

(assert (=> b!113104 m!128977))

(declare-fun m!128979 () Bool)

(assert (=> b!113104 m!128979))

(declare-fun m!128981 () Bool)

(assert (=> b!113104 m!128981))

(assert (=> b!113104 m!128931))

(assert (=> b!113104 m!128977))

(declare-fun m!128983 () Bool)

(assert (=> b!113104 m!128983))

(declare-fun m!128985 () Bool)

(assert (=> b!113104 m!128985))

(declare-fun m!128987 () Bool)

(assert (=> b!113104 m!128987))

(assert (=> b!113104 m!128979))

(assert (=> b!113104 m!128971))

(assert (=> b!113104 m!128965))

(declare-fun m!128989 () Bool)

(assert (=> b!113104 m!128989))

(declare-fun m!128991 () Bool)

(assert (=> b!113104 m!128991))

(declare-fun m!128993 () Bool)

(assert (=> b!113104 m!128993))

(assert (=> bm!12145 d!32083))

(declare-fun d!32085 () Bool)

(declare-fun c!20246 () Bool)

(assert (=> d!32085 (= c!20246 (and ((_ is Cons!1629) (toList!796 lt!58412)) (= (_1!1216 (h!2229 (toList!796 lt!58412))) (_1!1216 lt!58284))))))

(declare-fun e!73524 () Option!164)

(assert (=> d!32085 (= (getValueByKey!158 (toList!796 lt!58412) (_1!1216 lt!58284)) e!73524)))

(declare-fun b!113126 () Bool)

(declare-fun e!73525 () Option!164)

(assert (=> b!113126 (= e!73525 (getValueByKey!158 (t!5798 (toList!796 lt!58412)) (_1!1216 lt!58284)))))

(declare-fun b!113124 () Bool)

(assert (=> b!113124 (= e!73524 (Some!163 (_2!1216 (h!2229 (toList!796 lt!58412)))))))

(declare-fun b!113127 () Bool)

(assert (=> b!113127 (= e!73525 None!162)))

(declare-fun b!113125 () Bool)

(assert (=> b!113125 (= e!73524 e!73525)))

(declare-fun c!20247 () Bool)

(assert (=> b!113125 (= c!20247 (and ((_ is Cons!1629) (toList!796 lt!58412)) (not (= (_1!1216 (h!2229 (toList!796 lt!58412))) (_1!1216 lt!58284)))))))

(assert (= (and d!32085 c!20246) b!113124))

(assert (= (and d!32085 (not c!20246)) b!113125))

(assert (= (and b!113125 c!20247) b!113126))

(assert (= (and b!113125 (not c!20247)) b!113127))

(declare-fun m!128995 () Bool)

(assert (=> b!113126 m!128995))

(assert (=> b!112821 d!32085))

(declare-fun d!32087 () Bool)

(declare-fun e!73526 () Bool)

(assert (=> d!32087 e!73526))

(declare-fun res!55750 () Bool)

(assert (=> d!32087 (=> (not res!55750) (not e!73526))))

(declare-fun lt!58615 () ListLongMap!1561)

(assert (=> d!32087 (= res!55750 (contains!834 lt!58615 (_1!1216 (tuple2!2411 lt!58403 lt!58401))))))

(declare-fun lt!58618 () List!1633)

(assert (=> d!32087 (= lt!58615 (ListLongMap!1562 lt!58618))))

(declare-fun lt!58617 () Unit!3503)

(declare-fun lt!58616 () Unit!3503)

(assert (=> d!32087 (= lt!58617 lt!58616)))

(assert (=> d!32087 (= (getValueByKey!158 lt!58618 (_1!1216 (tuple2!2411 lt!58403 lt!58401))) (Some!163 (_2!1216 (tuple2!2411 lt!58403 lt!58401))))))

(assert (=> d!32087 (= lt!58616 (lemmaContainsTupThenGetReturnValue!77 lt!58618 (_1!1216 (tuple2!2411 lt!58403 lt!58401)) (_2!1216 (tuple2!2411 lt!58403 lt!58401))))))

(assert (=> d!32087 (= lt!58618 (insertStrictlySorted!80 (toList!796 lt!58397) (_1!1216 (tuple2!2411 lt!58403 lt!58401)) (_2!1216 (tuple2!2411 lt!58403 lt!58401))))))

(assert (=> d!32087 (= (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401)) lt!58615)))

(declare-fun b!113128 () Bool)

(declare-fun res!55749 () Bool)

(assert (=> b!113128 (=> (not res!55749) (not e!73526))))

(assert (=> b!113128 (= res!55749 (= (getValueByKey!158 (toList!796 lt!58615) (_1!1216 (tuple2!2411 lt!58403 lt!58401))) (Some!163 (_2!1216 (tuple2!2411 lt!58403 lt!58401)))))))

(declare-fun b!113129 () Bool)

(assert (=> b!113129 (= e!73526 (contains!835 (toList!796 lt!58615) (tuple2!2411 lt!58403 lt!58401)))))

(assert (= (and d!32087 res!55750) b!113128))

(assert (= (and b!113128 res!55749) b!113129))

(declare-fun m!128997 () Bool)

(assert (=> d!32087 m!128997))

(declare-fun m!128999 () Bool)

(assert (=> d!32087 m!128999))

(declare-fun m!129001 () Bool)

(assert (=> d!32087 m!129001))

(declare-fun m!129003 () Bool)

(assert (=> d!32087 m!129003))

(declare-fun m!129005 () Bool)

(assert (=> b!113128 m!129005))

(declare-fun m!129007 () Bool)

(assert (=> b!113129 m!129007))

(assert (=> b!112806 d!32087))

(declare-fun d!32089 () Bool)

(declare-fun c!20248 () Bool)

(assert (=> d!32089 (= c!20248 ((_ is ValueCellFull!1010) (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!73527 () V!3257)

(assert (=> d!32089 (= (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73527)))

(declare-fun b!113130 () Bool)

(assert (=> b!113130 (= e!73527 (get!1360 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113131 () Bool)

(assert (=> b!113131 (= e!73527 (get!1361 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32089 c!20248) b!113130))

(assert (= (and d!32089 (not c!20248)) b!113131))

(assert (=> b!113130 m!128721))

(assert (=> b!113130 m!128563))

(declare-fun m!129009 () Bool)

(assert (=> b!113130 m!129009))

(assert (=> b!113131 m!128721))

(assert (=> b!113131 m!128563))

(declare-fun m!129011 () Bool)

(assert (=> b!113131 m!129011))

(assert (=> b!112806 d!32089))

(declare-fun d!32091 () Bool)

(declare-fun e!73528 () Bool)

(assert (=> d!32091 e!73528))

(declare-fun res!55752 () Bool)

(assert (=> d!32091 (=> (not res!55752) (not e!73528))))

(declare-fun lt!58619 () ListLongMap!1561)

(assert (=> d!32091 (= res!55752 (contains!834 lt!58619 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!58622 () List!1633)

(assert (=> d!32091 (= lt!58619 (ListLongMap!1562 lt!58622))))

(declare-fun lt!58621 () Unit!3503)

(declare-fun lt!58620 () Unit!3503)

(assert (=> d!32091 (= lt!58621 lt!58620)))

(assert (=> d!32091 (= (getValueByKey!158 lt!58622 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32091 (= lt!58620 (lemmaContainsTupThenGetReturnValue!77 lt!58622 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32091 (= lt!58622 (insertStrictlySorted!80 (toList!796 call!12089) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32091 (= (+!142 call!12089 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!58619)))

(declare-fun b!113132 () Bool)

(declare-fun res!55751 () Bool)

(assert (=> b!113132 (=> (not res!55751) (not e!73528))))

(assert (=> b!113132 (= res!55751 (= (getValueByKey!158 (toList!796 lt!58619) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!113133 () Bool)

(assert (=> b!113133 (= e!73528 (contains!835 (toList!796 lt!58619) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!32091 res!55752) b!113132))

(assert (= (and b!113132 res!55751) b!113133))

(declare-fun m!129013 () Bool)

(assert (=> d!32091 m!129013))

(declare-fun m!129015 () Bool)

(assert (=> d!32091 m!129015))

(declare-fun m!129017 () Bool)

(assert (=> d!32091 m!129017))

(declare-fun m!129019 () Bool)

(assert (=> d!32091 m!129019))

(declare-fun m!129021 () Bool)

(assert (=> b!113132 m!129021))

(declare-fun m!129023 () Bool)

(assert (=> b!113133 m!129023))

(assert (=> b!112806 d!32091))

(declare-fun d!32093 () Bool)

(declare-fun e!73529 () Bool)

(assert (=> d!32093 e!73529))

(declare-fun res!55753 () Bool)

(assert (=> d!32093 (=> res!55753 e!73529)))

(declare-fun lt!58624 () Bool)

(assert (=> d!32093 (= res!55753 (not lt!58624))))

(declare-fun lt!58626 () Bool)

(assert (=> d!32093 (= lt!58624 lt!58626)))

(declare-fun lt!58625 () Unit!3503)

(declare-fun e!73530 () Unit!3503)

(assert (=> d!32093 (= lt!58625 e!73530)))

(declare-fun c!20249 () Bool)

(assert (=> d!32093 (= c!20249 lt!58626)))

(assert (=> d!32093 (= lt!58626 (containsKey!162 (toList!796 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401))) lt!58398))))

(assert (=> d!32093 (= (contains!834 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401)) lt!58398) lt!58624)))

(declare-fun b!113134 () Bool)

(declare-fun lt!58623 () Unit!3503)

(assert (=> b!113134 (= e!73530 lt!58623)))

(assert (=> b!113134 (= lt!58623 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401))) lt!58398))))

(assert (=> b!113134 (isDefined!112 (getValueByKey!158 (toList!796 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401))) lt!58398))))

(declare-fun b!113135 () Bool)

(declare-fun Unit!3514 () Unit!3503)

(assert (=> b!113135 (= e!73530 Unit!3514)))

(declare-fun b!113136 () Bool)

(assert (=> b!113136 (= e!73529 (isDefined!112 (getValueByKey!158 (toList!796 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401))) lt!58398)))))

(assert (= (and d!32093 c!20249) b!113134))

(assert (= (and d!32093 (not c!20249)) b!113135))

(assert (= (and d!32093 (not res!55753)) b!113136))

(declare-fun m!129025 () Bool)

(assert (=> d!32093 m!129025))

(declare-fun m!129027 () Bool)

(assert (=> b!113134 m!129027))

(declare-fun m!129029 () Bool)

(assert (=> b!113134 m!129029))

(assert (=> b!113134 m!129029))

(declare-fun m!129031 () Bool)

(assert (=> b!113134 m!129031))

(assert (=> b!113136 m!129029))

(assert (=> b!113136 m!129029))

(assert (=> b!113136 m!129031))

(assert (=> b!112806 d!32093))

(declare-fun d!32095 () Bool)

(assert (=> d!32095 (not (contains!834 (+!142 lt!58397 (tuple2!2411 lt!58403 lt!58401)) lt!58398))))

(declare-fun lt!58629 () Unit!3503)

(declare-fun choose!719 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> d!32095 (= lt!58629 (choose!719 lt!58397 lt!58403 lt!58401 lt!58398))))

(declare-fun e!73533 () Bool)

(assert (=> d!32095 e!73533))

(declare-fun res!55756 () Bool)

(assert (=> d!32095 (=> (not res!55756) (not e!73533))))

(assert (=> d!32095 (= res!55756 (not (contains!834 lt!58397 lt!58398)))))

(assert (=> d!32095 (= (addStillNotContains!51 lt!58397 lt!58403 lt!58401 lt!58398) lt!58629)))

(declare-fun b!113140 () Bool)

(assert (=> b!113140 (= e!73533 (not (= lt!58403 lt!58398)))))

(assert (= (and d!32095 res!55756) b!113140))

(assert (=> d!32095 m!128717))

(assert (=> d!32095 m!128717))

(assert (=> d!32095 m!128719))

(declare-fun m!129033 () Bool)

(assert (=> d!32095 m!129033))

(declare-fun m!129035 () Bool)

(assert (=> d!32095 m!129035))

(assert (=> b!112806 d!32095))

(declare-fun d!32097 () Bool)

(declare-fun get!1362 (Option!164) V!3257)

(assert (=> d!32097 (= (apply!102 lt!58568 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1362 (getValueByKey!158 (toList!796 lt!58568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4635 () Bool)

(assert (= bs!4635 d!32097))

(declare-fun m!129037 () Bool)

(assert (=> bs!4635 m!129037))

(assert (=> bs!4635 m!129037))

(declare-fun m!129039 () Bool)

(assert (=> bs!4635 m!129039))

(assert (=> b!113056 d!32097))

(declare-fun b!113149 () Bool)

(declare-fun e!73539 () (_ BitVec 32))

(declare-fun e!73538 () (_ BitVec 32))

(assert (=> b!113149 (= e!73539 e!73538)))

(declare-fun c!20254 () Bool)

(assert (=> b!113149 (= c!20254 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113150 () Bool)

(declare-fun call!12200 () (_ BitVec 32))

(assert (=> b!113150 (= e!73538 call!12200)))

(declare-fun b!113151 () Bool)

(assert (=> b!113151 (= e!73539 #b00000000000000000000000000000000)))

(declare-fun bm!12197 () Bool)

(assert (=> bm!12197 (= call!12200 (arrayCountValidKeys!0 (_keys!4379 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun b!113152 () Bool)

(assert (=> b!113152 (= e!73538 (bvadd #b00000000000000000000000000000001 call!12200))))

(declare-fun d!32099 () Bool)

(declare-fun lt!58632 () (_ BitVec 32))

(assert (=> d!32099 (and (bvsge lt!58632 #b00000000000000000000000000000000) (bvsle lt!58632 (bvsub (size!2340 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!32099 (= lt!58632 e!73539)))

(declare-fun c!20255 () Bool)

(assert (=> d!32099 (= c!20255 (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(assert (=> d!32099 (and (bvsle #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2340 (_keys!4379 newMap!16)) (size!2340 (_keys!4379 newMap!16))))))

(assert (=> d!32099 (= (arrayCountValidKeys!0 (_keys!4379 newMap!16) #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) lt!58632)))

(assert (= (and d!32099 c!20255) b!113151))

(assert (= (and d!32099 (not c!20255)) b!113149))

(assert (= (and b!113149 c!20254) b!113152))

(assert (= (and b!113149 (not c!20254)) b!113150))

(assert (= (or b!113152 b!113150) bm!12197))

(assert (=> b!113149 m!128931))

(assert (=> b!113149 m!128931))

(assert (=> b!113149 m!128935))

(declare-fun m!129041 () Bool)

(assert (=> bm!12197 m!129041))

(assert (=> b!112829 d!32099))

(declare-fun d!32101 () Bool)

(assert (=> d!32101 (= (+!142 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) lt!58494 lt!58293 (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58635 () Unit!3503)

(declare-fun choose!720 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3503)

(assert (=> d!32101 (= lt!58635 (choose!720 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58494 (zeroValue!2528 newMap!16) lt!58293 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32101 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32101 (= (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58494 (zeroValue!2528 newMap!16) lt!58293 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)) lt!58635)))

(declare-fun bs!4636 () Bool)

(assert (= bs!4636 d!32101))

(declare-fun m!129043 () Bool)

(assert (=> bs!4636 m!129043))

(assert (=> bs!4636 m!128835))

(declare-fun m!129045 () Bool)

(assert (=> bs!4636 m!129045))

(assert (=> bs!4636 m!128951))

(declare-fun m!129047 () Bool)

(assert (=> bs!4636 m!129047))

(assert (=> bs!4636 m!128835))

(assert (=> b!112962 d!32101))

(declare-fun d!32103 () Bool)

(declare-fun lt!58638 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!117 (List!1632) (InoxSet (_ BitVec 64)))

(assert (=> d!32103 (= lt!58638 (select (content!117 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun e!73545 () Bool)

(assert (=> d!32103 (= lt!58638 e!73545)))

(declare-fun res!55762 () Bool)

(assert (=> d!32103 (=> (not res!55762) (not e!73545))))

(assert (=> d!32103 (= res!55762 ((_ is Cons!1628) Nil!1629))))

(assert (=> d!32103 (= (contains!836 Nil!1629 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) lt!58638)))

(declare-fun b!113157 () Bool)

(declare-fun e!73544 () Bool)

(assert (=> b!113157 (= e!73545 e!73544)))

(declare-fun res!55761 () Bool)

(assert (=> b!113157 (=> res!55761 e!73544)))

(assert (=> b!113157 (= res!55761 (= (h!2228 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113158 () Bool)

(assert (=> b!113158 (= e!73544 (contains!836 (t!5797 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (= (and d!32103 res!55762) b!113157))

(assert (= (and b!113157 (not res!55761)) b!113158))

(declare-fun m!129049 () Bool)

(assert (=> d!32103 m!129049))

(assert (=> d!32103 m!128511))

(declare-fun m!129051 () Bool)

(assert (=> d!32103 m!129051))

(assert (=> b!113158 m!128511))

(declare-fun m!129053 () Bool)

(assert (=> b!113158 m!129053))

(assert (=> b!113073 d!32103))

(declare-fun b!113175 () Bool)

(declare-fun lt!58644 () SeekEntryResult!266)

(assert (=> b!113175 (and (bvsge (index!3216 lt!58644) #b00000000000000000000000000000000) (bvslt (index!3216 lt!58644) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun res!55773 () Bool)

(assert (=> b!113175 (= res!55773 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3216 lt!58644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73557 () Bool)

(assert (=> b!113175 (=> (not res!55773) (not e!73557))))

(declare-fun b!113176 () Bool)

(declare-fun e!73554 () Bool)

(assert (=> b!113176 (= e!73554 e!73557)))

(declare-fun res!55772 () Bool)

(declare-fun call!12206 () Bool)

(assert (=> b!113176 (= res!55772 call!12206)))

(assert (=> b!113176 (=> (not res!55772) (not e!73557))))

(declare-fun b!113177 () Bool)

(declare-fun call!12205 () Bool)

(assert (=> b!113177 (= e!73557 (not call!12205))))

(declare-fun b!113178 () Bool)

(declare-fun res!55774 () Bool)

(declare-fun e!73555 () Bool)

(assert (=> b!113178 (=> (not res!55774) (not e!73555))))

(assert (=> b!113178 (= res!55774 call!12206)))

(declare-fun e!73556 () Bool)

(assert (=> b!113178 (= e!73556 e!73555)))

(declare-fun b!113179 () Bool)

(assert (=> b!113179 (= e!73555 (not call!12205))))

(declare-fun bm!12203 () Bool)

(assert (=> bm!12203 (= call!12205 (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113180 () Bool)

(assert (=> b!113180 (= e!73554 e!73556)))

(declare-fun c!20261 () Bool)

(assert (=> b!113180 (= c!20261 ((_ is MissingVacant!266) lt!58644))))

(declare-fun b!113181 () Bool)

(declare-fun res!55771 () Bool)

(assert (=> b!113181 (=> (not res!55771) (not e!73555))))

(assert (=> b!113181 (= res!55771 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3219 lt!58644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113181 (and (bvsge (index!3219 lt!58644) #b00000000000000000000000000000000) (bvslt (index!3219 lt!58644) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun b!113182 () Bool)

(assert (=> b!113182 (= e!73556 ((_ is Undefined!266) lt!58644))))

(declare-fun d!32105 () Bool)

(assert (=> d!32105 e!73554))

(declare-fun c!20260 () Bool)

(assert (=> d!32105 (= c!20260 ((_ is MissingZero!266) lt!58644))))

(assert (=> d!32105 (= lt!58644 (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun lt!58643 () Unit!3503)

(declare-fun choose!721 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3503)

(assert (=> d!32105 (= lt!58643 (choose!721 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32105 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32105 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)) lt!58643)))

(declare-fun bm!12202 () Bool)

(assert (=> bm!12202 (= call!12206 (inRange!0 (ite c!20260 (index!3216 lt!58644) (index!3219 lt!58644)) (mask!6843 newMap!16)))))

(assert (= (and d!32105 c!20260) b!113176))

(assert (= (and d!32105 (not c!20260)) b!113180))

(assert (= (and b!113176 res!55772) b!113175))

(assert (= (and b!113175 res!55773) b!113177))

(assert (= (and b!113180 c!20261) b!113178))

(assert (= (and b!113180 (not c!20261)) b!113182))

(assert (= (and b!113178 res!55774) b!113181))

(assert (= (and b!113181 res!55771) b!113179))

(assert (= (or b!113176 b!113178) bm!12202))

(assert (= (or b!113177 b!113179) bm!12203))

(assert (=> bm!12203 m!128511))

(assert (=> bm!12203 m!128817))

(assert (=> d!32105 m!128511))

(assert (=> d!32105 m!128813))

(assert (=> d!32105 m!128511))

(declare-fun m!129055 () Bool)

(assert (=> d!32105 m!129055))

(assert (=> d!32105 m!128951))

(declare-fun m!129057 () Bool)

(assert (=> bm!12202 m!129057))

(declare-fun m!129059 () Bool)

(assert (=> b!113175 m!129059))

(declare-fun m!129061 () Bool)

(assert (=> b!113181 m!129061))

(assert (=> bm!12146 d!32105))

(declare-fun d!32107 () Bool)

(declare-fun res!55775 () Bool)

(declare-fun e!73558 () Bool)

(assert (=> d!32107 (=> res!55775 e!73558)))

(assert (=> d!32107 (= res!55775 (= (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32107 (= (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000) e!73558)))

(declare-fun b!113183 () Bool)

(declare-fun e!73559 () Bool)

(assert (=> b!113183 (= e!73558 e!73559)))

(declare-fun res!55776 () Bool)

(assert (=> b!113183 (=> (not res!55776) (not e!73559))))

(assert (=> b!113183 (= res!55776 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun b!113184 () Bool)

(assert (=> b!113184 (= e!73559 (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32107 (not res!55775)) b!113183))

(assert (= (and b!113183 res!55776) b!113184))

(assert (=> d!32107 m!128931))

(assert (=> b!113184 m!128511))

(declare-fun m!129063 () Bool)

(assert (=> b!113184 m!129063))

(assert (=> bm!12157 d!32107))

(declare-fun d!32109 () Bool)

(assert (=> d!32109 (= (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112977 d!32109))

(declare-fun d!32111 () Bool)

(declare-fun e!73563 () Bool)

(assert (=> d!32111 e!73563))

(declare-fun res!55777 () Bool)

(assert (=> d!32111 (=> (not res!55777) (not e!73563))))

(declare-fun lt!58647 () ListLongMap!1561)

(assert (=> d!32111 (= res!55777 (not (contains!834 lt!58647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!73566 () ListLongMap!1561)

(assert (=> d!32111 (= lt!58647 e!73566)))

(declare-fun c!20263 () Bool)

(assert (=> d!32111 (= c!20263 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32111 (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32111 (= (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) lt!58647)))

(declare-fun b!113185 () Bool)

(declare-fun e!73561 () Bool)

(declare-fun e!73565 () Bool)

(assert (=> b!113185 (= e!73561 e!73565)))

(declare-fun c!20262 () Bool)

(assert (=> b!113185 (= c!20262 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113186 () Bool)

(declare-fun lt!58648 () Unit!3503)

(declare-fun lt!58650 () Unit!3503)

(assert (=> b!113186 (= lt!58648 lt!58650)))

(declare-fun lt!58646 () (_ BitVec 64))

(declare-fun lt!58649 () V!3257)

(declare-fun lt!58651 () (_ BitVec 64))

(declare-fun lt!58645 () ListLongMap!1561)

(assert (=> b!113186 (not (contains!834 (+!142 lt!58645 (tuple2!2411 lt!58651 lt!58649)) lt!58646))))

(assert (=> b!113186 (= lt!58650 (addStillNotContains!51 lt!58645 lt!58651 lt!58649 lt!58646))))

(assert (=> b!113186 (= lt!58646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!113186 (= lt!58649 (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113186 (= lt!58651 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!12207 () ListLongMap!1561)

(assert (=> b!113186 (= lt!58645 call!12207)))

(declare-fun e!73564 () ListLongMap!1561)

(assert (=> b!113186 (= e!73564 (+!142 call!12207 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!113187 () Bool)

(assert (=> b!113187 (= e!73566 (ListLongMap!1562 Nil!1630))))

(declare-fun b!113188 () Bool)

(assert (=> b!113188 (= e!73563 e!73561)))

(declare-fun c!20264 () Bool)

(declare-fun e!73562 () Bool)

(assert (=> b!113188 (= c!20264 e!73562)))

(declare-fun res!55779 () Bool)

(assert (=> b!113188 (=> (not res!55779) (not e!73562))))

(assert (=> b!113188 (= res!55779 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113189 () Bool)

(assert (=> b!113189 (= e!73562 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113189 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!113190 () Bool)

(assert (=> b!113190 (= e!73564 call!12207)))

(declare-fun b!113191 () Bool)

(declare-fun e!73560 () Bool)

(assert (=> b!113191 (= e!73561 e!73560)))

(assert (=> b!113191 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun res!55778 () Bool)

(assert (=> b!113191 (= res!55778 (contains!834 lt!58647 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113191 (=> (not res!55778) (not e!73560))))

(declare-fun bm!12204 () Bool)

(assert (=> bm!12204 (= call!12207 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113192 () Bool)

(assert (=> b!113192 (= e!73565 (= lt!58647 (getCurrentListMapNoExtraKeys!107 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113193 () Bool)

(assert (=> b!113193 (= e!73565 (isEmpty!386 lt!58647))))

(declare-fun b!113194 () Bool)

(declare-fun res!55780 () Bool)

(assert (=> b!113194 (=> (not res!55780) (not e!73563))))

(assert (=> b!113194 (= res!55780 (not (contains!834 lt!58647 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113195 () Bool)

(assert (=> b!113195 (= e!73566 e!73564)))

(declare-fun c!20265 () Bool)

(assert (=> b!113195 (= c!20265 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113196 () Bool)

(assert (=> b!113196 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> b!113196 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2341 (_values!2643 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> b!113196 (= e!73560 (= (apply!102 lt!58647 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1359 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!32111 c!20263) b!113187))

(assert (= (and d!32111 (not c!20263)) b!113195))

(assert (= (and b!113195 c!20265) b!113186))

(assert (= (and b!113195 (not c!20265)) b!113190))

(assert (= (or b!113186 b!113190) bm!12204))

(assert (= (and d!32111 res!55777) b!113194))

(assert (= (and b!113194 res!55780) b!113188))

(assert (= (and b!113188 res!55779) b!113189))

(assert (= (and b!113188 c!20264) b!113191))

(assert (= (and b!113188 (not c!20264)) b!113185))

(assert (= (and b!113191 res!55778) b!113196))

(assert (= (and b!113185 c!20262) b!113192))

(assert (= (and b!113185 (not c!20262)) b!113193))

(declare-fun b_lambda!5065 () Bool)

(assert (=> (not b_lambda!5065) (not b!113186)))

(assert (=> b!113186 t!5794))

(declare-fun b_and!6949 () Bool)

(assert (= b_and!6945 (and (=> t!5794 result!3565) b_and!6949)))

(assert (=> b!113186 t!5796))

(declare-fun b_and!6951 () Bool)

(assert (= b_and!6947 (and (=> t!5796 result!3569) b_and!6951)))

(declare-fun b_lambda!5067 () Bool)

(assert (=> (not b_lambda!5067) (not b!113196)))

(assert (=> b!113196 t!5794))

(declare-fun b_and!6953 () Bool)

(assert (= b_and!6949 (and (=> t!5794 result!3565) b_and!6953)))

(assert (=> b!113196 t!5796))

(declare-fun b_and!6955 () Bool)

(assert (= b_and!6951 (and (=> t!5796 result!3569) b_and!6955)))

(declare-fun m!129065 () Bool)

(assert (=> b!113195 m!129065))

(assert (=> b!113195 m!129065))

(declare-fun m!129067 () Bool)

(assert (=> b!113195 m!129067))

(declare-fun m!129069 () Bool)

(assert (=> bm!12204 m!129069))

(assert (=> b!113191 m!129065))

(assert (=> b!113191 m!129065))

(declare-fun m!129071 () Bool)

(assert (=> b!113191 m!129071))

(assert (=> b!113186 m!129065))

(declare-fun m!129073 () Bool)

(assert (=> b!113186 m!129073))

(declare-fun m!129075 () Bool)

(assert (=> b!113186 m!129075))

(assert (=> b!113186 m!129073))

(declare-fun m!129077 () Bool)

(assert (=> b!113186 m!129077))

(declare-fun m!129079 () Bool)

(assert (=> b!113186 m!129079))

(assert (=> b!113186 m!128563))

(declare-fun m!129081 () Bool)

(assert (=> b!113186 m!129081))

(assert (=> b!113186 m!129077))

(assert (=> b!113186 m!128563))

(declare-fun m!129083 () Bool)

(assert (=> b!113186 m!129083))

(assert (=> b!113192 m!129069))

(declare-fun m!129085 () Bool)

(assert (=> b!113194 m!129085))

(assert (=> b!113196 m!129065))

(assert (=> b!113196 m!129077))

(assert (=> b!113196 m!128563))

(assert (=> b!113196 m!129083))

(assert (=> b!113196 m!129077))

(assert (=> b!113196 m!129065))

(declare-fun m!129087 () Bool)

(assert (=> b!113196 m!129087))

(assert (=> b!113196 m!128563))

(assert (=> b!113189 m!129065))

(assert (=> b!113189 m!129065))

(assert (=> b!113189 m!129067))

(declare-fun m!129089 () Bool)

(assert (=> b!113193 m!129089))

(declare-fun m!129091 () Bool)

(assert (=> d!32111 m!129091))

(assert (=> d!32111 m!128535))

(assert (=> bm!12086 d!32111))

(declare-fun d!32113 () Bool)

(declare-fun lt!58654 () Bool)

(declare-fun content!118 (List!1633) (InoxSet tuple2!2410))

(assert (=> d!32113 (= lt!58654 (select (content!118 (toList!796 lt!58379)) lt!58285))))

(declare-fun e!73572 () Bool)

(assert (=> d!32113 (= lt!58654 e!73572)))

(declare-fun res!55786 () Bool)

(assert (=> d!32113 (=> (not res!55786) (not e!73572))))

(assert (=> d!32113 (= res!55786 ((_ is Cons!1629) (toList!796 lt!58379)))))

(assert (=> d!32113 (= (contains!835 (toList!796 lt!58379) lt!58285) lt!58654)))

(declare-fun b!113201 () Bool)

(declare-fun e!73571 () Bool)

(assert (=> b!113201 (= e!73572 e!73571)))

(declare-fun res!55785 () Bool)

(assert (=> b!113201 (=> res!55785 e!73571)))

(assert (=> b!113201 (= res!55785 (= (h!2229 (toList!796 lt!58379)) lt!58285))))

(declare-fun b!113202 () Bool)

(assert (=> b!113202 (= e!73571 (contains!835 (t!5798 (toList!796 lt!58379)) lt!58285))))

(assert (= (and d!32113 res!55786) b!113201))

(assert (= (and b!113201 (not res!55785)) b!113202))

(declare-fun m!129093 () Bool)

(assert (=> d!32113 m!129093))

(declare-fun m!129095 () Bool)

(assert (=> d!32113 m!129095))

(declare-fun m!129097 () Bool)

(assert (=> b!113202 m!129097))

(assert (=> b!112780 d!32113))

(declare-fun d!32115 () Bool)

(declare-fun e!73573 () Bool)

(assert (=> d!32115 e!73573))

(declare-fun res!55787 () Bool)

(assert (=> d!32115 (=> res!55787 e!73573)))

(declare-fun lt!58656 () Bool)

(assert (=> d!32115 (= res!55787 (not lt!58656))))

(declare-fun lt!58658 () Bool)

(assert (=> d!32115 (= lt!58656 lt!58658)))

(declare-fun lt!58657 () Unit!3503)

(declare-fun e!73574 () Unit!3503)

(assert (=> d!32115 (= lt!58657 e!73574)))

(declare-fun c!20266 () Bool)

(assert (=> d!32115 (= c!20266 lt!58658)))

(assert (=> d!32115 (= lt!58658 (containsKey!162 (toList!796 lt!58568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32115 (= (contains!834 lt!58568 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58656)))

(declare-fun b!113203 () Bool)

(declare-fun lt!58655 () Unit!3503)

(assert (=> b!113203 (= e!73574 lt!58655)))

(assert (=> b!113203 (= lt!58655 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113203 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113204 () Bool)

(declare-fun Unit!3515 () Unit!3503)

(assert (=> b!113204 (= e!73574 Unit!3515)))

(declare-fun b!113205 () Bool)

(assert (=> b!113205 (= e!73573 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32115 c!20266) b!113203))

(assert (= (and d!32115 (not c!20266)) b!113204))

(assert (= (and d!32115 (not res!55787)) b!113205))

(declare-fun m!129099 () Bool)

(assert (=> d!32115 m!129099))

(declare-fun m!129101 () Bool)

(assert (=> b!113203 m!129101))

(declare-fun m!129103 () Bool)

(assert (=> b!113203 m!129103))

(assert (=> b!113203 m!129103))

(declare-fun m!129105 () Bool)

(assert (=> b!113203 m!129105))

(assert (=> b!113205 m!129103))

(assert (=> b!113205 m!129103))

(assert (=> b!113205 m!129105))

(assert (=> bm!12182 d!32115))

(declare-fun bm!12205 () Bool)

(declare-fun call!12211 () ListLongMap!1561)

(assert (=> bm!12205 (= call!12211 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113206 () Bool)

(declare-fun e!73585 () ListLongMap!1561)

(declare-fun call!12208 () ListLongMap!1561)

(assert (=> b!113206 (= e!73585 call!12208)))

(declare-fun b!113208 () Bool)

(declare-fun e!73586 () Bool)

(declare-fun lt!58665 () ListLongMap!1561)

(assert (=> b!113208 (= e!73586 (= (apply!102 lt!58665 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 newMap!16)))))

(declare-fun b!113209 () Bool)

(declare-fun res!55792 () Bool)

(declare-fun e!73583 () Bool)

(assert (=> b!113209 (=> (not res!55792) (not e!73583))))

(declare-fun e!73576 () Bool)

(assert (=> b!113209 (= res!55792 e!73576)))

(declare-fun res!55788 () Bool)

(assert (=> b!113209 (=> res!55788 e!73576)))

(declare-fun e!73587 () Bool)

(assert (=> b!113209 (= res!55788 (not e!73587))))

(declare-fun res!55791 () Bool)

(assert (=> b!113209 (=> (not res!55791) (not e!73587))))

(assert (=> b!113209 (= res!55791 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12206 () Bool)

(declare-fun call!12214 () ListLongMap!1561)

(declare-fun call!12212 () ListLongMap!1561)

(assert (=> bm!12206 (= call!12214 call!12212)))

(declare-fun bm!12207 () Bool)

(assert (=> bm!12207 (= call!12212 call!12211)))

(declare-fun b!113210 () Bool)

(declare-fun e!73581 () Bool)

(assert (=> b!113210 (= e!73581 e!73586)))

(declare-fun res!55794 () Bool)

(declare-fun call!12213 () Bool)

(assert (=> b!113210 (= res!55794 call!12213)))

(assert (=> b!113210 (=> (not res!55794) (not e!73586))))

(declare-fun b!113211 () Bool)

(declare-fun e!73580 () Bool)

(assert (=> b!113211 (= e!73580 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113212 () Bool)

(declare-fun e!73575 () Bool)

(assert (=> b!113212 (= e!73583 e!73575)))

(declare-fun c!20271 () Bool)

(assert (=> b!113212 (= c!20271 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113213 () Bool)

(declare-fun e!73578 () ListLongMap!1561)

(assert (=> b!113213 (= e!73578 call!12214)))

(declare-fun b!113214 () Bool)

(declare-fun e!73577 () Bool)

(assert (=> b!113214 (= e!73577 (= (apply!102 lt!58665 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2081 (_values!2643 newMap!16)) #b00000000000000000000000000000000) (dynLambda!389 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2341 (_values!2643 newMap!16))))))

(assert (=> b!113214 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12208 () Bool)

(assert (=> bm!12208 (= call!12213 (contains!834 lt!58665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!32117 () Bool)

(assert (=> d!32117 e!73583))

(declare-fun res!55790 () Bool)

(assert (=> d!32117 (=> (not res!55790) (not e!73583))))

(assert (=> d!32117 (= res!55790 (or (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))))

(declare-fun lt!58672 () ListLongMap!1561)

(assert (=> d!32117 (= lt!58665 lt!58672)))

(declare-fun lt!58667 () Unit!3503)

(declare-fun e!73579 () Unit!3503)

(assert (=> d!32117 (= lt!58667 e!73579)))

(declare-fun c!20269 () Bool)

(assert (=> d!32117 (= c!20269 e!73580)))

(declare-fun res!55793 () Bool)

(assert (=> d!32117 (=> (not res!55793) (not e!73580))))

(assert (=> d!32117 (= res!55793 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun e!73582 () ListLongMap!1561)

(assert (=> d!32117 (= lt!58672 e!73582)))

(declare-fun c!20270 () Bool)

(assert (=> d!32117 (= c!20270 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32117 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32117 (= (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58665)))

(declare-fun b!113207 () Bool)

(declare-fun e!73584 () Bool)

(assert (=> b!113207 (= e!73575 e!73584)))

(declare-fun res!55795 () Bool)

(declare-fun call!12209 () Bool)

(assert (=> b!113207 (= res!55795 call!12209)))

(assert (=> b!113207 (=> (not res!55795) (not e!73584))))

(declare-fun b!113215 () Bool)

(declare-fun lt!58670 () Unit!3503)

(assert (=> b!113215 (= e!73579 lt!58670)))

(declare-fun lt!58671 () ListLongMap!1561)

(assert (=> b!113215 (= lt!58671 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58676 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58662 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58662 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58668 () Unit!3503)

(assert (=> b!113215 (= lt!58668 (addStillContains!78 lt!58671 lt!58676 (zeroValue!2528 newMap!16) lt!58662))))

(assert (=> b!113215 (contains!834 (+!142 lt!58671 (tuple2!2411 lt!58676 (zeroValue!2528 newMap!16))) lt!58662)))

(declare-fun lt!58659 () Unit!3503)

(assert (=> b!113215 (= lt!58659 lt!58668)))

(declare-fun lt!58663 () ListLongMap!1561)

(assert (=> b!113215 (= lt!58663 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58673 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58673 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58664 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58664 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58679 () Unit!3503)

(assert (=> b!113215 (= lt!58679 (addApplyDifferent!78 lt!58663 lt!58673 (minValue!2528 newMap!16) lt!58664))))

(assert (=> b!113215 (= (apply!102 (+!142 lt!58663 (tuple2!2411 lt!58673 (minValue!2528 newMap!16))) lt!58664) (apply!102 lt!58663 lt!58664))))

(declare-fun lt!58669 () Unit!3503)

(assert (=> b!113215 (= lt!58669 lt!58679)))

(declare-fun lt!58661 () ListLongMap!1561)

(assert (=> b!113215 (= lt!58661 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58660 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58677 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58677 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58680 () Unit!3503)

(assert (=> b!113215 (= lt!58680 (addApplyDifferent!78 lt!58661 lt!58660 (zeroValue!2528 newMap!16) lt!58677))))

(assert (=> b!113215 (= (apply!102 (+!142 lt!58661 (tuple2!2411 lt!58660 (zeroValue!2528 newMap!16))) lt!58677) (apply!102 lt!58661 lt!58677))))

(declare-fun lt!58666 () Unit!3503)

(assert (=> b!113215 (= lt!58666 lt!58680)))

(declare-fun lt!58675 () ListLongMap!1561)

(assert (=> b!113215 (= lt!58675 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58674 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58674 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58678 () (_ BitVec 64))

(assert (=> b!113215 (= lt!58678 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113215 (= lt!58670 (addApplyDifferent!78 lt!58675 lt!58674 (minValue!2528 newMap!16) lt!58678))))

(assert (=> b!113215 (= (apply!102 (+!142 lt!58675 (tuple2!2411 lt!58674 (minValue!2528 newMap!16))) lt!58678) (apply!102 lt!58675 lt!58678))))

(declare-fun b!113216 () Bool)

(assert (=> b!113216 (= e!73575 (not call!12209))))

(declare-fun b!113217 () Bool)

(assert (=> b!113217 (= e!73576 e!73577)))

(declare-fun res!55796 () Bool)

(assert (=> b!113217 (=> (not res!55796) (not e!73577))))

(assert (=> b!113217 (= res!55796 (contains!834 lt!58665 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113217 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12209 () Bool)

(declare-fun c!20267 () Bool)

(declare-fun call!12210 () ListLongMap!1561)

(assert (=> bm!12209 (= call!12210 (+!142 (ite c!20270 call!12211 (ite c!20267 call!12212 call!12214)) (ite (or c!20270 c!20267) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16)))))))

(declare-fun bm!12210 () Bool)

(assert (=> bm!12210 (= call!12209 (contains!834 lt!58665 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113218 () Bool)

(assert (=> b!113218 (= e!73578 call!12208)))

(declare-fun b!113219 () Bool)

(assert (=> b!113219 (= e!73582 (+!142 call!12210 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16))))))

(declare-fun b!113220 () Bool)

(assert (=> b!113220 (= e!73581 (not call!12213))))

(declare-fun b!113221 () Bool)

(declare-fun c!20268 () Bool)

(assert (=> b!113221 (= c!20268 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!113221 (= e!73585 e!73578)))

(declare-fun b!113222 () Bool)

(declare-fun res!55789 () Bool)

(assert (=> b!113222 (=> (not res!55789) (not e!73583))))

(assert (=> b!113222 (= res!55789 e!73581)))

(declare-fun c!20272 () Bool)

(assert (=> b!113222 (= c!20272 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12211 () Bool)

(assert (=> bm!12211 (= call!12208 call!12210)))

(declare-fun b!113223 () Bool)

(assert (=> b!113223 (= e!73587 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113224 () Bool)

(declare-fun Unit!3516 () Unit!3503)

(assert (=> b!113224 (= e!73579 Unit!3516)))

(declare-fun b!113225 () Bool)

(assert (=> b!113225 (= e!73582 e!73585)))

(assert (=> b!113225 (= c!20267 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113226 () Bool)

(assert (=> b!113226 (= e!73584 (= (apply!102 lt!58665 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 newMap!16)))))

(assert (= (and d!32117 c!20270) b!113219))

(assert (= (and d!32117 (not c!20270)) b!113225))

(assert (= (and b!113225 c!20267) b!113206))

(assert (= (and b!113225 (not c!20267)) b!113221))

(assert (= (and b!113221 c!20268) b!113218))

(assert (= (and b!113221 (not c!20268)) b!113213))

(assert (= (or b!113218 b!113213) bm!12206))

(assert (= (or b!113206 bm!12206) bm!12207))

(assert (= (or b!113206 b!113218) bm!12211))

(assert (= (or b!113219 bm!12207) bm!12205))

(assert (= (or b!113219 bm!12211) bm!12209))

(assert (= (and d!32117 res!55793) b!113211))

(assert (= (and d!32117 c!20269) b!113215))

(assert (= (and d!32117 (not c!20269)) b!113224))

(assert (= (and d!32117 res!55790) b!113209))

(assert (= (and b!113209 res!55791) b!113223))

(assert (= (and b!113209 (not res!55788)) b!113217))

(assert (= (and b!113217 res!55796) b!113214))

(assert (= (and b!113209 res!55792) b!113222))

(assert (= (and b!113222 c!20272) b!113210))

(assert (= (and b!113222 (not c!20272)) b!113220))

(assert (= (and b!113210 res!55794) b!113208))

(assert (= (or b!113210 b!113220) bm!12208))

(assert (= (and b!113222 res!55789) b!113212))

(assert (= (and b!113212 c!20271) b!113207))

(assert (= (and b!113212 (not c!20271)) b!113216))

(assert (= (and b!113207 res!55795) b!113226))

(assert (= (or b!113207 b!113216) bm!12210))

(declare-fun b_lambda!5069 () Bool)

(assert (=> (not b_lambda!5069) (not b!113214)))

(assert (=> b!113214 t!5809))

(declare-fun b_and!6957 () Bool)

(assert (= b_and!6953 (and (=> t!5809 result!3585) b_and!6957)))

(assert (=> b!113214 t!5811))

(declare-fun b_and!6959 () Bool)

(assert (= b_and!6955 (and (=> t!5811 result!3587) b_and!6959)))

(declare-fun m!129107 () Bool)

(assert (=> b!113219 m!129107))

(declare-fun m!129109 () Bool)

(assert (=> b!113208 m!129109))

(declare-fun m!129111 () Bool)

(assert (=> b!113214 m!129111))

(assert (=> b!113214 m!129111))

(assert (=> b!113214 m!128945))

(declare-fun m!129113 () Bool)

(assert (=> b!113214 m!129113))

(assert (=> b!113214 m!128931))

(assert (=> b!113214 m!128931))

(declare-fun m!129115 () Bool)

(assert (=> b!113214 m!129115))

(assert (=> b!113214 m!128945))

(assert (=> d!32117 m!128951))

(declare-fun m!129117 () Bool)

(assert (=> bm!12209 m!129117))

(assert (=> b!113211 m!128931))

(assert (=> b!113211 m!128931))

(assert (=> b!113211 m!128935))

(declare-fun m!129119 () Bool)

(assert (=> bm!12208 m!129119))

(assert (=> b!113217 m!128931))

(assert (=> b!113217 m!128931))

(declare-fun m!129121 () Bool)

(assert (=> b!113217 m!129121))

(declare-fun m!129123 () Bool)

(assert (=> b!113226 m!129123))

(assert (=> b!113223 m!128931))

(assert (=> b!113223 m!128931))

(assert (=> b!113223 m!128935))

(declare-fun m!129125 () Bool)

(assert (=> bm!12205 m!129125))

(declare-fun m!129127 () Bool)

(assert (=> bm!12210 m!129127))

(assert (=> b!113215 m!129125))

(declare-fun m!129129 () Bool)

(assert (=> b!113215 m!129129))

(declare-fun m!129131 () Bool)

(assert (=> b!113215 m!129131))

(declare-fun m!129133 () Bool)

(assert (=> b!113215 m!129133))

(declare-fun m!129135 () Bool)

(assert (=> b!113215 m!129135))

(declare-fun m!129137 () Bool)

(assert (=> b!113215 m!129137))

(declare-fun m!129139 () Bool)

(assert (=> b!113215 m!129139))

(declare-fun m!129141 () Bool)

(assert (=> b!113215 m!129141))

(declare-fun m!129143 () Bool)

(assert (=> b!113215 m!129143))

(declare-fun m!129145 () Bool)

(assert (=> b!113215 m!129145))

(assert (=> b!113215 m!128931))

(assert (=> b!113215 m!129141))

(declare-fun m!129147 () Bool)

(assert (=> b!113215 m!129147))

(declare-fun m!129149 () Bool)

(assert (=> b!113215 m!129149))

(declare-fun m!129151 () Bool)

(assert (=> b!113215 m!129151))

(assert (=> b!113215 m!129143))

(assert (=> b!113215 m!129135))

(assert (=> b!113215 m!129129))

(declare-fun m!129153 () Bool)

(assert (=> b!113215 m!129153))

(declare-fun m!129155 () Bool)

(assert (=> b!113215 m!129155))

(declare-fun m!129157 () Bool)

(assert (=> b!113215 m!129157))

(assert (=> d!32057 d!32117))

(assert (=> b!112815 d!32081))

(declare-fun d!32119 () Bool)

(declare-fun e!73588 () Bool)

(assert (=> d!32119 e!73588))

(declare-fun res!55798 () Bool)

(assert (=> d!32119 (=> (not res!55798) (not e!73588))))

(declare-fun lt!58681 () ListLongMap!1561)

(assert (=> d!32119 (= res!55798 (contains!834 lt!58681 (_1!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun lt!58684 () List!1633)

(assert (=> d!32119 (= lt!58681 (ListLongMap!1562 lt!58684))))

(declare-fun lt!58683 () Unit!3503)

(declare-fun lt!58682 () Unit!3503)

(assert (=> d!32119 (= lt!58683 lt!58682)))

(assert (=> d!32119 (= (getValueByKey!158 lt!58684 (_1!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))) (Some!163 (_2!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(assert (=> d!32119 (= lt!58682 (lemmaContainsTupThenGetReturnValue!77 lt!58684 (_1!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (_2!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(assert (=> d!32119 (= lt!58684 (insertStrictlySorted!80 (toList!796 (ite c!20225 call!12185 (ite c!20222 call!12186 call!12188))) (_1!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (_2!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(assert (=> d!32119 (= (+!142 (ite c!20225 call!12185 (ite c!20222 call!12186 call!12188)) (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58681)))

(declare-fun b!113227 () Bool)

(declare-fun res!55797 () Bool)

(assert (=> b!113227 (=> (not res!55797) (not e!73588))))

(assert (=> b!113227 (= res!55797 (= (getValueByKey!158 (toList!796 lt!58681) (_1!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))) (Some!163 (_2!1216 (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))))

(declare-fun b!113228 () Bool)

(assert (=> b!113228 (= e!73588 (contains!835 (toList!796 lt!58681) (ite (or c!20225 c!20222) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (= (and d!32119 res!55798) b!113227))

(assert (= (and b!113227 res!55797) b!113228))

(declare-fun m!129159 () Bool)

(assert (=> d!32119 m!129159))

(declare-fun m!129161 () Bool)

(assert (=> d!32119 m!129161))

(declare-fun m!129163 () Bool)

(assert (=> d!32119 m!129163))

(declare-fun m!129165 () Bool)

(assert (=> d!32119 m!129165))

(declare-fun m!129167 () Bool)

(assert (=> b!113227 m!129167))

(declare-fun m!129169 () Bool)

(assert (=> b!113228 m!129169))

(assert (=> bm!12183 d!32119))

(declare-fun d!32121 () Bool)

(declare-fun isEmpty!387 (List!1633) Bool)

(assert (=> d!32121 (= (isEmpty!386 lt!58399) (isEmpty!387 (toList!796 lt!58399)))))

(declare-fun bs!4637 () Bool)

(assert (= bs!4637 d!32121))

(declare-fun m!129171 () Bool)

(assert (=> bs!4637 m!129171))

(assert (=> b!112813 d!32121))

(declare-fun d!32123 () Bool)

(declare-fun res!55803 () Bool)

(declare-fun e!73593 () Bool)

(assert (=> d!32123 (=> res!55803 e!73593)))

(assert (=> d!32123 (= res!55803 (and ((_ is Cons!1629) (toList!796 lt!58287)) (= (_1!1216 (h!2229 (toList!796 lt!58287))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(assert (=> d!32123 (= (containsKey!162 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) e!73593)))

(declare-fun b!113233 () Bool)

(declare-fun e!73594 () Bool)

(assert (=> b!113233 (= e!73593 e!73594)))

(declare-fun res!55804 () Bool)

(assert (=> b!113233 (=> (not res!55804) (not e!73594))))

(assert (=> b!113233 (= res!55804 (and (or (not ((_ is Cons!1629) (toList!796 lt!58287))) (bvsle (_1!1216 (h!2229 (toList!796 lt!58287))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))) ((_ is Cons!1629) (toList!796 lt!58287)) (bvslt (_1!1216 (h!2229 (toList!796 lt!58287))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(declare-fun b!113234 () Bool)

(assert (=> b!113234 (= e!73594 (containsKey!162 (t!5798 (toList!796 lt!58287)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (= (and d!32123 (not res!55803)) b!113233))

(assert (= (and b!113233 res!55804) b!113234))

(assert (=> b!113234 m!128511))

(declare-fun m!129173 () Bool)

(assert (=> b!113234 m!129173))

(assert (=> d!32045 d!32123))

(assert (=> d!32059 d!32041))

(assert (=> d!32061 d!32065))

(declare-fun d!32125 () Bool)

(assert (=> d!32125 (not (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!32125 true))

(declare-fun _$68!118 () Unit!3503)

(assert (=> d!32125 (= (choose!68 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629)) _$68!118)))

(declare-fun bs!4638 () Bool)

(assert (= bs!4638 d!32125))

(assert (=> bs!4638 m!128511))

(assert (=> bs!4638 m!128515))

(assert (=> d!32061 d!32125))

(declare-fun d!32127 () Bool)

(declare-fun lt!58685 () Bool)

(assert (=> d!32127 (= lt!58685 (select (content!117 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!73596 () Bool)

(assert (=> d!32127 (= lt!58685 e!73596)))

(declare-fun res!55806 () Bool)

(assert (=> d!32127 (=> (not res!55806) (not e!73596))))

(assert (=> d!32127 (= res!55806 ((_ is Cons!1628) Nil!1629))))

(assert (=> d!32127 (= (contains!836 Nil!1629 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)) lt!58685)))

(declare-fun b!113235 () Bool)

(declare-fun e!73595 () Bool)

(assert (=> b!113235 (= e!73596 e!73595)))

(declare-fun res!55805 () Bool)

(assert (=> b!113235 (=> res!55805 e!73595)))

(assert (=> b!113235 (= res!55805 (= (h!2228 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113236 () Bool)

(assert (=> b!113236 (= e!73595 (contains!836 (t!5797 Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32127 res!55806) b!113235))

(assert (= (and b!113235 (not res!55805)) b!113236))

(assert (=> d!32127 m!129049))

(assert (=> d!32127 m!128845))

(declare-fun m!129175 () Bool)

(assert (=> d!32127 m!129175))

(assert (=> b!113236 m!128845))

(declare-fun m!129177 () Bool)

(assert (=> b!113236 m!129177))

(assert (=> b!112981 d!32127))

(declare-fun d!32129 () Bool)

(declare-fun res!55807 () Bool)

(declare-fun e!73597 () Bool)

(assert (=> d!32129 (=> (not res!55807) (not e!73597))))

(assert (=> d!32129 (= res!55807 (simpleValid!78 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32129 (= (valid!435 (v!2949 (underlying!369 thiss!992))) e!73597)))

(declare-fun b!113237 () Bool)

(declare-fun res!55808 () Bool)

(assert (=> b!113237 (=> (not res!55808) (not e!73597))))

(assert (=> b!113237 (= res!55808 (= (arrayCountValidKeys!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))) (_size!513 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113238 () Bool)

(declare-fun res!55809 () Bool)

(assert (=> b!113238 (=> (not res!55809) (not e!73597))))

(assert (=> b!113238 (= res!55809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113239 () Bool)

(assert (=> b!113239 (= e!73597 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 Nil!1629))))

(assert (= (and d!32129 res!55807) b!113237))

(assert (= (and b!113237 res!55808) b!113238))

(assert (= (and b!113238 res!55809) b!113239))

(declare-fun m!129179 () Bool)

(assert (=> d!32129 m!129179))

(declare-fun m!129181 () Bool)

(assert (=> b!113237 m!129181))

(assert (=> b!113238 m!128519))

(assert (=> b!113239 m!128551))

(assert (=> d!32075 d!32129))

(declare-fun d!32131 () Bool)

(assert (=> d!32131 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000)))

(declare-fun lt!58688 () Unit!3503)

(declare-fun choose!13 (array!4393 (_ BitVec 64) (_ BitVec 32)) Unit!3503)

(assert (=> d!32131 (= lt!58688 (choose!13 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000))))

(assert (=> d!32131 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!32131 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000) lt!58688)))

(declare-fun bs!4639 () Bool)

(assert (= bs!4639 d!32131))

(assert (=> bs!4639 m!128857))

(declare-fun m!129183 () Bool)

(assert (=> bs!4639 m!129183))

(assert (=> b!112990 d!32131))

(declare-fun d!32133 () Bool)

(declare-fun res!55810 () Bool)

(declare-fun e!73598 () Bool)

(assert (=> d!32133 (=> res!55810 e!73598)))

(assert (=> d!32133 (= res!55810 (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) lt!58516))))

(assert (=> d!32133 (= (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 #b00000000000000000000000000000000) e!73598)))

(declare-fun b!113240 () Bool)

(declare-fun e!73599 () Bool)

(assert (=> b!113240 (= e!73598 e!73599)))

(declare-fun res!55811 () Bool)

(assert (=> b!113240 (=> (not res!55811) (not e!73599))))

(assert (=> b!113240 (= res!55811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113241 () Bool)

(assert (=> b!113241 (= e!73599 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32133 (not res!55810)) b!113240))

(assert (= (and b!113240 res!55811) b!113241))

(assert (=> d!32133 m!128845))

(declare-fun m!129185 () Bool)

(assert (=> b!113241 m!129185))

(assert (=> b!112990 d!32133))

(declare-fun b!113254 () Bool)

(declare-fun e!73608 () SeekEntryResult!266)

(declare-fun lt!58695 () SeekEntryResult!266)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4393 (_ BitVec 32)) SeekEntryResult!266)

(assert (=> b!113254 (= e!73608 (seekKeyOrZeroReturnVacant!0 (x!14186 lt!58695) (index!3218 lt!58695) (index!3218 lt!58695) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113255 () Bool)

(declare-fun e!73606 () SeekEntryResult!266)

(assert (=> b!113255 (= e!73606 (Found!266 (index!3218 lt!58695)))))

(declare-fun b!113256 () Bool)

(declare-fun e!73607 () SeekEntryResult!266)

(assert (=> b!113256 (= e!73607 e!73606)))

(declare-fun lt!58696 () (_ BitVec 64))

(assert (=> b!113256 (= lt!58696 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (index!3218 lt!58695)))))

(declare-fun c!20280 () Bool)

(assert (=> b!113256 (= c!20280 (= lt!58696 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!32135 () Bool)

(declare-fun lt!58697 () SeekEntryResult!266)

(assert (=> d!32135 (and (or ((_ is Undefined!266) lt!58697) (not ((_ is Found!266) lt!58697)) (and (bvsge (index!3217 lt!58697) #b00000000000000000000000000000000) (bvslt (index!3217 lt!58697) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))) (or ((_ is Undefined!266) lt!58697) ((_ is Found!266) lt!58697) (not ((_ is MissingZero!266) lt!58697)) (and (bvsge (index!3216 lt!58697) #b00000000000000000000000000000000) (bvslt (index!3216 lt!58697) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))) (or ((_ is Undefined!266) lt!58697) ((_ is Found!266) lt!58697) ((_ is MissingZero!266) lt!58697) (not ((_ is MissingVacant!266) lt!58697)) (and (bvsge (index!3219 lt!58697) #b00000000000000000000000000000000) (bvslt (index!3219 lt!58697) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))) (or ((_ is Undefined!266) lt!58697) (ite ((_ is Found!266) lt!58697) (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (index!3217 lt!58697)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!266) lt!58697) (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (index!3216 lt!58697)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!266) lt!58697) (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (index!3219 lt!58697)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32135 (= lt!58697 e!73607)))

(declare-fun c!20281 () Bool)

(assert (=> d!32135 (= c!20281 (and ((_ is Intermediate!266) lt!58695) (undefined!1078 lt!58695)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4393 (_ BitVec 32)) SeekEntryResult!266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!32135 (= lt!58695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) (mask!6843 (v!2949 (underlying!369 thiss!992)))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))))))

(assert (=> d!32135 (validMask!0 (mask!6843 (v!2949 (underlying!369 thiss!992))))))

(assert (=> d!32135 (= (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))) lt!58697)))

(declare-fun b!113257 () Bool)

(assert (=> b!113257 (= e!73608 (MissingZero!266 (index!3218 lt!58695)))))

(declare-fun b!113258 () Bool)

(assert (=> b!113258 (= e!73607 Undefined!266)))

(declare-fun b!113259 () Bool)

(declare-fun c!20279 () Bool)

(assert (=> b!113259 (= c!20279 (= lt!58696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113259 (= e!73606 e!73608)))

(assert (= (and d!32135 c!20281) b!113258))

(assert (= (and d!32135 (not c!20281)) b!113256))

(assert (= (and b!113256 c!20280) b!113255))

(assert (= (and b!113256 (not c!20280)) b!113259))

(assert (= (and b!113259 c!20279) b!113257))

(assert (= (and b!113259 (not c!20279)) b!113254))

(assert (=> b!113254 m!128845))

(declare-fun m!129187 () Bool)

(assert (=> b!113254 m!129187))

(declare-fun m!129189 () Bool)

(assert (=> b!113256 m!129189))

(assert (=> d!32135 m!128535))

(declare-fun m!129191 () Bool)

(assert (=> d!32135 m!129191))

(assert (=> d!32135 m!128845))

(declare-fun m!129193 () Bool)

(assert (=> d!32135 m!129193))

(declare-fun m!129195 () Bool)

(assert (=> d!32135 m!129195))

(declare-fun m!129197 () Bool)

(assert (=> d!32135 m!129197))

(assert (=> d!32135 m!128845))

(assert (=> d!32135 m!129191))

(declare-fun m!129199 () Bool)

(assert (=> d!32135 m!129199))

(assert (=> b!112990 d!32135))

(assert (=> b!112946 d!32117))

(assert (=> b!113053 d!32081))

(declare-fun d!32137 () Bool)

(assert (=> d!32137 (= (get!1360 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2948 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> b!113078 d!32137))

(assert (=> b!112992 d!32109))

(declare-fun b!113271 () Bool)

(declare-fun e!73611 () Bool)

(assert (=> b!113271 (= e!73611 (and (bvsge (extraKeys!2451 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2451 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!513 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!113268 () Bool)

(declare-fun res!55820 () Bool)

(assert (=> b!113268 (=> (not res!55820) (not e!73611))))

(assert (=> b!113268 (= res!55820 (and (= (size!2341 (_values!2643 newMap!16)) (bvadd (mask!6843 newMap!16) #b00000000000000000000000000000001)) (= (size!2340 (_keys!4379 newMap!16)) (size!2341 (_values!2643 newMap!16))) (bvsge (_size!513 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!513 newMap!16) (bvadd (mask!6843 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!113270 () Bool)

(declare-fun res!55823 () Bool)

(assert (=> b!113270 (=> (not res!55823) (not e!73611))))

(declare-fun size!2346 (LongMapFixedSize!928) (_ BitVec 32))

(assert (=> b!113270 (= res!55823 (= (size!2346 newMap!16) (bvadd (_size!513 newMap!16) (bvsdiv (bvadd (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!32139 () Bool)

(declare-fun res!55822 () Bool)

(assert (=> d!32139 (=> (not res!55822) (not e!73611))))

(assert (=> d!32139 (= res!55822 (validMask!0 (mask!6843 newMap!16)))))

(assert (=> d!32139 (= (simpleValid!78 newMap!16) e!73611)))

(declare-fun b!113269 () Bool)

(declare-fun res!55821 () Bool)

(assert (=> b!113269 (=> (not res!55821) (not e!73611))))

(assert (=> b!113269 (= res!55821 (bvsge (size!2346 newMap!16) (_size!513 newMap!16)))))

(assert (= (and d!32139 res!55822) b!113268))

(assert (= (and b!113268 res!55820) b!113269))

(assert (= (and b!113269 res!55821) b!113270))

(assert (= (and b!113270 res!55823) b!113271))

(declare-fun m!129201 () Bool)

(assert (=> b!113270 m!129201))

(assert (=> d!32139 m!128951))

(assert (=> b!113269 m!129201))

(assert (=> d!32043 d!32139))

(declare-fun d!32141 () Bool)

(declare-fun e!73612 () Bool)

(assert (=> d!32141 e!73612))

(declare-fun res!55824 () Bool)

(assert (=> d!32141 (=> res!55824 e!73612)))

(declare-fun lt!58699 () Bool)

(assert (=> d!32141 (= res!55824 (not lt!58699))))

(declare-fun lt!58701 () Bool)

(assert (=> d!32141 (= lt!58699 lt!58701)))

(declare-fun lt!58700 () Unit!3503)

(declare-fun e!73613 () Unit!3503)

(assert (=> d!32141 (= lt!58700 e!73613)))

(declare-fun c!20282 () Bool)

(assert (=> d!32141 (= c!20282 lt!58701)))

(assert (=> d!32141 (= lt!58701 (containsKey!162 (toList!796 lt!58399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32141 (= (contains!834 lt!58399 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58699)))

(declare-fun b!113272 () Bool)

(declare-fun lt!58698 () Unit!3503)

(assert (=> b!113272 (= e!73613 lt!58698)))

(assert (=> b!113272 (= lt!58698 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113272 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113273 () Bool)

(declare-fun Unit!3517 () Unit!3503)

(assert (=> b!113273 (= e!73613 Unit!3517)))

(declare-fun b!113274 () Bool)

(assert (=> b!113274 (= e!73612 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32141 c!20282) b!113272))

(assert (= (and d!32141 (not c!20282)) b!113273))

(assert (= (and d!32141 (not res!55824)) b!113274))

(declare-fun m!129203 () Bool)

(assert (=> d!32141 m!129203))

(declare-fun m!129205 () Bool)

(assert (=> b!113272 m!129205))

(declare-fun m!129207 () Bool)

(assert (=> b!113272 m!129207))

(assert (=> b!113272 m!129207))

(declare-fun m!129209 () Bool)

(assert (=> b!113272 m!129209))

(assert (=> b!113274 m!129207))

(assert (=> b!113274 m!129207))

(assert (=> b!113274 m!129209))

(assert (=> d!32033 d!32141))

(assert (=> d!32033 d!32041))

(declare-fun bm!12212 () Bool)

(declare-fun call!12215 () Bool)

(declare-fun c!20283 () Bool)

(assert (=> bm!12212 (= call!12215 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20283 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!20231 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629) Nil!1629)) (ite c!20231 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629) Nil!1629))))))

(declare-fun b!113275 () Bool)

(declare-fun e!73617 () Bool)

(declare-fun e!73615 () Bool)

(assert (=> b!113275 (= e!73617 e!73615)))

(declare-fun res!55825 () Bool)

(assert (=> b!113275 (=> (not res!55825) (not e!73615))))

(declare-fun e!73614 () Bool)

(assert (=> b!113275 (= res!55825 (not e!73614))))

(declare-fun res!55827 () Bool)

(assert (=> b!113275 (=> (not res!55827) (not e!73614))))

(assert (=> b!113275 (= res!55827 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113276 () Bool)

(declare-fun e!73616 () Bool)

(assert (=> b!113276 (= e!73615 e!73616)))

(assert (=> b!113276 (= c!20283 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!32143 () Bool)

(declare-fun res!55826 () Bool)

(assert (=> d!32143 (=> res!55826 e!73617)))

(assert (=> d!32143 (= res!55826 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32143 (= (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20231 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629) Nil!1629)) e!73617)))

(declare-fun b!113277 () Bool)

(assert (=> b!113277 (= e!73616 call!12215)))

(declare-fun b!113278 () Bool)

(assert (=> b!113278 (= e!73616 call!12215)))

(declare-fun b!113279 () Bool)

(assert (=> b!113279 (= e!73614 (contains!836 (ite c!20231 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) Nil!1629) Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!32143 (not res!55826)) b!113275))

(assert (= (and b!113275 res!55827) b!113279))

(assert (= (and b!113275 res!55825) b!113276))

(assert (= (and b!113276 c!20283) b!113278))

(assert (= (and b!113276 (not c!20283)) b!113277))

(assert (= (or b!113278 b!113277) bm!12212))

(declare-fun m!129211 () Bool)

(assert (=> bm!12212 m!129211))

(declare-fun m!129213 () Bool)

(assert (=> bm!12212 m!129213))

(assert (=> b!113275 m!129211))

(assert (=> b!113275 m!129211))

(declare-fun m!129215 () Bool)

(assert (=> b!113275 m!129215))

(assert (=> b!113276 m!129211))

(assert (=> b!113276 m!129211))

(assert (=> b!113276 m!129215))

(assert (=> b!113279 m!129211))

(assert (=> b!113279 m!129211))

(declare-fun m!129217 () Bool)

(assert (=> b!113279 m!129217))

(assert (=> bm!12186 d!32143))

(declare-fun b!113280 () Bool)

(declare-fun e!73620 () SeekEntryResult!266)

(declare-fun lt!58702 () SeekEntryResult!266)

(assert (=> b!113280 (= e!73620 (seekKeyOrZeroReturnVacant!0 (x!14186 lt!58702) (index!3218 lt!58702) (index!3218 lt!58702) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun b!113281 () Bool)

(declare-fun e!73618 () SeekEntryResult!266)

(assert (=> b!113281 (= e!73618 (Found!266 (index!3218 lt!58702)))))

(declare-fun b!113282 () Bool)

(declare-fun e!73619 () SeekEntryResult!266)

(assert (=> b!113282 (= e!73619 e!73618)))

(declare-fun lt!58703 () (_ BitVec 64))

(assert (=> b!113282 (= lt!58703 (select (arr!2080 (_keys!4379 newMap!16)) (index!3218 lt!58702)))))

(declare-fun c!20285 () Bool)

(assert (=> b!113282 (= c!20285 (= lt!58703 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun lt!58704 () SeekEntryResult!266)

(declare-fun d!32145 () Bool)

(assert (=> d!32145 (and (or ((_ is Undefined!266) lt!58704) (not ((_ is Found!266) lt!58704)) (and (bvsge (index!3217 lt!58704) #b00000000000000000000000000000000) (bvslt (index!3217 lt!58704) (size!2340 (_keys!4379 newMap!16))))) (or ((_ is Undefined!266) lt!58704) ((_ is Found!266) lt!58704) (not ((_ is MissingZero!266) lt!58704)) (and (bvsge (index!3216 lt!58704) #b00000000000000000000000000000000) (bvslt (index!3216 lt!58704) (size!2340 (_keys!4379 newMap!16))))) (or ((_ is Undefined!266) lt!58704) ((_ is Found!266) lt!58704) ((_ is MissingZero!266) lt!58704) (not ((_ is MissingVacant!266) lt!58704)) (and (bvsge (index!3219 lt!58704) #b00000000000000000000000000000000) (bvslt (index!3219 lt!58704) (size!2340 (_keys!4379 newMap!16))))) (or ((_ is Undefined!266) lt!58704) (ite ((_ is Found!266) lt!58704) (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58704)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (ite ((_ is MissingZero!266) lt!58704) (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3216 lt!58704)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!266) lt!58704) (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3219 lt!58704)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32145 (= lt!58704 e!73619)))

(declare-fun c!20286 () Bool)

(assert (=> d!32145 (= c!20286 (and ((_ is Intermediate!266) lt!58702) (undefined!1078 lt!58702)))))

(assert (=> d!32145 (= lt!58702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (mask!6843 newMap!16)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(assert (=> d!32145 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32145 (= (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)) lt!58704)))

(declare-fun b!113283 () Bool)

(assert (=> b!113283 (= e!73620 (MissingZero!266 (index!3218 lt!58702)))))

(declare-fun b!113284 () Bool)

(assert (=> b!113284 (= e!73619 Undefined!266)))

(declare-fun b!113285 () Bool)

(declare-fun c!20284 () Bool)

(assert (=> b!113285 (= c!20284 (= lt!58703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113285 (= e!73618 e!73620)))

(assert (= (and d!32145 c!20286) b!113284))

(assert (= (and d!32145 (not c!20286)) b!113282))

(assert (= (and b!113282 c!20285) b!113281))

(assert (= (and b!113282 (not c!20285)) b!113285))

(assert (= (and b!113285 c!20284) b!113283))

(assert (= (and b!113285 (not c!20284)) b!113280))

(assert (=> b!113280 m!128511))

(declare-fun m!129219 () Bool)

(assert (=> b!113280 m!129219))

(declare-fun m!129221 () Bool)

(assert (=> b!113282 m!129221))

(assert (=> d!32145 m!128951))

(declare-fun m!129223 () Bool)

(assert (=> d!32145 m!129223))

(assert (=> d!32145 m!128511))

(declare-fun m!129225 () Bool)

(assert (=> d!32145 m!129225))

(declare-fun m!129227 () Bool)

(assert (=> d!32145 m!129227))

(declare-fun m!129229 () Bool)

(assert (=> d!32145 m!129229))

(assert (=> d!32145 m!128511))

(assert (=> d!32145 m!129223))

(declare-fun m!129231 () Bool)

(assert (=> d!32145 m!129231))

(assert (=> b!112947 d!32145))

(declare-fun d!32147 () Bool)

(declare-fun lt!58705 () Bool)

(assert (=> d!32147 (= lt!58705 (select (content!118 (toList!796 lt!58404)) lt!58284))))

(declare-fun e!73622 () Bool)

(assert (=> d!32147 (= lt!58705 e!73622)))

(declare-fun res!55829 () Bool)

(assert (=> d!32147 (=> (not res!55829) (not e!73622))))

(assert (=> d!32147 (= res!55829 ((_ is Cons!1629) (toList!796 lt!58404)))))

(assert (=> d!32147 (= (contains!835 (toList!796 lt!58404) lt!58284) lt!58705)))

(declare-fun b!113286 () Bool)

(declare-fun e!73621 () Bool)

(assert (=> b!113286 (= e!73622 e!73621)))

(declare-fun res!55828 () Bool)

(assert (=> b!113286 (=> res!55828 e!73621)))

(assert (=> b!113286 (= res!55828 (= (h!2229 (toList!796 lt!58404)) lt!58284))))

(declare-fun b!113287 () Bool)

(assert (=> b!113287 (= e!73621 (contains!835 (t!5798 (toList!796 lt!58404)) lt!58284))))

(assert (= (and d!32147 res!55829) b!113286))

(assert (= (and b!113286 (not res!55828)) b!113287))

(declare-fun m!129233 () Bool)

(assert (=> d!32147 m!129233))

(declare-fun m!129235 () Bool)

(assert (=> d!32147 m!129235))

(declare-fun m!129237 () Bool)

(assert (=> b!113287 m!129237))

(assert (=> b!112818 d!32147))

(declare-fun d!32149 () Bool)

(declare-fun res!55830 () Bool)

(declare-fun e!73623 () Bool)

(assert (=> d!32149 (=> res!55830 e!73623)))

(assert (=> d!32149 (= res!55830 (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32149 (= (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!73623)))

(declare-fun b!113288 () Bool)

(declare-fun e!73624 () Bool)

(assert (=> b!113288 (= e!73623 e!73624)))

(declare-fun res!55831 () Bool)

(assert (=> b!113288 (=> (not res!55831) (not e!73624))))

(assert (=> b!113288 (= res!55831 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(declare-fun b!113289 () Bool)

(assert (=> b!113289 (= e!73624 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!32149 (not res!55830)) b!113288))

(assert (= (and b!113288 res!55831) b!113289))

(assert (=> d!32149 m!129065))

(assert (=> b!113289 m!128511))

(declare-fun m!129239 () Bool)

(assert (=> b!113289 m!129239))

(assert (=> b!113062 d!32149))

(declare-fun d!32151 () Bool)

(assert (=> d!32151 (= (apply!102 lt!58568 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1362 (getValueByKey!158 (toList!796 lt!58568) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4640 () Bool)

(assert (= bs!4640 d!32151))

(assert (=> bs!4640 m!129103))

(assert (=> bs!4640 m!129103))

(declare-fun m!129241 () Bool)

(assert (=> bs!4640 m!129241))

(assert (=> b!113038 d!32151))

(declare-fun d!32153 () Bool)

(declare-fun lt!58706 () Bool)

(assert (=> d!32153 (= lt!58706 (select (content!118 (toList!796 lt!58412)) lt!58284))))

(declare-fun e!73626 () Bool)

(assert (=> d!32153 (= lt!58706 e!73626)))

(declare-fun res!55833 () Bool)

(assert (=> d!32153 (=> (not res!55833) (not e!73626))))

(assert (=> d!32153 (= res!55833 ((_ is Cons!1629) (toList!796 lt!58412)))))

(assert (=> d!32153 (= (contains!835 (toList!796 lt!58412) lt!58284) lt!58706)))

(declare-fun b!113290 () Bool)

(declare-fun e!73625 () Bool)

(assert (=> b!113290 (= e!73626 e!73625)))

(declare-fun res!55832 () Bool)

(assert (=> b!113290 (=> res!55832 e!73625)))

(assert (=> b!113290 (= res!55832 (= (h!2229 (toList!796 lt!58412)) lt!58284))))

(declare-fun b!113291 () Bool)

(assert (=> b!113291 (= e!73625 (contains!835 (t!5798 (toList!796 lt!58412)) lt!58284))))

(assert (= (and d!32153 res!55833) b!113290))

(assert (= (and b!113290 (not res!55832)) b!113291))

(declare-fun m!129243 () Bool)

(assert (=> d!32153 m!129243))

(declare-fun m!129245 () Bool)

(assert (=> d!32153 m!129245))

(declare-fun m!129247 () Bool)

(assert (=> b!113291 m!129247))

(assert (=> b!112822 d!32153))

(declare-fun d!32155 () Bool)

(declare-fun e!73629 () Bool)

(assert (=> d!32155 e!73629))

(declare-fun c!20289 () Bool)

(assert (=> d!32155 (= c!20289 (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32155 true))

(declare-fun _$29!153 () Unit!3503)

(assert (=> d!32155 (= (choose!718 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (_values!2643 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992))) (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) (minValue!2528 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992)))) _$29!153)))

(declare-fun b!113296 () Bool)

(assert (=> b!113296 (= e!73629 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!113297 () Bool)

(assert (=> b!113297 (= e!73629 (ite (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32155 c!20289) b!113296))

(assert (= (and d!32155 (not c!20289)) b!113297))

(assert (=> b!113296 m!128511))

(assert (=> b!113296 m!128515))

(assert (=> d!32067 d!32155))

(assert (=> d!32067 d!32041))

(declare-fun d!32157 () Bool)

(declare-fun res!55835 () Bool)

(declare-fun e!73630 () Bool)

(assert (=> d!32157 (=> res!55835 e!73630)))

(assert (=> d!32157 (= res!55835 (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(assert (=> d!32157 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 newMap!16) (mask!6843 newMap!16)) e!73630)))

(declare-fun bm!12213 () Bool)

(declare-fun call!12216 () Bool)

(assert (=> bm!12213 (= call!12216 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun b!113298 () Bool)

(declare-fun e!73632 () Bool)

(declare-fun e!73631 () Bool)

(assert (=> b!113298 (= e!73632 e!73631)))

(declare-fun lt!58708 () (_ BitVec 64))

(assert (=> b!113298 (= lt!58708 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58707 () Unit!3503)

(assert (=> b!113298 (= lt!58707 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4379 newMap!16) lt!58708 #b00000000000000000000000000000000))))

(assert (=> b!113298 (arrayContainsKey!0 (_keys!4379 newMap!16) lt!58708 #b00000000000000000000000000000000)))

(declare-fun lt!58709 () Unit!3503)

(assert (=> b!113298 (= lt!58709 lt!58707)))

(declare-fun res!55834 () Bool)

(assert (=> b!113298 (= res!55834 (= (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000) (_keys!4379 newMap!16) (mask!6843 newMap!16)) (Found!266 #b00000000000000000000000000000000)))))

(assert (=> b!113298 (=> (not res!55834) (not e!73631))))

(declare-fun b!113299 () Bool)

(assert (=> b!113299 (= e!73631 call!12216)))

(declare-fun b!113300 () Bool)

(assert (=> b!113300 (= e!73630 e!73632)))

(declare-fun c!20290 () Bool)

(assert (=> b!113300 (= c!20290 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113301 () Bool)

(assert (=> b!113301 (= e!73632 call!12216)))

(assert (= (and d!32157 (not res!55835)) b!113300))

(assert (= (and b!113300 c!20290) b!113298))

(assert (= (and b!113300 (not c!20290)) b!113301))

(assert (= (and b!113298 res!55834) b!113299))

(assert (= (or b!113299 b!113301) bm!12213))

(declare-fun m!129249 () Bool)

(assert (=> bm!12213 m!129249))

(assert (=> b!113298 m!128931))

(declare-fun m!129251 () Bool)

(assert (=> b!113298 m!129251))

(declare-fun m!129253 () Bool)

(assert (=> b!113298 m!129253))

(assert (=> b!113298 m!128931))

(declare-fun m!129255 () Bool)

(assert (=> b!113298 m!129255))

(assert (=> b!113300 m!128931))

(assert (=> b!113300 m!128931))

(assert (=> b!113300 m!128935))

(assert (=> b!112830 d!32157))

(declare-fun d!32159 () Bool)

(assert (=> d!32159 (= (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (and (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113070 d!32159))

(assert (=> b!112949 d!32117))

(declare-fun d!32161 () Bool)

(declare-fun lt!58710 () Bool)

(assert (=> d!32161 (= lt!58710 (select (content!118 (toList!796 lt!58408)) lt!58285))))

(declare-fun e!73634 () Bool)

(assert (=> d!32161 (= lt!58710 e!73634)))

(declare-fun res!55837 () Bool)

(assert (=> d!32161 (=> (not res!55837) (not e!73634))))

(assert (=> d!32161 (= res!55837 ((_ is Cons!1629) (toList!796 lt!58408)))))

(assert (=> d!32161 (= (contains!835 (toList!796 lt!58408) lt!58285) lt!58710)))

(declare-fun b!113302 () Bool)

(declare-fun e!73633 () Bool)

(assert (=> b!113302 (= e!73634 e!73633)))

(declare-fun res!55836 () Bool)

(assert (=> b!113302 (=> res!55836 e!73633)))

(assert (=> b!113302 (= res!55836 (= (h!2229 (toList!796 lt!58408)) lt!58285))))

(declare-fun b!113303 () Bool)

(assert (=> b!113303 (= e!73633 (contains!835 (t!5798 (toList!796 lt!58408)) lt!58285))))

(assert (= (and d!32161 res!55837) b!113302))

(assert (= (and b!113302 (not res!55836)) b!113303))

(declare-fun m!129257 () Bool)

(assert (=> d!32161 m!129257))

(declare-fun m!129259 () Bool)

(assert (=> d!32161 m!129259))

(declare-fun m!129261 () Bool)

(assert (=> b!113303 m!129261))

(assert (=> b!112820 d!32161))

(declare-fun d!32163 () Bool)

(assert (=> d!32163 (= (map!1288 (_2!1217 lt!58490)) (getCurrentListMap!472 (_keys!4379 (_2!1217 lt!58490)) (_values!2643 (_2!1217 lt!58490)) (mask!6843 (_2!1217 lt!58490)) (extraKeys!2451 (_2!1217 lt!58490)) (zeroValue!2528 (_2!1217 lt!58490)) (minValue!2528 (_2!1217 lt!58490)) #b00000000000000000000000000000000 (defaultEntry!2660 (_2!1217 lt!58490))))))

(declare-fun bs!4641 () Bool)

(assert (= bs!4641 d!32163))

(declare-fun m!129263 () Bool)

(assert (=> bs!4641 m!129263))

(assert (=> bm!12147 d!32163))

(assert (=> b!113067 d!32065))

(declare-fun d!32165 () Bool)

(assert (=> d!32165 (isDefined!112 (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun lt!58713 () Unit!3503)

(declare-fun choose!722 (List!1633 (_ BitVec 64)) Unit!3503)

(assert (=> d!32165 (= lt!58713 (choose!722 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun e!73637 () Bool)

(assert (=> d!32165 e!73637))

(declare-fun res!55840 () Bool)

(assert (=> d!32165 (=> (not res!55840) (not e!73637))))

(declare-fun isStrictlySorted!308 (List!1633) Bool)

(assert (=> d!32165 (= res!55840 (isStrictlySorted!308 (toList!796 lt!58287)))))

(assert (=> d!32165 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) lt!58713)))

(declare-fun b!113306 () Bool)

(assert (=> b!113306 (= e!73637 (containsKey!162 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (= (and d!32165 res!55840) b!113306))

(assert (=> d!32165 m!128511))

(assert (=> d!32165 m!128785))

(assert (=> d!32165 m!128785))

(assert (=> d!32165 m!128787))

(assert (=> d!32165 m!128511))

(declare-fun m!129265 () Bool)

(assert (=> d!32165 m!129265))

(declare-fun m!129267 () Bool)

(assert (=> d!32165 m!129267))

(assert (=> b!113306 m!128511))

(assert (=> b!113306 m!128781))

(assert (=> b!112838 d!32165))

(declare-fun d!32167 () Bool)

(declare-fun isEmpty!388 (Option!164) Bool)

(assert (=> d!32167 (= (isDefined!112 (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))) (not (isEmpty!388 (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))))

(declare-fun bs!4642 () Bool)

(assert (= bs!4642 d!32167))

(assert (=> bs!4642 m!128785))

(declare-fun m!129269 () Bool)

(assert (=> bs!4642 m!129269))

(assert (=> b!112838 d!32167))

(declare-fun d!32169 () Bool)

(declare-fun c!20291 () Bool)

(assert (=> d!32169 (= c!20291 (and ((_ is Cons!1629) (toList!796 lt!58287)) (= (_1!1216 (h!2229 (toList!796 lt!58287))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(declare-fun e!73638 () Option!164)

(assert (=> d!32169 (= (getValueByKey!158 (toList!796 lt!58287) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) e!73638)))

(declare-fun e!73639 () Option!164)

(declare-fun b!113309 () Bool)

(assert (=> b!113309 (= e!73639 (getValueByKey!158 (t!5798 (toList!796 lt!58287)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113307 () Bool)

(assert (=> b!113307 (= e!73638 (Some!163 (_2!1216 (h!2229 (toList!796 lt!58287)))))))

(declare-fun b!113310 () Bool)

(assert (=> b!113310 (= e!73639 None!162)))

(declare-fun b!113308 () Bool)

(assert (=> b!113308 (= e!73638 e!73639)))

(declare-fun c!20292 () Bool)

(assert (=> b!113308 (= c!20292 (and ((_ is Cons!1629) (toList!796 lt!58287)) (not (= (_1!1216 (h!2229 (toList!796 lt!58287))) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))))

(assert (= (and d!32169 c!20291) b!113307))

(assert (= (and d!32169 (not c!20291)) b!113308))

(assert (= (and b!113308 c!20292) b!113309))

(assert (= (and b!113308 (not c!20292)) b!113310))

(assert (=> b!113309 m!128511))

(declare-fun m!129271 () Bool)

(assert (=> b!113309 m!129271))

(assert (=> b!112838 d!32169))

(assert (=> d!32063 d!32069))

(declare-fun d!32171 () Bool)

(assert (=> d!32171 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) from!355 Nil!1629)))

(assert (=> d!32171 true))

(declare-fun _$71!159 () Unit!3503)

(assert (=> d!32171 (= (choose!39 (_keys!4379 (v!2949 (underlying!369 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!159)))

(declare-fun bs!4643 () Bool)

(assert (= bs!4643 d!32171))

(assert (=> bs!4643 m!128509))

(assert (=> d!32063 d!32171))

(assert (=> bm!12156 d!32145))

(assert (=> b!112809 d!32081))

(declare-fun d!32173 () Bool)

(assert (=> d!32173 (= (apply!102 (+!142 lt!58578 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58581) (apply!102 lt!58578 lt!58581))))

(declare-fun lt!58716 () Unit!3503)

(declare-fun choose!723 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> d!32173 (= lt!58716 (choose!723 lt!58578 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58581))))

(declare-fun e!73642 () Bool)

(assert (=> d!32173 e!73642))

(declare-fun res!55843 () Bool)

(assert (=> d!32173 (=> (not res!55843) (not e!73642))))

(assert (=> d!32173 (= res!55843 (contains!834 lt!58578 lt!58581))))

(assert (=> d!32173 (= (addApplyDifferent!78 lt!58578 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58581) lt!58716)))

(declare-fun b!113314 () Bool)

(assert (=> b!113314 (= e!73642 (not (= lt!58581 lt!58577)))))

(assert (= (and d!32173 res!55843) b!113314))

(declare-fun m!129273 () Bool)

(assert (=> d!32173 m!129273))

(assert (=> d!32173 m!128891))

(assert (=> d!32173 m!128899))

(assert (=> d!32173 m!128891))

(assert (=> d!32173 m!128893))

(declare-fun m!129275 () Bool)

(assert (=> d!32173 m!129275))

(assert (=> b!113045 d!32173))

(declare-fun d!32175 () Bool)

(declare-fun e!73643 () Bool)

(assert (=> d!32175 e!73643))

(declare-fun res!55845 () Bool)

(assert (=> d!32175 (=> (not res!55845) (not e!73643))))

(declare-fun lt!58717 () ListLongMap!1561)

(assert (=> d!32175 (= res!55845 (contains!834 lt!58717 (_1!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58720 () List!1633)

(assert (=> d!32175 (= lt!58717 (ListLongMap!1562 lt!58720))))

(declare-fun lt!58719 () Unit!3503)

(declare-fun lt!58718 () Unit!3503)

(assert (=> d!32175 (= lt!58719 lt!58718)))

(assert (=> d!32175 (= (getValueByKey!158 lt!58720 (_1!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32175 (= lt!58718 (lemmaContainsTupThenGetReturnValue!77 lt!58720 (_1!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32175 (= lt!58720 (insertStrictlySorted!80 (toList!796 lt!58574) (_1!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32175 (= (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58717)))

(declare-fun b!113315 () Bool)

(declare-fun res!55844 () Bool)

(assert (=> b!113315 (=> (not res!55844) (not e!73643))))

(assert (=> b!113315 (= res!55844 (= (getValueByKey!158 (toList!796 lt!58717) (_1!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113316 () Bool)

(assert (=> b!113316 (= e!73643 (contains!835 (toList!796 lt!58717) (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32175 res!55845) b!113315))

(assert (= (and b!113315 res!55844) b!113316))

(declare-fun m!129277 () Bool)

(assert (=> d!32175 m!129277))

(declare-fun m!129279 () Bool)

(assert (=> d!32175 m!129279))

(declare-fun m!129281 () Bool)

(assert (=> d!32175 m!129281))

(declare-fun m!129283 () Bool)

(assert (=> d!32175 m!129283))

(declare-fun m!129285 () Bool)

(assert (=> b!113315 m!129285))

(declare-fun m!129287 () Bool)

(assert (=> b!113316 m!129287))

(assert (=> b!113045 d!32175))

(declare-fun d!32177 () Bool)

(assert (=> d!32177 (= (apply!102 lt!58578 lt!58581) (get!1362 (getValueByKey!158 (toList!796 lt!58578) lt!58581)))))

(declare-fun bs!4644 () Bool)

(assert (= bs!4644 d!32177))

(declare-fun m!129289 () Bool)

(assert (=> bs!4644 m!129289))

(assert (=> bs!4644 m!129289))

(declare-fun m!129291 () Bool)

(assert (=> bs!4644 m!129291))

(assert (=> b!113045 d!32177))

(declare-fun d!32179 () Bool)

(assert (=> d!32179 (= (apply!102 (+!142 lt!58578 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58581) (get!1362 (getValueByKey!158 (toList!796 (+!142 lt!58578 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58581)))))

(declare-fun bs!4645 () Bool)

(assert (= bs!4645 d!32179))

(declare-fun m!129293 () Bool)

(assert (=> bs!4645 m!129293))

(assert (=> bs!4645 m!129293))

(declare-fun m!129295 () Bool)

(assert (=> bs!4645 m!129295))

(assert (=> b!113045 d!32179))

(declare-fun d!32181 () Bool)

(assert (=> d!32181 (= (apply!102 lt!58564 lt!58580) (get!1362 (getValueByKey!158 (toList!796 lt!58564) lt!58580)))))

(declare-fun bs!4646 () Bool)

(assert (= bs!4646 d!32181))

(declare-fun m!129297 () Bool)

(assert (=> bs!4646 m!129297))

(assert (=> bs!4646 m!129297))

(declare-fun m!129299 () Bool)

(assert (=> bs!4646 m!129299))

(assert (=> b!113045 d!32181))

(declare-fun d!32183 () Bool)

(assert (=> d!32183 (= (apply!102 (+!142 lt!58566 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58567) (apply!102 lt!58566 lt!58567))))

(declare-fun lt!58721 () Unit!3503)

(assert (=> d!32183 (= lt!58721 (choose!723 lt!58566 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58567))))

(declare-fun e!73644 () Bool)

(assert (=> d!32183 e!73644))

(declare-fun res!55846 () Bool)

(assert (=> d!32183 (=> (not res!55846) (not e!73644))))

(assert (=> d!32183 (= res!55846 (contains!834 lt!58566 lt!58567))))

(assert (=> d!32183 (= (addApplyDifferent!78 lt!58566 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58567) lt!58721)))

(declare-fun b!113317 () Bool)

(assert (=> b!113317 (= e!73644 (not (= lt!58567 lt!58576)))))

(assert (= (and d!32183 res!55846) b!113317))

(declare-fun m!129301 () Bool)

(assert (=> d!32183 m!129301))

(assert (=> d!32183 m!128877))

(assert (=> d!32183 m!128905))

(assert (=> d!32183 m!128877))

(assert (=> d!32183 m!128901))

(declare-fun m!129303 () Bool)

(assert (=> d!32183 m!129303))

(assert (=> b!113045 d!32183))

(declare-fun d!32185 () Bool)

(declare-fun e!73645 () Bool)

(assert (=> d!32185 e!73645))

(declare-fun res!55848 () Bool)

(assert (=> d!32185 (=> (not res!55848) (not e!73645))))

(declare-fun lt!58722 () ListLongMap!1561)

(assert (=> d!32185 (= res!55848 (contains!834 lt!58722 (_1!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58725 () List!1633)

(assert (=> d!32185 (= lt!58722 (ListLongMap!1562 lt!58725))))

(declare-fun lt!58724 () Unit!3503)

(declare-fun lt!58723 () Unit!3503)

(assert (=> d!32185 (= lt!58724 lt!58723)))

(assert (=> d!32185 (= (getValueByKey!158 lt!58725 (_1!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32185 (= lt!58723 (lemmaContainsTupThenGetReturnValue!77 lt!58725 (_1!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32185 (= lt!58725 (insertStrictlySorted!80 (toList!796 lt!58564) (_1!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32185 (= (+!142 lt!58564 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58722)))

(declare-fun b!113318 () Bool)

(declare-fun res!55847 () Bool)

(assert (=> b!113318 (=> (not res!55847) (not e!73645))))

(assert (=> b!113318 (= res!55847 (= (getValueByKey!158 (toList!796 lt!58722) (_1!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113319 () Bool)

(assert (=> b!113319 (= e!73645 (contains!835 (toList!796 lt!58722) (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32185 res!55848) b!113318))

(assert (= (and b!113318 res!55847) b!113319))

(declare-fun m!129305 () Bool)

(assert (=> d!32185 m!129305))

(declare-fun m!129307 () Bool)

(assert (=> d!32185 m!129307))

(declare-fun m!129309 () Bool)

(assert (=> d!32185 m!129309))

(declare-fun m!129311 () Bool)

(assert (=> d!32185 m!129311))

(declare-fun m!129313 () Bool)

(assert (=> b!113318 m!129313))

(declare-fun m!129315 () Bool)

(assert (=> b!113319 m!129315))

(assert (=> b!113045 d!32185))

(declare-fun d!32187 () Bool)

(assert (=> d!32187 (= (apply!102 lt!58566 lt!58567) (get!1362 (getValueByKey!158 (toList!796 lt!58566) lt!58567)))))

(declare-fun bs!4647 () Bool)

(assert (= bs!4647 d!32187))

(declare-fun m!129317 () Bool)

(assert (=> bs!4647 m!129317))

(assert (=> bs!4647 m!129317))

(declare-fun m!129319 () Bool)

(assert (=> bs!4647 m!129319))

(assert (=> b!113045 d!32187))

(declare-fun d!32189 () Bool)

(declare-fun e!73646 () Bool)

(assert (=> d!32189 e!73646))

(declare-fun res!55850 () Bool)

(assert (=> d!32189 (=> (not res!55850) (not e!73646))))

(declare-fun lt!58726 () ListLongMap!1561)

(assert (=> d!32189 (= res!55850 (contains!834 lt!58726 (_1!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58729 () List!1633)

(assert (=> d!32189 (= lt!58726 (ListLongMap!1562 lt!58729))))

(declare-fun lt!58728 () Unit!3503)

(declare-fun lt!58727 () Unit!3503)

(assert (=> d!32189 (= lt!58728 lt!58727)))

(assert (=> d!32189 (= (getValueByKey!158 lt!58729 (_1!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32189 (= lt!58727 (lemmaContainsTupThenGetReturnValue!77 lt!58729 (_1!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32189 (= lt!58729 (insertStrictlySorted!80 (toList!796 lt!58578) (_1!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32189 (= (+!142 lt!58578 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58726)))

(declare-fun b!113320 () Bool)

(declare-fun res!55849 () Bool)

(assert (=> b!113320 (=> (not res!55849) (not e!73646))))

(assert (=> b!113320 (= res!55849 (= (getValueByKey!158 (toList!796 lt!58726) (_1!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113321 () Bool)

(assert (=> b!113321 (= e!73646 (contains!835 (toList!796 lt!58726) (tuple2!2411 lt!58577 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32189 res!55850) b!113320))

(assert (= (and b!113320 res!55849) b!113321))

(declare-fun m!129321 () Bool)

(assert (=> d!32189 m!129321))

(declare-fun m!129323 () Bool)

(assert (=> d!32189 m!129323))

(declare-fun m!129325 () Bool)

(assert (=> d!32189 m!129325))

(declare-fun m!129327 () Bool)

(assert (=> d!32189 m!129327))

(declare-fun m!129329 () Bool)

(assert (=> b!113320 m!129329))

(declare-fun m!129331 () Bool)

(assert (=> b!113321 m!129331))

(assert (=> b!113045 d!32189))

(declare-fun d!32191 () Bool)

(assert (=> d!32191 (= (apply!102 (+!142 lt!58566 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58567) (get!1362 (getValueByKey!158 (toList!796 (+!142 lt!58566 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58567)))))

(declare-fun bs!4648 () Bool)

(assert (= bs!4648 d!32191))

(declare-fun m!129333 () Bool)

(assert (=> bs!4648 m!129333))

(assert (=> bs!4648 m!129333))

(declare-fun m!129335 () Bool)

(assert (=> bs!4648 m!129335))

(assert (=> b!113045 d!32191))

(declare-fun d!32193 () Bool)

(assert (=> d!32193 (contains!834 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58565)))

(declare-fun lt!58732 () Unit!3503)

(declare-fun choose!724 (ListLongMap!1561 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3503)

(assert (=> d!32193 (= lt!58732 (choose!724 lt!58574 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58565))))

(assert (=> d!32193 (contains!834 lt!58574 lt!58565)))

(assert (=> d!32193 (= (addStillContains!78 lt!58574 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58565) lt!58732)))

(declare-fun bs!4649 () Bool)

(assert (= bs!4649 d!32193))

(assert (=> bs!4649 m!128883))

(assert (=> bs!4649 m!128883))

(assert (=> bs!4649 m!128885))

(declare-fun m!129337 () Bool)

(assert (=> bs!4649 m!129337))

(declare-fun m!129339 () Bool)

(assert (=> bs!4649 m!129339))

(assert (=> b!113045 d!32193))

(assert (=> b!113045 d!32033))

(declare-fun d!32195 () Bool)

(declare-fun e!73647 () Bool)

(assert (=> d!32195 e!73647))

(declare-fun res!55852 () Bool)

(assert (=> d!32195 (=> (not res!55852) (not e!73647))))

(declare-fun lt!58733 () ListLongMap!1561)

(assert (=> d!32195 (= res!55852 (contains!834 lt!58733 (_1!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58736 () List!1633)

(assert (=> d!32195 (= lt!58733 (ListLongMap!1562 lt!58736))))

(declare-fun lt!58735 () Unit!3503)

(declare-fun lt!58734 () Unit!3503)

(assert (=> d!32195 (= lt!58735 lt!58734)))

(assert (=> d!32195 (= (getValueByKey!158 lt!58736 (_1!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32195 (= lt!58734 (lemmaContainsTupThenGetReturnValue!77 lt!58736 (_1!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32195 (= lt!58736 (insertStrictlySorted!80 (toList!796 lt!58566) (_1!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32195 (= (+!142 lt!58566 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58733)))

(declare-fun b!113323 () Bool)

(declare-fun res!55851 () Bool)

(assert (=> b!113323 (=> (not res!55851) (not e!73647))))

(assert (=> b!113323 (= res!55851 (= (getValueByKey!158 (toList!796 lt!58733) (_1!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113324 () Bool)

(assert (=> b!113324 (= e!73647 (contains!835 (toList!796 lt!58733) (tuple2!2411 lt!58576 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32195 res!55852) b!113323))

(assert (= (and b!113323 res!55851) b!113324))

(declare-fun m!129341 () Bool)

(assert (=> d!32195 m!129341))

(declare-fun m!129343 () Bool)

(assert (=> d!32195 m!129343))

(declare-fun m!129345 () Bool)

(assert (=> d!32195 m!129345))

(declare-fun m!129347 () Bool)

(assert (=> d!32195 m!129347))

(declare-fun m!129349 () Bool)

(assert (=> b!113323 m!129349))

(declare-fun m!129351 () Bool)

(assert (=> b!113324 m!129351))

(assert (=> b!113045 d!32195))

(declare-fun d!32197 () Bool)

(assert (=> d!32197 (= (apply!102 (+!142 lt!58564 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58580) (get!1362 (getValueByKey!158 (toList!796 (+!142 lt!58564 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58580)))))

(declare-fun bs!4650 () Bool)

(assert (= bs!4650 d!32197))

(declare-fun m!129353 () Bool)

(assert (=> bs!4650 m!129353))

(assert (=> bs!4650 m!129353))

(declare-fun m!129355 () Bool)

(assert (=> bs!4650 m!129355))

(assert (=> b!113045 d!32197))

(declare-fun d!32199 () Bool)

(declare-fun e!73648 () Bool)

(assert (=> d!32199 e!73648))

(declare-fun res!55853 () Bool)

(assert (=> d!32199 (=> res!55853 e!73648)))

(declare-fun lt!58738 () Bool)

(assert (=> d!32199 (= res!55853 (not lt!58738))))

(declare-fun lt!58740 () Bool)

(assert (=> d!32199 (= lt!58738 lt!58740)))

(declare-fun lt!58739 () Unit!3503)

(declare-fun e!73649 () Unit!3503)

(assert (=> d!32199 (= lt!58739 e!73649)))

(declare-fun c!20293 () Bool)

(assert (=> d!32199 (= c!20293 lt!58740)))

(assert (=> d!32199 (= lt!58740 (containsKey!162 (toList!796 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58565))))

(assert (=> d!32199 (= (contains!834 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58565) lt!58738)))

(declare-fun b!113325 () Bool)

(declare-fun lt!58737 () Unit!3503)

(assert (=> b!113325 (= e!73649 lt!58737)))

(assert (=> b!113325 (= lt!58737 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58565))))

(assert (=> b!113325 (isDefined!112 (getValueByKey!158 (toList!796 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58565))))

(declare-fun b!113326 () Bool)

(declare-fun Unit!3518 () Unit!3503)

(assert (=> b!113326 (= e!73649 Unit!3518)))

(declare-fun b!113327 () Bool)

(assert (=> b!113327 (= e!73648 (isDefined!112 (getValueByKey!158 (toList!796 (+!142 lt!58574 (tuple2!2411 lt!58579 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) lt!58565)))))

(assert (= (and d!32199 c!20293) b!113325))

(assert (= (and d!32199 (not c!20293)) b!113326))

(assert (= (and d!32199 (not res!55853)) b!113327))

(declare-fun m!129357 () Bool)

(assert (=> d!32199 m!129357))

(declare-fun m!129359 () Bool)

(assert (=> b!113325 m!129359))

(declare-fun m!129361 () Bool)

(assert (=> b!113325 m!129361))

(assert (=> b!113325 m!129361))

(declare-fun m!129363 () Bool)

(assert (=> b!113325 m!129363))

(assert (=> b!113327 m!129361))

(assert (=> b!113327 m!129361))

(assert (=> b!113327 m!129363))

(assert (=> b!113045 d!32199))

(declare-fun d!32201 () Bool)

(assert (=> d!32201 (= (apply!102 (+!142 lt!58564 (tuple2!2411 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58580) (apply!102 lt!58564 lt!58580))))

(declare-fun lt!58741 () Unit!3503)

(assert (=> d!32201 (= lt!58741 (choose!723 lt!58564 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58580))))

(declare-fun e!73650 () Bool)

(assert (=> d!32201 e!73650))

(declare-fun res!55854 () Bool)

(assert (=> d!32201 (=> (not res!55854) (not e!73650))))

(assert (=> d!32201 (= res!55854 (contains!834 lt!58564 lt!58580))))

(assert (=> d!32201 (= (addApplyDifferent!78 lt!58564 lt!58563 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))) lt!58580) lt!58741)))

(declare-fun b!113328 () Bool)

(assert (=> b!113328 (= e!73650 (not (= lt!58580 lt!58563)))))

(assert (= (and d!32201 res!55854) b!113328))

(declare-fun m!129365 () Bool)

(assert (=> d!32201 m!129365))

(assert (=> d!32201 m!128889))

(assert (=> d!32201 m!128903))

(assert (=> d!32201 m!128889))

(assert (=> d!32201 m!128895))

(declare-fun m!129367 () Bool)

(assert (=> d!32201 m!129367))

(assert (=> b!113045 d!32201))

(assert (=> b!112812 d!32111))

(declare-fun c!20294 () Bool)

(declare-fun bm!12214 () Bool)

(declare-fun call!12217 () Bool)

(assert (=> bm!12214 (= call!12217 (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20294 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!20206 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) Nil!1629) Nil!1629)) (ite c!20206 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) Nil!1629) Nil!1629))))))

(declare-fun b!113329 () Bool)

(declare-fun e!73654 () Bool)

(declare-fun e!73652 () Bool)

(assert (=> b!113329 (= e!73654 e!73652)))

(declare-fun res!55855 () Bool)

(assert (=> b!113329 (=> (not res!55855) (not e!73652))))

(declare-fun e!73651 () Bool)

(assert (=> b!113329 (= res!55855 (not e!73651))))

(declare-fun res!55857 () Bool)

(assert (=> b!113329 (=> (not res!55857) (not e!73651))))

(assert (=> b!113329 (= res!55857 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113330 () Bool)

(declare-fun e!73653 () Bool)

(assert (=> b!113330 (= e!73652 e!73653)))

(assert (=> b!113330 (= c!20294 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!32203 () Bool)

(declare-fun res!55856 () Bool)

(assert (=> d!32203 (=> res!55856 e!73654)))

(assert (=> d!32203 (= res!55856 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32203 (= (arrayNoDuplicates!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20206 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) Nil!1629) Nil!1629)) e!73654)))

(declare-fun b!113331 () Bool)

(assert (=> b!113331 (= e!73653 call!12217)))

(declare-fun b!113332 () Bool)

(assert (=> b!113332 (= e!73653 call!12217)))

(declare-fun b!113333 () Bool)

(assert (=> b!113333 (= e!73651 (contains!836 (ite c!20206 (Cons!1628 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) #b00000000000000000000000000000000) Nil!1629) Nil!1629) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!32203 (not res!55856)) b!113329))

(assert (= (and b!113329 res!55857) b!113333))

(assert (= (and b!113329 res!55855) b!113330))

(assert (= (and b!113330 c!20294) b!113332))

(assert (= (and b!113330 (not c!20294)) b!113331))

(assert (= (or b!113332 b!113331) bm!12214))

(declare-fun m!129369 () Bool)

(assert (=> bm!12214 m!129369))

(declare-fun m!129371 () Bool)

(assert (=> bm!12214 m!129371))

(assert (=> b!113329 m!129369))

(assert (=> b!113329 m!129369))

(declare-fun m!129373 () Bool)

(assert (=> b!113329 m!129373))

(assert (=> b!113330 m!129369))

(assert (=> b!113330 m!129369))

(assert (=> b!113330 m!129373))

(assert (=> b!113333 m!129369))

(assert (=> b!113333 m!129369))

(declare-fun m!129375 () Bool)

(assert (=> b!113333 m!129375))

(assert (=> bm!12161 d!32203))

(declare-fun d!32205 () Bool)

(assert (=> d!32205 (= (inRange!0 (ite c!20195 (ite c!20198 (index!3217 lt!58503) (ite c!20194 (index!3216 lt!58484) (index!3219 lt!58484))) (ite c!20190 (index!3217 lt!58496) (ite c!20202 (index!3216 lt!58504) (index!3219 lt!58504)))) (mask!6843 newMap!16)) (and (bvsge (ite c!20195 (ite c!20198 (index!3217 lt!58503) (ite c!20194 (index!3216 lt!58484) (index!3219 lt!58484))) (ite c!20190 (index!3217 lt!58496) (ite c!20202 (index!3216 lt!58504) (index!3219 lt!58504)))) #b00000000000000000000000000000000) (bvslt (ite c!20195 (ite c!20198 (index!3217 lt!58503) (ite c!20194 (index!3216 lt!58484) (index!3219 lt!58484))) (ite c!20190 (index!3217 lt!58496) (ite c!20202 (index!3216 lt!58504) (index!3219 lt!58504)))) (bvadd (mask!6843 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!12148 d!32205))

(assert (=> b!112840 d!32167))

(assert (=> b!112840 d!32169))

(declare-fun d!32207 () Bool)

(assert (=> d!32207 (= (apply!102 lt!58568 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1362 (getValueByKey!158 (toList!796 lt!58568) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4651 () Bool)

(assert (= bs!4651 d!32207))

(assert (=> bs!4651 m!128709))

(declare-fun m!129377 () Bool)

(assert (=> bs!4651 m!129377))

(assert (=> bs!4651 m!129377))

(declare-fun m!129379 () Bool)

(assert (=> bs!4651 m!129379))

(assert (=> b!113044 d!32207))

(assert (=> b!113044 d!32089))

(declare-fun d!32209 () Bool)

(declare-fun e!73655 () Bool)

(assert (=> d!32209 e!73655))

(declare-fun res!55858 () Bool)

(assert (=> d!32209 (=> res!55858 e!73655)))

(declare-fun lt!58743 () Bool)

(assert (=> d!32209 (= res!55858 (not lt!58743))))

(declare-fun lt!58745 () Bool)

(assert (=> d!32209 (= lt!58743 lt!58745)))

(declare-fun lt!58744 () Unit!3503)

(declare-fun e!73656 () Unit!3503)

(assert (=> d!32209 (= lt!58744 e!73656)))

(declare-fun c!20295 () Bool)

(assert (=> d!32209 (= c!20295 lt!58745)))

(assert (=> d!32209 (= lt!58745 (containsKey!162 (toList!796 lt!58399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32209 (= (contains!834 lt!58399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58743)))

(declare-fun b!113334 () Bool)

(declare-fun lt!58742 () Unit!3503)

(assert (=> b!113334 (= e!73656 lt!58742)))

(assert (=> b!113334 (= lt!58742 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113334 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113335 () Bool)

(declare-fun Unit!3519 () Unit!3503)

(assert (=> b!113335 (= e!73656 Unit!3519)))

(declare-fun b!113336 () Bool)

(assert (=> b!113336 (= e!73655 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32209 c!20295) b!113334))

(assert (= (and d!32209 (not c!20295)) b!113335))

(assert (= (and d!32209 (not res!55858)) b!113336))

(assert (=> d!32209 m!128709))

(declare-fun m!129381 () Bool)

(assert (=> d!32209 m!129381))

(assert (=> b!113334 m!128709))

(declare-fun m!129383 () Bool)

(assert (=> b!113334 m!129383))

(assert (=> b!113334 m!128709))

(declare-fun m!129385 () Bool)

(assert (=> b!113334 m!129385))

(assert (=> b!113334 m!129385))

(declare-fun m!129387 () Bool)

(assert (=> b!113334 m!129387))

(assert (=> b!113336 m!128709))

(assert (=> b!113336 m!129385))

(assert (=> b!113336 m!129385))

(assert (=> b!113336 m!129387))

(assert (=> b!112811 d!32209))

(declare-fun d!32211 () Bool)

(declare-fun c!20296 () Bool)

(assert (=> d!32211 (= c!20296 (and ((_ is Cons!1629) (toList!796 lt!58379)) (= (_1!1216 (h!2229 (toList!796 lt!58379))) (_1!1216 lt!58285))))))

(declare-fun e!73657 () Option!164)

(assert (=> d!32211 (= (getValueByKey!158 (toList!796 lt!58379) (_1!1216 lt!58285)) e!73657)))

(declare-fun b!113339 () Bool)

(declare-fun e!73658 () Option!164)

(assert (=> b!113339 (= e!73658 (getValueByKey!158 (t!5798 (toList!796 lt!58379)) (_1!1216 lt!58285)))))

(declare-fun b!113337 () Bool)

(assert (=> b!113337 (= e!73657 (Some!163 (_2!1216 (h!2229 (toList!796 lt!58379)))))))

(declare-fun b!113340 () Bool)

(assert (=> b!113340 (= e!73658 None!162)))

(declare-fun b!113338 () Bool)

(assert (=> b!113338 (= e!73657 e!73658)))

(declare-fun c!20297 () Bool)

(assert (=> b!113338 (= c!20297 (and ((_ is Cons!1629) (toList!796 lt!58379)) (not (= (_1!1216 (h!2229 (toList!796 lt!58379))) (_1!1216 lt!58285)))))))

(assert (= (and d!32211 c!20296) b!113337))

(assert (= (and d!32211 (not c!20296)) b!113338))

(assert (= (and b!113338 c!20297) b!113339))

(assert (= (and b!113338 (not c!20297)) b!113340))

(declare-fun m!129389 () Bool)

(assert (=> b!113339 m!129389))

(assert (=> b!112779 d!32211))

(declare-fun d!32213 () Bool)

(assert (=> d!32213 (= (+!142 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) lt!58493 (zeroValue!2528 newMap!16) lt!58293 #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58748 () Unit!3503)

(declare-fun choose!725 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3503)

(assert (=> d!32213 (= lt!58748 (choose!725 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58493 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58293 (defaultEntry!2660 newMap!16)))))

(assert (=> d!32213 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32213 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) lt!58493 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58293 (defaultEntry!2660 newMap!16)) lt!58748)))

(declare-fun bs!4652 () Bool)

(assert (= bs!4652 d!32213))

(declare-fun m!129391 () Bool)

(assert (=> bs!4652 m!129391))

(assert (=> bs!4652 m!128951))

(declare-fun m!129393 () Bool)

(assert (=> bs!4652 m!129393))

(assert (=> bs!4652 m!128835))

(declare-fun m!129395 () Bool)

(assert (=> bs!4652 m!129395))

(assert (=> bs!4652 m!128835))

(assert (=> b!112966 d!32213))

(declare-fun d!32215 () Bool)

(declare-fun e!73659 () Bool)

(assert (=> d!32215 e!73659))

(declare-fun res!55859 () Bool)

(assert (=> d!32215 (=> res!55859 e!73659)))

(declare-fun lt!58750 () Bool)

(assert (=> d!32215 (= res!55859 (not lt!58750))))

(declare-fun lt!58752 () Bool)

(assert (=> d!32215 (= lt!58750 lt!58752)))

(declare-fun lt!58751 () Unit!3503)

(declare-fun e!73660 () Unit!3503)

(assert (=> d!32215 (= lt!58751 e!73660)))

(declare-fun c!20298 () Bool)

(assert (=> d!32215 (= c!20298 lt!58752)))

(assert (=> d!32215 (= lt!58752 (containsKey!162 (toList!796 lt!58568) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32215 (= (contains!834 lt!58568 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58750)))

(declare-fun b!113341 () Bool)

(declare-fun lt!58749 () Unit!3503)

(assert (=> b!113341 (= e!73660 lt!58749)))

(assert (=> b!113341 (= lt!58749 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58568) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113341 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113342 () Bool)

(declare-fun Unit!3520 () Unit!3503)

(assert (=> b!113342 (= e!73660 Unit!3520)))

(declare-fun b!113343 () Bool)

(assert (=> b!113343 (= e!73659 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32215 c!20298) b!113341))

(assert (= (and d!32215 (not c!20298)) b!113342))

(assert (= (and d!32215 (not res!55859)) b!113343))

(assert (=> d!32215 m!128709))

(declare-fun m!129397 () Bool)

(assert (=> d!32215 m!129397))

(assert (=> b!113341 m!128709))

(declare-fun m!129399 () Bool)

(assert (=> b!113341 m!129399))

(assert (=> b!113341 m!128709))

(assert (=> b!113341 m!129377))

(assert (=> b!113341 m!129377))

(declare-fun m!129401 () Bool)

(assert (=> b!113341 m!129401))

(assert (=> b!113343 m!128709))

(assert (=> b!113343 m!129377))

(assert (=> b!113343 m!129377))

(assert (=> b!113343 m!129401))

(assert (=> b!113047 d!32215))

(declare-fun d!32217 () Bool)

(declare-fun e!73661 () Bool)

(assert (=> d!32217 e!73661))

(declare-fun res!55860 () Bool)

(assert (=> d!32217 (=> res!55860 e!73661)))

(declare-fun lt!58754 () Bool)

(assert (=> d!32217 (= res!55860 (not lt!58754))))

(declare-fun lt!58756 () Bool)

(assert (=> d!32217 (= lt!58754 lt!58756)))

(declare-fun lt!58755 () Unit!3503)

(declare-fun e!73662 () Unit!3503)

(assert (=> d!32217 (= lt!58755 e!73662)))

(declare-fun c!20299 () Bool)

(assert (=> d!32217 (= c!20299 lt!58756)))

(assert (=> d!32217 (= lt!58756 (containsKey!162 (toList!796 lt!58399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32217 (= (contains!834 lt!58399 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58754)))

(declare-fun b!113344 () Bool)

(declare-fun lt!58753 () Unit!3503)

(assert (=> b!113344 (= e!73662 lt!58753)))

(assert (=> b!113344 (= lt!58753 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113344 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113345 () Bool)

(declare-fun Unit!3521 () Unit!3503)

(assert (=> b!113345 (= e!73662 Unit!3521)))

(declare-fun b!113346 () Bool)

(assert (=> b!113346 (= e!73661 (isDefined!112 (getValueByKey!158 (toList!796 lt!58399) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32217 c!20299) b!113344))

(assert (= (and d!32217 (not c!20299)) b!113345))

(assert (= (and d!32217 (not res!55860)) b!113346))

(declare-fun m!129403 () Bool)

(assert (=> d!32217 m!129403))

(declare-fun m!129405 () Bool)

(assert (=> b!113344 m!129405))

(declare-fun m!129407 () Bool)

(assert (=> b!113344 m!129407))

(assert (=> b!113344 m!129407))

(declare-fun m!129409 () Bool)

(assert (=> b!113344 m!129409))

(assert (=> b!113346 m!129407))

(assert (=> b!113346 m!129407))

(assert (=> b!113346 m!129409))

(assert (=> b!112814 d!32217))

(assert (=> b!112978 d!32109))

(declare-fun bm!12215 () Bool)

(declare-fun call!12221 () ListLongMap!1561)

(assert (=> bm!12215 (= call!12221 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113347 () Bool)

(declare-fun e!73673 () ListLongMap!1561)

(declare-fun call!12218 () ListLongMap!1561)

(assert (=> b!113347 (= e!73673 call!12218)))

(declare-fun e!73674 () Bool)

(declare-fun lt!58763 () ListLongMap!1561)

(declare-fun b!113349 () Bool)

(assert (=> b!113349 (= e!73674 (= (apply!102 lt!58763 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16))))))

(declare-fun b!113350 () Bool)

(declare-fun res!55865 () Bool)

(declare-fun e!73671 () Bool)

(assert (=> b!113350 (=> (not res!55865) (not e!73671))))

(declare-fun e!73664 () Bool)

(assert (=> b!113350 (= res!55865 e!73664)))

(declare-fun res!55861 () Bool)

(assert (=> b!113350 (=> res!55861 e!73664)))

(declare-fun e!73675 () Bool)

(assert (=> b!113350 (= res!55861 (not e!73675))))

(declare-fun res!55864 () Bool)

(assert (=> b!113350 (=> (not res!55864) (not e!73675))))

(assert (=> b!113350 (= res!55864 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12216 () Bool)

(declare-fun call!12224 () ListLongMap!1561)

(declare-fun call!12222 () ListLongMap!1561)

(assert (=> bm!12216 (= call!12224 call!12222)))

(declare-fun bm!12217 () Bool)

(assert (=> bm!12217 (= call!12222 call!12221)))

(declare-fun b!113351 () Bool)

(declare-fun e!73669 () Bool)

(assert (=> b!113351 (= e!73669 e!73674)))

(declare-fun res!55867 () Bool)

(declare-fun call!12223 () Bool)

(assert (=> b!113351 (= res!55867 call!12223)))

(assert (=> b!113351 (=> (not res!55867) (not e!73674))))

(declare-fun b!113352 () Bool)

(declare-fun e!73668 () Bool)

(assert (=> b!113352 (= e!73668 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113353 () Bool)

(declare-fun e!73663 () Bool)

(assert (=> b!113353 (= e!73671 e!73663)))

(declare-fun c!20304 () Bool)

(assert (=> b!113353 (= c!20304 (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113354 () Bool)

(declare-fun e!73666 () ListLongMap!1561)

(assert (=> b!113354 (= e!73666 call!12224)))

(declare-fun b!113355 () Bool)

(declare-fun e!73665 () Bool)

(assert (=> b!113355 (= e!73665 (= (apply!102 lt!58763 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)) (get!1359 (select (arr!2081 (ite c!20192 (_values!2643 newMap!16) lt!58498)) #b00000000000000000000000000000000) (dynLambda!389 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2341 (ite c!20192 (_values!2643 newMap!16) lt!58498))))))

(assert (=> b!113355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun bm!12218 () Bool)

(assert (=> bm!12218 (= call!12223 (contains!834 lt!58763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!32219 () Bool)

(assert (=> d!32219 e!73671))

(declare-fun res!55863 () Bool)

(assert (=> d!32219 (=> (not res!55863) (not e!73671))))

(assert (=> d!32219 (= res!55863 (or (bvsge #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))))

(declare-fun lt!58770 () ListLongMap!1561)

(assert (=> d!32219 (= lt!58763 lt!58770)))

(declare-fun lt!58765 () Unit!3503)

(declare-fun e!73667 () Unit!3503)

(assert (=> d!32219 (= lt!58765 e!73667)))

(declare-fun c!20302 () Bool)

(assert (=> d!32219 (= c!20302 e!73668)))

(declare-fun res!55866 () Bool)

(assert (=> d!32219 (=> (not res!55866) (not e!73668))))

(assert (=> d!32219 (= res!55866 (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun e!73670 () ListLongMap!1561)

(assert (=> d!32219 (= lt!58770 e!73670)))

(declare-fun c!20303 () Bool)

(assert (=> d!32219 (= c!20303 (and (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32219 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32219 (= (getCurrentListMap!472 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58763)))

(declare-fun b!113348 () Bool)

(declare-fun e!73672 () Bool)

(assert (=> b!113348 (= e!73663 e!73672)))

(declare-fun res!55868 () Bool)

(declare-fun call!12219 () Bool)

(assert (=> b!113348 (= res!55868 call!12219)))

(assert (=> b!113348 (=> (not res!55868) (not e!73672))))

(declare-fun b!113356 () Bool)

(declare-fun lt!58768 () Unit!3503)

(assert (=> b!113356 (= e!73667 lt!58768)))

(declare-fun lt!58769 () ListLongMap!1561)

(assert (=> b!113356 (= lt!58769 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58774 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58760 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58760 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58766 () Unit!3503)

(assert (=> b!113356 (= lt!58766 (addStillContains!78 lt!58769 lt!58774 (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) lt!58760))))

(assert (=> b!113356 (contains!834 (+!142 lt!58769 (tuple2!2411 lt!58774 (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)))) lt!58760)))

(declare-fun lt!58757 () Unit!3503)

(assert (=> b!113356 (= lt!58757 lt!58766)))

(declare-fun lt!58761 () ListLongMap!1561)

(assert (=> b!113356 (= lt!58761 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58771 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58762 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58762 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58777 () Unit!3503)

(assert (=> b!113356 (= lt!58777 (addApplyDifferent!78 lt!58761 lt!58771 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) lt!58762))))

(assert (=> b!113356 (= (apply!102 (+!142 lt!58761 (tuple2!2411 lt!58771 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)))) lt!58762) (apply!102 lt!58761 lt!58762))))

(declare-fun lt!58767 () Unit!3503)

(assert (=> b!113356 (= lt!58767 lt!58777)))

(declare-fun lt!58759 () ListLongMap!1561)

(assert (=> b!113356 (= lt!58759 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58758 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58775 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58775 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58778 () Unit!3503)

(assert (=> b!113356 (= lt!58778 (addApplyDifferent!78 lt!58759 lt!58758 (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) lt!58775))))

(assert (=> b!113356 (= (apply!102 (+!142 lt!58759 (tuple2!2411 lt!58758 (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)))) lt!58775) (apply!102 lt!58759 lt!58775))))

(declare-fun lt!58764 () Unit!3503)

(assert (=> b!113356 (= lt!58764 lt!58778)))

(declare-fun lt!58773 () ListLongMap!1561)

(assert (=> b!113356 (= lt!58773 (getCurrentListMapNoExtraKeys!107 (_keys!4379 newMap!16) (ite c!20192 (_values!2643 newMap!16) lt!58498) (mask!6843 newMap!16) (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16)) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58772 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58772 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58776 () (_ BitVec 64))

(assert (=> b!113356 (= lt!58776 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113356 (= lt!58768 (addApplyDifferent!78 lt!58773 lt!58772 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)) lt!58776))))

(assert (=> b!113356 (= (apply!102 (+!142 lt!58773 (tuple2!2411 lt!58772 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)))) lt!58776) (apply!102 lt!58773 lt!58776))))

(declare-fun b!113357 () Bool)

(assert (=> b!113357 (= e!73663 (not call!12219))))

(declare-fun b!113358 () Bool)

(assert (=> b!113358 (= e!73664 e!73665)))

(declare-fun res!55869 () Bool)

(assert (=> b!113358 (=> (not res!55869) (not e!73665))))

(assert (=> b!113358 (= res!55869 (contains!834 lt!58763 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113358 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))))))

(declare-fun call!12220 () ListLongMap!1561)

(declare-fun bm!12219 () Bool)

(declare-fun c!20300 () Bool)

(assert (=> bm!12219 (= call!12220 (+!142 (ite c!20303 call!12221 (ite c!20300 call!12222 call!12224)) (ite (or c!20303 c!20300) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!20192 c!20203) lt!58293 (zeroValue!2528 newMap!16))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16))))))))

(declare-fun bm!12220 () Bool)

(assert (=> bm!12220 (= call!12219 (contains!834 lt!58763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113359 () Bool)

(assert (=> b!113359 (= e!73666 call!12218)))

(declare-fun b!113360 () Bool)

(assert (=> b!113360 (= e!73670 (+!142 call!12220 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16)))))))

(declare-fun b!113361 () Bool)

(assert (=> b!113361 (= e!73669 (not call!12223))))

(declare-fun c!20301 () Bool)

(declare-fun b!113362 () Bool)

(assert (=> b!113362 (= c!20301 (and (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!113362 (= e!73673 e!73666)))

(declare-fun b!113363 () Bool)

(declare-fun res!55862 () Bool)

(assert (=> b!113363 (=> (not res!55862) (not e!73671))))

(assert (=> b!113363 (= res!55862 e!73669)))

(declare-fun c!20305 () Bool)

(assert (=> b!113363 (= c!20305 (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12221 () Bool)

(assert (=> bm!12221 (= call!12218 call!12220)))

(declare-fun b!113364 () Bool)

(assert (=> b!113364 (= e!73675 (validKeyInArray!0 (select (arr!2080 (_keys!4379 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113365 () Bool)

(declare-fun Unit!3522 () Unit!3503)

(assert (=> b!113365 (= e!73667 Unit!3522)))

(declare-fun b!113366 () Bool)

(assert (=> b!113366 (= e!73670 e!73673)))

(assert (=> b!113366 (= c!20300 (and (not (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!20192 (ite c!20203 lt!58494 lt!58493) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113367 () Bool)

(assert (=> b!113367 (= e!73672 (= (apply!102 lt!58763 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!20192 (ite c!20203 (minValue!2528 newMap!16) lt!58293) (minValue!2528 newMap!16))))))

(assert (= (and d!32219 c!20303) b!113360))

(assert (= (and d!32219 (not c!20303)) b!113366))

(assert (= (and b!113366 c!20300) b!113347))

(assert (= (and b!113366 (not c!20300)) b!113362))

(assert (= (and b!113362 c!20301) b!113359))

(assert (= (and b!113362 (not c!20301)) b!113354))

(assert (= (or b!113359 b!113354) bm!12216))

(assert (= (or b!113347 bm!12216) bm!12217))

(assert (= (or b!113347 b!113359) bm!12221))

(assert (= (or b!113360 bm!12217) bm!12215))

(assert (= (or b!113360 bm!12221) bm!12219))

(assert (= (and d!32219 res!55866) b!113352))

(assert (= (and d!32219 c!20302) b!113356))

(assert (= (and d!32219 (not c!20302)) b!113365))

(assert (= (and d!32219 res!55863) b!113350))

(assert (= (and b!113350 res!55864) b!113364))

(assert (= (and b!113350 (not res!55861)) b!113358))

(assert (= (and b!113358 res!55869) b!113355))

(assert (= (and b!113350 res!55865) b!113363))

(assert (= (and b!113363 c!20305) b!113351))

(assert (= (and b!113363 (not c!20305)) b!113361))

(assert (= (and b!113351 res!55867) b!113349))

(assert (= (or b!113351 b!113361) bm!12218))

(assert (= (and b!113363 res!55862) b!113353))

(assert (= (and b!113353 c!20304) b!113348))

(assert (= (and b!113353 (not c!20304)) b!113357))

(assert (= (and b!113348 res!55868) b!113367))

(assert (= (or b!113348 b!113357) bm!12220))

(declare-fun b_lambda!5071 () Bool)

(assert (=> (not b_lambda!5071) (not b!113355)))

(assert (=> b!113355 t!5809))

(declare-fun b_and!6961 () Bool)

(assert (= b_and!6957 (and (=> t!5809 result!3585) b_and!6961)))

(assert (=> b!113355 t!5811))

(declare-fun b_and!6963 () Bool)

(assert (= b_and!6959 (and (=> t!5811 result!3587) b_and!6963)))

(declare-fun m!129411 () Bool)

(assert (=> b!113360 m!129411))

(declare-fun m!129413 () Bool)

(assert (=> b!113349 m!129413))

(declare-fun m!129415 () Bool)

(assert (=> b!113355 m!129415))

(assert (=> b!113355 m!129415))

(assert (=> b!113355 m!128945))

(declare-fun m!129417 () Bool)

(assert (=> b!113355 m!129417))

(assert (=> b!113355 m!128931))

(assert (=> b!113355 m!128931))

(declare-fun m!129419 () Bool)

(assert (=> b!113355 m!129419))

(assert (=> b!113355 m!128945))

(assert (=> d!32219 m!128951))

(declare-fun m!129421 () Bool)

(assert (=> bm!12219 m!129421))

(assert (=> b!113352 m!128931))

(assert (=> b!113352 m!128931))

(assert (=> b!113352 m!128935))

(declare-fun m!129423 () Bool)

(assert (=> bm!12218 m!129423))

(assert (=> b!113358 m!128931))

(assert (=> b!113358 m!128931))

(declare-fun m!129425 () Bool)

(assert (=> b!113358 m!129425))

(declare-fun m!129427 () Bool)

(assert (=> b!113367 m!129427))

(assert (=> b!113364 m!128931))

(assert (=> b!113364 m!128931))

(assert (=> b!113364 m!128935))

(declare-fun m!129429 () Bool)

(assert (=> bm!12215 m!129429))

(declare-fun m!129431 () Bool)

(assert (=> bm!12220 m!129431))

(assert (=> b!113356 m!129429))

(declare-fun m!129433 () Bool)

(assert (=> b!113356 m!129433))

(declare-fun m!129435 () Bool)

(assert (=> b!113356 m!129435))

(declare-fun m!129437 () Bool)

(assert (=> b!113356 m!129437))

(declare-fun m!129439 () Bool)

(assert (=> b!113356 m!129439))

(declare-fun m!129441 () Bool)

(assert (=> b!113356 m!129441))

(declare-fun m!129443 () Bool)

(assert (=> b!113356 m!129443))

(declare-fun m!129445 () Bool)

(assert (=> b!113356 m!129445))

(declare-fun m!129447 () Bool)

(assert (=> b!113356 m!129447))

(declare-fun m!129449 () Bool)

(assert (=> b!113356 m!129449))

(assert (=> b!113356 m!128931))

(assert (=> b!113356 m!129445))

(declare-fun m!129451 () Bool)

(assert (=> b!113356 m!129451))

(declare-fun m!129453 () Bool)

(assert (=> b!113356 m!129453))

(declare-fun m!129455 () Bool)

(assert (=> b!113356 m!129455))

(assert (=> b!113356 m!129447))

(assert (=> b!113356 m!129439))

(assert (=> b!113356 m!129433))

(declare-fun m!129457 () Bool)

(assert (=> b!113356 m!129457))

(declare-fun m!129459 () Bool)

(assert (=> b!113356 m!129459))

(declare-fun m!129461 () Bool)

(assert (=> b!113356 m!129461))

(assert (=> bm!12149 d!32219))

(declare-fun d!32221 () Bool)

(declare-fun e!73676 () Bool)

(assert (=> d!32221 e!73676))

(declare-fun res!55870 () Bool)

(assert (=> d!32221 (=> res!55870 e!73676)))

(declare-fun lt!58780 () Bool)

(assert (=> d!32221 (= res!55870 (not lt!58780))))

(declare-fun lt!58782 () Bool)

(assert (=> d!32221 (= lt!58780 lt!58782)))

(declare-fun lt!58781 () Unit!3503)

(declare-fun e!73677 () Unit!3503)

(assert (=> d!32221 (= lt!58781 e!73677)))

(declare-fun c!20306 () Bool)

(assert (=> d!32221 (= c!20306 lt!58782)))

(assert (=> d!32221 (= lt!58782 (containsKey!162 (toList!796 call!12138) (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502))))))

(assert (=> d!32221 (= (contains!834 call!12138 (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502))) lt!58780)))

(declare-fun b!113368 () Bool)

(declare-fun lt!58779 () Unit!3503)

(assert (=> b!113368 (= e!73677 lt!58779)))

(assert (=> b!113368 (= lt!58779 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 call!12138) (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502))))))

(assert (=> b!113368 (isDefined!112 (getValueByKey!158 (toList!796 call!12138) (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502))))))

(declare-fun b!113369 () Bool)

(declare-fun Unit!3523 () Unit!3503)

(assert (=> b!113369 (= e!73677 Unit!3523)))

(declare-fun b!113370 () Bool)

(assert (=> b!113370 (= e!73676 (isDefined!112 (getValueByKey!158 (toList!796 call!12138) (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502)))))))

(assert (= (and d!32221 c!20306) b!113368))

(assert (= (and d!32221 (not c!20306)) b!113369))

(assert (= (and d!32221 (not res!55870)) b!113370))

(assert (=> d!32221 m!128805))

(declare-fun m!129463 () Bool)

(assert (=> d!32221 m!129463))

(assert (=> b!113368 m!128805))

(declare-fun m!129465 () Bool)

(assert (=> b!113368 m!129465))

(assert (=> b!113368 m!128805))

(declare-fun m!129467 () Bool)

(assert (=> b!113368 m!129467))

(assert (=> b!113368 m!129467))

(declare-fun m!129469 () Bool)

(assert (=> b!113368 m!129469))

(assert (=> b!113370 m!128805))

(assert (=> b!113370 m!129467))

(assert (=> b!113370 m!129467))

(assert (=> b!113370 m!129469))

(assert (=> b!112941 d!32221))

(declare-fun d!32223 () Bool)

(declare-fun e!73680 () Bool)

(assert (=> d!32223 e!73680))

(declare-fun res!55873 () Bool)

(assert (=> d!32223 (=> (not res!55873) (not e!73680))))

(assert (=> d!32223 (= res!55873 (and (bvsge (index!3217 lt!58502) #b00000000000000000000000000000000) (bvslt (index!3217 lt!58502) (size!2340 (_keys!4379 newMap!16)))))))

(declare-fun lt!58785 () Unit!3503)

(declare-fun choose!726 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) Unit!3503)

(assert (=> d!32223 (= lt!58785 (choose!726 (_keys!4379 newMap!16) lt!58498 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32223 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32223 (= (lemmaValidKeyInArrayIsInListMap!110 (_keys!4379 newMap!16) lt!58498 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (defaultEntry!2660 newMap!16)) lt!58785)))

(declare-fun b!113373 () Bool)

(assert (=> b!113373 (= e!73680 (contains!834 (getCurrentListMap!472 (_keys!4379 newMap!16) lt!58498 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58502))))))

(assert (= (and d!32223 res!55873) b!113373))

(declare-fun m!129471 () Bool)

(assert (=> d!32223 m!129471))

(assert (=> d!32223 m!128951))

(declare-fun m!129473 () Bool)

(assert (=> b!113373 m!129473))

(assert (=> b!113373 m!128805))

(assert (=> b!113373 m!129473))

(assert (=> b!113373 m!128805))

(declare-fun m!129475 () Bool)

(assert (=> b!113373 m!129475))

(assert (=> b!112941 d!32223))

(declare-fun d!32225 () Bool)

(declare-fun e!73683 () Bool)

(assert (=> d!32225 e!73683))

(declare-fun res!55876 () Bool)

(assert (=> d!32225 (=> (not res!55876) (not e!73683))))

(assert (=> d!32225 (= res!55876 (and (bvsge (index!3217 lt!58502) #b00000000000000000000000000000000) (bvslt (index!3217 lt!58502) (size!2341 (_values!2643 newMap!16)))))))

(declare-fun lt!58788 () Unit!3503)

(declare-fun choose!727 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3503)

(assert (=> d!32225 (= lt!58788 (choose!727 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (defaultEntry!2660 newMap!16)))))

(assert (=> d!32225 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32225 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3217 lt!58502) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (defaultEntry!2660 newMap!16)) lt!58788)))

(declare-fun b!113376 () Bool)

(assert (=> b!113376 (= e!73683 (= (+!142 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (getCurrentListMap!472 (_keys!4379 newMap!16) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (index!3217 lt!58502) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16))))))

(assert (= (and d!32225 res!55876) b!113376))

(assert (=> d!32225 m!128511))

(declare-fun m!129477 () Bool)

(assert (=> d!32225 m!129477))

(assert (=> d!32225 m!128951))

(assert (=> b!113376 m!128835))

(assert (=> b!113376 m!128835))

(declare-fun m!129479 () Bool)

(assert (=> b!113376 m!129479))

(assert (=> b!113376 m!128793))

(declare-fun m!129481 () Bool)

(assert (=> b!113376 m!129481))

(assert (=> b!112941 d!32225))

(declare-fun d!32227 () Bool)

(declare-fun e!73684 () Bool)

(assert (=> d!32227 e!73684))

(declare-fun res!55878 () Bool)

(assert (=> d!32227 (=> (not res!55878) (not e!73684))))

(declare-fun lt!58789 () ListLongMap!1561)

(assert (=> d!32227 (= res!55878 (contains!834 lt!58789 (_1!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(declare-fun lt!58792 () List!1633)

(assert (=> d!32227 (= lt!58789 (ListLongMap!1562 lt!58792))))

(declare-fun lt!58791 () Unit!3503)

(declare-fun lt!58790 () Unit!3503)

(assert (=> d!32227 (= lt!58791 lt!58790)))

(assert (=> d!32227 (= (getValueByKey!158 lt!58792 (_1!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))) (Some!163 (_2!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(assert (=> d!32227 (= lt!58790 (lemmaContainsTupThenGetReturnValue!77 lt!58792 (_1!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (_2!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(assert (=> d!32227 (= lt!58792 (insertStrictlySorted!80 (toList!796 e!73414) (_1!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (_2!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(assert (=> d!32227 (= (+!142 e!73414 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) lt!58789)))

(declare-fun b!113377 () Bool)

(declare-fun res!55877 () Bool)

(assert (=> b!113377 (=> (not res!55877) (not e!73684))))

(assert (=> b!113377 (= res!55877 (= (getValueByKey!158 (toList!796 lt!58789) (_1!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))) (Some!163 (_2!1216 (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))))

(declare-fun b!113378 () Bool)

(assert (=> b!113378 (= e!73684 (contains!835 (toList!796 lt!58789) (ite c!20192 (ite c!20203 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58293) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58293)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (= (and d!32227 res!55878) b!113377))

(assert (= (and b!113377 res!55877) b!113378))

(declare-fun m!129483 () Bool)

(assert (=> d!32227 m!129483))

(declare-fun m!129485 () Bool)

(assert (=> d!32227 m!129485))

(declare-fun m!129487 () Bool)

(assert (=> d!32227 m!129487))

(declare-fun m!129489 () Bool)

(assert (=> d!32227 m!129489))

(declare-fun m!129491 () Bool)

(assert (=> b!113377 m!129491))

(declare-fun m!129493 () Bool)

(assert (=> b!113378 m!129493))

(assert (=> bm!12158 d!32227))

(declare-fun d!32229 () Bool)

(declare-fun e!73685 () Bool)

(assert (=> d!32229 e!73685))

(declare-fun res!55879 () Bool)

(assert (=> d!32229 (=> res!55879 e!73685)))

(declare-fun lt!58794 () Bool)

(assert (=> d!32229 (= res!55879 (not lt!58794))))

(declare-fun lt!58796 () Bool)

(assert (=> d!32229 (= lt!58794 lt!58796)))

(declare-fun lt!58795 () Unit!3503)

(declare-fun e!73686 () Unit!3503)

(assert (=> d!32229 (= lt!58795 e!73686)))

(declare-fun c!20307 () Bool)

(assert (=> d!32229 (= c!20307 lt!58796)))

(assert (=> d!32229 (= lt!58796 (containsKey!162 (toList!796 lt!58408) (_1!1216 lt!58285)))))

(assert (=> d!32229 (= (contains!834 lt!58408 (_1!1216 lt!58285)) lt!58794)))

(declare-fun b!113379 () Bool)

(declare-fun lt!58793 () Unit!3503)

(assert (=> b!113379 (= e!73686 lt!58793)))

(assert (=> b!113379 (= lt!58793 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58408) (_1!1216 lt!58285)))))

(assert (=> b!113379 (isDefined!112 (getValueByKey!158 (toList!796 lt!58408) (_1!1216 lt!58285)))))

(declare-fun b!113380 () Bool)

(declare-fun Unit!3524 () Unit!3503)

(assert (=> b!113380 (= e!73686 Unit!3524)))

(declare-fun b!113381 () Bool)

(assert (=> b!113381 (= e!73685 (isDefined!112 (getValueByKey!158 (toList!796 lt!58408) (_1!1216 lt!58285))))))

(assert (= (and d!32229 c!20307) b!113379))

(assert (= (and d!32229 (not c!20307)) b!113380))

(assert (= (and d!32229 (not res!55879)) b!113381))

(declare-fun m!129495 () Bool)

(assert (=> d!32229 m!129495))

(declare-fun m!129497 () Bool)

(assert (=> b!113379 m!129497))

(assert (=> b!113379 m!128757))

(assert (=> b!113379 m!128757))

(declare-fun m!129499 () Bool)

(assert (=> b!113379 m!129499))

(assert (=> b!113381 m!128757))

(assert (=> b!113381 m!128757))

(assert (=> b!113381 m!129499))

(assert (=> d!32037 d!32229))

(declare-fun d!32231 () Bool)

(declare-fun c!20308 () Bool)

(assert (=> d!32231 (= c!20308 (and ((_ is Cons!1629) lt!58411) (= (_1!1216 (h!2229 lt!58411)) (_1!1216 lt!58285))))))

(declare-fun e!73687 () Option!164)

(assert (=> d!32231 (= (getValueByKey!158 lt!58411 (_1!1216 lt!58285)) e!73687)))

(declare-fun b!113384 () Bool)

(declare-fun e!73688 () Option!164)

(assert (=> b!113384 (= e!73688 (getValueByKey!158 (t!5798 lt!58411) (_1!1216 lt!58285)))))

(declare-fun b!113382 () Bool)

(assert (=> b!113382 (= e!73687 (Some!163 (_2!1216 (h!2229 lt!58411))))))

(declare-fun b!113385 () Bool)

(assert (=> b!113385 (= e!73688 None!162)))

(declare-fun b!113383 () Bool)

(assert (=> b!113383 (= e!73687 e!73688)))

(declare-fun c!20309 () Bool)

(assert (=> b!113383 (= c!20309 (and ((_ is Cons!1629) lt!58411) (not (= (_1!1216 (h!2229 lt!58411)) (_1!1216 lt!58285)))))))

(assert (= (and d!32231 c!20308) b!113382))

(assert (= (and d!32231 (not c!20308)) b!113383))

(assert (= (and b!113383 c!20309) b!113384))

(assert (= (and b!113383 (not c!20309)) b!113385))

(declare-fun m!129501 () Bool)

(assert (=> b!113384 m!129501))

(assert (=> d!32037 d!32231))

(declare-fun d!32233 () Bool)

(assert (=> d!32233 (= (getValueByKey!158 lt!58411 (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285)))))

(declare-fun lt!58799 () Unit!3503)

(declare-fun choose!728 (List!1633 (_ BitVec 64) V!3257) Unit!3503)

(assert (=> d!32233 (= lt!58799 (choose!728 lt!58411 (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(declare-fun e!73691 () Bool)

(assert (=> d!32233 e!73691))

(declare-fun res!55884 () Bool)

(assert (=> d!32233 (=> (not res!55884) (not e!73691))))

(assert (=> d!32233 (= res!55884 (isStrictlySorted!308 lt!58411))))

(assert (=> d!32233 (= (lemmaContainsTupThenGetReturnValue!77 lt!58411 (_1!1216 lt!58285) (_2!1216 lt!58285)) lt!58799)))

(declare-fun b!113390 () Bool)

(declare-fun res!55885 () Bool)

(assert (=> b!113390 (=> (not res!55885) (not e!73691))))

(assert (=> b!113390 (= res!55885 (containsKey!162 lt!58411 (_1!1216 lt!58285)))))

(declare-fun b!113391 () Bool)

(assert (=> b!113391 (= e!73691 (contains!835 lt!58411 (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285))))))

(assert (= (and d!32233 res!55884) b!113390))

(assert (= (and b!113390 res!55885) b!113391))

(assert (=> d!32233 m!128751))

(declare-fun m!129503 () Bool)

(assert (=> d!32233 m!129503))

(declare-fun m!129505 () Bool)

(assert (=> d!32233 m!129505))

(declare-fun m!129507 () Bool)

(assert (=> b!113390 m!129507))

(declare-fun m!129509 () Bool)

(assert (=> b!113391 m!129509))

(assert (=> d!32037 d!32233))

(declare-fun b!113412 () Bool)

(declare-fun e!73702 () List!1633)

(declare-fun call!12232 () List!1633)

(assert (=> b!113412 (= e!73702 call!12232)))

(declare-fun d!32235 () Bool)

(declare-fun e!73706 () Bool)

(assert (=> d!32235 e!73706))

(declare-fun res!55891 () Bool)

(assert (=> d!32235 (=> (not res!55891) (not e!73706))))

(declare-fun lt!58802 () List!1633)

(assert (=> d!32235 (= res!55891 (isStrictlySorted!308 lt!58802))))

(declare-fun e!73703 () List!1633)

(assert (=> d!32235 (= lt!58802 e!73703)))

(declare-fun c!20318 () Bool)

(assert (=> d!32235 (= c!20318 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58284))) (bvslt (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58284)))) (_1!1216 lt!58285))))))

(assert (=> d!32235 (isStrictlySorted!308 (toList!796 (+!142 lt!58288 lt!58284)))))

(assert (=> d!32235 (= (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 lt!58284)) (_1!1216 lt!58285) (_2!1216 lt!58285)) lt!58802)))

(declare-fun bm!12228 () Bool)

(declare-fun call!12231 () List!1633)

(assert (=> bm!12228 (= call!12232 call!12231)))

(declare-fun c!20319 () Bool)

(declare-fun b!113413 () Bool)

(assert (=> b!113413 (= c!20319 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58284))) (bvsgt (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58284)))) (_1!1216 lt!58285))))))

(declare-fun e!73705 () List!1633)

(assert (=> b!113413 (= e!73705 e!73702)))

(declare-fun b!113414 () Bool)

(assert (=> b!113414 (= e!73705 call!12231)))

(declare-fun e!73704 () List!1633)

(declare-fun b!113415 () Bool)

(assert (=> b!113415 (= e!73704 (insertStrictlySorted!80 (t!5798 (toList!796 (+!142 lt!58288 lt!58284))) (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(declare-fun b!113416 () Bool)

(assert (=> b!113416 (= e!73703 e!73705)))

(declare-fun c!20320 () Bool)

(assert (=> b!113416 (= c!20320 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58284))) (= (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58284)))) (_1!1216 lt!58285))))))

(declare-fun b!113417 () Bool)

(assert (=> b!113417 (= e!73704 (ite c!20320 (t!5798 (toList!796 (+!142 lt!58288 lt!58284))) (ite c!20319 (Cons!1629 (h!2229 (toList!796 (+!142 lt!58288 lt!58284))) (t!5798 (toList!796 (+!142 lt!58288 lt!58284)))) Nil!1630)))))

(declare-fun b!113418 () Bool)

(assert (=> b!113418 (= e!73702 call!12232)))

(declare-fun b!113419 () Bool)

(declare-fun call!12233 () List!1633)

(assert (=> b!113419 (= e!73703 call!12233)))

(declare-fun b!113420 () Bool)

(assert (=> b!113420 (= e!73706 (contains!835 lt!58802 (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285))))))

(declare-fun bm!12229 () Bool)

(assert (=> bm!12229 (= call!12231 call!12233)))

(declare-fun bm!12230 () Bool)

(declare-fun $colon$colon!84 (List!1633 tuple2!2410) List!1633)

(assert (=> bm!12230 (= call!12233 ($colon$colon!84 e!73704 (ite c!20318 (h!2229 (toList!796 (+!142 lt!58288 lt!58284))) (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285)))))))

(declare-fun c!20321 () Bool)

(assert (=> bm!12230 (= c!20321 c!20318)))

(declare-fun b!113421 () Bool)

(declare-fun res!55890 () Bool)

(assert (=> b!113421 (=> (not res!55890) (not e!73706))))

(assert (=> b!113421 (= res!55890 (containsKey!162 lt!58802 (_1!1216 lt!58285)))))

(assert (= (and d!32235 c!20318) b!113419))

(assert (= (and d!32235 (not c!20318)) b!113416))

(assert (= (and b!113416 c!20320) b!113414))

(assert (= (and b!113416 (not c!20320)) b!113413))

(assert (= (and b!113413 c!20319) b!113418))

(assert (= (and b!113413 (not c!20319)) b!113412))

(assert (= (or b!113418 b!113412) bm!12228))

(assert (= (or b!113414 bm!12228) bm!12229))

(assert (= (or b!113419 bm!12229) bm!12230))

(assert (= (and bm!12230 c!20321) b!113415))

(assert (= (and bm!12230 (not c!20321)) b!113417))

(assert (= (and d!32235 res!55891) b!113421))

(assert (= (and b!113421 res!55890) b!113420))

(declare-fun m!129511 () Bool)

(assert (=> b!113420 m!129511))

(declare-fun m!129513 () Bool)

(assert (=> b!113415 m!129513))

(declare-fun m!129515 () Bool)

(assert (=> bm!12230 m!129515))

(declare-fun m!129517 () Bool)

(assert (=> b!113421 m!129517))

(declare-fun m!129519 () Bool)

(assert (=> d!32235 m!129519))

(declare-fun m!129521 () Bool)

(assert (=> d!32235 m!129521))

(assert (=> d!32037 d!32235))

(declare-fun d!32237 () Bool)

(declare-fun e!73707 () Bool)

(assert (=> d!32237 e!73707))

(declare-fun res!55892 () Bool)

(assert (=> d!32237 (=> res!55892 e!73707)))

(declare-fun lt!58804 () Bool)

(assert (=> d!32237 (= res!55892 (not lt!58804))))

(declare-fun lt!58806 () Bool)

(assert (=> d!32237 (= lt!58804 lt!58806)))

(declare-fun lt!58805 () Unit!3503)

(declare-fun e!73708 () Unit!3503)

(assert (=> d!32237 (= lt!58805 e!73708)))

(declare-fun c!20322 () Bool)

(assert (=> d!32237 (= c!20322 lt!58806)))

(assert (=> d!32237 (= lt!58806 (containsKey!162 (toList!796 lt!58568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32237 (= (contains!834 lt!58568 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58804)))

(declare-fun b!113422 () Bool)

(declare-fun lt!58803 () Unit!3503)

(assert (=> b!113422 (= e!73708 lt!58803)))

(assert (=> b!113422 (= lt!58803 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113422 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113423 () Bool)

(declare-fun Unit!3525 () Unit!3503)

(assert (=> b!113423 (= e!73708 Unit!3525)))

(declare-fun b!113424 () Bool)

(assert (=> b!113424 (= e!73707 (isDefined!112 (getValueByKey!158 (toList!796 lt!58568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32237 c!20322) b!113422))

(assert (= (and d!32237 (not c!20322)) b!113423))

(assert (= (and d!32237 (not res!55892)) b!113424))

(declare-fun m!129523 () Bool)

(assert (=> d!32237 m!129523))

(declare-fun m!129525 () Bool)

(assert (=> b!113422 m!129525))

(assert (=> b!113422 m!129037))

(assert (=> b!113422 m!129037))

(declare-fun m!129527 () Bool)

(assert (=> b!113422 m!129527))

(assert (=> b!113424 m!129037))

(assert (=> b!113424 m!129037))

(assert (=> b!113424 m!129527))

(assert (=> bm!12184 d!32237))

(declare-fun d!32239 () Bool)

(assert (=> d!32239 (= (apply!102 lt!58399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1362 (getValueByKey!158 (toList!796 lt!58399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4653 () Bool)

(assert (= bs!4653 d!32239))

(assert (=> bs!4653 m!128709))

(assert (=> bs!4653 m!129385))

(assert (=> bs!4653 m!129385))

(declare-fun m!129529 () Bool)

(assert (=> bs!4653 m!129529))

(assert (=> b!112816 d!32239))

(assert (=> b!112816 d!32089))

(declare-fun d!32241 () Bool)

(declare-fun e!73709 () Bool)

(assert (=> d!32241 e!73709))

(declare-fun res!55893 () Bool)

(assert (=> d!32241 (=> res!55893 e!73709)))

(declare-fun lt!58808 () Bool)

(assert (=> d!32241 (= res!55893 (not lt!58808))))

(declare-fun lt!58810 () Bool)

(assert (=> d!32241 (= lt!58808 lt!58810)))

(declare-fun lt!58809 () Unit!3503)

(declare-fun e!73710 () Unit!3503)

(assert (=> d!32241 (= lt!58809 e!73710)))

(declare-fun c!20323 () Bool)

(assert (=> d!32241 (= c!20323 lt!58810)))

(assert (=> d!32241 (= lt!58810 (containsKey!162 (toList!796 lt!58404) (_1!1216 lt!58284)))))

(assert (=> d!32241 (= (contains!834 lt!58404 (_1!1216 lt!58284)) lt!58808)))

(declare-fun b!113425 () Bool)

(declare-fun lt!58807 () Unit!3503)

(assert (=> b!113425 (= e!73710 lt!58807)))

(assert (=> b!113425 (= lt!58807 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58404) (_1!1216 lt!58284)))))

(assert (=> b!113425 (isDefined!112 (getValueByKey!158 (toList!796 lt!58404) (_1!1216 lt!58284)))))

(declare-fun b!113426 () Bool)

(declare-fun Unit!3526 () Unit!3503)

(assert (=> b!113426 (= e!73710 Unit!3526)))

(declare-fun b!113427 () Bool)

(assert (=> b!113427 (= e!73709 (isDefined!112 (getValueByKey!158 (toList!796 lt!58404) (_1!1216 lt!58284))))))

(assert (= (and d!32241 c!20323) b!113425))

(assert (= (and d!32241 (not c!20323)) b!113426))

(assert (= (and d!32241 (not res!55893)) b!113427))

(declare-fun m!129531 () Bool)

(assert (=> d!32241 m!129531))

(declare-fun m!129533 () Bool)

(assert (=> b!113425 m!129533))

(assert (=> b!113425 m!128745))

(assert (=> b!113425 m!128745))

(declare-fun m!129535 () Bool)

(assert (=> b!113425 m!129535))

(assert (=> b!113427 m!128745))

(assert (=> b!113427 m!128745))

(assert (=> b!113427 m!129535))

(assert (=> d!32035 d!32241))

(declare-fun d!32243 () Bool)

(declare-fun c!20324 () Bool)

(assert (=> d!32243 (= c!20324 (and ((_ is Cons!1629) lt!58407) (= (_1!1216 (h!2229 lt!58407)) (_1!1216 lt!58284))))))

(declare-fun e!73711 () Option!164)

(assert (=> d!32243 (= (getValueByKey!158 lt!58407 (_1!1216 lt!58284)) e!73711)))

(declare-fun b!113430 () Bool)

(declare-fun e!73712 () Option!164)

(assert (=> b!113430 (= e!73712 (getValueByKey!158 (t!5798 lt!58407) (_1!1216 lt!58284)))))

(declare-fun b!113428 () Bool)

(assert (=> b!113428 (= e!73711 (Some!163 (_2!1216 (h!2229 lt!58407))))))

(declare-fun b!113431 () Bool)

(assert (=> b!113431 (= e!73712 None!162)))

(declare-fun b!113429 () Bool)

(assert (=> b!113429 (= e!73711 e!73712)))

(declare-fun c!20325 () Bool)

(assert (=> b!113429 (= c!20325 (and ((_ is Cons!1629) lt!58407) (not (= (_1!1216 (h!2229 lt!58407)) (_1!1216 lt!58284)))))))

(assert (= (and d!32243 c!20324) b!113428))

(assert (= (and d!32243 (not c!20324)) b!113429))

(assert (= (and b!113429 c!20325) b!113430))

(assert (= (and b!113429 (not c!20325)) b!113431))

(declare-fun m!129537 () Bool)

(assert (=> b!113430 m!129537))

(assert (=> d!32035 d!32243))

(declare-fun d!32245 () Bool)

(assert (=> d!32245 (= (getValueByKey!158 lt!58407 (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284)))))

(declare-fun lt!58811 () Unit!3503)

(assert (=> d!32245 (= lt!58811 (choose!728 lt!58407 (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(declare-fun e!73713 () Bool)

(assert (=> d!32245 e!73713))

(declare-fun res!55894 () Bool)

(assert (=> d!32245 (=> (not res!55894) (not e!73713))))

(assert (=> d!32245 (= res!55894 (isStrictlySorted!308 lt!58407))))

(assert (=> d!32245 (= (lemmaContainsTupThenGetReturnValue!77 lt!58407 (_1!1216 lt!58284) (_2!1216 lt!58284)) lt!58811)))

(declare-fun b!113432 () Bool)

(declare-fun res!55895 () Bool)

(assert (=> b!113432 (=> (not res!55895) (not e!73713))))

(assert (=> b!113432 (= res!55895 (containsKey!162 lt!58407 (_1!1216 lt!58284)))))

(declare-fun b!113433 () Bool)

(assert (=> b!113433 (= e!73713 (contains!835 lt!58407 (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284))))))

(assert (= (and d!32245 res!55894) b!113432))

(assert (= (and b!113432 res!55895) b!113433))

(assert (=> d!32245 m!128739))

(declare-fun m!129539 () Bool)

(assert (=> d!32245 m!129539))

(declare-fun m!129541 () Bool)

(assert (=> d!32245 m!129541))

(declare-fun m!129543 () Bool)

(assert (=> b!113432 m!129543))

(declare-fun m!129545 () Bool)

(assert (=> b!113433 m!129545))

(assert (=> d!32035 d!32245))

(declare-fun b!113434 () Bool)

(declare-fun e!73714 () List!1633)

(declare-fun call!12235 () List!1633)

(assert (=> b!113434 (= e!73714 call!12235)))

(declare-fun d!32247 () Bool)

(declare-fun e!73718 () Bool)

(assert (=> d!32247 e!73718))

(declare-fun res!55897 () Bool)

(assert (=> d!32247 (=> (not res!55897) (not e!73718))))

(declare-fun lt!58812 () List!1633)

(assert (=> d!32247 (= res!55897 (isStrictlySorted!308 lt!58812))))

(declare-fun e!73715 () List!1633)

(assert (=> d!32247 (= lt!58812 e!73715)))

(declare-fun c!20326 () Bool)

(assert (=> d!32247 (= c!20326 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58285))) (bvslt (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58285)))) (_1!1216 lt!58284))))))

(assert (=> d!32247 (isStrictlySorted!308 (toList!796 (+!142 lt!58288 lt!58285)))))

(assert (=> d!32247 (= (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 lt!58285)) (_1!1216 lt!58284) (_2!1216 lt!58284)) lt!58812)))

(declare-fun bm!12231 () Bool)

(declare-fun call!12234 () List!1633)

(assert (=> bm!12231 (= call!12235 call!12234)))

(declare-fun c!20327 () Bool)

(declare-fun b!113435 () Bool)

(assert (=> b!113435 (= c!20327 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58285))) (bvsgt (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58285)))) (_1!1216 lt!58284))))))

(declare-fun e!73717 () List!1633)

(assert (=> b!113435 (= e!73717 e!73714)))

(declare-fun b!113436 () Bool)

(assert (=> b!113436 (= e!73717 call!12234)))

(declare-fun b!113437 () Bool)

(declare-fun e!73716 () List!1633)

(assert (=> b!113437 (= e!73716 (insertStrictlySorted!80 (t!5798 (toList!796 (+!142 lt!58288 lt!58285))) (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(declare-fun b!113438 () Bool)

(assert (=> b!113438 (= e!73715 e!73717)))

(declare-fun c!20328 () Bool)

(assert (=> b!113438 (= c!20328 (and ((_ is Cons!1629) (toList!796 (+!142 lt!58288 lt!58285))) (= (_1!1216 (h!2229 (toList!796 (+!142 lt!58288 lt!58285)))) (_1!1216 lt!58284))))))

(declare-fun b!113439 () Bool)

(assert (=> b!113439 (= e!73716 (ite c!20328 (t!5798 (toList!796 (+!142 lt!58288 lt!58285))) (ite c!20327 (Cons!1629 (h!2229 (toList!796 (+!142 lt!58288 lt!58285))) (t!5798 (toList!796 (+!142 lt!58288 lt!58285)))) Nil!1630)))))

(declare-fun b!113440 () Bool)

(assert (=> b!113440 (= e!73714 call!12235)))

(declare-fun b!113441 () Bool)

(declare-fun call!12236 () List!1633)

(assert (=> b!113441 (= e!73715 call!12236)))

(declare-fun b!113442 () Bool)

(assert (=> b!113442 (= e!73718 (contains!835 lt!58812 (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284))))))

(declare-fun bm!12232 () Bool)

(assert (=> bm!12232 (= call!12234 call!12236)))

(declare-fun bm!12233 () Bool)

(assert (=> bm!12233 (= call!12236 ($colon$colon!84 e!73716 (ite c!20326 (h!2229 (toList!796 (+!142 lt!58288 lt!58285))) (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284)))))))

(declare-fun c!20329 () Bool)

(assert (=> bm!12233 (= c!20329 c!20326)))

(declare-fun b!113443 () Bool)

(declare-fun res!55896 () Bool)

(assert (=> b!113443 (=> (not res!55896) (not e!73718))))

(assert (=> b!113443 (= res!55896 (containsKey!162 lt!58812 (_1!1216 lt!58284)))))

(assert (= (and d!32247 c!20326) b!113441))

(assert (= (and d!32247 (not c!20326)) b!113438))

(assert (= (and b!113438 c!20328) b!113436))

(assert (= (and b!113438 (not c!20328)) b!113435))

(assert (= (and b!113435 c!20327) b!113440))

(assert (= (and b!113435 (not c!20327)) b!113434))

(assert (= (or b!113440 b!113434) bm!12231))

(assert (= (or b!113436 bm!12231) bm!12232))

(assert (= (or b!113441 bm!12232) bm!12233))

(assert (= (and bm!12233 c!20329) b!113437))

(assert (= (and bm!12233 (not c!20329)) b!113439))

(assert (= (and d!32247 res!55897) b!113443))

(assert (= (and b!113443 res!55896) b!113442))

(declare-fun m!129547 () Bool)

(assert (=> b!113442 m!129547))

(declare-fun m!129549 () Bool)

(assert (=> b!113437 m!129549))

(declare-fun m!129551 () Bool)

(assert (=> bm!12233 m!129551))

(declare-fun m!129553 () Bool)

(assert (=> b!113443 m!129553))

(declare-fun m!129555 () Bool)

(assert (=> d!32247 m!129555))

(declare-fun m!129557 () Bool)

(assert (=> d!32247 m!129557))

(assert (=> d!32035 d!32247))

(assert (=> bm!12179 d!32033))

(declare-fun d!32249 () Bool)

(declare-fun e!73719 () Bool)

(assert (=> d!32249 e!73719))

(declare-fun res!55899 () Bool)

(assert (=> d!32249 (=> (not res!55899) (not e!73719))))

(declare-fun lt!58813 () ListLongMap!1561)

(assert (=> d!32249 (= res!55899 (contains!834 lt!58813 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun lt!58816 () List!1633)

(assert (=> d!32249 (= lt!58813 (ListLongMap!1562 lt!58816))))

(declare-fun lt!58815 () Unit!3503)

(declare-fun lt!58814 () Unit!3503)

(assert (=> d!32249 (= lt!58815 lt!58814)))

(assert (=> d!32249 (= (getValueByKey!158 lt!58816 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32249 (= lt!58814 (lemmaContainsTupThenGetReturnValue!77 lt!58816 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32249 (= lt!58816 (insertStrictlySorted!80 (toList!796 call!12149) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32249 (= (+!142 call!12149 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) lt!58813)))

(declare-fun b!113444 () Bool)

(declare-fun res!55898 () Bool)

(assert (=> b!113444 (=> (not res!55898) (not e!73719))))

(assert (=> b!113444 (= res!55898 (= (getValueByKey!158 (toList!796 lt!58813) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(declare-fun b!113445 () Bool)

(assert (=> b!113445 (= e!73719 (contains!835 (toList!796 lt!58813) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))

(assert (= (and d!32249 res!55899) b!113444))

(assert (= (and b!113444 res!55898) b!113445))

(declare-fun m!129559 () Bool)

(assert (=> d!32249 m!129559))

(declare-fun m!129561 () Bool)

(assert (=> d!32249 m!129561))

(declare-fun m!129563 () Bool)

(assert (=> d!32249 m!129563))

(declare-fun m!129565 () Bool)

(assert (=> d!32249 m!129565))

(declare-fun m!129567 () Bool)

(assert (=> b!113444 m!129567))

(declare-fun m!129569 () Bool)

(assert (=> b!113445 m!129569))

(assert (=> b!112944 d!32249))

(declare-fun d!32251 () Bool)

(declare-fun e!73720 () Bool)

(assert (=> d!32251 e!73720))

(declare-fun res!55900 () Bool)

(assert (=> d!32251 (=> res!55900 e!73720)))

(declare-fun lt!58818 () Bool)

(assert (=> d!32251 (= res!55900 (not lt!58818))))

(declare-fun lt!58820 () Bool)

(assert (=> d!32251 (= lt!58818 lt!58820)))

(declare-fun lt!58819 () Unit!3503)

(declare-fun e!73721 () Unit!3503)

(assert (=> d!32251 (= lt!58819 e!73721)))

(declare-fun c!20330 () Bool)

(assert (=> d!32251 (= c!20330 lt!58820)))

(assert (=> d!32251 (= lt!58820 (containsKey!162 (toList!796 lt!58412) (_1!1216 lt!58284)))))

(assert (=> d!32251 (= (contains!834 lt!58412 (_1!1216 lt!58284)) lt!58818)))

(declare-fun b!113446 () Bool)

(declare-fun lt!58817 () Unit!3503)

(assert (=> b!113446 (= e!73721 lt!58817)))

(assert (=> b!113446 (= lt!58817 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58412) (_1!1216 lt!58284)))))

(assert (=> b!113446 (isDefined!112 (getValueByKey!158 (toList!796 lt!58412) (_1!1216 lt!58284)))))

(declare-fun b!113447 () Bool)

(declare-fun Unit!3527 () Unit!3503)

(assert (=> b!113447 (= e!73721 Unit!3527)))

(declare-fun b!113448 () Bool)

(assert (=> b!113448 (= e!73720 (isDefined!112 (getValueByKey!158 (toList!796 lt!58412) (_1!1216 lt!58284))))))

(assert (= (and d!32251 c!20330) b!113446))

(assert (= (and d!32251 (not c!20330)) b!113447))

(assert (= (and d!32251 (not res!55900)) b!113448))

(declare-fun m!129571 () Bool)

(assert (=> d!32251 m!129571))

(declare-fun m!129573 () Bool)

(assert (=> b!113446 m!129573))

(assert (=> b!113446 m!128769))

(assert (=> b!113446 m!128769))

(declare-fun m!129575 () Bool)

(assert (=> b!113446 m!129575))

(assert (=> b!113448 m!128769))

(assert (=> b!113448 m!128769))

(assert (=> b!113448 m!129575))

(assert (=> d!32039 d!32251))

(declare-fun d!32253 () Bool)

(declare-fun c!20331 () Bool)

(assert (=> d!32253 (= c!20331 (and ((_ is Cons!1629) lt!58415) (= (_1!1216 (h!2229 lt!58415)) (_1!1216 lt!58284))))))

(declare-fun e!73722 () Option!164)

(assert (=> d!32253 (= (getValueByKey!158 lt!58415 (_1!1216 lt!58284)) e!73722)))

(declare-fun b!113451 () Bool)

(declare-fun e!73723 () Option!164)

(assert (=> b!113451 (= e!73723 (getValueByKey!158 (t!5798 lt!58415) (_1!1216 lt!58284)))))

(declare-fun b!113449 () Bool)

(assert (=> b!113449 (= e!73722 (Some!163 (_2!1216 (h!2229 lt!58415))))))

(declare-fun b!113452 () Bool)

(assert (=> b!113452 (= e!73723 None!162)))

(declare-fun b!113450 () Bool)

(assert (=> b!113450 (= e!73722 e!73723)))

(declare-fun c!20332 () Bool)

(assert (=> b!113450 (= c!20332 (and ((_ is Cons!1629) lt!58415) (not (= (_1!1216 (h!2229 lt!58415)) (_1!1216 lt!58284)))))))

(assert (= (and d!32253 c!20331) b!113449))

(assert (= (and d!32253 (not c!20331)) b!113450))

(assert (= (and b!113450 c!20332) b!113451))

(assert (= (and b!113450 (not c!20332)) b!113452))

(declare-fun m!129577 () Bool)

(assert (=> b!113451 m!129577))

(assert (=> d!32039 d!32253))

(declare-fun d!32255 () Bool)

(assert (=> d!32255 (= (getValueByKey!158 lt!58415 (_1!1216 lt!58284)) (Some!163 (_2!1216 lt!58284)))))

(declare-fun lt!58821 () Unit!3503)

(assert (=> d!32255 (= lt!58821 (choose!728 lt!58415 (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(declare-fun e!73724 () Bool)

(assert (=> d!32255 e!73724))

(declare-fun res!55901 () Bool)

(assert (=> d!32255 (=> (not res!55901) (not e!73724))))

(assert (=> d!32255 (= res!55901 (isStrictlySorted!308 lt!58415))))

(assert (=> d!32255 (= (lemmaContainsTupThenGetReturnValue!77 lt!58415 (_1!1216 lt!58284) (_2!1216 lt!58284)) lt!58821)))

(declare-fun b!113453 () Bool)

(declare-fun res!55902 () Bool)

(assert (=> b!113453 (=> (not res!55902) (not e!73724))))

(assert (=> b!113453 (= res!55902 (containsKey!162 lt!58415 (_1!1216 lt!58284)))))

(declare-fun b!113454 () Bool)

(assert (=> b!113454 (= e!73724 (contains!835 lt!58415 (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284))))))

(assert (= (and d!32255 res!55901) b!113453))

(assert (= (and b!113453 res!55902) b!113454))

(assert (=> d!32255 m!128763))

(declare-fun m!129579 () Bool)

(assert (=> d!32255 m!129579))

(declare-fun m!129581 () Bool)

(assert (=> d!32255 m!129581))

(declare-fun m!129583 () Bool)

(assert (=> b!113453 m!129583))

(declare-fun m!129585 () Bool)

(assert (=> b!113454 m!129585))

(assert (=> d!32039 d!32255))

(declare-fun b!113455 () Bool)

(declare-fun e!73725 () List!1633)

(declare-fun call!12238 () List!1633)

(assert (=> b!113455 (= e!73725 call!12238)))

(declare-fun d!32257 () Bool)

(declare-fun e!73729 () Bool)

(assert (=> d!32257 e!73729))

(declare-fun res!55904 () Bool)

(assert (=> d!32257 (=> (not res!55904) (not e!73729))))

(declare-fun lt!58822 () List!1633)

(assert (=> d!32257 (= res!55904 (isStrictlySorted!308 lt!58822))))

(declare-fun e!73726 () List!1633)

(assert (=> d!32257 (= lt!58822 e!73726)))

(declare-fun c!20333 () Bool)

(assert (=> d!32257 (= c!20333 (and ((_ is Cons!1629) (toList!796 lt!58288)) (bvslt (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58284))))))

(assert (=> d!32257 (isStrictlySorted!308 (toList!796 lt!58288))))

(assert (=> d!32257 (= (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 lt!58284) (_2!1216 lt!58284)) lt!58822)))

(declare-fun bm!12234 () Bool)

(declare-fun call!12237 () List!1633)

(assert (=> bm!12234 (= call!12238 call!12237)))

(declare-fun b!113456 () Bool)

(declare-fun c!20334 () Bool)

(assert (=> b!113456 (= c!20334 (and ((_ is Cons!1629) (toList!796 lt!58288)) (bvsgt (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58284))))))

(declare-fun e!73728 () List!1633)

(assert (=> b!113456 (= e!73728 e!73725)))

(declare-fun b!113457 () Bool)

(assert (=> b!113457 (= e!73728 call!12237)))

(declare-fun b!113458 () Bool)

(declare-fun e!73727 () List!1633)

(assert (=> b!113458 (= e!73727 (insertStrictlySorted!80 (t!5798 (toList!796 lt!58288)) (_1!1216 lt!58284) (_2!1216 lt!58284)))))

(declare-fun b!113459 () Bool)

(assert (=> b!113459 (= e!73726 e!73728)))

(declare-fun c!20335 () Bool)

(assert (=> b!113459 (= c!20335 (and ((_ is Cons!1629) (toList!796 lt!58288)) (= (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58284))))))

(declare-fun b!113460 () Bool)

(assert (=> b!113460 (= e!73727 (ite c!20335 (t!5798 (toList!796 lt!58288)) (ite c!20334 (Cons!1629 (h!2229 (toList!796 lt!58288)) (t!5798 (toList!796 lt!58288))) Nil!1630)))))

(declare-fun b!113461 () Bool)

(assert (=> b!113461 (= e!73725 call!12238)))

(declare-fun b!113462 () Bool)

(declare-fun call!12239 () List!1633)

(assert (=> b!113462 (= e!73726 call!12239)))

(declare-fun b!113463 () Bool)

(assert (=> b!113463 (= e!73729 (contains!835 lt!58822 (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284))))))

(declare-fun bm!12235 () Bool)

(assert (=> bm!12235 (= call!12237 call!12239)))

(declare-fun bm!12236 () Bool)

(assert (=> bm!12236 (= call!12239 ($colon$colon!84 e!73727 (ite c!20333 (h!2229 (toList!796 lt!58288)) (tuple2!2411 (_1!1216 lt!58284) (_2!1216 lt!58284)))))))

(declare-fun c!20336 () Bool)

(assert (=> bm!12236 (= c!20336 c!20333)))

(declare-fun b!113464 () Bool)

(declare-fun res!55903 () Bool)

(assert (=> b!113464 (=> (not res!55903) (not e!73729))))

(assert (=> b!113464 (= res!55903 (containsKey!162 lt!58822 (_1!1216 lt!58284)))))

(assert (= (and d!32257 c!20333) b!113462))

(assert (= (and d!32257 (not c!20333)) b!113459))

(assert (= (and b!113459 c!20335) b!113457))

(assert (= (and b!113459 (not c!20335)) b!113456))

(assert (= (and b!113456 c!20334) b!113461))

(assert (= (and b!113456 (not c!20334)) b!113455))

(assert (= (or b!113461 b!113455) bm!12234))

(assert (= (or b!113457 bm!12234) bm!12235))

(assert (= (or b!113462 bm!12235) bm!12236))

(assert (= (and bm!12236 c!20336) b!113458))

(assert (= (and bm!12236 (not c!20336)) b!113460))

(assert (= (and d!32257 res!55904) b!113464))

(assert (= (and b!113464 res!55903) b!113463))

(declare-fun m!129587 () Bool)

(assert (=> b!113463 m!129587))

(declare-fun m!129589 () Bool)

(assert (=> b!113458 m!129589))

(declare-fun m!129591 () Bool)

(assert (=> bm!12236 m!129591))

(declare-fun m!129593 () Bool)

(assert (=> b!113464 m!129593))

(declare-fun m!129595 () Bool)

(assert (=> d!32257 m!129595))

(declare-fun m!129597 () Bool)

(assert (=> d!32257 m!129597))

(assert (=> d!32039 d!32257))

(declare-fun d!32259 () Bool)

(declare-fun e!73730 () Bool)

(assert (=> d!32259 e!73730))

(declare-fun res!55906 () Bool)

(assert (=> d!32259 (=> (not res!55906) (not e!73730))))

(declare-fun lt!58823 () ListLongMap!1561)

(assert (=> d!32259 (= res!55906 (contains!834 lt!58823 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58826 () List!1633)

(assert (=> d!32259 (= lt!58823 (ListLongMap!1562 lt!58826))))

(declare-fun lt!58825 () Unit!3503)

(declare-fun lt!58824 () Unit!3503)

(assert (=> d!32259 (= lt!58825 lt!58824)))

(assert (=> d!32259 (= (getValueByKey!158 lt!58826 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32259 (= lt!58824 (lemmaContainsTupThenGetReturnValue!77 lt!58826 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32259 (= lt!58826 (insertStrictlySorted!80 (toList!796 call!12184) (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32259 (= (+!142 call!12184 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58823)))

(declare-fun b!113465 () Bool)

(declare-fun res!55905 () Bool)

(assert (=> b!113465 (=> (not res!55905) (not e!73730))))

(assert (=> b!113465 (= res!55905 (= (getValueByKey!158 (toList!796 lt!58823) (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113466 () Bool)

(assert (=> b!113466 (= e!73730 (contains!835 (toList!796 lt!58823) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32259 res!55906) b!113465))

(assert (= (and b!113465 res!55905) b!113466))

(declare-fun m!129599 () Bool)

(assert (=> d!32259 m!129599))

(declare-fun m!129601 () Bool)

(assert (=> d!32259 m!129601))

(declare-fun m!129603 () Bool)

(assert (=> d!32259 m!129603))

(declare-fun m!129605 () Bool)

(assert (=> d!32259 m!129605))

(declare-fun m!129607 () Bool)

(assert (=> b!113465 m!129607))

(declare-fun m!129609 () Bool)

(assert (=> b!113466 m!129609))

(assert (=> b!113049 d!32259))

(declare-fun d!32261 () Bool)

(declare-fun e!73731 () Bool)

(assert (=> d!32261 e!73731))

(declare-fun res!55907 () Bool)

(assert (=> d!32261 (=> res!55907 e!73731)))

(declare-fun lt!58828 () Bool)

(assert (=> d!32261 (= res!55907 (not lt!58828))))

(declare-fun lt!58830 () Bool)

(assert (=> d!32261 (= lt!58828 lt!58830)))

(declare-fun lt!58829 () Unit!3503)

(declare-fun e!73732 () Unit!3503)

(assert (=> d!32261 (= lt!58829 e!73732)))

(declare-fun c!20337 () Bool)

(assert (=> d!32261 (= c!20337 lt!58830)))

(assert (=> d!32261 (= lt!58830 (containsKey!162 (toList!796 call!12159) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32261 (= (contains!834 call!12159 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) lt!58828)))

(declare-fun b!113467 () Bool)

(declare-fun lt!58827 () Unit!3503)

(assert (=> b!113467 (= e!73732 lt!58827)))

(assert (=> b!113467 (= lt!58827 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 call!12159) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> b!113467 (isDefined!112 (getValueByKey!158 (toList!796 call!12159) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113468 () Bool)

(declare-fun Unit!3528 () Unit!3503)

(assert (=> b!113468 (= e!73732 Unit!3528)))

(declare-fun b!113469 () Bool)

(assert (=> b!113469 (= e!73731 (isDefined!112 (getValueByKey!158 (toList!796 call!12159) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(assert (= (and d!32261 c!20337) b!113467))

(assert (= (and d!32261 (not c!20337)) b!113468))

(assert (= (and d!32261 (not res!55907)) b!113469))

(assert (=> d!32261 m!128511))

(declare-fun m!129611 () Bool)

(assert (=> d!32261 m!129611))

(assert (=> b!113467 m!128511))

(declare-fun m!129613 () Bool)

(assert (=> b!113467 m!129613))

(assert (=> b!113467 m!128511))

(declare-fun m!129615 () Bool)

(assert (=> b!113467 m!129615))

(assert (=> b!113467 m!129615))

(declare-fun m!129617 () Bool)

(assert (=> b!113467 m!129617))

(assert (=> b!113469 m!128511))

(assert (=> b!113469 m!129615))

(assert (=> b!113469 m!129615))

(assert (=> b!113469 m!129617))

(assert (=> b!112928 d!32261))

(declare-fun d!32263 () Bool)

(declare-fun res!55909 () Bool)

(declare-fun e!73733 () Bool)

(assert (=> d!32263 (=> res!55909 e!73733)))

(assert (=> d!32263 (= res!55909 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2340 (_keys!4379 (v!2949 (underlying!369 thiss!992))))))))

(assert (=> d!32263 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))) e!73733)))

(declare-fun bm!12237 () Bool)

(declare-fun call!12240 () Bool)

(assert (=> bm!12237 (= call!12240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))))))

(declare-fun b!113470 () Bool)

(declare-fun e!73735 () Bool)

(declare-fun e!73734 () Bool)

(assert (=> b!113470 (= e!73735 e!73734)))

(declare-fun lt!58832 () (_ BitVec 64))

(assert (=> b!113470 (= lt!58832 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!58831 () Unit!3503)

(assert (=> b!113470 (= lt!58831 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58832 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!113470 (arrayContainsKey!0 (_keys!4379 (v!2949 (underlying!369 thiss!992))) lt!58832 #b00000000000000000000000000000000)))

(declare-fun lt!58833 () Unit!3503)

(assert (=> b!113470 (= lt!58833 lt!58831)))

(declare-fun res!55908 () Bool)

(assert (=> b!113470 (= res!55908 (= (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4379 (v!2949 (underlying!369 thiss!992))) (mask!6843 (v!2949 (underlying!369 thiss!992)))) (Found!266 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!113470 (=> (not res!55908) (not e!73734))))

(declare-fun b!113471 () Bool)

(assert (=> b!113471 (= e!73734 call!12240)))

(declare-fun b!113472 () Bool)

(assert (=> b!113472 (= e!73733 e!73735)))

(declare-fun c!20338 () Bool)

(assert (=> b!113472 (= c!20338 (validKeyInArray!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113473 () Bool)

(assert (=> b!113473 (= e!73735 call!12240)))

(assert (= (and d!32263 (not res!55909)) b!113472))

(assert (= (and b!113472 c!20338) b!113470))

(assert (= (and b!113472 (not c!20338)) b!113473))

(assert (= (and b!113470 res!55908) b!113471))

(assert (= (or b!113471 b!113473) bm!12237))

(declare-fun m!129619 () Bool)

(assert (=> bm!12237 m!129619))

(assert (=> b!113470 m!129369))

(declare-fun m!129621 () Bool)

(assert (=> b!113470 m!129621))

(declare-fun m!129623 () Bool)

(assert (=> b!113470 m!129623))

(assert (=> b!113470 m!129369))

(declare-fun m!129625 () Bool)

(assert (=> b!113470 m!129625))

(assert (=> b!113472 m!129369))

(assert (=> b!113472 m!129369))

(assert (=> b!113472 m!129373))

(assert (=> bm!12164 d!32263))

(declare-fun d!32265 () Bool)

(declare-fun e!73736 () Bool)

(assert (=> d!32265 e!73736))

(declare-fun res!55910 () Bool)

(assert (=> d!32265 (=> res!55910 e!73736)))

(declare-fun lt!58835 () Bool)

(assert (=> d!32265 (= res!55910 (not lt!58835))))

(declare-fun lt!58837 () Bool)

(assert (=> d!32265 (= lt!58835 lt!58837)))

(declare-fun lt!58836 () Unit!3503)

(declare-fun e!73737 () Unit!3503)

(assert (=> d!32265 (= lt!58836 e!73737)))

(declare-fun c!20339 () Bool)

(assert (=> d!32265 (= c!20339 lt!58837)))

(assert (=> d!32265 (= lt!58837 (containsKey!162 (toList!796 lt!58379) (_1!1216 lt!58285)))))

(assert (=> d!32265 (= (contains!834 lt!58379 (_1!1216 lt!58285)) lt!58835)))

(declare-fun b!113474 () Bool)

(declare-fun lt!58834 () Unit!3503)

(assert (=> b!113474 (= e!73737 lt!58834)))

(assert (=> b!113474 (= lt!58834 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 lt!58379) (_1!1216 lt!58285)))))

(assert (=> b!113474 (isDefined!112 (getValueByKey!158 (toList!796 lt!58379) (_1!1216 lt!58285)))))

(declare-fun b!113475 () Bool)

(declare-fun Unit!3529 () Unit!3503)

(assert (=> b!113475 (= e!73737 Unit!3529)))

(declare-fun b!113476 () Bool)

(assert (=> b!113476 (= e!73736 (isDefined!112 (getValueByKey!158 (toList!796 lt!58379) (_1!1216 lt!58285))))))

(assert (= (and d!32265 c!20339) b!113474))

(assert (= (and d!32265 (not c!20339)) b!113475))

(assert (= (and d!32265 (not res!55910)) b!113476))

(declare-fun m!129627 () Bool)

(assert (=> d!32265 m!129627))

(declare-fun m!129629 () Bool)

(assert (=> b!113474 m!129629))

(assert (=> b!113474 m!128705))

(assert (=> b!113474 m!128705))

(declare-fun m!129631 () Bool)

(assert (=> b!113474 m!129631))

(assert (=> b!113476 m!128705))

(assert (=> b!113476 m!128705))

(assert (=> b!113476 m!129631))

(assert (=> d!32031 d!32265))

(declare-fun d!32267 () Bool)

(declare-fun c!20340 () Bool)

(assert (=> d!32267 (= c!20340 (and ((_ is Cons!1629) lt!58382) (= (_1!1216 (h!2229 lt!58382)) (_1!1216 lt!58285))))))

(declare-fun e!73738 () Option!164)

(assert (=> d!32267 (= (getValueByKey!158 lt!58382 (_1!1216 lt!58285)) e!73738)))

(declare-fun b!113479 () Bool)

(declare-fun e!73739 () Option!164)

(assert (=> b!113479 (= e!73739 (getValueByKey!158 (t!5798 lt!58382) (_1!1216 lt!58285)))))

(declare-fun b!113477 () Bool)

(assert (=> b!113477 (= e!73738 (Some!163 (_2!1216 (h!2229 lt!58382))))))

(declare-fun b!113480 () Bool)

(assert (=> b!113480 (= e!73739 None!162)))

(declare-fun b!113478 () Bool)

(assert (=> b!113478 (= e!73738 e!73739)))

(declare-fun c!20341 () Bool)

(assert (=> b!113478 (= c!20341 (and ((_ is Cons!1629) lt!58382) (not (= (_1!1216 (h!2229 lt!58382)) (_1!1216 lt!58285)))))))

(assert (= (and d!32267 c!20340) b!113477))

(assert (= (and d!32267 (not c!20340)) b!113478))

(assert (= (and b!113478 c!20341) b!113479))

(assert (= (and b!113478 (not c!20341)) b!113480))

(declare-fun m!129633 () Bool)

(assert (=> b!113479 m!129633))

(assert (=> d!32031 d!32267))

(declare-fun d!32269 () Bool)

(assert (=> d!32269 (= (getValueByKey!158 lt!58382 (_1!1216 lt!58285)) (Some!163 (_2!1216 lt!58285)))))

(declare-fun lt!58838 () Unit!3503)

(assert (=> d!32269 (= lt!58838 (choose!728 lt!58382 (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(declare-fun e!73740 () Bool)

(assert (=> d!32269 e!73740))

(declare-fun res!55911 () Bool)

(assert (=> d!32269 (=> (not res!55911) (not e!73740))))

(assert (=> d!32269 (= res!55911 (isStrictlySorted!308 lt!58382))))

(assert (=> d!32269 (= (lemmaContainsTupThenGetReturnValue!77 lt!58382 (_1!1216 lt!58285) (_2!1216 lt!58285)) lt!58838)))

(declare-fun b!113481 () Bool)

(declare-fun res!55912 () Bool)

(assert (=> b!113481 (=> (not res!55912) (not e!73740))))

(assert (=> b!113481 (= res!55912 (containsKey!162 lt!58382 (_1!1216 lt!58285)))))

(declare-fun b!113482 () Bool)

(assert (=> b!113482 (= e!73740 (contains!835 lt!58382 (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285))))))

(assert (= (and d!32269 res!55911) b!113481))

(assert (= (and b!113481 res!55912) b!113482))

(assert (=> d!32269 m!128699))

(declare-fun m!129635 () Bool)

(assert (=> d!32269 m!129635))

(declare-fun m!129637 () Bool)

(assert (=> d!32269 m!129637))

(declare-fun m!129639 () Bool)

(assert (=> b!113481 m!129639))

(declare-fun m!129641 () Bool)

(assert (=> b!113482 m!129641))

(assert (=> d!32031 d!32269))

(declare-fun b!113483 () Bool)

(declare-fun e!73741 () List!1633)

(declare-fun call!12242 () List!1633)

(assert (=> b!113483 (= e!73741 call!12242)))

(declare-fun d!32271 () Bool)

(declare-fun e!73745 () Bool)

(assert (=> d!32271 e!73745))

(declare-fun res!55914 () Bool)

(assert (=> d!32271 (=> (not res!55914) (not e!73745))))

(declare-fun lt!58839 () List!1633)

(assert (=> d!32271 (= res!55914 (isStrictlySorted!308 lt!58839))))

(declare-fun e!73742 () List!1633)

(assert (=> d!32271 (= lt!58839 e!73742)))

(declare-fun c!20342 () Bool)

(assert (=> d!32271 (= c!20342 (and ((_ is Cons!1629) (toList!796 lt!58288)) (bvslt (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58285))))))

(assert (=> d!32271 (isStrictlySorted!308 (toList!796 lt!58288))))

(assert (=> d!32271 (= (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 lt!58285) (_2!1216 lt!58285)) lt!58839)))

(declare-fun bm!12238 () Bool)

(declare-fun call!12241 () List!1633)

(assert (=> bm!12238 (= call!12242 call!12241)))

(declare-fun b!113484 () Bool)

(declare-fun c!20343 () Bool)

(assert (=> b!113484 (= c!20343 (and ((_ is Cons!1629) (toList!796 lt!58288)) (bvsgt (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58285))))))

(declare-fun e!73744 () List!1633)

(assert (=> b!113484 (= e!73744 e!73741)))

(declare-fun b!113485 () Bool)

(assert (=> b!113485 (= e!73744 call!12241)))

(declare-fun b!113486 () Bool)

(declare-fun e!73743 () List!1633)

(assert (=> b!113486 (= e!73743 (insertStrictlySorted!80 (t!5798 (toList!796 lt!58288)) (_1!1216 lt!58285) (_2!1216 lt!58285)))))

(declare-fun b!113487 () Bool)

(assert (=> b!113487 (= e!73742 e!73744)))

(declare-fun c!20344 () Bool)

(assert (=> b!113487 (= c!20344 (and ((_ is Cons!1629) (toList!796 lt!58288)) (= (_1!1216 (h!2229 (toList!796 lt!58288))) (_1!1216 lt!58285))))))

(declare-fun b!113488 () Bool)

(assert (=> b!113488 (= e!73743 (ite c!20344 (t!5798 (toList!796 lt!58288)) (ite c!20343 (Cons!1629 (h!2229 (toList!796 lt!58288)) (t!5798 (toList!796 lt!58288))) Nil!1630)))))

(declare-fun b!113489 () Bool)

(assert (=> b!113489 (= e!73741 call!12242)))

(declare-fun b!113490 () Bool)

(declare-fun call!12243 () List!1633)

(assert (=> b!113490 (= e!73742 call!12243)))

(declare-fun b!113491 () Bool)

(assert (=> b!113491 (= e!73745 (contains!835 lt!58839 (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285))))))

(declare-fun bm!12239 () Bool)

(assert (=> bm!12239 (= call!12241 call!12243)))

(declare-fun bm!12240 () Bool)

(assert (=> bm!12240 (= call!12243 ($colon$colon!84 e!73743 (ite c!20342 (h!2229 (toList!796 lt!58288)) (tuple2!2411 (_1!1216 lt!58285) (_2!1216 lt!58285)))))))

(declare-fun c!20345 () Bool)

(assert (=> bm!12240 (= c!20345 c!20342)))

(declare-fun b!113492 () Bool)

(declare-fun res!55913 () Bool)

(assert (=> b!113492 (=> (not res!55913) (not e!73745))))

(assert (=> b!113492 (= res!55913 (containsKey!162 lt!58839 (_1!1216 lt!58285)))))

(assert (= (and d!32271 c!20342) b!113490))

(assert (= (and d!32271 (not c!20342)) b!113487))

(assert (= (and b!113487 c!20344) b!113485))

(assert (= (and b!113487 (not c!20344)) b!113484))

(assert (= (and b!113484 c!20343) b!113489))

(assert (= (and b!113484 (not c!20343)) b!113483))

(assert (= (or b!113489 b!113483) bm!12238))

(assert (= (or b!113485 bm!12238) bm!12239))

(assert (= (or b!113490 bm!12239) bm!12240))

(assert (= (and bm!12240 c!20345) b!113486))

(assert (= (and bm!12240 (not c!20345)) b!113488))

(assert (= (and d!32271 res!55914) b!113492))

(assert (= (and b!113492 res!55913) b!113491))

(declare-fun m!129643 () Bool)

(assert (=> b!113491 m!129643))

(declare-fun m!129645 () Bool)

(assert (=> b!113486 m!129645))

(declare-fun m!129647 () Bool)

(assert (=> bm!12240 m!129647))

(declare-fun m!129649 () Bool)

(assert (=> b!113492 m!129649))

(declare-fun m!129651 () Bool)

(assert (=> d!32271 m!129651))

(assert (=> d!32271 m!129597))

(assert (=> d!32031 d!32271))

(declare-fun d!32273 () Bool)

(assert (=> d!32273 (= (get!1361 (select (arr!2081 (_values!2643 (v!2949 (underlying!369 thiss!992)))) from!355) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!389 (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113079 d!32273))

(declare-fun d!32275 () Bool)

(declare-fun e!73748 () Bool)

(assert (=> d!32275 e!73748))

(declare-fun res!55919 () Bool)

(assert (=> d!32275 (=> (not res!55919) (not e!73748))))

(declare-fun lt!58844 () SeekEntryResult!266)

(assert (=> d!32275 (= res!55919 ((_ is Found!266) lt!58844))))

(assert (=> d!32275 (= lt!58844 (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun lt!58845 () Unit!3503)

(declare-fun choose!729 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3503)

(assert (=> d!32275 (= lt!58845 (choose!729 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32275 (validMask!0 (mask!6843 newMap!16))))

(assert (=> d!32275 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)) lt!58845)))

(declare-fun b!113497 () Bool)

(declare-fun res!55920 () Bool)

(assert (=> b!113497 (=> (not res!55920) (not e!73748))))

(assert (=> b!113497 (= res!55920 (inRange!0 (index!3217 lt!58844) (mask!6843 newMap!16)))))

(declare-fun b!113498 () Bool)

(assert (=> b!113498 (= e!73748 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58844)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> b!113498 (and (bvsge (index!3217 lt!58844) #b00000000000000000000000000000000) (bvslt (index!3217 lt!58844) (size!2340 (_keys!4379 newMap!16))))))

(assert (= (and d!32275 res!55919) b!113497))

(assert (= (and b!113497 res!55920) b!113498))

(assert (=> d!32275 m!128511))

(assert (=> d!32275 m!128813))

(assert (=> d!32275 m!128511))

(declare-fun m!129653 () Bool)

(assert (=> d!32275 m!129653))

(assert (=> d!32275 m!128951))

(declare-fun m!129655 () Bool)

(assert (=> b!113497 m!129655))

(declare-fun m!129657 () Bool)

(assert (=> b!113498 m!129657))

(assert (=> bm!12138 d!32275))

(declare-fun d!32277 () Bool)

(declare-fun e!73749 () Bool)

(assert (=> d!32277 e!73749))

(declare-fun res!55921 () Bool)

(assert (=> d!32277 (=> res!55921 e!73749)))

(declare-fun lt!58847 () Bool)

(assert (=> d!32277 (= res!55921 (not lt!58847))))

(declare-fun lt!58849 () Bool)

(assert (=> d!32277 (= lt!58847 lt!58849)))

(declare-fun lt!58848 () Unit!3503)

(declare-fun e!73750 () Unit!3503)

(assert (=> d!32277 (= lt!58848 e!73750)))

(declare-fun c!20346 () Bool)

(assert (=> d!32277 (= c!20346 lt!58849)))

(assert (=> d!32277 (= lt!58849 (containsKey!162 (toList!796 e!73399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32277 (= (contains!834 e!73399 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) lt!58847)))

(declare-fun b!113499 () Bool)

(declare-fun lt!58846 () Unit!3503)

(assert (=> b!113499 (= e!73750 lt!58846)))

(assert (=> b!113499 (= lt!58846 (lemmaContainsKeyImpliesGetValueByKeyDefined!111 (toList!796 e!73399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> b!113499 (isDefined!112 (getValueByKey!158 (toList!796 e!73399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113500 () Bool)

(declare-fun Unit!3530 () Unit!3503)

(assert (=> b!113500 (= e!73750 Unit!3530)))

(declare-fun b!113501 () Bool)

(assert (=> b!113501 (= e!73749 (isDefined!112 (getValueByKey!158 (toList!796 e!73399) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))))

(assert (= (and d!32277 c!20346) b!113499))

(assert (= (and d!32277 (not c!20346)) b!113500))

(assert (= (and d!32277 (not res!55921)) b!113501))

(assert (=> d!32277 m!128511))

(declare-fun m!129659 () Bool)

(assert (=> d!32277 m!129659))

(assert (=> b!113499 m!128511))

(declare-fun m!129661 () Bool)

(assert (=> b!113499 m!129661))

(assert (=> b!113499 m!128511))

(declare-fun m!129663 () Bool)

(assert (=> b!113499 m!129663))

(assert (=> b!113499 m!129663))

(declare-fun m!129665 () Bool)

(assert (=> b!113499 m!129665))

(assert (=> b!113501 m!128511))

(assert (=> b!113501 m!129663))

(assert (=> b!113501 m!129663))

(assert (=> b!113501 m!129665))

(assert (=> bm!12143 d!32277))

(declare-fun d!32279 () Bool)

(declare-fun res!55922 () Bool)

(declare-fun e!73751 () Bool)

(assert (=> d!32279 (=> (not res!55922) (not e!73751))))

(assert (=> d!32279 (= res!55922 (simpleValid!78 (_2!1217 lt!58490)))))

(assert (=> d!32279 (= (valid!435 (_2!1217 lt!58490)) e!73751)))

(declare-fun b!113502 () Bool)

(declare-fun res!55923 () Bool)

(assert (=> b!113502 (=> (not res!55923) (not e!73751))))

(assert (=> b!113502 (= res!55923 (= (arrayCountValidKeys!0 (_keys!4379 (_2!1217 lt!58490)) #b00000000000000000000000000000000 (size!2340 (_keys!4379 (_2!1217 lt!58490)))) (_size!513 (_2!1217 lt!58490))))))

(declare-fun b!113503 () Bool)

(declare-fun res!55924 () Bool)

(assert (=> b!113503 (=> (not res!55924) (not e!73751))))

(assert (=> b!113503 (= res!55924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4379 (_2!1217 lt!58490)) (mask!6843 (_2!1217 lt!58490))))))

(declare-fun b!113504 () Bool)

(assert (=> b!113504 (= e!73751 (arrayNoDuplicates!0 (_keys!4379 (_2!1217 lt!58490)) #b00000000000000000000000000000000 Nil!1629))))

(assert (= (and d!32279 res!55922) b!113502))

(assert (= (and b!113502 res!55923) b!113503))

(assert (= (and b!113503 res!55924) b!113504))

(declare-fun m!129667 () Bool)

(assert (=> d!32279 m!129667))

(declare-fun m!129669 () Bool)

(assert (=> b!113502 m!129669))

(declare-fun m!129671 () Bool)

(assert (=> b!113503 m!129671))

(declare-fun m!129673 () Bool)

(assert (=> b!113504 m!129673))

(assert (=> d!32047 d!32279))

(assert (=> d!32047 d!32043))

(declare-fun d!32281 () Bool)

(declare-fun e!73752 () Bool)

(assert (=> d!32281 e!73752))

(declare-fun res!55926 () Bool)

(assert (=> d!32281 (=> (not res!55926) (not e!73752))))

(declare-fun lt!58850 () ListLongMap!1561)

(assert (=> d!32281 (= res!55926 (contains!834 lt!58850 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun lt!58853 () List!1633)

(assert (=> d!32281 (= lt!58850 (ListLongMap!1562 lt!58853))))

(declare-fun lt!58852 () Unit!3503)

(declare-fun lt!58851 () Unit!3503)

(assert (=> d!32281 (= lt!58852 lt!58851)))

(assert (=> d!32281 (= (getValueByKey!158 lt!58853 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32281 (= lt!58851 (lemmaContainsTupThenGetReturnValue!77 lt!58853 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32281 (= lt!58853 (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32281 (= (+!142 (+!142 lt!58288 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) lt!58850)))

(declare-fun b!113505 () Bool)

(declare-fun res!55925 () Bool)

(assert (=> b!113505 (=> (not res!55925) (not e!73752))))

(assert (=> b!113505 (= res!55925 (= (getValueByKey!158 (toList!796 lt!58850) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(declare-fun b!113506 () Bool)

(assert (=> b!113506 (= e!73752 (contains!835 (toList!796 lt!58850) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))

(assert (= (and d!32281 res!55926) b!113505))

(assert (= (and b!113505 res!55925) b!113506))

(declare-fun m!129675 () Bool)

(assert (=> d!32281 m!129675))

(declare-fun m!129677 () Bool)

(assert (=> d!32281 m!129677))

(declare-fun m!129679 () Bool)

(assert (=> d!32281 m!129679))

(declare-fun m!129681 () Bool)

(assert (=> d!32281 m!129681))

(declare-fun m!129683 () Bool)

(assert (=> b!113505 m!129683))

(declare-fun m!129685 () Bool)

(assert (=> b!113506 m!129685))

(assert (=> d!32029 d!32281))

(declare-fun d!32283 () Bool)

(declare-fun e!73753 () Bool)

(assert (=> d!32283 e!73753))

(declare-fun res!55928 () Bool)

(assert (=> d!32283 (=> (not res!55928) (not e!73753))))

(declare-fun lt!58854 () ListLongMap!1561)

(assert (=> d!32283 (= res!55928 (contains!834 lt!58854 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun lt!58857 () List!1633)

(assert (=> d!32283 (= lt!58854 (ListLongMap!1562 lt!58857))))

(declare-fun lt!58856 () Unit!3503)

(declare-fun lt!58855 () Unit!3503)

(assert (=> d!32283 (= lt!58856 lt!58855)))

(assert (=> d!32283 (= (getValueByKey!158 lt!58857 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32283 (= lt!58855 (lemmaContainsTupThenGetReturnValue!77 lt!58857 (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32283 (= lt!58857 (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(assert (=> d!32283 (= (+!142 lt!58288 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) lt!58854)))

(declare-fun b!113507 () Bool)

(declare-fun res!55927 () Bool)

(assert (=> b!113507 (=> (not res!55927) (not e!73753))))

(assert (=> b!113507 (= res!55927 (= (getValueByKey!158 (toList!796 lt!58854) (_1!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (Some!163 (_2!1216 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))))

(declare-fun b!113508 () Bool)

(assert (=> b!113508 (= e!73753 (contains!835 (toList!796 lt!58854) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))

(assert (= (and d!32283 res!55928) b!113507))

(assert (= (and b!113507 res!55927) b!113508))

(declare-fun m!129687 () Bool)

(assert (=> d!32283 m!129687))

(declare-fun m!129689 () Bool)

(assert (=> d!32283 m!129689))

(declare-fun m!129691 () Bool)

(assert (=> d!32283 m!129691))

(declare-fun m!129693 () Bool)

(assert (=> d!32283 m!129693))

(declare-fun m!129695 () Bool)

(assert (=> b!113507 m!129695))

(declare-fun m!129697 () Bool)

(assert (=> b!113508 m!129697))

(assert (=> d!32029 d!32283))

(declare-fun d!32285 () Bool)

(assert (=> d!32285 (= (+!142 (+!142 lt!58288 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (+!142 (+!142 lt!58288 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)))))

(assert (=> d!32285 true))

(declare-fun _$28!173 () Unit!3503)

(assert (=> d!32285 (= (choose!717 lt!58288 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))) _$28!173)))

(declare-fun bs!4654 () Bool)

(assert (= bs!4654 d!32285))

(assert (=> bs!4654 m!128693))

(assert (=> bs!4654 m!128693))

(assert (=> bs!4654 m!128695))

(assert (=> bs!4654 m!128687))

(assert (=> bs!4654 m!128687))

(assert (=> bs!4654 m!128689))

(assert (=> d!32029 d!32285))

(declare-fun d!32287 () Bool)

(declare-fun e!73754 () Bool)

(assert (=> d!32287 e!73754))

(declare-fun res!55930 () Bool)

(assert (=> d!32287 (=> (not res!55930) (not e!73754))))

(declare-fun lt!58858 () ListLongMap!1561)

(assert (=> d!32287 (= res!55930 (contains!834 lt!58858 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58861 () List!1633)

(assert (=> d!32287 (= lt!58858 (ListLongMap!1562 lt!58861))))

(declare-fun lt!58860 () Unit!3503)

(declare-fun lt!58859 () Unit!3503)

(assert (=> d!32287 (= lt!58860 lt!58859)))

(assert (=> d!32287 (= (getValueByKey!158 lt!58861 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32287 (= lt!58859 (lemmaContainsTupThenGetReturnValue!77 lt!58861 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32287 (= lt!58861 (insertStrictlySorted!80 (toList!796 lt!58288) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32287 (= (+!142 lt!58288 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58858)))

(declare-fun b!113509 () Bool)

(declare-fun res!55929 () Bool)

(assert (=> b!113509 (=> (not res!55929) (not e!73754))))

(assert (=> b!113509 (= res!55929 (= (getValueByKey!158 (toList!796 lt!58858) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113510 () Bool)

(assert (=> b!113510 (= e!73754 (contains!835 (toList!796 lt!58858) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32287 res!55930) b!113509))

(assert (= (and b!113509 res!55929) b!113510))

(declare-fun m!129699 () Bool)

(assert (=> d!32287 m!129699))

(declare-fun m!129701 () Bool)

(assert (=> d!32287 m!129701))

(declare-fun m!129703 () Bool)

(assert (=> d!32287 m!129703))

(declare-fun m!129705 () Bool)

(assert (=> d!32287 m!129705))

(declare-fun m!129707 () Bool)

(assert (=> b!113509 m!129707))

(declare-fun m!129709 () Bool)

(assert (=> b!113510 m!129709))

(assert (=> d!32029 d!32287))

(declare-fun d!32289 () Bool)

(declare-fun e!73755 () Bool)

(assert (=> d!32289 e!73755))

(declare-fun res!55932 () Bool)

(assert (=> d!32289 (=> (not res!55932) (not e!73755))))

(declare-fun lt!58862 () ListLongMap!1561)

(assert (=> d!32289 (= res!55932 (contains!834 lt!58862 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(declare-fun lt!58865 () List!1633)

(assert (=> d!32289 (= lt!58862 (ListLongMap!1562 lt!58865))))

(declare-fun lt!58864 () Unit!3503)

(declare-fun lt!58863 () Unit!3503)

(assert (=> d!32289 (= lt!58864 lt!58863)))

(assert (=> d!32289 (= (getValueByKey!158 lt!58865 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32289 (= lt!58863 (lemmaContainsTupThenGetReturnValue!77 lt!58865 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32289 (= lt!58865 (insertStrictlySorted!80 (toList!796 (+!142 lt!58288 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))))))

(assert (=> d!32289 (= (+!142 (+!142 lt!58288 (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))) lt!58862)))

(declare-fun b!113511 () Bool)

(declare-fun res!55931 () Bool)

(assert (=> b!113511 (=> (not res!55931) (not e!73755))))

(assert (=> b!113511 (= res!55931 (= (getValueByKey!158 (toList!796 lt!58862) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992)))))) (Some!163 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))))

(declare-fun b!113512 () Bool)

(assert (=> b!113512 (= e!73755 (contains!835 (toList!796 lt!58862) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2949 (underlying!369 thiss!992))))))))

(assert (= (and d!32289 res!55932) b!113511))

(assert (= (and b!113511 res!55931) b!113512))

(declare-fun m!129711 () Bool)

(assert (=> d!32289 m!129711))

(declare-fun m!129713 () Bool)

(assert (=> d!32289 m!129713))

(declare-fun m!129715 () Bool)

(assert (=> d!32289 m!129715))

(declare-fun m!129717 () Bool)

(assert (=> d!32289 m!129717))

(declare-fun m!129719 () Bool)

(assert (=> b!113511 m!129719))

(declare-fun m!129721 () Bool)

(assert (=> b!113512 m!129721))

(assert (=> d!32029 d!32289))

(declare-fun b!113547 () Bool)

(declare-fun res!55955 () Bool)

(declare-fun e!73774 () Bool)

(assert (=> b!113547 (=> (not res!55955) (not e!73774))))

(declare-fun lt!58939 () tuple2!2412)

(assert (=> b!113547 (= res!55955 (contains!834 (map!1288 (_2!1217 lt!58939)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun call!12252 () SeekEntryResult!266)

(declare-fun bm!12249 () Bool)

(assert (=> bm!12249 (= call!12252 (seekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (mask!6843 newMap!16)))))

(declare-fun b!113549 () Bool)

(declare-fun e!73775 () Unit!3503)

(declare-fun Unit!3531 () Unit!3503)

(assert (=> b!113549 (= e!73775 Unit!3531)))

(declare-fun lt!58953 () Unit!3503)

(declare-fun lemmaArrayContainsKeyThenInListMap!34 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3503)

(assert (=> b!113549 (= lt!58953 (lemmaArrayContainsKeyThenInListMap!34 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(assert (=> b!113549 (contains!834 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355))))

(declare-fun lt!58937 () Unit!3503)

(assert (=> b!113549 (= lt!58937 lt!58953)))

(assert (=> b!113549 false))

(declare-fun b!113550 () Bool)

(declare-fun res!55957 () Bool)

(declare-fun call!12253 () Bool)

(assert (=> b!113550 (= res!55957 call!12253)))

(declare-fun e!73773 () Bool)

(assert (=> b!113550 (=> (not res!55957) (not e!73773))))

(declare-fun b!113551 () Bool)

(declare-fun e!73779 () Unit!3503)

(declare-fun lt!58945 () Unit!3503)

(assert (=> b!113551 (= e!73779 lt!58945)))

(assert (=> b!113551 (= lt!58945 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58930 () SeekEntryResult!266)

(assert (=> b!113551 (= lt!58930 call!12252)))

(declare-fun c!20356 () Bool)

(assert (=> b!113551 (= c!20356 ((_ is MissingZero!266) lt!58930))))

(declare-fun e!73776 () Bool)

(assert (=> b!113551 e!73776))

(declare-fun b!113552 () Bool)

(declare-fun res!55951 () Bool)

(declare-fun e!73778 () Bool)

(assert (=> b!113552 (=> (not res!55951) (not e!73778))))

(assert (=> b!113552 (= res!55951 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3216 lt!58930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113553 () Bool)

(declare-fun e!73777 () Bool)

(declare-fun call!12255 () Bool)

(assert (=> b!113553 (= e!73777 (not call!12255))))

(declare-fun bm!12250 () Bool)

(declare-fun lt!58948 () SeekEntryResult!266)

(declare-fun c!20357 () Bool)

(assert (=> bm!12250 (= call!12253 (inRange!0 (ite c!20357 (index!3217 lt!58948) (ite c!20356 (index!3216 lt!58930) (index!3219 lt!58930))) (mask!6843 newMap!16)))))

(declare-fun b!113554 () Bool)

(declare-fun res!55956 () Bool)

(assert (=> b!113554 (=> (not res!55956) (not e!73778))))

(declare-fun call!12254 () Bool)

(assert (=> b!113554 (= res!55956 call!12254)))

(assert (=> b!113554 (= e!73776 e!73778)))

(declare-fun b!113555 () Bool)

(declare-fun res!55952 () Bool)

(assert (=> b!113555 (=> (not res!55952) (not e!73774))))

(assert (=> b!113555 (= res!55952 (valid!435 (_2!1217 lt!58939)))))

(declare-fun b!113556 () Bool)

(declare-fun e!73772 () Bool)

(assert (=> b!113556 (= e!73772 e!73777)))

(declare-fun res!55953 () Bool)

(assert (=> b!113556 (= res!55953 call!12254)))

(assert (=> b!113556 (=> (not res!55953) (not e!73777))))

(declare-fun bm!12251 () Bool)

(assert (=> bm!12251 (= call!12254 call!12253)))

(declare-fun b!113557 () Bool)

(assert (=> b!113557 (= e!73773 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3217 lt!58948)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun b!113558 () Bool)

(declare-fun Unit!3532 () Unit!3503)

(assert (=> b!113558 (= e!73779 Unit!3532)))

(declare-fun lt!58935 () Unit!3503)

(assert (=> b!113558 (= lt!58935 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> b!113558 (= lt!58948 call!12252)))

(declare-fun res!55954 () Bool)

(assert (=> b!113558 (= res!55954 ((_ is Found!266) lt!58948))))

(assert (=> b!113558 (=> (not res!55954) (not e!73773))))

(assert (=> b!113558 e!73773))

(declare-fun lt!58949 () Unit!3503)

(assert (=> b!113558 (= lt!58949 lt!58935)))

(assert (=> b!113558 false))

(declare-fun b!113548 () Bool)

(assert (=> b!113548 (= e!73778 (not call!12255))))

(declare-fun d!32291 () Bool)

(assert (=> d!32291 e!73774))

(declare-fun res!55959 () Bool)

(assert (=> d!32291 (=> (not res!55959) (not e!73774))))

(assert (=> d!32291 (= res!55959 (_1!1217 lt!58939))))

(assert (=> d!32291 (= lt!58939 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (bvadd (_size!513 newMap!16) #b00000000000000000000000000000001) (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))) (_vacant!513 newMap!16))))))

(declare-fun lt!58947 () Unit!3503)

(declare-fun lt!58933 () Unit!3503)

(assert (=> d!32291 (= lt!58947 lt!58933)))

(declare-fun lt!58952 () array!4395)

(declare-fun lt!58927 () array!4393)

(assert (=> d!32291 (contains!834 (getCurrentListMap!472 lt!58927 lt!58952 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502))))))

(assert (=> d!32291 (= lt!58933 (lemmaValidKeyInArrayIsInListMap!110 lt!58927 lt!58952 (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32291 (= lt!58952 (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))))))

(assert (=> d!32291 (= lt!58927 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun lt!58955 () Unit!3503)

(declare-fun lt!58931 () Unit!3503)

(assert (=> d!32291 (= lt!58955 lt!58931)))

(declare-fun lt!58932 () array!4393)

(assert (=> d!32291 (= (arrayCountValidKeys!0 lt!58932 (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (bvadd (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4393 (_ BitVec 32)) Unit!3503)

(assert (=> d!32291 (= lt!58931 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58932 (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502))))))

(assert (=> d!32291 (= lt!58932 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun lt!58951 () Unit!3503)

(declare-fun lt!58934 () Unit!3503)

(assert (=> d!32291 (= lt!58951 lt!58934)))

(declare-fun lt!58943 () array!4393)

(assert (=> d!32291 (arrayContainsKey!0 lt!58943 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!32291 (= lt!58934 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58943 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502))))))

(assert (=> d!32291 (= lt!58943 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))))))

(declare-fun lt!58926 () Unit!3503)

(declare-fun lt!58944 () Unit!3503)

(assert (=> d!32291 (= lt!58926 lt!58944)))

(assert (=> d!32291 (= (+!142 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293)) (getCurrentListMap!472 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))) (array!4396 (store (arr!2081 (_values!2643 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (ValueCellFull!1010 lt!58293)) (size!2341 (_values!2643 newMap!16))) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!34 (array!4393 array!4395 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3503)

(assert (=> d!32291 (= lt!58944 (lemmaAddValidKeyToArrayThenAddPairToListMap!34 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58929 () Unit!3503)

(declare-fun lt!58936 () Unit!3503)

(assert (=> d!32291 (= lt!58929 lt!58936)))

(assert (=> d!32291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))) (mask!6843 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4393 (_ BitVec 32) (_ BitVec 32)) Unit!3503)

(assert (=> d!32291 (= lt!58936 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (_keys!4379 newMap!16) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (mask!6843 newMap!16)))))

(declare-fun lt!58940 () Unit!3503)

(declare-fun lt!58946 () Unit!3503)

(assert (=> d!32291 (= lt!58940 lt!58946)))

(assert (=> d!32291 (= (arrayCountValidKeys!0 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))) #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4379 newMap!16) #b00000000000000000000000000000000 (size!2340 (_keys!4379 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4393 (_ BitVec 32) (_ BitVec 64)) Unit!3503)

(assert (=> d!32291 (= lt!58946 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4379 newMap!16) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(declare-fun lt!58942 () Unit!3503)

(declare-fun lt!58928 () Unit!3503)

(assert (=> d!32291 (= lt!58942 lt!58928)))

(declare-fun lt!58938 () (_ BitVec 32))

(declare-fun lt!58954 () List!1632)

(assert (=> d!32291 (arrayNoDuplicates!0 (array!4394 (store (arr!2080 (_keys!4379 newMap!16)) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)) (size!2340 (_keys!4379 newMap!16))) lt!58938 lt!58954)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4393 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1632) Unit!3503)

(assert (=> d!32291 (= lt!58928 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502)) lt!58938 lt!58954))))

(assert (=> d!32291 (= lt!58954 Nil!1629)))

(assert (=> d!32291 (= lt!58938 #b00000000000000000000000000000000)))

(declare-fun lt!58941 () Unit!3503)

(assert (=> d!32291 (= lt!58941 e!73775)))

(declare-fun c!20358 () Bool)

(assert (=> d!32291 (= c!20358 (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58950 () Unit!3503)

(assert (=> d!32291 (= lt!58950 e!73779)))

(assert (=> d!32291 (= c!20357 (contains!834 (getCurrentListMap!472 (_keys!4379 newMap!16) (_values!2643 newMap!16) (mask!6843 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355)))))

(assert (=> d!32291 (valid!435 newMap!16)))

(assert (=> d!32291 (= (updateHelperNewKey!51 newMap!16 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293 (ite c!20196 (index!3219 lt!58502) (index!3216 lt!58502))) lt!58939)))

(declare-fun b!113559 () Bool)

(declare-fun res!55958 () Bool)

(assert (=> b!113559 (= res!55958 (= (select (arr!2080 (_keys!4379 newMap!16)) (index!3219 lt!58930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113559 (=> (not res!55958) (not e!73777))))

(declare-fun b!113560 () Bool)

(assert (=> b!113560 (= e!73774 (= (map!1288 (_2!1217 lt!58939)) (+!142 (map!1288 newMap!16) (tuple2!2411 (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) lt!58293))))))

(declare-fun b!113561 () Bool)

(declare-fun c!20355 () Bool)

(assert (=> b!113561 (= c!20355 ((_ is MissingVacant!266) lt!58930))))

(assert (=> b!113561 (= e!73776 e!73772)))

(declare-fun bm!12252 () Bool)

(assert (=> bm!12252 (= call!12255 (arrayContainsKey!0 (_keys!4379 newMap!16) (select (arr!2080 (_keys!4379 (v!2949 (underlying!369 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113562 () Bool)

(declare-fun Unit!3533 () Unit!3503)

(assert (=> b!113562 (= e!73775 Unit!3533)))

(declare-fun b!113563 () Bool)

(assert (=> b!113563 (= e!73772 ((_ is Undefined!266) lt!58930))))

(assert (= (and d!32291 c!20357) b!113558))

(assert (= (and d!32291 (not c!20357)) b!113551))

(assert (= (and b!113558 res!55954) b!113550))

(assert (= (and b!113550 res!55957) b!113557))

(assert (= (and b!113551 c!20356) b!113554))

(assert (= (and b!113551 (not c!20356)) b!113561))

(assert (= (and b!113554 res!55956) b!113552))

(assert (= (and b!113552 res!55951) b!113548))

(assert (= (and b!113561 c!20355) b!113556))

(assert (= (and b!113561 (not c!20355)) b!113563))

(assert (= (and b!113556 res!55953) b!113559))

(assert (= (and b!113559 res!55958) b!113553))

(assert (= (or b!113554 b!113556) bm!12251))

(assert (= (or b!113548 b!113553) bm!12252))

(assert (= (or b!113550 bm!12251) bm!12250))

(assert (= (or b!113558 b!113551) bm!12249))

(assert (= (and d!32291 c!20358) b!113549))

(assert (= (and d!32291 (not c!20358)) b!113562))

(assert (= (and d!32291 res!55959) b!113555))

(assert (= (and b!113555 res!55952) b!113547))

(assert (= (and b!113547 res!55955) b!113560))

(declare-fun m!129723 () Bool)

(assert (=> b!113547 m!129723))

(assert (=> b!113547 m!129723))

(assert (=> b!113547 m!128511))

(declare-fun m!129725 () Bool)

(assert (=> b!113547 m!129725))

(declare-fun m!129727 () Bool)

(assert (=> d!32291 m!129727))

(assert (=> d!32291 m!128511))

(declare-fun m!129729 () Bool)

(assert (=> d!32291 m!129729))

(declare-fun m!129731 () Bool)

(assert (=> d!32291 m!129731))

(declare-fun m!129733 () Bool)

(assert (=> d!32291 m!129733))

(declare-fun m!129735 () Bool)

(assert (=> d!32291 m!129735))

(declare-fun m!129737 () Bool)

(assert (=> d!32291 m!129737))

(assert (=> d!32291 m!128559))

(assert (=> d!32291 m!128511))

(assert (=> d!32291 m!128817))

(assert (=> d!32291 m!128511))

(declare-fun m!129739 () Bool)

(assert (=> d!32291 m!129739))

(declare-fun m!129741 () Bool)

(assert (=> d!32291 m!129741))

(assert (=> d!32291 m!128835))

(assert (=> d!32291 m!129731))

(assert (=> d!32291 m!128511))

(declare-fun m!129743 () Bool)

(assert (=> d!32291 m!129743))

(declare-fun m!129745 () Bool)

(assert (=> d!32291 m!129745))

(declare-fun m!129747 () Bool)

(assert (=> d!32291 m!129747))

(declare-fun m!129749 () Bool)

(assert (=> d!32291 m!129749))

(declare-fun m!129751 () Bool)

(assert (=> d!32291 m!129751))

(assert (=> d!32291 m!129733))

(assert (=> d!32291 m!128511))

(declare-fun m!129753 () Bool)

(assert (=> d!32291 m!129753))

(assert (=> d!32291 m!128835))

(assert (=> d!32291 m!129479))

(assert (=> d!32291 m!128511))

(declare-fun m!129755 () Bool)

(assert (=> d!32291 m!129755))

(declare-fun m!129757 () Bool)

(assert (=> d!32291 m!129757))

(assert (=> d!32291 m!128511))

(declare-fun m!129759 () Bool)

(assert (=> d!32291 m!129759))

(declare-fun m!129761 () Bool)

(assert (=> d!32291 m!129761))

(assert (=> d!32291 m!128775))

(assert (=> d!32291 m!128835))

(assert (=> d!32291 m!128511))

(declare-fun m!129763 () Bool)

(assert (=> d!32291 m!129763))

(declare-fun m!129765 () Bool)

(assert (=> b!113557 m!129765))

(assert (=> b!113549 m!128511))

(declare-fun m!129767 () Bool)

(assert (=> b!113549 m!129767))

(assert (=> b!113549 m!128835))

(assert (=> b!113549 m!128835))

(assert (=> b!113549 m!128511))

(assert (=> b!113549 m!129763))

(assert (=> b!113558 m!128511))

(assert (=> b!113558 m!128843))

(assert (=> b!113560 m!129723))

(assert (=> b!113560 m!128527))

(assert (=> b!113560 m!128527))

(declare-fun m!129769 () Bool)

(assert (=> b!113560 m!129769))

(assert (=> bm!12252 m!128511))

(assert (=> bm!12252 m!128817))

(declare-fun m!129771 () Bool)

(assert (=> b!113559 m!129771))

(declare-fun m!129773 () Bool)

(assert (=> b!113555 m!129773))

(assert (=> b!113551 m!128511))

(assert (=> b!113551 m!128833))

(declare-fun m!129775 () Bool)

(assert (=> bm!12250 m!129775))

(assert (=> bm!12249 m!128511))

(assert (=> bm!12249 m!128813))

(declare-fun m!129777 () Bool)

(assert (=> b!113552 m!129777))

(assert (=> bm!12153 d!32291))

(assert (=> b!113069 d!32159))

(declare-fun d!32293 () Bool)

(declare-fun c!20359 () Bool)

(assert (=> d!32293 (= c!20359 (and ((_ is Cons!1629) (toList!796 lt!58408)) (= (_1!1216 (h!2229 (toList!796 lt!58408))) (_1!1216 lt!58285))))))

(declare-fun e!73780 () Option!164)

(assert (=> d!32293 (= (getValueByKey!158 (toList!796 lt!58408) (_1!1216 lt!58285)) e!73780)))

(declare-fun b!113566 () Bool)

(declare-fun e!73781 () Option!164)

(assert (=> b!113566 (= e!73781 (getValueByKey!158 (t!5798 (toList!796 lt!58408)) (_1!1216 lt!58285)))))

(declare-fun b!113564 () Bool)

(assert (=> b!113564 (= e!73780 (Some!163 (_2!1216 (h!2229 (toList!796 lt!58408)))))))

(declare-fun b!113567 () Bool)

(assert (=> b!113567 (= e!73781 None!162)))

(declare-fun b!113565 () Bool)

(assert (=> b!113565 (= e!73780 e!73781)))

(declare-fun c!20360 () Bool)

(assert (=> b!113565 (= c!20360 (and ((_ is Cons!1629) (toList!796 lt!58408)) (not (= (_1!1216 (h!2229 (toList!796 lt!58408))) (_1!1216 lt!58285)))))))

(assert (= (and d!32293 c!20359) b!113564))

(assert (= (and d!32293 (not c!20359)) b!113565))

(assert (= (and b!113565 c!20360) b!113566))

(assert (= (and b!113565 (not c!20360)) b!113567))

(declare-fun m!129779 () Bool)

(assert (=> b!113566 m!129779))

(assert (=> b!112819 d!32293))

(declare-fun d!32295 () Bool)

(declare-fun c!20361 () Bool)

(assert (=> d!32295 (= c!20361 (and ((_ is Cons!1629) (toList!796 lt!58404)) (= (_1!1216 (h!2229 (toList!796 lt!58404))) (_1!1216 lt!58284))))))

(declare-fun e!73782 () Option!164)

(assert (=> d!32295 (= (getValueByKey!158 (toList!796 lt!58404) (_1!1216 lt!58284)) e!73782)))

(declare-fun b!113570 () Bool)

(declare-fun e!73783 () Option!164)

(assert (=> b!113570 (= e!73783 (getValueByKey!158 (t!5798 (toList!796 lt!58404)) (_1!1216 lt!58284)))))

(declare-fun b!113568 () Bool)

(assert (=> b!113568 (= e!73782 (Some!163 (_2!1216 (h!2229 (toList!796 lt!58404)))))))

(declare-fun b!113571 () Bool)

(assert (=> b!113571 (= e!73783 None!162)))

(declare-fun b!113569 () Bool)

(assert (=> b!113569 (= e!73782 e!73783)))

(declare-fun c!20362 () Bool)

(assert (=> b!113569 (= c!20362 (and ((_ is Cons!1629) (toList!796 lt!58404)) (not (= (_1!1216 (h!2229 (toList!796 lt!58404))) (_1!1216 lt!58284)))))))

(assert (= (and d!32295 c!20361) b!113568))

(assert (= (and d!32295 (not c!20361)) b!113569))

(assert (= (and b!113569 c!20362) b!113570))

(assert (= (and b!113569 (not c!20362)) b!113571))

(declare-fun m!129781 () Bool)

(assert (=> b!113570 m!129781))

(assert (=> b!112817 d!32295))

(declare-fun mapNonEmpty!4061 () Bool)

(declare-fun mapRes!4061 () Bool)

(declare-fun tp!10127 () Bool)

(declare-fun e!73785 () Bool)

(assert (=> mapNonEmpty!4061 (= mapRes!4061 (and tp!10127 e!73785))))

(declare-fun mapKey!4061 () (_ BitVec 32))

(declare-fun mapRest!4061 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapValue!4061 () ValueCell!1010)

(assert (=> mapNonEmpty!4061 (= mapRest!4059 (store mapRest!4061 mapKey!4061 mapValue!4061))))

(declare-fun b!113572 () Bool)

(assert (=> b!113572 (= e!73785 tp_is_empty!2707)))

(declare-fun b!113573 () Bool)

(declare-fun e!73784 () Bool)

(assert (=> b!113573 (= e!73784 tp_is_empty!2707)))

(declare-fun mapIsEmpty!4061 () Bool)

(assert (=> mapIsEmpty!4061 mapRes!4061))

(declare-fun condMapEmpty!4061 () Bool)

(declare-fun mapDefault!4061 () ValueCell!1010)

(assert (=> mapNonEmpty!4059 (= condMapEmpty!4061 (= mapRest!4059 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4061)))))

(assert (=> mapNonEmpty!4059 (= tp!10125 (and e!73784 mapRes!4061))))

(assert (= (and mapNonEmpty!4059 condMapEmpty!4061) mapIsEmpty!4061))

(assert (= (and mapNonEmpty!4059 (not condMapEmpty!4061)) mapNonEmpty!4061))

(assert (= (and mapNonEmpty!4061 ((_ is ValueCellFull!1010) mapValue!4061)) b!113572))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1010) mapDefault!4061)) b!113573))

(declare-fun m!129783 () Bool)

(assert (=> mapNonEmpty!4061 m!129783))

(declare-fun mapNonEmpty!4062 () Bool)

(declare-fun mapRes!4062 () Bool)

(declare-fun tp!10128 () Bool)

(declare-fun e!73787 () Bool)

(assert (=> mapNonEmpty!4062 (= mapRes!4062 (and tp!10128 e!73787))))

(declare-fun mapRest!4062 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapKey!4062 () (_ BitVec 32))

(declare-fun mapValue!4062 () ValueCell!1010)

(assert (=> mapNonEmpty!4062 (= mapRest!4060 (store mapRest!4062 mapKey!4062 mapValue!4062))))

(declare-fun b!113574 () Bool)

(assert (=> b!113574 (= e!73787 tp_is_empty!2707)))

(declare-fun b!113575 () Bool)

(declare-fun e!73786 () Bool)

(assert (=> b!113575 (= e!73786 tp_is_empty!2707)))

(declare-fun mapIsEmpty!4062 () Bool)

(assert (=> mapIsEmpty!4062 mapRes!4062))

(declare-fun condMapEmpty!4062 () Bool)

(declare-fun mapDefault!4062 () ValueCell!1010)

(assert (=> mapNonEmpty!4060 (= condMapEmpty!4062 (= mapRest!4060 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4062)))))

(assert (=> mapNonEmpty!4060 (= tp!10126 (and e!73786 mapRes!4062))))

(assert (= (and mapNonEmpty!4060 condMapEmpty!4062) mapIsEmpty!4062))

(assert (= (and mapNonEmpty!4060 (not condMapEmpty!4062)) mapNonEmpty!4062))

(assert (= (and mapNonEmpty!4062 ((_ is ValueCellFull!1010) mapValue!4062)) b!113574))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1010) mapDefault!4062)) b!113575))

(declare-fun m!129785 () Bool)

(assert (=> mapNonEmpty!4062 m!129785))

(declare-fun b_lambda!5073 () Bool)

(assert (= b_lambda!5067 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5073)))

(declare-fun b_lambda!5075 () Bool)

(assert (= b_lambda!5071 (or (and b!112626 b_free!2581 (= (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112621 b_free!2583) b_lambda!5075)))

(declare-fun b_lambda!5077 () Bool)

(assert (= b_lambda!5069 (or (and b!112626 b_free!2581 (= (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112621 b_free!2583) b_lambda!5077)))

(declare-fun b_lambda!5079 () Bool)

(assert (= b_lambda!5065 (or (and b!112626 b_free!2581) (and b!112621 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))))) b_lambda!5079)))

(declare-fun b_lambda!5081 () Bool)

(assert (= b_lambda!5063 (or (and b!112626 b_free!2581 (= (defaultEntry!2660 (v!2949 (underlying!369 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112621 b_free!2583) b_lambda!5081)))

(check-sat (not b!113270) (not b!113507) (not b!113445) (not bm!12233) (not b!113502) (not b!113442) (not b!113191) (not b!113377) (not d!32083) (not b!113558) (not bm!12187) (not b_next!2583) (not d!32187) (not b!113499) (not b!113415) (not b!113128) (not bm!12237) (not d!32251) (not bm!12203) (not b!113193) (not b!113223) (not b!113100) (not b!113104) (not b!113566) (not b!113444) (not b!113381) (not b!113339) (not b!113424) (not d!32125) (not d!32255) (not b!113341) (not d!32167) (not b!113453) (not b!113504) (not d!32191) (not b!113238) (not b!113112) (not d!32165) (not b!113506) (not b!113323) (not b!113479) (not b!113334) (not b!113219) (not d!32193) (not b!113333) (not b!113228) (not d!32141) (not b!113287) (not b!113202) (not b!113091) (not b!113236) (not d!32181) (not b!113234) (not d!32279) (not d!32239) (not b!113274) (not b!113343) (not d!32177) (not d!32283) (not b!113237) (not b!113094) (not b!113208) (not d!32241) (not b!113196) (not d!32145) (not b!113378) (not b!113186) (not b!113306) (not d!32285) (not b!113303) (not d!32189) (not b!113131) (not d!32245) (not b!113319) (not b!113309) (not d!32257) (not b!113346) (not b!113384) (not b!113241) (not d!32115) (not d!32127) (not b!113570) (not d!32249) (not d!32213) (not d!32237) (not b!113551) (not b!113458) (not b!113555) (not b!113505) (not d!32271) (not b!113433) (not b!113108) (not d!32129) (not b!113132) (not d!32275) (not b!113349) (not b!113425) (not b!113470) (not bm!12236) (not d!32217) (not bm!12205) (not b!113549) (not d!32153) (not b!113355) (not d!32171) (not b!113205) (not b!113129) (not d!32179) (not b!113463) (not b!113291) (not b!113422) (not b!113279) (not b!113097) (not b!113474) (not b!113448) (not bm!12230) (not b!113158) (not b!113289) (not b!113469) (not b!113194) (not b!113390) (not b!113298) (not b!113501) (not d!32235) (not d!32265) (not bm!12250) (not b!113227) (not b!113275) (not b!113211) (not b_lambda!5075) (not b!113134) (not d!32221) (not b!113511) b_and!6961 (not d!32131) (not b!113195) (not b!113203) (not b!113370) (not d!32215) (not b!113443) b_and!6963 (not d!32227) (not b!113352) (not b!113420) (not d!32087) (not d!32197) (not b!113336) (not d!32163) (not b!113090) (not b!113360) (not b!113437) (not b!113446) (not b!113476) (not d!32135) (not d!32219) (not b!113547) (not bm!12202) (not bm!12220) (not b!113560) (not b!113226) (not b!113318) (not b!113329) (not d!32147) (not d!32281) (not b!113276) (not bm!12212) (not b!113454) (not d!32161) (not d!32261) (not d!32119) (not b!113358) (not b!113269) (not d!32113) (not d!32093) (not d!32185) (not b!113427) (not bm!12252) (not d!32289) (not b!113103) (not b!113136) (not b!113215) (not b!113133) (not d!32201) (not bm!12193) (not d!32103) (not bm!12210) (not bm!12214) (not b!113280) (not d!32233) (not d!32277) (not d!32207) (not b!113497) (not d!32101) (not bm!12240) (not b!113364) (not d!32105) (not b!113320) (not b!113356) (not b!113367) (not bm!12215) tp_is_empty!2707 (not d!32151) (not b!113239) (not b_next!2581) (not d!32247) (not b!113472) (not d!32175) (not b!113508) (not b!113217) (not b!113368) (not b!113115) (not bm!12209) (not d!32269) (not b!113321) (not b!113376) (not d!32097) (not b!113482) (not b!113379) (not d!32225) (not bm!12204) (not b!113316) (not bm!12219) (not b!113512) (not b_lambda!5073) (not d!32139) (not b!113421) (not bm!12188) (not mapNonEmpty!4061) (not bm!12191) (not d!32117) (not d!32199) (not b!113189) (not b_lambda!5077) (not bm!12197) (not b!113126) (not d!32223) (not b!113492) (not d!32229) (not b!113464) (not b!113344) (not d!32111) (not b_lambda!5061) (not b!113391) (not b!113491) (not b!113373) (not d!32173) (not bm!12249) (not d!32091) (not bm!12208) (not b_lambda!5057) (not b!113315) (not b!113467) (not b!113465) (not bm!12218) (not b!113149) (not b!113510) (not b!113451) (not b!113192) (not b!113503) (not d!32259) (not b!113106) (not b!113327) (not bm!12213) (not b!113296) (not b!113330) (not b!113430) (not b!113324) (not b!113184) (not b!113254) (not mapNonEmpty!4062) (not d!32209) (not b!113466) (not b!113432) (not b!113130) (not d!32291) (not b_lambda!5081) (not b_lambda!5059) (not d!32195) (not d!32095) (not b!113300) (not bm!12192) (not b!113214) (not b!113509) (not b_lambda!5079) (not b!113325) (not b_lambda!5049) (not d!32183) (not d!32121) (not d!32287) (not b!113486) (not b!113481) (not b!113272))
(check-sat b_and!6961 b_and!6963 (not b_next!2581) (not b_next!2583))
