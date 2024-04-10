; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10144 () Bool)

(assert start!10144)

(declare-fun b!77374 () Bool)

(declare-fun b_free!2177 () Bool)

(declare-fun b_next!2177 () Bool)

(assert (=> b!77374 (= b_free!2177 (not b_next!2177))))

(declare-fun tp!8728 () Bool)

(declare-fun b_and!4755 () Bool)

(assert (=> b!77374 (= tp!8728 b_and!4755)))

(declare-fun b!77372 () Bool)

(declare-fun b_free!2179 () Bool)

(declare-fun b_next!2179 () Bool)

(assert (=> b!77372 (= b_free!2179 (not b_next!2179))))

(declare-fun tp!8730 () Bool)

(declare-fun b_and!4757 () Bool)

(assert (=> b!77372 (= tp!8730 b_and!4757)))

(declare-fun b!77370 () Bool)

(declare-fun res!40631 () Bool)

(declare-fun e!50591 () Bool)

(assert (=> b!77370 (=> (not res!40631) (not e!50591))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2987 0))(
  ( (V!2988 (val!1297 Int)) )
))
(declare-datatypes ((array!3961 0))(
  ( (array!3962 (arr!1889 (Array (_ BitVec 32) (_ BitVec 64))) (size!2130 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!909 0))(
  ( (ValueCellFull!909 (v!2583 V!2987)) (EmptyCell!909) )
))
(declare-datatypes ((array!3963 0))(
  ( (array!3964 (arr!1890 (Array (_ BitVec 32) ValueCell!909)) (size!2131 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!726 0))(
  ( (LongMapFixedSize!727 (defaultEntry!2266 Int) (mask!6259 (_ BitVec 32)) (extraKeys!2117 (_ BitVec 32)) (zeroValue!2164 V!2987) (minValue!2164 V!2987) (_size!412 (_ BitVec 32)) (_keys!3926 array!3961) (_values!2249 array!3963) (_vacant!412 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!528 0))(
  ( (Cell!529 (v!2584 LongMapFixedSize!726)) )
))
(declare-datatypes ((LongMap!528 0))(
  ( (LongMap!529 (underlying!275 Cell!528)) )
))
(declare-fun thiss!992 () LongMap!528)

(assert (=> b!77370 (= res!40631 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992)))))))))

(declare-fun b!77371 () Bool)

(declare-fun e!50596 () Bool)

(declare-fun tp_is_empty!2505 () Bool)

(assert (=> b!77371 (= e!50596 tp_is_empty!2505)))

(declare-fun e!50585 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!726)

(declare-fun e!50584 () Bool)

(declare-fun array_inv!1165 (array!3961) Bool)

(declare-fun array_inv!1166 (array!3963) Bool)

(assert (=> b!77372 (= e!50584 (and tp!8730 tp_is_empty!2505 (array_inv!1165 (_keys!3926 newMap!16)) (array_inv!1166 (_values!2249 newMap!16)) e!50585))))

(declare-fun b!77373 () Bool)

(declare-fun e!50594 () Bool)

(declare-fun e!50593 () Bool)

(assert (=> b!77373 (= e!50594 e!50593)))

(declare-fun res!40629 () Bool)

(assert (=> b!77373 (=> (not res!40629) (not e!50593))))

(declare-datatypes ((tuple2!2160 0))(
  ( (tuple2!2161 (_1!1091 Bool) (_2!1091 LongMapFixedSize!726)) )
))
(declare-fun lt!35468 () tuple2!2160)

(assert (=> b!77373 (= res!40629 (and (_1!1091 lt!35468) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2241 0))(
  ( (Unit!2242) )
))
(declare-fun lt!35466 () Unit!2241)

(declare-fun e!50595 () Unit!2241)

(assert (=> b!77373 (= lt!35466 e!50595)))

(declare-fun c!11805 () Bool)

(declare-datatypes ((tuple2!2162 0))(
  ( (tuple2!2163 (_1!1092 (_ BitVec 64)) (_2!1092 V!2987)) )
))
(declare-datatypes ((List!1501 0))(
  ( (Nil!1498) (Cons!1497 (h!2085 tuple2!2162) (t!5135 List!1501)) )
))
(declare-datatypes ((ListLongMap!1441 0))(
  ( (ListLongMap!1442 (toList!736 List!1501)) )
))
(declare-fun lt!35463 () ListLongMap!1441)

(declare-fun contains!737 (ListLongMap!1441 (_ BitVec 64)) Bool)

(assert (=> b!77373 (= c!11805 (contains!737 lt!35463 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun lt!35474 () V!2987)

(declare-fun update!104 (LongMapFixedSize!726 (_ BitVec 64) V!2987) tuple2!2160)

(assert (=> b!77373 (= lt!35468 (update!104 newMap!16 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474))))

(declare-fun e!50597 () Bool)

(declare-fun e!50590 () Bool)

(assert (=> b!77374 (= e!50597 (and tp!8728 tp_is_empty!2505 (array_inv!1165 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (array_inv!1166 (_values!2249 (v!2584 (underlying!275 thiss!992)))) e!50590))))

(declare-fun b!77375 () Bool)

(declare-fun e!50589 () Bool)

(declare-fun e!50582 () Bool)

(assert (=> b!77375 (= e!50589 e!50582)))

(declare-fun mapIsEmpty!3281 () Bool)

(declare-fun mapRes!3282 () Bool)

(assert (=> mapIsEmpty!3281 mapRes!3282))

(declare-fun b!77376 () Bool)

(declare-fun e!50592 () Bool)

(assert (=> b!77376 (= e!50592 tp_is_empty!2505)))

(declare-fun b!77377 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!77377 (= e!50593 (not (validMask!0 (mask!6259 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun lt!35472 () ListLongMap!1441)

(declare-fun lt!35477 () tuple2!2162)

(declare-fun lt!35475 () ListLongMap!1441)

(declare-fun lt!35465 () tuple2!2162)

(declare-fun +!102 (ListLongMap!1441 tuple2!2162) ListLongMap!1441)

(assert (=> b!77377 (= (+!102 lt!35472 lt!35465) (+!102 (+!102 lt!35475 lt!35465) lt!35477))))

(assert (=> b!77377 (= lt!35465 (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35469 () Unit!2241)

(declare-fun addCommutativeForDiffKeys!21 (ListLongMap!1441 (_ BitVec 64) V!2987 (_ BitVec 64) V!2987) Unit!2241)

(assert (=> b!77377 (= lt!35469 (addCommutativeForDiffKeys!21 lt!35475 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35476 () ListLongMap!1441)

(assert (=> b!77377 (= lt!35476 lt!35472)))

(assert (=> b!77377 (= lt!35472 (+!102 lt!35475 lt!35477))))

(declare-fun lt!35470 () ListLongMap!1441)

(declare-fun lt!35478 () tuple2!2162)

(assert (=> b!77377 (= lt!35476 (+!102 lt!35470 lt!35478))))

(declare-fun lt!35464 () ListLongMap!1441)

(assert (=> b!77377 (= lt!35475 (+!102 lt!35464 lt!35478))))

(assert (=> b!77377 (= lt!35478 (tuple2!2163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(assert (=> b!77377 (= lt!35470 (+!102 lt!35464 lt!35477))))

(assert (=> b!77377 (= lt!35477 (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474))))

(declare-fun lt!35473 () Unit!2241)

(assert (=> b!77377 (= lt!35473 (addCommutativeForDiffKeys!21 lt!35464 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!67 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 32) Int) ListLongMap!1441)

(assert (=> b!77377 (= lt!35464 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun b!77378 () Bool)

(assert (=> b!77378 (= e!50582 e!50597)))

(declare-fun b!77379 () Bool)

(declare-fun e!50588 () Bool)

(assert (=> b!77379 (= e!50588 tp_is_empty!2505)))

(declare-fun b!77380 () Bool)

(declare-fun mapRes!3281 () Bool)

(assert (=> b!77380 (= e!50590 (and e!50592 mapRes!3281))))

(declare-fun condMapEmpty!3281 () Bool)

(declare-fun mapDefault!3281 () ValueCell!909)

(assert (=> b!77380 (= condMapEmpty!3281 (= (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!909)) mapDefault!3281)))))

(declare-fun res!40633 () Bool)

(assert (=> start!10144 (=> (not res!40633) (not e!50591))))

(declare-fun valid!307 (LongMap!528) Bool)

(assert (=> start!10144 (= res!40633 (valid!307 thiss!992))))

(assert (=> start!10144 e!50591))

(assert (=> start!10144 e!50589))

(assert (=> start!10144 true))

(assert (=> start!10144 e!50584))

(declare-fun b!77381 () Bool)

(declare-fun e!50598 () Bool)

(assert (=> b!77381 (= e!50585 (and e!50598 mapRes!3282))))

(declare-fun condMapEmpty!3282 () Bool)

(declare-fun mapDefault!3282 () ValueCell!909)

(assert (=> b!77381 (= condMapEmpty!3282 (= (arr!1890 (_values!2249 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!909)) mapDefault!3282)))))

(declare-fun b!77382 () Bool)

(declare-fun Unit!2243 () Unit!2241)

(assert (=> b!77382 (= e!50595 Unit!2243)))

(declare-fun b!77383 () Bool)

(declare-fun e!50583 () Bool)

(assert (=> b!77383 (= e!50583 e!50594)))

(declare-fun res!40632 () Bool)

(assert (=> b!77383 (=> (not res!40632) (not e!50594))))

(assert (=> b!77383 (= res!40632 (and (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1167 (ValueCell!909 V!2987) V!2987)

(declare-fun dynLambda!334 (Int (_ BitVec 64)) V!2987)

(assert (=> b!77383 (= lt!35474 (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77384 () Bool)

(declare-fun res!40628 () Bool)

(assert (=> b!77384 (=> (not res!40628) (not e!50591))))

(assert (=> b!77384 (= res!40628 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6259 newMap!16)) (_size!412 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun mapIsEmpty!3282 () Bool)

(assert (=> mapIsEmpty!3282 mapRes!3281))

(declare-fun b!77385 () Bool)

(declare-fun Unit!2244 () Unit!2241)

(assert (=> b!77385 (= e!50595 Unit!2244)))

(declare-fun lt!35471 () Unit!2241)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!59 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 64) (_ BitVec 32) Int) Unit!2241)

(assert (=> b!77385 (= lt!35471 (lemmaListMapContainsThenArrayContainsFrom!59 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!77385 (arrayContainsKey!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35467 () Unit!2241)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3961 (_ BitVec 32) (_ BitVec 32)) Unit!2241)

(assert (=> b!77385 (= lt!35467 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1502 0))(
  ( (Nil!1499) (Cons!1498 (h!2086 (_ BitVec 64)) (t!5136 List!1502)) )
))
(declare-fun arrayNoDuplicates!0 (array!3961 (_ BitVec 32) List!1502) Bool)

(assert (=> b!77385 (arrayNoDuplicates!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) from!355 Nil!1499)))

(declare-fun lt!35479 () Unit!2241)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3961 (_ BitVec 32) (_ BitVec 64) List!1502) Unit!2241)

(assert (=> b!77385 (= lt!35479 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (Cons!1498 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) Nil!1499)))))

(assert (=> b!77385 false))

(declare-fun b!77386 () Bool)

(assert (=> b!77386 (= e!50591 e!50583)))

(declare-fun res!40630 () Bool)

(assert (=> b!77386 (=> (not res!40630) (not e!50583))))

(declare-fun lt!35462 () ListLongMap!1441)

(assert (=> b!77386 (= res!40630 (= lt!35462 lt!35463))))

(declare-fun map!1170 (LongMapFixedSize!726) ListLongMap!1441)

(assert (=> b!77386 (= lt!35463 (map!1170 newMap!16))))

(declare-fun getCurrentListMap!431 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 32) Int) ListLongMap!1441)

(assert (=> b!77386 (= lt!35462 (getCurrentListMap!431 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun b!77387 () Bool)

(declare-fun res!40627 () Bool)

(assert (=> b!77387 (=> (not res!40627) (not e!50591))))

(declare-fun valid!308 (LongMapFixedSize!726) Bool)

(assert (=> b!77387 (= res!40627 (valid!308 newMap!16))))

(declare-fun b!77388 () Bool)

(assert (=> b!77388 (= e!50598 tp_is_empty!2505)))

(declare-fun mapNonEmpty!3281 () Bool)

(declare-fun tp!8729 () Bool)

(assert (=> mapNonEmpty!3281 (= mapRes!3281 (and tp!8729 e!50596))))

(declare-fun mapKey!3282 () (_ BitVec 32))

(declare-fun mapRest!3281 () (Array (_ BitVec 32) ValueCell!909))

(declare-fun mapValue!3281 () ValueCell!909)

(assert (=> mapNonEmpty!3281 (= (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (store mapRest!3281 mapKey!3282 mapValue!3281))))

(declare-fun mapNonEmpty!3282 () Bool)

(declare-fun tp!8727 () Bool)

(assert (=> mapNonEmpty!3282 (= mapRes!3282 (and tp!8727 e!50588))))

(declare-fun mapRest!3282 () (Array (_ BitVec 32) ValueCell!909))

(declare-fun mapValue!3282 () ValueCell!909)

(declare-fun mapKey!3281 () (_ BitVec 32))

(assert (=> mapNonEmpty!3282 (= (arr!1890 (_values!2249 newMap!16)) (store mapRest!3282 mapKey!3281 mapValue!3282))))

(assert (= (and start!10144 res!40633) b!77370))

(assert (= (and b!77370 res!40631) b!77387))

(assert (= (and b!77387 res!40627) b!77384))

(assert (= (and b!77384 res!40628) b!77386))

(assert (= (and b!77386 res!40630) b!77383))

(assert (= (and b!77383 res!40632) b!77373))

(assert (= (and b!77373 c!11805) b!77385))

(assert (= (and b!77373 (not c!11805)) b!77382))

(assert (= (and b!77373 res!40629) b!77377))

(assert (= (and b!77380 condMapEmpty!3281) mapIsEmpty!3282))

(assert (= (and b!77380 (not condMapEmpty!3281)) mapNonEmpty!3281))

(get-info :version)

(assert (= (and mapNonEmpty!3281 ((_ is ValueCellFull!909) mapValue!3281)) b!77371))

(assert (= (and b!77380 ((_ is ValueCellFull!909) mapDefault!3281)) b!77376))

(assert (= b!77374 b!77380))

(assert (= b!77378 b!77374))

(assert (= b!77375 b!77378))

(assert (= start!10144 b!77375))

(assert (= (and b!77381 condMapEmpty!3282) mapIsEmpty!3281))

(assert (= (and b!77381 (not condMapEmpty!3282)) mapNonEmpty!3282))

(assert (= (and mapNonEmpty!3282 ((_ is ValueCellFull!909) mapValue!3282)) b!77379))

(assert (= (and b!77381 ((_ is ValueCellFull!909) mapDefault!3282)) b!77388))

(assert (= b!77372 b!77381))

(assert (= start!10144 b!77372))

(declare-fun b_lambda!3469 () Bool)

(assert (=> (not b_lambda!3469) (not b!77383)))

(declare-fun t!5132 () Bool)

(declare-fun tb!1605 () Bool)

(assert (=> (and b!77374 (= (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))) t!5132) tb!1605))

(declare-fun result!2791 () Bool)

(assert (=> tb!1605 (= result!2791 tp_is_empty!2505)))

(assert (=> b!77383 t!5132))

(declare-fun b_and!4759 () Bool)

(assert (= b_and!4755 (and (=> t!5132 result!2791) b_and!4759)))

(declare-fun tb!1607 () Bool)

(declare-fun t!5134 () Bool)

(assert (=> (and b!77372 (= (defaultEntry!2266 newMap!16) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))) t!5134) tb!1607))

(declare-fun result!2795 () Bool)

(assert (= result!2795 result!2791))

(assert (=> b!77383 t!5134))

(declare-fun b_and!4761 () Bool)

(assert (= b_and!4757 (and (=> t!5134 result!2795) b_and!4761)))

(declare-fun m!77491 () Bool)

(assert (=> mapNonEmpty!3281 m!77491))

(declare-fun m!77493 () Bool)

(assert (=> b!77387 m!77493))

(declare-fun m!77495 () Bool)

(assert (=> b!77386 m!77495))

(declare-fun m!77497 () Bool)

(assert (=> b!77386 m!77497))

(declare-fun m!77499 () Bool)

(assert (=> b!77372 m!77499))

(declare-fun m!77501 () Bool)

(assert (=> b!77372 m!77501))

(declare-fun m!77503 () Bool)

(assert (=> b!77374 m!77503))

(declare-fun m!77505 () Bool)

(assert (=> b!77374 m!77505))

(declare-fun m!77507 () Bool)

(assert (=> b!77385 m!77507))

(declare-fun m!77509 () Bool)

(assert (=> b!77385 m!77509))

(declare-fun m!77511 () Bool)

(assert (=> b!77385 m!77511))

(declare-fun m!77513 () Bool)

(assert (=> b!77385 m!77513))

(assert (=> b!77385 m!77511))

(assert (=> b!77385 m!77511))

(declare-fun m!77515 () Bool)

(assert (=> b!77385 m!77515))

(assert (=> b!77385 m!77511))

(declare-fun m!77517 () Bool)

(assert (=> b!77385 m!77517))

(assert (=> b!77383 m!77511))

(declare-fun m!77519 () Bool)

(assert (=> b!77383 m!77519))

(declare-fun m!77521 () Bool)

(assert (=> b!77383 m!77521))

(assert (=> b!77383 m!77519))

(assert (=> b!77383 m!77521))

(declare-fun m!77523 () Bool)

(assert (=> b!77383 m!77523))

(assert (=> b!77373 m!77511))

(assert (=> b!77373 m!77511))

(declare-fun m!77525 () Bool)

(assert (=> b!77373 m!77525))

(assert (=> b!77373 m!77511))

(declare-fun m!77527 () Bool)

(assert (=> b!77373 m!77527))

(declare-fun m!77529 () Bool)

(assert (=> mapNonEmpty!3282 m!77529))

(declare-fun m!77531 () Bool)

(assert (=> start!10144 m!77531))

(declare-fun m!77533 () Bool)

(assert (=> b!77377 m!77533))

(declare-fun m!77535 () Bool)

(assert (=> b!77377 m!77535))

(declare-fun m!77537 () Bool)

(assert (=> b!77377 m!77537))

(declare-fun m!77539 () Bool)

(assert (=> b!77377 m!77539))

(declare-fun m!77541 () Bool)

(assert (=> b!77377 m!77541))

(assert (=> b!77377 m!77511))

(assert (=> b!77377 m!77511))

(declare-fun m!77543 () Bool)

(assert (=> b!77377 m!77543))

(assert (=> b!77377 m!77541))

(declare-fun m!77545 () Bool)

(assert (=> b!77377 m!77545))

(declare-fun m!77547 () Bool)

(assert (=> b!77377 m!77547))

(declare-fun m!77549 () Bool)

(assert (=> b!77377 m!77549))

(assert (=> b!77377 m!77511))

(declare-fun m!77551 () Bool)

(assert (=> b!77377 m!77551))

(declare-fun m!77553 () Bool)

(assert (=> b!77377 m!77553))

(check-sat (not b_next!2179) (not b!77387) (not b!77383) (not b_next!2177) (not b!77373) (not b_lambda!3469) (not b!77372) (not mapNonEmpty!3281) (not mapNonEmpty!3282) (not start!10144) (not b!77385) b_and!4761 (not b!77377) tp_is_empty!2505 (not b!77386) b_and!4759 (not b!77374))
(check-sat b_and!4759 b_and!4761 (not b_next!2177) (not b_next!2179))
(get-model)

(declare-fun b_lambda!3473 () Bool)

(assert (= b_lambda!3469 (or (and b!77374 b_free!2177) (and b!77372 b_free!2179 (= (defaultEntry!2266 newMap!16) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))))) b_lambda!3473)))

(check-sat (not b_next!2179) (not b!77387) (not b!77383) (not b_next!2177) (not b!77373) (not mapNonEmpty!3281) (not mapNonEmpty!3282) (not start!10144) (not b!77385) b_and!4761 (not b!77377) tp_is_empty!2505 (not b!77386) b_and!4759 (not b!77374) (not b!77372) (not b_lambda!3473))
(check-sat b_and!4759 b_and!4761 (not b_next!2177) (not b_next!2179))
(get-model)

(declare-fun d!18369 () Bool)

(assert (=> d!18369 (= (map!1170 newMap!16) (getCurrentListMap!431 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2266 newMap!16)))))

(declare-fun bs!3295 () Bool)

(assert (= bs!3295 d!18369))

(declare-fun m!77619 () Bool)

(assert (=> bs!3295 m!77619))

(assert (=> b!77386 d!18369))

(declare-fun b!77492 () Bool)

(declare-fun c!11822 () Bool)

(assert (=> b!77492 (= c!11822 (and (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!50683 () ListLongMap!1441)

(declare-fun e!50680 () ListLongMap!1441)

(assert (=> b!77492 (= e!50683 e!50680)))

(declare-fun b!77493 () Bool)

(declare-fun e!50677 () Bool)

(declare-fun call!7001 () Bool)

(assert (=> b!77493 (= e!50677 (not call!7001))))

(declare-fun b!77494 () Bool)

(declare-fun e!50678 () Bool)

(declare-fun e!50687 () Bool)

(assert (=> b!77494 (= e!50678 e!50687)))

(declare-fun res!40673 () Bool)

(assert (=> b!77494 (=> (not res!40673) (not e!50687))))

(declare-fun lt!35581 () ListLongMap!1441)

(assert (=> b!77494 (= res!40673 (contains!737 lt!35581 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77494 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun b!77495 () Bool)

(declare-fun e!50676 () ListLongMap!1441)

(declare-fun call!7006 () ListLongMap!1441)

(assert (=> b!77495 (= e!50676 (+!102 call!7006 (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun b!77496 () Bool)

(declare-fun apply!78 (ListLongMap!1441 (_ BitVec 64)) V!2987)

(assert (=> b!77496 (= e!50687 (= (apply!78 lt!35581 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!77496 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2131 (_values!2249 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> b!77496 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun c!11823 () Bool)

(declare-fun c!11824 () Bool)

(declare-fun bm!6998 () Bool)

(declare-fun call!7003 () ListLongMap!1441)

(declare-fun call!7002 () ListLongMap!1441)

(declare-fun call!7004 () ListLongMap!1441)

(assert (=> bm!6998 (= call!7006 (+!102 (ite c!11824 call!7002 (ite c!11823 call!7004 call!7003)) (ite (or c!11824 c!11823) (tuple2!2163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))) (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992)))))))))

(declare-fun bm!6999 () Bool)

(assert (=> bm!6999 (= call!7001 (contains!737 lt!35581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7000 () Bool)

(declare-fun call!7005 () Bool)

(assert (=> bm!7000 (= call!7005 (contains!737 lt!35581 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7001 () Bool)

(assert (=> bm!7001 (= call!7004 call!7002)))

(declare-fun b!77497 () Bool)

(declare-fun e!50682 () Bool)

(assert (=> b!77497 (= e!50677 e!50682)))

(declare-fun res!40677 () Bool)

(assert (=> b!77497 (= res!40677 call!7001)))

(assert (=> b!77497 (=> (not res!40677) (not e!50682))))

(declare-fun bm!7002 () Bool)

(declare-fun call!7007 () ListLongMap!1441)

(assert (=> bm!7002 (= call!7007 call!7006)))

(declare-fun b!77498 () Bool)

(declare-fun e!50686 () Unit!2241)

(declare-fun lt!35592 () Unit!2241)

(assert (=> b!77498 (= e!50686 lt!35592)))

(declare-fun lt!35588 () ListLongMap!1441)

(assert (=> b!77498 (= lt!35588 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35584 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35584 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35579 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35579 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35595 () Unit!2241)

(declare-fun addStillContains!54 (ListLongMap!1441 (_ BitVec 64) V!2987 (_ BitVec 64)) Unit!2241)

(assert (=> b!77498 (= lt!35595 (addStillContains!54 lt!35588 lt!35584 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) lt!35579))))

(assert (=> b!77498 (contains!737 (+!102 lt!35588 (tuple2!2163 lt!35584 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))))) lt!35579)))

(declare-fun lt!35599 () Unit!2241)

(assert (=> b!77498 (= lt!35599 lt!35595)))

(declare-fun lt!35582 () ListLongMap!1441)

(assert (=> b!77498 (= lt!35582 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35593 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35593 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35596 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35596 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35583 () Unit!2241)

(declare-fun addApplyDifferent!54 (ListLongMap!1441 (_ BitVec 64) V!2987 (_ BitVec 64)) Unit!2241)

(assert (=> b!77498 (= lt!35583 (addApplyDifferent!54 lt!35582 lt!35593 (minValue!2164 (v!2584 (underlying!275 thiss!992))) lt!35596))))

(assert (=> b!77498 (= (apply!78 (+!102 lt!35582 (tuple2!2163 lt!35593 (minValue!2164 (v!2584 (underlying!275 thiss!992))))) lt!35596) (apply!78 lt!35582 lt!35596))))

(declare-fun lt!35578 () Unit!2241)

(assert (=> b!77498 (= lt!35578 lt!35583)))

(declare-fun lt!35598 () ListLongMap!1441)

(assert (=> b!77498 (= lt!35598 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35590 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35589 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35589 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35580 () Unit!2241)

(assert (=> b!77498 (= lt!35580 (addApplyDifferent!54 lt!35598 lt!35590 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) lt!35589))))

(assert (=> b!77498 (= (apply!78 (+!102 lt!35598 (tuple2!2163 lt!35590 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))))) lt!35589) (apply!78 lt!35598 lt!35589))))

(declare-fun lt!35586 () Unit!2241)

(assert (=> b!77498 (= lt!35586 lt!35580)))

(declare-fun lt!35594 () ListLongMap!1441)

(assert (=> b!77498 (= lt!35594 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun lt!35591 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!35587 () (_ BitVec 64))

(assert (=> b!77498 (= lt!35587 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!77498 (= lt!35592 (addApplyDifferent!54 lt!35594 lt!35591 (minValue!2164 (v!2584 (underlying!275 thiss!992))) lt!35587))))

(assert (=> b!77498 (= (apply!78 (+!102 lt!35594 (tuple2!2163 lt!35591 (minValue!2164 (v!2584 (underlying!275 thiss!992))))) lt!35587) (apply!78 lt!35594 lt!35587))))

(declare-fun b!77500 () Bool)

(declare-fun res!40679 () Bool)

(declare-fun e!50679 () Bool)

(assert (=> b!77500 (=> (not res!40679) (not e!50679))))

(assert (=> b!77500 (= res!40679 e!50677)))

(declare-fun c!11825 () Bool)

(assert (=> b!77500 (= c!11825 (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!77501 () Bool)

(declare-fun e!50685 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!77501 (= e!50685 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77502 () Bool)

(assert (=> b!77502 (= e!50680 call!7007)))

(declare-fun bm!7003 () Bool)

(assert (=> bm!7003 (= call!7002 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun b!77503 () Bool)

(assert (=> b!77503 (= e!50676 e!50683)))

(assert (=> b!77503 (= c!11823 (and (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!77504 () Bool)

(declare-fun e!50688 () Bool)

(declare-fun e!50681 () Bool)

(assert (=> b!77504 (= e!50688 e!50681)))

(declare-fun res!40675 () Bool)

(assert (=> b!77504 (= res!40675 call!7005)))

(assert (=> b!77504 (=> (not res!40675) (not e!50681))))

(declare-fun b!77505 () Bool)

(declare-fun Unit!2249 () Unit!2241)

(assert (=> b!77505 (= e!50686 Unit!2249)))

(declare-fun b!77506 () Bool)

(assert (=> b!77506 (= e!50679 e!50688)))

(declare-fun c!11821 () Bool)

(assert (=> b!77506 (= c!11821 (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!77507 () Bool)

(assert (=> b!77507 (= e!50688 (not call!7005))))

(declare-fun b!77508 () Bool)

(assert (=> b!77508 (= e!50683 call!7007)))

(declare-fun b!77509 () Bool)

(assert (=> b!77509 (= e!50681 (= (apply!78 lt!35581 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun b!77499 () Bool)

(declare-fun res!40676 () Bool)

(assert (=> b!77499 (=> (not res!40676) (not e!50679))))

(assert (=> b!77499 (= res!40676 e!50678)))

(declare-fun res!40674 () Bool)

(assert (=> b!77499 (=> res!40674 e!50678)))

(assert (=> b!77499 (= res!40674 (not e!50685))))

(declare-fun res!40678 () Bool)

(assert (=> b!77499 (=> (not res!40678) (not e!50685))))

(assert (=> b!77499 (= res!40678 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun d!18371 () Bool)

(assert (=> d!18371 e!50679))

(declare-fun res!40680 () Bool)

(assert (=> d!18371 (=> (not res!40680) (not e!50679))))

(assert (=> d!18371 (= res!40680 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))))

(declare-fun lt!35585 () ListLongMap!1441)

(assert (=> d!18371 (= lt!35581 lt!35585)))

(declare-fun lt!35597 () Unit!2241)

(assert (=> d!18371 (= lt!35597 e!50686)))

(declare-fun c!11826 () Bool)

(declare-fun e!50684 () Bool)

(assert (=> d!18371 (= c!11826 e!50684)))

(declare-fun res!40681 () Bool)

(assert (=> d!18371 (=> (not res!40681) (not e!50684))))

(assert (=> d!18371 (= res!40681 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> d!18371 (= lt!35585 e!50676)))

(assert (=> d!18371 (= c!11824 (and (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18371 (validMask!0 (mask!6259 (v!2584 (underlying!275 thiss!992))))))

(assert (=> d!18371 (= (getCurrentListMap!431 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))) lt!35581)))

(declare-fun b!77510 () Bool)

(assert (=> b!77510 (= e!50680 call!7003)))

(declare-fun b!77511 () Bool)

(assert (=> b!77511 (= e!50682 (= (apply!78 lt!35581 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun bm!7004 () Bool)

(assert (=> bm!7004 (= call!7003 call!7004)))

(declare-fun b!77512 () Bool)

(assert (=> b!77512 (= e!50684 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!18371 c!11824) b!77495))

(assert (= (and d!18371 (not c!11824)) b!77503))

(assert (= (and b!77503 c!11823) b!77508))

(assert (= (and b!77503 (not c!11823)) b!77492))

(assert (= (and b!77492 c!11822) b!77502))

(assert (= (and b!77492 (not c!11822)) b!77510))

(assert (= (or b!77502 b!77510) bm!7004))

(assert (= (or b!77508 bm!7004) bm!7001))

(assert (= (or b!77508 b!77502) bm!7002))

(assert (= (or b!77495 bm!7001) bm!7003))

(assert (= (or b!77495 bm!7002) bm!6998))

(assert (= (and d!18371 res!40681) b!77512))

(assert (= (and d!18371 c!11826) b!77498))

(assert (= (and d!18371 (not c!11826)) b!77505))

(assert (= (and d!18371 res!40680) b!77499))

(assert (= (and b!77499 res!40678) b!77501))

(assert (= (and b!77499 (not res!40674)) b!77494))

(assert (= (and b!77494 res!40673) b!77496))

(assert (= (and b!77499 res!40676) b!77500))

(assert (= (and b!77500 c!11825) b!77497))

(assert (= (and b!77500 (not c!11825)) b!77493))

(assert (= (and b!77497 res!40677) b!77511))

(assert (= (or b!77497 b!77493) bm!6999))

(assert (= (and b!77500 res!40679) b!77506))

(assert (= (and b!77506 c!11821) b!77504))

(assert (= (and b!77506 (not c!11821)) b!77507))

(assert (= (and b!77504 res!40675) b!77509))

(assert (= (or b!77504 b!77507) bm!7000))

(declare-fun b_lambda!3475 () Bool)

(assert (=> (not b_lambda!3475) (not b!77496)))

(assert (=> b!77496 t!5132))

(declare-fun b_and!4771 () Bool)

(assert (= b_and!4759 (and (=> t!5132 result!2791) b_and!4771)))

(assert (=> b!77496 t!5134))

(declare-fun b_and!4773 () Bool)

(assert (= b_and!4761 (and (=> t!5134 result!2795) b_and!4773)))

(declare-fun m!77621 () Bool)

(assert (=> b!77511 m!77621))

(declare-fun m!77623 () Bool)

(assert (=> b!77501 m!77623))

(assert (=> b!77501 m!77623))

(declare-fun m!77625 () Bool)

(assert (=> b!77501 m!77625))

(declare-fun m!77627 () Bool)

(assert (=> b!77495 m!77627))

(assert (=> b!77494 m!77623))

(assert (=> b!77494 m!77623))

(declare-fun m!77629 () Bool)

(assert (=> b!77494 m!77629))

(assert (=> b!77512 m!77623))

(assert (=> b!77512 m!77623))

(assert (=> b!77512 m!77625))

(declare-fun m!77631 () Bool)

(assert (=> bm!6999 m!77631))

(assert (=> bm!7003 m!77553))

(declare-fun m!77633 () Bool)

(assert (=> bm!6998 m!77633))

(declare-fun m!77635 () Bool)

(assert (=> b!77509 m!77635))

(assert (=> d!18371 m!77537))

(assert (=> b!77496 m!77623))

(declare-fun m!77637 () Bool)

(assert (=> b!77496 m!77637))

(assert (=> b!77496 m!77521))

(declare-fun m!77639 () Bool)

(assert (=> b!77496 m!77639))

(assert (=> b!77496 m!77521))

(declare-fun m!77641 () Bool)

(assert (=> b!77496 m!77641))

(assert (=> b!77496 m!77623))

(assert (=> b!77496 m!77639))

(declare-fun m!77643 () Bool)

(assert (=> b!77498 m!77643))

(declare-fun m!77645 () Bool)

(assert (=> b!77498 m!77645))

(assert (=> b!77498 m!77643))

(declare-fun m!77647 () Bool)

(assert (=> b!77498 m!77647))

(declare-fun m!77649 () Bool)

(assert (=> b!77498 m!77649))

(assert (=> b!77498 m!77553))

(declare-fun m!77651 () Bool)

(assert (=> b!77498 m!77651))

(declare-fun m!77653 () Bool)

(assert (=> b!77498 m!77653))

(declare-fun m!77655 () Bool)

(assert (=> b!77498 m!77655))

(declare-fun m!77657 () Bool)

(assert (=> b!77498 m!77657))

(declare-fun m!77659 () Bool)

(assert (=> b!77498 m!77659))

(declare-fun m!77661 () Bool)

(assert (=> b!77498 m!77661))

(declare-fun m!77663 () Bool)

(assert (=> b!77498 m!77663))

(declare-fun m!77665 () Bool)

(assert (=> b!77498 m!77665))

(assert (=> b!77498 m!77623))

(assert (=> b!77498 m!77651))

(declare-fun m!77667 () Bool)

(assert (=> b!77498 m!77667))

(assert (=> b!77498 m!77659))

(declare-fun m!77669 () Bool)

(assert (=> b!77498 m!77669))

(assert (=> b!77498 m!77663))

(declare-fun m!77671 () Bool)

(assert (=> b!77498 m!77671))

(declare-fun m!77673 () Bool)

(assert (=> bm!7000 m!77673))

(assert (=> b!77386 d!18371))

(declare-fun d!18373 () Bool)

(assert (=> d!18373 (= (array_inv!1165 (_keys!3926 newMap!16)) (bvsge (size!2130 (_keys!3926 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77372 d!18373))

(declare-fun d!18375 () Bool)

(assert (=> d!18375 (= (array_inv!1166 (_values!2249 newMap!16)) (bvsge (size!2131 (_values!2249 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!77372 d!18375))

(declare-fun d!18377 () Bool)

(declare-fun e!50691 () Bool)

(assert (=> d!18377 e!50691))

(declare-fun res!40686 () Bool)

(assert (=> d!18377 (=> (not res!40686) (not e!50691))))

(declare-fun lt!35609 () ListLongMap!1441)

(assert (=> d!18377 (= res!40686 (contains!737 lt!35609 (_1!1092 lt!35477)))))

(declare-fun lt!35610 () List!1501)

(assert (=> d!18377 (= lt!35609 (ListLongMap!1442 lt!35610))))

(declare-fun lt!35611 () Unit!2241)

(declare-fun lt!35608 () Unit!2241)

(assert (=> d!18377 (= lt!35611 lt!35608)))

(declare-datatypes ((Option!142 0))(
  ( (Some!141 (v!2588 V!2987)) (None!140) )
))
(declare-fun getValueByKey!136 (List!1501 (_ BitVec 64)) Option!142)

(assert (=> d!18377 (= (getValueByKey!136 lt!35610 (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477)))))

(declare-fun lemmaContainsTupThenGetReturnValue!53 (List!1501 (_ BitVec 64) V!2987) Unit!2241)

(assert (=> d!18377 (= lt!35608 (lemmaContainsTupThenGetReturnValue!53 lt!35610 (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(declare-fun insertStrictlySorted!56 (List!1501 (_ BitVec 64) V!2987) List!1501)

(assert (=> d!18377 (= lt!35610 (insertStrictlySorted!56 (toList!736 (+!102 lt!35475 lt!35465)) (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(assert (=> d!18377 (= (+!102 (+!102 lt!35475 lt!35465) lt!35477) lt!35609)))

(declare-fun b!77517 () Bool)

(declare-fun res!40687 () Bool)

(assert (=> b!77517 (=> (not res!40687) (not e!50691))))

(assert (=> b!77517 (= res!40687 (= (getValueByKey!136 (toList!736 lt!35609) (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477))))))

(declare-fun b!77518 () Bool)

(declare-fun contains!739 (List!1501 tuple2!2162) Bool)

(assert (=> b!77518 (= e!50691 (contains!739 (toList!736 lt!35609) lt!35477))))

(assert (= (and d!18377 res!40686) b!77517))

(assert (= (and b!77517 res!40687) b!77518))

(declare-fun m!77675 () Bool)

(assert (=> d!18377 m!77675))

(declare-fun m!77677 () Bool)

(assert (=> d!18377 m!77677))

(declare-fun m!77679 () Bool)

(assert (=> d!18377 m!77679))

(declare-fun m!77681 () Bool)

(assert (=> d!18377 m!77681))

(declare-fun m!77683 () Bool)

(assert (=> b!77517 m!77683))

(declare-fun m!77685 () Bool)

(assert (=> b!77518 m!77685))

(assert (=> b!77377 d!18377))

(declare-fun b!77543 () Bool)

(declare-fun lt!35626 () Unit!2241)

(declare-fun lt!35627 () Unit!2241)

(assert (=> b!77543 (= lt!35626 lt!35627)))

(declare-fun lt!35631 () V!2987)

(declare-fun lt!35629 () (_ BitVec 64))

(declare-fun lt!35628 () ListLongMap!1441)

(declare-fun lt!35632 () (_ BitVec 64))

(assert (=> b!77543 (not (contains!737 (+!102 lt!35628 (tuple2!2163 lt!35629 lt!35631)) lt!35632))))

(declare-fun addStillNotContains!27 (ListLongMap!1441 (_ BitVec 64) V!2987 (_ BitVec 64)) Unit!2241)

(assert (=> b!77543 (= lt!35627 (addStillNotContains!27 lt!35628 lt!35629 lt!35631 lt!35632))))

(assert (=> b!77543 (= lt!35632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!77543 (= lt!35631 (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77543 (= lt!35629 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!7010 () ListLongMap!1441)

(assert (=> b!77543 (= lt!35628 call!7010)))

(declare-fun e!50710 () ListLongMap!1441)

(assert (=> b!77543 (= e!50710 (+!102 call!7010 (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!77544 () Bool)

(declare-fun e!50706 () Bool)

(declare-fun e!50709 () Bool)

(assert (=> b!77544 (= e!50706 e!50709)))

(assert (=> b!77544 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun res!40697 () Bool)

(declare-fun lt!35630 () ListLongMap!1441)

(assert (=> b!77544 (= res!40697 (contains!737 lt!35630 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77544 (=> (not res!40697) (not e!50709))))

(declare-fun b!77545 () Bool)

(declare-fun e!50707 () ListLongMap!1441)

(assert (=> b!77545 (= e!50707 (ListLongMap!1442 Nil!1498))))

(declare-fun b!77546 () Bool)

(assert (=> b!77546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> b!77546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2131 (_values!2249 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> b!77546 (= e!50709 (= (apply!78 lt!35630 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!77547 () Bool)

(assert (=> b!77547 (= e!50710 call!7010)))

(declare-fun d!18379 () Bool)

(declare-fun e!50711 () Bool)

(assert (=> d!18379 e!50711))

(declare-fun res!40699 () Bool)

(assert (=> d!18379 (=> (not res!40699) (not e!50711))))

(assert (=> d!18379 (= res!40699 (not (contains!737 lt!35630 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18379 (= lt!35630 e!50707)))

(declare-fun c!11837 () Bool)

(assert (=> d!18379 (= c!11837 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> d!18379 (validMask!0 (mask!6259 (v!2584 (underlying!275 thiss!992))))))

(assert (=> d!18379 (= (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))) lt!35630)))

(declare-fun b!77548 () Bool)

(declare-fun res!40696 () Bool)

(assert (=> b!77548 (=> (not res!40696) (not e!50711))))

(assert (=> b!77548 (= res!40696 (not (contains!737 lt!35630 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!7007 () Bool)

(assert (=> bm!7007 (= call!7010 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(declare-fun b!77549 () Bool)

(declare-fun e!50712 () Bool)

(declare-fun isEmpty!325 (ListLongMap!1441) Bool)

(assert (=> b!77549 (= e!50712 (isEmpty!325 lt!35630))))

(declare-fun b!77550 () Bool)

(assert (=> b!77550 (= e!50712 (= lt!35630 (getCurrentListMapNoExtraKeys!67 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun b!77551 () Bool)

(assert (=> b!77551 (= e!50707 e!50710)))

(declare-fun c!11835 () Bool)

(assert (=> b!77551 (= c!11835 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!77552 () Bool)

(declare-fun e!50708 () Bool)

(assert (=> b!77552 (= e!50708 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!77552 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!77553 () Bool)

(assert (=> b!77553 (= e!50706 e!50712)))

(declare-fun c!11836 () Bool)

(assert (=> b!77553 (= c!11836 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun b!77554 () Bool)

(assert (=> b!77554 (= e!50711 e!50706)))

(declare-fun c!11838 () Bool)

(assert (=> b!77554 (= c!11838 e!50708)))

(declare-fun res!40698 () Bool)

(assert (=> b!77554 (=> (not res!40698) (not e!50708))))

(assert (=> b!77554 (= res!40698 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(assert (= (and d!18379 c!11837) b!77545))

(assert (= (and d!18379 (not c!11837)) b!77551))

(assert (= (and b!77551 c!11835) b!77543))

(assert (= (and b!77551 (not c!11835)) b!77547))

(assert (= (or b!77543 b!77547) bm!7007))

(assert (= (and d!18379 res!40699) b!77548))

(assert (= (and b!77548 res!40696) b!77554))

(assert (= (and b!77554 res!40698) b!77552))

(assert (= (and b!77554 c!11838) b!77544))

(assert (= (and b!77554 (not c!11838)) b!77553))

(assert (= (and b!77544 res!40697) b!77546))

(assert (= (and b!77553 c!11836) b!77550))

(assert (= (and b!77553 (not c!11836)) b!77549))

(declare-fun b_lambda!3477 () Bool)

(assert (=> (not b_lambda!3477) (not b!77543)))

(assert (=> b!77543 t!5132))

(declare-fun b_and!4775 () Bool)

(assert (= b_and!4771 (and (=> t!5132 result!2791) b_and!4775)))

(assert (=> b!77543 t!5134))

(declare-fun b_and!4777 () Bool)

(assert (= b_and!4773 (and (=> t!5134 result!2795) b_and!4777)))

(declare-fun b_lambda!3479 () Bool)

(assert (=> (not b_lambda!3479) (not b!77546)))

(assert (=> b!77546 t!5132))

(declare-fun b_and!4779 () Bool)

(assert (= b_and!4775 (and (=> t!5132 result!2791) b_and!4779)))

(assert (=> b!77546 t!5134))

(declare-fun b_and!4781 () Bool)

(assert (= b_and!4777 (and (=> t!5134 result!2795) b_and!4781)))

(assert (=> b!77551 m!77623))

(assert (=> b!77551 m!77623))

(assert (=> b!77551 m!77625))

(assert (=> b!77544 m!77623))

(assert (=> b!77544 m!77623))

(declare-fun m!77687 () Bool)

(assert (=> b!77544 m!77687))

(declare-fun m!77689 () Bool)

(assert (=> d!18379 m!77689))

(assert (=> d!18379 m!77537))

(declare-fun m!77691 () Bool)

(assert (=> b!77548 m!77691))

(assert (=> b!77546 m!77623))

(declare-fun m!77693 () Bool)

(assert (=> b!77546 m!77693))

(assert (=> b!77546 m!77521))

(assert (=> b!77546 m!77639))

(assert (=> b!77546 m!77623))

(assert (=> b!77546 m!77639))

(assert (=> b!77546 m!77521))

(assert (=> b!77546 m!77641))

(declare-fun m!77695 () Bool)

(assert (=> bm!7007 m!77695))

(declare-fun m!77697 () Bool)

(assert (=> b!77549 m!77697))

(assert (=> b!77550 m!77695))

(assert (=> b!77552 m!77623))

(assert (=> b!77552 m!77623))

(assert (=> b!77552 m!77625))

(declare-fun m!77699 () Bool)

(assert (=> b!77543 m!77699))

(assert (=> b!77543 m!77699))

(declare-fun m!77701 () Bool)

(assert (=> b!77543 m!77701))

(assert (=> b!77543 m!77521))

(declare-fun m!77703 () Bool)

(assert (=> b!77543 m!77703))

(assert (=> b!77543 m!77623))

(assert (=> b!77543 m!77639))

(assert (=> b!77543 m!77521))

(assert (=> b!77543 m!77641))

(assert (=> b!77543 m!77639))

(declare-fun m!77705 () Bool)

(assert (=> b!77543 m!77705))

(assert (=> b!77377 d!18379))

(declare-fun d!18381 () Bool)

(declare-fun e!50713 () Bool)

(assert (=> d!18381 e!50713))

(declare-fun res!40700 () Bool)

(assert (=> d!18381 (=> (not res!40700) (not e!50713))))

(declare-fun lt!35634 () ListLongMap!1441)

(assert (=> d!18381 (= res!40700 (contains!737 lt!35634 (_1!1092 lt!35477)))))

(declare-fun lt!35635 () List!1501)

(assert (=> d!18381 (= lt!35634 (ListLongMap!1442 lt!35635))))

(declare-fun lt!35636 () Unit!2241)

(declare-fun lt!35633 () Unit!2241)

(assert (=> d!18381 (= lt!35636 lt!35633)))

(assert (=> d!18381 (= (getValueByKey!136 lt!35635 (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477)))))

(assert (=> d!18381 (= lt!35633 (lemmaContainsTupThenGetReturnValue!53 lt!35635 (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(assert (=> d!18381 (= lt!35635 (insertStrictlySorted!56 (toList!736 lt!35475) (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(assert (=> d!18381 (= (+!102 lt!35475 lt!35477) lt!35634)))

(declare-fun b!77555 () Bool)

(declare-fun res!40701 () Bool)

(assert (=> b!77555 (=> (not res!40701) (not e!50713))))

(assert (=> b!77555 (= res!40701 (= (getValueByKey!136 (toList!736 lt!35634) (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477))))))

(declare-fun b!77556 () Bool)

(assert (=> b!77556 (= e!50713 (contains!739 (toList!736 lt!35634) lt!35477))))

(assert (= (and d!18381 res!40700) b!77555))

(assert (= (and b!77555 res!40701) b!77556))

(declare-fun m!77707 () Bool)

(assert (=> d!18381 m!77707))

(declare-fun m!77709 () Bool)

(assert (=> d!18381 m!77709))

(declare-fun m!77711 () Bool)

(assert (=> d!18381 m!77711))

(declare-fun m!77713 () Bool)

(assert (=> d!18381 m!77713))

(declare-fun m!77715 () Bool)

(assert (=> b!77555 m!77715))

(declare-fun m!77717 () Bool)

(assert (=> b!77556 m!77717))

(assert (=> b!77377 d!18381))

(declare-fun d!18383 () Bool)

(declare-fun e!50714 () Bool)

(assert (=> d!18383 e!50714))

(declare-fun res!40702 () Bool)

(assert (=> d!18383 (=> (not res!40702) (not e!50714))))

(declare-fun lt!35638 () ListLongMap!1441)

(assert (=> d!18383 (= res!40702 (contains!737 lt!35638 (_1!1092 lt!35477)))))

(declare-fun lt!35639 () List!1501)

(assert (=> d!18383 (= lt!35638 (ListLongMap!1442 lt!35639))))

(declare-fun lt!35640 () Unit!2241)

(declare-fun lt!35637 () Unit!2241)

(assert (=> d!18383 (= lt!35640 lt!35637)))

(assert (=> d!18383 (= (getValueByKey!136 lt!35639 (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477)))))

(assert (=> d!18383 (= lt!35637 (lemmaContainsTupThenGetReturnValue!53 lt!35639 (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(assert (=> d!18383 (= lt!35639 (insertStrictlySorted!56 (toList!736 lt!35464) (_1!1092 lt!35477) (_2!1092 lt!35477)))))

(assert (=> d!18383 (= (+!102 lt!35464 lt!35477) lt!35638)))

(declare-fun b!77557 () Bool)

(declare-fun res!40703 () Bool)

(assert (=> b!77557 (=> (not res!40703) (not e!50714))))

(assert (=> b!77557 (= res!40703 (= (getValueByKey!136 (toList!736 lt!35638) (_1!1092 lt!35477)) (Some!141 (_2!1092 lt!35477))))))

(declare-fun b!77558 () Bool)

(assert (=> b!77558 (= e!50714 (contains!739 (toList!736 lt!35638) lt!35477))))

(assert (= (and d!18383 res!40702) b!77557))

(assert (= (and b!77557 res!40703) b!77558))

(declare-fun m!77719 () Bool)

(assert (=> d!18383 m!77719))

(declare-fun m!77721 () Bool)

(assert (=> d!18383 m!77721))

(declare-fun m!77723 () Bool)

(assert (=> d!18383 m!77723))

(declare-fun m!77725 () Bool)

(assert (=> d!18383 m!77725))

(declare-fun m!77727 () Bool)

(assert (=> b!77557 m!77727))

(declare-fun m!77729 () Bool)

(assert (=> b!77558 m!77729))

(assert (=> b!77377 d!18383))

(declare-fun d!18385 () Bool)

(declare-fun e!50715 () Bool)

(assert (=> d!18385 e!50715))

(declare-fun res!40704 () Bool)

(assert (=> d!18385 (=> (not res!40704) (not e!50715))))

(declare-fun lt!35642 () ListLongMap!1441)

(assert (=> d!18385 (= res!40704 (contains!737 lt!35642 (_1!1092 lt!35465)))))

(declare-fun lt!35643 () List!1501)

(assert (=> d!18385 (= lt!35642 (ListLongMap!1442 lt!35643))))

(declare-fun lt!35644 () Unit!2241)

(declare-fun lt!35641 () Unit!2241)

(assert (=> d!18385 (= lt!35644 lt!35641)))

(assert (=> d!18385 (= (getValueByKey!136 lt!35643 (_1!1092 lt!35465)) (Some!141 (_2!1092 lt!35465)))))

(assert (=> d!18385 (= lt!35641 (lemmaContainsTupThenGetReturnValue!53 lt!35643 (_1!1092 lt!35465) (_2!1092 lt!35465)))))

(assert (=> d!18385 (= lt!35643 (insertStrictlySorted!56 (toList!736 lt!35475) (_1!1092 lt!35465) (_2!1092 lt!35465)))))

(assert (=> d!18385 (= (+!102 lt!35475 lt!35465) lt!35642)))

(declare-fun b!77559 () Bool)

(declare-fun res!40705 () Bool)

(assert (=> b!77559 (=> (not res!40705) (not e!50715))))

(assert (=> b!77559 (= res!40705 (= (getValueByKey!136 (toList!736 lt!35642) (_1!1092 lt!35465)) (Some!141 (_2!1092 lt!35465))))))

(declare-fun b!77560 () Bool)

(assert (=> b!77560 (= e!50715 (contains!739 (toList!736 lt!35642) lt!35465))))

(assert (= (and d!18385 res!40704) b!77559))

(assert (= (and b!77559 res!40705) b!77560))

(declare-fun m!77731 () Bool)

(assert (=> d!18385 m!77731))

(declare-fun m!77733 () Bool)

(assert (=> d!18385 m!77733))

(declare-fun m!77735 () Bool)

(assert (=> d!18385 m!77735))

(declare-fun m!77737 () Bool)

(assert (=> d!18385 m!77737))

(declare-fun m!77739 () Bool)

(assert (=> b!77559 m!77739))

(declare-fun m!77741 () Bool)

(assert (=> b!77560 m!77741))

(assert (=> b!77377 d!18385))

(declare-fun d!18387 () Bool)

(declare-fun e!50716 () Bool)

(assert (=> d!18387 e!50716))

(declare-fun res!40706 () Bool)

(assert (=> d!18387 (=> (not res!40706) (not e!50716))))

(declare-fun lt!35646 () ListLongMap!1441)

(assert (=> d!18387 (= res!40706 (contains!737 lt!35646 (_1!1092 lt!35478)))))

(declare-fun lt!35647 () List!1501)

(assert (=> d!18387 (= lt!35646 (ListLongMap!1442 lt!35647))))

(declare-fun lt!35648 () Unit!2241)

(declare-fun lt!35645 () Unit!2241)

(assert (=> d!18387 (= lt!35648 lt!35645)))

(assert (=> d!18387 (= (getValueByKey!136 lt!35647 (_1!1092 lt!35478)) (Some!141 (_2!1092 lt!35478)))))

(assert (=> d!18387 (= lt!35645 (lemmaContainsTupThenGetReturnValue!53 lt!35647 (_1!1092 lt!35478) (_2!1092 lt!35478)))))

(assert (=> d!18387 (= lt!35647 (insertStrictlySorted!56 (toList!736 lt!35470) (_1!1092 lt!35478) (_2!1092 lt!35478)))))

(assert (=> d!18387 (= (+!102 lt!35470 lt!35478) lt!35646)))

(declare-fun b!77561 () Bool)

(declare-fun res!40707 () Bool)

(assert (=> b!77561 (=> (not res!40707) (not e!50716))))

(assert (=> b!77561 (= res!40707 (= (getValueByKey!136 (toList!736 lt!35646) (_1!1092 lt!35478)) (Some!141 (_2!1092 lt!35478))))))

(declare-fun b!77562 () Bool)

(assert (=> b!77562 (= e!50716 (contains!739 (toList!736 lt!35646) lt!35478))))

(assert (= (and d!18387 res!40706) b!77561))

(assert (= (and b!77561 res!40707) b!77562))

(declare-fun m!77743 () Bool)

(assert (=> d!18387 m!77743))

(declare-fun m!77745 () Bool)

(assert (=> d!18387 m!77745))

(declare-fun m!77747 () Bool)

(assert (=> d!18387 m!77747))

(declare-fun m!77749 () Bool)

(assert (=> d!18387 m!77749))

(declare-fun m!77751 () Bool)

(assert (=> b!77561 m!77751))

(declare-fun m!77753 () Bool)

(assert (=> b!77562 m!77753))

(assert (=> b!77377 d!18387))

(declare-fun d!18389 () Bool)

(declare-fun e!50717 () Bool)

(assert (=> d!18389 e!50717))

(declare-fun res!40708 () Bool)

(assert (=> d!18389 (=> (not res!40708) (not e!50717))))

(declare-fun lt!35650 () ListLongMap!1441)

(assert (=> d!18389 (= res!40708 (contains!737 lt!35650 (_1!1092 lt!35465)))))

(declare-fun lt!35651 () List!1501)

(assert (=> d!18389 (= lt!35650 (ListLongMap!1442 lt!35651))))

(declare-fun lt!35652 () Unit!2241)

(declare-fun lt!35649 () Unit!2241)

(assert (=> d!18389 (= lt!35652 lt!35649)))

(assert (=> d!18389 (= (getValueByKey!136 lt!35651 (_1!1092 lt!35465)) (Some!141 (_2!1092 lt!35465)))))

(assert (=> d!18389 (= lt!35649 (lemmaContainsTupThenGetReturnValue!53 lt!35651 (_1!1092 lt!35465) (_2!1092 lt!35465)))))

(assert (=> d!18389 (= lt!35651 (insertStrictlySorted!56 (toList!736 lt!35472) (_1!1092 lt!35465) (_2!1092 lt!35465)))))

(assert (=> d!18389 (= (+!102 lt!35472 lt!35465) lt!35650)))

(declare-fun b!77563 () Bool)

(declare-fun res!40709 () Bool)

(assert (=> b!77563 (=> (not res!40709) (not e!50717))))

(assert (=> b!77563 (= res!40709 (= (getValueByKey!136 (toList!736 lt!35650) (_1!1092 lt!35465)) (Some!141 (_2!1092 lt!35465))))))

(declare-fun b!77564 () Bool)

(assert (=> b!77564 (= e!50717 (contains!739 (toList!736 lt!35650) lt!35465))))

(assert (= (and d!18389 res!40708) b!77563))

(assert (= (and b!77563 res!40709) b!77564))

(declare-fun m!77755 () Bool)

(assert (=> d!18389 m!77755))

(declare-fun m!77757 () Bool)

(assert (=> d!18389 m!77757))

(declare-fun m!77759 () Bool)

(assert (=> d!18389 m!77759))

(declare-fun m!77761 () Bool)

(assert (=> d!18389 m!77761))

(declare-fun m!77763 () Bool)

(assert (=> b!77563 m!77763))

(declare-fun m!77765 () Bool)

(assert (=> b!77564 m!77765))

(assert (=> b!77377 d!18389))

(declare-fun d!18391 () Bool)

(declare-fun e!50718 () Bool)

(assert (=> d!18391 e!50718))

(declare-fun res!40710 () Bool)

(assert (=> d!18391 (=> (not res!40710) (not e!50718))))

(declare-fun lt!35654 () ListLongMap!1441)

(assert (=> d!18391 (= res!40710 (contains!737 lt!35654 (_1!1092 lt!35478)))))

(declare-fun lt!35655 () List!1501)

(assert (=> d!18391 (= lt!35654 (ListLongMap!1442 lt!35655))))

(declare-fun lt!35656 () Unit!2241)

(declare-fun lt!35653 () Unit!2241)

(assert (=> d!18391 (= lt!35656 lt!35653)))

(assert (=> d!18391 (= (getValueByKey!136 lt!35655 (_1!1092 lt!35478)) (Some!141 (_2!1092 lt!35478)))))

(assert (=> d!18391 (= lt!35653 (lemmaContainsTupThenGetReturnValue!53 lt!35655 (_1!1092 lt!35478) (_2!1092 lt!35478)))))

(assert (=> d!18391 (= lt!35655 (insertStrictlySorted!56 (toList!736 lt!35464) (_1!1092 lt!35478) (_2!1092 lt!35478)))))

(assert (=> d!18391 (= (+!102 lt!35464 lt!35478) lt!35654)))

(declare-fun b!77565 () Bool)

(declare-fun res!40711 () Bool)

(assert (=> b!77565 (=> (not res!40711) (not e!50718))))

(assert (=> b!77565 (= res!40711 (= (getValueByKey!136 (toList!736 lt!35654) (_1!1092 lt!35478)) (Some!141 (_2!1092 lt!35478))))))

(declare-fun b!77566 () Bool)

(assert (=> b!77566 (= e!50718 (contains!739 (toList!736 lt!35654) lt!35478))))

(assert (= (and d!18391 res!40710) b!77565))

(assert (= (and b!77565 res!40711) b!77566))

(declare-fun m!77767 () Bool)

(assert (=> d!18391 m!77767))

(declare-fun m!77769 () Bool)

(assert (=> d!18391 m!77769))

(declare-fun m!77771 () Bool)

(assert (=> d!18391 m!77771))

(declare-fun m!77773 () Bool)

(assert (=> d!18391 m!77773))

(declare-fun m!77775 () Bool)

(assert (=> b!77565 m!77775))

(declare-fun m!77777 () Bool)

(assert (=> b!77566 m!77777))

(assert (=> b!77377 d!18391))

(declare-fun d!18393 () Bool)

(assert (=> d!18393 (= (validMask!0 (mask!6259 (v!2584 (underlying!275 thiss!992)))) (and (or (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000001111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000011111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000001111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000011111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000001111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000011111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000001111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000011111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000000111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000001111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000011111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000000111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000001111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000011111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000000111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000001111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000011111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000000111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000001111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000011111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00000111111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00001111111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00011111111111111111111111111111) (= (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6259 (v!2584 (underlying!275 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!77377 d!18393))

(declare-fun d!18395 () Bool)

(assert (=> d!18395 (= (+!102 (+!102 lt!35475 (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474)) (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992))))) (+!102 (+!102 lt!35475 (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992))))) (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474)))))

(declare-fun lt!35659 () Unit!2241)

(declare-fun choose!451 (ListLongMap!1441 (_ BitVec 64) V!2987 (_ BitVec 64) V!2987) Unit!2241)

(assert (=> d!18395 (= lt!35659 (choose!451 lt!35475 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(assert (=> d!18395 (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18395 (= (addCommutativeForDiffKeys!21 lt!35475 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2164 (v!2584 (underlying!275 thiss!992)))) lt!35659)))

(declare-fun bs!3296 () Bool)

(assert (= bs!3296 d!18395))

(declare-fun m!77779 () Bool)

(assert (=> bs!3296 m!77779))

(declare-fun m!77781 () Bool)

(assert (=> bs!3296 m!77781))

(declare-fun m!77783 () Bool)

(assert (=> bs!3296 m!77783))

(assert (=> bs!3296 m!77781))

(assert (=> bs!3296 m!77511))

(declare-fun m!77785 () Bool)

(assert (=> bs!3296 m!77785))

(assert (=> bs!3296 m!77779))

(declare-fun m!77787 () Bool)

(assert (=> bs!3296 m!77787))

(assert (=> b!77377 d!18395))

(declare-fun d!18397 () Bool)

(assert (=> d!18397 (= (+!102 (+!102 lt!35464 (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474)) (tuple2!2163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))))) (+!102 (+!102 lt!35464 (tuple2!2163 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992))))) (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474)))))

(declare-fun lt!35660 () Unit!2241)

(assert (=> d!18397 (= lt!35660 (choose!451 lt!35464 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))))))

(assert (=> d!18397 (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18397 (= (addCommutativeForDiffKeys!21 lt!35464 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2164 (v!2584 (underlying!275 thiss!992)))) lt!35660)))

(declare-fun bs!3297 () Bool)

(assert (= bs!3297 d!18397))

(declare-fun m!77789 () Bool)

(assert (=> bs!3297 m!77789))

(declare-fun m!77791 () Bool)

(assert (=> bs!3297 m!77791))

(declare-fun m!77793 () Bool)

(assert (=> bs!3297 m!77793))

(assert (=> bs!3297 m!77791))

(assert (=> bs!3297 m!77511))

(declare-fun m!77795 () Bool)

(assert (=> bs!3297 m!77795))

(assert (=> bs!3297 m!77789))

(declare-fun m!77797 () Bool)

(assert (=> bs!3297 m!77797))

(assert (=> b!77377 d!18397))

(declare-fun d!18399 () Bool)

(declare-fun res!40718 () Bool)

(declare-fun e!50721 () Bool)

(assert (=> d!18399 (=> (not res!40718) (not e!50721))))

(declare-fun simpleValid!54 (LongMapFixedSize!726) Bool)

(assert (=> d!18399 (= res!40718 (simpleValid!54 newMap!16))))

(assert (=> d!18399 (= (valid!308 newMap!16) e!50721)))

(declare-fun b!77573 () Bool)

(declare-fun res!40719 () Bool)

(assert (=> b!77573 (=> (not res!40719) (not e!50721))))

(declare-fun arrayCountValidKeys!0 (array!3961 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!77573 (= res!40719 (= (arrayCountValidKeys!0 (_keys!3926 newMap!16) #b00000000000000000000000000000000 (size!2130 (_keys!3926 newMap!16))) (_size!412 newMap!16)))))

(declare-fun b!77574 () Bool)

(declare-fun res!40720 () Bool)

(assert (=> b!77574 (=> (not res!40720) (not e!50721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3961 (_ BitVec 32)) Bool)

(assert (=> b!77574 (= res!40720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3926 newMap!16) (mask!6259 newMap!16)))))

(declare-fun b!77575 () Bool)

(assert (=> b!77575 (= e!50721 (arrayNoDuplicates!0 (_keys!3926 newMap!16) #b00000000000000000000000000000000 Nil!1499))))

(assert (= (and d!18399 res!40718) b!77573))

(assert (= (and b!77573 res!40719) b!77574))

(assert (= (and b!77574 res!40720) b!77575))

(declare-fun m!77799 () Bool)

(assert (=> d!18399 m!77799))

(declare-fun m!77801 () Bool)

(assert (=> b!77573 m!77801))

(declare-fun m!77803 () Bool)

(assert (=> b!77574 m!77803))

(declare-fun m!77805 () Bool)

(assert (=> b!77575 m!77805))

(assert (=> b!77387 d!18399))

(declare-fun d!18401 () Bool)

(declare-fun e!50727 () Bool)

(assert (=> d!18401 e!50727))

(declare-fun res!40723 () Bool)

(assert (=> d!18401 (=> res!40723 e!50727)))

(declare-fun lt!35671 () Bool)

(assert (=> d!18401 (= res!40723 (not lt!35671))))

(declare-fun lt!35669 () Bool)

(assert (=> d!18401 (= lt!35671 lt!35669)))

(declare-fun lt!35672 () Unit!2241)

(declare-fun e!50726 () Unit!2241)

(assert (=> d!18401 (= lt!35672 e!50726)))

(declare-fun c!11841 () Bool)

(assert (=> d!18401 (= c!11841 lt!35669)))

(declare-fun containsKey!140 (List!1501 (_ BitVec 64)) Bool)

(assert (=> d!18401 (= lt!35669 (containsKey!140 (toList!736 lt!35463) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(assert (=> d!18401 (= (contains!737 lt!35463 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)) lt!35671)))

(declare-fun b!77582 () Bool)

(declare-fun lt!35670 () Unit!2241)

(assert (=> b!77582 (= e!50726 lt!35670)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!88 (List!1501 (_ BitVec 64)) Unit!2241)

(assert (=> b!77582 (= lt!35670 (lemmaContainsKeyImpliesGetValueByKeyDefined!88 (toList!736 lt!35463) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun isDefined!89 (Option!142) Bool)

(assert (=> b!77582 (isDefined!89 (getValueByKey!136 (toList!736 lt!35463) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun b!77583 () Bool)

(declare-fun Unit!2250 () Unit!2241)

(assert (=> b!77583 (= e!50726 Unit!2250)))

(declare-fun b!77584 () Bool)

(assert (=> b!77584 (= e!50727 (isDefined!89 (getValueByKey!136 (toList!736 lt!35463) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355))))))

(assert (= (and d!18401 c!11841) b!77582))

(assert (= (and d!18401 (not c!11841)) b!77583))

(assert (= (and d!18401 (not res!40723)) b!77584))

(assert (=> d!18401 m!77511))

(declare-fun m!77807 () Bool)

(assert (=> d!18401 m!77807))

(assert (=> b!77582 m!77511))

(declare-fun m!77809 () Bool)

(assert (=> b!77582 m!77809))

(assert (=> b!77582 m!77511))

(declare-fun m!77811 () Bool)

(assert (=> b!77582 m!77811))

(assert (=> b!77582 m!77811))

(declare-fun m!77813 () Bool)

(assert (=> b!77582 m!77813))

(assert (=> b!77584 m!77511))

(assert (=> b!77584 m!77811))

(assert (=> b!77584 m!77811))

(assert (=> b!77584 m!77813))

(assert (=> b!77373 d!18401))

(declare-fun bm!7056 () Bool)

(declare-fun call!7077 () Bool)

(declare-fun call!7071 () Bool)

(assert (=> bm!7056 (= call!7077 call!7071)))

(declare-fun bm!7057 () Bool)

(declare-fun call!7060 () Unit!2241)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 64) Int) Unit!2241)

(assert (=> bm!7057 (= call!7060 (lemmaInListMapThenSeekEntryOrOpenFindsIt!27 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (defaultEntry!2266 newMap!16)))))

(declare-fun b!77661 () Bool)

(declare-fun e!50779 () Bool)

(declare-fun e!50778 () Bool)

(assert (=> b!77661 (= e!50779 e!50778)))

(declare-fun c!11869 () Bool)

(declare-fun lt!35731 () tuple2!2160)

(assert (=> b!77661 (= c!11869 (_1!1091 lt!35731))))

(declare-fun b!77662 () Bool)

(declare-fun res!40759 () Bool)

(declare-datatypes ((SeekEntryResult!239 0))(
  ( (MissingZero!239 (index!3090 (_ BitVec 32))) (Found!239 (index!3091 (_ BitVec 32))) (Intermediate!239 (undefined!1051 Bool) (index!3092 (_ BitVec 32)) (x!11505 (_ BitVec 32))) (Undefined!239) (MissingVacant!239 (index!3093 (_ BitVec 32))) )
))
(declare-fun lt!35736 () SeekEntryResult!239)

(assert (=> b!77662 (= res!40759 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3093 lt!35736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50773 () Bool)

(assert (=> b!77662 (=> (not res!40759) (not e!50773))))

(declare-fun b!77663 () Bool)

(declare-fun lt!35745 () tuple2!2160)

(declare-fun call!7074 () tuple2!2160)

(assert (=> b!77663 (= lt!35745 call!7074)))

(declare-fun e!50775 () tuple2!2160)

(assert (=> b!77663 (= e!50775 (tuple2!2161 (_1!1091 lt!35745) (_2!1091 lt!35745)))))

(declare-fun bm!7058 () Bool)

(declare-fun call!7076 () Bool)

(declare-fun call!7082 () Bool)

(assert (=> bm!7058 (= call!7076 call!7082)))

(declare-fun call!7062 () ListLongMap!1441)

(declare-fun call!7068 () ListLongMap!1441)

(declare-fun c!11867 () Bool)

(declare-fun bm!7059 () Bool)

(declare-fun call!7073 () ListLongMap!1441)

(declare-fun c!11868 () Bool)

(assert (=> bm!7059 (= call!7068 (+!102 (ite c!11868 call!7073 call!7062) (ite c!11868 (ite c!11867 (tuple2!2163 #b0000000000000000000000000000000000000000000000000000000000000000 lt!35474) (tuple2!2163 #b1000000000000000000000000000000000000000000000000000000000000000 lt!35474)) (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474))))))

(declare-fun b!77665 () Bool)

(declare-fun res!40758 () Bool)

(declare-fun e!50781 () Bool)

(assert (=> b!77665 (=> (not res!40758) (not e!50781))))

(declare-fun call!7065 () Bool)

(assert (=> b!77665 (= res!40758 call!7065)))

(declare-fun e!50769 () Bool)

(assert (=> b!77665 (= e!50769 e!50781)))

(declare-fun bm!7060 () Bool)

(declare-fun call!7059 () ListLongMap!1441)

(assert (=> bm!7060 (= call!7059 (map!1170 (_2!1091 lt!35731)))))

(declare-fun c!11872 () Bool)

(declare-fun lt!35748 () SeekEntryResult!239)

(declare-fun c!11874 () Bool)

(declare-fun c!11870 () Bool)

(declare-fun lt!35753 () SeekEntryResult!239)

(declare-fun bm!7061 () Bool)

(declare-fun c!11877 () Bool)

(declare-fun c!11876 () Bool)

(declare-fun lt!35744 () SeekEntryResult!239)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!7061 (= call!7071 (inRange!0 (ite c!11870 (ite c!11877 (index!3091 lt!35748) (ite c!11872 (index!3090 lt!35736) (index!3093 lt!35736))) (ite c!11874 (index!3091 lt!35744) (ite c!11876 (index!3090 lt!35753) (index!3093 lt!35753)))) (mask!6259 newMap!16)))))

(declare-fun b!77666 () Bool)

(declare-fun e!50786 () Bool)

(assert (=> b!77666 (= e!50778 e!50786)))

(declare-fun res!40764 () Bool)

(assert (=> b!77666 (= res!40764 (contains!737 call!7059 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(assert (=> b!77666 (=> (not res!40764) (not e!50786))))

(declare-fun b!77667 () Bool)

(declare-fun lt!35742 () Unit!2241)

(declare-fun lt!35727 () Unit!2241)

(assert (=> b!77667 (= lt!35742 lt!35727)))

(declare-fun call!7072 () ListLongMap!1441)

(declare-fun call!7064 () ListLongMap!1441)

(assert (=> b!77667 (= call!7072 call!7064)))

(declare-fun lt!35747 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!27 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 V!2987 Int) Unit!2241)

(assert (=> b!77667 (= lt!35727 (lemmaChangeZeroKeyThenAddPairToListMap!27 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) lt!35747 (zeroValue!2164 newMap!16) lt!35474 (minValue!2164 newMap!16) (defaultEntry!2266 newMap!16)))))

(assert (=> b!77667 (= lt!35747 (bvor (extraKeys!2117 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!50785 () tuple2!2160)

(assert (=> b!77667 (= e!50785 (tuple2!2161 true (LongMapFixedSize!727 (defaultEntry!2266 newMap!16) (mask!6259 newMap!16) (bvor (extraKeys!2117 newMap!16) #b00000000000000000000000000000001) lt!35474 (minValue!2164 newMap!16) (_size!412 newMap!16) (_keys!3926 newMap!16) (_values!2249 newMap!16) (_vacant!412 newMap!16))))))

(declare-fun bm!7062 () Bool)

(declare-fun call!7061 () Bool)

(declare-fun call!7078 () Bool)

(assert (=> bm!7062 (= call!7061 call!7078)))

(declare-fun bm!7063 () Bool)

(declare-fun call!7079 () Bool)

(assert (=> bm!7063 (= call!7079 call!7082)))

(declare-fun call!7081 () Bool)

(declare-fun call!7075 () ListLongMap!1441)

(declare-fun lt!35746 () SeekEntryResult!239)

(declare-fun bm!7064 () Bool)

(assert (=> bm!7064 (= call!7081 (contains!737 call!7075 (ite c!11870 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (select (arr!1889 (_keys!3926 newMap!16)) (index!3091 lt!35746)))))))

(declare-fun bm!7065 () Bool)

(assert (=> bm!7065 (= call!7065 call!7077)))

(declare-fun b!77668 () Bool)

(declare-fun e!50782 () tuple2!2160)

(assert (=> b!77668 (= e!50782 e!50785)))

(assert (=> b!77668 (= c!11867 (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7066 () Bool)

(declare-fun call!7080 () ListLongMap!1441)

(assert (=> bm!7066 (= call!7080 (map!1170 newMap!16))))

(declare-fun e!50776 () Bool)

(declare-fun b!77669 () Bool)

(assert (=> b!77669 (= e!50776 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3091 lt!35744)) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun b!77670 () Bool)

(declare-fun res!40761 () Bool)

(assert (=> b!77670 (= res!40761 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3093 lt!35753)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!50772 () Bool)

(assert (=> b!77670 (=> (not res!40761) (not e!50772))))

(declare-fun call!7069 () ListLongMap!1441)

(declare-fun lt!35741 () array!3963)

(declare-fun bm!7067 () Bool)

(assert (=> bm!7067 (= call!7069 (getCurrentListMap!431 (_keys!3926 newMap!16) (ite (or c!11868 c!11870) (_values!2249 newMap!16) lt!35741) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2266 newMap!16)))))

(declare-fun b!77671 () Bool)

(assert (=> b!77671 (= e!50786 (= call!7059 (+!102 call!7080 (tuple2!2163 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474))))))

(declare-fun bm!7068 () Bool)

(declare-fun call!7070 () SeekEntryResult!239)

(declare-fun call!7067 () SeekEntryResult!239)

(assert (=> bm!7068 (= call!7070 call!7067)))

(declare-fun c!11866 () Bool)

(declare-fun bm!7069 () Bool)

(declare-fun updateHelperNewKey!27 (LongMapFixedSize!726 (_ BitVec 64) V!2987 (_ BitVec 32)) tuple2!2160)

(assert (=> bm!7069 (= call!7074 (updateHelperNewKey!27 newMap!16 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 (ite c!11866 (index!3093 lt!35746) (index!3090 lt!35746))))))

(declare-fun b!77672 () Bool)

(declare-fun lt!35752 () Unit!2241)

(declare-fun e!50768 () Unit!2241)

(assert (=> b!77672 (= lt!35752 e!50768)))

(assert (=> b!77672 (= c!11877 call!7081)))

(declare-fun e!50771 () tuple2!2160)

(assert (=> b!77672 (= e!50771 (tuple2!2161 false newMap!16))))

(declare-fun b!77673 () Bool)

(declare-fun res!40763 () Bool)

(assert (=> b!77673 (= res!40763 call!7077)))

(declare-fun e!50770 () Bool)

(assert (=> b!77673 (=> (not res!40763) (not e!50770))))

(declare-fun bm!7070 () Bool)

(declare-fun call!7063 () SeekEntryResult!239)

(assert (=> bm!7070 (= call!7063 call!7067)))

(declare-fun b!77674 () Bool)

(declare-fun c!11875 () Bool)

(assert (=> b!77674 (= c!11875 ((_ is MissingVacant!239) lt!35753))))

(declare-fun e!50784 () Bool)

(declare-fun e!50777 () Bool)

(assert (=> b!77674 (= e!50784 e!50777)))

(declare-fun b!77675 () Bool)

(declare-fun lt!35739 () Unit!2241)

(declare-fun lt!35750 () Unit!2241)

(assert (=> b!77675 (= lt!35739 lt!35750)))

(assert (=> b!77675 call!7081))

(declare-fun lemmaValidKeyInArrayIsInListMap!88 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 32) Int) Unit!2241)

(assert (=> b!77675 (= lt!35750 (lemmaValidKeyInArrayIsInListMap!88 (_keys!3926 newMap!16) lt!35741 (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) (index!3091 lt!35746) (defaultEntry!2266 newMap!16)))))

(assert (=> b!77675 (= lt!35741 (array!3964 (store (arr!1890 (_values!2249 newMap!16)) (index!3091 lt!35746) (ValueCellFull!909 lt!35474)) (size!2131 (_values!2249 newMap!16))))))

(declare-fun lt!35735 () Unit!2241)

(declare-fun lt!35738 () Unit!2241)

(assert (=> b!77675 (= lt!35735 lt!35738)))

(assert (=> b!77675 (= call!7068 (getCurrentListMap!431 (_keys!3926 newMap!16) (array!3964 (store (arr!1890 (_values!2249 newMap!16)) (index!3091 lt!35746) (ValueCellFull!909 lt!35474)) (size!2131 (_values!2249 newMap!16))) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2266 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 32) (_ BitVec 64) V!2987 Int) Unit!2241)

(assert (=> b!77675 (= lt!35738 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!27 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) (index!3091 lt!35746) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474 (defaultEntry!2266 newMap!16)))))

(declare-fun lt!35734 () Unit!2241)

(declare-fun e!50780 () Unit!2241)

(assert (=> b!77675 (= lt!35734 e!50780)))

(assert (=> b!77675 (= c!11874 (contains!737 call!7062 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(assert (=> b!77675 (= e!50775 (tuple2!2161 true (LongMapFixedSize!727 (defaultEntry!2266 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) (_size!412 newMap!16) (_keys!3926 newMap!16) (array!3964 (store (arr!1890 (_values!2249 newMap!16)) (index!3091 lt!35746) (ValueCellFull!909 lt!35474)) (size!2131 (_values!2249 newMap!16))) (_vacant!412 newMap!16))))))

(declare-fun b!77676 () Bool)

(declare-fun res!40753 () Bool)

(declare-fun e!50774 () Bool)

(assert (=> b!77676 (=> (not res!40753) (not e!50774))))

(assert (=> b!77676 (= res!40753 call!7061)))

(assert (=> b!77676 (= e!50784 e!50774)))

(declare-fun bm!7071 () Bool)

(assert (=> bm!7071 (= call!7072 call!7068)))

(declare-fun b!77677 () Bool)

(assert (=> b!77677 (= e!50772 (not call!7079))))

(declare-fun b!77678 () Bool)

(declare-fun lt!35728 () Unit!2241)

(assert (=> b!77678 (= e!50768 lt!35728)))

(declare-fun call!7066 () Unit!2241)

(assert (=> b!77678 (= lt!35728 call!7066)))

(assert (=> b!77678 (= lt!35736 call!7063)))

(assert (=> b!77678 (= c!11872 ((_ is MissingZero!239) lt!35736))))

(assert (=> b!77678 e!50769))

(declare-fun b!77679 () Bool)

(declare-fun c!11873 () Bool)

(assert (=> b!77679 (= c!11873 ((_ is MissingVacant!239) lt!35736))))

(declare-fun e!50787 () Bool)

(assert (=> b!77679 (= e!50769 e!50787)))

(declare-fun b!77680 () Bool)

(assert (=> b!77680 (= e!50774 (not call!7079))))

(declare-fun lt!35743 () (_ BitVec 32))

(declare-fun bm!7072 () Bool)

(assert (=> bm!7072 (= call!7062 (getCurrentListMap!431 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (ite c!11868 (ite c!11867 lt!35747 lt!35743) (extraKeys!2117 newMap!16)) (ite (and c!11868 c!11867) lt!35474 (zeroValue!2164 newMap!16)) (ite c!11868 (ite c!11867 (minValue!2164 newMap!16) lt!35474) (minValue!2164 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2266 newMap!16)))))

(declare-fun b!77681 () Bool)

(assert (=> b!77681 (= e!50770 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3091 lt!35748)) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun bm!7073 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 64) Int) Unit!2241)

(assert (=> bm!7073 (= call!7066 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!27 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (defaultEntry!2266 newMap!16)))))

(declare-fun bm!7074 () Bool)

(assert (=> bm!7074 (= call!7064 call!7062)))

(declare-fun b!77682 () Bool)

(declare-fun lt!35749 () Unit!2241)

(assert (=> b!77682 (= e!50780 lt!35749)))

(assert (=> b!77682 (= lt!35749 call!7060)))

(assert (=> b!77682 (= lt!35744 call!7070)))

(declare-fun res!40757 () Bool)

(assert (=> b!77682 (= res!40757 ((_ is Found!239) lt!35744))))

(assert (=> b!77682 (=> (not res!40757) (not e!50776))))

(assert (=> b!77682 e!50776))

(declare-fun b!77683 () Bool)

(declare-fun res!40762 () Bool)

(assert (=> b!77683 (=> (not res!40762) (not e!50781))))

(assert (=> b!77683 (= res!40762 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3090 lt!35736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!77684 () Bool)

(declare-fun Unit!2251 () Unit!2241)

(assert (=> b!77684 (= e!50768 Unit!2251)))

(declare-fun lt!35733 () Unit!2241)

(assert (=> b!77684 (= lt!35733 call!7060)))

(assert (=> b!77684 (= lt!35748 call!7063)))

(declare-fun res!40756 () Bool)

(assert (=> b!77684 (= res!40756 ((_ is Found!239) lt!35748))))

(assert (=> b!77684 (=> (not res!40756) (not e!50770))))

(assert (=> b!77684 e!50770))

(declare-fun lt!35740 () Unit!2241)

(assert (=> b!77684 (= lt!35740 lt!35733)))

(assert (=> b!77684 false))

(declare-fun b!77685 () Bool)

(assert (=> b!77685 (= e!50787 e!50773)))

(declare-fun res!40754 () Bool)

(assert (=> b!77685 (= res!40754 call!7065)))

(assert (=> b!77685 (=> (not res!40754) (not e!50773))))

(declare-fun b!77686 () Bool)

(assert (=> b!77686 (= e!50778 (= call!7059 call!7080))))

(declare-fun bm!7075 () Bool)

(assert (=> bm!7075 (= call!7073 call!7069)))

(declare-fun b!77687 () Bool)

(declare-fun e!50783 () tuple2!2160)

(assert (=> b!77687 (= e!50783 e!50775)))

(declare-fun c!11871 () Bool)

(assert (=> b!77687 (= c!11871 ((_ is MissingZero!239) lt!35746))))

(declare-fun b!77688 () Bool)

(assert (=> b!77688 (= c!11866 ((_ is MissingVacant!239) lt!35746))))

(assert (=> b!77688 (= e!50771 e!50783)))

(declare-fun b!77689 () Bool)

(assert (=> b!77689 (= e!50773 (not call!7076))))

(declare-fun b!77664 () Bool)

(assert (=> b!77664 (= e!50777 ((_ is Undefined!239) lt!35753))))

(declare-fun d!18403 () Bool)

(assert (=> d!18403 e!50779))

(declare-fun res!40760 () Bool)

(assert (=> d!18403 (=> (not res!40760) (not e!50779))))

(assert (=> d!18403 (= res!40760 (valid!308 (_2!1091 lt!35731)))))

(assert (=> d!18403 (= lt!35731 e!50782)))

(assert (=> d!18403 (= c!11868 (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvneg (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355))))))

(assert (=> d!18403 (valid!308 newMap!16)))

(assert (=> d!18403 (= (update!104 newMap!16 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) lt!35474) lt!35731)))

(declare-fun bm!7076 () Bool)

(assert (=> bm!7076 (= call!7075 call!7069)))

(declare-fun b!77690 () Bool)

(assert (=> b!77690 (= e!50777 e!50772)))

(declare-fun res!40755 () Bool)

(assert (=> b!77690 (= res!40755 call!7061)))

(assert (=> b!77690 (=> (not res!40755) (not e!50772))))

(declare-fun bm!7077 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3961 (_ BitVec 32)) SeekEntryResult!239)

(assert (=> bm!7077 (= call!7067 (seekEntryOrOpen!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (_keys!3926 newMap!16) (mask!6259 newMap!16)))))

(declare-fun b!77691 () Bool)

(declare-fun Unit!2252 () Unit!2241)

(assert (=> b!77691 (= e!50780 Unit!2252)))

(declare-fun lt!35737 () Unit!2241)

(assert (=> b!77691 (= lt!35737 call!7066)))

(assert (=> b!77691 (= lt!35753 call!7070)))

(assert (=> b!77691 (= c!11876 ((_ is MissingZero!239) lt!35753))))

(assert (=> b!77691 e!50784))

(declare-fun lt!35751 () Unit!2241)

(assert (=> b!77691 (= lt!35751 lt!35737)))

(assert (=> b!77691 false))

(declare-fun b!77692 () Bool)

(declare-fun lt!35732 () Unit!2241)

(declare-fun lt!35730 () Unit!2241)

(assert (=> b!77692 (= lt!35732 lt!35730)))

(assert (=> b!77692 (= call!7072 call!7064)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 V!2987 Int) Unit!2241)

(assert (=> b!77692 (= lt!35730 (lemmaChangeLongMinValueKeyThenAddPairToListMap!27 (_keys!3926 newMap!16) (_values!2249 newMap!16) (mask!6259 newMap!16) (extraKeys!2117 newMap!16) lt!35743 (zeroValue!2164 newMap!16) (minValue!2164 newMap!16) lt!35474 (defaultEntry!2266 newMap!16)))))

(assert (=> b!77692 (= lt!35743 (bvor (extraKeys!2117 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!77692 (= e!50785 (tuple2!2161 true (LongMapFixedSize!727 (defaultEntry!2266 newMap!16) (mask!6259 newMap!16) (bvor (extraKeys!2117 newMap!16) #b00000000000000000000000000000010) (zeroValue!2164 newMap!16) lt!35474 (_size!412 newMap!16) (_keys!3926 newMap!16) (_values!2249 newMap!16) (_vacant!412 newMap!16))))))

(declare-fun b!77693 () Bool)

(assert (=> b!77693 (= e!50787 ((_ is Undefined!239) lt!35736))))

(declare-fun b!77694 () Bool)

(declare-fun res!40752 () Bool)

(assert (=> b!77694 (= res!40752 call!7078)))

(assert (=> b!77694 (=> (not res!40752) (not e!50776))))

(declare-fun b!77695 () Bool)

(assert (=> b!77695 (= e!50782 e!50771)))

(assert (=> b!77695 (= lt!35746 (seekEntryOrOpen!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (_keys!3926 newMap!16) (mask!6259 newMap!16)))))

(assert (=> b!77695 (= c!11870 ((_ is Undefined!239) lt!35746))))

(declare-fun b!77696 () Bool)

(declare-fun res!40765 () Bool)

(assert (=> b!77696 (=> (not res!40765) (not e!50774))))

(assert (=> b!77696 (= res!40765 (= (select (arr!1889 (_keys!3926 newMap!16)) (index!3090 lt!35753)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!7078 () Bool)

(assert (=> bm!7078 (= call!7078 call!7071)))

(declare-fun bm!7079 () Bool)

(assert (=> bm!7079 (= call!7082 (arrayContainsKey!0 (_keys!3926 newMap!16) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!77697 () Bool)

(assert (=> b!77697 (= e!50781 (not call!7076))))

(declare-fun b!77698 () Bool)

(declare-fun lt!35729 () tuple2!2160)

(assert (=> b!77698 (= e!50783 (tuple2!2161 (_1!1091 lt!35729) (_2!1091 lt!35729)))))

(assert (=> b!77698 (= lt!35729 call!7074)))

(assert (= (and d!18403 c!11868) b!77668))

(assert (= (and d!18403 (not c!11868)) b!77695))

(assert (= (and b!77668 c!11867) b!77667))

(assert (= (and b!77668 (not c!11867)) b!77692))

(assert (= (or b!77667 b!77692) bm!7075))

(assert (= (or b!77667 b!77692) bm!7074))

(assert (= (or b!77667 b!77692) bm!7071))

(assert (= (and b!77695 c!11870) b!77672))

(assert (= (and b!77695 (not c!11870)) b!77688))

(assert (= (and b!77672 c!11877) b!77684))

(assert (= (and b!77672 (not c!11877)) b!77678))

(assert (= (and b!77684 res!40756) b!77673))

(assert (= (and b!77673 res!40763) b!77681))

(assert (= (and b!77678 c!11872) b!77665))

(assert (= (and b!77678 (not c!11872)) b!77679))

(assert (= (and b!77665 res!40758) b!77683))

(assert (= (and b!77683 res!40762) b!77697))

(assert (= (and b!77679 c!11873) b!77685))

(assert (= (and b!77679 (not c!11873)) b!77693))

(assert (= (and b!77685 res!40754) b!77662))

(assert (= (and b!77662 res!40759) b!77689))

(assert (= (or b!77665 b!77685) bm!7065))

(assert (= (or b!77697 b!77689) bm!7058))

(assert (= (or b!77673 bm!7065) bm!7056))

(assert (= (or b!77684 b!77678) bm!7070))

(assert (= (and b!77688 c!11866) b!77698))

(assert (= (and b!77688 (not c!11866)) b!77687))

(assert (= (and b!77687 c!11871) b!77663))

(assert (= (and b!77687 (not c!11871)) b!77675))

(assert (= (and b!77675 c!11874) b!77682))

(assert (= (and b!77675 (not c!11874)) b!77691))

(assert (= (and b!77682 res!40757) b!77694))

(assert (= (and b!77694 res!40752) b!77669))

(assert (= (and b!77691 c!11876) b!77676))

(assert (= (and b!77691 (not c!11876)) b!77674))

(assert (= (and b!77676 res!40753) b!77696))

(assert (= (and b!77696 res!40765) b!77680))

(assert (= (and b!77674 c!11875) b!77690))

(assert (= (and b!77674 (not c!11875)) b!77664))

(assert (= (and b!77690 res!40755) b!77670))

(assert (= (and b!77670 res!40761) b!77677))

(assert (= (or b!77676 b!77690) bm!7062))

(assert (= (or b!77680 b!77677) bm!7063))

(assert (= (or b!77694 bm!7062) bm!7078))

(assert (= (or b!77682 b!77691) bm!7068))

(assert (= (or b!77698 b!77663) bm!7069))

(assert (= (or bm!7056 bm!7078) bm!7061))

(assert (= (or bm!7070 bm!7068) bm!7077))

(assert (= (or bm!7058 bm!7063) bm!7079))

(assert (= (or b!77678 b!77691) bm!7073))

(assert (= (or b!77672 b!77675) bm!7076))

(assert (= (or b!77684 b!77682) bm!7057))

(assert (= (or b!77672 b!77675) bm!7064))

(assert (= (or bm!7075 bm!7076) bm!7067))

(assert (= (or bm!7074 b!77675) bm!7072))

(assert (= (or bm!7071 b!77675) bm!7059))

(assert (= (and d!18403 res!40760) b!77661))

(assert (= (and b!77661 c!11869) b!77666))

(assert (= (and b!77661 (not c!11869)) b!77686))

(assert (= (and b!77666 res!40764) b!77671))

(assert (= (or b!77671 b!77686) bm!7066))

(assert (= (or b!77666 b!77671 b!77686) bm!7060))

(declare-fun m!77815 () Bool)

(assert (=> bm!7059 m!77815))

(assert (=> bm!7066 m!77495))

(assert (=> bm!7079 m!77511))

(declare-fun m!77817 () Bool)

(assert (=> bm!7079 m!77817))

(declare-fun m!77819 () Bool)

(assert (=> bm!7061 m!77819))

(declare-fun m!77821 () Bool)

(assert (=> b!77667 m!77821))

(assert (=> b!77695 m!77511))

(declare-fun m!77823 () Bool)

(assert (=> b!77695 m!77823))

(assert (=> bm!7077 m!77511))

(assert (=> bm!7077 m!77823))

(declare-fun m!77825 () Bool)

(assert (=> b!77662 m!77825))

(assert (=> b!77666 m!77511))

(declare-fun m!77827 () Bool)

(assert (=> b!77666 m!77827))

(declare-fun m!77829 () Bool)

(assert (=> b!77670 m!77829))

(declare-fun m!77831 () Bool)

(assert (=> b!77683 m!77831))

(declare-fun m!77833 () Bool)

(assert (=> b!77696 m!77833))

(declare-fun m!77835 () Bool)

(assert (=> b!77669 m!77835))

(assert (=> bm!7057 m!77511))

(declare-fun m!77837 () Bool)

(assert (=> bm!7057 m!77837))

(declare-fun m!77839 () Bool)

(assert (=> b!77671 m!77839))

(declare-fun m!77841 () Bool)

(assert (=> bm!7072 m!77841))

(declare-fun m!77843 () Bool)

(assert (=> bm!7067 m!77843))

(assert (=> bm!7069 m!77511))

(declare-fun m!77845 () Bool)

(assert (=> bm!7069 m!77845))

(assert (=> b!77675 m!77511))

(declare-fun m!77847 () Bool)

(assert (=> b!77675 m!77847))

(declare-fun m!77849 () Bool)

(assert (=> b!77675 m!77849))

(assert (=> b!77675 m!77511))

(declare-fun m!77851 () Bool)

(assert (=> b!77675 m!77851))

(declare-fun m!77853 () Bool)

(assert (=> b!77675 m!77853))

(declare-fun m!77855 () Bool)

(assert (=> b!77675 m!77855))

(declare-fun m!77857 () Bool)

(assert (=> bm!7060 m!77857))

(declare-fun m!77859 () Bool)

(assert (=> bm!7064 m!77859))

(declare-fun m!77861 () Bool)

(assert (=> bm!7064 m!77861))

(assert (=> bm!7073 m!77511))

(declare-fun m!77863 () Bool)

(assert (=> bm!7073 m!77863))

(declare-fun m!77865 () Bool)

(assert (=> d!18403 m!77865))

(assert (=> d!18403 m!77493))

(declare-fun m!77867 () Bool)

(assert (=> b!77681 m!77867))

(declare-fun m!77869 () Bool)

(assert (=> b!77692 m!77869))

(assert (=> b!77373 d!18403))

(declare-fun d!18405 () Bool)

(assert (=> d!18405 (not (arrayContainsKey!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!35756 () Unit!2241)

(declare-fun choose!68 (array!3961 (_ BitVec 32) (_ BitVec 64) List!1502) Unit!2241)

(assert (=> d!18405 (= lt!35756 (choose!68 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (Cons!1498 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) Nil!1499)))))

(assert (=> d!18405 (bvslt (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18405 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (Cons!1498 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) Nil!1499)) lt!35756)))

(declare-fun bs!3298 () Bool)

(assert (= bs!3298 d!18405))

(assert (=> bs!3298 m!77511))

(assert (=> bs!3298 m!77515))

(assert (=> bs!3298 m!77511))

(declare-fun m!77871 () Bool)

(assert (=> bs!3298 m!77871))

(assert (=> b!77385 d!18405))

(declare-fun d!18407 () Bool)

(assert (=> d!18407 (arrayNoDuplicates!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) from!355 Nil!1499)))

(declare-fun lt!35759 () Unit!2241)

(declare-fun choose!39 (array!3961 (_ BitVec 32) (_ BitVec 32)) Unit!2241)

(assert (=> d!18407 (= lt!35759 (choose!39 (_keys!3926 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!18407 (bvslt (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!18407 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000000 from!355) lt!35759)))

(declare-fun bs!3299 () Bool)

(assert (= bs!3299 d!18407))

(assert (=> bs!3299 m!77509))

(declare-fun m!77873 () Bool)

(assert (=> bs!3299 m!77873))

(assert (=> b!77385 d!18407))

(declare-fun d!18409 () Bool)

(declare-fun res!40770 () Bool)

(declare-fun e!50792 () Bool)

(assert (=> d!18409 (=> res!40770 e!50792)))

(assert (=> d!18409 (= res!40770 (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(assert (=> d!18409 (= (arrayContainsKey!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!50792)))

(declare-fun b!77703 () Bool)

(declare-fun e!50793 () Bool)

(assert (=> b!77703 (= e!50792 e!50793)))

(declare-fun res!40771 () Bool)

(assert (=> b!77703 (=> (not res!40771) (not e!50793))))

(assert (=> b!77703 (= res!40771 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(declare-fun b!77704 () Bool)

(assert (=> b!77704 (= e!50793 (arrayContainsKey!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!18409 (not res!40770)) b!77703))

(assert (= (and b!77703 res!40771) b!77704))

(assert (=> d!18409 m!77623))

(assert (=> b!77704 m!77511))

(declare-fun m!77875 () Bool)

(assert (=> b!77704 m!77875))

(assert (=> b!77385 d!18409))

(declare-fun d!18411 () Bool)

(declare-fun e!50796 () Bool)

(assert (=> d!18411 e!50796))

(declare-fun c!11880 () Bool)

(assert (=> d!18411 (= c!11880 (and (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35762 () Unit!2241)

(declare-fun choose!452 (array!3961 array!3963 (_ BitVec 32) (_ BitVec 32) V!2987 V!2987 (_ BitVec 64) (_ BitVec 32) Int) Unit!2241)

(assert (=> d!18411 (= lt!35762 (choose!452 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))))))

(assert (=> d!18411 (validMask!0 (mask!6259 (v!2584 (underlying!275 thiss!992))))))

(assert (=> d!18411 (= (lemmaListMapContainsThenArrayContainsFrom!59 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (_values!2249 (v!2584 (underlying!275 thiss!992))) (mask!6259 (v!2584 (underlying!275 thiss!992))) (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) (zeroValue!2164 (v!2584 (underlying!275 thiss!992))) (minValue!2164 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992)))) lt!35762)))

(declare-fun b!77709 () Bool)

(assert (=> b!77709 (= e!50796 (arrayContainsKey!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!77710 () Bool)

(assert (=> b!77710 (= e!50796 (ite (= (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2117 (v!2584 (underlying!275 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18411 c!11880) b!77709))

(assert (= (and d!18411 (not c!11880)) b!77710))

(assert (=> d!18411 m!77511))

(declare-fun m!77877 () Bool)

(assert (=> d!18411 m!77877))

(assert (=> d!18411 m!77537))

(assert (=> b!77709 m!77511))

(assert (=> b!77709 m!77515))

(assert (=> b!77385 d!18411))

(declare-fun b!77721 () Bool)

(declare-fun e!50808 () Bool)

(declare-fun call!7085 () Bool)

(assert (=> b!77721 (= e!50808 call!7085)))

(declare-fun b!77722 () Bool)

(declare-fun e!50806 () Bool)

(assert (=> b!77722 (= e!50806 e!50808)))

(declare-fun c!11883 () Bool)

(assert (=> b!77722 (= c!11883 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun b!77723 () Bool)

(declare-fun e!50805 () Bool)

(assert (=> b!77723 (= e!50805 e!50806)))

(declare-fun res!40778 () Bool)

(assert (=> b!77723 (=> (not res!40778) (not e!50806))))

(declare-fun e!50807 () Bool)

(assert (=> b!77723 (= res!40778 (not e!50807))))

(declare-fun res!40779 () Bool)

(assert (=> b!77723 (=> (not res!40779) (not e!50807))))

(assert (=> b!77723 (= res!40779 (validKeyInArray!0 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun b!77724 () Bool)

(assert (=> b!77724 (= e!50808 call!7085)))

(declare-fun d!18413 () Bool)

(declare-fun res!40780 () Bool)

(assert (=> d!18413 (=> res!40780 e!50805)))

(assert (=> d!18413 (= res!40780 (bvsge from!355 (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992))))))))

(assert (=> d!18413 (= (arrayNoDuplicates!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) from!355 Nil!1499) e!50805)))

(declare-fun bm!7082 () Bool)

(assert (=> bm!7082 (= call!7085 (arrayNoDuplicates!0 (_keys!3926 (v!2584 (underlying!275 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11883 (Cons!1498 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355) Nil!1499) Nil!1499)))))

(declare-fun b!77725 () Bool)

(declare-fun contains!740 (List!1502 (_ BitVec 64)) Bool)

(assert (=> b!77725 (= e!50807 (contains!740 Nil!1499 (select (arr!1889 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(assert (= (and d!18413 (not res!40780)) b!77723))

(assert (= (and b!77723 res!40779) b!77725))

(assert (= (and b!77723 res!40778) b!77722))

(assert (= (and b!77722 c!11883) b!77724))

(assert (= (and b!77722 (not c!11883)) b!77721))

(assert (= (or b!77724 b!77721) bm!7082))

(assert (=> b!77722 m!77511))

(assert (=> b!77722 m!77511))

(declare-fun m!77879 () Bool)

(assert (=> b!77722 m!77879))

(assert (=> b!77723 m!77511))

(assert (=> b!77723 m!77511))

(assert (=> b!77723 m!77879))

(assert (=> bm!7082 m!77511))

(declare-fun m!77881 () Bool)

(assert (=> bm!7082 m!77881))

(assert (=> b!77725 m!77511))

(assert (=> b!77725 m!77511))

(declare-fun m!77883 () Bool)

(assert (=> b!77725 m!77883))

(assert (=> b!77385 d!18413))

(declare-fun d!18415 () Bool)

(declare-fun c!11886 () Bool)

(assert (=> d!18415 (= c!11886 ((_ is ValueCellFull!909) (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) from!355)))))

(declare-fun e!50811 () V!2987)

(assert (=> d!18415 (= (get!1167 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!50811)))

(declare-fun b!77730 () Bool)

(declare-fun get!1168 (ValueCell!909 V!2987) V!2987)

(assert (=> b!77730 (= e!50811 (get!1168 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!77731 () Bool)

(declare-fun get!1169 (ValueCell!909 V!2987) V!2987)

(assert (=> b!77731 (= e!50811 (get!1169 (select (arr!1890 (_values!2249 (v!2584 (underlying!275 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18415 c!11886) b!77730))

(assert (= (and d!18415 (not c!11886)) b!77731))

(assert (=> b!77730 m!77519))

(assert (=> b!77730 m!77521))

(declare-fun m!77885 () Bool)

(assert (=> b!77730 m!77885))

(assert (=> b!77731 m!77519))

(assert (=> b!77731 m!77521))

(declare-fun m!77887 () Bool)

(assert (=> b!77731 m!77887))

(assert (=> b!77383 d!18415))

(declare-fun d!18417 () Bool)

(assert (=> d!18417 (= (valid!307 thiss!992) (valid!308 (v!2584 (underlying!275 thiss!992))))))

(declare-fun bs!3300 () Bool)

(assert (= bs!3300 d!18417))

(declare-fun m!77889 () Bool)

(assert (=> bs!3300 m!77889))

(assert (=> start!10144 d!18417))

(declare-fun d!18419 () Bool)

(assert (=> d!18419 (= (array_inv!1165 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) (bvsge (size!2130 (_keys!3926 (v!2584 (underlying!275 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77374 d!18419))

(declare-fun d!18421 () Bool)

(assert (=> d!18421 (= (array_inv!1166 (_values!2249 (v!2584 (underlying!275 thiss!992)))) (bvsge (size!2131 (_values!2249 (v!2584 (underlying!275 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!77374 d!18421))

(declare-fun b!77739 () Bool)

(declare-fun e!50816 () Bool)

(assert (=> b!77739 (= e!50816 tp_is_empty!2505)))

(declare-fun mapNonEmpty!3291 () Bool)

(declare-fun mapRes!3291 () Bool)

(declare-fun tp!8745 () Bool)

(declare-fun e!50817 () Bool)

(assert (=> mapNonEmpty!3291 (= mapRes!3291 (and tp!8745 e!50817))))

(declare-fun mapKey!3291 () (_ BitVec 32))

(declare-fun mapValue!3291 () ValueCell!909)

(declare-fun mapRest!3291 () (Array (_ BitVec 32) ValueCell!909))

(assert (=> mapNonEmpty!3291 (= mapRest!3282 (store mapRest!3291 mapKey!3291 mapValue!3291))))

(declare-fun mapIsEmpty!3291 () Bool)

(assert (=> mapIsEmpty!3291 mapRes!3291))

(declare-fun b!77738 () Bool)

(assert (=> b!77738 (= e!50817 tp_is_empty!2505)))

(declare-fun condMapEmpty!3291 () Bool)

(declare-fun mapDefault!3291 () ValueCell!909)

(assert (=> mapNonEmpty!3282 (= condMapEmpty!3291 (= mapRest!3282 ((as const (Array (_ BitVec 32) ValueCell!909)) mapDefault!3291)))))

(assert (=> mapNonEmpty!3282 (= tp!8727 (and e!50816 mapRes!3291))))

(assert (= (and mapNonEmpty!3282 condMapEmpty!3291) mapIsEmpty!3291))

(assert (= (and mapNonEmpty!3282 (not condMapEmpty!3291)) mapNonEmpty!3291))

(assert (= (and mapNonEmpty!3291 ((_ is ValueCellFull!909) mapValue!3291)) b!77738))

(assert (= (and mapNonEmpty!3282 ((_ is ValueCellFull!909) mapDefault!3291)) b!77739))

(declare-fun m!77891 () Bool)

(assert (=> mapNonEmpty!3291 m!77891))

(declare-fun b!77741 () Bool)

(declare-fun e!50818 () Bool)

(assert (=> b!77741 (= e!50818 tp_is_empty!2505)))

(declare-fun mapNonEmpty!3292 () Bool)

(declare-fun mapRes!3292 () Bool)

(declare-fun tp!8746 () Bool)

(declare-fun e!50819 () Bool)

(assert (=> mapNonEmpty!3292 (= mapRes!3292 (and tp!8746 e!50819))))

(declare-fun mapValue!3292 () ValueCell!909)

(declare-fun mapKey!3292 () (_ BitVec 32))

(declare-fun mapRest!3292 () (Array (_ BitVec 32) ValueCell!909))

(assert (=> mapNonEmpty!3292 (= mapRest!3281 (store mapRest!3292 mapKey!3292 mapValue!3292))))

(declare-fun mapIsEmpty!3292 () Bool)

(assert (=> mapIsEmpty!3292 mapRes!3292))

(declare-fun b!77740 () Bool)

(assert (=> b!77740 (= e!50819 tp_is_empty!2505)))

(declare-fun condMapEmpty!3292 () Bool)

(declare-fun mapDefault!3292 () ValueCell!909)

(assert (=> mapNonEmpty!3281 (= condMapEmpty!3292 (= mapRest!3281 ((as const (Array (_ BitVec 32) ValueCell!909)) mapDefault!3292)))))

(assert (=> mapNonEmpty!3281 (= tp!8729 (and e!50818 mapRes!3292))))

(assert (= (and mapNonEmpty!3281 condMapEmpty!3292) mapIsEmpty!3292))

(assert (= (and mapNonEmpty!3281 (not condMapEmpty!3292)) mapNonEmpty!3292))

(assert (= (and mapNonEmpty!3292 ((_ is ValueCellFull!909) mapValue!3292)) b!77740))

(assert (= (and mapNonEmpty!3281 ((_ is ValueCellFull!909) mapDefault!3292)) b!77741))

(declare-fun m!77893 () Bool)

(assert (=> mapNonEmpty!3292 m!77893))

(declare-fun b_lambda!3481 () Bool)

(assert (= b_lambda!3479 (or (and b!77374 b_free!2177) (and b!77372 b_free!2179 (= (defaultEntry!2266 newMap!16) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))))) b_lambda!3481)))

(declare-fun b_lambda!3483 () Bool)

(assert (= b_lambda!3477 (or (and b!77374 b_free!2177) (and b!77372 b_free!2179 (= (defaultEntry!2266 newMap!16) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))))) b_lambda!3483)))

(declare-fun b_lambda!3485 () Bool)

(assert (= b_lambda!3475 (or (and b!77374 b_free!2177) (and b!77372 b_free!2179 (= (defaultEntry!2266 newMap!16) (defaultEntry!2266 (v!2584 (underlying!275 thiss!992))))) b_lambda!3485)))

(check-sat (not d!18391) (not b!77560) (not b!77709) (not d!18377) (not b_next!2177) b_and!4781 (not b!77558) (not bm!7066) (not d!18411) (not bm!7077) (not b!77731) (not d!18369) (not b_next!2179) (not bm!7000) (not d!18401) (not b!77671) (not bm!7073) (not b!77552) (not bm!7003) (not d!18417) (not b!77564) (not b!77667) (not b!77566) (not d!18379) (not b!77723) (not b!77559) (not b_lambda!3483) (not d!18389) (not b_lambda!3485) (not d!18395) (not b!77501) (not b!77550) (not b!77549) (not b!77573) (not b!77498) (not b!77675) (not b!77551) (not bm!7067) (not b!77509) (not b!77557) (not b!77575) (not b!77574) (not b!77494) (not b!77546) (not b!77561) (not b!77562) (not bm!7007) (not bm!7072) (not b!77666) (not bm!7064) (not d!18397) (not mapNonEmpty!3292) (not bm!7061) (not b!77544) tp_is_empty!2505 (not d!18383) (not b!77517) (not b!77692) (not b!77563) (not b!77496) (not bm!6998) b_and!4779 (not b!77511) (not b!77495) (not d!18403) (not b!77722) (not b!77565) (not d!18405) (not b!77518) (not d!18399) (not d!18381) (not bm!7082) (not bm!6999) (not b!77695) (not b!77704) (not b!77512) (not b_lambda!3481) (not b!77556) (not bm!7079) (not b!77725) (not b!77555) (not d!18385) (not bm!7060) (not b!77730) (not d!18407) (not bm!7059) (not b!77548) (not d!18387) (not b!77543) (not b!77582) (not b_lambda!3473) (not d!18371) (not mapNonEmpty!3291) (not bm!7057) (not b!77584) (not bm!7069))
(check-sat b_and!4779 b_and!4781 (not b_next!2177) (not b_next!2179))
