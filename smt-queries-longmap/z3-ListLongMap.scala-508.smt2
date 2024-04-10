; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12142 () Bool)

(assert start!12142)

(declare-fun b!102531 () Bool)

(declare-fun b_free!2489 () Bool)

(declare-fun b_next!2489 () Bool)

(assert (=> b!102531 (= b_free!2489 (not b_next!2489))))

(declare-fun tp!9780 () Bool)

(declare-fun b_and!6327 () Bool)

(assert (=> b!102531 (= tp!9780 b_and!6327)))

(declare-fun b!102523 () Bool)

(declare-fun b_free!2491 () Bool)

(declare-fun b_next!2491 () Bool)

(assert (=> b!102523 (= b_free!2491 (not b_next!2491))))

(declare-fun tp!9779 () Bool)

(declare-fun b_and!6329 () Bool)

(assert (=> b!102523 (= tp!9779 b_and!6329)))

(declare-fun mapIsEmpty!3863 () Bool)

(declare-fun mapRes!3864 () Bool)

(assert (=> mapIsEmpty!3863 mapRes!3864))

(declare-fun b!102521 () Bool)

(declare-fun e!66752 () Bool)

(declare-fun tp_is_empty!2661 () Bool)

(assert (=> b!102521 (= e!66752 tp_is_empty!2661)))

(declare-fun b!102522 () Bool)

(declare-fun res!51293 () Bool)

(declare-fun e!66759 () Bool)

(assert (=> b!102522 (=> (not res!51293) (not e!66759))))

(declare-datatypes ((V!3195 0))(
  ( (V!3196 (val!1375 Int)) )
))
(declare-datatypes ((array!4309 0))(
  ( (array!4310 (arr!2045 (Array (_ BitVec 32) (_ BitVec 64))) (size!2299 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!987 0))(
  ( (ValueCellFull!987 (v!2861 V!3195)) (EmptyCell!987) )
))
(declare-datatypes ((array!4311 0))(
  ( (array!4312 (arr!2046 (Array (_ BitVec 32) ValueCell!987)) (size!2300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!882 0))(
  ( (LongMapFixedSize!883 (defaultEntry!2552 Int) (mask!6683 (_ BitVec 32)) (extraKeys!2361 (_ BitVec 32)) (zeroValue!2429 V!3195) (minValue!2429 V!3195) (_size!490 (_ BitVec 32)) (_keys!4254 array!4309) (_values!2535 array!4311) (_vacant!490 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!882)

(declare-fun valid!407 (LongMapFixedSize!882) Bool)

(assert (=> b!102522 (= res!51293 (valid!407 newMap!16))))

(declare-fun e!66760 () Bool)

(declare-fun e!66749 () Bool)

(declare-fun array_inv!1283 (array!4309) Bool)

(declare-fun array_inv!1284 (array!4311) Bool)

(assert (=> b!102523 (= e!66749 (and tp!9779 tp_is_empty!2661 (array_inv!1283 (_keys!4254 newMap!16)) (array_inv!1284 (_values!2535 newMap!16)) e!66760))))

(declare-fun b!102524 () Bool)

(declare-fun res!51298 () Bool)

(assert (=> b!102524 (=> (not res!51298) (not e!66759))))

(declare-datatypes ((Cell!682 0))(
  ( (Cell!683 (v!2862 LongMapFixedSize!882)) )
))
(declare-datatypes ((LongMap!682 0))(
  ( (LongMap!683 (underlying!352 Cell!682)) )
))
(declare-fun thiss!992 () LongMap!682)

(assert (=> b!102524 (= res!51298 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6683 newMap!16)) (_size!490 (v!2862 (underlying!352 thiss!992)))))))

(declare-fun b!102525 () Bool)

(declare-fun e!66747 () Bool)

(assert (=> b!102525 (= e!66760 (and e!66747 mapRes!3864))))

(declare-fun condMapEmpty!3864 () Bool)

(declare-fun mapDefault!3864 () ValueCell!987)

(assert (=> b!102525 (= condMapEmpty!3864 (= (arr!2046 (_values!2535 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!987)) mapDefault!3864)))))

(declare-fun b!102526 () Bool)

(declare-datatypes ((Unit!3128 0))(
  ( (Unit!3129) )
))
(declare-fun e!66758 () Unit!3128)

(declare-fun Unit!3130 () Unit!3128)

(assert (=> b!102526 (= e!66758 Unit!3130)))

(declare-fun lt!52123 () Unit!3128)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!100 (array!4309 array!4311 (_ BitVec 32) (_ BitVec 32) V!3195 V!3195 (_ BitVec 64) (_ BitVec 32) Int) Unit!3128)

(assert (=> b!102526 (= lt!52123 (lemmaListMapContainsThenArrayContainsFrom!100 (_keys!4254 (v!2862 (underlying!352 thiss!992))) (_values!2535 (v!2862 (underlying!352 thiss!992))) (mask!6683 (v!2862 (underlying!352 thiss!992))) (extraKeys!2361 (v!2862 (underlying!352 thiss!992))) (zeroValue!2429 (v!2862 (underlying!352 thiss!992))) (minValue!2429 (v!2862 (underlying!352 thiss!992))) (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2552 (v!2862 (underlying!352 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102526 (arrayContainsKey!0 (_keys!4254 (v!2862 (underlying!352 thiss!992))) (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!52118 () Unit!3128)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4309 (_ BitVec 32) (_ BitVec 32)) Unit!3128)

(assert (=> b!102526 (= lt!52118 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4254 (v!2862 (underlying!352 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1602 0))(
  ( (Nil!1599) (Cons!1598 (h!2194 (_ BitVec 64)) (t!5640 List!1602)) )
))
(declare-fun arrayNoDuplicates!0 (array!4309 (_ BitVec 32) List!1602) Bool)

(assert (=> b!102526 (arrayNoDuplicates!0 (_keys!4254 (v!2862 (underlying!352 thiss!992))) from!355 Nil!1599)))

(declare-fun lt!52116 () Unit!3128)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4309 (_ BitVec 32) (_ BitVec 64) List!1602) Unit!3128)

(assert (=> b!102526 (= lt!52116 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4254 (v!2862 (underlying!352 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) (Cons!1598 (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) Nil!1599)))))

(assert (=> b!102526 false))

(declare-fun b!102527 () Bool)

(assert (=> b!102527 (= e!66747 tp_is_empty!2661)))

(declare-fun mapNonEmpty!3863 () Bool)

(declare-fun mapRes!3863 () Bool)

(declare-fun tp!9777 () Bool)

(declare-fun e!66757 () Bool)

(assert (=> mapNonEmpty!3863 (= mapRes!3863 (and tp!9777 e!66757))))

(declare-fun mapRest!3863 () (Array (_ BitVec 32) ValueCell!987))

(declare-fun mapKey!3864 () (_ BitVec 32))

(declare-fun mapValue!3864 () ValueCell!987)

(assert (=> mapNonEmpty!3863 (= (arr!2046 (_values!2535 (v!2862 (underlying!352 thiss!992)))) (store mapRest!3863 mapKey!3864 mapValue!3864))))

(declare-fun b!102528 () Bool)

(declare-fun e!66746 () Bool)

(assert (=> b!102528 (= e!66746 (and e!66752 mapRes!3863))))

(declare-fun condMapEmpty!3863 () Bool)

(declare-fun mapDefault!3863 () ValueCell!987)

(assert (=> b!102528 (= condMapEmpty!3863 (= (arr!2046 (_values!2535 (v!2862 (underlying!352 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!987)) mapDefault!3863)))))

(declare-fun b!102529 () Bool)

(declare-fun e!66748 () Bool)

(declare-fun e!66761 () Bool)

(assert (=> b!102529 (= e!66748 e!66761)))

(declare-fun res!51295 () Bool)

(assert (=> start!12142 (=> (not res!51295) (not e!66759))))

(declare-fun valid!408 (LongMap!682) Bool)

(assert (=> start!12142 (= res!51295 (valid!408 thiss!992))))

(assert (=> start!12142 e!66759))

(declare-fun e!66756 () Bool)

(assert (=> start!12142 e!66756))

(assert (=> start!12142 true))

(assert (=> start!12142 e!66749))

(declare-fun b!102530 () Bool)

(declare-fun e!66753 () Bool)

(declare-fun e!66751 () Bool)

(assert (=> b!102530 (= e!66753 e!66751)))

(declare-fun res!51294 () Bool)

(assert (=> b!102530 (=> (not res!51294) (not e!66751))))

(declare-datatypes ((tuple2!2380 0))(
  ( (tuple2!2381 (_1!1201 Bool) (_2!1201 LongMapFixedSize!882)) )
))
(declare-fun lt!52120 () tuple2!2380)

(assert (=> b!102530 (= res!51294 (and (_1!1201 lt!52120) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!52121 () Unit!3128)

(assert (=> b!102530 (= lt!52121 e!66758)))

(declare-datatypes ((tuple2!2382 0))(
  ( (tuple2!2383 (_1!1202 (_ BitVec 64)) (_2!1202 V!3195)) )
))
(declare-datatypes ((List!1603 0))(
  ( (Nil!1600) (Cons!1599 (h!2195 tuple2!2382) (t!5641 List!1603)) )
))
(declare-datatypes ((ListLongMap!1557 0))(
  ( (ListLongMap!1558 (toList!794 List!1603)) )
))
(declare-fun lt!52117 () ListLongMap!1557)

(declare-fun c!17643 () Bool)

(declare-fun contains!818 (ListLongMap!1557 (_ BitVec 64)) Bool)

(assert (=> b!102530 (= c!17643 (contains!818 lt!52117 (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355)))))

(declare-fun update!150 (LongMapFixedSize!882 (_ BitVec 64) V!3195) tuple2!2380)

(declare-fun get!1312 (ValueCell!987 V!3195) V!3195)

(declare-fun dynLambda!378 (Int (_ BitVec 64)) V!3195)

(assert (=> b!102530 (= lt!52120 (update!150 newMap!16 (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) (get!1312 (select (arr!2046 (_values!2535 (v!2862 (underlying!352 thiss!992)))) from!355) (dynLambda!378 (defaultEntry!2552 (v!2862 (underlying!352 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!102531 (= e!66761 (and tp!9780 tp_is_empty!2661 (array_inv!1283 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) (array_inv!1284 (_values!2535 (v!2862 (underlying!352 thiss!992)))) e!66746))))

(declare-fun b!102532 () Bool)

(assert (=> b!102532 (= e!66759 e!66753)))

(declare-fun res!51297 () Bool)

(assert (=> b!102532 (=> (not res!51297) (not e!66753))))

(declare-fun lt!52122 () ListLongMap!1557)

(assert (=> b!102532 (= res!51297 (and (= lt!52122 lt!52117) (not (= (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2045 (_keys!4254 (v!2862 (underlying!352 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1274 (LongMapFixedSize!882) ListLongMap!1557)

(assert (=> b!102532 (= lt!52117 (map!1274 newMap!16))))

(declare-fun getCurrentListMap!483 (array!4309 array!4311 (_ BitVec 32) (_ BitVec 32) V!3195 V!3195 (_ BitVec 32) Int) ListLongMap!1557)

(assert (=> b!102532 (= lt!52122 (getCurrentListMap!483 (_keys!4254 (v!2862 (underlying!352 thiss!992))) (_values!2535 (v!2862 (underlying!352 thiss!992))) (mask!6683 (v!2862 (underlying!352 thiss!992))) (extraKeys!2361 (v!2862 (underlying!352 thiss!992))) (zeroValue!2429 (v!2862 (underlying!352 thiss!992))) (minValue!2429 (v!2862 (underlying!352 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2552 (v!2862 (underlying!352 thiss!992)))))))

(declare-fun b!102533 () Bool)

(declare-fun Unit!3131 () Unit!3128)

(assert (=> b!102533 (= e!66758 Unit!3131)))

(declare-fun b!102534 () Bool)

(assert (=> b!102534 (= e!66756 e!66748)))

(declare-fun b!102535 () Bool)

(assert (=> b!102535 (= e!66757 tp_is_empty!2661)))

(declare-fun b!102536 () Bool)

(declare-fun res!51296 () Bool)

(assert (=> b!102536 (=> (not res!51296) (not e!66759))))

(assert (=> b!102536 (= res!51296 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2299 (_keys!4254 (v!2862 (underlying!352 thiss!992)))))))))

(declare-fun b!102537 () Bool)

(declare-fun e!66754 () Bool)

(assert (=> b!102537 (= e!66754 tp_is_empty!2661)))

(declare-fun mapNonEmpty!3864 () Bool)

(declare-fun tp!9778 () Bool)

(assert (=> mapNonEmpty!3864 (= mapRes!3864 (and tp!9778 e!66754))))

(declare-fun mapKey!3863 () (_ BitVec 32))

(declare-fun mapValue!3863 () ValueCell!987)

(declare-fun mapRest!3864 () (Array (_ BitVec 32) ValueCell!987))

(assert (=> mapNonEmpty!3864 (= (arr!2046 (_values!2535 newMap!16)) (store mapRest!3864 mapKey!3863 mapValue!3863))))

(declare-fun b!102538 () Bool)

(assert (=> b!102538 (= e!66751 false)))

(declare-fun lt!52119 () ListLongMap!1557)

(declare-fun getCurrentListMapNoExtraKeys!104 (array!4309 array!4311 (_ BitVec 32) (_ BitVec 32) V!3195 V!3195 (_ BitVec 32) Int) ListLongMap!1557)

(assert (=> b!102538 (= lt!52119 (getCurrentListMapNoExtraKeys!104 (_keys!4254 (v!2862 (underlying!352 thiss!992))) (_values!2535 (v!2862 (underlying!352 thiss!992))) (mask!6683 (v!2862 (underlying!352 thiss!992))) (extraKeys!2361 (v!2862 (underlying!352 thiss!992))) (zeroValue!2429 (v!2862 (underlying!352 thiss!992))) (minValue!2429 (v!2862 (underlying!352 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2552 (v!2862 (underlying!352 thiss!992)))))))

(declare-fun mapIsEmpty!3864 () Bool)

(assert (=> mapIsEmpty!3864 mapRes!3863))

(assert (= (and start!12142 res!51295) b!102536))

(assert (= (and b!102536 res!51296) b!102522))

(assert (= (and b!102522 res!51293) b!102524))

(assert (= (and b!102524 res!51298) b!102532))

(assert (= (and b!102532 res!51297) b!102530))

(assert (= (and b!102530 c!17643) b!102526))

(assert (= (and b!102530 (not c!17643)) b!102533))

(assert (= (and b!102530 res!51294) b!102538))

(assert (= (and b!102528 condMapEmpty!3863) mapIsEmpty!3864))

(assert (= (and b!102528 (not condMapEmpty!3863)) mapNonEmpty!3863))

(get-info :version)

(assert (= (and mapNonEmpty!3863 ((_ is ValueCellFull!987) mapValue!3864)) b!102535))

(assert (= (and b!102528 ((_ is ValueCellFull!987) mapDefault!3863)) b!102521))

(assert (= b!102531 b!102528))

(assert (= b!102529 b!102531))

(assert (= b!102534 b!102529))

(assert (= start!12142 b!102534))

(assert (= (and b!102525 condMapEmpty!3864) mapIsEmpty!3863))

(assert (= (and b!102525 (not condMapEmpty!3864)) mapNonEmpty!3864))

(assert (= (and mapNonEmpty!3864 ((_ is ValueCellFull!987) mapValue!3863)) b!102537))

(assert (= (and b!102525 ((_ is ValueCellFull!987) mapDefault!3864)) b!102527))

(assert (= b!102523 b!102525))

(assert (= start!12142 b!102523))

(declare-fun b_lambda!4591 () Bool)

(assert (=> (not b_lambda!4591) (not b!102530)))

(declare-fun t!5637 () Bool)

(declare-fun tb!2005 () Bool)

(assert (=> (and b!102531 (= (defaultEntry!2552 (v!2862 (underlying!352 thiss!992))) (defaultEntry!2552 (v!2862 (underlying!352 thiss!992)))) t!5637) tb!2005))

(declare-fun result!3383 () Bool)

(assert (=> tb!2005 (= result!3383 tp_is_empty!2661)))

(assert (=> b!102530 t!5637))

(declare-fun b_and!6331 () Bool)

(assert (= b_and!6327 (and (=> t!5637 result!3383) b_and!6331)))

(declare-fun t!5639 () Bool)

(declare-fun tb!2007 () Bool)

(assert (=> (and b!102523 (= (defaultEntry!2552 newMap!16) (defaultEntry!2552 (v!2862 (underlying!352 thiss!992)))) t!5639) tb!2007))

(declare-fun result!3387 () Bool)

(assert (= result!3387 result!3383))

(assert (=> b!102530 t!5639))

(declare-fun b_and!6333 () Bool)

(assert (= b_and!6329 (and (=> t!5639 result!3387) b_and!6333)))

(declare-fun m!113611 () Bool)

(assert (=> b!102532 m!113611))

(declare-fun m!113613 () Bool)

(assert (=> b!102532 m!113613))

(declare-fun m!113615 () Bool)

(assert (=> b!102532 m!113615))

(declare-fun m!113617 () Bool)

(assert (=> b!102530 m!113617))

(declare-fun m!113619 () Bool)

(assert (=> b!102530 m!113619))

(declare-fun m!113621 () Bool)

(assert (=> b!102530 m!113621))

(assert (=> b!102530 m!113611))

(declare-fun m!113623 () Bool)

(assert (=> b!102530 m!113623))

(assert (=> b!102530 m!113611))

(assert (=> b!102530 m!113619))

(assert (=> b!102530 m!113611))

(assert (=> b!102530 m!113621))

(declare-fun m!113625 () Bool)

(assert (=> b!102530 m!113625))

(assert (=> b!102530 m!113617))

(declare-fun m!113627 () Bool)

(assert (=> start!12142 m!113627))

(declare-fun m!113629 () Bool)

(assert (=> mapNonEmpty!3864 m!113629))

(declare-fun m!113631 () Bool)

(assert (=> b!102526 m!113631))

(declare-fun m!113633 () Bool)

(assert (=> b!102526 m!113633))

(assert (=> b!102526 m!113611))

(declare-fun m!113635 () Bool)

(assert (=> b!102526 m!113635))

(assert (=> b!102526 m!113611))

(assert (=> b!102526 m!113611))

(declare-fun m!113637 () Bool)

(assert (=> b!102526 m!113637))

(assert (=> b!102526 m!113611))

(declare-fun m!113639 () Bool)

(assert (=> b!102526 m!113639))

(declare-fun m!113641 () Bool)

(assert (=> b!102531 m!113641))

(declare-fun m!113643 () Bool)

(assert (=> b!102531 m!113643))

(declare-fun m!113645 () Bool)

(assert (=> b!102522 m!113645))

(declare-fun m!113647 () Bool)

(assert (=> b!102538 m!113647))

(declare-fun m!113649 () Bool)

(assert (=> b!102523 m!113649))

(declare-fun m!113651 () Bool)

(assert (=> b!102523 m!113651))

(declare-fun m!113653 () Bool)

(assert (=> mapNonEmpty!3863 m!113653))

(check-sat (not start!12142) (not b_next!2489) (not b!102531) b_and!6331 (not b!102523) (not b!102530) tp_is_empty!2661 b_and!6333 (not b_next!2491) (not b_lambda!4591) (not b!102538) (not b!102526) (not mapNonEmpty!3864) (not b!102522) (not mapNonEmpty!3863) (not b!102532))
(check-sat b_and!6331 b_and!6333 (not b_next!2489) (not b_next!2491))
