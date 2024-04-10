; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8386 () Bool)

(assert start!8386)

(declare-fun b!56722 () Bool)

(declare-fun b_free!1937 () Bool)

(declare-fun b_next!1937 () Bool)

(assert (=> b!56722 (= b_free!1937 (not b_next!1937))))

(declare-fun tp!7914 () Bool)

(declare-fun b_and!3415 () Bool)

(assert (=> b!56722 (= tp!7914 b_and!3415)))

(declare-fun b!56736 () Bool)

(declare-fun b_free!1939 () Bool)

(declare-fun b_next!1939 () Bool)

(assert (=> b!56736 (= b_free!1939 (not b_next!1939))))

(declare-fun tp!7913 () Bool)

(declare-fun b_and!3417 () Bool)

(assert (=> b!56736 (= tp!7913 b_and!3417)))

(declare-fun b!56720 () Bool)

(declare-fun e!37389 () Bool)

(declare-fun tp_is_empty!2385 () Bool)

(assert (=> b!56720 (= e!37389 tp_is_empty!2385)))

(declare-fun b!56721 () Bool)

(declare-datatypes ((Unit!1475 0))(
  ( (Unit!1476) )
))
(declare-fun e!37384 () Unit!1475)

(declare-fun Unit!1477 () Unit!1475)

(assert (=> b!56721 (= e!37384 Unit!1477)))

(declare-fun lt!22361 () Unit!1475)

(declare-datatypes ((V!2827 0))(
  ( (V!2828 (val!1237 Int)) )
))
(declare-datatypes ((array!3693 0))(
  ( (array!3694 (arr!1769 (Array (_ BitVec 32) (_ BitVec 64))) (size!1998 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!849 0))(
  ( (ValueCellFull!849 (v!2359 V!2827)) (EmptyCell!849) )
))
(declare-datatypes ((array!3695 0))(
  ( (array!3696 (arr!1770 (Array (_ BitVec 32) ValueCell!849)) (size!1999 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!606 0))(
  ( (LongMapFixedSize!607 (defaultEntry!2017 Int) (mask!5888 (_ BitVec 32)) (extraKeys!1908 (_ BitVec 32)) (zeroValue!1935 V!2827) (minValue!1935 V!2827) (_size!352 (_ BitVec 32)) (_keys!3637 array!3693) (_values!2000 array!3695) (_vacant!352 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!420 0))(
  ( (Cell!421 (v!2360 LongMapFixedSize!606)) )
))
(declare-datatypes ((LongMap!420 0))(
  ( (LongMap!421 (underlying!221 Cell!420)) )
))
(declare-fun thiss!992 () LongMap!420)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!26 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 64) (_ BitVec 32) Int) Unit!1475)

(assert (=> b!56721 (= lt!22361 (lemmaListMapContainsThenArrayContainsFrom!26 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56721 (arrayContainsKey!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22360 () Unit!1475)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3693 (_ BitVec 32) (_ BitVec 32)) Unit!1475)

(assert (=> b!56721 (= lt!22360 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1422 0))(
  ( (Nil!1419) (Cons!1418 (h!1998 (_ BitVec 64)) (t!4728 List!1422)) )
))
(declare-fun arrayNoDuplicates!0 (array!3693 (_ BitVec 32) List!1422) Bool)

(assert (=> b!56721 (arrayNoDuplicates!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) from!355 Nil!1419)))

(declare-fun lt!22362 () Unit!1475)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3693 (_ BitVec 32) (_ BitVec 64) List!1422) Unit!1475)

(assert (=> b!56721 (= lt!22362 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (Cons!1418 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) Nil!1419)))))

(assert (=> b!56721 false))

(declare-fun e!37376 () Bool)

(declare-fun e!37382 () Bool)

(declare-fun array_inv!1095 (array!3693) Bool)

(declare-fun array_inv!1096 (array!3695) Bool)

(assert (=> b!56722 (= e!37376 (and tp!7914 tp_is_empty!2385 (array_inv!1095 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (array_inv!1096 (_values!2000 (v!2360 (underlying!221 thiss!992)))) e!37382))))

(declare-fun b!56723 () Bool)

(declare-fun e!37380 () Bool)

(declare-fun e!37391 () Bool)

(assert (=> b!56723 (= e!37380 e!37391)))

(declare-fun res!31861 () Bool)

(assert (=> b!56723 (=> (not res!31861) (not e!37391))))

(declare-datatypes ((tuple2!2006 0))(
  ( (tuple2!2007 (_1!1014 Bool) (_2!1014 LongMapFixedSize!606)) )
))
(declare-fun lt!22356 () tuple2!2006)

(assert (=> b!56723 (= res!31861 (and (_1!1014 lt!22356) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!22358 () Unit!1475)

(assert (=> b!56723 (= lt!22358 e!37384)))

(declare-fun c!6958 () Bool)

(declare-datatypes ((tuple2!2008 0))(
  ( (tuple2!2009 (_1!1015 (_ BitVec 64)) (_2!1015 V!2827)) )
))
(declare-datatypes ((List!1423 0))(
  ( (Nil!1420) (Cons!1419 (h!1999 tuple2!2008) (t!4729 List!1423)) )
))
(declare-datatypes ((ListLongMap!1355 0))(
  ( (ListLongMap!1356 (toList!693 List!1423)) )
))
(declare-fun lt!22359 () ListLongMap!1355)

(declare-fun contains!676 (ListLongMap!1355 (_ BitVec 64)) Bool)

(assert (=> b!56723 (= c!6958 (contains!676 lt!22359 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!606)

(declare-fun update!70 (LongMapFixedSize!606 (_ BitVec 64) V!2827) tuple2!2006)

(declare-fun get!1054 (ValueCell!849 V!2827) V!2827)

(declare-fun dynLambda!301 (Int (_ BitVec 64)) V!2827)

(assert (=> b!56723 (= lt!22356 (update!70 newMap!16 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!56724 () Bool)

(declare-fun res!31860 () Bool)

(declare-fun e!37383 () Bool)

(assert (=> b!56724 (=> (not res!31860) (not e!37383))))

(assert (=> b!56724 (= res!31860 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992)))))))))

(declare-fun b!56725 () Bool)

(declare-fun e!37378 () Bool)

(assert (=> b!56725 (= e!37378 tp_is_empty!2385)))

(declare-fun b!56726 () Bool)

(declare-fun res!31859 () Bool)

(assert (=> b!56726 (=> (not res!31859) (not e!37383))))

(assert (=> b!56726 (= res!31859 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5888 newMap!16)) (_size!352 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun b!56727 () Bool)

(declare-fun e!37379 () Bool)

(assert (=> b!56727 (= e!37379 e!37376)))

(declare-fun mapNonEmpty!2825 () Bool)

(declare-fun mapRes!2826 () Bool)

(declare-fun tp!7912 () Bool)

(declare-fun e!37381 () Bool)

(assert (=> mapNonEmpty!2825 (= mapRes!2826 (and tp!7912 e!37381))))

(declare-fun mapValue!2825 () ValueCell!849)

(declare-fun mapRest!2826 () (Array (_ BitVec 32) ValueCell!849))

(declare-fun mapKey!2825 () (_ BitVec 32))

(assert (=> mapNonEmpty!2825 (= (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) (store mapRest!2826 mapKey!2825 mapValue!2825))))

(declare-fun b!56728 () Bool)

(declare-fun e!37385 () Bool)

(assert (=> b!56728 (= e!37385 tp_is_empty!2385)))

(declare-fun b!56729 () Bool)

(declare-fun e!37388 () Bool)

(declare-fun mapRes!2825 () Bool)

(assert (=> b!56729 (= e!37388 (and e!37385 mapRes!2825))))

(declare-fun condMapEmpty!2825 () Bool)

(declare-fun mapDefault!2825 () ValueCell!849)

(assert (=> b!56729 (= condMapEmpty!2825 (= (arr!1770 (_values!2000 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!849)) mapDefault!2825)))))

(declare-fun mapNonEmpty!2826 () Bool)

(declare-fun tp!7911 () Bool)

(assert (=> mapNonEmpty!2826 (= mapRes!2825 (and tp!7911 e!37378))))

(declare-fun mapRest!2825 () (Array (_ BitVec 32) ValueCell!849))

(declare-fun mapKey!2826 () (_ BitVec 32))

(declare-fun mapValue!2826 () ValueCell!849)

(assert (=> mapNonEmpty!2826 (= (arr!1770 (_values!2000 newMap!16)) (store mapRest!2825 mapKey!2826 mapValue!2826))))

(declare-fun b!56730 () Bool)

(assert (=> b!56730 (= e!37383 e!37380)))

(declare-fun res!31858 () Bool)

(assert (=> b!56730 (=> (not res!31858) (not e!37380))))

(declare-fun lt!22357 () ListLongMap!1355)

(assert (=> b!56730 (= res!31858 (and (= lt!22357 lt!22359) (not (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1098 (LongMapFixedSize!606) ListLongMap!1355)

(assert (=> b!56730 (= lt!22359 (map!1098 newMap!16))))

(declare-fun getCurrentListMap!399 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 32) Int) ListLongMap!1355)

(assert (=> b!56730 (= lt!22357 (getCurrentListMap!399 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun b!56731 () Bool)

(declare-fun res!31862 () Bool)

(assert (=> b!56731 (=> (not res!31862) (not e!37383))))

(declare-fun valid!247 (LongMapFixedSize!606) Bool)

(assert (=> b!56731 (= res!31862 (valid!247 newMap!16))))

(declare-fun b!56732 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!56732 (= e!37391 (not (validMask!0 (mask!5888 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun b!56733 () Bool)

(assert (=> b!56733 (= e!37382 (and e!37389 mapRes!2826))))

(declare-fun condMapEmpty!2826 () Bool)

(declare-fun mapDefault!2826 () ValueCell!849)

(assert (=> b!56733 (= condMapEmpty!2826 (= (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!849)) mapDefault!2826)))))

(declare-fun res!31857 () Bool)

(assert (=> start!8386 (=> (not res!31857) (not e!37383))))

(declare-fun valid!248 (LongMap!420) Bool)

(assert (=> start!8386 (= res!31857 (valid!248 thiss!992))))

(assert (=> start!8386 e!37383))

(declare-fun e!37390 () Bool)

(assert (=> start!8386 e!37390))

(assert (=> start!8386 true))

(declare-fun e!37377 () Bool)

(assert (=> start!8386 e!37377))

(declare-fun mapIsEmpty!2825 () Bool)

(assert (=> mapIsEmpty!2825 mapRes!2825))

(declare-fun mapIsEmpty!2826 () Bool)

(assert (=> mapIsEmpty!2826 mapRes!2826))

(declare-fun b!56734 () Bool)

(assert (=> b!56734 (= e!37390 e!37379)))

(declare-fun b!56735 () Bool)

(declare-fun Unit!1478 () Unit!1475)

(assert (=> b!56735 (= e!37384 Unit!1478)))

(assert (=> b!56736 (= e!37377 (and tp!7913 tp_is_empty!2385 (array_inv!1095 (_keys!3637 newMap!16)) (array_inv!1096 (_values!2000 newMap!16)) e!37388))))

(declare-fun b!56737 () Bool)

(assert (=> b!56737 (= e!37381 tp_is_empty!2385)))

(assert (= (and start!8386 res!31857) b!56724))

(assert (= (and b!56724 res!31860) b!56731))

(assert (= (and b!56731 res!31862) b!56726))

(assert (= (and b!56726 res!31859) b!56730))

(assert (= (and b!56730 res!31858) b!56723))

(assert (= (and b!56723 c!6958) b!56721))

(assert (= (and b!56723 (not c!6958)) b!56735))

(assert (= (and b!56723 res!31861) b!56732))

(assert (= (and b!56733 condMapEmpty!2826) mapIsEmpty!2826))

(assert (= (and b!56733 (not condMapEmpty!2826)) mapNonEmpty!2825))

(get-info :version)

(assert (= (and mapNonEmpty!2825 ((_ is ValueCellFull!849) mapValue!2825)) b!56737))

(assert (= (and b!56733 ((_ is ValueCellFull!849) mapDefault!2826)) b!56720))

(assert (= b!56722 b!56733))

(assert (= b!56727 b!56722))

(assert (= b!56734 b!56727))

(assert (= start!8386 b!56734))

(assert (= (and b!56729 condMapEmpty!2825) mapIsEmpty!2825))

(assert (= (and b!56729 (not condMapEmpty!2825)) mapNonEmpty!2826))

(assert (= (and mapNonEmpty!2826 ((_ is ValueCellFull!849) mapValue!2826)) b!56725))

(assert (= (and b!56729 ((_ is ValueCellFull!849) mapDefault!2825)) b!56728))

(assert (= b!56736 b!56729))

(assert (= start!8386 b!56736))

(declare-fun b_lambda!2479 () Bool)

(assert (=> (not b_lambda!2479) (not b!56723)))

(declare-fun t!4725 () Bool)

(declare-fun tb!1281 () Bool)

(assert (=> (and b!56722 (= (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))) t!4725) tb!1281))

(declare-fun result!2319 () Bool)

(assert (=> tb!1281 (= result!2319 tp_is_empty!2385)))

(assert (=> b!56723 t!4725))

(declare-fun b_and!3419 () Bool)

(assert (= b_and!3415 (and (=> t!4725 result!2319) b_and!3419)))

(declare-fun tb!1283 () Bool)

(declare-fun t!4727 () Bool)

(assert (=> (and b!56736 (= (defaultEntry!2017 newMap!16) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))) t!4727) tb!1283))

(declare-fun result!2323 () Bool)

(assert (= result!2323 result!2319))

(assert (=> b!56723 t!4727))

(declare-fun b_and!3421 () Bool)

(assert (= b_and!3417 (and (=> t!4727 result!2323) b_and!3421)))

(declare-fun m!47749 () Bool)

(assert (=> b!56723 m!47749))

(declare-fun m!47751 () Bool)

(assert (=> b!56723 m!47751))

(declare-fun m!47753 () Bool)

(assert (=> b!56723 m!47753))

(declare-fun m!47755 () Bool)

(assert (=> b!56723 m!47755))

(assert (=> b!56723 m!47751))

(assert (=> b!56723 m!47755))

(declare-fun m!47757 () Bool)

(assert (=> b!56723 m!47757))

(assert (=> b!56723 m!47755))

(assert (=> b!56723 m!47753))

(declare-fun m!47759 () Bool)

(assert (=> b!56723 m!47759))

(assert (=> b!56723 m!47749))

(declare-fun m!47761 () Bool)

(assert (=> b!56721 m!47761))

(declare-fun m!47763 () Bool)

(assert (=> b!56721 m!47763))

(assert (=> b!56721 m!47755))

(declare-fun m!47765 () Bool)

(assert (=> b!56721 m!47765))

(assert (=> b!56721 m!47755))

(assert (=> b!56721 m!47755))

(declare-fun m!47767 () Bool)

(assert (=> b!56721 m!47767))

(assert (=> b!56721 m!47755))

(declare-fun m!47769 () Bool)

(assert (=> b!56721 m!47769))

(declare-fun m!47771 () Bool)

(assert (=> b!56736 m!47771))

(declare-fun m!47773 () Bool)

(assert (=> b!56736 m!47773))

(declare-fun m!47775 () Bool)

(assert (=> start!8386 m!47775))

(declare-fun m!47777 () Bool)

(assert (=> b!56722 m!47777))

(declare-fun m!47779 () Bool)

(assert (=> b!56722 m!47779))

(declare-fun m!47781 () Bool)

(assert (=> b!56732 m!47781))

(declare-fun m!47783 () Bool)

(assert (=> mapNonEmpty!2825 m!47783))

(declare-fun m!47785 () Bool)

(assert (=> mapNonEmpty!2826 m!47785))

(assert (=> b!56730 m!47755))

(declare-fun m!47787 () Bool)

(assert (=> b!56730 m!47787))

(declare-fun m!47789 () Bool)

(assert (=> b!56730 m!47789))

(declare-fun m!47791 () Bool)

(assert (=> b!56731 m!47791))

(check-sat (not b!56730) (not b!56721) (not b_next!1937) (not b!56722) (not b!56732) (not b!56736) (not start!8386) (not mapNonEmpty!2825) b_and!3419 (not b_lambda!2479) b_and!3421 (not b!56731) tp_is_empty!2385 (not mapNonEmpty!2826) (not b!56723) (not b_next!1939))
(check-sat b_and!3419 b_and!3421 (not b_next!1937) (not b_next!1939))
(get-model)

(declare-fun b_lambda!2483 () Bool)

(assert (= b_lambda!2479 (or (and b!56722 b_free!1937) (and b!56736 b_free!1939 (= (defaultEntry!2017 newMap!16) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))))) b_lambda!2483)))

(check-sat (not b!56730) (not b!56721) (not b_next!1937) (not b!56722) (not b!56732) (not b!56736) (not start!8386) (not mapNonEmpty!2825) b_and!3421 (not b!56731) tp_is_empty!2385 (not mapNonEmpty!2826) (not b_lambda!2483) b_and!3419 (not b!56723) (not b_next!1939))
(check-sat b_and!3419 b_and!3421 (not b_next!1937) (not b_next!1939))
(get-model)

(declare-fun d!10493 () Bool)

(declare-fun e!37445 () Bool)

(assert (=> d!10493 e!37445))

(declare-fun res!31883 () Bool)

(assert (=> d!10493 (=> res!31883 e!37445)))

(declare-fun lt!22395 () Bool)

(assert (=> d!10493 (= res!31883 (not lt!22395))))

(declare-fun lt!22392 () Bool)

(assert (=> d!10493 (= lt!22395 lt!22392)))

(declare-fun lt!22393 () Unit!1475)

(declare-fun e!37444 () Unit!1475)

(assert (=> d!10493 (= lt!22393 e!37444)))

(declare-fun c!6964 () Bool)

(assert (=> d!10493 (= c!6964 lt!22392)))

(declare-fun containsKey!126 (List!1423 (_ BitVec 64)) Bool)

(assert (=> d!10493 (= lt!22392 (containsKey!126 (toList!693 lt!22359) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(assert (=> d!10493 (= (contains!676 lt!22359 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)) lt!22395)))

(declare-fun b!56802 () Bool)

(declare-fun lt!22394 () Unit!1475)

(assert (=> b!56802 (= e!37444 lt!22394)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!74 (List!1423 (_ BitVec 64)) Unit!1475)

(assert (=> b!56802 (= lt!22394 (lemmaContainsKeyImpliesGetValueByKeyDefined!74 (toList!693 lt!22359) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-datatypes ((Option!128 0))(
  ( (Some!127 (v!2364 V!2827)) (None!126) )
))
(declare-fun isDefined!75 (Option!128) Bool)

(declare-fun getValueByKey!122 (List!1423 (_ BitVec 64)) Option!128)

(assert (=> b!56802 (isDefined!75 (getValueByKey!122 (toList!693 lt!22359) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun b!56803 () Bool)

(declare-fun Unit!1483 () Unit!1475)

(assert (=> b!56803 (= e!37444 Unit!1483)))

(declare-fun b!56804 () Bool)

(assert (=> b!56804 (= e!37445 (isDefined!75 (getValueByKey!122 (toList!693 lt!22359) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355))))))

(assert (= (and d!10493 c!6964) b!56802))

(assert (= (and d!10493 (not c!6964)) b!56803))

(assert (= (and d!10493 (not res!31883)) b!56804))

(assert (=> d!10493 m!47755))

(declare-fun m!47837 () Bool)

(assert (=> d!10493 m!47837))

(assert (=> b!56802 m!47755))

(declare-fun m!47839 () Bool)

(assert (=> b!56802 m!47839))

(assert (=> b!56802 m!47755))

(declare-fun m!47841 () Bool)

(assert (=> b!56802 m!47841))

(assert (=> b!56802 m!47841))

(declare-fun m!47843 () Bool)

(assert (=> b!56802 m!47843))

(assert (=> b!56804 m!47755))

(assert (=> b!56804 m!47841))

(assert (=> b!56804 m!47841))

(assert (=> b!56804 m!47843))

(assert (=> b!56723 d!10493))

(declare-fun b!56889 () Bool)

(declare-fun e!37490 () ListLongMap!1355)

(assert (=> b!56889 (= e!37490 (getCurrentListMap!399 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2017 newMap!16)))))

(declare-fun e!37505 () Bool)

(declare-fun b!56890 () Bool)

(declare-datatypes ((SeekEntryResult!225 0))(
  ( (MissingZero!225 (index!3022 (_ BitVec 32))) (Found!225 (index!3023 (_ BitVec 32))) (Intermediate!225 (undefined!1037 Bool) (index!3024 (_ BitVec 32)) (x!9817 (_ BitVec 32))) (Undefined!225) (MissingVacant!225 (index!3025 (_ BitVec 32))) )
))
(declare-fun lt!22451 () SeekEntryResult!225)

(assert (=> b!56890 (= e!37505 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3023 lt!22451)) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun b!56891 () Bool)

(declare-fun e!37507 () Bool)

(declare-fun e!37498 () Bool)

(assert (=> b!56891 (= e!37507 e!37498)))

(declare-fun res!31918 () Bool)

(declare-fun call!4020 () ListLongMap!1355)

(assert (=> b!56891 (= res!31918 (contains!676 call!4020 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(assert (=> b!56891 (=> (not res!31918) (not e!37498))))

(declare-fun b!56892 () Bool)

(declare-fun res!31919 () Bool)

(declare-fun e!37502 () Bool)

(assert (=> b!56892 (=> (not res!31919) (not e!37502))))

(declare-fun call!4027 () Bool)

(assert (=> b!56892 (= res!31919 call!4027)))

(declare-fun e!37510 () Bool)

(assert (=> b!56892 (= e!37510 e!37502)))

(declare-fun d!10495 () Bool)

(declare-fun e!37501 () Bool)

(assert (=> d!10495 e!37501))

(declare-fun res!31923 () Bool)

(assert (=> d!10495 (=> (not res!31923) (not e!37501))))

(declare-fun lt!22454 () tuple2!2006)

(assert (=> d!10495 (= res!31923 (valid!247 (_2!1014 lt!22454)))))

(declare-fun e!37508 () tuple2!2006)

(assert (=> d!10495 (= lt!22454 e!37508)))

(declare-fun c!7006 () Bool)

(assert (=> d!10495 (= c!7006 (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvneg (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355))))))

(assert (=> d!10495 (valid!247 newMap!16)))

(assert (=> d!10495 (= (update!70 newMap!16 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!22454)))

(declare-fun call!4032 () SeekEntryResult!225)

(declare-fun bm!4016 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3693 (_ BitVec 32)) SeekEntryResult!225)

(assert (=> bm!4016 (= call!4032 (seekEntryOrOpen!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (_keys!3637 newMap!16) (mask!5888 newMap!16)))))

(declare-fun lt!22474 () array!3695)

(declare-fun c!7004 () Bool)

(declare-fun call!4036 () ListLongMap!1355)

(declare-fun lt!22469 () (_ BitVec 32))

(declare-fun bm!4017 () Bool)

(assert (=> bm!4017 (= call!4036 (getCurrentListMap!399 (_keys!3637 newMap!16) (ite c!7006 (_values!2000 newMap!16) lt!22474) (mask!5888 newMap!16) (ite (and c!7006 c!7004) lt!22469 (extraKeys!1908 newMap!16)) (ite (and c!7006 c!7004) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!1935 newMap!16)) (minValue!1935 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2017 newMap!16)))))

(declare-fun b!56893 () Bool)

(declare-fun res!31922 () Bool)

(declare-fun call!4030 () Bool)

(assert (=> b!56893 (= res!31922 call!4030)))

(assert (=> b!56893 (=> (not res!31922) (not e!37505))))

(declare-fun b!56894 () Bool)

(declare-fun e!37495 () ListLongMap!1355)

(assert (=> b!56894 (= e!37495 call!4036)))

(declare-fun b!56895 () Bool)

(declare-fun e!37503 () tuple2!2006)

(assert (=> b!56895 (= e!37508 e!37503)))

(declare-fun lt!22453 () SeekEntryResult!225)

(assert (=> b!56895 (= lt!22453 (seekEntryOrOpen!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (_keys!3637 newMap!16) (mask!5888 newMap!16)))))

(declare-fun c!7000 () Bool)

(assert (=> b!56895 (= c!7000 ((_ is Undefined!225) lt!22453))))

(declare-fun b!56896 () Bool)

(declare-fun e!37504 () Bool)

(declare-fun lt!22461 () SeekEntryResult!225)

(assert (=> b!56896 (= e!37504 ((_ is Undefined!225) lt!22461))))

(declare-fun b!56897 () Bool)

(declare-fun lt!22464 () Unit!1475)

(declare-fun e!37491 () Unit!1475)

(assert (=> b!56897 (= lt!22464 e!37491)))

(declare-fun c!6997 () Bool)

(declare-fun call!4040 () Bool)

(assert (=> b!56897 (= c!6997 call!4040)))

(assert (=> b!56897 (= e!37503 (tuple2!2007 false newMap!16))))

(declare-fun call!4029 () ListLongMap!1355)

(declare-fun call!4041 () ListLongMap!1355)

(declare-fun b!56898 () Bool)

(assert (=> b!56898 (= e!37490 (ite c!7004 call!4041 call!4029))))

(declare-fun b!56899 () Bool)

(declare-fun e!37492 () Bool)

(declare-fun lt!22455 () SeekEntryResult!225)

(assert (=> b!56899 (= e!37492 ((_ is Undefined!225) lt!22455))))

(declare-fun b!56900 () Bool)

(declare-fun lt!22456 () Unit!1475)

(declare-fun lt!22472 () Unit!1475)

(assert (=> b!56900 (= lt!22456 lt!22472)))

(declare-fun call!4024 () ListLongMap!1355)

(assert (=> b!56900 (= call!4024 call!4041)))

(declare-fun lt!22473 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 V!2827 Int) Unit!1475)

(assert (=> b!56900 (= lt!22472 (lemmaChangeLongMinValueKeyThenAddPairToListMap!13 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) lt!22473 (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2017 newMap!16)))))

(assert (=> b!56900 (= lt!22473 (bvor (extraKeys!1908 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!37494 () tuple2!2006)

(assert (=> b!56900 (= e!37494 (tuple2!2007 true (LongMapFixedSize!607 (defaultEntry!2017 newMap!16) (mask!5888 newMap!16) (bvor (extraKeys!1908 newMap!16) #b00000000000000000000000000000010) (zeroValue!1935 newMap!16) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!352 newMap!16) (_keys!3637 newMap!16) (_values!2000 newMap!16) (_vacant!352 newMap!16))))))

(declare-fun b!56901 () Bool)

(assert (=> b!56901 (= e!37508 e!37494)))

(assert (=> b!56901 (= c!7004 (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!4018 () Bool)

(declare-fun call!4042 () SeekEntryResult!225)

(assert (=> bm!4018 (= call!4042 call!4032)))

(declare-fun call!4019 () ListLongMap!1355)

(declare-fun bm!4019 () Bool)

(assert (=> bm!4019 (= call!4019 (getCurrentListMap!399 (_keys!3637 newMap!16) (ite (or c!7006 c!7000) (_values!2000 newMap!16) (array!3696 (store (arr!1770 (_values!2000 newMap!16)) (index!3023 lt!22453) (ValueCellFull!849 (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1999 (_values!2000 newMap!16)))) (mask!5888 newMap!16) (ite c!7006 (ite c!7004 (extraKeys!1908 newMap!16) lt!22473) (extraKeys!1908 newMap!16)) (zeroValue!1935 newMap!16) (ite c!7006 (ite c!7004 (minValue!1935 newMap!16) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!1935 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2017 newMap!16)))))

(declare-fun c!6993 () Bool)

(declare-fun c!6996 () Bool)

(declare-fun lt!22470 () SeekEntryResult!225)

(declare-fun call!4038 () Bool)

(declare-fun bm!4020 () Bool)

(declare-fun c!6994 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4020 (= call!4038 (inRange!0 (ite c!7000 (ite c!6997 (index!3023 lt!22470) (ite c!6993 (index!3022 lt!22455) (index!3025 lt!22455))) (ite c!6994 (index!3023 lt!22451) (ite c!6996 (index!3022 lt!22461) (index!3025 lt!22461)))) (mask!5888 newMap!16)))))

(declare-fun bm!4021 () Bool)

(assert (=> bm!4021 (= call!4029 call!4036)))

(declare-fun b!56902 () Bool)

(declare-fun res!31921 () Bool)

(declare-fun e!37500 () Bool)

(assert (=> b!56902 (=> (not res!31921) (not e!37500))))

(assert (=> b!56902 (= res!31921 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3022 lt!22461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56903 () Bool)

(declare-fun e!37509 () Bool)

(assert (=> b!56903 (= e!37492 e!37509)))

(declare-fun res!31925 () Bool)

(assert (=> b!56903 (= res!31925 call!4027)))

(assert (=> b!56903 (=> (not res!31925) (not e!37509))))

(declare-fun bm!4022 () Bool)

(declare-fun call!4034 () Bool)

(assert (=> bm!4022 (= call!4034 (arrayContainsKey!0 (_keys!3637 newMap!16) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!56904 () Bool)

(declare-fun c!7001 () Bool)

(assert (=> b!56904 (= c!7001 ((_ is MissingVacant!225) lt!22461))))

(declare-fun e!37506 () Bool)

(assert (=> b!56904 (= e!37506 e!37504)))

(declare-fun b!56905 () Bool)

(declare-fun res!31924 () Bool)

(assert (=> b!56905 (=> (not res!31924) (not e!37502))))

(assert (=> b!56905 (= res!31924 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3022 lt!22455)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!56906 () Bool)

(declare-fun e!37511 () Bool)

(declare-fun call!4031 () Bool)

(assert (=> b!56906 (= e!37511 (not call!4031))))

(declare-fun call!4025 () tuple2!2006)

(declare-fun bm!4023 () Bool)

(declare-fun c!7002 () Bool)

(declare-fun updateHelperNewKey!13 (LongMapFixedSize!606 (_ BitVec 64) V!2827 (_ BitVec 32)) tuple2!2006)

(assert (=> bm!4023 (= call!4025 (updateHelperNewKey!13 newMap!16 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!7002 (index!3025 lt!22453) (index!3022 lt!22453))))))

(declare-fun b!56907 () Bool)

(declare-fun e!37493 () tuple2!2006)

(declare-fun e!37497 () tuple2!2006)

(assert (=> b!56907 (= e!37493 e!37497)))

(declare-fun c!7003 () Bool)

(assert (=> b!56907 (= c!7003 ((_ is MissingZero!225) lt!22453))))

(declare-fun call!4037 () ListLongMap!1355)

(declare-fun bm!4024 () Bool)

(declare-fun +!79 (ListLongMap!1355 tuple2!2008) ListLongMap!1355)

(assert (=> bm!4024 (= call!4037 (+!79 e!37490 (ite c!7006 (ite c!7004 (tuple2!2009 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2009 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2009 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!6995 () Bool)

(assert (=> bm!4024 (= c!6995 c!7006)))

(declare-fun b!56908 () Bool)

(assert (=> b!56908 (= e!37501 e!37507)))

(declare-fun c!6999 () Bool)

(assert (=> b!56908 (= c!6999 (_1!1014 lt!22454))))

(declare-fun b!56909 () Bool)

(declare-fun call!4028 () ListLongMap!1355)

(assert (=> b!56909 (= e!37495 call!4028)))

(declare-fun b!56910 () Bool)

(declare-fun lt!22458 () Unit!1475)

(declare-fun lt!22452 () Unit!1475)

(assert (=> b!56910 (= lt!22458 lt!22452)))

(assert (=> b!56910 call!4040))

(declare-fun lemmaValidKeyInArrayIsInListMap!74 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 32) Int) Unit!1475)

(assert (=> b!56910 (= lt!22452 (lemmaValidKeyInArrayIsInListMap!74 (_keys!3637 newMap!16) lt!22474 (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (index!3023 lt!22453) (defaultEntry!2017 newMap!16)))))

(assert (=> b!56910 (= lt!22474 (array!3696 (store (arr!1770 (_values!2000 newMap!16)) (index!3023 lt!22453) (ValueCellFull!849 (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1999 (_values!2000 newMap!16))))))

(declare-fun lt!22465 () Unit!1475)

(declare-fun lt!22471 () Unit!1475)

(assert (=> b!56910 (= lt!22465 lt!22471)))

(assert (=> b!56910 (= call!4037 call!4028)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 32) (_ BitVec 64) V!2827 Int) Unit!1475)

(assert (=> b!56910 (= lt!22471 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!13 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (index!3023 lt!22453) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2017 newMap!16)))))

(declare-fun lt!22459 () Unit!1475)

(declare-fun e!37499 () Unit!1475)

(assert (=> b!56910 (= lt!22459 e!37499)))

(assert (=> b!56910 (= c!6994 (contains!676 (getCurrentListMap!399 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2017 newMap!16)) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(assert (=> b!56910 (= e!37497 (tuple2!2007 true (LongMapFixedSize!607 (defaultEntry!2017 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (_size!352 newMap!16) (_keys!3637 newMap!16) (array!3696 (store (arr!1770 (_values!2000 newMap!16)) (index!3023 lt!22453) (ValueCellFull!849 (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!1999 (_values!2000 newMap!16))) (_vacant!352 newMap!16))))))

(declare-fun b!56911 () Bool)

(declare-fun res!31920 () Bool)

(assert (=> b!56911 (=> (not res!31920) (not e!37500))))

(declare-fun call!4021 () Bool)

(assert (=> b!56911 (= res!31920 call!4021)))

(assert (=> b!56911 (= e!37506 e!37500)))

(declare-fun b!56912 () Bool)

(assert (=> b!56912 (= e!37500 (not call!4031))))

(declare-fun bm!4025 () Bool)

(declare-fun call!4035 () Bool)

(assert (=> bm!4025 (= call!4027 call!4035)))

(declare-fun bm!4026 () Bool)

(assert (=> bm!4026 (= call!4030 call!4038)))

(declare-fun b!56913 () Bool)

(declare-fun lt!22450 () Unit!1475)

(assert (=> b!56913 (= e!37491 lt!22450)))

(declare-fun call!4033 () Unit!1475)

(assert (=> b!56913 (= lt!22450 call!4033)))

(assert (=> b!56913 (= lt!22455 call!4042)))

(assert (=> b!56913 (= c!6993 ((_ is MissingZero!225) lt!22455))))

(assert (=> b!56913 e!37510))

(declare-fun bm!4027 () Bool)

(declare-fun call!4039 () SeekEntryResult!225)

(assert (=> bm!4027 (= call!4039 call!4032)))

(declare-fun bm!4028 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 64) Int) Unit!1475)

(assert (=> bm!4028 (= call!4033 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!13 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (defaultEntry!2017 newMap!16)))))

(declare-fun bm!4029 () Bool)

(assert (=> bm!4029 (= call!4021 call!4030)))

(declare-fun bm!4030 () Bool)

(declare-fun call!4026 () Bool)

(assert (=> bm!4030 (= call!4026 call!4034)))

(declare-fun bm!4031 () Bool)

(assert (=> bm!4031 (= call!4028 call!4019)))

(declare-fun b!56914 () Bool)

(assert (=> b!56914 (= e!37504 e!37511)))

(declare-fun res!31915 () Bool)

(assert (=> b!56914 (= res!31915 call!4021)))

(assert (=> b!56914 (=> (not res!31915) (not e!37511))))

(declare-fun bm!4032 () Bool)

(declare-fun call!4023 () Unit!1475)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 64) Int) Unit!1475)

(assert (=> bm!4032 (= call!4023 (lemmaInListMapThenSeekEntryOrOpenFindsIt!13 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (defaultEntry!2017 newMap!16)))))

(declare-fun b!56915 () Bool)

(declare-fun lt!22462 () tuple2!2006)

(assert (=> b!56915 (= lt!22462 call!4025)))

(assert (=> b!56915 (= e!37497 (tuple2!2007 (_1!1014 lt!22462) (_2!1014 lt!22462)))))

(declare-fun b!56916 () Bool)

(assert (=> b!56916 (= c!7002 ((_ is MissingVacant!225) lt!22453))))

(assert (=> b!56916 (= e!37503 e!37493)))

(declare-fun b!56917 () Bool)

(declare-fun res!31917 () Bool)

(assert (=> b!56917 (= res!31917 call!4035)))

(declare-fun e!37496 () Bool)

(assert (=> b!56917 (=> (not res!31917) (not e!37496))))

(declare-fun bm!4033 () Bool)

(assert (=> bm!4033 (= call!4041 call!4019)))

(declare-fun b!56918 () Bool)

(assert (=> b!56918 (= e!37502 (not call!4026))))

(declare-fun bm!4034 () Bool)

(assert (=> bm!4034 (= call!4031 call!4034)))

(declare-fun b!56919 () Bool)

(declare-fun call!4022 () ListLongMap!1355)

(assert (=> b!56919 (= e!37507 (= call!4020 call!4022))))

(declare-fun b!56920 () Bool)

(declare-fun c!7005 () Bool)

(assert (=> b!56920 (= c!7005 ((_ is MissingVacant!225) lt!22455))))

(assert (=> b!56920 (= e!37510 e!37492)))

(declare-fun b!56921 () Bool)

(declare-fun lt!22466 () tuple2!2006)

(assert (=> b!56921 (= e!37493 (tuple2!2007 (_1!1014 lt!22466) (_2!1014 lt!22466)))))

(assert (=> b!56921 (= lt!22466 call!4025)))

(declare-fun bm!4035 () Bool)

(assert (=> bm!4035 (= call!4022 (map!1098 newMap!16))))

(declare-fun bm!4036 () Bool)

(assert (=> bm!4036 (= call!4035 call!4038)))

(declare-fun b!56922 () Bool)

(declare-fun Unit!1484 () Unit!1475)

(assert (=> b!56922 (= e!37499 Unit!1484)))

(declare-fun lt!22476 () Unit!1475)

(assert (=> b!56922 (= lt!22476 call!4033)))

(assert (=> b!56922 (= lt!22461 call!4039)))

(assert (=> b!56922 (= c!6996 ((_ is MissingZero!225) lt!22461))))

(assert (=> b!56922 e!37506))

(declare-fun lt!22475 () Unit!1475)

(assert (=> b!56922 (= lt!22475 lt!22476)))

(assert (=> b!56922 false))

(declare-fun b!56923 () Bool)

(assert (=> b!56923 (= e!37509 (not call!4026))))

(declare-fun b!56924 () Bool)

(declare-fun lt!22468 () Unit!1475)

(assert (=> b!56924 (= e!37499 lt!22468)))

(assert (=> b!56924 (= lt!22468 call!4023)))

(assert (=> b!56924 (= lt!22451 call!4039)))

(declare-fun res!31914 () Bool)

(assert (=> b!56924 (= res!31914 ((_ is Found!225) lt!22451))))

(assert (=> b!56924 (=> (not res!31914) (not e!37505))))

(assert (=> b!56924 e!37505))

(declare-fun bm!4037 () Bool)

(assert (=> bm!4037 (= call!4020 (map!1098 (_2!1014 lt!22454)))))

(declare-fun b!56925 () Bool)

(assert (=> b!56925 (= e!37498 (= call!4020 (+!79 call!4022 (tuple2!2009 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!4038 () Bool)

(assert (=> bm!4038 (= call!4024 call!4037)))

(declare-fun bm!4039 () Bool)

(declare-fun c!6998 () Bool)

(assert (=> bm!4039 (= c!6998 c!7000)))

(assert (=> bm!4039 (= call!4040 (contains!676 e!37495 (ite c!7000 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (select (arr!1769 (_keys!3637 newMap!16)) (index!3023 lt!22453)))))))

(declare-fun b!56926 () Bool)

(declare-fun lt!22457 () Unit!1475)

(declare-fun lt!22463 () Unit!1475)

(assert (=> b!56926 (= lt!22457 lt!22463)))

(assert (=> b!56926 (= call!4024 call!4029)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!13 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 V!2827 Int) Unit!1475)

(assert (=> b!56926 (= lt!22463 (lemmaChangeZeroKeyThenAddPairToListMap!13 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) lt!22469 (zeroValue!1935 newMap!16) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1935 newMap!16) (defaultEntry!2017 newMap!16)))))

(assert (=> b!56926 (= lt!22469 (bvor (extraKeys!1908 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!56926 (= e!37494 (tuple2!2007 true (LongMapFixedSize!607 (defaultEntry!2017 newMap!16) (mask!5888 newMap!16) (bvor (extraKeys!1908 newMap!16) #b00000000000000000000000000000001) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!1935 newMap!16) (_size!352 newMap!16) (_keys!3637 newMap!16) (_values!2000 newMap!16) (_vacant!352 newMap!16))))))

(declare-fun b!56927 () Bool)

(declare-fun res!31916 () Bool)

(assert (=> b!56927 (= res!31916 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3025 lt!22461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56927 (=> (not res!31916) (not e!37511))))

(declare-fun b!56928 () Bool)

(assert (=> b!56928 (= e!37496 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3023 lt!22470)) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun b!56929 () Bool)

(declare-fun res!31913 () Bool)

(assert (=> b!56929 (= res!31913 (= (select (arr!1769 (_keys!3637 newMap!16)) (index!3025 lt!22455)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!56929 (=> (not res!31913) (not e!37509))))

(declare-fun b!56930 () Bool)

(declare-fun Unit!1485 () Unit!1475)

(assert (=> b!56930 (= e!37491 Unit!1485)))

(declare-fun lt!22467 () Unit!1475)

(assert (=> b!56930 (= lt!22467 call!4023)))

(assert (=> b!56930 (= lt!22470 call!4042)))

(declare-fun res!31912 () Bool)

(assert (=> b!56930 (= res!31912 ((_ is Found!225) lt!22470))))

(assert (=> b!56930 (=> (not res!31912) (not e!37496))))

(assert (=> b!56930 e!37496))

(declare-fun lt!22460 () Unit!1475)

(assert (=> b!56930 (= lt!22460 lt!22467)))

(assert (=> b!56930 false))

(assert (= (and d!10495 c!7006) b!56901))

(assert (= (and d!10495 (not c!7006)) b!56895))

(assert (= (and b!56901 c!7004) b!56926))

(assert (= (and b!56901 (not c!7004)) b!56900))

(assert (= (or b!56926 b!56900) bm!4033))

(assert (= (or b!56926 b!56900) bm!4021))

(assert (= (or b!56926 b!56900) bm!4038))

(assert (= (and b!56895 c!7000) b!56897))

(assert (= (and b!56895 (not c!7000)) b!56916))

(assert (= (and b!56897 c!6997) b!56930))

(assert (= (and b!56897 (not c!6997)) b!56913))

(assert (= (and b!56930 res!31912) b!56917))

(assert (= (and b!56917 res!31917) b!56928))

(assert (= (and b!56913 c!6993) b!56892))

(assert (= (and b!56913 (not c!6993)) b!56920))

(assert (= (and b!56892 res!31919) b!56905))

(assert (= (and b!56905 res!31924) b!56918))

(assert (= (and b!56920 c!7005) b!56903))

(assert (= (and b!56920 (not c!7005)) b!56899))

(assert (= (and b!56903 res!31925) b!56929))

(assert (= (and b!56929 res!31913) b!56923))

(assert (= (or b!56892 b!56903) bm!4025))

(assert (= (or b!56918 b!56923) bm!4030))

(assert (= (or b!56917 bm!4025) bm!4036))

(assert (= (or b!56930 b!56913) bm!4018))

(assert (= (and b!56916 c!7002) b!56921))

(assert (= (and b!56916 (not c!7002)) b!56907))

(assert (= (and b!56907 c!7003) b!56915))

(assert (= (and b!56907 (not c!7003)) b!56910))

(assert (= (and b!56910 c!6994) b!56924))

(assert (= (and b!56910 (not c!6994)) b!56922))

(assert (= (and b!56924 res!31914) b!56893))

(assert (= (and b!56893 res!31922) b!56890))

(assert (= (and b!56922 c!6996) b!56911))

(assert (= (and b!56922 (not c!6996)) b!56904))

(assert (= (and b!56911 res!31920) b!56902))

(assert (= (and b!56902 res!31921) b!56912))

(assert (= (and b!56904 c!7001) b!56914))

(assert (= (and b!56904 (not c!7001)) b!56896))

(assert (= (and b!56914 res!31915) b!56927))

(assert (= (and b!56927 res!31916) b!56906))

(assert (= (or b!56911 b!56914) bm!4029))

(assert (= (or b!56912 b!56906) bm!4034))

(assert (= (or b!56893 bm!4029) bm!4026))

(assert (= (or b!56924 b!56922) bm!4027))

(assert (= (or b!56921 b!56915) bm!4023))

(assert (= (or b!56930 b!56924) bm!4032))

(assert (= (or bm!4036 bm!4026) bm!4020))

(assert (= (or b!56913 b!56922) bm!4028))

(assert (= (or bm!4030 bm!4034) bm!4022))

(assert (= (or b!56897 b!56910) bm!4031))

(assert (= (or bm!4018 bm!4027) bm!4016))

(assert (= (or b!56897 b!56910) bm!4039))

(assert (= (and bm!4039 c!6998) b!56909))

(assert (= (and bm!4039 (not c!6998)) b!56894))

(assert (= (or bm!4033 bm!4031) bm!4019))

(assert (= (or bm!4021 b!56894) bm!4017))

(assert (= (or bm!4038 b!56910) bm!4024))

(assert (= (and bm!4024 c!6995) b!56898))

(assert (= (and bm!4024 (not c!6995)) b!56889))

(assert (= (and d!10495 res!31923) b!56908))

(assert (= (and b!56908 c!6999) b!56891))

(assert (= (and b!56908 (not c!6999)) b!56919))

(assert (= (and b!56891 res!31918) b!56925))

(assert (= (or b!56925 b!56919) bm!4035))

(assert (= (or b!56891 b!56925 b!56919) bm!4037))

(assert (=> bm!4028 m!47755))

(declare-fun m!47845 () Bool)

(assert (=> bm!4028 m!47845))

(assert (=> b!56900 m!47753))

(declare-fun m!47847 () Bool)

(assert (=> b!56900 m!47847))

(declare-fun m!47849 () Bool)

(assert (=> bm!4037 m!47849))

(assert (=> bm!4023 m!47755))

(assert (=> bm!4023 m!47753))

(declare-fun m!47851 () Bool)

(assert (=> bm!4023 m!47851))

(assert (=> b!56910 m!47755))

(assert (=> b!56910 m!47753))

(declare-fun m!47853 () Bool)

(assert (=> b!56910 m!47853))

(declare-fun m!47855 () Bool)

(assert (=> b!56910 m!47855))

(declare-fun m!47857 () Bool)

(assert (=> b!56910 m!47857))

(assert (=> b!56910 m!47755))

(declare-fun m!47859 () Bool)

(assert (=> b!56910 m!47859))

(assert (=> b!56910 m!47857))

(declare-fun m!47861 () Bool)

(assert (=> b!56910 m!47861))

(assert (=> b!56889 m!47857))

(declare-fun m!47863 () Bool)

(assert (=> b!56928 m!47863))

(declare-fun m!47865 () Bool)

(assert (=> bm!4024 m!47865))

(assert (=> b!56895 m!47755))

(declare-fun m!47867 () Bool)

(assert (=> b!56895 m!47867))

(declare-fun m!47869 () Bool)

(assert (=> b!56902 m!47869))

(assert (=> bm!4016 m!47755))

(assert (=> bm!4016 m!47867))

(declare-fun m!47871 () Bool)

(assert (=> b!56929 m!47871))

(declare-fun m!47873 () Bool)

(assert (=> b!56890 m!47873))

(assert (=> b!56891 m!47755))

(declare-fun m!47875 () Bool)

(assert (=> b!56891 m!47875))

(declare-fun m!47877 () Bool)

(assert (=> bm!4017 m!47877))

(assert (=> bm!4019 m!47861))

(declare-fun m!47879 () Bool)

(assert (=> bm!4019 m!47879))

(assert (=> bm!4032 m!47755))

(declare-fun m!47881 () Bool)

(assert (=> bm!4032 m!47881))

(declare-fun m!47883 () Bool)

(assert (=> d!10495 m!47883))

(assert (=> d!10495 m!47791))

(assert (=> b!56926 m!47753))

(declare-fun m!47885 () Bool)

(assert (=> b!56926 m!47885))

(declare-fun m!47887 () Bool)

(assert (=> bm!4039 m!47887))

(declare-fun m!47889 () Bool)

(assert (=> bm!4039 m!47889))

(declare-fun m!47891 () Bool)

(assert (=> b!56905 m!47891))

(assert (=> bm!4035 m!47787))

(declare-fun m!47893 () Bool)

(assert (=> b!56925 m!47893))

(assert (=> bm!4022 m!47755))

(declare-fun m!47895 () Bool)

(assert (=> bm!4022 m!47895))

(declare-fun m!47897 () Bool)

(assert (=> b!56927 m!47897))

(declare-fun m!47899 () Bool)

(assert (=> bm!4020 m!47899))

(assert (=> b!56723 d!10495))

(declare-fun d!10497 () Bool)

(declare-fun c!7009 () Bool)

(assert (=> d!10497 (= c!7009 ((_ is ValueCellFull!849) (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun e!37514 () V!2827)

(assert (=> d!10497 (= (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!37514)))

(declare-fun b!56935 () Bool)

(declare-fun get!1055 (ValueCell!849 V!2827) V!2827)

(assert (=> b!56935 (= e!37514 (get!1055 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!56936 () Bool)

(declare-fun get!1056 (ValueCell!849 V!2827) V!2827)

(assert (=> b!56936 (= e!37514 (get!1056 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) from!355) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!10497 c!7009) b!56935))

(assert (= (and d!10497 (not c!7009)) b!56936))

(assert (=> b!56935 m!47749))

(assert (=> b!56935 m!47751))

(declare-fun m!47901 () Bool)

(assert (=> b!56935 m!47901))

(assert (=> b!56936 m!47749))

(assert (=> b!56936 m!47751))

(declare-fun m!47903 () Bool)

(assert (=> b!56936 m!47903))

(assert (=> b!56723 d!10497))

(declare-fun d!10499 () Bool)

(assert (=> d!10499 (= (validMask!0 (mask!5888 (v!2360 (underlying!221 thiss!992)))) (and (or (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000001111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000011111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000001111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000011111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000001111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000011111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000001111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000011111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000000111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000001111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000011111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000000111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000001111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000011111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000000111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000001111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000011111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000000111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000001111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000011111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00000111111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00001111111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00011111111111111111111111111111) (= (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5888 (v!2360 (underlying!221 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!56732 d!10499))

(declare-fun d!10501 () Bool)

(assert (=> d!10501 (= (array_inv!1095 (_keys!3637 newMap!16)) (bvsge (size!1998 (_keys!3637 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56736 d!10501))

(declare-fun d!10503 () Bool)

(assert (=> d!10503 (= (array_inv!1096 (_values!2000 newMap!16)) (bvsge (size!1999 (_values!2000 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!56736 d!10503))

(declare-fun d!10505 () Bool)

(assert (=> d!10505 (= (valid!248 thiss!992) (valid!247 (v!2360 (underlying!221 thiss!992))))))

(declare-fun bs!2469 () Bool)

(assert (= bs!2469 d!10505))

(declare-fun m!47905 () Bool)

(assert (=> bs!2469 m!47905))

(assert (=> start!8386 d!10505))

(declare-fun d!10507 () Bool)

(assert (=> d!10507 (= (array_inv!1095 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvsge (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56722 d!10507))

(declare-fun d!10509 () Bool)

(assert (=> d!10509 (= (array_inv!1096 (_values!2000 (v!2360 (underlying!221 thiss!992)))) (bvsge (size!1999 (_values!2000 (v!2360 (underlying!221 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!56722 d!10509))

(declare-fun d!10511 () Bool)

(declare-fun res!31932 () Bool)

(declare-fun e!37517 () Bool)

(assert (=> d!10511 (=> (not res!31932) (not e!37517))))

(declare-fun simpleValid!40 (LongMapFixedSize!606) Bool)

(assert (=> d!10511 (= res!31932 (simpleValid!40 newMap!16))))

(assert (=> d!10511 (= (valid!247 newMap!16) e!37517)))

(declare-fun b!56943 () Bool)

(declare-fun res!31933 () Bool)

(assert (=> b!56943 (=> (not res!31933) (not e!37517))))

(declare-fun arrayCountValidKeys!0 (array!3693 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!56943 (= res!31933 (= (arrayCountValidKeys!0 (_keys!3637 newMap!16) #b00000000000000000000000000000000 (size!1998 (_keys!3637 newMap!16))) (_size!352 newMap!16)))))

(declare-fun b!56944 () Bool)

(declare-fun res!31934 () Bool)

(assert (=> b!56944 (=> (not res!31934) (not e!37517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3693 (_ BitVec 32)) Bool)

(assert (=> b!56944 (= res!31934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3637 newMap!16) (mask!5888 newMap!16)))))

(declare-fun b!56945 () Bool)

(assert (=> b!56945 (= e!37517 (arrayNoDuplicates!0 (_keys!3637 newMap!16) #b00000000000000000000000000000000 Nil!1419))))

(assert (= (and d!10511 res!31932) b!56943))

(assert (= (and b!56943 res!31933) b!56944))

(assert (= (and b!56944 res!31934) b!56945))

(declare-fun m!47907 () Bool)

(assert (=> d!10511 m!47907))

(declare-fun m!47909 () Bool)

(assert (=> b!56943 m!47909))

(declare-fun m!47911 () Bool)

(assert (=> b!56944 m!47911))

(declare-fun m!47913 () Bool)

(assert (=> b!56945 m!47913))

(assert (=> b!56731 d!10511))

(declare-fun d!10513 () Bool)

(assert (=> d!10513 (not (arrayContainsKey!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22479 () Unit!1475)

(declare-fun choose!68 (array!3693 (_ BitVec 32) (_ BitVec 64) List!1422) Unit!1475)

(assert (=> d!10513 (= lt!22479 (choose!68 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (Cons!1418 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) Nil!1419)))))

(assert (=> d!10513 (bvslt (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10513 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (Cons!1418 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) Nil!1419)) lt!22479)))

(declare-fun bs!2470 () Bool)

(assert (= bs!2470 d!10513))

(assert (=> bs!2470 m!47755))

(assert (=> bs!2470 m!47767))

(assert (=> bs!2470 m!47755))

(declare-fun m!47915 () Bool)

(assert (=> bs!2470 m!47915))

(assert (=> b!56721 d!10513))

(declare-fun d!10515 () Bool)

(assert (=> d!10515 (arrayNoDuplicates!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) from!355 Nil!1419)))

(declare-fun lt!22482 () Unit!1475)

(declare-fun choose!39 (array!3693 (_ BitVec 32) (_ BitVec 32)) Unit!1475)

(assert (=> d!10515 (= lt!22482 (choose!39 (_keys!3637 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!10515 (bvslt (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!10515 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000000 from!355) lt!22482)))

(declare-fun bs!2471 () Bool)

(assert (= bs!2471 d!10515))

(assert (=> bs!2471 m!47763))

(declare-fun m!47917 () Bool)

(assert (=> bs!2471 m!47917))

(assert (=> b!56721 d!10515))

(declare-fun d!10517 () Bool)

(declare-fun res!31939 () Bool)

(declare-fun e!37522 () Bool)

(assert (=> d!10517 (=> res!31939 e!37522)))

(assert (=> d!10517 (= res!31939 (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(assert (=> d!10517 (= (arrayContainsKey!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!37522)))

(declare-fun b!56950 () Bool)

(declare-fun e!37523 () Bool)

(assert (=> b!56950 (= e!37522 e!37523)))

(declare-fun res!31940 () Bool)

(assert (=> b!56950 (=> (not res!31940) (not e!37523))))

(assert (=> b!56950 (= res!31940 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun b!56951 () Bool)

(assert (=> b!56951 (= e!37523 (arrayContainsKey!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!10517 (not res!31939)) b!56950))

(assert (= (and b!56950 res!31940) b!56951))

(declare-fun m!47919 () Bool)

(assert (=> d!10517 m!47919))

(assert (=> b!56951 m!47755))

(declare-fun m!47921 () Bool)

(assert (=> b!56951 m!47921))

(assert (=> b!56721 d!10517))

(declare-fun d!10519 () Bool)

(declare-fun e!37526 () Bool)

(assert (=> d!10519 e!37526))

(declare-fun c!7012 () Bool)

(assert (=> d!10519 (= c!7012 (and (not (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!22485 () Unit!1475)

(declare-fun choose!286 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 64) (_ BitVec 32) Int) Unit!1475)

(assert (=> d!10519 (= lt!22485 (choose!286 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(assert (=> d!10519 (validMask!0 (mask!5888 (v!2360 (underlying!221 thiss!992))))))

(assert (=> d!10519 (= (lemmaListMapContainsThenArrayContainsFrom!26 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))) lt!22485)))

(declare-fun b!56956 () Bool)

(assert (=> b!56956 (= e!37526 (arrayContainsKey!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!56957 () Bool)

(assert (=> b!56957 (= e!37526 (ite (= (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!10519 c!7012) b!56956))

(assert (= (and d!10519 (not c!7012)) b!56957))

(assert (=> d!10519 m!47755))

(declare-fun m!47923 () Bool)

(assert (=> d!10519 m!47923))

(assert (=> d!10519 m!47781))

(assert (=> b!56956 m!47755))

(assert (=> b!56956 m!47767))

(assert (=> b!56721 d!10519))

(declare-fun b!56968 () Bool)

(declare-fun e!37537 () Bool)

(declare-fun call!4045 () Bool)

(assert (=> b!56968 (= e!37537 call!4045)))

(declare-fun b!56969 () Bool)

(assert (=> b!56969 (= e!37537 call!4045)))

(declare-fun d!10521 () Bool)

(declare-fun res!31947 () Bool)

(declare-fun e!37538 () Bool)

(assert (=> d!10521 (=> res!31947 e!37538)))

(assert (=> d!10521 (= res!31947 (bvsge from!355 (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(assert (=> d!10521 (= (arrayNoDuplicates!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) from!355 Nil!1419) e!37538)))

(declare-fun b!56970 () Bool)

(declare-fun e!37536 () Bool)

(assert (=> b!56970 (= e!37538 e!37536)))

(declare-fun res!31949 () Bool)

(assert (=> b!56970 (=> (not res!31949) (not e!37536))))

(declare-fun e!37535 () Bool)

(assert (=> b!56970 (= res!31949 (not e!37535))))

(declare-fun res!31948 () Bool)

(assert (=> b!56970 (=> (not res!31948) (not e!37535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!56970 (= res!31948 (validKeyInArray!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun b!56971 () Bool)

(assert (=> b!56971 (= e!37536 e!37537)))

(declare-fun c!7015 () Bool)

(assert (=> b!56971 (= c!7015 (validKeyInArray!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(declare-fun bm!4042 () Bool)

(assert (=> bm!4042 (= call!4045 (arrayNoDuplicates!0 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!7015 (Cons!1418 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355) Nil!1419) Nil!1419)))))

(declare-fun b!56972 () Bool)

(declare-fun contains!677 (List!1422 (_ BitVec 64)) Bool)

(assert (=> b!56972 (= e!37535 (contains!677 Nil!1419 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) from!355)))))

(assert (= (and d!10521 (not res!31947)) b!56970))

(assert (= (and b!56970 res!31948) b!56972))

(assert (= (and b!56970 res!31949) b!56971))

(assert (= (and b!56971 c!7015) b!56969))

(assert (= (and b!56971 (not c!7015)) b!56968))

(assert (= (or b!56969 b!56968) bm!4042))

(assert (=> b!56970 m!47755))

(assert (=> b!56970 m!47755))

(declare-fun m!47925 () Bool)

(assert (=> b!56970 m!47925))

(assert (=> b!56971 m!47755))

(assert (=> b!56971 m!47755))

(assert (=> b!56971 m!47925))

(assert (=> bm!4042 m!47755))

(declare-fun m!47927 () Bool)

(assert (=> bm!4042 m!47927))

(assert (=> b!56972 m!47755))

(assert (=> b!56972 m!47755))

(declare-fun m!47929 () Bool)

(assert (=> b!56972 m!47929))

(assert (=> b!56721 d!10521))

(declare-fun d!10523 () Bool)

(assert (=> d!10523 (= (map!1098 newMap!16) (getCurrentListMap!399 (_keys!3637 newMap!16) (_values!2000 newMap!16) (mask!5888 newMap!16) (extraKeys!1908 newMap!16) (zeroValue!1935 newMap!16) (minValue!1935 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2017 newMap!16)))))

(declare-fun bs!2472 () Bool)

(assert (= bs!2472 d!10523))

(assert (=> bs!2472 m!47857))

(assert (=> b!56730 d!10523))

(declare-fun b!57015 () Bool)

(declare-fun e!37575 () ListLongMap!1355)

(declare-fun call!4062 () ListLongMap!1355)

(assert (=> b!57015 (= e!37575 call!4062)))

(declare-fun b!57016 () Bool)

(declare-fun c!7031 () Bool)

(assert (=> b!57016 (= c!7031 (and (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!37570 () ListLongMap!1355)

(assert (=> b!57016 (= e!37575 e!37570)))

(declare-fun bm!4057 () Bool)

(declare-fun call!4066 () Bool)

(declare-fun lt!22548 () ListLongMap!1355)

(assert (=> bm!4057 (= call!4066 (contains!676 lt!22548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57017 () Bool)

(declare-fun e!37567 () Bool)

(declare-fun call!4063 () Bool)

(assert (=> b!57017 (= e!37567 (not call!4063))))

(declare-fun b!57018 () Bool)

(declare-fun res!31969 () Bool)

(declare-fun e!37576 () Bool)

(assert (=> b!57018 (=> (not res!31969) (not e!37576))))

(declare-fun e!37572 () Bool)

(assert (=> b!57018 (= res!31969 e!37572)))

(declare-fun c!7028 () Bool)

(assert (=> b!57018 (= c!7028 (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!57019 () Bool)

(declare-fun e!37568 () Bool)

(assert (=> b!57019 (= e!37567 e!37568)))

(declare-fun res!31968 () Bool)

(assert (=> b!57019 (= res!31968 call!4063)))

(assert (=> b!57019 (=> (not res!31968) (not e!37568))))

(declare-fun bm!4058 () Bool)

(declare-fun call!4060 () ListLongMap!1355)

(declare-fun call!4064 () ListLongMap!1355)

(assert (=> bm!4058 (= call!4060 call!4064)))

(declare-fun b!57020 () Bool)

(declare-fun e!37565 () Bool)

(assert (=> b!57020 (= e!37565 (validKeyInArray!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57021 () Bool)

(declare-fun e!37569 () ListLongMap!1355)

(assert (=> b!57021 (= e!37569 e!37575)))

(declare-fun c!7032 () Bool)

(assert (=> b!57021 (= c!7032 (and (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57022 () Bool)

(declare-fun e!37571 () Bool)

(declare-fun e!37566 () Bool)

(assert (=> b!57022 (= e!37571 e!37566)))

(declare-fun res!31973 () Bool)

(assert (=> b!57022 (=> (not res!31973) (not e!37566))))

(assert (=> b!57022 (= res!31973 (contains!676 lt!22548 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!57022 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun bm!4059 () Bool)

(declare-fun call!4065 () ListLongMap!1355)

(assert (=> bm!4059 (= call!4064 call!4065)))

(declare-fun bm!4060 () Bool)

(assert (=> bm!4060 (= call!4063 (contains!676 lt!22548 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!57023 () Bool)

(assert (=> b!57023 (= e!37570 call!4060)))

(declare-fun b!57024 () Bool)

(declare-fun apply!64 (ListLongMap!1355 (_ BitVec 64)) V!2827)

(assert (=> b!57024 (= e!37566 (= (apply!64 lt!22548 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1054 (select (arr!1770 (_values!2000 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!301 (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!57024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1999 (_values!2000 (v!2360 (underlying!221 thiss!992))))))))

(assert (=> b!57024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun b!57025 () Bool)

(assert (=> b!57025 (= e!37570 call!4062)))

(declare-fun b!57026 () Bool)

(assert (=> b!57026 (= e!37576 e!37567)))

(declare-fun c!7030 () Bool)

(assert (=> b!57026 (= c!7030 (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!57027 () Bool)

(declare-fun e!37577 () Bool)

(assert (=> b!57027 (= e!37577 (validKeyInArray!0 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!57028 () Bool)

(declare-fun res!31971 () Bool)

(assert (=> b!57028 (=> (not res!31971) (not e!37576))))

(assert (=> b!57028 (= res!31971 e!37571)))

(declare-fun res!31974 () Bool)

(assert (=> b!57028 (=> res!31974 e!37571)))

(assert (=> b!57028 (= res!31974 (not e!37577))))

(declare-fun res!31970 () Bool)

(assert (=> b!57028 (=> (not res!31970) (not e!37577))))

(assert (=> b!57028 (= res!31970 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun b!57029 () Bool)

(declare-fun e!37574 () Bool)

(assert (=> b!57029 (= e!37574 (= (apply!64 lt!22548 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1935 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun b!57030 () Bool)

(assert (=> b!57030 (= e!37568 (= (apply!64 lt!22548 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1935 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun b!57031 () Bool)

(declare-fun e!37573 () Unit!1475)

(declare-fun Unit!1486 () Unit!1475)

(assert (=> b!57031 (= e!37573 Unit!1486)))

(declare-fun b!57032 () Bool)

(declare-fun call!4061 () ListLongMap!1355)

(assert (=> b!57032 (= e!37569 (+!79 call!4061 (tuple2!2009 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1935 (v!2360 (underlying!221 thiss!992))))))))

(declare-fun bm!4061 () Bool)

(assert (=> bm!4061 (= call!4062 call!4061)))

(declare-fun b!57033 () Bool)

(assert (=> b!57033 (= e!37572 (not call!4066))))

(declare-fun d!10525 () Bool)

(assert (=> d!10525 e!37576))

(declare-fun res!31975 () Bool)

(assert (=> d!10525 (=> (not res!31975) (not e!37576))))

(assert (=> d!10525 (= res!31975 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))))

(declare-fun lt!22532 () ListLongMap!1355)

(assert (=> d!10525 (= lt!22548 lt!22532)))

(declare-fun lt!22542 () Unit!1475)

(assert (=> d!10525 (= lt!22542 e!37573)))

(declare-fun c!7033 () Bool)

(assert (=> d!10525 (= c!7033 e!37565)))

(declare-fun res!31972 () Bool)

(assert (=> d!10525 (=> (not res!31972) (not e!37565))))

(assert (=> d!10525 (= res!31972 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1998 (_keys!3637 (v!2360 (underlying!221 thiss!992))))))))

(assert (=> d!10525 (= lt!22532 e!37569)))

(declare-fun c!7029 () Bool)

(assert (=> d!10525 (= c!7029 (and (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!10525 (validMask!0 (mask!5888 (v!2360 (underlying!221 thiss!992))))))

(assert (=> d!10525 (= (getCurrentListMap!399 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))) lt!22548)))

(declare-fun b!57034 () Bool)

(declare-fun lt!22538 () Unit!1475)

(assert (=> b!57034 (= e!37573 lt!22538)))

(declare-fun lt!22541 () ListLongMap!1355)

(declare-fun getCurrentListMapNoExtraKeys!42 (array!3693 array!3695 (_ BitVec 32) (_ BitVec 32) V!2827 V!2827 (_ BitVec 32) Int) ListLongMap!1355)

(assert (=> b!57034 (= lt!22541 (getCurrentListMapNoExtraKeys!42 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun lt!22550 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22547 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22547 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22534 () Unit!1475)

(declare-fun addStillContains!40 (ListLongMap!1355 (_ BitVec 64) V!2827 (_ BitVec 64)) Unit!1475)

(assert (=> b!57034 (= lt!22534 (addStillContains!40 lt!22541 lt!22550 (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) lt!22547))))

(assert (=> b!57034 (contains!676 (+!79 lt!22541 (tuple2!2009 lt!22550 (zeroValue!1935 (v!2360 (underlying!221 thiss!992))))) lt!22547)))

(declare-fun lt!22539 () Unit!1475)

(assert (=> b!57034 (= lt!22539 lt!22534)))

(declare-fun lt!22546 () ListLongMap!1355)

(assert (=> b!57034 (= lt!22546 (getCurrentListMapNoExtraKeys!42 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun lt!22536 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22536 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22537 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22537 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22544 () Unit!1475)

(declare-fun addApplyDifferent!40 (ListLongMap!1355 (_ BitVec 64) V!2827 (_ BitVec 64)) Unit!1475)

(assert (=> b!57034 (= lt!22544 (addApplyDifferent!40 lt!22546 lt!22536 (minValue!1935 (v!2360 (underlying!221 thiss!992))) lt!22537))))

(assert (=> b!57034 (= (apply!64 (+!79 lt!22546 (tuple2!2009 lt!22536 (minValue!1935 (v!2360 (underlying!221 thiss!992))))) lt!22537) (apply!64 lt!22546 lt!22537))))

(declare-fun lt!22533 () Unit!1475)

(assert (=> b!57034 (= lt!22533 lt!22544)))

(declare-fun lt!22543 () ListLongMap!1355)

(assert (=> b!57034 (= lt!22543 (getCurrentListMapNoExtraKeys!42 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun lt!22535 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22540 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22540 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!22545 () Unit!1475)

(assert (=> b!57034 (= lt!22545 (addApplyDifferent!40 lt!22543 lt!22535 (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) lt!22540))))

(assert (=> b!57034 (= (apply!64 (+!79 lt!22543 (tuple2!2009 lt!22535 (zeroValue!1935 (v!2360 (underlying!221 thiss!992))))) lt!22540) (apply!64 lt!22543 lt!22540))))

(declare-fun lt!22530 () Unit!1475)

(assert (=> b!57034 (= lt!22530 lt!22545)))

(declare-fun lt!22551 () ListLongMap!1355)

(assert (=> b!57034 (= lt!22551 (getCurrentListMapNoExtraKeys!42 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(declare-fun lt!22549 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!22531 () (_ BitVec 64))

(assert (=> b!57034 (= lt!22531 (select (arr!1769 (_keys!3637 (v!2360 (underlying!221 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!57034 (= lt!22538 (addApplyDifferent!40 lt!22551 lt!22549 (minValue!1935 (v!2360 (underlying!221 thiss!992))) lt!22531))))

(assert (=> b!57034 (= (apply!64 (+!79 lt!22551 (tuple2!2009 lt!22549 (minValue!1935 (v!2360 (underlying!221 thiss!992))))) lt!22531) (apply!64 lt!22551 lt!22531))))

(declare-fun b!57035 () Bool)

(assert (=> b!57035 (= e!37572 e!37574)))

(declare-fun res!31976 () Bool)

(assert (=> b!57035 (= res!31976 call!4066)))

(assert (=> b!57035 (=> (not res!31976) (not e!37574))))

(declare-fun bm!4062 () Bool)

(assert (=> bm!4062 (= call!4061 (+!79 (ite c!7029 call!4065 (ite c!7032 call!4064 call!4060)) (ite (or c!7029 c!7032) (tuple2!2009 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1935 (v!2360 (underlying!221 thiss!992)))) (tuple2!2009 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1935 (v!2360 (underlying!221 thiss!992)))))))))

(declare-fun bm!4063 () Bool)

(assert (=> bm!4063 (= call!4065 (getCurrentListMapNoExtraKeys!42 (_keys!3637 (v!2360 (underlying!221 thiss!992))) (_values!2000 (v!2360 (underlying!221 thiss!992))) (mask!5888 (v!2360 (underlying!221 thiss!992))) (extraKeys!1908 (v!2360 (underlying!221 thiss!992))) (zeroValue!1935 (v!2360 (underlying!221 thiss!992))) (minValue!1935 (v!2360 (underlying!221 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992)))))))

(assert (= (and d!10525 c!7029) b!57032))

(assert (= (and d!10525 (not c!7029)) b!57021))

(assert (= (and b!57021 c!7032) b!57015))

(assert (= (and b!57021 (not c!7032)) b!57016))

(assert (= (and b!57016 c!7031) b!57025))

(assert (= (and b!57016 (not c!7031)) b!57023))

(assert (= (or b!57025 b!57023) bm!4058))

(assert (= (or b!57015 bm!4058) bm!4059))

(assert (= (or b!57015 b!57025) bm!4061))

(assert (= (or b!57032 bm!4059) bm!4063))

(assert (= (or b!57032 bm!4061) bm!4062))

(assert (= (and d!10525 res!31972) b!57020))

(assert (= (and d!10525 c!7033) b!57034))

(assert (= (and d!10525 (not c!7033)) b!57031))

(assert (= (and d!10525 res!31975) b!57028))

(assert (= (and b!57028 res!31970) b!57027))

(assert (= (and b!57028 (not res!31974)) b!57022))

(assert (= (and b!57022 res!31973) b!57024))

(assert (= (and b!57028 res!31971) b!57018))

(assert (= (and b!57018 c!7028) b!57035))

(assert (= (and b!57018 (not c!7028)) b!57033))

(assert (= (and b!57035 res!31976) b!57029))

(assert (= (or b!57035 b!57033) bm!4057))

(assert (= (and b!57018 res!31969) b!57026))

(assert (= (and b!57026 c!7030) b!57019))

(assert (= (and b!57026 (not c!7030)) b!57017))

(assert (= (and b!57019 res!31968) b!57030))

(assert (= (or b!57019 b!57017) bm!4060))

(declare-fun b_lambda!2485 () Bool)

(assert (=> (not b_lambda!2485) (not b!57024)))

(assert (=> b!57024 t!4725))

(declare-fun b_and!3431 () Bool)

(assert (= b_and!3419 (and (=> t!4725 result!2319) b_and!3431)))

(assert (=> b!57024 t!4727))

(declare-fun b_and!3433 () Bool)

(assert (= b_and!3421 (and (=> t!4727 result!2323) b_and!3433)))

(declare-fun m!47931 () Bool)

(assert (=> bm!4057 m!47931))

(declare-fun m!47933 () Bool)

(assert (=> bm!4060 m!47933))

(declare-fun m!47935 () Bool)

(assert (=> b!57024 m!47935))

(assert (=> b!57024 m!47751))

(assert (=> b!57024 m!47935))

(assert (=> b!57024 m!47751))

(declare-fun m!47937 () Bool)

(assert (=> b!57024 m!47937))

(assert (=> b!57024 m!47919))

(declare-fun m!47939 () Bool)

(assert (=> b!57024 m!47939))

(assert (=> b!57024 m!47919))

(assert (=> b!57022 m!47919))

(assert (=> b!57022 m!47919))

(declare-fun m!47941 () Bool)

(assert (=> b!57022 m!47941))

(assert (=> b!57020 m!47919))

(assert (=> b!57020 m!47919))

(declare-fun m!47943 () Bool)

(assert (=> b!57020 m!47943))

(declare-fun m!47945 () Bool)

(assert (=> bm!4062 m!47945))

(declare-fun m!47947 () Bool)

(assert (=> b!57029 m!47947))

(declare-fun m!47949 () Bool)

(assert (=> b!57034 m!47949))

(declare-fun m!47951 () Bool)

(assert (=> b!57034 m!47951))

(declare-fun m!47953 () Bool)

(assert (=> b!57034 m!47953))

(declare-fun m!47955 () Bool)

(assert (=> b!57034 m!47955))

(declare-fun m!47957 () Bool)

(assert (=> b!57034 m!47957))

(declare-fun m!47959 () Bool)

(assert (=> b!57034 m!47959))

(declare-fun m!47961 () Bool)

(assert (=> b!57034 m!47961))

(assert (=> b!57034 m!47951))

(assert (=> b!57034 m!47957))

(declare-fun m!47963 () Bool)

(assert (=> b!57034 m!47963))

(declare-fun m!47965 () Bool)

(assert (=> b!57034 m!47965))

(declare-fun m!47967 () Bool)

(assert (=> b!57034 m!47967))

(assert (=> b!57034 m!47919))

(declare-fun m!47969 () Bool)

(assert (=> b!57034 m!47969))

(declare-fun m!47971 () Bool)

(assert (=> b!57034 m!47971))

(declare-fun m!47973 () Bool)

(assert (=> b!57034 m!47973))

(assert (=> b!57034 m!47971))

(declare-fun m!47975 () Bool)

(assert (=> b!57034 m!47975))

(declare-fun m!47977 () Bool)

(assert (=> b!57034 m!47977))

(assert (=> b!57034 m!47961))

(declare-fun m!47979 () Bool)

(assert (=> b!57034 m!47979))

(assert (=> b!57027 m!47919))

(assert (=> b!57027 m!47919))

(assert (=> b!57027 m!47943))

(assert (=> bm!4063 m!47959))

(declare-fun m!47981 () Bool)

(assert (=> b!57032 m!47981))

(declare-fun m!47983 () Bool)

(assert (=> b!57030 m!47983))

(assert (=> d!10525 m!47781))

(assert (=> b!56730 d!10525))

(declare-fun b!57042 () Bool)

(declare-fun e!37583 () Bool)

(assert (=> b!57042 (= e!37583 tp_is_empty!2385)))

(declare-fun condMapEmpty!2835 () Bool)

(declare-fun mapDefault!2835 () ValueCell!849)

(assert (=> mapNonEmpty!2825 (= condMapEmpty!2835 (= mapRest!2826 ((as const (Array (_ BitVec 32) ValueCell!849)) mapDefault!2835)))))

(declare-fun e!37582 () Bool)

(declare-fun mapRes!2835 () Bool)

(assert (=> mapNonEmpty!2825 (= tp!7912 (and e!37582 mapRes!2835))))

(declare-fun mapNonEmpty!2835 () Bool)

(declare-fun tp!7929 () Bool)

(assert (=> mapNonEmpty!2835 (= mapRes!2835 (and tp!7929 e!37583))))

(declare-fun mapValue!2835 () ValueCell!849)

(declare-fun mapKey!2835 () (_ BitVec 32))

(declare-fun mapRest!2835 () (Array (_ BitVec 32) ValueCell!849))

(assert (=> mapNonEmpty!2835 (= mapRest!2826 (store mapRest!2835 mapKey!2835 mapValue!2835))))

(declare-fun mapIsEmpty!2835 () Bool)

(assert (=> mapIsEmpty!2835 mapRes!2835))

(declare-fun b!57043 () Bool)

(assert (=> b!57043 (= e!37582 tp_is_empty!2385)))

(assert (= (and mapNonEmpty!2825 condMapEmpty!2835) mapIsEmpty!2835))

(assert (= (and mapNonEmpty!2825 (not condMapEmpty!2835)) mapNonEmpty!2835))

(assert (= (and mapNonEmpty!2835 ((_ is ValueCellFull!849) mapValue!2835)) b!57042))

(assert (= (and mapNonEmpty!2825 ((_ is ValueCellFull!849) mapDefault!2835)) b!57043))

(declare-fun m!47985 () Bool)

(assert (=> mapNonEmpty!2835 m!47985))

(declare-fun b!57044 () Bool)

(declare-fun e!37585 () Bool)

(assert (=> b!57044 (= e!37585 tp_is_empty!2385)))

(declare-fun condMapEmpty!2836 () Bool)

(declare-fun mapDefault!2836 () ValueCell!849)

(assert (=> mapNonEmpty!2826 (= condMapEmpty!2836 (= mapRest!2825 ((as const (Array (_ BitVec 32) ValueCell!849)) mapDefault!2836)))))

(declare-fun e!37584 () Bool)

(declare-fun mapRes!2836 () Bool)

(assert (=> mapNonEmpty!2826 (= tp!7911 (and e!37584 mapRes!2836))))

(declare-fun mapNonEmpty!2836 () Bool)

(declare-fun tp!7930 () Bool)

(assert (=> mapNonEmpty!2836 (= mapRes!2836 (and tp!7930 e!37585))))

(declare-fun mapKey!2836 () (_ BitVec 32))

(declare-fun mapRest!2836 () (Array (_ BitVec 32) ValueCell!849))

(declare-fun mapValue!2836 () ValueCell!849)

(assert (=> mapNonEmpty!2836 (= mapRest!2825 (store mapRest!2836 mapKey!2836 mapValue!2836))))

(declare-fun mapIsEmpty!2836 () Bool)

(assert (=> mapIsEmpty!2836 mapRes!2836))

(declare-fun b!57045 () Bool)

(assert (=> b!57045 (= e!37584 tp_is_empty!2385)))

(assert (= (and mapNonEmpty!2826 condMapEmpty!2836) mapIsEmpty!2836))

(assert (= (and mapNonEmpty!2826 (not condMapEmpty!2836)) mapNonEmpty!2836))

(assert (= (and mapNonEmpty!2836 ((_ is ValueCellFull!849) mapValue!2836)) b!57044))

(assert (= (and mapNonEmpty!2826 ((_ is ValueCellFull!849) mapDefault!2836)) b!57045))

(declare-fun m!47987 () Bool)

(assert (=> mapNonEmpty!2836 m!47987))

(declare-fun b_lambda!2487 () Bool)

(assert (= b_lambda!2485 (or (and b!56722 b_free!1937) (and b!56736 b_free!1939 (= (defaultEntry!2017 newMap!16) (defaultEntry!2017 (v!2360 (underlying!221 thiss!992))))) b_lambda!2487)))

(check-sat b_and!3433 (not d!10525) (not b!56889) (not bm!4024) (not mapNonEmpty!2836) (not b!56925) (not b!56804) (not b_next!1939) (not b!56900) (not b!57022) (not b!56972) (not b!57027) (not bm!4042) (not d!10505) (not b!57030) (not b!56971) (not bm!4063) (not bm!4019) (not bm!4062) (not bm!4037) b_and!3431 (not b_next!1937) (not b!57029) (not b!56926) (not b!57032) (not bm!4039) (not b!56910) (not b!56945) (not bm!4020) (not d!10493) (not bm!4032) (not b!56951) (not b!56970) (not b!56935) (not d!10511) (not b!57034) (not b!56943) (not b!56891) (not d!10515) (not b!56802) (not b_lambda!2487) tp_is_empty!2385 (not bm!4023) (not b!57020) (not bm!4060) (not b_lambda!2483) (not d!10495) (not bm!4017) (not b!56956) (not b!56895) (not d!10519) (not bm!4035) (not b!56936) (not b!56944) (not bm!4057) (not bm!4016) (not d!10523) (not d!10513) (not b!57024) (not bm!4028) (not bm!4022) (not mapNonEmpty!2835))
(check-sat b_and!3431 b_and!3433 (not b_next!1937) (not b_next!1939))
