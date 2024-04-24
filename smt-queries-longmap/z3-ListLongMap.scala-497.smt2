; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11268 () Bool)

(assert start!11268)

(declare-fun b!92719 () Bool)

(declare-fun b_free!2353 () Bool)

(declare-fun b_next!2353 () Bool)

(assert (=> b!92719 (= b_free!2353 (not b_next!2353))))

(declare-fun tp!9320 () Bool)

(declare-fun b_and!5629 () Bool)

(assert (=> b!92719 (= tp!9320 b_and!5629)))

(declare-fun b!92729 () Bool)

(declare-fun b_free!2355 () Bool)

(declare-fun b_next!2355 () Bool)

(assert (=> b!92729 (= b_free!2355 (not b_next!2355))))

(declare-fun tp!9318 () Bool)

(declare-fun b_and!5631 () Bool)

(assert (=> b!92729 (= tp!9318 b_and!5631)))

(declare-fun b!92717 () Bool)

(declare-fun e!60477 () Bool)

(declare-fun tp_is_empty!2593 () Bool)

(assert (=> b!92717 (= e!60477 tp_is_empty!2593)))

(declare-fun b!92718 () Bool)

(declare-fun e!60465 () Bool)

(assert (=> b!92718 (= e!60465 tp_is_empty!2593)))

(declare-fun e!60466 () Bool)

(declare-datatypes ((V!3105 0))(
  ( (V!3106 (val!1341 Int)) )
))
(declare-datatypes ((array!4143 0))(
  ( (array!4144 (arr!1970 (Array (_ BitVec 32) (_ BitVec 64))) (size!2218 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!953 0))(
  ( (ValueCellFull!953 (v!2741 V!3105)) (EmptyCell!953) )
))
(declare-datatypes ((array!4145 0))(
  ( (array!4146 (arr!1971 (Array (_ BitVec 32) ValueCell!953)) (size!2219 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!814 0))(
  ( (LongMapFixedSize!815 (defaultEntry!2421 Int) (mask!6489 (_ BitVec 32)) (extraKeys!2250 (_ BitVec 32)) (zeroValue!2308 V!3105) (minValue!2308 V!3105) (_size!456 (_ BitVec 32)) (_keys!4103 array!4143) (_values!2404 array!4145) (_vacant!456 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!620 0))(
  ( (Cell!621 (v!2742 LongMapFixedSize!814)) )
))
(declare-datatypes ((LongMap!620 0))(
  ( (LongMap!621 (underlying!321 Cell!620)) )
))
(declare-fun thiss!992 () LongMap!620)

(declare-fun e!60473 () Bool)

(declare-fun array_inv!1215 (array!4143) Bool)

(declare-fun array_inv!1216 (array!4145) Bool)

(assert (=> b!92719 (= e!60473 (and tp!9320 tp_is_empty!2593 (array_inv!1215 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) (array_inv!1216 (_values!2404 (v!2742 (underlying!321 thiss!992)))) e!60466))))

(declare-fun b!92720 () Bool)

(declare-fun e!60467 () Bool)

(declare-fun e!60469 () Bool)

(assert (=> b!92720 (= e!60467 e!60469)))

(declare-fun res!47125 () Bool)

(assert (=> b!92720 (=> (not res!47125) (not e!60469))))

(declare-datatypes ((tuple2!2260 0))(
  ( (tuple2!2261 (_1!1141 Bool) (_2!1141 LongMapFixedSize!814)) )
))
(declare-fun lt!45607 () tuple2!2260)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!92720 (= res!47125 (and (_1!1141 lt!45607) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2755 0))(
  ( (Unit!2756) )
))
(declare-fun lt!45603 () Unit!2755)

(declare-fun e!60472 () Unit!2755)

(assert (=> b!92720 (= lt!45603 e!60472)))

(declare-fun c!15440 () Bool)

(declare-datatypes ((tuple2!2262 0))(
  ( (tuple2!2263 (_1!1142 (_ BitVec 64)) (_2!1142 V!3105)) )
))
(declare-datatypes ((List!1545 0))(
  ( (Nil!1542) (Cons!1541 (h!2133 tuple2!2262) (t!5403 List!1545)) )
))
(declare-datatypes ((ListLongMap!1479 0))(
  ( (ListLongMap!1480 (toList!755 List!1545)) )
))
(declare-fun lt!45599 () ListLongMap!1479)

(declare-fun contains!774 (ListLongMap!1479 (_ BitVec 64)) Bool)

(assert (=> b!92720 (= c!15440 (contains!774 lt!45599 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!814)

(declare-fun lt!45609 () V!3105)

(declare-fun update!138 (LongMapFixedSize!814 (_ BitVec 64) V!3105) tuple2!2260)

(assert (=> b!92720 (= lt!45607 (update!138 newMap!16 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) lt!45609))))

(declare-fun mapNonEmpty!3607 () Bool)

(declare-fun mapRes!3608 () Bool)

(declare-fun tp!9317 () Bool)

(assert (=> mapNonEmpty!3607 (= mapRes!3608 (and tp!9317 e!60465))))

(declare-fun mapKey!3608 () (_ BitVec 32))

(declare-fun mapValue!3607 () ValueCell!953)

(declare-fun mapRest!3607 () (Array (_ BitVec 32) ValueCell!953))

(assert (=> mapNonEmpty!3607 (= (arr!1971 (_values!2404 newMap!16)) (store mapRest!3607 mapKey!3608 mapValue!3607))))

(declare-fun b!92721 () Bool)

(declare-fun e!60480 () Bool)

(assert (=> b!92721 (= e!60480 true)))

(declare-fun lt!45610 () Bool)

(declare-fun lt!45600 () tuple2!2260)

(declare-fun valid!373 (LongMapFixedSize!814) Bool)

(assert (=> b!92721 (= lt!45610 (valid!373 (_2!1141 lt!45600)))))

(declare-fun mapIsEmpty!3607 () Bool)

(assert (=> mapIsEmpty!3607 mapRes!3608))

(declare-fun res!47128 () Bool)

(declare-fun e!60478 () Bool)

(assert (=> start!11268 (=> (not res!47128) (not e!60478))))

(declare-fun valid!374 (LongMap!620) Bool)

(assert (=> start!11268 (= res!47128 (valid!374 thiss!992))))

(assert (=> start!11268 e!60478))

(declare-fun e!60481 () Bool)

(assert (=> start!11268 e!60481))

(assert (=> start!11268 true))

(declare-fun e!60470 () Bool)

(assert (=> start!11268 e!60470))

(declare-fun b!92722 () Bool)

(declare-fun e!60464 () Bool)

(declare-fun mapRes!3607 () Bool)

(assert (=> b!92722 (= e!60466 (and e!60464 mapRes!3607))))

(declare-fun condMapEmpty!3607 () Bool)

(declare-fun mapDefault!3607 () ValueCell!953)

(assert (=> b!92722 (= condMapEmpty!3607 (= (arr!1971 (_values!2404 (v!2742 (underlying!321 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!953)) mapDefault!3607)))))

(declare-fun b!92723 () Bool)

(declare-fun e!60476 () Bool)

(assert (=> b!92723 (= e!60476 e!60473)))

(declare-fun b!92724 () Bool)

(declare-fun res!47124 () Bool)

(assert (=> b!92724 (=> (not res!47124) (not e!60478))))

(assert (=> b!92724 (= res!47124 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6489 newMap!16)) (_size!456 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun b!92725 () Bool)

(declare-fun Unit!2757 () Unit!2755)

(assert (=> b!92725 (= e!60472 Unit!2757)))

(declare-fun lt!45611 () Unit!2755)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!77 (array!4143 array!4145 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 64) (_ BitVec 32) Int) Unit!2755)

(assert (=> b!92725 (= lt!45611 (lemmaListMapContainsThenArrayContainsFrom!77 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (_values!2404 (v!2742 (underlying!321 thiss!992))) (mask!6489 (v!2742 (underlying!321 thiss!992))) (extraKeys!2250 (v!2742 (underlying!321 thiss!992))) (zeroValue!2308 (v!2742 (underlying!321 thiss!992))) (minValue!2308 (v!2742 (underlying!321 thiss!992))) (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92725 (arrayContainsKey!0 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45615 () Unit!2755)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4143 (_ BitVec 32) (_ BitVec 32)) Unit!2755)

(assert (=> b!92725 (= lt!45615 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4103 (v!2742 (underlying!321 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1546 0))(
  ( (Nil!1543) (Cons!1542 (h!2134 (_ BitVec 64)) (t!5404 List!1546)) )
))
(declare-fun arrayNoDuplicates!0 (array!4143 (_ BitVec 32) List!1546) Bool)

(assert (=> b!92725 (arrayNoDuplicates!0 (_keys!4103 (v!2742 (underlying!321 thiss!992))) from!355 Nil!1543)))

(declare-fun lt!45614 () Unit!2755)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4143 (_ BitVec 32) (_ BitVec 64) List!1546) Unit!2755)

(assert (=> b!92725 (= lt!45614 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) (Cons!1542 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) Nil!1543)))))

(assert (=> b!92725 false))

(declare-fun b!92726 () Bool)

(declare-fun Unit!2758 () Unit!2755)

(assert (=> b!92726 (= e!60472 Unit!2758)))

(declare-fun mapIsEmpty!3608 () Bool)

(assert (=> mapIsEmpty!3608 mapRes!3607))

(declare-fun b!92727 () Bool)

(declare-fun res!47123 () Bool)

(assert (=> b!92727 (=> (not res!47123) (not e!60478))))

(assert (=> b!92727 (= res!47123 (valid!373 newMap!16))))

(declare-fun b!92728 () Bool)

(declare-fun e!60474 () Bool)

(declare-fun e!60479 () Bool)

(assert (=> b!92728 (= e!60474 (and e!60479 mapRes!3608))))

(declare-fun condMapEmpty!3608 () Bool)

(declare-fun mapDefault!3608 () ValueCell!953)

(assert (=> b!92728 (= condMapEmpty!3608 (= (arr!1971 (_values!2404 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!953)) mapDefault!3608)))))

(assert (=> b!92729 (= e!60470 (and tp!9318 tp_is_empty!2593 (array_inv!1215 (_keys!4103 newMap!16)) (array_inv!1216 (_values!2404 newMap!16)) e!60474))))

(declare-fun mapNonEmpty!3608 () Bool)

(declare-fun tp!9319 () Bool)

(assert (=> mapNonEmpty!3608 (= mapRes!3607 (and tp!9319 e!60477))))

(declare-fun mapRest!3608 () (Array (_ BitVec 32) ValueCell!953))

(declare-fun mapKey!3607 () (_ BitVec 32))

(declare-fun mapValue!3608 () ValueCell!953)

(assert (=> mapNonEmpty!3608 (= (arr!1971 (_values!2404 (v!2742 (underlying!321 thiss!992)))) (store mapRest!3608 mapKey!3607 mapValue!3608))))

(declare-fun b!92730 () Bool)

(assert (=> b!92730 (= e!60464 tp_is_empty!2593)))

(declare-fun b!92731 () Bool)

(assert (=> b!92731 (= e!60479 tp_is_empty!2593)))

(declare-fun b!92732 () Bool)

(declare-fun res!47129 () Bool)

(assert (=> b!92732 (=> (not res!47129) (not e!60478))))

(assert (=> b!92732 (= res!47129 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2218 (_keys!4103 (v!2742 (underlying!321 thiss!992)))))))))

(declare-fun b!92733 () Bool)

(assert (=> b!92733 (= e!60481 e!60476)))

(declare-fun b!92734 () Bool)

(declare-fun e!60471 () Bool)

(assert (=> b!92734 (= e!60469 (not e!60471))))

(declare-fun res!47126 () Bool)

(assert (=> b!92734 (=> res!47126 e!60471)))

(declare-fun getCurrentListMap!445 (array!4143 array!4145 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1479)

(declare-fun map!1231 (LongMapFixedSize!814) ListLongMap!1479)

(assert (=> b!92734 (= res!47126 (not (= (getCurrentListMap!445 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (_values!2404 (v!2742 (underlying!321 thiss!992))) (mask!6489 (v!2742 (underlying!321 thiss!992))) (extraKeys!2250 (v!2742 (underlying!321 thiss!992))) (zeroValue!2308 (v!2742 (underlying!321 thiss!992))) (minValue!2308 (v!2742 (underlying!321 thiss!992))) from!355 (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))) (map!1231 (_2!1141 lt!45607)))))))

(declare-fun lt!45612 () ListLongMap!1479)

(declare-fun lt!45613 () tuple2!2262)

(declare-fun lt!45597 () tuple2!2262)

(declare-fun lt!45605 () ListLongMap!1479)

(declare-fun +!124 (ListLongMap!1479 tuple2!2262) ListLongMap!1479)

(assert (=> b!92734 (= (+!124 lt!45605 lt!45597) (+!124 (+!124 lt!45612 lt!45597) lt!45613))))

(assert (=> b!92734 (= lt!45597 (tuple2!2263 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun lt!45598 () Unit!2755)

(declare-fun addCommutativeForDiffKeys!44 (ListLongMap!1479 (_ BitVec 64) V!3105 (_ BitVec 64) V!3105) Unit!2755)

(assert (=> b!92734 (= lt!45598 (addCommutativeForDiffKeys!44 lt!45612 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) lt!45609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun lt!45601 () ListLongMap!1479)

(assert (=> b!92734 (= lt!45601 lt!45605)))

(assert (=> b!92734 (= lt!45605 (+!124 lt!45612 lt!45613))))

(declare-fun lt!45604 () ListLongMap!1479)

(declare-fun lt!45596 () tuple2!2262)

(assert (=> b!92734 (= lt!45601 (+!124 lt!45604 lt!45596))))

(declare-fun lt!45602 () ListLongMap!1479)

(assert (=> b!92734 (= lt!45612 (+!124 lt!45602 lt!45596))))

(assert (=> b!92734 (= lt!45596 (tuple2!2263 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2742 (underlying!321 thiss!992)))))))

(assert (=> b!92734 (= lt!45604 (+!124 lt!45602 lt!45613))))

(assert (=> b!92734 (= lt!45613 (tuple2!2263 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) lt!45609))))

(declare-fun lt!45608 () Unit!2755)

(assert (=> b!92734 (= lt!45608 (addCommutativeForDiffKeys!44 lt!45602 (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) lt!45609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!89 (array!4143 array!4145 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1479)

(assert (=> b!92734 (= lt!45602 (getCurrentListMapNoExtraKeys!89 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (_values!2404 (v!2742 (underlying!321 thiss!992))) (mask!6489 (v!2742 (underlying!321 thiss!992))) (extraKeys!2250 (v!2742 (underlying!321 thiss!992))) (zeroValue!2308 (v!2742 (underlying!321 thiss!992))) (minValue!2308 (v!2742 (underlying!321 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun b!92735 () Bool)

(assert (=> b!92735 (= e!60471 e!60480)))

(declare-fun res!47130 () Bool)

(assert (=> b!92735 (=> res!47130 e!60480)))

(assert (=> b!92735 (= res!47130 (not (_1!1141 lt!45600)))))

(declare-fun repackFrom!9 (LongMap!620 LongMapFixedSize!814 (_ BitVec 32)) tuple2!2260)

(assert (=> b!92735 (= lt!45600 (repackFrom!9 thiss!992 (_2!1141 lt!45607) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!92736 () Bool)

(declare-fun e!60475 () Bool)

(assert (=> b!92736 (= e!60478 e!60475)))

(declare-fun res!47127 () Bool)

(assert (=> b!92736 (=> (not res!47127) (not e!60475))))

(declare-fun lt!45606 () ListLongMap!1479)

(assert (=> b!92736 (= res!47127 (= lt!45606 lt!45599))))

(assert (=> b!92736 (= lt!45599 (map!1231 newMap!16))))

(assert (=> b!92736 (= lt!45606 (getCurrentListMap!445 (_keys!4103 (v!2742 (underlying!321 thiss!992))) (_values!2404 (v!2742 (underlying!321 thiss!992))) (mask!6489 (v!2742 (underlying!321 thiss!992))) (extraKeys!2250 (v!2742 (underlying!321 thiss!992))) (zeroValue!2308 (v!2742 (underlying!321 thiss!992))) (minValue!2308 (v!2742 (underlying!321 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))))))

(declare-fun b!92737 () Bool)

(assert (=> b!92737 (= e!60475 e!60467)))

(declare-fun res!47131 () Bool)

(assert (=> b!92737 (=> (not res!47131) (not e!60467))))

(assert (=> b!92737 (= res!47131 (and (not (= (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1970 (_keys!4103 (v!2742 (underlying!321 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1258 (ValueCell!953 V!3105) V!3105)

(declare-fun dynLambda!362 (Int (_ BitVec 64)) V!3105)

(assert (=> b!92737 (= lt!45609 (get!1258 (select (arr!1971 (_values!2404 (v!2742 (underlying!321 thiss!992)))) from!355) (dynLambda!362 (defaultEntry!2421 (v!2742 (underlying!321 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!11268 res!47128) b!92732))

(assert (= (and b!92732 res!47129) b!92727))

(assert (= (and b!92727 res!47123) b!92724))

(assert (= (and b!92724 res!47124) b!92736))

(assert (= (and b!92736 res!47127) b!92737))

(assert (= (and b!92737 res!47131) b!92720))

(assert (= (and b!92720 c!15440) b!92725))

(assert (= (and b!92720 (not c!15440)) b!92726))

(assert (= (and b!92720 res!47125) b!92734))

(assert (= (and b!92734 (not res!47126)) b!92735))

(assert (= (and b!92735 (not res!47130)) b!92721))

(assert (= (and b!92722 condMapEmpty!3607) mapIsEmpty!3608))

(assert (= (and b!92722 (not condMapEmpty!3607)) mapNonEmpty!3608))

(get-info :version)

(assert (= (and mapNonEmpty!3608 ((_ is ValueCellFull!953) mapValue!3608)) b!92717))

(assert (= (and b!92722 ((_ is ValueCellFull!953) mapDefault!3607)) b!92730))

(assert (= b!92719 b!92722))

(assert (= b!92723 b!92719))

(assert (= b!92733 b!92723))

(assert (= start!11268 b!92733))

(assert (= (and b!92728 condMapEmpty!3608) mapIsEmpty!3607))

(assert (= (and b!92728 (not condMapEmpty!3608)) mapNonEmpty!3607))

(assert (= (and mapNonEmpty!3607 ((_ is ValueCellFull!953) mapValue!3607)) b!92718))

(assert (= (and b!92728 ((_ is ValueCellFull!953) mapDefault!3608)) b!92731))

(assert (= b!92729 b!92728))

(assert (= start!11268 b!92729))

(declare-fun b_lambda!4093 () Bool)

(assert (=> (not b_lambda!4093) (not b!92737)))

(declare-fun t!5400 () Bool)

(declare-fun tb!1825 () Bool)

(assert (=> (and b!92719 (= (defaultEntry!2421 (v!2742 (underlying!321 thiss!992))) (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))) t!5400) tb!1825))

(declare-fun result!3119 () Bool)

(assert (=> tb!1825 (= result!3119 tp_is_empty!2593)))

(assert (=> b!92737 t!5400))

(declare-fun b_and!5633 () Bool)

(assert (= b_and!5629 (and (=> t!5400 result!3119) b_and!5633)))

(declare-fun tb!1827 () Bool)

(declare-fun t!5402 () Bool)

(assert (=> (and b!92729 (= (defaultEntry!2421 newMap!16) (defaultEntry!2421 (v!2742 (underlying!321 thiss!992)))) t!5402) tb!1827))

(declare-fun result!3123 () Bool)

(assert (= result!3123 result!3119))

(assert (=> b!92737 t!5402))

(declare-fun b_and!5635 () Bool)

(assert (= b_and!5631 (and (=> t!5402 result!3123) b_and!5635)))

(declare-fun m!100027 () Bool)

(assert (=> mapNonEmpty!3608 m!100027))

(declare-fun m!100029 () Bool)

(assert (=> b!92727 m!100029))

(declare-fun m!100031 () Bool)

(assert (=> b!92729 m!100031))

(declare-fun m!100033 () Bool)

(assert (=> b!92729 m!100033))

(declare-fun m!100035 () Bool)

(assert (=> start!11268 m!100035))

(declare-fun m!100037 () Bool)

(assert (=> b!92719 m!100037))

(declare-fun m!100039 () Bool)

(assert (=> b!92719 m!100039))

(declare-fun m!100041 () Bool)

(assert (=> b!92735 m!100041))

(declare-fun m!100043 () Bool)

(assert (=> mapNonEmpty!3607 m!100043))

(declare-fun m!100045 () Bool)

(assert (=> b!92734 m!100045))

(declare-fun m!100047 () Bool)

(assert (=> b!92734 m!100047))

(declare-fun m!100049 () Bool)

(assert (=> b!92734 m!100049))

(declare-fun m!100051 () Bool)

(assert (=> b!92734 m!100051))

(declare-fun m!100053 () Bool)

(assert (=> b!92734 m!100053))

(assert (=> b!92734 m!100053))

(declare-fun m!100055 () Bool)

(assert (=> b!92734 m!100055))

(declare-fun m!100057 () Bool)

(assert (=> b!92734 m!100057))

(declare-fun m!100059 () Bool)

(assert (=> b!92734 m!100059))

(declare-fun m!100061 () Bool)

(assert (=> b!92734 m!100061))

(declare-fun m!100063 () Bool)

(assert (=> b!92734 m!100063))

(assert (=> b!92734 m!100059))

(assert (=> b!92734 m!100053))

(declare-fun m!100065 () Bool)

(assert (=> b!92734 m!100065))

(declare-fun m!100067 () Bool)

(assert (=> b!92734 m!100067))

(declare-fun m!100069 () Bool)

(assert (=> b!92734 m!100069))

(assert (=> b!92720 m!100053))

(assert (=> b!92720 m!100053))

(declare-fun m!100071 () Bool)

(assert (=> b!92720 m!100071))

(assert (=> b!92720 m!100053))

(declare-fun m!100073 () Bool)

(assert (=> b!92720 m!100073))

(declare-fun m!100075 () Bool)

(assert (=> b!92721 m!100075))

(assert (=> b!92737 m!100053))

(declare-fun m!100077 () Bool)

(assert (=> b!92737 m!100077))

(declare-fun m!100079 () Bool)

(assert (=> b!92737 m!100079))

(assert (=> b!92737 m!100077))

(assert (=> b!92737 m!100079))

(declare-fun m!100081 () Bool)

(assert (=> b!92737 m!100081))

(declare-fun m!100083 () Bool)

(assert (=> b!92736 m!100083))

(declare-fun m!100085 () Bool)

(assert (=> b!92736 m!100085))

(declare-fun m!100087 () Bool)

(assert (=> b!92725 m!100087))

(declare-fun m!100089 () Bool)

(assert (=> b!92725 m!100089))

(assert (=> b!92725 m!100053))

(declare-fun m!100091 () Bool)

(assert (=> b!92725 m!100091))

(assert (=> b!92725 m!100053))

(assert (=> b!92725 m!100053))

(declare-fun m!100093 () Bool)

(assert (=> b!92725 m!100093))

(assert (=> b!92725 m!100053))

(declare-fun m!100095 () Bool)

(assert (=> b!92725 m!100095))

(check-sat (not b!92735) (not b!92720) tp_is_empty!2593 b_and!5635 (not b!92721) (not b!92736) (not b!92729) (not mapNonEmpty!3607) (not b!92727) (not start!11268) (not b_lambda!4093) (not b!92725) (not b!92737) b_and!5633 (not b!92734) (not b!92719) (not b_next!2355) (not b_next!2353) (not mapNonEmpty!3608))
(check-sat b_and!5633 b_and!5635 (not b_next!2353) (not b_next!2355))
