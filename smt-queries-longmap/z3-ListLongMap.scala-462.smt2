; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8388 () Bool)

(assert start!8388)

(declare-fun b!56621 () Bool)

(declare-fun b_free!1933 () Bool)

(declare-fun b_next!1933 () Bool)

(assert (=> b!56621 (= b_free!1933 (not b_next!1933))))

(declare-fun tp!7900 () Bool)

(declare-fun b_and!3405 () Bool)

(assert (=> b!56621 (= tp!7900 b_and!3405)))

(declare-fun b!56615 () Bool)

(declare-fun b_free!1935 () Bool)

(declare-fun b_next!1935 () Bool)

(assert (=> b!56615 (= b_free!1935 (not b_next!1935))))

(declare-fun tp!7902 () Bool)

(declare-fun b_and!3407 () Bool)

(assert (=> b!56615 (= tp!7902 b_and!3407)))

(declare-fun b!56607 () Bool)

(declare-fun e!37303 () Bool)

(declare-datatypes ((V!2825 0))(
  ( (V!2826 (val!1236 Int)) )
))
(declare-datatypes ((array!3675 0))(
  ( (array!3676 (arr!1760 (Array (_ BitVec 32) (_ BitVec 64))) (size!1989 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!848 0))(
  ( (ValueCellFull!848 (v!2357 V!2825)) (EmptyCell!848) )
))
(declare-datatypes ((array!3677 0))(
  ( (array!3678 (arr!1761 (Array (_ BitVec 32) ValueCell!848)) (size!1990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!604 0))(
  ( (LongMapFixedSize!605 (defaultEntry!2016 Int) (mask!5887 (_ BitVec 32)) (extraKeys!1907 (_ BitVec 32)) (zeroValue!1934 V!2825) (minValue!1934 V!2825) (_size!351 (_ BitVec 32)) (_keys!3636 array!3675) (_values!1999 array!3677) (_vacant!351 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!416 0))(
  ( (Cell!417 (v!2358 LongMapFixedSize!604)) )
))
(declare-datatypes ((LongMap!416 0))(
  ( (LongMap!417 (underlying!219 Cell!416)) )
))
(declare-fun thiss!992 () LongMap!416)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!56607 (= e!37303 (not (validMask!0 (mask!5887 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun b!56608 () Bool)

(declare-fun e!37295 () Bool)

(declare-fun tp_is_empty!2383 () Bool)

(assert (=> b!56608 (= e!37295 tp_is_empty!2383)))

(declare-fun b!56609 () Bool)

(declare-fun e!37305 () Bool)

(assert (=> b!56609 (= e!37305 e!37303)))

(declare-fun res!31819 () Bool)

(assert (=> b!56609 (=> (not res!31819) (not e!37303))))

(declare-datatypes ((tuple2!2004 0))(
  ( (tuple2!2005 (_1!1013 Bool) (_2!1013 LongMapFixedSize!604)) )
))
(declare-fun lt!22294 () tuple2!2004)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!56609 (= res!31819 (and (_1!1013 lt!22294) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1476 0))(
  ( (Unit!1477) )
))
(declare-fun lt!22297 () Unit!1476)

(declare-fun e!37297 () Unit!1476)

(assert (=> b!56609 (= lt!22297 e!37297)))

(declare-datatypes ((tuple2!2006 0))(
  ( (tuple2!2007 (_1!1014 (_ BitVec 64)) (_2!1014 V!2825)) )
))
(declare-datatypes ((List!1417 0))(
  ( (Nil!1414) (Cons!1413 (h!1993 tuple2!2006) (t!4719 List!1417)) )
))
(declare-datatypes ((ListLongMap!1337 0))(
  ( (ListLongMap!1338 (toList!684 List!1417)) )
))
(declare-fun lt!22296 () ListLongMap!1337)

(declare-fun c!6939 () Bool)

(declare-fun contains!673 (ListLongMap!1337 (_ BitVec 64)) Bool)

(assert (=> b!56609 (= c!6939 (contains!673 lt!22296 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!604)

(declare-fun update!84 (LongMapFixedSize!604 (_ BitVec 64) V!2825) tuple2!2004)

(declare-fun get!1061 (ValueCell!848 V!2825) V!2825)

(declare-fun dynLambda!302 (Int (_ BitVec 64)) V!2825)

(assert (=> b!56609 (= lt!22294 (update!84 newMap!16 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56610 () Bool)

(declare-fun e!37296 () Bool)

(assert (=> b!56610 (= e!37296 e!37305)))

(declare-fun res!31814 () Bool)

(assert (=> b!56610 (=> (not res!31814) (not e!37305))))

(declare-fun lt!22292 () ListLongMap!1337)

(assert (=> b!56610 (= res!31814 (and (= lt!22292 lt!22296) (not (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1101 (LongMapFixedSize!604) ListLongMap!1337)

(assert (=> b!56610 (= lt!22296 (map!1101 newMap!16))))

(declare-fun getCurrentListMap!385 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) ListLongMap!1337)

(assert (=> b!56610 (= lt!22292 (getCurrentListMap!385 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun mapNonEmpty!2819 () Bool)

(declare-fun mapRes!2820 () Bool)

(declare-fun tp!7901 () Bool)

(assert (=> mapNonEmpty!2819 (= mapRes!2820 (and tp!7901 e!37295))))

(declare-fun mapRest!2819 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapValue!2819 () ValueCell!848)

(declare-fun mapKey!2819 () (_ BitVec 32))

(assert (=> mapNonEmpty!2819 (= (arr!1761 (_values!1999 newMap!16)) (store mapRest!2819 mapKey!2819 mapValue!2819))))

(declare-fun b!56611 () Bool)

(declare-fun Unit!1478 () Unit!1476)

(assert (=> b!56611 (= e!37297 Unit!1478)))

(declare-fun b!56612 () Bool)

(declare-fun res!31815 () Bool)

(assert (=> b!56612 (=> (not res!31815) (not e!37296))))

(assert (=> b!56612 (= res!31815 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5887 newMap!16)) (_size!351 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun b!56613 () Bool)

(declare-fun e!37306 () Bool)

(declare-fun e!37294 () Bool)

(assert (=> b!56613 (= e!37306 (and e!37294 mapRes!2820))))

(declare-fun condMapEmpty!2819 () Bool)

(declare-fun mapDefault!2819 () ValueCell!848)

(assert (=> b!56613 (= condMapEmpty!2819 (= (arr!1761 (_values!1999 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2819)))))

(declare-fun b!56614 () Bool)

(declare-fun e!37302 () Bool)

(assert (=> b!56614 (= e!37302 tp_is_empty!2383)))

(declare-fun mapNonEmpty!2820 () Bool)

(declare-fun mapRes!2819 () Bool)

(declare-fun tp!7899 () Bool)

(assert (=> mapNonEmpty!2820 (= mapRes!2819 (and tp!7899 e!37302))))

(declare-fun mapRest!2820 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapValue!2820 () ValueCell!848)

(declare-fun mapKey!2820 () (_ BitVec 32))

(assert (=> mapNonEmpty!2820 (= (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) (store mapRest!2820 mapKey!2820 mapValue!2820))))

(declare-fun res!31816 () Bool)

(assert (=> start!8388 (=> (not res!31816) (not e!37296))))

(declare-fun valid!258 (LongMap!416) Bool)

(assert (=> start!8388 (= res!31816 (valid!258 thiss!992))))

(assert (=> start!8388 e!37296))

(declare-fun e!37301 () Bool)

(assert (=> start!8388 e!37301))

(assert (=> start!8388 true))

(declare-fun e!37293 () Bool)

(assert (=> start!8388 e!37293))

(declare-fun mapIsEmpty!2819 () Bool)

(assert (=> mapIsEmpty!2819 mapRes!2819))

(declare-fun array_inv!1083 (array!3675) Bool)

(declare-fun array_inv!1084 (array!3677) Bool)

(assert (=> b!56615 (= e!37293 (and tp!7902 tp_is_empty!2383 (array_inv!1083 (_keys!3636 newMap!16)) (array_inv!1084 (_values!1999 newMap!16)) e!37306))))

(declare-fun mapIsEmpty!2820 () Bool)

(assert (=> mapIsEmpty!2820 mapRes!2820))

(declare-fun b!56616 () Bool)

(declare-fun e!37300 () Bool)

(declare-fun e!37299 () Bool)

(assert (=> b!56616 (= e!37300 e!37299)))

(declare-fun b!56617 () Bool)

(declare-fun e!37292 () Bool)

(declare-fun e!37291 () Bool)

(assert (=> b!56617 (= e!37292 (and e!37291 mapRes!2819))))

(declare-fun condMapEmpty!2820 () Bool)

(declare-fun mapDefault!2820 () ValueCell!848)

(assert (=> b!56617 (= condMapEmpty!2820 (= (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2820)))))

(declare-fun b!56618 () Bool)

(assert (=> b!56618 (= e!37294 tp_is_empty!2383)))

(declare-fun b!56619 () Bool)

(declare-fun res!31818 () Bool)

(assert (=> b!56619 (=> (not res!31818) (not e!37296))))

(assert (=> b!56619 (= res!31818 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992)))))))))

(declare-fun b!56620 () Bool)

(declare-fun Unit!1479 () Unit!1476)

(assert (=> b!56620 (= e!37297 Unit!1479)))

(declare-fun lt!22293 () Unit!1476)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!22 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) (_ BitVec 32) Int) Unit!1476)

(assert (=> b!56620 (= lt!22293 (lemmaListMapContainsThenArrayContainsFrom!22 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56620 (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22298 () Unit!1476)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3675 (_ BitVec 32) (_ BitVec 32)) Unit!1476)

(assert (=> b!56620 (= lt!22298 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1418 0))(
  ( (Nil!1415) (Cons!1414 (h!1994 (_ BitVec 64)) (t!4720 List!1418)) )
))
(declare-fun arrayNoDuplicates!0 (array!3675 (_ BitVec 32) List!1418) Bool)

(assert (=> b!56620 (arrayNoDuplicates!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) from!355 Nil!1415)))

(declare-fun lt!22295 () Unit!1476)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3675 (_ BitVec 32) (_ BitVec 64) List!1418) Unit!1476)

(assert (=> b!56620 (= lt!22295 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (Cons!1414 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) Nil!1415)))))

(assert (=> b!56620 false))

(assert (=> b!56621 (= e!37299 (and tp!7900 tp_is_empty!2383 (array_inv!1083 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (array_inv!1084 (_values!1999 (v!2358 (underlying!219 thiss!992)))) e!37292))))

(declare-fun b!56622 () Bool)

(assert (=> b!56622 (= e!37291 tp_is_empty!2383)))

(declare-fun b!56623 () Bool)

(declare-fun res!31817 () Bool)

(assert (=> b!56623 (=> (not res!31817) (not e!37296))))

(declare-fun valid!259 (LongMapFixedSize!604) Bool)

(assert (=> b!56623 (= res!31817 (valid!259 newMap!16))))

(declare-fun b!56624 () Bool)

(assert (=> b!56624 (= e!37301 e!37300)))

(assert (= (and start!8388 res!31816) b!56619))

(assert (= (and b!56619 res!31818) b!56623))

(assert (= (and b!56623 res!31817) b!56612))

(assert (= (and b!56612 res!31815) b!56610))

(assert (= (and b!56610 res!31814) b!56609))

(assert (= (and b!56609 c!6939) b!56620))

(assert (= (and b!56609 (not c!6939)) b!56611))

(assert (= (and b!56609 res!31819) b!56607))

(assert (= (and b!56617 condMapEmpty!2820) mapIsEmpty!2819))

(assert (= (and b!56617 (not condMapEmpty!2820)) mapNonEmpty!2820))

(get-info :version)

(assert (= (and mapNonEmpty!2820 ((_ is ValueCellFull!848) mapValue!2820)) b!56614))

(assert (= (and b!56617 ((_ is ValueCellFull!848) mapDefault!2820)) b!56622))

(assert (= b!56621 b!56617))

(assert (= b!56616 b!56621))

(assert (= b!56624 b!56616))

(assert (= start!8388 b!56624))

(assert (= (and b!56613 condMapEmpty!2819) mapIsEmpty!2820))

(assert (= (and b!56613 (not condMapEmpty!2819)) mapNonEmpty!2819))

(assert (= (and mapNonEmpty!2819 ((_ is ValueCellFull!848) mapValue!2819)) b!56608))

(assert (= (and b!56613 ((_ is ValueCellFull!848) mapDefault!2819)) b!56618))

(assert (= b!56615 b!56613))

(assert (= start!8388 b!56615))

(declare-fun b_lambda!2477 () Bool)

(assert (=> (not b_lambda!2477) (not b!56609)))

(declare-fun t!4716 () Bool)

(declare-fun tb!1277 () Bool)

(assert (=> (and b!56621 (= (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))) t!4716) tb!1277))

(declare-fun result!2313 () Bool)

(assert (=> tb!1277 (= result!2313 tp_is_empty!2383)))

(assert (=> b!56609 t!4716))

(declare-fun b_and!3409 () Bool)

(assert (= b_and!3405 (and (=> t!4716 result!2313) b_and!3409)))

(declare-fun tb!1279 () Bool)

(declare-fun t!4718 () Bool)

(assert (=> (and b!56615 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))) t!4718) tb!1279))

(declare-fun result!2317 () Bool)

(assert (= result!2317 result!2313))

(assert (=> b!56609 t!4718))

(declare-fun b_and!3411 () Bool)

(assert (= b_and!3407 (and (=> t!4718 result!2317) b_and!3411)))

(declare-fun m!47581 () Bool)

(assert (=> b!56620 m!47581))

(declare-fun m!47583 () Bool)

(assert (=> b!56620 m!47583))

(declare-fun m!47585 () Bool)

(assert (=> b!56620 m!47585))

(declare-fun m!47587 () Bool)

(assert (=> b!56620 m!47587))

(assert (=> b!56620 m!47585))

(assert (=> b!56620 m!47585))

(declare-fun m!47589 () Bool)

(assert (=> b!56620 m!47589))

(assert (=> b!56620 m!47585))

(declare-fun m!47591 () Bool)

(assert (=> b!56620 m!47591))

(declare-fun m!47593 () Bool)

(assert (=> b!56609 m!47593))

(declare-fun m!47595 () Bool)

(assert (=> b!56609 m!47595))

(declare-fun m!47597 () Bool)

(assert (=> b!56609 m!47597))

(assert (=> b!56609 m!47585))

(assert (=> b!56609 m!47585))

(declare-fun m!47599 () Bool)

(assert (=> b!56609 m!47599))

(assert (=> b!56609 m!47595))

(assert (=> b!56609 m!47585))

(assert (=> b!56609 m!47597))

(declare-fun m!47601 () Bool)

(assert (=> b!56609 m!47601))

(assert (=> b!56609 m!47593))

(declare-fun m!47603 () Bool)

(assert (=> start!8388 m!47603))

(declare-fun m!47605 () Bool)

(assert (=> b!56615 m!47605))

(declare-fun m!47607 () Bool)

(assert (=> b!56615 m!47607))

(assert (=> b!56610 m!47585))

(declare-fun m!47609 () Bool)

(assert (=> b!56610 m!47609))

(declare-fun m!47611 () Bool)

(assert (=> b!56610 m!47611))

(declare-fun m!47613 () Bool)

(assert (=> mapNonEmpty!2819 m!47613))

(declare-fun m!47615 () Bool)

(assert (=> mapNonEmpty!2820 m!47615))

(declare-fun m!47617 () Bool)

(assert (=> b!56623 m!47617))

(declare-fun m!47619 () Bool)

(assert (=> b!56621 m!47619))

(declare-fun m!47621 () Bool)

(assert (=> b!56621 m!47621))

(declare-fun m!47623 () Bool)

(assert (=> b!56607 m!47623))

(check-sat b_and!3409 (not start!8388) (not b_next!1933) (not b!56610) (not b_lambda!2477) tp_is_empty!2383 (not mapNonEmpty!2820) (not b!56620) b_and!3411 (not b_next!1935) (not b!56623) (not b!56621) (not mapNonEmpty!2819) (not b!56607) (not b!56609) (not b!56615))
(check-sat b_and!3409 b_and!3411 (not b_next!1933) (not b_next!1935))
(get-model)

(declare-fun b_lambda!2483 () Bool)

(assert (= b_lambda!2477 (or (and b!56621 b_free!1933) (and b!56615 b_free!1935 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))))) b_lambda!2483)))

(check-sat b_and!3409 (not start!8388) (not b_next!1933) (not b!56610) tp_is_empty!2383 (not mapNonEmpty!2820) (not b!56620) b_and!3411 (not b!56623) (not b!56621) (not mapNonEmpty!2819) (not b!56607) (not b!56609) (not b!56615) (not b_next!1935) (not b_lambda!2483))
(check-sat b_and!3409 b_and!3411 (not b_next!1933) (not b_next!1935))
(get-model)

(declare-fun d!10479 () Bool)

(declare-fun e!37408 () Bool)

(assert (=> d!10479 e!37408))

(declare-fun res!31858 () Bool)

(assert (=> d!10479 (=> res!31858 e!37408)))

(declare-fun lt!22351 () Bool)

(assert (=> d!10479 (= res!31858 (not lt!22351))))

(declare-fun lt!22352 () Bool)

(assert (=> d!10479 (= lt!22351 lt!22352)))

(declare-fun lt!22350 () Unit!1476)

(declare-fun e!37407 () Unit!1476)

(assert (=> d!10479 (= lt!22350 e!37407)))

(declare-fun c!6948 () Bool)

(assert (=> d!10479 (= c!6948 lt!22352)))

(declare-fun containsKey!126 (List!1417 (_ BitVec 64)) Bool)

(assert (=> d!10479 (= lt!22352 (containsKey!126 (toList!684 lt!22296) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(assert (=> d!10479 (= (contains!673 lt!22296 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)) lt!22351)))

(declare-fun b!56745 () Bool)

(declare-fun lt!22349 () Unit!1476)

(assert (=> b!56745 (= e!37407 lt!22349)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!74 (List!1417 (_ BitVec 64)) Unit!1476)

(assert (=> b!56745 (= lt!22349 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!684 lt!22296) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-datatypes ((Option!129 0))(
  ( (Some!128 (v!2364 V!2825)) (None!127) )
))
(declare-fun isDefined!75 (Option!129) Bool)

(declare-fun getValueByKey!123 (List!1417 (_ BitVec 64)) Option!129)

(assert (=> b!56745 (isDefined!75 (getValueByKey!123 (toList!684 lt!22296) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun b!56746 () Bool)

(declare-fun Unit!1480 () Unit!1476)

(assert (=> b!56746 (= e!37407 Unit!1480)))

(declare-fun b!56747 () Bool)

(assert (=> b!56747 (= e!37408 (isDefined!75 (getValueByKey!123 (toList!684 lt!22296) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355))))))

(assert (= (and d!10479 c!6948) b!56745))

(assert (= (and d!10479 (not c!6948)) b!56746))

(assert (= (and d!10479 (not res!31858)) b!56747))

(assert (=> d!10479 m!47585))

(declare-fun m!47713 () Bool)

(assert (=> d!10479 m!47713))

(assert (=> b!56745 m!47585))

(declare-fun m!47715 () Bool)

(assert (=> b!56745 m!47715))

(assert (=> b!56745 m!47585))

(declare-fun m!47717 () Bool)

(assert (=> b!56745 m!47717))

(assert (=> b!56745 m!47717))

(declare-fun m!47719 () Bool)

(assert (=> b!56745 m!47719))

(assert (=> b!56747 m!47585))

(assert (=> b!56747 m!47717))

(assert (=> b!56747 m!47717))

(assert (=> b!56747 m!47719))

(assert (=> b!56609 d!10479))

(declare-fun b!56829 () Bool)

(declare-datatypes ((SeekEntryResult!219 0))(
  ( (MissingZero!219 (index!2998 (_ BitVec 32))) (Found!219 (index!2999 (_ BitVec 32))) (Intermediate!219 (undefined!1031 Bool) (index!3000 (_ BitVec 32)) (x!9811 (_ BitVec 32))) (Undefined!219) (MissingVacant!219 (index!3001 (_ BitVec 32))) )
))
(declare-fun lt!22428 () SeekEntryResult!219)

(declare-fun e!37460 () Bool)

(assert (=> b!56829 (= e!37460 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!2999 lt!22428)) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun bm!4002 () Bool)

(declare-fun call!4007 () Bool)

(assert (=> bm!4002 (= call!4007 (arrayContainsKey!0 (_keys!3636 newMap!16) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!56830 () Bool)

(declare-fun res!31890 () Bool)

(declare-fun e!37469 () Bool)

(assert (=> b!56830 (=> (not res!31890) (not e!37469))))

(declare-fun call!4010 () Bool)

(assert (=> b!56830 (= res!31890 call!4010)))

(declare-fun e!37453 () Bool)

(assert (=> b!56830 (= e!37453 e!37469)))

(declare-fun call!4016 () ListLongMap!1337)

(declare-fun lt!22418 () array!3677)

(declare-fun lt!22422 () (_ BitVec 32))

(declare-fun bm!4003 () Bool)

(declare-fun c!6987 () Bool)

(declare-fun c!6978 () Bool)

(declare-fun c!6976 () Bool)

(assert (=> bm!4003 (= call!4016 (getCurrentListMap!385 (_keys!3636 newMap!16) (ite (or c!6978 c!6987) (_values!1999 newMap!16) lt!22418) (mask!5887 newMap!16) (ite c!6978 (ite c!6976 (extraKeys!1907 newMap!16) lt!22422) (extraKeys!1907 newMap!16)) (zeroValue!1934 newMap!16) (ite c!6978 (ite c!6976 (minValue!1934 newMap!16) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1934 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun e!37462 () ListLongMap!1337)

(declare-fun b!56831 () Bool)

(declare-fun call!4005 () ListLongMap!1337)

(declare-fun call!4006 () ListLongMap!1337)

(assert (=> b!56831 (= e!37462 (ite c!6976 call!4005 call!4006))))

(declare-fun b!56832 () Bool)

(declare-fun e!37470 () Bool)

(declare-fun call!4027 () Bool)

(assert (=> b!56832 (= e!37470 (not call!4027))))

(declare-fun b!56833 () Bool)

(declare-fun res!31895 () Bool)

(assert (=> b!56833 (=> (not res!31895) (not e!37470))))

(declare-fun call!4011 () Bool)

(assert (=> b!56833 (= res!31895 call!4011)))

(declare-fun e!37451 () Bool)

(assert (=> b!56833 (= e!37451 e!37470)))

(declare-fun b!56834 () Bool)

(declare-fun lt!22416 () Unit!1476)

(declare-fun lt!22415 () Unit!1476)

(assert (=> b!56834 (= lt!22416 lt!22415)))

(declare-fun call!4028 () ListLongMap!1337)

(assert (=> b!56834 (= call!4028 call!4005)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 V!2825 Int) Unit!1476)

(assert (=> b!56834 (= lt!22415 (lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) lt!22422 (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56834 (= lt!22422 (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!37459 () tuple2!2004)

(assert (=> b!56834 (= e!37459 (tuple2!2005 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5887 newMap!16) (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000010) (zeroValue!1934 newMap!16) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!351 newMap!16) (_keys!3636 newMap!16) (_values!1999 newMap!16) (_vacant!351 newMap!16))))))

(declare-fun bm!4004 () Bool)

(declare-fun call!4020 () ListLongMap!1337)

(assert (=> bm!4004 (= call!4028 call!4020)))

(declare-fun b!56835 () Bool)

(declare-fun e!37464 () tuple2!2004)

(declare-fun e!37457 () tuple2!2004)

(assert (=> b!56835 (= e!37464 e!37457)))

(declare-fun c!6983 () Bool)

(declare-fun lt!22431 () SeekEntryResult!219)

(assert (=> b!56835 (= c!6983 ((_ is MissingZero!219) lt!22431))))

(declare-fun b!56836 () Bool)

(declare-fun e!37458 () Bool)

(assert (=> b!56836 (= e!37458 (not call!4027))))

(declare-fun b!56837 () Bool)

(declare-fun e!37454 () Bool)

(declare-fun e!37456 () Bool)

(assert (=> b!56837 (= e!37454 e!37456)))

(declare-fun c!6980 () Bool)

(declare-fun lt!22407 () tuple2!2004)

(assert (=> b!56837 (= c!6980 (_1!1013 lt!22407))))

(declare-fun b!56838 () Bool)

(assert (=> b!56838 (= e!37462 (getCurrentListMap!385 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun b!56839 () Bool)

(declare-fun call!4026 () Bool)

(assert (=> b!56839 (= e!37469 (not call!4026))))

(declare-fun bm!4005 () Bool)

(declare-fun call!4025 () Bool)

(assert (=> bm!4005 (= call!4011 call!4025)))

(declare-fun b!56840 () Bool)

(declare-fun e!37452 () Unit!1476)

(declare-fun lt!22419 () Unit!1476)

(assert (=> b!56840 (= e!37452 lt!22419)))

(declare-fun call!4024 () Unit!1476)

(assert (=> b!56840 (= lt!22419 call!4024)))

(declare-fun lt!22414 () SeekEntryResult!219)

(declare-fun call!4017 () SeekEntryResult!219)

(assert (=> b!56840 (= lt!22414 call!4017)))

(declare-fun c!6981 () Bool)

(assert (=> b!56840 (= c!6981 ((_ is MissingZero!219) lt!22414))))

(assert (=> b!56840 e!37451))

(declare-fun b!56841 () Bool)

(declare-fun res!31898 () Bool)

(assert (=> b!56841 (=> (not res!31898) (not e!37469))))

(declare-fun lt!22432 () SeekEntryResult!219)

(assert (=> b!56841 (= res!31898 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!2998 lt!22432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56842 () Bool)

(declare-fun e!37467 () Bool)

(assert (=> b!56842 (= e!37467 ((_ is Undefined!219) lt!22432))))

(declare-fun bm!4006 () Bool)

(declare-fun call!4019 () Bool)

(declare-fun call!4015 () ListLongMap!1337)

(assert (=> bm!4006 (= call!4019 (contains!673 call!4015 (ite c!6987 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (select (arr!1760 (_keys!3636 newMap!16)) (index!2999 lt!22431)))))))

(declare-fun call!4018 () ListLongMap!1337)

(declare-fun b!56843 () Bool)

(declare-fun e!37463 () Bool)

(declare-fun call!4022 () ListLongMap!1337)

(declare-fun +!78 (ListLongMap!1337 tuple2!2006) ListLongMap!1337)

(assert (=> b!56843 (= e!37463 (= call!4022 (+!78 call!4018 (tuple2!2007 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!56844 () Bool)

(declare-fun e!37455 () Unit!1476)

(declare-fun Unit!1481 () Unit!1476)

(assert (=> b!56844 (= e!37455 Unit!1481)))

(declare-fun lt!22417 () Unit!1476)

(assert (=> b!56844 (= lt!22417 call!4024)))

(declare-fun call!4021 () SeekEntryResult!219)

(assert (=> b!56844 (= lt!22432 call!4021)))

(declare-fun c!6977 () Bool)

(assert (=> b!56844 (= c!6977 ((_ is MissingZero!219) lt!22432))))

(assert (=> b!56844 e!37453))

(declare-fun lt!22427 () Unit!1476)

(assert (=> b!56844 (= lt!22427 lt!22417)))

(assert (=> b!56844 false))

(declare-fun bm!4007 () Bool)

(declare-fun call!4008 () Bool)

(assert (=> bm!4007 (= call!4010 call!4008)))

(declare-fun b!56845 () Bool)

(declare-fun lt!22433 () tuple2!2004)

(declare-fun call!4014 () tuple2!2004)

(assert (=> b!56845 (= lt!22433 call!4014)))

(assert (=> b!56845 (= e!37457 (tuple2!2005 (_1!1013 lt!22433) (_2!1013 lt!22433)))))

(declare-fun bm!4008 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) Int) Unit!1476)

(assert (=> bm!4008 (= call!4024 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (defaultEntry!2016 newMap!16)))))

(declare-fun bm!4009 () Bool)

(declare-fun call!4012 () Bool)

(assert (=> bm!4009 (= call!4025 call!4012)))

(declare-fun b!56846 () Bool)

(declare-fun e!37461 () Bool)

(assert (=> b!56846 (= e!37461 ((_ is Undefined!219) lt!22414))))

(declare-fun b!56847 () Bool)

(declare-fun res!31896 () Bool)

(assert (=> b!56847 (= res!31896 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!3001 lt!22432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37466 () Bool)

(assert (=> b!56847 (=> (not res!31896) (not e!37466))))

(declare-fun b!56848 () Bool)

(declare-fun e!37465 () tuple2!2004)

(declare-fun e!37468 () tuple2!2004)

(assert (=> b!56848 (= e!37465 e!37468)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3675 (_ BitVec 32)) SeekEntryResult!219)

(assert (=> b!56848 (= lt!22431 (seekEntryOrOpen!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (_keys!3636 newMap!16) (mask!5887 newMap!16)))))

(assert (=> b!56848 (= c!6987 ((_ is Undefined!219) lt!22431))))

(declare-fun b!56849 () Bool)

(declare-fun res!31900 () Bool)

(assert (=> b!56849 (= res!31900 call!4025)))

(assert (=> b!56849 (=> (not res!31900) (not e!37460))))

(declare-fun b!56850 () Bool)

(declare-fun lt!22409 () Unit!1476)

(declare-fun lt!22425 () Unit!1476)

(assert (=> b!56850 (= lt!22409 lt!22425)))

(assert (=> b!56850 call!4019))

(declare-fun lemmaValidKeyInArrayIsInListMap!73 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) Unit!1476)

(assert (=> b!56850 (= lt!22425 (lemmaValidKeyInArrayIsInListMap!73 (_keys!3636 newMap!16) lt!22418 (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (index!2999 lt!22431) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56850 (= lt!22418 (array!3678 (store (arr!1761 (_values!1999 newMap!16)) (index!2999 lt!22431) (ValueCellFull!848 (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1990 (_values!1999 newMap!16))))))

(declare-fun lt!22429 () Unit!1476)

(declare-fun lt!22423 () Unit!1476)

(assert (=> b!56850 (= lt!22429 lt!22423)))

(declare-fun call!4013 () ListLongMap!1337)

(assert (=> b!56850 (= call!4020 call!4013)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) (_ BitVec 64) V!2825 Int) Unit!1476)

(assert (=> b!56850 (= lt!22423 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (index!2999 lt!22431) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2016 newMap!16)))))

(declare-fun lt!22426 () Unit!1476)

(assert (=> b!56850 (= lt!22426 e!37455)))

(declare-fun c!6985 () Bool)

(assert (=> b!56850 (= c!6985 (contains!673 (getCurrentListMap!385 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(assert (=> b!56850 (= e!37457 (tuple2!2005 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (_size!351 newMap!16) (_keys!3636 newMap!16) (array!3678 (store (arr!1761 (_values!1999 newMap!16)) (index!2999 lt!22431) (ValueCellFull!848 (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1990 (_values!1999 newMap!16))) (_vacant!351 newMap!16))))))

(declare-fun bm!4010 () Bool)

(declare-fun call!4023 () Unit!1476)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) Int) Unit!1476)

(assert (=> bm!4010 (= call!4023 (lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (defaultEntry!2016 newMap!16)))))

(declare-fun b!56851 () Bool)

(assert (=> b!56851 (= e!37461 e!37458)))

(declare-fun res!31887 () Bool)

(assert (=> b!56851 (= res!31887 call!4011)))

(assert (=> b!56851 (=> (not res!31887) (not e!37458))))

(declare-fun b!56828 () Bool)

(assert (=> b!56828 (= e!37466 (not call!4026))))

(declare-fun d!10481 () Bool)

(assert (=> d!10481 e!37454))

(declare-fun res!31891 () Bool)

(assert (=> d!10481 (=> (not res!31891) (not e!37454))))

(assert (=> d!10481 (= res!31891 (valid!259 (_2!1013 lt!22407)))))

(assert (=> d!10481 (= lt!22407 e!37465)))

(assert (=> d!10481 (= c!6978 (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvneg (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355))))))

(assert (=> d!10481 (valid!259 newMap!16)))

(assert (=> d!10481 (= (update!84 newMap!16 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!22407)))

(declare-fun bm!4011 () Bool)

(assert (=> bm!4011 (= call!4020 (+!78 e!37462 (ite c!6978 (ite c!6976 (tuple2!2007 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2007 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2007 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!6984 () Bool)

(assert (=> bm!4011 (= c!6984 c!6978)))

(declare-fun b!56852 () Bool)

(declare-fun e!37471 () Bool)

(declare-fun lt!22411 () SeekEntryResult!219)

(assert (=> b!56852 (= e!37471 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!2999 lt!22411)) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun b!56853 () Bool)

(declare-fun lt!22430 () tuple2!2004)

(assert (=> b!56853 (= e!37464 (tuple2!2005 (_1!1013 lt!22430) (_2!1013 lt!22430)))))

(assert (=> b!56853 (= lt!22430 call!4014)))

(declare-fun b!56854 () Bool)

(assert (=> b!56854 (= e!37456 e!37463)))

(declare-fun res!31889 () Bool)

(assert (=> b!56854 (= res!31889 (contains!673 call!4022 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(assert (=> b!56854 (=> (not res!31889) (not e!37463))))

(declare-fun b!56855 () Bool)

(declare-fun res!31888 () Bool)

(assert (=> b!56855 (=> (not res!31888) (not e!37470))))

(assert (=> b!56855 (= res!31888 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!2998 lt!22414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!22410 () (_ BitVec 32))

(declare-fun bm!4012 () Bool)

(assert (=> bm!4012 (= call!4013 (getCurrentListMap!385 (_keys!3636 newMap!16) (ite c!6978 (_values!1999 newMap!16) (array!3678 (store (arr!1761 (_values!1999 newMap!16)) (index!2999 lt!22431) (ValueCellFull!848 (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1990 (_values!1999 newMap!16)))) (mask!5887 newMap!16) (ite (and c!6978 c!6976) lt!22410 (extraKeys!1907 newMap!16)) (ite (and c!6978 c!6976) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1934 newMap!16)) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun bm!4013 () Bool)

(assert (=> bm!4013 (= call!4022 (map!1101 (_2!1013 lt!22407)))))

(declare-fun bm!4014 () Bool)

(declare-fun call!4009 () SeekEntryResult!219)

(assert (=> bm!4014 (= call!4021 call!4009)))

(declare-fun bm!4015 () Bool)

(assert (=> bm!4015 (= call!4006 call!4013)))

(declare-fun bm!4016 () Bool)

(assert (=> bm!4016 (= call!4018 (map!1101 newMap!16))))

(declare-fun b!56856 () Bool)

(declare-fun c!6986 () Bool)

(assert (=> b!56856 (= c!6986 ((_ is MissingVacant!219) lt!22431))))

(assert (=> b!56856 (= e!37468 e!37464)))

(declare-fun b!56857 () Bool)

(assert (=> b!56857 (= e!37467 e!37466)))

(declare-fun res!31899 () Bool)

(assert (=> b!56857 (= res!31899 call!4010)))

(assert (=> b!56857 (=> (not res!31899) (not e!37466))))

(declare-fun bm!4017 () Bool)

(assert (=> bm!4017 (= call!4015 call!4016)))

(declare-fun bm!4018 () Bool)

(assert (=> bm!4018 (= call!4008 call!4012)))

(declare-fun b!56858 () Bool)

(declare-fun lt!22424 () Unit!1476)

(assert (=> b!56858 (= lt!22424 e!37452)))

(declare-fun c!6982 () Bool)

(assert (=> b!56858 (= c!6982 call!4019)))

(assert (=> b!56858 (= e!37468 (tuple2!2005 false newMap!16))))

(declare-fun b!56859 () Bool)

(declare-fun res!31892 () Bool)

(assert (=> b!56859 (= res!31892 call!4008)))

(assert (=> b!56859 (=> (not res!31892) (not e!37471))))

(declare-fun bm!4019 () Bool)

(assert (=> bm!4019 (= call!4027 call!4007)))

(declare-fun b!56860 () Bool)

(declare-fun c!6979 () Bool)

(assert (=> b!56860 (= c!6979 ((_ is MissingVacant!219) lt!22432))))

(assert (=> b!56860 (= e!37453 e!37467)))

(declare-fun b!56861 () Bool)

(declare-fun c!6975 () Bool)

(assert (=> b!56861 (= c!6975 ((_ is MissingVacant!219) lt!22414))))

(assert (=> b!56861 (= e!37451 e!37461)))

(declare-fun bm!4020 () Bool)

(declare-fun updateHelperNewKey!13 (LongMapFixedSize!604 (_ BitVec 64) V!2825 (_ BitVec 32)) tuple2!2004)

(assert (=> bm!4020 (= call!4014 (updateHelperNewKey!13 newMap!16 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!6986 (index!3001 lt!22431) (index!2998 lt!22431))))))

(declare-fun b!56862 () Bool)

(declare-fun res!31894 () Bool)

(assert (=> b!56862 (= res!31894 (= (select (arr!1760 (_keys!3636 newMap!16)) (index!3001 lt!22414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56862 (=> (not res!31894) (not e!37458))))

(declare-fun bm!4021 () Bool)

(assert (=> bm!4021 (= call!4017 call!4009)))

(declare-fun bm!4022 () Bool)

(assert (=> bm!4022 (= call!4005 call!4016)))

(declare-fun b!56863 () Bool)

(declare-fun lt!22408 () Unit!1476)

(declare-fun lt!22412 () Unit!1476)

(assert (=> b!56863 (= lt!22408 lt!22412)))

(assert (=> b!56863 (= call!4028 call!4006)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!13 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 V!2825 Int) Unit!1476)

(assert (=> b!56863 (= lt!22412 (lemmaChangeZeroKeyThenAddPairToListMap!13 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) lt!22410 (zeroValue!1934 newMap!16) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1934 newMap!16) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56863 (= lt!22410 (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!56863 (= e!37459 (tuple2!2005 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5887 newMap!16) (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000001) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1934 newMap!16) (_size!351 newMap!16) (_keys!3636 newMap!16) (_values!1999 newMap!16) (_vacant!351 newMap!16))))))

(declare-fun b!56864 () Bool)

(assert (=> b!56864 (= e!37465 e!37459)))

(assert (=> b!56864 (= c!6976 (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!4023 () Bool)

(assert (=> bm!4023 (= call!4009 (seekEntryOrOpen!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (_keys!3636 newMap!16) (mask!5887 newMap!16)))))

(declare-fun b!56865 () Bool)

(declare-fun Unit!1482 () Unit!1476)

(assert (=> b!56865 (= e!37452 Unit!1482)))

(declare-fun lt!22421 () Unit!1476)

(assert (=> b!56865 (= lt!22421 call!4023)))

(assert (=> b!56865 (= lt!22428 call!4017)))

(declare-fun res!31897 () Bool)

(assert (=> b!56865 (= res!31897 ((_ is Found!219) lt!22428))))

(assert (=> b!56865 (=> (not res!31897) (not e!37460))))

(assert (=> b!56865 e!37460))

(declare-fun lt!22420 () Unit!1476)

(assert (=> b!56865 (= lt!22420 lt!22421)))

(assert (=> b!56865 false))

(declare-fun bm!4024 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4024 (= call!4012 (inRange!0 (ite c!6987 (ite c!6982 (index!2999 lt!22428) (ite c!6981 (index!2998 lt!22414) (index!3001 lt!22414))) (ite c!6985 (index!2999 lt!22411) (ite c!6977 (index!2998 lt!22432) (index!3001 lt!22432)))) (mask!5887 newMap!16)))))

(declare-fun b!56866 () Bool)

(assert (=> b!56866 (= e!37456 (= call!4022 call!4018))))

(declare-fun bm!4025 () Bool)

(assert (=> bm!4025 (= call!4026 call!4007)))

(declare-fun b!56867 () Bool)

(declare-fun lt!22413 () Unit!1476)

(assert (=> b!56867 (= e!37455 lt!22413)))

(assert (=> b!56867 (= lt!22413 call!4023)))

(assert (=> b!56867 (= lt!22411 call!4021)))

(declare-fun res!31893 () Bool)

(assert (=> b!56867 (= res!31893 ((_ is Found!219) lt!22411))))

(assert (=> b!56867 (=> (not res!31893) (not e!37471))))

(assert (=> b!56867 e!37471))

(assert (= (and d!10481 c!6978) b!56864))

(assert (= (and d!10481 (not c!6978)) b!56848))

(assert (= (and b!56864 c!6976) b!56863))

(assert (= (and b!56864 (not c!6976)) b!56834))

(assert (= (or b!56863 b!56834) bm!4022))

(assert (= (or b!56863 b!56834) bm!4015))

(assert (= (or b!56863 b!56834) bm!4004))

(assert (= (and b!56848 c!6987) b!56858))

(assert (= (and b!56848 (not c!6987)) b!56856))

(assert (= (and b!56858 c!6982) b!56865))

(assert (= (and b!56858 (not c!6982)) b!56840))

(assert (= (and b!56865 res!31897) b!56849))

(assert (= (and b!56849 res!31900) b!56829))

(assert (= (and b!56840 c!6981) b!56833))

(assert (= (and b!56840 (not c!6981)) b!56861))

(assert (= (and b!56833 res!31895) b!56855))

(assert (= (and b!56855 res!31888) b!56832))

(assert (= (and b!56861 c!6975) b!56851))

(assert (= (and b!56861 (not c!6975)) b!56846))

(assert (= (and b!56851 res!31887) b!56862))

(assert (= (and b!56862 res!31894) b!56836))

(assert (= (or b!56833 b!56851) bm!4005))

(assert (= (or b!56832 b!56836) bm!4019))

(assert (= (or b!56849 bm!4005) bm!4009))

(assert (= (or b!56865 b!56840) bm!4021))

(assert (= (and b!56856 c!6986) b!56853))

(assert (= (and b!56856 (not c!6986)) b!56835))

(assert (= (and b!56835 c!6983) b!56845))

(assert (= (and b!56835 (not c!6983)) b!56850))

(assert (= (and b!56850 c!6985) b!56867))

(assert (= (and b!56850 (not c!6985)) b!56844))

(assert (= (and b!56867 res!31893) b!56859))

(assert (= (and b!56859 res!31892) b!56852))

(assert (= (and b!56844 c!6977) b!56830))

(assert (= (and b!56844 (not c!6977)) b!56860))

(assert (= (and b!56830 res!31890) b!56841))

(assert (= (and b!56841 res!31898) b!56839))

(assert (= (and b!56860 c!6979) b!56857))

(assert (= (and b!56860 (not c!6979)) b!56842))

(assert (= (and b!56857 res!31899) b!56847))

(assert (= (and b!56847 res!31896) b!56828))

(assert (= (or b!56830 b!56857) bm!4007))

(assert (= (or b!56839 b!56828) bm!4025))

(assert (= (or b!56859 bm!4007) bm!4018))

(assert (= (or b!56867 b!56844) bm!4014))

(assert (= (or b!56853 b!56845) bm!4020))

(assert (= (or bm!4021 bm!4014) bm!4023))

(assert (= (or b!56865 b!56867) bm!4010))

(assert (= (or b!56840 b!56844) bm!4008))

(assert (= (or bm!4009 bm!4018) bm!4024))

(assert (= (or bm!4019 bm!4025) bm!4002))

(assert (= (or b!56858 b!56850) bm!4017))

(assert (= (or b!56858 b!56850) bm!4006))

(assert (= (or bm!4015 b!56850) bm!4012))

(assert (= (or bm!4022 bm!4017) bm!4003))

(assert (= (or bm!4004 b!56850) bm!4011))

(assert (= (and bm!4011 c!6984) b!56831))

(assert (= (and bm!4011 (not c!6984)) b!56838))

(assert (= (and d!10481 res!31891) b!56837))

(assert (= (and b!56837 c!6980) b!56854))

(assert (= (and b!56837 (not c!6980)) b!56866))

(assert (= (and b!56854 res!31889) b!56843))

(assert (= (or b!56843 b!56866) bm!4016))

(assert (= (or b!56854 b!56843 b!56866) bm!4013))

(assert (=> b!56850 m!47585))

(assert (=> b!56850 m!47597))

(declare-fun m!47721 () Bool)

(assert (=> b!56850 m!47721))

(declare-fun m!47723 () Bool)

(assert (=> b!56850 m!47723))

(declare-fun m!47725 () Bool)

(assert (=> b!56850 m!47725))

(assert (=> b!56850 m!47585))

(declare-fun m!47727 () Bool)

(assert (=> b!56850 m!47727))

(declare-fun m!47729 () Bool)

(assert (=> b!56850 m!47729))

(assert (=> b!56850 m!47725))

(declare-fun m!47731 () Bool)

(assert (=> bm!4003 m!47731))

(declare-fun m!47733 () Bool)

(assert (=> b!56862 m!47733))

(declare-fun m!47735 () Bool)

(assert (=> b!56843 m!47735))

(declare-fun m!47737 () Bool)

(assert (=> bm!4013 m!47737))

(assert (=> bm!4002 m!47585))

(declare-fun m!47739 () Bool)

(assert (=> bm!4002 m!47739))

(declare-fun m!47741 () Bool)

(assert (=> b!56829 m!47741))

(assert (=> bm!4012 m!47729))

(declare-fun m!47743 () Bool)

(assert (=> bm!4012 m!47743))

(assert (=> b!56848 m!47585))

(declare-fun m!47745 () Bool)

(assert (=> b!56848 m!47745))

(assert (=> bm!4020 m!47585))

(assert (=> bm!4020 m!47597))

(declare-fun m!47747 () Bool)

(assert (=> bm!4020 m!47747))

(assert (=> b!56834 m!47597))

(declare-fun m!47749 () Bool)

(assert (=> b!56834 m!47749))

(declare-fun m!47751 () Bool)

(assert (=> b!56841 m!47751))

(declare-fun m!47753 () Bool)

(assert (=> b!56852 m!47753))

(assert (=> b!56854 m!47585))

(declare-fun m!47755 () Bool)

(assert (=> b!56854 m!47755))

(assert (=> b!56863 m!47597))

(declare-fun m!47757 () Bool)

(assert (=> b!56863 m!47757))

(assert (=> bm!4008 m!47585))

(declare-fun m!47759 () Bool)

(assert (=> bm!4008 m!47759))

(assert (=> bm!4016 m!47609))

(assert (=> bm!4023 m!47585))

(assert (=> bm!4023 m!47745))

(declare-fun m!47761 () Bool)

(assert (=> bm!4006 m!47761))

(declare-fun m!47763 () Bool)

(assert (=> bm!4006 m!47763))

(declare-fun m!47765 () Bool)

(assert (=> d!10481 m!47765))

(assert (=> d!10481 m!47617))

(assert (=> b!56838 m!47725))

(declare-fun m!47767 () Bool)

(assert (=> bm!4011 m!47767))

(declare-fun m!47769 () Bool)

(assert (=> b!56847 m!47769))

(declare-fun m!47771 () Bool)

(assert (=> bm!4024 m!47771))

(assert (=> bm!4010 m!47585))

(declare-fun m!47773 () Bool)

(assert (=> bm!4010 m!47773))

(declare-fun m!47775 () Bool)

(assert (=> b!56855 m!47775))

(assert (=> b!56609 d!10481))

(declare-fun d!10483 () Bool)

(declare-fun c!6990 () Bool)

(assert (=> d!10483 (= c!6990 ((_ is ValueCellFull!848) (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun e!37474 () V!2825)

(assert (=> d!10483 (= (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!37474)))

(declare-fun b!56872 () Bool)

(declare-fun get!1062 (ValueCell!848 V!2825) V!2825)

(assert (=> b!56872 (= e!37474 (get!1062 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!56873 () Bool)

(declare-fun get!1063 (ValueCell!848 V!2825) V!2825)

(assert (=> b!56873 (= e!37474 (get!1063 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) from!355) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10483 c!6990) b!56872))

(assert (= (and d!10483 (not c!6990)) b!56873))

(assert (=> b!56872 m!47593))

(assert (=> b!56872 m!47595))

(declare-fun m!47777 () Bool)

(assert (=> b!56872 m!47777))

(assert (=> b!56873 m!47593))

(assert (=> b!56873 m!47595))

(declare-fun m!47779 () Bool)

(assert (=> b!56873 m!47779))

(assert (=> b!56609 d!10483))

(declare-fun d!10485 () Bool)

(assert (=> d!10485 (= (array_inv!1083 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvsge (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56621 d!10485))

(declare-fun d!10487 () Bool)

(assert (=> d!10487 (= (array_inv!1084 (_values!1999 (v!2358 (underlying!219 thiss!992)))) (bvsge (size!1990 (_values!1999 (v!2358 (underlying!219 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56621 d!10487))

(declare-fun d!10489 () Bool)

(assert (=> d!10489 (= (valid!258 thiss!992) (valid!259 (v!2358 (underlying!219 thiss!992))))))

(declare-fun bs!2469 () Bool)

(assert (= bs!2469 d!10489))

(declare-fun m!47781 () Bool)

(assert (=> bs!2469 m!47781))

(assert (=> start!8388 d!10489))

(declare-fun d!10491 () Bool)

(assert (=> d!10491 (= (array_inv!1083 (_keys!3636 newMap!16)) (bvsge (size!1989 (_keys!3636 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56615 d!10491))

(declare-fun d!10493 () Bool)

(assert (=> d!10493 (= (array_inv!1084 (_values!1999 newMap!16)) (bvsge (size!1990 (_values!1999 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56615 d!10493))

(declare-fun d!10495 () Bool)

(assert (=> d!10495 (not (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22436 () Unit!1476)

(declare-fun choose!68 (array!3675 (_ BitVec 32) (_ BitVec 64) List!1418) Unit!1476)

(assert (=> d!10495 (= lt!22436 (choose!68 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (Cons!1414 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) Nil!1415)))))

(assert (=> d!10495 (bvslt (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10495 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (Cons!1414 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) Nil!1415)) lt!22436)))

(declare-fun bs!2470 () Bool)

(assert (= bs!2470 d!10495))

(assert (=> bs!2470 m!47585))

(assert (=> bs!2470 m!47589))

(assert (=> bs!2470 m!47585))

(declare-fun m!47783 () Bool)

(assert (=> bs!2470 m!47783))

(assert (=> b!56620 d!10495))

(declare-fun d!10497 () Bool)

(assert (=> d!10497 (arrayNoDuplicates!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) from!355 Nil!1415)))

(declare-fun lt!22439 () Unit!1476)

(declare-fun choose!39 (array!3675 (_ BitVec 32) (_ BitVec 32)) Unit!1476)

(assert (=> d!10497 (= lt!22439 (choose!39 (_keys!3636 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!10497 (bvslt (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10497 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000000 from!355) lt!22439)))

(declare-fun bs!2471 () Bool)

(assert (= bs!2471 d!10497))

(assert (=> bs!2471 m!47583))

(declare-fun m!47785 () Bool)

(assert (=> bs!2471 m!47785))

(assert (=> b!56620 d!10497))

(declare-fun d!10499 () Bool)

(declare-fun res!31905 () Bool)

(declare-fun e!37479 () Bool)

(assert (=> d!10499 (=> res!31905 e!37479)))

(assert (=> d!10499 (= res!31905 (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(assert (=> d!10499 (= (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!37479)))

(declare-fun b!56878 () Bool)

(declare-fun e!37480 () Bool)

(assert (=> b!56878 (= e!37479 e!37480)))

(declare-fun res!31906 () Bool)

(assert (=> b!56878 (=> (not res!31906) (not e!37480))))

(assert (=> b!56878 (= res!31906 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun b!56879 () Bool)

(assert (=> b!56879 (= e!37480 (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!10499 (not res!31905)) b!56878))

(assert (= (and b!56878 res!31906) b!56879))

(declare-fun m!47787 () Bool)

(assert (=> d!10499 m!47787))

(assert (=> b!56879 m!47585))

(declare-fun m!47789 () Bool)

(assert (=> b!56879 m!47789))

(assert (=> b!56620 d!10499))

(declare-fun d!10501 () Bool)

(declare-fun e!37483 () Bool)

(assert (=> d!10501 e!37483))

(declare-fun c!6993 () Bool)

(assert (=> d!10501 (= c!6993 (and (not (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!22442 () Unit!1476)

(declare-fun choose!293 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) (_ BitVec 32) Int) Unit!1476)

(assert (=> d!10501 (= lt!22442 (choose!293 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(assert (=> d!10501 (validMask!0 (mask!5887 (v!2358 (underlying!219 thiss!992))))))

(assert (=> d!10501 (= (lemmaListMapContainsThenArrayContainsFrom!22 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))) lt!22442)))

(declare-fun b!56884 () Bool)

(assert (=> b!56884 (= e!37483 (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!56885 () Bool)

(assert (=> b!56885 (= e!37483 (ite (= (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!10501 c!6993) b!56884))

(assert (= (and d!10501 (not c!6993)) b!56885))

(assert (=> d!10501 m!47585))

(declare-fun m!47791 () Bool)

(assert (=> d!10501 m!47791))

(assert (=> d!10501 m!47623))

(assert (=> b!56884 m!47585))

(assert (=> b!56884 m!47589))

(assert (=> b!56620 d!10501))

(declare-fun b!56896 () Bool)

(declare-fun e!37494 () Bool)

(declare-fun e!37495 () Bool)

(assert (=> b!56896 (= e!37494 e!37495)))

(declare-fun res!31914 () Bool)

(assert (=> b!56896 (=> (not res!31914) (not e!37495))))

(declare-fun e!37492 () Bool)

(assert (=> b!56896 (= res!31914 (not e!37492))))

(declare-fun res!31915 () Bool)

(assert (=> b!56896 (=> (not res!31915) (not e!37492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!56896 (= res!31915 (validKeyInArray!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun bm!4028 () Bool)

(declare-fun c!6996 () Bool)

(declare-fun call!4031 () Bool)

(assert (=> bm!4028 (= call!4031 (arrayNoDuplicates!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!6996 (Cons!1414 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355) Nil!1415) Nil!1415)))))

(declare-fun b!56897 () Bool)

(declare-fun e!37493 () Bool)

(assert (=> b!56897 (= e!37493 call!4031)))

(declare-fun b!56898 () Bool)

(assert (=> b!56898 (= e!37495 e!37493)))

(assert (=> b!56898 (= c!6996 (validKeyInArray!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun b!56899 () Bool)

(declare-fun contains!674 (List!1418 (_ BitVec 64)) Bool)

(assert (=> b!56899 (= e!37492 (contains!674 Nil!1415 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) from!355)))))

(declare-fun b!56900 () Bool)

(assert (=> b!56900 (= e!37493 call!4031)))

(declare-fun d!10503 () Bool)

(declare-fun res!31913 () Bool)

(assert (=> d!10503 (=> res!31913 e!37494)))

(assert (=> d!10503 (= res!31913 (bvsge from!355 (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(assert (=> d!10503 (= (arrayNoDuplicates!0 (_keys!3636 (v!2358 (underlying!219 thiss!992))) from!355 Nil!1415) e!37494)))

(assert (= (and d!10503 (not res!31913)) b!56896))

(assert (= (and b!56896 res!31915) b!56899))

(assert (= (and b!56896 res!31914) b!56898))

(assert (= (and b!56898 c!6996) b!56900))

(assert (= (and b!56898 (not c!6996)) b!56897))

(assert (= (or b!56900 b!56897) bm!4028))

(assert (=> b!56896 m!47585))

(assert (=> b!56896 m!47585))

(declare-fun m!47793 () Bool)

(assert (=> b!56896 m!47793))

(assert (=> bm!4028 m!47585))

(declare-fun m!47795 () Bool)

(assert (=> bm!4028 m!47795))

(assert (=> b!56898 m!47585))

(assert (=> b!56898 m!47585))

(assert (=> b!56898 m!47793))

(assert (=> b!56899 m!47585))

(assert (=> b!56899 m!47585))

(declare-fun m!47797 () Bool)

(assert (=> b!56899 m!47797))

(assert (=> b!56620 d!10503))

(declare-fun d!10505 () Bool)

(assert (=> d!10505 (= (validMask!0 (mask!5887 (v!2358 (underlying!219 thiss!992)))) (and (or (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000001111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000011111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000001111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000011111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000001111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000011111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000001111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000011111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000000111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000001111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000011111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000000111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000001111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000011111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000000111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000001111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000011111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000000111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000001111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000011111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00000111111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00001111111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00011111111111111111111111111111) (= (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5887 (v!2358 (underlying!219 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!56607 d!10505))

(declare-fun d!10507 () Bool)

(assert (=> d!10507 (= (map!1101 newMap!16) (getCurrentListMap!385 (_keys!3636 newMap!16) (_values!1999 newMap!16) (mask!5887 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun bs!2472 () Bool)

(assert (= bs!2472 d!10507))

(assert (=> bs!2472 m!47725))

(assert (=> b!56610 d!10507))

(declare-fun b!56943 () Bool)

(declare-fun res!31938 () Bool)

(declare-fun e!37522 () Bool)

(assert (=> b!56943 (=> (not res!31938) (not e!37522))))

(declare-fun e!37524 () Bool)

(assert (=> b!56943 (= res!31938 e!37524)))

(declare-fun res!31937 () Bool)

(assert (=> b!56943 (=> res!31937 e!37524)))

(declare-fun e!37530 () Bool)

(assert (=> b!56943 (= res!31937 (not e!37530))))

(declare-fun res!31935 () Bool)

(assert (=> b!56943 (=> (not res!31935) (not e!37530))))

(assert (=> b!56943 (= res!31935 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun bm!4043 () Bool)

(declare-fun call!4048 () Bool)

(declare-fun lt!22497 () ListLongMap!1337)

(assert (=> bm!4043 (= call!4048 (contains!673 lt!22497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56944 () Bool)

(declare-fun e!37531 () Bool)

(declare-fun apply!64 (ListLongMap!1337 (_ BitVec 64)) V!2825)

(assert (=> b!56944 (= e!37531 (= (apply!64 lt!22497 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1061 (select (arr!1761 (_values!1999 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!302 (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1990 (_values!1999 (v!2358 (underlying!219 thiss!992))))))))

(assert (=> b!56944 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun bm!4044 () Bool)

(declare-fun call!4046 () ListLongMap!1337)

(declare-fun call!4047 () ListLongMap!1337)

(assert (=> bm!4044 (= call!4046 call!4047)))

(declare-fun b!56945 () Bool)

(assert (=> b!56945 (= e!37524 e!37531)))

(declare-fun res!31936 () Bool)

(assert (=> b!56945 (=> (not res!31936) (not e!37531))))

(assert (=> b!56945 (= res!31936 (contains!673 lt!22497 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!56945 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun b!56946 () Bool)

(declare-fun e!37533 () Bool)

(declare-fun e!37529 () Bool)

(assert (=> b!56946 (= e!37533 e!37529)))

(declare-fun res!31939 () Bool)

(declare-fun call!4052 () Bool)

(assert (=> b!56946 (= res!31939 call!4052)))

(assert (=> b!56946 (=> (not res!31939) (not e!37529))))

(declare-fun b!56947 () Bool)

(declare-fun e!37523 () ListLongMap!1337)

(declare-fun call!4051 () ListLongMap!1337)

(assert (=> b!56947 (= e!37523 call!4051)))

(declare-fun bm!4045 () Bool)

(declare-fun call!4050 () ListLongMap!1337)

(assert (=> bm!4045 (= call!4051 call!4050)))

(declare-fun b!56948 () Bool)

(declare-fun c!7012 () Bool)

(assert (=> b!56948 (= c!7012 (and (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!37526 () ListLongMap!1337)

(assert (=> b!56948 (= e!37526 e!37523)))

(declare-fun b!56949 () Bool)

(declare-fun e!37527 () Unit!1476)

(declare-fun lt!22505 () Unit!1476)

(assert (=> b!56949 (= e!37527 lt!22505)))

(declare-fun lt!22489 () ListLongMap!1337)

(declare-fun getCurrentListMapNoExtraKeys!42 (array!3675 array!3677 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) ListLongMap!1337)

(assert (=> b!56949 (= lt!22489 (getCurrentListMapNoExtraKeys!42 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun lt!22487 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22498 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22498 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22492 () Unit!1476)

(declare-fun addStillContains!40 (ListLongMap!1337 (_ BitVec 64) V!2825 (_ BitVec 64)) Unit!1476)

(assert (=> b!56949 (= lt!22492 (addStillContains!40 lt!22489 lt!22487 (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) lt!22498))))

(assert (=> b!56949 (contains!673 (+!78 lt!22489 (tuple2!2007 lt!22487 (zeroValue!1934 (v!2358 (underlying!219 thiss!992))))) lt!22498)))

(declare-fun lt!22495 () Unit!1476)

(assert (=> b!56949 (= lt!22495 lt!22492)))

(declare-fun lt!22491 () ListLongMap!1337)

(assert (=> b!56949 (= lt!22491 (getCurrentListMapNoExtraKeys!42 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun lt!22499 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22494 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22494 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22508 () Unit!1476)

(declare-fun addApplyDifferent!40 (ListLongMap!1337 (_ BitVec 64) V!2825 (_ BitVec 64)) Unit!1476)

(assert (=> b!56949 (= lt!22508 (addApplyDifferent!40 lt!22491 lt!22499 (minValue!1934 (v!2358 (underlying!219 thiss!992))) lt!22494))))

(assert (=> b!56949 (= (apply!64 (+!78 lt!22491 (tuple2!2007 lt!22499 (minValue!1934 (v!2358 (underlying!219 thiss!992))))) lt!22494) (apply!64 lt!22491 lt!22494))))

(declare-fun lt!22490 () Unit!1476)

(assert (=> b!56949 (= lt!22490 lt!22508)))

(declare-fun lt!22493 () ListLongMap!1337)

(assert (=> b!56949 (= lt!22493 (getCurrentListMapNoExtraKeys!42 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun lt!22506 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22500 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22500 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22507 () Unit!1476)

(assert (=> b!56949 (= lt!22507 (addApplyDifferent!40 lt!22493 lt!22506 (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) lt!22500))))

(assert (=> b!56949 (= (apply!64 (+!78 lt!22493 (tuple2!2007 lt!22506 (zeroValue!1934 (v!2358 (underlying!219 thiss!992))))) lt!22500) (apply!64 lt!22493 lt!22500))))

(declare-fun lt!22496 () Unit!1476)

(assert (=> b!56949 (= lt!22496 lt!22507)))

(declare-fun lt!22504 () ListLongMap!1337)

(assert (=> b!56949 (= lt!22504 (getCurrentListMapNoExtraKeys!42 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun lt!22502 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22501 () (_ BitVec 64))

(assert (=> b!56949 (= lt!22501 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!56949 (= lt!22505 (addApplyDifferent!40 lt!22504 lt!22502 (minValue!1934 (v!2358 (underlying!219 thiss!992))) lt!22501))))

(assert (=> b!56949 (= (apply!64 (+!78 lt!22504 (tuple2!2007 lt!22502 (minValue!1934 (v!2358 (underlying!219 thiss!992))))) lt!22501) (apply!64 lt!22504 lt!22501))))

(declare-fun b!56950 () Bool)

(assert (=> b!56950 (= e!37523 call!4046)))

(declare-fun b!56951 () Bool)

(assert (=> b!56951 (= e!37533 (not call!4052))))

(declare-fun b!56952 () Bool)

(assert (=> b!56952 (= e!37530 (validKeyInArray!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!56953 () Bool)

(assert (=> b!56953 (= e!37526 call!4046)))

(declare-fun b!56954 () Bool)

(assert (=> b!56954 (= e!37522 e!37533)))

(declare-fun c!7011 () Bool)

(assert (=> b!56954 (= c!7011 (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!4046 () Bool)

(declare-fun call!4049 () ListLongMap!1337)

(assert (=> bm!4046 (= call!4050 call!4049)))

(declare-fun b!56955 () Bool)

(declare-fun e!37532 () ListLongMap!1337)

(assert (=> b!56955 (= e!37532 (+!78 call!4047 (tuple2!2007 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1934 (v!2358 (underlying!219 thiss!992))))))))

(declare-fun b!56956 () Bool)

(declare-fun Unit!1483 () Unit!1476)

(assert (=> b!56956 (= e!37527 Unit!1483)))

(declare-fun b!56957 () Bool)

(declare-fun e!37534 () Bool)

(declare-fun e!37528 () Bool)

(assert (=> b!56957 (= e!37534 e!37528)))

(declare-fun res!31934 () Bool)

(assert (=> b!56957 (= res!31934 call!4048)))

(assert (=> b!56957 (=> (not res!31934) (not e!37528))))

(declare-fun b!56958 () Bool)

(declare-fun e!37525 () Bool)

(assert (=> b!56958 (= e!37525 (validKeyInArray!0 (select (arr!1760 (_keys!3636 (v!2358 (underlying!219 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!56959 () Bool)

(assert (=> b!56959 (= e!37529 (= (apply!64 lt!22497 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1934 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun b!56960 () Bool)

(assert (=> b!56960 (= e!37532 e!37526)))

(declare-fun c!7010 () Bool)

(assert (=> b!56960 (= c!7010 (and (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!7013 () Bool)

(declare-fun bm!4047 () Bool)

(assert (=> bm!4047 (= call!4047 (+!78 (ite c!7013 call!4049 (ite c!7010 call!4050 call!4051)) (ite (or c!7013 c!7010) (tuple2!2007 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1934 (v!2358 (underlying!219 thiss!992)))) (tuple2!2007 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1934 (v!2358 (underlying!219 thiss!992)))))))))

(declare-fun bm!4048 () Bool)

(assert (=> bm!4048 (= call!4049 (getCurrentListMapNoExtraKeys!42 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun b!56961 () Bool)

(assert (=> b!56961 (= e!37534 (not call!4048))))

(declare-fun b!56962 () Bool)

(assert (=> b!56962 (= e!37528 (= (apply!64 lt!22497 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1934 (v!2358 (underlying!219 thiss!992)))))))

(declare-fun b!56963 () Bool)

(declare-fun res!31942 () Bool)

(assert (=> b!56963 (=> (not res!31942) (not e!37522))))

(assert (=> b!56963 (= res!31942 e!37534)))

(declare-fun c!7009 () Bool)

(assert (=> b!56963 (= c!7009 (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!4049 () Bool)

(assert (=> bm!4049 (= call!4052 (contains!673 lt!22497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!10509 () Bool)

(assert (=> d!10509 e!37522))

(declare-fun res!31941 () Bool)

(assert (=> d!10509 (=> (not res!31941) (not e!37522))))

(assert (=> d!10509 (= res!31941 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))))

(declare-fun lt!22488 () ListLongMap!1337)

(assert (=> d!10509 (= lt!22497 lt!22488)))

(declare-fun lt!22503 () Unit!1476)

(assert (=> d!10509 (= lt!22503 e!37527)))

(declare-fun c!7014 () Bool)

(assert (=> d!10509 (= c!7014 e!37525)))

(declare-fun res!31940 () Bool)

(assert (=> d!10509 (=> (not res!31940) (not e!37525))))

(assert (=> d!10509 (= res!31940 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1989 (_keys!3636 (v!2358 (underlying!219 thiss!992))))))))

(assert (=> d!10509 (= lt!22488 e!37532)))

(assert (=> d!10509 (= c!7013 (and (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10509 (validMask!0 (mask!5887 (v!2358 (underlying!219 thiss!992))))))

(assert (=> d!10509 (= (getCurrentListMap!385 (_keys!3636 (v!2358 (underlying!219 thiss!992))) (_values!1999 (v!2358 (underlying!219 thiss!992))) (mask!5887 (v!2358 (underlying!219 thiss!992))) (extraKeys!1907 (v!2358 (underlying!219 thiss!992))) (zeroValue!1934 (v!2358 (underlying!219 thiss!992))) (minValue!1934 (v!2358 (underlying!219 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992)))) lt!22497)))

(assert (= (and d!10509 c!7013) b!56955))

(assert (= (and d!10509 (not c!7013)) b!56960))

(assert (= (and b!56960 c!7010) b!56953))

(assert (= (and b!56960 (not c!7010)) b!56948))

(assert (= (and b!56948 c!7012) b!56950))

(assert (= (and b!56948 (not c!7012)) b!56947))

(assert (= (or b!56950 b!56947) bm!4045))

(assert (= (or b!56953 bm!4045) bm!4046))

(assert (= (or b!56953 b!56950) bm!4044))

(assert (= (or b!56955 bm!4046) bm!4048))

(assert (= (or b!56955 bm!4044) bm!4047))

(assert (= (and d!10509 res!31940) b!56958))

(assert (= (and d!10509 c!7014) b!56949))

(assert (= (and d!10509 (not c!7014)) b!56956))

(assert (= (and d!10509 res!31941) b!56943))

(assert (= (and b!56943 res!31935) b!56952))

(assert (= (and b!56943 (not res!31937)) b!56945))

(assert (= (and b!56945 res!31936) b!56944))

(assert (= (and b!56943 res!31938) b!56963))

(assert (= (and b!56963 c!7009) b!56957))

(assert (= (and b!56963 (not c!7009)) b!56961))

(assert (= (and b!56957 res!31934) b!56962))

(assert (= (or b!56957 b!56961) bm!4043))

(assert (= (and b!56963 res!31942) b!56954))

(assert (= (and b!56954 c!7011) b!56946))

(assert (= (and b!56954 (not c!7011)) b!56951))

(assert (= (and b!56946 res!31939) b!56959))

(assert (= (or b!56946 b!56951) bm!4049))

(declare-fun b_lambda!2485 () Bool)

(assert (=> (not b_lambda!2485) (not b!56944)))

(assert (=> b!56944 t!4716))

(declare-fun b_and!3429 () Bool)

(assert (= b_and!3409 (and (=> t!4716 result!2313) b_and!3429)))

(assert (=> b!56944 t!4718))

(declare-fun b_and!3431 () Bool)

(assert (= b_and!3411 (and (=> t!4718 result!2317) b_and!3431)))

(assert (=> b!56952 m!47787))

(assert (=> b!56952 m!47787))

(declare-fun m!47799 () Bool)

(assert (=> b!56952 m!47799))

(declare-fun m!47801 () Bool)

(assert (=> bm!4043 m!47801))

(declare-fun m!47803 () Bool)

(assert (=> bm!4047 m!47803))

(assert (=> d!10509 m!47623))

(declare-fun m!47805 () Bool)

(assert (=> b!56959 m!47805))

(assert (=> b!56944 m!47787))

(assert (=> b!56944 m!47787))

(declare-fun m!47807 () Bool)

(assert (=> b!56944 m!47807))

(declare-fun m!47809 () Bool)

(assert (=> b!56944 m!47809))

(assert (=> b!56944 m!47595))

(assert (=> b!56944 m!47809))

(assert (=> b!56944 m!47595))

(declare-fun m!47811 () Bool)

(assert (=> b!56944 m!47811))

(declare-fun m!47813 () Bool)

(assert (=> b!56962 m!47813))

(declare-fun m!47815 () Bool)

(assert (=> b!56949 m!47815))

(declare-fun m!47817 () Bool)

(assert (=> b!56949 m!47817))

(declare-fun m!47819 () Bool)

(assert (=> b!56949 m!47819))

(declare-fun m!47821 () Bool)

(assert (=> b!56949 m!47821))

(declare-fun m!47823 () Bool)

(assert (=> b!56949 m!47823))

(assert (=> b!56949 m!47787))

(declare-fun m!47825 () Bool)

(assert (=> b!56949 m!47825))

(declare-fun m!47827 () Bool)

(assert (=> b!56949 m!47827))

(declare-fun m!47829 () Bool)

(assert (=> b!56949 m!47829))

(declare-fun m!47831 () Bool)

(assert (=> b!56949 m!47831))

(assert (=> b!56949 m!47829))

(declare-fun m!47833 () Bool)

(assert (=> b!56949 m!47833))

(declare-fun m!47835 () Bool)

(assert (=> b!56949 m!47835))

(declare-fun m!47837 () Bool)

(assert (=> b!56949 m!47837))

(declare-fun m!47839 () Bool)

(assert (=> b!56949 m!47839))

(declare-fun m!47841 () Bool)

(assert (=> b!56949 m!47841))

(assert (=> b!56949 m!47823))

(declare-fun m!47843 () Bool)

(assert (=> b!56949 m!47843))

(assert (=> b!56949 m!47837))

(assert (=> b!56949 m!47815))

(declare-fun m!47845 () Bool)

(assert (=> b!56949 m!47845))

(declare-fun m!47847 () Bool)

(assert (=> b!56955 m!47847))

(assert (=> b!56958 m!47787))

(assert (=> b!56958 m!47787))

(assert (=> b!56958 m!47799))

(assert (=> b!56945 m!47787))

(assert (=> b!56945 m!47787))

(declare-fun m!47849 () Bool)

(assert (=> b!56945 m!47849))

(declare-fun m!47851 () Bool)

(assert (=> bm!4049 m!47851))

(assert (=> bm!4048 m!47819))

(assert (=> b!56610 d!10509))

(declare-fun d!10511 () Bool)

(declare-fun res!31949 () Bool)

(declare-fun e!37537 () Bool)

(assert (=> d!10511 (=> (not res!31949) (not e!37537))))

(declare-fun simpleValid!40 (LongMapFixedSize!604) Bool)

(assert (=> d!10511 (= res!31949 (simpleValid!40 newMap!16))))

(assert (=> d!10511 (= (valid!259 newMap!16) e!37537)))

(declare-fun b!56970 () Bool)

(declare-fun res!31950 () Bool)

(assert (=> b!56970 (=> (not res!31950) (not e!37537))))

(declare-fun arrayCountValidKeys!0 (array!3675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!56970 (= res!31950 (= (arrayCountValidKeys!0 (_keys!3636 newMap!16) #b00000000000000000000000000000000 (size!1989 (_keys!3636 newMap!16))) (_size!351 newMap!16)))))

(declare-fun b!56971 () Bool)

(declare-fun res!31951 () Bool)

(assert (=> b!56971 (=> (not res!31951) (not e!37537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3675 (_ BitVec 32)) Bool)

(assert (=> b!56971 (= res!31951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3636 newMap!16) (mask!5887 newMap!16)))))

(declare-fun b!56972 () Bool)

(assert (=> b!56972 (= e!37537 (arrayNoDuplicates!0 (_keys!3636 newMap!16) #b00000000000000000000000000000000 Nil!1415))))

(assert (= (and d!10511 res!31949) b!56970))

(assert (= (and b!56970 res!31950) b!56971))

(assert (= (and b!56971 res!31951) b!56972))

(declare-fun m!47853 () Bool)

(assert (=> d!10511 m!47853))

(declare-fun m!47855 () Bool)

(assert (=> b!56970 m!47855))

(declare-fun m!47857 () Bool)

(assert (=> b!56971 m!47857))

(declare-fun m!47859 () Bool)

(assert (=> b!56972 m!47859))

(assert (=> b!56623 d!10511))

(declare-fun b!56979 () Bool)

(declare-fun e!37543 () Bool)

(assert (=> b!56979 (= e!37543 tp_is_empty!2383)))

(declare-fun b!56980 () Bool)

(declare-fun e!37542 () Bool)

(assert (=> b!56980 (= e!37542 tp_is_empty!2383)))

(declare-fun mapNonEmpty!2835 () Bool)

(declare-fun mapRes!2835 () Bool)

(declare-fun tp!7929 () Bool)

(assert (=> mapNonEmpty!2835 (= mapRes!2835 (and tp!7929 e!37543))))

(declare-fun mapValue!2835 () ValueCell!848)

(declare-fun mapRest!2835 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapKey!2835 () (_ BitVec 32))

(assert (=> mapNonEmpty!2835 (= mapRest!2819 (store mapRest!2835 mapKey!2835 mapValue!2835))))

(declare-fun mapIsEmpty!2835 () Bool)

(assert (=> mapIsEmpty!2835 mapRes!2835))

(declare-fun condMapEmpty!2835 () Bool)

(declare-fun mapDefault!2835 () ValueCell!848)

(assert (=> mapNonEmpty!2819 (= condMapEmpty!2835 (= mapRest!2819 ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2835)))))

(assert (=> mapNonEmpty!2819 (= tp!7901 (and e!37542 mapRes!2835))))

(assert (= (and mapNonEmpty!2819 condMapEmpty!2835) mapIsEmpty!2835))

(assert (= (and mapNonEmpty!2819 (not condMapEmpty!2835)) mapNonEmpty!2835))

(assert (= (and mapNonEmpty!2835 ((_ is ValueCellFull!848) mapValue!2835)) b!56979))

(assert (= (and mapNonEmpty!2819 ((_ is ValueCellFull!848) mapDefault!2835)) b!56980))

(declare-fun m!47861 () Bool)

(assert (=> mapNonEmpty!2835 m!47861))

(declare-fun b!56981 () Bool)

(declare-fun e!37545 () Bool)

(assert (=> b!56981 (= e!37545 tp_is_empty!2383)))

(declare-fun b!56982 () Bool)

(declare-fun e!37544 () Bool)

(assert (=> b!56982 (= e!37544 tp_is_empty!2383)))

(declare-fun mapNonEmpty!2836 () Bool)

(declare-fun mapRes!2836 () Bool)

(declare-fun tp!7930 () Bool)

(assert (=> mapNonEmpty!2836 (= mapRes!2836 (and tp!7930 e!37545))))

(declare-fun mapValue!2836 () ValueCell!848)

(declare-fun mapRest!2836 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapKey!2836 () (_ BitVec 32))

(assert (=> mapNonEmpty!2836 (= mapRest!2820 (store mapRest!2836 mapKey!2836 mapValue!2836))))

(declare-fun mapIsEmpty!2836 () Bool)

(assert (=> mapIsEmpty!2836 mapRes!2836))

(declare-fun condMapEmpty!2836 () Bool)

(declare-fun mapDefault!2836 () ValueCell!848)

(assert (=> mapNonEmpty!2820 (= condMapEmpty!2836 (= mapRest!2820 ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2836)))))

(assert (=> mapNonEmpty!2820 (= tp!7899 (and e!37544 mapRes!2836))))

(assert (= (and mapNonEmpty!2820 condMapEmpty!2836) mapIsEmpty!2836))

(assert (= (and mapNonEmpty!2820 (not condMapEmpty!2836)) mapNonEmpty!2836))

(assert (= (and mapNonEmpty!2836 ((_ is ValueCellFull!848) mapValue!2836)) b!56981))

(assert (= (and mapNonEmpty!2820 ((_ is ValueCellFull!848) mapDefault!2836)) b!56982))

(declare-fun m!47863 () Bool)

(assert (=> mapNonEmpty!2836 m!47863))

(declare-fun b_lambda!2487 () Bool)

(assert (= b_lambda!2485 (or (and b!56621 b_free!1933) (and b!56615 b_free!1935 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2358 (underlying!219 thiss!992))))) b_lambda!2487)))

(check-sat (not mapNonEmpty!2835) (not b!56899) (not bm!4012) (not b!56848) (not b!56959) (not d!10507) (not b!56952) (not b!56745) (not bm!4043) (not b!56863) (not bm!4003) (not b_next!1933) (not d!10509) (not b!56958) (not bm!4028) (not bm!4048) (not b!56850) (not d!10497) (not bm!4047) (not b!56962) (not b!56944) (not bm!4049) (not b!56873) tp_is_empty!2383 (not b!56854) (not d!10511) (not b!56843) (not b!56945) (not d!10489) (not b!56879) b_and!3429 (not b!56971) (not bm!4006) (not b!56884) (not b!56898) (not b!56970) (not bm!4023) (not b!56747) (not b!56949) (not b!56896) (not bm!4002) b_and!3431 (not bm!4016) (not b_next!1935) (not b_lambda!2483) (not b!56955) (not b!56838) (not d!10481) (not b!56972) (not bm!4013) (not d!10495) (not b!56834) (not d!10501) (not b!56872) (not d!10479) (not bm!4024) (not mapNonEmpty!2836) (not bm!4010) (not bm!4020) (not bm!4011) (not bm!4008) (not b_lambda!2487))
(check-sat b_and!3429 b_and!3431 (not b_next!1933) (not b_next!1935))
