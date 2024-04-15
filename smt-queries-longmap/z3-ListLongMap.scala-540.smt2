; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13828 () Bool)

(assert start!13828)

(declare-fun b!127723 () Bool)

(declare-fun b_free!2869 () Bool)

(declare-fun b_next!2869 () Bool)

(assert (=> b!127723 (= b_free!2869 (not b_next!2869))))

(declare-fun tp!11024 () Bool)

(declare-fun b_and!7869 () Bool)

(assert (=> b!127723 (= tp!11024 b_and!7869)))

(declare-fun b!127731 () Bool)

(declare-fun b_free!2871 () Bool)

(declare-fun b_next!2871 () Bool)

(assert (=> b!127731 (= b_free!2871 (not b_next!2871))))

(declare-fun tp!11022 () Bool)

(declare-fun b_and!7871 () Bool)

(assert (=> b!127731 (= tp!11022 b_and!7871)))

(declare-fun b!127721 () Bool)

(declare-fun e!83405 () Bool)

(declare-fun tp_is_empty!2851 () Bool)

(assert (=> b!127721 (= e!83405 tp_is_empty!2851)))

(declare-fun b!127722 () Bool)

(declare-fun e!83411 () Bool)

(declare-fun e!83399 () Bool)

(assert (=> b!127722 (= e!83411 e!83399)))

(declare-datatypes ((V!3449 0))(
  ( (V!3450 (val!1470 Int)) )
))
(declare-datatypes ((array!4701 0))(
  ( (array!4702 (arr!2224 (Array (_ BitVec 32) (_ BitVec 64))) (size!2490 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1082 0))(
  ( (ValueCellFull!1082 (v!3137 V!3449)) (EmptyCell!1082) )
))
(declare-datatypes ((array!4703 0))(
  ( (array!4704 (arr!2225 (Array (_ BitVec 32) ValueCell!1082)) (size!2491 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1072 0))(
  ( (LongMapFixedSize!1073 (defaultEntry!2804 Int) (mask!7071 (_ BitVec 32)) (extraKeys!2581 (_ BitVec 32)) (zeroValue!2665 V!3449) (minValue!2665 V!3449) (_size!585 (_ BitVec 32)) (_keys!4540 array!4701) (_values!2787 array!4703) (_vacant!585 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!858 0))(
  ( (Cell!859 (v!3138 LongMapFixedSize!1072)) )
))
(declare-datatypes ((LongMap!858 0))(
  ( (LongMap!859 (underlying!440 Cell!858)) )
))
(declare-fun thiss!992 () LongMap!858)

(declare-fun e!83408 () Bool)

(declare-fun array_inv!1415 (array!4701) Bool)

(declare-fun array_inv!1416 (array!4703) Bool)

(assert (=> b!127723 (= e!83399 (and tp!11024 tp_is_empty!2851 (array_inv!1415 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (array_inv!1416 (_values!2787 (v!3138 (underlying!440 thiss!992)))) e!83408))))

(declare-fun b!127724 () Bool)

(declare-fun e!83403 () Bool)

(declare-fun mapRes!4538 () Bool)

(assert (=> b!127724 (= e!83403 (and e!83405 mapRes!4538))))

(declare-fun condMapEmpty!4537 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1072)

(declare-fun mapDefault!4538 () ValueCell!1082)

(assert (=> b!127724 (= condMapEmpty!4537 (= (arr!2225 (_values!2787 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4538)))))

(declare-fun b!127725 () Bool)

(declare-fun e!83398 () Bool)

(assert (=> b!127725 (= e!83398 (and (= (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7071 (v!3138 (underlying!440 thiss!992))))) (= (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992))))) (bvsge (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun res!61689 () Bool)

(declare-fun e!83401 () Bool)

(assert (=> start!13828 (=> (not res!61689) (not e!83401))))

(declare-fun valid!518 (LongMap!858) Bool)

(assert (=> start!13828 (= res!61689 (valid!518 thiss!992))))

(assert (=> start!13828 e!83401))

(declare-fun e!83402 () Bool)

(assert (=> start!13828 e!83402))

(assert (=> start!13828 true))

(declare-fun e!83406 () Bool)

(assert (=> start!13828 e!83406))

(declare-fun b!127726 () Bool)

(declare-fun e!83404 () Bool)

(assert (=> b!127726 (= e!83404 tp_is_empty!2851)))

(declare-fun b!127727 () Bool)

(declare-fun e!83410 () Bool)

(assert (=> b!127727 (= e!83410 tp_is_empty!2851)))

(declare-fun b!127728 () Bool)

(declare-fun e!83407 () Bool)

(assert (=> b!127728 (= e!83401 e!83407)))

(declare-fun res!61687 () Bool)

(assert (=> b!127728 (=> (not res!61687) (not e!83407))))

(declare-datatypes ((tuple2!2560 0))(
  ( (tuple2!2561 (_1!1291 (_ BitVec 64)) (_2!1291 V!3449)) )
))
(declare-datatypes ((List!1698 0))(
  ( (Nil!1695) (Cons!1694 (h!2297 tuple2!2560) (t!6068 List!1698)) )
))
(declare-datatypes ((ListLongMap!1657 0))(
  ( (ListLongMap!1658 (toList!844 List!1698)) )
))
(declare-fun lt!65981 () ListLongMap!1657)

(declare-fun lt!65980 () ListLongMap!1657)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!127728 (= res!61687 (and (= lt!65980 lt!65981) (not (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1377 (LongMapFixedSize!1072) ListLongMap!1657)

(assert (=> b!127728 (= lt!65981 (map!1377 newMap!16))))

(declare-fun getCurrentListMap!513 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) ListLongMap!1657)

(assert (=> b!127728 (= lt!65980 (getCurrentListMap!513 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun mapNonEmpty!4537 () Bool)

(declare-fun tp!11021 () Bool)

(assert (=> mapNonEmpty!4537 (= mapRes!4538 (and tp!11021 e!83404))))

(declare-fun mapKey!4538 () (_ BitVec 32))

(declare-fun mapRest!4537 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapValue!4538 () ValueCell!1082)

(assert (=> mapNonEmpty!4537 (= (arr!2225 (_values!2787 newMap!16)) (store mapRest!4537 mapKey!4538 mapValue!4538))))

(declare-fun b!127729 () Bool)

(declare-fun mapRes!4537 () Bool)

(assert (=> b!127729 (= e!83408 (and e!83410 mapRes!4537))))

(declare-fun condMapEmpty!4538 () Bool)

(declare-fun mapDefault!4537 () ValueCell!1082)

(assert (=> b!127729 (= condMapEmpty!4538 (= (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4537)))))

(declare-fun mapIsEmpty!4537 () Bool)

(assert (=> mapIsEmpty!4537 mapRes!4537))

(declare-fun b!127730 () Bool)

(declare-fun res!61692 () Bool)

(assert (=> b!127730 (=> (not res!61692) (not e!83401))))

(assert (=> b!127730 (= res!61692 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!127731 (= e!83406 (and tp!11022 tp_is_empty!2851 (array_inv!1415 (_keys!4540 newMap!16)) (array_inv!1416 (_values!2787 newMap!16)) e!83403))))

(declare-fun b!127732 () Bool)

(declare-fun res!61693 () Bool)

(assert (=> b!127732 (=> (not res!61693) (not e!83401))))

(declare-fun valid!519 (LongMapFixedSize!1072) Bool)

(assert (=> b!127732 (= res!61693 (valid!519 newMap!16))))

(declare-fun mapIsEmpty!4538 () Bool)

(assert (=> mapIsEmpty!4538 mapRes!4538))

(declare-fun b!127733 () Bool)

(assert (=> b!127733 (= e!83402 e!83411)))

(declare-fun b!127734 () Bool)

(declare-fun res!61690 () Bool)

(assert (=> b!127734 (=> (not res!61690) (not e!83401))))

(assert (=> b!127734 (= res!61690 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7071 newMap!16)) (_size!585 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun mapNonEmpty!4538 () Bool)

(declare-fun tp!11023 () Bool)

(declare-fun e!83409 () Bool)

(assert (=> mapNonEmpty!4538 (= mapRes!4537 (and tp!11023 e!83409))))

(declare-fun mapValue!4537 () ValueCell!1082)

(declare-fun mapKey!4537 () (_ BitVec 32))

(declare-fun mapRest!4538 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4538 (= (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (store mapRest!4538 mapKey!4537 mapValue!4537))))

(declare-fun b!127735 () Bool)

(declare-fun res!61688 () Bool)

(assert (=> b!127735 (=> (not res!61688) (not e!83398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127735 (= res!61688 (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!127736 () Bool)

(assert (=> b!127736 (= e!83409 tp_is_empty!2851)))

(declare-fun b!127737 () Bool)

(assert (=> b!127737 (= e!83407 e!83398)))

(declare-fun res!61691 () Bool)

(assert (=> b!127737 (=> (not res!61691) (not e!83398))))

(declare-fun contains!873 (ListLongMap!1657 (_ BitVec 64)) Bool)

(assert (=> b!127737 (= res!61691 (contains!873 lt!65981 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2562 0))(
  ( (tuple2!2563 (_1!1292 Bool) (_2!1292 LongMapFixedSize!1072)) )
))
(declare-fun lt!65982 () tuple2!2562)

(declare-fun update!187 (LongMapFixedSize!1072 (_ BitVec 64) V!3449) tuple2!2562)

(declare-fun get!1453 (ValueCell!1082 V!3449) V!3449)

(declare-fun dynLambda!413 (Int (_ BitVec 64)) V!3449)

(assert (=> b!127737 (= lt!65982 (update!187 newMap!16 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!13828 res!61689) b!127730))

(assert (= (and b!127730 res!61692) b!127732))

(assert (= (and b!127732 res!61693) b!127734))

(assert (= (and b!127734 res!61690) b!127728))

(assert (= (and b!127728 res!61687) b!127737))

(assert (= (and b!127737 res!61691) b!127735))

(assert (= (and b!127735 res!61688) b!127725))

(assert (= (and b!127729 condMapEmpty!4538) mapIsEmpty!4537))

(assert (= (and b!127729 (not condMapEmpty!4538)) mapNonEmpty!4538))

(get-info :version)

(assert (= (and mapNonEmpty!4538 ((_ is ValueCellFull!1082) mapValue!4537)) b!127736))

(assert (= (and b!127729 ((_ is ValueCellFull!1082) mapDefault!4537)) b!127727))

(assert (= b!127723 b!127729))

(assert (= b!127722 b!127723))

(assert (= b!127733 b!127722))

(assert (= start!13828 b!127733))

(assert (= (and b!127724 condMapEmpty!4537) mapIsEmpty!4538))

(assert (= (and b!127724 (not condMapEmpty!4537)) mapNonEmpty!4537))

(assert (= (and mapNonEmpty!4537 ((_ is ValueCellFull!1082) mapValue!4538)) b!127726))

(assert (= (and b!127724 ((_ is ValueCellFull!1082) mapDefault!4538)) b!127721))

(assert (= b!127731 b!127724))

(assert (= start!13828 b!127731))

(declare-fun b_lambda!5641 () Bool)

(assert (=> (not b_lambda!5641) (not b!127737)))

(declare-fun t!6065 () Bool)

(declare-fun tb!2333 () Bool)

(assert (=> (and b!127723 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))) t!6065) tb!2333))

(declare-fun result!3869 () Bool)

(assert (=> tb!2333 (= result!3869 tp_is_empty!2851)))

(assert (=> b!127737 t!6065))

(declare-fun b_and!7873 () Bool)

(assert (= b_and!7869 (and (=> t!6065 result!3869) b_and!7873)))

(declare-fun t!6067 () Bool)

(declare-fun tb!2335 () Bool)

(assert (=> (and b!127731 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))) t!6067) tb!2335))

(declare-fun result!3873 () Bool)

(assert (= result!3873 result!3869))

(assert (=> b!127737 t!6067))

(declare-fun b_and!7875 () Bool)

(assert (= b_and!7871 (and (=> t!6067 result!3873) b_and!7875)))

(declare-fun m!149335 () Bool)

(assert (=> mapNonEmpty!4537 m!149335))

(declare-fun m!149337 () Bool)

(assert (=> b!127735 m!149337))

(declare-fun m!149339 () Bool)

(assert (=> b!127737 m!149339))

(declare-fun m!149341 () Bool)

(assert (=> b!127737 m!149341))

(declare-fun m!149343 () Bool)

(assert (=> b!127737 m!149343))

(declare-fun m!149345 () Bool)

(assert (=> b!127737 m!149345))

(declare-fun m!149347 () Bool)

(assert (=> b!127737 m!149347))

(assert (=> b!127737 m!149345))

(assert (=> b!127737 m!149341))

(assert (=> b!127737 m!149345))

(assert (=> b!127737 m!149343))

(declare-fun m!149349 () Bool)

(assert (=> b!127737 m!149349))

(assert (=> b!127737 m!149339))

(declare-fun m!149351 () Bool)

(assert (=> b!127731 m!149351))

(declare-fun m!149353 () Bool)

(assert (=> b!127731 m!149353))

(declare-fun m!149355 () Bool)

(assert (=> start!13828 m!149355))

(declare-fun m!149357 () Bool)

(assert (=> b!127732 m!149357))

(assert (=> b!127728 m!149345))

(declare-fun m!149359 () Bool)

(assert (=> b!127728 m!149359))

(declare-fun m!149361 () Bool)

(assert (=> b!127728 m!149361))

(declare-fun m!149363 () Bool)

(assert (=> b!127723 m!149363))

(declare-fun m!149365 () Bool)

(assert (=> b!127723 m!149365))

(declare-fun m!149367 () Bool)

(assert (=> mapNonEmpty!4538 m!149367))

(check-sat (not start!13828) b_and!7873 (not b_next!2871) (not b_next!2869) (not b!127737) (not b!127728) tp_is_empty!2851 (not mapNonEmpty!4537) (not b!127723) (not b_lambda!5641) (not mapNonEmpty!4538) (not b!127732) b_and!7875 (not b!127731) (not b!127735))
(check-sat b_and!7873 b_and!7875 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun b_lambda!5647 () Bool)

(assert (= b_lambda!5641 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5647)))

(check-sat (not start!13828) b_and!7873 (not b_next!2871) (not b_next!2869) (not b!127737) (not b!127728) tp_is_empty!2851 (not mapNonEmpty!4537) (not mapNonEmpty!4538) (not b!127732) b_and!7875 (not b!127731) (not b!127735) (not b_lambda!5647) (not b!127723))
(check-sat b_and!7873 b_and!7875 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun d!38669 () Bool)

(assert (=> d!38669 (= (array_inv!1415 (_keys!4540 newMap!16)) (bvsge (size!2490 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127731 d!38669))

(declare-fun d!38671 () Bool)

(assert (=> d!38671 (= (array_inv!1416 (_values!2787 newMap!16)) (bvsge (size!2491 (_values!2787 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127731 d!38671))

(declare-fun d!38673 () Bool)

(assert (=> d!38673 (= (map!1377 newMap!16) (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun bs!5290 () Bool)

(assert (= bs!5290 d!38673))

(declare-fun m!149437 () Bool)

(assert (=> bs!5290 m!149437))

(assert (=> b!127728 d!38673))

(declare-fun bm!13754 () Bool)

(declare-fun call!13760 () Bool)

(declare-fun lt!66050 () ListLongMap!1657)

(assert (=> bm!13754 (= call!13760 (contains!873 lt!66050 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13755 () Bool)

(declare-fun call!13761 () ListLongMap!1657)

(declare-fun call!13763 () ListLongMap!1657)

(assert (=> bm!13755 (= call!13761 call!13763)))

(declare-fun b!127888 () Bool)

(declare-datatypes ((Unit!3980 0))(
  ( (Unit!3981) )
))
(declare-fun e!83532 () Unit!3980)

(declare-fun Unit!3982 () Unit!3980)

(assert (=> b!127888 (= e!83532 Unit!3982)))

(declare-fun b!127889 () Bool)

(declare-fun e!83530 () Bool)

(declare-fun call!13762 () Bool)

(assert (=> b!127889 (= e!83530 (not call!13762))))

(declare-fun b!127890 () Bool)

(declare-fun e!83537 () Bool)

(assert (=> b!127890 (= e!83530 e!83537)))

(declare-fun res!61755 () Bool)

(assert (=> b!127890 (= res!61755 call!13762)))

(assert (=> b!127890 (=> (not res!61755) (not e!83537))))

(declare-fun b!127891 () Bool)

(declare-fun res!61754 () Bool)

(declare-fun e!83536 () Bool)

(assert (=> b!127891 (=> (not res!61754) (not e!83536))))

(declare-fun e!83529 () Bool)

(assert (=> b!127891 (= res!61754 e!83529)))

(declare-fun res!61761 () Bool)

(assert (=> b!127891 (=> res!61761 e!83529)))

(declare-fun e!83538 () Bool)

(assert (=> b!127891 (= res!61761 (not e!83538))))

(declare-fun res!61756 () Bool)

(assert (=> b!127891 (=> (not res!61756) (not e!83538))))

(assert (=> b!127891 (= res!61756 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!127892 () Bool)

(declare-fun e!83540 () ListLongMap!1657)

(declare-fun e!83528 () ListLongMap!1657)

(assert (=> b!127892 (= e!83540 e!83528)))

(declare-fun c!23429 () Bool)

(assert (=> b!127892 (= c!23429 (and (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127893 () Bool)

(declare-fun e!83533 () Bool)

(assert (=> b!127893 (= e!83533 (not call!13760))))

(declare-fun d!38675 () Bool)

(assert (=> d!38675 e!83536))

(declare-fun res!61760 () Bool)

(assert (=> d!38675 (=> (not res!61760) (not e!83536))))

(assert (=> d!38675 (= res!61760 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun lt!66047 () ListLongMap!1657)

(assert (=> d!38675 (= lt!66050 lt!66047)))

(declare-fun lt!66059 () Unit!3980)

(assert (=> d!38675 (= lt!66059 e!83532)))

(declare-fun c!23428 () Bool)

(declare-fun e!83531 () Bool)

(assert (=> d!38675 (= c!23428 e!83531)))

(declare-fun res!61758 () Bool)

(assert (=> d!38675 (=> (not res!61758) (not e!83531))))

(assert (=> d!38675 (= res!61758 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38675 (= lt!66047 e!83540)))

(declare-fun c!23427 () Bool)

(assert (=> d!38675 (= c!23427 (and (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38675 (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992))))))

(assert (=> d!38675 (= (getCurrentListMap!513 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))) lt!66050)))

(declare-fun b!127894 () Bool)

(assert (=> b!127894 (= e!83528 call!13761)))

(declare-fun e!83539 () Bool)

(declare-fun b!127895 () Bool)

(declare-fun apply!112 (ListLongMap!1657 (_ BitVec 64)) V!3449)

(assert (=> b!127895 (= e!83539 (= (apply!112 lt!66050 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127895 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> b!127895 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!127896 () Bool)

(declare-fun +!159 (ListLongMap!1657 tuple2!2560) ListLongMap!1657)

(assert (=> b!127896 (= e!83540 (+!159 call!13763 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!127897 () Bool)

(assert (=> b!127897 (= e!83536 e!83533)))

(declare-fun c!23431 () Bool)

(assert (=> b!127897 (= c!23431 (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127898 () Bool)

(declare-fun e!83534 () ListLongMap!1657)

(assert (=> b!127898 (= e!83534 call!13761)))

(declare-fun bm!13756 () Bool)

(declare-fun call!13758 () ListLongMap!1657)

(declare-fun call!13759 () ListLongMap!1657)

(assert (=> bm!13756 (= call!13758 call!13759)))

(declare-fun bm!13757 () Bool)

(declare-fun call!13757 () ListLongMap!1657)

(assert (=> bm!13757 (= call!13763 (+!159 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!127899 () Bool)

(declare-fun e!83535 () Bool)

(assert (=> b!127899 (= e!83535 (= (apply!112 lt!66050 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!127900 () Bool)

(assert (=> b!127900 (= e!83534 call!13757)))

(declare-fun b!127901 () Bool)

(assert (=> b!127901 (= e!83537 (= (apply!112 lt!66050 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!127902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!127902 (= e!83538 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13758 () Bool)

(assert (=> bm!13758 (= call!13757 call!13758)))

(declare-fun bm!13759 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!124 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) ListLongMap!1657)

(assert (=> bm!13759 (= call!13759 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!127903 () Bool)

(assert (=> b!127903 (= e!83529 e!83539)))

(declare-fun res!61757 () Bool)

(assert (=> b!127903 (=> (not res!61757) (not e!83539))))

(assert (=> b!127903 (= res!61757 (contains!873 lt!66050 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127903 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun bm!13760 () Bool)

(assert (=> bm!13760 (= call!13762 (contains!873 lt!66050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127904 () Bool)

(assert (=> b!127904 (= e!83531 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127905 () Bool)

(assert (=> b!127905 (= e!83533 e!83535)))

(declare-fun res!61759 () Bool)

(assert (=> b!127905 (= res!61759 call!13760)))

(assert (=> b!127905 (=> (not res!61759) (not e!83535))))

(declare-fun b!127906 () Bool)

(declare-fun res!61762 () Bool)

(assert (=> b!127906 (=> (not res!61762) (not e!83536))))

(assert (=> b!127906 (= res!61762 e!83530)))

(declare-fun c!23432 () Bool)

(assert (=> b!127906 (= c!23432 (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127907 () Bool)

(declare-fun c!23430 () Bool)

(assert (=> b!127907 (= c!23430 (and (not (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!127907 (= e!83528 e!83534)))

(declare-fun b!127908 () Bool)

(declare-fun lt!66055 () Unit!3980)

(assert (=> b!127908 (= e!83532 lt!66055)))

(declare-fun lt!66056 () ListLongMap!1657)

(assert (=> b!127908 (= lt!66056 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun lt!66054 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66061 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66061 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66051 () Unit!3980)

(declare-fun addStillContains!88 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> b!127908 (= lt!66051 (addStillContains!88 lt!66056 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66061))))

(assert (=> b!127908 (contains!873 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66061)))

(declare-fun lt!66046 () Unit!3980)

(assert (=> b!127908 (= lt!66046 lt!66051)))

(declare-fun lt!66052 () ListLongMap!1657)

(assert (=> b!127908 (= lt!66052 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun lt!66048 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66048 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66058 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66058 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66066 () Unit!3980)

(declare-fun addApplyDifferent!88 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> b!127908 (= lt!66066 (addApplyDifferent!88 lt!66052 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66058))))

(assert (=> b!127908 (= (apply!112 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66058) (apply!112 lt!66052 lt!66058))))

(declare-fun lt!66062 () Unit!3980)

(assert (=> b!127908 (= lt!66062 lt!66066)))

(declare-fun lt!66065 () ListLongMap!1657)

(assert (=> b!127908 (= lt!66065 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun lt!66060 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66045 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66045 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66049 () Unit!3980)

(assert (=> b!127908 (= lt!66049 (addApplyDifferent!88 lt!66065 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66045))))

(assert (=> b!127908 (= (apply!112 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66045) (apply!112 lt!66065 lt!66045))))

(declare-fun lt!66057 () Unit!3980)

(assert (=> b!127908 (= lt!66057 lt!66049)))

(declare-fun lt!66063 () ListLongMap!1657)

(assert (=> b!127908 (= lt!66063 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun lt!66064 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66064 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66053 () (_ BitVec 64))

(assert (=> b!127908 (= lt!66053 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!127908 (= lt!66055 (addApplyDifferent!88 lt!66063 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66053))))

(assert (=> b!127908 (= (apply!112 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66053) (apply!112 lt!66063 lt!66053))))

(assert (= (and d!38675 c!23427) b!127896))

(assert (= (and d!38675 (not c!23427)) b!127892))

(assert (= (and b!127892 c!23429) b!127894))

(assert (= (and b!127892 (not c!23429)) b!127907))

(assert (= (and b!127907 c!23430) b!127898))

(assert (= (and b!127907 (not c!23430)) b!127900))

(assert (= (or b!127898 b!127900) bm!13758))

(assert (= (or b!127894 bm!13758) bm!13756))

(assert (= (or b!127894 b!127898) bm!13755))

(assert (= (or b!127896 bm!13756) bm!13759))

(assert (= (or b!127896 bm!13755) bm!13757))

(assert (= (and d!38675 res!61758) b!127904))

(assert (= (and d!38675 c!23428) b!127908))

(assert (= (and d!38675 (not c!23428)) b!127888))

(assert (= (and d!38675 res!61760) b!127891))

(assert (= (and b!127891 res!61756) b!127902))

(assert (= (and b!127891 (not res!61761)) b!127903))

(assert (= (and b!127903 res!61757) b!127895))

(assert (= (and b!127891 res!61754) b!127906))

(assert (= (and b!127906 c!23432) b!127890))

(assert (= (and b!127906 (not c!23432)) b!127889))

(assert (= (and b!127890 res!61755) b!127901))

(assert (= (or b!127890 b!127889) bm!13760))

(assert (= (and b!127906 res!61762) b!127897))

(assert (= (and b!127897 c!23431) b!127905))

(assert (= (and b!127897 (not c!23431)) b!127893))

(assert (= (and b!127905 res!61759) b!127899))

(assert (= (or b!127905 b!127893) bm!13754))

(declare-fun b_lambda!5649 () Bool)

(assert (=> (not b_lambda!5649) (not b!127895)))

(assert (=> b!127895 t!6065))

(declare-fun b_and!7893 () Bool)

(assert (= b_and!7873 (and (=> t!6065 result!3869) b_and!7893)))

(assert (=> b!127895 t!6067))

(declare-fun b_and!7895 () Bool)

(assert (= b_and!7875 (and (=> t!6067 result!3873) b_and!7895)))

(declare-fun m!149439 () Bool)

(assert (=> bm!13760 m!149439))

(declare-fun m!149441 () Bool)

(assert (=> b!127901 m!149441))

(assert (=> b!127895 m!149341))

(declare-fun m!149443 () Bool)

(assert (=> b!127895 m!149443))

(assert (=> b!127895 m!149341))

(declare-fun m!149445 () Bool)

(assert (=> b!127895 m!149445))

(declare-fun m!149447 () Bool)

(assert (=> b!127895 m!149447))

(declare-fun m!149449 () Bool)

(assert (=> b!127895 m!149449))

(assert (=> b!127895 m!149443))

(assert (=> b!127895 m!149447))

(declare-fun m!149451 () Bool)

(assert (=> bm!13754 m!149451))

(assert (=> d!38675 m!149337))

(declare-fun m!149453 () Bool)

(assert (=> b!127908 m!149453))

(declare-fun m!149455 () Bool)

(assert (=> b!127908 m!149455))

(declare-fun m!149457 () Bool)

(assert (=> b!127908 m!149457))

(declare-fun m!149459 () Bool)

(assert (=> b!127908 m!149459))

(declare-fun m!149461 () Bool)

(assert (=> b!127908 m!149461))

(declare-fun m!149463 () Bool)

(assert (=> b!127908 m!149463))

(assert (=> b!127908 m!149453))

(declare-fun m!149465 () Bool)

(assert (=> b!127908 m!149465))

(declare-fun m!149467 () Bool)

(assert (=> b!127908 m!149467))

(declare-fun m!149469 () Bool)

(assert (=> b!127908 m!149469))

(assert (=> b!127908 m!149447))

(declare-fun m!149471 () Bool)

(assert (=> b!127908 m!149471))

(declare-fun m!149473 () Bool)

(assert (=> b!127908 m!149473))

(declare-fun m!149475 () Bool)

(assert (=> b!127908 m!149475))

(assert (=> b!127908 m!149471))

(assert (=> b!127908 m!149459))

(declare-fun m!149477 () Bool)

(assert (=> b!127908 m!149477))

(declare-fun m!149479 () Bool)

(assert (=> b!127908 m!149479))

(declare-fun m!149481 () Bool)

(assert (=> b!127908 m!149481))

(assert (=> b!127908 m!149479))

(declare-fun m!149483 () Bool)

(assert (=> b!127908 m!149483))

(assert (=> b!127903 m!149447))

(assert (=> b!127903 m!149447))

(declare-fun m!149485 () Bool)

(assert (=> b!127903 m!149485))

(declare-fun m!149487 () Bool)

(assert (=> bm!13757 m!149487))

(assert (=> b!127904 m!149447))

(assert (=> b!127904 m!149447))

(declare-fun m!149489 () Bool)

(assert (=> b!127904 m!149489))

(assert (=> b!127902 m!149447))

(assert (=> b!127902 m!149447))

(assert (=> b!127902 m!149489))

(declare-fun m!149491 () Bool)

(assert (=> b!127899 m!149491))

(declare-fun m!149493 () Bool)

(assert (=> b!127896 m!149493))

(assert (=> bm!13759 m!149481))

(assert (=> b!127728 d!38675))

(declare-fun d!38677 () Bool)

(assert (=> d!38677 (= (valid!518 thiss!992) (valid!519 (v!3138 (underlying!440 thiss!992))))))

(declare-fun bs!5291 () Bool)

(assert (= bs!5291 d!38677))

(declare-fun m!149495 () Bool)

(assert (=> bs!5291 m!149495))

(assert (=> start!13828 d!38677))

(declare-fun d!38679 () Bool)

(assert (=> d!38679 (= (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992)))) (and (or (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000001111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000011111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000001111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000011111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000001111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000011111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000001111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000011111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000001111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000011111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000001111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000011111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000001111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000011111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000001111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000011111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000111111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00001111111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00011111111111111111111111111111) (= (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!127735 d!38679))

(declare-fun d!38681 () Bool)

(assert (=> d!38681 (= (array_inv!1415 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvsge (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127723 d!38681))

(declare-fun d!38683 () Bool)

(assert (=> d!38683 (= (array_inv!1416 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvsge (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127723 d!38683))

(declare-fun d!38685 () Bool)

(declare-fun res!61769 () Bool)

(declare-fun e!83543 () Bool)

(assert (=> d!38685 (=> (not res!61769) (not e!83543))))

(declare-fun simpleValid!88 (LongMapFixedSize!1072) Bool)

(assert (=> d!38685 (= res!61769 (simpleValid!88 newMap!16))))

(assert (=> d!38685 (= (valid!519 newMap!16) e!83543)))

(declare-fun b!127915 () Bool)

(declare-fun res!61770 () Bool)

(assert (=> b!127915 (=> (not res!61770) (not e!83543))))

(declare-fun arrayCountValidKeys!0 (array!4701 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!127915 (= res!61770 (= (arrayCountValidKeys!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (_size!585 newMap!16)))))

(declare-fun b!127916 () Bool)

(declare-fun res!61771 () Bool)

(assert (=> b!127916 (=> (not res!61771) (not e!83543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4701 (_ BitVec 32)) Bool)

(assert (=> b!127916 (= res!61771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!127917 () Bool)

(declare-datatypes ((List!1700 0))(
  ( (Nil!1697) (Cons!1696 (h!2299 (_ BitVec 64)) (t!6078 List!1700)) )
))
(declare-fun arrayNoDuplicates!0 (array!4701 (_ BitVec 32) List!1700) Bool)

(assert (=> b!127917 (= e!83543 (arrayNoDuplicates!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38685 res!61769) b!127915))

(assert (= (and b!127915 res!61770) b!127916))

(assert (= (and b!127916 res!61771) b!127917))

(declare-fun m!149497 () Bool)

(assert (=> d!38685 m!149497))

(declare-fun m!149499 () Bool)

(assert (=> b!127915 m!149499))

(declare-fun m!149501 () Bool)

(assert (=> b!127916 m!149501))

(declare-fun m!149503 () Bool)

(assert (=> b!127917 m!149503))

(assert (=> b!127732 d!38685))

(declare-fun d!38687 () Bool)

(declare-fun e!83549 () Bool)

(assert (=> d!38687 e!83549))

(declare-fun res!61774 () Bool)

(assert (=> d!38687 (=> res!61774 e!83549)))

(declare-fun lt!66077 () Bool)

(assert (=> d!38687 (= res!61774 (not lt!66077))))

(declare-fun lt!66078 () Bool)

(assert (=> d!38687 (= lt!66077 lt!66078)))

(declare-fun lt!66076 () Unit!3980)

(declare-fun e!83548 () Unit!3980)

(assert (=> d!38687 (= lt!66076 e!83548)))

(declare-fun c!23435 () Bool)

(assert (=> d!38687 (= c!23435 lt!66078)))

(declare-fun containsKey!170 (List!1698 (_ BitVec 64)) Bool)

(assert (=> d!38687 (= lt!66078 (containsKey!170 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38687 (= (contains!873 lt!65981 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66077)))

(declare-fun b!127924 () Bool)

(declare-fun lt!66075 () Unit!3980)

(assert (=> b!127924 (= e!83548 lt!66075)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!119 (List!1698 (_ BitVec 64)) Unit!3980)

(assert (=> b!127924 (= lt!66075 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-datatypes ((Option!172 0))(
  ( (Some!171 (v!3143 V!3449)) (None!170) )
))
(declare-fun isDefined!120 (Option!172) Bool)

(declare-fun getValueByKey!166 (List!1698 (_ BitVec 64)) Option!172)

(assert (=> b!127924 (isDefined!120 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!127925 () Bool)

(declare-fun Unit!3983 () Unit!3980)

(assert (=> b!127925 (= e!83548 Unit!3983)))

(declare-fun b!127926 () Bool)

(assert (=> b!127926 (= e!83549 (isDefined!120 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (= (and d!38687 c!23435) b!127924))

(assert (= (and d!38687 (not c!23435)) b!127925))

(assert (= (and d!38687 (not res!61774)) b!127926))

(assert (=> d!38687 m!149345))

(declare-fun m!149505 () Bool)

(assert (=> d!38687 m!149505))

(assert (=> b!127924 m!149345))

(declare-fun m!149507 () Bool)

(assert (=> b!127924 m!149507))

(assert (=> b!127924 m!149345))

(declare-fun m!149509 () Bool)

(assert (=> b!127924 m!149509))

(assert (=> b!127924 m!149509))

(declare-fun m!149511 () Bool)

(assert (=> b!127924 m!149511))

(assert (=> b!127926 m!149345))

(assert (=> b!127926 m!149509))

(assert (=> b!127926 m!149509))

(assert (=> b!127926 m!149511))

(assert (=> b!127737 d!38687))

(declare-fun b!128007 () Bool)

(declare-fun e!83610 () Bool)

(declare-fun e!83598 () Bool)

(assert (=> b!128007 (= e!83610 e!83598)))

(declare-fun res!61804 () Bool)

(declare-fun call!13834 () Bool)

(assert (=> b!128007 (= res!61804 call!13834)))

(assert (=> b!128007 (=> (not res!61804) (not e!83598))))

(declare-fun bm!13809 () Bool)

(declare-fun call!13821 () Bool)

(declare-fun call!13812 () Bool)

(assert (=> bm!13809 (= call!13821 call!13812)))

(declare-fun e!83606 () Bool)

(declare-datatypes ((SeekEntryResult!274 0))(
  ( (MissingZero!274 (index!3252 (_ BitVec 32))) (Found!274 (index!3253 (_ BitVec 32))) (Intermediate!274 (undefined!1086 Bool) (index!3254 (_ BitVec 32)) (x!15124 (_ BitVec 32))) (Undefined!274) (MissingVacant!274 (index!3255 (_ BitVec 32))) )
))
(declare-fun lt!66140 () SeekEntryResult!274)

(declare-fun b!128008 () Bool)

(assert (=> b!128008 (= e!83606 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66140)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128009 () Bool)

(declare-fun e!83605 () Bool)

(declare-fun e!83612 () Bool)

(assert (=> b!128009 (= e!83605 e!83612)))

(declare-fun call!13819 () ListLongMap!1657)

(declare-fun res!61805 () Bool)

(assert (=> b!128009 (= res!61805 (contains!873 call!13819 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128009 (=> (not res!61805) (not e!83612))))

(declare-fun b!128010 () Bool)

(declare-fun e!83601 () Bool)

(declare-fun call!13830 () Bool)

(assert (=> b!128010 (= e!83601 (not call!13830))))

(declare-fun bm!13810 () Bool)

(declare-fun call!13813 () SeekEntryResult!274)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4701 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> bm!13810 (= call!13813 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!128011 () Bool)

(declare-fun lt!66134 () Unit!3980)

(declare-fun lt!66139 () Unit!3980)

(assert (=> b!128011 (= lt!66134 lt!66139)))

(declare-fun call!13827 () ListLongMap!1657)

(declare-fun call!13815 () ListLongMap!1657)

(assert (=> b!128011 (= call!13827 call!13815)))

(declare-fun lt!66137 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3980)

(assert (=> b!128011 (= lt!66139 (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128011 (= lt!66137 (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!83608 () tuple2!2562)

(assert (=> b!128011 (= e!83608 (tuple2!2563 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7071 newMap!16) (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!585 newMap!16) (_keys!4540 newMap!16) (_values!2787 newMap!16) (_vacant!585 newMap!16))))))

(declare-fun b!128012 () Bool)

(declare-fun res!61806 () Bool)

(declare-fun e!83597 () Bool)

(assert (=> b!128012 (=> (not res!61806) (not e!83597))))

(assert (=> b!128012 (= res!61806 call!13834)))

(declare-fun e!83593 () Bool)

(assert (=> b!128012 (= e!83593 e!83597)))

(declare-fun d!38689 () Bool)

(declare-fun e!83603 () Bool)

(assert (=> d!38689 e!83603))

(declare-fun res!61807 () Bool)

(assert (=> d!38689 (=> (not res!61807) (not e!83603))))

(declare-fun lt!66148 () tuple2!2562)

(assert (=> d!38689 (= res!61807 (valid!519 (_2!1292 lt!66148)))))

(declare-fun e!83602 () tuple2!2562)

(assert (=> d!38689 (= lt!66148 e!83602)))

(declare-fun c!23467 () Bool)

(assert (=> d!38689 (= c!23467 (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvneg (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38689 (valid!519 newMap!16)))

(assert (=> d!38689 (= (update!187 newMap!16 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!66148)))

(declare-fun b!128013 () Bool)

(declare-fun lt!66146 () Unit!3980)

(declare-fun lt!66156 () Unit!3980)

(assert (=> b!128013 (= lt!66146 lt!66156)))

(declare-fun call!13820 () ListLongMap!1657)

(assert (=> b!128013 (= call!13827 call!13820)))

(declare-fun lt!66154 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!57 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3980)

(assert (=> b!128013 (= lt!66156 (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66154 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128013 (= lt!66154 (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!128013 (= e!83608 (tuple2!2563 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7071 newMap!16) (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (_size!585 newMap!16) (_keys!4540 newMap!16) (_values!2787 newMap!16) (_vacant!585 newMap!16))))))

(declare-fun b!128014 () Bool)

(declare-fun c!23464 () Bool)

(declare-fun lt!66155 () SeekEntryResult!274)

(assert (=> b!128014 (= c!23464 ((_ is MissingVacant!274) lt!66155))))

(assert (=> b!128014 (= e!83593 e!83610)))

(declare-fun b!128015 () Bool)

(declare-fun e!83592 () ListLongMap!1657)

(declare-fun c!23472 () Bool)

(assert (=> b!128015 (= e!83592 (ite c!23472 call!13815 call!13820))))

(declare-fun bm!13811 () Bool)

(declare-fun lt!66141 () SeekEntryResult!274)

(declare-fun call!13823 () ListLongMap!1657)

(assert (=> bm!13811 (= call!13823 (getCurrentListMap!513 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128016 () Bool)

(declare-fun res!61810 () Bool)

(declare-fun lt!66153 () SeekEntryResult!274)

(assert (=> b!128016 (= res!61810 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83600 () Bool)

(assert (=> b!128016 (=> (not res!61810) (not e!83600))))

(declare-fun b!128017 () Bool)

(declare-fun c!23463 () Bool)

(assert (=> b!128017 (= c!23463 ((_ is MissingVacant!274) lt!66153))))

(declare-fun e!83611 () Bool)

(declare-fun e!83607 () Bool)

(assert (=> b!128017 (= e!83611 e!83607)))

(declare-fun call!13826 () Unit!3980)

(declare-fun bm!13812 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3980)

(assert (=> bm!13812 (= call!13826 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun bm!13813 () Bool)

(assert (=> bm!13813 (= call!13819 (map!1377 (_2!1292 lt!66148)))))

(declare-fun b!128018 () Bool)

(assert (=> b!128018 (= e!83607 e!83600)))

(declare-fun res!61811 () Bool)

(declare-fun call!13828 () Bool)

(assert (=> b!128018 (= res!61811 call!13828)))

(assert (=> b!128018 (=> (not res!61811) (not e!83600))))

(declare-fun b!128019 () Bool)

(assert (=> b!128019 (= e!83602 e!83608)))

(assert (=> b!128019 (= c!23472 (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128020 () Bool)

(declare-fun e!83609 () tuple2!2562)

(declare-fun lt!66138 () tuple2!2562)

(assert (=> b!128020 (= e!83609 (tuple2!2563 (_1!1292 lt!66138) (_2!1292 lt!66138)))))

(declare-fun call!13835 () tuple2!2562)

(assert (=> b!128020 (= lt!66138 call!13835)))

(declare-fun call!13817 () Bool)

(declare-fun c!23471 () Bool)

(declare-fun bm!13814 () Bool)

(declare-fun call!13818 () ListLongMap!1657)

(assert (=> bm!13814 (= call!13817 (contains!873 call!13818 (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(declare-fun bm!13815 () Bool)

(declare-fun call!13829 () SeekEntryResult!274)

(assert (=> bm!13815 (= call!13829 call!13813)))

(declare-fun bm!13816 () Bool)

(declare-fun call!13833 () ListLongMap!1657)

(assert (=> bm!13816 (= call!13833 (+!159 e!83592 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23462 () Bool)

(assert (=> bm!13816 (= c!23462 c!23467)))

(declare-fun bm!13817 () Bool)

(declare-fun call!13824 () ListLongMap!1657)

(assert (=> bm!13817 (= call!13818 call!13824)))

(declare-fun b!128021 () Bool)

(declare-fun call!13831 () ListLongMap!1657)

(assert (=> b!128021 (= e!83612 (= call!13819 (+!159 call!13831 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128022 () Bool)

(declare-fun res!61809 () Bool)

(assert (=> b!128022 (=> (not res!61809) (not e!83601))))

(assert (=> b!128022 (= res!61809 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13818 () Bool)

(declare-fun call!13825 () Bool)

(declare-fun call!13814 () Bool)

(assert (=> bm!13818 (= call!13825 call!13814)))

(declare-fun b!128023 () Bool)

(declare-fun lt!66157 () SeekEntryResult!274)

(declare-fun e!83599 () Bool)

(assert (=> b!128023 (= e!83599 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66157)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128024 () Bool)

(declare-fun e!83594 () tuple2!2562)

(assert (=> b!128024 (= e!83609 e!83594)))

(declare-fun c!23466 () Bool)

(assert (=> b!128024 (= c!23466 ((_ is MissingZero!274) lt!66141))))

(declare-fun bm!13819 () Bool)

(declare-fun call!13816 () SeekEntryResult!274)

(assert (=> bm!13819 (= call!13816 call!13813)))

(declare-fun b!128025 () Bool)

(declare-fun lt!66150 () Unit!3980)

(declare-fun e!83604 () Unit!3980)

(assert (=> b!128025 (= lt!66150 e!83604)))

(declare-fun c!23465 () Bool)

(assert (=> b!128025 (= c!23465 call!13817)))

(declare-fun e!83595 () tuple2!2562)

(assert (=> b!128025 (= e!83595 (tuple2!2563 false newMap!16))))

(declare-fun bm!13820 () Bool)

(assert (=> bm!13820 (= call!13830 call!13814)))

(declare-fun b!128026 () Bool)

(assert (=> b!128026 (= e!83597 (not call!13825))))

(declare-fun bm!13821 () Bool)

(declare-fun lt!66152 () array!4703)

(assert (=> bm!13821 (= call!13824 (getCurrentListMap!513 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128027 () Bool)

(declare-fun lt!66136 () Unit!3980)

(assert (=> b!128027 (= e!83604 lt!66136)))

(declare-fun call!13832 () Unit!3980)

(assert (=> b!128027 (= lt!66136 call!13832)))

(assert (=> b!128027 (= lt!66155 call!13816)))

(declare-fun c!23468 () Bool)

(assert (=> b!128027 (= c!23468 ((_ is MissingZero!274) lt!66155))))

(assert (=> b!128027 e!83593))

(declare-fun b!128028 () Bool)

(declare-fun res!61814 () Bool)

(assert (=> b!128028 (=> (not res!61814) (not e!83597))))

(assert (=> b!128028 (= res!61814 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13822 () Bool)

(declare-fun arrayContainsKey!0 (array!4701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13822 (= call!13814 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128029 () Bool)

(declare-fun e!83596 () Unit!3980)

(declare-fun lt!66159 () Unit!3980)

(assert (=> b!128029 (= e!83596 lt!66159)))

(assert (=> b!128029 (= lt!66159 call!13826)))

(assert (=> b!128029 (= lt!66157 call!13829)))

(declare-fun res!61812 () Bool)

(assert (=> b!128029 (= res!61812 ((_ is Found!274) lt!66157))))

(assert (=> b!128029 (=> (not res!61812) (not e!83599))))

(assert (=> b!128029 e!83599))

(declare-fun b!128030 () Bool)

(assert (=> b!128030 (= e!83598 (not call!13825))))

(declare-fun bm!13823 () Bool)

(declare-fun call!13822 () Bool)

(assert (=> bm!13823 (= call!13828 call!13822)))

(declare-fun bm!13824 () Bool)

(assert (=> bm!13824 (= call!13822 call!13812)))

(declare-fun bm!13825 () Bool)

(assert (=> bm!13825 (= call!13815 call!13823)))

(declare-fun c!23474 () Bool)

(declare-fun bm!13826 () Bool)

(declare-fun updateHelperNewKey!57 (LongMapFixedSize!1072 (_ BitVec 64) V!3449 (_ BitVec 32)) tuple2!2562)

(assert (=> bm!13826 (= call!13835 (updateHelperNewKey!57 newMap!16 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(declare-fun bm!13827 () Bool)

(assert (=> bm!13827 (= call!13831 (map!1377 newMap!16))))

(declare-fun b!128031 () Bool)

(declare-fun Unit!3984 () Unit!3980)

(assert (=> b!128031 (= e!83596 Unit!3984)))

(declare-fun lt!66145 () Unit!3980)

(assert (=> b!128031 (= lt!66145 call!13832)))

(assert (=> b!128031 (= lt!66153 call!13829)))

(declare-fun c!23470 () Bool)

(assert (=> b!128031 (= c!23470 ((_ is MissingZero!274) lt!66153))))

(assert (=> b!128031 e!83611))

(declare-fun lt!66151 () Unit!3980)

(assert (=> b!128031 (= lt!66151 lt!66145)))

(assert (=> b!128031 false))

(declare-fun b!128032 () Bool)

(assert (=> b!128032 (= e!83605 (= call!13819 call!13831))))

(declare-fun bm!13828 () Bool)

(assert (=> bm!13828 (= call!13834 call!13821)))

(declare-fun b!128033 () Bool)

(declare-fun res!61813 () Bool)

(assert (=> b!128033 (= res!61813 call!13822)))

(assert (=> b!128033 (=> (not res!61813) (not e!83599))))

(declare-fun bm!13829 () Bool)

(declare-fun c!23473 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13829 (= call!13812 (inRange!0 (ite c!23471 (ite c!23465 (index!3253 lt!66140) (ite c!23468 (index!3252 lt!66155) (index!3255 lt!66155))) (ite c!23473 (index!3253 lt!66157) (ite c!23470 (index!3252 lt!66153) (index!3255 lt!66153)))) (mask!7071 newMap!16)))))

(declare-fun b!128034 () Bool)

(assert (=> b!128034 (= e!83592 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128035 () Bool)

(declare-fun res!61815 () Bool)

(assert (=> b!128035 (=> (not res!61815) (not e!83601))))

(assert (=> b!128035 (= res!61815 call!13828)))

(assert (=> b!128035 (= e!83611 e!83601)))

(declare-fun b!128036 () Bool)

(assert (=> b!128036 (= e!83600 (not call!13830))))

(declare-fun b!128037 () Bool)

(assert (=> b!128037 (= e!83607 ((_ is Undefined!274) lt!66153))))

(declare-fun b!128038 () Bool)

(assert (=> b!128038 (= e!83602 e!83595)))

(assert (=> b!128038 (= lt!66141 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (=> b!128038 (= c!23471 ((_ is Undefined!274) lt!66141))))

(declare-fun b!128039 () Bool)

(declare-fun Unit!3985 () Unit!3980)

(assert (=> b!128039 (= e!83604 Unit!3985)))

(declare-fun lt!66144 () Unit!3980)

(assert (=> b!128039 (= lt!66144 call!13826)))

(assert (=> b!128039 (= lt!66140 call!13816)))

(declare-fun res!61803 () Bool)

(assert (=> b!128039 (= res!61803 ((_ is Found!274) lt!66140))))

(assert (=> b!128039 (=> (not res!61803) (not e!83606))))

(assert (=> b!128039 e!83606))

(declare-fun lt!66142 () Unit!3980)

(assert (=> b!128039 (= lt!66142 lt!66144)))

(assert (=> b!128039 false))

(declare-fun b!128040 () Bool)

(assert (=> b!128040 (= e!83610 ((_ is Undefined!274) lt!66155))))

(declare-fun bm!13830 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3980)

(assert (=> bm!13830 (= call!13832 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun b!128041 () Bool)

(declare-fun lt!66147 () tuple2!2562)

(assert (=> b!128041 (= lt!66147 call!13835)))

(assert (=> b!128041 (= e!83594 (tuple2!2563 (_1!1292 lt!66147) (_2!1292 lt!66147)))))

(declare-fun bm!13831 () Bool)

(assert (=> bm!13831 (= call!13820 call!13824)))

(declare-fun b!128042 () Bool)

(declare-fun lt!66158 () Unit!3980)

(declare-fun lt!66135 () Unit!3980)

(assert (=> b!128042 (= lt!66158 lt!66135)))

(assert (=> b!128042 call!13817))

(declare-fun lemmaValidKeyInArrayIsInListMap!116 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) Unit!3980)

(assert (=> b!128042 (= lt!66135 (lemmaValidKeyInArrayIsInListMap!116 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128042 (= lt!66152 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))))

(declare-fun lt!66149 () Unit!3980)

(declare-fun lt!66133 () Unit!3980)

(assert (=> b!128042 (= lt!66149 lt!66133)))

(assert (=> b!128042 (= call!13833 call!13823)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3980)

(assert (=> b!128042 (= lt!66133 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66143 () Unit!3980)

(assert (=> b!128042 (= lt!66143 e!83596)))

(assert (=> b!128042 (= c!23473 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128042 (= e!83594 (tuple2!2563 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (_size!585 newMap!16) (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (_vacant!585 newMap!16))))))

(declare-fun b!128043 () Bool)

(declare-fun res!61808 () Bool)

(assert (=> b!128043 (= res!61808 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128043 (=> (not res!61808) (not e!83598))))

(declare-fun bm!13832 () Bool)

(assert (=> bm!13832 (= call!13827 call!13833)))

(declare-fun b!128044 () Bool)

(assert (=> b!128044 (= e!83603 e!83605)))

(declare-fun c!23469 () Bool)

(assert (=> b!128044 (= c!23469 (_1!1292 lt!66148))))

(declare-fun b!128045 () Bool)

(declare-fun res!61816 () Bool)

(assert (=> b!128045 (= res!61816 call!13821)))

(assert (=> b!128045 (=> (not res!61816) (not e!83606))))

(declare-fun b!128046 () Bool)

(assert (=> b!128046 (= c!23474 ((_ is MissingVacant!274) lt!66141))))

(assert (=> b!128046 (= e!83595 e!83609)))

(assert (= (and d!38689 c!23467) b!128019))

(assert (= (and d!38689 (not c!23467)) b!128038))

(assert (= (and b!128019 c!23472) b!128013))

(assert (= (and b!128019 (not c!23472)) b!128011))

(assert (= (or b!128013 b!128011) bm!13831))

(assert (= (or b!128013 b!128011) bm!13825))

(assert (= (or b!128013 b!128011) bm!13832))

(assert (= (and b!128038 c!23471) b!128025))

(assert (= (and b!128038 (not c!23471)) b!128046))

(assert (= (and b!128025 c!23465) b!128039))

(assert (= (and b!128025 (not c!23465)) b!128027))

(assert (= (and b!128039 res!61803) b!128045))

(assert (= (and b!128045 res!61816) b!128008))

(assert (= (and b!128027 c!23468) b!128012))

(assert (= (and b!128027 (not c!23468)) b!128014))

(assert (= (and b!128012 res!61806) b!128028))

(assert (= (and b!128028 res!61814) b!128026))

(assert (= (and b!128014 c!23464) b!128007))

(assert (= (and b!128014 (not c!23464)) b!128040))

(assert (= (and b!128007 res!61804) b!128043))

(assert (= (and b!128043 res!61808) b!128030))

(assert (= (or b!128012 b!128007) bm!13828))

(assert (= (or b!128026 b!128030) bm!13818))

(assert (= (or b!128045 bm!13828) bm!13809))

(assert (= (or b!128039 b!128027) bm!13819))

(assert (= (and b!128046 c!23474) b!128020))

(assert (= (and b!128046 (not c!23474)) b!128024))

(assert (= (and b!128024 c!23466) b!128041))

(assert (= (and b!128024 (not c!23466)) b!128042))

(assert (= (and b!128042 c!23473) b!128029))

(assert (= (and b!128042 (not c!23473)) b!128031))

(assert (= (and b!128029 res!61812) b!128033))

(assert (= (and b!128033 res!61813) b!128023))

(assert (= (and b!128031 c!23470) b!128035))

(assert (= (and b!128031 (not c!23470)) b!128017))

(assert (= (and b!128035 res!61815) b!128022))

(assert (= (and b!128022 res!61809) b!128010))

(assert (= (and b!128017 c!23463) b!128018))

(assert (= (and b!128017 (not c!23463)) b!128037))

(assert (= (and b!128018 res!61811) b!128016))

(assert (= (and b!128016 res!61810) b!128036))

(assert (= (or b!128035 b!128018) bm!13823))

(assert (= (or b!128010 b!128036) bm!13820))

(assert (= (or b!128033 bm!13823) bm!13824))

(assert (= (or b!128029 b!128031) bm!13815))

(assert (= (or b!128020 b!128041) bm!13826))

(assert (= (or b!128025 b!128042) bm!13817))

(assert (= (or b!128039 b!128029) bm!13812))

(assert (= (or bm!13819 bm!13815) bm!13810))

(assert (= (or bm!13809 bm!13824) bm!13829))

(assert (= (or bm!13818 bm!13820) bm!13822))

(assert (= (or b!128027 b!128031) bm!13830))

(assert (= (or b!128025 b!128042) bm!13814))

(assert (= (or bm!13831 bm!13817) bm!13821))

(assert (= (or bm!13825 b!128042) bm!13811))

(assert (= (or bm!13832 b!128042) bm!13816))

(assert (= (and bm!13816 c!23462) b!128015))

(assert (= (and bm!13816 (not c!23462)) b!128034))

(assert (= (and d!38689 res!61807) b!128044))

(assert (= (and b!128044 c!23469) b!128009))

(assert (= (and b!128044 (not c!23469)) b!128032))

(assert (= (and b!128009 res!61805) b!128021))

(assert (= (or b!128009 b!128021 b!128032) bm!13813))

(assert (= (or b!128021 b!128032) bm!13827))

(declare-fun m!149513 () Bool)

(assert (=> bm!13813 m!149513))

(assert (=> b!128011 m!149343))

(declare-fun m!149515 () Bool)

(assert (=> b!128011 m!149515))

(declare-fun m!149517 () Bool)

(assert (=> d!38689 m!149517))

(assert (=> d!38689 m!149357))

(declare-fun m!149519 () Bool)

(assert (=> bm!13811 m!149519))

(declare-fun m!149521 () Bool)

(assert (=> bm!13811 m!149521))

(assert (=> bm!13830 m!149345))

(declare-fun m!149523 () Bool)

(assert (=> bm!13830 m!149523))

(assert (=> bm!13810 m!149345))

(declare-fun m!149525 () Bool)

(assert (=> bm!13810 m!149525))

(declare-fun m!149527 () Bool)

(assert (=> b!128023 m!149527))

(declare-fun m!149529 () Bool)

(assert (=> b!128043 m!149529))

(declare-fun m!149531 () Bool)

(assert (=> b!128021 m!149531))

(assert (=> bm!13827 m!149359))

(declare-fun m!149533 () Bool)

(assert (=> b!128028 m!149533))

(declare-fun m!149535 () Bool)

(assert (=> bm!13829 m!149535))

(declare-fun m!149537 () Bool)

(assert (=> bm!13816 m!149537))

(assert (=> bm!13822 m!149345))

(declare-fun m!149539 () Bool)

(assert (=> bm!13822 m!149539))

(assert (=> b!128042 m!149437))

(assert (=> b!128042 m!149345))

(declare-fun m!149541 () Bool)

(assert (=> b!128042 m!149541))

(assert (=> b!128042 m!149437))

(assert (=> b!128042 m!149345))

(assert (=> b!128042 m!149343))

(declare-fun m!149543 () Bool)

(assert (=> b!128042 m!149543))

(declare-fun m!149545 () Bool)

(assert (=> b!128042 m!149545))

(assert (=> b!128042 m!149519))

(assert (=> b!128038 m!149345))

(assert (=> b!128038 m!149525))

(declare-fun m!149547 () Bool)

(assert (=> b!128008 m!149547))

(assert (=> bm!13812 m!149345))

(declare-fun m!149549 () Bool)

(assert (=> bm!13812 m!149549))

(assert (=> b!128034 m!149437))

(declare-fun m!149551 () Bool)

(assert (=> b!128022 m!149551))

(assert (=> bm!13826 m!149345))

(assert (=> bm!13826 m!149343))

(declare-fun m!149553 () Bool)

(assert (=> bm!13826 m!149553))

(declare-fun m!149555 () Bool)

(assert (=> bm!13821 m!149555))

(assert (=> b!128009 m!149345))

(declare-fun m!149557 () Bool)

(assert (=> b!128009 m!149557))

(declare-fun m!149559 () Bool)

(assert (=> bm!13814 m!149559))

(declare-fun m!149561 () Bool)

(assert (=> bm!13814 m!149561))

(assert (=> b!128013 m!149343))

(declare-fun m!149563 () Bool)

(assert (=> b!128013 m!149563))

(declare-fun m!149565 () Bool)

(assert (=> b!128016 m!149565))

(assert (=> b!127737 d!38689))

(declare-fun d!38691 () Bool)

(declare-fun c!23477 () Bool)

(assert (=> d!38691 (= c!23477 ((_ is ValueCellFull!1082) (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun e!83615 () V!3449)

(assert (=> d!38691 (= (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83615)))

(declare-fun b!128051 () Bool)

(declare-fun get!1454 (ValueCell!1082 V!3449) V!3449)

(assert (=> b!128051 (= e!83615 (get!1454 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128052 () Bool)

(declare-fun get!1455 (ValueCell!1082 V!3449) V!3449)

(assert (=> b!128052 (= e!83615 (get!1455 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38691 c!23477) b!128051))

(assert (= (and d!38691 (not c!23477)) b!128052))

(assert (=> b!128051 m!149339))

(assert (=> b!128051 m!149341))

(declare-fun m!149567 () Bool)

(assert (=> b!128051 m!149567))

(assert (=> b!128052 m!149339))

(assert (=> b!128052 m!149341))

(declare-fun m!149569 () Bool)

(assert (=> b!128052 m!149569))

(assert (=> b!127737 d!38691))

(declare-fun condMapEmpty!4553 () Bool)

(declare-fun mapDefault!4553 () ValueCell!1082)

(assert (=> mapNonEmpty!4538 (= condMapEmpty!4553 (= mapRest!4538 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4553)))))

(declare-fun e!83620 () Bool)

(declare-fun mapRes!4553 () Bool)

(assert (=> mapNonEmpty!4538 (= tp!11023 (and e!83620 mapRes!4553))))

(declare-fun b!128060 () Bool)

(assert (=> b!128060 (= e!83620 tp_is_empty!2851)))

(declare-fun b!128059 () Bool)

(declare-fun e!83621 () Bool)

(assert (=> b!128059 (= e!83621 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4553 () Bool)

(assert (=> mapIsEmpty!4553 mapRes!4553))

(declare-fun mapNonEmpty!4553 () Bool)

(declare-fun tp!11051 () Bool)

(assert (=> mapNonEmpty!4553 (= mapRes!4553 (and tp!11051 e!83621))))

(declare-fun mapRest!4553 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapValue!4553 () ValueCell!1082)

(declare-fun mapKey!4553 () (_ BitVec 32))

(assert (=> mapNonEmpty!4553 (= mapRest!4538 (store mapRest!4553 mapKey!4553 mapValue!4553))))

(assert (= (and mapNonEmpty!4538 condMapEmpty!4553) mapIsEmpty!4553))

(assert (= (and mapNonEmpty!4538 (not condMapEmpty!4553)) mapNonEmpty!4553))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1082) mapValue!4553)) b!128059))

(assert (= (and mapNonEmpty!4538 ((_ is ValueCellFull!1082) mapDefault!4553)) b!128060))

(declare-fun m!149571 () Bool)

(assert (=> mapNonEmpty!4553 m!149571))

(declare-fun condMapEmpty!4554 () Bool)

(declare-fun mapDefault!4554 () ValueCell!1082)

(assert (=> mapNonEmpty!4537 (= condMapEmpty!4554 (= mapRest!4537 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4554)))))

(declare-fun e!83622 () Bool)

(declare-fun mapRes!4554 () Bool)

(assert (=> mapNonEmpty!4537 (= tp!11021 (and e!83622 mapRes!4554))))

(declare-fun b!128062 () Bool)

(assert (=> b!128062 (= e!83622 tp_is_empty!2851)))

(declare-fun b!128061 () Bool)

(declare-fun e!83623 () Bool)

(assert (=> b!128061 (= e!83623 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4554 () Bool)

(assert (=> mapIsEmpty!4554 mapRes!4554))

(declare-fun mapNonEmpty!4554 () Bool)

(declare-fun tp!11052 () Bool)

(assert (=> mapNonEmpty!4554 (= mapRes!4554 (and tp!11052 e!83623))))

(declare-fun mapRest!4554 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapValue!4554 () ValueCell!1082)

(declare-fun mapKey!4554 () (_ BitVec 32))

(assert (=> mapNonEmpty!4554 (= mapRest!4537 (store mapRest!4554 mapKey!4554 mapValue!4554))))

(assert (= (and mapNonEmpty!4537 condMapEmpty!4554) mapIsEmpty!4554))

(assert (= (and mapNonEmpty!4537 (not condMapEmpty!4554)) mapNonEmpty!4554))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1082) mapValue!4554)) b!128061))

(assert (= (and mapNonEmpty!4537 ((_ is ValueCellFull!1082) mapDefault!4554)) b!128062))

(declare-fun m!149573 () Bool)

(assert (=> mapNonEmpty!4554 m!149573))

(declare-fun b_lambda!5651 () Bool)

(assert (= b_lambda!5649 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5651)))

(check-sat (not bm!13827) b_and!7893 (not b!128009) (not b!127926) (not bm!13814) (not b_next!2869) (not b!127896) (not mapNonEmpty!4554) (not b!127915) (not bm!13821) (not bm!13810) (not bm!13829) (not d!38687) (not b!127916) (not bm!13813) (not bm!13816) (not bm!13757) (not b_next!2871) (not bm!13812) (not b!128038) (not bm!13759) (not b_lambda!5651) (not d!38675) (not b!128021) (not bm!13826) (not b!127924) tp_is_empty!2851 (not bm!13822) (not d!38685) (not b!127899) (not b!127904) (not b!128052) (not b!128051) (not b!127901) (not b!127895) (not bm!13754) (not b!127903) (not b!127917) (not d!38689) (not bm!13760) (not b!127908) b_and!7895 (not b!128042) (not d!38673) (not mapNonEmpty!4553) (not b!127902) (not b!128034) (not b_lambda!5647) (not bm!13811) (not d!38677) (not b!128011) (not b!128013) (not bm!13830))
(check-sat b_and!7893 b_and!7895 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun d!38693 () Bool)

(declare-fun res!61821 () Bool)

(declare-fun e!83628 () Bool)

(assert (=> d!38693 (=> res!61821 e!83628)))

(assert (=> d!38693 (= res!61821 (= (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38693 (= (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83628)))

(declare-fun b!128067 () Bool)

(declare-fun e!83629 () Bool)

(assert (=> b!128067 (= e!83628 e!83629)))

(declare-fun res!61822 () Bool)

(assert (=> b!128067 (=> (not res!61822) (not e!83629))))

(assert (=> b!128067 (= res!61822 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128068 () Bool)

(assert (=> b!128068 (= e!83629 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38693 (not res!61821)) b!128067))

(assert (= (and b!128067 res!61822) b!128068))

(declare-fun m!149575 () Bool)

(assert (=> d!38693 m!149575))

(assert (=> b!128068 m!149345))

(declare-fun m!149577 () Bool)

(assert (=> b!128068 m!149577))

(assert (=> bm!13822 d!38693))

(declare-fun d!38695 () Bool)

(declare-fun get!1456 (Option!172) V!3449)

(assert (=> d!38695 (= (apply!112 lt!66050 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5292 () Bool)

(assert (= bs!5292 d!38695))

(declare-fun m!149579 () Bool)

(assert (=> bs!5292 m!149579))

(assert (=> bs!5292 m!149579))

(declare-fun m!149581 () Bool)

(assert (=> bs!5292 m!149581))

(assert (=> b!127899 d!38695))

(declare-fun d!38697 () Bool)

(declare-fun e!83632 () Bool)

(assert (=> d!38697 e!83632))

(declare-fun res!61828 () Bool)

(assert (=> d!38697 (=> (not res!61828) (not e!83632))))

(declare-fun lt!66164 () SeekEntryResult!274)

(assert (=> d!38697 (= res!61828 ((_ is Found!274) lt!66164))))

(assert (=> d!38697 (= lt!66164 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun lt!66165 () Unit!3980)

(declare-fun choose!780 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3980)

(assert (=> d!38697 (= lt!66165 (choose!780 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38697 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38697 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) lt!66165)))

(declare-fun b!128073 () Bool)

(declare-fun res!61827 () Bool)

(assert (=> b!128073 (=> (not res!61827) (not e!83632))))

(assert (=> b!128073 (= res!61827 (inRange!0 (index!3253 lt!66164) (mask!7071 newMap!16)))))

(declare-fun b!128074 () Bool)

(assert (=> b!128074 (= e!83632 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66164)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128074 (and (bvsge (index!3253 lt!66164) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66164) (size!2490 (_keys!4540 newMap!16))))))

(assert (= (and d!38697 res!61828) b!128073))

(assert (= (and b!128073 res!61827) b!128074))

(assert (=> d!38697 m!149345))

(assert (=> d!38697 m!149525))

(assert (=> d!38697 m!149345))

(declare-fun m!149583 () Bool)

(assert (=> d!38697 m!149583))

(declare-fun m!149585 () Bool)

(assert (=> d!38697 m!149585))

(declare-fun m!149587 () Bool)

(assert (=> b!128073 m!149587))

(declare-fun m!149589 () Bool)

(assert (=> b!128074 m!149589))

(assert (=> bm!13812 d!38697))

(declare-fun d!38699 () Bool)

(assert (=> d!38699 (= (map!1377 (_2!1292 lt!66148)) (getCurrentListMap!513 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun bs!5293 () Bool)

(assert (= bs!5293 d!38699))

(declare-fun m!149591 () Bool)

(assert (=> bs!5293 m!149591))

(assert (=> bm!13813 d!38699))

(declare-fun d!38701 () Bool)

(declare-fun e!83635 () Bool)

(assert (=> d!38701 e!83635))

(declare-fun res!61831 () Bool)

(assert (=> d!38701 (=> (not res!61831) (not e!83635))))

(assert (=> d!38701 (= res!61831 (and (bvsge (index!3253 lt!66141) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66141) (size!2490 (_keys!4540 newMap!16)))))))

(declare-fun lt!66168 () Unit!3980)

(declare-fun choose!781 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) Unit!3980)

(assert (=> d!38701 (= lt!66168 (choose!781 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38701 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38701 (= (lemmaValidKeyInArrayIsInListMap!116 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (defaultEntry!2804 newMap!16)) lt!66168)))

(declare-fun b!128077 () Bool)

(assert (=> b!128077 (= e!83635 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))

(assert (= (and d!38701 res!61831) b!128077))

(declare-fun m!149593 () Bool)

(assert (=> d!38701 m!149593))

(assert (=> d!38701 m!149585))

(declare-fun m!149595 () Bool)

(assert (=> b!128077 m!149595))

(assert (=> b!128077 m!149559))

(assert (=> b!128077 m!149595))

(assert (=> b!128077 m!149559))

(declare-fun m!149597 () Bool)

(assert (=> b!128077 m!149597))

(assert (=> b!128042 d!38701))

(declare-fun d!38703 () Bool)

(declare-fun e!83638 () Bool)

(assert (=> d!38703 e!83638))

(declare-fun res!61834 () Bool)

(assert (=> d!38703 (=> (not res!61834) (not e!83638))))

(assert (=> d!38703 (= res!61834 (and (bvsge (index!3253 lt!66141) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66141) (size!2491 (_values!2787 newMap!16)))))))

(declare-fun lt!66171 () Unit!3980)

(declare-fun choose!782 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3980)

(assert (=> d!38703 (= lt!66171 (choose!782 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38703 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38703 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66171)))

(declare-fun b!128080 () Bool)

(assert (=> b!128080 (= e!83638 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))))

(assert (= (and d!38703 res!61834) b!128080))

(assert (=> d!38703 m!149345))

(assert (=> d!38703 m!149343))

(declare-fun m!149599 () Bool)

(assert (=> d!38703 m!149599))

(assert (=> d!38703 m!149585))

(assert (=> b!128080 m!149437))

(assert (=> b!128080 m!149437))

(declare-fun m!149601 () Bool)

(assert (=> b!128080 m!149601))

(assert (=> b!128080 m!149519))

(declare-fun m!149603 () Bool)

(assert (=> b!128080 m!149603))

(assert (=> b!128042 d!38703))

(declare-fun d!38705 () Bool)

(declare-fun e!83640 () Bool)

(assert (=> d!38705 e!83640))

(declare-fun res!61835 () Bool)

(assert (=> d!38705 (=> res!61835 e!83640)))

(declare-fun lt!66174 () Bool)

(assert (=> d!38705 (= res!61835 (not lt!66174))))

(declare-fun lt!66175 () Bool)

(assert (=> d!38705 (= lt!66174 lt!66175)))

(declare-fun lt!66173 () Unit!3980)

(declare-fun e!83639 () Unit!3980)

(assert (=> d!38705 (= lt!66173 e!83639)))

(declare-fun c!23478 () Bool)

(assert (=> d!38705 (= c!23478 lt!66175)))

(assert (=> d!38705 (= lt!66175 (containsKey!170 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38705 (= (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66174)))

(declare-fun b!128081 () Bool)

(declare-fun lt!66172 () Unit!3980)

(assert (=> b!128081 (= e!83639 lt!66172)))

(assert (=> b!128081 (= lt!66172 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128081 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128082 () Bool)

(declare-fun Unit!3986 () Unit!3980)

(assert (=> b!128082 (= e!83639 Unit!3986)))

(declare-fun b!128083 () Bool)

(assert (=> b!128083 (= e!83640 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (= (and d!38705 c!23478) b!128081))

(assert (= (and d!38705 (not c!23478)) b!128082))

(assert (= (and d!38705 (not res!61835)) b!128083))

(assert (=> d!38705 m!149345))

(declare-fun m!149605 () Bool)

(assert (=> d!38705 m!149605))

(assert (=> b!128081 m!149345))

(declare-fun m!149607 () Bool)

(assert (=> b!128081 m!149607))

(assert (=> b!128081 m!149345))

(declare-fun m!149609 () Bool)

(assert (=> b!128081 m!149609))

(assert (=> b!128081 m!149609))

(declare-fun m!149611 () Bool)

(assert (=> b!128081 m!149611))

(assert (=> b!128083 m!149345))

(assert (=> b!128083 m!149609))

(assert (=> b!128083 m!149609))

(assert (=> b!128083 m!149611))

(assert (=> b!128042 d!38705))

(declare-fun bm!13833 () Bool)

(declare-fun call!13839 () Bool)

(declare-fun lt!66181 () ListLongMap!1657)

(assert (=> bm!13833 (= call!13839 (contains!873 lt!66181 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13834 () Bool)

(declare-fun call!13840 () ListLongMap!1657)

(declare-fun call!13842 () ListLongMap!1657)

(assert (=> bm!13834 (= call!13840 call!13842)))

(declare-fun b!128084 () Bool)

(declare-fun e!83645 () Unit!3980)

(declare-fun Unit!3987 () Unit!3980)

(assert (=> b!128084 (= e!83645 Unit!3987)))

(declare-fun b!128085 () Bool)

(declare-fun e!83643 () Bool)

(declare-fun call!13841 () Bool)

(assert (=> b!128085 (= e!83643 (not call!13841))))

(declare-fun b!128086 () Bool)

(declare-fun e!83650 () Bool)

(assert (=> b!128086 (= e!83643 e!83650)))

(declare-fun res!61837 () Bool)

(assert (=> b!128086 (= res!61837 call!13841)))

(assert (=> b!128086 (=> (not res!61837) (not e!83650))))

(declare-fun b!128087 () Bool)

(declare-fun res!61836 () Bool)

(declare-fun e!83649 () Bool)

(assert (=> b!128087 (=> (not res!61836) (not e!83649))))

(declare-fun e!83642 () Bool)

(assert (=> b!128087 (= res!61836 e!83642)))

(declare-fun res!61843 () Bool)

(assert (=> b!128087 (=> res!61843 e!83642)))

(declare-fun e!83651 () Bool)

(assert (=> b!128087 (= res!61843 (not e!83651))))

(declare-fun res!61838 () Bool)

(assert (=> b!128087 (=> (not res!61838) (not e!83651))))

(assert (=> b!128087 (= res!61838 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128088 () Bool)

(declare-fun e!83653 () ListLongMap!1657)

(declare-fun e!83641 () ListLongMap!1657)

(assert (=> b!128088 (= e!83653 e!83641)))

(declare-fun c!23481 () Bool)

(assert (=> b!128088 (= c!23481 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128089 () Bool)

(declare-fun e!83646 () Bool)

(assert (=> b!128089 (= e!83646 (not call!13839))))

(declare-fun d!38707 () Bool)

(assert (=> d!38707 e!83649))

(declare-fun res!61842 () Bool)

(assert (=> d!38707 (=> (not res!61842) (not e!83649))))

(assert (=> d!38707 (= res!61842 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66178 () ListLongMap!1657)

(assert (=> d!38707 (= lt!66181 lt!66178)))

(declare-fun lt!66190 () Unit!3980)

(assert (=> d!38707 (= lt!66190 e!83645)))

(declare-fun c!23480 () Bool)

(declare-fun e!83644 () Bool)

(assert (=> d!38707 (= c!23480 e!83644)))

(declare-fun res!61840 () Bool)

(assert (=> d!38707 (=> (not res!61840) (not e!83644))))

(assert (=> d!38707 (= res!61840 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38707 (= lt!66178 e!83653)))

(declare-fun c!23479 () Bool)

(assert (=> d!38707 (= c!23479 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38707 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38707 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66181)))

(declare-fun b!128090 () Bool)

(assert (=> b!128090 (= e!83641 call!13840)))

(declare-fun b!128091 () Bool)

(declare-fun e!83652 () Bool)

(assert (=> b!128091 (= e!83652 (= (apply!112 lt!66181 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (_values!2787 newMap!16))))))

(assert (=> b!128091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128092 () Bool)

(assert (=> b!128092 (= e!83653 (+!159 call!13842 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!128093 () Bool)

(assert (=> b!128093 (= e!83649 e!83646)))

(declare-fun c!23483 () Bool)

(assert (=> b!128093 (= c!23483 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128094 () Bool)

(declare-fun e!83647 () ListLongMap!1657)

(assert (=> b!128094 (= e!83647 call!13840)))

(declare-fun bm!13835 () Bool)

(declare-fun call!13837 () ListLongMap!1657)

(declare-fun call!13838 () ListLongMap!1657)

(assert (=> bm!13835 (= call!13837 call!13838)))

(declare-fun bm!13836 () Bool)

(declare-fun call!13836 () ListLongMap!1657)

(assert (=> bm!13836 (= call!13842 (+!159 (ite c!23479 call!13838 (ite c!23481 call!13837 call!13836)) (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128095 () Bool)

(declare-fun e!83648 () Bool)

(assert (=> b!128095 (= e!83648 (= (apply!112 lt!66181 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128096 () Bool)

(assert (=> b!128096 (= e!83647 call!13836)))

(declare-fun b!128097 () Bool)

(assert (=> b!128097 (= e!83650 (= (apply!112 lt!66181 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128098 () Bool)

(assert (=> b!128098 (= e!83651 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13837 () Bool)

(assert (=> bm!13837 (= call!13836 call!13837)))

(declare-fun bm!13838 () Bool)

(assert (=> bm!13838 (= call!13838 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128099 () Bool)

(assert (=> b!128099 (= e!83642 e!83652)))

(declare-fun res!61839 () Bool)

(assert (=> b!128099 (=> (not res!61839) (not e!83652))))

(assert (=> b!128099 (= res!61839 (contains!873 lt!66181 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13839 () Bool)

(assert (=> bm!13839 (= call!13841 (contains!873 lt!66181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128100 () Bool)

(assert (=> b!128100 (= e!83644 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128101 () Bool)

(assert (=> b!128101 (= e!83646 e!83648)))

(declare-fun res!61841 () Bool)

(assert (=> b!128101 (= res!61841 call!13839)))

(assert (=> b!128101 (=> (not res!61841) (not e!83648))))

(declare-fun b!128102 () Bool)

(declare-fun res!61844 () Bool)

(assert (=> b!128102 (=> (not res!61844) (not e!83649))))

(assert (=> b!128102 (= res!61844 e!83643)))

(declare-fun c!23484 () Bool)

(assert (=> b!128102 (= c!23484 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128103 () Bool)

(declare-fun c!23482 () Bool)

(assert (=> b!128103 (= c!23482 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128103 (= e!83641 e!83647)))

(declare-fun b!128104 () Bool)

(declare-fun lt!66186 () Unit!3980)

(assert (=> b!128104 (= e!83645 lt!66186)))

(declare-fun lt!66187 () ListLongMap!1657)

(assert (=> b!128104 (= lt!66187 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66185 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66185 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66192 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66192 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66182 () Unit!3980)

(assert (=> b!128104 (= lt!66182 (addStillContains!88 lt!66187 lt!66185 (zeroValue!2665 newMap!16) lt!66192))))

(assert (=> b!128104 (contains!873 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) lt!66192)))

(declare-fun lt!66177 () Unit!3980)

(assert (=> b!128104 (= lt!66177 lt!66182)))

(declare-fun lt!66183 () ListLongMap!1657)

(assert (=> b!128104 (= lt!66183 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66179 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66179 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66189 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66189 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66197 () Unit!3980)

(assert (=> b!128104 (= lt!66197 (addApplyDifferent!88 lt!66183 lt!66179 (minValue!2665 newMap!16) lt!66189))))

(assert (=> b!128104 (= (apply!112 (+!159 lt!66183 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) lt!66189) (apply!112 lt!66183 lt!66189))))

(declare-fun lt!66193 () Unit!3980)

(assert (=> b!128104 (= lt!66193 lt!66197)))

(declare-fun lt!66196 () ListLongMap!1657)

(assert (=> b!128104 (= lt!66196 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66191 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66191 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66176 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66176 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66180 () Unit!3980)

(assert (=> b!128104 (= lt!66180 (addApplyDifferent!88 lt!66196 lt!66191 (zeroValue!2665 newMap!16) lt!66176))))

(assert (=> b!128104 (= (apply!112 (+!159 lt!66196 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) lt!66176) (apply!112 lt!66196 lt!66176))))

(declare-fun lt!66188 () Unit!3980)

(assert (=> b!128104 (= lt!66188 lt!66180)))

(declare-fun lt!66194 () ListLongMap!1657)

(assert (=> b!128104 (= lt!66194 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66195 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66184 () (_ BitVec 64))

(assert (=> b!128104 (= lt!66184 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128104 (= lt!66186 (addApplyDifferent!88 lt!66194 lt!66195 (minValue!2665 newMap!16) lt!66184))))

(assert (=> b!128104 (= (apply!112 (+!159 lt!66194 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) lt!66184) (apply!112 lt!66194 lt!66184))))

(assert (= (and d!38707 c!23479) b!128092))

(assert (= (and d!38707 (not c!23479)) b!128088))

(assert (= (and b!128088 c!23481) b!128090))

(assert (= (and b!128088 (not c!23481)) b!128103))

(assert (= (and b!128103 c!23482) b!128094))

(assert (= (and b!128103 (not c!23482)) b!128096))

(assert (= (or b!128094 b!128096) bm!13837))

(assert (= (or b!128090 bm!13837) bm!13835))

(assert (= (or b!128090 b!128094) bm!13834))

(assert (= (or b!128092 bm!13835) bm!13838))

(assert (= (or b!128092 bm!13834) bm!13836))

(assert (= (and d!38707 res!61840) b!128100))

(assert (= (and d!38707 c!23480) b!128104))

(assert (= (and d!38707 (not c!23480)) b!128084))

(assert (= (and d!38707 res!61842) b!128087))

(assert (= (and b!128087 res!61838) b!128098))

(assert (= (and b!128087 (not res!61843)) b!128099))

(assert (= (and b!128099 res!61839) b!128091))

(assert (= (and b!128087 res!61836) b!128102))

(assert (= (and b!128102 c!23484) b!128086))

(assert (= (and b!128102 (not c!23484)) b!128085))

(assert (= (and b!128086 res!61837) b!128097))

(assert (= (or b!128086 b!128085) bm!13839))

(assert (= (and b!128102 res!61844) b!128093))

(assert (= (and b!128093 c!23483) b!128101))

(assert (= (and b!128093 (not c!23483)) b!128089))

(assert (= (and b!128101 res!61841) b!128095))

(assert (= (or b!128101 b!128089) bm!13833))

(declare-fun b_lambda!5653 () Bool)

(assert (=> (not b_lambda!5653) (not b!128091)))

(declare-fun tb!2345 () Bool)

(declare-fun t!6080 () Bool)

(assert (=> (and b!127723 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16)) t!6080) tb!2345))

(declare-fun result!3889 () Bool)

(assert (=> tb!2345 (= result!3889 tp_is_empty!2851)))

(assert (=> b!128091 t!6080))

(declare-fun b_and!7897 () Bool)

(assert (= b_and!7893 (and (=> t!6080 result!3889) b_and!7897)))

(declare-fun t!6082 () Bool)

(declare-fun tb!2347 () Bool)

(assert (=> (and b!127731 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 newMap!16)) t!6082) tb!2347))

(declare-fun result!3891 () Bool)

(assert (= result!3891 result!3889))

(assert (=> b!128091 t!6082))

(declare-fun b_and!7899 () Bool)

(assert (= b_and!7895 (and (=> t!6082 result!3891) b_and!7899)))

(declare-fun m!149613 () Bool)

(assert (=> bm!13839 m!149613))

(declare-fun m!149615 () Bool)

(assert (=> b!128097 m!149615))

(declare-fun m!149617 () Bool)

(assert (=> b!128091 m!149617))

(declare-fun m!149619 () Bool)

(assert (=> b!128091 m!149619))

(assert (=> b!128091 m!149617))

(declare-fun m!149621 () Bool)

(assert (=> b!128091 m!149621))

(assert (=> b!128091 m!149575))

(declare-fun m!149623 () Bool)

(assert (=> b!128091 m!149623))

(assert (=> b!128091 m!149619))

(assert (=> b!128091 m!149575))

(declare-fun m!149625 () Bool)

(assert (=> bm!13833 m!149625))

(assert (=> d!38707 m!149585))

(declare-fun m!149627 () Bool)

(assert (=> b!128104 m!149627))

(declare-fun m!149629 () Bool)

(assert (=> b!128104 m!149629))

(declare-fun m!149631 () Bool)

(assert (=> b!128104 m!149631))

(declare-fun m!149633 () Bool)

(assert (=> b!128104 m!149633))

(declare-fun m!149635 () Bool)

(assert (=> b!128104 m!149635))

(declare-fun m!149637 () Bool)

(assert (=> b!128104 m!149637))

(assert (=> b!128104 m!149627))

(declare-fun m!149639 () Bool)

(assert (=> b!128104 m!149639))

(declare-fun m!149641 () Bool)

(assert (=> b!128104 m!149641))

(declare-fun m!149643 () Bool)

(assert (=> b!128104 m!149643))

(assert (=> b!128104 m!149575))

(declare-fun m!149645 () Bool)

(assert (=> b!128104 m!149645))

(declare-fun m!149647 () Bool)

(assert (=> b!128104 m!149647))

(declare-fun m!149649 () Bool)

(assert (=> b!128104 m!149649))

(assert (=> b!128104 m!149645))

(assert (=> b!128104 m!149633))

(declare-fun m!149651 () Bool)

(assert (=> b!128104 m!149651))

(declare-fun m!149653 () Bool)

(assert (=> b!128104 m!149653))

(declare-fun m!149655 () Bool)

(assert (=> b!128104 m!149655))

(assert (=> b!128104 m!149653))

(declare-fun m!149657 () Bool)

(assert (=> b!128104 m!149657))

(assert (=> b!128099 m!149575))

(assert (=> b!128099 m!149575))

(declare-fun m!149659 () Bool)

(assert (=> b!128099 m!149659))

(declare-fun m!149661 () Bool)

(assert (=> bm!13836 m!149661))

(assert (=> b!128100 m!149575))

(assert (=> b!128100 m!149575))

(declare-fun m!149663 () Bool)

(assert (=> b!128100 m!149663))

(assert (=> b!128098 m!149575))

(assert (=> b!128098 m!149575))

(assert (=> b!128098 m!149663))

(declare-fun m!149665 () Bool)

(assert (=> b!128095 m!149665))

(declare-fun m!149667 () Bool)

(assert (=> b!128092 m!149667))

(assert (=> bm!13838 m!149655))

(assert (=> b!128042 d!38707))

(declare-fun d!38709 () Bool)

(assert (=> d!38709 (= (apply!112 lt!66050 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5294 () Bool)

(assert (= bs!5294 d!38709))

(declare-fun m!149669 () Bool)

(assert (=> bs!5294 m!149669))

(assert (=> bs!5294 m!149669))

(declare-fun m!149671 () Bool)

(assert (=> bs!5294 m!149671))

(assert (=> b!127901 d!38709))

(declare-fun d!38711 () Bool)

(assert (=> d!38711 (= (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127902 d!38711))

(assert (=> d!38675 d!38679))

(declare-fun d!38713 () Bool)

(declare-fun res!61845 () Bool)

(declare-fun e!83654 () Bool)

(assert (=> d!38713 (=> (not res!61845) (not e!83654))))

(assert (=> d!38713 (= res!61845 (simpleValid!88 (_2!1292 lt!66148)))))

(assert (=> d!38713 (= (valid!519 (_2!1292 lt!66148)) e!83654)))

(declare-fun b!128105 () Bool)

(declare-fun res!61846 () Bool)

(assert (=> b!128105 (=> (not res!61846) (not e!83654))))

(assert (=> b!128105 (= res!61846 (= (arrayCountValidKeys!0 (_keys!4540 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))) (_size!585 (_2!1292 lt!66148))))))

(declare-fun b!128106 () Bool)

(declare-fun res!61847 () Bool)

(assert (=> b!128106 (=> (not res!61847) (not e!83654))))

(assert (=> b!128106 (= res!61847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148))))))

(declare-fun b!128107 () Bool)

(assert (=> b!128107 (= e!83654 (arrayNoDuplicates!0 (_keys!4540 (_2!1292 lt!66148)) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38713 res!61845) b!128105))

(assert (= (and b!128105 res!61846) b!128106))

(assert (= (and b!128106 res!61847) b!128107))

(declare-fun m!149673 () Bool)

(assert (=> d!38713 m!149673))

(declare-fun m!149675 () Bool)

(assert (=> b!128105 m!149675))

(declare-fun m!149677 () Bool)

(assert (=> b!128106 m!149677))

(declare-fun m!149679 () Bool)

(assert (=> b!128107 m!149679))

(assert (=> d!38689 d!38713))

(assert (=> d!38689 d!38685))

(declare-fun d!38715 () Bool)

(assert (=> d!38715 (= (apply!112 lt!66050 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1456 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5295 () Bool)

(assert (= bs!5295 d!38715))

(assert (=> bs!5295 m!149447))

(declare-fun m!149681 () Bool)

(assert (=> bs!5295 m!149681))

(assert (=> bs!5295 m!149681))

(declare-fun m!149683 () Bool)

(assert (=> bs!5295 m!149683))

(assert (=> b!127895 d!38715))

(declare-fun d!38717 () Bool)

(declare-fun c!23485 () Bool)

(assert (=> d!38717 (= c!23485 ((_ is ValueCellFull!1082) (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!83655 () V!3449)

(assert (=> d!38717 (= (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83655)))

(declare-fun b!128108 () Bool)

(assert (=> b!128108 (= e!83655 (get!1454 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128109 () Bool)

(assert (=> b!128109 (= e!83655 (get!1455 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38717 c!23485) b!128108))

(assert (= (and d!38717 (not c!23485)) b!128109))

(assert (=> b!128108 m!149443))

(assert (=> b!128108 m!149341))

(declare-fun m!149685 () Bool)

(assert (=> b!128108 m!149685))

(assert (=> b!128109 m!149443))

(assert (=> b!128109 m!149341))

(declare-fun m!149687 () Bool)

(assert (=> b!128109 m!149687))

(assert (=> b!127895 d!38717))

(declare-fun d!38719 () Bool)

(assert (=> d!38719 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66200 () Unit!3980)

(declare-fun choose!783 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3980)

(assert (=> d!38719 (= lt!66200 (choose!783 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66154 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38719 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38719 (= (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66154 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)) lt!66200)))

(declare-fun bs!5296 () Bool)

(assert (= bs!5296 d!38719))

(assert (=> bs!5296 m!149437))

(assert (=> bs!5296 m!149585))

(assert (=> bs!5296 m!149343))

(declare-fun m!149689 () Bool)

(assert (=> bs!5296 m!149689))

(assert (=> bs!5296 m!149343))

(declare-fun m!149691 () Bool)

(assert (=> bs!5296 m!149691))

(assert (=> bs!5296 m!149437))

(declare-fun m!149693 () Bool)

(assert (=> bs!5296 m!149693))

(assert (=> b!128013 d!38719))

(declare-fun d!38721 () Bool)

(declare-fun e!83658 () Bool)

(assert (=> d!38721 e!83658))

(declare-fun res!61852 () Bool)

(assert (=> d!38721 (=> (not res!61852) (not e!83658))))

(declare-fun lt!66212 () ListLongMap!1657)

(assert (=> d!38721 (= res!61852 (contains!873 lt!66212 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66211 () List!1698)

(assert (=> d!38721 (= lt!66212 (ListLongMap!1658 lt!66211))))

(declare-fun lt!66210 () Unit!3980)

(declare-fun lt!66209 () Unit!3980)

(assert (=> d!38721 (= lt!66210 lt!66209)))

(assert (=> d!38721 (= (getValueByKey!166 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!84 (List!1698 (_ BitVec 64) V!3449) Unit!3980)

(assert (=> d!38721 (= lt!66209 (lemmaContainsTupThenGetReturnValue!84 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun insertStrictlySorted!87 (List!1698 (_ BitVec 64) V!3449) List!1698)

(assert (=> d!38721 (= lt!66211 (insertStrictlySorted!87 (toList!844 call!13763) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38721 (= (+!159 call!13763 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66212)))

(declare-fun b!128114 () Bool)

(declare-fun res!61853 () Bool)

(assert (=> b!128114 (=> (not res!61853) (not e!83658))))

(assert (=> b!128114 (= res!61853 (= (getValueByKey!166 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128115 () Bool)

(declare-fun contains!874 (List!1698 tuple2!2560) Bool)

(assert (=> b!128115 (= e!83658 (contains!874 (toList!844 lt!66212) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38721 res!61852) b!128114))

(assert (= (and b!128114 res!61853) b!128115))

(declare-fun m!149695 () Bool)

(assert (=> d!38721 m!149695))

(declare-fun m!149697 () Bool)

(assert (=> d!38721 m!149697))

(declare-fun m!149699 () Bool)

(assert (=> d!38721 m!149699))

(declare-fun m!149701 () Bool)

(assert (=> d!38721 m!149701))

(declare-fun m!149703 () Bool)

(assert (=> b!128114 m!149703))

(declare-fun m!149705 () Bool)

(assert (=> b!128115 m!149705))

(assert (=> b!127896 d!38721))

(assert (=> d!38673 d!38707))

(declare-fun lt!66220 () SeekEntryResult!274)

(declare-fun d!38723 () Bool)

(assert (=> d!38723 (and (or ((_ is Undefined!274) lt!66220) (not ((_ is Found!274) lt!66220)) (and (bvsge (index!3253 lt!66220) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66220) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66220) ((_ is Found!274) lt!66220) (not ((_ is MissingZero!274) lt!66220)) (and (bvsge (index!3252 lt!66220) #b00000000000000000000000000000000) (bvslt (index!3252 lt!66220) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66220) ((_ is Found!274) lt!66220) ((_ is MissingZero!274) lt!66220) (not ((_ is MissingVacant!274) lt!66220)) (and (bvsge (index!3255 lt!66220) #b00000000000000000000000000000000) (bvslt (index!3255 lt!66220) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66220) (ite ((_ is Found!274) lt!66220) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66220)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite ((_ is MissingZero!274) lt!66220) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66220)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!274) lt!66220) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66220)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83667 () SeekEntryResult!274)

(assert (=> d!38723 (= lt!66220 e!83667)))

(declare-fun c!23493 () Bool)

(declare-fun lt!66221 () SeekEntryResult!274)

(assert (=> d!38723 (= c!23493 (and ((_ is Intermediate!274) lt!66221) (undefined!1086 lt!66221)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4701 (_ BitVec 32)) SeekEntryResult!274)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!38723 (= lt!66221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (=> d!38723 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38723 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)) lt!66220)))

(declare-fun b!128128 () Bool)

(assert (=> b!128128 (= e!83667 Undefined!274)))

(declare-fun b!128129 () Bool)

(declare-fun e!83666 () SeekEntryResult!274)

(assert (=> b!128129 (= e!83666 (Found!274 (index!3254 lt!66221)))))

(declare-fun b!128130 () Bool)

(declare-fun e!83665 () SeekEntryResult!274)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4701 (_ BitVec 32)) SeekEntryResult!274)

(assert (=> b!128130 (= e!83665 (seekKeyOrZeroReturnVacant!0 (x!15124 lt!66221) (index!3254 lt!66221) (index!3254 lt!66221) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!128131 () Bool)

(declare-fun c!23494 () Bool)

(declare-fun lt!66219 () (_ BitVec 64))

(assert (=> b!128131 (= c!23494 (= lt!66219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128131 (= e!83666 e!83665)))

(declare-fun b!128132 () Bool)

(assert (=> b!128132 (= e!83665 (MissingZero!274 (index!3254 lt!66221)))))

(declare-fun b!128133 () Bool)

(assert (=> b!128133 (= e!83667 e!83666)))

(assert (=> b!128133 (= lt!66219 (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66221)))))

(declare-fun c!23492 () Bool)

(assert (=> b!128133 (= c!23492 (= lt!66219 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38723 c!23493) b!128128))

(assert (= (and d!38723 (not c!23493)) b!128133))

(assert (= (and b!128133 c!23492) b!128129))

(assert (= (and b!128133 (not c!23492)) b!128131))

(assert (= (and b!128131 c!23494) b!128132))

(assert (= (and b!128131 (not c!23494)) b!128130))

(assert (=> d!38723 m!149585))

(declare-fun m!149707 () Bool)

(assert (=> d!38723 m!149707))

(assert (=> d!38723 m!149345))

(declare-fun m!149709 () Bool)

(assert (=> d!38723 m!149709))

(declare-fun m!149711 () Bool)

(assert (=> d!38723 m!149711))

(assert (=> d!38723 m!149709))

(assert (=> d!38723 m!149345))

(declare-fun m!149713 () Bool)

(assert (=> d!38723 m!149713))

(declare-fun m!149715 () Bool)

(assert (=> d!38723 m!149715))

(assert (=> b!128130 m!149345))

(declare-fun m!149717 () Bool)

(assert (=> b!128130 m!149717))

(declare-fun m!149719 () Bool)

(assert (=> b!128133 m!149719))

(assert (=> b!128038 d!38723))

(declare-fun bm!13840 () Bool)

(declare-fun call!13846 () Bool)

(declare-fun lt!66227 () ListLongMap!1657)

(assert (=> bm!13840 (= call!13846 (contains!873 lt!66227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13841 () Bool)

(declare-fun call!13847 () ListLongMap!1657)

(declare-fun call!13849 () ListLongMap!1657)

(assert (=> bm!13841 (= call!13847 call!13849)))

(declare-fun b!128134 () Bool)

(declare-fun e!83672 () Unit!3980)

(declare-fun Unit!3988 () Unit!3980)

(assert (=> b!128134 (= e!83672 Unit!3988)))

(declare-fun b!128135 () Bool)

(declare-fun e!83670 () Bool)

(declare-fun call!13848 () Bool)

(assert (=> b!128135 (= e!83670 (not call!13848))))

(declare-fun b!128136 () Bool)

(declare-fun e!83677 () Bool)

(assert (=> b!128136 (= e!83670 e!83677)))

(declare-fun res!61855 () Bool)

(assert (=> b!128136 (= res!61855 call!13848)))

(assert (=> b!128136 (=> (not res!61855) (not e!83677))))

(declare-fun b!128137 () Bool)

(declare-fun res!61854 () Bool)

(declare-fun e!83676 () Bool)

(assert (=> b!128137 (=> (not res!61854) (not e!83676))))

(declare-fun e!83669 () Bool)

(assert (=> b!128137 (= res!61854 e!83669)))

(declare-fun res!61861 () Bool)

(assert (=> b!128137 (=> res!61861 e!83669)))

(declare-fun e!83678 () Bool)

(assert (=> b!128137 (= res!61861 (not e!83678))))

(declare-fun res!61856 () Bool)

(assert (=> b!128137 (=> (not res!61856) (not e!83678))))

(assert (=> b!128137 (= res!61856 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128138 () Bool)

(declare-fun e!83680 () ListLongMap!1657)

(declare-fun e!83668 () ListLongMap!1657)

(assert (=> b!128138 (= e!83680 e!83668)))

(declare-fun c!23497 () Bool)

(assert (=> b!128138 (= c!23497 (and (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128139 () Bool)

(declare-fun e!83673 () Bool)

(assert (=> b!128139 (= e!83673 (not call!13846))))

(declare-fun d!38725 () Bool)

(assert (=> d!38725 e!83676))

(declare-fun res!61860 () Bool)

(assert (=> d!38725 (=> (not res!61860) (not e!83676))))

(assert (=> d!38725 (= res!61860 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66224 () ListLongMap!1657)

(assert (=> d!38725 (= lt!66227 lt!66224)))

(declare-fun lt!66236 () Unit!3980)

(assert (=> d!38725 (= lt!66236 e!83672)))

(declare-fun c!23496 () Bool)

(declare-fun e!83671 () Bool)

(assert (=> d!38725 (= c!23496 e!83671)))

(declare-fun res!61858 () Bool)

(assert (=> d!38725 (=> (not res!61858) (not e!83671))))

(assert (=> d!38725 (= res!61858 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38725 (= lt!66224 e!83680)))

(declare-fun c!23495 () Bool)

(assert (=> d!38725 (= c!23495 (and (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38725 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38725 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66227)))

(declare-fun b!128140 () Bool)

(assert (=> b!128140 (= e!83668 call!13847)))

(declare-fun e!83679 () Bool)

(declare-fun b!128141 () Bool)

(assert (=> b!128141 (= e!83679 (= (apply!112 lt!66227 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152))))))

(assert (=> b!128141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128142 () Bool)

(assert (=> b!128142 (= e!83680 (+!159 call!13849 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!128143 () Bool)

(assert (=> b!128143 (= e!83676 e!83673)))

(declare-fun c!23499 () Bool)

(assert (=> b!128143 (= c!23499 (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128144 () Bool)

(declare-fun e!83674 () ListLongMap!1657)

(assert (=> b!128144 (= e!83674 call!13847)))

(declare-fun bm!13842 () Bool)

(declare-fun call!13844 () ListLongMap!1657)

(declare-fun call!13845 () ListLongMap!1657)

(assert (=> bm!13842 (= call!13844 call!13845)))

(declare-fun call!13843 () ListLongMap!1657)

(declare-fun bm!13843 () Bool)

(assert (=> bm!13843 (= call!13849 (+!159 (ite c!23495 call!13845 (ite c!23497 call!13844 call!13843)) (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128145 () Bool)

(declare-fun e!83675 () Bool)

(assert (=> b!128145 (= e!83675 (= (apply!112 lt!66227 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128146 () Bool)

(assert (=> b!128146 (= e!83674 call!13843)))

(declare-fun b!128147 () Bool)

(assert (=> b!128147 (= e!83677 (= (apply!112 lt!66227 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))

(declare-fun b!128148 () Bool)

(assert (=> b!128148 (= e!83678 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13844 () Bool)

(assert (=> bm!13844 (= call!13843 call!13844)))

(declare-fun bm!13845 () Bool)

(assert (=> bm!13845 (= call!13845 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128149 () Bool)

(assert (=> b!128149 (= e!83669 e!83679)))

(declare-fun res!61857 () Bool)

(assert (=> b!128149 (=> (not res!61857) (not e!83679))))

(assert (=> b!128149 (= res!61857 (contains!873 lt!66227 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128149 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13846 () Bool)

(assert (=> bm!13846 (= call!13848 (contains!873 lt!66227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128150 () Bool)

(assert (=> b!128150 (= e!83671 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128151 () Bool)

(assert (=> b!128151 (= e!83673 e!83675)))

(declare-fun res!61859 () Bool)

(assert (=> b!128151 (= res!61859 call!13846)))

(assert (=> b!128151 (=> (not res!61859) (not e!83675))))

(declare-fun b!128152 () Bool)

(declare-fun res!61862 () Bool)

(assert (=> b!128152 (=> (not res!61862) (not e!83676))))

(assert (=> b!128152 (= res!61862 e!83670)))

(declare-fun c!23500 () Bool)

(assert (=> b!128152 (= c!23500 (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128153 () Bool)

(declare-fun c!23498 () Bool)

(assert (=> b!128153 (= c!23498 (and (not (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128153 (= e!83668 e!83674)))

(declare-fun b!128154 () Bool)

(declare-fun lt!66232 () Unit!3980)

(assert (=> b!128154 (= e!83672 lt!66232)))

(declare-fun lt!66233 () ListLongMap!1657)

(assert (=> b!128154 (= lt!66233 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66231 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66238 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66238 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66228 () Unit!3980)

(assert (=> b!128154 (= lt!66228 (addStillContains!88 lt!66233 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66238))))

(assert (=> b!128154 (contains!873 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66238)))

(declare-fun lt!66223 () Unit!3980)

(assert (=> b!128154 (= lt!66223 lt!66228)))

(declare-fun lt!66229 () ListLongMap!1657)

(assert (=> b!128154 (= lt!66229 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66225 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66225 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66235 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66235 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66243 () Unit!3980)

(assert (=> b!128154 (= lt!66243 (addApplyDifferent!88 lt!66229 lt!66225 (minValue!2665 newMap!16) lt!66235))))

(assert (=> b!128154 (= (apply!112 (+!159 lt!66229 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) lt!66235) (apply!112 lt!66229 lt!66235))))

(declare-fun lt!66239 () Unit!3980)

(assert (=> b!128154 (= lt!66239 lt!66243)))

(declare-fun lt!66242 () ListLongMap!1657)

(assert (=> b!128154 (= lt!66242 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66237 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66222 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66222 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66226 () Unit!3980)

(assert (=> b!128154 (= lt!66226 (addApplyDifferent!88 lt!66242 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66222))))

(assert (=> b!128154 (= (apply!112 (+!159 lt!66242 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66222) (apply!112 lt!66242 lt!66222))))

(declare-fun lt!66234 () Unit!3980)

(assert (=> b!128154 (= lt!66234 lt!66226)))

(declare-fun lt!66240 () ListLongMap!1657)

(assert (=> b!128154 (= lt!66240 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66241 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66241 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66230 () (_ BitVec 64))

(assert (=> b!128154 (= lt!66230 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128154 (= lt!66232 (addApplyDifferent!88 lt!66240 lt!66241 (minValue!2665 newMap!16) lt!66230))))

(assert (=> b!128154 (= (apply!112 (+!159 lt!66240 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) lt!66230) (apply!112 lt!66240 lt!66230))))

(assert (= (and d!38725 c!23495) b!128142))

(assert (= (and d!38725 (not c!23495)) b!128138))

(assert (= (and b!128138 c!23497) b!128140))

(assert (= (and b!128138 (not c!23497)) b!128153))

(assert (= (and b!128153 c!23498) b!128144))

(assert (= (and b!128153 (not c!23498)) b!128146))

(assert (= (or b!128144 b!128146) bm!13844))

(assert (= (or b!128140 bm!13844) bm!13842))

(assert (= (or b!128140 b!128144) bm!13841))

(assert (= (or b!128142 bm!13842) bm!13845))

(assert (= (or b!128142 bm!13841) bm!13843))

(assert (= (and d!38725 res!61858) b!128150))

(assert (= (and d!38725 c!23496) b!128154))

(assert (= (and d!38725 (not c!23496)) b!128134))

(assert (= (and d!38725 res!61860) b!128137))

(assert (= (and b!128137 res!61856) b!128148))

(assert (= (and b!128137 (not res!61861)) b!128149))

(assert (= (and b!128149 res!61857) b!128141))

(assert (= (and b!128137 res!61854) b!128152))

(assert (= (and b!128152 c!23500) b!128136))

(assert (= (and b!128152 (not c!23500)) b!128135))

(assert (= (and b!128136 res!61855) b!128147))

(assert (= (or b!128136 b!128135) bm!13846))

(assert (= (and b!128152 res!61862) b!128143))

(assert (= (and b!128143 c!23499) b!128151))

(assert (= (and b!128143 (not c!23499)) b!128139))

(assert (= (and b!128151 res!61859) b!128145))

(assert (= (or b!128151 b!128139) bm!13840))

(declare-fun b_lambda!5655 () Bool)

(assert (=> (not b_lambda!5655) (not b!128141)))

(assert (=> b!128141 t!6080))

(declare-fun b_and!7901 () Bool)

(assert (= b_and!7897 (and (=> t!6080 result!3889) b_and!7901)))

(assert (=> b!128141 t!6082))

(declare-fun b_and!7903 () Bool)

(assert (= b_and!7899 (and (=> t!6082 result!3891) b_and!7903)))

(declare-fun m!149721 () Bool)

(assert (=> bm!13846 m!149721))

(declare-fun m!149723 () Bool)

(assert (=> b!128147 m!149723))

(assert (=> b!128141 m!149617))

(declare-fun m!149725 () Bool)

(assert (=> b!128141 m!149725))

(assert (=> b!128141 m!149617))

(declare-fun m!149727 () Bool)

(assert (=> b!128141 m!149727))

(assert (=> b!128141 m!149575))

(declare-fun m!149729 () Bool)

(assert (=> b!128141 m!149729))

(assert (=> b!128141 m!149725))

(assert (=> b!128141 m!149575))

(declare-fun m!149731 () Bool)

(assert (=> bm!13840 m!149731))

(assert (=> d!38725 m!149585))

(declare-fun m!149733 () Bool)

(assert (=> b!128154 m!149733))

(declare-fun m!149735 () Bool)

(assert (=> b!128154 m!149735))

(declare-fun m!149737 () Bool)

(assert (=> b!128154 m!149737))

(declare-fun m!149739 () Bool)

(assert (=> b!128154 m!149739))

(declare-fun m!149741 () Bool)

(assert (=> b!128154 m!149741))

(declare-fun m!149743 () Bool)

(assert (=> b!128154 m!149743))

(assert (=> b!128154 m!149733))

(declare-fun m!149745 () Bool)

(assert (=> b!128154 m!149745))

(declare-fun m!149747 () Bool)

(assert (=> b!128154 m!149747))

(declare-fun m!149749 () Bool)

(assert (=> b!128154 m!149749))

(assert (=> b!128154 m!149575))

(declare-fun m!149751 () Bool)

(assert (=> b!128154 m!149751))

(declare-fun m!149753 () Bool)

(assert (=> b!128154 m!149753))

(declare-fun m!149755 () Bool)

(assert (=> b!128154 m!149755))

(assert (=> b!128154 m!149751))

(assert (=> b!128154 m!149739))

(declare-fun m!149757 () Bool)

(assert (=> b!128154 m!149757))

(declare-fun m!149759 () Bool)

(assert (=> b!128154 m!149759))

(declare-fun m!149761 () Bool)

(assert (=> b!128154 m!149761))

(assert (=> b!128154 m!149759))

(declare-fun m!149763 () Bool)

(assert (=> b!128154 m!149763))

(assert (=> b!128149 m!149575))

(assert (=> b!128149 m!149575))

(declare-fun m!149765 () Bool)

(assert (=> b!128149 m!149765))

(declare-fun m!149767 () Bool)

(assert (=> bm!13843 m!149767))

(assert (=> b!128150 m!149575))

(assert (=> b!128150 m!149575))

(assert (=> b!128150 m!149663))

(assert (=> b!128148 m!149575))

(assert (=> b!128148 m!149575))

(assert (=> b!128148 m!149663))

(declare-fun m!149769 () Bool)

(assert (=> b!128145 m!149769))

(declare-fun m!149771 () Bool)

(assert (=> b!128142 m!149771))

(assert (=> bm!13845 m!149761))

(assert (=> bm!13821 d!38725))

(declare-fun bm!13847 () Bool)

(declare-fun call!13853 () Bool)

(declare-fun lt!66249 () ListLongMap!1657)

(assert (=> bm!13847 (= call!13853 (contains!873 lt!66249 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13848 () Bool)

(declare-fun call!13854 () ListLongMap!1657)

(declare-fun call!13856 () ListLongMap!1657)

(assert (=> bm!13848 (= call!13854 call!13856)))

(declare-fun b!128155 () Bool)

(declare-fun e!83685 () Unit!3980)

(declare-fun Unit!3989 () Unit!3980)

(assert (=> b!128155 (= e!83685 Unit!3989)))

(declare-fun b!128156 () Bool)

(declare-fun e!83683 () Bool)

(declare-fun call!13855 () Bool)

(assert (=> b!128156 (= e!83683 (not call!13855))))

(declare-fun b!128157 () Bool)

(declare-fun e!83690 () Bool)

(assert (=> b!128157 (= e!83683 e!83690)))

(declare-fun res!61864 () Bool)

(assert (=> b!128157 (= res!61864 call!13855)))

(assert (=> b!128157 (=> (not res!61864) (not e!83690))))

(declare-fun b!128158 () Bool)

(declare-fun res!61863 () Bool)

(declare-fun e!83689 () Bool)

(assert (=> b!128158 (=> (not res!61863) (not e!83689))))

(declare-fun e!83682 () Bool)

(assert (=> b!128158 (= res!61863 e!83682)))

(declare-fun res!61870 () Bool)

(assert (=> b!128158 (=> res!61870 e!83682)))

(declare-fun e!83691 () Bool)

(assert (=> b!128158 (= res!61870 (not e!83691))))

(declare-fun res!61865 () Bool)

(assert (=> b!128158 (=> (not res!61865) (not e!83691))))

(assert (=> b!128158 (= res!61865 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128159 () Bool)

(declare-fun e!83693 () ListLongMap!1657)

(declare-fun e!83681 () ListLongMap!1657)

(assert (=> b!128159 (= e!83693 e!83681)))

(declare-fun c!23503 () Bool)

(assert (=> b!128159 (= c!23503 (and (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128160 () Bool)

(declare-fun e!83686 () Bool)

(assert (=> b!128160 (= e!83686 (not call!13853))))

(declare-fun d!38727 () Bool)

(assert (=> d!38727 e!83689))

(declare-fun res!61869 () Bool)

(assert (=> d!38727 (=> (not res!61869) (not e!83689))))

(assert (=> d!38727 (= res!61869 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66246 () ListLongMap!1657)

(assert (=> d!38727 (= lt!66249 lt!66246)))

(declare-fun lt!66258 () Unit!3980)

(assert (=> d!38727 (= lt!66258 e!83685)))

(declare-fun c!23502 () Bool)

(declare-fun e!83684 () Bool)

(assert (=> d!38727 (= c!23502 e!83684)))

(declare-fun res!61867 () Bool)

(assert (=> d!38727 (=> (not res!61867) (not e!83684))))

(assert (=> d!38727 (= res!61867 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38727 (= lt!66246 e!83693)))

(declare-fun c!23501 () Bool)

(assert (=> d!38727 (= c!23501 (and (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38727 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38727 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66249)))

(declare-fun b!128161 () Bool)

(assert (=> b!128161 (= e!83681 call!13854)))

(declare-fun e!83692 () Bool)

(declare-fun b!128162 () Bool)

(assert (=> b!128162 (= e!83692 (= (apply!112 lt!66249 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))))))))

(assert (=> b!128162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128163 () Bool)

(assert (=> b!128163 (= e!83693 (+!159 call!13856 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(declare-fun b!128164 () Bool)

(assert (=> b!128164 (= e!83689 e!83686)))

(declare-fun c!23505 () Bool)

(assert (=> b!128164 (= c!23505 (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128165 () Bool)

(declare-fun e!83687 () ListLongMap!1657)

(assert (=> b!128165 (= e!83687 call!13854)))

(declare-fun bm!13849 () Bool)

(declare-fun call!13851 () ListLongMap!1657)

(declare-fun call!13852 () ListLongMap!1657)

(assert (=> bm!13849 (= call!13851 call!13852)))

(declare-fun bm!13850 () Bool)

(declare-fun call!13850 () ListLongMap!1657)

(assert (=> bm!13850 (= call!13856 (+!159 (ite c!23501 call!13852 (ite c!23503 call!13851 call!13850)) (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun b!128166 () Bool)

(declare-fun e!83688 () Bool)

(assert (=> b!128166 (= e!83688 (= (apply!112 lt!66249 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))

(declare-fun b!128167 () Bool)

(assert (=> b!128167 (= e!83687 call!13850)))

(declare-fun b!128168 () Bool)

(assert (=> b!128168 (= e!83690 (= (apply!112 lt!66249 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128169 () Bool)

(assert (=> b!128169 (= e!83691 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13851 () Bool)

(assert (=> bm!13851 (= call!13850 call!13851)))

(declare-fun bm!13852 () Bool)

(assert (=> bm!13852 (= call!13852 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128170 () Bool)

(assert (=> b!128170 (= e!83682 e!83692)))

(declare-fun res!61866 () Bool)

(assert (=> b!128170 (=> (not res!61866) (not e!83692))))

(assert (=> b!128170 (= res!61866 (contains!873 lt!66249 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13853 () Bool)

(assert (=> bm!13853 (= call!13855 (contains!873 lt!66249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128171 () Bool)

(assert (=> b!128171 (= e!83684 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128172 () Bool)

(assert (=> b!128172 (= e!83686 e!83688)))

(declare-fun res!61868 () Bool)

(assert (=> b!128172 (= res!61868 call!13853)))

(assert (=> b!128172 (=> (not res!61868) (not e!83688))))

(declare-fun b!128173 () Bool)

(declare-fun res!61871 () Bool)

(assert (=> b!128173 (=> (not res!61871) (not e!83689))))

(assert (=> b!128173 (= res!61871 e!83683)))

(declare-fun c!23506 () Bool)

(assert (=> b!128173 (= c!23506 (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!23504 () Bool)

(declare-fun b!128174 () Bool)

(assert (=> b!128174 (= c!23504 (and (not (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128174 (= e!83681 e!83687)))

(declare-fun b!128175 () Bool)

(declare-fun lt!66254 () Unit!3980)

(assert (=> b!128175 (= e!83685 lt!66254)))

(declare-fun lt!66255 () ListLongMap!1657)

(assert (=> b!128175 (= lt!66255 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66253 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66260 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66260 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66250 () Unit!3980)

(assert (=> b!128175 (= lt!66250 (addStillContains!88 lt!66255 lt!66253 (zeroValue!2665 newMap!16) lt!66260))))

(assert (=> b!128175 (contains!873 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) lt!66260)))

(declare-fun lt!66245 () Unit!3980)

(assert (=> b!128175 (= lt!66245 lt!66250)))

(declare-fun lt!66251 () ListLongMap!1657)

(assert (=> b!128175 (= lt!66251 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66247 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66257 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66257 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66265 () Unit!3980)

(assert (=> b!128175 (= lt!66265 (addApplyDifferent!88 lt!66251 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66257))))

(assert (=> b!128175 (= (apply!112 (+!159 lt!66251 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66257) (apply!112 lt!66251 lt!66257))))

(declare-fun lt!66261 () Unit!3980)

(assert (=> b!128175 (= lt!66261 lt!66265)))

(declare-fun lt!66264 () ListLongMap!1657)

(assert (=> b!128175 (= lt!66264 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66259 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66259 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66244 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66244 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66248 () Unit!3980)

(assert (=> b!128175 (= lt!66248 (addApplyDifferent!88 lt!66264 lt!66259 (zeroValue!2665 newMap!16) lt!66244))))

(assert (=> b!128175 (= (apply!112 (+!159 lt!66264 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) lt!66244) (apply!112 lt!66264 lt!66244))))

(declare-fun lt!66256 () Unit!3980)

(assert (=> b!128175 (= lt!66256 lt!66248)))

(declare-fun lt!66262 () ListLongMap!1657)

(assert (=> b!128175 (= lt!66262 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66263 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66263 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66252 () (_ BitVec 64))

(assert (=> b!128175 (= lt!66252 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128175 (= lt!66254 (addApplyDifferent!88 lt!66262 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66252))))

(assert (=> b!128175 (= (apply!112 (+!159 lt!66262 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66252) (apply!112 lt!66262 lt!66252))))

(assert (= (and d!38727 c!23501) b!128163))

(assert (= (and d!38727 (not c!23501)) b!128159))

(assert (= (and b!128159 c!23503) b!128161))

(assert (= (and b!128159 (not c!23503)) b!128174))

(assert (= (and b!128174 c!23504) b!128165))

(assert (= (and b!128174 (not c!23504)) b!128167))

(assert (= (or b!128165 b!128167) bm!13851))

(assert (= (or b!128161 bm!13851) bm!13849))

(assert (= (or b!128161 b!128165) bm!13848))

(assert (= (or b!128163 bm!13849) bm!13852))

(assert (= (or b!128163 bm!13848) bm!13850))

(assert (= (and d!38727 res!61867) b!128171))

(assert (= (and d!38727 c!23502) b!128175))

(assert (= (and d!38727 (not c!23502)) b!128155))

(assert (= (and d!38727 res!61869) b!128158))

(assert (= (and b!128158 res!61865) b!128169))

(assert (= (and b!128158 (not res!61870)) b!128170))

(assert (= (and b!128170 res!61866) b!128162))

(assert (= (and b!128158 res!61863) b!128173))

(assert (= (and b!128173 c!23506) b!128157))

(assert (= (and b!128173 (not c!23506)) b!128156))

(assert (= (and b!128157 res!61864) b!128168))

(assert (= (or b!128157 b!128156) bm!13853))

(assert (= (and b!128173 res!61871) b!128164))

(assert (= (and b!128164 c!23505) b!128172))

(assert (= (and b!128164 (not c!23505)) b!128160))

(assert (= (and b!128172 res!61868) b!128166))

(assert (= (or b!128172 b!128160) bm!13847))

(declare-fun b_lambda!5657 () Bool)

(assert (=> (not b_lambda!5657) (not b!128162)))

(assert (=> b!128162 t!6080))

(declare-fun b_and!7905 () Bool)

(assert (= b_and!7901 (and (=> t!6080 result!3889) b_and!7905)))

(assert (=> b!128162 t!6082))

(declare-fun b_and!7907 () Bool)

(assert (= b_and!7903 (and (=> t!6082 result!3891) b_and!7907)))

(declare-fun m!149773 () Bool)

(assert (=> bm!13853 m!149773))

(declare-fun m!149775 () Bool)

(assert (=> b!128168 m!149775))

(assert (=> b!128162 m!149617))

(declare-fun m!149777 () Bool)

(assert (=> b!128162 m!149777))

(assert (=> b!128162 m!149617))

(declare-fun m!149779 () Bool)

(assert (=> b!128162 m!149779))

(assert (=> b!128162 m!149575))

(declare-fun m!149781 () Bool)

(assert (=> b!128162 m!149781))

(assert (=> b!128162 m!149777))

(assert (=> b!128162 m!149575))

(declare-fun m!149783 () Bool)

(assert (=> bm!13847 m!149783))

(assert (=> d!38727 m!149585))

(declare-fun m!149785 () Bool)

(assert (=> b!128175 m!149785))

(declare-fun m!149787 () Bool)

(assert (=> b!128175 m!149787))

(declare-fun m!149789 () Bool)

(assert (=> b!128175 m!149789))

(declare-fun m!149791 () Bool)

(assert (=> b!128175 m!149791))

(declare-fun m!149793 () Bool)

(assert (=> b!128175 m!149793))

(declare-fun m!149795 () Bool)

(assert (=> b!128175 m!149795))

(assert (=> b!128175 m!149785))

(declare-fun m!149797 () Bool)

(assert (=> b!128175 m!149797))

(declare-fun m!149799 () Bool)

(assert (=> b!128175 m!149799))

(declare-fun m!149801 () Bool)

(assert (=> b!128175 m!149801))

(assert (=> b!128175 m!149575))

(declare-fun m!149803 () Bool)

(assert (=> b!128175 m!149803))

(declare-fun m!149805 () Bool)

(assert (=> b!128175 m!149805))

(declare-fun m!149807 () Bool)

(assert (=> b!128175 m!149807))

(assert (=> b!128175 m!149803))

(assert (=> b!128175 m!149791))

(declare-fun m!149809 () Bool)

(assert (=> b!128175 m!149809))

(declare-fun m!149811 () Bool)

(assert (=> b!128175 m!149811))

(declare-fun m!149813 () Bool)

(assert (=> b!128175 m!149813))

(assert (=> b!128175 m!149811))

(declare-fun m!149815 () Bool)

(assert (=> b!128175 m!149815))

(assert (=> b!128170 m!149575))

(assert (=> b!128170 m!149575))

(declare-fun m!149817 () Bool)

(assert (=> b!128170 m!149817))

(declare-fun m!149819 () Bool)

(assert (=> bm!13850 m!149819))

(assert (=> b!128171 m!149575))

(assert (=> b!128171 m!149575))

(assert (=> b!128171 m!149663))

(assert (=> b!128169 m!149575))

(assert (=> b!128169 m!149575))

(assert (=> b!128169 m!149663))

(declare-fun m!149821 () Bool)

(assert (=> b!128166 m!149821))

(declare-fun m!149823 () Bool)

(assert (=> b!128163 m!149823))

(assert (=> bm!13852 m!149813))

(assert (=> bm!13811 d!38727))

(declare-fun d!38729 () Bool)

(declare-fun res!61876 () Bool)

(declare-fun e!83698 () Bool)

(assert (=> d!38729 (=> res!61876 e!83698)))

(assert (=> d!38729 (= res!61876 (and ((_ is Cons!1694) (toList!844 lt!65981)) (= (_1!1291 (h!2297 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38729 (= (containsKey!170 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!83698)))

(declare-fun b!128180 () Bool)

(declare-fun e!83699 () Bool)

(assert (=> b!128180 (= e!83698 e!83699)))

(declare-fun res!61877 () Bool)

(assert (=> b!128180 (=> (not res!61877) (not e!83699))))

(assert (=> b!128180 (= res!61877 (and (or (not ((_ is Cons!1694) (toList!844 lt!65981))) (bvsle (_1!1291 (h!2297 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!844 lt!65981)) (bvslt (_1!1291 (h!2297 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(declare-fun b!128181 () Bool)

(assert (=> b!128181 (= e!83699 (containsKey!170 (t!6068 (toList!844 lt!65981)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38729 (not res!61876)) b!128180))

(assert (= (and b!128180 res!61877) b!128181))

(assert (=> b!128181 m!149345))

(declare-fun m!149825 () Bool)

(assert (=> b!128181 m!149825))

(assert (=> d!38687 d!38729))

(declare-fun d!38731 () Bool)

(declare-fun e!83700 () Bool)

(assert (=> d!38731 e!83700))

(declare-fun res!61878 () Bool)

(assert (=> d!38731 (=> (not res!61878) (not e!83700))))

(declare-fun lt!66269 () ListLongMap!1657)

(assert (=> d!38731 (= res!61878 (contains!873 lt!66269 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun lt!66268 () List!1698)

(assert (=> d!38731 (= lt!66269 (ListLongMap!1658 lt!66268))))

(declare-fun lt!66267 () Unit!3980)

(declare-fun lt!66266 () Unit!3980)

(assert (=> d!38731 (= lt!66267 lt!66266)))

(assert (=> d!38731 (= (getValueByKey!166 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (Some!171 (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38731 (= lt!66266 (lemmaContainsTupThenGetReturnValue!84 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38731 (= lt!66268 (insertStrictlySorted!87 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38731 (= (+!159 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66269)))

(declare-fun b!128182 () Bool)

(declare-fun res!61879 () Bool)

(assert (=> b!128182 (=> (not res!61879) (not e!83700))))

(assert (=> b!128182 (= res!61879 (= (getValueByKey!166 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (Some!171 (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun b!128183 () Bool)

(assert (=> b!128183 (= e!83700 (contains!874 (toList!844 lt!66269) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (= (and d!38731 res!61878) b!128182))

(assert (= (and b!128182 res!61879) b!128183))

(declare-fun m!149827 () Bool)

(assert (=> d!38731 m!149827))

(declare-fun m!149829 () Bool)

(assert (=> d!38731 m!149829))

(declare-fun m!149831 () Bool)

(assert (=> d!38731 m!149831))

(declare-fun m!149833 () Bool)

(assert (=> d!38731 m!149833))

(declare-fun m!149835 () Bool)

(assert (=> b!128182 m!149835))

(declare-fun m!149837 () Bool)

(assert (=> b!128183 m!149837))

(assert (=> bm!13757 d!38731))

(declare-fun b!128200 () Bool)

(declare-fun lt!66275 () SeekEntryResult!274)

(assert (=> b!128200 (and (bvsge (index!3252 lt!66275) #b00000000000000000000000000000000) (bvslt (index!3252 lt!66275) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!61889 () Bool)

(assert (=> b!128200 (= res!61889 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66275)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83709 () Bool)

(assert (=> b!128200 (=> (not res!61889) (not e!83709))))

(declare-fun bm!13858 () Bool)

(declare-fun c!23511 () Bool)

(declare-fun call!13862 () Bool)

(assert (=> bm!13858 (= call!13862 (inRange!0 (ite c!23511 (index!3252 lt!66275) (index!3255 lt!66275)) (mask!7071 newMap!16)))))

(declare-fun b!128201 () Bool)

(declare-fun e!83710 () Bool)

(assert (=> b!128201 (= e!83710 ((_ is Undefined!274) lt!66275))))

(declare-fun b!128202 () Bool)

(declare-fun call!13861 () Bool)

(assert (=> b!128202 (= e!83709 (not call!13861))))

(declare-fun b!128203 () Bool)

(declare-fun e!83711 () Bool)

(assert (=> b!128203 (= e!83711 e!83709)))

(declare-fun res!61890 () Bool)

(assert (=> b!128203 (= res!61890 call!13862)))

(assert (=> b!128203 (=> (not res!61890) (not e!83709))))

(declare-fun b!128204 () Bool)

(declare-fun res!61891 () Bool)

(declare-fun e!83712 () Bool)

(assert (=> b!128204 (=> (not res!61891) (not e!83712))))

(assert (=> b!128204 (= res!61891 call!13862)))

(assert (=> b!128204 (= e!83710 e!83712)))

(declare-fun bm!13859 () Bool)

(assert (=> bm!13859 (= call!13861 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128205 () Bool)

(assert (=> b!128205 (= e!83711 e!83710)))

(declare-fun c!23512 () Bool)

(assert (=> b!128205 (= c!23512 ((_ is MissingVacant!274) lt!66275))))

(declare-fun b!128206 () Bool)

(declare-fun res!61888 () Bool)

(assert (=> b!128206 (=> (not res!61888) (not e!83712))))

(assert (=> b!128206 (= res!61888 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66275)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128206 (and (bvsge (index!3255 lt!66275) #b00000000000000000000000000000000) (bvslt (index!3255 lt!66275) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun d!38733 () Bool)

(assert (=> d!38733 e!83711))

(assert (=> d!38733 (= c!23511 ((_ is MissingZero!274) lt!66275))))

(assert (=> d!38733 (= lt!66275 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun lt!66274 () Unit!3980)

(declare-fun choose!784 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3980)

(assert (=> d!38733 (= lt!66274 (choose!784 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38733 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38733 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) lt!66274)))

(declare-fun b!128207 () Bool)

(assert (=> b!128207 (= e!83712 (not call!13861))))

(assert (= (and d!38733 c!23511) b!128203))

(assert (= (and d!38733 (not c!23511)) b!128205))

(assert (= (and b!128203 res!61890) b!128200))

(assert (= (and b!128200 res!61889) b!128202))

(assert (= (and b!128205 c!23512) b!128204))

(assert (= (and b!128205 (not c!23512)) b!128201))

(assert (= (and b!128204 res!61891) b!128206))

(assert (= (and b!128206 res!61888) b!128207))

(assert (= (or b!128203 b!128204) bm!13858))

(assert (= (or b!128202 b!128207) bm!13859))

(declare-fun m!149839 () Bool)

(assert (=> bm!13858 m!149839))

(assert (=> bm!13859 m!149345))

(assert (=> bm!13859 m!149539))

(declare-fun m!149841 () Bool)

(assert (=> b!128206 m!149841))

(declare-fun m!149843 () Bool)

(assert (=> b!128200 m!149843))

(assert (=> d!38733 m!149345))

(assert (=> d!38733 m!149525))

(assert (=> d!38733 m!149345))

(declare-fun m!149845 () Bool)

(assert (=> d!38733 m!149845))

(assert (=> d!38733 m!149585))

(assert (=> bm!13830 d!38733))

(declare-fun b!128218 () Bool)

(declare-fun e!83721 () Bool)

(declare-fun e!83724 () Bool)

(assert (=> b!128218 (= e!83721 e!83724)))

(declare-fun res!61899 () Bool)

(assert (=> b!128218 (=> (not res!61899) (not e!83724))))

(declare-fun e!83723 () Bool)

(assert (=> b!128218 (= res!61899 (not e!83723))))

(declare-fun res!61900 () Bool)

(assert (=> b!128218 (=> (not res!61900) (not e!83723))))

(assert (=> b!128218 (= res!61900 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128219 () Bool)

(declare-fun e!83722 () Bool)

(declare-fun call!13865 () Bool)

(assert (=> b!128219 (= e!83722 call!13865)))

(declare-fun b!128220 () Bool)

(assert (=> b!128220 (= e!83724 e!83722)))

(declare-fun c!23515 () Bool)

(assert (=> b!128220 (= c!23515 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128221 () Bool)

(assert (=> b!128221 (= e!83722 call!13865)))

(declare-fun b!128222 () Bool)

(declare-fun contains!875 (List!1700 (_ BitVec 64)) Bool)

(assert (=> b!128222 (= e!83723 (contains!875 Nil!1697 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13862 () Bool)

(assert (=> bm!13862 (= call!13865 (arrayNoDuplicates!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23515 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!38735 () Bool)

(declare-fun res!61898 () Bool)

(assert (=> d!38735 (=> res!61898 e!83721)))

(assert (=> d!38735 (= res!61898 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38735 (= (arrayNoDuplicates!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 Nil!1697) e!83721)))

(assert (= (and d!38735 (not res!61898)) b!128218))

(assert (= (and b!128218 res!61900) b!128222))

(assert (= (and b!128218 res!61899) b!128220))

(assert (= (and b!128220 c!23515) b!128219))

(assert (= (and b!128220 (not c!23515)) b!128221))

(assert (= (or b!128219 b!128221) bm!13862))

(assert (=> b!128218 m!149575))

(assert (=> b!128218 m!149575))

(assert (=> b!128218 m!149663))

(assert (=> b!128220 m!149575))

(assert (=> b!128220 m!149575))

(assert (=> b!128220 m!149663))

(assert (=> b!128222 m!149575))

(assert (=> b!128222 m!149575))

(declare-fun m!149847 () Bool)

(assert (=> b!128222 m!149847))

(assert (=> bm!13862 m!149575))

(declare-fun m!149849 () Bool)

(assert (=> bm!13862 m!149849))

(assert (=> b!127917 d!38735))

(declare-fun d!38737 () Bool)

(declare-fun e!83726 () Bool)

(assert (=> d!38737 e!83726))

(declare-fun res!61901 () Bool)

(assert (=> d!38737 (=> res!61901 e!83726)))

(declare-fun lt!66278 () Bool)

(assert (=> d!38737 (= res!61901 (not lt!66278))))

(declare-fun lt!66279 () Bool)

(assert (=> d!38737 (= lt!66278 lt!66279)))

(declare-fun lt!66277 () Unit!3980)

(declare-fun e!83725 () Unit!3980)

(assert (=> d!38737 (= lt!66277 e!83725)))

(declare-fun c!23516 () Bool)

(assert (=> d!38737 (= c!23516 lt!66279)))

(assert (=> d!38737 (= lt!66279 (containsKey!170 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38737 (= (contains!873 call!13819 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66278)))

(declare-fun b!128223 () Bool)

(declare-fun lt!66276 () Unit!3980)

(assert (=> b!128223 (= e!83725 lt!66276)))

(assert (=> b!128223 (= lt!66276 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128223 (isDefined!120 (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128224 () Bool)

(declare-fun Unit!3990 () Unit!3980)

(assert (=> b!128224 (= e!83725 Unit!3990)))

(declare-fun b!128225 () Bool)

(assert (=> b!128225 (= e!83726 (isDefined!120 (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (= (and d!38737 c!23516) b!128223))

(assert (= (and d!38737 (not c!23516)) b!128224))

(assert (= (and d!38737 (not res!61901)) b!128225))

(assert (=> d!38737 m!149345))

(declare-fun m!149851 () Bool)

(assert (=> d!38737 m!149851))

(assert (=> b!128223 m!149345))

(declare-fun m!149853 () Bool)

(assert (=> b!128223 m!149853))

(assert (=> b!128223 m!149345))

(declare-fun m!149855 () Bool)

(assert (=> b!128223 m!149855))

(assert (=> b!128223 m!149855))

(declare-fun m!149857 () Bool)

(assert (=> b!128223 m!149857))

(assert (=> b!128225 m!149345))

(assert (=> b!128225 m!149855))

(assert (=> b!128225 m!149855))

(assert (=> b!128225 m!149857))

(assert (=> b!128009 d!38737))

(declare-fun d!38739 () Bool)

(assert (=> d!38739 (= (inRange!0 (ite c!23471 (ite c!23465 (index!3253 lt!66140) (ite c!23468 (index!3252 lt!66155) (index!3255 lt!66155))) (ite c!23473 (index!3253 lt!66157) (ite c!23470 (index!3252 lt!66153) (index!3255 lt!66153)))) (mask!7071 newMap!16)) (and (bvsge (ite c!23471 (ite c!23465 (index!3253 lt!66140) (ite c!23468 (index!3252 lt!66155) (index!3255 lt!66155))) (ite c!23473 (index!3253 lt!66157) (ite c!23470 (index!3252 lt!66153) (index!3255 lt!66153)))) #b00000000000000000000000000000000) (bvslt (ite c!23471 (ite c!23465 (index!3253 lt!66140) (ite c!23468 (index!3252 lt!66155) (index!3255 lt!66155))) (ite c!23473 (index!3253 lt!66157) (ite c!23470 (index!3252 lt!66153) (index!3255 lt!66153)))) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13829 d!38739))

(declare-fun d!38741 () Bool)

(declare-fun res!61902 () Bool)

(declare-fun e!83727 () Bool)

(assert (=> d!38741 (=> (not res!61902) (not e!83727))))

(assert (=> d!38741 (= res!61902 (simpleValid!88 (v!3138 (underlying!440 thiss!992))))))

(assert (=> d!38741 (= (valid!519 (v!3138 (underlying!440 thiss!992))) e!83727)))

(declare-fun b!128226 () Bool)

(declare-fun res!61903 () Bool)

(assert (=> b!128226 (=> (not res!61903) (not e!83727))))

(assert (=> b!128226 (= res!61903 (= (arrayCountValidKeys!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))) (_size!585 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128227 () Bool)

(declare-fun res!61904 () Bool)

(assert (=> b!128227 (=> (not res!61904) (not e!83727))))

(assert (=> b!128227 (= res!61904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128228 () Bool)

(assert (=> b!128228 (= e!83727 (arrayNoDuplicates!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38741 res!61902) b!128226))

(assert (= (and b!128226 res!61903) b!128227))

(assert (= (and b!128227 res!61904) b!128228))

(declare-fun m!149859 () Bool)

(assert (=> d!38741 m!149859))

(declare-fun m!149861 () Bool)

(assert (=> b!128226 m!149861))

(declare-fun m!149863 () Bool)

(assert (=> b!128227 m!149863))

(declare-fun m!149865 () Bool)

(assert (=> b!128228 m!149865))

(assert (=> d!38677 d!38741))

(declare-fun d!38743 () Bool)

(assert (=> d!38743 (= (apply!112 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66045) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66045)))))

(declare-fun bs!5297 () Bool)

(assert (= bs!5297 d!38743))

(declare-fun m!149867 () Bool)

(assert (=> bs!5297 m!149867))

(assert (=> bs!5297 m!149867))

(declare-fun m!149869 () Bool)

(assert (=> bs!5297 m!149869))

(assert (=> b!127908 d!38743))

(declare-fun d!38745 () Bool)

(declare-fun e!83728 () Bool)

(assert (=> d!38745 e!83728))

(declare-fun res!61905 () Bool)

(assert (=> d!38745 (=> (not res!61905) (not e!83728))))

(declare-fun lt!66283 () ListLongMap!1657)

(assert (=> d!38745 (= res!61905 (contains!873 lt!66283 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66282 () List!1698)

(assert (=> d!38745 (= lt!66283 (ListLongMap!1658 lt!66282))))

(declare-fun lt!66281 () Unit!3980)

(declare-fun lt!66280 () Unit!3980)

(assert (=> d!38745 (= lt!66281 lt!66280)))

(assert (=> d!38745 (= (getValueByKey!166 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38745 (= lt!66280 (lemmaContainsTupThenGetReturnValue!84 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38745 (= lt!66282 (insertStrictlySorted!87 (toList!844 lt!66056) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38745 (= (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66283)))

(declare-fun b!128229 () Bool)

(declare-fun res!61906 () Bool)

(assert (=> b!128229 (=> (not res!61906) (not e!83728))))

(assert (=> b!128229 (= res!61906 (= (getValueByKey!166 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128230 () Bool)

(assert (=> b!128230 (= e!83728 (contains!874 (toList!844 lt!66283) (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38745 res!61905) b!128229))

(assert (= (and b!128229 res!61906) b!128230))

(declare-fun m!149871 () Bool)

(assert (=> d!38745 m!149871))

(declare-fun m!149873 () Bool)

(assert (=> d!38745 m!149873))

(declare-fun m!149875 () Bool)

(assert (=> d!38745 m!149875))

(declare-fun m!149877 () Bool)

(assert (=> d!38745 m!149877))

(declare-fun m!149879 () Bool)

(assert (=> b!128229 m!149879))

(declare-fun m!149881 () Bool)

(assert (=> b!128230 m!149881))

(assert (=> b!127908 d!38745))

(declare-fun b!128255 () Bool)

(declare-fun e!83744 () Bool)

(declare-fun e!83743 () Bool)

(assert (=> b!128255 (= e!83744 e!83743)))

(assert (=> b!128255 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun res!61918 () Bool)

(declare-fun lt!66303 () ListLongMap!1657)

(assert (=> b!128255 (= res!61918 (contains!873 lt!66303 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128255 (=> (not res!61918) (not e!83743))))

(declare-fun b!128256 () Bool)

(declare-fun e!83747 () Bool)

(assert (=> b!128256 (= e!83747 e!83744)))

(declare-fun c!23526 () Bool)

(declare-fun e!83745 () Bool)

(assert (=> b!128256 (= c!23526 e!83745)))

(declare-fun res!61915 () Bool)

(assert (=> b!128256 (=> (not res!61915) (not e!83745))))

(assert (=> b!128256 (= res!61915 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128257 () Bool)

(declare-fun e!83746 () Bool)

(assert (=> b!128257 (= e!83744 e!83746)))

(declare-fun c!23528 () Bool)

(assert (=> b!128257 (= c!23528 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun bm!13865 () Bool)

(declare-fun call!13868 () ListLongMap!1657)

(assert (=> bm!13865 (= call!13868 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128258 () Bool)

(assert (=> b!128258 (= e!83745 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128258 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!128259 () Bool)

(declare-fun e!83749 () ListLongMap!1657)

(assert (=> b!128259 (= e!83749 (ListLongMap!1658 Nil!1695))))

(declare-fun d!38747 () Bool)

(assert (=> d!38747 e!83747))

(declare-fun res!61917 () Bool)

(assert (=> d!38747 (=> (not res!61917) (not e!83747))))

(assert (=> d!38747 (= res!61917 (not (contains!873 lt!66303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38747 (= lt!66303 e!83749)))

(declare-fun c!23525 () Bool)

(assert (=> d!38747 (= c!23525 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38747 (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992))))))

(assert (=> d!38747 (= (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))) lt!66303)))

(declare-fun b!128260 () Bool)

(assert (=> b!128260 (= e!83746 (= lt!66303 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128261 () Bool)

(declare-fun e!83748 () ListLongMap!1657)

(assert (=> b!128261 (= e!83749 e!83748)))

(declare-fun c!23527 () Bool)

(assert (=> b!128261 (= c!23527 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128262 () Bool)

(assert (=> b!128262 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> b!128262 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> b!128262 (= e!83743 (= (apply!112 lt!66303 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128263 () Bool)

(assert (=> b!128263 (= e!83748 call!13868)))

(declare-fun b!128264 () Bool)

(declare-fun lt!66301 () Unit!3980)

(declare-fun lt!66298 () Unit!3980)

(assert (=> b!128264 (= lt!66301 lt!66298)))

(declare-fun lt!66300 () (_ BitVec 64))

(declare-fun lt!66302 () (_ BitVec 64))

(declare-fun lt!66299 () ListLongMap!1657)

(declare-fun lt!66304 () V!3449)

(assert (=> b!128264 (not (contains!873 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304)) lt!66300))))

(declare-fun addStillNotContains!58 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> b!128264 (= lt!66298 (addStillNotContains!58 lt!66299 lt!66302 lt!66304 lt!66300))))

(assert (=> b!128264 (= lt!66300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128264 (= lt!66304 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128264 (= lt!66302 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!128264 (= lt!66299 call!13868)))

(assert (=> b!128264 (= e!83748 (+!159 call!13868 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128265 () Bool)

(declare-fun res!61916 () Bool)

(assert (=> b!128265 (=> (not res!61916) (not e!83747))))

(assert (=> b!128265 (= res!61916 (not (contains!873 lt!66303 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128266 () Bool)

(declare-fun isEmpty!403 (ListLongMap!1657) Bool)

(assert (=> b!128266 (= e!83746 (isEmpty!403 lt!66303))))

(assert (= (and d!38747 c!23525) b!128259))

(assert (= (and d!38747 (not c!23525)) b!128261))

(assert (= (and b!128261 c!23527) b!128264))

(assert (= (and b!128261 (not c!23527)) b!128263))

(assert (= (or b!128264 b!128263) bm!13865))

(assert (= (and d!38747 res!61917) b!128265))

(assert (= (and b!128265 res!61916) b!128256))

(assert (= (and b!128256 res!61915) b!128258))

(assert (= (and b!128256 c!23526) b!128255))

(assert (= (and b!128256 (not c!23526)) b!128257))

(assert (= (and b!128255 res!61918) b!128262))

(assert (= (and b!128257 c!23528) b!128260))

(assert (= (and b!128257 (not c!23528)) b!128266))

(declare-fun b_lambda!5659 () Bool)

(assert (=> (not b_lambda!5659) (not b!128262)))

(assert (=> b!128262 t!6065))

(declare-fun b_and!7909 () Bool)

(assert (= b_and!7905 (and (=> t!6065 result!3869) b_and!7909)))

(assert (=> b!128262 t!6067))

(declare-fun b_and!7911 () Bool)

(assert (= b_and!7907 (and (=> t!6067 result!3873) b_and!7911)))

(declare-fun b_lambda!5661 () Bool)

(assert (=> (not b_lambda!5661) (not b!128264)))

(assert (=> b!128264 t!6065))

(declare-fun b_and!7913 () Bool)

(assert (= b_and!7909 (and (=> t!6065 result!3869) b_and!7913)))

(assert (=> b!128264 t!6067))

(declare-fun b_and!7915 () Bool)

(assert (= b_and!7911 (and (=> t!6067 result!3873) b_and!7915)))

(declare-fun m!149883 () Bool)

(assert (=> b!128265 m!149883))

(assert (=> b!128261 m!149447))

(assert (=> b!128261 m!149447))

(assert (=> b!128261 m!149489))

(declare-fun m!149885 () Bool)

(assert (=> b!128264 m!149885))

(assert (=> b!128264 m!149443))

(assert (=> b!128264 m!149341))

(assert (=> b!128264 m!149445))

(declare-fun m!149887 () Bool)

(assert (=> b!128264 m!149887))

(declare-fun m!149889 () Bool)

(assert (=> b!128264 m!149889))

(assert (=> b!128264 m!149341))

(declare-fun m!149891 () Bool)

(assert (=> b!128264 m!149891))

(assert (=> b!128264 m!149447))

(assert (=> b!128264 m!149443))

(assert (=> b!128264 m!149887))

(assert (=> b!128258 m!149447))

(assert (=> b!128258 m!149447))

(assert (=> b!128258 m!149489))

(declare-fun m!149893 () Bool)

(assert (=> b!128266 m!149893))

(assert (=> b!128255 m!149447))

(assert (=> b!128255 m!149447))

(declare-fun m!149895 () Bool)

(assert (=> b!128255 m!149895))

(declare-fun m!149897 () Bool)

(assert (=> d!38747 m!149897))

(assert (=> d!38747 m!149337))

(declare-fun m!149899 () Bool)

(assert (=> bm!13865 m!149899))

(assert (=> b!128262 m!149443))

(assert (=> b!128262 m!149443))

(assert (=> b!128262 m!149341))

(assert (=> b!128262 m!149445))

(assert (=> b!128262 m!149341))

(assert (=> b!128262 m!149447))

(declare-fun m!149901 () Bool)

(assert (=> b!128262 m!149901))

(assert (=> b!128262 m!149447))

(assert (=> b!128260 m!149899))

(assert (=> b!127908 d!38747))

(declare-fun d!38749 () Bool)

(assert (=> d!38749 (= (apply!112 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66053) (apply!112 lt!66063 lt!66053))))

(declare-fun lt!66307 () Unit!3980)

(declare-fun choose!785 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> d!38749 (= lt!66307 (choose!785 lt!66063 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66053))))

(declare-fun e!83752 () Bool)

(assert (=> d!38749 e!83752))

(declare-fun res!61921 () Bool)

(assert (=> d!38749 (=> (not res!61921) (not e!83752))))

(assert (=> d!38749 (= res!61921 (contains!873 lt!66063 lt!66053))))

(assert (=> d!38749 (= (addApplyDifferent!88 lt!66063 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66053) lt!66307)))

(declare-fun b!128270 () Bool)

(assert (=> b!128270 (= e!83752 (not (= lt!66053 lt!66064)))))

(assert (= (and d!38749 res!61921) b!128270))

(assert (=> d!38749 m!149453))

(assert (=> d!38749 m!149465))

(declare-fun m!149903 () Bool)

(assert (=> d!38749 m!149903))

(assert (=> d!38749 m!149453))

(declare-fun m!149905 () Bool)

(assert (=> d!38749 m!149905))

(assert (=> d!38749 m!149463))

(assert (=> b!127908 d!38749))

(declare-fun d!38751 () Bool)

(assert (=> d!38751 (= (apply!112 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66045) (apply!112 lt!66065 lt!66045))))

(declare-fun lt!66308 () Unit!3980)

(assert (=> d!38751 (= lt!66308 (choose!785 lt!66065 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66045))))

(declare-fun e!83753 () Bool)

(assert (=> d!38751 e!83753))

(declare-fun res!61922 () Bool)

(assert (=> d!38751 (=> (not res!61922) (not e!83753))))

(assert (=> d!38751 (= res!61922 (contains!873 lt!66065 lt!66045))))

(assert (=> d!38751 (= (addApplyDifferent!88 lt!66065 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66045) lt!66308)))

(declare-fun b!128271 () Bool)

(assert (=> b!128271 (= e!83753 (not (= lt!66045 lt!66060)))))

(assert (= (and d!38751 res!61922) b!128271))

(assert (=> d!38751 m!149459))

(assert (=> d!38751 m!149477))

(declare-fun m!149907 () Bool)

(assert (=> d!38751 m!149907))

(assert (=> d!38751 m!149459))

(declare-fun m!149909 () Bool)

(assert (=> d!38751 m!149909))

(assert (=> d!38751 m!149475))

(assert (=> b!127908 d!38751))

(declare-fun d!38753 () Bool)

(assert (=> d!38753 (= (apply!112 lt!66063 lt!66053) (get!1456 (getValueByKey!166 (toList!844 lt!66063) lt!66053)))))

(declare-fun bs!5298 () Bool)

(assert (= bs!5298 d!38753))

(declare-fun m!149911 () Bool)

(assert (=> bs!5298 m!149911))

(assert (=> bs!5298 m!149911))

(declare-fun m!149913 () Bool)

(assert (=> bs!5298 m!149913))

(assert (=> b!127908 d!38753))

(declare-fun d!38755 () Bool)

(assert (=> d!38755 (= (apply!112 lt!66052 lt!66058) (get!1456 (getValueByKey!166 (toList!844 lt!66052) lt!66058)))))

(declare-fun bs!5299 () Bool)

(assert (= bs!5299 d!38755))

(declare-fun m!149915 () Bool)

(assert (=> bs!5299 m!149915))

(assert (=> bs!5299 m!149915))

(declare-fun m!149917 () Bool)

(assert (=> bs!5299 m!149917))

(assert (=> b!127908 d!38755))

(declare-fun d!38757 () Bool)

(assert (=> d!38757 (= (apply!112 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66058) (apply!112 lt!66052 lt!66058))))

(declare-fun lt!66309 () Unit!3980)

(assert (=> d!38757 (= lt!66309 (choose!785 lt!66052 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66058))))

(declare-fun e!83754 () Bool)

(assert (=> d!38757 e!83754))

(declare-fun res!61923 () Bool)

(assert (=> d!38757 (=> (not res!61923) (not e!83754))))

(assert (=> d!38757 (= res!61923 (contains!873 lt!66052 lt!66058))))

(assert (=> d!38757 (= (addApplyDifferent!88 lt!66052 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66058) lt!66309)))

(declare-fun b!128272 () Bool)

(assert (=> b!128272 (= e!83754 (not (= lt!66058 lt!66048)))))

(assert (= (and d!38757 res!61923) b!128272))

(assert (=> d!38757 m!149479))

(assert (=> d!38757 m!149483))

(declare-fun m!149919 () Bool)

(assert (=> d!38757 m!149919))

(assert (=> d!38757 m!149479))

(declare-fun m!149921 () Bool)

(assert (=> d!38757 m!149921))

(assert (=> d!38757 m!149457))

(assert (=> b!127908 d!38757))

(declare-fun d!38759 () Bool)

(assert (=> d!38759 (contains!873 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66061)))

(declare-fun lt!66312 () Unit!3980)

(declare-fun choose!786 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> d!38759 (= lt!66312 (choose!786 lt!66056 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66061))))

(assert (=> d!38759 (contains!873 lt!66056 lt!66061)))

(assert (=> d!38759 (= (addStillContains!88 lt!66056 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66061) lt!66312)))

(declare-fun bs!5300 () Bool)

(assert (= bs!5300 d!38759))

(assert (=> bs!5300 m!149471))

(assert (=> bs!5300 m!149471))

(assert (=> bs!5300 m!149473))

(declare-fun m!149923 () Bool)

(assert (=> bs!5300 m!149923))

(declare-fun m!149925 () Bool)

(assert (=> bs!5300 m!149925))

(assert (=> b!127908 d!38759))

(declare-fun d!38761 () Bool)

(declare-fun e!83755 () Bool)

(assert (=> d!38761 e!83755))

(declare-fun res!61924 () Bool)

(assert (=> d!38761 (=> (not res!61924) (not e!83755))))

(declare-fun lt!66316 () ListLongMap!1657)

(assert (=> d!38761 (= res!61924 (contains!873 lt!66316 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66315 () List!1698)

(assert (=> d!38761 (= lt!66316 (ListLongMap!1658 lt!66315))))

(declare-fun lt!66314 () Unit!3980)

(declare-fun lt!66313 () Unit!3980)

(assert (=> d!38761 (= lt!66314 lt!66313)))

(assert (=> d!38761 (= (getValueByKey!166 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38761 (= lt!66313 (lemmaContainsTupThenGetReturnValue!84 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38761 (= lt!66315 (insertStrictlySorted!87 (toList!844 lt!66052) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38761 (= (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66316)))

(declare-fun b!128274 () Bool)

(declare-fun res!61925 () Bool)

(assert (=> b!128274 (=> (not res!61925) (not e!83755))))

(assert (=> b!128274 (= res!61925 (= (getValueByKey!166 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128275 () Bool)

(assert (=> b!128275 (= e!83755 (contains!874 (toList!844 lt!66316) (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38761 res!61924) b!128274))

(assert (= (and b!128274 res!61925) b!128275))

(declare-fun m!149927 () Bool)

(assert (=> d!38761 m!149927))

(declare-fun m!149929 () Bool)

(assert (=> d!38761 m!149929))

(declare-fun m!149931 () Bool)

(assert (=> d!38761 m!149931))

(declare-fun m!149933 () Bool)

(assert (=> d!38761 m!149933))

(declare-fun m!149935 () Bool)

(assert (=> b!128274 m!149935))

(declare-fun m!149937 () Bool)

(assert (=> b!128275 m!149937))

(assert (=> b!127908 d!38761))

(declare-fun d!38763 () Bool)

(declare-fun e!83756 () Bool)

(assert (=> d!38763 e!83756))

(declare-fun res!61926 () Bool)

(assert (=> d!38763 (=> (not res!61926) (not e!83756))))

(declare-fun lt!66320 () ListLongMap!1657)

(assert (=> d!38763 (= res!61926 (contains!873 lt!66320 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66319 () List!1698)

(assert (=> d!38763 (= lt!66320 (ListLongMap!1658 lt!66319))))

(declare-fun lt!66318 () Unit!3980)

(declare-fun lt!66317 () Unit!3980)

(assert (=> d!38763 (= lt!66318 lt!66317)))

(assert (=> d!38763 (= (getValueByKey!166 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38763 (= lt!66317 (lemmaContainsTupThenGetReturnValue!84 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38763 (= lt!66319 (insertStrictlySorted!87 (toList!844 lt!66065) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38763 (= (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66320)))

(declare-fun b!128276 () Bool)

(declare-fun res!61927 () Bool)

(assert (=> b!128276 (=> (not res!61927) (not e!83756))))

(assert (=> b!128276 (= res!61927 (= (getValueByKey!166 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128277 () Bool)

(assert (=> b!128277 (= e!83756 (contains!874 (toList!844 lt!66320) (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38763 res!61926) b!128276))

(assert (= (and b!128276 res!61927) b!128277))

(declare-fun m!149939 () Bool)

(assert (=> d!38763 m!149939))

(declare-fun m!149941 () Bool)

(assert (=> d!38763 m!149941))

(declare-fun m!149943 () Bool)

(assert (=> d!38763 m!149943))

(declare-fun m!149945 () Bool)

(assert (=> d!38763 m!149945))

(declare-fun m!149947 () Bool)

(assert (=> b!128276 m!149947))

(declare-fun m!149949 () Bool)

(assert (=> b!128277 m!149949))

(assert (=> b!127908 d!38763))

(declare-fun d!38765 () Bool)

(declare-fun e!83757 () Bool)

(assert (=> d!38765 e!83757))

(declare-fun res!61928 () Bool)

(assert (=> d!38765 (=> (not res!61928) (not e!83757))))

(declare-fun lt!66324 () ListLongMap!1657)

(assert (=> d!38765 (= res!61928 (contains!873 lt!66324 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66323 () List!1698)

(assert (=> d!38765 (= lt!66324 (ListLongMap!1658 lt!66323))))

(declare-fun lt!66322 () Unit!3980)

(declare-fun lt!66321 () Unit!3980)

(assert (=> d!38765 (= lt!66322 lt!66321)))

(assert (=> d!38765 (= (getValueByKey!166 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38765 (= lt!66321 (lemmaContainsTupThenGetReturnValue!84 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38765 (= lt!66323 (insertStrictlySorted!87 (toList!844 lt!66063) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38765 (= (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66324)))

(declare-fun b!128278 () Bool)

(declare-fun res!61929 () Bool)

(assert (=> b!128278 (=> (not res!61929) (not e!83757))))

(assert (=> b!128278 (= res!61929 (= (getValueByKey!166 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128279 () Bool)

(assert (=> b!128279 (= e!83757 (contains!874 (toList!844 lt!66324) (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38765 res!61928) b!128278))

(assert (= (and b!128278 res!61929) b!128279))

(declare-fun m!149951 () Bool)

(assert (=> d!38765 m!149951))

(declare-fun m!149953 () Bool)

(assert (=> d!38765 m!149953))

(declare-fun m!149955 () Bool)

(assert (=> d!38765 m!149955))

(declare-fun m!149957 () Bool)

(assert (=> d!38765 m!149957))

(declare-fun m!149959 () Bool)

(assert (=> b!128278 m!149959))

(declare-fun m!149961 () Bool)

(assert (=> b!128279 m!149961))

(assert (=> b!127908 d!38765))

(declare-fun d!38767 () Bool)

(assert (=> d!38767 (= (apply!112 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66058) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66058)))))

(declare-fun bs!5301 () Bool)

(assert (= bs!5301 d!38767))

(declare-fun m!149963 () Bool)

(assert (=> bs!5301 m!149963))

(assert (=> bs!5301 m!149963))

(declare-fun m!149965 () Bool)

(assert (=> bs!5301 m!149965))

(assert (=> b!127908 d!38767))

(declare-fun d!38769 () Bool)

(assert (=> d!38769 (= (apply!112 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66053) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66053)))))

(declare-fun bs!5302 () Bool)

(assert (= bs!5302 d!38769))

(declare-fun m!149967 () Bool)

(assert (=> bs!5302 m!149967))

(assert (=> bs!5302 m!149967))

(declare-fun m!149969 () Bool)

(assert (=> bs!5302 m!149969))

(assert (=> b!127908 d!38769))

(declare-fun d!38771 () Bool)

(assert (=> d!38771 (= (apply!112 lt!66065 lt!66045) (get!1456 (getValueByKey!166 (toList!844 lt!66065) lt!66045)))))

(declare-fun bs!5303 () Bool)

(assert (= bs!5303 d!38771))

(declare-fun m!149971 () Bool)

(assert (=> bs!5303 m!149971))

(assert (=> bs!5303 m!149971))

(declare-fun m!149973 () Bool)

(assert (=> bs!5303 m!149973))

(assert (=> b!127908 d!38771))

(declare-fun d!38773 () Bool)

(declare-fun e!83759 () Bool)

(assert (=> d!38773 e!83759))

(declare-fun res!61930 () Bool)

(assert (=> d!38773 (=> res!61930 e!83759)))

(declare-fun lt!66327 () Bool)

(assert (=> d!38773 (= res!61930 (not lt!66327))))

(declare-fun lt!66328 () Bool)

(assert (=> d!38773 (= lt!66327 lt!66328)))

(declare-fun lt!66326 () Unit!3980)

(declare-fun e!83758 () Unit!3980)

(assert (=> d!38773 (= lt!66326 e!83758)))

(declare-fun c!23529 () Bool)

(assert (=> d!38773 (= c!23529 lt!66328)))

(assert (=> d!38773 (= lt!66328 (containsKey!170 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(assert (=> d!38773 (= (contains!873 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66061) lt!66327)))

(declare-fun b!128280 () Bool)

(declare-fun lt!66325 () Unit!3980)

(assert (=> b!128280 (= e!83758 lt!66325)))

(assert (=> b!128280 (= lt!66325 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(assert (=> b!128280 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(declare-fun b!128281 () Bool)

(declare-fun Unit!3991 () Unit!3980)

(assert (=> b!128281 (= e!83758 Unit!3991)))

(declare-fun b!128282 () Bool)

(assert (=> b!128282 (= e!83759 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061)))))

(assert (= (and d!38773 c!23529) b!128280))

(assert (= (and d!38773 (not c!23529)) b!128281))

(assert (= (and d!38773 (not res!61930)) b!128282))

(declare-fun m!149975 () Bool)

(assert (=> d!38773 m!149975))

(declare-fun m!149977 () Bool)

(assert (=> b!128280 m!149977))

(declare-fun m!149979 () Bool)

(assert (=> b!128280 m!149979))

(assert (=> b!128280 m!149979))

(declare-fun m!149981 () Bool)

(assert (=> b!128280 m!149981))

(assert (=> b!128282 m!149979))

(assert (=> b!128282 m!149979))

(assert (=> b!128282 m!149981))

(assert (=> b!127908 d!38773))

(assert (=> bm!13810 d!38723))

(declare-fun d!38775 () Bool)

(assert (=> d!38775 (isDefined!120 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun lt!66331 () Unit!3980)

(declare-fun choose!787 (List!1698 (_ BitVec 64)) Unit!3980)

(assert (=> d!38775 (= lt!66331 (choose!787 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun e!83762 () Bool)

(assert (=> d!38775 e!83762))

(declare-fun res!61933 () Bool)

(assert (=> d!38775 (=> (not res!61933) (not e!83762))))

(declare-fun isStrictlySorted!313 (List!1698) Bool)

(assert (=> d!38775 (= res!61933 (isStrictlySorted!313 (toList!844 lt!65981)))))

(assert (=> d!38775 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66331)))

(declare-fun b!128285 () Bool)

(assert (=> b!128285 (= e!83762 (containsKey!170 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38775 res!61933) b!128285))

(assert (=> d!38775 m!149345))

(assert (=> d!38775 m!149509))

(assert (=> d!38775 m!149509))

(assert (=> d!38775 m!149511))

(assert (=> d!38775 m!149345))

(declare-fun m!149983 () Bool)

(assert (=> d!38775 m!149983))

(declare-fun m!149985 () Bool)

(assert (=> d!38775 m!149985))

(assert (=> b!128285 m!149345))

(assert (=> b!128285 m!149505))

(assert (=> b!127924 d!38775))

(declare-fun d!38777 () Bool)

(declare-fun isEmpty!404 (Option!172) Bool)

(assert (=> d!38777 (= (isDefined!120 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) (not (isEmpty!404 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(declare-fun bs!5304 () Bool)

(assert (= bs!5304 d!38777))

(assert (=> bs!5304 m!149509))

(declare-fun m!149987 () Bool)

(assert (=> bs!5304 m!149987))

(assert (=> b!127924 d!38777))

(declare-fun b!128294 () Bool)

(declare-fun e!83767 () Option!172)

(assert (=> b!128294 (= e!83767 (Some!171 (_2!1291 (h!2297 (toList!844 lt!65981)))))))

(declare-fun b!128297 () Bool)

(declare-fun e!83768 () Option!172)

(assert (=> b!128297 (= e!83768 None!170)))

(declare-fun b!128296 () Bool)

(assert (=> b!128296 (= e!83768 (getValueByKey!166 (t!6068 (toList!844 lt!65981)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun d!38779 () Bool)

(declare-fun c!23534 () Bool)

(assert (=> d!38779 (= c!23534 (and ((_ is Cons!1694) (toList!844 lt!65981)) (= (_1!1291 (h!2297 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38779 (= (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!83767)))

(declare-fun b!128295 () Bool)

(assert (=> b!128295 (= e!83767 e!83768)))

(declare-fun c!23535 () Bool)

(assert (=> b!128295 (= c!23535 (and ((_ is Cons!1694) (toList!844 lt!65981)) (not (= (_1!1291 (h!2297 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(assert (= (and d!38779 c!23534) b!128294))

(assert (= (and d!38779 (not c!23534)) b!128295))

(assert (= (and b!128295 c!23535) b!128296))

(assert (= (and b!128295 (not c!23535)) b!128297))

(assert (=> b!128296 m!149345))

(declare-fun m!149989 () Bool)

(assert (=> b!128296 m!149989))

(assert (=> b!127924 d!38779))

(assert (=> b!128034 d!38707))

(declare-fun d!38781 () Bool)

(assert (=> d!38781 (= (get!1454 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3137 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128051 d!38781))

(declare-fun d!38783 () Bool)

(assert (=> d!38783 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66334 () Unit!3980)

(declare-fun choose!788 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3980)

(assert (=> d!38783 (= lt!66334 (choose!788 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38783 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38783 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66334)))

(declare-fun bs!5305 () Bool)

(assert (= bs!5305 d!38783))

(assert (=> bs!5305 m!149437))

(assert (=> bs!5305 m!149343))

(declare-fun m!149991 () Bool)

(assert (=> bs!5305 m!149991))

(assert (=> bs!5305 m!149437))

(declare-fun m!149993 () Bool)

(assert (=> bs!5305 m!149993))

(assert (=> bs!5305 m!149343))

(declare-fun m!149995 () Bool)

(assert (=> bs!5305 m!149995))

(assert (=> bs!5305 m!149585))

(assert (=> b!128011 d!38783))

(declare-fun d!38785 () Bool)

(assert (=> d!38785 (= (get!1455 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128052 d!38785))

(assert (=> b!127926 d!38777))

(assert (=> b!127926 d!38779))

(assert (=> bm!13759 d!38747))

(declare-fun d!38787 () Bool)

(declare-fun e!83770 () Bool)

(assert (=> d!38787 e!83770))

(declare-fun res!61934 () Bool)

(assert (=> d!38787 (=> res!61934 e!83770)))

(declare-fun lt!66337 () Bool)

(assert (=> d!38787 (= res!61934 (not lt!66337))))

(declare-fun lt!66338 () Bool)

(assert (=> d!38787 (= lt!66337 lt!66338)))

(declare-fun lt!66336 () Unit!3980)

(declare-fun e!83769 () Unit!3980)

(assert (=> d!38787 (= lt!66336 e!83769)))

(declare-fun c!23536 () Bool)

(assert (=> d!38787 (= c!23536 lt!66338)))

(assert (=> d!38787 (= lt!66338 (containsKey!170 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(assert (=> d!38787 (= (contains!873 call!13818 (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))) lt!66337)))

(declare-fun b!128298 () Bool)

(declare-fun lt!66335 () Unit!3980)

(assert (=> b!128298 (= e!83769 lt!66335)))

(assert (=> b!128298 (= lt!66335 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(assert (=> b!128298 (isDefined!120 (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(declare-fun b!128299 () Bool)

(declare-fun Unit!3992 () Unit!3980)

(assert (=> b!128299 (= e!83769 Unit!3992)))

(declare-fun b!128300 () Bool)

(assert (=> b!128300 (= e!83770 (isDefined!120 (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))))

(assert (= (and d!38787 c!23536) b!128298))

(assert (= (and d!38787 (not c!23536)) b!128299))

(assert (= (and d!38787 (not res!61934)) b!128300))

(declare-fun m!149997 () Bool)

(assert (=> d!38787 m!149997))

(declare-fun m!149999 () Bool)

(assert (=> b!128298 m!149999))

(declare-fun m!150001 () Bool)

(assert (=> b!128298 m!150001))

(assert (=> b!128298 m!150001))

(declare-fun m!150003 () Bool)

(assert (=> b!128298 m!150003))

(assert (=> b!128300 m!150001))

(assert (=> b!128300 m!150001))

(assert (=> b!128300 m!150003))

(assert (=> bm!13814 d!38787))

(declare-fun d!38789 () Bool)

(declare-fun e!83772 () Bool)

(assert (=> d!38789 e!83772))

(declare-fun res!61935 () Bool)

(assert (=> d!38789 (=> res!61935 e!83772)))

(declare-fun lt!66341 () Bool)

(assert (=> d!38789 (= res!61935 (not lt!66341))))

(declare-fun lt!66342 () Bool)

(assert (=> d!38789 (= lt!66341 lt!66342)))

(declare-fun lt!66340 () Unit!3980)

(declare-fun e!83771 () Unit!3980)

(assert (=> d!38789 (= lt!66340 e!83771)))

(declare-fun c!23537 () Bool)

(assert (=> d!38789 (= c!23537 lt!66342)))

(assert (=> d!38789 (= lt!66342 (containsKey!170 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38789 (= (contains!873 lt!66050 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66341)))

(declare-fun b!128301 () Bool)

(declare-fun lt!66339 () Unit!3980)

(assert (=> b!128301 (= e!83771 lt!66339)))

(assert (=> b!128301 (= lt!66339 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128301 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128302 () Bool)

(declare-fun Unit!3993 () Unit!3980)

(assert (=> b!128302 (= e!83771 Unit!3993)))

(declare-fun b!128303 () Bool)

(assert (=> b!128303 (= e!83772 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38789 c!23537) b!128301))

(assert (= (and d!38789 (not c!23537)) b!128302))

(assert (= (and d!38789 (not res!61935)) b!128303))

(declare-fun m!150005 () Bool)

(assert (=> d!38789 m!150005))

(declare-fun m!150007 () Bool)

(assert (=> b!128301 m!150007))

(assert (=> b!128301 m!149579))

(assert (=> b!128301 m!149579))

(declare-fun m!150009 () Bool)

(assert (=> b!128301 m!150009))

(assert (=> b!128303 m!149579))

(assert (=> b!128303 m!149579))

(assert (=> b!128303 m!150009))

(assert (=> bm!13754 d!38789))

(declare-fun lt!66418 () tuple2!2562)

(declare-fun b!128338 () Bool)

(declare-fun e!83794 () Bool)

(assert (=> b!128338 (= e!83794 (= (map!1377 (_2!1292 lt!66418)) (+!159 (map!1377 newMap!16) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128339 () Bool)

(declare-fun res!61961 () Bool)

(declare-fun e!83796 () Bool)

(assert (=> b!128339 (=> (not res!61961) (not e!83796))))

(declare-fun lt!66427 () SeekEntryResult!274)

(assert (=> b!128339 (= res!61961 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128340 () Bool)

(declare-fun e!83792 () Unit!3980)

(declare-fun lt!66408 () Unit!3980)

(assert (=> b!128340 (= e!83792 lt!66408)))

(assert (=> b!128340 (= lt!66408 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun call!13880 () SeekEntryResult!274)

(assert (=> b!128340 (= lt!66427 call!13880)))

(declare-fun c!23546 () Bool)

(assert (=> b!128340 (= c!23546 ((_ is MissingZero!274) lt!66427))))

(declare-fun e!83790 () Bool)

(assert (=> b!128340 e!83790))

(declare-fun b!128341 () Bool)

(declare-fun e!83793 () Unit!3980)

(declare-fun Unit!3994 () Unit!3980)

(assert (=> b!128341 (= e!83793 Unit!3994)))

(declare-fun lt!66420 () Unit!3980)

(declare-fun lemmaArrayContainsKeyThenInListMap!38 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) (_ BitVec 32) Int) Unit!3980)

(assert (=> b!128341 (= lt!66420 (lemmaArrayContainsKeyThenInListMap!38 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> b!128341 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))

(declare-fun lt!66415 () Unit!3980)

(assert (=> b!128341 (= lt!66415 lt!66420)))

(assert (=> b!128341 false))

(declare-fun b!128342 () Bool)

(declare-fun lt!66410 () SeekEntryResult!274)

(declare-fun e!83789 () Bool)

(assert (=> b!128342 (= e!83789 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66410)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128343 () Bool)

(declare-fun e!83795 () Bool)

(declare-fun e!83791 () Bool)

(assert (=> b!128343 (= e!83795 e!83791)))

(declare-fun res!61960 () Bool)

(declare-fun call!13878 () Bool)

(assert (=> b!128343 (= res!61960 call!13878)))

(assert (=> b!128343 (=> (not res!61960) (not e!83791))))

(declare-fun b!128344 () Bool)

(declare-fun res!61956 () Bool)

(assert (=> b!128344 (=> (not res!61956) (not e!83796))))

(assert (=> b!128344 (= res!61956 call!13878)))

(assert (=> b!128344 (= e!83790 e!83796)))

(declare-fun bm!13874 () Bool)

(declare-fun c!23549 () Bool)

(declare-fun call!13877 () Bool)

(assert (=> bm!13874 (= call!13877 (inRange!0 (ite c!23549 (index!3253 lt!66410) (ite c!23546 (index!3252 lt!66427) (index!3255 lt!66427))) (mask!7071 newMap!16)))))

(declare-fun b!128345 () Bool)

(declare-fun res!61958 () Bool)

(assert (=> b!128345 (= res!61958 call!13877)))

(assert (=> b!128345 (=> (not res!61958) (not e!83789))))

(declare-fun b!128346 () Bool)

(declare-fun c!23547 () Bool)

(assert (=> b!128346 (= c!23547 ((_ is MissingVacant!274) lt!66427))))

(assert (=> b!128346 (= e!83790 e!83795)))

(declare-fun b!128347 () Bool)

(declare-fun Unit!3995 () Unit!3980)

(assert (=> b!128347 (= e!83792 Unit!3995)))

(declare-fun lt!66409 () Unit!3980)

(assert (=> b!128347 (= lt!66409 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128347 (= lt!66410 call!13880)))

(declare-fun res!61959 () Bool)

(assert (=> b!128347 (= res!61959 ((_ is Found!274) lt!66410))))

(assert (=> b!128347 (=> (not res!61959) (not e!83789))))

(assert (=> b!128347 e!83789))

(declare-fun lt!66404 () Unit!3980)

(assert (=> b!128347 (= lt!66404 lt!66409)))

(assert (=> b!128347 false))

(declare-fun b!128349 () Bool)

(declare-fun res!61955 () Bool)

(assert (=> b!128349 (=> (not res!61955) (not e!83794))))

(assert (=> b!128349 (= res!61955 (contains!873 (map!1377 (_2!1292 lt!66418)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128350 () Bool)

(declare-fun res!61957 () Bool)

(assert (=> b!128350 (=> (not res!61957) (not e!83794))))

(assert (=> b!128350 (= res!61957 (valid!519 (_2!1292 lt!66418)))))

(declare-fun b!128351 () Bool)

(declare-fun res!61962 () Bool)

(assert (=> b!128351 (= res!61962 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128351 (=> (not res!61962) (not e!83791))))

(declare-fun bm!13875 () Bool)

(assert (=> bm!13875 (= call!13878 call!13877)))

(declare-fun b!128352 () Bool)

(declare-fun call!13879 () Bool)

(assert (=> b!128352 (= e!83791 (not call!13879))))

(declare-fun b!128353 () Bool)

(assert (=> b!128353 (= e!83796 (not call!13879))))

(declare-fun bm!13876 () Bool)

(assert (=> bm!13876 (= call!13880 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun d!38791 () Bool)

(assert (=> d!38791 e!83794))

(declare-fun res!61954 () Bool)

(assert (=> d!38791 (=> (not res!61954) (not e!83794))))

(assert (=> d!38791 (= res!61954 (_1!1292 lt!66418))))

(assert (=> d!38791 (= lt!66418 (tuple2!2563 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd (_size!585 newMap!16) #b00000000000000000000000000000001) (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (_vacant!585 newMap!16))))))

(declare-fun lt!66407 () Unit!3980)

(declare-fun lt!66417 () Unit!3980)

(assert (=> d!38791 (= lt!66407 lt!66417)))

(declare-fun lt!66428 () array!4701)

(declare-fun lt!66429 () array!4703)

(assert (=> d!38791 (contains!873 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(assert (=> d!38791 (= lt!66417 (lemmaValidKeyInArrayIsInListMap!116 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38791 (= lt!66429 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))))

(assert (=> d!38791 (= lt!66428 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun lt!66419 () Unit!3980)

(declare-fun lt!66403 () Unit!3980)

(assert (=> d!38791 (= lt!66419 lt!66403)))

(declare-fun lt!66426 () array!4701)

(assert (=> d!38791 (= (arrayCountValidKeys!0 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4701 (_ BitVec 32)) Unit!3980)

(assert (=> d!38791 (= lt!66403 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(assert (=> d!38791 (= lt!66426 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun lt!66413 () Unit!3980)

(declare-fun lt!66425 () Unit!3980)

(assert (=> d!38791 (= lt!66413 lt!66425)))

(declare-fun lt!66432 () array!4701)

(assert (=> d!38791 (arrayContainsKey!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4701 (_ BitVec 64) (_ BitVec 32)) Unit!3980)

(assert (=> d!38791 (= lt!66425 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(assert (=> d!38791 (= lt!66432 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun lt!66411 () Unit!3980)

(declare-fun lt!66414 () Unit!3980)

(assert (=> d!38791 (= lt!66411 lt!66414)))

(assert (=> d!38791 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!38 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3980)

(assert (=> d!38791 (= lt!66414 (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66406 () Unit!3980)

(declare-fun lt!66424 () Unit!3980)

(assert (=> d!38791 (= lt!66406 lt!66424)))

(assert (=> d!38791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (mask!7071 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4701 (_ BitVec 32) (_ BitVec 32)) Unit!3980)

(assert (=> d!38791 (= lt!66424 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (mask!7071 newMap!16)))))

(declare-fun lt!66421 () Unit!3980)

(declare-fun lt!66405 () Unit!3980)

(assert (=> d!38791 (= lt!66421 lt!66405)))

(assert (=> d!38791 (= (arrayCountValidKeys!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4701 (_ BitVec 32) (_ BitVec 64)) Unit!3980)

(assert (=> d!38791 (= lt!66405 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun lt!66430 () Unit!3980)

(declare-fun lt!66416 () Unit!3980)

(assert (=> d!38791 (= lt!66430 lt!66416)))

(declare-fun lt!66412 () (_ BitVec 32))

(declare-fun lt!66422 () List!1700)

(assert (=> d!38791 (arrayNoDuplicates!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) lt!66412 lt!66422)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1700) Unit!3980)

(assert (=> d!38791 (= lt!66416 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) lt!66412 lt!66422))))

(assert (=> d!38791 (= lt!66422 Nil!1697)))

(assert (=> d!38791 (= lt!66412 #b00000000000000000000000000000000)))

(declare-fun lt!66423 () Unit!3980)

(assert (=> d!38791 (= lt!66423 e!83793)))

(declare-fun c!23548 () Bool)

(assert (=> d!38791 (= c!23548 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!66431 () Unit!3980)

(assert (=> d!38791 (= lt!66431 e!83792)))

(assert (=> d!38791 (= c!23549 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38791 (valid!519 newMap!16)))

(assert (=> d!38791 (= (updateHelperNewKey!57 newMap!16 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))) lt!66418)))

(declare-fun b!128348 () Bool)

(assert (=> b!128348 (= e!83795 ((_ is Undefined!274) lt!66427))))

(declare-fun bm!13877 () Bool)

(assert (=> bm!13877 (= call!13879 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128354 () Bool)

(declare-fun Unit!3996 () Unit!3980)

(assert (=> b!128354 (= e!83793 Unit!3996)))

(assert (= (and d!38791 c!23549) b!128347))

(assert (= (and d!38791 (not c!23549)) b!128340))

(assert (= (and b!128347 res!61959) b!128345))

(assert (= (and b!128345 res!61958) b!128342))

(assert (= (and b!128340 c!23546) b!128344))

(assert (= (and b!128340 (not c!23546)) b!128346))

(assert (= (and b!128344 res!61956) b!128339))

(assert (= (and b!128339 res!61961) b!128353))

(assert (= (and b!128346 c!23547) b!128343))

(assert (= (and b!128346 (not c!23547)) b!128348))

(assert (= (and b!128343 res!61960) b!128351))

(assert (= (and b!128351 res!61962) b!128352))

(assert (= (or b!128344 b!128343) bm!13875))

(assert (= (or b!128353 b!128352) bm!13877))

(assert (= (or b!128345 bm!13875) bm!13874))

(assert (= (or b!128347 b!128340) bm!13876))

(assert (= (and d!38791 c!23548) b!128341))

(assert (= (and d!38791 (not c!23548)) b!128354))

(assert (= (and d!38791 res!61954) b!128350))

(assert (= (and b!128350 res!61957) b!128349))

(assert (= (and b!128349 res!61955) b!128338))

(assert (=> bm!13876 m!149345))

(assert (=> bm!13876 m!149525))

(declare-fun m!150011 () Bool)

(assert (=> b!128350 m!150011))

(declare-fun m!150013 () Bool)

(assert (=> b!128349 m!150013))

(assert (=> b!128349 m!150013))

(assert (=> b!128349 m!149345))

(declare-fun m!150015 () Bool)

(assert (=> b!128349 m!150015))

(assert (=> b!128338 m!150013))

(assert (=> b!128338 m!149359))

(assert (=> b!128338 m!149359))

(declare-fun m!150017 () Bool)

(assert (=> b!128338 m!150017))

(declare-fun m!150019 () Bool)

(assert (=> b!128342 m!150019))

(declare-fun m!150021 () Bool)

(assert (=> bm!13874 m!150021))

(assert (=> b!128347 m!149345))

(assert (=> b!128347 m!149549))

(assert (=> b!128340 m!149345))

(assert (=> b!128340 m!149523))

(declare-fun m!150023 () Bool)

(assert (=> b!128339 m!150023))

(assert (=> b!128341 m!149345))

(declare-fun m!150025 () Bool)

(assert (=> b!128341 m!150025))

(assert (=> b!128341 m!149437))

(assert (=> b!128341 m!149437))

(assert (=> b!128341 m!149345))

(assert (=> b!128341 m!149541))

(assert (=> d!38791 m!149437))

(assert (=> d!38791 m!149499))

(assert (=> d!38791 m!149345))

(assert (=> d!38791 m!149539))

(declare-fun m!150027 () Bool)

(assert (=> d!38791 m!150027))

(assert (=> d!38791 m!149345))

(declare-fun m!150029 () Bool)

(assert (=> d!38791 m!150029))

(declare-fun m!150031 () Bool)

(assert (=> d!38791 m!150031))

(declare-fun m!150033 () Bool)

(assert (=> d!38791 m!150033))

(assert (=> d!38791 m!149437))

(assert (=> d!38791 m!149601))

(assert (=> d!38791 m!149357))

(declare-fun m!150035 () Bool)

(assert (=> d!38791 m!150035))

(assert (=> d!38791 m!149345))

(declare-fun m!150037 () Bool)

(assert (=> d!38791 m!150037))

(declare-fun m!150039 () Bool)

(assert (=> d!38791 m!150039))

(assert (=> d!38791 m!149345))

(declare-fun m!150041 () Bool)

(assert (=> d!38791 m!150041))

(assert (=> d!38791 m!149437))

(assert (=> d!38791 m!149345))

(assert (=> d!38791 m!149541))

(declare-fun m!150043 () Bool)

(assert (=> d!38791 m!150043))

(assert (=> d!38791 m!149345))

(assert (=> d!38791 m!149343))

(declare-fun m!150045 () Bool)

(assert (=> d!38791 m!150045))

(declare-fun m!150047 () Bool)

(assert (=> d!38791 m!150047))

(assert (=> d!38791 m!150047))

(declare-fun m!150049 () Bool)

(assert (=> d!38791 m!150049))

(declare-fun m!150051 () Bool)

(assert (=> d!38791 m!150051))

(assert (=> d!38791 m!149345))

(declare-fun m!150053 () Bool)

(assert (=> d!38791 m!150053))

(declare-fun m!150055 () Bool)

(assert (=> d!38791 m!150055))

(assert (=> d!38791 m!149345))

(declare-fun m!150057 () Bool)

(assert (=> d!38791 m!150057))

(declare-fun m!150059 () Bool)

(assert (=> d!38791 m!150059))

(assert (=> d!38791 m!150049))

(declare-fun m!150061 () Bool)

(assert (=> d!38791 m!150061))

(declare-fun m!150063 () Bool)

(assert (=> b!128351 m!150063))

(assert (=> bm!13877 m!149345))

(assert (=> bm!13877 m!149539))

(assert (=> bm!13826 d!38791))

(declare-fun d!38793 () Bool)

(declare-fun e!83798 () Bool)

(assert (=> d!38793 e!83798))

(declare-fun res!61963 () Bool)

(assert (=> d!38793 (=> res!61963 e!83798)))

(declare-fun lt!66435 () Bool)

(assert (=> d!38793 (= res!61963 (not lt!66435))))

(declare-fun lt!66436 () Bool)

(assert (=> d!38793 (= lt!66435 lt!66436)))

(declare-fun lt!66434 () Unit!3980)

(declare-fun e!83797 () Unit!3980)

(assert (=> d!38793 (= lt!66434 e!83797)))

(declare-fun c!23550 () Bool)

(assert (=> d!38793 (= c!23550 lt!66436)))

(assert (=> d!38793 (= lt!66436 (containsKey!170 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38793 (= (contains!873 lt!66050 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66435)))

(declare-fun b!128355 () Bool)

(declare-fun lt!66433 () Unit!3980)

(assert (=> b!128355 (= e!83797 lt!66433)))

(assert (=> b!128355 (= lt!66433 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128355 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128356 () Bool)

(declare-fun Unit!3997 () Unit!3980)

(assert (=> b!128356 (= e!83797 Unit!3997)))

(declare-fun b!128357 () Bool)

(assert (=> b!128357 (= e!83798 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38793 c!23550) b!128355))

(assert (= (and d!38793 (not c!23550)) b!128356))

(assert (= (and d!38793 (not res!61963)) b!128357))

(assert (=> d!38793 m!149447))

(declare-fun m!150065 () Bool)

(assert (=> d!38793 m!150065))

(assert (=> b!128355 m!149447))

(declare-fun m!150067 () Bool)

(assert (=> b!128355 m!150067))

(assert (=> b!128355 m!149447))

(assert (=> b!128355 m!149681))

(assert (=> b!128355 m!149681))

(declare-fun m!150069 () Bool)

(assert (=> b!128355 m!150069))

(assert (=> b!128357 m!149447))

(assert (=> b!128357 m!149681))

(assert (=> b!128357 m!149681))

(assert (=> b!128357 m!150069))

(assert (=> b!127903 d!38793))

(declare-fun d!38795 () Bool)

(declare-fun e!83800 () Bool)

(assert (=> d!38795 e!83800))

(declare-fun res!61964 () Bool)

(assert (=> d!38795 (=> res!61964 e!83800)))

(declare-fun lt!66439 () Bool)

(assert (=> d!38795 (= res!61964 (not lt!66439))))

(declare-fun lt!66440 () Bool)

(assert (=> d!38795 (= lt!66439 lt!66440)))

(declare-fun lt!66438 () Unit!3980)

(declare-fun e!83799 () Unit!3980)

(assert (=> d!38795 (= lt!66438 e!83799)))

(declare-fun c!23551 () Bool)

(assert (=> d!38795 (= c!23551 lt!66440)))

(assert (=> d!38795 (= lt!66440 (containsKey!170 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38795 (= (contains!873 lt!66050 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66439)))

(declare-fun b!128358 () Bool)

(declare-fun lt!66437 () Unit!3980)

(assert (=> b!128358 (= e!83799 lt!66437)))

(assert (=> b!128358 (= lt!66437 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128358 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128359 () Bool)

(declare-fun Unit!3998 () Unit!3980)

(assert (=> b!128359 (= e!83799 Unit!3998)))

(declare-fun b!128360 () Bool)

(assert (=> b!128360 (= e!83800 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38795 c!23551) b!128358))

(assert (= (and d!38795 (not c!23551)) b!128359))

(assert (= (and d!38795 (not res!61964)) b!128360))

(declare-fun m!150071 () Bool)

(assert (=> d!38795 m!150071))

(declare-fun m!150073 () Bool)

(assert (=> b!128358 m!150073))

(assert (=> b!128358 m!149669))

(assert (=> b!128358 m!149669))

(declare-fun m!150075 () Bool)

(assert (=> b!128358 m!150075))

(assert (=> b!128360 m!149669))

(assert (=> b!128360 m!149669))

(assert (=> b!128360 m!150075))

(assert (=> bm!13760 d!38795))

(assert (=> bm!13827 d!38673))

(declare-fun b!128371 () Bool)

(declare-fun res!61974 () Bool)

(declare-fun e!83803 () Bool)

(assert (=> b!128371 (=> (not res!61974) (not e!83803))))

(declare-fun size!2496 (LongMapFixedSize!1072) (_ BitVec 32))

(assert (=> b!128371 (= res!61974 (= (size!2496 newMap!16) (bvadd (_size!585 newMap!16) (bvsdiv (bvadd (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!128370 () Bool)

(declare-fun res!61976 () Bool)

(assert (=> b!128370 (=> (not res!61976) (not e!83803))))

(assert (=> b!128370 (= res!61976 (bvsge (size!2496 newMap!16) (_size!585 newMap!16)))))

(declare-fun b!128372 () Bool)

(assert (=> b!128372 (= e!83803 (and (bvsge (extraKeys!2581 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!585 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!128369 () Bool)

(declare-fun res!61975 () Bool)

(assert (=> b!128369 (=> (not res!61975) (not e!83803))))

(assert (=> b!128369 (= res!61975 (and (= (size!2491 (_values!2787 newMap!16)) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001)) (= (size!2490 (_keys!4540 newMap!16)) (size!2491 (_values!2787 newMap!16))) (bvsge (_size!585 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!585 newMap!16) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!38797 () Bool)

(declare-fun res!61973 () Bool)

(assert (=> d!38797 (=> (not res!61973) (not e!83803))))

(assert (=> d!38797 (= res!61973 (validMask!0 (mask!7071 newMap!16)))))

(assert (=> d!38797 (= (simpleValid!88 newMap!16) e!83803)))

(assert (= (and d!38797 res!61973) b!128369))

(assert (= (and b!128369 res!61975) b!128370))

(assert (= (and b!128370 res!61976) b!128371))

(assert (= (and b!128371 res!61974) b!128372))

(declare-fun m!150077 () Bool)

(assert (=> b!128371 m!150077))

(assert (=> b!128370 m!150077))

(assert (=> d!38797 m!149585))

(assert (=> d!38685 d!38797))

(declare-fun d!38799 () Bool)

(declare-fun e!83804 () Bool)

(assert (=> d!38799 e!83804))

(declare-fun res!61977 () Bool)

(assert (=> d!38799 (=> (not res!61977) (not e!83804))))

(declare-fun lt!66444 () ListLongMap!1657)

(assert (=> d!38799 (= res!61977 (contains!873 lt!66444 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!66443 () List!1698)

(assert (=> d!38799 (= lt!66444 (ListLongMap!1658 lt!66443))))

(declare-fun lt!66442 () Unit!3980)

(declare-fun lt!66441 () Unit!3980)

(assert (=> d!38799 (= lt!66442 lt!66441)))

(assert (=> d!38799 (= (getValueByKey!166 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38799 (= lt!66441 (lemmaContainsTupThenGetReturnValue!84 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38799 (= lt!66443 (insertStrictlySorted!87 (toList!844 e!83592) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38799 (= (+!159 e!83592 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66444)))

(declare-fun b!128373 () Bool)

(declare-fun res!61978 () Bool)

(assert (=> b!128373 (=> (not res!61978) (not e!83804))))

(assert (=> b!128373 (= res!61978 (= (getValueByKey!166 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128374 () Bool)

(assert (=> b!128374 (= e!83804 (contains!874 (toList!844 lt!66444) (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38799 res!61977) b!128373))

(assert (= (and b!128373 res!61978) b!128374))

(declare-fun m!150079 () Bool)

(assert (=> d!38799 m!150079))

(declare-fun m!150081 () Bool)

(assert (=> d!38799 m!150081))

(declare-fun m!150083 () Bool)

(assert (=> d!38799 m!150083))

(declare-fun m!150085 () Bool)

(assert (=> d!38799 m!150085))

(declare-fun m!150087 () Bool)

(assert (=> b!128373 m!150087))

(declare-fun m!150089 () Bool)

(assert (=> b!128374 m!150089))

(assert (=> bm!13816 d!38799))

(declare-fun b!128383 () Bool)

(declare-fun e!83810 () (_ BitVec 32))

(assert (=> b!128383 (= e!83810 #b00000000000000000000000000000000)))

(declare-fun b!128384 () Bool)

(declare-fun e!83809 () (_ BitVec 32))

(declare-fun call!13883 () (_ BitVec 32))

(assert (=> b!128384 (= e!83809 (bvadd #b00000000000000000000000000000001 call!13883))))

(declare-fun b!128385 () Bool)

(assert (=> b!128385 (= e!83810 e!83809)))

(declare-fun c!23557 () Bool)

(assert (=> b!128385 (= c!23557 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38801 () Bool)

(declare-fun lt!66447 () (_ BitVec 32))

(assert (=> d!38801 (and (bvsge lt!66447 #b00000000000000000000000000000000) (bvsle lt!66447 (bvsub (size!2490 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38801 (= lt!66447 e!83810)))

(declare-fun c!23556 () Bool)

(assert (=> d!38801 (= c!23556 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38801 (and (bvsle #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2490 (_keys!4540 newMap!16)) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38801 (= (arrayCountValidKeys!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) lt!66447)))

(declare-fun b!128386 () Bool)

(assert (=> b!128386 (= e!83809 call!13883)))

(declare-fun bm!13880 () Bool)

(assert (=> bm!13880 (= call!13883 (arrayCountValidKeys!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (= (and d!38801 c!23556) b!128383))

(assert (= (and d!38801 (not c!23556)) b!128385))

(assert (= (and b!128385 c!23557) b!128384))

(assert (= (and b!128385 (not c!23557)) b!128386))

(assert (= (or b!128384 b!128386) bm!13880))

(assert (=> b!128385 m!149575))

(assert (=> b!128385 m!149575))

(assert (=> b!128385 m!149663))

(declare-fun m!150091 () Bool)

(assert (=> bm!13880 m!150091))

(assert (=> b!127915 d!38801))

(assert (=> b!127904 d!38711))

(declare-fun d!38803 () Bool)

(declare-fun e!83811 () Bool)

(assert (=> d!38803 e!83811))

(declare-fun res!61979 () Bool)

(assert (=> d!38803 (=> (not res!61979) (not e!83811))))

(declare-fun lt!66451 () ListLongMap!1657)

(assert (=> d!38803 (= res!61979 (contains!873 lt!66451 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66450 () List!1698)

(assert (=> d!38803 (= lt!66451 (ListLongMap!1658 lt!66450))))

(declare-fun lt!66449 () Unit!3980)

(declare-fun lt!66448 () Unit!3980)

(assert (=> d!38803 (= lt!66449 lt!66448)))

(assert (=> d!38803 (= (getValueByKey!166 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38803 (= lt!66448 (lemmaContainsTupThenGetReturnValue!84 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38803 (= lt!66450 (insertStrictlySorted!87 (toList!844 call!13831) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38803 (= (+!159 call!13831 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66451)))

(declare-fun b!128387 () Bool)

(declare-fun res!61980 () Bool)

(assert (=> b!128387 (=> (not res!61980) (not e!83811))))

(assert (=> b!128387 (= res!61980 (= (getValueByKey!166 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128388 () Bool)

(assert (=> b!128388 (= e!83811 (contains!874 (toList!844 lt!66451) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38803 res!61979) b!128387))

(assert (= (and b!128387 res!61980) b!128388))

(declare-fun m!150093 () Bool)

(assert (=> d!38803 m!150093))

(declare-fun m!150095 () Bool)

(assert (=> d!38803 m!150095))

(declare-fun m!150097 () Bool)

(assert (=> d!38803 m!150097))

(declare-fun m!150099 () Bool)

(assert (=> d!38803 m!150099))

(declare-fun m!150101 () Bool)

(assert (=> b!128387 m!150101))

(declare-fun m!150103 () Bool)

(assert (=> b!128388 m!150103))

(assert (=> b!128021 d!38803))

(declare-fun d!38805 () Bool)

(declare-fun res!61985 () Bool)

(declare-fun e!83820 () Bool)

(assert (=> d!38805 (=> res!61985 e!83820)))

(assert (=> d!38805 (= res!61985 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 newMap!16) (mask!7071 newMap!16)) e!83820)))

(declare-fun b!128397 () Bool)

(declare-fun e!83819 () Bool)

(declare-fun e!83818 () Bool)

(assert (=> b!128397 (= e!83819 e!83818)))

(declare-fun lt!66459 () (_ BitVec 64))

(assert (=> b!128397 (= lt!66459 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66460 () Unit!3980)

(assert (=> b!128397 (= lt!66460 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000))))

(assert (=> b!128397 (arrayContainsKey!0 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000)))

(declare-fun lt!66458 () Unit!3980)

(assert (=> b!128397 (= lt!66458 lt!66460)))

(declare-fun res!61986 () Bool)

(assert (=> b!128397 (= res!61986 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (_keys!4540 newMap!16) (mask!7071 newMap!16)) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!128397 (=> (not res!61986) (not e!83818))))

(declare-fun b!128398 () Bool)

(declare-fun call!13886 () Bool)

(assert (=> b!128398 (= e!83818 call!13886)))

(declare-fun bm!13883 () Bool)

(assert (=> bm!13883 (= call!13886 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!128399 () Bool)

(assert (=> b!128399 (= e!83820 e!83819)))

(declare-fun c!23560 () Bool)

(assert (=> b!128399 (= c!23560 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128400 () Bool)

(assert (=> b!128400 (= e!83819 call!13886)))

(assert (= (and d!38805 (not res!61985)) b!128399))

(assert (= (and b!128399 c!23560) b!128397))

(assert (= (and b!128399 (not c!23560)) b!128400))

(assert (= (and b!128397 res!61986) b!128398))

(assert (= (or b!128398 b!128400) bm!13883))

(assert (=> b!128397 m!149575))

(declare-fun m!150105 () Bool)

(assert (=> b!128397 m!150105))

(declare-fun m!150107 () Bool)

(assert (=> b!128397 m!150107))

(assert (=> b!128397 m!149575))

(declare-fun m!150109 () Bool)

(assert (=> b!128397 m!150109))

(declare-fun m!150111 () Bool)

(assert (=> bm!13883 m!150111))

(assert (=> b!128399 m!149575))

(assert (=> b!128399 m!149575))

(assert (=> b!128399 m!149663))

(assert (=> b!127916 d!38805))

(declare-fun condMapEmpty!4555 () Bool)

(declare-fun mapDefault!4555 () ValueCell!1082)

(assert (=> mapNonEmpty!4554 (= condMapEmpty!4555 (= mapRest!4554 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4555)))))

(declare-fun e!83821 () Bool)

(declare-fun mapRes!4555 () Bool)

(assert (=> mapNonEmpty!4554 (= tp!11052 (and e!83821 mapRes!4555))))

(declare-fun b!128402 () Bool)

(assert (=> b!128402 (= e!83821 tp_is_empty!2851)))

(declare-fun b!128401 () Bool)

(declare-fun e!83822 () Bool)

(assert (=> b!128401 (= e!83822 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4555 () Bool)

(assert (=> mapIsEmpty!4555 mapRes!4555))

(declare-fun mapNonEmpty!4555 () Bool)

(declare-fun tp!11053 () Bool)

(assert (=> mapNonEmpty!4555 (= mapRes!4555 (and tp!11053 e!83822))))

(declare-fun mapKey!4555 () (_ BitVec 32))

(declare-fun mapRest!4555 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapValue!4555 () ValueCell!1082)

(assert (=> mapNonEmpty!4555 (= mapRest!4554 (store mapRest!4555 mapKey!4555 mapValue!4555))))

(assert (= (and mapNonEmpty!4554 condMapEmpty!4555) mapIsEmpty!4555))

(assert (= (and mapNonEmpty!4554 (not condMapEmpty!4555)) mapNonEmpty!4555))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1082) mapValue!4555)) b!128401))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1082) mapDefault!4555)) b!128402))

(declare-fun m!150113 () Bool)

(assert (=> mapNonEmpty!4555 m!150113))

(declare-fun condMapEmpty!4556 () Bool)

(declare-fun mapDefault!4556 () ValueCell!1082)

(assert (=> mapNonEmpty!4553 (= condMapEmpty!4556 (= mapRest!4553 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4556)))))

(declare-fun e!83823 () Bool)

(declare-fun mapRes!4556 () Bool)

(assert (=> mapNonEmpty!4553 (= tp!11051 (and e!83823 mapRes!4556))))

(declare-fun b!128404 () Bool)

(assert (=> b!128404 (= e!83823 tp_is_empty!2851)))

(declare-fun b!128403 () Bool)

(declare-fun e!83824 () Bool)

(assert (=> b!128403 (= e!83824 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4556 () Bool)

(assert (=> mapIsEmpty!4556 mapRes!4556))

(declare-fun mapNonEmpty!4556 () Bool)

(declare-fun tp!11054 () Bool)

(assert (=> mapNonEmpty!4556 (= mapRes!4556 (and tp!11054 e!83824))))

(declare-fun mapValue!4556 () ValueCell!1082)

(declare-fun mapRest!4556 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapKey!4556 () (_ BitVec 32))

(assert (=> mapNonEmpty!4556 (= mapRest!4553 (store mapRest!4556 mapKey!4556 mapValue!4556))))

(assert (= (and mapNonEmpty!4553 condMapEmpty!4556) mapIsEmpty!4556))

(assert (= (and mapNonEmpty!4553 (not condMapEmpty!4556)) mapNonEmpty!4556))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1082) mapValue!4556)) b!128403))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1082) mapDefault!4556)) b!128404))

(declare-fun m!150115 () Bool)

(assert (=> mapNonEmpty!4556 m!150115))

(declare-fun b_lambda!5663 () Bool)

(assert (= b_lambda!5655 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5663)))

(declare-fun b_lambda!5665 () Bool)

(assert (= b_lambda!5653 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5665)))

(declare-fun b_lambda!5667 () Bool)

(assert (= b_lambda!5659 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5667)))

(declare-fun b_lambda!5669 () Bool)

(assert (= b_lambda!5657 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5669)))

(declare-fun b_lambda!5671 () Bool)

(assert (= b_lambda!5661 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5671)))

(check-sat (not b!128098) (not d!38773) (not b!128230) (not b!128099) (not b!128141) (not b!128338) (not d!38725) (not b!128095) (not bm!13877) (not d!38733) (not d!38787) (not b!128130) (not b!128162) (not b!128388) (not d!38791) (not d!38771) (not b!128181) (not d!38761) (not b_lambda!5667) (not d!38755) (not b!128303) (not b!128182) (not b!128092) (not d!38795) (not b!128374) (not d!38751) (not d!38715) (not bm!13840) (not b!128228) (not b!128360) (not b!128114) (not bm!13883) (not b!128100) (not b_next!2871) (not bm!13847) (not b!128301) (not b!128358) (not d!38737) (not bm!13865) b_and!7915 (not b_next!2869) (not b!128397) (not b!128349) (not b!128218) (not b!128081) (not d!38719) (not b_lambda!5665) (not b!128097) (not d!38797) (not b_lambda!5651) (not d!38753) (not b!128148) (not b!128260) (not b!128166) (not b!128171) (not b!128104) (not d!38749) (not bm!13874) (not d!38765) (not b!128115) (not d!38703) (not b!128150) (not d!38789) (not bm!13838) (not d!38783) (not d!38777) (not d!38757) (not b!128274) (not b!128371) (not b!128222) (not b!128077) tp_is_empty!2851 (not b!128276) (not d!38799) (not mapNonEmpty!4555) (not d!38705) (not bm!13850) (not b!128355) (not b!128109) (not b!128341) (not b!128068) (not b!128266) (not b!128163) (not b!128080) (not bm!13876) (not d!38741) b_and!7913 (not b!128279) (not b!128278) (not b!128147) (not b!128298) (not b!128223) (not b!128073) (not bm!13843) (not b!128350) (not d!38803) (not b!128220) (not b!128265) (not d!38793) (not bm!13852) (not b!128282) (not d!38775) (not bm!13880) (not b!128108) (not d!38709) (not d!38759) (not b!128145) (not b!128083) (not b!128387) (not b!128370) (not d!38747) (not b!128168) (not b!128373) (not b!128275) (not d!38763) (not b!128261) (not b!128226) (not b!128285) (not bm!13862) (not b!128169) (not b!128142) (not b!128264) (not b!128107) (not b!128183) (not d!38723) (not b!128347) (not d!38695) (not b!128105) (not b!128300) (not b!128255) (not d!38731) (not b!128340) (not bm!13839) (not b!128296) (not bm!13858) (not b!128399) (not b!128357) (not b_lambda!5647) (not b_lambda!5669) (not d!38727) (not b_lambda!5663) (not d!38701) (not d!38721) (not d!38769) (not b!128106) (not b!128149) (not d!38699) (not mapNonEmpty!4556) (not b!128258) (not b!128154) (not b_lambda!5671) (not d!38713) (not b!128091) (not b!128262) (not b!128225) (not bm!13859) (not b!128175) (not b!128229) (not bm!13845) (not bm!13846) (not d!38767) (not d!38697) (not b!128227) (not bm!13853) (not d!38707) (not bm!13836) (not b!128280) (not d!38743) (not bm!13833) (not b!128170) (not b!128277) (not d!38745) (not b!128385))
(check-sat b_and!7913 b_and!7915 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun b!128405 () Bool)

(declare-fun e!83825 () Bool)

(declare-fun e!83828 () Bool)

(assert (=> b!128405 (= e!83825 e!83828)))

(declare-fun res!61988 () Bool)

(assert (=> b!128405 (=> (not res!61988) (not e!83828))))

(declare-fun e!83827 () Bool)

(assert (=> b!128405 (= res!61988 (not e!83827))))

(declare-fun res!61989 () Bool)

(assert (=> b!128405 (=> (not res!61989) (not e!83827))))

(assert (=> b!128405 (= res!61989 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun b!128406 () Bool)

(declare-fun e!83826 () Bool)

(declare-fun call!13887 () Bool)

(assert (=> b!128406 (= e!83826 call!13887)))

(declare-fun b!128407 () Bool)

(assert (=> b!128407 (= e!83828 e!83826)))

(declare-fun c!23561 () Bool)

(assert (=> b!128407 (= c!23561 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun b!128408 () Bool)

(assert (=> b!128408 (= e!83826 call!13887)))

(declare-fun b!128409 () Bool)

(assert (=> b!128409 (= e!83827 (contains!875 Nil!1697 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun bm!13884 () Bool)

(assert (=> bm!13884 (= call!13887 (arrayNoDuplicates!0 (_keys!4540 (_2!1292 lt!66148)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23561 (Cons!1696 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!38807 () Bool)

(declare-fun res!61987 () Bool)

(assert (=> d!38807 (=> res!61987 e!83825)))

(assert (=> d!38807 (= res!61987 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (=> d!38807 (= (arrayNoDuplicates!0 (_keys!4540 (_2!1292 lt!66148)) #b00000000000000000000000000000000 Nil!1697) e!83825)))

(assert (= (and d!38807 (not res!61987)) b!128405))

(assert (= (and b!128405 res!61989) b!128409))

(assert (= (and b!128405 res!61988) b!128407))

(assert (= (and b!128407 c!23561) b!128406))

(assert (= (and b!128407 (not c!23561)) b!128408))

(assert (= (or b!128406 b!128408) bm!13884))

(declare-fun m!150117 () Bool)

(assert (=> b!128405 m!150117))

(assert (=> b!128405 m!150117))

(declare-fun m!150119 () Bool)

(assert (=> b!128405 m!150119))

(assert (=> b!128407 m!150117))

(assert (=> b!128407 m!150117))

(assert (=> b!128407 m!150119))

(assert (=> b!128409 m!150117))

(assert (=> b!128409 m!150117))

(declare-fun m!150121 () Bool)

(assert (=> b!128409 m!150121))

(assert (=> bm!13884 m!150117))

(declare-fun m!150123 () Bool)

(assert (=> bm!13884 m!150123))

(assert (=> b!128107 d!38807))

(declare-fun d!38809 () Bool)

(assert (=> d!38809 (= (size!2496 newMap!16) (bvadd (_size!585 newMap!16) (bvsdiv (bvadd (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!128371 d!38809))

(declare-fun d!38811 () Bool)

(assert (=> d!38811 (= (get!1455 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128109 d!38811))

(declare-fun d!38813 () Bool)

(assert (=> d!38813 (= (apply!112 lt!66181 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5306 () Bool)

(assert (= bs!5306 d!38813))

(declare-fun m!150125 () Bool)

(assert (=> bs!5306 m!150125))

(assert (=> bs!5306 m!150125))

(declare-fun m!150127 () Bool)

(assert (=> bs!5306 m!150127))

(assert (=> b!128097 d!38813))

(declare-fun d!38815 () Bool)

(assert (=> d!38815 (= (apply!112 lt!66249 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5307 () Bool)

(assert (= bs!5307 d!38815))

(declare-fun m!150129 () Bool)

(assert (=> bs!5307 m!150129))

(assert (=> bs!5307 m!150129))

(declare-fun m!150131 () Bool)

(assert (=> bs!5307 m!150131))

(assert (=> b!128166 d!38815))

(declare-fun d!38817 () Bool)

(declare-fun res!61990 () Bool)

(declare-fun e!83829 () Bool)

(assert (=> d!38817 (=> (not res!61990) (not e!83829))))

(assert (=> d!38817 (= res!61990 (simpleValid!88 (_2!1292 lt!66418)))))

(assert (=> d!38817 (= (valid!519 (_2!1292 lt!66418)) e!83829)))

(declare-fun b!128410 () Bool)

(declare-fun res!61991 () Bool)

(assert (=> b!128410 (=> (not res!61991) (not e!83829))))

(assert (=> b!128410 (= res!61991 (= (arrayCountValidKeys!0 (_keys!4540 (_2!1292 lt!66418)) #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66418)))) (_size!585 (_2!1292 lt!66418))))))

(declare-fun b!128411 () Bool)

(declare-fun res!61992 () Bool)

(assert (=> b!128411 (=> (not res!61992) (not e!83829))))

(assert (=> b!128411 (= res!61992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 (_2!1292 lt!66418)) (mask!7071 (_2!1292 lt!66418))))))

(declare-fun b!128412 () Bool)

(assert (=> b!128412 (= e!83829 (arrayNoDuplicates!0 (_keys!4540 (_2!1292 lt!66418)) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38817 res!61990) b!128410))

(assert (= (and b!128410 res!61991) b!128411))

(assert (= (and b!128411 res!61992) b!128412))

(declare-fun m!150133 () Bool)

(assert (=> d!38817 m!150133))

(declare-fun m!150135 () Bool)

(assert (=> b!128410 m!150135))

(declare-fun m!150137 () Bool)

(assert (=> b!128411 m!150137))

(declare-fun m!150139 () Bool)

(assert (=> b!128412 m!150139))

(assert (=> b!128350 d!38817))

(declare-fun d!38819 () Bool)

(assert (=> d!38819 (= (isDefined!120 (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))) (not (isEmpty!404 (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))))

(declare-fun bs!5308 () Bool)

(assert (= bs!5308 d!38819))

(assert (=> bs!5308 m!150001))

(declare-fun m!150141 () Bool)

(assert (=> bs!5308 m!150141))

(assert (=> b!128300 d!38819))

(declare-fun b!128413 () Bool)

(declare-fun e!83830 () Option!172)

(assert (=> b!128413 (= e!83830 (Some!171 (_2!1291 (h!2297 (toList!844 call!13818)))))))

(declare-fun b!128416 () Bool)

(declare-fun e!83831 () Option!172)

(assert (=> b!128416 (= e!83831 None!170)))

(declare-fun b!128415 () Bool)

(assert (=> b!128415 (= e!83831 (getValueByKey!166 (t!6068 (toList!844 call!13818)) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(declare-fun d!38821 () Bool)

(declare-fun c!23562 () Bool)

(assert (=> d!38821 (= c!23562 (and ((_ is Cons!1694) (toList!844 call!13818)) (= (_1!1291 (h!2297 (toList!844 call!13818))) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))))

(assert (=> d!38821 (= (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))) e!83830)))

(declare-fun b!128414 () Bool)

(assert (=> b!128414 (= e!83830 e!83831)))

(declare-fun c!23563 () Bool)

(assert (=> b!128414 (= c!23563 (and ((_ is Cons!1694) (toList!844 call!13818)) (not (= (_1!1291 (h!2297 (toList!844 call!13818))) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))))

(assert (= (and d!38821 c!23562) b!128413))

(assert (= (and d!38821 (not c!23562)) b!128414))

(assert (= (and b!128414 c!23563) b!128415))

(assert (= (and b!128414 (not c!23563)) b!128416))

(declare-fun m!150143 () Bool)

(assert (=> b!128415 m!150143))

(assert (=> b!128300 d!38821))

(assert (=> d!38759 d!38773))

(assert (=> d!38759 d!38745))

(declare-fun d!38823 () Bool)

(assert (=> d!38823 (contains!873 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66061)))

(assert (=> d!38823 true))

(declare-fun _$35!375 () Unit!3980)

(assert (=> d!38823 (= (choose!786 lt!66056 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66061) _$35!375)))

(declare-fun bs!5309 () Bool)

(assert (= bs!5309 d!38823))

(assert (=> bs!5309 m!149471))

(assert (=> bs!5309 m!149471))

(assert (=> bs!5309 m!149473))

(assert (=> d!38759 d!38823))

(declare-fun d!38825 () Bool)

(declare-fun e!83833 () Bool)

(assert (=> d!38825 e!83833))

(declare-fun res!61993 () Bool)

(assert (=> d!38825 (=> res!61993 e!83833)))

(declare-fun lt!66463 () Bool)

(assert (=> d!38825 (= res!61993 (not lt!66463))))

(declare-fun lt!66464 () Bool)

(assert (=> d!38825 (= lt!66463 lt!66464)))

(declare-fun lt!66462 () Unit!3980)

(declare-fun e!83832 () Unit!3980)

(assert (=> d!38825 (= lt!66462 e!83832)))

(declare-fun c!23564 () Bool)

(assert (=> d!38825 (= c!23564 lt!66464)))

(assert (=> d!38825 (= lt!66464 (containsKey!170 (toList!844 lt!66056) lt!66061))))

(assert (=> d!38825 (= (contains!873 lt!66056 lt!66061) lt!66463)))

(declare-fun b!128418 () Bool)

(declare-fun lt!66461 () Unit!3980)

(assert (=> b!128418 (= e!83832 lt!66461)))

(assert (=> b!128418 (= lt!66461 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66056) lt!66061))))

(assert (=> b!128418 (isDefined!120 (getValueByKey!166 (toList!844 lt!66056) lt!66061))))

(declare-fun b!128419 () Bool)

(declare-fun Unit!3999 () Unit!3980)

(assert (=> b!128419 (= e!83832 Unit!3999)))

(declare-fun b!128420 () Bool)

(assert (=> b!128420 (= e!83833 (isDefined!120 (getValueByKey!166 (toList!844 lt!66056) lt!66061)))))

(assert (= (and d!38825 c!23564) b!128418))

(assert (= (and d!38825 (not c!23564)) b!128419))

(assert (= (and d!38825 (not res!61993)) b!128420))

(declare-fun m!150145 () Bool)

(assert (=> d!38825 m!150145))

(declare-fun m!150147 () Bool)

(assert (=> b!128418 m!150147))

(declare-fun m!150149 () Bool)

(assert (=> b!128418 m!150149))

(assert (=> b!128418 m!150149))

(declare-fun m!150151 () Bool)

(assert (=> b!128418 m!150151))

(assert (=> b!128420 m!150149))

(assert (=> b!128420 m!150149))

(assert (=> b!128420 m!150151))

(assert (=> d!38759 d!38825))

(declare-fun d!38827 () Bool)

(assert (=> d!38827 (= (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!404 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5310 () Bool)

(assert (= bs!5310 d!38827))

(assert (=> bs!5310 m!149579))

(declare-fun m!150153 () Bool)

(assert (=> bs!5310 m!150153))

(assert (=> b!128303 d!38827))

(declare-fun b!128421 () Bool)

(declare-fun e!83834 () Option!172)

(assert (=> b!128421 (= e!83834 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66050)))))))

(declare-fun b!128424 () Bool)

(declare-fun e!83835 () Option!172)

(assert (=> b!128424 (= e!83835 None!170)))

(declare-fun b!128423 () Bool)

(assert (=> b!128423 (= e!83835 (getValueByKey!166 (t!6068 (toList!844 lt!66050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38829 () Bool)

(declare-fun c!23565 () Bool)

(assert (=> d!38829 (= c!23565 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38829 (= (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000) e!83834)))

(declare-fun b!128422 () Bool)

(assert (=> b!128422 (= e!83834 e!83835)))

(declare-fun c!23566 () Bool)

(assert (=> b!128422 (= c!23566 (and ((_ is Cons!1694) (toList!844 lt!66050)) (not (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38829 c!23565) b!128421))

(assert (= (and d!38829 (not c!23565)) b!128422))

(assert (= (and b!128422 c!23566) b!128423))

(assert (= (and b!128422 (not c!23566)) b!128424))

(declare-fun m!150155 () Bool)

(assert (=> b!128423 m!150155))

(assert (=> b!128303 d!38829))

(declare-fun d!38831 () Bool)

(assert (=> d!38831 (= (apply!112 lt!66227 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!166 (toList!844 lt!66227) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5311 () Bool)

(assert (= bs!5311 d!38831))

(assert (=> bs!5311 m!149575))

(declare-fun m!150157 () Bool)

(assert (=> bs!5311 m!150157))

(assert (=> bs!5311 m!150157))

(declare-fun m!150159 () Bool)

(assert (=> bs!5311 m!150159))

(assert (=> b!128141 d!38831))

(declare-fun d!38833 () Bool)

(declare-fun c!23567 () Bool)

(assert (=> d!38833 (= c!23567 ((_ is ValueCellFull!1082) (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000)))))

(declare-fun e!83836 () V!3449)

(assert (=> d!38833 (= (get!1453 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83836)))

(declare-fun b!128425 () Bool)

(assert (=> b!128425 (= e!83836 (get!1454 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128426 () Bool)

(assert (=> b!128426 (= e!83836 (get!1455 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38833 c!23567) b!128425))

(assert (= (and d!38833 (not c!23567)) b!128426))

(assert (=> b!128425 m!149725))

(assert (=> b!128425 m!149617))

(declare-fun m!150161 () Bool)

(assert (=> b!128425 m!150161))

(assert (=> b!128426 m!149725))

(assert (=> b!128426 m!149617))

(declare-fun m!150163 () Bool)

(assert (=> b!128426 m!150163))

(assert (=> b!128141 d!38833))

(declare-fun d!38835 () Bool)

(declare-fun res!61994 () Bool)

(declare-fun e!83837 () Bool)

(assert (=> d!38835 (=> res!61994 e!83837)))

(assert (=> d!38835 (= res!61994 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38835 (= (containsKey!170 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83837)))

(declare-fun b!128427 () Bool)

(declare-fun e!83838 () Bool)

(assert (=> b!128427 (= e!83837 e!83838)))

(declare-fun res!61995 () Bool)

(assert (=> b!128427 (=> (not res!61995) (not e!83838))))

(assert (=> b!128427 (= res!61995 (and (or (not ((_ is Cons!1694) (toList!844 lt!66050))) (bvsle (_1!1291 (h!2297 (toList!844 lt!66050))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1694) (toList!844 lt!66050)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66050))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!128428 () Bool)

(assert (=> b!128428 (= e!83838 (containsKey!170 (t!6068 (toList!844 lt!66050)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38835 (not res!61994)) b!128427))

(assert (= (and b!128427 res!61995) b!128428))

(assert (=> b!128428 m!149447))

(declare-fun m!150165 () Bool)

(assert (=> b!128428 m!150165))

(assert (=> d!38793 d!38835))

(declare-fun d!38837 () Bool)

(declare-fun e!83839 () Bool)

(assert (=> d!38837 e!83839))

(declare-fun res!61996 () Bool)

(assert (=> d!38837 (=> (not res!61996) (not e!83839))))

(declare-fun lt!66468 () ListLongMap!1657)

(assert (=> d!38837 (= res!61996 (contains!873 lt!66468 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66467 () List!1698)

(assert (=> d!38837 (= lt!66468 (ListLongMap!1658 lt!66467))))

(declare-fun lt!66466 () Unit!3980)

(declare-fun lt!66465 () Unit!3980)

(assert (=> d!38837 (= lt!66466 lt!66465)))

(assert (=> d!38837 (= (getValueByKey!166 lt!66467 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38837 (= lt!66465 (lemmaContainsTupThenGetReturnValue!84 lt!66467 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38837 (= lt!66467 (insertStrictlySorted!87 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38837 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66468)))

(declare-fun b!128429 () Bool)

(declare-fun res!61997 () Bool)

(assert (=> b!128429 (=> (not res!61997) (not e!83839))))

(assert (=> b!128429 (= res!61997 (= (getValueByKey!166 (toList!844 lt!66468) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128430 () Bool)

(assert (=> b!128430 (= e!83839 (contains!874 (toList!844 lt!66468) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38837 res!61996) b!128429))

(assert (= (and b!128429 res!61997) b!128430))

(declare-fun m!150167 () Bool)

(assert (=> d!38837 m!150167))

(declare-fun m!150169 () Bool)

(assert (=> d!38837 m!150169))

(declare-fun m!150171 () Bool)

(assert (=> d!38837 m!150171))

(declare-fun m!150173 () Bool)

(assert (=> d!38837 m!150173))

(declare-fun m!150175 () Bool)

(assert (=> b!128429 m!150175))

(declare-fun m!150177 () Bool)

(assert (=> b!128430 m!150177))

(assert (=> d!38791 d!38837))

(declare-fun d!38839 () Bool)

(declare-fun e!83841 () Bool)

(assert (=> d!38839 e!83841))

(declare-fun res!61998 () Bool)

(assert (=> d!38839 (=> res!61998 e!83841)))

(declare-fun lt!66471 () Bool)

(assert (=> d!38839 (= res!61998 (not lt!66471))))

(declare-fun lt!66472 () Bool)

(assert (=> d!38839 (= lt!66471 lt!66472)))

(declare-fun lt!66470 () Unit!3980)

(declare-fun e!83840 () Unit!3980)

(assert (=> d!38839 (= lt!66470 e!83840)))

(declare-fun c!23568 () Bool)

(assert (=> d!38839 (= c!23568 lt!66472)))

(assert (=> d!38839 (= lt!66472 (containsKey!170 (toList!844 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(assert (=> d!38839 (= (contains!873 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))) lt!66471)))

(declare-fun b!128431 () Bool)

(declare-fun lt!66469 () Unit!3980)

(assert (=> b!128431 (= e!83840 lt!66469)))

(assert (=> b!128431 (= lt!66469 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(assert (=> b!128431 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(declare-fun b!128432 () Bool)

(declare-fun Unit!4000 () Unit!3980)

(assert (=> b!128432 (= e!83840 Unit!4000)))

(declare-fun b!128433 () Bool)

(assert (=> b!128433 (= e!83841 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))))

(assert (= (and d!38839 c!23568) b!128431))

(assert (= (and d!38839 (not c!23568)) b!128432))

(assert (= (and d!38839 (not res!61998)) b!128433))

(assert (=> d!38839 m!150049))

(declare-fun m!150179 () Bool)

(assert (=> d!38839 m!150179))

(assert (=> b!128431 m!150049))

(declare-fun m!150181 () Bool)

(assert (=> b!128431 m!150181))

(assert (=> b!128431 m!150049))

(declare-fun m!150183 () Bool)

(assert (=> b!128431 m!150183))

(assert (=> b!128431 m!150183))

(declare-fun m!150185 () Bool)

(assert (=> b!128431 m!150185))

(assert (=> b!128433 m!150049))

(assert (=> b!128433 m!150183))

(assert (=> b!128433 m!150183))

(assert (=> b!128433 m!150185))

(assert (=> d!38791 d!38839))

(declare-fun d!38841 () Bool)

(declare-fun e!83842 () Bool)

(assert (=> d!38841 e!83842))

(declare-fun res!61999 () Bool)

(assert (=> d!38841 (=> (not res!61999) (not e!83842))))

(assert (=> d!38841 (= res!61999 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 lt!66428))))))

(declare-fun lt!66473 () Unit!3980)

(assert (=> d!38841 (= lt!66473 (choose!781 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38841 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38841 (= (lemmaValidKeyInArrayIsInListMap!116 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (defaultEntry!2804 newMap!16)) lt!66473)))

(declare-fun b!128434 () Bool)

(assert (=> b!128434 (= e!83842 (contains!873 (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 lt!66428) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(assert (= (and d!38841 res!61999) b!128434))

(declare-fun m!150187 () Bool)

(assert (=> d!38841 m!150187))

(assert (=> d!38841 m!149585))

(assert (=> b!128434 m!150047))

(declare-fun m!150189 () Bool)

(assert (=> b!128434 m!150189))

(assert (=> b!128434 m!150047))

(assert (=> b!128434 m!150189))

(declare-fun m!150191 () Bool)

(assert (=> b!128434 m!150191))

(assert (=> d!38791 d!38841))

(declare-fun b!128445 () Bool)

(declare-fun e!83848 () Bool)

(assert (=> b!128445 (= e!83848 (bvslt (size!2490 (_keys!4540 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!128446 () Bool)

(declare-fun e!83847 () Bool)

(assert (=> b!128446 (= e!83847 (= (arrayCountValidKeys!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4540 newMap!16) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!128444 () Bool)

(declare-fun res!62009 () Bool)

(assert (=> b!128444 (=> (not res!62009) (not e!83848))))

(assert (=> b!128444 (= res!62009 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128443 () Bool)

(declare-fun res!62008 () Bool)

(assert (=> b!128443 (=> (not res!62008) (not e!83848))))

(assert (=> b!128443 (= res!62008 (not (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))))

(declare-fun d!38843 () Bool)

(assert (=> d!38843 e!83847))

(declare-fun res!62010 () Bool)

(assert (=> d!38843 (=> (not res!62010) (not e!83847))))

(assert (=> d!38843 (= res!62010 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 (_keys!4540 newMap!16)))))))

(declare-fun lt!66476 () Unit!3980)

(declare-fun choose!1 (array!4701 (_ BitVec 32) (_ BitVec 64)) Unit!3980)

(assert (=> d!38843 (= lt!66476 (choose!1 (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38843 e!83848))

(declare-fun res!62011 () Bool)

(assert (=> d!38843 (=> (not res!62011) (not e!83848))))

(assert (=> d!38843 (= res!62011 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 (_keys!4540 newMap!16)))))))

(assert (=> d!38843 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66476)))

(assert (= (and d!38843 res!62011) b!128443))

(assert (= (and b!128443 res!62008) b!128444))

(assert (= (and b!128444 res!62009) b!128445))

(assert (= (and d!38843 res!62010) b!128446))

(assert (=> b!128446 m!150039))

(assert (=> b!128446 m!150035))

(assert (=> b!128446 m!149499))

(assert (=> b!128444 m!149345))

(declare-fun m!150193 () Bool)

(assert (=> b!128444 m!150193))

(declare-fun m!150195 () Bool)

(assert (=> b!128443 m!150195))

(assert (=> b!128443 m!150195))

(declare-fun m!150197 () Bool)

(assert (=> b!128443 m!150197))

(assert (=> d!38843 m!149345))

(declare-fun m!150199 () Bool)

(assert (=> d!38843 m!150199))

(assert (=> d!38791 d!38843))

(assert (=> d!38791 d!38705))

(assert (=> d!38791 d!38707))

(assert (=> d!38791 d!38685))

(declare-fun d!38845 () Bool)

(declare-fun e!83851 () Bool)

(assert (=> d!38845 e!83851))

(declare-fun res!62014 () Bool)

(assert (=> d!38845 (=> (not res!62014) (not e!83851))))

(assert (=> d!38845 (= res!62014 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 (_keys!4540 newMap!16)))))))

(declare-fun lt!66479 () Unit!3980)

(declare-fun choose!41 (array!4701 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1700) Unit!3980)

(assert (=> d!38845 (= lt!66479 (choose!41 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) lt!66412 lt!66422))))

(assert (=> d!38845 (bvslt (size!2490 (_keys!4540 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38845 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) lt!66412 lt!66422) lt!66479)))

(declare-fun b!128449 () Bool)

(assert (=> b!128449 (= e!83851 (arrayNoDuplicates!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) lt!66412 lt!66422))))

(assert (= (and d!38845 res!62014) b!128449))

(assert (=> d!38845 m!149345))

(declare-fun m!150201 () Bool)

(assert (=> d!38845 m!150201))

(assert (=> b!128449 m!150039))

(assert (=> b!128449 m!150059))

(assert (=> d!38791 d!38845))

(assert (=> d!38791 d!38693))

(declare-fun bm!13885 () Bool)

(declare-fun call!13891 () Bool)

(declare-fun lt!66485 () ListLongMap!1657)

(assert (=> bm!13885 (= call!13891 (contains!873 lt!66485 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13886 () Bool)

(declare-fun call!13892 () ListLongMap!1657)

(declare-fun call!13894 () ListLongMap!1657)

(assert (=> bm!13886 (= call!13892 call!13894)))

(declare-fun b!128450 () Bool)

(declare-fun e!83856 () Unit!3980)

(declare-fun Unit!4001 () Unit!3980)

(assert (=> b!128450 (= e!83856 Unit!4001)))

(declare-fun b!128451 () Bool)

(declare-fun e!83854 () Bool)

(declare-fun call!13893 () Bool)

(assert (=> b!128451 (= e!83854 (not call!13893))))

(declare-fun b!128452 () Bool)

(declare-fun e!83861 () Bool)

(assert (=> b!128452 (= e!83854 e!83861)))

(declare-fun res!62016 () Bool)

(assert (=> b!128452 (= res!62016 call!13893)))

(assert (=> b!128452 (=> (not res!62016) (not e!83861))))

(declare-fun b!128453 () Bool)

(declare-fun res!62015 () Bool)

(declare-fun e!83860 () Bool)

(assert (=> b!128453 (=> (not res!62015) (not e!83860))))

(declare-fun e!83853 () Bool)

(assert (=> b!128453 (= res!62015 e!83853)))

(declare-fun res!62022 () Bool)

(assert (=> b!128453 (=> res!62022 e!83853)))

(declare-fun e!83862 () Bool)

(assert (=> b!128453 (= res!62022 (not e!83862))))

(declare-fun res!62017 () Bool)

(assert (=> b!128453 (=> (not res!62017) (not e!83862))))

(assert (=> b!128453 (= res!62017 (bvslt #b00000000000000000000000000000000 (size!2490 lt!66428)))))

(declare-fun b!128454 () Bool)

(declare-fun e!83864 () ListLongMap!1657)

(declare-fun e!83852 () ListLongMap!1657)

(assert (=> b!128454 (= e!83864 e!83852)))

(declare-fun c!23571 () Bool)

(assert (=> b!128454 (= c!23571 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128455 () Bool)

(declare-fun e!83857 () Bool)

(assert (=> b!128455 (= e!83857 (not call!13891))))

(declare-fun d!38847 () Bool)

(assert (=> d!38847 e!83860))

(declare-fun res!62021 () Bool)

(assert (=> d!38847 (=> (not res!62021) (not e!83860))))

(assert (=> d!38847 (= res!62021 (or (bvsge #b00000000000000000000000000000000 (size!2490 lt!66428)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 lt!66428)))))))

(declare-fun lt!66482 () ListLongMap!1657)

(assert (=> d!38847 (= lt!66485 lt!66482)))

(declare-fun lt!66494 () Unit!3980)

(assert (=> d!38847 (= lt!66494 e!83856)))

(declare-fun c!23570 () Bool)

(declare-fun e!83855 () Bool)

(assert (=> d!38847 (= c!23570 e!83855)))

(declare-fun res!62019 () Bool)

(assert (=> d!38847 (=> (not res!62019) (not e!83855))))

(assert (=> d!38847 (= res!62019 (bvslt #b00000000000000000000000000000000 (size!2490 lt!66428)))))

(assert (=> d!38847 (= lt!66482 e!83864)))

(declare-fun c!23569 () Bool)

(assert (=> d!38847 (= c!23569 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38847 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38847 (= (getCurrentListMap!513 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66485)))

(declare-fun b!128456 () Bool)

(assert (=> b!128456 (= e!83852 call!13892)))

(declare-fun b!128457 () Bool)

(declare-fun e!83863 () Bool)

(assert (=> b!128457 (= e!83863 (= (apply!112 lt!66485 (select (arr!2224 lt!66428) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 lt!66429) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 lt!66429)))))

(assert (=> b!128457 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 lt!66428)))))

(declare-fun b!128458 () Bool)

(assert (=> b!128458 (= e!83864 (+!159 call!13894 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!128459 () Bool)

(assert (=> b!128459 (= e!83860 e!83857)))

(declare-fun c!23573 () Bool)

(assert (=> b!128459 (= c!23573 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128460 () Bool)

(declare-fun e!83858 () ListLongMap!1657)

(assert (=> b!128460 (= e!83858 call!13892)))

(declare-fun bm!13887 () Bool)

(declare-fun call!13889 () ListLongMap!1657)

(declare-fun call!13890 () ListLongMap!1657)

(assert (=> bm!13887 (= call!13889 call!13890)))

(declare-fun bm!13888 () Bool)

(declare-fun call!13888 () ListLongMap!1657)

(assert (=> bm!13888 (= call!13894 (+!159 (ite c!23569 call!13890 (ite c!23571 call!13889 call!13888)) (ite (or c!23569 c!23571) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128461 () Bool)

(declare-fun e!83859 () Bool)

(assert (=> b!128461 (= e!83859 (= (apply!112 lt!66485 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128462 () Bool)

(assert (=> b!128462 (= e!83858 call!13888)))

(declare-fun b!128463 () Bool)

(assert (=> b!128463 (= e!83861 (= (apply!112 lt!66485 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128464 () Bool)

(assert (=> b!128464 (= e!83862 (validKeyInArray!0 (select (arr!2224 lt!66428) #b00000000000000000000000000000000)))))

(declare-fun bm!13889 () Bool)

(assert (=> bm!13889 (= call!13888 call!13889)))

(declare-fun bm!13890 () Bool)

(assert (=> bm!13890 (= call!13890 (getCurrentListMapNoExtraKeys!124 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128465 () Bool)

(assert (=> b!128465 (= e!83853 e!83863)))

(declare-fun res!62018 () Bool)

(assert (=> b!128465 (=> (not res!62018) (not e!83863))))

(assert (=> b!128465 (= res!62018 (contains!873 lt!66485 (select (arr!2224 lt!66428) #b00000000000000000000000000000000)))))

(assert (=> b!128465 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 lt!66428)))))

(declare-fun bm!13891 () Bool)

(assert (=> bm!13891 (= call!13893 (contains!873 lt!66485 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128466 () Bool)

(assert (=> b!128466 (= e!83855 (validKeyInArray!0 (select (arr!2224 lt!66428) #b00000000000000000000000000000000)))))

(declare-fun b!128467 () Bool)

(assert (=> b!128467 (= e!83857 e!83859)))

(declare-fun res!62020 () Bool)

(assert (=> b!128467 (= res!62020 call!13891)))

(assert (=> b!128467 (=> (not res!62020) (not e!83859))))

(declare-fun b!128468 () Bool)

(declare-fun res!62023 () Bool)

(assert (=> b!128468 (=> (not res!62023) (not e!83860))))

(assert (=> b!128468 (= res!62023 e!83854)))

(declare-fun c!23574 () Bool)

(assert (=> b!128468 (= c!23574 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128469 () Bool)

(declare-fun c!23572 () Bool)

(assert (=> b!128469 (= c!23572 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128469 (= e!83852 e!83858)))

(declare-fun b!128470 () Bool)

(declare-fun lt!66490 () Unit!3980)

(assert (=> b!128470 (= e!83856 lt!66490)))

(declare-fun lt!66491 () ListLongMap!1657)

(assert (=> b!128470 (= lt!66491 (getCurrentListMapNoExtraKeys!124 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66489 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66496 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66496 (select (arr!2224 lt!66428) #b00000000000000000000000000000000))))

(declare-fun lt!66486 () Unit!3980)

(assert (=> b!128470 (= lt!66486 (addStillContains!88 lt!66491 lt!66489 (zeroValue!2665 newMap!16) lt!66496))))

(assert (=> b!128470 (contains!873 (+!159 lt!66491 (tuple2!2561 lt!66489 (zeroValue!2665 newMap!16))) lt!66496)))

(declare-fun lt!66481 () Unit!3980)

(assert (=> b!128470 (= lt!66481 lt!66486)))

(declare-fun lt!66487 () ListLongMap!1657)

(assert (=> b!128470 (= lt!66487 (getCurrentListMapNoExtraKeys!124 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66483 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66493 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66493 (select (arr!2224 lt!66428) #b00000000000000000000000000000000))))

(declare-fun lt!66501 () Unit!3980)

(assert (=> b!128470 (= lt!66501 (addApplyDifferent!88 lt!66487 lt!66483 (minValue!2665 newMap!16) lt!66493))))

(assert (=> b!128470 (= (apply!112 (+!159 lt!66487 (tuple2!2561 lt!66483 (minValue!2665 newMap!16))) lt!66493) (apply!112 lt!66487 lt!66493))))

(declare-fun lt!66497 () Unit!3980)

(assert (=> b!128470 (= lt!66497 lt!66501)))

(declare-fun lt!66500 () ListLongMap!1657)

(assert (=> b!128470 (= lt!66500 (getCurrentListMapNoExtraKeys!124 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66495 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66480 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66480 (select (arr!2224 lt!66428) #b00000000000000000000000000000000))))

(declare-fun lt!66484 () Unit!3980)

(assert (=> b!128470 (= lt!66484 (addApplyDifferent!88 lt!66500 lt!66495 (zeroValue!2665 newMap!16) lt!66480))))

(assert (=> b!128470 (= (apply!112 (+!159 lt!66500 (tuple2!2561 lt!66495 (zeroValue!2665 newMap!16))) lt!66480) (apply!112 lt!66500 lt!66480))))

(declare-fun lt!66492 () Unit!3980)

(assert (=> b!128470 (= lt!66492 lt!66484)))

(declare-fun lt!66498 () ListLongMap!1657)

(assert (=> b!128470 (= lt!66498 (getCurrentListMapNoExtraKeys!124 lt!66428 lt!66429 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66499 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66488 () (_ BitVec 64))

(assert (=> b!128470 (= lt!66488 (select (arr!2224 lt!66428) #b00000000000000000000000000000000))))

(assert (=> b!128470 (= lt!66490 (addApplyDifferent!88 lt!66498 lt!66499 (minValue!2665 newMap!16) lt!66488))))

(assert (=> b!128470 (= (apply!112 (+!159 lt!66498 (tuple2!2561 lt!66499 (minValue!2665 newMap!16))) lt!66488) (apply!112 lt!66498 lt!66488))))

(assert (= (and d!38847 c!23569) b!128458))

(assert (= (and d!38847 (not c!23569)) b!128454))

(assert (= (and b!128454 c!23571) b!128456))

(assert (= (and b!128454 (not c!23571)) b!128469))

(assert (= (and b!128469 c!23572) b!128460))

(assert (= (and b!128469 (not c!23572)) b!128462))

(assert (= (or b!128460 b!128462) bm!13889))

(assert (= (or b!128456 bm!13889) bm!13887))

(assert (= (or b!128456 b!128460) bm!13886))

(assert (= (or b!128458 bm!13887) bm!13890))

(assert (= (or b!128458 bm!13886) bm!13888))

(assert (= (and d!38847 res!62019) b!128466))

(assert (= (and d!38847 c!23570) b!128470))

(assert (= (and d!38847 (not c!23570)) b!128450))

(assert (= (and d!38847 res!62021) b!128453))

(assert (= (and b!128453 res!62017) b!128464))

(assert (= (and b!128453 (not res!62022)) b!128465))

(assert (= (and b!128465 res!62018) b!128457))

(assert (= (and b!128453 res!62015) b!128468))

(assert (= (and b!128468 c!23574) b!128452))

(assert (= (and b!128468 (not c!23574)) b!128451))

(assert (= (and b!128452 res!62016) b!128463))

(assert (= (or b!128452 b!128451) bm!13891))

(assert (= (and b!128468 res!62023) b!128459))

(assert (= (and b!128459 c!23573) b!128467))

(assert (= (and b!128459 (not c!23573)) b!128455))

(assert (= (and b!128467 res!62020) b!128461))

(assert (= (or b!128467 b!128455) bm!13885))

(declare-fun b_lambda!5673 () Bool)

(assert (=> (not b_lambda!5673) (not b!128457)))

(assert (=> b!128457 t!6080))

(declare-fun b_and!7917 () Bool)

(assert (= b_and!7913 (and (=> t!6080 result!3889) b_and!7917)))

(assert (=> b!128457 t!6082))

(declare-fun b_and!7919 () Bool)

(assert (= b_and!7915 (and (=> t!6082 result!3891) b_and!7919)))

(declare-fun m!150203 () Bool)

(assert (=> bm!13891 m!150203))

(declare-fun m!150205 () Bool)

(assert (=> b!128463 m!150205))

(assert (=> b!128457 m!149617))

(declare-fun m!150207 () Bool)

(assert (=> b!128457 m!150207))

(assert (=> b!128457 m!149617))

(declare-fun m!150209 () Bool)

(assert (=> b!128457 m!150209))

(declare-fun m!150211 () Bool)

(assert (=> b!128457 m!150211))

(declare-fun m!150213 () Bool)

(assert (=> b!128457 m!150213))

(assert (=> b!128457 m!150207))

(assert (=> b!128457 m!150211))

(declare-fun m!150215 () Bool)

(assert (=> bm!13885 m!150215))

(assert (=> d!38847 m!149585))

(declare-fun m!150217 () Bool)

(assert (=> b!128470 m!150217))

(declare-fun m!150219 () Bool)

(assert (=> b!128470 m!150219))

(declare-fun m!150221 () Bool)

(assert (=> b!128470 m!150221))

(declare-fun m!150223 () Bool)

(assert (=> b!128470 m!150223))

(declare-fun m!150225 () Bool)

(assert (=> b!128470 m!150225))

(declare-fun m!150227 () Bool)

(assert (=> b!128470 m!150227))

(assert (=> b!128470 m!150217))

(declare-fun m!150229 () Bool)

(assert (=> b!128470 m!150229))

(declare-fun m!150231 () Bool)

(assert (=> b!128470 m!150231))

(declare-fun m!150233 () Bool)

(assert (=> b!128470 m!150233))

(assert (=> b!128470 m!150211))

(declare-fun m!150235 () Bool)

(assert (=> b!128470 m!150235))

(declare-fun m!150237 () Bool)

(assert (=> b!128470 m!150237))

(declare-fun m!150239 () Bool)

(assert (=> b!128470 m!150239))

(assert (=> b!128470 m!150235))

(assert (=> b!128470 m!150223))

(declare-fun m!150241 () Bool)

(assert (=> b!128470 m!150241))

(declare-fun m!150243 () Bool)

(assert (=> b!128470 m!150243))

(declare-fun m!150245 () Bool)

(assert (=> b!128470 m!150245))

(assert (=> b!128470 m!150243))

(declare-fun m!150247 () Bool)

(assert (=> b!128470 m!150247))

(assert (=> b!128465 m!150211))

(assert (=> b!128465 m!150211))

(declare-fun m!150249 () Bool)

(assert (=> b!128465 m!150249))

(declare-fun m!150251 () Bool)

(assert (=> bm!13888 m!150251))

(assert (=> b!128466 m!150211))

(assert (=> b!128466 m!150211))

(declare-fun m!150253 () Bool)

(assert (=> b!128466 m!150253))

(assert (=> b!128464 m!150211))

(assert (=> b!128464 m!150211))

(assert (=> b!128464 m!150253))

(declare-fun m!150255 () Bool)

(assert (=> b!128461 m!150255))

(declare-fun m!150257 () Bool)

(assert (=> b!128458 m!150257))

(assert (=> bm!13890 m!150245))

(assert (=> d!38791 d!38847))

(declare-fun b!128471 () Bool)

(declare-fun e!83866 () (_ BitVec 32))

(assert (=> b!128471 (= e!83866 #b00000000000000000000000000000000)))

(declare-fun b!128472 () Bool)

(declare-fun e!83865 () (_ BitVec 32))

(declare-fun call!13895 () (_ BitVec 32))

(assert (=> b!128472 (= e!83865 (bvadd #b00000000000000000000000000000001 call!13895))))

(declare-fun b!128473 () Bool)

(assert (=> b!128473 (= e!83866 e!83865)))

(declare-fun c!23576 () Bool)

(assert (=> b!128473 (= c!23576 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!38849 () Bool)

(declare-fun lt!66502 () (_ BitVec 32))

(assert (=> d!38849 (and (bvsge lt!66502 #b00000000000000000000000000000000) (bvsle lt!66502 (bvsub (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!38849 (= lt!66502 e!83866)))

(declare-fun c!23575 () Bool)

(assert (=> d!38849 (= c!23575 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38849 (and (bvsle #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2490 (_keys!4540 newMap!16)) (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(assert (=> d!38849 (= (arrayCountValidKeys!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) lt!66502)))

(declare-fun b!128474 () Bool)

(assert (=> b!128474 (= e!83865 call!13895)))

(declare-fun bm!13892 () Bool)

(assert (=> bm!13892 (= call!13895 (arrayCountValidKeys!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (= (and d!38849 c!23575) b!128471))

(assert (= (and d!38849 (not c!23575)) b!128473))

(assert (= (and b!128473 c!23576) b!128472))

(assert (= (and b!128473 (not c!23576)) b!128474))

(assert (= (or b!128472 b!128474) bm!13892))

(declare-fun m!150259 () Bool)

(assert (=> b!128473 m!150259))

(assert (=> b!128473 m!150259))

(declare-fun m!150261 () Bool)

(assert (=> b!128473 m!150261))

(declare-fun m!150263 () Bool)

(assert (=> bm!13892 m!150263))

(assert (=> d!38791 d!38849))

(declare-fun d!38851 () Bool)

(assert (=> d!38851 (arrayContainsKey!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!66505 () Unit!3980)

(declare-fun choose!13 (array!4701 (_ BitVec 64) (_ BitVec 32)) Unit!3980)

(assert (=> d!38851 (= lt!66505 (choose!13 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(assert (=> d!38851 (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000)))

(assert (=> d!38851 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))) lt!66505)))

(declare-fun bs!5312 () Bool)

(assert (= bs!5312 d!38851))

(assert (=> bs!5312 m!149345))

(assert (=> bs!5312 m!150041))

(assert (=> bs!5312 m!149345))

(declare-fun m!150265 () Bool)

(assert (=> bs!5312 m!150265))

(assert (=> d!38791 d!38851))

(declare-fun d!38853 () Bool)

(declare-fun res!62024 () Bool)

(declare-fun e!83869 () Bool)

(assert (=> d!38853 (=> res!62024 e!83869)))

(assert (=> d!38853 (= res!62024 (bvsge #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(assert (=> d!38853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (mask!7071 newMap!16)) e!83869)))

(declare-fun b!128475 () Bool)

(declare-fun e!83868 () Bool)

(declare-fun e!83867 () Bool)

(assert (=> b!128475 (= e!83868 e!83867)))

(declare-fun lt!66507 () (_ BitVec 64))

(assert (=> b!128475 (= lt!66507 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66508 () Unit!3980)

(assert (=> b!128475 (= lt!66508 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) lt!66507 #b00000000000000000000000000000000))))

(assert (=> b!128475 (arrayContainsKey!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) lt!66507 #b00000000000000000000000000000000)))

(declare-fun lt!66506 () Unit!3980)

(assert (=> b!128475 (= lt!66506 lt!66508)))

(declare-fun res!62025 () Bool)

(assert (=> b!128475 (= res!62025 (= (seekEntryOrOpen!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000) (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (mask!7071 newMap!16)) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!128475 (=> (not res!62025) (not e!83867))))

(declare-fun b!128476 () Bool)

(declare-fun call!13896 () Bool)

(assert (=> b!128476 (= e!83867 call!13896)))

(declare-fun bm!13893 () Bool)

(assert (=> bm!13893 (= call!13896 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (mask!7071 newMap!16)))))

(declare-fun b!128477 () Bool)

(assert (=> b!128477 (= e!83869 e!83868)))

(declare-fun c!23577 () Bool)

(assert (=> b!128477 (= c!23577 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128478 () Bool)

(assert (=> b!128478 (= e!83868 call!13896)))

(assert (= (and d!38853 (not res!62024)) b!128477))

(assert (= (and b!128477 c!23577) b!128475))

(assert (= (and b!128477 (not c!23577)) b!128478))

(assert (= (and b!128475 res!62025) b!128476))

(assert (= (or b!128476 b!128478) bm!13893))

(assert (=> b!128475 m!150259))

(declare-fun m!150267 () Bool)

(assert (=> b!128475 m!150267))

(declare-fun m!150269 () Bool)

(assert (=> b!128475 m!150269))

(assert (=> b!128475 m!150259))

(declare-fun m!150271 () Bool)

(assert (=> b!128475 m!150271))

(declare-fun m!150273 () Bool)

(assert (=> bm!13893 m!150273))

(assert (=> b!128477 m!150259))

(assert (=> b!128477 m!150259))

(assert (=> b!128477 m!150261))

(assert (=> d!38791 d!38853))

(declare-fun b!128479 () Bool)

(declare-fun e!83870 () Bool)

(declare-fun e!83873 () Bool)

(assert (=> b!128479 (= e!83870 e!83873)))

(declare-fun res!62027 () Bool)

(assert (=> b!128479 (=> (not res!62027) (not e!83873))))

(declare-fun e!83872 () Bool)

(assert (=> b!128479 (= res!62027 (not e!83872))))

(declare-fun res!62028 () Bool)

(assert (=> b!128479 (=> (not res!62028) (not e!83872))))

(assert (=> b!128479 (= res!62028 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) lt!66412)))))

(declare-fun b!128480 () Bool)

(declare-fun e!83871 () Bool)

(declare-fun call!13897 () Bool)

(assert (=> b!128480 (= e!83871 call!13897)))

(declare-fun b!128481 () Bool)

(assert (=> b!128481 (= e!83873 e!83871)))

(declare-fun c!23578 () Bool)

(assert (=> b!128481 (= c!23578 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) lt!66412)))))

(declare-fun b!128482 () Bool)

(assert (=> b!128482 (= e!83871 call!13897)))

(declare-fun b!128483 () Bool)

(assert (=> b!128483 (= e!83872 (contains!875 lt!66422 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) lt!66412)))))

(declare-fun bm!13894 () Bool)

(assert (=> bm!13894 (= call!13897 (arrayNoDuplicates!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (bvadd lt!66412 #b00000000000000000000000000000001) (ite c!23578 (Cons!1696 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) lt!66412) lt!66422) lt!66422)))))

(declare-fun d!38855 () Bool)

(declare-fun res!62026 () Bool)

(assert (=> d!38855 (=> res!62026 e!83870)))

(assert (=> d!38855 (= res!62026 (bvsge lt!66412 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(assert (=> d!38855 (= (arrayNoDuplicates!0 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) lt!66412 lt!66422) e!83870)))

(assert (= (and d!38855 (not res!62026)) b!128479))

(assert (= (and b!128479 res!62028) b!128483))

(assert (= (and b!128479 res!62027) b!128481))

(assert (= (and b!128481 c!23578) b!128480))

(assert (= (and b!128481 (not c!23578)) b!128482))

(assert (= (or b!128480 b!128482) bm!13894))

(declare-fun m!150275 () Bool)

(assert (=> b!128479 m!150275))

(assert (=> b!128479 m!150275))

(declare-fun m!150277 () Bool)

(assert (=> b!128479 m!150277))

(assert (=> b!128481 m!150275))

(assert (=> b!128481 m!150275))

(assert (=> b!128481 m!150277))

(assert (=> b!128483 m!150275))

(assert (=> b!128483 m!150275))

(declare-fun m!150279 () Bool)

(assert (=> b!128483 m!150279))

(assert (=> bm!13894 m!150275))

(declare-fun m!150281 () Bool)

(assert (=> bm!13894 m!150281))

(assert (=> d!38791 d!38855))

(declare-fun d!38857 () Bool)

(declare-fun e!83876 () Bool)

(assert (=> d!38857 e!83876))

(declare-fun res!62031 () Bool)

(assert (=> d!38857 (=> (not res!62031) (not e!83876))))

(assert (=> d!38857 (= res!62031 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 (_keys!4540 newMap!16)))))))

(declare-fun lt!66511 () Unit!3980)

(declare-fun choose!102 ((_ BitVec 64) array!4701 (_ BitVec 32) (_ BitVec 32)) Unit!3980)

(assert (=> d!38857 (= lt!66511 (choose!102 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (mask!7071 newMap!16)))))

(assert (=> d!38857 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38857 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (mask!7071 newMap!16)) lt!66511)))

(declare-fun b!128486 () Bool)

(assert (=> b!128486 (= e!83876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (mask!7071 newMap!16)))))

(assert (= (and d!38857 res!62031) b!128486))

(assert (=> d!38857 m!149345))

(declare-fun m!150283 () Bool)

(assert (=> d!38857 m!150283))

(assert (=> d!38857 m!149585))

(assert (=> b!128486 m!150039))

(assert (=> b!128486 m!150027))

(assert (=> d!38791 d!38857))

(declare-fun b!128487 () Bool)

(declare-fun e!83878 () (_ BitVec 32))

(assert (=> b!128487 (= e!83878 #b00000000000000000000000000000000)))

(declare-fun b!128488 () Bool)

(declare-fun e!83877 () (_ BitVec 32))

(declare-fun call!13898 () (_ BitVec 32))

(assert (=> b!128488 (= e!83877 (bvadd #b00000000000000000000000000000001 call!13898))))

(declare-fun b!128489 () Bool)

(assert (=> b!128489 (= e!83878 e!83877)))

(declare-fun c!23580 () Bool)

(assert (=> b!128489 (= c!23580 (validKeyInArray!0 (select (arr!2224 lt!66426) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(declare-fun lt!66512 () (_ BitVec 32))

(declare-fun d!38859 () Bool)

(assert (=> d!38859 (and (bvsge lt!66512 #b00000000000000000000000000000000) (bvsle lt!66512 (bvsub (size!2490 lt!66426) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(assert (=> d!38859 (= lt!66512 e!83878)))

(declare-fun c!23579 () Bool)

(assert (=> d!38859 (= c!23579 (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)))))

(assert (=> d!38859 (and (bvsle (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)) (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001) (size!2490 lt!66426)))))

(assert (=> d!38859 (= (arrayCountValidKeys!0 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)) lt!66512)))

(declare-fun b!128490 () Bool)

(assert (=> b!128490 (= e!83877 call!13898)))

(declare-fun bm!13895 () Bool)

(assert (=> bm!13895 (= call!13898 (arrayCountValidKeys!0 lt!66426 (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)))))

(assert (= (and d!38859 c!23579) b!128487))

(assert (= (and d!38859 (not c!23579)) b!128489))

(assert (= (and b!128489 c!23580) b!128488))

(assert (= (and b!128489 (not c!23580)) b!128490))

(assert (= (or b!128488 b!128490) bm!13895))

(declare-fun m!150285 () Bool)

(assert (=> b!128489 m!150285))

(assert (=> b!128489 m!150285))

(declare-fun m!150287 () Bool)

(assert (=> b!128489 m!150287))

(declare-fun m!150289 () Bool)

(assert (=> bm!13895 m!150289))

(assert (=> d!38791 d!38859))

(declare-fun d!38861 () Bool)

(assert (=> d!38861 (= (arrayCountValidKeys!0 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (bvadd (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!66515 () Unit!3980)

(declare-fun choose!2 (array!4701 (_ BitVec 32)) Unit!3980)

(assert (=> d!38861 (= lt!66515 (choose!2 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))))))

(declare-fun e!83881 () Bool)

(assert (=> d!38861 e!83881))

(declare-fun res!62036 () Bool)

(assert (=> d!38861 (=> (not res!62036) (not e!83881))))

(assert (=> d!38861 (= res!62036 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 lt!66426))))))

(assert (=> d!38861 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66426 (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141))) lt!66515)))

(declare-fun b!128495 () Bool)

(declare-fun res!62037 () Bool)

(assert (=> b!128495 (=> (not res!62037) (not e!83881))))

(assert (=> b!128495 (= res!62037 (validKeyInArray!0 (select (arr!2224 lt!66426) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)))))))

(declare-fun b!128496 () Bool)

(assert (=> b!128496 (= e!83881 (bvslt (size!2490 lt!66426) #b01111111111111111111111111111111))))

(assert (= (and d!38861 res!62036) b!128495))

(assert (= (and b!128495 res!62037) b!128496))

(assert (=> d!38861 m!150061))

(declare-fun m!150291 () Bool)

(assert (=> d!38861 m!150291))

(assert (=> b!128495 m!150285))

(assert (=> b!128495 m!150285))

(assert (=> b!128495 m!150287))

(assert (=> d!38791 d!38861))

(declare-fun d!38863 () Bool)

(declare-fun res!62038 () Bool)

(declare-fun e!83882 () Bool)

(assert (=> d!38863 (=> res!62038 e!83882)))

(assert (=> d!38863 (= res!62038 (= (select (arr!2224 lt!66432) #b00000000000000000000000000000000) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38863 (= (arrayContainsKey!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83882)))

(declare-fun b!128497 () Bool)

(declare-fun e!83883 () Bool)

(assert (=> b!128497 (= e!83882 e!83883)))

(declare-fun res!62039 () Bool)

(assert (=> b!128497 (=> (not res!62039) (not e!83883))))

(assert (=> b!128497 (= res!62039 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 lt!66432)))))

(declare-fun b!128498 () Bool)

(assert (=> b!128498 (= e!83883 (arrayContainsKey!0 lt!66432 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38863 (not res!62038)) b!128497))

(assert (= (and b!128497 res!62039) b!128498))

(declare-fun m!150293 () Bool)

(assert (=> d!38863 m!150293))

(assert (=> b!128498 m!149345))

(declare-fun m!150295 () Bool)

(assert (=> b!128498 m!150295))

(assert (=> d!38791 d!38863))

(declare-fun bm!13896 () Bool)

(declare-fun call!13902 () Bool)

(declare-fun lt!66521 () ListLongMap!1657)

(assert (=> bm!13896 (= call!13902 (contains!873 lt!66521 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13897 () Bool)

(declare-fun call!13903 () ListLongMap!1657)

(declare-fun call!13905 () ListLongMap!1657)

(assert (=> bm!13897 (= call!13903 call!13905)))

(declare-fun b!128499 () Bool)

(declare-fun e!83888 () Unit!3980)

(declare-fun Unit!4002 () Unit!3980)

(assert (=> b!128499 (= e!83888 Unit!4002)))

(declare-fun b!128500 () Bool)

(declare-fun e!83886 () Bool)

(declare-fun call!13904 () Bool)

(assert (=> b!128500 (= e!83886 (not call!13904))))

(declare-fun b!128501 () Bool)

(declare-fun e!83893 () Bool)

(assert (=> b!128501 (= e!83886 e!83893)))

(declare-fun res!62041 () Bool)

(assert (=> b!128501 (= res!62041 call!13904)))

(assert (=> b!128501 (=> (not res!62041) (not e!83893))))

(declare-fun b!128502 () Bool)

(declare-fun res!62040 () Bool)

(declare-fun e!83892 () Bool)

(assert (=> b!128502 (=> (not res!62040) (not e!83892))))

(declare-fun e!83885 () Bool)

(assert (=> b!128502 (= res!62040 e!83885)))

(declare-fun res!62047 () Bool)

(assert (=> b!128502 (=> res!62047 e!83885)))

(declare-fun e!83894 () Bool)

(assert (=> b!128502 (= res!62047 (not e!83894))))

(declare-fun res!62042 () Bool)

(assert (=> b!128502 (=> (not res!62042) (not e!83894))))

(assert (=> b!128502 (= res!62042 (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun b!128503 () Bool)

(declare-fun e!83896 () ListLongMap!1657)

(declare-fun e!83884 () ListLongMap!1657)

(assert (=> b!128503 (= e!83896 e!83884)))

(declare-fun c!23583 () Bool)

(assert (=> b!128503 (= c!23583 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128504 () Bool)

(declare-fun e!83889 () Bool)

(assert (=> b!128504 (= e!83889 (not call!13902))))

(declare-fun d!38865 () Bool)

(assert (=> d!38865 e!83892))

(declare-fun res!62046 () Bool)

(assert (=> d!38865 (=> (not res!62046) (not e!83892))))

(assert (=> d!38865 (= res!62046 (or (bvsge #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))))

(declare-fun lt!66518 () ListLongMap!1657)

(assert (=> d!38865 (= lt!66521 lt!66518)))

(declare-fun lt!66530 () Unit!3980)

(assert (=> d!38865 (= lt!66530 e!83888)))

(declare-fun c!23582 () Bool)

(declare-fun e!83887 () Bool)

(assert (=> d!38865 (= c!23582 e!83887)))

(declare-fun res!62044 () Bool)

(assert (=> d!38865 (=> (not res!62044) (not e!83887))))

(assert (=> d!38865 (= res!62044 (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(assert (=> d!38865 (= lt!66518 e!83896)))

(declare-fun c!23581 () Bool)

(assert (=> d!38865 (= c!23581 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38865 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38865 (= (getCurrentListMap!513 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66521)))

(declare-fun b!128505 () Bool)

(assert (=> b!128505 (= e!83884 call!13903)))

(declare-fun b!128506 () Bool)

(declare-fun e!83895 () Bool)

(assert (=> b!128506 (= e!83895 (= (apply!112 lt!66521 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))))))

(assert (=> b!128506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun b!128507 () Bool)

(assert (=> b!128507 (= e!83896 (+!159 call!13905 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!128508 () Bool)

(assert (=> b!128508 (= e!83892 e!83889)))

(declare-fun c!23585 () Bool)

(assert (=> b!128508 (= c!23585 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128509 () Bool)

(declare-fun e!83890 () ListLongMap!1657)

(assert (=> b!128509 (= e!83890 call!13903)))

(declare-fun bm!13898 () Bool)

(declare-fun call!13900 () ListLongMap!1657)

(declare-fun call!13901 () ListLongMap!1657)

(assert (=> bm!13898 (= call!13900 call!13901)))

(declare-fun bm!13899 () Bool)

(declare-fun call!13899 () ListLongMap!1657)

(assert (=> bm!13899 (= call!13905 (+!159 (ite c!23581 call!13901 (ite c!23583 call!13900 call!13899)) (ite (or c!23581 c!23583) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128510 () Bool)

(declare-fun e!83891 () Bool)

(assert (=> b!128510 (= e!83891 (= (apply!112 lt!66521 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128511 () Bool)

(assert (=> b!128511 (= e!83890 call!13899)))

(declare-fun b!128512 () Bool)

(assert (=> b!128512 (= e!83893 (= (apply!112 lt!66521 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128513 () Bool)

(assert (=> b!128513 (= e!83894 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13900 () Bool)

(assert (=> bm!13900 (= call!13899 call!13900)))

(declare-fun bm!13901 () Bool)

(assert (=> bm!13901 (= call!13901 (getCurrentListMapNoExtraKeys!124 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128514 () Bool)

(assert (=> b!128514 (= e!83885 e!83895)))

(declare-fun res!62043 () Bool)

(assert (=> b!128514 (=> (not res!62043) (not e!83895))))

(assert (=> b!128514 (= res!62043 (contains!873 lt!66521 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!128514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun bm!13902 () Bool)

(assert (=> bm!13902 (= call!13904 (contains!873 lt!66521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128515 () Bool)

(assert (=> b!128515 (= e!83887 (validKeyInArray!0 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128516 () Bool)

(assert (=> b!128516 (= e!83889 e!83891)))

(declare-fun res!62045 () Bool)

(assert (=> b!128516 (= res!62045 call!13902)))

(assert (=> b!128516 (=> (not res!62045) (not e!83891))))

(declare-fun b!128517 () Bool)

(declare-fun res!62048 () Bool)

(assert (=> b!128517 (=> (not res!62048) (not e!83892))))

(assert (=> b!128517 (= res!62048 e!83886)))

(declare-fun c!23586 () Bool)

(assert (=> b!128517 (= c!23586 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128518 () Bool)

(declare-fun c!23584 () Bool)

(assert (=> b!128518 (= c!23584 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128518 (= e!83884 e!83890)))

(declare-fun b!128519 () Bool)

(declare-fun lt!66526 () Unit!3980)

(assert (=> b!128519 (= e!83888 lt!66526)))

(declare-fun lt!66527 () ListLongMap!1657)

(assert (=> b!128519 (= lt!66527 (getCurrentListMapNoExtraKeys!124 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66525 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66532 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66532 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66522 () Unit!3980)

(assert (=> b!128519 (= lt!66522 (addStillContains!88 lt!66527 lt!66525 (zeroValue!2665 newMap!16) lt!66532))))

(assert (=> b!128519 (contains!873 (+!159 lt!66527 (tuple2!2561 lt!66525 (zeroValue!2665 newMap!16))) lt!66532)))

(declare-fun lt!66517 () Unit!3980)

(assert (=> b!128519 (= lt!66517 lt!66522)))

(declare-fun lt!66523 () ListLongMap!1657)

(assert (=> b!128519 (= lt!66523 (getCurrentListMapNoExtraKeys!124 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66519 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66529 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66529 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66537 () Unit!3980)

(assert (=> b!128519 (= lt!66537 (addApplyDifferent!88 lt!66523 lt!66519 (minValue!2665 newMap!16) lt!66529))))

(assert (=> b!128519 (= (apply!112 (+!159 lt!66523 (tuple2!2561 lt!66519 (minValue!2665 newMap!16))) lt!66529) (apply!112 lt!66523 lt!66529))))

(declare-fun lt!66533 () Unit!3980)

(assert (=> b!128519 (= lt!66533 lt!66537)))

(declare-fun lt!66536 () ListLongMap!1657)

(assert (=> b!128519 (= lt!66536 (getCurrentListMapNoExtraKeys!124 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66531 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66516 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66516 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66520 () Unit!3980)

(assert (=> b!128519 (= lt!66520 (addApplyDifferent!88 lt!66536 lt!66531 (zeroValue!2665 newMap!16) lt!66516))))

(assert (=> b!128519 (= (apply!112 (+!159 lt!66536 (tuple2!2561 lt!66531 (zeroValue!2665 newMap!16))) lt!66516) (apply!112 lt!66536 lt!66516))))

(declare-fun lt!66528 () Unit!3980)

(assert (=> b!128519 (= lt!66528 lt!66520)))

(declare-fun lt!66534 () ListLongMap!1657)

(assert (=> b!128519 (= lt!66534 (getCurrentListMapNoExtraKeys!124 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66535 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66535 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66524 () (_ BitVec 64))

(assert (=> b!128519 (= lt!66524 (select (arr!2224 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!128519 (= lt!66526 (addApplyDifferent!88 lt!66534 lt!66535 (minValue!2665 newMap!16) lt!66524))))

(assert (=> b!128519 (= (apply!112 (+!159 lt!66534 (tuple2!2561 lt!66535 (minValue!2665 newMap!16))) lt!66524) (apply!112 lt!66534 lt!66524))))

(assert (= (and d!38865 c!23581) b!128507))

(assert (= (and d!38865 (not c!23581)) b!128503))

(assert (= (and b!128503 c!23583) b!128505))

(assert (= (and b!128503 (not c!23583)) b!128518))

(assert (= (and b!128518 c!23584) b!128509))

(assert (= (and b!128518 (not c!23584)) b!128511))

(assert (= (or b!128509 b!128511) bm!13900))

(assert (= (or b!128505 bm!13900) bm!13898))

(assert (= (or b!128505 b!128509) bm!13897))

(assert (= (or b!128507 bm!13898) bm!13901))

(assert (= (or b!128507 bm!13897) bm!13899))

(assert (= (and d!38865 res!62044) b!128515))

(assert (= (and d!38865 c!23582) b!128519))

(assert (= (and d!38865 (not c!23582)) b!128499))

(assert (= (and d!38865 res!62046) b!128502))

(assert (= (and b!128502 res!62042) b!128513))

(assert (= (and b!128502 (not res!62047)) b!128514))

(assert (= (and b!128514 res!62043) b!128506))

(assert (= (and b!128502 res!62040) b!128517))

(assert (= (and b!128517 c!23586) b!128501))

(assert (= (and b!128517 (not c!23586)) b!128500))

(assert (= (and b!128501 res!62041) b!128512))

(assert (= (or b!128501 b!128500) bm!13902))

(assert (= (and b!128517 res!62048) b!128508))

(assert (= (and b!128508 c!23585) b!128516))

(assert (= (and b!128508 (not c!23585)) b!128504))

(assert (= (and b!128516 res!62045) b!128510))

(assert (= (or b!128516 b!128504) bm!13896))

(declare-fun b_lambda!5675 () Bool)

(assert (=> (not b_lambda!5675) (not b!128506)))

(assert (=> b!128506 t!6080))

(declare-fun b_and!7921 () Bool)

(assert (= b_and!7917 (and (=> t!6080 result!3889) b_and!7921)))

(assert (=> b!128506 t!6082))

(declare-fun b_and!7923 () Bool)

(assert (= b_and!7919 (and (=> t!6082 result!3891) b_and!7923)))

(declare-fun m!150297 () Bool)

(assert (=> bm!13902 m!150297))

(declare-fun m!150299 () Bool)

(assert (=> b!128512 m!150299))

(assert (=> b!128506 m!149617))

(declare-fun m!150301 () Bool)

(assert (=> b!128506 m!150301))

(assert (=> b!128506 m!149617))

(declare-fun m!150303 () Bool)

(assert (=> b!128506 m!150303))

(assert (=> b!128506 m!150259))

(declare-fun m!150305 () Bool)

(assert (=> b!128506 m!150305))

(assert (=> b!128506 m!150301))

(assert (=> b!128506 m!150259))

(declare-fun m!150307 () Bool)

(assert (=> bm!13896 m!150307))

(assert (=> d!38865 m!149585))

(declare-fun m!150309 () Bool)

(assert (=> b!128519 m!150309))

(declare-fun m!150311 () Bool)

(assert (=> b!128519 m!150311))

(declare-fun m!150313 () Bool)

(assert (=> b!128519 m!150313))

(declare-fun m!150315 () Bool)

(assert (=> b!128519 m!150315))

(declare-fun m!150317 () Bool)

(assert (=> b!128519 m!150317))

(declare-fun m!150319 () Bool)

(assert (=> b!128519 m!150319))

(assert (=> b!128519 m!150309))

(declare-fun m!150321 () Bool)

(assert (=> b!128519 m!150321))

(declare-fun m!150323 () Bool)

(assert (=> b!128519 m!150323))

(declare-fun m!150325 () Bool)

(assert (=> b!128519 m!150325))

(assert (=> b!128519 m!150259))

(declare-fun m!150327 () Bool)

(assert (=> b!128519 m!150327))

(declare-fun m!150329 () Bool)

(assert (=> b!128519 m!150329))

(declare-fun m!150331 () Bool)

(assert (=> b!128519 m!150331))

(assert (=> b!128519 m!150327))

(assert (=> b!128519 m!150315))

(declare-fun m!150333 () Bool)

(assert (=> b!128519 m!150333))

(declare-fun m!150335 () Bool)

(assert (=> b!128519 m!150335))

(declare-fun m!150337 () Bool)

(assert (=> b!128519 m!150337))

(assert (=> b!128519 m!150335))

(declare-fun m!150339 () Bool)

(assert (=> b!128519 m!150339))

(assert (=> b!128514 m!150259))

(assert (=> b!128514 m!150259))

(declare-fun m!150341 () Bool)

(assert (=> b!128514 m!150341))

(declare-fun m!150343 () Bool)

(assert (=> bm!13899 m!150343))

(assert (=> b!128515 m!150259))

(assert (=> b!128515 m!150259))

(assert (=> b!128515 m!150261))

(assert (=> b!128513 m!150259))

(assert (=> b!128513 m!150259))

(assert (=> b!128513 m!150261))

(declare-fun m!150345 () Bool)

(assert (=> b!128510 m!150345))

(declare-fun m!150347 () Bool)

(assert (=> b!128507 m!150347))

(assert (=> bm!13901 m!150337))

(assert (=> d!38791 d!38865))

(declare-fun d!38867 () Bool)

(declare-fun e!83899 () Bool)

(assert (=> d!38867 e!83899))

(declare-fun res!62051 () Bool)

(assert (=> d!38867 (=> (not res!62051) (not e!83899))))

(assert (=> d!38867 (= res!62051 (and (bvsge (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) #b00000000000000000000000000000000) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2490 (_keys!4540 newMap!16))) (bvslt (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (size!2491 (_values!2787 newMap!16)))))))

(declare-fun lt!66540 () Unit!3980)

(declare-fun choose!789 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3980)

(assert (=> d!38867 (= lt!66540 (choose!789 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38867 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38867 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66540)))

(declare-fun b!128522 () Bool)

(assert (=> b!128522 (= e!83899 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (array!4702 (store (arr!2224 (_keys!4540 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (size!2490 (_keys!4540 newMap!16))) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (ite c!23474 (index!3255 lt!66141) (index!3252 lt!66141)) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))))

(assert (= (and d!38867 res!62051) b!128522))

(assert (=> d!38867 m!149345))

(assert (=> d!38867 m!149343))

(declare-fun m!150349 () Bool)

(assert (=> d!38867 m!150349))

(assert (=> d!38867 m!149585))

(assert (=> b!128522 m!149437))

(assert (=> b!128522 m!150039))

(assert (=> b!128522 m!150055))

(assert (=> b!128522 m!149437))

(assert (=> b!128522 m!149601))

(assert (=> b!128522 m!150033))

(assert (=> d!38791 d!38867))

(assert (=> d!38791 d!38801))

(declare-fun d!38869 () Bool)

(declare-fun lt!66543 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!127 (List!1698) (InoxSet tuple2!2560))

(assert (=> d!38869 (= lt!66543 (select (content!127 (toList!844 lt!66324)) (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun e!83904 () Bool)

(assert (=> d!38869 (= lt!66543 e!83904)))

(declare-fun res!62056 () Bool)

(assert (=> d!38869 (=> (not res!62056) (not e!83904))))

(assert (=> d!38869 (= res!62056 ((_ is Cons!1694) (toList!844 lt!66324)))))

(assert (=> d!38869 (= (contains!874 (toList!844 lt!66324) (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66543)))

(declare-fun b!128527 () Bool)

(declare-fun e!83905 () Bool)

(assert (=> b!128527 (= e!83904 e!83905)))

(declare-fun res!62057 () Bool)

(assert (=> b!128527 (=> res!62057 e!83905)))

(assert (=> b!128527 (= res!62057 (= (h!2297 (toList!844 lt!66324)) (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128528 () Bool)

(assert (=> b!128528 (= e!83905 (contains!874 (t!6068 (toList!844 lt!66324)) (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38869 res!62056) b!128527))

(assert (= (and b!128527 (not res!62057)) b!128528))

(declare-fun m!150351 () Bool)

(assert (=> d!38869 m!150351))

(declare-fun m!150353 () Bool)

(assert (=> d!38869 m!150353))

(declare-fun m!150355 () Bool)

(assert (=> b!128528 m!150355))

(assert (=> b!128279 d!38869))

(declare-fun d!38871 () Bool)

(assert (=> d!38871 (= (apply!112 lt!66227 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5313 () Bool)

(assert (= bs!5313 d!38871))

(declare-fun m!150357 () Bool)

(assert (=> bs!5313 m!150357))

(assert (=> bs!5313 m!150357))

(declare-fun m!150359 () Bool)

(assert (=> bs!5313 m!150359))

(assert (=> b!128147 d!38871))

(declare-fun d!38873 () Bool)

(assert (=> d!38873 (= (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66053)) (v!3143 (getValueByKey!166 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66053)))))

(assert (=> d!38769 d!38873))

(declare-fun e!83906 () Option!172)

(declare-fun b!128529 () Bool)

(assert (=> b!128529 (= e!83906 (Some!171 (_2!1291 (h!2297 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(declare-fun b!128532 () Bool)

(declare-fun e!83907 () Option!172)

(assert (=> b!128532 (= e!83907 None!170)))

(declare-fun b!128531 () Bool)

(assert (=> b!128531 (= e!83907 (getValueByKey!166 (t!6068 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66053))))

(declare-fun d!38875 () Bool)

(declare-fun c!23587 () Bool)

(assert (=> d!38875 (= c!23587 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66053)))))

(assert (=> d!38875 (= (getValueByKey!166 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66053) e!83906)))

(declare-fun b!128530 () Bool)

(assert (=> b!128530 (= e!83906 e!83907)))

(declare-fun c!23588 () Bool)

(assert (=> b!128530 (= c!23588 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (not (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66053))))))

(assert (= (and d!38875 c!23587) b!128529))

(assert (= (and d!38875 (not c!23587)) b!128530))

(assert (= (and b!128530 c!23588) b!128531))

(assert (= (and b!128530 (not c!23588)) b!128532))

(declare-fun m!150361 () Bool)

(assert (=> b!128531 m!150361))

(assert (=> d!38769 d!38875))

(declare-fun b!128533 () Bool)

(declare-fun e!83909 () Bool)

(declare-fun e!83908 () Bool)

(assert (=> b!128533 (= e!83909 e!83908)))

(assert (=> b!128533 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun lt!66549 () ListLongMap!1657)

(declare-fun res!62061 () Bool)

(assert (=> b!128533 (= res!62061 (contains!873 lt!66549 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128533 (=> (not res!62061) (not e!83908))))

(declare-fun b!128534 () Bool)

(declare-fun e!83912 () Bool)

(assert (=> b!128534 (= e!83912 e!83909)))

(declare-fun c!23590 () Bool)

(declare-fun e!83910 () Bool)

(assert (=> b!128534 (= c!23590 e!83910)))

(declare-fun res!62058 () Bool)

(assert (=> b!128534 (=> (not res!62058) (not e!83910))))

(assert (=> b!128534 (= res!62058 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128535 () Bool)

(declare-fun e!83911 () Bool)

(assert (=> b!128535 (= e!83909 e!83911)))

(declare-fun c!23592 () Bool)

(assert (=> b!128535 (= c!23592 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun bm!13903 () Bool)

(declare-fun call!13906 () ListLongMap!1657)

(assert (=> bm!13903 (= call!13906 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128536 () Bool)

(assert (=> b!128536 (= e!83910 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128536 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!128537 () Bool)

(declare-fun e!83914 () ListLongMap!1657)

(assert (=> b!128537 (= e!83914 (ListLongMap!1658 Nil!1695))))

(declare-fun d!38877 () Bool)

(assert (=> d!38877 e!83912))

(declare-fun res!62060 () Bool)

(assert (=> d!38877 (=> (not res!62060) (not e!83912))))

(assert (=> d!38877 (= res!62060 (not (contains!873 lt!66549 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38877 (= lt!66549 e!83914)))

(declare-fun c!23589 () Bool)

(assert (=> d!38877 (= c!23589 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38877 (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992))))))

(assert (=> d!38877 (= (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992)))) lt!66549)))

(declare-fun b!128538 () Bool)

(assert (=> b!128538 (= e!83911 (= lt!66549 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (_values!2787 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992))) (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) (minValue!2665 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128539 () Bool)

(declare-fun e!83913 () ListLongMap!1657)

(assert (=> b!128539 (= e!83914 e!83913)))

(declare-fun c!23591 () Bool)

(assert (=> b!128539 (= c!23591 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!128540 () Bool)

(assert (=> b!128540 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> b!128540 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> b!128540 (= e!83908 (= (apply!112 lt!66549 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128541 () Bool)

(assert (=> b!128541 (= e!83913 call!13906)))

(declare-fun b!128542 () Bool)

(declare-fun lt!66547 () Unit!3980)

(declare-fun lt!66544 () Unit!3980)

(assert (=> b!128542 (= lt!66547 lt!66544)))

(declare-fun lt!66546 () (_ BitVec 64))

(declare-fun lt!66545 () ListLongMap!1657)

(declare-fun lt!66548 () (_ BitVec 64))

(declare-fun lt!66550 () V!3449)

(assert (=> b!128542 (not (contains!873 (+!159 lt!66545 (tuple2!2561 lt!66548 lt!66550)) lt!66546))))

(assert (=> b!128542 (= lt!66544 (addStillNotContains!58 lt!66545 lt!66548 lt!66550 lt!66546))))

(assert (=> b!128542 (= lt!66546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128542 (= lt!66550 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128542 (= lt!66548 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!128542 (= lt!66545 call!13906)))

(assert (=> b!128542 (= e!83913 (+!159 call!13906 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128543 () Bool)

(declare-fun res!62059 () Bool)

(assert (=> b!128543 (=> (not res!62059) (not e!83912))))

(assert (=> b!128543 (= res!62059 (not (contains!873 lt!66549 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128544 () Bool)

(assert (=> b!128544 (= e!83911 (isEmpty!403 lt!66549))))

(assert (= (and d!38877 c!23589) b!128537))

(assert (= (and d!38877 (not c!23589)) b!128539))

(assert (= (and b!128539 c!23591) b!128542))

(assert (= (and b!128539 (not c!23591)) b!128541))

(assert (= (or b!128542 b!128541) bm!13903))

(assert (= (and d!38877 res!62060) b!128543))

(assert (= (and b!128543 res!62059) b!128534))

(assert (= (and b!128534 res!62058) b!128536))

(assert (= (and b!128534 c!23590) b!128533))

(assert (= (and b!128534 (not c!23590)) b!128535))

(assert (= (and b!128533 res!62061) b!128540))

(assert (= (and b!128535 c!23592) b!128538))

(assert (= (and b!128535 (not c!23592)) b!128544))

(declare-fun b_lambda!5677 () Bool)

(assert (=> (not b_lambda!5677) (not b!128540)))

(assert (=> b!128540 t!6065))

(declare-fun b_and!7925 () Bool)

(assert (= b_and!7921 (and (=> t!6065 result!3869) b_and!7925)))

(assert (=> b!128540 t!6067))

(declare-fun b_and!7927 () Bool)

(assert (= b_and!7923 (and (=> t!6067 result!3873) b_and!7927)))

(declare-fun b_lambda!5679 () Bool)

(assert (=> (not b_lambda!5679) (not b!128542)))

(assert (=> b!128542 t!6065))

(declare-fun b_and!7929 () Bool)

(assert (= b_and!7925 (and (=> t!6065 result!3869) b_and!7929)))

(assert (=> b!128542 t!6067))

(declare-fun b_and!7931 () Bool)

(assert (= b_and!7927 (and (=> t!6067 result!3873) b_and!7931)))

(declare-fun m!150363 () Bool)

(assert (=> b!128543 m!150363))

(declare-fun m!150365 () Bool)

(assert (=> b!128539 m!150365))

(assert (=> b!128539 m!150365))

(declare-fun m!150367 () Bool)

(assert (=> b!128539 m!150367))

(declare-fun m!150369 () Bool)

(assert (=> b!128542 m!150369))

(declare-fun m!150371 () Bool)

(assert (=> b!128542 m!150371))

(assert (=> b!128542 m!149341))

(declare-fun m!150373 () Bool)

(assert (=> b!128542 m!150373))

(declare-fun m!150375 () Bool)

(assert (=> b!128542 m!150375))

(declare-fun m!150377 () Bool)

(assert (=> b!128542 m!150377))

(assert (=> b!128542 m!149341))

(declare-fun m!150379 () Bool)

(assert (=> b!128542 m!150379))

(assert (=> b!128542 m!150365))

(assert (=> b!128542 m!150371))

(assert (=> b!128542 m!150375))

(assert (=> b!128536 m!150365))

(assert (=> b!128536 m!150365))

(assert (=> b!128536 m!150367))

(declare-fun m!150381 () Bool)

(assert (=> b!128544 m!150381))

(assert (=> b!128533 m!150365))

(assert (=> b!128533 m!150365))

(declare-fun m!150383 () Bool)

(assert (=> b!128533 m!150383))

(declare-fun m!150385 () Bool)

(assert (=> d!38877 m!150385))

(assert (=> d!38877 m!149337))

(declare-fun m!150387 () Bool)

(assert (=> bm!13903 m!150387))

(assert (=> b!128540 m!150371))

(assert (=> b!128540 m!150371))

(assert (=> b!128540 m!149341))

(assert (=> b!128540 m!150373))

(assert (=> b!128540 m!149341))

(assert (=> b!128540 m!150365))

(declare-fun m!150389 () Bool)

(assert (=> b!128540 m!150389))

(assert (=> b!128540 m!150365))

(assert (=> b!128538 m!150387))

(assert (=> bm!13865 d!38877))

(declare-fun d!38879 () Bool)

(assert (=> d!38879 (= (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128220 d!38879))

(declare-fun d!38881 () Bool)

(assert (=> d!38881 (= (get!1456 (getValueByKey!166 (toList!844 lt!66052) lt!66058)) (v!3143 (getValueByKey!166 (toList!844 lt!66052) lt!66058)))))

(assert (=> d!38755 d!38881))

(declare-fun b!128545 () Bool)

(declare-fun e!83915 () Option!172)

(assert (=> b!128545 (= e!83915 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66052)))))))

(declare-fun b!128548 () Bool)

(declare-fun e!83916 () Option!172)

(assert (=> b!128548 (= e!83916 None!170)))

(declare-fun b!128547 () Bool)

(assert (=> b!128547 (= e!83916 (getValueByKey!166 (t!6068 (toList!844 lt!66052)) lt!66058))))

(declare-fun d!38883 () Bool)

(declare-fun c!23593 () Bool)

(assert (=> d!38883 (= c!23593 (and ((_ is Cons!1694) (toList!844 lt!66052)) (= (_1!1291 (h!2297 (toList!844 lt!66052))) lt!66058)))))

(assert (=> d!38883 (= (getValueByKey!166 (toList!844 lt!66052) lt!66058) e!83915)))

(declare-fun b!128546 () Bool)

(assert (=> b!128546 (= e!83915 e!83916)))

(declare-fun c!23594 () Bool)

(assert (=> b!128546 (= c!23594 (and ((_ is Cons!1694) (toList!844 lt!66052)) (not (= (_1!1291 (h!2297 (toList!844 lt!66052))) lt!66058))))))

(assert (= (and d!38883 c!23593) b!128545))

(assert (= (and d!38883 (not c!23593)) b!128546))

(assert (= (and b!128546 c!23594) b!128547))

(assert (= (and b!128546 (not c!23594)) b!128548))

(declare-fun m!150391 () Bool)

(assert (=> b!128547 m!150391))

(assert (=> d!38755 d!38883))

(declare-fun d!38885 () Bool)

(declare-fun res!62062 () Bool)

(declare-fun e!83919 () Bool)

(assert (=> d!38885 (=> res!62062 e!83919)))

(assert (=> d!38885 (= res!62062 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992)))) e!83919)))

(declare-fun b!128549 () Bool)

(declare-fun e!83918 () Bool)

(declare-fun e!83917 () Bool)

(assert (=> b!128549 (= e!83918 e!83917)))

(declare-fun lt!66552 () (_ BitVec 64))

(assert (=> b!128549 (= lt!66552 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!66553 () Unit!3980)

(assert (=> b!128549 (= lt!66553 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) lt!66552 #b00000000000000000000000000000000))))

(assert (=> b!128549 (arrayContainsKey!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) lt!66552 #b00000000000000000000000000000000)))

(declare-fun lt!66551 () Unit!3980)

(assert (=> b!128549 (= lt!66551 lt!66553)))

(declare-fun res!62063 () Bool)

(assert (=> b!128549 (= res!62063 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000) (_keys!4540 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992)))) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!128549 (=> (not res!62063) (not e!83917))))

(declare-fun b!128550 () Bool)

(declare-fun call!13907 () Bool)

(assert (=> b!128550 (= e!83917 call!13907)))

(declare-fun bm!13904 () Bool)

(assert (=> bm!13904 (= call!13907 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4540 (v!3138 (underlying!440 thiss!992))) (mask!7071 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128551 () Bool)

(assert (=> b!128551 (= e!83919 e!83918)))

(declare-fun c!23595 () Bool)

(assert (=> b!128551 (= c!23595 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!128552 () Bool)

(assert (=> b!128552 (= e!83918 call!13907)))

(assert (= (and d!38885 (not res!62062)) b!128551))

(assert (= (and b!128551 c!23595) b!128549))

(assert (= (and b!128551 (not c!23595)) b!128552))

(assert (= (and b!128549 res!62063) b!128550))

(assert (= (or b!128550 b!128552) bm!13904))

(declare-fun m!150393 () Bool)

(assert (=> b!128549 m!150393))

(declare-fun m!150395 () Bool)

(assert (=> b!128549 m!150395))

(declare-fun m!150397 () Bool)

(assert (=> b!128549 m!150397))

(assert (=> b!128549 m!150393))

(declare-fun m!150399 () Bool)

(assert (=> b!128549 m!150399))

(declare-fun m!150401 () Bool)

(assert (=> bm!13904 m!150401))

(assert (=> b!128551 m!150393))

(assert (=> b!128551 m!150393))

(declare-fun m!150403 () Bool)

(assert (=> b!128551 m!150403))

(assert (=> b!128227 d!38885))

(declare-fun lt!66554 () Bool)

(declare-fun d!38887 () Bool)

(assert (=> d!38887 (= lt!66554 (select (content!127 (toList!844 lt!66316)) (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun e!83920 () Bool)

(assert (=> d!38887 (= lt!66554 e!83920)))

(declare-fun res!62064 () Bool)

(assert (=> d!38887 (=> (not res!62064) (not e!83920))))

(assert (=> d!38887 (= res!62064 ((_ is Cons!1694) (toList!844 lt!66316)))))

(assert (=> d!38887 (= (contains!874 (toList!844 lt!66316) (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66554)))

(declare-fun b!128553 () Bool)

(declare-fun e!83921 () Bool)

(assert (=> b!128553 (= e!83920 e!83921)))

(declare-fun res!62065 () Bool)

(assert (=> b!128553 (=> res!62065 e!83921)))

(assert (=> b!128553 (= res!62065 (= (h!2297 (toList!844 lt!66316)) (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128554 () Bool)

(assert (=> b!128554 (= e!83921 (contains!874 (t!6068 (toList!844 lt!66316)) (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38887 res!62064) b!128553))

(assert (= (and b!128553 (not res!62065)) b!128554))

(declare-fun m!150405 () Bool)

(assert (=> d!38887 m!150405))

(declare-fun m!150407 () Bool)

(assert (=> d!38887 m!150407))

(declare-fun m!150409 () Bool)

(assert (=> b!128554 m!150409))

(assert (=> b!128275 d!38887))

(declare-fun d!38889 () Bool)

(assert (=> d!38889 (arrayContainsKey!0 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000)))

(declare-fun lt!66555 () Unit!3980)

(assert (=> d!38889 (= lt!66555 (choose!13 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000))))

(assert (=> d!38889 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!38889 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000) lt!66555)))

(declare-fun bs!5314 () Bool)

(assert (= bs!5314 d!38889))

(assert (=> bs!5314 m!150107))

(declare-fun m!150411 () Bool)

(assert (=> bs!5314 m!150411))

(assert (=> b!128397 d!38889))

(declare-fun d!38891 () Bool)

(declare-fun res!62066 () Bool)

(declare-fun e!83922 () Bool)

(assert (=> d!38891 (=> res!62066 e!83922)))

(assert (=> d!38891 (= res!62066 (= (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) lt!66459))))

(assert (=> d!38891 (= (arrayContainsKey!0 (_keys!4540 newMap!16) lt!66459 #b00000000000000000000000000000000) e!83922)))

(declare-fun b!128555 () Bool)

(declare-fun e!83923 () Bool)

(assert (=> b!128555 (= e!83922 e!83923)))

(declare-fun res!62067 () Bool)

(assert (=> b!128555 (=> (not res!62067) (not e!83923))))

(assert (=> b!128555 (= res!62067 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128556 () Bool)

(assert (=> b!128556 (= e!83923 (arrayContainsKey!0 (_keys!4540 newMap!16) lt!66459 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38891 (not res!62066)) b!128555))

(assert (= (and b!128555 res!62067) b!128556))

(assert (=> d!38891 m!149575))

(declare-fun m!150413 () Bool)

(assert (=> b!128556 m!150413))

(assert (=> b!128397 d!38891))

(declare-fun d!38893 () Bool)

(declare-fun lt!66557 () SeekEntryResult!274)

(assert (=> d!38893 (and (or ((_ is Undefined!274) lt!66557) (not ((_ is Found!274) lt!66557)) (and (bvsge (index!3253 lt!66557) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66557) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66557) ((_ is Found!274) lt!66557) (not ((_ is MissingZero!274) lt!66557)) (and (bvsge (index!3252 lt!66557) #b00000000000000000000000000000000) (bvslt (index!3252 lt!66557) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66557) ((_ is Found!274) lt!66557) ((_ is MissingZero!274) lt!66557) (not ((_ is MissingVacant!274) lt!66557)) (and (bvsge (index!3255 lt!66557) #b00000000000000000000000000000000) (bvslt (index!3255 lt!66557) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66557) (ite ((_ is Found!274) lt!66557) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66557)) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!274) lt!66557) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!274) lt!66557) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83926 () SeekEntryResult!274)

(assert (=> d!38893 (= lt!66557 e!83926)))

(declare-fun c!23597 () Bool)

(declare-fun lt!66558 () SeekEntryResult!274)

(assert (=> d!38893 (= c!23597 (and ((_ is Intermediate!274) lt!66558) (undefined!1086 lt!66558)))))

(assert (=> d!38893 (= lt!66558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (mask!7071 newMap!16)) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (=> d!38893 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38893 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (_keys!4540 newMap!16) (mask!7071 newMap!16)) lt!66557)))

(declare-fun b!128557 () Bool)

(assert (=> b!128557 (= e!83926 Undefined!274)))

(declare-fun b!128558 () Bool)

(declare-fun e!83925 () SeekEntryResult!274)

(assert (=> b!128558 (= e!83925 (Found!274 (index!3254 lt!66558)))))

(declare-fun b!128559 () Bool)

(declare-fun e!83924 () SeekEntryResult!274)

(assert (=> b!128559 (= e!83924 (seekKeyOrZeroReturnVacant!0 (x!15124 lt!66558) (index!3254 lt!66558) (index!3254 lt!66558) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!128560 () Bool)

(declare-fun c!23598 () Bool)

(declare-fun lt!66556 () (_ BitVec 64))

(assert (=> b!128560 (= c!23598 (= lt!66556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128560 (= e!83925 e!83924)))

(declare-fun b!128561 () Bool)

(assert (=> b!128561 (= e!83924 (MissingZero!274 (index!3254 lt!66558)))))

(declare-fun b!128562 () Bool)

(assert (=> b!128562 (= e!83926 e!83925)))

(assert (=> b!128562 (= lt!66556 (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66558)))))

(declare-fun c!23596 () Bool)

(assert (=> b!128562 (= c!23596 (= lt!66556 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38893 c!23597) b!128557))

(assert (= (and d!38893 (not c!23597)) b!128562))

(assert (= (and b!128562 c!23596) b!128558))

(assert (= (and b!128562 (not c!23596)) b!128560))

(assert (= (and b!128560 c!23598) b!128561))

(assert (= (and b!128560 (not c!23598)) b!128559))

(assert (=> d!38893 m!149585))

(declare-fun m!150415 () Bool)

(assert (=> d!38893 m!150415))

(assert (=> d!38893 m!149575))

(declare-fun m!150417 () Bool)

(assert (=> d!38893 m!150417))

(declare-fun m!150419 () Bool)

(assert (=> d!38893 m!150419))

(assert (=> d!38893 m!150417))

(assert (=> d!38893 m!149575))

(declare-fun m!150421 () Bool)

(assert (=> d!38893 m!150421))

(declare-fun m!150423 () Bool)

(assert (=> d!38893 m!150423))

(assert (=> b!128559 m!149575))

(declare-fun m!150425 () Bool)

(assert (=> b!128559 m!150425))

(declare-fun m!150427 () Bool)

(assert (=> b!128562 m!150427))

(assert (=> b!128397 d!38893))

(declare-fun d!38895 () Bool)

(assert (=> d!38895 (= (validMask!0 (mask!7071 newMap!16)) (and (or (= (mask!7071 newMap!16) #b00000000000000000000000000000111) (= (mask!7071 newMap!16) #b00000000000000000000000000001111) (= (mask!7071 newMap!16) #b00000000000000000000000000011111) (= (mask!7071 newMap!16) #b00000000000000000000000000111111) (= (mask!7071 newMap!16) #b00000000000000000000000001111111) (= (mask!7071 newMap!16) #b00000000000000000000000011111111) (= (mask!7071 newMap!16) #b00000000000000000000000111111111) (= (mask!7071 newMap!16) #b00000000000000000000001111111111) (= (mask!7071 newMap!16) #b00000000000000000000011111111111) (= (mask!7071 newMap!16) #b00000000000000000000111111111111) (= (mask!7071 newMap!16) #b00000000000000000001111111111111) (= (mask!7071 newMap!16) #b00000000000000000011111111111111) (= (mask!7071 newMap!16) #b00000000000000000111111111111111) (= (mask!7071 newMap!16) #b00000000000000001111111111111111) (= (mask!7071 newMap!16) #b00000000000000011111111111111111) (= (mask!7071 newMap!16) #b00000000000000111111111111111111) (= (mask!7071 newMap!16) #b00000000000001111111111111111111) (= (mask!7071 newMap!16) #b00000000000011111111111111111111) (= (mask!7071 newMap!16) #b00000000000111111111111111111111) (= (mask!7071 newMap!16) #b00000000001111111111111111111111) (= (mask!7071 newMap!16) #b00000000011111111111111111111111) (= (mask!7071 newMap!16) #b00000000111111111111111111111111) (= (mask!7071 newMap!16) #b00000001111111111111111111111111) (= (mask!7071 newMap!16) #b00000011111111111111111111111111) (= (mask!7071 newMap!16) #b00000111111111111111111111111111) (= (mask!7071 newMap!16) #b00001111111111111111111111111111) (= (mask!7071 newMap!16) #b00011111111111111111111111111111) (= (mask!7071 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7071 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38707 d!38895))

(declare-fun d!38897 () Bool)

(declare-fun res!62068 () Bool)

(declare-fun e!83927 () Bool)

(assert (=> d!38897 (=> res!62068 e!83927)))

(assert (=> d!38897 (= res!62068 (and ((_ is Cons!1694) (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (= (_1!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38897 (= (containsKey!170 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!83927)))

(declare-fun b!128563 () Bool)

(declare-fun e!83928 () Bool)

(assert (=> b!128563 (= e!83927 e!83928)))

(declare-fun res!62069 () Bool)

(assert (=> b!128563 (=> (not res!62069) (not e!83928))))

(assert (=> b!128563 (= res!62069 (and (or (not ((_ is Cons!1694) (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (bvsle (_1!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (bvslt (_1!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(declare-fun b!128564 () Bool)

(assert (=> b!128564 (= e!83928 (containsKey!170 (t!6068 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38897 (not res!62068)) b!128563))

(assert (= (and b!128563 res!62069) b!128564))

(assert (=> b!128564 m!149345))

(declare-fun m!150429 () Bool)

(assert (=> b!128564 m!150429))

(assert (=> d!38705 d!38897))

(declare-fun d!38899 () Bool)

(declare-fun e!83930 () Bool)

(assert (=> d!38899 e!83930))

(declare-fun res!62070 () Bool)

(assert (=> d!38899 (=> res!62070 e!83930)))

(declare-fun lt!66561 () Bool)

(assert (=> d!38899 (= res!62070 (not lt!66561))))

(declare-fun lt!66562 () Bool)

(assert (=> d!38899 (= lt!66561 lt!66562)))

(declare-fun lt!66560 () Unit!3980)

(declare-fun e!83929 () Unit!3980)

(assert (=> d!38899 (= lt!66560 e!83929)))

(declare-fun c!23599 () Bool)

(assert (=> d!38899 (= c!23599 lt!66562)))

(assert (=> d!38899 (= lt!66562 (containsKey!170 (toList!844 lt!66227) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38899 (= (contains!873 lt!66227 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66561)))

(declare-fun b!128565 () Bool)

(declare-fun lt!66559 () Unit!3980)

(assert (=> b!128565 (= e!83929 lt!66559)))

(assert (=> b!128565 (= lt!66559 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66227) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128565 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128566 () Bool)

(declare-fun Unit!4003 () Unit!3980)

(assert (=> b!128566 (= e!83929 Unit!4003)))

(declare-fun b!128567 () Bool)

(assert (=> b!128567 (= e!83930 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38899 c!23599) b!128565))

(assert (= (and d!38899 (not c!23599)) b!128566))

(assert (= (and d!38899 (not res!62070)) b!128567))

(declare-fun m!150431 () Bool)

(assert (=> d!38899 m!150431))

(declare-fun m!150433 () Bool)

(assert (=> b!128565 m!150433))

(assert (=> b!128565 m!150357))

(assert (=> b!128565 m!150357))

(declare-fun m!150435 () Bool)

(assert (=> b!128565 m!150435))

(assert (=> b!128567 m!150357))

(assert (=> b!128567 m!150357))

(assert (=> b!128567 m!150435))

(assert (=> bm!13846 d!38899))

(declare-fun d!38901 () Bool)

(assert (=> d!38901 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))

(assert (=> d!38901 true))

(declare-fun _$16!145 () Unit!3980)

(assert (=> d!38901 (= (choose!781 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (defaultEntry!2804 newMap!16)) _$16!145)))

(declare-fun bs!5315 () Bool)

(assert (= bs!5315 d!38901))

(assert (=> bs!5315 m!149595))

(assert (=> bs!5315 m!149559))

(assert (=> bs!5315 m!149595))

(assert (=> bs!5315 m!149559))

(assert (=> bs!5315 m!149597))

(assert (=> d!38701 d!38901))

(assert (=> d!38701 d!38895))

(declare-fun d!38903 () Bool)

(assert (=> d!38903 (= (apply!112 lt!66303 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1456 (getValueByKey!166 (toList!844 lt!66303) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5316 () Bool)

(assert (= bs!5316 d!38903))

(assert (=> bs!5316 m!149447))

(declare-fun m!150437 () Bool)

(assert (=> bs!5316 m!150437))

(assert (=> bs!5316 m!150437))

(declare-fun m!150439 () Bool)

(assert (=> bs!5316 m!150439))

(assert (=> b!128262 d!38903))

(assert (=> b!128262 d!38717))

(declare-fun d!38905 () Bool)

(declare-fun res!62071 () Bool)

(declare-fun e!83931 () Bool)

(assert (=> d!38905 (=> res!62071 e!83931)))

(assert (=> d!38905 (= res!62071 (= (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38905 (= (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!83931)))

(declare-fun b!128568 () Bool)

(declare-fun e!83932 () Bool)

(assert (=> b!128568 (= e!83931 e!83932)))

(declare-fun res!62072 () Bool)

(assert (=> b!128568 (=> (not res!62072) (not e!83932))))

(assert (=> b!128568 (= res!62072 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128569 () Bool)

(assert (=> b!128569 (= e!83932 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!38905 (not res!62071)) b!128568))

(assert (= (and b!128568 res!62072) b!128569))

(declare-fun m!150441 () Bool)

(assert (=> d!38905 m!150441))

(assert (=> b!128569 m!149345))

(declare-fun m!150443 () Bool)

(assert (=> b!128569 m!150443))

(assert (=> b!128068 d!38905))

(declare-fun d!38907 () Bool)

(assert (=> d!38907 (= (apply!112 lt!66181 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!166 (toList!844 lt!66181) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5317 () Bool)

(assert (= bs!5317 d!38907))

(assert (=> bs!5317 m!149575))

(declare-fun m!150445 () Bool)

(assert (=> bs!5317 m!150445))

(assert (=> bs!5317 m!150445))

(declare-fun m!150447 () Bool)

(assert (=> bs!5317 m!150447))

(assert (=> b!128091 d!38907))

(declare-fun d!38909 () Bool)

(declare-fun c!23600 () Bool)

(assert (=> d!38909 (= c!23600 ((_ is ValueCellFull!1082) (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83933 () V!3449)

(assert (=> d!38909 (= (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83933)))

(declare-fun b!128570 () Bool)

(assert (=> b!128570 (= e!83933 (get!1454 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128571 () Bool)

(assert (=> b!128571 (= e!83933 (get!1455 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38909 c!23600) b!128570))

(assert (= (and d!38909 (not c!23600)) b!128571))

(assert (=> b!128570 m!149619))

(assert (=> b!128570 m!149617))

(declare-fun m!150449 () Bool)

(assert (=> b!128570 m!150449))

(assert (=> b!128571 m!149619))

(assert (=> b!128571 m!149617))

(declare-fun m!150451 () Bool)

(assert (=> b!128571 m!150451))

(assert (=> b!128091 d!38909))

(declare-fun b!128572 () Bool)

(declare-fun e!83934 () Option!172)

(assert (=> b!128572 (= e!83934 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66283)))))))

(declare-fun b!128575 () Bool)

(declare-fun e!83935 () Option!172)

(assert (=> b!128575 (= e!83935 None!170)))

(declare-fun b!128574 () Bool)

(assert (=> b!128574 (= e!83935 (getValueByKey!166 (t!6068 (toList!844 lt!66283)) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun c!23601 () Bool)

(declare-fun d!38911 () Bool)

(assert (=> d!38911 (= c!23601 (and ((_ is Cons!1694) (toList!844 lt!66283)) (= (_1!1291 (h!2297 (toList!844 lt!66283))) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38911 (= (getValueByKey!166 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!83934)))

(declare-fun b!128573 () Bool)

(assert (=> b!128573 (= e!83934 e!83935)))

(declare-fun c!23602 () Bool)

(assert (=> b!128573 (= c!23602 (and ((_ is Cons!1694) (toList!844 lt!66283)) (not (= (_1!1291 (h!2297 (toList!844 lt!66283))) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!38911 c!23601) b!128572))

(assert (= (and d!38911 (not c!23601)) b!128573))

(assert (= (and b!128573 c!23602) b!128574))

(assert (= (and b!128573 (not c!23602)) b!128575))

(declare-fun m!150453 () Bool)

(assert (=> b!128574 m!150453))

(assert (=> b!128229 d!38911))

(declare-fun d!38913 () Bool)

(assert (=> d!38913 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!66563 () Unit!3980)

(assert (=> d!38913 (= lt!66563 (choose!787 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!83936 () Bool)

(assert (=> d!38913 e!83936))

(declare-fun res!62073 () Bool)

(assert (=> d!38913 (=> (not res!62073) (not e!83936))))

(assert (=> d!38913 (= res!62073 (isStrictlySorted!313 (toList!844 lt!66050)))))

(assert (=> d!38913 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66563)))

(declare-fun b!128576 () Bool)

(assert (=> b!128576 (= e!83936 (containsKey!170 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38913 res!62073) b!128576))

(assert (=> d!38913 m!149447))

(assert (=> d!38913 m!149681))

(assert (=> d!38913 m!149681))

(assert (=> d!38913 m!150069))

(assert (=> d!38913 m!149447))

(declare-fun m!150455 () Bool)

(assert (=> d!38913 m!150455))

(declare-fun m!150457 () Bool)

(assert (=> d!38913 m!150457))

(assert (=> b!128576 m!149447))

(assert (=> b!128576 m!150065))

(assert (=> b!128355 d!38913))

(declare-fun d!38915 () Bool)

(assert (=> d!38915 (= (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!404 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5318 () Bool)

(assert (= bs!5318 d!38915))

(assert (=> bs!5318 m!149681))

(declare-fun m!150459 () Bool)

(assert (=> bs!5318 m!150459))

(assert (=> b!128355 d!38915))

(declare-fun b!128577 () Bool)

(declare-fun e!83937 () Option!172)

(assert (=> b!128577 (= e!83937 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66050)))))))

(declare-fun b!128580 () Bool)

(declare-fun e!83938 () Option!172)

(assert (=> b!128580 (= e!83938 None!170)))

(declare-fun b!128579 () Bool)

(assert (=> b!128579 (= e!83938 (getValueByKey!166 (t!6068 (toList!844 lt!66050)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun c!23603 () Bool)

(declare-fun d!38917 () Bool)

(assert (=> d!38917 (= c!23603 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38917 (= (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83937)))

(declare-fun b!128578 () Bool)

(assert (=> b!128578 (= e!83937 e!83938)))

(declare-fun c!23604 () Bool)

(assert (=> b!128578 (= c!23604 (and ((_ is Cons!1694) (toList!844 lt!66050)) (not (= (_1!1291 (h!2297 (toList!844 lt!66050))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(assert (= (and d!38917 c!23603) b!128577))

(assert (= (and d!38917 (not c!23603)) b!128578))

(assert (= (and b!128578 c!23604) b!128579))

(assert (= (and b!128578 (not c!23604)) b!128580))

(assert (=> b!128579 m!149447))

(declare-fun m!150461 () Bool)

(assert (=> b!128579 m!150461))

(assert (=> b!128355 d!38917))

(declare-fun b!128581 () Bool)

(declare-fun e!83939 () Option!172)

(assert (=> b!128581 (= e!83939 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66212)))))))

(declare-fun b!128584 () Bool)

(declare-fun e!83940 () Option!172)

(assert (=> b!128584 (= e!83940 None!170)))

(declare-fun b!128583 () Bool)

(assert (=> b!128583 (= e!83940 (getValueByKey!166 (t!6068 (toList!844 lt!66212)) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!38919 () Bool)

(declare-fun c!23605 () Bool)

(assert (=> d!38919 (= c!23605 (and ((_ is Cons!1694) (toList!844 lt!66212)) (= (_1!1291 (h!2297 (toList!844 lt!66212))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38919 (= (getValueByKey!166 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!83939)))

(declare-fun b!128582 () Bool)

(assert (=> b!128582 (= e!83939 e!83940)))

(declare-fun c!23606 () Bool)

(assert (=> b!128582 (= c!23606 (and ((_ is Cons!1694) (toList!844 lt!66212)) (not (= (_1!1291 (h!2297 (toList!844 lt!66212))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!38919 c!23605) b!128581))

(assert (= (and d!38919 (not c!23605)) b!128582))

(assert (= (and b!128582 c!23606) b!128583))

(assert (= (and b!128582 (not c!23606)) b!128584))

(declare-fun m!150463 () Bool)

(assert (=> b!128583 m!150463))

(assert (=> b!128114 d!38919))

(declare-fun d!38921 () Bool)

(declare-fun e!83942 () Bool)

(assert (=> d!38921 e!83942))

(declare-fun res!62074 () Bool)

(assert (=> d!38921 (=> res!62074 e!83942)))

(declare-fun lt!66566 () Bool)

(assert (=> d!38921 (= res!62074 (not lt!66566))))

(declare-fun lt!66567 () Bool)

(assert (=> d!38921 (= lt!66566 lt!66567)))

(declare-fun lt!66565 () Unit!3980)

(declare-fun e!83941 () Unit!3980)

(assert (=> d!38921 (= lt!66565 e!83941)))

(declare-fun c!23607 () Bool)

(assert (=> d!38921 (= c!23607 lt!66567)))

(assert (=> d!38921 (= lt!66567 (containsKey!170 (toList!844 lt!66181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38921 (= (contains!873 lt!66181 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66566)))

(declare-fun b!128585 () Bool)

(declare-fun lt!66564 () Unit!3980)

(assert (=> b!128585 (= e!83941 lt!66564)))

(assert (=> b!128585 (= lt!66564 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128585 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128586 () Bool)

(declare-fun Unit!4004 () Unit!3980)

(assert (=> b!128586 (= e!83941 Unit!4004)))

(declare-fun b!128587 () Bool)

(assert (=> b!128587 (= e!83942 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38921 c!23607) b!128585))

(assert (= (and d!38921 (not c!23607)) b!128586))

(assert (= (and d!38921 (not res!62074)) b!128587))

(declare-fun m!150465 () Bool)

(assert (=> d!38921 m!150465))

(declare-fun m!150467 () Bool)

(assert (=> b!128585 m!150467))

(assert (=> b!128585 m!150125))

(assert (=> b!128585 m!150125))

(declare-fun m!150469 () Bool)

(assert (=> b!128585 m!150469))

(assert (=> b!128587 m!150125))

(assert (=> b!128587 m!150125))

(assert (=> b!128587 m!150469))

(assert (=> bm!13839 d!38921))

(assert (=> d!38725 d!38895))

(assert (=> d!38797 d!38895))

(assert (=> b!128285 d!38729))

(declare-fun b!128588 () Bool)

(declare-fun e!83943 () Option!172)

(assert (=> b!128588 (= e!83943 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66444)))))))

(declare-fun b!128591 () Bool)

(declare-fun e!83944 () Option!172)

(assert (=> b!128591 (= e!83944 None!170)))

(declare-fun b!128590 () Bool)

(assert (=> b!128590 (= e!83944 (getValueByKey!166 (t!6068 (toList!844 lt!66444)) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!23608 () Bool)

(declare-fun d!38923 () Bool)

(assert (=> d!38923 (= c!23608 (and ((_ is Cons!1694) (toList!844 lt!66444)) (= (_1!1291 (h!2297 (toList!844 lt!66444))) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38923 (= (getValueByKey!166 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83943)))

(declare-fun b!128589 () Bool)

(assert (=> b!128589 (= e!83943 e!83944)))

(declare-fun c!23609 () Bool)

(assert (=> b!128589 (= c!23609 (and ((_ is Cons!1694) (toList!844 lt!66444)) (not (= (_1!1291 (h!2297 (toList!844 lt!66444))) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!38923 c!23608) b!128588))

(assert (= (and d!38923 (not c!23608)) b!128589))

(assert (= (and b!128589 c!23609) b!128590))

(assert (= (and b!128589 (not c!23609)) b!128591))

(declare-fun m!150471 () Bool)

(assert (=> b!128590 m!150471))

(assert (=> b!128373 d!38923))

(declare-fun d!38925 () Bool)

(declare-fun isEmpty!405 (List!1698) Bool)

(assert (=> d!38925 (= (isEmpty!403 lt!66303) (isEmpty!405 (toList!844 lt!66303)))))

(declare-fun bs!5319 () Bool)

(assert (= bs!5319 d!38925))

(declare-fun m!150473 () Bool)

(assert (=> bs!5319 m!150473))

(assert (=> b!128266 d!38925))

(assert (=> d!38697 d!38723))

(declare-fun d!38927 () Bool)

(declare-fun e!83947 () Bool)

(assert (=> d!38927 e!83947))

(declare-fun res!62080 () Bool)

(assert (=> d!38927 (=> (not res!62080) (not e!83947))))

(declare-fun lt!66570 () SeekEntryResult!274)

(assert (=> d!38927 (= res!62080 ((_ is Found!274) lt!66570))))

(assert (=> d!38927 (= lt!66570 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (=> d!38927 true))

(declare-fun _$33!108 () Unit!3980)

(assert (=> d!38927 (= (choose!780 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) _$33!108)))

(declare-fun b!128596 () Bool)

(declare-fun res!62079 () Bool)

(assert (=> b!128596 (=> (not res!62079) (not e!83947))))

(assert (=> b!128596 (= res!62079 (inRange!0 (index!3253 lt!66570) (mask!7071 newMap!16)))))

(declare-fun b!128597 () Bool)

(assert (=> b!128597 (= e!83947 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66570)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38927 res!62080) b!128596))

(assert (= (and b!128596 res!62079) b!128597))

(assert (=> d!38927 m!149345))

(assert (=> d!38927 m!149525))

(declare-fun m!150475 () Bool)

(assert (=> b!128596 m!150475))

(declare-fun m!150477 () Bool)

(assert (=> b!128597 m!150477))

(assert (=> d!38697 d!38927))

(assert (=> d!38697 d!38895))

(declare-fun d!38929 () Bool)

(declare-fun res!62081 () Bool)

(declare-fun e!83948 () Bool)

(assert (=> d!38929 (=> res!62081 e!83948)))

(assert (=> d!38929 (= res!62081 (and ((_ is Cons!1694) (toList!844 call!13819)) (= (_1!1291 (h!2297 (toList!844 call!13819))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38929 (= (containsKey!170 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!83948)))

(declare-fun b!128598 () Bool)

(declare-fun e!83949 () Bool)

(assert (=> b!128598 (= e!83948 e!83949)))

(declare-fun res!62082 () Bool)

(assert (=> b!128598 (=> (not res!62082) (not e!83949))))

(assert (=> b!128598 (= res!62082 (and (or (not ((_ is Cons!1694) (toList!844 call!13819))) (bvsle (_1!1291 (h!2297 (toList!844 call!13819))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!844 call!13819)) (bvslt (_1!1291 (h!2297 (toList!844 call!13819))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(declare-fun b!128599 () Bool)

(assert (=> b!128599 (= e!83949 (containsKey!170 (t!6068 (toList!844 call!13819)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!38929 (not res!62081)) b!128598))

(assert (= (and b!128598 res!62082) b!128599))

(assert (=> b!128599 m!149345))

(declare-fun m!150479 () Bool)

(assert (=> b!128599 m!150479))

(assert (=> d!38737 d!38929))

(declare-fun b!128600 () Bool)

(declare-fun e!83950 () Option!172)

(assert (=> b!128600 (= e!83950 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66316)))))))

(declare-fun b!128603 () Bool)

(declare-fun e!83951 () Option!172)

(assert (=> b!128603 (= e!83951 None!170)))

(declare-fun b!128602 () Bool)

(assert (=> b!128602 (= e!83951 (getValueByKey!166 (t!6068 (toList!844 lt!66316)) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!38931 () Bool)

(declare-fun c!23610 () Bool)

(assert (=> d!38931 (= c!23610 (and ((_ is Cons!1694) (toList!844 lt!66316)) (= (_1!1291 (h!2297 (toList!844 lt!66316))) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38931 (= (getValueByKey!166 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!83950)))

(declare-fun b!128601 () Bool)

(assert (=> b!128601 (= e!83950 e!83951)))

(declare-fun c!23611 () Bool)

(assert (=> b!128601 (= c!23611 (and ((_ is Cons!1694) (toList!844 lt!66316)) (not (= (_1!1291 (h!2297 (toList!844 lt!66316))) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!38931 c!23610) b!128600))

(assert (= (and d!38931 (not c!23610)) b!128601))

(assert (= (and b!128601 c!23611) b!128602))

(assert (= (and b!128601 (not c!23611)) b!128603))

(declare-fun m!150481 () Bool)

(assert (=> b!128602 m!150481))

(assert (=> b!128274 d!38931))

(declare-fun d!38933 () Bool)

(declare-fun e!83953 () Bool)

(assert (=> d!38933 e!83953))

(declare-fun res!62083 () Bool)

(assert (=> d!38933 (=> res!62083 e!83953)))

(declare-fun lt!66573 () Bool)

(assert (=> d!38933 (= res!62083 (not lt!66573))))

(declare-fun lt!66574 () Bool)

(assert (=> d!38933 (= lt!66573 lt!66574)))

(declare-fun lt!66572 () Unit!3980)

(declare-fun e!83952 () Unit!3980)

(assert (=> d!38933 (= lt!66572 e!83952)))

(declare-fun c!23612 () Bool)

(assert (=> d!38933 (= c!23612 lt!66574)))

(assert (=> d!38933 (= lt!66574 (containsKey!170 (toList!844 lt!66303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38933 (= (contains!873 lt!66303 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66573)))

(declare-fun b!128604 () Bool)

(declare-fun lt!66571 () Unit!3980)

(assert (=> b!128604 (= e!83952 lt!66571)))

(assert (=> b!128604 (= lt!66571 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128604 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128605 () Bool)

(declare-fun Unit!4005 () Unit!3980)

(assert (=> b!128605 (= e!83952 Unit!4005)))

(declare-fun b!128606 () Bool)

(assert (=> b!128606 (= e!83953 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38933 c!23612) b!128604))

(assert (= (and d!38933 (not c!23612)) b!128605))

(assert (= (and d!38933 (not res!62083)) b!128606))

(declare-fun m!150483 () Bool)

(assert (=> d!38933 m!150483))

(declare-fun m!150485 () Bool)

(assert (=> b!128604 m!150485))

(declare-fun m!150487 () Bool)

(assert (=> b!128604 m!150487))

(assert (=> b!128604 m!150487))

(declare-fun m!150489 () Bool)

(assert (=> b!128604 m!150489))

(assert (=> b!128606 m!150487))

(assert (=> b!128606 m!150487))

(assert (=> b!128606 m!150489))

(assert (=> d!38747 d!38933))

(assert (=> d!38747 d!38679))

(declare-fun d!38935 () Bool)

(declare-fun res!62084 () Bool)

(declare-fun e!83956 () Bool)

(assert (=> d!38935 (=> res!62084 e!83956)))

(assert (=> d!38935 (= res!62084 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (=> d!38935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4540 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148))) e!83956)))

(declare-fun b!128607 () Bool)

(declare-fun e!83955 () Bool)

(declare-fun e!83954 () Bool)

(assert (=> b!128607 (= e!83955 e!83954)))

(declare-fun lt!66576 () (_ BitVec 64))

(assert (=> b!128607 (= lt!66576 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000))))

(declare-fun lt!66577 () Unit!3980)

(assert (=> b!128607 (= lt!66577 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4540 (_2!1292 lt!66148)) lt!66576 #b00000000000000000000000000000000))))

(assert (=> b!128607 (arrayContainsKey!0 (_keys!4540 (_2!1292 lt!66148)) lt!66576 #b00000000000000000000000000000000)))

(declare-fun lt!66575 () Unit!3980)

(assert (=> b!128607 (= lt!66575 lt!66577)))

(declare-fun res!62085 () Bool)

(assert (=> b!128607 (= res!62085 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000) (_keys!4540 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148))) (Found!274 #b00000000000000000000000000000000)))))

(assert (=> b!128607 (=> (not res!62085) (not e!83954))))

(declare-fun b!128608 () Bool)

(declare-fun call!13908 () Bool)

(assert (=> b!128608 (= e!83954 call!13908)))

(declare-fun bm!13905 () Bool)

(assert (=> bm!13905 (= call!13908 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4540 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148))))))

(declare-fun b!128609 () Bool)

(assert (=> b!128609 (= e!83956 e!83955)))

(declare-fun c!23613 () Bool)

(assert (=> b!128609 (= c!23613 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun b!128610 () Bool)

(assert (=> b!128610 (= e!83955 call!13908)))

(assert (= (and d!38935 (not res!62084)) b!128609))

(assert (= (and b!128609 c!23613) b!128607))

(assert (= (and b!128609 (not c!23613)) b!128610))

(assert (= (and b!128607 res!62085) b!128608))

(assert (= (or b!128608 b!128610) bm!13905))

(assert (=> b!128607 m!150117))

(declare-fun m!150491 () Bool)

(assert (=> b!128607 m!150491))

(declare-fun m!150493 () Bool)

(assert (=> b!128607 m!150493))

(assert (=> b!128607 m!150117))

(declare-fun m!150495 () Bool)

(assert (=> b!128607 m!150495))

(declare-fun m!150497 () Bool)

(assert (=> bm!13905 m!150497))

(assert (=> b!128609 m!150117))

(assert (=> b!128609 m!150117))

(assert (=> b!128609 m!150119))

(assert (=> b!128106 d!38935))

(declare-fun d!38937 () Bool)

(assert (=> d!38937 (= (get!1454 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3137 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128108 d!38937))

(declare-fun d!38939 () Bool)

(assert (=> d!38939 (= (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) (not (isEmpty!404 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(declare-fun bs!5320 () Bool)

(assert (= bs!5320 d!38939))

(assert (=> bs!5320 m!149609))

(declare-fun m!150499 () Bool)

(assert (=> bs!5320 m!150499))

(assert (=> b!128083 d!38939))

(declare-fun b!128611 () Bool)

(declare-fun e!83957 () Option!172)

(assert (=> b!128611 (= e!83957 (Some!171 (_2!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))))))

(declare-fun b!128614 () Bool)

(declare-fun e!83958 () Option!172)

(assert (=> b!128614 (= e!83958 None!170)))

(declare-fun b!128613 () Bool)

(assert (=> b!128613 (= e!83958 (getValueByKey!166 (t!6068 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun c!23614 () Bool)

(declare-fun d!38941 () Bool)

(assert (=> d!38941 (= c!23614 (and ((_ is Cons!1694) (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (= (_1!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38941 (= (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!83957)))

(declare-fun b!128612 () Bool)

(assert (=> b!128612 (= e!83957 e!83958)))

(declare-fun c!23615 () Bool)

(assert (=> b!128612 (= c!23615 (and ((_ is Cons!1694) (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (not (= (_1!1291 (h!2297 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(assert (= (and d!38941 c!23614) b!128611))

(assert (= (and d!38941 (not c!23614)) b!128612))

(assert (= (and b!128612 c!23615) b!128613))

(assert (= (and b!128612 (not c!23615)) b!128614))

(assert (=> b!128613 m!149345))

(declare-fun m!150501 () Bool)

(assert (=> b!128613 m!150501))

(assert (=> b!128083 d!38941))

(assert (=> b!128370 d!38809))

(declare-fun d!38943 () Bool)

(declare-fun e!83959 () Bool)

(assert (=> d!38943 e!83959))

(declare-fun res!62086 () Bool)

(assert (=> d!38943 (=> (not res!62086) (not e!83959))))

(declare-fun lt!66581 () ListLongMap!1657)

(assert (=> d!38943 (= res!62086 (contains!873 lt!66581 (_1!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun lt!66580 () List!1698)

(assert (=> d!38943 (= lt!66581 (ListLongMap!1658 lt!66580))))

(declare-fun lt!66579 () Unit!3980)

(declare-fun lt!66578 () Unit!3980)

(assert (=> d!38943 (= lt!66579 lt!66578)))

(assert (=> d!38943 (= (getValueByKey!166 lt!66580 (_1!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))) (Some!171 (_2!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!38943 (= lt!66578 (lemmaContainsTupThenGetReturnValue!84 lt!66580 (_1!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (_2!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!38943 (= lt!66580 (insertStrictlySorted!87 (toList!844 (ite c!23501 call!13852 (ite c!23503 call!13851 call!13850))) (_1!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (_2!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!38943 (= (+!159 (ite c!23501 call!13852 (ite c!23503 call!13851 call!13850)) (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!66581)))

(declare-fun b!128615 () Bool)

(declare-fun res!62087 () Bool)

(assert (=> b!128615 (=> (not res!62087) (not e!83959))))

(assert (=> b!128615 (= res!62087 (= (getValueByKey!166 (toList!844 lt!66581) (_1!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))) (Some!171 (_2!1291 (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))))

(declare-fun b!128616 () Bool)

(assert (=> b!128616 (= e!83959 (contains!874 (toList!844 lt!66581) (ite (or c!23501 c!23503) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (= (and d!38943 res!62086) b!128615))

(assert (= (and b!128615 res!62087) b!128616))

(declare-fun m!150503 () Bool)

(assert (=> d!38943 m!150503))

(declare-fun m!150505 () Bool)

(assert (=> d!38943 m!150505))

(declare-fun m!150507 () Bool)

(assert (=> d!38943 m!150507))

(declare-fun m!150509 () Bool)

(assert (=> d!38943 m!150509))

(declare-fun m!150511 () Bool)

(assert (=> b!128615 m!150511))

(declare-fun m!150513 () Bool)

(assert (=> b!128616 m!150513))

(assert (=> bm!13850 d!38943))

(declare-fun d!38945 () Bool)

(declare-fun e!83961 () Bool)

(assert (=> d!38945 e!83961))

(declare-fun res!62088 () Bool)

(assert (=> d!38945 (=> res!62088 e!83961)))

(declare-fun lt!66584 () Bool)

(assert (=> d!38945 (= res!62088 (not lt!66584))))

(declare-fun lt!66585 () Bool)

(assert (=> d!38945 (= lt!66584 lt!66585)))

(declare-fun lt!66583 () Unit!3980)

(declare-fun e!83960 () Unit!3980)

(assert (=> d!38945 (= lt!66583 e!83960)))

(declare-fun c!23616 () Bool)

(assert (=> d!38945 (= c!23616 lt!66585)))

(assert (=> d!38945 (= lt!66585 (containsKey!170 (toList!844 (map!1377 (_2!1292 lt!66418))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!38945 (= (contains!873 (map!1377 (_2!1292 lt!66418)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66584)))

(declare-fun b!128617 () Bool)

(declare-fun lt!66582 () Unit!3980)

(assert (=> b!128617 (= e!83960 lt!66582)))

(assert (=> b!128617 (= lt!66582 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (map!1377 (_2!1292 lt!66418))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> b!128617 (isDefined!120 (getValueByKey!166 (toList!844 (map!1377 (_2!1292 lt!66418))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128618 () Bool)

(declare-fun Unit!4006 () Unit!3980)

(assert (=> b!128618 (= e!83960 Unit!4006)))

(declare-fun b!128619 () Bool)

(assert (=> b!128619 (= e!83961 (isDefined!120 (getValueByKey!166 (toList!844 (map!1377 (_2!1292 lt!66418))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (= (and d!38945 c!23616) b!128617))

(assert (= (and d!38945 (not c!23616)) b!128618))

(assert (= (and d!38945 (not res!62088)) b!128619))

(assert (=> d!38945 m!149345))

(declare-fun m!150515 () Bool)

(assert (=> d!38945 m!150515))

(assert (=> b!128617 m!149345))

(declare-fun m!150517 () Bool)

(assert (=> b!128617 m!150517))

(assert (=> b!128617 m!149345))

(declare-fun m!150519 () Bool)

(assert (=> b!128617 m!150519))

(assert (=> b!128617 m!150519))

(declare-fun m!150521 () Bool)

(assert (=> b!128617 m!150521))

(assert (=> b!128619 m!149345))

(assert (=> b!128619 m!150519))

(assert (=> b!128619 m!150519))

(assert (=> b!128619 m!150521))

(assert (=> b!128349 d!38945))

(declare-fun d!38947 () Bool)

(assert (=> d!38947 (= (map!1377 (_2!1292 lt!66418)) (getCurrentListMap!513 (_keys!4540 (_2!1292 lt!66418)) (_values!2787 (_2!1292 lt!66418)) (mask!7071 (_2!1292 lt!66418)) (extraKeys!2581 (_2!1292 lt!66418)) (zeroValue!2665 (_2!1292 lt!66418)) (minValue!2665 (_2!1292 lt!66418)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66418))))))

(declare-fun bs!5321 () Bool)

(assert (= bs!5321 d!38947))

(declare-fun m!150523 () Bool)

(assert (=> bs!5321 m!150523))

(assert (=> b!128349 d!38947))

(declare-fun b!128620 () Bool)

(declare-fun e!83963 () Bool)

(declare-fun e!83962 () Bool)

(assert (=> b!128620 (= e!83963 e!83962)))

(assert (=> b!128620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!62092 () Bool)

(declare-fun lt!66591 () ListLongMap!1657)

(assert (=> b!128620 (= res!62092 (contains!873 lt!66591 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128620 (=> (not res!62092) (not e!83962))))

(declare-fun b!128621 () Bool)

(declare-fun e!83966 () Bool)

(assert (=> b!128621 (= e!83966 e!83963)))

(declare-fun c!23618 () Bool)

(declare-fun e!83964 () Bool)

(assert (=> b!128621 (= c!23618 e!83964)))

(declare-fun res!62089 () Bool)

(assert (=> b!128621 (=> (not res!62089) (not e!83964))))

(assert (=> b!128621 (= res!62089 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128622 () Bool)

(declare-fun e!83965 () Bool)

(assert (=> b!128622 (= e!83963 e!83965)))

(declare-fun c!23620 () Bool)

(assert (=> b!128622 (= c!23620 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13906 () Bool)

(declare-fun call!13909 () ListLongMap!1657)

(assert (=> bm!13906 (= call!13909 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(declare-fun b!128623 () Bool)

(assert (=> b!128623 (= e!83964 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128623 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128624 () Bool)

(declare-fun e!83968 () ListLongMap!1657)

(assert (=> b!128624 (= e!83968 (ListLongMap!1658 Nil!1695))))

(declare-fun d!38949 () Bool)

(assert (=> d!38949 e!83966))

(declare-fun res!62091 () Bool)

(assert (=> d!38949 (=> (not res!62091) (not e!83966))))

(assert (=> d!38949 (= res!62091 (not (contains!873 lt!66591 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38949 (= lt!66591 e!83968)))

(declare-fun c!23617 () Bool)

(assert (=> d!38949 (= c!23617 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38949 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38949 (= (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66591)))

(declare-fun b!128625 () Bool)

(assert (=> b!128625 (= e!83965 (= lt!66591 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!128626 () Bool)

(declare-fun e!83967 () ListLongMap!1657)

(assert (=> b!128626 (= e!83968 e!83967)))

(declare-fun c!23619 () Bool)

(assert (=> b!128626 (= c!23619 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128627 () Bool)

(assert (=> b!128627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> b!128627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (_values!2787 newMap!16))))))

(assert (=> b!128627 (= e!83962 (= (apply!112 lt!66591 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128628 () Bool)

(assert (=> b!128628 (= e!83967 call!13909)))

(declare-fun b!128629 () Bool)

(declare-fun lt!66589 () Unit!3980)

(declare-fun lt!66586 () Unit!3980)

(assert (=> b!128629 (= lt!66589 lt!66586)))

(declare-fun lt!66587 () ListLongMap!1657)

(declare-fun lt!66592 () V!3449)

(declare-fun lt!66590 () (_ BitVec 64))

(declare-fun lt!66588 () (_ BitVec 64))

(assert (=> b!128629 (not (contains!873 (+!159 lt!66587 (tuple2!2561 lt!66590 lt!66592)) lt!66588))))

(assert (=> b!128629 (= lt!66586 (addStillNotContains!58 lt!66587 lt!66590 lt!66592 lt!66588))))

(assert (=> b!128629 (= lt!66588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128629 (= lt!66592 (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128629 (= lt!66590 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128629 (= lt!66587 call!13909)))

(assert (=> b!128629 (= e!83967 (+!159 call!13909 (tuple2!2561 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128630 () Bool)

(declare-fun res!62090 () Bool)

(assert (=> b!128630 (=> (not res!62090) (not e!83966))))

(assert (=> b!128630 (= res!62090 (not (contains!873 lt!66591 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128631 () Bool)

(assert (=> b!128631 (= e!83965 (isEmpty!403 lt!66591))))

(assert (= (and d!38949 c!23617) b!128624))

(assert (= (and d!38949 (not c!23617)) b!128626))

(assert (= (and b!128626 c!23619) b!128629))

(assert (= (and b!128626 (not c!23619)) b!128628))

(assert (= (or b!128629 b!128628) bm!13906))

(assert (= (and d!38949 res!62091) b!128630))

(assert (= (and b!128630 res!62090) b!128621))

(assert (= (and b!128621 res!62089) b!128623))

(assert (= (and b!128621 c!23618) b!128620))

(assert (= (and b!128621 (not c!23618)) b!128622))

(assert (= (and b!128620 res!62092) b!128627))

(assert (= (and b!128622 c!23620) b!128625))

(assert (= (and b!128622 (not c!23620)) b!128631))

(declare-fun b_lambda!5681 () Bool)

(assert (=> (not b_lambda!5681) (not b!128627)))

(assert (=> b!128627 t!6080))

(declare-fun b_and!7933 () Bool)

(assert (= b_and!7929 (and (=> t!6080 result!3889) b_and!7933)))

(assert (=> b!128627 t!6082))

(declare-fun b_and!7935 () Bool)

(assert (= b_and!7931 (and (=> t!6082 result!3891) b_and!7935)))

(declare-fun b_lambda!5683 () Bool)

(assert (=> (not b_lambda!5683) (not b!128629)))

(assert (=> b!128629 t!6080))

(declare-fun b_and!7937 () Bool)

(assert (= b_and!7933 (and (=> t!6080 result!3889) b_and!7937)))

(assert (=> b!128629 t!6082))

(declare-fun b_and!7939 () Bool)

(assert (= b_and!7935 (and (=> t!6082 result!3891) b_and!7939)))

(declare-fun m!150525 () Bool)

(assert (=> b!128630 m!150525))

(assert (=> b!128626 m!149575))

(assert (=> b!128626 m!149575))

(assert (=> b!128626 m!149663))

(declare-fun m!150527 () Bool)

(assert (=> b!128629 m!150527))

(assert (=> b!128629 m!149619))

(assert (=> b!128629 m!149617))

(assert (=> b!128629 m!149621))

(declare-fun m!150529 () Bool)

(assert (=> b!128629 m!150529))

(declare-fun m!150531 () Bool)

(assert (=> b!128629 m!150531))

(assert (=> b!128629 m!149617))

(declare-fun m!150533 () Bool)

(assert (=> b!128629 m!150533))

(assert (=> b!128629 m!149575))

(assert (=> b!128629 m!149619))

(assert (=> b!128629 m!150529))

(assert (=> b!128623 m!149575))

(assert (=> b!128623 m!149575))

(assert (=> b!128623 m!149663))

(declare-fun m!150535 () Bool)

(assert (=> b!128631 m!150535))

(assert (=> b!128620 m!149575))

(assert (=> b!128620 m!149575))

(declare-fun m!150537 () Bool)

(assert (=> b!128620 m!150537))

(declare-fun m!150539 () Bool)

(assert (=> d!38949 m!150539))

(assert (=> d!38949 m!149585))

(declare-fun m!150541 () Bool)

(assert (=> bm!13906 m!150541))

(assert (=> b!128627 m!149619))

(assert (=> b!128627 m!149619))

(assert (=> b!128627 m!149617))

(assert (=> b!128627 m!149621))

(assert (=> b!128627 m!149617))

(assert (=> b!128627 m!149575))

(declare-fun m!150543 () Bool)

(assert (=> b!128627 m!150543))

(assert (=> b!128627 m!149575))

(assert (=> b!128625 m!150541))

(assert (=> bm!13838 d!38949))

(declare-fun d!38951 () Bool)

(declare-fun e!83970 () Bool)

(assert (=> d!38951 e!83970))

(declare-fun res!62093 () Bool)

(assert (=> d!38951 (=> res!62093 e!83970)))

(declare-fun lt!66595 () Bool)

(assert (=> d!38951 (= res!62093 (not lt!66595))))

(declare-fun lt!66596 () Bool)

(assert (=> d!38951 (= lt!66595 lt!66596)))

(declare-fun lt!66594 () Unit!3980)

(declare-fun e!83969 () Unit!3980)

(assert (=> d!38951 (= lt!66594 e!83969)))

(declare-fun c!23621 () Bool)

(assert (=> d!38951 (= c!23621 lt!66596)))

(assert (=> d!38951 (= lt!66596 (containsKey!170 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!38951 (= (contains!873 lt!66324 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66595)))

(declare-fun b!128632 () Bool)

(declare-fun lt!66593 () Unit!3980)

(assert (=> b!128632 (= e!83969 lt!66593)))

(assert (=> b!128632 (= lt!66593 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!128632 (isDefined!120 (getValueByKey!166 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128633 () Bool)

(declare-fun Unit!4007 () Unit!3980)

(assert (=> b!128633 (= e!83969 Unit!4007)))

(declare-fun b!128634 () Bool)

(assert (=> b!128634 (= e!83970 (isDefined!120 (getValueByKey!166 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!38951 c!23621) b!128632))

(assert (= (and d!38951 (not c!23621)) b!128633))

(assert (= (and d!38951 (not res!62093)) b!128634))

(declare-fun m!150545 () Bool)

(assert (=> d!38951 m!150545))

(declare-fun m!150547 () Bool)

(assert (=> b!128632 m!150547))

(assert (=> b!128632 m!149959))

(assert (=> b!128632 m!149959))

(declare-fun m!150549 () Bool)

(assert (=> b!128632 m!150549))

(assert (=> b!128634 m!149959))

(assert (=> b!128634 m!149959))

(assert (=> b!128634 m!150549))

(assert (=> d!38765 d!38951))

(declare-fun b!128635 () Bool)

(declare-fun e!83971 () Option!172)

(assert (=> b!128635 (= e!83971 (Some!171 (_2!1291 (h!2297 lt!66323))))))

(declare-fun b!128638 () Bool)

(declare-fun e!83972 () Option!172)

(assert (=> b!128638 (= e!83972 None!170)))

(declare-fun b!128637 () Bool)

(assert (=> b!128637 (= e!83972 (getValueByKey!166 (t!6068 lt!66323) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun c!23622 () Bool)

(declare-fun d!38953 () Bool)

(assert (=> d!38953 (= c!23622 (and ((_ is Cons!1694) lt!66323) (= (_1!1291 (h!2297 lt!66323)) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38953 (= (getValueByKey!166 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!83971)))

(declare-fun b!128636 () Bool)

(assert (=> b!128636 (= e!83971 e!83972)))

(declare-fun c!23623 () Bool)

(assert (=> b!128636 (= c!23623 (and ((_ is Cons!1694) lt!66323) (not (= (_1!1291 (h!2297 lt!66323)) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!38953 c!23622) b!128635))

(assert (= (and d!38953 (not c!23622)) b!128636))

(assert (= (and b!128636 c!23623) b!128637))

(assert (= (and b!128636 (not c!23623)) b!128638))

(declare-fun m!150551 () Bool)

(assert (=> b!128637 m!150551))

(assert (=> d!38765 d!38953))

(declare-fun d!38955 () Bool)

(assert (=> d!38955 (= (getValueByKey!166 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66599 () Unit!3980)

(declare-fun choose!790 (List!1698 (_ BitVec 64) V!3449) Unit!3980)

(assert (=> d!38955 (= lt!66599 (choose!790 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!83975 () Bool)

(assert (=> d!38955 e!83975))

(declare-fun res!62098 () Bool)

(assert (=> d!38955 (=> (not res!62098) (not e!83975))))

(assert (=> d!38955 (= res!62098 (isStrictlySorted!313 lt!66323))))

(assert (=> d!38955 (= (lemmaContainsTupThenGetReturnValue!84 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66599)))

(declare-fun b!128643 () Bool)

(declare-fun res!62099 () Bool)

(assert (=> b!128643 (=> (not res!62099) (not e!83975))))

(assert (=> b!128643 (= res!62099 (containsKey!170 lt!66323 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128644 () Bool)

(assert (=> b!128644 (= e!83975 (contains!874 lt!66323 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!38955 res!62098) b!128643))

(assert (= (and b!128643 res!62099) b!128644))

(assert (=> d!38955 m!149953))

(declare-fun m!150553 () Bool)

(assert (=> d!38955 m!150553))

(declare-fun m!150555 () Bool)

(assert (=> d!38955 m!150555))

(declare-fun m!150557 () Bool)

(assert (=> b!128643 m!150557))

(declare-fun m!150559 () Bool)

(assert (=> b!128644 m!150559))

(assert (=> d!38765 d!38955))

(declare-fun b!128665 () Bool)

(declare-fun e!83990 () List!1698)

(declare-fun call!13916 () List!1698)

(assert (=> b!128665 (= e!83990 call!13916)))

(declare-fun b!128666 () Bool)

(declare-fun e!83986 () List!1698)

(declare-fun call!13918 () List!1698)

(assert (=> b!128666 (= e!83986 call!13918)))

(declare-fun b!128667 () Bool)

(declare-fun e!83988 () Bool)

(declare-fun lt!66602 () List!1698)

(assert (=> b!128667 (= e!83988 (contains!874 lt!66602 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128668 () Bool)

(declare-fun e!83987 () List!1698)

(assert (=> b!128668 (= e!83987 (insertStrictlySorted!87 (t!6068 (toList!844 lt!66063)) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun bm!13913 () Bool)

(declare-fun call!13917 () List!1698)

(assert (=> bm!13913 (= call!13918 call!13917)))

(declare-fun b!128669 () Bool)

(declare-fun e!83989 () List!1698)

(assert (=> b!128669 (= e!83989 call!13917)))

(declare-fun bm!13914 () Bool)

(declare-fun c!23633 () Bool)

(declare-fun $colon$colon!89 (List!1698 tuple2!2560) List!1698)

(assert (=> bm!13914 (= call!13916 ($colon$colon!89 e!83987 (ite c!23633 (h!2297 (toList!844 lt!66063)) (tuple2!2561 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23635 () Bool)

(assert (=> bm!13914 (= c!23635 c!23633)))

(declare-fun b!128670 () Bool)

(assert (=> b!128670 (= e!83990 e!83989)))

(declare-fun c!23634 () Bool)

(assert (=> b!128670 (= c!23634 (and ((_ is Cons!1694) (toList!844 lt!66063)) (= (_1!1291 (h!2297 (toList!844 lt!66063))) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128671 () Bool)

(declare-fun c!23632 () Bool)

(assert (=> b!128671 (= c!23632 (and ((_ is Cons!1694) (toList!844 lt!66063)) (bvsgt (_1!1291 (h!2297 (toList!844 lt!66063))) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!128671 (= e!83989 e!83986)))

(declare-fun b!128672 () Bool)

(assert (=> b!128672 (= e!83987 (ite c!23634 (t!6068 (toList!844 lt!66063)) (ite c!23632 (Cons!1694 (h!2297 (toList!844 lt!66063)) (t!6068 (toList!844 lt!66063))) Nil!1695)))))

(declare-fun b!128673 () Bool)

(declare-fun res!62104 () Bool)

(assert (=> b!128673 (=> (not res!62104) (not e!83988))))

(assert (=> b!128673 (= res!62104 (containsKey!170 lt!66602 (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128674 () Bool)

(assert (=> b!128674 (= e!83986 call!13918)))

(declare-fun bm!13915 () Bool)

(assert (=> bm!13915 (= call!13917 call!13916)))

(declare-fun d!38957 () Bool)

(assert (=> d!38957 e!83988))

(declare-fun res!62105 () Bool)

(assert (=> d!38957 (=> (not res!62105) (not e!83988))))

(assert (=> d!38957 (= res!62105 (isStrictlySorted!313 lt!66602))))

(assert (=> d!38957 (= lt!66602 e!83990)))

(assert (=> d!38957 (= c!23633 (and ((_ is Cons!1694) (toList!844 lt!66063)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66063))) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38957 (isStrictlySorted!313 (toList!844 lt!66063))))

(assert (=> d!38957 (= (insertStrictlySorted!87 (toList!844 lt!66063) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66602)))

(assert (= (and d!38957 c!23633) b!128665))

(assert (= (and d!38957 (not c!23633)) b!128670))

(assert (= (and b!128670 c!23634) b!128669))

(assert (= (and b!128670 (not c!23634)) b!128671))

(assert (= (and b!128671 c!23632) b!128674))

(assert (= (and b!128671 (not c!23632)) b!128666))

(assert (= (or b!128674 b!128666) bm!13913))

(assert (= (or b!128669 bm!13913) bm!13915))

(assert (= (or b!128665 bm!13915) bm!13914))

(assert (= (and bm!13914 c!23635) b!128668))

(assert (= (and bm!13914 (not c!23635)) b!128672))

(assert (= (and d!38957 res!62105) b!128673))

(assert (= (and b!128673 res!62104) b!128667))

(declare-fun m!150561 () Bool)

(assert (=> b!128668 m!150561))

(declare-fun m!150563 () Bool)

(assert (=> bm!13914 m!150563))

(declare-fun m!150565 () Bool)

(assert (=> b!128673 m!150565))

(declare-fun m!150567 () Bool)

(assert (=> d!38957 m!150567))

(declare-fun m!150569 () Bool)

(assert (=> d!38957 m!150569))

(declare-fun m!150571 () Bool)

(assert (=> b!128667 m!150571))

(assert (=> d!38765 d!38957))

(declare-fun d!38959 () Bool)

(declare-fun lt!66605 () Bool)

(declare-fun content!128 (List!1700) (InoxSet (_ BitVec 64)))

(assert (=> d!38959 (= lt!66605 (select (content!128 Nil!1697) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83996 () Bool)

(assert (=> d!38959 (= lt!66605 e!83996)))

(declare-fun res!62111 () Bool)

(assert (=> d!38959 (=> (not res!62111) (not e!83996))))

(assert (=> d!38959 (= res!62111 ((_ is Cons!1696) Nil!1697))))

(assert (=> d!38959 (= (contains!875 Nil!1697 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) lt!66605)))

(declare-fun b!128679 () Bool)

(declare-fun e!83995 () Bool)

(assert (=> b!128679 (= e!83996 e!83995)))

(declare-fun res!62110 () Bool)

(assert (=> b!128679 (=> res!62110 e!83995)))

(assert (=> b!128679 (= res!62110 (= (h!2299 Nil!1697) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128680 () Bool)

(assert (=> b!128680 (= e!83995 (contains!875 (t!6078 Nil!1697) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38959 res!62111) b!128679))

(assert (= (and b!128679 (not res!62110)) b!128680))

(declare-fun m!150573 () Bool)

(assert (=> d!38959 m!150573))

(assert (=> d!38959 m!149575))

(declare-fun m!150575 () Bool)

(assert (=> d!38959 m!150575))

(assert (=> b!128680 m!149575))

(declare-fun m!150577 () Bool)

(assert (=> b!128680 m!150577))

(assert (=> b!128222 d!38959))

(declare-fun d!38961 () Bool)

(declare-fun e!83998 () Bool)

(assert (=> d!38961 e!83998))

(declare-fun res!62112 () Bool)

(assert (=> d!38961 (=> res!62112 e!83998)))

(declare-fun lt!66608 () Bool)

(assert (=> d!38961 (= res!62112 (not lt!66608))))

(declare-fun lt!66609 () Bool)

(assert (=> d!38961 (= lt!66608 lt!66609)))

(declare-fun lt!66607 () Unit!3980)

(declare-fun e!83997 () Unit!3980)

(assert (=> d!38961 (= lt!66607 e!83997)))

(declare-fun c!23636 () Bool)

(assert (=> d!38961 (= c!23636 lt!66609)))

(assert (=> d!38961 (= lt!66609 (containsKey!170 (toList!844 lt!66249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38961 (= (contains!873 lt!66249 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66608)))

(declare-fun b!128681 () Bool)

(declare-fun lt!66606 () Unit!3980)

(assert (=> b!128681 (= e!83997 lt!66606)))

(assert (=> b!128681 (= lt!66606 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128681 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128682 () Bool)

(declare-fun Unit!4008 () Unit!3980)

(assert (=> b!128682 (= e!83997 Unit!4008)))

(declare-fun b!128683 () Bool)

(assert (=> b!128683 (= e!83998 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38961 c!23636) b!128681))

(assert (= (and d!38961 (not c!23636)) b!128682))

(assert (= (and d!38961 (not res!62112)) b!128683))

(declare-fun m!150579 () Bool)

(assert (=> d!38961 m!150579))

(declare-fun m!150581 () Bool)

(assert (=> b!128681 m!150581))

(declare-fun m!150583 () Bool)

(assert (=> b!128681 m!150583))

(assert (=> b!128681 m!150583))

(declare-fun m!150585 () Bool)

(assert (=> b!128681 m!150585))

(assert (=> b!128683 m!150583))

(assert (=> b!128683 m!150583))

(assert (=> b!128683 m!150585))

(assert (=> bm!13853 d!38961))

(declare-fun b!128684 () Bool)

(declare-fun e!83999 () Option!172)

(assert (=> b!128684 (= e!83999 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66324)))))))

(declare-fun b!128687 () Bool)

(declare-fun e!84000 () Option!172)

(assert (=> b!128687 (= e!84000 None!170)))

(declare-fun b!128686 () Bool)

(assert (=> b!128686 (= e!84000 (getValueByKey!166 (t!6068 (toList!844 lt!66324)) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!38963 () Bool)

(declare-fun c!23637 () Bool)

(assert (=> d!38963 (= c!23637 (and ((_ is Cons!1694) (toList!844 lt!66324)) (= (_1!1291 (h!2297 (toList!844 lt!66324))) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!38963 (= (getValueByKey!166 (toList!844 lt!66324) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!83999)))

(declare-fun b!128685 () Bool)

(assert (=> b!128685 (= e!83999 e!84000)))

(declare-fun c!23638 () Bool)

(assert (=> b!128685 (= c!23638 (and ((_ is Cons!1694) (toList!844 lt!66324)) (not (= (_1!1291 (h!2297 (toList!844 lt!66324))) (_1!1291 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!38963 c!23637) b!128684))

(assert (= (and d!38963 (not c!23637)) b!128685))

(assert (= (and b!128685 c!23638) b!128686))

(assert (= (and b!128685 (not c!23638)) b!128687))

(declare-fun m!150587 () Bool)

(assert (=> b!128686 m!150587))

(assert (=> b!128278 d!38963))

(declare-fun d!38965 () Bool)

(assert (=> d!38965 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66610 () Unit!3980)

(assert (=> d!38965 (= lt!66610 (choose!787 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84001 () Bool)

(assert (=> d!38965 e!84001))

(declare-fun res!62113 () Bool)

(assert (=> d!38965 (=> (not res!62113) (not e!84001))))

(assert (=> d!38965 (= res!62113 (isStrictlySorted!313 (toList!844 lt!66050)))))

(assert (=> d!38965 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000) lt!66610)))

(declare-fun b!128688 () Bool)

(assert (=> b!128688 (= e!84001 (containsKey!170 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38965 res!62113) b!128688))

(assert (=> d!38965 m!149669))

(assert (=> d!38965 m!149669))

(assert (=> d!38965 m!150075))

(declare-fun m!150589 () Bool)

(assert (=> d!38965 m!150589))

(assert (=> d!38965 m!150457))

(assert (=> b!128688 m!150071))

(assert (=> b!128358 d!38965))

(declare-fun d!38967 () Bool)

(assert (=> d!38967 (= (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!404 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5322 () Bool)

(assert (= bs!5322 d!38967))

(assert (=> bs!5322 m!149669))

(declare-fun m!150591 () Bool)

(assert (=> bs!5322 m!150591))

(assert (=> b!128358 d!38967))

(declare-fun b!128689 () Bool)

(declare-fun e!84002 () Option!172)

(assert (=> b!128689 (= e!84002 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66050)))))))

(declare-fun b!128692 () Bool)

(declare-fun e!84003 () Option!172)

(assert (=> b!128692 (= e!84003 None!170)))

(declare-fun b!128691 () Bool)

(assert (=> b!128691 (= e!84003 (getValueByKey!166 (t!6068 (toList!844 lt!66050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38969 () Bool)

(declare-fun c!23639 () Bool)

(assert (=> d!38969 (= c!23639 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38969 (= (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000) e!84002)))

(declare-fun b!128690 () Bool)

(assert (=> b!128690 (= e!84002 e!84003)))

(declare-fun c!23640 () Bool)

(assert (=> b!128690 (= c!23640 (and ((_ is Cons!1694) (toList!844 lt!66050)) (not (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!38969 c!23639) b!128689))

(assert (= (and d!38969 (not c!23639)) b!128690))

(assert (= (and b!128690 c!23640) b!128691))

(assert (= (and b!128690 (not c!23640)) b!128692))

(declare-fun m!150593 () Bool)

(assert (=> b!128691 m!150593))

(assert (=> b!128358 d!38969))

(declare-fun b!128693 () Bool)

(declare-fun e!84005 () (_ BitVec 32))

(assert (=> b!128693 (= e!84005 #b00000000000000000000000000000000)))

(declare-fun b!128694 () Bool)

(declare-fun e!84004 () (_ BitVec 32))

(declare-fun call!13919 () (_ BitVec 32))

(assert (=> b!128694 (= e!84004 (bvadd #b00000000000000000000000000000001 call!13919))))

(declare-fun b!128695 () Bool)

(assert (=> b!128695 (= e!84005 e!84004)))

(declare-fun c!23642 () Bool)

(assert (=> b!128695 (= c!23642 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38971 () Bool)

(declare-fun lt!66611 () (_ BitVec 32))

(assert (=> d!38971 (and (bvsge lt!66611 #b00000000000000000000000000000000) (bvsle lt!66611 (bvsub (size!2490 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!38971 (= lt!66611 e!84005)))

(declare-fun c!23641 () Bool)

(assert (=> d!38971 (= c!23641 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38971 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2490 (_keys!4540 newMap!16)) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38971 (= (arrayCountValidKeys!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))) lt!66611)))

(declare-fun b!128696 () Bool)

(assert (=> b!128696 (= e!84004 call!13919)))

(declare-fun bm!13916 () Bool)

(assert (=> bm!13916 (= call!13919 (arrayCountValidKeys!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (= (and d!38971 c!23641) b!128693))

(assert (= (and d!38971 (not c!23641)) b!128695))

(assert (= (and b!128695 c!23642) b!128694))

(assert (= (and b!128695 (not c!23642)) b!128696))

(assert (= (or b!128694 b!128696) bm!13916))

(assert (=> b!128695 m!150441))

(assert (=> b!128695 m!150441))

(declare-fun m!150595 () Bool)

(assert (=> b!128695 m!150595))

(declare-fun m!150597 () Bool)

(assert (=> bm!13916 m!150597))

(assert (=> bm!13880 d!38971))

(assert (=> b!128169 d!38879))

(declare-fun d!38973 () Bool)

(assert (=> d!38973 (= (isDefined!120 (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) (not (isEmpty!404 (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(declare-fun bs!5323 () Bool)

(assert (= bs!5323 d!38973))

(assert (=> bs!5323 m!149855))

(declare-fun m!150599 () Bool)

(assert (=> bs!5323 m!150599))

(assert (=> b!128225 d!38973))

(declare-fun b!128697 () Bool)

(declare-fun e!84006 () Option!172)

(assert (=> b!128697 (= e!84006 (Some!171 (_2!1291 (h!2297 (toList!844 call!13819)))))))

(declare-fun b!128700 () Bool)

(declare-fun e!84007 () Option!172)

(assert (=> b!128700 (= e!84007 None!170)))

(declare-fun b!128699 () Bool)

(assert (=> b!128699 (= e!84007 (getValueByKey!166 (t!6068 (toList!844 call!13819)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun d!38975 () Bool)

(declare-fun c!23643 () Bool)

(assert (=> d!38975 (= c!23643 (and ((_ is Cons!1694) (toList!844 call!13819)) (= (_1!1291 (h!2297 (toList!844 call!13819))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38975 (= (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!84006)))

(declare-fun b!128698 () Bool)

(assert (=> b!128698 (= e!84006 e!84007)))

(declare-fun c!23644 () Bool)

(assert (=> b!128698 (= c!23644 (and ((_ is Cons!1694) (toList!844 call!13819)) (not (= (_1!1291 (h!2297 (toList!844 call!13819))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(assert (= (and d!38975 c!23643) b!128697))

(assert (= (and d!38975 (not c!23643)) b!128698))

(assert (= (and b!128698 c!23644) b!128699))

(assert (= (and b!128698 (not c!23644)) b!128700))

(assert (=> b!128699 m!149345))

(declare-fun m!150601 () Bool)

(assert (=> b!128699 m!150601))

(assert (=> b!128225 d!38975))

(declare-fun b!128701 () Bool)

(declare-fun e!84009 () (_ BitVec 32))

(assert (=> b!128701 (= e!84009 #b00000000000000000000000000000000)))

(declare-fun b!128702 () Bool)

(declare-fun e!84008 () (_ BitVec 32))

(declare-fun call!13920 () (_ BitVec 32))

(assert (=> b!128702 (= e!84008 (bvadd #b00000000000000000000000000000001 call!13920))))

(declare-fun b!128703 () Bool)

(assert (=> b!128703 (= e!84009 e!84008)))

(declare-fun c!23646 () Bool)

(assert (=> b!128703 (= c!23646 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!38977 () Bool)

(declare-fun lt!66612 () (_ BitVec 32))

(assert (=> d!38977 (and (bvsge lt!66612 #b00000000000000000000000000000000) (bvsle lt!66612 (bvsub (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!38977 (= lt!66612 e!84009)))

(declare-fun c!23645 () Bool)

(assert (=> d!38977 (= c!23645 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38977 (and (bvsle #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!38977 (= (arrayCountValidKeys!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))) lt!66612)))

(declare-fun b!128704 () Bool)

(assert (=> b!128704 (= e!84008 call!13920)))

(declare-fun bm!13917 () Bool)

(assert (=> bm!13917 (= call!13920 (arrayCountValidKeys!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!38977 c!23645) b!128701))

(assert (= (and d!38977 (not c!23645)) b!128703))

(assert (= (and b!128703 c!23646) b!128702))

(assert (= (and b!128703 (not c!23646)) b!128704))

(assert (= (or b!128702 b!128704) bm!13917))

(assert (=> b!128703 m!150393))

(assert (=> b!128703 m!150393))

(assert (=> b!128703 m!150403))

(declare-fun m!150603 () Bool)

(assert (=> bm!13917 m!150603))

(assert (=> b!128226 d!38977))

(declare-fun b!128705 () Bool)

(declare-fun e!84010 () Option!172)

(assert (=> b!128705 (= e!84010 (Some!171 (_2!1291 (h!2297 (t!6068 (toList!844 lt!65981))))))))

(declare-fun b!128708 () Bool)

(declare-fun e!84011 () Option!172)

(assert (=> b!128708 (= e!84011 None!170)))

(declare-fun b!128707 () Bool)

(assert (=> b!128707 (= e!84011 (getValueByKey!166 (t!6068 (t!6068 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun c!23647 () Bool)

(declare-fun d!38979 () Bool)

(assert (=> d!38979 (= c!23647 (and ((_ is Cons!1694) (t!6068 (toList!844 lt!65981))) (= (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!38979 (= (getValueByKey!166 (t!6068 (toList!844 lt!65981)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!84010)))

(declare-fun b!128706 () Bool)

(assert (=> b!128706 (= e!84010 e!84011)))

(declare-fun c!23648 () Bool)

(assert (=> b!128706 (= c!23648 (and ((_ is Cons!1694) (t!6068 (toList!844 lt!65981))) (not (= (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(assert (= (and d!38979 c!23647) b!128705))

(assert (= (and d!38979 (not c!23647)) b!128706))

(assert (= (and b!128706 c!23648) b!128707))

(assert (= (and b!128706 (not c!23648)) b!128708))

(assert (=> b!128707 m!149345))

(declare-fun m!150605 () Bool)

(assert (=> b!128707 m!150605))

(assert (=> b!128296 d!38979))

(declare-fun d!38981 () Bool)

(declare-fun e!84012 () Bool)

(assert (=> d!38981 e!84012))

(declare-fun res!62114 () Bool)

(assert (=> d!38981 (=> (not res!62114) (not e!84012))))

(declare-fun lt!66616 () ListLongMap!1657)

(assert (=> d!38981 (= res!62114 (contains!873 lt!66616 (_1!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66615 () List!1698)

(assert (=> d!38981 (= lt!66616 (ListLongMap!1658 lt!66615))))

(declare-fun lt!66614 () Unit!3980)

(declare-fun lt!66613 () Unit!3980)

(assert (=> d!38981 (= lt!66614 lt!66613)))

(assert (=> d!38981 (= (getValueByKey!166 lt!66615 (_1!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38981 (= lt!66613 (lemmaContainsTupThenGetReturnValue!84 lt!66615 (_1!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38981 (= lt!66615 (insertStrictlySorted!87 (toList!844 lt!66264) (_1!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38981 (= (+!159 lt!66264 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) lt!66616)))

(declare-fun b!128709 () Bool)

(declare-fun res!62115 () Bool)

(assert (=> b!128709 (=> (not res!62115) (not e!84012))))

(assert (=> b!128709 (= res!62115 (= (getValueByKey!166 (toList!844 lt!66616) (_1!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))))))))

(declare-fun b!128710 () Bool)

(assert (=> b!128710 (= e!84012 (contains!874 (toList!844 lt!66616) (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))))))

(assert (= (and d!38981 res!62114) b!128709))

(assert (= (and b!128709 res!62115) b!128710))

(declare-fun m!150607 () Bool)

(assert (=> d!38981 m!150607))

(declare-fun m!150609 () Bool)

(assert (=> d!38981 m!150609))

(declare-fun m!150611 () Bool)

(assert (=> d!38981 m!150611))

(declare-fun m!150613 () Bool)

(assert (=> d!38981 m!150613))

(declare-fun m!150615 () Bool)

(assert (=> b!128709 m!150615))

(declare-fun m!150617 () Bool)

(assert (=> b!128710 m!150617))

(assert (=> b!128175 d!38981))

(declare-fun b!128711 () Bool)

(declare-fun e!84014 () Bool)

(declare-fun e!84013 () Bool)

(assert (=> b!128711 (= e!84014 e!84013)))

(assert (=> b!128711 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!62119 () Bool)

(declare-fun lt!66622 () ListLongMap!1657)

(assert (=> b!128711 (= res!62119 (contains!873 lt!66622 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128711 (=> (not res!62119) (not e!84013))))

(declare-fun b!128712 () Bool)

(declare-fun e!84017 () Bool)

(assert (=> b!128712 (= e!84017 e!84014)))

(declare-fun c!23650 () Bool)

(declare-fun e!84015 () Bool)

(assert (=> b!128712 (= c!23650 e!84015)))

(declare-fun res!62116 () Bool)

(assert (=> b!128712 (=> (not res!62116) (not e!84015))))

(assert (=> b!128712 (= res!62116 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128713 () Bool)

(declare-fun e!84016 () Bool)

(assert (=> b!128713 (= e!84014 e!84016)))

(declare-fun c!23652 () Bool)

(assert (=> b!128713 (= c!23652 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun call!13921 () ListLongMap!1657)

(declare-fun bm!13918 () Bool)

(assert (=> bm!13918 (= call!13921 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(declare-fun b!128714 () Bool)

(assert (=> b!128714 (= e!84015 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128714 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128715 () Bool)

(declare-fun e!84019 () ListLongMap!1657)

(assert (=> b!128715 (= e!84019 (ListLongMap!1658 Nil!1695))))

(declare-fun d!38983 () Bool)

(assert (=> d!38983 e!84017))

(declare-fun res!62118 () Bool)

(assert (=> d!38983 (=> (not res!62118) (not e!84017))))

(assert (=> d!38983 (= res!62118 (not (contains!873 lt!66622 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38983 (= lt!66622 e!84019)))

(declare-fun c!23649 () Bool)

(assert (=> d!38983 (= c!23649 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!38983 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!38983 (= (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66622)))

(declare-fun b!128716 () Bool)

(assert (=> b!128716 (= e!84016 (= lt!66622 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) (mask!7071 newMap!16) (ite c!23467 (ite c!23472 (extraKeys!2581 newMap!16) lt!66137) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!128717 () Bool)

(declare-fun e!84018 () ListLongMap!1657)

(assert (=> b!128717 (= e!84019 e!84018)))

(declare-fun c!23651 () Bool)

(assert (=> b!128717 (= c!23651 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128718 () Bool)

(assert (=> b!128718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> b!128718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))))))))

(assert (=> b!128718 (= e!84013 (= (apply!112 lt!66622 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128719 () Bool)

(assert (=> b!128719 (= e!84018 call!13921)))

(declare-fun b!128720 () Bool)

(declare-fun lt!66620 () Unit!3980)

(declare-fun lt!66617 () Unit!3980)

(assert (=> b!128720 (= lt!66620 lt!66617)))

(declare-fun lt!66619 () (_ BitVec 64))

(declare-fun lt!66621 () (_ BitVec 64))

(declare-fun lt!66623 () V!3449)

(declare-fun lt!66618 () ListLongMap!1657)

(assert (=> b!128720 (not (contains!873 (+!159 lt!66618 (tuple2!2561 lt!66621 lt!66623)) lt!66619))))

(assert (=> b!128720 (= lt!66617 (addStillNotContains!58 lt!66618 lt!66621 lt!66623 lt!66619))))

(assert (=> b!128720 (= lt!66619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128720 (= lt!66623 (get!1453 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128720 (= lt!66621 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128720 (= lt!66618 call!13921)))

(assert (=> b!128720 (= e!84018 (+!159 call!13921 (tuple2!2561 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (get!1453 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128721 () Bool)

(declare-fun res!62117 () Bool)

(assert (=> b!128721 (=> (not res!62117) (not e!84017))))

(assert (=> b!128721 (= res!62117 (not (contains!873 lt!66622 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128722 () Bool)

(assert (=> b!128722 (= e!84016 (isEmpty!403 lt!66622))))

(assert (= (and d!38983 c!23649) b!128715))

(assert (= (and d!38983 (not c!23649)) b!128717))

(assert (= (and b!128717 c!23651) b!128720))

(assert (= (and b!128717 (not c!23651)) b!128719))

(assert (= (or b!128720 b!128719) bm!13918))

(assert (= (and d!38983 res!62118) b!128721))

(assert (= (and b!128721 res!62117) b!128712))

(assert (= (and b!128712 res!62116) b!128714))

(assert (= (and b!128712 c!23650) b!128711))

(assert (= (and b!128712 (not c!23650)) b!128713))

(assert (= (and b!128711 res!62119) b!128718))

(assert (= (and b!128713 c!23652) b!128716))

(assert (= (and b!128713 (not c!23652)) b!128722))

(declare-fun b_lambda!5685 () Bool)

(assert (=> (not b_lambda!5685) (not b!128718)))

(assert (=> b!128718 t!6080))

(declare-fun b_and!7941 () Bool)

(assert (= b_and!7937 (and (=> t!6080 result!3889) b_and!7941)))

(assert (=> b!128718 t!6082))

(declare-fun b_and!7943 () Bool)

(assert (= b_and!7939 (and (=> t!6082 result!3891) b_and!7943)))

(declare-fun b_lambda!5687 () Bool)

(assert (=> (not b_lambda!5687) (not b!128720)))

(assert (=> b!128720 t!6080))

(declare-fun b_and!7945 () Bool)

(assert (= b_and!7941 (and (=> t!6080 result!3889) b_and!7945)))

(assert (=> b!128720 t!6082))

(declare-fun b_and!7947 () Bool)

(assert (= b_and!7943 (and (=> t!6082 result!3891) b_and!7947)))

(declare-fun m!150619 () Bool)

(assert (=> b!128721 m!150619))

(assert (=> b!128717 m!149575))

(assert (=> b!128717 m!149575))

(assert (=> b!128717 m!149663))

(declare-fun m!150621 () Bool)

(assert (=> b!128720 m!150621))

(assert (=> b!128720 m!149777))

(assert (=> b!128720 m!149617))

(assert (=> b!128720 m!149779))

(declare-fun m!150623 () Bool)

(assert (=> b!128720 m!150623))

(declare-fun m!150625 () Bool)

(assert (=> b!128720 m!150625))

(assert (=> b!128720 m!149617))

(declare-fun m!150627 () Bool)

(assert (=> b!128720 m!150627))

(assert (=> b!128720 m!149575))

(assert (=> b!128720 m!149777))

(assert (=> b!128720 m!150623))

(assert (=> b!128714 m!149575))

(assert (=> b!128714 m!149575))

(assert (=> b!128714 m!149663))

(declare-fun m!150629 () Bool)

(assert (=> b!128722 m!150629))

(assert (=> b!128711 m!149575))

(assert (=> b!128711 m!149575))

(declare-fun m!150631 () Bool)

(assert (=> b!128711 m!150631))

(declare-fun m!150633 () Bool)

(assert (=> d!38983 m!150633))

(assert (=> d!38983 m!149585))

(declare-fun m!150635 () Bool)

(assert (=> bm!13918 m!150635))

(assert (=> b!128718 m!149777))

(assert (=> b!128718 m!149777))

(assert (=> b!128718 m!149617))

(assert (=> b!128718 m!149779))

(assert (=> b!128718 m!149617))

(assert (=> b!128718 m!149575))

(declare-fun m!150637 () Bool)

(assert (=> b!128718 m!150637))

(assert (=> b!128718 m!149575))

(assert (=> b!128716 m!150635))

(assert (=> b!128175 d!38983))

(declare-fun d!38985 () Bool)

(assert (=> d!38985 (= (apply!112 (+!159 lt!66262 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66252) (apply!112 lt!66262 lt!66252))))

(declare-fun lt!66624 () Unit!3980)

(assert (=> d!38985 (= lt!66624 (choose!785 lt!66262 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66252))))

(declare-fun e!84020 () Bool)

(assert (=> d!38985 e!84020))

(declare-fun res!62120 () Bool)

(assert (=> d!38985 (=> (not res!62120) (not e!84020))))

(assert (=> d!38985 (= res!62120 (contains!873 lt!66262 lt!66252))))

(assert (=> d!38985 (= (addApplyDifferent!88 lt!66262 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66252) lt!66624)))

(declare-fun b!128723 () Bool)

(assert (=> b!128723 (= e!84020 (not (= lt!66252 lt!66263)))))

(assert (= (and d!38985 res!62120) b!128723))

(assert (=> d!38985 m!149785))

(assert (=> d!38985 m!149797))

(declare-fun m!150639 () Bool)

(assert (=> d!38985 m!150639))

(assert (=> d!38985 m!149785))

(declare-fun m!150641 () Bool)

(assert (=> d!38985 m!150641))

(assert (=> d!38985 m!149795))

(assert (=> b!128175 d!38985))

(declare-fun d!38987 () Bool)

(assert (=> d!38987 (= (apply!112 lt!66264 lt!66244) (get!1456 (getValueByKey!166 (toList!844 lt!66264) lt!66244)))))

(declare-fun bs!5324 () Bool)

(assert (= bs!5324 d!38987))

(declare-fun m!150643 () Bool)

(assert (=> bs!5324 m!150643))

(assert (=> bs!5324 m!150643))

(declare-fun m!150645 () Bool)

(assert (=> bs!5324 m!150645))

(assert (=> b!128175 d!38987))

(declare-fun d!38989 () Bool)

(assert (=> d!38989 (= (apply!112 (+!159 lt!66264 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) lt!66244) (apply!112 lt!66264 lt!66244))))

(declare-fun lt!66625 () Unit!3980)

(assert (=> d!38989 (= lt!66625 (choose!785 lt!66264 lt!66259 (zeroValue!2665 newMap!16) lt!66244))))

(declare-fun e!84021 () Bool)

(assert (=> d!38989 e!84021))

(declare-fun res!62121 () Bool)

(assert (=> d!38989 (=> (not res!62121) (not e!84021))))

(assert (=> d!38989 (= res!62121 (contains!873 lt!66264 lt!66244))))

(assert (=> d!38989 (= (addApplyDifferent!88 lt!66264 lt!66259 (zeroValue!2665 newMap!16) lt!66244) lt!66625)))

(declare-fun b!128724 () Bool)

(assert (=> b!128724 (= e!84021 (not (= lt!66244 lt!66259)))))

(assert (= (and d!38989 res!62121) b!128724))

(assert (=> d!38989 m!149791))

(assert (=> d!38989 m!149809))

(declare-fun m!150647 () Bool)

(assert (=> d!38989 m!150647))

(assert (=> d!38989 m!149791))

(declare-fun m!150649 () Bool)

(assert (=> d!38989 m!150649))

(assert (=> d!38989 m!149807))

(assert (=> b!128175 d!38989))

(declare-fun d!38991 () Bool)

(assert (=> d!38991 (= (apply!112 (+!159 lt!66264 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16))) lt!66244) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66264 (tuple2!2561 lt!66259 (zeroValue!2665 newMap!16)))) lt!66244)))))

(declare-fun bs!5325 () Bool)

(assert (= bs!5325 d!38991))

(declare-fun m!150651 () Bool)

(assert (=> bs!5325 m!150651))

(assert (=> bs!5325 m!150651))

(declare-fun m!150653 () Bool)

(assert (=> bs!5325 m!150653))

(assert (=> b!128175 d!38991))

(declare-fun d!38993 () Bool)

(declare-fun e!84022 () Bool)

(assert (=> d!38993 e!84022))

(declare-fun res!62122 () Bool)

(assert (=> d!38993 (=> (not res!62122) (not e!84022))))

(declare-fun lt!66629 () ListLongMap!1657)

(assert (=> d!38993 (= res!62122 (contains!873 lt!66629 (_1!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66628 () List!1698)

(assert (=> d!38993 (= lt!66629 (ListLongMap!1658 lt!66628))))

(declare-fun lt!66627 () Unit!3980)

(declare-fun lt!66626 () Unit!3980)

(assert (=> d!38993 (= lt!66627 lt!66626)))

(assert (=> d!38993 (= (getValueByKey!166 lt!66628 (_1!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38993 (= lt!66626 (lemmaContainsTupThenGetReturnValue!84 lt!66628 (_1!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38993 (= lt!66628 (insertStrictlySorted!87 (toList!844 lt!66255) (_1!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))))))

(assert (=> d!38993 (= (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) lt!66629)))

(declare-fun b!128725 () Bool)

(declare-fun res!62123 () Bool)

(assert (=> b!128725 (=> (not res!62123) (not e!84022))))

(assert (=> b!128725 (= res!62123 (= (getValueByKey!166 (toList!844 lt!66629) (_1!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))))))))

(declare-fun b!128726 () Bool)

(assert (=> b!128726 (= e!84022 (contains!874 (toList!844 lt!66629) (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))))))

(assert (= (and d!38993 res!62122) b!128725))

(assert (= (and b!128725 res!62123) b!128726))

(declare-fun m!150655 () Bool)

(assert (=> d!38993 m!150655))

(declare-fun m!150657 () Bool)

(assert (=> d!38993 m!150657))

(declare-fun m!150659 () Bool)

(assert (=> d!38993 m!150659))

(declare-fun m!150661 () Bool)

(assert (=> d!38993 m!150661))

(declare-fun m!150663 () Bool)

(assert (=> b!128725 m!150663))

(declare-fun m!150665 () Bool)

(assert (=> b!128726 m!150665))

(assert (=> b!128175 d!38993))

(declare-fun d!38995 () Bool)

(assert (=> d!38995 (= (apply!112 lt!66262 lt!66252) (get!1456 (getValueByKey!166 (toList!844 lt!66262) lt!66252)))))

(declare-fun bs!5326 () Bool)

(assert (= bs!5326 d!38995))

(declare-fun m!150667 () Bool)

(assert (=> bs!5326 m!150667))

(assert (=> bs!5326 m!150667))

(declare-fun m!150669 () Bool)

(assert (=> bs!5326 m!150669))

(assert (=> b!128175 d!38995))

(declare-fun d!38997 () Bool)

(declare-fun e!84024 () Bool)

(assert (=> d!38997 e!84024))

(declare-fun res!62124 () Bool)

(assert (=> d!38997 (=> res!62124 e!84024)))

(declare-fun lt!66632 () Bool)

(assert (=> d!38997 (= res!62124 (not lt!66632))))

(declare-fun lt!66633 () Bool)

(assert (=> d!38997 (= lt!66632 lt!66633)))

(declare-fun lt!66631 () Unit!3980)

(declare-fun e!84023 () Unit!3980)

(assert (=> d!38997 (= lt!66631 e!84023)))

(declare-fun c!23653 () Bool)

(assert (=> d!38997 (= c!23653 lt!66633)))

(assert (=> d!38997 (= lt!66633 (containsKey!170 (toList!844 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) lt!66260))))

(assert (=> d!38997 (= (contains!873 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) lt!66260) lt!66632)))

(declare-fun b!128727 () Bool)

(declare-fun lt!66630 () Unit!3980)

(assert (=> b!128727 (= e!84023 lt!66630)))

(assert (=> b!128727 (= lt!66630 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) lt!66260))))

(assert (=> b!128727 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) lt!66260))))

(declare-fun b!128728 () Bool)

(declare-fun Unit!4009 () Unit!3980)

(assert (=> b!128728 (= e!84023 Unit!4009)))

(declare-fun b!128729 () Bool)

(assert (=> b!128729 (= e!84024 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16)))) lt!66260)))))

(assert (= (and d!38997 c!23653) b!128727))

(assert (= (and d!38997 (not c!23653)) b!128728))

(assert (= (and d!38997 (not res!62124)) b!128729))

(declare-fun m!150671 () Bool)

(assert (=> d!38997 m!150671))

(declare-fun m!150673 () Bool)

(assert (=> b!128727 m!150673))

(declare-fun m!150675 () Bool)

(assert (=> b!128727 m!150675))

(assert (=> b!128727 m!150675))

(declare-fun m!150677 () Bool)

(assert (=> b!128727 m!150677))

(assert (=> b!128729 m!150675))

(assert (=> b!128729 m!150675))

(assert (=> b!128729 m!150677))

(assert (=> b!128175 d!38997))

(declare-fun d!38999 () Bool)

(declare-fun e!84025 () Bool)

(assert (=> d!38999 e!84025))

(declare-fun res!62125 () Bool)

(assert (=> d!38999 (=> (not res!62125) (not e!84025))))

(declare-fun lt!66637 () ListLongMap!1657)

(assert (=> d!38999 (= res!62125 (contains!873 lt!66637 (_1!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!66636 () List!1698)

(assert (=> d!38999 (= lt!66637 (ListLongMap!1658 lt!66636))))

(declare-fun lt!66635 () Unit!3980)

(declare-fun lt!66634 () Unit!3980)

(assert (=> d!38999 (= lt!66635 lt!66634)))

(assert (=> d!38999 (= (getValueByKey!166 lt!66636 (_1!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!38999 (= lt!66634 (lemmaContainsTupThenGetReturnValue!84 lt!66636 (_1!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!38999 (= lt!66636 (insertStrictlySorted!87 (toList!844 lt!66262) (_1!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!38999 (= (+!159 lt!66262 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66637)))

(declare-fun b!128730 () Bool)

(declare-fun res!62126 () Bool)

(assert (=> b!128730 (=> (not res!62126) (not e!84025))))

(assert (=> b!128730 (= res!62126 (= (getValueByKey!166 (toList!844 lt!66637) (_1!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!128731 () Bool)

(assert (=> b!128731 (= e!84025 (contains!874 (toList!844 lt!66637) (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!38999 res!62125) b!128730))

(assert (= (and b!128730 res!62126) b!128731))

(declare-fun m!150679 () Bool)

(assert (=> d!38999 m!150679))

(declare-fun m!150681 () Bool)

(assert (=> d!38999 m!150681))

(declare-fun m!150683 () Bool)

(assert (=> d!38999 m!150683))

(declare-fun m!150685 () Bool)

(assert (=> d!38999 m!150685))

(declare-fun m!150687 () Bool)

(assert (=> b!128730 m!150687))

(declare-fun m!150689 () Bool)

(assert (=> b!128731 m!150689))

(assert (=> b!128175 d!38999))

(declare-fun d!39001 () Bool)

(assert (=> d!39001 (= (apply!112 lt!66251 lt!66257) (get!1456 (getValueByKey!166 (toList!844 lt!66251) lt!66257)))))

(declare-fun bs!5327 () Bool)

(assert (= bs!5327 d!39001))

(declare-fun m!150691 () Bool)

(assert (=> bs!5327 m!150691))

(assert (=> bs!5327 m!150691))

(declare-fun m!150693 () Bool)

(assert (=> bs!5327 m!150693))

(assert (=> b!128175 d!39001))

(declare-fun d!39003 () Bool)

(assert (=> d!39003 (= (apply!112 (+!159 lt!66251 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66257) (apply!112 lt!66251 lt!66257))))

(declare-fun lt!66638 () Unit!3980)

(assert (=> d!39003 (= lt!66638 (choose!785 lt!66251 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66257))))

(declare-fun e!84026 () Bool)

(assert (=> d!39003 e!84026))

(declare-fun res!62127 () Bool)

(assert (=> d!39003 (=> (not res!62127) (not e!84026))))

(assert (=> d!39003 (= res!62127 (contains!873 lt!66251 lt!66257))))

(assert (=> d!39003 (= (addApplyDifferent!88 lt!66251 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66257) lt!66638)))

(declare-fun b!128732 () Bool)

(assert (=> b!128732 (= e!84026 (not (= lt!66257 lt!66247)))))

(assert (= (and d!39003 res!62127) b!128732))

(assert (=> d!39003 m!149811))

(assert (=> d!39003 m!149815))

(declare-fun m!150695 () Bool)

(assert (=> d!39003 m!150695))

(assert (=> d!39003 m!149811))

(declare-fun m!150697 () Bool)

(assert (=> d!39003 m!150697))

(assert (=> d!39003 m!149789))

(assert (=> b!128175 d!39003))

(declare-fun d!39005 () Bool)

(assert (=> d!39005 (contains!873 (+!159 lt!66255 (tuple2!2561 lt!66253 (zeroValue!2665 newMap!16))) lt!66260)))

(declare-fun lt!66639 () Unit!3980)

(assert (=> d!39005 (= lt!66639 (choose!786 lt!66255 lt!66253 (zeroValue!2665 newMap!16) lt!66260))))

(assert (=> d!39005 (contains!873 lt!66255 lt!66260)))

(assert (=> d!39005 (= (addStillContains!88 lt!66255 lt!66253 (zeroValue!2665 newMap!16) lt!66260) lt!66639)))

(declare-fun bs!5328 () Bool)

(assert (= bs!5328 d!39005))

(assert (=> bs!5328 m!149803))

(assert (=> bs!5328 m!149803))

(assert (=> bs!5328 m!149805))

(declare-fun m!150699 () Bool)

(assert (=> bs!5328 m!150699))

(declare-fun m!150701 () Bool)

(assert (=> bs!5328 m!150701))

(assert (=> b!128175 d!39005))

(declare-fun d!39007 () Bool)

(declare-fun e!84027 () Bool)

(assert (=> d!39007 e!84027))

(declare-fun res!62128 () Bool)

(assert (=> d!39007 (=> (not res!62128) (not e!84027))))

(declare-fun lt!66643 () ListLongMap!1657)

(assert (=> d!39007 (= res!62128 (contains!873 lt!66643 (_1!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!66642 () List!1698)

(assert (=> d!39007 (= lt!66643 (ListLongMap!1658 lt!66642))))

(declare-fun lt!66641 () Unit!3980)

(declare-fun lt!66640 () Unit!3980)

(assert (=> d!39007 (= lt!66641 lt!66640)))

(assert (=> d!39007 (= (getValueByKey!166 lt!66642 (_1!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39007 (= lt!66640 (lemmaContainsTupThenGetReturnValue!84 lt!66642 (_1!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39007 (= lt!66642 (insertStrictlySorted!87 (toList!844 lt!66251) (_1!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39007 (= (+!159 lt!66251 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66643)))

(declare-fun b!128733 () Bool)

(declare-fun res!62129 () Bool)

(assert (=> b!128733 (=> (not res!62129) (not e!84027))))

(assert (=> b!128733 (= res!62129 (= (getValueByKey!166 (toList!844 lt!66643) (_1!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!128734 () Bool)

(assert (=> b!128734 (= e!84027 (contains!874 (toList!844 lt!66643) (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!39007 res!62128) b!128733))

(assert (= (and b!128733 res!62129) b!128734))

(declare-fun m!150703 () Bool)

(assert (=> d!39007 m!150703))

(declare-fun m!150705 () Bool)

(assert (=> d!39007 m!150705))

(declare-fun m!150707 () Bool)

(assert (=> d!39007 m!150707))

(declare-fun m!150709 () Bool)

(assert (=> d!39007 m!150709))

(declare-fun m!150711 () Bool)

(assert (=> b!128733 m!150711))

(declare-fun m!150713 () Bool)

(assert (=> b!128734 m!150713))

(assert (=> b!128175 d!39007))

(declare-fun d!39009 () Bool)

(assert (=> d!39009 (= (apply!112 (+!159 lt!66251 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66257) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66251 (tuple2!2561 lt!66247 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!66257)))))

(declare-fun bs!5329 () Bool)

(assert (= bs!5329 d!39009))

(declare-fun m!150715 () Bool)

(assert (=> bs!5329 m!150715))

(assert (=> bs!5329 m!150715))

(declare-fun m!150717 () Bool)

(assert (=> bs!5329 m!150717))

(assert (=> b!128175 d!39009))

(declare-fun d!39011 () Bool)

(assert (=> d!39011 (= (apply!112 (+!159 lt!66262 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66252) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66262 (tuple2!2561 lt!66263 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!66252)))))

(declare-fun bs!5330 () Bool)

(assert (= bs!5330 d!39011))

(declare-fun m!150719 () Bool)

(assert (=> bs!5330 m!150719))

(assert (=> bs!5330 m!150719))

(declare-fun m!150721 () Bool)

(assert (=> bs!5330 m!150721))

(assert (=> b!128175 d!39011))

(declare-fun d!39013 () Bool)

(declare-fun e!84029 () Bool)

(assert (=> d!39013 e!84029))

(declare-fun res!62130 () Bool)

(assert (=> d!39013 (=> res!62130 e!84029)))

(declare-fun lt!66646 () Bool)

(assert (=> d!39013 (= res!62130 (not lt!66646))))

(declare-fun lt!66647 () Bool)

(assert (=> d!39013 (= lt!66646 lt!66647)))

(declare-fun lt!66645 () Unit!3980)

(declare-fun e!84028 () Unit!3980)

(assert (=> d!39013 (= lt!66645 e!84028)))

(declare-fun c!23654 () Bool)

(assert (=> d!39013 (= c!23654 lt!66647)))

(assert (=> d!39013 (= lt!66647 (containsKey!170 (toList!844 lt!66227) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39013 (= (contains!873 lt!66227 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66646)))

(declare-fun b!128735 () Bool)

(declare-fun lt!66644 () Unit!3980)

(assert (=> b!128735 (= e!84028 lt!66644)))

(assert (=> b!128735 (= lt!66644 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66227) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128735 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128736 () Bool)

(declare-fun Unit!4010 () Unit!3980)

(assert (=> b!128736 (= e!84028 Unit!4010)))

(declare-fun b!128737 () Bool)

(assert (=> b!128737 (= e!84029 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39013 c!23654) b!128735))

(assert (= (and d!39013 (not c!23654)) b!128736))

(assert (= (and d!39013 (not res!62130)) b!128737))

(declare-fun m!150723 () Bool)

(assert (=> d!39013 m!150723))

(declare-fun m!150725 () Bool)

(assert (=> b!128735 m!150725))

(declare-fun m!150727 () Bool)

(assert (=> b!128735 m!150727))

(assert (=> b!128735 m!150727))

(declare-fun m!150729 () Bool)

(assert (=> b!128735 m!150729))

(assert (=> b!128737 m!150727))

(assert (=> b!128737 m!150727))

(assert (=> b!128737 m!150729))

(assert (=> bm!13840 d!39013))

(declare-fun d!39015 () Bool)

(declare-fun e!84031 () Bool)

(assert (=> d!39015 e!84031))

(declare-fun res!62131 () Bool)

(assert (=> d!39015 (=> res!62131 e!84031)))

(declare-fun lt!66650 () Bool)

(assert (=> d!39015 (= res!62131 (not lt!66650))))

(declare-fun lt!66651 () Bool)

(assert (=> d!39015 (= lt!66650 lt!66651)))

(declare-fun lt!66649 () Unit!3980)

(declare-fun e!84030 () Unit!3980)

(assert (=> d!39015 (= lt!66649 e!84030)))

(declare-fun c!23655 () Bool)

(assert (=> d!39015 (= c!23655 lt!66651)))

(assert (=> d!39015 (= lt!66651 (containsKey!170 (toList!844 lt!66227) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39015 (= (contains!873 lt!66227 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) lt!66650)))

(declare-fun b!128738 () Bool)

(declare-fun lt!66648 () Unit!3980)

(assert (=> b!128738 (= e!84030 lt!66648)))

(assert (=> b!128738 (= lt!66648 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66227) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128738 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128739 () Bool)

(declare-fun Unit!4011 () Unit!3980)

(assert (=> b!128739 (= e!84030 Unit!4011)))

(declare-fun b!128740 () Bool)

(assert (=> b!128740 (= e!84031 (isDefined!120 (getValueByKey!166 (toList!844 lt!66227) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39015 c!23655) b!128738))

(assert (= (and d!39015 (not c!23655)) b!128739))

(assert (= (and d!39015 (not res!62131)) b!128740))

(assert (=> d!39015 m!149575))

(declare-fun m!150731 () Bool)

(assert (=> d!39015 m!150731))

(assert (=> b!128738 m!149575))

(declare-fun m!150733 () Bool)

(assert (=> b!128738 m!150733))

(assert (=> b!128738 m!149575))

(assert (=> b!128738 m!150157))

(assert (=> b!128738 m!150157))

(declare-fun m!150735 () Bool)

(assert (=> b!128738 m!150735))

(assert (=> b!128740 m!149575))

(assert (=> b!128740 m!150157))

(assert (=> b!128740 m!150157))

(assert (=> b!128740 m!150735))

(assert (=> b!128149 d!39015))

(declare-fun d!39017 () Bool)

(assert (=> d!39017 (= (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061)) (not (isEmpty!404 (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))))

(declare-fun bs!5331 () Bool)

(assert (= bs!5331 d!39017))

(assert (=> bs!5331 m!149979))

(declare-fun m!150737 () Bool)

(assert (=> bs!5331 m!150737))

(assert (=> b!128282 d!39017))

(declare-fun e!84032 () Option!172)

(declare-fun b!128741 () Bool)

(assert (=> b!128741 (= e!84032 (Some!171 (_2!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(declare-fun b!128744 () Bool)

(declare-fun e!84033 () Option!172)

(assert (=> b!128744 (= e!84033 None!170)))

(declare-fun b!128743 () Bool)

(assert (=> b!128743 (= e!84033 (getValueByKey!166 (t!6068 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66061))))

(declare-fun c!23656 () Bool)

(declare-fun d!39019 () Bool)

(assert (=> d!39019 (= c!23656 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66061)))))

(assert (=> d!39019 (= (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061) e!84032)))

(declare-fun b!128742 () Bool)

(assert (=> b!128742 (= e!84032 e!84033)))

(declare-fun c!23657 () Bool)

(assert (=> b!128742 (= c!23657 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (not (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66061))))))

(assert (= (and d!39019 c!23656) b!128741))

(assert (= (and d!39019 (not c!23656)) b!128742))

(assert (= (and b!128742 c!23657) b!128743))

(assert (= (and b!128742 (not c!23657)) b!128744))

(declare-fun m!150739 () Bool)

(assert (=> b!128743 m!150739))

(assert (=> b!128282 d!39019))

(declare-fun d!39021 () Bool)

(declare-fun e!84035 () Bool)

(assert (=> d!39021 e!84035))

(declare-fun res!62132 () Bool)

(assert (=> d!39021 (=> res!62132 e!84035)))

(declare-fun lt!66654 () Bool)

(assert (=> d!39021 (= res!62132 (not lt!66654))))

(declare-fun lt!66655 () Bool)

(assert (=> d!39021 (= lt!66654 lt!66655)))

(declare-fun lt!66653 () Unit!3980)

(declare-fun e!84034 () Unit!3980)

(assert (=> d!39021 (= lt!66653 e!84034)))

(declare-fun c!23658 () Bool)

(assert (=> d!39021 (= c!23658 lt!66655)))

(assert (=> d!39021 (= lt!66655 (containsKey!170 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!39021 (= (contains!873 lt!66212 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66654)))

(declare-fun b!128745 () Bool)

(declare-fun lt!66652 () Unit!3980)

(assert (=> b!128745 (= e!84034 lt!66652)))

(assert (=> b!128745 (= lt!66652 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!128745 (isDefined!120 (getValueByKey!166 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128746 () Bool)

(declare-fun Unit!4012 () Unit!3980)

(assert (=> b!128746 (= e!84034 Unit!4012)))

(declare-fun b!128747 () Bool)

(assert (=> b!128747 (= e!84035 (isDefined!120 (getValueByKey!166 (toList!844 lt!66212) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39021 c!23658) b!128745))

(assert (= (and d!39021 (not c!23658)) b!128746))

(assert (= (and d!39021 (not res!62132)) b!128747))

(declare-fun m!150741 () Bool)

(assert (=> d!39021 m!150741))

(declare-fun m!150743 () Bool)

(assert (=> b!128745 m!150743))

(assert (=> b!128745 m!149703))

(assert (=> b!128745 m!149703))

(declare-fun m!150745 () Bool)

(assert (=> b!128745 m!150745))

(assert (=> b!128747 m!149703))

(assert (=> b!128747 m!149703))

(assert (=> b!128747 m!150745))

(assert (=> d!38721 d!39021))

(declare-fun b!128748 () Bool)

(declare-fun e!84036 () Option!172)

(assert (=> b!128748 (= e!84036 (Some!171 (_2!1291 (h!2297 lt!66211))))))

(declare-fun b!128751 () Bool)

(declare-fun e!84037 () Option!172)

(assert (=> b!128751 (= e!84037 None!170)))

(declare-fun b!128750 () Bool)

(assert (=> b!128750 (= e!84037 (getValueByKey!166 (t!6068 lt!66211) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!39023 () Bool)

(declare-fun c!23659 () Bool)

(assert (=> d!39023 (= c!23659 (and ((_ is Cons!1694) lt!66211) (= (_1!1291 (h!2297 lt!66211)) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39023 (= (getValueByKey!166 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!84036)))

(declare-fun b!128749 () Bool)

(assert (=> b!128749 (= e!84036 e!84037)))

(declare-fun c!23660 () Bool)

(assert (=> b!128749 (= c!23660 (and ((_ is Cons!1694) lt!66211) (not (= (_1!1291 (h!2297 lt!66211)) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39023 c!23659) b!128748))

(assert (= (and d!39023 (not c!23659)) b!128749))

(assert (= (and b!128749 c!23660) b!128750))

(assert (= (and b!128749 (not c!23660)) b!128751))

(declare-fun m!150747 () Bool)

(assert (=> b!128750 m!150747))

(assert (=> d!38721 d!39023))

(declare-fun d!39025 () Bool)

(assert (=> d!39025 (= (getValueByKey!166 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66656 () Unit!3980)

(assert (=> d!39025 (= lt!66656 (choose!790 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!84038 () Bool)

(assert (=> d!39025 e!84038))

(declare-fun res!62133 () Bool)

(assert (=> d!39025 (=> (not res!62133) (not e!84038))))

(assert (=> d!39025 (= res!62133 (isStrictlySorted!313 lt!66211))))

(assert (=> d!39025 (= (lemmaContainsTupThenGetReturnValue!84 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66656)))

(declare-fun b!128752 () Bool)

(declare-fun res!62134 () Bool)

(assert (=> b!128752 (=> (not res!62134) (not e!84038))))

(assert (=> b!128752 (= res!62134 (containsKey!170 lt!66211 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128753 () Bool)

(assert (=> b!128753 (= e!84038 (contains!874 lt!66211 (tuple2!2561 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39025 res!62133) b!128752))

(assert (= (and b!128752 res!62134) b!128753))

(assert (=> d!39025 m!149697))

(declare-fun m!150749 () Bool)

(assert (=> d!39025 m!150749))

(declare-fun m!150751 () Bool)

(assert (=> d!39025 m!150751))

(declare-fun m!150753 () Bool)

(assert (=> b!128752 m!150753))

(declare-fun m!150755 () Bool)

(assert (=> b!128753 m!150755))

(assert (=> d!38721 d!39025))

(declare-fun b!128754 () Bool)

(declare-fun e!84043 () List!1698)

(declare-fun call!13922 () List!1698)

(assert (=> b!128754 (= e!84043 call!13922)))

(declare-fun b!128755 () Bool)

(declare-fun e!84039 () List!1698)

(declare-fun call!13924 () List!1698)

(assert (=> b!128755 (= e!84039 call!13924)))

(declare-fun b!128756 () Bool)

(declare-fun e!84041 () Bool)

(declare-fun lt!66657 () List!1698)

(assert (=> b!128756 (= e!84041 (contains!874 lt!66657 (tuple2!2561 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128757 () Bool)

(declare-fun e!84040 () List!1698)

(assert (=> b!128757 (= e!84040 (insertStrictlySorted!87 (t!6068 (toList!844 call!13763)) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun bm!13919 () Bool)

(declare-fun call!13923 () List!1698)

(assert (=> bm!13919 (= call!13924 call!13923)))

(declare-fun b!128758 () Bool)

(declare-fun e!84042 () List!1698)

(assert (=> b!128758 (= e!84042 call!13923)))

(declare-fun c!23662 () Bool)

(declare-fun bm!13920 () Bool)

(assert (=> bm!13920 (= call!13922 ($colon$colon!89 e!84040 (ite c!23662 (h!2297 (toList!844 call!13763)) (tuple2!2561 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23664 () Bool)

(assert (=> bm!13920 (= c!23664 c!23662)))

(declare-fun b!128759 () Bool)

(assert (=> b!128759 (= e!84043 e!84042)))

(declare-fun c!23663 () Bool)

(assert (=> b!128759 (= c!23663 (and ((_ is Cons!1694) (toList!844 call!13763)) (= (_1!1291 (h!2297 (toList!844 call!13763))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128760 () Bool)

(declare-fun c!23661 () Bool)

(assert (=> b!128760 (= c!23661 (and ((_ is Cons!1694) (toList!844 call!13763)) (bvsgt (_1!1291 (h!2297 (toList!844 call!13763))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!128760 (= e!84042 e!84039)))

(declare-fun b!128761 () Bool)

(assert (=> b!128761 (= e!84040 (ite c!23663 (t!6068 (toList!844 call!13763)) (ite c!23661 (Cons!1694 (h!2297 (toList!844 call!13763)) (t!6068 (toList!844 call!13763))) Nil!1695)))))

(declare-fun b!128762 () Bool)

(declare-fun res!62135 () Bool)

(assert (=> b!128762 (=> (not res!62135) (not e!84041))))

(assert (=> b!128762 (= res!62135 (containsKey!170 lt!66657 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128763 () Bool)

(assert (=> b!128763 (= e!84039 call!13924)))

(declare-fun bm!13921 () Bool)

(assert (=> bm!13921 (= call!13923 call!13922)))

(declare-fun d!39027 () Bool)

(assert (=> d!39027 e!84041))

(declare-fun res!62136 () Bool)

(assert (=> d!39027 (=> (not res!62136) (not e!84041))))

(assert (=> d!39027 (= res!62136 (isStrictlySorted!313 lt!66657))))

(assert (=> d!39027 (= lt!66657 e!84043)))

(assert (=> d!39027 (= c!23662 (and ((_ is Cons!1694) (toList!844 call!13763)) (bvslt (_1!1291 (h!2297 (toList!844 call!13763))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39027 (isStrictlySorted!313 (toList!844 call!13763))))

(assert (=> d!39027 (= (insertStrictlySorted!87 (toList!844 call!13763) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66657)))

(assert (= (and d!39027 c!23662) b!128754))

(assert (= (and d!39027 (not c!23662)) b!128759))

(assert (= (and b!128759 c!23663) b!128758))

(assert (= (and b!128759 (not c!23663)) b!128760))

(assert (= (and b!128760 c!23661) b!128763))

(assert (= (and b!128760 (not c!23661)) b!128755))

(assert (= (or b!128763 b!128755) bm!13919))

(assert (= (or b!128758 bm!13919) bm!13921))

(assert (= (or b!128754 bm!13921) bm!13920))

(assert (= (and bm!13920 c!23664) b!128757))

(assert (= (and bm!13920 (not c!23664)) b!128761))

(assert (= (and d!39027 res!62136) b!128762))

(assert (= (and b!128762 res!62135) b!128756))

(declare-fun m!150757 () Bool)

(assert (=> b!128757 m!150757))

(declare-fun m!150759 () Bool)

(assert (=> bm!13920 m!150759))

(declare-fun m!150761 () Bool)

(assert (=> b!128762 m!150761))

(declare-fun m!150763 () Bool)

(assert (=> d!39027 m!150763))

(declare-fun m!150765 () Bool)

(assert (=> d!39027 m!150765))

(declare-fun m!150767 () Bool)

(assert (=> b!128756 m!150767))

(assert (=> d!38721 d!39027))

(assert (=> b!128261 d!38711))

(assert (=> d!38751 d!38743))

(assert (=> d!38751 d!38763))

(assert (=> d!38751 d!38771))

(declare-fun d!39029 () Bool)

(assert (=> d!39029 (= (apply!112 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66045) (apply!112 lt!66065 lt!66045))))

(assert (=> d!39029 true))

(declare-fun _$34!958 () Unit!3980)

(assert (=> d!39029 (= (choose!785 lt!66065 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66045) _$34!958)))

(declare-fun bs!5332 () Bool)

(assert (= bs!5332 d!39029))

(assert (=> bs!5332 m!149459))

(assert (=> bs!5332 m!149459))

(assert (=> bs!5332 m!149477))

(assert (=> bs!5332 m!149475))

(assert (=> d!38751 d!39029))

(declare-fun d!39031 () Bool)

(declare-fun e!84045 () Bool)

(assert (=> d!39031 e!84045))

(declare-fun res!62137 () Bool)

(assert (=> d!39031 (=> res!62137 e!84045)))

(declare-fun lt!66660 () Bool)

(assert (=> d!39031 (= res!62137 (not lt!66660))))

(declare-fun lt!66661 () Bool)

(assert (=> d!39031 (= lt!66660 lt!66661)))

(declare-fun lt!66659 () Unit!3980)

(declare-fun e!84044 () Unit!3980)

(assert (=> d!39031 (= lt!66659 e!84044)))

(declare-fun c!23665 () Bool)

(assert (=> d!39031 (= c!23665 lt!66661)))

(assert (=> d!39031 (= lt!66661 (containsKey!170 (toList!844 lt!66065) lt!66045))))

(assert (=> d!39031 (= (contains!873 lt!66065 lt!66045) lt!66660)))

(declare-fun b!128765 () Bool)

(declare-fun lt!66658 () Unit!3980)

(assert (=> b!128765 (= e!84044 lt!66658)))

(assert (=> b!128765 (= lt!66658 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66065) lt!66045))))

(assert (=> b!128765 (isDefined!120 (getValueByKey!166 (toList!844 lt!66065) lt!66045))))

(declare-fun b!128766 () Bool)

(declare-fun Unit!4013 () Unit!3980)

(assert (=> b!128766 (= e!84044 Unit!4013)))

(declare-fun b!128767 () Bool)

(assert (=> b!128767 (= e!84045 (isDefined!120 (getValueByKey!166 (toList!844 lt!66065) lt!66045)))))

(assert (= (and d!39031 c!23665) b!128765))

(assert (= (and d!39031 (not c!23665)) b!128766))

(assert (= (and d!39031 (not res!62137)) b!128767))

(declare-fun m!150769 () Bool)

(assert (=> d!39031 m!150769))

(declare-fun m!150771 () Bool)

(assert (=> b!128765 m!150771))

(assert (=> b!128765 m!149971))

(assert (=> b!128765 m!149971))

(declare-fun m!150773 () Bool)

(assert (=> b!128765 m!150773))

(assert (=> b!128767 m!149971))

(assert (=> b!128767 m!149971))

(assert (=> b!128767 m!150773))

(assert (=> d!38751 d!39031))

(assert (=> b!128171 d!38879))

(assert (=> b!128338 d!38947))

(declare-fun d!39033 () Bool)

(declare-fun e!84046 () Bool)

(assert (=> d!39033 e!84046))

(declare-fun res!62138 () Bool)

(assert (=> d!39033 (=> (not res!62138) (not e!84046))))

(declare-fun lt!66665 () ListLongMap!1657)

(assert (=> d!39033 (= res!62138 (contains!873 lt!66665 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66664 () List!1698)

(assert (=> d!39033 (= lt!66665 (ListLongMap!1658 lt!66664))))

(declare-fun lt!66663 () Unit!3980)

(declare-fun lt!66662 () Unit!3980)

(assert (=> d!39033 (= lt!66663 lt!66662)))

(assert (=> d!39033 (= (getValueByKey!166 lt!66664 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39033 (= lt!66662 (lemmaContainsTupThenGetReturnValue!84 lt!66664 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39033 (= lt!66664 (insertStrictlySorted!87 (toList!844 (map!1377 newMap!16)) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39033 (= (+!159 (map!1377 newMap!16) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66665)))

(declare-fun b!128768 () Bool)

(declare-fun res!62139 () Bool)

(assert (=> b!128768 (=> (not res!62139) (not e!84046))))

(assert (=> b!128768 (= res!62139 (= (getValueByKey!166 (toList!844 lt!66665) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128769 () Bool)

(assert (=> b!128769 (= e!84046 (contains!874 (toList!844 lt!66665) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39033 res!62138) b!128768))

(assert (= (and b!128768 res!62139) b!128769))

(declare-fun m!150775 () Bool)

(assert (=> d!39033 m!150775))

(declare-fun m!150777 () Bool)

(assert (=> d!39033 m!150777))

(declare-fun m!150779 () Bool)

(assert (=> d!39033 m!150779))

(declare-fun m!150781 () Bool)

(assert (=> d!39033 m!150781))

(declare-fun m!150783 () Bool)

(assert (=> b!128768 m!150783))

(declare-fun m!150785 () Bool)

(assert (=> b!128769 m!150785))

(assert (=> b!128338 d!39033))

(assert (=> b!128338 d!38673))

(declare-fun d!39035 () Bool)

(declare-fun e!84048 () Bool)

(assert (=> d!39035 e!84048))

(declare-fun res!62140 () Bool)

(assert (=> d!39035 (=> res!62140 e!84048)))

(declare-fun lt!66668 () Bool)

(assert (=> d!39035 (= res!62140 (not lt!66668))))

(declare-fun lt!66669 () Bool)

(assert (=> d!39035 (= lt!66668 lt!66669)))

(declare-fun lt!66667 () Unit!3980)

(declare-fun e!84047 () Unit!3980)

(assert (=> d!39035 (= lt!66667 e!84047)))

(declare-fun c!23666 () Bool)

(assert (=> d!39035 (= c!23666 lt!66669)))

(assert (=> d!39035 (= lt!66669 (containsKey!170 (toList!844 lt!66181) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39035 (= (contains!873 lt!66181 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) lt!66668)))

(declare-fun b!128770 () Bool)

(declare-fun lt!66666 () Unit!3980)

(assert (=> b!128770 (= e!84047 lt!66666)))

(assert (=> b!128770 (= lt!66666 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66181) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128770 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128771 () Bool)

(declare-fun Unit!4014 () Unit!3980)

(assert (=> b!128771 (= e!84047 Unit!4014)))

(declare-fun b!128772 () Bool)

(assert (=> b!128772 (= e!84048 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39035 c!23666) b!128770))

(assert (= (and d!39035 (not c!23666)) b!128771))

(assert (= (and d!39035 (not res!62140)) b!128772))

(assert (=> d!39035 m!149575))

(declare-fun m!150787 () Bool)

(assert (=> d!39035 m!150787))

(assert (=> b!128770 m!149575))

(declare-fun m!150789 () Bool)

(assert (=> b!128770 m!150789))

(assert (=> b!128770 m!149575))

(assert (=> b!128770 m!150445))

(assert (=> b!128770 m!150445))

(declare-fun m!150791 () Bool)

(assert (=> b!128770 m!150791))

(assert (=> b!128772 m!149575))

(assert (=> b!128772 m!150445))

(assert (=> b!128772 m!150445))

(assert (=> b!128772 m!150791))

(assert (=> b!128099 d!39035))

(declare-fun d!39037 () Bool)

(declare-fun e!84050 () Bool)

(assert (=> d!39037 e!84050))

(declare-fun res!62141 () Bool)

(assert (=> d!39037 (=> res!62141 e!84050)))

(declare-fun lt!66672 () Bool)

(assert (=> d!39037 (= res!62141 (not lt!66672))))

(declare-fun lt!66673 () Bool)

(assert (=> d!39037 (= lt!66672 lt!66673)))

(declare-fun lt!66671 () Unit!3980)

(declare-fun e!84049 () Unit!3980)

(assert (=> d!39037 (= lt!66671 e!84049)))

(declare-fun c!23667 () Bool)

(assert (=> d!39037 (= c!23667 lt!66673)))

(assert (=> d!39037 (= lt!66673 (containsKey!170 (toList!844 lt!66181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39037 (= (contains!873 lt!66181 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66672)))

(declare-fun b!128773 () Bool)

(declare-fun lt!66670 () Unit!3980)

(assert (=> b!128773 (= e!84049 lt!66670)))

(assert (=> b!128773 (= lt!66670 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128773 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128774 () Bool)

(declare-fun Unit!4015 () Unit!3980)

(assert (=> b!128774 (= e!84049 Unit!4015)))

(declare-fun b!128775 () Bool)

(assert (=> b!128775 (= e!84050 (isDefined!120 (getValueByKey!166 (toList!844 lt!66181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39037 c!23667) b!128773))

(assert (= (and d!39037 (not c!23667)) b!128774))

(assert (= (and d!39037 (not res!62141)) b!128775))

(declare-fun m!150793 () Bool)

(assert (=> d!39037 m!150793))

(declare-fun m!150795 () Bool)

(assert (=> b!128773 m!150795))

(declare-fun m!150797 () Bool)

(assert (=> b!128773 m!150797))

(assert (=> b!128773 m!150797))

(declare-fun m!150799 () Bool)

(assert (=> b!128773 m!150799))

(assert (=> b!128775 m!150797))

(assert (=> b!128775 m!150797))

(assert (=> b!128775 m!150799))

(assert (=> bm!13833 d!39037))

(declare-fun d!39039 () Bool)

(declare-fun e!84051 () Bool)

(assert (=> d!39039 e!84051))

(declare-fun res!62142 () Bool)

(assert (=> d!39039 (=> (not res!62142) (not e!84051))))

(declare-fun lt!66677 () ListLongMap!1657)

(assert (=> d!39039 (= res!62142 (contains!873 lt!66677 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!66676 () List!1698)

(assert (=> d!39039 (= lt!66677 (ListLongMap!1658 lt!66676))))

(declare-fun lt!66675 () Unit!3980)

(declare-fun lt!66674 () Unit!3980)

(assert (=> d!39039 (= lt!66675 lt!66674)))

(assert (=> d!39039 (= (getValueByKey!166 lt!66676 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39039 (= lt!66674 (lemmaContainsTupThenGetReturnValue!84 lt!66676 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39039 (= lt!66676 (insertStrictlySorted!87 (toList!844 call!13856) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39039 (= (+!159 call!13856 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66677)))

(declare-fun b!128776 () Bool)

(declare-fun res!62143 () Bool)

(assert (=> b!128776 (=> (not res!62143) (not e!84051))))

(assert (=> b!128776 (= res!62143 (= (getValueByKey!166 (toList!844 lt!66677) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!128777 () Bool)

(assert (=> b!128777 (= e!84051 (contains!874 (toList!844 lt!66677) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23467 (ite c!23472 (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!39039 res!62142) b!128776))

(assert (= (and b!128776 res!62143) b!128777))

(declare-fun m!150801 () Bool)

(assert (=> d!39039 m!150801))

(declare-fun m!150803 () Bool)

(assert (=> d!39039 m!150803))

(declare-fun m!150805 () Bool)

(assert (=> d!39039 m!150805))

(declare-fun m!150807 () Bool)

(assert (=> d!39039 m!150807))

(declare-fun m!150809 () Bool)

(assert (=> b!128776 m!150809))

(declare-fun m!150811 () Bool)

(assert (=> b!128777 m!150811))

(assert (=> b!128163 d!39039))

(declare-fun d!39041 () Bool)

(declare-fun lt!66678 () Bool)

(assert (=> d!39041 (= lt!66678 (select (content!127 (toList!844 lt!66451)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84052 () Bool)

(assert (=> d!39041 (= lt!66678 e!84052)))

(declare-fun res!62144 () Bool)

(assert (=> d!39041 (=> (not res!62144) (not e!84052))))

(assert (=> d!39041 (= res!62144 ((_ is Cons!1694) (toList!844 lt!66451)))))

(assert (=> d!39041 (= (contains!874 (toList!844 lt!66451) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66678)))

(declare-fun b!128778 () Bool)

(declare-fun e!84053 () Bool)

(assert (=> b!128778 (= e!84052 e!84053)))

(declare-fun res!62145 () Bool)

(assert (=> b!128778 (=> res!62145 e!84053)))

(assert (=> b!128778 (= res!62145 (= (h!2297 (toList!844 lt!66451)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128779 () Bool)

(assert (=> b!128779 (= e!84053 (contains!874 (t!6068 (toList!844 lt!66451)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39041 res!62144) b!128778))

(assert (= (and b!128778 (not res!62145)) b!128779))

(declare-fun m!150813 () Bool)

(assert (=> d!39041 m!150813))

(declare-fun m!150815 () Bool)

(assert (=> d!39041 m!150815))

(declare-fun m!150817 () Bool)

(assert (=> b!128779 m!150817))

(assert (=> b!128388 d!39041))

(assert (=> b!128399 d!38879))

(declare-fun bm!13922 () Bool)

(declare-fun call!13928 () Bool)

(declare-fun lt!66684 () ListLongMap!1657)

(assert (=> bm!13922 (= call!13928 (contains!873 lt!66684 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13923 () Bool)

(declare-fun call!13929 () ListLongMap!1657)

(declare-fun call!13931 () ListLongMap!1657)

(assert (=> bm!13923 (= call!13929 call!13931)))

(declare-fun b!128780 () Bool)

(declare-fun e!84058 () Unit!3980)

(declare-fun Unit!4016 () Unit!3980)

(assert (=> b!128780 (= e!84058 Unit!4016)))

(declare-fun b!128781 () Bool)

(declare-fun e!84056 () Bool)

(declare-fun call!13930 () Bool)

(assert (=> b!128781 (= e!84056 (not call!13930))))

(declare-fun b!128782 () Bool)

(declare-fun e!84063 () Bool)

(assert (=> b!128782 (= e!84056 e!84063)))

(declare-fun res!62147 () Bool)

(assert (=> b!128782 (= res!62147 call!13930)))

(assert (=> b!128782 (=> (not res!62147) (not e!84063))))

(declare-fun b!128783 () Bool)

(declare-fun res!62146 () Bool)

(declare-fun e!84062 () Bool)

(assert (=> b!128783 (=> (not res!62146) (not e!84062))))

(declare-fun e!84055 () Bool)

(assert (=> b!128783 (= res!62146 e!84055)))

(declare-fun res!62153 () Bool)

(assert (=> b!128783 (=> res!62153 e!84055)))

(declare-fun e!84064 () Bool)

(assert (=> b!128783 (= res!62153 (not e!84064))))

(declare-fun res!62148 () Bool)

(assert (=> b!128783 (=> (not res!62148) (not e!84064))))

(assert (=> b!128783 (= res!62148 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(declare-fun b!128784 () Bool)

(declare-fun e!84066 () ListLongMap!1657)

(declare-fun e!84054 () ListLongMap!1657)

(assert (=> b!128784 (= e!84066 e!84054)))

(declare-fun c!23670 () Bool)

(assert (=> b!128784 (= c!23670 (and (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128785 () Bool)

(declare-fun e!84059 () Bool)

(assert (=> b!128785 (= e!84059 (not call!13928))))

(declare-fun d!39043 () Bool)

(assert (=> d!39043 e!84062))

(declare-fun res!62152 () Bool)

(assert (=> d!39043 (=> (not res!62152) (not e!84062))))

(assert (=> d!39043 (= res!62152 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))))

(declare-fun lt!66681 () ListLongMap!1657)

(assert (=> d!39043 (= lt!66684 lt!66681)))

(declare-fun lt!66693 () Unit!3980)

(assert (=> d!39043 (= lt!66693 e!84058)))

(declare-fun c!23669 () Bool)

(declare-fun e!84057 () Bool)

(assert (=> d!39043 (= c!23669 e!84057)))

(declare-fun res!62150 () Bool)

(assert (=> d!39043 (=> (not res!62150) (not e!84057))))

(assert (=> d!39043 (= res!62150 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (=> d!39043 (= lt!66681 e!84066)))

(declare-fun c!23668 () Bool)

(assert (=> d!39043 (= c!23668 (and (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39043 (validMask!0 (mask!7071 (_2!1292 lt!66148)))))

(assert (=> d!39043 (= (getCurrentListMap!513 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))) lt!66684)))

(declare-fun b!128786 () Bool)

(assert (=> b!128786 (= e!84054 call!13929)))

(declare-fun b!128787 () Bool)

(declare-fun e!84065 () Bool)

(assert (=> b!128787 (= e!84065 (= (apply!112 lt!66684 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (_values!2787 (_2!1292 lt!66148))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 (_2!1292 lt!66148)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (_values!2787 (_2!1292 lt!66148)))))))

(assert (=> b!128787 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(declare-fun b!128788 () Bool)

(assert (=> b!128788 (= e!84066 (+!159 call!13931 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (_2!1292 lt!66148)))))))

(declare-fun b!128789 () Bool)

(assert (=> b!128789 (= e!84062 e!84059)))

(declare-fun c!23672 () Bool)

(assert (=> b!128789 (= c!23672 (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128790 () Bool)

(declare-fun e!84060 () ListLongMap!1657)

(assert (=> b!128790 (= e!84060 call!13929)))

(declare-fun bm!13924 () Bool)

(declare-fun call!13926 () ListLongMap!1657)

(declare-fun call!13927 () ListLongMap!1657)

(assert (=> bm!13924 (= call!13926 call!13927)))

(declare-fun call!13925 () ListLongMap!1657)

(declare-fun bm!13925 () Bool)

(assert (=> bm!13925 (= call!13931 (+!159 (ite c!23668 call!13927 (ite c!23670 call!13926 call!13925)) (ite (or c!23668 c!23670) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (_2!1292 lt!66148))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (_2!1292 lt!66148))))))))

(declare-fun b!128791 () Bool)

(declare-fun e!84061 () Bool)

(assert (=> b!128791 (= e!84061 (= (apply!112 lt!66684 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 (_2!1292 lt!66148))))))

(declare-fun b!128792 () Bool)

(assert (=> b!128792 (= e!84060 call!13925)))

(declare-fun b!128793 () Bool)

(assert (=> b!128793 (= e!84063 (= (apply!112 lt!66684 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 (_2!1292 lt!66148))))))

(declare-fun b!128794 () Bool)

(assert (=> b!128794 (= e!84064 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun bm!13926 () Bool)

(assert (=> bm!13926 (= call!13925 call!13926)))

(declare-fun bm!13927 () Bool)

(assert (=> bm!13927 (= call!13927 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun b!128795 () Bool)

(assert (=> b!128795 (= e!84055 e!84065)))

(declare-fun res!62149 () Bool)

(assert (=> b!128795 (=> (not res!62149) (not e!84065))))

(assert (=> b!128795 (= res!62149 (contains!873 lt!66684 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(assert (=> b!128795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(declare-fun bm!13928 () Bool)

(assert (=> bm!13928 (= call!13930 (contains!873 lt!66684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128796 () Bool)

(assert (=> b!128796 (= e!84057 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun b!128797 () Bool)

(assert (=> b!128797 (= e!84059 e!84061)))

(declare-fun res!62151 () Bool)

(assert (=> b!128797 (= res!62151 call!13928)))

(assert (=> b!128797 (=> (not res!62151) (not e!84061))))

(declare-fun b!128798 () Bool)

(declare-fun res!62154 () Bool)

(assert (=> b!128798 (=> (not res!62154) (not e!84062))))

(assert (=> b!128798 (= res!62154 e!84056)))

(declare-fun c!23673 () Bool)

(assert (=> b!128798 (= c!23673 (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128799 () Bool)

(declare-fun c!23671 () Bool)

(assert (=> b!128799 (= c!23671 (and (not (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128799 (= e!84054 e!84060)))

(declare-fun b!128800 () Bool)

(declare-fun lt!66689 () Unit!3980)

(assert (=> b!128800 (= e!84058 lt!66689)))

(declare-fun lt!66690 () ListLongMap!1657)

(assert (=> b!128800 (= lt!66690 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun lt!66688 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66695 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66695 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000))))

(declare-fun lt!66685 () Unit!3980)

(assert (=> b!128800 (= lt!66685 (addStillContains!88 lt!66690 lt!66688 (zeroValue!2665 (_2!1292 lt!66148)) lt!66695))))

(assert (=> b!128800 (contains!873 (+!159 lt!66690 (tuple2!2561 lt!66688 (zeroValue!2665 (_2!1292 lt!66148)))) lt!66695)))

(declare-fun lt!66680 () Unit!3980)

(assert (=> b!128800 (= lt!66680 lt!66685)))

(declare-fun lt!66686 () ListLongMap!1657)

(assert (=> b!128800 (= lt!66686 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun lt!66682 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66682 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66692 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66692 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000))))

(declare-fun lt!66700 () Unit!3980)

(assert (=> b!128800 (= lt!66700 (addApplyDifferent!88 lt!66686 lt!66682 (minValue!2665 (_2!1292 lt!66148)) lt!66692))))

(assert (=> b!128800 (= (apply!112 (+!159 lt!66686 (tuple2!2561 lt!66682 (minValue!2665 (_2!1292 lt!66148)))) lt!66692) (apply!112 lt!66686 lt!66692))))

(declare-fun lt!66696 () Unit!3980)

(assert (=> b!128800 (= lt!66696 lt!66700)))

(declare-fun lt!66699 () ListLongMap!1657)

(assert (=> b!128800 (= lt!66699 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun lt!66694 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66679 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66679 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000))))

(declare-fun lt!66683 () Unit!3980)

(assert (=> b!128800 (= lt!66683 (addApplyDifferent!88 lt!66699 lt!66694 (zeroValue!2665 (_2!1292 lt!66148)) lt!66679))))

(assert (=> b!128800 (= (apply!112 (+!159 lt!66699 (tuple2!2561 lt!66694 (zeroValue!2665 (_2!1292 lt!66148)))) lt!66679) (apply!112 lt!66699 lt!66679))))

(declare-fun lt!66691 () Unit!3980)

(assert (=> b!128800 (= lt!66691 lt!66683)))

(declare-fun lt!66697 () ListLongMap!1657)

(assert (=> b!128800 (= lt!66697 (getCurrentListMapNoExtraKeys!124 (_keys!4540 (_2!1292 lt!66148)) (_values!2787 (_2!1292 lt!66148)) (mask!7071 (_2!1292 lt!66148)) (extraKeys!2581 (_2!1292 lt!66148)) (zeroValue!2665 (_2!1292 lt!66148)) (minValue!2665 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1292 lt!66148))))))

(declare-fun lt!66698 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66698 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66687 () (_ BitVec 64))

(assert (=> b!128800 (= lt!66687 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000))))

(assert (=> b!128800 (= lt!66689 (addApplyDifferent!88 lt!66697 lt!66698 (minValue!2665 (_2!1292 lt!66148)) lt!66687))))

(assert (=> b!128800 (= (apply!112 (+!159 lt!66697 (tuple2!2561 lt!66698 (minValue!2665 (_2!1292 lt!66148)))) lt!66687) (apply!112 lt!66697 lt!66687))))

(assert (= (and d!39043 c!23668) b!128788))

(assert (= (and d!39043 (not c!23668)) b!128784))

(assert (= (and b!128784 c!23670) b!128786))

(assert (= (and b!128784 (not c!23670)) b!128799))

(assert (= (and b!128799 c!23671) b!128790))

(assert (= (and b!128799 (not c!23671)) b!128792))

(assert (= (or b!128790 b!128792) bm!13926))

(assert (= (or b!128786 bm!13926) bm!13924))

(assert (= (or b!128786 b!128790) bm!13923))

(assert (= (or b!128788 bm!13924) bm!13927))

(assert (= (or b!128788 bm!13923) bm!13925))

(assert (= (and d!39043 res!62150) b!128796))

(assert (= (and d!39043 c!23669) b!128800))

(assert (= (and d!39043 (not c!23669)) b!128780))

(assert (= (and d!39043 res!62152) b!128783))

(assert (= (and b!128783 res!62148) b!128794))

(assert (= (and b!128783 (not res!62153)) b!128795))

(assert (= (and b!128795 res!62149) b!128787))

(assert (= (and b!128783 res!62146) b!128798))

(assert (= (and b!128798 c!23673) b!128782))

(assert (= (and b!128798 (not c!23673)) b!128781))

(assert (= (and b!128782 res!62147) b!128793))

(assert (= (or b!128782 b!128781) bm!13928))

(assert (= (and b!128798 res!62154) b!128789))

(assert (= (and b!128789 c!23672) b!128797))

(assert (= (and b!128789 (not c!23672)) b!128785))

(assert (= (and b!128797 res!62151) b!128791))

(assert (= (or b!128797 b!128785) bm!13922))

(declare-fun b_lambda!5689 () Bool)

(assert (=> (not b_lambda!5689) (not b!128787)))

(declare-fun t!6084 () Bool)

(declare-fun tb!2349 () Bool)

(assert (=> (and b!127723 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 (_2!1292 lt!66148))) t!6084) tb!2349))

(declare-fun result!3893 () Bool)

(assert (=> tb!2349 (= result!3893 tp_is_empty!2851)))

(assert (=> b!128787 t!6084))

(declare-fun b_and!7949 () Bool)

(assert (= b_and!7945 (and (=> t!6084 result!3893) b_and!7949)))

(declare-fun tb!2351 () Bool)

(declare-fun t!6086 () Bool)

(assert (=> (and b!127731 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (_2!1292 lt!66148))) t!6086) tb!2351))

(declare-fun result!3895 () Bool)

(assert (= result!3895 result!3893))

(assert (=> b!128787 t!6086))

(declare-fun b_and!7951 () Bool)

(assert (= b_and!7947 (and (=> t!6086 result!3895) b_and!7951)))

(declare-fun m!150819 () Bool)

(assert (=> bm!13928 m!150819))

(declare-fun m!150821 () Bool)

(assert (=> b!128793 m!150821))

(declare-fun m!150823 () Bool)

(assert (=> b!128787 m!150823))

(declare-fun m!150825 () Bool)

(assert (=> b!128787 m!150825))

(assert (=> b!128787 m!150823))

(declare-fun m!150827 () Bool)

(assert (=> b!128787 m!150827))

(assert (=> b!128787 m!150117))

(declare-fun m!150829 () Bool)

(assert (=> b!128787 m!150829))

(assert (=> b!128787 m!150825))

(assert (=> b!128787 m!150117))

(declare-fun m!150831 () Bool)

(assert (=> bm!13922 m!150831))

(declare-fun m!150833 () Bool)

(assert (=> d!39043 m!150833))

(declare-fun m!150835 () Bool)

(assert (=> b!128800 m!150835))

(declare-fun m!150837 () Bool)

(assert (=> b!128800 m!150837))

(declare-fun m!150839 () Bool)

(assert (=> b!128800 m!150839))

(declare-fun m!150841 () Bool)

(assert (=> b!128800 m!150841))

(declare-fun m!150843 () Bool)

(assert (=> b!128800 m!150843))

(declare-fun m!150845 () Bool)

(assert (=> b!128800 m!150845))

(assert (=> b!128800 m!150835))

(declare-fun m!150847 () Bool)

(assert (=> b!128800 m!150847))

(declare-fun m!150849 () Bool)

(assert (=> b!128800 m!150849))

(declare-fun m!150851 () Bool)

(assert (=> b!128800 m!150851))

(assert (=> b!128800 m!150117))

(declare-fun m!150853 () Bool)

(assert (=> b!128800 m!150853))

(declare-fun m!150855 () Bool)

(assert (=> b!128800 m!150855))

(declare-fun m!150857 () Bool)

(assert (=> b!128800 m!150857))

(assert (=> b!128800 m!150853))

(assert (=> b!128800 m!150841))

(declare-fun m!150859 () Bool)

(assert (=> b!128800 m!150859))

(declare-fun m!150861 () Bool)

(assert (=> b!128800 m!150861))

(declare-fun m!150863 () Bool)

(assert (=> b!128800 m!150863))

(assert (=> b!128800 m!150861))

(declare-fun m!150865 () Bool)

(assert (=> b!128800 m!150865))

(assert (=> b!128795 m!150117))

(assert (=> b!128795 m!150117))

(declare-fun m!150867 () Bool)

(assert (=> b!128795 m!150867))

(declare-fun m!150869 () Bool)

(assert (=> bm!13925 m!150869))

(assert (=> b!128796 m!150117))

(assert (=> b!128796 m!150117))

(assert (=> b!128796 m!150119))

(assert (=> b!128794 m!150117))

(assert (=> b!128794 m!150117))

(assert (=> b!128794 m!150119))

(declare-fun m!150871 () Bool)

(assert (=> b!128791 m!150871))

(declare-fun m!150873 () Bool)

(assert (=> b!128788 m!150873))

(assert (=> bm!13927 m!150863))

(assert (=> d!38699 d!39043))

(declare-fun d!39045 () Bool)

(declare-fun e!84068 () Bool)

(assert (=> d!39045 e!84068))

(declare-fun res!62155 () Bool)

(assert (=> d!39045 (=> res!62155 e!84068)))

(declare-fun lt!66703 () Bool)

(assert (=> d!39045 (= res!62155 (not lt!66703))))

(declare-fun lt!66704 () Bool)

(assert (=> d!39045 (= lt!66703 lt!66704)))

(declare-fun lt!66702 () Unit!3980)

(declare-fun e!84067 () Unit!3980)

(assert (=> d!39045 (= lt!66702 e!84067)))

(declare-fun c!23674 () Bool)

(assert (=> d!39045 (= c!23674 lt!66704)))

(assert (=> d!39045 (= lt!66704 (containsKey!170 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!39045 (= (contains!873 lt!66316 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66703)))

(declare-fun b!128801 () Bool)

(declare-fun lt!66701 () Unit!3980)

(assert (=> b!128801 (= e!84067 lt!66701)))

(assert (=> b!128801 (= lt!66701 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!128801 (isDefined!120 (getValueByKey!166 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128802 () Bool)

(declare-fun Unit!4017 () Unit!3980)

(assert (=> b!128802 (= e!84067 Unit!4017)))

(declare-fun b!128803 () Bool)

(assert (=> b!128803 (= e!84068 (isDefined!120 (getValueByKey!166 (toList!844 lt!66316) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39045 c!23674) b!128801))

(assert (= (and d!39045 (not c!23674)) b!128802))

(assert (= (and d!39045 (not res!62155)) b!128803))

(declare-fun m!150875 () Bool)

(assert (=> d!39045 m!150875))

(declare-fun m!150877 () Bool)

(assert (=> b!128801 m!150877))

(assert (=> b!128801 m!149935))

(assert (=> b!128801 m!149935))

(declare-fun m!150879 () Bool)

(assert (=> b!128801 m!150879))

(assert (=> b!128803 m!149935))

(assert (=> b!128803 m!149935))

(assert (=> b!128803 m!150879))

(assert (=> d!38761 d!39045))

(declare-fun b!128804 () Bool)

(declare-fun e!84069 () Option!172)

(assert (=> b!128804 (= e!84069 (Some!171 (_2!1291 (h!2297 lt!66315))))))

(declare-fun b!128807 () Bool)

(declare-fun e!84070 () Option!172)

(assert (=> b!128807 (= e!84070 None!170)))

(declare-fun b!128806 () Bool)

(assert (=> b!128806 (= e!84070 (getValueByKey!166 (t!6068 lt!66315) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!39047 () Bool)

(declare-fun c!23675 () Bool)

(assert (=> d!39047 (= c!23675 (and ((_ is Cons!1694) lt!66315) (= (_1!1291 (h!2297 lt!66315)) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39047 (= (getValueByKey!166 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!84069)))

(declare-fun b!128805 () Bool)

(assert (=> b!128805 (= e!84069 e!84070)))

(declare-fun c!23676 () Bool)

(assert (=> b!128805 (= c!23676 (and ((_ is Cons!1694) lt!66315) (not (= (_1!1291 (h!2297 lt!66315)) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39047 c!23675) b!128804))

(assert (= (and d!39047 (not c!23675)) b!128805))

(assert (= (and b!128805 c!23676) b!128806))

(assert (= (and b!128805 (not c!23676)) b!128807))

(declare-fun m!150881 () Bool)

(assert (=> b!128806 m!150881))

(assert (=> d!38761 d!39047))

(declare-fun d!39049 () Bool)

(assert (=> d!39049 (= (getValueByKey!166 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66705 () Unit!3980)

(assert (=> d!39049 (= lt!66705 (choose!790 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!84071 () Bool)

(assert (=> d!39049 e!84071))

(declare-fun res!62156 () Bool)

(assert (=> d!39049 (=> (not res!62156) (not e!84071))))

(assert (=> d!39049 (= res!62156 (isStrictlySorted!313 lt!66315))))

(assert (=> d!39049 (= (lemmaContainsTupThenGetReturnValue!84 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66705)))

(declare-fun b!128808 () Bool)

(declare-fun res!62157 () Bool)

(assert (=> b!128808 (=> (not res!62157) (not e!84071))))

(assert (=> b!128808 (= res!62157 (containsKey!170 lt!66315 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128809 () Bool)

(assert (=> b!128809 (= e!84071 (contains!874 lt!66315 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39049 res!62156) b!128808))

(assert (= (and b!128808 res!62157) b!128809))

(assert (=> d!39049 m!149929))

(declare-fun m!150883 () Bool)

(assert (=> d!39049 m!150883))

(declare-fun m!150885 () Bool)

(assert (=> d!39049 m!150885))

(declare-fun m!150887 () Bool)

(assert (=> b!128808 m!150887))

(declare-fun m!150889 () Bool)

(assert (=> b!128809 m!150889))

(assert (=> d!38761 d!39049))

(declare-fun b!128810 () Bool)

(declare-fun e!84076 () List!1698)

(declare-fun call!13932 () List!1698)

(assert (=> b!128810 (= e!84076 call!13932)))

(declare-fun b!128811 () Bool)

(declare-fun e!84072 () List!1698)

(declare-fun call!13934 () List!1698)

(assert (=> b!128811 (= e!84072 call!13934)))

(declare-fun e!84074 () Bool)

(declare-fun b!128812 () Bool)

(declare-fun lt!66706 () List!1698)

(assert (=> b!128812 (= e!84074 (contains!874 lt!66706 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun e!84073 () List!1698)

(declare-fun b!128813 () Bool)

(assert (=> b!128813 (= e!84073 (insertStrictlySorted!87 (t!6068 (toList!844 lt!66052)) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun bm!13929 () Bool)

(declare-fun call!13933 () List!1698)

(assert (=> bm!13929 (= call!13934 call!13933)))

(declare-fun b!128814 () Bool)

(declare-fun e!84075 () List!1698)

(assert (=> b!128814 (= e!84075 call!13933)))

(declare-fun bm!13930 () Bool)

(declare-fun c!23678 () Bool)

(assert (=> bm!13930 (= call!13932 ($colon$colon!89 e!84073 (ite c!23678 (h!2297 (toList!844 lt!66052)) (tuple2!2561 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23680 () Bool)

(assert (=> bm!13930 (= c!23680 c!23678)))

(declare-fun b!128815 () Bool)

(assert (=> b!128815 (= e!84076 e!84075)))

(declare-fun c!23679 () Bool)

(assert (=> b!128815 (= c!23679 (and ((_ is Cons!1694) (toList!844 lt!66052)) (= (_1!1291 (h!2297 (toList!844 lt!66052))) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!128816 () Bool)

(declare-fun c!23677 () Bool)

(assert (=> b!128816 (= c!23677 (and ((_ is Cons!1694) (toList!844 lt!66052)) (bvsgt (_1!1291 (h!2297 (toList!844 lt!66052))) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!128816 (= e!84075 e!84072)))

(declare-fun b!128817 () Bool)

(assert (=> b!128817 (= e!84073 (ite c!23679 (t!6068 (toList!844 lt!66052)) (ite c!23677 (Cons!1694 (h!2297 (toList!844 lt!66052)) (t!6068 (toList!844 lt!66052))) Nil!1695)))))

(declare-fun b!128818 () Bool)

(declare-fun res!62158 () Bool)

(assert (=> b!128818 (=> (not res!62158) (not e!84074))))

(assert (=> b!128818 (= res!62158 (containsKey!170 lt!66706 (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128819 () Bool)

(assert (=> b!128819 (= e!84072 call!13934)))

(declare-fun bm!13931 () Bool)

(assert (=> bm!13931 (= call!13933 call!13932)))

(declare-fun d!39051 () Bool)

(assert (=> d!39051 e!84074))

(declare-fun res!62159 () Bool)

(assert (=> d!39051 (=> (not res!62159) (not e!84074))))

(assert (=> d!39051 (= res!62159 (isStrictlySorted!313 lt!66706))))

(assert (=> d!39051 (= lt!66706 e!84076)))

(assert (=> d!39051 (= c!23678 (and ((_ is Cons!1694) (toList!844 lt!66052)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66052))) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39051 (isStrictlySorted!313 (toList!844 lt!66052))))

(assert (=> d!39051 (= (insertStrictlySorted!87 (toList!844 lt!66052) (_1!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66706)))

(assert (= (and d!39051 c!23678) b!128810))

(assert (= (and d!39051 (not c!23678)) b!128815))

(assert (= (and b!128815 c!23679) b!128814))

(assert (= (and b!128815 (not c!23679)) b!128816))

(assert (= (and b!128816 c!23677) b!128819))

(assert (= (and b!128816 (not c!23677)) b!128811))

(assert (= (or b!128819 b!128811) bm!13929))

(assert (= (or b!128814 bm!13929) bm!13931))

(assert (= (or b!128810 bm!13931) bm!13930))

(assert (= (and bm!13930 c!23680) b!128813))

(assert (= (and bm!13930 (not c!23680)) b!128817))

(assert (= (and d!39051 res!62159) b!128818))

(assert (= (and b!128818 res!62158) b!128812))

(declare-fun m!150891 () Bool)

(assert (=> b!128813 m!150891))

(declare-fun m!150893 () Bool)

(assert (=> bm!13930 m!150893))

(declare-fun m!150895 () Bool)

(assert (=> b!128818 m!150895))

(declare-fun m!150897 () Bool)

(assert (=> d!39051 m!150897))

(declare-fun m!150899 () Bool)

(assert (=> d!39051 m!150899))

(declare-fun m!150901 () Bool)

(assert (=> b!128812 m!150901))

(assert (=> d!38761 d!39051))

(assert (=> d!38733 d!38723))

(declare-fun lt!66709 () SeekEntryResult!274)

(declare-fun c!23686 () Bool)

(declare-fun bm!13936 () Bool)

(declare-fun call!13939 () Bool)

(assert (=> bm!13936 (= call!13939 (inRange!0 (ite c!23686 (index!3252 lt!66709) (index!3255 lt!66709)) (mask!7071 newMap!16)))))

(declare-fun b!128836 () Bool)

(declare-fun res!62171 () Bool)

(assert (=> b!128836 (= res!62171 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3252 lt!66709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84085 () Bool)

(assert (=> b!128836 (=> (not res!62171) (not e!84085))))

(declare-fun b!128837 () Bool)

(declare-fun e!84088 () Bool)

(declare-fun call!13940 () Bool)

(assert (=> b!128837 (= e!84088 (not call!13940))))

(declare-fun b!128838 () Bool)

(assert (=> b!128838 (= e!84085 (not call!13940))))

(declare-fun d!39053 () Bool)

(declare-fun e!84087 () Bool)

(assert (=> d!39053 e!84087))

(assert (=> d!39053 (= c!23686 ((_ is MissingZero!274) lt!66709))))

(assert (=> d!39053 (= lt!66709 (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (=> d!39053 true))

(declare-fun _$34!961 () Unit!3980)

(assert (=> d!39053 (= (choose!784 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) _$34!961)))

(declare-fun b!128839 () Bool)

(declare-fun e!84086 () Bool)

(assert (=> b!128839 (= e!84087 e!84086)))

(declare-fun c!23685 () Bool)

(assert (=> b!128839 (= c!23685 ((_ is MissingVacant!274) lt!66709))))

(declare-fun bm!13937 () Bool)

(assert (=> bm!13937 (= call!13940 (arrayContainsKey!0 (_keys!4540 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128840 () Bool)

(declare-fun res!62168 () Bool)

(assert (=> b!128840 (=> (not res!62168) (not e!84088))))

(assert (=> b!128840 (= res!62168 call!13939)))

(assert (=> b!128840 (= e!84086 e!84088)))

(declare-fun b!128841 () Bool)

(assert (=> b!128841 (= e!84086 ((_ is Undefined!274) lt!66709))))

(declare-fun b!128842 () Bool)

(declare-fun res!62169 () Bool)

(assert (=> b!128842 (=> (not res!62169) (not e!84088))))

(assert (=> b!128842 (= res!62169 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128843 () Bool)

(assert (=> b!128843 (= e!84087 e!84085)))

(declare-fun res!62170 () Bool)

(assert (=> b!128843 (= res!62170 call!13939)))

(assert (=> b!128843 (=> (not res!62170) (not e!84085))))

(assert (= (and d!39053 c!23686) b!128843))

(assert (= (and d!39053 (not c!23686)) b!128839))

(assert (= (and b!128843 res!62170) b!128836))

(assert (= (and b!128836 res!62171) b!128838))

(assert (= (and b!128839 c!23685) b!128840))

(assert (= (and b!128839 (not c!23685)) b!128841))

(assert (= (and b!128840 res!62168) b!128842))

(assert (= (and b!128842 res!62169) b!128837))

(assert (= (or b!128843 b!128840) bm!13936))

(assert (= (or b!128838 b!128837) bm!13937))

(assert (=> d!39053 m!149345))

(assert (=> d!39053 m!149525))

(declare-fun m!150903 () Bool)

(assert (=> b!128836 m!150903))

(assert (=> bm!13937 m!149345))

(assert (=> bm!13937 m!149539))

(declare-fun m!150905 () Bool)

(assert (=> bm!13936 m!150905))

(declare-fun m!150907 () Bool)

(assert (=> b!128842 m!150907))

(assert (=> d!38733 d!39053))

(assert (=> d!38733 d!38895))

(declare-fun d!39055 () Bool)

(declare-fun e!84090 () Bool)

(assert (=> d!39055 e!84090))

(declare-fun res!62172 () Bool)

(assert (=> d!39055 (=> res!62172 e!84090)))

(declare-fun lt!66712 () Bool)

(assert (=> d!39055 (= res!62172 (not lt!66712))))

(declare-fun lt!66713 () Bool)

(assert (=> d!39055 (= lt!66712 lt!66713)))

(declare-fun lt!66711 () Unit!3980)

(declare-fun e!84089 () Unit!3980)

(assert (=> d!39055 (= lt!66711 e!84089)))

(declare-fun c!23687 () Bool)

(assert (=> d!39055 (= c!23687 lt!66713)))

(assert (=> d!39055 (= lt!66713 (containsKey!170 (toList!844 lt!66303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39055 (= (contains!873 lt!66303 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66712)))

(declare-fun b!128844 () Bool)

(declare-fun lt!66710 () Unit!3980)

(assert (=> b!128844 (= e!84089 lt!66710)))

(assert (=> b!128844 (= lt!66710 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128844 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128845 () Bool)

(declare-fun Unit!4018 () Unit!3980)

(assert (=> b!128845 (= e!84089 Unit!4018)))

(declare-fun b!128846 () Bool)

(assert (=> b!128846 (= e!84090 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39055 c!23687) b!128844))

(assert (= (and d!39055 (not c!23687)) b!128845))

(assert (= (and d!39055 (not res!62172)) b!128846))

(declare-fun m!150909 () Bool)

(assert (=> d!39055 m!150909))

(declare-fun m!150911 () Bool)

(assert (=> b!128844 m!150911))

(declare-fun m!150913 () Bool)

(assert (=> b!128844 m!150913))

(assert (=> b!128844 m!150913))

(declare-fun m!150915 () Bool)

(assert (=> b!128844 m!150915))

(assert (=> b!128846 m!150913))

(assert (=> b!128846 m!150913))

(assert (=> b!128846 m!150915))

(assert (=> b!128265 d!39055))

(assert (=> b!128218 d!38879))

(declare-fun d!39057 () Bool)

(assert (=> d!39057 (= (apply!112 lt!66249 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66249) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5333 () Bool)

(assert (= bs!5333 d!39057))

(assert (=> bs!5333 m!150583))

(assert (=> bs!5333 m!150583))

(declare-fun m!150917 () Bool)

(assert (=> bs!5333 m!150917))

(assert (=> b!128168 d!39057))

(declare-fun d!39059 () Bool)

(declare-fun lt!66714 () Bool)

(assert (=> d!39059 (= lt!66714 (select (content!127 (toList!844 lt!66269)) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!84091 () Bool)

(assert (=> d!39059 (= lt!66714 e!84091)))

(declare-fun res!62173 () Bool)

(assert (=> d!39059 (=> (not res!62173) (not e!84091))))

(assert (=> d!39059 (= res!62173 ((_ is Cons!1694) (toList!844 lt!66269)))))

(assert (=> d!39059 (= (contains!874 (toList!844 lt!66269) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66714)))

(declare-fun b!128847 () Bool)

(declare-fun e!84092 () Bool)

(assert (=> b!128847 (= e!84091 e!84092)))

(declare-fun res!62174 () Bool)

(assert (=> b!128847 (=> res!62174 e!84092)))

(assert (=> b!128847 (= res!62174 (= (h!2297 (toList!844 lt!66269)) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!128848 () Bool)

(assert (=> b!128848 (= e!84092 (contains!874 (t!6068 (toList!844 lt!66269)) (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (= (and d!39059 res!62173) b!128847))

(assert (= (and b!128847 (not res!62174)) b!128848))

(declare-fun m!150919 () Bool)

(assert (=> d!39059 m!150919))

(declare-fun m!150921 () Bool)

(assert (=> d!39059 m!150921))

(declare-fun m!150923 () Bool)

(assert (=> b!128848 m!150923))

(assert (=> b!128183 d!39059))

(declare-fun b!128849 () Bool)

(declare-fun e!84094 () (_ BitVec 32))

(assert (=> b!128849 (= e!84094 #b00000000000000000000000000000000)))

(declare-fun b!128850 () Bool)

(declare-fun e!84093 () (_ BitVec 32))

(declare-fun call!13941 () (_ BitVec 32))

(assert (=> b!128850 (= e!84093 (bvadd #b00000000000000000000000000000001 call!13941))))

(declare-fun b!128851 () Bool)

(assert (=> b!128851 (= e!84094 e!84093)))

(declare-fun c!23689 () Bool)

(assert (=> b!128851 (= c!23689 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(declare-fun d!39061 () Bool)

(declare-fun lt!66715 () (_ BitVec 32))

(assert (=> d!39061 (and (bvsge lt!66715 #b00000000000000000000000000000000) (bvsle lt!66715 (bvsub (size!2490 (_keys!4540 (_2!1292 lt!66148))) #b00000000000000000000000000000000)))))

(assert (=> d!39061 (= lt!66715 e!84094)))

(declare-fun c!23688 () Bool)

(assert (=> d!39061 (= c!23688 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (=> d!39061 (and (bvsle #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2490 (_keys!4540 (_2!1292 lt!66148))) (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (=> d!39061 (= (arrayCountValidKeys!0 (_keys!4540 (_2!1292 lt!66148)) #b00000000000000000000000000000000 (size!2490 (_keys!4540 (_2!1292 lt!66148)))) lt!66715)))

(declare-fun b!128852 () Bool)

(assert (=> b!128852 (= e!84093 call!13941)))

(declare-fun bm!13938 () Bool)

(assert (=> bm!13938 (= call!13941 (arrayCountValidKeys!0 (_keys!4540 (_2!1292 lt!66148)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 (_2!1292 lt!66148)))))))

(assert (= (and d!39061 c!23688) b!128849))

(assert (= (and d!39061 (not c!23688)) b!128851))

(assert (= (and b!128851 c!23689) b!128850))

(assert (= (and b!128851 (not c!23689)) b!128852))

(assert (= (or b!128850 b!128852) bm!13938))

(assert (=> b!128851 m!150117))

(assert (=> b!128851 m!150117))

(assert (=> b!128851 m!150119))

(declare-fun m!150925 () Bool)

(assert (=> bm!13938 m!150925))

(assert (=> b!128105 d!39061))

(declare-fun d!39063 () Bool)

(assert (=> d!39063 (= (isEmpty!404 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) (not ((_ is Some!171) (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))))

(assert (=> d!38777 d!39063))

(declare-fun d!39065 () Bool)

(assert (=> d!39065 (isDefined!120 (getValueByKey!166 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(declare-fun lt!66716 () Unit!3980)

(assert (=> d!39065 (= lt!66716 (choose!787 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(declare-fun e!84095 () Bool)

(assert (=> d!39065 e!84095))

(declare-fun res!62175 () Bool)

(assert (=> d!39065 (=> (not res!62175) (not e!84095))))

(assert (=> d!39065 (= res!62175 (isStrictlySorted!313 (toList!844 call!13818)))))

(assert (=> d!39065 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))) lt!66716)))

(declare-fun b!128853 () Bool)

(assert (=> b!128853 (= e!84095 (containsKey!170 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(assert (= (and d!39065 res!62175) b!128853))

(assert (=> d!39065 m!150001))

(assert (=> d!39065 m!150001))

(assert (=> d!39065 m!150003))

(declare-fun m!150927 () Bool)

(assert (=> d!39065 m!150927))

(declare-fun m!150929 () Bool)

(assert (=> d!39065 m!150929))

(assert (=> b!128853 m!149997))

(assert (=> b!128298 d!39065))

(assert (=> b!128298 d!38819))

(assert (=> b!128298 d!38821))

(declare-fun b!128866 () Bool)

(declare-fun e!84102 () SeekEntryResult!274)

(assert (=> b!128866 (= e!84102 (MissingVacant!274 (index!3254 lt!66221)))))

(declare-fun b!128867 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!128867 (= e!84102 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15124 lt!66221) #b00000000000000000000000000000001) (nextIndex!0 (index!3254 lt!66221) (x!15124 lt!66221) (mask!7071 newMap!16)) (index!3254 lt!66221) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun d!39067 () Bool)

(declare-fun lt!66721 () SeekEntryResult!274)

(assert (=> d!39067 (and (or ((_ is Undefined!274) lt!66721) (not ((_ is Found!274) lt!66721)) (and (bvsge (index!3253 lt!66721) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66721) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66721) ((_ is Found!274) lt!66721) (not ((_ is MissingVacant!274) lt!66721)) (not (= (index!3255 lt!66721) (index!3254 lt!66221))) (and (bvsge (index!3255 lt!66721) #b00000000000000000000000000000000) (bvslt (index!3255 lt!66721) (size!2490 (_keys!4540 newMap!16))))) (or ((_ is Undefined!274) lt!66721) (ite ((_ is Found!274) lt!66721) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66721)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (and ((_ is MissingVacant!274) lt!66721) (= (index!3255 lt!66721) (index!3254 lt!66221)) (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3255 lt!66721)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84104 () SeekEntryResult!274)

(assert (=> d!39067 (= lt!66721 e!84104)))

(declare-fun c!23697 () Bool)

(assert (=> d!39067 (= c!23697 (bvsge (x!15124 lt!66221) #b01111111111111111111111111111110))))

(declare-fun lt!66722 () (_ BitVec 64))

(assert (=> d!39067 (= lt!66722 (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66221)))))

(assert (=> d!39067 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39067 (= (seekKeyOrZeroReturnVacant!0 (x!15124 lt!66221) (index!3254 lt!66221) (index!3254 lt!66221) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)) lt!66721)))

(declare-fun b!128868 () Bool)

(declare-fun e!84103 () SeekEntryResult!274)

(assert (=> b!128868 (= e!84104 e!84103)))

(declare-fun c!23698 () Bool)

(assert (=> b!128868 (= c!23698 (= lt!66722 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun b!128869 () Bool)

(declare-fun c!23696 () Bool)

(assert (=> b!128869 (= c!23696 (= lt!66722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128869 (= e!84103 e!84102)))

(declare-fun b!128870 () Bool)

(assert (=> b!128870 (= e!84103 (Found!274 (index!3254 lt!66221)))))

(declare-fun b!128871 () Bool)

(assert (=> b!128871 (= e!84104 Undefined!274)))

(assert (= (and d!39067 c!23697) b!128871))

(assert (= (and d!39067 (not c!23697)) b!128868))

(assert (= (and b!128868 c!23698) b!128870))

(assert (= (and b!128868 (not c!23698)) b!128869))

(assert (= (and b!128869 c!23696) b!128866))

(assert (= (and b!128869 (not c!23696)) b!128867))

(declare-fun m!150931 () Bool)

(assert (=> b!128867 m!150931))

(assert (=> b!128867 m!150931))

(assert (=> b!128867 m!149345))

(declare-fun m!150933 () Bool)

(assert (=> b!128867 m!150933))

(declare-fun m!150935 () Bool)

(assert (=> d!39067 m!150935))

(declare-fun m!150937 () Bool)

(assert (=> d!39067 m!150937))

(assert (=> d!39067 m!149719))

(assert (=> d!39067 m!149585))

(assert (=> b!128130 d!39067))

(declare-fun b!128874 () Bool)

(declare-fun res!62177 () Bool)

(declare-fun e!84105 () Bool)

(assert (=> b!128874 (=> (not res!62177) (not e!84105))))

(assert (=> b!128874 (= res!62177 (= (size!2496 (v!3138 (underlying!440 thiss!992))) (bvadd (_size!585 (v!3138 (underlying!440 thiss!992))) (bvsdiv (bvadd (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!128873 () Bool)

(declare-fun res!62179 () Bool)

(assert (=> b!128873 (=> (not res!62179) (not e!84105))))

(assert (=> b!128873 (= res!62179 (bvsge (size!2496 (v!3138 (underlying!440 thiss!992))) (_size!585 (v!3138 (underlying!440 thiss!992)))))))

(declare-fun b!128875 () Bool)

(assert (=> b!128875 (= e!84105 (and (bvsge (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!585 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!128872 () Bool)

(declare-fun res!62178 () Bool)

(assert (=> b!128872 (=> (not res!62178) (not e!84105))))

(assert (=> b!128872 (= res!62178 (and (= (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001)) (= (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (size!2491 (_values!2787 (v!3138 (underlying!440 thiss!992))))) (bvsge (_size!585 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!585 (v!3138 (underlying!440 thiss!992))) (bvadd (mask!7071 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!39069 () Bool)

(declare-fun res!62176 () Bool)

(assert (=> d!39069 (=> (not res!62176) (not e!84105))))

(assert (=> d!39069 (= res!62176 (validMask!0 (mask!7071 (v!3138 (underlying!440 thiss!992)))))))

(assert (=> d!39069 (= (simpleValid!88 (v!3138 (underlying!440 thiss!992))) e!84105)))

(assert (= (and d!39069 res!62176) b!128872))

(assert (= (and b!128872 res!62178) b!128873))

(assert (= (and b!128873 res!62179) b!128874))

(assert (= (and b!128874 res!62177) b!128875))

(declare-fun m!150939 () Bool)

(assert (=> b!128874 m!150939))

(assert (=> b!128873 m!150939))

(assert (=> d!39069 m!149337))

(assert (=> d!38741 d!39069))

(declare-fun d!39071 () Bool)

(assert (=> d!39071 (isDefined!120 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66723 () Unit!3980)

(assert (=> d!39071 (= lt!66723 (choose!787 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84106 () Bool)

(assert (=> d!39071 e!84106))

(declare-fun res!62180 () Bool)

(assert (=> d!39071 (=> (not res!62180) (not e!84106))))

(assert (=> d!39071 (= res!62180 (isStrictlySorted!313 (toList!844 lt!66050)))))

(assert (=> d!39071 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000) lt!66723)))

(declare-fun b!128876 () Bool)

(assert (=> b!128876 (= e!84106 (containsKey!170 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39071 res!62180) b!128876))

(assert (=> d!39071 m!149579))

(assert (=> d!39071 m!149579))

(assert (=> d!39071 m!150009))

(declare-fun m!150941 () Bool)

(assert (=> d!39071 m!150941))

(assert (=> d!39071 m!150457))

(assert (=> b!128876 m!150005))

(assert (=> b!128301 d!39071))

(assert (=> b!128301 d!38827))

(assert (=> b!128301 d!38829))

(declare-fun d!39073 () Bool)

(declare-fun e!84108 () Bool)

(assert (=> d!39073 e!84108))

(declare-fun res!62181 () Bool)

(assert (=> d!39073 (=> res!62181 e!84108)))

(declare-fun lt!66726 () Bool)

(assert (=> d!39073 (= res!62181 (not lt!66726))))

(declare-fun lt!66727 () Bool)

(assert (=> d!39073 (= lt!66726 lt!66727)))

(declare-fun lt!66725 () Unit!3980)

(declare-fun e!84107 () Unit!3980)

(assert (=> d!39073 (= lt!66725 e!84107)))

(declare-fun c!23699 () Bool)

(assert (=> d!39073 (= c!23699 lt!66727)))

(assert (=> d!39073 (= lt!66727 (containsKey!170 (toList!844 lt!66249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39073 (= (contains!873 lt!66249 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66726)))

(declare-fun b!128877 () Bool)

(declare-fun lt!66724 () Unit!3980)

(assert (=> b!128877 (= e!84107 lt!66724)))

(assert (=> b!128877 (= lt!66724 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128877 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128878 () Bool)

(declare-fun Unit!4019 () Unit!3980)

(assert (=> b!128878 (= e!84107 Unit!4019)))

(declare-fun b!128879 () Bool)

(assert (=> b!128879 (= e!84108 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39073 c!23699) b!128877))

(assert (= (and d!39073 (not c!23699)) b!128878))

(assert (= (and d!39073 (not res!62181)) b!128879))

(declare-fun m!150943 () Bool)

(assert (=> d!39073 m!150943))

(declare-fun m!150945 () Bool)

(assert (=> b!128877 m!150945))

(assert (=> b!128877 m!150129))

(assert (=> b!128877 m!150129))

(declare-fun m!150947 () Bool)

(assert (=> b!128877 m!150947))

(assert (=> b!128879 m!150129))

(assert (=> b!128879 m!150129))

(assert (=> b!128879 m!150947))

(assert (=> bm!13847 d!39073))

(declare-fun b!128880 () Bool)

(declare-fun e!84109 () Bool)

(declare-fun e!84112 () Bool)

(assert (=> b!128880 (= e!84109 e!84112)))

(declare-fun res!62183 () Bool)

(assert (=> b!128880 (=> (not res!62183) (not e!84112))))

(declare-fun e!84111 () Bool)

(assert (=> b!128880 (= res!62183 (not e!84111))))

(declare-fun res!62184 () Bool)

(assert (=> b!128880 (=> (not res!62184) (not e!84111))))

(assert (=> b!128880 (= res!62184 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!128881 () Bool)

(declare-fun e!84110 () Bool)

(declare-fun call!13942 () Bool)

(assert (=> b!128881 (= e!84110 call!13942)))

(declare-fun b!128882 () Bool)

(assert (=> b!128882 (= e!84112 e!84110)))

(declare-fun c!23700 () Bool)

(assert (=> b!128882 (= c!23700 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!128883 () Bool)

(assert (=> b!128883 (= e!84110 call!13942)))

(declare-fun b!128884 () Bool)

(assert (=> b!128884 (= e!84111 (contains!875 (ite c!23515 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697) (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13939 () Bool)

(assert (=> bm!13939 (= call!13942 (arrayNoDuplicates!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23700 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23515 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)) (ite c!23515 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697))))))

(declare-fun d!39075 () Bool)

(declare-fun res!62182 () Bool)

(assert (=> d!39075 (=> res!62182 e!84109)))

(assert (=> d!39075 (= res!62182 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39075 (= (arrayNoDuplicates!0 (_keys!4540 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23515 (Cons!1696 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)) e!84109)))

(assert (= (and d!39075 (not res!62182)) b!128880))

(assert (= (and b!128880 res!62184) b!128884))

(assert (= (and b!128880 res!62183) b!128882))

(assert (= (and b!128882 c!23700) b!128881))

(assert (= (and b!128882 (not c!23700)) b!128883))

(assert (= (or b!128881 b!128883) bm!13939))

(assert (=> b!128880 m!150441))

(assert (=> b!128880 m!150441))

(assert (=> b!128880 m!150595))

(assert (=> b!128882 m!150441))

(assert (=> b!128882 m!150441))

(assert (=> b!128882 m!150595))

(assert (=> b!128884 m!150441))

(assert (=> b!128884 m!150441))

(declare-fun m!150949 () Bool)

(assert (=> b!128884 m!150949))

(assert (=> bm!13939 m!150441))

(declare-fun m!150951 () Bool)

(assert (=> bm!13939 m!150951))

(assert (=> bm!13862 d!39075))

(declare-fun d!39077 () Bool)

(declare-fun e!84114 () Bool)

(assert (=> d!39077 e!84114))

(declare-fun res!62185 () Bool)

(assert (=> d!39077 (=> res!62185 e!84114)))

(declare-fun lt!66730 () Bool)

(assert (=> d!39077 (= res!62185 (not lt!66730))))

(declare-fun lt!66731 () Bool)

(assert (=> d!39077 (= lt!66730 lt!66731)))

(declare-fun lt!66729 () Unit!3980)

(declare-fun e!84113 () Unit!3980)

(assert (=> d!39077 (= lt!66729 e!84113)))

(declare-fun c!23701 () Bool)

(assert (=> d!39077 (= c!23701 lt!66731)))

(assert (=> d!39077 (= lt!66731 (containsKey!170 (toList!844 lt!66249) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39077 (= (contains!873 lt!66249 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) lt!66730)))

(declare-fun b!128885 () Bool)

(declare-fun lt!66728 () Unit!3980)

(assert (=> b!128885 (= e!84113 lt!66728)))

(assert (=> b!128885 (= lt!66728 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66249) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128885 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128886 () Bool)

(declare-fun Unit!4020 () Unit!3980)

(assert (=> b!128886 (= e!84113 Unit!4020)))

(declare-fun b!128887 () Bool)

(assert (=> b!128887 (= e!84114 (isDefined!120 (getValueByKey!166 (toList!844 lt!66249) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39077 c!23701) b!128885))

(assert (= (and d!39077 (not c!23701)) b!128886))

(assert (= (and d!39077 (not res!62185)) b!128887))

(assert (=> d!39077 m!149575))

(declare-fun m!150953 () Bool)

(assert (=> d!39077 m!150953))

(assert (=> b!128885 m!149575))

(declare-fun m!150955 () Bool)

(assert (=> b!128885 m!150955))

(assert (=> b!128885 m!149575))

(declare-fun m!150957 () Bool)

(assert (=> b!128885 m!150957))

(assert (=> b!128885 m!150957))

(declare-fun m!150959 () Bool)

(assert (=> b!128885 m!150959))

(assert (=> b!128887 m!149575))

(assert (=> b!128887 m!150957))

(assert (=> b!128887 m!150957))

(assert (=> b!128887 m!150959))

(assert (=> b!128170 d!39077))

(assert (=> bm!13877 d!38693))

(declare-fun lt!66732 () Bool)

(declare-fun d!39079 () Bool)

(assert (=> d!39079 (= lt!66732 (select (content!127 (toList!844 lt!66320)) (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun e!84115 () Bool)

(assert (=> d!39079 (= lt!66732 e!84115)))

(declare-fun res!62186 () Bool)

(assert (=> d!39079 (=> (not res!62186) (not e!84115))))

(assert (=> d!39079 (= res!62186 ((_ is Cons!1694) (toList!844 lt!66320)))))

(assert (=> d!39079 (= (contains!874 (toList!844 lt!66320) (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66732)))

(declare-fun b!128888 () Bool)

(declare-fun e!84116 () Bool)

(assert (=> b!128888 (= e!84115 e!84116)))

(declare-fun res!62187 () Bool)

(assert (=> b!128888 (=> res!62187 e!84116)))

(assert (=> b!128888 (= res!62187 (= (h!2297 (toList!844 lt!66320)) (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!128889 () Bool)

(assert (=> b!128889 (= e!84116 (contains!874 (t!6068 (toList!844 lt!66320)) (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!39079 res!62186) b!128888))

(assert (= (and b!128888 (not res!62187)) b!128889))

(declare-fun m!150961 () Bool)

(assert (=> d!39079 m!150961))

(declare-fun m!150963 () Bool)

(assert (=> d!39079 m!150963))

(declare-fun m!150965 () Bool)

(assert (=> b!128889 m!150965))

(assert (=> b!128277 d!39079))

(declare-fun d!39081 () Bool)

(assert (=> d!39081 (= (apply!112 lt!66227 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66227) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5334 () Bool)

(assert (= bs!5334 d!39081))

(assert (=> bs!5334 m!150727))

(assert (=> bs!5334 m!150727))

(declare-fun m!150967 () Bool)

(assert (=> bs!5334 m!150967))

(assert (=> b!128145 d!39081))

(declare-fun d!39083 () Bool)

(assert (=> d!39083 (= (get!1456 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3143 (getValueByKey!166 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38709 d!39083))

(assert (=> d!38709 d!38969))

(declare-fun d!39085 () Bool)

(assert (=> d!39085 (= (get!1456 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3143 (getValueByKey!166 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38695 d!39085))

(assert (=> d!38695 d!38829))

(declare-fun d!39087 () Bool)

(assert (=> d!39087 (= (inRange!0 (ite c!23511 (index!3252 lt!66275) (index!3255 lt!66275)) (mask!7071 newMap!16)) (and (bvsge (ite c!23511 (index!3252 lt!66275) (index!3255 lt!66275)) #b00000000000000000000000000000000) (bvslt (ite c!23511 (index!3252 lt!66275) (index!3255 lt!66275)) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13858 d!39087))

(declare-fun d!39089 () Bool)

(assert (=> d!39089 (= (apply!112 lt!66181 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1456 (getValueByKey!166 (toList!844 lt!66181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5335 () Bool)

(assert (= bs!5335 d!39089))

(assert (=> bs!5335 m!150797))

(assert (=> bs!5335 m!150797))

(declare-fun m!150969 () Bool)

(assert (=> bs!5335 m!150969))

(assert (=> b!128095 d!39089))

(declare-fun d!39091 () Bool)

(declare-fun e!84117 () Bool)

(assert (=> d!39091 e!84117))

(declare-fun res!62188 () Bool)

(assert (=> d!39091 (=> (not res!62188) (not e!84117))))

(declare-fun lt!66736 () ListLongMap!1657)

(assert (=> d!39091 (= res!62188 (contains!873 lt!66736 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66735 () List!1698)

(assert (=> d!39091 (= lt!66736 (ListLongMap!1658 lt!66735))))

(declare-fun lt!66734 () Unit!3980)

(declare-fun lt!66733 () Unit!3980)

(assert (=> d!39091 (= lt!66734 lt!66733)))

(assert (=> d!39091 (= (getValueByKey!166 lt!66735 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39091 (= lt!66733 (lemmaContainsTupThenGetReturnValue!84 lt!66735 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39091 (= lt!66735 (insertStrictlySorted!87 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39091 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66736)))

(declare-fun b!128890 () Bool)

(declare-fun res!62189 () Bool)

(assert (=> b!128890 (=> (not res!62189) (not e!84117))))

(assert (=> b!128890 (= res!62189 (= (getValueByKey!166 (toList!844 lt!66736) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128891 () Bool)

(assert (=> b!128891 (= e!84117 (contains!874 (toList!844 lt!66736) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39091 res!62188) b!128890))

(assert (= (and b!128890 res!62189) b!128891))

(declare-fun m!150971 () Bool)

(assert (=> d!39091 m!150971))

(declare-fun m!150973 () Bool)

(assert (=> d!39091 m!150973))

(declare-fun m!150975 () Bool)

(assert (=> d!39091 m!150975))

(declare-fun m!150977 () Bool)

(assert (=> d!39091 m!150977))

(declare-fun m!150979 () Bool)

(assert (=> b!128890 m!150979))

(declare-fun m!150981 () Bool)

(assert (=> b!128891 m!150981))

(assert (=> d!38783 d!39091))

(assert (=> d!38783 d!38707))

(declare-fun d!39093 () Bool)

(assert (=> d!39093 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39093 true))

(declare-fun _$8!112 () Unit!3980)

(assert (=> d!39093 (= (choose!788 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) _$8!112)))

(declare-fun bs!5336 () Bool)

(assert (= bs!5336 d!39093))

(assert (=> bs!5336 m!149437))

(assert (=> bs!5336 m!149437))

(assert (=> bs!5336 m!149993))

(assert (=> bs!5336 m!149343))

(assert (=> bs!5336 m!149995))

(assert (=> d!38783 d!39093))

(declare-fun bm!13940 () Bool)

(declare-fun call!13946 () Bool)

(declare-fun lt!66742 () ListLongMap!1657)

(assert (=> bm!13940 (= call!13946 (contains!873 lt!66742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13941 () Bool)

(declare-fun call!13947 () ListLongMap!1657)

(declare-fun call!13949 () ListLongMap!1657)

(assert (=> bm!13941 (= call!13947 call!13949)))

(declare-fun b!128892 () Bool)

(declare-fun e!84122 () Unit!3980)

(declare-fun Unit!4021 () Unit!3980)

(assert (=> b!128892 (= e!84122 Unit!4021)))

(declare-fun b!128893 () Bool)

(declare-fun e!84120 () Bool)

(declare-fun call!13948 () Bool)

(assert (=> b!128893 (= e!84120 (not call!13948))))

(declare-fun b!128894 () Bool)

(declare-fun e!84127 () Bool)

(assert (=> b!128894 (= e!84120 e!84127)))

(declare-fun res!62191 () Bool)

(assert (=> b!128894 (= res!62191 call!13948)))

(assert (=> b!128894 (=> (not res!62191) (not e!84127))))

(declare-fun b!128895 () Bool)

(declare-fun res!62190 () Bool)

(declare-fun e!84126 () Bool)

(assert (=> b!128895 (=> (not res!62190) (not e!84126))))

(declare-fun e!84119 () Bool)

(assert (=> b!128895 (= res!62190 e!84119)))

(declare-fun res!62197 () Bool)

(assert (=> b!128895 (=> res!62197 e!84119)))

(declare-fun e!84128 () Bool)

(assert (=> b!128895 (= res!62197 (not e!84128))))

(declare-fun res!62192 () Bool)

(assert (=> b!128895 (=> (not res!62192) (not e!84128))))

(assert (=> b!128895 (= res!62192 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128896 () Bool)

(declare-fun e!84130 () ListLongMap!1657)

(declare-fun e!84118 () ListLongMap!1657)

(assert (=> b!128896 (= e!84130 e!84118)))

(declare-fun c!23704 () Bool)

(assert (=> b!128896 (= c!23704 (and (not (= (bvand lt!66137 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66137 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128897 () Bool)

(declare-fun e!84123 () Bool)

(assert (=> b!128897 (= e!84123 (not call!13946))))

(declare-fun d!39095 () Bool)

(assert (=> d!39095 e!84126))

(declare-fun res!62196 () Bool)

(assert (=> d!39095 (=> (not res!62196) (not e!84126))))

(assert (=> d!39095 (= res!62196 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66739 () ListLongMap!1657)

(assert (=> d!39095 (= lt!66742 lt!66739)))

(declare-fun lt!66751 () Unit!3980)

(assert (=> d!39095 (= lt!66751 e!84122)))

(declare-fun c!23703 () Bool)

(declare-fun e!84121 () Bool)

(assert (=> d!39095 (= c!23703 e!84121)))

(declare-fun res!62194 () Bool)

(assert (=> d!39095 (=> (not res!62194) (not e!84121))))

(assert (=> d!39095 (= res!62194 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39095 (= lt!66739 e!84130)))

(declare-fun c!23702 () Bool)

(assert (=> d!39095 (= c!23702 (and (not (= (bvand lt!66137 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66137 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39095 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39095 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66742)))

(declare-fun b!128898 () Bool)

(assert (=> b!128898 (= e!84118 call!13947)))

(declare-fun b!128899 () Bool)

(declare-fun e!84129 () Bool)

(assert (=> b!128899 (= e!84129 (= (apply!112 lt!66742 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (_values!2787 newMap!16))))))

(assert (=> b!128899 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128900 () Bool)

(assert (=> b!128900 (= e!84130 (+!159 call!13949 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128901 () Bool)

(assert (=> b!128901 (= e!84126 e!84123)))

(declare-fun c!23706 () Bool)

(assert (=> b!128901 (= c!23706 (not (= (bvand lt!66137 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128902 () Bool)

(declare-fun e!84124 () ListLongMap!1657)

(assert (=> b!128902 (= e!84124 call!13947)))

(declare-fun bm!13942 () Bool)

(declare-fun call!13944 () ListLongMap!1657)

(declare-fun call!13945 () ListLongMap!1657)

(assert (=> bm!13942 (= call!13944 call!13945)))

(declare-fun call!13943 () ListLongMap!1657)

(declare-fun bm!13943 () Bool)

(assert (=> bm!13943 (= call!13949 (+!159 (ite c!23702 call!13945 (ite c!23704 call!13944 call!13943)) (ite (or c!23702 c!23704) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84125 () Bool)

(declare-fun b!128903 () Bool)

(assert (=> b!128903 (= e!84125 (= (apply!112 lt!66742 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128904 () Bool)

(assert (=> b!128904 (= e!84124 call!13943)))

(declare-fun b!128905 () Bool)

(assert (=> b!128905 (= e!84127 (= (apply!112 lt!66742 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128906 () Bool)

(assert (=> b!128906 (= e!84128 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13944 () Bool)

(assert (=> bm!13944 (= call!13943 call!13944)))

(declare-fun bm!13945 () Bool)

(assert (=> bm!13945 (= call!13945 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128907 () Bool)

(assert (=> b!128907 (= e!84119 e!84129)))

(declare-fun res!62193 () Bool)

(assert (=> b!128907 (=> (not res!62193) (not e!84129))))

(assert (=> b!128907 (= res!62193 (contains!873 lt!66742 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13946 () Bool)

(assert (=> bm!13946 (= call!13948 (contains!873 lt!66742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128908 () Bool)

(assert (=> b!128908 (= e!84121 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128909 () Bool)

(assert (=> b!128909 (= e!84123 e!84125)))

(declare-fun res!62195 () Bool)

(assert (=> b!128909 (= res!62195 call!13946)))

(assert (=> b!128909 (=> (not res!62195) (not e!84125))))

(declare-fun b!128910 () Bool)

(declare-fun res!62198 () Bool)

(assert (=> b!128910 (=> (not res!62198) (not e!84126))))

(assert (=> b!128910 (= res!62198 e!84120)))

(declare-fun c!23707 () Bool)

(assert (=> b!128910 (= c!23707 (not (= (bvand lt!66137 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128911 () Bool)

(declare-fun c!23705 () Bool)

(assert (=> b!128911 (= c!23705 (and (not (= (bvand lt!66137 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66137 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128911 (= e!84118 e!84124)))

(declare-fun b!128912 () Bool)

(declare-fun lt!66747 () Unit!3980)

(assert (=> b!128912 (= e!84122 lt!66747)))

(declare-fun lt!66748 () ListLongMap!1657)

(assert (=> b!128912 (= lt!66748 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66746 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66746 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66753 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66753 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66743 () Unit!3980)

(assert (=> b!128912 (= lt!66743 (addStillContains!88 lt!66748 lt!66746 (zeroValue!2665 newMap!16) lt!66753))))

(assert (=> b!128912 (contains!873 (+!159 lt!66748 (tuple2!2561 lt!66746 (zeroValue!2665 newMap!16))) lt!66753)))

(declare-fun lt!66738 () Unit!3980)

(assert (=> b!128912 (= lt!66738 lt!66743)))

(declare-fun lt!66744 () ListLongMap!1657)

(assert (=> b!128912 (= lt!66744 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66740 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66740 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66750 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66750 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66758 () Unit!3980)

(assert (=> b!128912 (= lt!66758 (addApplyDifferent!88 lt!66744 lt!66740 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66750))))

(assert (=> b!128912 (= (apply!112 (+!159 lt!66744 (tuple2!2561 lt!66740 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66750) (apply!112 lt!66744 lt!66750))))

(declare-fun lt!66754 () Unit!3980)

(assert (=> b!128912 (= lt!66754 lt!66758)))

(declare-fun lt!66757 () ListLongMap!1657)

(assert (=> b!128912 (= lt!66757 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66752 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66737 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66737 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66741 () Unit!3980)

(assert (=> b!128912 (= lt!66741 (addApplyDifferent!88 lt!66757 lt!66752 (zeroValue!2665 newMap!16) lt!66737))))

(assert (=> b!128912 (= (apply!112 (+!159 lt!66757 (tuple2!2561 lt!66752 (zeroValue!2665 newMap!16))) lt!66737) (apply!112 lt!66757 lt!66737))))

(declare-fun lt!66749 () Unit!3980)

(assert (=> b!128912 (= lt!66749 lt!66741)))

(declare-fun lt!66755 () ListLongMap!1657)

(assert (=> b!128912 (= lt!66755 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66137 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66756 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66745 () (_ BitVec 64))

(assert (=> b!128912 (= lt!66745 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128912 (= lt!66747 (addApplyDifferent!88 lt!66755 lt!66756 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66745))))

(assert (=> b!128912 (= (apply!112 (+!159 lt!66755 (tuple2!2561 lt!66756 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66745) (apply!112 lt!66755 lt!66745))))

(assert (= (and d!39095 c!23702) b!128900))

(assert (= (and d!39095 (not c!23702)) b!128896))

(assert (= (and b!128896 c!23704) b!128898))

(assert (= (and b!128896 (not c!23704)) b!128911))

(assert (= (and b!128911 c!23705) b!128902))

(assert (= (and b!128911 (not c!23705)) b!128904))

(assert (= (or b!128902 b!128904) bm!13944))

(assert (= (or b!128898 bm!13944) bm!13942))

(assert (= (or b!128898 b!128902) bm!13941))

(assert (= (or b!128900 bm!13942) bm!13945))

(assert (= (or b!128900 bm!13941) bm!13943))

(assert (= (and d!39095 res!62194) b!128908))

(assert (= (and d!39095 c!23703) b!128912))

(assert (= (and d!39095 (not c!23703)) b!128892))

(assert (= (and d!39095 res!62196) b!128895))

(assert (= (and b!128895 res!62192) b!128906))

(assert (= (and b!128895 (not res!62197)) b!128907))

(assert (= (and b!128907 res!62193) b!128899))

(assert (= (and b!128895 res!62190) b!128910))

(assert (= (and b!128910 c!23707) b!128894))

(assert (= (and b!128910 (not c!23707)) b!128893))

(assert (= (and b!128894 res!62191) b!128905))

(assert (= (or b!128894 b!128893) bm!13946))

(assert (= (and b!128910 res!62198) b!128901))

(assert (= (and b!128901 c!23706) b!128909))

(assert (= (and b!128901 (not c!23706)) b!128897))

(assert (= (and b!128909 res!62195) b!128903))

(assert (= (or b!128909 b!128897) bm!13940))

(declare-fun b_lambda!5691 () Bool)

(assert (=> (not b_lambda!5691) (not b!128899)))

(assert (=> b!128899 t!6080))

(declare-fun b_and!7953 () Bool)

(assert (= b_and!7949 (and (=> t!6080 result!3889) b_and!7953)))

(assert (=> b!128899 t!6082))

(declare-fun b_and!7955 () Bool)

(assert (= b_and!7951 (and (=> t!6082 result!3891) b_and!7955)))

(declare-fun m!150983 () Bool)

(assert (=> bm!13946 m!150983))

(declare-fun m!150985 () Bool)

(assert (=> b!128905 m!150985))

(assert (=> b!128899 m!149617))

(assert (=> b!128899 m!149619))

(assert (=> b!128899 m!149617))

(assert (=> b!128899 m!149621))

(assert (=> b!128899 m!149575))

(declare-fun m!150987 () Bool)

(assert (=> b!128899 m!150987))

(assert (=> b!128899 m!149619))

(assert (=> b!128899 m!149575))

(declare-fun m!150989 () Bool)

(assert (=> bm!13940 m!150989))

(assert (=> d!39095 m!149585))

(declare-fun m!150991 () Bool)

(assert (=> b!128912 m!150991))

(declare-fun m!150993 () Bool)

(assert (=> b!128912 m!150993))

(declare-fun m!150995 () Bool)

(assert (=> b!128912 m!150995))

(declare-fun m!150997 () Bool)

(assert (=> b!128912 m!150997))

(assert (=> b!128912 m!149343))

(declare-fun m!150999 () Bool)

(assert (=> b!128912 m!150999))

(declare-fun m!151001 () Bool)

(assert (=> b!128912 m!151001))

(assert (=> b!128912 m!150991))

(declare-fun m!151003 () Bool)

(assert (=> b!128912 m!151003))

(declare-fun m!151005 () Bool)

(assert (=> b!128912 m!151005))

(assert (=> b!128912 m!149343))

(declare-fun m!151007 () Bool)

(assert (=> b!128912 m!151007))

(assert (=> b!128912 m!149575))

(declare-fun m!151009 () Bool)

(assert (=> b!128912 m!151009))

(declare-fun m!151011 () Bool)

(assert (=> b!128912 m!151011))

(declare-fun m!151013 () Bool)

(assert (=> b!128912 m!151013))

(assert (=> b!128912 m!151009))

(assert (=> b!128912 m!150997))

(declare-fun m!151015 () Bool)

(assert (=> b!128912 m!151015))

(declare-fun m!151017 () Bool)

(assert (=> b!128912 m!151017))

(assert (=> b!128912 m!149343))

(declare-fun m!151019 () Bool)

(assert (=> b!128912 m!151019))

(assert (=> b!128912 m!151017))

(declare-fun m!151021 () Bool)

(assert (=> b!128912 m!151021))

(assert (=> b!128907 m!149575))

(assert (=> b!128907 m!149575))

(declare-fun m!151023 () Bool)

(assert (=> b!128907 m!151023))

(declare-fun m!151025 () Bool)

(assert (=> bm!13943 m!151025))

(assert (=> b!128908 m!149575))

(assert (=> b!128908 m!149575))

(assert (=> b!128908 m!149663))

(assert (=> b!128906 m!149575))

(assert (=> b!128906 m!149575))

(assert (=> b!128906 m!149663))

(declare-fun m!151027 () Bool)

(assert (=> b!128903 m!151027))

(declare-fun m!151029 () Bool)

(assert (=> b!128900 m!151029))

(assert (=> bm!13945 m!149343))

(assert (=> bm!13945 m!151019))

(assert (=> d!38783 d!39095))

(assert (=> d!38783 d!38895))

(assert (=> d!38727 d!38895))

(declare-fun d!39097 () Bool)

(declare-fun e!84131 () Bool)

(assert (=> d!39097 e!84131))

(declare-fun res!62199 () Bool)

(assert (=> d!39097 (=> (not res!62199) (not e!84131))))

(declare-fun lt!66762 () ListLongMap!1657)

(assert (=> d!39097 (= res!62199 (contains!873 lt!66762 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66761 () List!1698)

(assert (=> d!39097 (= lt!66762 (ListLongMap!1658 lt!66761))))

(declare-fun lt!66760 () Unit!3980)

(declare-fun lt!66759 () Unit!3980)

(assert (=> d!39097 (= lt!66760 lt!66759)))

(assert (=> d!39097 (= (getValueByKey!166 lt!66761 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39097 (= lt!66759 (lemmaContainsTupThenGetReturnValue!84 lt!66761 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39097 (= lt!66761 (insertStrictlySorted!87 (toList!844 call!13868) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39097 (= (+!159 call!13868 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66762)))

(declare-fun b!128913 () Bool)

(declare-fun res!62200 () Bool)

(assert (=> b!128913 (=> (not res!62200) (not e!84131))))

(assert (=> b!128913 (= res!62200 (= (getValueByKey!166 (toList!844 lt!66762) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128914 () Bool)

(assert (=> b!128914 (= e!84131 (contains!874 (toList!844 lt!66762) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39097 res!62199) b!128913))

(assert (= (and b!128913 res!62200) b!128914))

(declare-fun m!151031 () Bool)

(assert (=> d!39097 m!151031))

(declare-fun m!151033 () Bool)

(assert (=> d!39097 m!151033))

(declare-fun m!151035 () Bool)

(assert (=> d!39097 m!151035))

(declare-fun m!151037 () Bool)

(assert (=> d!39097 m!151037))

(declare-fun m!151039 () Bool)

(assert (=> b!128913 m!151039))

(declare-fun m!151041 () Bool)

(assert (=> b!128914 m!151041))

(assert (=> b!128264 d!39097))

(assert (=> b!128264 d!38717))

(declare-fun d!39099 () Bool)

(declare-fun e!84132 () Bool)

(assert (=> d!39099 e!84132))

(declare-fun res!62201 () Bool)

(assert (=> d!39099 (=> (not res!62201) (not e!84132))))

(declare-fun lt!66766 () ListLongMap!1657)

(assert (=> d!39099 (= res!62201 (contains!873 lt!66766 (_1!1291 (tuple2!2561 lt!66302 lt!66304))))))

(declare-fun lt!66765 () List!1698)

(assert (=> d!39099 (= lt!66766 (ListLongMap!1658 lt!66765))))

(declare-fun lt!66764 () Unit!3980)

(declare-fun lt!66763 () Unit!3980)

(assert (=> d!39099 (= lt!66764 lt!66763)))

(assert (=> d!39099 (= (getValueByKey!166 lt!66765 (_1!1291 (tuple2!2561 lt!66302 lt!66304))) (Some!171 (_2!1291 (tuple2!2561 lt!66302 lt!66304))))))

(assert (=> d!39099 (= lt!66763 (lemmaContainsTupThenGetReturnValue!84 lt!66765 (_1!1291 (tuple2!2561 lt!66302 lt!66304)) (_2!1291 (tuple2!2561 lt!66302 lt!66304))))))

(assert (=> d!39099 (= lt!66765 (insertStrictlySorted!87 (toList!844 lt!66299) (_1!1291 (tuple2!2561 lt!66302 lt!66304)) (_2!1291 (tuple2!2561 lt!66302 lt!66304))))))

(assert (=> d!39099 (= (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304)) lt!66766)))

(declare-fun b!128915 () Bool)

(declare-fun res!62202 () Bool)

(assert (=> b!128915 (=> (not res!62202) (not e!84132))))

(assert (=> b!128915 (= res!62202 (= (getValueByKey!166 (toList!844 lt!66766) (_1!1291 (tuple2!2561 lt!66302 lt!66304))) (Some!171 (_2!1291 (tuple2!2561 lt!66302 lt!66304)))))))

(declare-fun b!128916 () Bool)

(assert (=> b!128916 (= e!84132 (contains!874 (toList!844 lt!66766) (tuple2!2561 lt!66302 lt!66304)))))

(assert (= (and d!39099 res!62201) b!128915))

(assert (= (and b!128915 res!62202) b!128916))

(declare-fun m!151043 () Bool)

(assert (=> d!39099 m!151043))

(declare-fun m!151045 () Bool)

(assert (=> d!39099 m!151045))

(declare-fun m!151047 () Bool)

(assert (=> d!39099 m!151047))

(declare-fun m!151049 () Bool)

(assert (=> d!39099 m!151049))

(declare-fun m!151051 () Bool)

(assert (=> b!128915 m!151051))

(declare-fun m!151053 () Bool)

(assert (=> b!128916 m!151053))

(assert (=> b!128264 d!39099))

(declare-fun d!39101 () Bool)

(assert (=> d!39101 (not (contains!873 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304)) lt!66300))))

(declare-fun lt!66769 () Unit!3980)

(declare-fun choose!791 (ListLongMap!1657 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3980)

(assert (=> d!39101 (= lt!66769 (choose!791 lt!66299 lt!66302 lt!66304 lt!66300))))

(declare-fun e!84135 () Bool)

(assert (=> d!39101 e!84135))

(declare-fun res!62205 () Bool)

(assert (=> d!39101 (=> (not res!62205) (not e!84135))))

(assert (=> d!39101 (= res!62205 (not (contains!873 lt!66299 lt!66300)))))

(assert (=> d!39101 (= (addStillNotContains!58 lt!66299 lt!66302 lt!66304 lt!66300) lt!66769)))

(declare-fun b!128920 () Bool)

(assert (=> b!128920 (= e!84135 (not (= lt!66302 lt!66300)))))

(assert (= (and d!39101 res!62205) b!128920))

(assert (=> d!39101 m!149887))

(assert (=> d!39101 m!149887))

(assert (=> d!39101 m!149889))

(declare-fun m!151055 () Bool)

(assert (=> d!39101 m!151055))

(declare-fun m!151057 () Bool)

(assert (=> d!39101 m!151057))

(assert (=> b!128264 d!39101))

(declare-fun d!39103 () Bool)

(declare-fun e!84137 () Bool)

(assert (=> d!39103 e!84137))

(declare-fun res!62206 () Bool)

(assert (=> d!39103 (=> res!62206 e!84137)))

(declare-fun lt!66772 () Bool)

(assert (=> d!39103 (= res!62206 (not lt!66772))))

(declare-fun lt!66773 () Bool)

(assert (=> d!39103 (= lt!66772 lt!66773)))

(declare-fun lt!66771 () Unit!3980)

(declare-fun e!84136 () Unit!3980)

(assert (=> d!39103 (= lt!66771 e!84136)))

(declare-fun c!23708 () Bool)

(assert (=> d!39103 (= c!23708 lt!66773)))

(assert (=> d!39103 (= lt!66773 (containsKey!170 (toList!844 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304))) lt!66300))))

(assert (=> d!39103 (= (contains!873 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304)) lt!66300) lt!66772)))

(declare-fun b!128921 () Bool)

(declare-fun lt!66770 () Unit!3980)

(assert (=> b!128921 (= e!84136 lt!66770)))

(assert (=> b!128921 (= lt!66770 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304))) lt!66300))))

(assert (=> b!128921 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304))) lt!66300))))

(declare-fun b!128922 () Bool)

(declare-fun Unit!4022 () Unit!3980)

(assert (=> b!128922 (= e!84136 Unit!4022)))

(declare-fun b!128923 () Bool)

(assert (=> b!128923 (= e!84137 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66299 (tuple2!2561 lt!66302 lt!66304))) lt!66300)))))

(assert (= (and d!39103 c!23708) b!128921))

(assert (= (and d!39103 (not c!23708)) b!128922))

(assert (= (and d!39103 (not res!62206)) b!128923))

(declare-fun m!151059 () Bool)

(assert (=> d!39103 m!151059))

(declare-fun m!151061 () Bool)

(assert (=> b!128921 m!151061))

(declare-fun m!151063 () Bool)

(assert (=> b!128921 m!151063))

(assert (=> b!128921 m!151063))

(declare-fun m!151065 () Bool)

(assert (=> b!128921 m!151065))

(assert (=> b!128923 m!151063))

(assert (=> b!128923 m!151063))

(assert (=> b!128923 m!151065))

(assert (=> b!128264 d!39103))

(declare-fun b!128942 () Bool)

(declare-fun e!84148 () SeekEntryResult!274)

(declare-fun e!84152 () SeekEntryResult!274)

(assert (=> b!128942 (= e!84148 e!84152)))

(declare-fun lt!66779 () (_ BitVec 64))

(declare-fun c!23715 () Bool)

(assert (=> b!128942 (= c!23715 (or (= lt!66779 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) (= (bvadd lt!66779 lt!66779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128943 () Bool)

(declare-fun lt!66778 () SeekEntryResult!274)

(assert (=> b!128943 (and (bvsge (index!3254 lt!66778) #b00000000000000000000000000000000) (bvslt (index!3254 lt!66778) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!62214 () Bool)

(assert (=> b!128943 (= res!62214 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66778)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun e!84151 () Bool)

(assert (=> b!128943 (=> res!62214 e!84151)))

(declare-fun e!84149 () Bool)

(assert (=> b!128943 (= e!84149 e!84151)))

(declare-fun b!128944 () Bool)

(assert (=> b!128944 (and (bvsge (index!3254 lt!66778) #b00000000000000000000000000000000) (bvslt (index!3254 lt!66778) (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!62215 () Bool)

(assert (=> b!128944 (= res!62215 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128944 (=> res!62215 e!84151)))

(declare-fun b!128945 () Bool)

(assert (=> b!128945 (= e!84148 (Intermediate!274 true (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!128946 () Bool)

(assert (=> b!128946 (= e!84152 (Intermediate!274 false (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun d!39105 () Bool)

(declare-fun e!84150 () Bool)

(assert (=> d!39105 e!84150))

(declare-fun c!23716 () Bool)

(assert (=> d!39105 (= c!23716 (and ((_ is Intermediate!274) lt!66778) (undefined!1086 lt!66778)))))

(assert (=> d!39105 (= lt!66778 e!84148)))

(declare-fun c!23717 () Bool)

(assert (=> d!39105 (= c!23717 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!39105 (= lt!66779 (select (arr!2224 (_keys!4540 newMap!16)) (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16))))))

(assert (=> d!39105 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)) lt!66778)))

(declare-fun b!128947 () Bool)

(assert (=> b!128947 (and (bvsge (index!3254 lt!66778) #b00000000000000000000000000000000) (bvslt (index!3254 lt!66778) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> b!128947 (= e!84151 (= (select (arr!2224 (_keys!4540 newMap!16)) (index!3254 lt!66778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128948 () Bool)

(assert (=> b!128948 (= e!84150 (bvsge (x!15124 lt!66778) #b01111111111111111111111111111110))))

(declare-fun b!128949 () Bool)

(assert (=> b!128949 (= e!84150 e!84149)))

(declare-fun res!62213 () Bool)

(assert (=> b!128949 (= res!62213 (and ((_ is Intermediate!274) lt!66778) (not (undefined!1086 lt!66778)) (bvslt (x!15124 lt!66778) #b01111111111111111111111111111110) (bvsge (x!15124 lt!66778) #b00000000000000000000000000000000) (bvsge (x!15124 lt!66778) #b00000000000000000000000000000000)))))

(assert (=> b!128949 (=> (not res!62213) (not e!84149))))

(declare-fun b!128950 () Bool)

(assert (=> b!128950 (= e!84152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) #b00000000000000000000000000000000 (mask!7071 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(assert (= (and d!39105 c!23717) b!128945))

(assert (= (and d!39105 (not c!23717)) b!128942))

(assert (= (and b!128942 c!23715) b!128946))

(assert (= (and b!128942 (not c!23715)) b!128950))

(assert (= (and d!39105 c!23716) b!128948))

(assert (= (and d!39105 (not c!23716)) b!128949))

(assert (= (and b!128949 res!62213) b!128943))

(assert (= (and b!128943 (not res!62214)) b!128944))

(assert (= (and b!128944 (not res!62215)) b!128947))

(declare-fun m!151067 () Bool)

(assert (=> b!128947 m!151067))

(assert (=> b!128944 m!151067))

(assert (=> d!39105 m!149709))

(declare-fun m!151069 () Bool)

(assert (=> d!39105 m!151069))

(assert (=> d!39105 m!149585))

(assert (=> b!128950 m!149709))

(declare-fun m!151071 () Bool)

(assert (=> b!128950 m!151071))

(assert (=> b!128950 m!151071))

(assert (=> b!128950 m!149345))

(declare-fun m!151073 () Bool)

(assert (=> b!128950 m!151073))

(assert (=> b!128943 m!151067))

(assert (=> d!38723 d!39105))

(declare-fun d!39107 () Bool)

(declare-fun lt!66785 () (_ BitVec 32))

(declare-fun lt!66784 () (_ BitVec 32))

(assert (=> d!39107 (= lt!66785 (bvmul (bvxor lt!66784 (bvlshr lt!66784 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!39107 (= lt!66784 ((_ extract 31 0) (bvand (bvxor (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvlshr (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!39107 (and (bvsge (mask!7071 newMap!16) #b00000000000000000000000000000000) (let ((res!62216 (let ((h!2300 ((_ extract 31 0) (bvand (bvxor (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (bvlshr (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15228 (bvmul (bvxor h!2300 (bvlshr h!2300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15228 (bvlshr x!15228 #b00000000000000000000000000001101)) (mask!7071 newMap!16)))))) (and (bvslt res!62216 (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001)) (bvsge res!62216 #b00000000000000000000000000000000))))))

(assert (=> d!39107 (= (toIndex!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (mask!7071 newMap!16)) (bvand (bvxor lt!66785 (bvlshr lt!66785 #b00000000000000000000000000001101)) (mask!7071 newMap!16)))))

(assert (=> d!38723 d!39107))

(assert (=> d!38723 d!38895))

(declare-fun d!39109 () Bool)

(assert (=> d!39109 (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))

(declare-fun lt!66788 () Unit!3980)

(declare-fun choose!792 (array!4701 array!4703 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) (_ BitVec 32) Int) Unit!3980)

(assert (=> d!39109 (= lt!66788 (choose!792 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39109 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39109 (= (lemmaArrayContainsKeyThenInListMap!38 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66788)))

(declare-fun bs!5337 () Bool)

(assert (= bs!5337 d!39109))

(assert (=> bs!5337 m!149437))

(assert (=> bs!5337 m!149437))

(assert (=> bs!5337 m!149345))

(assert (=> bs!5337 m!149541))

(assert (=> bs!5337 m!149345))

(declare-fun m!151075 () Bool)

(assert (=> bs!5337 m!151075))

(assert (=> bs!5337 m!149585))

(assert (=> b!128341 d!39109))

(assert (=> b!128341 d!38705))

(assert (=> b!128341 d!38707))

(declare-fun d!39111 () Bool)

(declare-fun e!84154 () Bool)

(assert (=> d!39111 e!84154))

(declare-fun res!62217 () Bool)

(assert (=> d!39111 (=> res!62217 e!84154)))

(declare-fun lt!66791 () Bool)

(assert (=> d!39111 (= res!62217 (not lt!66791))))

(declare-fun lt!66792 () Bool)

(assert (=> d!39111 (= lt!66791 lt!66792)))

(declare-fun lt!66790 () Unit!3980)

(declare-fun e!84153 () Unit!3980)

(assert (=> d!39111 (= lt!66790 e!84153)))

(declare-fun c!23718 () Bool)

(assert (=> d!39111 (= c!23718 lt!66792)))

(assert (=> d!39111 (= lt!66792 (containsKey!170 (toList!844 lt!66052) lt!66058))))

(assert (=> d!39111 (= (contains!873 lt!66052 lt!66058) lt!66791)))

(declare-fun b!128951 () Bool)

(declare-fun lt!66789 () Unit!3980)

(assert (=> b!128951 (= e!84153 lt!66789)))

(assert (=> b!128951 (= lt!66789 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66052) lt!66058))))

(assert (=> b!128951 (isDefined!120 (getValueByKey!166 (toList!844 lt!66052) lt!66058))))

(declare-fun b!128952 () Bool)

(declare-fun Unit!4023 () Unit!3980)

(assert (=> b!128952 (= e!84153 Unit!4023)))

(declare-fun b!128953 () Bool)

(assert (=> b!128953 (= e!84154 (isDefined!120 (getValueByKey!166 (toList!844 lt!66052) lt!66058)))))

(assert (= (and d!39111 c!23718) b!128951))

(assert (= (and d!39111 (not c!23718)) b!128952))

(assert (= (and d!39111 (not res!62217)) b!128953))

(declare-fun m!151077 () Bool)

(assert (=> d!39111 m!151077))

(declare-fun m!151079 () Bool)

(assert (=> b!128951 m!151079))

(assert (=> b!128951 m!149915))

(assert (=> b!128951 m!149915))

(declare-fun m!151081 () Bool)

(assert (=> b!128951 m!151081))

(assert (=> b!128953 m!149915))

(assert (=> b!128953 m!149915))

(assert (=> b!128953 m!151081))

(assert (=> d!38757 d!39111))

(assert (=> d!38757 d!38767))

(assert (=> d!38757 d!38755))

(declare-fun d!39113 () Bool)

(assert (=> d!39113 (= (apply!112 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66058) (apply!112 lt!66052 lt!66058))))

(assert (=> d!39113 true))

(declare-fun _$34!962 () Unit!3980)

(assert (=> d!39113 (= (choose!785 lt!66052 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66058) _$34!962)))

(declare-fun bs!5338 () Bool)

(assert (= bs!5338 d!39113))

(assert (=> bs!5338 m!149479))

(assert (=> bs!5338 m!149479))

(assert (=> bs!5338 m!149483))

(assert (=> bs!5338 m!149457))

(assert (=> d!38757 d!39113))

(assert (=> d!38757 d!38761))

(assert (=> b!128357 d!38915))

(assert (=> b!128357 d!38917))

(declare-fun b!128954 () Bool)

(declare-fun e!84156 () Bool)

(declare-fun e!84155 () Bool)

(assert (=> b!128954 (= e!84156 e!84155)))

(assert (=> b!128954 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun res!62221 () Bool)

(declare-fun lt!66798 () ListLongMap!1657)

(assert (=> b!128954 (= res!62221 (contains!873 lt!66798 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128954 (=> (not res!62221) (not e!84155))))

(declare-fun b!128955 () Bool)

(declare-fun e!84159 () Bool)

(assert (=> b!128955 (= e!84159 e!84156)))

(declare-fun c!23720 () Bool)

(declare-fun e!84157 () Bool)

(assert (=> b!128955 (= c!23720 e!84157)))

(declare-fun res!62218 () Bool)

(assert (=> b!128955 (=> (not res!62218) (not e!84157))))

(assert (=> b!128955 (= res!62218 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!128956 () Bool)

(declare-fun e!84158 () Bool)

(assert (=> b!128956 (= e!84156 e!84158)))

(declare-fun c!23722 () Bool)

(assert (=> b!128956 (= c!23722 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun call!13950 () ListLongMap!1657)

(declare-fun bm!13947 () Bool)

(assert (=> bm!13947 (= call!13950 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(declare-fun b!128957 () Bool)

(assert (=> b!128957 (= e!84157 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128957 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128958 () Bool)

(declare-fun e!84161 () ListLongMap!1657)

(assert (=> b!128958 (= e!84161 (ListLongMap!1658 Nil!1695))))

(declare-fun d!39115 () Bool)

(assert (=> d!39115 e!84159))

(declare-fun res!62220 () Bool)

(assert (=> d!39115 (=> (not res!62220) (not e!84159))))

(assert (=> d!39115 (= res!62220 (not (contains!873 lt!66798 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39115 (= lt!66798 e!84161)))

(declare-fun c!23719 () Bool)

(assert (=> d!39115 (= c!23719 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39115 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39115 (= (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66798)))

(declare-fun b!128959 () Bool)

(assert (=> b!128959 (= e!84158 (= lt!66798 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152) (mask!7071 newMap!16) (ite (and c!23467 c!23472) lt!66154 (extraKeys!2581 newMap!16)) (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!128960 () Bool)

(declare-fun e!84160 () ListLongMap!1657)

(assert (=> b!128960 (= e!84161 e!84160)))

(declare-fun c!23721 () Bool)

(assert (=> b!128960 (= c!23721 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128961 () Bool)

(assert (=> b!128961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> b!128961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152))))))

(assert (=> b!128961 (= e!84155 (= (apply!112 lt!66798 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128962 () Bool)

(assert (=> b!128962 (= e!84160 call!13950)))

(declare-fun b!128963 () Bool)

(declare-fun lt!66796 () Unit!3980)

(declare-fun lt!66793 () Unit!3980)

(assert (=> b!128963 (= lt!66796 lt!66793)))

(declare-fun lt!66794 () ListLongMap!1657)

(declare-fun lt!66797 () (_ BitVec 64))

(declare-fun lt!66799 () V!3449)

(declare-fun lt!66795 () (_ BitVec 64))

(assert (=> b!128963 (not (contains!873 (+!159 lt!66794 (tuple2!2561 lt!66797 lt!66799)) lt!66795))))

(assert (=> b!128963 (= lt!66793 (addStillNotContains!58 lt!66794 lt!66797 lt!66799 lt!66795))))

(assert (=> b!128963 (= lt!66795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128963 (= lt!66799 (get!1453 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128963 (= lt!66797 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128963 (= lt!66794 call!13950)))

(assert (=> b!128963 (= e!84160 (+!159 call!13950 (tuple2!2561 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000) (get!1453 (select (arr!2225 (ite (or c!23467 c!23471) (_values!2787 newMap!16) lt!66152)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128964 () Bool)

(declare-fun res!62219 () Bool)

(assert (=> b!128964 (=> (not res!62219) (not e!84159))))

(assert (=> b!128964 (= res!62219 (not (contains!873 lt!66798 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128965 () Bool)

(assert (=> b!128965 (= e!84158 (isEmpty!403 lt!66798))))

(assert (= (and d!39115 c!23719) b!128958))

(assert (= (and d!39115 (not c!23719)) b!128960))

(assert (= (and b!128960 c!23721) b!128963))

(assert (= (and b!128960 (not c!23721)) b!128962))

(assert (= (or b!128963 b!128962) bm!13947))

(assert (= (and d!39115 res!62220) b!128964))

(assert (= (and b!128964 res!62219) b!128955))

(assert (= (and b!128955 res!62218) b!128957))

(assert (= (and b!128955 c!23720) b!128954))

(assert (= (and b!128955 (not c!23720)) b!128956))

(assert (= (and b!128954 res!62221) b!128961))

(assert (= (and b!128956 c!23722) b!128959))

(assert (= (and b!128956 (not c!23722)) b!128965))

(declare-fun b_lambda!5693 () Bool)

(assert (=> (not b_lambda!5693) (not b!128961)))

(assert (=> b!128961 t!6080))

(declare-fun b_and!7957 () Bool)

(assert (= b_and!7953 (and (=> t!6080 result!3889) b_and!7957)))

(assert (=> b!128961 t!6082))

(declare-fun b_and!7959 () Bool)

(assert (= b_and!7955 (and (=> t!6082 result!3891) b_and!7959)))

(declare-fun b_lambda!5695 () Bool)

(assert (=> (not b_lambda!5695) (not b!128963)))

(assert (=> b!128963 t!6080))

(declare-fun b_and!7961 () Bool)

(assert (= b_and!7957 (and (=> t!6080 result!3889) b_and!7961)))

(assert (=> b!128963 t!6082))

(declare-fun b_and!7963 () Bool)

(assert (= b_and!7959 (and (=> t!6082 result!3891) b_and!7963)))

(declare-fun m!151083 () Bool)

(assert (=> b!128964 m!151083))

(assert (=> b!128960 m!149575))

(assert (=> b!128960 m!149575))

(assert (=> b!128960 m!149663))

(declare-fun m!151085 () Bool)

(assert (=> b!128963 m!151085))

(assert (=> b!128963 m!149725))

(assert (=> b!128963 m!149617))

(assert (=> b!128963 m!149727))

(declare-fun m!151087 () Bool)

(assert (=> b!128963 m!151087))

(declare-fun m!151089 () Bool)

(assert (=> b!128963 m!151089))

(assert (=> b!128963 m!149617))

(declare-fun m!151091 () Bool)

(assert (=> b!128963 m!151091))

(assert (=> b!128963 m!149575))

(assert (=> b!128963 m!149725))

(assert (=> b!128963 m!151087))

(assert (=> b!128957 m!149575))

(assert (=> b!128957 m!149575))

(assert (=> b!128957 m!149663))

(declare-fun m!151093 () Bool)

(assert (=> b!128965 m!151093))

(assert (=> b!128954 m!149575))

(assert (=> b!128954 m!149575))

(declare-fun m!151095 () Bool)

(assert (=> b!128954 m!151095))

(declare-fun m!151097 () Bool)

(assert (=> d!39115 m!151097))

(assert (=> d!39115 m!149585))

(declare-fun m!151099 () Bool)

(assert (=> bm!13947 m!151099))

(assert (=> b!128961 m!149725))

(assert (=> b!128961 m!149725))

(assert (=> b!128961 m!149617))

(assert (=> b!128961 m!149727))

(assert (=> b!128961 m!149617))

(assert (=> b!128961 m!149575))

(declare-fun m!151101 () Bool)

(assert (=> b!128961 m!151101))

(assert (=> b!128961 m!149575))

(assert (=> b!128959 m!151099))

(assert (=> bm!13845 d!39115))

(assert (=> b!128260 d!38877))

(assert (=> bm!13859 d!38693))

(declare-fun d!39117 () Bool)

(declare-fun e!84163 () Bool)

(assert (=> d!39117 e!84163))

(declare-fun res!62222 () Bool)

(assert (=> d!39117 (=> res!62222 e!84163)))

(declare-fun lt!66802 () Bool)

(assert (=> d!39117 (= res!62222 (not lt!66802))))

(declare-fun lt!66803 () Bool)

(assert (=> d!39117 (= lt!66802 lt!66803)))

(declare-fun lt!66801 () Unit!3980)

(declare-fun e!84162 () Unit!3980)

(assert (=> d!39117 (= lt!66801 e!84162)))

(declare-fun c!23723 () Bool)

(assert (=> d!39117 (= c!23723 lt!66803)))

(assert (=> d!39117 (= lt!66803 (containsKey!170 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39117 (= (contains!873 lt!66451 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66802)))

(declare-fun b!128966 () Bool)

(declare-fun lt!66800 () Unit!3980)

(assert (=> b!128966 (= e!84162 lt!66800)))

(assert (=> b!128966 (= lt!66800 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!128966 (isDefined!120 (getValueByKey!166 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128967 () Bool)

(declare-fun Unit!4024 () Unit!3980)

(assert (=> b!128967 (= e!84162 Unit!4024)))

(declare-fun b!128968 () Bool)

(assert (=> b!128968 (= e!84163 (isDefined!120 (getValueByKey!166 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39117 c!23723) b!128966))

(assert (= (and d!39117 (not c!23723)) b!128967))

(assert (= (and d!39117 (not res!62222)) b!128968))

(declare-fun m!151103 () Bool)

(assert (=> d!39117 m!151103))

(declare-fun m!151105 () Bool)

(assert (=> b!128966 m!151105))

(assert (=> b!128966 m!150101))

(assert (=> b!128966 m!150101))

(declare-fun m!151107 () Bool)

(assert (=> b!128966 m!151107))

(assert (=> b!128968 m!150101))

(assert (=> b!128968 m!150101))

(assert (=> b!128968 m!151107))

(assert (=> d!38803 d!39117))

(declare-fun b!128969 () Bool)

(declare-fun e!84164 () Option!172)

(assert (=> b!128969 (= e!84164 (Some!171 (_2!1291 (h!2297 lt!66450))))))

(declare-fun b!128972 () Bool)

(declare-fun e!84165 () Option!172)

(assert (=> b!128972 (= e!84165 None!170)))

(declare-fun b!128971 () Bool)

(assert (=> b!128971 (= e!84165 (getValueByKey!166 (t!6068 lt!66450) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23724 () Bool)

(declare-fun d!39119 () Bool)

(assert (=> d!39119 (= c!23724 (and ((_ is Cons!1694) lt!66450) (= (_1!1291 (h!2297 lt!66450)) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39119 (= (getValueByKey!166 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84164)))

(declare-fun b!128970 () Bool)

(assert (=> b!128970 (= e!84164 e!84165)))

(declare-fun c!23725 () Bool)

(assert (=> b!128970 (= c!23725 (and ((_ is Cons!1694) lt!66450) (not (= (_1!1291 (h!2297 lt!66450)) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39119 c!23724) b!128969))

(assert (= (and d!39119 (not c!23724)) b!128970))

(assert (= (and b!128970 c!23725) b!128971))

(assert (= (and b!128970 (not c!23725)) b!128972))

(declare-fun m!151109 () Bool)

(assert (=> b!128971 m!151109))

(assert (=> d!38803 d!39119))

(declare-fun d!39121 () Bool)

(assert (=> d!39121 (= (getValueByKey!166 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66804 () Unit!3980)

(assert (=> d!39121 (= lt!66804 (choose!790 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84166 () Bool)

(assert (=> d!39121 e!84166))

(declare-fun res!62223 () Bool)

(assert (=> d!39121 (=> (not res!62223) (not e!84166))))

(assert (=> d!39121 (= res!62223 (isStrictlySorted!313 lt!66450))))

(assert (=> d!39121 (= (lemmaContainsTupThenGetReturnValue!84 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66804)))

(declare-fun b!128973 () Bool)

(declare-fun res!62224 () Bool)

(assert (=> b!128973 (=> (not res!62224) (not e!84166))))

(assert (=> b!128973 (= res!62224 (containsKey!170 lt!66450 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128974 () Bool)

(assert (=> b!128974 (= e!84166 (contains!874 lt!66450 (tuple2!2561 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39121 res!62223) b!128973))

(assert (= (and b!128973 res!62224) b!128974))

(assert (=> d!39121 m!150095))

(declare-fun m!151111 () Bool)

(assert (=> d!39121 m!151111))

(declare-fun m!151113 () Bool)

(assert (=> d!39121 m!151113))

(declare-fun m!151115 () Bool)

(assert (=> b!128973 m!151115))

(declare-fun m!151117 () Bool)

(assert (=> b!128974 m!151117))

(assert (=> d!38803 d!39121))

(declare-fun b!128975 () Bool)

(declare-fun e!84171 () List!1698)

(declare-fun call!13951 () List!1698)

(assert (=> b!128975 (= e!84171 call!13951)))

(declare-fun b!128976 () Bool)

(declare-fun e!84167 () List!1698)

(declare-fun call!13953 () List!1698)

(assert (=> b!128976 (= e!84167 call!13953)))

(declare-fun e!84169 () Bool)

(declare-fun b!128977 () Bool)

(declare-fun lt!66805 () List!1698)

(assert (=> b!128977 (= e!84169 (contains!874 lt!66805 (tuple2!2561 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84168 () List!1698)

(declare-fun b!128978 () Bool)

(assert (=> b!128978 (= e!84168 (insertStrictlySorted!87 (t!6068 (toList!844 call!13831)) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13948 () Bool)

(declare-fun call!13952 () List!1698)

(assert (=> bm!13948 (= call!13953 call!13952)))

(declare-fun b!128979 () Bool)

(declare-fun e!84170 () List!1698)

(assert (=> b!128979 (= e!84170 call!13952)))

(declare-fun c!23727 () Bool)

(declare-fun bm!13949 () Bool)

(assert (=> bm!13949 (= call!13951 ($colon$colon!89 e!84168 (ite c!23727 (h!2297 (toList!844 call!13831)) (tuple2!2561 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23729 () Bool)

(assert (=> bm!13949 (= c!23729 c!23727)))

(declare-fun b!128980 () Bool)

(assert (=> b!128980 (= e!84171 e!84170)))

(declare-fun c!23728 () Bool)

(assert (=> b!128980 (= c!23728 (and ((_ is Cons!1694) (toList!844 call!13831)) (= (_1!1291 (h!2297 (toList!844 call!13831))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128981 () Bool)

(declare-fun c!23726 () Bool)

(assert (=> b!128981 (= c!23726 (and ((_ is Cons!1694) (toList!844 call!13831)) (bvsgt (_1!1291 (h!2297 (toList!844 call!13831))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!128981 (= e!84170 e!84167)))

(declare-fun b!128982 () Bool)

(assert (=> b!128982 (= e!84168 (ite c!23728 (t!6068 (toList!844 call!13831)) (ite c!23726 (Cons!1694 (h!2297 (toList!844 call!13831)) (t!6068 (toList!844 call!13831))) Nil!1695)))))

(declare-fun b!128983 () Bool)

(declare-fun res!62225 () Bool)

(assert (=> b!128983 (=> (not res!62225) (not e!84169))))

(assert (=> b!128983 (= res!62225 (containsKey!170 lt!66805 (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128984 () Bool)

(assert (=> b!128984 (= e!84167 call!13953)))

(declare-fun bm!13950 () Bool)

(assert (=> bm!13950 (= call!13952 call!13951)))

(declare-fun d!39123 () Bool)

(assert (=> d!39123 e!84169))

(declare-fun res!62226 () Bool)

(assert (=> d!39123 (=> (not res!62226) (not e!84169))))

(assert (=> d!39123 (= res!62226 (isStrictlySorted!313 lt!66805))))

(assert (=> d!39123 (= lt!66805 e!84171)))

(assert (=> d!39123 (= c!23727 (and ((_ is Cons!1694) (toList!844 call!13831)) (bvslt (_1!1291 (h!2297 (toList!844 call!13831))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39123 (isStrictlySorted!313 (toList!844 call!13831))))

(assert (=> d!39123 (= (insertStrictlySorted!87 (toList!844 call!13831) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66805)))

(assert (= (and d!39123 c!23727) b!128975))

(assert (= (and d!39123 (not c!23727)) b!128980))

(assert (= (and b!128980 c!23728) b!128979))

(assert (= (and b!128980 (not c!23728)) b!128981))

(assert (= (and b!128981 c!23726) b!128984))

(assert (= (and b!128981 (not c!23726)) b!128976))

(assert (= (or b!128984 b!128976) bm!13948))

(assert (= (or b!128979 bm!13948) bm!13950))

(assert (= (or b!128975 bm!13950) bm!13949))

(assert (= (and bm!13949 c!23729) b!128978))

(assert (= (and bm!13949 (not c!23729)) b!128982))

(assert (= (and d!39123 res!62226) b!128983))

(assert (= (and b!128983 res!62225) b!128977))

(declare-fun m!151119 () Bool)

(assert (=> b!128978 m!151119))

(declare-fun m!151121 () Bool)

(assert (=> bm!13949 m!151121))

(declare-fun m!151123 () Bool)

(assert (=> b!128983 m!151123))

(declare-fun m!151125 () Bool)

(assert (=> d!39123 m!151125))

(declare-fun m!151127 () Bool)

(assert (=> d!39123 m!151127))

(declare-fun m!151129 () Bool)

(assert (=> b!128977 m!151129))

(assert (=> d!38803 d!39123))

(declare-fun d!39125 () Bool)

(declare-fun res!62227 () Bool)

(declare-fun e!84172 () Bool)

(assert (=> d!39125 (=> res!62227 e!84172)))

(assert (=> d!39125 (= res!62227 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39125 (= (containsKey!170 (toList!844 lt!66050) #b0000000000000000000000000000000000000000000000000000000000000000) e!84172)))

(declare-fun b!128985 () Bool)

(declare-fun e!84173 () Bool)

(assert (=> b!128985 (= e!84172 e!84173)))

(declare-fun res!62228 () Bool)

(assert (=> b!128985 (=> (not res!62228) (not e!84173))))

(assert (=> b!128985 (= res!62228 (and (or (not ((_ is Cons!1694) (toList!844 lt!66050))) (bvsle (_1!1291 (h!2297 (toList!844 lt!66050))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1694) (toList!844 lt!66050)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66050))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128986 () Bool)

(assert (=> b!128986 (= e!84173 (containsKey!170 (t!6068 (toList!844 lt!66050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39125 (not res!62227)) b!128985))

(assert (= (and b!128985 res!62228) b!128986))

(declare-fun m!151131 () Bool)

(assert (=> b!128986 m!151131))

(assert (=> d!38795 d!39125))

(declare-fun b!128987 () Bool)

(declare-fun e!84174 () Option!172)

(assert (=> b!128987 (= e!84174 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66451)))))))

(declare-fun b!128990 () Bool)

(declare-fun e!84175 () Option!172)

(assert (=> b!128990 (= e!84175 None!170)))

(declare-fun b!128989 () Bool)

(assert (=> b!128989 (= e!84175 (getValueByKey!166 (t!6068 (toList!844 lt!66451)) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23730 () Bool)

(declare-fun d!39127 () Bool)

(assert (=> d!39127 (= c!23730 (and ((_ is Cons!1694) (toList!844 lt!66451)) (= (_1!1291 (h!2297 (toList!844 lt!66451))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39127 (= (getValueByKey!166 (toList!844 lt!66451) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84174)))

(declare-fun b!128988 () Bool)

(assert (=> b!128988 (= e!84174 e!84175)))

(declare-fun c!23731 () Bool)

(assert (=> b!128988 (= c!23731 (and ((_ is Cons!1694) (toList!844 lt!66451)) (not (= (_1!1291 (h!2297 (toList!844 lt!66451))) (_1!1291 (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39127 c!23730) b!128987))

(assert (= (and d!39127 (not c!23730)) b!128988))

(assert (= (and b!128988 c!23731) b!128989))

(assert (= (and b!128988 (not c!23731)) b!128990))

(declare-fun m!151133 () Bool)

(assert (=> b!128989 m!151133))

(assert (=> b!128387 d!39127))

(declare-fun d!39129 () Bool)

(assert (=> d!39129 (= (apply!112 lt!66249 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1456 (getValueByKey!166 (toList!844 lt!66249) (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5339 () Bool)

(assert (= bs!5339 d!39129))

(assert (=> bs!5339 m!149575))

(assert (=> bs!5339 m!150957))

(assert (=> bs!5339 m!150957))

(declare-fun m!151135 () Bool)

(assert (=> bs!5339 m!151135))

(assert (=> b!128162 d!39129))

(declare-fun c!23732 () Bool)

(declare-fun d!39131 () Bool)

(assert (=> d!39131 (= c!23732 ((_ is ValueCellFull!1082) (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!84176 () V!3449)

(assert (=> d!39131 (= (get!1453 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84176)))

(declare-fun b!128991 () Bool)

(assert (=> b!128991 (= e!84176 (get!1454 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128992 () Bool)

(assert (=> b!128992 (= e!84176 (get!1455 (select (arr!2225 (ite c!23467 (_values!2787 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39131 c!23732) b!128991))

(assert (= (and d!39131 (not c!23732)) b!128992))

(assert (=> b!128991 m!149777))

(assert (=> b!128991 m!149617))

(declare-fun m!151137 () Bool)

(assert (=> b!128991 m!151137))

(assert (=> b!128992 m!149777))

(assert (=> b!128992 m!149617))

(declare-fun m!151139 () Bool)

(assert (=> b!128992 m!151139))

(assert (=> b!128162 d!39131))

(declare-fun d!39133 () Bool)

(assert (=> d!39133 (= (inRange!0 (ite c!23549 (index!3253 lt!66410) (ite c!23546 (index!3252 lt!66427) (index!3255 lt!66427))) (mask!7071 newMap!16)) (and (bvsge (ite c!23549 (index!3253 lt!66410) (ite c!23546 (index!3252 lt!66427) (index!3255 lt!66427))) #b00000000000000000000000000000000) (bvslt (ite c!23549 (index!3253 lt!66410) (ite c!23546 (index!3252 lt!66427) (index!3255 lt!66427))) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13874 d!39133))

(declare-fun d!39135 () Bool)

(assert (=> d!39135 (= (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66045)) (v!3143 (getValueByKey!166 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66045)))))

(assert (=> d!38743 d!39135))

(declare-fun b!128993 () Bool)

(declare-fun e!84177 () Option!172)

(assert (=> b!128993 (= e!84177 (Some!171 (_2!1291 (h!2297 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(declare-fun b!128996 () Bool)

(declare-fun e!84178 () Option!172)

(assert (=> b!128996 (= e!84178 None!170)))

(declare-fun b!128995 () Bool)

(assert (=> b!128995 (= e!84178 (getValueByKey!166 (t!6068 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66045))))

(declare-fun c!23733 () Bool)

(declare-fun d!39137 () Bool)

(assert (=> d!39137 (= c!23733 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66045)))))

(assert (=> d!39137 (= (getValueByKey!166 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66045) e!84177)))

(declare-fun b!128994 () Bool)

(assert (=> b!128994 (= e!84177 e!84178)))

(declare-fun c!23734 () Bool)

(assert (=> b!128994 (= c!23734 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (not (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66065 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66045))))))

(assert (= (and d!39137 c!23733) b!128993))

(assert (= (and d!39137 (not c!23733)) b!128994))

(assert (= (and b!128994 c!23734) b!128995))

(assert (= (and b!128994 (not c!23734)) b!128996))

(declare-fun m!151141 () Bool)

(assert (=> b!128995 m!151141))

(assert (=> d!38743 d!39137))

(declare-fun d!39139 () Bool)

(declare-fun res!62229 () Bool)

(declare-fun e!84181 () Bool)

(assert (=> d!39139 (=> res!62229 e!84181)))

(assert (=> d!39139 (= res!62229 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39139 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4540 newMap!16) (mask!7071 newMap!16)) e!84181)))

(declare-fun b!128997 () Bool)

(declare-fun e!84180 () Bool)

(declare-fun e!84179 () Bool)

(assert (=> b!128997 (= e!84180 e!84179)))

(declare-fun lt!66807 () (_ BitVec 64))

(assert (=> b!128997 (= lt!66807 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!66808 () Unit!3980)

(assert (=> b!128997 (= lt!66808 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4540 newMap!16) lt!66807 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!128997 (arrayContainsKey!0 (_keys!4540 newMap!16) lt!66807 #b00000000000000000000000000000000)))

(declare-fun lt!66806 () Unit!3980)

(assert (=> b!128997 (= lt!66806 lt!66808)))

(declare-fun res!62230 () Bool)

(assert (=> b!128997 (= res!62230 (= (seekEntryOrOpen!0 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4540 newMap!16) (mask!7071 newMap!16)) (Found!274 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!128997 (=> (not res!62230) (not e!84179))))

(declare-fun b!128998 () Bool)

(declare-fun call!13954 () Bool)

(assert (=> b!128998 (= e!84179 call!13954)))

(declare-fun bm!13951 () Bool)

(assert (=> bm!13951 (= call!13954 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4540 newMap!16) (mask!7071 newMap!16)))))

(declare-fun b!128999 () Bool)

(assert (=> b!128999 (= e!84181 e!84180)))

(declare-fun c!23735 () Bool)

(assert (=> b!128999 (= c!23735 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!129000 () Bool)

(assert (=> b!129000 (= e!84180 call!13954)))

(assert (= (and d!39139 (not res!62229)) b!128999))

(assert (= (and b!128999 c!23735) b!128997))

(assert (= (and b!128999 (not c!23735)) b!129000))

(assert (= (and b!128997 res!62230) b!128998))

(assert (= (or b!128998 b!129000) bm!13951))

(assert (=> b!128997 m!150441))

(declare-fun m!151143 () Bool)

(assert (=> b!128997 m!151143))

(declare-fun m!151145 () Bool)

(assert (=> b!128997 m!151145))

(assert (=> b!128997 m!150441))

(declare-fun m!151147 () Bool)

(assert (=> b!128997 m!151147))

(declare-fun m!151149 () Bool)

(assert (=> bm!13951 m!151149))

(assert (=> b!128999 m!150441))

(assert (=> b!128999 m!150441))

(assert (=> b!128999 m!150595))

(assert (=> bm!13883 d!39139))

(declare-fun d!39141 () Bool)

(assert (=> d!39141 (= (get!1456 (getValueByKey!166 (toList!844 lt!66065) lt!66045)) (v!3143 (getValueByKey!166 (toList!844 lt!66065) lt!66045)))))

(assert (=> d!38771 d!39141))

(declare-fun b!129001 () Bool)

(declare-fun e!84182 () Option!172)

(assert (=> b!129001 (= e!84182 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66065)))))))

(declare-fun b!129004 () Bool)

(declare-fun e!84183 () Option!172)

(assert (=> b!129004 (= e!84183 None!170)))

(declare-fun b!129003 () Bool)

(assert (=> b!129003 (= e!84183 (getValueByKey!166 (t!6068 (toList!844 lt!66065)) lt!66045))))

(declare-fun d!39143 () Bool)

(declare-fun c!23736 () Bool)

(assert (=> d!39143 (= c!23736 (and ((_ is Cons!1694) (toList!844 lt!66065)) (= (_1!1291 (h!2297 (toList!844 lt!66065))) lt!66045)))))

(assert (=> d!39143 (= (getValueByKey!166 (toList!844 lt!66065) lt!66045) e!84182)))

(declare-fun b!129002 () Bool)

(assert (=> b!129002 (= e!84182 e!84183)))

(declare-fun c!23737 () Bool)

(assert (=> b!129002 (= c!23737 (and ((_ is Cons!1694) (toList!844 lt!66065)) (not (= (_1!1291 (h!2297 (toList!844 lt!66065))) lt!66045))))))

(assert (= (and d!39143 c!23736) b!129001))

(assert (= (and d!39143 (not c!23736)) b!129002))

(assert (= (and b!129002 c!23737) b!129003))

(assert (= (and b!129002 (not c!23737)) b!129004))

(declare-fun m!151151 () Bool)

(assert (=> b!129003 m!151151))

(assert (=> d!38771 d!39143))

(declare-fun d!39145 () Bool)

(declare-fun e!84185 () Bool)

(assert (=> d!39145 e!84185))

(declare-fun res!62231 () Bool)

(assert (=> d!39145 (=> res!62231 e!84185)))

(declare-fun lt!66811 () Bool)

(assert (=> d!39145 (= res!62231 (not lt!66811))))

(declare-fun lt!66812 () Bool)

(assert (=> d!39145 (= lt!66811 lt!66812)))

(declare-fun lt!66810 () Unit!3980)

(declare-fun e!84184 () Unit!3980)

(assert (=> d!39145 (= lt!66810 e!84184)))

(declare-fun c!23738 () Bool)

(assert (=> d!39145 (= c!23738 lt!66812)))

(assert (=> d!39145 (= lt!66812 (containsKey!170 (toList!844 lt!66303) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39145 (= (contains!873 lt!66303 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66811)))

(declare-fun b!129005 () Bool)

(declare-fun lt!66809 () Unit!3980)

(assert (=> b!129005 (= e!84184 lt!66809)))

(assert (=> b!129005 (= lt!66809 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66303) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129005 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129006 () Bool)

(declare-fun Unit!4025 () Unit!3980)

(assert (=> b!129006 (= e!84184 Unit!4025)))

(declare-fun b!129007 () Bool)

(assert (=> b!129007 (= e!84185 (isDefined!120 (getValueByKey!166 (toList!844 lt!66303) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39145 c!23738) b!129005))

(assert (= (and d!39145 (not c!23738)) b!129006))

(assert (= (and d!39145 (not res!62231)) b!129007))

(assert (=> d!39145 m!149447))

(declare-fun m!151153 () Bool)

(assert (=> d!39145 m!151153))

(assert (=> b!129005 m!149447))

(declare-fun m!151155 () Bool)

(assert (=> b!129005 m!151155))

(assert (=> b!129005 m!149447))

(assert (=> b!129005 m!150437))

(assert (=> b!129005 m!150437))

(declare-fun m!151157 () Bool)

(assert (=> b!129005 m!151157))

(assert (=> b!129007 m!149447))

(assert (=> b!129007 m!150437))

(assert (=> b!129007 m!150437))

(assert (=> b!129007 m!151157))

(assert (=> b!128255 d!39145))

(assert (=> b!128385 d!38879))

(declare-fun d!39147 () Bool)

(assert (=> d!39147 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39147 true))

(declare-fun _$5!128 () Unit!3980)

(assert (=> d!39147 (= (choose!782 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3253 lt!66141) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) _$5!128)))

(declare-fun bs!5340 () Bool)

(assert (= bs!5340 d!39147))

(assert (=> bs!5340 m!149437))

(assert (=> bs!5340 m!149437))

(assert (=> bs!5340 m!149601))

(assert (=> bs!5340 m!149519))

(assert (=> bs!5340 m!149603))

(assert (=> d!38703 d!39147))

(assert (=> d!38703 d!38895))

(declare-fun d!39149 () Bool)

(assert (=> d!39149 (isDefined!120 (getValueByKey!166 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun lt!66813 () Unit!3980)

(assert (=> d!39149 (= lt!66813 (choose!787 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun e!84186 () Bool)

(assert (=> d!39149 e!84186))

(declare-fun res!62232 () Bool)

(assert (=> d!39149 (=> (not res!62232) (not e!84186))))

(assert (=> d!39149 (= res!62232 (isStrictlySorted!313 (toList!844 call!13819)))))

(assert (=> d!39149 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66813)))

(declare-fun b!129008 () Bool)

(assert (=> b!129008 (= e!84186 (containsKey!170 (toList!844 call!13819) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!39149 res!62232) b!129008))

(assert (=> d!39149 m!149345))

(assert (=> d!39149 m!149855))

(assert (=> d!39149 m!149855))

(assert (=> d!39149 m!149857))

(assert (=> d!39149 m!149345))

(declare-fun m!151159 () Bool)

(assert (=> d!39149 m!151159))

(declare-fun m!151161 () Bool)

(assert (=> d!39149 m!151161))

(assert (=> b!129008 m!149345))

(assert (=> b!129008 m!149851))

(assert (=> b!128223 d!39149))

(assert (=> b!128223 d!38973))

(assert (=> b!128223 d!38975))

(declare-fun d!39151 () Bool)

(declare-fun e!84188 () Bool)

(assert (=> d!39151 e!84188))

(declare-fun res!62233 () Bool)

(assert (=> d!39151 (=> res!62233 e!84188)))

(declare-fun lt!66816 () Bool)

(assert (=> d!39151 (= res!62233 (not lt!66816))))

(declare-fun lt!66817 () Bool)

(assert (=> d!39151 (= lt!66816 lt!66817)))

(declare-fun lt!66815 () Unit!3980)

(declare-fun e!84187 () Unit!3980)

(assert (=> d!39151 (= lt!66815 e!84187)))

(declare-fun c!23739 () Bool)

(assert (=> d!39151 (= c!23739 lt!66817)))

(assert (=> d!39151 (= lt!66817 (containsKey!170 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!39151 (= (contains!873 lt!66283 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66816)))

(declare-fun b!129009 () Bool)

(declare-fun lt!66814 () Unit!3980)

(assert (=> b!129009 (= e!84187 lt!66814)))

(assert (=> b!129009 (= lt!66814 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!129009 (isDefined!120 (getValueByKey!166 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129010 () Bool)

(declare-fun Unit!4026 () Unit!3980)

(assert (=> b!129010 (= e!84187 Unit!4026)))

(declare-fun b!129011 () Bool)

(assert (=> b!129011 (= e!84188 (isDefined!120 (getValueByKey!166 (toList!844 lt!66283) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39151 c!23739) b!129009))

(assert (= (and d!39151 (not c!23739)) b!129010))

(assert (= (and d!39151 (not res!62233)) b!129011))

(declare-fun m!151163 () Bool)

(assert (=> d!39151 m!151163))

(declare-fun m!151165 () Bool)

(assert (=> b!129009 m!151165))

(assert (=> b!129009 m!149879))

(assert (=> b!129009 m!149879))

(declare-fun m!151167 () Bool)

(assert (=> b!129009 m!151167))

(assert (=> b!129011 m!149879))

(assert (=> b!129011 m!149879))

(assert (=> b!129011 m!151167))

(assert (=> d!38745 d!39151))

(declare-fun b!129012 () Bool)

(declare-fun e!84189 () Option!172)

(assert (=> b!129012 (= e!84189 (Some!171 (_2!1291 (h!2297 lt!66282))))))

(declare-fun b!129015 () Bool)

(declare-fun e!84190 () Option!172)

(assert (=> b!129015 (= e!84190 None!170)))

(declare-fun b!129014 () Bool)

(assert (=> b!129014 (= e!84190 (getValueByKey!166 (t!6068 lt!66282) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun d!39153 () Bool)

(declare-fun c!23740 () Bool)

(assert (=> d!39153 (= c!23740 (and ((_ is Cons!1694) lt!66282) (= (_1!1291 (h!2297 lt!66282)) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39153 (= (getValueByKey!166 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!84189)))

(declare-fun b!129013 () Bool)

(assert (=> b!129013 (= e!84189 e!84190)))

(declare-fun c!23741 () Bool)

(assert (=> b!129013 (= c!23741 (and ((_ is Cons!1694) lt!66282) (not (= (_1!1291 (h!2297 lt!66282)) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39153 c!23740) b!129012))

(assert (= (and d!39153 (not c!23740)) b!129013))

(assert (= (and b!129013 c!23741) b!129014))

(assert (= (and b!129013 (not c!23741)) b!129015))

(declare-fun m!151169 () Bool)

(assert (=> b!129014 m!151169))

(assert (=> d!38745 d!39153))

(declare-fun d!39155 () Bool)

(assert (=> d!39155 (= (getValueByKey!166 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66818 () Unit!3980)

(assert (=> d!39155 (= lt!66818 (choose!790 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!84191 () Bool)

(assert (=> d!39155 e!84191))

(declare-fun res!62234 () Bool)

(assert (=> d!39155 (=> (not res!62234) (not e!84191))))

(assert (=> d!39155 (= res!62234 (isStrictlySorted!313 lt!66282))))

(assert (=> d!39155 (= (lemmaContainsTupThenGetReturnValue!84 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66818)))

(declare-fun b!129016 () Bool)

(declare-fun res!62235 () Bool)

(assert (=> b!129016 (=> (not res!62235) (not e!84191))))

(assert (=> b!129016 (= res!62235 (containsKey!170 lt!66282 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129017 () Bool)

(assert (=> b!129017 (= e!84191 (contains!874 lt!66282 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39155 res!62234) b!129016))

(assert (= (and b!129016 res!62235) b!129017))

(assert (=> d!39155 m!149873))

(declare-fun m!151171 () Bool)

(assert (=> d!39155 m!151171))

(declare-fun m!151173 () Bool)

(assert (=> d!39155 m!151173))

(declare-fun m!151175 () Bool)

(assert (=> b!129016 m!151175))

(declare-fun m!151177 () Bool)

(assert (=> b!129017 m!151177))

(assert (=> d!38745 d!39155))

(declare-fun b!129018 () Bool)

(declare-fun e!84196 () List!1698)

(declare-fun call!13955 () List!1698)

(assert (=> b!129018 (= e!84196 call!13955)))

(declare-fun b!129019 () Bool)

(declare-fun e!84192 () List!1698)

(declare-fun call!13957 () List!1698)

(assert (=> b!129019 (= e!84192 call!13957)))

(declare-fun e!84194 () Bool)

(declare-fun lt!66819 () List!1698)

(declare-fun b!129020 () Bool)

(assert (=> b!129020 (= e!84194 (contains!874 lt!66819 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun e!84193 () List!1698)

(declare-fun b!129021 () Bool)

(assert (=> b!129021 (= e!84193 (insertStrictlySorted!87 (t!6068 (toList!844 lt!66056)) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun bm!13952 () Bool)

(declare-fun call!13956 () List!1698)

(assert (=> bm!13952 (= call!13957 call!13956)))

(declare-fun b!129022 () Bool)

(declare-fun e!84195 () List!1698)

(assert (=> b!129022 (= e!84195 call!13956)))

(declare-fun c!23743 () Bool)

(declare-fun bm!13953 () Bool)

(assert (=> bm!13953 (= call!13955 ($colon$colon!89 e!84193 (ite c!23743 (h!2297 (toList!844 lt!66056)) (tuple2!2561 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23745 () Bool)

(assert (=> bm!13953 (= c!23745 c!23743)))

(declare-fun b!129023 () Bool)

(assert (=> b!129023 (= e!84196 e!84195)))

(declare-fun c!23744 () Bool)

(assert (=> b!129023 (= c!23744 (and ((_ is Cons!1694) (toList!844 lt!66056)) (= (_1!1291 (h!2297 (toList!844 lt!66056))) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun c!23742 () Bool)

(declare-fun b!129024 () Bool)

(assert (=> b!129024 (= c!23742 (and ((_ is Cons!1694) (toList!844 lt!66056)) (bvsgt (_1!1291 (h!2297 (toList!844 lt!66056))) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!129024 (= e!84195 e!84192)))

(declare-fun b!129025 () Bool)

(assert (=> b!129025 (= e!84193 (ite c!23744 (t!6068 (toList!844 lt!66056)) (ite c!23742 (Cons!1694 (h!2297 (toList!844 lt!66056)) (t!6068 (toList!844 lt!66056))) Nil!1695)))))

(declare-fun b!129026 () Bool)

(declare-fun res!62236 () Bool)

(assert (=> b!129026 (=> (not res!62236) (not e!84194))))

(assert (=> b!129026 (= res!62236 (containsKey!170 lt!66819 (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129027 () Bool)

(assert (=> b!129027 (= e!84192 call!13957)))

(declare-fun bm!13954 () Bool)

(assert (=> bm!13954 (= call!13956 call!13955)))

(declare-fun d!39157 () Bool)

(assert (=> d!39157 e!84194))

(declare-fun res!62237 () Bool)

(assert (=> d!39157 (=> (not res!62237) (not e!84194))))

(assert (=> d!39157 (= res!62237 (isStrictlySorted!313 lt!66819))))

(assert (=> d!39157 (= lt!66819 e!84196)))

(assert (=> d!39157 (= c!23743 (and ((_ is Cons!1694) (toList!844 lt!66056)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66056))) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39157 (isStrictlySorted!313 (toList!844 lt!66056))))

(assert (=> d!39157 (= (insertStrictlySorted!87 (toList!844 lt!66056) (_1!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66819)))

(assert (= (and d!39157 c!23743) b!129018))

(assert (= (and d!39157 (not c!23743)) b!129023))

(assert (= (and b!129023 c!23744) b!129022))

(assert (= (and b!129023 (not c!23744)) b!129024))

(assert (= (and b!129024 c!23742) b!129027))

(assert (= (and b!129024 (not c!23742)) b!129019))

(assert (= (or b!129027 b!129019) bm!13952))

(assert (= (or b!129022 bm!13952) bm!13954))

(assert (= (or b!129018 bm!13954) bm!13953))

(assert (= (and bm!13953 c!23745) b!129021))

(assert (= (and bm!13953 (not c!23745)) b!129025))

(assert (= (and d!39157 res!62237) b!129026))

(assert (= (and b!129026 res!62236) b!129020))

(declare-fun m!151179 () Bool)

(assert (=> b!129021 m!151179))

(declare-fun m!151181 () Bool)

(assert (=> bm!13953 m!151181))

(declare-fun m!151183 () Bool)

(assert (=> b!129026 m!151183))

(declare-fun m!151185 () Bool)

(assert (=> d!39157 m!151185))

(declare-fun m!151187 () Bool)

(assert (=> d!39157 m!151187))

(declare-fun m!151189 () Bool)

(assert (=> b!129020 m!151189))

(assert (=> d!38745 d!39157))

(assert (=> b!128098 d!38879))

(declare-fun b!129028 () Bool)

(declare-fun e!84197 () Option!172)

(assert (=> b!129028 (= e!84197 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66269)))))))

(declare-fun b!129031 () Bool)

(declare-fun e!84198 () Option!172)

(assert (=> b!129031 (= e!84198 None!170)))

(declare-fun b!129030 () Bool)

(assert (=> b!129030 (= e!84198 (getValueByKey!166 (t!6068 (toList!844 lt!66269)) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun d!39159 () Bool)

(declare-fun c!23746 () Bool)

(assert (=> d!39159 (= c!23746 (and ((_ is Cons!1694) (toList!844 lt!66269)) (= (_1!1291 (h!2297 (toList!844 lt!66269))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (=> d!39159 (= (getValueByKey!166 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) e!84197)))

(declare-fun b!129029 () Bool)

(assert (=> b!129029 (= e!84197 e!84198)))

(declare-fun c!23747 () Bool)

(assert (=> b!129029 (= c!23747 (and ((_ is Cons!1694) (toList!844 lt!66269)) (not (= (_1!1291 (h!2297 (toList!844 lt!66269))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(assert (= (and d!39159 c!23746) b!129028))

(assert (= (and d!39159 (not c!23746)) b!129029))

(assert (= (and b!129029 c!23747) b!129030))

(assert (= (and b!129029 (not c!23747)) b!129031))

(declare-fun m!151191 () Bool)

(assert (=> b!129030 m!151191))

(assert (=> b!128182 d!39159))

(declare-fun d!39161 () Bool)

(declare-fun e!84199 () Bool)

(assert (=> d!39161 e!84199))

(declare-fun res!62238 () Bool)

(assert (=> d!39161 (=> (not res!62238) (not e!84199))))

(declare-fun lt!66823 () ListLongMap!1657)

(assert (=> d!39161 (= res!62238 (contains!873 lt!66823 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun lt!66822 () List!1698)

(assert (=> d!39161 (= lt!66823 (ListLongMap!1658 lt!66822))))

(declare-fun lt!66821 () Unit!3980)

(declare-fun lt!66820 () Unit!3980)

(assert (=> d!39161 (= lt!66821 lt!66820)))

(assert (=> d!39161 (= (getValueByKey!166 lt!66822 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39161 (= lt!66820 (lemmaContainsTupThenGetReturnValue!84 lt!66822 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39161 (= lt!66822 (insertStrictlySorted!87 (toList!844 call!13849) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39161 (= (+!159 call!13849 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) lt!66823)))

(declare-fun b!129032 () Bool)

(declare-fun res!62239 () Bool)

(assert (=> b!129032 (=> (not res!62239) (not e!84199))))

(assert (=> b!129032 (= res!62239 (= (getValueByKey!166 (toList!844 lt!66823) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun b!129033 () Bool)

(assert (=> b!129033 (= e!84199 (contains!874 (toList!844 lt!66823) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(assert (= (and d!39161 res!62238) b!129032))

(assert (= (and b!129032 res!62239) b!129033))

(declare-fun m!151193 () Bool)

(assert (=> d!39161 m!151193))

(declare-fun m!151195 () Bool)

(assert (=> d!39161 m!151195))

(declare-fun m!151197 () Bool)

(assert (=> d!39161 m!151197))

(declare-fun m!151199 () Bool)

(assert (=> d!39161 m!151199))

(declare-fun m!151201 () Bool)

(assert (=> b!129032 m!151201))

(declare-fun m!151203 () Bool)

(assert (=> b!129033 m!151203))

(assert (=> b!128142 d!39161))

(declare-fun d!39163 () Bool)

(assert (=> d!39163 (= (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66058)) (v!3143 (getValueByKey!166 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66058)))))

(assert (=> d!38767 d!39163))

(declare-fun b!129034 () Bool)

(declare-fun e!84200 () Option!172)

(assert (=> b!129034 (= e!84200 (Some!171 (_2!1291 (h!2297 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(declare-fun b!129037 () Bool)

(declare-fun e!84201 () Option!172)

(assert (=> b!129037 (= e!84201 None!170)))

(declare-fun b!129036 () Bool)

(assert (=> b!129036 (= e!84201 (getValueByKey!166 (t!6068 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66058))))

(declare-fun d!39165 () Bool)

(declare-fun c!23748 () Bool)

(assert (=> d!39165 (= c!23748 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66058)))))

(assert (=> d!39165 (= (getValueByKey!166 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66058) e!84200)))

(declare-fun b!129035 () Bool)

(assert (=> b!129035 (= e!84200 e!84201)))

(declare-fun c!23749 () Bool)

(assert (=> b!129035 (= c!23749 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (not (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66052 (tuple2!2561 lt!66048 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66058))))))

(assert (= (and d!39165 c!23748) b!129034))

(assert (= (and d!39165 (not c!23748)) b!129035))

(assert (= (and b!129035 c!23749) b!129036))

(assert (= (and b!129035 (not c!23749)) b!129037))

(declare-fun m!151205 () Bool)

(assert (=> b!129036 m!151205))

(assert (=> d!38767 d!39165))

(assert (=> d!38775 d!38777))

(assert (=> d!38775 d!38779))

(declare-fun d!39167 () Bool)

(assert (=> d!39167 (isDefined!120 (getValueByKey!166 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (=> d!39167 true))

(declare-fun _$12!393 () Unit!3980)

(assert (=> d!39167 (= (choose!787 (toList!844 lt!65981) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) _$12!393)))

(declare-fun bs!5341 () Bool)

(assert (= bs!5341 d!39167))

(assert (=> bs!5341 m!149345))

(assert (=> bs!5341 m!149509))

(assert (=> bs!5341 m!149509))

(assert (=> bs!5341 m!149511))

(assert (=> d!38775 d!39167))

(declare-fun d!39169 () Bool)

(declare-fun res!62244 () Bool)

(declare-fun e!84206 () Bool)

(assert (=> d!39169 (=> res!62244 e!84206)))

(assert (=> d!39169 (= res!62244 (or ((_ is Nil!1695) (toList!844 lt!65981)) ((_ is Nil!1695) (t!6068 (toList!844 lt!65981)))))))

(assert (=> d!39169 (= (isStrictlySorted!313 (toList!844 lt!65981)) e!84206)))

(declare-fun b!129042 () Bool)

(declare-fun e!84207 () Bool)

(assert (=> b!129042 (= e!84206 e!84207)))

(declare-fun res!62245 () Bool)

(assert (=> b!129042 (=> (not res!62245) (not e!84207))))

(assert (=> b!129042 (= res!62245 (bvslt (_1!1291 (h!2297 (toList!844 lt!65981))) (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981))))))))

(declare-fun b!129043 () Bool)

(assert (=> b!129043 (= e!84207 (isStrictlySorted!313 (t!6068 (toList!844 lt!65981))))))

(assert (= (and d!39169 (not res!62244)) b!129042))

(assert (= (and b!129042 res!62245) b!129043))

(declare-fun m!151207 () Bool)

(assert (=> b!129043 m!151207))

(assert (=> d!38775 d!39169))

(declare-fun d!39171 () Bool)

(declare-fun res!62246 () Bool)

(declare-fun e!84208 () Bool)

(assert (=> d!39171 (=> res!62246 e!84208)))

(assert (=> d!39171 (= res!62246 (and ((_ is Cons!1694) (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (= (_1!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66061)))))

(assert (=> d!39171 (= (containsKey!170 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061) e!84208)))

(declare-fun b!129044 () Bool)

(declare-fun e!84209 () Bool)

(assert (=> b!129044 (= e!84208 e!84209)))

(declare-fun res!62247 () Bool)

(assert (=> b!129044 (=> (not res!62247) (not e!84209))))

(assert (=> b!129044 (= res!62247 (and (or (not ((_ is Cons!1694) (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) (bvsle (_1!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66061)) ((_ is Cons!1694) (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) (bvslt (_1!1291 (h!2297 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))) lt!66061)))))

(declare-fun b!129045 () Bool)

(assert (=> b!129045 (= e!84209 (containsKey!170 (t!6068 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66061))))

(assert (= (and d!39171 (not res!62246)) b!129044))

(assert (= (and b!129044 res!62247) b!129045))

(declare-fun m!151209 () Bool)

(assert (=> b!129045 m!151209))

(assert (=> d!38773 d!39171))

(assert (=> b!128080 d!38837))

(assert (=> b!128080 d!38707))

(declare-fun bm!13955 () Bool)

(declare-fun call!13961 () Bool)

(declare-fun lt!66829 () ListLongMap!1657)

(assert (=> bm!13955 (= call!13961 (contains!873 lt!66829 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13956 () Bool)

(declare-fun call!13962 () ListLongMap!1657)

(declare-fun call!13964 () ListLongMap!1657)

(assert (=> bm!13956 (= call!13962 call!13964)))

(declare-fun b!129046 () Bool)

(declare-fun e!84214 () Unit!3980)

(declare-fun Unit!4027 () Unit!3980)

(assert (=> b!129046 (= e!84214 Unit!4027)))

(declare-fun b!129047 () Bool)

(declare-fun e!84212 () Bool)

(declare-fun call!13963 () Bool)

(assert (=> b!129047 (= e!84212 (not call!13963))))

(declare-fun b!129048 () Bool)

(declare-fun e!84219 () Bool)

(assert (=> b!129048 (= e!84212 e!84219)))

(declare-fun res!62249 () Bool)

(assert (=> b!129048 (= res!62249 call!13963)))

(assert (=> b!129048 (=> (not res!62249) (not e!84219))))

(declare-fun b!129049 () Bool)

(declare-fun res!62248 () Bool)

(declare-fun e!84218 () Bool)

(assert (=> b!129049 (=> (not res!62248) (not e!84218))))

(declare-fun e!84211 () Bool)

(assert (=> b!129049 (= res!62248 e!84211)))

(declare-fun res!62255 () Bool)

(assert (=> b!129049 (=> res!62255 e!84211)))

(declare-fun e!84220 () Bool)

(assert (=> b!129049 (= res!62255 (not e!84220))))

(declare-fun res!62250 () Bool)

(assert (=> b!129049 (=> (not res!62250) (not e!84220))))

(assert (=> b!129049 (= res!62250 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129050 () Bool)

(declare-fun e!84222 () ListLongMap!1657)

(declare-fun e!84210 () ListLongMap!1657)

(assert (=> b!129050 (= e!84222 e!84210)))

(declare-fun c!23752 () Bool)

(assert (=> b!129050 (= c!23752 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129051 () Bool)

(declare-fun e!84215 () Bool)

(assert (=> b!129051 (= e!84215 (not call!13961))))

(declare-fun d!39173 () Bool)

(assert (=> d!39173 e!84218))

(declare-fun res!62254 () Bool)

(assert (=> d!39173 (=> (not res!62254) (not e!84218))))

(assert (=> d!39173 (= res!62254 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66826 () ListLongMap!1657)

(assert (=> d!39173 (= lt!66829 lt!66826)))

(declare-fun lt!66838 () Unit!3980)

(assert (=> d!39173 (= lt!66838 e!84214)))

(declare-fun c!23751 () Bool)

(declare-fun e!84213 () Bool)

(assert (=> d!39173 (= c!23751 e!84213)))

(declare-fun res!62252 () Bool)

(assert (=> d!39173 (=> (not res!62252) (not e!84213))))

(assert (=> d!39173 (= res!62252 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39173 (= lt!66826 e!84222)))

(declare-fun c!23750 () Bool)

(assert (=> d!39173 (= c!23750 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39173 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39173 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66829)))

(declare-fun b!129052 () Bool)

(assert (=> b!129052 (= e!84210 call!13962)))

(declare-fun e!84221 () Bool)

(declare-fun b!129053 () Bool)

(assert (=> b!129053 (= e!84221 (= (apply!112 lt!66829 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))))))))

(assert (=> b!129053 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129054 () Bool)

(assert (=> b!129054 (= e!84222 (+!159 call!13964 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!129055 () Bool)

(assert (=> b!129055 (= e!84218 e!84215)))

(declare-fun c!23754 () Bool)

(assert (=> b!129055 (= c!23754 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129056 () Bool)

(declare-fun e!84216 () ListLongMap!1657)

(assert (=> b!129056 (= e!84216 call!13962)))

(declare-fun bm!13957 () Bool)

(declare-fun call!13959 () ListLongMap!1657)

(declare-fun call!13960 () ListLongMap!1657)

(assert (=> bm!13957 (= call!13959 call!13960)))

(declare-fun call!13958 () ListLongMap!1657)

(declare-fun bm!13958 () Bool)

(assert (=> bm!13958 (= call!13964 (+!159 (ite c!23750 call!13960 (ite c!23752 call!13959 call!13958)) (ite (or c!23750 c!23752) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!129057 () Bool)

(declare-fun e!84217 () Bool)

(assert (=> b!129057 (= e!84217 (= (apply!112 lt!66829 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!129058 () Bool)

(assert (=> b!129058 (= e!84216 call!13958)))

(declare-fun b!129059 () Bool)

(assert (=> b!129059 (= e!84219 (= (apply!112 lt!66829 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!129060 () Bool)

(assert (=> b!129060 (= e!84220 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13959 () Bool)

(assert (=> bm!13959 (= call!13958 call!13959)))

(declare-fun bm!13960 () Bool)

(assert (=> bm!13960 (= call!13960 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!129061 () Bool)

(assert (=> b!129061 (= e!84211 e!84221)))

(declare-fun res!62251 () Bool)

(assert (=> b!129061 (=> (not res!62251) (not e!84221))))

(assert (=> b!129061 (= res!62251 (contains!873 lt!66829 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13961 () Bool)

(assert (=> bm!13961 (= call!13963 (contains!873 lt!66829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129062 () Bool)

(assert (=> b!129062 (= e!84213 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129063 () Bool)

(assert (=> b!129063 (= e!84215 e!84217)))

(declare-fun res!62253 () Bool)

(assert (=> b!129063 (= res!62253 call!13961)))

(assert (=> b!129063 (=> (not res!62253) (not e!84217))))

(declare-fun b!129064 () Bool)

(declare-fun res!62256 () Bool)

(assert (=> b!129064 (=> (not res!62256) (not e!84218))))

(assert (=> b!129064 (= res!62256 e!84212)))

(declare-fun c!23755 () Bool)

(assert (=> b!129064 (= c!23755 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129065 () Bool)

(declare-fun c!23753 () Bool)

(assert (=> b!129065 (= c!23753 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129065 (= e!84210 e!84216)))

(declare-fun b!129066 () Bool)

(declare-fun lt!66834 () Unit!3980)

(assert (=> b!129066 (= e!84214 lt!66834)))

(declare-fun lt!66835 () ListLongMap!1657)

(assert (=> b!129066 (= lt!66835 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66833 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66840 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66840 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66830 () Unit!3980)

(assert (=> b!129066 (= lt!66830 (addStillContains!88 lt!66835 lt!66833 (zeroValue!2665 newMap!16) lt!66840))))

(assert (=> b!129066 (contains!873 (+!159 lt!66835 (tuple2!2561 lt!66833 (zeroValue!2665 newMap!16))) lt!66840)))

(declare-fun lt!66825 () Unit!3980)

(assert (=> b!129066 (= lt!66825 lt!66830)))

(declare-fun lt!66831 () ListLongMap!1657)

(assert (=> b!129066 (= lt!66831 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66827 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66827 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66837 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66837 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66845 () Unit!3980)

(assert (=> b!129066 (= lt!66845 (addApplyDifferent!88 lt!66831 lt!66827 (minValue!2665 newMap!16) lt!66837))))

(assert (=> b!129066 (= (apply!112 (+!159 lt!66831 (tuple2!2561 lt!66827 (minValue!2665 newMap!16))) lt!66837) (apply!112 lt!66831 lt!66837))))

(declare-fun lt!66841 () Unit!3980)

(assert (=> b!129066 (= lt!66841 lt!66845)))

(declare-fun lt!66844 () ListLongMap!1657)

(assert (=> b!129066 (= lt!66844 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66839 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66824 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66824 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66828 () Unit!3980)

(assert (=> b!129066 (= lt!66828 (addApplyDifferent!88 lt!66844 lt!66839 (zeroValue!2665 newMap!16) lt!66824))))

(assert (=> b!129066 (= (apply!112 (+!159 lt!66844 (tuple2!2561 lt!66839 (zeroValue!2665 newMap!16))) lt!66824) (apply!112 lt!66844 lt!66824))))

(declare-fun lt!66836 () Unit!3980)

(assert (=> b!129066 (= lt!66836 lt!66828)))

(declare-fun lt!66842 () ListLongMap!1657)

(assert (=> b!129066 (= lt!66842 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (array!4704 (store (arr!2225 (_values!2787 newMap!16)) (index!3253 lt!66141) (ValueCellFull!1082 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2491 (_values!2787 newMap!16))) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66843 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66832 () (_ BitVec 64))

(assert (=> b!129066 (= lt!66832 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129066 (= lt!66834 (addApplyDifferent!88 lt!66842 lt!66843 (minValue!2665 newMap!16) lt!66832))))

(assert (=> b!129066 (= (apply!112 (+!159 lt!66842 (tuple2!2561 lt!66843 (minValue!2665 newMap!16))) lt!66832) (apply!112 lt!66842 lt!66832))))

(assert (= (and d!39173 c!23750) b!129054))

(assert (= (and d!39173 (not c!23750)) b!129050))

(assert (= (and b!129050 c!23752) b!129052))

(assert (= (and b!129050 (not c!23752)) b!129065))

(assert (= (and b!129065 c!23753) b!129056))

(assert (= (and b!129065 (not c!23753)) b!129058))

(assert (= (or b!129056 b!129058) bm!13959))

(assert (= (or b!129052 bm!13959) bm!13957))

(assert (= (or b!129052 b!129056) bm!13956))

(assert (= (or b!129054 bm!13957) bm!13960))

(assert (= (or b!129054 bm!13956) bm!13958))

(assert (= (and d!39173 res!62252) b!129062))

(assert (= (and d!39173 c!23751) b!129066))

(assert (= (and d!39173 (not c!23751)) b!129046))

(assert (= (and d!39173 res!62254) b!129049))

(assert (= (and b!129049 res!62250) b!129060))

(assert (= (and b!129049 (not res!62255)) b!129061))

(assert (= (and b!129061 res!62251) b!129053))

(assert (= (and b!129049 res!62248) b!129064))

(assert (= (and b!129064 c!23755) b!129048))

(assert (= (and b!129064 (not c!23755)) b!129047))

(assert (= (and b!129048 res!62249) b!129059))

(assert (= (or b!129048 b!129047) bm!13961))

(assert (= (and b!129064 res!62256) b!129055))

(assert (= (and b!129055 c!23754) b!129063))

(assert (= (and b!129055 (not c!23754)) b!129051))

(assert (= (and b!129063 res!62253) b!129057))

(assert (= (or b!129063 b!129051) bm!13955))

(declare-fun b_lambda!5697 () Bool)

(assert (=> (not b_lambda!5697) (not b!129053)))

(assert (=> b!129053 t!6080))

(declare-fun b_and!7965 () Bool)

(assert (= b_and!7961 (and (=> t!6080 result!3889) b_and!7965)))

(assert (=> b!129053 t!6082))

(declare-fun b_and!7967 () Bool)

(assert (= b_and!7963 (and (=> t!6082 result!3891) b_and!7967)))

(declare-fun m!151211 () Bool)

(assert (=> bm!13961 m!151211))

(declare-fun m!151213 () Bool)

(assert (=> b!129059 m!151213))

(assert (=> b!129053 m!149617))

(declare-fun m!151215 () Bool)

(assert (=> b!129053 m!151215))

(assert (=> b!129053 m!149617))

(declare-fun m!151217 () Bool)

(assert (=> b!129053 m!151217))

(assert (=> b!129053 m!149575))

(declare-fun m!151219 () Bool)

(assert (=> b!129053 m!151219))

(assert (=> b!129053 m!151215))

(assert (=> b!129053 m!149575))

(declare-fun m!151221 () Bool)

(assert (=> bm!13955 m!151221))

(assert (=> d!39173 m!149585))

(declare-fun m!151223 () Bool)

(assert (=> b!129066 m!151223))

(declare-fun m!151225 () Bool)

(assert (=> b!129066 m!151225))

(declare-fun m!151227 () Bool)

(assert (=> b!129066 m!151227))

(declare-fun m!151229 () Bool)

(assert (=> b!129066 m!151229))

(declare-fun m!151231 () Bool)

(assert (=> b!129066 m!151231))

(declare-fun m!151233 () Bool)

(assert (=> b!129066 m!151233))

(assert (=> b!129066 m!151223))

(declare-fun m!151235 () Bool)

(assert (=> b!129066 m!151235))

(declare-fun m!151237 () Bool)

(assert (=> b!129066 m!151237))

(declare-fun m!151239 () Bool)

(assert (=> b!129066 m!151239))

(assert (=> b!129066 m!149575))

(declare-fun m!151241 () Bool)

(assert (=> b!129066 m!151241))

(declare-fun m!151243 () Bool)

(assert (=> b!129066 m!151243))

(declare-fun m!151245 () Bool)

(assert (=> b!129066 m!151245))

(assert (=> b!129066 m!151241))

(assert (=> b!129066 m!151229))

(declare-fun m!151247 () Bool)

(assert (=> b!129066 m!151247))

(declare-fun m!151249 () Bool)

(assert (=> b!129066 m!151249))

(declare-fun m!151251 () Bool)

(assert (=> b!129066 m!151251))

(assert (=> b!129066 m!151249))

(declare-fun m!151253 () Bool)

(assert (=> b!129066 m!151253))

(assert (=> b!129061 m!149575))

(assert (=> b!129061 m!149575))

(declare-fun m!151255 () Bool)

(assert (=> b!129061 m!151255))

(declare-fun m!151257 () Bool)

(assert (=> bm!13958 m!151257))

(assert (=> b!129062 m!149575))

(assert (=> b!129062 m!149575))

(assert (=> b!129062 m!149663))

(assert (=> b!129060 m!149575))

(assert (=> b!129060 m!149575))

(assert (=> b!129060 m!149663))

(declare-fun m!151259 () Bool)

(assert (=> b!129057 m!151259))

(declare-fun m!151261 () Bool)

(assert (=> b!129054 m!151261))

(assert (=> bm!13960 m!151251))

(assert (=> b!128080 d!39173))

(declare-fun d!39175 () Bool)

(declare-fun lt!66846 () Bool)

(assert (=> d!39175 (= lt!66846 (select (content!127 (toList!844 lt!66212)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun e!84223 () Bool)

(assert (=> d!39175 (= lt!66846 e!84223)))

(declare-fun res!62257 () Bool)

(assert (=> d!39175 (=> (not res!62257) (not e!84223))))

(assert (=> d!39175 (= res!62257 ((_ is Cons!1694) (toList!844 lt!66212)))))

(assert (=> d!39175 (= (contains!874 (toList!844 lt!66212) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66846)))

(declare-fun b!129067 () Bool)

(declare-fun e!84224 () Bool)

(assert (=> b!129067 (= e!84223 e!84224)))

(declare-fun res!62258 () Bool)

(assert (=> b!129067 (=> res!62258 e!84224)))

(assert (=> b!129067 (= res!62258 (= (h!2297 (toList!844 lt!66212)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!129068 () Bool)

(assert (=> b!129068 (= e!84224 (contains!874 (t!6068 (toList!844 lt!66212)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!39175 res!62257) b!129067))

(assert (= (and b!129067 (not res!62258)) b!129068))

(declare-fun m!151263 () Bool)

(assert (=> d!39175 m!151263))

(declare-fun m!151265 () Bool)

(assert (=> d!39175 m!151265))

(declare-fun m!151267 () Bool)

(assert (=> b!129068 m!151267))

(assert (=> b!128115 d!39175))

(assert (=> b!128148 d!38879))

(assert (=> b!128360 d!38967))

(assert (=> b!128360 d!38969))

(declare-fun d!39177 () Bool)

(declare-fun e!84226 () Bool)

(assert (=> d!39177 e!84226))

(declare-fun res!62259 () Bool)

(assert (=> d!39177 (=> res!62259 e!84226)))

(declare-fun lt!66849 () Bool)

(assert (=> d!39177 (= res!62259 (not lt!66849))))

(declare-fun lt!66850 () Bool)

(assert (=> d!39177 (= lt!66849 lt!66850)))

(declare-fun lt!66848 () Unit!3980)

(declare-fun e!84225 () Unit!3980)

(assert (=> d!39177 (= lt!66848 e!84225)))

(declare-fun c!23756 () Bool)

(assert (=> d!39177 (= c!23756 lt!66850)))

(assert (=> d!39177 (= lt!66850 (containsKey!170 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39177 (= (contains!873 lt!66444 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66849)))

(declare-fun b!129069 () Bool)

(declare-fun lt!66847 () Unit!3980)

(assert (=> b!129069 (= e!84225 lt!66847)))

(assert (=> b!129069 (= lt!66847 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!129069 (isDefined!120 (getValueByKey!166 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129070 () Bool)

(declare-fun Unit!4028 () Unit!3980)

(assert (=> b!129070 (= e!84225 Unit!4028)))

(declare-fun b!129071 () Bool)

(assert (=> b!129071 (= e!84226 (isDefined!120 (getValueByKey!166 (toList!844 lt!66444) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39177 c!23756) b!129069))

(assert (= (and d!39177 (not c!23756)) b!129070))

(assert (= (and d!39177 (not res!62259)) b!129071))

(declare-fun m!151269 () Bool)

(assert (=> d!39177 m!151269))

(declare-fun m!151271 () Bool)

(assert (=> b!129069 m!151271))

(assert (=> b!129069 m!150087))

(assert (=> b!129069 m!150087))

(declare-fun m!151273 () Bool)

(assert (=> b!129069 m!151273))

(assert (=> b!129071 m!150087))

(assert (=> b!129071 m!150087))

(assert (=> b!129071 m!151273))

(assert (=> d!38799 d!39177))

(declare-fun b!129072 () Bool)

(declare-fun e!84227 () Option!172)

(assert (=> b!129072 (= e!84227 (Some!171 (_2!1291 (h!2297 lt!66443))))))

(declare-fun b!129075 () Bool)

(declare-fun e!84228 () Option!172)

(assert (=> b!129075 (= e!84228 None!170)))

(declare-fun b!129074 () Bool)

(assert (=> b!129074 (= e!84228 (getValueByKey!166 (t!6068 lt!66443) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!39179 () Bool)

(declare-fun c!23757 () Bool)

(assert (=> d!39179 (= c!23757 (and ((_ is Cons!1694) lt!66443) (= (_1!1291 (h!2297 lt!66443)) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39179 (= (getValueByKey!166 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84227)))

(declare-fun b!129073 () Bool)

(assert (=> b!129073 (= e!84227 e!84228)))

(declare-fun c!23758 () Bool)

(assert (=> b!129073 (= c!23758 (and ((_ is Cons!1694) lt!66443) (not (= (_1!1291 (h!2297 lt!66443)) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(assert (= (and d!39179 c!23757) b!129072))

(assert (= (and d!39179 (not c!23757)) b!129073))

(assert (= (and b!129073 c!23758) b!129074))

(assert (= (and b!129073 (not c!23758)) b!129075))

(declare-fun m!151275 () Bool)

(assert (=> b!129074 m!151275))

(assert (=> d!38799 d!39179))

(declare-fun d!39181 () Bool)

(assert (=> d!39181 (= (getValueByKey!166 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!171 (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!66851 () Unit!3980)

(assert (=> d!39181 (= lt!66851 (choose!790 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84229 () Bool)

(assert (=> d!39181 e!84229))

(declare-fun res!62260 () Bool)

(assert (=> d!39181 (=> (not res!62260) (not e!84229))))

(assert (=> d!39181 (= res!62260 (isStrictlySorted!313 lt!66443))))

(assert (=> d!39181 (= (lemmaContainsTupThenGetReturnValue!84 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66851)))

(declare-fun b!129076 () Bool)

(declare-fun res!62261 () Bool)

(assert (=> b!129076 (=> (not res!62261) (not e!84229))))

(assert (=> b!129076 (= res!62261 (containsKey!170 lt!66443 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129077 () Bool)

(assert (=> b!129077 (= e!84229 (contains!874 lt!66443 (tuple2!2561 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39181 res!62260) b!129076))

(assert (= (and b!129076 res!62261) b!129077))

(assert (=> d!39181 m!150081))

(declare-fun m!151277 () Bool)

(assert (=> d!39181 m!151277))

(declare-fun m!151279 () Bool)

(assert (=> d!39181 m!151279))

(declare-fun m!151281 () Bool)

(assert (=> b!129076 m!151281))

(declare-fun m!151283 () Bool)

(assert (=> b!129077 m!151283))

(assert (=> d!38799 d!39181))

(declare-fun b!129078 () Bool)

(declare-fun e!84234 () List!1698)

(declare-fun call!13965 () List!1698)

(assert (=> b!129078 (= e!84234 call!13965)))

(declare-fun b!129079 () Bool)

(declare-fun e!84230 () List!1698)

(declare-fun call!13967 () List!1698)

(assert (=> b!129079 (= e!84230 call!13967)))

(declare-fun e!84232 () Bool)

(declare-fun lt!66852 () List!1698)

(declare-fun b!129080 () Bool)

(assert (=> b!129080 (= e!84232 (contains!874 lt!66852 (tuple2!2561 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129081 () Bool)

(declare-fun e!84231 () List!1698)

(assert (=> b!129081 (= e!84231 (insertStrictlySorted!87 (t!6068 (toList!844 e!83592)) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13962 () Bool)

(declare-fun call!13966 () List!1698)

(assert (=> bm!13962 (= call!13967 call!13966)))

(declare-fun b!129082 () Bool)

(declare-fun e!84233 () List!1698)

(assert (=> b!129082 (= e!84233 call!13966)))

(declare-fun c!23760 () Bool)

(declare-fun bm!13963 () Bool)

(assert (=> bm!13963 (= call!13965 ($colon$colon!89 e!84231 (ite c!23760 (h!2297 (toList!844 e!83592)) (tuple2!2561 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23762 () Bool)

(assert (=> bm!13963 (= c!23762 c!23760)))

(declare-fun b!129083 () Bool)

(assert (=> b!129083 (= e!84234 e!84233)))

(declare-fun c!23761 () Bool)

(assert (=> b!129083 (= c!23761 (and ((_ is Cons!1694) (toList!844 e!83592)) (= (_1!1291 (h!2297 (toList!844 e!83592))) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23759 () Bool)

(declare-fun b!129084 () Bool)

(assert (=> b!129084 (= c!23759 (and ((_ is Cons!1694) (toList!844 e!83592)) (bvsgt (_1!1291 (h!2297 (toList!844 e!83592))) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!129084 (= e!84233 e!84230)))

(declare-fun b!129085 () Bool)

(assert (=> b!129085 (= e!84231 (ite c!23761 (t!6068 (toList!844 e!83592)) (ite c!23759 (Cons!1694 (h!2297 (toList!844 e!83592)) (t!6068 (toList!844 e!83592))) Nil!1695)))))

(declare-fun b!129086 () Bool)

(declare-fun res!62262 () Bool)

(assert (=> b!129086 (=> (not res!62262) (not e!84232))))

(assert (=> b!129086 (= res!62262 (containsKey!170 lt!66852 (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129087 () Bool)

(assert (=> b!129087 (= e!84230 call!13967)))

(declare-fun bm!13964 () Bool)

(assert (=> bm!13964 (= call!13966 call!13965)))

(declare-fun d!39183 () Bool)

(assert (=> d!39183 e!84232))

(declare-fun res!62263 () Bool)

(assert (=> d!39183 (=> (not res!62263) (not e!84232))))

(assert (=> d!39183 (= res!62263 (isStrictlySorted!313 lt!66852))))

(assert (=> d!39183 (= lt!66852 e!84234)))

(assert (=> d!39183 (= c!23760 (and ((_ is Cons!1694) (toList!844 e!83592)) (bvslt (_1!1291 (h!2297 (toList!844 e!83592))) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39183 (isStrictlySorted!313 (toList!844 e!83592))))

(assert (=> d!39183 (= (insertStrictlySorted!87 (toList!844 e!83592) (_1!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1291 (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!66852)))

(assert (= (and d!39183 c!23760) b!129078))

(assert (= (and d!39183 (not c!23760)) b!129083))

(assert (= (and b!129083 c!23761) b!129082))

(assert (= (and b!129083 (not c!23761)) b!129084))

(assert (= (and b!129084 c!23759) b!129087))

(assert (= (and b!129084 (not c!23759)) b!129079))

(assert (= (or b!129087 b!129079) bm!13962))

(assert (= (or b!129082 bm!13962) bm!13964))

(assert (= (or b!129078 bm!13964) bm!13963))

(assert (= (and bm!13963 c!23762) b!129081))

(assert (= (and bm!13963 (not c!23762)) b!129085))

(assert (= (and d!39183 res!62263) b!129086))

(assert (= (and b!129086 res!62262) b!129080))

(declare-fun m!151285 () Bool)

(assert (=> b!129081 m!151285))

(declare-fun m!151287 () Bool)

(assert (=> bm!13963 m!151287))

(declare-fun m!151289 () Bool)

(assert (=> b!129086 m!151289))

(declare-fun m!151291 () Bool)

(assert (=> d!39183 m!151291))

(declare-fun m!151293 () Bool)

(assert (=> d!39183 m!151293))

(declare-fun m!151295 () Bool)

(assert (=> b!129080 m!151295))

(assert (=> d!38799 d!39183))

(assert (=> b!128258 d!38711))

(assert (=> d!38749 d!38765))

(declare-fun d!39185 () Bool)

(assert (=> d!39185 (= (apply!112 (+!159 lt!66063 (tuple2!2561 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66053) (apply!112 lt!66063 lt!66053))))

(assert (=> d!39185 true))

(declare-fun _$34!963 () Unit!3980)

(assert (=> d!39185 (= (choose!785 lt!66063 lt!66064 (minValue!2665 (v!3138 (underlying!440 thiss!992))) lt!66053) _$34!963)))

(declare-fun bs!5342 () Bool)

(assert (= bs!5342 d!39185))

(assert (=> bs!5342 m!149453))

(assert (=> bs!5342 m!149453))

(assert (=> bs!5342 m!149465))

(assert (=> bs!5342 m!149463))

(assert (=> d!38749 d!39185))

(assert (=> d!38749 d!38769))

(declare-fun d!39187 () Bool)

(declare-fun e!84236 () Bool)

(assert (=> d!39187 e!84236))

(declare-fun res!62264 () Bool)

(assert (=> d!39187 (=> res!62264 e!84236)))

(declare-fun lt!66855 () Bool)

(assert (=> d!39187 (= res!62264 (not lt!66855))))

(declare-fun lt!66856 () Bool)

(assert (=> d!39187 (= lt!66855 lt!66856)))

(declare-fun lt!66854 () Unit!3980)

(declare-fun e!84235 () Unit!3980)

(assert (=> d!39187 (= lt!66854 e!84235)))

(declare-fun c!23763 () Bool)

(assert (=> d!39187 (= c!23763 lt!66856)))

(assert (=> d!39187 (= lt!66856 (containsKey!170 (toList!844 lt!66063) lt!66053))))

(assert (=> d!39187 (= (contains!873 lt!66063 lt!66053) lt!66855)))

(declare-fun b!129088 () Bool)

(declare-fun lt!66853 () Unit!3980)

(assert (=> b!129088 (= e!84235 lt!66853)))

(assert (=> b!129088 (= lt!66853 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66063) lt!66053))))

(assert (=> b!129088 (isDefined!120 (getValueByKey!166 (toList!844 lt!66063) lt!66053))))

(declare-fun b!129089 () Bool)

(declare-fun Unit!4029 () Unit!3980)

(assert (=> b!129089 (= e!84235 Unit!4029)))

(declare-fun b!129090 () Bool)

(assert (=> b!129090 (= e!84236 (isDefined!120 (getValueByKey!166 (toList!844 lt!66063) lt!66053)))))

(assert (= (and d!39187 c!23763) b!129088))

(assert (= (and d!39187 (not c!23763)) b!129089))

(assert (= (and d!39187 (not res!62264)) b!129090))

(declare-fun m!151297 () Bool)

(assert (=> d!39187 m!151297))

(declare-fun m!151299 () Bool)

(assert (=> b!129088 m!151299))

(assert (=> b!129088 m!149911))

(assert (=> b!129088 m!149911))

(declare-fun m!151301 () Bool)

(assert (=> b!129088 m!151301))

(assert (=> b!129090 m!149911))

(assert (=> b!129090 m!149911))

(assert (=> b!129090 m!151301))

(assert (=> d!38749 d!39187))

(assert (=> d!38749 d!38753))

(declare-fun d!39189 () Bool)

(assert (=> d!39189 (= (inRange!0 (index!3253 lt!66164) (mask!7071 newMap!16)) (and (bvsge (index!3253 lt!66164) #b00000000000000000000000000000000) (bvslt (index!3253 lt!66164) (bvadd (mask!7071 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!128073 d!39189))

(assert (=> bm!13852 d!38983))

(declare-fun b!129091 () Bool)

(declare-fun e!84237 () Bool)

(declare-fun e!84240 () Bool)

(assert (=> b!129091 (= e!84237 e!84240)))

(declare-fun res!62266 () Bool)

(assert (=> b!129091 (=> (not res!62266) (not e!84240))))

(declare-fun e!84239 () Bool)

(assert (=> b!129091 (= res!62266 (not e!84239))))

(declare-fun res!62267 () Bool)

(assert (=> b!129091 (=> (not res!62267) (not e!84239))))

(assert (=> b!129091 (= res!62267 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!129092 () Bool)

(declare-fun e!84238 () Bool)

(declare-fun call!13968 () Bool)

(assert (=> b!129092 (= e!84238 call!13968)))

(declare-fun b!129093 () Bool)

(assert (=> b!129093 (= e!84240 e!84238)))

(declare-fun c!23764 () Bool)

(assert (=> b!129093 (= c!23764 (validKeyInArray!0 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!129094 () Bool)

(assert (=> b!129094 (= e!84238 call!13968)))

(declare-fun b!129095 () Bool)

(assert (=> b!129095 (= e!84239 (contains!875 Nil!1697 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13965 () Bool)

(assert (=> bm!13965 (= call!13968 (arrayNoDuplicates!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23764 (Cons!1696 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!39191 () Bool)

(declare-fun res!62265 () Bool)

(assert (=> d!39191 (=> res!62265 e!84237)))

(assert (=> d!39191 (= res!62265 (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 (v!3138 (underlying!440 thiss!992))))))))

(assert (=> d!39191 (= (arrayNoDuplicates!0 (_keys!4540 (v!3138 (underlying!440 thiss!992))) #b00000000000000000000000000000000 Nil!1697) e!84237)))

(assert (= (and d!39191 (not res!62265)) b!129091))

(assert (= (and b!129091 res!62267) b!129095))

(assert (= (and b!129091 res!62266) b!129093))

(assert (= (and b!129093 c!23764) b!129092))

(assert (= (and b!129093 (not c!23764)) b!129094))

(assert (= (or b!129092 b!129094) bm!13965))

(assert (=> b!129091 m!150393))

(assert (=> b!129091 m!150393))

(assert (=> b!129091 m!150403))

(assert (=> b!129093 m!150393))

(assert (=> b!129093 m!150393))

(assert (=> b!129093 m!150403))

(assert (=> b!129095 m!150393))

(assert (=> b!129095 m!150393))

(declare-fun m!151303 () Bool)

(assert (=> b!129095 m!151303))

(assert (=> bm!13965 m!150393))

(declare-fun m!151305 () Bool)

(assert (=> bm!13965 m!151305))

(assert (=> b!128228 d!39191))

(assert (=> bm!13876 d!38723))

(declare-fun d!39193 () Bool)

(declare-fun e!84241 () Bool)

(assert (=> d!39193 e!84241))

(declare-fun res!62268 () Bool)

(assert (=> d!39193 (=> (not res!62268) (not e!84241))))

(declare-fun lt!66860 () ListLongMap!1657)

(assert (=> d!39193 (= res!62268 (contains!873 lt!66860 (_1!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun lt!66859 () List!1698)

(assert (=> d!39193 (= lt!66860 (ListLongMap!1658 lt!66859))))

(declare-fun lt!66858 () Unit!3980)

(declare-fun lt!66857 () Unit!3980)

(assert (=> d!39193 (= lt!66858 lt!66857)))

(assert (=> d!39193 (= (getValueByKey!166 lt!66859 (_1!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39193 (= lt!66857 (lemmaContainsTupThenGetReturnValue!84 lt!66859 (_1!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39193 (= lt!66859 (insertStrictlySorted!87 (toList!844 (ite c!23479 call!13838 (ite c!23481 call!13837 call!13836))) (_1!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39193 (= (+!159 (ite c!23479 call!13838 (ite c!23481 call!13837 call!13836)) (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) lt!66860)))

(declare-fun b!129096 () Bool)

(declare-fun res!62269 () Bool)

(assert (=> b!129096 (=> (not res!62269) (not e!84241))))

(assert (=> b!129096 (= res!62269 (= (getValueByKey!166 (toList!844 lt!66860) (_1!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))))

(declare-fun b!129097 () Bool)

(assert (=> b!129097 (= e!84241 (contains!874 (toList!844 lt!66860) (ite (or c!23479 c!23481) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (= (and d!39193 res!62268) b!129096))

(assert (= (and b!129096 res!62269) b!129097))

(declare-fun m!151307 () Bool)

(assert (=> d!39193 m!151307))

(declare-fun m!151309 () Bool)

(assert (=> d!39193 m!151309))

(declare-fun m!151311 () Bool)

(assert (=> d!39193 m!151311))

(declare-fun m!151313 () Bool)

(assert (=> d!39193 m!151313))

(declare-fun m!151315 () Bool)

(assert (=> b!129096 m!151315))

(declare-fun m!151317 () Bool)

(assert (=> b!129097 m!151317))

(assert (=> bm!13836 d!39193))

(declare-fun b!129098 () Bool)

(declare-fun e!84242 () Option!172)

(assert (=> b!129098 (= e!84242 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66320)))))))

(declare-fun b!129101 () Bool)

(declare-fun e!84243 () Option!172)

(assert (=> b!129101 (= e!84243 None!170)))

(declare-fun b!129100 () Bool)

(assert (=> b!129100 (= e!84243 (getValueByKey!166 (t!6068 (toList!844 lt!66320)) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun c!23765 () Bool)

(declare-fun d!39195 () Bool)

(assert (=> d!39195 (= c!23765 (and ((_ is Cons!1694) (toList!844 lt!66320)) (= (_1!1291 (h!2297 (toList!844 lt!66320))) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39195 (= (getValueByKey!166 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!84242)))

(declare-fun b!129099 () Bool)

(assert (=> b!129099 (= e!84242 e!84243)))

(declare-fun c!23766 () Bool)

(assert (=> b!129099 (= c!23766 (and ((_ is Cons!1694) (toList!844 lt!66320)) (not (= (_1!1291 (h!2297 (toList!844 lt!66320))) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39195 c!23765) b!129098))

(assert (= (and d!39195 (not c!23765)) b!129099))

(assert (= (and b!129099 c!23766) b!129100))

(assert (= (and b!129099 (not c!23766)) b!129101))

(declare-fun m!151319 () Bool)

(assert (=> b!129100 m!151319))

(assert (=> b!128276 d!39195))

(declare-fun d!39197 () Bool)

(declare-fun e!84244 () Bool)

(assert (=> d!39197 e!84244))

(declare-fun res!62270 () Bool)

(assert (=> d!39197 (=> (not res!62270) (not e!84244))))

(declare-fun lt!66864 () ListLongMap!1657)

(assert (=> d!39197 (= res!62270 (contains!873 lt!66864 (_1!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun lt!66863 () List!1698)

(assert (=> d!39197 (= lt!66864 (ListLongMap!1658 lt!66863))))

(declare-fun lt!66862 () Unit!3980)

(declare-fun lt!66861 () Unit!3980)

(assert (=> d!39197 (= lt!66862 lt!66861)))

(assert (=> d!39197 (= (getValueByKey!166 lt!66863 (_1!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39197 (= lt!66861 (lemmaContainsTupThenGetReturnValue!84 lt!66863 (_1!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39197 (= lt!66863 (insertStrictlySorted!87 (toList!844 (ite c!23495 call!13845 (ite c!23497 call!13844 call!13843))) (_1!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39197 (= (+!159 (ite c!23495 call!13845 (ite c!23497 call!13844 call!13843)) (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) lt!66864)))

(declare-fun b!129102 () Bool)

(declare-fun res!62271 () Bool)

(assert (=> b!129102 (=> (not res!62271) (not e!84244))))

(assert (=> b!129102 (= res!62271 (= (getValueByKey!166 (toList!844 lt!66864) (_1!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!171 (_2!1291 (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))))

(declare-fun b!129103 () Bool)

(assert (=> b!129103 (= e!84244 (contains!874 (toList!844 lt!66864) (ite (or c!23495 c!23497) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (= (and d!39197 res!62270) b!129102))

(assert (= (and b!129102 res!62271) b!129103))

(declare-fun m!151321 () Bool)

(assert (=> d!39197 m!151321))

(declare-fun m!151323 () Bool)

(assert (=> d!39197 m!151323))

(declare-fun m!151325 () Bool)

(assert (=> d!39197 m!151325))

(declare-fun m!151327 () Bool)

(assert (=> d!39197 m!151327))

(declare-fun m!151329 () Bool)

(assert (=> b!129102 m!151329))

(declare-fun m!151331 () Bool)

(assert (=> b!129103 m!151331))

(assert (=> bm!13843 d!39197))

(declare-fun d!39199 () Bool)

(assert (=> d!39199 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun lt!66865 () Unit!3980)

(assert (=> d!39199 (= lt!66865 (choose!787 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(declare-fun e!84245 () Bool)

(assert (=> d!39199 e!84245))

(declare-fun res!62272 () Bool)

(assert (=> d!39199 (=> (not res!62272) (not e!84245))))

(assert (=> d!39199 (= res!62272 (isStrictlySorted!313 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))))

(assert (=> d!39199 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) lt!66865)))

(declare-fun b!129104 () Bool)

(assert (=> b!129104 (= e!84245 (containsKey!170 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!39199 res!62272) b!129104))

(assert (=> d!39199 m!149345))

(assert (=> d!39199 m!149609))

(assert (=> d!39199 m!149609))

(assert (=> d!39199 m!149611))

(assert (=> d!39199 m!149345))

(declare-fun m!151333 () Bool)

(assert (=> d!39199 m!151333))

(declare-fun m!151335 () Bool)

(assert (=> d!39199 m!151335))

(assert (=> b!129104 m!149345))

(assert (=> b!129104 m!149605))

(assert (=> b!128081 d!39199))

(assert (=> b!128081 d!38939))

(assert (=> b!128081 d!38941))

(declare-fun d!39201 () Bool)

(declare-fun e!84247 () Bool)

(assert (=> d!39201 e!84247))

(declare-fun res!62273 () Bool)

(assert (=> d!39201 (=> res!62273 e!84247)))

(declare-fun lt!66868 () Bool)

(assert (=> d!39201 (= res!62273 (not lt!66868))))

(declare-fun lt!66869 () Bool)

(assert (=> d!39201 (= lt!66868 lt!66869)))

(declare-fun lt!66867 () Unit!3980)

(declare-fun e!84246 () Unit!3980)

(assert (=> d!39201 (= lt!66867 e!84246)))

(declare-fun c!23767 () Bool)

(assert (=> d!39201 (= c!23767 lt!66869)))

(assert (=> d!39201 (= lt!66869 (containsKey!170 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39201 (= (contains!873 lt!66269 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66868)))

(declare-fun b!129105 () Bool)

(declare-fun lt!66866 () Unit!3980)

(assert (=> b!129105 (= e!84246 lt!66866)))

(assert (=> b!129105 (= lt!66866 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!129105 (isDefined!120 (getValueByKey!166 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!129106 () Bool)

(declare-fun Unit!4030 () Unit!3980)

(assert (=> b!129106 (= e!84246 Unit!4030)))

(declare-fun b!129107 () Bool)

(assert (=> b!129107 (= e!84247 (isDefined!120 (getValueByKey!166 (toList!844 lt!66269) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39201 c!23767) b!129105))

(assert (= (and d!39201 (not c!23767)) b!129106))

(assert (= (and d!39201 (not res!62273)) b!129107))

(declare-fun m!151337 () Bool)

(assert (=> d!39201 m!151337))

(declare-fun m!151339 () Bool)

(assert (=> b!129105 m!151339))

(assert (=> b!129105 m!149835))

(assert (=> b!129105 m!149835))

(declare-fun m!151341 () Bool)

(assert (=> b!129105 m!151341))

(assert (=> b!129107 m!149835))

(assert (=> b!129107 m!149835))

(assert (=> b!129107 m!151341))

(assert (=> d!38731 d!39201))

(declare-fun b!129108 () Bool)

(declare-fun e!84248 () Option!172)

(assert (=> b!129108 (= e!84248 (Some!171 (_2!1291 (h!2297 lt!66268))))))

(declare-fun b!129111 () Bool)

(declare-fun e!84249 () Option!172)

(assert (=> b!129111 (= e!84249 None!170)))

(declare-fun b!129110 () Bool)

(assert (=> b!129110 (= e!84249 (getValueByKey!166 (t!6068 lt!66268) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun d!39203 () Bool)

(declare-fun c!23768 () Bool)

(assert (=> d!39203 (= c!23768 (and ((_ is Cons!1694) lt!66268) (= (_1!1291 (h!2297 lt!66268)) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (=> d!39203 (= (getValueByKey!166 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) e!84248)))

(declare-fun b!129109 () Bool)

(assert (=> b!129109 (= e!84248 e!84249)))

(declare-fun c!23769 () Bool)

(assert (=> b!129109 (= c!23769 (and ((_ is Cons!1694) lt!66268) (not (= (_1!1291 (h!2297 lt!66268)) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(assert (= (and d!39203 c!23768) b!129108))

(assert (= (and d!39203 (not c!23768)) b!129109))

(assert (= (and b!129109 c!23769) b!129110))

(assert (= (and b!129109 (not c!23769)) b!129111))

(declare-fun m!151343 () Bool)

(assert (=> b!129110 m!151343))

(assert (=> d!38731 d!39203))

(declare-fun d!39205 () Bool)

(assert (=> d!39205 (= (getValueByKey!166 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) (Some!171 (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun lt!66870 () Unit!3980)

(assert (=> d!39205 (= lt!66870 (choose!790 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun e!84250 () Bool)

(assert (=> d!39205 e!84250))

(declare-fun res!62274 () Bool)

(assert (=> d!39205 (=> (not res!62274) (not e!84250))))

(assert (=> d!39205 (= res!62274 (isStrictlySorted!313 lt!66268))))

(assert (=> d!39205 (= (lemmaContainsTupThenGetReturnValue!84 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66870)))

(declare-fun b!129112 () Bool)

(declare-fun res!62275 () Bool)

(assert (=> b!129112 (=> (not res!62275) (not e!84250))))

(assert (=> b!129112 (= res!62275 (containsKey!170 lt!66268 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!129113 () Bool)

(assert (=> b!129113 (= e!84250 (contains!874 lt!66268 (tuple2!2561 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39205 res!62274) b!129112))

(assert (= (and b!129112 res!62275) b!129113))

(assert (=> d!39205 m!149829))

(declare-fun m!151345 () Bool)

(assert (=> d!39205 m!151345))

(declare-fun m!151347 () Bool)

(assert (=> d!39205 m!151347))

(declare-fun m!151349 () Bool)

(assert (=> b!129112 m!151349))

(declare-fun m!151351 () Bool)

(assert (=> b!129113 m!151351))

(assert (=> d!38731 d!39205))

(declare-fun b!129114 () Bool)

(declare-fun e!84255 () List!1698)

(declare-fun call!13969 () List!1698)

(assert (=> b!129114 (= e!84255 call!13969)))

(declare-fun b!129115 () Bool)

(declare-fun e!84251 () List!1698)

(declare-fun call!13971 () List!1698)

(assert (=> b!129115 (= e!84251 call!13971)))

(declare-fun e!84253 () Bool)

(declare-fun b!129116 () Bool)

(declare-fun lt!66871 () List!1698)

(assert (=> b!129116 (= e!84253 (contains!874 lt!66871 (tuple2!2561 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun e!84252 () List!1698)

(declare-fun b!129117 () Bool)

(assert (=> b!129117 (= e!84252 (insertStrictlySorted!87 (t!6068 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun bm!13966 () Bool)

(declare-fun call!13970 () List!1698)

(assert (=> bm!13966 (= call!13971 call!13970)))

(declare-fun b!129118 () Bool)

(declare-fun e!84254 () List!1698)

(assert (=> b!129118 (= e!84254 call!13970)))

(declare-fun bm!13967 () Bool)

(declare-fun c!23771 () Bool)

(assert (=> bm!13967 (= call!13969 ($colon$colon!89 e!84252 (ite c!23771 (h!2297 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (tuple2!2561 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))))

(declare-fun c!23773 () Bool)

(assert (=> bm!13967 (= c!23773 c!23771)))

(declare-fun b!129119 () Bool)

(assert (=> b!129119 (= e!84255 e!84254)))

(declare-fun c!23772 () Bool)

(assert (=> b!129119 (= c!23772 (and ((_ is Cons!1694) (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (= (_1!1291 (h!2297 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23770 () Bool)

(declare-fun b!129120 () Bool)

(assert (=> b!129120 (= c!23770 (and ((_ is Cons!1694) (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (bvsgt (_1!1291 (h!2297 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (=> b!129120 (= e!84254 e!84251)))

(declare-fun b!129121 () Bool)

(assert (=> b!129121 (= e!84252 (ite c!23772 (t!6068 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (ite c!23770 (Cons!1694 (h!2297 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (t!6068 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))))) Nil!1695)))))

(declare-fun b!129122 () Bool)

(declare-fun res!62276 () Bool)

(assert (=> b!129122 (=> (not res!62276) (not e!84253))))

(assert (=> b!129122 (= res!62276 (containsKey!170 lt!66871 (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun b!129123 () Bool)

(assert (=> b!129123 (= e!84251 call!13971)))

(declare-fun bm!13968 () Bool)

(assert (=> bm!13968 (= call!13970 call!13969)))

(declare-fun d!39207 () Bool)

(assert (=> d!39207 e!84253))

(declare-fun res!62277 () Bool)

(assert (=> d!39207 (=> (not res!62277) (not e!84253))))

(assert (=> d!39207 (= res!62277 (isStrictlySorted!313 lt!66871))))

(assert (=> d!39207 (= lt!66871 e!84255)))

(assert (=> d!39207 (= c!23771 (and ((_ is Cons!1694) (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757)))) (bvslt (_1!1291 (h!2297 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (=> d!39207 (isStrictlySorted!313 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))))))

(assert (=> d!39207 (= (insertStrictlySorted!87 (toList!844 (ite c!23427 call!13759 (ite c!23429 call!13758 call!13757))) (_1!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992)))))) (_2!1291 (ite (or c!23427 c!23429) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3138 (underlying!440 thiss!992))))))) lt!66871)))

(assert (= (and d!39207 c!23771) b!129114))

(assert (= (and d!39207 (not c!23771)) b!129119))

(assert (= (and b!129119 c!23772) b!129118))

(assert (= (and b!129119 (not c!23772)) b!129120))

(assert (= (and b!129120 c!23770) b!129123))

(assert (= (and b!129120 (not c!23770)) b!129115))

(assert (= (or b!129123 b!129115) bm!13966))

(assert (= (or b!129118 bm!13966) bm!13968))

(assert (= (or b!129114 bm!13968) bm!13967))

(assert (= (and bm!13967 c!23773) b!129117))

(assert (= (and bm!13967 (not c!23773)) b!129121))

(assert (= (and d!39207 res!62277) b!129122))

(assert (= (and b!129122 res!62276) b!129116))

(declare-fun m!151353 () Bool)

(assert (=> b!129117 m!151353))

(declare-fun m!151355 () Bool)

(assert (=> bm!13967 m!151355))

(declare-fun m!151357 () Bool)

(assert (=> b!129122 m!151357))

(declare-fun m!151359 () Bool)

(assert (=> d!39207 m!151359))

(declare-fun m!151361 () Bool)

(assert (=> d!39207 m!151361))

(declare-fun m!151363 () Bool)

(assert (=> b!129116 m!151363))

(assert (=> d!38731 d!39207))

(assert (=> b!128150 d!38879))

(declare-fun d!39209 () Bool)

(declare-fun e!84256 () Bool)

(assert (=> d!39209 e!84256))

(declare-fun res!62278 () Bool)

(assert (=> d!39209 (=> (not res!62278) (not e!84256))))

(declare-fun lt!66875 () ListLongMap!1657)

(assert (=> d!39209 (= res!62278 (contains!873 lt!66875 (_1!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))))))

(declare-fun lt!66874 () List!1698)

(assert (=> d!39209 (= lt!66875 (ListLongMap!1658 lt!66874))))

(declare-fun lt!66873 () Unit!3980)

(declare-fun lt!66872 () Unit!3980)

(assert (=> d!39209 (= lt!66873 lt!66872)))

(assert (=> d!39209 (= (getValueByKey!166 lt!66874 (_1!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))))))

(assert (=> d!39209 (= lt!66872 (lemmaContainsTupThenGetReturnValue!84 lt!66874 (_1!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))))))

(assert (=> d!39209 (= lt!66874 (insertStrictlySorted!87 (toList!844 lt!66194) (_1!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))))))

(assert (=> d!39209 (= (+!159 lt!66194 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) lt!66875)))

(declare-fun b!129124 () Bool)

(declare-fun res!62279 () Bool)

(assert (=> b!129124 (=> (not res!62279) (not e!84256))))

(assert (=> b!129124 (= res!62279 (= (getValueByKey!166 (toList!844 lt!66875) (_1!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))))))))

(declare-fun b!129125 () Bool)

(assert (=> b!129125 (= e!84256 (contains!874 (toList!844 lt!66875) (tuple2!2561 lt!66195 (minValue!2665 newMap!16))))))

(assert (= (and d!39209 res!62278) b!129124))

(assert (= (and b!129124 res!62279) b!129125))

(declare-fun m!151365 () Bool)

(assert (=> d!39209 m!151365))

(declare-fun m!151367 () Bool)

(assert (=> d!39209 m!151367))

(declare-fun m!151369 () Bool)

(assert (=> d!39209 m!151369))

(declare-fun m!151371 () Bool)

(assert (=> d!39209 m!151371))

(declare-fun m!151373 () Bool)

(assert (=> b!129124 m!151373))

(declare-fun m!151375 () Bool)

(assert (=> b!129125 m!151375))

(assert (=> b!128104 d!39209))

(declare-fun d!39211 () Bool)

(assert (=> d!39211 (= (apply!112 (+!159 lt!66183 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) lt!66189) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66183 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))) lt!66189)))))

(declare-fun bs!5343 () Bool)

(assert (= bs!5343 d!39211))

(declare-fun m!151377 () Bool)

(assert (=> bs!5343 m!151377))

(assert (=> bs!5343 m!151377))

(declare-fun m!151379 () Bool)

(assert (=> bs!5343 m!151379))

(assert (=> b!128104 d!39211))

(declare-fun d!39213 () Bool)

(assert (=> d!39213 (= (apply!112 lt!66194 lt!66184) (get!1456 (getValueByKey!166 (toList!844 lt!66194) lt!66184)))))

(declare-fun bs!5344 () Bool)

(assert (= bs!5344 d!39213))

(declare-fun m!151381 () Bool)

(assert (=> bs!5344 m!151381))

(assert (=> bs!5344 m!151381))

(declare-fun m!151383 () Bool)

(assert (=> bs!5344 m!151383))

(assert (=> b!128104 d!39213))

(declare-fun d!39215 () Bool)

(assert (=> d!39215 (contains!873 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) lt!66192)))

(declare-fun lt!66876 () Unit!3980)

(assert (=> d!39215 (= lt!66876 (choose!786 lt!66187 lt!66185 (zeroValue!2665 newMap!16) lt!66192))))

(assert (=> d!39215 (contains!873 lt!66187 lt!66192)))

(assert (=> d!39215 (= (addStillContains!88 lt!66187 lt!66185 (zeroValue!2665 newMap!16) lt!66192) lt!66876)))

(declare-fun bs!5345 () Bool)

(assert (= bs!5345 d!39215))

(assert (=> bs!5345 m!149645))

(assert (=> bs!5345 m!149645))

(assert (=> bs!5345 m!149647))

(declare-fun m!151385 () Bool)

(assert (=> bs!5345 m!151385))

(declare-fun m!151387 () Bool)

(assert (=> bs!5345 m!151387))

(assert (=> b!128104 d!39215))

(declare-fun d!39217 () Bool)

(declare-fun e!84257 () Bool)

(assert (=> d!39217 e!84257))

(declare-fun res!62280 () Bool)

(assert (=> d!39217 (=> (not res!62280) (not e!84257))))

(declare-fun lt!66880 () ListLongMap!1657)

(assert (=> d!39217 (= res!62280 (contains!873 lt!66880 (_1!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66879 () List!1698)

(assert (=> d!39217 (= lt!66880 (ListLongMap!1658 lt!66879))))

(declare-fun lt!66878 () Unit!3980)

(declare-fun lt!66877 () Unit!3980)

(assert (=> d!39217 (= lt!66878 lt!66877)))

(assert (=> d!39217 (= (getValueByKey!166 lt!66879 (_1!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39217 (= lt!66877 (lemmaContainsTupThenGetReturnValue!84 lt!66879 (_1!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39217 (= lt!66879 (insertStrictlySorted!87 (toList!844 lt!66196) (_1!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39217 (= (+!159 lt!66196 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) lt!66880)))

(declare-fun b!129126 () Bool)

(declare-fun res!62281 () Bool)

(assert (=> b!129126 (=> (not res!62281) (not e!84257))))

(assert (=> b!129126 (= res!62281 (= (getValueByKey!166 (toList!844 lt!66880) (_1!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))))))))

(declare-fun b!129127 () Bool)

(assert (=> b!129127 (= e!84257 (contains!874 (toList!844 lt!66880) (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39217 res!62280) b!129126))

(assert (= (and b!129126 res!62281) b!129127))

(declare-fun m!151389 () Bool)

(assert (=> d!39217 m!151389))

(declare-fun m!151391 () Bool)

(assert (=> d!39217 m!151391))

(declare-fun m!151393 () Bool)

(assert (=> d!39217 m!151393))

(declare-fun m!151395 () Bool)

(assert (=> d!39217 m!151395))

(declare-fun m!151397 () Bool)

(assert (=> b!129126 m!151397))

(declare-fun m!151399 () Bool)

(assert (=> b!129127 m!151399))

(assert (=> b!128104 d!39217))

(declare-fun d!39219 () Bool)

(declare-fun e!84258 () Bool)

(assert (=> d!39219 e!84258))

(declare-fun res!62282 () Bool)

(assert (=> d!39219 (=> (not res!62282) (not e!84258))))

(declare-fun lt!66884 () ListLongMap!1657)

(assert (=> d!39219 (= res!62282 (contains!873 lt!66884 (_1!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))))))

(declare-fun lt!66883 () List!1698)

(assert (=> d!39219 (= lt!66884 (ListLongMap!1658 lt!66883))))

(declare-fun lt!66882 () Unit!3980)

(declare-fun lt!66881 () Unit!3980)

(assert (=> d!39219 (= lt!66882 lt!66881)))

(assert (=> d!39219 (= (getValueByKey!166 lt!66883 (_1!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))))))

(assert (=> d!39219 (= lt!66881 (lemmaContainsTupThenGetReturnValue!84 lt!66883 (_1!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))))))

(assert (=> d!39219 (= lt!66883 (insertStrictlySorted!87 (toList!844 lt!66183) (_1!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))))))

(assert (=> d!39219 (= (+!159 lt!66183 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) lt!66884)))

(declare-fun b!129128 () Bool)

(declare-fun res!62283 () Bool)

(assert (=> b!129128 (=> (not res!62283) (not e!84258))))

(assert (=> b!129128 (= res!62283 (= (getValueByKey!166 (toList!844 lt!66884) (_1!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))))))))

(declare-fun b!129129 () Bool)

(assert (=> b!129129 (= e!84258 (contains!874 (toList!844 lt!66884) (tuple2!2561 lt!66179 (minValue!2665 newMap!16))))))

(assert (= (and d!39219 res!62282) b!129128))

(assert (= (and b!129128 res!62283) b!129129))

(declare-fun m!151401 () Bool)

(assert (=> d!39219 m!151401))

(declare-fun m!151403 () Bool)

(assert (=> d!39219 m!151403))

(declare-fun m!151405 () Bool)

(assert (=> d!39219 m!151405))

(declare-fun m!151407 () Bool)

(assert (=> d!39219 m!151407))

(declare-fun m!151409 () Bool)

(assert (=> b!129128 m!151409))

(declare-fun m!151411 () Bool)

(assert (=> b!129129 m!151411))

(assert (=> b!128104 d!39219))

(declare-fun d!39221 () Bool)

(assert (=> d!39221 (= (apply!112 (+!159 lt!66194 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) lt!66184) (apply!112 lt!66194 lt!66184))))

(declare-fun lt!66885 () Unit!3980)

(assert (=> d!39221 (= lt!66885 (choose!785 lt!66194 lt!66195 (minValue!2665 newMap!16) lt!66184))))

(declare-fun e!84259 () Bool)

(assert (=> d!39221 e!84259))

(declare-fun res!62284 () Bool)

(assert (=> d!39221 (=> (not res!62284) (not e!84259))))

(assert (=> d!39221 (= res!62284 (contains!873 lt!66194 lt!66184))))

(assert (=> d!39221 (= (addApplyDifferent!88 lt!66194 lt!66195 (minValue!2665 newMap!16) lt!66184) lt!66885)))

(declare-fun b!129130 () Bool)

(assert (=> b!129130 (= e!84259 (not (= lt!66184 lt!66195)))))

(assert (= (and d!39221 res!62284) b!129130))

(assert (=> d!39221 m!149627))

(assert (=> d!39221 m!149639))

(declare-fun m!151413 () Bool)

(assert (=> d!39221 m!151413))

(assert (=> d!39221 m!149627))

(declare-fun m!151415 () Bool)

(assert (=> d!39221 m!151415))

(assert (=> d!39221 m!149637))

(assert (=> b!128104 d!39221))

(declare-fun d!39223 () Bool)

(declare-fun e!84260 () Bool)

(assert (=> d!39223 e!84260))

(declare-fun res!62285 () Bool)

(assert (=> d!39223 (=> (not res!62285) (not e!84260))))

(declare-fun lt!66889 () ListLongMap!1657)

(assert (=> d!39223 (= res!62285 (contains!873 lt!66889 (_1!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66888 () List!1698)

(assert (=> d!39223 (= lt!66889 (ListLongMap!1658 lt!66888))))

(declare-fun lt!66887 () Unit!3980)

(declare-fun lt!66886 () Unit!3980)

(assert (=> d!39223 (= lt!66887 lt!66886)))

(assert (=> d!39223 (= (getValueByKey!166 lt!66888 (_1!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39223 (= lt!66886 (lemmaContainsTupThenGetReturnValue!84 lt!66888 (_1!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39223 (= lt!66888 (insertStrictlySorted!87 (toList!844 lt!66187) (_1!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39223 (= (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) lt!66889)))

(declare-fun b!129131 () Bool)

(declare-fun res!62286 () Bool)

(assert (=> b!129131 (=> (not res!62286) (not e!84260))))

(assert (=> b!129131 (= res!62286 (= (getValueByKey!166 (toList!844 lt!66889) (_1!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))))))))

(declare-fun b!129132 () Bool)

(assert (=> b!129132 (= e!84260 (contains!874 (toList!844 lt!66889) (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39223 res!62285) b!129131))

(assert (= (and b!129131 res!62286) b!129132))

(declare-fun m!151417 () Bool)

(assert (=> d!39223 m!151417))

(declare-fun m!151419 () Bool)

(assert (=> d!39223 m!151419))

(declare-fun m!151421 () Bool)

(assert (=> d!39223 m!151421))

(declare-fun m!151423 () Bool)

(assert (=> d!39223 m!151423))

(declare-fun m!151425 () Bool)

(assert (=> b!129131 m!151425))

(declare-fun m!151427 () Bool)

(assert (=> b!129132 m!151427))

(assert (=> b!128104 d!39223))

(declare-fun d!39225 () Bool)

(assert (=> d!39225 (= (apply!112 (+!159 lt!66196 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) lt!66176) (apply!112 lt!66196 lt!66176))))

(declare-fun lt!66890 () Unit!3980)

(assert (=> d!39225 (= lt!66890 (choose!785 lt!66196 lt!66191 (zeroValue!2665 newMap!16) lt!66176))))

(declare-fun e!84261 () Bool)

(assert (=> d!39225 e!84261))

(declare-fun res!62287 () Bool)

(assert (=> d!39225 (=> (not res!62287) (not e!84261))))

(assert (=> d!39225 (= res!62287 (contains!873 lt!66196 lt!66176))))

(assert (=> d!39225 (= (addApplyDifferent!88 lt!66196 lt!66191 (zeroValue!2665 newMap!16) lt!66176) lt!66890)))

(declare-fun b!129133 () Bool)

(assert (=> b!129133 (= e!84261 (not (= lt!66176 lt!66191)))))

(assert (= (and d!39225 res!62287) b!129133))

(assert (=> d!39225 m!149633))

(assert (=> d!39225 m!149651))

(declare-fun m!151429 () Bool)

(assert (=> d!39225 m!151429))

(assert (=> d!39225 m!149633))

(declare-fun m!151431 () Bool)

(assert (=> d!39225 m!151431))

(assert (=> d!39225 m!149649))

(assert (=> b!128104 d!39225))

(declare-fun d!39227 () Bool)

(assert (=> d!39227 (= (apply!112 (+!159 lt!66194 (tuple2!2561 lt!66195 (minValue!2665 newMap!16))) lt!66184) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66194 (tuple2!2561 lt!66195 (minValue!2665 newMap!16)))) lt!66184)))))

(declare-fun bs!5346 () Bool)

(assert (= bs!5346 d!39227))

(declare-fun m!151433 () Bool)

(assert (=> bs!5346 m!151433))

(assert (=> bs!5346 m!151433))

(declare-fun m!151435 () Bool)

(assert (=> bs!5346 m!151435))

(assert (=> b!128104 d!39227))

(declare-fun d!39229 () Bool)

(assert (=> d!39229 (= (apply!112 lt!66196 lt!66176) (get!1456 (getValueByKey!166 (toList!844 lt!66196) lt!66176)))))

(declare-fun bs!5347 () Bool)

(assert (= bs!5347 d!39229))

(declare-fun m!151437 () Bool)

(assert (=> bs!5347 m!151437))

(assert (=> bs!5347 m!151437))

(declare-fun m!151439 () Bool)

(assert (=> bs!5347 m!151439))

(assert (=> b!128104 d!39229))

(declare-fun d!39231 () Bool)

(declare-fun e!84263 () Bool)

(assert (=> d!39231 e!84263))

(declare-fun res!62288 () Bool)

(assert (=> d!39231 (=> res!62288 e!84263)))

(declare-fun lt!66893 () Bool)

(assert (=> d!39231 (= res!62288 (not lt!66893))))

(declare-fun lt!66894 () Bool)

(assert (=> d!39231 (= lt!66893 lt!66894)))

(declare-fun lt!66892 () Unit!3980)

(declare-fun e!84262 () Unit!3980)

(assert (=> d!39231 (= lt!66892 e!84262)))

(declare-fun c!23774 () Bool)

(assert (=> d!39231 (= c!23774 lt!66894)))

(assert (=> d!39231 (= lt!66894 (containsKey!170 (toList!844 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) lt!66192))))

(assert (=> d!39231 (= (contains!873 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16))) lt!66192) lt!66893)))

(declare-fun b!129134 () Bool)

(declare-fun lt!66891 () Unit!3980)

(assert (=> b!129134 (= e!84262 lt!66891)))

(assert (=> b!129134 (= lt!66891 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) lt!66192))))

(assert (=> b!129134 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) lt!66192))))

(declare-fun b!129135 () Bool)

(declare-fun Unit!4031 () Unit!3980)

(assert (=> b!129135 (= e!84262 Unit!4031)))

(declare-fun b!129136 () Bool)

(assert (=> b!129136 (= e!84263 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66187 (tuple2!2561 lt!66185 (zeroValue!2665 newMap!16)))) lt!66192)))))

(assert (= (and d!39231 c!23774) b!129134))

(assert (= (and d!39231 (not c!23774)) b!129135))

(assert (= (and d!39231 (not res!62288)) b!129136))

(declare-fun m!151441 () Bool)

(assert (=> d!39231 m!151441))

(declare-fun m!151443 () Bool)

(assert (=> b!129134 m!151443))

(declare-fun m!151445 () Bool)

(assert (=> b!129134 m!151445))

(assert (=> b!129134 m!151445))

(declare-fun m!151447 () Bool)

(assert (=> b!129134 m!151447))

(assert (=> b!129136 m!151445))

(assert (=> b!129136 m!151445))

(assert (=> b!129136 m!151447))

(assert (=> b!128104 d!39231))

(declare-fun d!39233 () Bool)

(assert (=> d!39233 (= (apply!112 (+!159 lt!66183 (tuple2!2561 lt!66179 (minValue!2665 newMap!16))) lt!66189) (apply!112 lt!66183 lt!66189))))

(declare-fun lt!66895 () Unit!3980)

(assert (=> d!39233 (= lt!66895 (choose!785 lt!66183 lt!66179 (minValue!2665 newMap!16) lt!66189))))

(declare-fun e!84264 () Bool)

(assert (=> d!39233 e!84264))

(declare-fun res!62289 () Bool)

(assert (=> d!39233 (=> (not res!62289) (not e!84264))))

(assert (=> d!39233 (= res!62289 (contains!873 lt!66183 lt!66189))))

(assert (=> d!39233 (= (addApplyDifferent!88 lt!66183 lt!66179 (minValue!2665 newMap!16) lt!66189) lt!66895)))

(declare-fun b!129137 () Bool)

(assert (=> b!129137 (= e!84264 (not (= lt!66189 lt!66179)))))

(assert (= (and d!39233 res!62289) b!129137))

(assert (=> d!39233 m!149653))

(assert (=> d!39233 m!149657))

(declare-fun m!151449 () Bool)

(assert (=> d!39233 m!151449))

(assert (=> d!39233 m!149653))

(declare-fun m!151451 () Bool)

(assert (=> d!39233 m!151451))

(assert (=> d!39233 m!149631))

(assert (=> b!128104 d!39233))

(declare-fun d!39235 () Bool)

(assert (=> d!39235 (= (apply!112 (+!159 lt!66196 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16))) lt!66176) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66196 (tuple2!2561 lt!66191 (zeroValue!2665 newMap!16)))) lt!66176)))))

(declare-fun bs!5348 () Bool)

(assert (= bs!5348 d!39235))

(declare-fun m!151453 () Bool)

(assert (=> bs!5348 m!151453))

(assert (=> bs!5348 m!151453))

(declare-fun m!151455 () Bool)

(assert (=> bs!5348 m!151455))

(assert (=> b!128104 d!39235))

(declare-fun d!39237 () Bool)

(assert (=> d!39237 (= (apply!112 lt!66183 lt!66189) (get!1456 (getValueByKey!166 (toList!844 lt!66183) lt!66189)))))

(declare-fun bs!5349 () Bool)

(assert (= bs!5349 d!39237))

(declare-fun m!151457 () Bool)

(assert (=> bs!5349 m!151457))

(assert (=> bs!5349 m!151457))

(declare-fun m!151459 () Bool)

(assert (=> bs!5349 m!151459))

(assert (=> b!128104 d!39237))

(assert (=> b!128104 d!38949))

(declare-fun d!39239 () Bool)

(assert (=> d!39239 (= (get!1456 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3143 (getValueByKey!166 (toList!844 lt!66050) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38715 d!39239))

(assert (=> d!38715 d!38917))

(declare-fun d!39241 () Bool)

(declare-fun res!62290 () Bool)

(declare-fun e!84265 () Bool)

(assert (=> d!39241 (=> res!62290 e!84265)))

(assert (=> d!39241 (= res!62290 (and ((_ is Cons!1694) (toList!844 lt!66050)) (= (_1!1291 (h!2297 (toList!844 lt!66050))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39241 (= (containsKey!170 (toList!844 lt!66050) #b1000000000000000000000000000000000000000000000000000000000000000) e!84265)))

(declare-fun b!129138 () Bool)

(declare-fun e!84266 () Bool)

(assert (=> b!129138 (= e!84265 e!84266)))

(declare-fun res!62291 () Bool)

(assert (=> b!129138 (=> (not res!62291) (not e!84266))))

(assert (=> b!129138 (= res!62291 (and (or (not ((_ is Cons!1694) (toList!844 lt!66050))) (bvsle (_1!1291 (h!2297 (toList!844 lt!66050))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1694) (toList!844 lt!66050)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66050))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129139 () Bool)

(assert (=> b!129139 (= e!84266 (containsKey!170 (t!6068 (toList!844 lt!66050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39241 (not res!62290)) b!129138))

(assert (= (and b!129138 res!62291) b!129139))

(declare-fun m!151461 () Bool)

(assert (=> b!129139 m!151461))

(assert (=> d!38789 d!39241))

(declare-fun d!39243 () Bool)

(declare-fun e!84268 () Bool)

(assert (=> d!39243 e!84268))

(declare-fun res!62292 () Bool)

(assert (=> d!39243 (=> res!62292 e!84268)))

(declare-fun lt!66898 () Bool)

(assert (=> d!39243 (= res!62292 (not lt!66898))))

(declare-fun lt!66899 () Bool)

(assert (=> d!39243 (= lt!66898 lt!66899)))

(declare-fun lt!66897 () Unit!3980)

(declare-fun e!84267 () Unit!3980)

(assert (=> d!39243 (= lt!66897 e!84267)))

(declare-fun c!23775 () Bool)

(assert (=> d!39243 (= c!23775 lt!66899)))

(assert (=> d!39243 (= lt!66899 (containsKey!170 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))

(assert (=> d!39243 (= (contains!873 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))) lt!66898)))

(declare-fun b!129140 () Bool)

(declare-fun lt!66896 () Unit!3980)

(assert (=> b!129140 (= e!84267 lt!66896)))

(assert (=> b!129140 (= lt!66896 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))

(assert (=> b!129140 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))

(declare-fun b!129141 () Bool)

(declare-fun Unit!4032 () Unit!3980)

(assert (=> b!129141 (= e!84267 Unit!4032)))

(declare-fun b!129142 () Bool)

(assert (=> b!129142 (= e!84268 (isDefined!120 (getValueByKey!166 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(assert (= (and d!39243 c!23775) b!129140))

(assert (= (and d!39243 (not c!23775)) b!129141))

(assert (= (and d!39243 (not res!62292)) b!129142))

(assert (=> d!39243 m!149559))

(declare-fun m!151463 () Bool)

(assert (=> d!39243 m!151463))

(assert (=> b!129140 m!149559))

(declare-fun m!151465 () Bool)

(assert (=> b!129140 m!151465))

(assert (=> b!129140 m!149559))

(declare-fun m!151467 () Bool)

(assert (=> b!129140 m!151467))

(assert (=> b!129140 m!151467))

(declare-fun m!151469 () Bool)

(assert (=> b!129140 m!151469))

(assert (=> b!129142 m!149559))

(assert (=> b!129142 m!151467))

(assert (=> b!129142 m!151467))

(assert (=> b!129142 m!151469))

(assert (=> b!128077 d!39243))

(declare-fun bm!13969 () Bool)

(declare-fun call!13975 () Bool)

(declare-fun lt!66905 () ListLongMap!1657)

(assert (=> bm!13969 (= call!13975 (contains!873 lt!66905 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13970 () Bool)

(declare-fun call!13976 () ListLongMap!1657)

(declare-fun call!13978 () ListLongMap!1657)

(assert (=> bm!13970 (= call!13976 call!13978)))

(declare-fun b!129143 () Bool)

(declare-fun e!84273 () Unit!3980)

(declare-fun Unit!4033 () Unit!3980)

(assert (=> b!129143 (= e!84273 Unit!4033)))

(declare-fun b!129144 () Bool)

(declare-fun e!84271 () Bool)

(declare-fun call!13977 () Bool)

(assert (=> b!129144 (= e!84271 (not call!13977))))

(declare-fun b!129145 () Bool)

(declare-fun e!84278 () Bool)

(assert (=> b!129145 (= e!84271 e!84278)))

(declare-fun res!62294 () Bool)

(assert (=> b!129145 (= res!62294 call!13977)))

(assert (=> b!129145 (=> (not res!62294) (not e!84278))))

(declare-fun b!129146 () Bool)

(declare-fun res!62293 () Bool)

(declare-fun e!84277 () Bool)

(assert (=> b!129146 (=> (not res!62293) (not e!84277))))

(declare-fun e!84270 () Bool)

(assert (=> b!129146 (= res!62293 e!84270)))

(declare-fun res!62300 () Bool)

(assert (=> b!129146 (=> res!62300 e!84270)))

(declare-fun e!84279 () Bool)

(assert (=> b!129146 (= res!62300 (not e!84279))))

(declare-fun res!62295 () Bool)

(assert (=> b!129146 (=> (not res!62295) (not e!84279))))

(assert (=> b!129146 (= res!62295 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129147 () Bool)

(declare-fun e!84281 () ListLongMap!1657)

(declare-fun e!84269 () ListLongMap!1657)

(assert (=> b!129147 (= e!84281 e!84269)))

(declare-fun c!23778 () Bool)

(assert (=> b!129147 (= c!23778 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129148 () Bool)

(declare-fun e!84274 () Bool)

(assert (=> b!129148 (= e!84274 (not call!13975))))

(declare-fun d!39245 () Bool)

(assert (=> d!39245 e!84277))

(declare-fun res!62299 () Bool)

(assert (=> d!39245 (=> (not res!62299) (not e!84277))))

(assert (=> d!39245 (= res!62299 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66902 () ListLongMap!1657)

(assert (=> d!39245 (= lt!66905 lt!66902)))

(declare-fun lt!66914 () Unit!3980)

(assert (=> d!39245 (= lt!66914 e!84273)))

(declare-fun c!23777 () Bool)

(declare-fun e!84272 () Bool)

(assert (=> d!39245 (= c!23777 e!84272)))

(declare-fun res!62297 () Bool)

(assert (=> d!39245 (=> (not res!62297) (not e!84272))))

(assert (=> d!39245 (= res!62297 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39245 (= lt!66902 e!84281)))

(declare-fun c!23776 () Bool)

(assert (=> d!39245 (= c!23776 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39245 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39245 (= (getCurrentListMap!513 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66905)))

(declare-fun b!129149 () Bool)

(assert (=> b!129149 (= e!84269 call!13976)))

(declare-fun e!84280 () Bool)

(declare-fun b!129150 () Bool)

(assert (=> b!129150 (= e!84280 (= (apply!112 lt!66905 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 lt!66152) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 lt!66152)))))

(assert (=> b!129150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129151 () Bool)

(assert (=> b!129151 (= e!84281 (+!159 call!13978 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!129152 () Bool)

(assert (=> b!129152 (= e!84277 e!84274)))

(declare-fun c!23780 () Bool)

(assert (=> b!129152 (= c!23780 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129153 () Bool)

(declare-fun e!84275 () ListLongMap!1657)

(assert (=> b!129153 (= e!84275 call!13976)))

(declare-fun bm!13971 () Bool)

(declare-fun call!13973 () ListLongMap!1657)

(declare-fun call!13974 () ListLongMap!1657)

(assert (=> bm!13971 (= call!13973 call!13974)))

(declare-fun call!13972 () ListLongMap!1657)

(declare-fun bm!13972 () Bool)

(assert (=> bm!13972 (= call!13978 (+!159 (ite c!23776 call!13974 (ite c!23778 call!13973 call!13972)) (ite (or c!23776 c!23778) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!129154 () Bool)

(declare-fun e!84276 () Bool)

(assert (=> b!129154 (= e!84276 (= (apply!112 lt!66905 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!129155 () Bool)

(assert (=> b!129155 (= e!84275 call!13972)))

(declare-fun b!129156 () Bool)

(assert (=> b!129156 (= e!84278 (= (apply!112 lt!66905 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!129157 () Bool)

(assert (=> b!129157 (= e!84279 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13973 () Bool)

(assert (=> bm!13973 (= call!13972 call!13973)))

(declare-fun bm!13974 () Bool)

(assert (=> bm!13974 (= call!13974 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!129158 () Bool)

(assert (=> b!129158 (= e!84270 e!84280)))

(declare-fun res!62296 () Bool)

(assert (=> b!129158 (=> (not res!62296) (not e!84280))))

(assert (=> b!129158 (= res!62296 (contains!873 lt!66905 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13975 () Bool)

(assert (=> bm!13975 (= call!13977 (contains!873 lt!66905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129159 () Bool)

(assert (=> b!129159 (= e!84272 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129160 () Bool)

(assert (=> b!129160 (= e!84274 e!84276)))

(declare-fun res!62298 () Bool)

(assert (=> b!129160 (= res!62298 call!13975)))

(assert (=> b!129160 (=> (not res!62298) (not e!84276))))

(declare-fun b!129161 () Bool)

(declare-fun res!62301 () Bool)

(assert (=> b!129161 (=> (not res!62301) (not e!84277))))

(assert (=> b!129161 (= res!62301 e!84271)))

(declare-fun c!23781 () Bool)

(assert (=> b!129161 (= c!23781 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129162 () Bool)

(declare-fun c!23779 () Bool)

(assert (=> b!129162 (= c!23779 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129162 (= e!84269 e!84275)))

(declare-fun b!129163 () Bool)

(declare-fun lt!66910 () Unit!3980)

(assert (=> b!129163 (= e!84273 lt!66910)))

(declare-fun lt!66911 () ListLongMap!1657)

(assert (=> b!129163 (= lt!66911 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66909 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66916 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66916 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66906 () Unit!3980)

(assert (=> b!129163 (= lt!66906 (addStillContains!88 lt!66911 lt!66909 (zeroValue!2665 newMap!16) lt!66916))))

(assert (=> b!129163 (contains!873 (+!159 lt!66911 (tuple2!2561 lt!66909 (zeroValue!2665 newMap!16))) lt!66916)))

(declare-fun lt!66901 () Unit!3980)

(assert (=> b!129163 (= lt!66901 lt!66906)))

(declare-fun lt!66907 () ListLongMap!1657)

(assert (=> b!129163 (= lt!66907 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66903 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66913 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66913 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66921 () Unit!3980)

(assert (=> b!129163 (= lt!66921 (addApplyDifferent!88 lt!66907 lt!66903 (minValue!2665 newMap!16) lt!66913))))

(assert (=> b!129163 (= (apply!112 (+!159 lt!66907 (tuple2!2561 lt!66903 (minValue!2665 newMap!16))) lt!66913) (apply!112 lt!66907 lt!66913))))

(declare-fun lt!66917 () Unit!3980)

(assert (=> b!129163 (= lt!66917 lt!66921)))

(declare-fun lt!66920 () ListLongMap!1657)

(assert (=> b!129163 (= lt!66920 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66915 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66900 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66900 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66904 () Unit!3980)

(assert (=> b!129163 (= lt!66904 (addApplyDifferent!88 lt!66920 lt!66915 (zeroValue!2665 newMap!16) lt!66900))))

(assert (=> b!129163 (= (apply!112 (+!159 lt!66920 (tuple2!2561 lt!66915 (zeroValue!2665 newMap!16))) lt!66900) (apply!112 lt!66920 lt!66900))))

(declare-fun lt!66912 () Unit!3980)

(assert (=> b!129163 (= lt!66912 lt!66904)))

(declare-fun lt!66918 () ListLongMap!1657)

(assert (=> b!129163 (= lt!66918 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) lt!66152 (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66919 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66919 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66908 () (_ BitVec 64))

(assert (=> b!129163 (= lt!66908 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129163 (= lt!66910 (addApplyDifferent!88 lt!66918 lt!66919 (minValue!2665 newMap!16) lt!66908))))

(assert (=> b!129163 (= (apply!112 (+!159 lt!66918 (tuple2!2561 lt!66919 (minValue!2665 newMap!16))) lt!66908) (apply!112 lt!66918 lt!66908))))

(assert (= (and d!39245 c!23776) b!129151))

(assert (= (and d!39245 (not c!23776)) b!129147))

(assert (= (and b!129147 c!23778) b!129149))

(assert (= (and b!129147 (not c!23778)) b!129162))

(assert (= (and b!129162 c!23779) b!129153))

(assert (= (and b!129162 (not c!23779)) b!129155))

(assert (= (or b!129153 b!129155) bm!13973))

(assert (= (or b!129149 bm!13973) bm!13971))

(assert (= (or b!129149 b!129153) bm!13970))

(assert (= (or b!129151 bm!13971) bm!13974))

(assert (= (or b!129151 bm!13970) bm!13972))

(assert (= (and d!39245 res!62297) b!129159))

(assert (= (and d!39245 c!23777) b!129163))

(assert (= (and d!39245 (not c!23777)) b!129143))

(assert (= (and d!39245 res!62299) b!129146))

(assert (= (and b!129146 res!62295) b!129157))

(assert (= (and b!129146 (not res!62300)) b!129158))

(assert (= (and b!129158 res!62296) b!129150))

(assert (= (and b!129146 res!62293) b!129161))

(assert (= (and b!129161 c!23781) b!129145))

(assert (= (and b!129161 (not c!23781)) b!129144))

(assert (= (and b!129145 res!62294) b!129156))

(assert (= (or b!129145 b!129144) bm!13975))

(assert (= (and b!129161 res!62301) b!129152))

(assert (= (and b!129152 c!23780) b!129160))

(assert (= (and b!129152 (not c!23780)) b!129148))

(assert (= (and b!129160 res!62298) b!129154))

(assert (= (or b!129160 b!129148) bm!13969))

(declare-fun b_lambda!5699 () Bool)

(assert (=> (not b_lambda!5699) (not b!129150)))

(assert (=> b!129150 t!6080))

(declare-fun b_and!7969 () Bool)

(assert (= b_and!7965 (and (=> t!6080 result!3889) b_and!7969)))

(assert (=> b!129150 t!6082))

(declare-fun b_and!7971 () Bool)

(assert (= b_and!7967 (and (=> t!6082 result!3891) b_and!7971)))

(declare-fun m!151471 () Bool)

(assert (=> bm!13975 m!151471))

(declare-fun m!151473 () Bool)

(assert (=> b!129156 m!151473))

(assert (=> b!129150 m!149617))

(declare-fun m!151475 () Bool)

(assert (=> b!129150 m!151475))

(assert (=> b!129150 m!149617))

(declare-fun m!151477 () Bool)

(assert (=> b!129150 m!151477))

(assert (=> b!129150 m!149575))

(declare-fun m!151479 () Bool)

(assert (=> b!129150 m!151479))

(assert (=> b!129150 m!151475))

(assert (=> b!129150 m!149575))

(declare-fun m!151481 () Bool)

(assert (=> bm!13969 m!151481))

(assert (=> d!39245 m!149585))

(declare-fun m!151483 () Bool)

(assert (=> b!129163 m!151483))

(declare-fun m!151485 () Bool)

(assert (=> b!129163 m!151485))

(declare-fun m!151487 () Bool)

(assert (=> b!129163 m!151487))

(declare-fun m!151489 () Bool)

(assert (=> b!129163 m!151489))

(declare-fun m!151491 () Bool)

(assert (=> b!129163 m!151491))

(declare-fun m!151493 () Bool)

(assert (=> b!129163 m!151493))

(assert (=> b!129163 m!151483))

(declare-fun m!151495 () Bool)

(assert (=> b!129163 m!151495))

(declare-fun m!151497 () Bool)

(assert (=> b!129163 m!151497))

(declare-fun m!151499 () Bool)

(assert (=> b!129163 m!151499))

(assert (=> b!129163 m!149575))

(declare-fun m!151501 () Bool)

(assert (=> b!129163 m!151501))

(declare-fun m!151503 () Bool)

(assert (=> b!129163 m!151503))

(declare-fun m!151505 () Bool)

(assert (=> b!129163 m!151505))

(assert (=> b!129163 m!151501))

(assert (=> b!129163 m!151489))

(declare-fun m!151507 () Bool)

(assert (=> b!129163 m!151507))

(declare-fun m!151509 () Bool)

(assert (=> b!129163 m!151509))

(declare-fun m!151511 () Bool)

(assert (=> b!129163 m!151511))

(assert (=> b!129163 m!151509))

(declare-fun m!151513 () Bool)

(assert (=> b!129163 m!151513))

(assert (=> b!129158 m!149575))

(assert (=> b!129158 m!149575))

(declare-fun m!151515 () Bool)

(assert (=> b!129158 m!151515))

(declare-fun m!151517 () Bool)

(assert (=> bm!13972 m!151517))

(assert (=> b!129159 m!149575))

(assert (=> b!129159 m!149575))

(assert (=> b!129159 m!149663))

(assert (=> b!129157 m!149575))

(assert (=> b!129157 m!149575))

(assert (=> b!129157 m!149663))

(declare-fun m!151519 () Bool)

(assert (=> b!129154 m!151519))

(declare-fun m!151521 () Bool)

(assert (=> b!129151 m!151521))

(assert (=> bm!13974 m!151511))

(assert (=> b!128077 d!39245))

(assert (=> b!128340 d!38733))

(declare-fun d!39247 () Bool)

(declare-fun res!62302 () Bool)

(declare-fun e!84282 () Bool)

(assert (=> d!39247 (=> res!62302 e!84282)))

(assert (=> d!39247 (= res!62302 (and ((_ is Cons!1694) (toList!844 call!13818)) (= (_1!1291 (h!2297 (toList!844 call!13818))) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))))

(assert (=> d!39247 (= (containsKey!170 (toList!844 call!13818) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))) e!84282)))

(declare-fun b!129164 () Bool)

(declare-fun e!84283 () Bool)

(assert (=> b!129164 (= e!84282 e!84283)))

(declare-fun res!62303 () Bool)

(assert (=> b!129164 (=> (not res!62303) (not e!84283))))

(assert (=> b!129164 (= res!62303 (and (or (not ((_ is Cons!1694) (toList!844 call!13818))) (bvsle (_1!1291 (h!2297 (toList!844 call!13818))) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))) ((_ is Cons!1694) (toList!844 call!13818)) (bvslt (_1!1291 (h!2297 (toList!844 call!13818))) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141))))))))

(declare-fun b!129165 () Bool)

(assert (=> b!129165 (= e!84283 (containsKey!170 (t!6068 (toList!844 call!13818)) (ite c!23471 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (select (arr!2224 (_keys!4540 newMap!16)) (index!3253 lt!66141)))))))

(assert (= (and d!39247 (not res!62302)) b!129164))

(assert (= (and b!129164 res!62303) b!129165))

(declare-fun m!151523 () Bool)

(assert (=> b!129165 m!151523))

(assert (=> d!38787 d!39247))

(declare-fun lt!66922 () Bool)

(declare-fun d!39249 () Bool)

(assert (=> d!39249 (= lt!66922 (select (content!127 (toList!844 lt!66283)) (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun e!84284 () Bool)

(assert (=> d!39249 (= lt!66922 e!84284)))

(declare-fun res!62304 () Bool)

(assert (=> d!39249 (=> (not res!62304) (not e!84284))))

(assert (=> d!39249 (= res!62304 ((_ is Cons!1694) (toList!844 lt!66283)))))

(assert (=> d!39249 (= (contains!874 (toList!844 lt!66283) (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) lt!66922)))

(declare-fun b!129166 () Bool)

(declare-fun e!84285 () Bool)

(assert (=> b!129166 (= e!84284 e!84285)))

(declare-fun res!62305 () Bool)

(assert (=> b!129166 (=> res!62305 e!84285)))

(assert (=> b!129166 (= res!62305 (= (h!2297 (toList!844 lt!66283)) (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(declare-fun b!129167 () Bool)

(assert (=> b!129167 (= e!84285 (contains!874 (t!6068 (toList!844 lt!66283)) (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))

(assert (= (and d!39249 res!62304) b!129166))

(assert (= (and b!129166 (not res!62305)) b!129167))

(declare-fun m!151525 () Bool)

(assert (=> d!39249 m!151525))

(declare-fun m!151527 () Bool)

(assert (=> d!39249 m!151527))

(declare-fun m!151529 () Bool)

(assert (=> b!129167 m!151529))

(assert (=> b!128230 d!39249))

(declare-fun d!39251 () Bool)

(declare-fun res!62306 () Bool)

(declare-fun e!84286 () Bool)

(assert (=> d!39251 (=> res!62306 e!84286)))

(assert (=> d!39251 (= res!62306 (and ((_ is Cons!1694) (t!6068 (toList!844 lt!65981))) (= (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(assert (=> d!39251 (= (containsKey!170 (t!6068 (toList!844 lt!65981)) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)) e!84286)))

(declare-fun b!129168 () Bool)

(declare-fun e!84287 () Bool)

(assert (=> b!129168 (= e!84286 e!84287)))

(declare-fun res!62307 () Bool)

(assert (=> b!129168 (=> (not res!62307) (not e!84287))))

(assert (=> b!129168 (= res!62307 (and (or (not ((_ is Cons!1694) (t!6068 (toList!844 lt!65981)))) (bvsle (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))) ((_ is Cons!1694) (t!6068 (toList!844 lt!65981))) (bvslt (_1!1291 (h!2297 (t!6068 (toList!844 lt!65981)))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355))))))

(declare-fun b!129169 () Bool)

(assert (=> b!129169 (= e!84287 (containsKey!170 (t!6068 (t!6068 (toList!844 lt!65981))) (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355)))))

(assert (= (and d!39251 (not res!62306)) b!129168))

(assert (= (and b!129168 res!62307) b!129169))

(assert (=> b!129169 m!149345))

(declare-fun m!151531 () Bool)

(assert (=> b!129169 m!151531))

(assert (=> b!128181 d!39251))

(declare-fun d!39253 () Bool)

(assert (=> d!39253 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(declare-fun lt!66923 () Unit!3980)

(assert (=> d!39253 (= lt!66923 (choose!787 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(declare-fun e!84288 () Bool)

(assert (=> d!39253 e!84288))

(declare-fun res!62308 () Bool)

(assert (=> d!39253 (=> (not res!62308) (not e!84288))))

(assert (=> d!39253 (= res!62308 (isStrictlySorted!313 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39253 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061) lt!66923)))

(declare-fun b!129170 () Bool)

(assert (=> b!129170 (= e!84288 (containsKey!170 (toList!844 (+!159 lt!66056 (tuple2!2561 lt!66054 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66061))))

(assert (= (and d!39253 res!62308) b!129170))

(assert (=> d!39253 m!149979))

(assert (=> d!39253 m!149979))

(assert (=> d!39253 m!149981))

(declare-fun m!151533 () Bool)

(assert (=> d!39253 m!151533))

(declare-fun m!151535 () Bool)

(assert (=> d!39253 m!151535))

(assert (=> b!129170 m!149975))

(assert (=> b!128280 d!39253))

(assert (=> b!128280 d!39017))

(assert (=> b!128280 d!39019))

(declare-fun d!39255 () Bool)

(declare-fun e!84289 () Bool)

(assert (=> d!39255 e!84289))

(declare-fun res!62309 () Bool)

(assert (=> d!39255 (=> (not res!62309) (not e!84289))))

(declare-fun lt!66927 () ListLongMap!1657)

(assert (=> d!39255 (= res!62309 (contains!873 lt!66927 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun lt!66926 () List!1698)

(assert (=> d!39255 (= lt!66927 (ListLongMap!1658 lt!66926))))

(declare-fun lt!66925 () Unit!3980)

(declare-fun lt!66924 () Unit!3980)

(assert (=> d!39255 (= lt!66925 lt!66924)))

(assert (=> d!39255 (= (getValueByKey!166 lt!66926 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39255 (= lt!66924 (lemmaContainsTupThenGetReturnValue!84 lt!66926 (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39255 (= lt!66926 (insertStrictlySorted!87 (toList!844 call!13842) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39255 (= (+!159 call!13842 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) lt!66927)))

(declare-fun b!129171 () Bool)

(declare-fun res!62310 () Bool)

(assert (=> b!129171 (=> (not res!62310) (not e!84289))))

(assert (=> b!129171 (= res!62310 (= (getValueByKey!166 (toList!844 lt!66927) (_1!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun b!129172 () Bool)

(assert (=> b!129172 (= e!84289 (contains!874 (toList!844 lt!66927) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(assert (= (and d!39255 res!62309) b!129171))

(assert (= (and b!129171 res!62310) b!129172))

(declare-fun m!151537 () Bool)

(assert (=> d!39255 m!151537))

(declare-fun m!151539 () Bool)

(assert (=> d!39255 m!151539))

(declare-fun m!151541 () Bool)

(assert (=> d!39255 m!151541))

(declare-fun m!151543 () Bool)

(assert (=> d!39255 m!151543))

(declare-fun m!151545 () Bool)

(assert (=> b!129171 m!151545))

(declare-fun m!151547 () Bool)

(assert (=> b!129172 m!151547))

(assert (=> b!128092 d!39255))

(declare-fun d!39257 () Bool)

(declare-fun e!84290 () Bool)

(assert (=> d!39257 e!84290))

(declare-fun res!62311 () Bool)

(assert (=> d!39257 (=> (not res!62311) (not e!84290))))

(declare-fun lt!66931 () ListLongMap!1657)

(assert (=> d!39257 (= res!62311 (contains!873 lt!66931 (_1!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66930 () List!1698)

(assert (=> d!39257 (= lt!66931 (ListLongMap!1658 lt!66930))))

(declare-fun lt!66929 () Unit!3980)

(declare-fun lt!66928 () Unit!3980)

(assert (=> d!39257 (= lt!66929 lt!66928)))

(assert (=> d!39257 (= (getValueByKey!166 lt!66930 (_1!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39257 (= lt!66928 (lemmaContainsTupThenGetReturnValue!84 lt!66930 (_1!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39257 (= lt!66930 (insertStrictlySorted!87 (toList!844 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39257 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66931)))

(declare-fun b!129173 () Bool)

(declare-fun res!62312 () Bool)

(assert (=> b!129173 (=> (not res!62312) (not e!84290))))

(assert (=> b!129173 (= res!62312 (= (getValueByKey!166 (toList!844 lt!66931) (_1!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!171 (_2!1291 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129174 () Bool)

(assert (=> b!129174 (= e!84290 (contains!874 (toList!844 lt!66931) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39257 res!62311) b!129173))

(assert (= (and b!129173 res!62312) b!129174))

(declare-fun m!151549 () Bool)

(assert (=> d!39257 m!151549))

(declare-fun m!151551 () Bool)

(assert (=> d!39257 m!151551))

(declare-fun m!151553 () Bool)

(assert (=> d!39257 m!151553))

(declare-fun m!151555 () Bool)

(assert (=> d!39257 m!151555))

(declare-fun m!151557 () Bool)

(assert (=> b!129173 m!151557))

(declare-fun m!151559 () Bool)

(assert (=> b!129174 m!151559))

(assert (=> d!38719 d!39257))

(assert (=> d!38719 d!38707))

(declare-fun bm!13976 () Bool)

(declare-fun call!13982 () Bool)

(declare-fun lt!66937 () ListLongMap!1657)

(assert (=> bm!13976 (= call!13982 (contains!873 lt!66937 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13977 () Bool)

(declare-fun call!13983 () ListLongMap!1657)

(declare-fun call!13985 () ListLongMap!1657)

(assert (=> bm!13977 (= call!13983 call!13985)))

(declare-fun b!129175 () Bool)

(declare-fun e!84295 () Unit!3980)

(declare-fun Unit!4034 () Unit!3980)

(assert (=> b!129175 (= e!84295 Unit!4034)))

(declare-fun b!129176 () Bool)

(declare-fun e!84293 () Bool)

(declare-fun call!13984 () Bool)

(assert (=> b!129176 (= e!84293 (not call!13984))))

(declare-fun b!129177 () Bool)

(declare-fun e!84300 () Bool)

(assert (=> b!129177 (= e!84293 e!84300)))

(declare-fun res!62314 () Bool)

(assert (=> b!129177 (= res!62314 call!13984)))

(assert (=> b!129177 (=> (not res!62314) (not e!84300))))

(declare-fun b!129178 () Bool)

(declare-fun res!62313 () Bool)

(declare-fun e!84299 () Bool)

(assert (=> b!129178 (=> (not res!62313) (not e!84299))))

(declare-fun e!84292 () Bool)

(assert (=> b!129178 (= res!62313 e!84292)))

(declare-fun res!62320 () Bool)

(assert (=> b!129178 (=> res!62320 e!84292)))

(declare-fun e!84301 () Bool)

(assert (=> b!129178 (= res!62320 (not e!84301))))

(declare-fun res!62315 () Bool)

(assert (=> b!129178 (=> (not res!62315) (not e!84301))))

(assert (=> b!129178 (= res!62315 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129179 () Bool)

(declare-fun e!84303 () ListLongMap!1657)

(declare-fun e!84291 () ListLongMap!1657)

(assert (=> b!129179 (= e!84303 e!84291)))

(declare-fun c!23784 () Bool)

(assert (=> b!129179 (= c!23784 (and (not (= (bvand lt!66154 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66154 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129180 () Bool)

(declare-fun e!84296 () Bool)

(assert (=> b!129180 (= e!84296 (not call!13982))))

(declare-fun d!39259 () Bool)

(assert (=> d!39259 e!84299))

(declare-fun res!62319 () Bool)

(assert (=> d!39259 (=> (not res!62319) (not e!84299))))

(assert (=> d!39259 (= res!62319 (or (bvsge #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))))

(declare-fun lt!66934 () ListLongMap!1657)

(assert (=> d!39259 (= lt!66937 lt!66934)))

(declare-fun lt!66946 () Unit!3980)

(assert (=> d!39259 (= lt!66946 e!84295)))

(declare-fun c!23783 () Bool)

(declare-fun e!84294 () Bool)

(assert (=> d!39259 (= c!23783 e!84294)))

(declare-fun res!62317 () Bool)

(assert (=> d!39259 (=> (not res!62317) (not e!84294))))

(assert (=> d!39259 (= res!62317 (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(assert (=> d!39259 (= lt!66934 e!84303)))

(declare-fun c!23782 () Bool)

(assert (=> d!39259 (= c!23782 (and (not (= (bvand lt!66154 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66154 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39259 (validMask!0 (mask!7071 newMap!16))))

(assert (=> d!39259 (= (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66937)))

(declare-fun b!129181 () Bool)

(assert (=> b!129181 (= e!84291 call!13983)))

(declare-fun b!129182 () Bool)

(declare-fun e!84302 () Bool)

(assert (=> b!129182 (= e!84302 (= (apply!112 lt!66937 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)) (get!1453 (select (arr!2225 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2491 (_values!2787 newMap!16))))))

(assert (=> b!129182 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun b!129183 () Bool)

(assert (=> b!129183 (= e!84303 (+!159 call!13985 (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun b!129184 () Bool)

(assert (=> b!129184 (= e!84299 e!84296)))

(declare-fun c!23786 () Bool)

(assert (=> b!129184 (= c!23786 (not (= (bvand lt!66154 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129185 () Bool)

(declare-fun e!84297 () ListLongMap!1657)

(assert (=> b!129185 (= e!84297 call!13983)))

(declare-fun bm!13978 () Bool)

(declare-fun call!13980 () ListLongMap!1657)

(declare-fun call!13981 () ListLongMap!1657)

(assert (=> bm!13978 (= call!13980 call!13981)))

(declare-fun bm!13979 () Bool)

(declare-fun call!13979 () ListLongMap!1657)

(assert (=> bm!13979 (= call!13985 (+!159 (ite c!23782 call!13981 (ite c!23784 call!13980 call!13979)) (ite (or c!23782 c!23784) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!129186 () Bool)

(declare-fun e!84298 () Bool)

(assert (=> b!129186 (= e!84298 (= (apply!112 lt!66937 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!129187 () Bool)

(assert (=> b!129187 (= e!84297 call!13979)))

(declare-fun b!129188 () Bool)

(assert (=> b!129188 (= e!84300 (= (apply!112 lt!66937 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129189 () Bool)

(assert (=> b!129189 (= e!84301 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13980 () Bool)

(assert (=> bm!13980 (= call!13979 call!13980)))

(declare-fun bm!13981 () Bool)

(assert (=> bm!13981 (= call!13981 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!129190 () Bool)

(assert (=> b!129190 (= e!84292 e!84302)))

(declare-fun res!62316 () Bool)

(assert (=> b!129190 (=> (not res!62316) (not e!84302))))

(assert (=> b!129190 (= res!62316 (contains!873 lt!66937 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_keys!4540 newMap!16))))))

(declare-fun bm!13982 () Bool)

(assert (=> bm!13982 (= call!13984 (contains!873 lt!66937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129191 () Bool)

(assert (=> b!129191 (= e!84294 (validKeyInArray!0 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129192 () Bool)

(assert (=> b!129192 (= e!84296 e!84298)))

(declare-fun res!62318 () Bool)

(assert (=> b!129192 (= res!62318 call!13982)))

(assert (=> b!129192 (=> (not res!62318) (not e!84298))))

(declare-fun b!129193 () Bool)

(declare-fun res!62321 () Bool)

(assert (=> b!129193 (=> (not res!62321) (not e!84299))))

(assert (=> b!129193 (= res!62321 e!84293)))

(declare-fun c!23787 () Bool)

(assert (=> b!129193 (= c!23787 (not (= (bvand lt!66154 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129194 () Bool)

(declare-fun c!23785 () Bool)

(assert (=> b!129194 (= c!23785 (and (not (= (bvand lt!66154 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66154 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129194 (= e!84291 e!84297)))

(declare-fun b!129195 () Bool)

(declare-fun lt!66942 () Unit!3980)

(assert (=> b!129195 (= e!84295 lt!66942)))

(declare-fun lt!66943 () ListLongMap!1657)

(assert (=> b!129195 (= lt!66943 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66941 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66948 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66948 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66938 () Unit!3980)

(assert (=> b!129195 (= lt!66938 (addStillContains!88 lt!66943 lt!66941 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66948))))

(assert (=> b!129195 (contains!873 (+!159 lt!66943 (tuple2!2561 lt!66941 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66948)))

(declare-fun lt!66933 () Unit!3980)

(assert (=> b!129195 (= lt!66933 lt!66938)))

(declare-fun lt!66939 () ListLongMap!1657)

(assert (=> b!129195 (= lt!66939 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66935 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66935 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66945 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66945 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66953 () Unit!3980)

(assert (=> b!129195 (= lt!66953 (addApplyDifferent!88 lt!66939 lt!66935 (minValue!2665 newMap!16) lt!66945))))

(assert (=> b!129195 (= (apply!112 (+!159 lt!66939 (tuple2!2561 lt!66935 (minValue!2665 newMap!16))) lt!66945) (apply!112 lt!66939 lt!66945))))

(declare-fun lt!66949 () Unit!3980)

(assert (=> b!129195 (= lt!66949 lt!66953)))

(declare-fun lt!66952 () ListLongMap!1657)

(assert (=> b!129195 (= lt!66952 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66947 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66932 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66932 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66936 () Unit!3980)

(assert (=> b!129195 (= lt!66936 (addApplyDifferent!88 lt!66952 lt!66947 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66932))))

(assert (=> b!129195 (= (apply!112 (+!159 lt!66952 (tuple2!2561 lt!66947 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66932) (apply!112 lt!66952 lt!66932))))

(declare-fun lt!66944 () Unit!3980)

(assert (=> b!129195 (= lt!66944 lt!66936)))

(declare-fun lt!66950 () ListLongMap!1657)

(assert (=> b!129195 (= lt!66950 (getCurrentListMapNoExtraKeys!124 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66951 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66951 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66940 () (_ BitVec 64))

(assert (=> b!129195 (= lt!66940 (select (arr!2224 (_keys!4540 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129195 (= lt!66942 (addApplyDifferent!88 lt!66950 lt!66951 (minValue!2665 newMap!16) lt!66940))))

(assert (=> b!129195 (= (apply!112 (+!159 lt!66950 (tuple2!2561 lt!66951 (minValue!2665 newMap!16))) lt!66940) (apply!112 lt!66950 lt!66940))))

(assert (= (and d!39259 c!23782) b!129183))

(assert (= (and d!39259 (not c!23782)) b!129179))

(assert (= (and b!129179 c!23784) b!129181))

(assert (= (and b!129179 (not c!23784)) b!129194))

(assert (= (and b!129194 c!23785) b!129185))

(assert (= (and b!129194 (not c!23785)) b!129187))

(assert (= (or b!129185 b!129187) bm!13980))

(assert (= (or b!129181 bm!13980) bm!13978))

(assert (= (or b!129181 b!129185) bm!13977))

(assert (= (or b!129183 bm!13978) bm!13981))

(assert (= (or b!129183 bm!13977) bm!13979))

(assert (= (and d!39259 res!62317) b!129191))

(assert (= (and d!39259 c!23783) b!129195))

(assert (= (and d!39259 (not c!23783)) b!129175))

(assert (= (and d!39259 res!62319) b!129178))

(assert (= (and b!129178 res!62315) b!129189))

(assert (= (and b!129178 (not res!62320)) b!129190))

(assert (= (and b!129190 res!62316) b!129182))

(assert (= (and b!129178 res!62313) b!129193))

(assert (= (and b!129193 c!23787) b!129177))

(assert (= (and b!129193 (not c!23787)) b!129176))

(assert (= (and b!129177 res!62314) b!129188))

(assert (= (or b!129177 b!129176) bm!13982))

(assert (= (and b!129193 res!62321) b!129184))

(assert (= (and b!129184 c!23786) b!129192))

(assert (= (and b!129184 (not c!23786)) b!129180))

(assert (= (and b!129192 res!62318) b!129186))

(assert (= (or b!129192 b!129180) bm!13976))

(declare-fun b_lambda!5701 () Bool)

(assert (=> (not b_lambda!5701) (not b!129182)))

(assert (=> b!129182 t!6080))

(declare-fun b_and!7973 () Bool)

(assert (= b_and!7969 (and (=> t!6080 result!3889) b_and!7973)))

(assert (=> b!129182 t!6082))

(declare-fun b_and!7975 () Bool)

(assert (= b_and!7971 (and (=> t!6082 result!3891) b_and!7975)))

(declare-fun m!151561 () Bool)

(assert (=> bm!13982 m!151561))

(declare-fun m!151563 () Bool)

(assert (=> b!129188 m!151563))

(assert (=> b!129182 m!149617))

(assert (=> b!129182 m!149619))

(assert (=> b!129182 m!149617))

(assert (=> b!129182 m!149621))

(assert (=> b!129182 m!149575))

(declare-fun m!151565 () Bool)

(assert (=> b!129182 m!151565))

(assert (=> b!129182 m!149619))

(assert (=> b!129182 m!149575))

(declare-fun m!151567 () Bool)

(assert (=> bm!13976 m!151567))

(assert (=> d!39259 m!149585))

(declare-fun m!151569 () Bool)

(assert (=> b!129195 m!151569))

(assert (=> b!129195 m!149343))

(declare-fun m!151571 () Bool)

(assert (=> b!129195 m!151571))

(declare-fun m!151573 () Bool)

(assert (=> b!129195 m!151573))

(declare-fun m!151575 () Bool)

(assert (=> b!129195 m!151575))

(declare-fun m!151577 () Bool)

(assert (=> b!129195 m!151577))

(declare-fun m!151579 () Bool)

(assert (=> b!129195 m!151579))

(assert (=> b!129195 m!151569))

(declare-fun m!151581 () Bool)

(assert (=> b!129195 m!151581))

(assert (=> b!129195 m!149343))

(declare-fun m!151583 () Bool)

(assert (=> b!129195 m!151583))

(declare-fun m!151585 () Bool)

(assert (=> b!129195 m!151585))

(assert (=> b!129195 m!149575))

(declare-fun m!151587 () Bool)

(assert (=> b!129195 m!151587))

(declare-fun m!151589 () Bool)

(assert (=> b!129195 m!151589))

(declare-fun m!151591 () Bool)

(assert (=> b!129195 m!151591))

(assert (=> b!129195 m!151587))

(assert (=> b!129195 m!151575))

(declare-fun m!151593 () Bool)

(assert (=> b!129195 m!151593))

(declare-fun m!151595 () Bool)

(assert (=> b!129195 m!151595))

(assert (=> b!129195 m!149343))

(declare-fun m!151597 () Bool)

(assert (=> b!129195 m!151597))

(assert (=> b!129195 m!151595))

(declare-fun m!151599 () Bool)

(assert (=> b!129195 m!151599))

(assert (=> b!129190 m!149575))

(assert (=> b!129190 m!149575))

(declare-fun m!151601 () Bool)

(assert (=> b!129190 m!151601))

(declare-fun m!151603 () Bool)

(assert (=> bm!13979 m!151603))

(assert (=> b!129191 m!149575))

(assert (=> b!129191 m!149575))

(assert (=> b!129191 m!149663))

(assert (=> b!129189 m!149575))

(assert (=> b!129189 m!149575))

(assert (=> b!129189 m!149663))

(declare-fun m!151605 () Bool)

(assert (=> b!129186 m!151605))

(declare-fun m!151607 () Bool)

(assert (=> b!129183 m!151607))

(assert (=> bm!13981 m!149343))

(assert (=> bm!13981 m!151597))

(assert (=> d!38719 d!39259))

(declare-fun d!39261 () Bool)

(assert (=> d!39261 (= (+!159 (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!513 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) lt!66154 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39261 true))

(declare-fun _$7!110 () Unit!3980)

(assert (=> d!39261 (= (choose!783 (_keys!4540 newMap!16) (_values!2787 newMap!16) (mask!7071 newMap!16) (extraKeys!2581 newMap!16) lt!66154 (zeroValue!2665 newMap!16) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)) _$7!110)))

(declare-fun bs!5350 () Bool)

(assert (= bs!5350 d!39261))

(assert (=> bs!5350 m!149437))

(assert (=> bs!5350 m!149437))

(assert (=> bs!5350 m!149693))

(assert (=> bs!5350 m!149343))

(assert (=> bs!5350 m!149691))

(assert (=> d!38719 d!39261))

(assert (=> d!38719 d!38895))

(declare-fun d!39263 () Bool)

(assert (=> d!39263 (= (get!1456 (getValueByKey!166 (toList!844 lt!66063) lt!66053)) (v!3143 (getValueByKey!166 (toList!844 lt!66063) lt!66053)))))

(assert (=> d!38753 d!39263))

(declare-fun b!129196 () Bool)

(declare-fun e!84304 () Option!172)

(assert (=> b!129196 (= e!84304 (Some!171 (_2!1291 (h!2297 (toList!844 lt!66063)))))))

(declare-fun b!129199 () Bool)

(declare-fun e!84305 () Option!172)

(assert (=> b!129199 (= e!84305 None!170)))

(declare-fun b!129198 () Bool)

(assert (=> b!129198 (= e!84305 (getValueByKey!166 (t!6068 (toList!844 lt!66063)) lt!66053))))

(declare-fun d!39265 () Bool)

(declare-fun c!23788 () Bool)

(assert (=> d!39265 (= c!23788 (and ((_ is Cons!1694) (toList!844 lt!66063)) (= (_1!1291 (h!2297 (toList!844 lt!66063))) lt!66053)))))

(assert (=> d!39265 (= (getValueByKey!166 (toList!844 lt!66063) lt!66053) e!84304)))

(declare-fun b!129197 () Bool)

(assert (=> b!129197 (= e!84304 e!84305)))

(declare-fun c!23789 () Bool)

(assert (=> b!129197 (= c!23789 (and ((_ is Cons!1694) (toList!844 lt!66063)) (not (= (_1!1291 (h!2297 (toList!844 lt!66063))) lt!66053))))))

(assert (= (and d!39265 c!23788) b!129196))

(assert (= (and d!39265 (not c!23788)) b!129197))

(assert (= (and b!129197 c!23789) b!129198))

(assert (= (and b!129197 (not c!23789)) b!129199))

(declare-fun m!151609 () Bool)

(assert (=> b!129198 m!151609))

(assert (=> d!38753 d!39265))

(assert (=> b!128347 d!38697))

(declare-fun d!39267 () Bool)

(declare-fun e!84307 () Bool)

(assert (=> d!39267 e!84307))

(declare-fun res!62322 () Bool)

(assert (=> d!39267 (=> res!62322 e!84307)))

(declare-fun lt!66956 () Bool)

(assert (=> d!39267 (= res!62322 (not lt!66956))))

(declare-fun lt!66957 () Bool)

(assert (=> d!39267 (= lt!66956 lt!66957)))

(declare-fun lt!66955 () Unit!3980)

(declare-fun e!84306 () Unit!3980)

(assert (=> d!39267 (= lt!66955 e!84306)))

(declare-fun c!23790 () Bool)

(assert (=> d!39267 (= c!23790 lt!66957)))

(assert (=> d!39267 (= lt!66957 (containsKey!170 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> d!39267 (= (contains!873 lt!66320 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66956)))

(declare-fun b!129200 () Bool)

(declare-fun lt!66954 () Unit!3980)

(assert (=> b!129200 (= e!84306 lt!66954)))

(assert (=> b!129200 (= lt!66954 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(assert (=> b!129200 (isDefined!120 (getValueByKey!166 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129201 () Bool)

(declare-fun Unit!4035 () Unit!3980)

(assert (=> b!129201 (= e!84306 Unit!4035)))

(declare-fun b!129202 () Bool)

(assert (=> b!129202 (= e!84307 (isDefined!120 (getValueByKey!166 (toList!844 lt!66320) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39267 c!23790) b!129200))

(assert (= (and d!39267 (not c!23790)) b!129201))

(assert (= (and d!39267 (not res!62322)) b!129202))

(declare-fun m!151611 () Bool)

(assert (=> d!39267 m!151611))

(declare-fun m!151613 () Bool)

(assert (=> b!129200 m!151613))

(assert (=> b!129200 m!149947))

(assert (=> b!129200 m!149947))

(declare-fun m!151615 () Bool)

(assert (=> b!129200 m!151615))

(assert (=> b!129202 m!149947))

(assert (=> b!129202 m!149947))

(assert (=> b!129202 m!151615))

(assert (=> d!38763 d!39267))

(declare-fun b!129203 () Bool)

(declare-fun e!84308 () Option!172)

(assert (=> b!129203 (= e!84308 (Some!171 (_2!1291 (h!2297 lt!66319))))))

(declare-fun b!129206 () Bool)

(declare-fun e!84309 () Option!172)

(assert (=> b!129206 (= e!84309 None!170)))

(declare-fun b!129205 () Bool)

(assert (=> b!129205 (= e!84309 (getValueByKey!166 (t!6068 lt!66319) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun c!23791 () Bool)

(declare-fun d!39269 () Bool)

(assert (=> d!39269 (= c!23791 (and ((_ is Cons!1694) lt!66319) (= (_1!1291 (h!2297 lt!66319)) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39269 (= (getValueByKey!166 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) e!84308)))

(declare-fun b!129204 () Bool)

(assert (=> b!129204 (= e!84308 e!84309)))

(declare-fun c!23792 () Bool)

(assert (=> b!129204 (= c!23792 (and ((_ is Cons!1694) lt!66319) (not (= (_1!1291 (h!2297 lt!66319)) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(assert (= (and d!39269 c!23791) b!129203))

(assert (= (and d!39269 (not c!23791)) b!129204))

(assert (= (and b!129204 c!23792) b!129205))

(assert (= (and b!129204 (not c!23792)) b!129206))

(declare-fun m!151617 () Bool)

(assert (=> b!129205 m!151617))

(assert (=> d!38763 d!39269))

(declare-fun d!39271 () Bool)

(assert (=> d!39271 (= (getValueByKey!166 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) (Some!171 (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun lt!66958 () Unit!3980)

(assert (=> d!39271 (= lt!66958 (choose!790 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun e!84310 () Bool)

(assert (=> d!39271 e!84310))

(declare-fun res!62323 () Bool)

(assert (=> d!39271 (=> (not res!62323) (not e!84310))))

(assert (=> d!39271 (= res!62323 (isStrictlySorted!313 lt!66319))))

(assert (=> d!39271 (= (lemmaContainsTupThenGetReturnValue!84 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66958)))

(declare-fun b!129207 () Bool)

(declare-fun res!62324 () Bool)

(assert (=> b!129207 (=> (not res!62324) (not e!84310))))

(assert (=> b!129207 (= res!62324 (containsKey!170 lt!66319 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129208 () Bool)

(assert (=> b!129208 (= e!84310 (contains!874 lt!66319 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (= (and d!39271 res!62323) b!129207))

(assert (= (and b!129207 res!62324) b!129208))

(assert (=> d!39271 m!149941))

(declare-fun m!151619 () Bool)

(assert (=> d!39271 m!151619))

(declare-fun m!151621 () Bool)

(assert (=> d!39271 m!151621))

(declare-fun m!151623 () Bool)

(assert (=> b!129207 m!151623))

(declare-fun m!151625 () Bool)

(assert (=> b!129208 m!151625))

(assert (=> d!38763 d!39271))

(declare-fun b!129209 () Bool)

(declare-fun e!84315 () List!1698)

(declare-fun call!13986 () List!1698)

(assert (=> b!129209 (= e!84315 call!13986)))

(declare-fun b!129210 () Bool)

(declare-fun e!84311 () List!1698)

(declare-fun call!13988 () List!1698)

(assert (=> b!129210 (= e!84311 call!13988)))

(declare-fun lt!66959 () List!1698)

(declare-fun b!129211 () Bool)

(declare-fun e!84313 () Bool)

(assert (=> b!129211 (= e!84313 (contains!874 lt!66959 (tuple2!2561 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun e!84312 () List!1698)

(declare-fun b!129212 () Bool)

(assert (=> b!129212 (= e!84312 (insertStrictlySorted!87 (t!6068 (toList!844 lt!66065)) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun bm!13983 () Bool)

(declare-fun call!13987 () List!1698)

(assert (=> bm!13983 (= call!13988 call!13987)))

(declare-fun b!129213 () Bool)

(declare-fun e!84314 () List!1698)

(assert (=> b!129213 (= e!84314 call!13987)))

(declare-fun c!23794 () Bool)

(declare-fun bm!13984 () Bool)

(assert (=> bm!13984 (= call!13986 ($colon$colon!89 e!84312 (ite c!23794 (h!2297 (toList!844 lt!66065)) (tuple2!2561 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))))

(declare-fun c!23796 () Bool)

(assert (=> bm!13984 (= c!23796 c!23794)))

(declare-fun b!129214 () Bool)

(assert (=> b!129214 (= e!84315 e!84314)))

(declare-fun c!23795 () Bool)

(assert (=> b!129214 (= c!23795 (and ((_ is Cons!1694) (toList!844 lt!66065)) (= (_1!1291 (h!2297 (toList!844 lt!66065))) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(declare-fun c!23793 () Bool)

(declare-fun b!129215 () Bool)

(assert (=> b!129215 (= c!23793 (and ((_ is Cons!1694) (toList!844 lt!66065)) (bvsgt (_1!1291 (h!2297 (toList!844 lt!66065))) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> b!129215 (= e!84314 e!84311)))

(declare-fun b!129216 () Bool)

(assert (=> b!129216 (= e!84312 (ite c!23795 (t!6068 (toList!844 lt!66065)) (ite c!23793 (Cons!1694 (h!2297 (toList!844 lt!66065)) (t!6068 (toList!844 lt!66065))) Nil!1695)))))

(declare-fun b!129217 () Bool)

(declare-fun res!62325 () Bool)

(assert (=> b!129217 (=> (not res!62325) (not e!84313))))

(assert (=> b!129217 (= res!62325 (containsKey!170 lt!66959 (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))))))

(declare-fun b!129218 () Bool)

(assert (=> b!129218 (= e!84311 call!13988)))

(declare-fun bm!13985 () Bool)

(assert (=> bm!13985 (= call!13987 call!13986)))

(declare-fun d!39273 () Bool)

(assert (=> d!39273 e!84313))

(declare-fun res!62326 () Bool)

(assert (=> d!39273 (=> (not res!62326) (not e!84313))))

(assert (=> d!39273 (= res!62326 (isStrictlySorted!313 lt!66959))))

(assert (=> d!39273 (= lt!66959 e!84315)))

(assert (=> d!39273 (= c!23794 (and ((_ is Cons!1694) (toList!844 lt!66065)) (bvslt (_1!1291 (h!2297 (toList!844 lt!66065))) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))))))))

(assert (=> d!39273 (isStrictlySorted!313 (toList!844 lt!66065))))

(assert (=> d!39273 (= (insertStrictlySorted!87 (toList!844 lt!66065) (_1!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992))))) (_2!1291 (tuple2!2561 lt!66060 (zeroValue!2665 (v!3138 (underlying!440 thiss!992)))))) lt!66959)))

(assert (= (and d!39273 c!23794) b!129209))

(assert (= (and d!39273 (not c!23794)) b!129214))

(assert (= (and b!129214 c!23795) b!129213))

(assert (= (and b!129214 (not c!23795)) b!129215))

(assert (= (and b!129215 c!23793) b!129218))

(assert (= (and b!129215 (not c!23793)) b!129210))

(assert (= (or b!129218 b!129210) bm!13983))

(assert (= (or b!129213 bm!13983) bm!13985))

(assert (= (or b!129209 bm!13985) bm!13984))

(assert (= (and bm!13984 c!23796) b!129212))

(assert (= (and bm!13984 (not c!23796)) b!129216))

(assert (= (and d!39273 res!62326) b!129217))

(assert (= (and b!129217 res!62325) b!129211))

(declare-fun m!151627 () Bool)

(assert (=> b!129212 m!151627))

(declare-fun m!151629 () Bool)

(assert (=> bm!13984 m!151629))

(declare-fun m!151631 () Bool)

(assert (=> b!129217 m!151631))

(declare-fun m!151633 () Bool)

(assert (=> d!39273 m!151633))

(declare-fun m!151635 () Bool)

(assert (=> d!39273 m!151635))

(declare-fun m!151637 () Bool)

(assert (=> b!129211 m!151637))

(assert (=> d!38763 d!39273))

(declare-fun d!39275 () Bool)

(assert (=> d!39275 (= (apply!112 lt!66240 lt!66230) (get!1456 (getValueByKey!166 (toList!844 lt!66240) lt!66230)))))

(declare-fun bs!5351 () Bool)

(assert (= bs!5351 d!39275))

(declare-fun m!151639 () Bool)

(assert (=> bs!5351 m!151639))

(assert (=> bs!5351 m!151639))

(declare-fun m!151641 () Bool)

(assert (=> bs!5351 m!151641))

(assert (=> b!128154 d!39275))

(declare-fun d!39277 () Bool)

(assert (=> d!39277 (contains!873 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66238)))

(declare-fun lt!66960 () Unit!3980)

(assert (=> d!39277 (= lt!66960 (choose!786 lt!66233 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66238))))

(assert (=> d!39277 (contains!873 lt!66233 lt!66238)))

(assert (=> d!39277 (= (addStillContains!88 lt!66233 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66238) lt!66960)))

(declare-fun bs!5352 () Bool)

(assert (= bs!5352 d!39277))

(assert (=> bs!5352 m!149751))

(assert (=> bs!5352 m!149751))

(assert (=> bs!5352 m!149753))

(declare-fun m!151643 () Bool)

(assert (=> bs!5352 m!151643))

(declare-fun m!151645 () Bool)

(assert (=> bs!5352 m!151645))

(assert (=> b!128154 d!39277))

(declare-fun d!39279 () Bool)

(declare-fun e!84316 () Bool)

(assert (=> d!39279 e!84316))

(declare-fun res!62327 () Bool)

(assert (=> d!39279 (=> (not res!62327) (not e!84316))))

(declare-fun lt!66964 () ListLongMap!1657)

(assert (=> d!39279 (= res!62327 (contains!873 lt!66964 (_1!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(declare-fun lt!66963 () List!1698)

(assert (=> d!39279 (= lt!66964 (ListLongMap!1658 lt!66963))))

(declare-fun lt!66962 () Unit!3980)

(declare-fun lt!66961 () Unit!3980)

(assert (=> d!39279 (= lt!66962 lt!66961)))

(assert (=> d!39279 (= (getValueByKey!166 lt!66963 (_1!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39279 (= lt!66961 (lemmaContainsTupThenGetReturnValue!84 lt!66963 (_1!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39279 (= lt!66963 (insertStrictlySorted!87 (toList!844 lt!66242) (_1!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39279 (= (+!159 lt!66242 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66964)))

(declare-fun b!129219 () Bool)

(declare-fun res!62328 () Bool)

(assert (=> b!129219 (=> (not res!62328) (not e!84316))))

(assert (=> b!129219 (= res!62328 (= (getValueByKey!166 (toList!844 lt!66964) (_1!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))))

(declare-fun b!129220 () Bool)

(assert (=> b!129220 (= e!84316 (contains!874 (toList!844 lt!66964) (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))

(assert (= (and d!39279 res!62327) b!129219))

(assert (= (and b!129219 res!62328) b!129220))

(declare-fun m!151647 () Bool)

(assert (=> d!39279 m!151647))

(declare-fun m!151649 () Bool)

(assert (=> d!39279 m!151649))

(declare-fun m!151651 () Bool)

(assert (=> d!39279 m!151651))

(declare-fun m!151653 () Bool)

(assert (=> d!39279 m!151653))

(declare-fun m!151655 () Bool)

(assert (=> b!129219 m!151655))

(declare-fun m!151657 () Bool)

(assert (=> b!129220 m!151657))

(assert (=> b!128154 d!39279))

(declare-fun d!39281 () Bool)

(assert (=> d!39281 (= (apply!112 (+!159 lt!66229 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) lt!66235) (apply!112 lt!66229 lt!66235))))

(declare-fun lt!66965 () Unit!3980)

(assert (=> d!39281 (= lt!66965 (choose!785 lt!66229 lt!66225 (minValue!2665 newMap!16) lt!66235))))

(declare-fun e!84317 () Bool)

(assert (=> d!39281 e!84317))

(declare-fun res!62329 () Bool)

(assert (=> d!39281 (=> (not res!62329) (not e!84317))))

(assert (=> d!39281 (= res!62329 (contains!873 lt!66229 lt!66235))))

(assert (=> d!39281 (= (addApplyDifferent!88 lt!66229 lt!66225 (minValue!2665 newMap!16) lt!66235) lt!66965)))

(declare-fun b!129221 () Bool)

(assert (=> b!129221 (= e!84317 (not (= lt!66235 lt!66225)))))

(assert (= (and d!39281 res!62329) b!129221))

(assert (=> d!39281 m!149759))

(assert (=> d!39281 m!149763))

(declare-fun m!151659 () Bool)

(assert (=> d!39281 m!151659))

(assert (=> d!39281 m!149759))

(declare-fun m!151661 () Bool)

(assert (=> d!39281 m!151661))

(assert (=> d!39281 m!149737))

(assert (=> b!128154 d!39281))

(declare-fun d!39283 () Bool)

(assert (=> d!39283 (= (apply!112 lt!66229 lt!66235) (get!1456 (getValueByKey!166 (toList!844 lt!66229) lt!66235)))))

(declare-fun bs!5353 () Bool)

(assert (= bs!5353 d!39283))

(declare-fun m!151663 () Bool)

(assert (=> bs!5353 m!151663))

(assert (=> bs!5353 m!151663))

(declare-fun m!151665 () Bool)

(assert (=> bs!5353 m!151665))

(assert (=> b!128154 d!39283))

(declare-fun d!39285 () Bool)

(declare-fun e!84318 () Bool)

(assert (=> d!39285 e!84318))

(declare-fun res!62330 () Bool)

(assert (=> d!39285 (=> (not res!62330) (not e!84318))))

(declare-fun lt!66969 () ListLongMap!1657)

(assert (=> d!39285 (= res!62330 (contains!873 lt!66969 (_1!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))))))

(declare-fun lt!66968 () List!1698)

(assert (=> d!39285 (= lt!66969 (ListLongMap!1658 lt!66968))))

(declare-fun lt!66967 () Unit!3980)

(declare-fun lt!66966 () Unit!3980)

(assert (=> d!39285 (= lt!66967 lt!66966)))

(assert (=> d!39285 (= (getValueByKey!166 lt!66968 (_1!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))))))

(assert (=> d!39285 (= lt!66966 (lemmaContainsTupThenGetReturnValue!84 lt!66968 (_1!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))))))

(assert (=> d!39285 (= lt!66968 (insertStrictlySorted!87 (toList!844 lt!66240) (_1!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))))))

(assert (=> d!39285 (= (+!159 lt!66240 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) lt!66969)))

(declare-fun b!129222 () Bool)

(declare-fun res!62331 () Bool)

(assert (=> b!129222 (=> (not res!62331) (not e!84318))))

(assert (=> b!129222 (= res!62331 (= (getValueByKey!166 (toList!844 lt!66969) (_1!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))))))))

(declare-fun b!129223 () Bool)

(assert (=> b!129223 (= e!84318 (contains!874 (toList!844 lt!66969) (tuple2!2561 lt!66241 (minValue!2665 newMap!16))))))

(assert (= (and d!39285 res!62330) b!129222))

(assert (= (and b!129222 res!62331) b!129223))

(declare-fun m!151667 () Bool)

(assert (=> d!39285 m!151667))

(declare-fun m!151669 () Bool)

(assert (=> d!39285 m!151669))

(declare-fun m!151671 () Bool)

(assert (=> d!39285 m!151671))

(declare-fun m!151673 () Bool)

(assert (=> d!39285 m!151673))

(declare-fun m!151675 () Bool)

(assert (=> b!129222 m!151675))

(declare-fun m!151677 () Bool)

(assert (=> b!129223 m!151677))

(assert (=> b!128154 d!39285))

(declare-fun d!39287 () Bool)

(assert (=> d!39287 (= (apply!112 (+!159 lt!66240 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) lt!66230) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66240 (tuple2!2561 lt!66241 (minValue!2665 newMap!16)))) lt!66230)))))

(declare-fun bs!5354 () Bool)

(assert (= bs!5354 d!39287))

(declare-fun m!151679 () Bool)

(assert (=> bs!5354 m!151679))

(assert (=> bs!5354 m!151679))

(declare-fun m!151681 () Bool)

(assert (=> bs!5354 m!151681))

(assert (=> b!128154 d!39287))

(declare-fun d!39289 () Bool)

(assert (=> d!39289 (= (apply!112 lt!66242 lt!66222) (get!1456 (getValueByKey!166 (toList!844 lt!66242) lt!66222)))))

(declare-fun bs!5355 () Bool)

(assert (= bs!5355 d!39289))

(declare-fun m!151683 () Bool)

(assert (=> bs!5355 m!151683))

(assert (=> bs!5355 m!151683))

(declare-fun m!151685 () Bool)

(assert (=> bs!5355 m!151685))

(assert (=> b!128154 d!39289))

(declare-fun d!39291 () Bool)

(assert (=> d!39291 (= (apply!112 (+!159 lt!66229 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) lt!66235) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66229 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))) lt!66235)))))

(declare-fun bs!5356 () Bool)

(assert (= bs!5356 d!39291))

(declare-fun m!151687 () Bool)

(assert (=> bs!5356 m!151687))

(assert (=> bs!5356 m!151687))

(declare-fun m!151689 () Bool)

(assert (=> bs!5356 m!151689))

(assert (=> b!128154 d!39291))

(declare-fun d!39293 () Bool)

(assert (=> d!39293 (= (apply!112 (+!159 lt!66242 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66222) (apply!112 lt!66242 lt!66222))))

(declare-fun lt!66970 () Unit!3980)

(assert (=> d!39293 (= lt!66970 (choose!785 lt!66242 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66222))))

(declare-fun e!84319 () Bool)

(assert (=> d!39293 e!84319))

(declare-fun res!62332 () Bool)

(assert (=> d!39293 (=> (not res!62332) (not e!84319))))

(assert (=> d!39293 (= res!62332 (contains!873 lt!66242 lt!66222))))

(assert (=> d!39293 (= (addApplyDifferent!88 lt!66242 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66222) lt!66970)))

(declare-fun b!129224 () Bool)

(assert (=> b!129224 (= e!84319 (not (= lt!66222 lt!66237)))))

(assert (= (and d!39293 res!62332) b!129224))

(assert (=> d!39293 m!149739))

(assert (=> d!39293 m!149757))

(declare-fun m!151691 () Bool)

(assert (=> d!39293 m!151691))

(assert (=> d!39293 m!149739))

(declare-fun m!151693 () Bool)

(assert (=> d!39293 m!151693))

(assert (=> d!39293 m!149755))

(assert (=> b!128154 d!39293))

(declare-fun d!39295 () Bool)

(declare-fun e!84320 () Bool)

(assert (=> d!39295 e!84320))

(declare-fun res!62333 () Bool)

(assert (=> d!39295 (=> (not res!62333) (not e!84320))))

(declare-fun lt!66974 () ListLongMap!1657)

(assert (=> d!39295 (= res!62333 (contains!873 lt!66974 (_1!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))))))

(declare-fun lt!66973 () List!1698)

(assert (=> d!39295 (= lt!66974 (ListLongMap!1658 lt!66973))))

(declare-fun lt!66972 () Unit!3980)

(declare-fun lt!66971 () Unit!3980)

(assert (=> d!39295 (= lt!66972 lt!66971)))

(assert (=> d!39295 (= (getValueByKey!166 lt!66973 (_1!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))))))

(assert (=> d!39295 (= lt!66971 (lemmaContainsTupThenGetReturnValue!84 lt!66973 (_1!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))))))

(assert (=> d!39295 (= lt!66973 (insertStrictlySorted!87 (toList!844 lt!66229) (_1!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) (_2!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))))))

(assert (=> d!39295 (= (+!159 lt!66229 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))) lt!66974)))

(declare-fun b!129225 () Bool)

(declare-fun res!62334 () Bool)

(assert (=> b!129225 (=> (not res!62334) (not e!84320))))

(assert (=> b!129225 (= res!62334 (= (getValueByKey!166 (toList!844 lt!66974) (_1!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16)))) (Some!171 (_2!1291 (tuple2!2561 lt!66225 (minValue!2665 newMap!16))))))))

(declare-fun b!129226 () Bool)

(assert (=> b!129226 (= e!84320 (contains!874 (toList!844 lt!66974) (tuple2!2561 lt!66225 (minValue!2665 newMap!16))))))

(assert (= (and d!39295 res!62333) b!129225))

(assert (= (and b!129225 res!62334) b!129226))

(declare-fun m!151695 () Bool)

(assert (=> d!39295 m!151695))

(declare-fun m!151697 () Bool)

(assert (=> d!39295 m!151697))

(declare-fun m!151699 () Bool)

(assert (=> d!39295 m!151699))

(declare-fun m!151701 () Bool)

(assert (=> d!39295 m!151701))

(declare-fun m!151703 () Bool)

(assert (=> b!129225 m!151703))

(declare-fun m!151705 () Bool)

(assert (=> b!129226 m!151705))

(assert (=> b!128154 d!39295))

(declare-fun d!39297 () Bool)

(declare-fun e!84322 () Bool)

(assert (=> d!39297 e!84322))

(declare-fun res!62335 () Bool)

(assert (=> d!39297 (=> res!62335 e!84322)))

(declare-fun lt!66977 () Bool)

(assert (=> d!39297 (= res!62335 (not lt!66977))))

(declare-fun lt!66978 () Bool)

(assert (=> d!39297 (= lt!66977 lt!66978)))

(declare-fun lt!66976 () Unit!3980)

(declare-fun e!84321 () Unit!3980)

(assert (=> d!39297 (= lt!66976 e!84321)))

(declare-fun c!23797 () Bool)

(assert (=> d!39297 (= c!23797 lt!66978)))

(assert (=> d!39297 (= lt!66978 (containsKey!170 (toList!844 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66238))))

(assert (=> d!39297 (= (contains!873 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66238) lt!66977)))

(declare-fun b!129227 () Bool)

(declare-fun lt!66975 () Unit!3980)

(assert (=> b!129227 (= e!84321 lt!66975)))

(assert (=> b!129227 (= lt!66975 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!844 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66238))))

(assert (=> b!129227 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66238))))

(declare-fun b!129228 () Bool)

(declare-fun Unit!4036 () Unit!3980)

(assert (=> b!129228 (= e!84321 Unit!4036)))

(declare-fun b!129229 () Bool)

(assert (=> b!129229 (= e!84322 (isDefined!120 (getValueByKey!166 (toList!844 (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66238)))))

(assert (= (and d!39297 c!23797) b!129227))

(assert (= (and d!39297 (not c!23797)) b!129228))

(assert (= (and d!39297 (not res!62335)) b!129229))

(declare-fun m!151707 () Bool)

(assert (=> d!39297 m!151707))

(declare-fun m!151709 () Bool)

(assert (=> b!129227 m!151709))

(declare-fun m!151711 () Bool)

(assert (=> b!129227 m!151711))

(assert (=> b!129227 m!151711))

(declare-fun m!151713 () Bool)

(assert (=> b!129227 m!151713))

(assert (=> b!129229 m!151711))

(assert (=> b!129229 m!151711))

(assert (=> b!129229 m!151713))

(assert (=> b!128154 d!39297))

(declare-fun d!39299 () Bool)

(assert (=> d!39299 (= (apply!112 (+!159 lt!66242 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66222) (get!1456 (getValueByKey!166 (toList!844 (+!159 lt!66242 (tuple2!2561 lt!66237 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66222)))))

(declare-fun bs!5357 () Bool)

(assert (= bs!5357 d!39299))

(declare-fun m!151715 () Bool)

(assert (=> bs!5357 m!151715))

(assert (=> bs!5357 m!151715))

(declare-fun m!151717 () Bool)

(assert (=> bs!5357 m!151717))

(assert (=> b!128154 d!39299))

(declare-fun d!39301 () Bool)

(assert (=> d!39301 (= (apply!112 (+!159 lt!66240 (tuple2!2561 lt!66241 (minValue!2665 newMap!16))) lt!66230) (apply!112 lt!66240 lt!66230))))

(declare-fun lt!66979 () Unit!3980)

(assert (=> d!39301 (= lt!66979 (choose!785 lt!66240 lt!66241 (minValue!2665 newMap!16) lt!66230))))

(declare-fun e!84323 () Bool)

(assert (=> d!39301 e!84323))

(declare-fun res!62336 () Bool)

(assert (=> d!39301 (=> (not res!62336) (not e!84323))))

(assert (=> d!39301 (= res!62336 (contains!873 lt!66240 lt!66230))))

(assert (=> d!39301 (= (addApplyDifferent!88 lt!66240 lt!66241 (minValue!2665 newMap!16) lt!66230) lt!66979)))

(declare-fun b!129230 () Bool)

(assert (=> b!129230 (= e!84323 (not (= lt!66230 lt!66241)))))

(assert (= (and d!39301 res!62336) b!129230))

(assert (=> d!39301 m!149733))

(assert (=> d!39301 m!149745))

(declare-fun m!151719 () Bool)

(assert (=> d!39301 m!151719))

(assert (=> d!39301 m!149733))

(declare-fun m!151721 () Bool)

(assert (=> d!39301 m!151721))

(assert (=> d!39301 m!149743))

(assert (=> b!128154 d!39301))

(declare-fun d!39303 () Bool)

(declare-fun e!84324 () Bool)

(assert (=> d!39303 e!84324))

(declare-fun res!62337 () Bool)

(assert (=> d!39303 (=> (not res!62337) (not e!84324))))

(declare-fun lt!66983 () ListLongMap!1657)

(assert (=> d!39303 (= res!62337 (contains!873 lt!66983 (_1!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(declare-fun lt!66982 () List!1698)

(assert (=> d!39303 (= lt!66983 (ListLongMap!1658 lt!66982))))

(declare-fun lt!66981 () Unit!3980)

(declare-fun lt!66980 () Unit!3980)

(assert (=> d!39303 (= lt!66981 lt!66980)))

(assert (=> d!39303 (= (getValueByKey!166 lt!66982 (_1!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39303 (= lt!66980 (lemmaContainsTupThenGetReturnValue!84 lt!66982 (_1!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39303 (= lt!66982 (insertStrictlySorted!87 (toList!844 lt!66233) (_1!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39303 (= (+!159 lt!66233 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66983)))

(declare-fun b!129231 () Bool)

(declare-fun res!62338 () Bool)

(assert (=> b!129231 (=> (not res!62338) (not e!84324))))

(assert (=> b!129231 (= res!62338 (= (getValueByKey!166 (toList!844 lt!66983) (_1!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!171 (_2!1291 (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))))

(declare-fun b!129232 () Bool)

(assert (=> b!129232 (= e!84324 (contains!874 (toList!844 lt!66983) (tuple2!2561 lt!66231 (ite (and c!23467 c!23472) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))

(assert (= (and d!39303 res!62337) b!129231))

(assert (= (and b!129231 res!62338) b!129232))

(declare-fun m!151723 () Bool)

(assert (=> d!39303 m!151723))

(declare-fun m!151725 () Bool)

(assert (=> d!39303 m!151725))

(declare-fun m!151727 () Bool)

(assert (=> d!39303 m!151727))

(declare-fun m!151729 () Bool)

(assert (=> d!39303 m!151729))

(declare-fun m!151731 () Bool)

(assert (=> b!129231 m!151731))

(declare-fun m!151733 () Bool)

(assert (=> b!129232 m!151733))

(assert (=> b!128154 d!39303))

(assert (=> b!128154 d!39115))

(declare-fun b!129235 () Bool)

(declare-fun res!62340 () Bool)

(declare-fun e!84325 () Bool)

(assert (=> b!129235 (=> (not res!62340) (not e!84325))))

(assert (=> b!129235 (= res!62340 (= (size!2496 (_2!1292 lt!66148)) (bvadd (_size!585 (_2!1292 lt!66148)) (bvsdiv (bvadd (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!129234 () Bool)

(declare-fun res!62342 () Bool)

(assert (=> b!129234 (=> (not res!62342) (not e!84325))))

(assert (=> b!129234 (= res!62342 (bvsge (size!2496 (_2!1292 lt!66148)) (_size!585 (_2!1292 lt!66148))))))

(declare-fun b!129236 () Bool)

(assert (=> b!129236 (= e!84325 (and (bvsge (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 (_2!1292 lt!66148)) #b00000000000000000000000000000011) (bvsge (_vacant!585 (_2!1292 lt!66148)) #b00000000000000000000000000000000)))))

(declare-fun b!129233 () Bool)

(declare-fun res!62341 () Bool)

(assert (=> b!129233 (=> (not res!62341) (not e!84325))))

(assert (=> b!129233 (= res!62341 (and (= (size!2491 (_values!2787 (_2!1292 lt!66148))) (bvadd (mask!7071 (_2!1292 lt!66148)) #b00000000000000000000000000000001)) (= (size!2490 (_keys!4540 (_2!1292 lt!66148))) (size!2491 (_values!2787 (_2!1292 lt!66148)))) (bvsge (_size!585 (_2!1292 lt!66148)) #b00000000000000000000000000000000) (bvsle (_size!585 (_2!1292 lt!66148)) (bvadd (mask!7071 (_2!1292 lt!66148)) #b00000000000000000000000000000001))))))

(declare-fun d!39305 () Bool)

(declare-fun res!62339 () Bool)

(assert (=> d!39305 (=> (not res!62339) (not e!84325))))

(assert (=> d!39305 (= res!62339 (validMask!0 (mask!7071 (_2!1292 lt!66148))))))

(assert (=> d!39305 (= (simpleValid!88 (_2!1292 lt!66148)) e!84325)))

(assert (= (and d!39305 res!62339) b!129233))

(assert (= (and b!129233 res!62341) b!129234))

(assert (= (and b!129234 res!62342) b!129235))

(assert (= (and b!129235 res!62340) b!129236))

(declare-fun m!151735 () Bool)

(assert (=> b!129235 m!151735))

(assert (=> b!129234 m!151735))

(assert (=> d!39305 m!150833))

(assert (=> d!38713 d!39305))

(assert (=> b!128100 d!38879))

(declare-fun lt!66984 () Bool)

(declare-fun d!39307 () Bool)

(assert (=> d!39307 (= lt!66984 (select (content!127 (toList!844 lt!66444)) (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84326 () Bool)

(assert (=> d!39307 (= lt!66984 e!84326)))

(declare-fun res!62343 () Bool)

(assert (=> d!39307 (=> (not res!62343) (not e!84326))))

(assert (=> d!39307 (= res!62343 ((_ is Cons!1694) (toList!844 lt!66444)))))

(assert (=> d!39307 (= (contains!874 (toList!844 lt!66444) (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66984)))

(declare-fun b!129237 () Bool)

(declare-fun e!84327 () Bool)

(assert (=> b!129237 (= e!84326 e!84327)))

(declare-fun res!62344 () Bool)

(assert (=> b!129237 (=> res!62344 e!84327)))

(assert (=> b!129237 (= res!62344 (= (h!2297 (toList!844 lt!66444)) (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129238 () Bool)

(assert (=> b!129238 (= e!84327 (contains!874 (t!6068 (toList!844 lt!66444)) (ite c!23467 (ite c!23472 (tuple2!2561 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2561 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2561 (select (arr!2224 (_keys!4540 (v!3138 (underlying!440 thiss!992)))) from!355) (get!1453 (select (arr!2225 (_values!2787 (v!3138 (underlying!440 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39307 res!62343) b!129237))

(assert (= (and b!129237 (not res!62344)) b!129238))

(declare-fun m!151737 () Bool)

(assert (=> d!39307 m!151737))

(declare-fun m!151739 () Bool)

(assert (=> d!39307 m!151739))

(declare-fun m!151741 () Bool)

(assert (=> b!129238 m!151741))

(assert (=> b!128374 d!39307))

(declare-fun condMapEmpty!4557 () Bool)

(declare-fun mapDefault!4557 () ValueCell!1082)

(assert (=> mapNonEmpty!4555 (= condMapEmpty!4557 (= mapRest!4555 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4557)))))

(declare-fun e!84328 () Bool)

(declare-fun mapRes!4557 () Bool)

(assert (=> mapNonEmpty!4555 (= tp!11053 (and e!84328 mapRes!4557))))

(declare-fun b!129240 () Bool)

(assert (=> b!129240 (= e!84328 tp_is_empty!2851)))

(declare-fun b!129239 () Bool)

(declare-fun e!84329 () Bool)

(assert (=> b!129239 (= e!84329 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4557 () Bool)

(assert (=> mapIsEmpty!4557 mapRes!4557))

(declare-fun mapNonEmpty!4557 () Bool)

(declare-fun tp!11055 () Bool)

(assert (=> mapNonEmpty!4557 (= mapRes!4557 (and tp!11055 e!84329))))

(declare-fun mapKey!4557 () (_ BitVec 32))

(declare-fun mapValue!4557 () ValueCell!1082)

(declare-fun mapRest!4557 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4557 (= mapRest!4555 (store mapRest!4557 mapKey!4557 mapValue!4557))))

(assert (= (and mapNonEmpty!4555 condMapEmpty!4557) mapIsEmpty!4557))

(assert (= (and mapNonEmpty!4555 (not condMapEmpty!4557)) mapNonEmpty!4557))

(assert (= (and mapNonEmpty!4557 ((_ is ValueCellFull!1082) mapValue!4557)) b!129239))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1082) mapDefault!4557)) b!129240))

(declare-fun m!151743 () Bool)

(assert (=> mapNonEmpty!4557 m!151743))

(declare-fun condMapEmpty!4558 () Bool)

(declare-fun mapDefault!4558 () ValueCell!1082)

(assert (=> mapNonEmpty!4556 (= condMapEmpty!4558 (= mapRest!4556 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4558)))))

(declare-fun e!84330 () Bool)

(declare-fun mapRes!4558 () Bool)

(assert (=> mapNonEmpty!4556 (= tp!11054 (and e!84330 mapRes!4558))))

(declare-fun b!129242 () Bool)

(assert (=> b!129242 (= e!84330 tp_is_empty!2851)))

(declare-fun b!129241 () Bool)

(declare-fun e!84331 () Bool)

(assert (=> b!129241 (= e!84331 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4558 () Bool)

(assert (=> mapIsEmpty!4558 mapRes!4558))

(declare-fun mapNonEmpty!4558 () Bool)

(declare-fun tp!11056 () Bool)

(assert (=> mapNonEmpty!4558 (= mapRes!4558 (and tp!11056 e!84331))))

(declare-fun mapRest!4558 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapKey!4558 () (_ BitVec 32))

(declare-fun mapValue!4558 () ValueCell!1082)

(assert (=> mapNonEmpty!4558 (= mapRest!4556 (store mapRest!4558 mapKey!4558 mapValue!4558))))

(assert (= (and mapNonEmpty!4556 condMapEmpty!4558) mapIsEmpty!4558))

(assert (= (and mapNonEmpty!4556 (not condMapEmpty!4558)) mapNonEmpty!4558))

(assert (= (and mapNonEmpty!4558 ((_ is ValueCellFull!1082) mapValue!4558)) b!129241))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1082) mapDefault!4558)) b!129242))

(declare-fun m!151745 () Bool)

(assert (=> mapNonEmpty!4558 m!151745))

(declare-fun b_lambda!5703 () Bool)

(assert (= b_lambda!5687 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5703)))

(declare-fun b_lambda!5705 () Bool)

(assert (= b_lambda!5691 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5705)))

(declare-fun b_lambda!5707 () Bool)

(assert (= b_lambda!5673 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5707)))

(declare-fun b_lambda!5709 () Bool)

(assert (= b_lambda!5683 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5709)))

(declare-fun b_lambda!5711 () Bool)

(assert (= b_lambda!5681 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5711)))

(declare-fun b_lambda!5713 () Bool)

(assert (= b_lambda!5679 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5713)))

(declare-fun b_lambda!5715 () Bool)

(assert (= b_lambda!5695 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5715)))

(declare-fun b_lambda!5717 () Bool)

(assert (= b_lambda!5677 (or (and b!127723 b_free!2869) (and b!127731 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))))) b_lambda!5717)))

(declare-fun b_lambda!5719 () Bool)

(assert (= b_lambda!5701 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5719)))

(declare-fun b_lambda!5721 () Bool)

(assert (= b_lambda!5693 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5721)))

(declare-fun b_lambda!5723 () Bool)

(assert (= b_lambda!5675 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5723)))

(declare-fun b_lambda!5725 () Bool)

(assert (= b_lambda!5685 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5725)))

(declare-fun b_lambda!5727 () Bool)

(assert (= b_lambda!5699 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5727)))

(declare-fun b_lambda!5729 () Bool)

(assert (= b_lambda!5697 (or (and b!127723 b_free!2869 (= (defaultEntry!2804 (v!3138 (underlying!440 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127731 b_free!2871) b_lambda!5729)))

(check-sat (not b!128891) (not d!39301) (not d!39185) (not b!128613) (not d!38993) (not d!38989) (not b!128673) (not b!128762) (not b!128599) (not b!128405) (not b!128507) (not d!39205) (not d!39225) (not b!129069) (not b!128921) (not b!129235) (not d!39015) (not b!128965) (not d!39175) (not d!38995) (not d!39271) (not b_lambda!5667) (not bm!13891) (not bm!13917) (not d!39155) (not b!128722) (not b!128617) (not b!128733) (not bm!13963) (not b!128510) (not bm!13946) (not d!39259) (not d!38985) (not b!129021) (not b!128533) (not b!129169) (not b!128631) (not bm!13981) (not d!39049) (not b!129071) (not b!128495) (not b!128971) (not d!39065) (not d!39101) (not b!129117) (not b!129059) (not b!128716) (not b!128615) (not b!128966) (not b!128848) (not d!39299) (not b!128498) (not b!129113) (not b!129096) (not b!129036) (not b!128753) (not b!129173) (not d!38819) (not d!38939) (not d!38865) (not b!128409) (not d!38959) (not bm!13904) (not d!39229) (not b!128995) (not b!129132) (not d!39243) (not b!128806) (not b!128602) (not b_lambda!5707) (not d!38817) (not b!129139) (not d!39255) (not d!38933) (not b!128777) (not b!128950) (not b!128423) b_and!7975 (not d!38857) (not b!129171) (not d!39097) (not b!128428) (not b!128604) (not b!128714) (not mapNonEmpty!4557) (not d!38987) (not b!128961) (not b!128745) (not b!128623) (not d!38915) (not b!128699) (not d!39103) (not d!39145) (not b!129229) (not b!128433) (not b!128915) (not b!129102) (not b!129167) (not b!129107) (not b!128992) (not bm!13896) (not b!128515) (not d!39223) (not b_next!2871) (not b!129151) (not b!128554) (not b!128512) (not b!128953) (not b!128880) (not bm!13920) (not d!39003) (not d!39279) (not b!128851) (not d!38837) (not bm!13903) (not b!129122) (not b!129053) (not b_next!2869) (not d!39059) (not b!128686) (not b!128794) (not b!129183) (not b!129030) (not d!39031) (not b!128743) (not d!38899) (not b!129043) (not d!38983) (not b_lambda!5665) (not b!129093) (not b!128959) (not b!128616) (not b!128734) (not b!128644) (not b!129014) (not b_lambda!5723) (not b!129016) (not b!129112) (not d!38921) (not b_lambda!5651) (not b!128637) (not d!39297) (not bm!13888) (not b!128900) (not b!128446) (not d!38913) (not b!128411) (not d!39055) (not b!128986) (not bm!13960) (not d!39017) (not b!128475) (not b!128729) (not b!128587) (not b!128590) (not b!128668) (not b!129020) (not d!39095) (not d!38845) (not b!128544) (not b!128567) (not b!128726) (not bm!13958) (not b_lambda!5721) (not b!128632) (not d!39099) (not bm!13885) (not b!128999) (not b!129198) (not b!128542) (not b!128846) (not d!38957) (not d!38907) (not b!128756) (not d!39215) (not d!39123) (not b!128634) (not b!128620) (not b!129074) (not b!128730) (not b!128465) (not d!39267) (not d!38869) (not b!128473) (not d!39067) (not d!39111) (not b!128913) (not b!128514) (not b!129077) (not b!129088) (not b!128899) (not b!129062) (not d!39039) (not d!39021) (not b!128968) (not b!128767) (not b!129150) (not d!38999) (not b!129076) (not d!38997) (not b!128879) (not b!128903) (not d!39281) (not b!129090) (not b!129032) (not d!39307) (not b!128757) (not b!128486) (not d!39167) (not d!39199) (not b!129110) (not b!128905) (not b!128977) (not b!128791) (not d!39233) (not bm!13961) (not b!129033) (not b!129129) (not b!128874) (not b!129207) (not b!128765) (not d!39231) (not b!128481) (not b!129232) (not d!39295) (not d!39217) (not d!39147) (not d!38823) (not d!38841) tp_is_empty!2851 (not bm!13893) (not b!128795) (not bm!13925) (not b!128609) (not b!128559) (not b!128974) (not b!129131) (not b!128709) (not b!129116) (not b!128812) (not b!128873) (not b!128489) (not b!128547) (not d!39043) (not b!128549) (not bm!13902) (not b!128735) (not d!39029) (not b!128912) (not d!38927) (not d!39121) (not b!128813) (not b!129186) (not bm!13943) (not bm!13951) (not d!39129) (not d!39041) (not d!38901) (not b!128768) (not b!128607) (not b!128443) (not b!128787) (not b!128570) (not b!128775) (not b!128429) (not b!129026) (not b!129165) (not b!128681) (not d!39027) (not b!128571) (not b!128528) (not b!129220) (not d!39275) (not b!128449) (not d!39285) (not d!39033) (not d!38861) (not d!39235) (not b!129136) (not d!38967) (not b!128718) (not d!39219) (not b!129191) (not b!128951) (not b!128989) (not d!39221) (not b!128551) (not b!128410) (not b!129100) (not b!128540) (not d!39303) (not d!39287) (not b!128954) (not d!39081) (not b!128556) (not b!129238) (not d!38839) (not b!128793) (not b!128407) (not b!129097) (not b!128808) (not d!39293) (not bm!13884) (not bm!13949) (not d!38991) (not b!128430) (not b!129124) (not mapNonEmpty!4558) (not d!38831) (not b!128418) (not b!129009) (not d!38877) (not b!128991) (not b!129095) (not b!129170) (not b!129007) (not b!128688) (not d!39227) (not d!39183) (not b!128818) (not d!38981) (not bm!13894) (not b!128711) (not b!128415) (not b!128964) (not b!128479) (not d!39187) (not b_lambda!5709) (not d!38815) (not d!38851) (not b!129045) (not b_lambda!5705) (not b!129068) (not d!38893) (not b!129061) (not b!128737) (not b!128458) (not d!39197) (not b!129225) (not b!129057) (not b!128983) (not b!129217) (not bm!13918) (not b!128463) (not b!128882) (not b!128483) (not b!128683) (not b!128740) (not b!128960) (not d!39117) (not d!39209) (not d!39115) (not bm!13953) (not bm!13976) (not d!39071) (not bm!13892) (not b!128576) (not b!129172) (not b!128630) (not b!128752) (not b!129104) (not d!39201) (not d!38843) (not b!128957) (not b!128796) (not bm!13939) (not b!128916) (not b!129134) (not d!38961) (not d!38867) (not b!128564) (not bm!13899) (not d!39253) (not b!128627) (not b!128772) (not d!39037) (not d!39291) (not b!128619) (not d!39249) (not b!128844) (not bm!13906) (not b!129222) (not b!128809) (not b!128585) (not b!129156) (not b!128470) (not b!128536) (not b!129174) (not d!39151) (not d!38943) (not b!128731) (not d!39157) (not b!128629) (not d!39069) (not d!38813) (not b!129158) (not b!129003) (not d!39305) (not b!129202) (not d!39193) (not bm!13984) (not d!38955) (not d!39007) (not b!129163) (not bm!13905) (not b!128519) (not b!128889) (not b!129125) (not bm!13947) (not b!128776) (not b!129188) (not b!129011) (not b!129219) (not d!39177) (not d!38827) (not d!39181) (not bm!13972) (not d!38903) (not b!128412) (not b_lambda!5715) (not b!129208) (not b!128691) (not b!128877) (not b!128461) (not d!38887) (not b!128973) (not b!129223) (not b!129060) (not bm!13936) (not b!128738) (not d!38947) (not b!128434) (not b!129127) (not b!128907) (not b!128885) (not b!128923) (not d!38945) (not d!39237) (not d!38925) (not d!39005) (not d!39211) (not b!128978) (not bm!13982) (not b!128801) (not bm!13937) (not d!39261) (not d!39077) (not d!39113) (not d!39089) (not b!129005) (not d!39149) (not d!39289) (not b!128914) (not b!128884) (not bm!13969) (not bm!13927) (not d!39277) (not b!128596) (not b!128579) (not d!38965) (not b!128464) (not b!129234) (not b!128890) (not b!128543) (not bm!13890) (not b!129008) (not b!128565) b_and!7973 (not d!39273) (not bm!13975) (not bm!13979) (not b!128721) (not b!128522) (not d!39161) (not d!39093) (not b!128477) (not bm!13930) (not b!128853) (not b!129066) (not b!128779) (not b!128466) (not b!128803) (not b!128420) (not d!39207) (not b!128506) (not bm!13928) (not b!129200) (not d!38871) (not b!128695) (not b!128583) (not b!129142) (not b!128727) (not b!129157) (not b_lambda!5717) (not d!39057) (not b!128997) (not d!39245) (not d!39051) (not b!128769) (not b!128867) (not b!128720) (not d!39001) (not b!128680) (not bm!13922) (not d!39213) (not d!39035) (not b!129159) (not b!128800) (not b!128606) (not b!128750) (not d!39105) (not b_lambda!5725) (not b_lambda!5727) (not b!128710) (not d!39283) (not b!128908) (not b!128625) (not d!39091) (not bm!13974) (not b_lambda!5647) (not b!128717) (not b_lambda!5669) (not b!128747) (not d!39025) (not b_lambda!5663) (not b!129054) (not b!128431) (not b!129091) (not b!128513) (not b_lambda!5713) (not bm!13940) (not d!39045) (not b!128773) (not b!129140) (not b!128444) (not b!128707) (not b!129189) (not b!128643) (not d!38847) (not b!128703) (not b!128770) (not b!129103) (not d!39013) (not b_lambda!5703) (not d!39073) (not b!128569) (not bm!13895) (not b!129105) (not b!129227) (not b_lambda!5671) (not b!128425) (not d!38889) (not bm!13938) (not b!128876) (not bm!13945) (not bm!13965) (not b!129226) (not d!39109) (not b!128574) (not d!38825) (not bm!13901) (not b!128539) (not d!38973) (not b!128725) (not b!129017) (not b!129211) (not bm!13916) (not b!128963) (not b_lambda!5719) (not b!129195) (not d!39173) (not b!129081) (not b!129080) (not bm!13914) (not b!128906) (not b!128667) (not b!129086) (not b!128531) (not d!39257) (not d!38951) (not bm!13967) (not d!39009) (not bm!13955) (not b!128457) (not b!128538) (not b!128426) (not b!129212) (not b!128887) (not b_lambda!5689) (not b_lambda!5729) (not b!129182) (not d!39053) (not b!129128) (not b!129126) (not b!129205) (not b!129190) (not b!129231) (not d!38949) (not d!39079) (not b!128788) (not b!129154) (not d!39011) (not b!128626) (not b_lambda!5711))
(check-sat b_and!7973 b_and!7975 (not b_next!2869) (not b_next!2871))
