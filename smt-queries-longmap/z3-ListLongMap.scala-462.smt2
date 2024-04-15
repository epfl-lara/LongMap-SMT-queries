; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8388 () Bool)

(assert start!8388)

(declare-fun b!56603 () Bool)

(declare-fun b_free!1933 () Bool)

(declare-fun b_next!1933 () Bool)

(assert (=> b!56603 (= b_free!1933 (not b_next!1933))))

(declare-fun tp!7902 () Bool)

(declare-fun b_and!3409 () Bool)

(assert (=> b!56603 (= tp!7902 b_and!3409)))

(declare-fun b!56605 () Bool)

(declare-fun b_free!1935 () Bool)

(declare-fun b_next!1935 () Bool)

(assert (=> b!56605 (= b_free!1935 (not b_next!1935))))

(declare-fun tp!7899 () Bool)

(declare-fun b_and!3411 () Bool)

(assert (=> b!56605 (= tp!7899 b_and!3411)))

(declare-fun b!56598 () Bool)

(declare-fun res!31819 () Bool)

(declare-fun e!37298 () Bool)

(assert (=> b!56598 (=> (not res!31819) (not e!37298))))

(declare-datatypes ((V!2825 0))(
  ( (V!2826 (val!1236 Int)) )
))
(declare-datatypes ((array!3669 0))(
  ( (array!3670 (arr!1756 (Array (_ BitVec 32) (_ BitVec 64))) (size!1986 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!848 0))(
  ( (ValueCellFull!848 (v!2352 V!2825)) (EmptyCell!848) )
))
(declare-datatypes ((array!3671 0))(
  ( (array!3672 (arr!1757 (Array (_ BitVec 32) ValueCell!848)) (size!1987 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!604 0))(
  ( (LongMapFixedSize!605 (defaultEntry!2016 Int) (mask!5886 (_ BitVec 32)) (extraKeys!1907 (_ BitVec 32)) (zeroValue!1934 V!2825) (minValue!1934 V!2825) (_size!351 (_ BitVec 32)) (_keys!3635 array!3669) (_values!1999 array!3671) (_vacant!351 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!604)

(declare-fun valid!247 (LongMapFixedSize!604) Bool)

(assert (=> b!56598 (= res!31819 (valid!247 newMap!16))))

(declare-fun mapIsEmpty!2819 () Bool)

(declare-fun mapRes!2819 () Bool)

(assert (=> mapIsEmpty!2819 mapRes!2819))

(declare-fun b!56599 () Bool)

(declare-fun e!37285 () Bool)

(declare-fun tp_is_empty!2383 () Bool)

(assert (=> b!56599 (= e!37285 tp_is_empty!2383)))

(declare-fun b!56600 () Bool)

(declare-fun e!37293 () Bool)

(assert (=> b!56600 (= e!37293 tp_is_empty!2383)))

(declare-fun b!56601 () Bool)

(declare-fun e!37286 () Bool)

(declare-datatypes ((Cell!412 0))(
  ( (Cell!413 (v!2353 LongMapFixedSize!604)) )
))
(declare-datatypes ((LongMap!412 0))(
  ( (LongMap!413 (underlying!217 Cell!412)) )
))
(declare-fun thiss!992 () LongMap!412)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!56601 (= e!37286 (not (validMask!0 (mask!5886 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun b!56602 () Bool)

(declare-datatypes ((Unit!1472 0))(
  ( (Unit!1473) )
))
(declare-fun e!37289 () Unit!1472)

(declare-fun Unit!1474 () Unit!1472)

(assert (=> b!56602 (= e!37289 Unit!1474)))

(declare-fun e!37296 () Bool)

(declare-fun e!37300 () Bool)

(declare-fun array_inv!1089 (array!3669) Bool)

(declare-fun array_inv!1090 (array!3671) Bool)

(assert (=> b!56603 (= e!37296 (and tp!7902 tp_is_empty!2383 (array_inv!1089 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (array_inv!1090 (_values!1999 (v!2353 (underlying!217 thiss!992)))) e!37300))))

(declare-fun mapIsEmpty!2820 () Bool)

(declare-fun mapRes!2820 () Bool)

(assert (=> mapIsEmpty!2820 mapRes!2820))

(declare-fun b!56604 () Bool)

(declare-fun e!37299 () Bool)

(assert (=> b!56604 (= e!37298 e!37299)))

(declare-fun res!31821 () Bool)

(assert (=> b!56604 (=> (not res!31821) (not e!37299))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2016 0))(
  ( (tuple2!2017 (_1!1019 (_ BitVec 64)) (_2!1019 V!2825)) )
))
(declare-datatypes ((List!1426 0))(
  ( (Nil!1423) (Cons!1422 (h!2002 tuple2!2016) (t!4727 List!1426)) )
))
(declare-datatypes ((ListLongMap!1345 0))(
  ( (ListLongMap!1346 (toList!688 List!1426)) )
))
(declare-fun lt!22321 () ListLongMap!1345)

(declare-fun lt!22323 () ListLongMap!1345)

(assert (=> b!56604 (= res!31821 (and (= lt!22323 lt!22321) (not (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1095 (LongMapFixedSize!604) ListLongMap!1345)

(assert (=> b!56604 (= lt!22321 (map!1095 newMap!16))))

(declare-fun getCurrentListMap!385 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) ListLongMap!1345)

(assert (=> b!56604 (= lt!22323 (getCurrentListMap!385 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun e!37297 () Bool)

(declare-fun e!37288 () Bool)

(assert (=> b!56605 (= e!37297 (and tp!7899 tp_is_empty!2383 (array_inv!1089 (_keys!3635 newMap!16)) (array_inv!1090 (_values!1999 newMap!16)) e!37288))))

(declare-fun res!31822 () Bool)

(assert (=> start!8388 (=> (not res!31822) (not e!37298))))

(declare-fun valid!248 (LongMap!412) Bool)

(assert (=> start!8388 (= res!31822 (valid!248 thiss!992))))

(assert (=> start!8388 e!37298))

(declare-fun e!37294 () Bool)

(assert (=> start!8388 e!37294))

(assert (=> start!8388 true))

(assert (=> start!8388 e!37297))

(declare-fun b!56606 () Bool)

(declare-fun Unit!1475 () Unit!1472)

(assert (=> b!56606 (= e!37289 Unit!1475)))

(declare-fun lt!22320 () Unit!1472)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!23 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) (_ BitVec 32) Int) Unit!1472)

(assert (=> b!56606 (= lt!22320 (lemmaListMapContainsThenArrayContainsFrom!23 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56606 (arrayContainsKey!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22324 () Unit!1472)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3669 (_ BitVec 32) (_ BitVec 32)) Unit!1472)

(assert (=> b!56606 (= lt!22324 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1427 0))(
  ( (Nil!1424) (Cons!1423 (h!2003 (_ BitVec 64)) (t!4728 List!1427)) )
))
(declare-fun arrayNoDuplicates!0 (array!3669 (_ BitVec 32) List!1427) Bool)

(assert (=> b!56606 (arrayNoDuplicates!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) from!355 Nil!1424)))

(declare-fun lt!22325 () Unit!1472)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3669 (_ BitVec 32) (_ BitVec 64) List!1427) Unit!1472)

(assert (=> b!56606 (= lt!22325 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (Cons!1423 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) Nil!1424)))))

(assert (=> b!56606 false))

(declare-fun b!56607 () Bool)

(assert (=> b!56607 (= e!37288 (and e!37285 mapRes!2819))))

(declare-fun condMapEmpty!2820 () Bool)

(declare-fun mapDefault!2820 () ValueCell!848)

(assert (=> b!56607 (= condMapEmpty!2820 (= (arr!1757 (_values!1999 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2820)))))

(declare-fun b!56608 () Bool)

(declare-fun e!37291 () Bool)

(assert (=> b!56608 (= e!37291 tp_is_empty!2383)))

(declare-fun b!56609 () Bool)

(declare-fun e!37287 () Bool)

(assert (=> b!56609 (= e!37287 e!37296)))

(declare-fun b!56610 () Bool)

(declare-fun e!37295 () Bool)

(assert (=> b!56610 (= e!37300 (and e!37295 mapRes!2820))))

(declare-fun condMapEmpty!2819 () Bool)

(declare-fun mapDefault!2819 () ValueCell!848)

(assert (=> b!56610 (= condMapEmpty!2819 (= (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2819)))))

(declare-fun mapNonEmpty!2819 () Bool)

(declare-fun tp!7900 () Bool)

(assert (=> mapNonEmpty!2819 (= mapRes!2819 (and tp!7900 e!37293))))

(declare-fun mapValue!2819 () ValueCell!848)

(declare-fun mapRest!2819 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapKey!2820 () (_ BitVec 32))

(assert (=> mapNonEmpty!2819 (= (arr!1757 (_values!1999 newMap!16)) (store mapRest!2819 mapKey!2820 mapValue!2819))))

(declare-fun mapNonEmpty!2820 () Bool)

(declare-fun tp!7901 () Bool)

(assert (=> mapNonEmpty!2820 (= mapRes!2820 (and tp!7901 e!37291))))

(declare-fun mapValue!2820 () ValueCell!848)

(declare-fun mapKey!2819 () (_ BitVec 32))

(declare-fun mapRest!2820 () (Array (_ BitVec 32) ValueCell!848))

(assert (=> mapNonEmpty!2820 (= (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) (store mapRest!2820 mapKey!2819 mapValue!2820))))

(declare-fun b!56611 () Bool)

(assert (=> b!56611 (= e!37295 tp_is_empty!2383)))

(declare-fun b!56612 () Bool)

(declare-fun res!31824 () Bool)

(assert (=> b!56612 (=> (not res!31824) (not e!37298))))

(assert (=> b!56612 (= res!31824 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5886 newMap!16)) (_size!351 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun b!56613 () Bool)

(assert (=> b!56613 (= e!37299 e!37286)))

(declare-fun res!31823 () Bool)

(assert (=> b!56613 (=> (not res!31823) (not e!37286))))

(declare-datatypes ((tuple2!2018 0))(
  ( (tuple2!2019 (_1!1020 Bool) (_2!1020 LongMapFixedSize!604)) )
))
(declare-fun lt!22322 () tuple2!2018)

(assert (=> b!56613 (= res!31823 (and (_1!1020 lt!22322) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!22319 () Unit!1472)

(assert (=> b!56613 (= lt!22319 e!37289)))

(declare-fun c!6932 () Bool)

(declare-fun contains!675 (ListLongMap!1345 (_ BitVec 64)) Bool)

(assert (=> b!56613 (= c!6932 (contains!675 lt!22321 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun update!80 (LongMapFixedSize!604 (_ BitVec 64) V!2825) tuple2!2018)

(declare-fun get!1060 (ValueCell!848 V!2825) V!2825)

(declare-fun dynLambda!304 (Int (_ BitVec 64)) V!2825)

(assert (=> b!56613 (= lt!22322 (update!80 newMap!16 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56614 () Bool)

(assert (=> b!56614 (= e!37294 e!37287)))

(declare-fun b!56615 () Bool)

(declare-fun res!31820 () Bool)

(assert (=> b!56615 (=> (not res!31820) (not e!37298))))

(assert (=> b!56615 (= res!31820 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992)))))))))

(assert (= (and start!8388 res!31822) b!56615))

(assert (= (and b!56615 res!31820) b!56598))

(assert (= (and b!56598 res!31819) b!56612))

(assert (= (and b!56612 res!31824) b!56604))

(assert (= (and b!56604 res!31821) b!56613))

(assert (= (and b!56613 c!6932) b!56606))

(assert (= (and b!56613 (not c!6932)) b!56602))

(assert (= (and b!56613 res!31823) b!56601))

(assert (= (and b!56610 condMapEmpty!2819) mapIsEmpty!2820))

(assert (= (and b!56610 (not condMapEmpty!2819)) mapNonEmpty!2820))

(get-info :version)

(assert (= (and mapNonEmpty!2820 ((_ is ValueCellFull!848) mapValue!2820)) b!56608))

(assert (= (and b!56610 ((_ is ValueCellFull!848) mapDefault!2819)) b!56611))

(assert (= b!56603 b!56610))

(assert (= b!56609 b!56603))

(assert (= b!56614 b!56609))

(assert (= start!8388 b!56614))

(assert (= (and b!56607 condMapEmpty!2820) mapIsEmpty!2819))

(assert (= (and b!56607 (not condMapEmpty!2820)) mapNonEmpty!2819))

(assert (= (and mapNonEmpty!2819 ((_ is ValueCellFull!848) mapValue!2819)) b!56600))

(assert (= (and b!56607 ((_ is ValueCellFull!848) mapDefault!2820)) b!56599))

(assert (= b!56605 b!56607))

(assert (= start!8388 b!56605))

(declare-fun b_lambda!2481 () Bool)

(assert (=> (not b_lambda!2481) (not b!56613)))

(declare-fun t!4724 () Bool)

(declare-fun tb!1277 () Bool)

(assert (=> (and b!56603 (= (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))) t!4724) tb!1277))

(declare-fun result!2313 () Bool)

(assert (=> tb!1277 (= result!2313 tp_is_empty!2383)))

(assert (=> b!56613 t!4724))

(declare-fun b_and!3413 () Bool)

(assert (= b_and!3409 (and (=> t!4724 result!2313) b_and!3413)))

(declare-fun tb!1279 () Bool)

(declare-fun t!4726 () Bool)

(assert (=> (and b!56605 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))) t!4726) tb!1279))

(declare-fun result!2317 () Bool)

(assert (= result!2317 result!2313))

(assert (=> b!56613 t!4726))

(declare-fun b_and!3415 () Bool)

(assert (= b_and!3411 (and (=> t!4726 result!2317) b_and!3415)))

(declare-fun m!47623 () Bool)

(assert (=> b!56598 m!47623))

(declare-fun m!47625 () Bool)

(assert (=> b!56606 m!47625))

(declare-fun m!47627 () Bool)

(assert (=> b!56606 m!47627))

(declare-fun m!47629 () Bool)

(assert (=> b!56606 m!47629))

(declare-fun m!47631 () Bool)

(assert (=> b!56606 m!47631))

(assert (=> b!56606 m!47629))

(assert (=> b!56606 m!47629))

(declare-fun m!47633 () Bool)

(assert (=> b!56606 m!47633))

(assert (=> b!56606 m!47629))

(declare-fun m!47635 () Bool)

(assert (=> b!56606 m!47635))

(declare-fun m!47637 () Bool)

(assert (=> b!56601 m!47637))

(declare-fun m!47639 () Bool)

(assert (=> b!56605 m!47639))

(declare-fun m!47641 () Bool)

(assert (=> b!56605 m!47641))

(assert (=> b!56604 m!47629))

(declare-fun m!47643 () Bool)

(assert (=> b!56604 m!47643))

(declare-fun m!47645 () Bool)

(assert (=> b!56604 m!47645))

(declare-fun m!47647 () Bool)

(assert (=> start!8388 m!47647))

(declare-fun m!47649 () Bool)

(assert (=> b!56603 m!47649))

(declare-fun m!47651 () Bool)

(assert (=> b!56603 m!47651))

(assert (=> b!56613 m!47629))

(declare-fun m!47653 () Bool)

(assert (=> b!56613 m!47653))

(assert (=> b!56613 m!47629))

(declare-fun m!47655 () Bool)

(assert (=> b!56613 m!47655))

(declare-fun m!47657 () Bool)

(assert (=> b!56613 m!47657))

(declare-fun m!47659 () Bool)

(assert (=> b!56613 m!47659))

(assert (=> b!56613 m!47659))

(assert (=> b!56613 m!47653))

(assert (=> b!56613 m!47655))

(assert (=> b!56613 m!47629))

(declare-fun m!47661 () Bool)

(assert (=> b!56613 m!47661))

(declare-fun m!47663 () Bool)

(assert (=> mapNonEmpty!2819 m!47663))

(declare-fun m!47665 () Bool)

(assert (=> mapNonEmpty!2820 m!47665))

(check-sat (not b_next!1935) (not b_lambda!2481) (not b!56603) b_and!3415 (not b!56605) (not mapNonEmpty!2820) (not b!56598) (not b_next!1933) (not start!8388) (not b!56606) (not mapNonEmpty!2819) tp_is_empty!2383 (not b!56601) b_and!3413 (not b!56604) (not b!56613))
(check-sat b_and!3413 b_and!3415 (not b_next!1933) (not b_next!1935))
(get-model)

(declare-fun b_lambda!2487 () Bool)

(assert (= b_lambda!2481 (or (and b!56603 b_free!1933) (and b!56605 b_free!1935 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))))) b_lambda!2487)))

(check-sat (not b_next!1935) (not b!56603) b_and!3415 (not b!56605) (not mapNonEmpty!2820) (not b!56598) (not b_next!1933) (not start!8388) (not b_lambda!2487) (not b!56606) (not mapNonEmpty!2819) tp_is_empty!2383 (not b!56601) b_and!3413 (not b!56604) (not b!56613))
(check-sat b_and!3413 b_and!3415 (not b_next!1933) (not b_next!1935))
(get-model)

(declare-fun d!10469 () Bool)

(assert (=> d!10469 (= (array_inv!1089 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvsge (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56603 d!10469))

(declare-fun d!10471 () Bool)

(assert (=> d!10471 (= (array_inv!1090 (_values!1999 (v!2353 (underlying!217 thiss!992)))) (bvsge (size!1987 (_values!1999 (v!2353 (underlying!217 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56603 d!10471))

(declare-fun d!10473 () Bool)

(assert (=> d!10473 (= (valid!248 thiss!992) (valid!247 (v!2353 (underlying!217 thiss!992))))))

(declare-fun bs!2468 () Bool)

(assert (= bs!2468 d!10473))

(declare-fun m!47755 () Bool)

(assert (=> bs!2468 m!47755))

(assert (=> start!8388 d!10473))

(declare-fun d!10475 () Bool)

(assert (=> d!10475 (not (arrayContainsKey!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22370 () Unit!1472)

(declare-fun choose!68 (array!3669 (_ BitVec 32) (_ BitVec 64) List!1427) Unit!1472)

(assert (=> d!10475 (= lt!22370 (choose!68 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (Cons!1423 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) Nil!1424)))))

(assert (=> d!10475 (bvslt (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10475 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (Cons!1423 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) Nil!1424)) lt!22370)))

(declare-fun bs!2469 () Bool)

(assert (= bs!2469 d!10475))

(assert (=> bs!2469 m!47629))

(assert (=> bs!2469 m!47633))

(assert (=> bs!2469 m!47629))

(declare-fun m!47757 () Bool)

(assert (=> bs!2469 m!47757))

(assert (=> b!56606 d!10475))

(declare-fun d!10477 () Bool)

(assert (=> d!10477 (arrayNoDuplicates!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) from!355 Nil!1424)))

(declare-fun lt!22373 () Unit!1472)

(declare-fun choose!39 (array!3669 (_ BitVec 32) (_ BitVec 32)) Unit!1472)

(assert (=> d!10477 (= lt!22373 (choose!39 (_keys!3635 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!10477 (bvslt (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10477 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000000 from!355) lt!22373)))

(declare-fun bs!2470 () Bool)

(assert (= bs!2470 d!10477))

(assert (=> bs!2470 m!47627))

(declare-fun m!47759 () Bool)

(assert (=> bs!2470 m!47759))

(assert (=> b!56606 d!10477))

(declare-fun d!10479 () Bool)

(declare-fun res!31865 () Bool)

(declare-fun e!37401 () Bool)

(assert (=> d!10479 (=> res!31865 e!37401)))

(assert (=> d!10479 (= res!31865 (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(assert (=> d!10479 (= (arrayContainsKey!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!37401)))

(declare-fun b!56734 () Bool)

(declare-fun e!37402 () Bool)

(assert (=> b!56734 (= e!37401 e!37402)))

(declare-fun res!31866 () Bool)

(assert (=> b!56734 (=> (not res!31866) (not e!37402))))

(assert (=> b!56734 (= res!31866 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun b!56735 () Bool)

(assert (=> b!56735 (= e!37402 (arrayContainsKey!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!10479 (not res!31865)) b!56734))

(assert (= (and b!56734 res!31866) b!56735))

(declare-fun m!47761 () Bool)

(assert (=> d!10479 m!47761))

(assert (=> b!56735 m!47629))

(declare-fun m!47763 () Bool)

(assert (=> b!56735 m!47763))

(assert (=> b!56606 d!10479))

(declare-fun d!10481 () Bool)

(declare-fun e!37405 () Bool)

(assert (=> d!10481 e!37405))

(declare-fun c!6941 () Bool)

(assert (=> d!10481 (= c!6941 (and (not (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!22376 () Unit!1472)

(declare-fun choose!293 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) (_ BitVec 32) Int) Unit!1472)

(assert (=> d!10481 (= lt!22376 (choose!293 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(assert (=> d!10481 (validMask!0 (mask!5886 (v!2353 (underlying!217 thiss!992))))))

(assert (=> d!10481 (= (lemmaListMapContainsThenArrayContainsFrom!23 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))) lt!22376)))

(declare-fun b!56740 () Bool)

(assert (=> b!56740 (= e!37405 (arrayContainsKey!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!56741 () Bool)

(assert (=> b!56741 (= e!37405 (ite (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!10481 c!6941) b!56740))

(assert (= (and d!10481 (not c!6941)) b!56741))

(assert (=> d!10481 m!47629))

(declare-fun m!47765 () Bool)

(assert (=> d!10481 m!47765))

(assert (=> d!10481 m!47637))

(assert (=> b!56740 m!47629))

(assert (=> b!56740 m!47633))

(assert (=> b!56606 d!10481))

(declare-fun b!56752 () Bool)

(declare-fun e!37417 () Bool)

(declare-fun e!37415 () Bool)

(assert (=> b!56752 (= e!37417 e!37415)))

(declare-fun res!31875 () Bool)

(assert (=> b!56752 (=> (not res!31875) (not e!37415))))

(declare-fun e!37416 () Bool)

(assert (=> b!56752 (= res!31875 (not e!37416))))

(declare-fun res!31874 () Bool)

(assert (=> b!56752 (=> (not res!31874) (not e!37416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!56752 (= res!31874 (validKeyInArray!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun d!10483 () Bool)

(declare-fun res!31873 () Bool)

(assert (=> d!10483 (=> res!31873 e!37417)))

(assert (=> d!10483 (= res!31873 (bvsge from!355 (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(assert (=> d!10483 (= (arrayNoDuplicates!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) from!355 Nil!1424) e!37417)))

(declare-fun b!56753 () Bool)

(declare-fun e!37414 () Bool)

(declare-fun call!3972 () Bool)

(assert (=> b!56753 (= e!37414 call!3972)))

(declare-fun b!56754 () Bool)

(assert (=> b!56754 (= e!37415 e!37414)))

(declare-fun c!6944 () Bool)

(assert (=> b!56754 (= c!6944 (validKeyInArray!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun b!56755 () Bool)

(assert (=> b!56755 (= e!37414 call!3972)))

(declare-fun b!56756 () Bool)

(declare-fun contains!676 (List!1427 (_ BitVec 64)) Bool)

(assert (=> b!56756 (= e!37416 (contains!676 Nil!1424 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun bm!3969 () Bool)

(assert (=> bm!3969 (= call!3972 (arrayNoDuplicates!0 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!6944 (Cons!1423 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) Nil!1424) Nil!1424)))))

(assert (= (and d!10483 (not res!31873)) b!56752))

(assert (= (and b!56752 res!31874) b!56756))

(assert (= (and b!56752 res!31875) b!56754))

(assert (= (and b!56754 c!6944) b!56755))

(assert (= (and b!56754 (not c!6944)) b!56753))

(assert (= (or b!56755 b!56753) bm!3969))

(assert (=> b!56752 m!47629))

(assert (=> b!56752 m!47629))

(declare-fun m!47767 () Bool)

(assert (=> b!56752 m!47767))

(assert (=> b!56754 m!47629))

(assert (=> b!56754 m!47629))

(assert (=> b!56754 m!47767))

(assert (=> b!56756 m!47629))

(assert (=> b!56756 m!47629))

(declare-fun m!47769 () Bool)

(assert (=> b!56756 m!47769))

(assert (=> bm!3969 m!47629))

(declare-fun m!47771 () Bool)

(assert (=> bm!3969 m!47771))

(assert (=> b!56606 d!10483))

(declare-fun d!10485 () Bool)

(declare-fun res!31882 () Bool)

(declare-fun e!37420 () Bool)

(assert (=> d!10485 (=> (not res!31882) (not e!37420))))

(declare-fun simpleValid!40 (LongMapFixedSize!604) Bool)

(assert (=> d!10485 (= res!31882 (simpleValid!40 newMap!16))))

(assert (=> d!10485 (= (valid!247 newMap!16) e!37420)))

(declare-fun b!56763 () Bool)

(declare-fun res!31883 () Bool)

(assert (=> b!56763 (=> (not res!31883) (not e!37420))))

(declare-fun arrayCountValidKeys!0 (array!3669 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!56763 (= res!31883 (= (arrayCountValidKeys!0 (_keys!3635 newMap!16) #b00000000000000000000000000000000 (size!1986 (_keys!3635 newMap!16))) (_size!351 newMap!16)))))

(declare-fun b!56764 () Bool)

(declare-fun res!31884 () Bool)

(assert (=> b!56764 (=> (not res!31884) (not e!37420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3669 (_ BitVec 32)) Bool)

(assert (=> b!56764 (= res!31884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3635 newMap!16) (mask!5886 newMap!16)))))

(declare-fun b!56765 () Bool)

(assert (=> b!56765 (= e!37420 (arrayNoDuplicates!0 (_keys!3635 newMap!16) #b00000000000000000000000000000000 Nil!1424))))

(assert (= (and d!10485 res!31882) b!56763))

(assert (= (and b!56763 res!31883) b!56764))

(assert (= (and b!56764 res!31884) b!56765))

(declare-fun m!47773 () Bool)

(assert (=> d!10485 m!47773))

(declare-fun m!47775 () Bool)

(assert (=> b!56763 m!47775))

(declare-fun m!47777 () Bool)

(assert (=> b!56764 m!47777))

(declare-fun m!47779 () Bool)

(assert (=> b!56765 m!47779))

(assert (=> b!56598 d!10485))

(declare-fun d!10487 () Bool)

(assert (=> d!10487 (= (array_inv!1089 (_keys!3635 newMap!16)) (bvsge (size!1986 (_keys!3635 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56605 d!10487))

(declare-fun d!10489 () Bool)

(assert (=> d!10489 (= (array_inv!1090 (_values!1999 newMap!16)) (bvsge (size!1987 (_values!1999 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56605 d!10489))

(declare-fun d!10491 () Bool)

(assert (=> d!10491 (= (validMask!0 (mask!5886 (v!2353 (underlying!217 thiss!992)))) (and (or (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000001111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000011111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000001111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000011111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000001111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000011111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000001111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000011111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000000111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000001111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000011111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000000111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000001111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000011111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000000111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000001111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000011111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000000111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000001111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000011111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00000111111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00001111111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00011111111111111111111111111111) (= (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5886 (v!2353 (underlying!217 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!56601 d!10491))

(declare-fun d!10493 () Bool)

(declare-fun e!37425 () Bool)

(assert (=> d!10493 e!37425))

(declare-fun res!31887 () Bool)

(assert (=> d!10493 (=> res!31887 e!37425)))

(declare-fun lt!22386 () Bool)

(assert (=> d!10493 (= res!31887 (not lt!22386))))

(declare-fun lt!22388 () Bool)

(assert (=> d!10493 (= lt!22386 lt!22388)))

(declare-fun lt!22385 () Unit!1472)

(declare-fun e!37426 () Unit!1472)

(assert (=> d!10493 (= lt!22385 e!37426)))

(declare-fun c!6947 () Bool)

(assert (=> d!10493 (= c!6947 lt!22388)))

(declare-fun containsKey!124 (List!1426 (_ BitVec 64)) Bool)

(assert (=> d!10493 (= lt!22388 (containsKey!124 (toList!688 lt!22321) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(assert (=> d!10493 (= (contains!675 lt!22321 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)) lt!22386)))

(declare-fun b!56772 () Bool)

(declare-fun lt!22387 () Unit!1472)

(assert (=> b!56772 (= e!37426 lt!22387)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!73 (List!1426 (_ BitVec 64)) Unit!1472)

(assert (=> b!56772 (= lt!22387 (lemmaContainsKeyImpliesGetValueByKeyDefined!73 (toList!688 lt!22321) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-datatypes ((Option!126 0))(
  ( (Some!125 (v!2359 V!2825)) (None!124) )
))
(declare-fun isDefined!74 (Option!126) Bool)

(declare-fun getValueByKey!120 (List!1426 (_ BitVec 64)) Option!126)

(assert (=> b!56772 (isDefined!74 (getValueByKey!120 (toList!688 lt!22321) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun b!56773 () Bool)

(declare-fun Unit!1480 () Unit!1472)

(assert (=> b!56773 (= e!37426 Unit!1480)))

(declare-fun b!56774 () Bool)

(assert (=> b!56774 (= e!37425 (isDefined!74 (getValueByKey!120 (toList!688 lt!22321) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355))))))

(assert (= (and d!10493 c!6947) b!56772))

(assert (= (and d!10493 (not c!6947)) b!56773))

(assert (= (and d!10493 (not res!31887)) b!56774))

(assert (=> d!10493 m!47629))

(declare-fun m!47781 () Bool)

(assert (=> d!10493 m!47781))

(assert (=> b!56772 m!47629))

(declare-fun m!47783 () Bool)

(assert (=> b!56772 m!47783))

(assert (=> b!56772 m!47629))

(declare-fun m!47785 () Bool)

(assert (=> b!56772 m!47785))

(assert (=> b!56772 m!47785))

(declare-fun m!47787 () Bool)

(assert (=> b!56772 m!47787))

(assert (=> b!56774 m!47629))

(assert (=> b!56774 m!47785))

(assert (=> b!56774 m!47785))

(assert (=> b!56774 m!47787))

(assert (=> b!56613 d!10493))

(declare-fun b!56856 () Bool)

(declare-fun lt!22444 () Unit!1472)

(declare-fun e!37472 () Unit!1472)

(assert (=> b!56856 (= lt!22444 e!37472)))

(declare-fun c!6986 () Bool)

(declare-fun call!4026 () Bool)

(assert (=> b!56856 (= c!6986 call!4026)))

(declare-fun e!37487 () tuple2!2018)

(assert (=> b!56856 (= e!37487 (tuple2!2019 false newMap!16))))

(declare-fun b!56857 () Bool)

(declare-fun lt!22454 () Unit!1472)

(declare-fun lt!22451 () Unit!1472)

(assert (=> b!56857 (= lt!22454 lt!22451)))

(declare-fun call!4028 () ListLongMap!1345)

(declare-fun call!4041 () ListLongMap!1345)

(assert (=> b!56857 (= call!4028 call!4041)))

(declare-fun lt!22452 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 V!2825 Int) Unit!1472)

(assert (=> b!56857 (= lt!22451 (lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) lt!22452 (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56857 (= lt!22452 (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!37469 () tuple2!2018)

(assert (=> b!56857 (= e!37469 (tuple2!2019 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5886 newMap!16) (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000010) (zeroValue!1934 newMap!16) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!351 newMap!16) (_keys!3635 newMap!16) (_values!1999 newMap!16) (_vacant!351 newMap!16))))))

(declare-fun b!56858 () Bool)

(declare-fun res!31926 () Bool)

(declare-fun e!37471 () Bool)

(assert (=> b!56858 (=> (not res!31926) (not e!37471))))

(declare-datatypes ((SeekEntryResult!228 0))(
  ( (MissingZero!228 (index!3034 (_ BitVec 32))) (Found!228 (index!3035 (_ BitVec 32))) (Intermediate!228 (undefined!1040 Bool) (index!3036 (_ BitVec 32)) (x!9819 (_ BitVec 32))) (Undefined!228) (MissingVacant!228 (index!3037 (_ BitVec 32))) )
))
(declare-fun lt!22445 () SeekEntryResult!228)

(assert (=> b!56858 (= res!31926 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3034 lt!22445)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56859 () Bool)

(declare-fun e!37489 () tuple2!2018)

(assert (=> b!56859 (= e!37489 e!37469)))

(declare-fun c!6984 () Bool)

(assert (=> b!56859 (= c!6984 (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56860 () Bool)

(declare-fun e!37480 () Bool)

(declare-fun call!4033 () Bool)

(assert (=> b!56860 (= e!37480 (not call!4033))))

(declare-fun b!56861 () Bool)

(declare-fun res!31929 () Bool)

(assert (=> b!56861 (=> (not res!31929) (not e!37471))))

(declare-fun call!4043 () Bool)

(assert (=> b!56861 (= res!31929 call!4043)))

(declare-fun e!37485 () Bool)

(assert (=> b!56861 (= e!37485 e!37471)))

(declare-fun b!56862 () Bool)

(declare-fun res!31925 () Bool)

(declare-fun call!4032 () Bool)

(assert (=> b!56862 (= res!31925 call!4032)))

(declare-fun e!37474 () Bool)

(assert (=> b!56862 (=> (not res!31925) (not e!37474))))

(declare-fun call!4023 () Unit!1472)

(declare-fun bm!4018 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) Int) Unit!1472)

(assert (=> bm!4018 (= call!4023 (lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (defaultEntry!2016 newMap!16)))))

(declare-fun bm!4019 () Bool)

(declare-fun lt!22463 () SeekEntryResult!228)

(declare-fun c!6976 () Bool)

(declare-fun call!4031 () ListLongMap!1345)

(declare-fun lt!22448 () (_ BitVec 32))

(assert (=> bm!4019 (= call!4031 (getCurrentListMap!385 (_keys!3635 newMap!16) (ite c!6976 (_values!1999 newMap!16) (array!3672 (store (arr!1757 (_values!1999 newMap!16)) (index!3035 lt!22463) (ValueCellFull!848 (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1987 (_values!1999 newMap!16)))) (mask!5886 newMap!16) (ite (and c!6976 c!6984) lt!22448 (extraKeys!1907 newMap!16)) (ite (and c!6976 c!6984) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1934 newMap!16)) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun b!56863 () Bool)

(declare-fun e!37483 () Bool)

(declare-fun call!4025 () Bool)

(assert (=> b!56863 (= e!37483 (not call!4025))))

(declare-fun bm!4020 () Bool)

(declare-fun call!4034 () Bool)

(assert (=> bm!4020 (= call!4033 call!4034)))

(declare-fun bm!4021 () Bool)

(declare-fun call!4024 () ListLongMap!1345)

(assert (=> bm!4021 (= call!4024 (map!1095 newMap!16))))

(declare-fun b!56864 () Bool)

(declare-fun lt!22450 () SeekEntryResult!228)

(declare-fun e!37476 () Bool)

(assert (=> b!56864 (= e!37476 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3035 lt!22450)) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun b!56855 () Bool)

(declare-fun e!37486 () Bool)

(declare-fun lt!22456 () SeekEntryResult!228)

(assert (=> b!56855 (= e!37486 ((_ is Undefined!228) lt!22456))))

(declare-fun d!10495 () Bool)

(declare-fun e!37477 () Bool)

(assert (=> d!10495 e!37477))

(declare-fun res!31919 () Bool)

(assert (=> d!10495 (=> (not res!31919) (not e!37477))))

(declare-fun lt!22449 () tuple2!2018)

(assert (=> d!10495 (= res!31919 (valid!247 (_2!1020 lt!22449)))))

(assert (=> d!10495 (= lt!22449 e!37489)))

(assert (=> d!10495 (= c!6976 (= (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (bvneg (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355))))))

(assert (=> d!10495 (valid!247 newMap!16)))

(assert (=> d!10495 (= (update!80 newMap!16 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!22449)))

(declare-fun b!56865 () Bool)

(declare-fun e!37470 () tuple2!2018)

(declare-fun e!37473 () tuple2!2018)

(assert (=> b!56865 (= e!37470 e!37473)))

(declare-fun c!6981 () Bool)

(assert (=> b!56865 (= c!6981 ((_ is MissingZero!228) lt!22463))))

(declare-fun bm!4022 () Bool)

(declare-fun call!4027 () SeekEntryResult!228)

(declare-fun call!4037 () SeekEntryResult!228)

(assert (=> bm!4022 (= call!4027 call!4037)))

(declare-fun bm!4023 () Bool)

(declare-fun call!4044 () ListLongMap!1345)

(declare-fun call!4029 () ListLongMap!1345)

(assert (=> bm!4023 (= call!4044 call!4029)))

(declare-fun b!56866 () Bool)

(declare-fun c!6980 () Bool)

(assert (=> b!56866 (= c!6980 ((_ is MissingVacant!228) lt!22463))))

(assert (=> b!56866 (= e!37487 e!37470)))

(declare-fun bm!4024 () Bool)

(assert (=> bm!4024 (= call!4041 call!4029)))

(declare-fun call!4036 () Unit!1472)

(declare-fun bm!4025 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) Int) Unit!1472)

(assert (=> bm!4025 (= call!4036 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (defaultEntry!2016 newMap!16)))))

(declare-fun b!56867 () Bool)

(declare-fun e!37482 () Bool)

(assert (=> b!56867 (= e!37482 ((_ is Undefined!228) lt!22445))))

(declare-fun b!56868 () Bool)

(declare-fun e!37484 () Bool)

(declare-fun e!37481 () Bool)

(assert (=> b!56868 (= e!37484 e!37481)))

(declare-fun res!31918 () Bool)

(declare-fun call!4035 () ListLongMap!1345)

(assert (=> b!56868 (= res!31918 (contains!675 call!4035 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(assert (=> b!56868 (=> (not res!31918) (not e!37481))))

(declare-fun lt!22446 () SeekEntryResult!228)

(declare-fun b!56869 () Bool)

(assert (=> b!56869 (= e!37474 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3035 lt!22446)) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun bm!4026 () Bool)

(declare-fun call!4030 () tuple2!2018)

(declare-fun updateHelperNewKey!13 (LongMapFixedSize!604 (_ BitVec 64) V!2825 (_ BitVec 32)) tuple2!2018)

(assert (=> bm!4026 (= call!4030 (updateHelperNewKey!13 newMap!16 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!6980 (index!3037 lt!22463) (index!3034 lt!22463))))))

(declare-fun bm!4027 () Bool)

(assert (=> bm!4027 (= call!4034 (arrayContainsKey!0 (_keys!3635 newMap!16) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!56870 () Bool)

(declare-fun lt!22461 () Unit!1472)

(assert (=> b!56870 (= e!37472 lt!22461)))

(assert (=> b!56870 (= lt!22461 call!4036)))

(assert (=> b!56870 (= lt!22445 call!4027)))

(declare-fun c!6979 () Bool)

(assert (=> b!56870 (= c!6979 ((_ is MissingZero!228) lt!22445))))

(assert (=> b!56870 e!37485))

(declare-fun bm!4028 () Bool)

(declare-fun call!4021 () SeekEntryResult!228)

(assert (=> bm!4028 (= call!4021 call!4037)))

(declare-fun b!56871 () Bool)

(declare-fun e!37488 () Unit!1472)

(declare-fun Unit!1481 () Unit!1472)

(assert (=> b!56871 (= e!37488 Unit!1481)))

(declare-fun lt!22457 () Unit!1472)

(assert (=> b!56871 (= lt!22457 call!4036)))

(assert (=> b!56871 (= lt!22456 call!4021)))

(declare-fun c!6978 () Bool)

(assert (=> b!56871 (= c!6978 ((_ is MissingZero!228) lt!22456))))

(declare-fun e!37475 () Bool)

(assert (=> b!56871 e!37475))

(declare-fun lt!22459 () Unit!1472)

(assert (=> b!56871 (= lt!22459 lt!22457)))

(assert (=> b!56871 false))

(declare-fun b!56872 () Bool)

(declare-fun lt!22466 () Unit!1472)

(declare-fun lt!22443 () Unit!1472)

(assert (=> b!56872 (= lt!22466 lt!22443)))

(declare-fun call!4040 () ListLongMap!1345)

(assert (=> b!56872 (= call!4028 call!4040)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!13 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 V!2825 Int) Unit!1472)

(assert (=> b!56872 (= lt!22443 (lemmaChangeZeroKeyThenAddPairToListMap!13 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) lt!22448 (zeroValue!1934 newMap!16) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1934 newMap!16) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56872 (= lt!22448 (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!56872 (= e!37469 (tuple2!2019 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5886 newMap!16) (bvor (extraKeys!1907 newMap!16) #b00000000000000000000000000000001) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1934 newMap!16) (_size!351 newMap!16) (_keys!3635 newMap!16) (_values!1999 newMap!16) (_vacant!351 newMap!16))))))

(declare-fun b!56873 () Bool)

(declare-fun e!37479 () ListLongMap!1345)

(assert (=> b!56873 (= e!37479 (ite c!6984 call!4041 call!4040))))

(declare-fun b!56874 () Bool)

(assert (=> b!56874 (= e!37484 (= call!4035 call!4024))))

(declare-fun b!56875 () Bool)

(declare-fun lt!22455 () Unit!1472)

(declare-fun lt!22469 () Unit!1472)

(assert (=> b!56875 (= lt!22455 lt!22469)))

(assert (=> b!56875 call!4026))

(declare-fun lt!22468 () array!3671)

(declare-fun lemmaValidKeyInArrayIsInListMap!72 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) Unit!1472)

(assert (=> b!56875 (= lt!22469 (lemmaValidKeyInArrayIsInListMap!72 (_keys!3635 newMap!16) lt!22468 (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (index!3035 lt!22463) (defaultEntry!2016 newMap!16)))))

(assert (=> b!56875 (= lt!22468 (array!3672 (store (arr!1757 (_values!1999 newMap!16)) (index!3035 lt!22463) (ValueCellFull!848 (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1987 (_values!1999 newMap!16))))))

(declare-fun lt!22460 () Unit!1472)

(declare-fun lt!22464 () Unit!1472)

(assert (=> b!56875 (= lt!22460 lt!22464)))

(declare-fun call!4038 () ListLongMap!1345)

(assert (=> b!56875 (= call!4038 call!4031)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) (_ BitVec 64) V!2825 Int) Unit!1472)

(assert (=> b!56875 (= lt!22464 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (index!3035 lt!22463) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2016 newMap!16)))))

(declare-fun lt!22458 () Unit!1472)

(assert (=> b!56875 (= lt!22458 e!37488)))

(declare-fun c!6974 () Bool)

(assert (=> b!56875 (= c!6974 (contains!675 (getCurrentListMap!385 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)) (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(assert (=> b!56875 (= e!37473 (tuple2!2019 true (LongMapFixedSize!605 (defaultEntry!2016 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) (_size!351 newMap!16) (_keys!3635 newMap!16) (array!3672 (store (arr!1757 (_values!1999 newMap!16)) (index!3035 lt!22463) (ValueCellFull!848 (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1987 (_values!1999 newMap!16))) (_vacant!351 newMap!16))))))

(declare-fun b!56876 () Bool)

(assert (=> b!56876 (= e!37486 e!37483)))

(declare-fun res!31922 () Bool)

(declare-fun call!4039 () Bool)

(assert (=> b!56876 (= res!31922 call!4039)))

(assert (=> b!56876 (=> (not res!31922) (not e!37483))))

(declare-fun b!56877 () Bool)

(declare-fun res!31916 () Bool)

(declare-fun e!37478 () Bool)

(assert (=> b!56877 (=> (not res!31916) (not e!37478))))

(assert (=> b!56877 (= res!31916 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3034 lt!22456)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!4029 () Bool)

(assert (=> bm!4029 (= call!4035 (map!1095 (_2!1020 lt!22449)))))

(declare-fun b!56878 () Bool)

(declare-fun lt!22462 () tuple2!2018)

(assert (=> b!56878 (= lt!22462 call!4030)))

(assert (=> b!56878 (= e!37473 (tuple2!2019 (_1!1020 lt!22462) (_2!1020 lt!22462)))))

(declare-fun bm!4030 () Bool)

(declare-fun call!4022 () Bool)

(declare-fun call!4042 () Bool)

(assert (=> bm!4030 (= call!4022 call!4042)))

(declare-fun bm!4031 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3669 (_ BitVec 32)) SeekEntryResult!228)

(assert (=> bm!4031 (= call!4037 (seekEntryOrOpen!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (_keys!3635 newMap!16) (mask!5886 newMap!16)))))

(declare-fun b!56879 () Bool)

(declare-fun res!31921 () Bool)

(assert (=> b!56879 (= res!31921 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3037 lt!22445)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56879 (=> (not res!31921) (not e!37480))))

(declare-fun b!56880 () Bool)

(assert (=> b!56880 (= e!37479 (getCurrentListMap!385 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun b!56881 () Bool)

(assert (=> b!56881 (= e!37478 (not call!4025))))

(declare-fun c!6977 () Bool)

(declare-fun bm!4032 () Bool)

(assert (=> bm!4032 (= call!4026 (contains!675 call!4044 (ite c!6977 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (select (arr!1756 (_keys!3635 newMap!16)) (index!3035 lt!22463)))))))

(declare-fun bm!4033 () Bool)

(assert (=> bm!4033 (= call!4029 (getCurrentListMap!385 (_keys!3635 newMap!16) (ite (or c!6976 c!6977) (_values!1999 newMap!16) lt!22468) (mask!5886 newMap!16) (ite c!6976 (ite c!6984 (extraKeys!1907 newMap!16) lt!22452) (extraKeys!1907 newMap!16)) (zeroValue!1934 newMap!16) (ite c!6976 (ite c!6984 (minValue!1934 newMap!16) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1934 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun bm!4034 () Bool)

(assert (=> bm!4034 (= call!4043 call!4032)))

(declare-fun bm!4035 () Bool)

(assert (=> bm!4035 (= call!4032 call!4042)))

(declare-fun b!56882 () Bool)

(assert (=> b!56882 (= e!37489 e!37487)))

(assert (=> b!56882 (= lt!22463 (seekEntryOrOpen!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (_keys!3635 newMap!16) (mask!5886 newMap!16)))))

(assert (=> b!56882 (= c!6977 ((_ is Undefined!228) lt!22463))))

(declare-fun b!56883 () Bool)

(declare-fun lt!22447 () Unit!1472)

(assert (=> b!56883 (= e!37488 lt!22447)))

(assert (=> b!56883 (= lt!22447 call!4023)))

(assert (=> b!56883 (= lt!22450 call!4021)))

(declare-fun res!31923 () Bool)

(assert (=> b!56883 (= res!31923 ((_ is Found!228) lt!22450))))

(assert (=> b!56883 (=> (not res!31923) (not e!37476))))

(assert (=> b!56883 e!37476))

(declare-fun b!56884 () Bool)

(declare-fun Unit!1482 () Unit!1472)

(assert (=> b!56884 (= e!37472 Unit!1482)))

(declare-fun lt!22465 () Unit!1472)

(assert (=> b!56884 (= lt!22465 call!4023)))

(assert (=> b!56884 (= lt!22446 call!4027)))

(declare-fun res!31928 () Bool)

(assert (=> b!56884 (= res!31928 ((_ is Found!228) lt!22446))))

(assert (=> b!56884 (=> (not res!31928) (not e!37474))))

(assert (=> b!56884 e!37474))

(declare-fun lt!22453 () Unit!1472)

(assert (=> b!56884 (= lt!22453 lt!22465)))

(assert (=> b!56884 false))

(declare-fun b!56885 () Bool)

(declare-fun +!79 (ListLongMap!1345 tuple2!2016) ListLongMap!1345)

(assert (=> b!56885 (= e!37481 (= call!4035 (+!79 call!4024 (tuple2!2017 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!56886 () Bool)

(declare-fun res!31927 () Bool)

(assert (=> b!56886 (=> (not res!31927) (not e!37478))))

(assert (=> b!56886 (= res!31927 call!4039)))

(assert (=> b!56886 (= e!37475 e!37478)))

(declare-fun bm!4036 () Bool)

(assert (=> bm!4036 (= call!4040 call!4031)))

(declare-fun b!56887 () Bool)

(declare-fun c!6985 () Bool)

(assert (=> b!56887 (= c!6985 ((_ is MissingVacant!228) lt!22456))))

(assert (=> b!56887 (= e!37475 e!37486)))

(declare-fun b!56888 () Bool)

(declare-fun res!31920 () Bool)

(assert (=> b!56888 (= res!31920 (= (select (arr!1756 (_keys!3635 newMap!16)) (index!3037 lt!22456)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56888 (=> (not res!31920) (not e!37483))))

(declare-fun b!56889 () Bool)

(assert (=> b!56889 (= e!37482 e!37480)))

(declare-fun res!31917 () Bool)

(assert (=> b!56889 (= res!31917 call!4043)))

(assert (=> b!56889 (=> (not res!31917) (not e!37480))))

(declare-fun b!56890 () Bool)

(declare-fun lt!22467 () tuple2!2018)

(assert (=> b!56890 (= e!37470 (tuple2!2019 (_1!1020 lt!22467) (_2!1020 lt!22467)))))

(assert (=> b!56890 (= lt!22467 call!4030)))

(declare-fun b!56891 () Bool)

(assert (=> b!56891 (= e!37471 (not call!4033))))

(declare-fun b!56892 () Bool)

(declare-fun c!6982 () Bool)

(assert (=> b!56892 (= c!6982 ((_ is MissingVacant!228) lt!22445))))

(assert (=> b!56892 (= e!37485 e!37482)))

(declare-fun bm!4037 () Bool)

(assert (=> bm!4037 (= call!4028 call!4038)))

(declare-fun bm!4038 () Bool)

(assert (=> bm!4038 (= call!4039 call!4022)))

(declare-fun b!56893 () Bool)

(declare-fun res!31924 () Bool)

(assert (=> b!56893 (= res!31924 call!4022)))

(assert (=> b!56893 (=> (not res!31924) (not e!37476))))

(declare-fun bm!4039 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4039 (= call!4042 (inRange!0 (ite c!6977 (ite c!6986 (index!3035 lt!22446) (ite c!6979 (index!3034 lt!22445) (index!3037 lt!22445))) (ite c!6974 (index!3035 lt!22450) (ite c!6978 (index!3034 lt!22456) (index!3037 lt!22456)))) (mask!5886 newMap!16)))))

(declare-fun b!56894 () Bool)

(assert (=> b!56894 (= e!37477 e!37484)))

(declare-fun c!6975 () Bool)

(assert (=> b!56894 (= c!6975 (_1!1020 lt!22449))))

(declare-fun bm!4040 () Bool)

(assert (=> bm!4040 (= call!4025 call!4034)))

(declare-fun bm!4041 () Bool)

(assert (=> bm!4041 (= call!4038 (+!79 e!37479 (ite c!6976 (ite c!6984 (tuple2!2017 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2017 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2017 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) from!355) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!6983 () Bool)

(assert (=> bm!4041 (= c!6983 c!6976)))

(assert (= (and d!10495 c!6976) b!56859))

(assert (= (and d!10495 (not c!6976)) b!56882))

(assert (= (and b!56859 c!6984) b!56872))

(assert (= (and b!56859 (not c!6984)) b!56857))

(assert (= (or b!56872 b!56857) bm!4036))

(assert (= (or b!56872 b!56857) bm!4024))

(assert (= (or b!56872 b!56857) bm!4037))

(assert (= (and b!56882 c!6977) b!56856))

(assert (= (and b!56882 (not c!6977)) b!56866))

(assert (= (and b!56856 c!6986) b!56884))

(assert (= (and b!56856 (not c!6986)) b!56870))

(assert (= (and b!56884 res!31928) b!56862))

(assert (= (and b!56862 res!31925) b!56869))

(assert (= (and b!56870 c!6979) b!56861))

(assert (= (and b!56870 (not c!6979)) b!56892))

(assert (= (and b!56861 res!31929) b!56858))

(assert (= (and b!56858 res!31926) b!56891))

(assert (= (and b!56892 c!6982) b!56889))

(assert (= (and b!56892 (not c!6982)) b!56867))

(assert (= (and b!56889 res!31917) b!56879))

(assert (= (and b!56879 res!31921) b!56860))

(assert (= (or b!56861 b!56889) bm!4034))

(assert (= (or b!56891 b!56860) bm!4020))

(assert (= (or b!56862 bm!4034) bm!4035))

(assert (= (or b!56884 b!56870) bm!4022))

(assert (= (and b!56866 c!6980) b!56890))

(assert (= (and b!56866 (not c!6980)) b!56865))

(assert (= (and b!56865 c!6981) b!56878))

(assert (= (and b!56865 (not c!6981)) b!56875))

(assert (= (and b!56875 c!6974) b!56883))

(assert (= (and b!56875 (not c!6974)) b!56871))

(assert (= (and b!56883 res!31923) b!56893))

(assert (= (and b!56893 res!31924) b!56864))

(assert (= (and b!56871 c!6978) b!56886))

(assert (= (and b!56871 (not c!6978)) b!56887))

(assert (= (and b!56886 res!31927) b!56877))

(assert (= (and b!56877 res!31916) b!56881))

(assert (= (and b!56887 c!6985) b!56876))

(assert (= (and b!56887 (not c!6985)) b!56855))

(assert (= (and b!56876 res!31922) b!56888))

(assert (= (and b!56888 res!31920) b!56863))

(assert (= (or b!56886 b!56876) bm!4038))

(assert (= (or b!56881 b!56863) bm!4040))

(assert (= (or b!56893 bm!4038) bm!4030))

(assert (= (or b!56883 b!56871) bm!4028))

(assert (= (or b!56890 b!56878) bm!4026))

(assert (= (or bm!4022 bm!4028) bm!4031))

(assert (= (or b!56884 b!56883) bm!4018))

(assert (= (or b!56870 b!56871) bm!4025))

(assert (= (or bm!4035 bm!4030) bm!4039))

(assert (= (or bm!4020 bm!4040) bm!4027))

(assert (= (or b!56856 b!56875) bm!4023))

(assert (= (or b!56856 b!56875) bm!4032))

(assert (= (or bm!4036 b!56875) bm!4019))

(assert (= (or bm!4024 bm!4023) bm!4033))

(assert (= (or bm!4037 b!56875) bm!4041))

(assert (= (and bm!4041 c!6983) b!56873))

(assert (= (and bm!4041 (not c!6983)) b!56880))

(assert (= (and d!10495 res!31919) b!56894))

(assert (= (and b!56894 c!6975) b!56868))

(assert (= (and b!56894 (not c!6975)) b!56874))

(assert (= (and b!56868 res!31918) b!56885))

(assert (= (or b!56868 b!56885 b!56874) bm!4029))

(assert (= (or b!56885 b!56874) bm!4021))

(declare-fun m!47789 () Bool)

(assert (=> b!56869 m!47789))

(assert (=> b!56872 m!47655))

(declare-fun m!47791 () Bool)

(assert (=> b!56872 m!47791))

(declare-fun m!47793 () Bool)

(assert (=> b!56879 m!47793))

(declare-fun m!47795 () Bool)

(assert (=> b!56858 m!47795))

(declare-fun m!47797 () Bool)

(assert (=> bm!4032 m!47797))

(declare-fun m!47799 () Bool)

(assert (=> bm!4032 m!47799))

(assert (=> bm!4026 m!47629))

(assert (=> bm!4026 m!47655))

(declare-fun m!47801 () Bool)

(assert (=> bm!4026 m!47801))

(declare-fun m!47803 () Bool)

(assert (=> bm!4041 m!47803))

(assert (=> bm!4018 m!47629))

(declare-fun m!47805 () Bool)

(assert (=> bm!4018 m!47805))

(declare-fun m!47807 () Bool)

(assert (=> b!56864 m!47807))

(declare-fun m!47809 () Bool)

(assert (=> bm!4033 m!47809))

(declare-fun m!47811 () Bool)

(assert (=> bm!4039 m!47811))

(assert (=> b!56868 m!47629))

(declare-fun m!47813 () Bool)

(assert (=> b!56868 m!47813))

(declare-fun m!47815 () Bool)

(assert (=> bm!4019 m!47815))

(declare-fun m!47817 () Bool)

(assert (=> bm!4019 m!47817))

(declare-fun m!47819 () Bool)

(assert (=> b!56877 m!47819))

(assert (=> b!56882 m!47629))

(declare-fun m!47821 () Bool)

(assert (=> b!56882 m!47821))

(declare-fun m!47823 () Bool)

(assert (=> b!56885 m!47823))

(declare-fun m!47825 () Bool)

(assert (=> b!56880 m!47825))

(assert (=> b!56857 m!47655))

(declare-fun m!47827 () Bool)

(assert (=> b!56857 m!47827))

(assert (=> b!56875 m!47815))

(assert (=> b!56875 m!47629))

(assert (=> b!56875 m!47655))

(declare-fun m!47829 () Bool)

(assert (=> b!56875 m!47829))

(assert (=> b!56875 m!47825))

(assert (=> b!56875 m!47629))

(declare-fun m!47831 () Bool)

(assert (=> b!56875 m!47831))

(assert (=> b!56875 m!47825))

(declare-fun m!47833 () Bool)

(assert (=> b!56875 m!47833))

(assert (=> bm!4021 m!47643))

(assert (=> bm!4027 m!47629))

(declare-fun m!47835 () Bool)

(assert (=> bm!4027 m!47835))

(assert (=> bm!4031 m!47629))

(assert (=> bm!4031 m!47821))

(assert (=> bm!4025 m!47629))

(declare-fun m!47837 () Bool)

(assert (=> bm!4025 m!47837))

(declare-fun m!47839 () Bool)

(assert (=> bm!4029 m!47839))

(declare-fun m!47841 () Bool)

(assert (=> b!56888 m!47841))

(declare-fun m!47843 () Bool)

(assert (=> d!10495 m!47843))

(assert (=> d!10495 m!47623))

(assert (=> b!56613 d!10495))

(declare-fun d!10497 () Bool)

(declare-fun c!6989 () Bool)

(assert (=> d!10497 (= c!6989 ((_ is ValueCellFull!848) (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355)))))

(declare-fun e!37492 () V!2825)

(assert (=> d!10497 (= (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!37492)))

(declare-fun b!56899 () Bool)

(declare-fun get!1061 (ValueCell!848 V!2825) V!2825)

(assert (=> b!56899 (= e!37492 (get!1061 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!56900 () Bool)

(declare-fun get!1062 (ValueCell!848 V!2825) V!2825)

(assert (=> b!56900 (= e!37492 (get!1062 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) from!355) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10497 c!6989) b!56899))

(assert (= (and d!10497 (not c!6989)) b!56900))

(assert (=> b!56899 m!47659))

(assert (=> b!56899 m!47653))

(declare-fun m!47845 () Bool)

(assert (=> b!56899 m!47845))

(assert (=> b!56900 m!47659))

(assert (=> b!56900 m!47653))

(declare-fun m!47847 () Bool)

(assert (=> b!56900 m!47847))

(assert (=> b!56613 d!10497))

(declare-fun d!10499 () Bool)

(assert (=> d!10499 (= (map!1095 newMap!16) (getCurrentListMap!385 (_keys!3635 newMap!16) (_values!1999 newMap!16) (mask!5886 newMap!16) (extraKeys!1907 newMap!16) (zeroValue!1934 newMap!16) (minValue!1934 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2016 newMap!16)))))

(declare-fun bs!2471 () Bool)

(assert (= bs!2471 d!10499))

(assert (=> bs!2471 m!47825))

(assert (=> b!56604 d!10499))

(declare-fun bm!4056 () Bool)

(declare-fun call!4061 () ListLongMap!1345)

(declare-fun getCurrentListMapNoExtraKeys!42 (array!3669 array!3671 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) ListLongMap!1345)

(assert (=> bm!4056 (= call!4061 (getCurrentListMapNoExtraKeys!42 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun d!10501 () Bool)

(declare-fun e!37524 () Bool)

(assert (=> d!10501 e!37524))

(declare-fun res!31951 () Bool)

(assert (=> d!10501 (=> (not res!31951) (not e!37524))))

(assert (=> d!10501 (= res!31951 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))))

(declare-fun lt!22521 () ListLongMap!1345)

(declare-fun lt!22515 () ListLongMap!1345)

(assert (=> d!10501 (= lt!22521 lt!22515)))

(declare-fun lt!22526 () Unit!1472)

(declare-fun e!37525 () Unit!1472)

(assert (=> d!10501 (= lt!22526 e!37525)))

(declare-fun c!7007 () Bool)

(declare-fun e!37520 () Bool)

(assert (=> d!10501 (= c!7007 e!37520)))

(declare-fun res!31948 () Bool)

(assert (=> d!10501 (=> (not res!31948) (not e!37520))))

(assert (=> d!10501 (= res!31948 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun e!37522 () ListLongMap!1345)

(assert (=> d!10501 (= lt!22515 e!37522)))

(declare-fun c!7002 () Bool)

(assert (=> d!10501 (= c!7002 (and (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10501 (validMask!0 (mask!5886 (v!2353 (underlying!217 thiss!992))))))

(assert (=> d!10501 (= (getCurrentListMap!385 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))) lt!22521)))

(declare-fun b!56943 () Bool)

(declare-fun e!37531 () Bool)

(assert (=> b!56943 (= e!37531 (validKeyInArray!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!56944 () Bool)

(declare-fun e!37529 () Bool)

(assert (=> b!56944 (= e!37524 e!37529)))

(declare-fun c!7005 () Bool)

(assert (=> b!56944 (= c!7005 (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!56945 () Bool)

(declare-fun e!37521 () ListLongMap!1345)

(declare-fun call!4064 () ListLongMap!1345)

(assert (=> b!56945 (= e!37521 call!4064)))

(declare-fun b!56946 () Bool)

(declare-fun e!37526 () Bool)

(declare-fun call!4059 () Bool)

(assert (=> b!56946 (= e!37526 (not call!4059))))

(declare-fun bm!4057 () Bool)

(declare-fun call!4063 () Bool)

(assert (=> bm!4057 (= call!4063 (contains!675 lt!22521 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56947 () Bool)

(declare-fun e!37519 () Bool)

(declare-fun apply!64 (ListLongMap!1345 (_ BitVec 64)) V!2825)

(assert (=> b!56947 (= e!37519 (= (apply!64 lt!22521 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1934 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun bm!4058 () Bool)

(assert (=> bm!4058 (= call!4059 (contains!675 lt!22521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!4059 () Bool)

(declare-fun call!4065 () ListLongMap!1345)

(declare-fun call!4062 () ListLongMap!1345)

(assert (=> bm!4059 (= call!4065 call!4062)))

(declare-fun b!56948 () Bool)

(assert (=> b!56948 (= e!37529 e!37519)))

(declare-fun res!31949 () Bool)

(assert (=> b!56948 (= res!31949 call!4063)))

(assert (=> b!56948 (=> (not res!31949) (not e!37519))))

(declare-fun b!56949 () Bool)

(declare-fun e!37530 () ListLongMap!1345)

(assert (=> b!56949 (= e!37530 call!4065)))

(declare-fun b!56950 () Bool)

(declare-fun res!31955 () Bool)

(assert (=> b!56950 (=> (not res!31955) (not e!37524))))

(declare-fun e!37527 () Bool)

(assert (=> b!56950 (= res!31955 e!37527)))

(declare-fun res!31952 () Bool)

(assert (=> b!56950 (=> res!31952 e!37527)))

(assert (=> b!56950 (= res!31952 (not e!37531))))

(declare-fun res!31953 () Bool)

(assert (=> b!56950 (=> (not res!31953) (not e!37531))))

(assert (=> b!56950 (= res!31953 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun b!56951 () Bool)

(declare-fun res!31956 () Bool)

(assert (=> b!56951 (=> (not res!31956) (not e!37524))))

(assert (=> b!56951 (= res!31956 e!37526)))

(declare-fun c!7003 () Bool)

(assert (=> b!56951 (= c!7003 (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!56952 () Bool)

(declare-fun call!4060 () ListLongMap!1345)

(assert (=> b!56952 (= e!37522 (+!79 call!4060 (tuple2!2017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1934 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun bm!4060 () Bool)

(assert (=> bm!4060 (= call!4062 call!4061)))

(declare-fun c!7004 () Bool)

(declare-fun bm!4061 () Bool)

(assert (=> bm!4061 (= call!4060 (+!79 (ite c!7002 call!4061 (ite c!7004 call!4062 call!4065)) (ite (or c!7002 c!7004) (tuple2!2017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1934 (v!2353 (underlying!217 thiss!992)))) (tuple2!2017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1934 (v!2353 (underlying!217 thiss!992)))))))))

(declare-fun b!56953 () Bool)

(declare-fun e!37528 () Bool)

(assert (=> b!56953 (= e!37526 e!37528)))

(declare-fun res!31954 () Bool)

(assert (=> b!56953 (= res!31954 call!4059)))

(assert (=> b!56953 (=> (not res!31954) (not e!37528))))

(declare-fun b!56954 () Bool)

(assert (=> b!56954 (= e!37530 call!4064)))

(declare-fun e!37523 () Bool)

(declare-fun b!56955 () Bool)

(assert (=> b!56955 (= e!37523 (= (apply!64 lt!22521 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1060 (select (arr!1757 (_values!1999 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!304 (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!56955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1987 (_values!1999 (v!2353 (underlying!217 thiss!992))))))))

(assert (=> b!56955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun b!56956 () Bool)

(assert (=> b!56956 (= e!37522 e!37521)))

(assert (=> b!56956 (= c!7004 (and (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!56957 () Bool)

(declare-fun lt!22514 () Unit!1472)

(assert (=> b!56957 (= e!37525 lt!22514)))

(declare-fun lt!22517 () ListLongMap!1345)

(assert (=> b!56957 (= lt!22517 (getCurrentListMapNoExtraKeys!42 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun lt!22528 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22523 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22523 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22530 () Unit!1472)

(declare-fun addStillContains!40 (ListLongMap!1345 (_ BitVec 64) V!2825 (_ BitVec 64)) Unit!1472)

(assert (=> b!56957 (= lt!22530 (addStillContains!40 lt!22517 lt!22528 (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) lt!22523))))

(assert (=> b!56957 (contains!675 (+!79 lt!22517 (tuple2!2017 lt!22528 (zeroValue!1934 (v!2353 (underlying!217 thiss!992))))) lt!22523)))

(declare-fun lt!22518 () Unit!1472)

(assert (=> b!56957 (= lt!22518 lt!22530)))

(declare-fun lt!22525 () ListLongMap!1345)

(assert (=> b!56957 (= lt!22525 (getCurrentListMapNoExtraKeys!42 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun lt!22533 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22531 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22531 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22527 () Unit!1472)

(declare-fun addApplyDifferent!40 (ListLongMap!1345 (_ BitVec 64) V!2825 (_ BitVec 64)) Unit!1472)

(assert (=> b!56957 (= lt!22527 (addApplyDifferent!40 lt!22525 lt!22533 (minValue!1934 (v!2353 (underlying!217 thiss!992))) lt!22531))))

(assert (=> b!56957 (= (apply!64 (+!79 lt!22525 (tuple2!2017 lt!22533 (minValue!1934 (v!2353 (underlying!217 thiss!992))))) lt!22531) (apply!64 lt!22525 lt!22531))))

(declare-fun lt!22534 () Unit!1472)

(assert (=> b!56957 (= lt!22534 lt!22527)))

(declare-fun lt!22520 () ListLongMap!1345)

(assert (=> b!56957 (= lt!22520 (getCurrentListMapNoExtraKeys!42 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun lt!22519 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22532 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22532 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22516 () Unit!1472)

(assert (=> b!56957 (= lt!22516 (addApplyDifferent!40 lt!22520 lt!22519 (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) lt!22532))))

(assert (=> b!56957 (= (apply!64 (+!79 lt!22520 (tuple2!2017 lt!22519 (zeroValue!1934 (v!2353 (underlying!217 thiss!992))))) lt!22532) (apply!64 lt!22520 lt!22532))))

(declare-fun lt!22524 () Unit!1472)

(assert (=> b!56957 (= lt!22524 lt!22516)))

(declare-fun lt!22522 () ListLongMap!1345)

(assert (=> b!56957 (= lt!22522 (getCurrentListMapNoExtraKeys!42 (_keys!3635 (v!2353 (underlying!217 thiss!992))) (_values!1999 (v!2353 (underlying!217 thiss!992))) (mask!5886 (v!2353 (underlying!217 thiss!992))) (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) (zeroValue!1934 (v!2353 (underlying!217 thiss!992))) (minValue!1934 (v!2353 (underlying!217 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun lt!22535 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22535 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22529 () (_ BitVec 64))

(assert (=> b!56957 (= lt!22529 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!56957 (= lt!22514 (addApplyDifferent!40 lt!22522 lt!22535 (minValue!1934 (v!2353 (underlying!217 thiss!992))) lt!22529))))

(assert (=> b!56957 (= (apply!64 (+!79 lt!22522 (tuple2!2017 lt!22535 (minValue!1934 (v!2353 (underlying!217 thiss!992))))) lt!22529) (apply!64 lt!22522 lt!22529))))

(declare-fun bm!4062 () Bool)

(assert (=> bm!4062 (= call!4064 call!4060)))

(declare-fun b!56958 () Bool)

(declare-fun c!7006 () Bool)

(assert (=> b!56958 (= c!7006 (and (not (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1907 (v!2353 (underlying!217 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!56958 (= e!37521 e!37530)))

(declare-fun b!56959 () Bool)

(assert (=> b!56959 (= e!37520 (validKeyInArray!0 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!56960 () Bool)

(assert (=> b!56960 (= e!37527 e!37523)))

(declare-fun res!31950 () Bool)

(assert (=> b!56960 (=> (not res!31950) (not e!37523))))

(assert (=> b!56960 (= res!31950 (contains!675 lt!22521 (select (arr!1756 (_keys!3635 (v!2353 (underlying!217 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!56960 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1986 (_keys!3635 (v!2353 (underlying!217 thiss!992))))))))

(declare-fun b!56961 () Bool)

(assert (=> b!56961 (= e!37529 (not call!4063))))

(declare-fun b!56962 () Bool)

(assert (=> b!56962 (= e!37528 (= (apply!64 lt!22521 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1934 (v!2353 (underlying!217 thiss!992)))))))

(declare-fun b!56963 () Bool)

(declare-fun Unit!1483 () Unit!1472)

(assert (=> b!56963 (= e!37525 Unit!1483)))

(assert (= (and d!10501 c!7002) b!56952))

(assert (= (and d!10501 (not c!7002)) b!56956))

(assert (= (and b!56956 c!7004) b!56945))

(assert (= (and b!56956 (not c!7004)) b!56958))

(assert (= (and b!56958 c!7006) b!56954))

(assert (= (and b!56958 (not c!7006)) b!56949))

(assert (= (or b!56954 b!56949) bm!4059))

(assert (= (or b!56945 bm!4059) bm!4060))

(assert (= (or b!56945 b!56954) bm!4062))

(assert (= (or b!56952 bm!4060) bm!4056))

(assert (= (or b!56952 bm!4062) bm!4061))

(assert (= (and d!10501 res!31948) b!56959))

(assert (= (and d!10501 c!7007) b!56957))

(assert (= (and d!10501 (not c!7007)) b!56963))

(assert (= (and d!10501 res!31951) b!56950))

(assert (= (and b!56950 res!31953) b!56943))

(assert (= (and b!56950 (not res!31952)) b!56960))

(assert (= (and b!56960 res!31950) b!56955))

(assert (= (and b!56950 res!31955) b!56951))

(assert (= (and b!56951 c!7003) b!56953))

(assert (= (and b!56951 (not c!7003)) b!56946))

(assert (= (and b!56953 res!31954) b!56962))

(assert (= (or b!56953 b!56946) bm!4058))

(assert (= (and b!56951 res!31956) b!56944))

(assert (= (and b!56944 c!7005) b!56948))

(assert (= (and b!56944 (not c!7005)) b!56961))

(assert (= (and b!56948 res!31949) b!56947))

(assert (= (or b!56948 b!56961) bm!4057))

(declare-fun b_lambda!2489 () Bool)

(assert (=> (not b_lambda!2489) (not b!56955)))

(assert (=> b!56955 t!4724))

(declare-fun b_and!3433 () Bool)

(assert (= b_and!3413 (and (=> t!4724 result!2313) b_and!3433)))

(assert (=> b!56955 t!4726))

(declare-fun b_and!3435 () Bool)

(assert (= b_and!3415 (and (=> t!4726 result!2317) b_and!3435)))

(assert (=> b!56960 m!47761))

(assert (=> b!56960 m!47761))

(declare-fun m!47849 () Bool)

(assert (=> b!56960 m!47849))

(declare-fun m!47851 () Bool)

(assert (=> b!56957 m!47851))

(declare-fun m!47853 () Bool)

(assert (=> b!56957 m!47853))

(declare-fun m!47855 () Bool)

(assert (=> b!56957 m!47855))

(declare-fun m!47857 () Bool)

(assert (=> b!56957 m!47857))

(declare-fun m!47859 () Bool)

(assert (=> b!56957 m!47859))

(assert (=> b!56957 m!47855))

(declare-fun m!47861 () Bool)

(assert (=> b!56957 m!47861))

(declare-fun m!47863 () Bool)

(assert (=> b!56957 m!47863))

(declare-fun m!47865 () Bool)

(assert (=> b!56957 m!47865))

(declare-fun m!47867 () Bool)

(assert (=> b!56957 m!47867))

(declare-fun m!47869 () Bool)

(assert (=> b!56957 m!47869))

(assert (=> b!56957 m!47761))

(declare-fun m!47871 () Bool)

(assert (=> b!56957 m!47871))

(declare-fun m!47873 () Bool)

(assert (=> b!56957 m!47873))

(assert (=> b!56957 m!47851))

(declare-fun m!47875 () Bool)

(assert (=> b!56957 m!47875))

(assert (=> b!56957 m!47871))

(declare-fun m!47877 () Bool)

(assert (=> b!56957 m!47877))

(declare-fun m!47879 () Bool)

(assert (=> b!56957 m!47879))

(assert (=> b!56957 m!47859))

(declare-fun m!47881 () Bool)

(assert (=> b!56957 m!47881))

(declare-fun m!47883 () Bool)

(assert (=> bm!4058 m!47883))

(assert (=> b!56943 m!47761))

(assert (=> b!56943 m!47761))

(declare-fun m!47885 () Bool)

(assert (=> b!56943 m!47885))

(declare-fun m!47887 () Bool)

(assert (=> bm!4057 m!47887))

(declare-fun m!47889 () Bool)

(assert (=> b!56962 m!47889))

(declare-fun m!47891 () Bool)

(assert (=> b!56952 m!47891))

(assert (=> b!56959 m!47761))

(assert (=> b!56959 m!47761))

(assert (=> b!56959 m!47885))

(assert (=> b!56955 m!47653))

(declare-fun m!47893 () Bool)

(assert (=> b!56955 m!47893))

(assert (=> b!56955 m!47761))

(declare-fun m!47895 () Bool)

(assert (=> b!56955 m!47895))

(assert (=> b!56955 m!47893))

(assert (=> b!56955 m!47653))

(declare-fun m!47897 () Bool)

(assert (=> b!56955 m!47897))

(assert (=> b!56955 m!47761))

(assert (=> bm!4056 m!47863))

(declare-fun m!47899 () Bool)

(assert (=> b!56947 m!47899))

(declare-fun m!47901 () Bool)

(assert (=> bm!4061 m!47901))

(assert (=> d!10501 m!47637))

(assert (=> b!56604 d!10501))

(declare-fun mapNonEmpty!2835 () Bool)

(declare-fun mapRes!2835 () Bool)

(declare-fun tp!7929 () Bool)

(declare-fun e!37536 () Bool)

(assert (=> mapNonEmpty!2835 (= mapRes!2835 (and tp!7929 e!37536))))

(declare-fun mapValue!2835 () ValueCell!848)

(declare-fun mapKey!2835 () (_ BitVec 32))

(declare-fun mapRest!2835 () (Array (_ BitVec 32) ValueCell!848))

(assert (=> mapNonEmpty!2835 (= mapRest!2820 (store mapRest!2835 mapKey!2835 mapValue!2835))))

(declare-fun b!56970 () Bool)

(assert (=> b!56970 (= e!37536 tp_is_empty!2383)))

(declare-fun mapIsEmpty!2835 () Bool)

(assert (=> mapIsEmpty!2835 mapRes!2835))

(declare-fun b!56971 () Bool)

(declare-fun e!37537 () Bool)

(assert (=> b!56971 (= e!37537 tp_is_empty!2383)))

(declare-fun condMapEmpty!2835 () Bool)

(declare-fun mapDefault!2835 () ValueCell!848)

(assert (=> mapNonEmpty!2820 (= condMapEmpty!2835 (= mapRest!2820 ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2835)))))

(assert (=> mapNonEmpty!2820 (= tp!7901 (and e!37537 mapRes!2835))))

(assert (= (and mapNonEmpty!2820 condMapEmpty!2835) mapIsEmpty!2835))

(assert (= (and mapNonEmpty!2820 (not condMapEmpty!2835)) mapNonEmpty!2835))

(assert (= (and mapNonEmpty!2835 ((_ is ValueCellFull!848) mapValue!2835)) b!56970))

(assert (= (and mapNonEmpty!2820 ((_ is ValueCellFull!848) mapDefault!2835)) b!56971))

(declare-fun m!47903 () Bool)

(assert (=> mapNonEmpty!2835 m!47903))

(declare-fun mapNonEmpty!2836 () Bool)

(declare-fun mapRes!2836 () Bool)

(declare-fun tp!7930 () Bool)

(declare-fun e!37538 () Bool)

(assert (=> mapNonEmpty!2836 (= mapRes!2836 (and tp!7930 e!37538))))

(declare-fun mapKey!2836 () (_ BitVec 32))

(declare-fun mapRest!2836 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapValue!2836 () ValueCell!848)

(assert (=> mapNonEmpty!2836 (= mapRest!2819 (store mapRest!2836 mapKey!2836 mapValue!2836))))

(declare-fun b!56972 () Bool)

(assert (=> b!56972 (= e!37538 tp_is_empty!2383)))

(declare-fun mapIsEmpty!2836 () Bool)

(assert (=> mapIsEmpty!2836 mapRes!2836))

(declare-fun b!56973 () Bool)

(declare-fun e!37539 () Bool)

(assert (=> b!56973 (= e!37539 tp_is_empty!2383)))

(declare-fun condMapEmpty!2836 () Bool)

(declare-fun mapDefault!2836 () ValueCell!848)

(assert (=> mapNonEmpty!2819 (= condMapEmpty!2836 (= mapRest!2819 ((as const (Array (_ BitVec 32) ValueCell!848)) mapDefault!2836)))))

(assert (=> mapNonEmpty!2819 (= tp!7900 (and e!37539 mapRes!2836))))

(assert (= (and mapNonEmpty!2819 condMapEmpty!2836) mapIsEmpty!2836))

(assert (= (and mapNonEmpty!2819 (not condMapEmpty!2836)) mapNonEmpty!2836))

(assert (= (and mapNonEmpty!2836 ((_ is ValueCellFull!848) mapValue!2836)) b!56972))

(assert (= (and mapNonEmpty!2819 ((_ is ValueCellFull!848) mapDefault!2836)) b!56973))

(declare-fun m!47905 () Bool)

(assert (=> mapNonEmpty!2836 m!47905))

(declare-fun b_lambda!2491 () Bool)

(assert (= b_lambda!2489 (or (and b!56603 b_free!1933) (and b!56605 b_free!1935 (= (defaultEntry!2016 newMap!16) (defaultEntry!2016 (v!2353 (underlying!217 thiss!992))))) b_lambda!2491)))

(check-sat (not b!56740) (not b!56885) (not bm!4039) (not b!56955) (not b_lambda!2491) (not d!10499) (not b!56882) (not bm!4033) (not b!56959) (not bm!3969) (not d!10495) (not bm!4032) (not b_lambda!2487) (not b!56947) (not b_next!1935) (not bm!4061) (not b!56957) (not bm!4021) (not b!56868) b_and!3435 (not b!56754) (not bm!4027) (not b!56872) (not b!56962) (not bm!4058) (not mapNonEmpty!2836) (not d!10481) (not b!56752) b_and!3433 (not b!56735) (not b!56774) (not d!10493) (not bm!4029) (not bm!4057) (not b!56899) (not b!56880) (not b!56756) (not b!56943) (not b!56764) (not d!10477) (not b!56900) (not b!56772) tp_is_empty!2383 (not bm!4031) (not bm!4056) (not b!56875) (not b!56763) (not mapNonEmpty!2835) (not d!10501) (not bm!4025) (not b!56952) (not bm!4018) (not b_next!1933) (not d!10475) (not b!56765) (not d!10485) (not b!56960) (not bm!4041) (not b!56857) (not bm!4019) (not bm!4026) (not d!10473))
(check-sat b_and!3433 b_and!3435 (not b_next!1933) (not b_next!1935))
