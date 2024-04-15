; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10842 () Bool)

(assert start!10842)

(declare-fun b!87528 () Bool)

(declare-fun b_free!2245 () Bool)

(declare-fun b_next!2245 () Bool)

(assert (=> b!87528 (= b_free!2245 (not b_next!2245))))

(declare-fun tp!8967 () Bool)

(declare-fun b_and!5261 () Bool)

(assert (=> b!87528 (= tp!8967 b_and!5261)))

(declare-fun b!87539 () Bool)

(declare-fun b_free!2247 () Bool)

(declare-fun b_next!2247 () Bool)

(assert (=> b!87539 (= b_free!2247 (not b_next!2247))))

(declare-fun tp!8968 () Bool)

(declare-fun b_and!5263 () Bool)

(assert (=> b!87539 (= tp!8968 b_and!5263)))

(declare-fun b!87521 () Bool)

(declare-fun e!57029 () Bool)

(declare-fun e!57030 () Bool)

(assert (=> b!87521 (= e!57029 (not e!57030))))

(declare-fun res!44900 () Bool)

(assert (=> b!87521 (=> res!44900 e!57030)))

(declare-datatypes ((V!3033 0))(
  ( (V!3034 (val!1314 Int)) )
))
(declare-datatypes ((array!4019 0))(
  ( (array!4020 (arr!1912 (Array (_ BitVec 32) (_ BitVec 64))) (size!2158 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!926 0))(
  ( (ValueCellFull!926 (v!2653 V!3033)) (EmptyCell!926) )
))
(declare-datatypes ((array!4021 0))(
  ( (array!4022 (arr!1913 (Array (_ BitVec 32) ValueCell!926)) (size!2159 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!760 0))(
  ( (LongMapFixedSize!761 (defaultEntry!2358 Int) (mask!6395 (_ BitVec 32)) (extraKeys!2193 (_ BitVec 32)) (zeroValue!2248 V!3033) (minValue!2248 V!3033) (_size!429 (_ BitVec 32)) (_keys!4033 array!4019) (_values!2341 array!4021) (_vacant!429 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!554 0))(
  ( (Cell!555 (v!2654 LongMapFixedSize!760)) )
))
(declare-datatypes ((LongMap!554 0))(
  ( (LongMap!555 (underlying!288 Cell!554)) )
))
(declare-fun thiss!992 () LongMap!554)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!87521 (= res!44900 (not (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))))

(declare-datatypes ((tuple2!2210 0))(
  ( (tuple2!2211 (_1!1116 (_ BitVec 64)) (_2!1116 V!3033)) )
))
(declare-datatypes ((List!1530 0))(
  ( (Nil!1527) (Cons!1526 (h!2118 tuple2!2210) (t!5263 List!1530)) )
))
(declare-datatypes ((ListLongMap!1453 0))(
  ( (ListLongMap!1454 (toList!742 List!1530)) )
))
(declare-fun lt!41557 () ListLongMap!1453)

(declare-fun lt!41560 () ListLongMap!1453)

(declare-fun lt!41572 () tuple2!2210)

(declare-fun lt!41562 () tuple2!2210)

(declare-fun +!110 (ListLongMap!1453 tuple2!2210) ListLongMap!1453)

(assert (=> b!87521 (= (+!110 lt!41557 lt!41572) (+!110 (+!110 lt!41560 lt!41572) lt!41562))))

(assert (=> b!87521 (= lt!41572 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41566 () V!3033)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Unit!2598 0))(
  ( (Unit!2599) )
))
(declare-fun lt!41565 () Unit!2598)

(declare-fun addCommutativeForDiffKeys!29 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64) V!3033) Unit!2598)

(assert (=> b!87521 (= lt!41565 (addCommutativeForDiffKeys!29 lt!41560 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41558 () ListLongMap!1453)

(assert (=> b!87521 (= lt!41558 lt!41557)))

(assert (=> b!87521 (= lt!41557 (+!110 lt!41560 lt!41562))))

(declare-fun lt!41563 () ListLongMap!1453)

(declare-fun lt!41556 () tuple2!2210)

(assert (=> b!87521 (= lt!41558 (+!110 lt!41563 lt!41556))))

(declare-fun lt!41569 () ListLongMap!1453)

(assert (=> b!87521 (= lt!41560 (+!110 lt!41569 lt!41556))))

(assert (=> b!87521 (= lt!41556 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(assert (=> b!87521 (= lt!41563 (+!110 lt!41569 lt!41562))))

(assert (=> b!87521 (= lt!41562 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))

(declare-fun lt!41570 () Unit!2598)

(assert (=> b!87521 (= lt!41570 (addCommutativeForDiffKeys!29 lt!41569 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!74 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!87521 (= lt!41569 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87522 () Bool)

(declare-fun e!57025 () Bool)

(declare-fun e!57028 () Bool)

(assert (=> b!87522 (= e!57025 e!57028)))

(declare-fun res!44902 () Bool)

(assert (=> b!87522 (=> (not res!44902) (not e!57028))))

(declare-fun lt!41568 () ListLongMap!1453)

(declare-fun lt!41555 () ListLongMap!1453)

(assert (=> b!87522 (= res!44902 (= lt!41568 lt!41555))))

(declare-fun newMap!16 () LongMapFixedSize!760)

(declare-fun map!1189 (LongMapFixedSize!760) ListLongMap!1453)

(assert (=> b!87522 (= lt!41555 (map!1189 newMap!16))))

(declare-fun getCurrentListMap!427 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) ListLongMap!1453)

(assert (=> b!87522 (= lt!41568 (getCurrentListMap!427 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87523 () Bool)

(declare-fun e!57024 () Bool)

(assert (=> b!87523 (= e!57028 e!57024)))

(declare-fun res!44906 () Bool)

(assert (=> b!87523 (=> (not res!44906) (not e!57024))))

(assert (=> b!87523 (= res!44906 (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1207 (ValueCell!926 V!3033) V!3033)

(declare-fun dynLambda!345 (Int (_ BitVec 64)) V!3033)

(assert (=> b!87523 (= lt!41566 (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87524 () Bool)

(declare-fun res!44908 () Bool)

(assert (=> b!87524 (=> (not res!44908) (not e!57025))))

(assert (=> b!87524 (= res!44908 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun b!87525 () Bool)

(declare-fun res!44907 () Bool)

(assert (=> b!87525 (=> (not res!44907) (not e!57025))))

(declare-fun valid!338 (LongMapFixedSize!760) Bool)

(assert (=> b!87525 (= res!44907 (valid!338 newMap!16))))

(declare-fun b!87526 () Bool)

(declare-fun e!57026 () Bool)

(declare-fun e!57031 () Bool)

(declare-fun mapRes!3420 () Bool)

(assert (=> b!87526 (= e!57026 (and e!57031 mapRes!3420))))

(declare-fun condMapEmpty!3420 () Bool)

(declare-fun mapDefault!3419 () ValueCell!926)

(assert (=> b!87526 (= condMapEmpty!3420 (= (arr!1913 (_values!2341 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3419)))))

(declare-fun b!87527 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4019 (_ BitVec 32)) Bool)

(assert (=> b!87527 (= e!57030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun e!57027 () Bool)

(declare-fun tp_is_empty!2539 () Bool)

(declare-fun e!57022 () Bool)

(declare-fun array_inv!1201 (array!4019) Bool)

(declare-fun array_inv!1202 (array!4021) Bool)

(assert (=> b!87528 (= e!57022 (and tp!8967 tp_is_empty!2539 (array_inv!1201 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (array_inv!1202 (_values!2341 (v!2654 (underlying!288 thiss!992)))) e!57027))))

(declare-fun b!87529 () Bool)

(declare-fun e!57018 () Bool)

(assert (=> b!87529 (= e!57018 e!57022)))

(declare-fun b!87530 () Bool)

(declare-fun e!57017 () Unit!2598)

(declare-fun Unit!2600 () Unit!2598)

(assert (=> b!87530 (= e!57017 Unit!2600)))

(declare-fun b!87531 () Bool)

(assert (=> b!87531 (= e!57031 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3419 () Bool)

(assert (=> mapIsEmpty!3419 mapRes!3420))

(declare-fun b!87532 () Bool)

(declare-fun e!57016 () Bool)

(assert (=> b!87532 (= e!57016 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3419 () Bool)

(declare-fun tp!8970 () Bool)

(declare-fun e!57023 () Bool)

(assert (=> mapNonEmpty!3419 (= mapRes!3420 (and tp!8970 e!57023))))

(declare-fun mapRest!3419 () (Array (_ BitVec 32) ValueCell!926))

(declare-fun mapKey!3419 () (_ BitVec 32))

(declare-fun mapValue!3419 () ValueCell!926)

(assert (=> mapNonEmpty!3419 (= (arr!1913 (_values!2341 newMap!16)) (store mapRest!3419 mapKey!3419 mapValue!3419))))

(declare-fun b!87533 () Bool)

(assert (=> b!87533 (= e!57023 tp_is_empty!2539)))

(declare-fun b!87534 () Bool)

(declare-fun e!57021 () Bool)

(assert (=> b!87534 (= e!57021 e!57018)))

(declare-fun b!87535 () Bool)

(declare-fun e!57019 () Bool)

(assert (=> b!87535 (= e!57019 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3420 () Bool)

(declare-fun mapRes!3419 () Bool)

(assert (=> mapIsEmpty!3420 mapRes!3419))

(declare-fun b!87536 () Bool)

(declare-fun res!44903 () Bool)

(assert (=> b!87536 (=> res!44903 e!57030)))

(assert (=> b!87536 (= res!44903 (or (not (= (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6395 (v!2654 (underlying!288 thiss!992)))))) (not (= (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992)))))) (bvslt (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!87537 () Bool)

(declare-fun Unit!2601 () Unit!2598)

(assert (=> b!87537 (= e!57017 Unit!2601)))

(declare-fun lt!41561 () Unit!2598)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!69 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2598)

(assert (=> b!87537 (= lt!41561 (lemmaListMapContainsThenArrayContainsFrom!69 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!87537 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!41571 () Unit!2598)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4019 (_ BitVec 32) (_ BitVec 32)) Unit!2598)

(assert (=> b!87537 (= lt!41571 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1531 0))(
  ( (Nil!1528) (Cons!1527 (h!2119 (_ BitVec 64)) (t!5264 List!1531)) )
))
(declare-fun arrayNoDuplicates!0 (array!4019 (_ BitVec 32) List!1531) Bool)

(assert (=> b!87537 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) from!355 Nil!1528)))

(declare-fun lt!41559 () Unit!2598)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4019 (_ BitVec 32) (_ BitVec 64) List!1531) Unit!2598)

(assert (=> b!87537 (= lt!41559 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528)))))

(assert (=> b!87537 false))

(declare-fun b!87538 () Bool)

(declare-fun res!44901 () Bool)

(assert (=> b!87538 (=> (not res!44901) (not e!57025))))

(assert (=> b!87538 (= res!44901 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6395 newMap!16)) (_size!429 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun mapNonEmpty!3420 () Bool)

(declare-fun tp!8969 () Bool)

(assert (=> mapNonEmpty!3420 (= mapRes!3419 (and tp!8969 e!57019))))

(declare-fun mapRest!3420 () (Array (_ BitVec 32) ValueCell!926))

(declare-fun mapKey!3420 () (_ BitVec 32))

(declare-fun mapValue!3420 () ValueCell!926)

(assert (=> mapNonEmpty!3420 (= (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (store mapRest!3420 mapKey!3420 mapValue!3420))))

(declare-fun res!44905 () Bool)

(assert (=> start!10842 (=> (not res!44905) (not e!57025))))

(declare-fun valid!339 (LongMap!554) Bool)

(assert (=> start!10842 (= res!44905 (valid!339 thiss!992))))

(assert (=> start!10842 e!57025))

(assert (=> start!10842 e!57021))

(assert (=> start!10842 true))

(declare-fun e!57020 () Bool)

(assert (=> start!10842 e!57020))

(assert (=> b!87539 (= e!57020 (and tp!8968 tp_is_empty!2539 (array_inv!1201 (_keys!4033 newMap!16)) (array_inv!1202 (_values!2341 newMap!16)) e!57026))))

(declare-fun b!87540 () Bool)

(assert (=> b!87540 (= e!57027 (and e!57016 mapRes!3419))))

(declare-fun condMapEmpty!3419 () Bool)

(declare-fun mapDefault!3420 () ValueCell!926)

(assert (=> b!87540 (= condMapEmpty!3419 (= (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3420)))))

(declare-fun b!87541 () Bool)

(assert (=> b!87541 (= e!57024 e!57029)))

(declare-fun res!44904 () Bool)

(assert (=> b!87541 (=> (not res!44904) (not e!57029))))

(declare-datatypes ((tuple2!2212 0))(
  ( (tuple2!2213 (_1!1117 Bool) (_2!1117 LongMapFixedSize!760)) )
))
(declare-fun lt!41564 () tuple2!2212)

(assert (=> b!87541 (= res!44904 (and (_1!1117 lt!41564) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!41567 () Unit!2598)

(assert (=> b!87541 (= lt!41567 e!57017)))

(declare-fun c!14421 () Bool)

(declare-fun contains!755 (ListLongMap!1453 (_ BitVec 64)) Bool)

(assert (=> b!87541 (= c!14421 (contains!755 lt!41555 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun update!123 (LongMapFixedSize!760 (_ BitVec 64) V!3033) tuple2!2212)

(assert (=> b!87541 (= lt!41564 (update!123 newMap!16 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))

(assert (= (and start!10842 res!44905) b!87524))

(assert (= (and b!87524 res!44908) b!87525))

(assert (= (and b!87525 res!44907) b!87538))

(assert (= (and b!87538 res!44901) b!87522))

(assert (= (and b!87522 res!44902) b!87523))

(assert (= (and b!87523 res!44906) b!87541))

(assert (= (and b!87541 c!14421) b!87537))

(assert (= (and b!87541 (not c!14421)) b!87530))

(assert (= (and b!87541 res!44904) b!87521))

(assert (= (and b!87521 (not res!44900)) b!87536))

(assert (= (and b!87536 (not res!44903)) b!87527))

(assert (= (and b!87540 condMapEmpty!3419) mapIsEmpty!3420))

(assert (= (and b!87540 (not condMapEmpty!3419)) mapNonEmpty!3420))

(get-info :version)

(assert (= (and mapNonEmpty!3420 ((_ is ValueCellFull!926) mapValue!3420)) b!87535))

(assert (= (and b!87540 ((_ is ValueCellFull!926) mapDefault!3420)) b!87532))

(assert (= b!87528 b!87540))

(assert (= b!87529 b!87528))

(assert (= b!87534 b!87529))

(assert (= start!10842 b!87534))

(assert (= (and b!87526 condMapEmpty!3420) mapIsEmpty!3419))

(assert (= (and b!87526 (not condMapEmpty!3420)) mapNonEmpty!3419))

(assert (= (and mapNonEmpty!3419 ((_ is ValueCellFull!926) mapValue!3419)) b!87533))

(assert (= (and b!87526 ((_ is ValueCellFull!926) mapDefault!3419)) b!87531))

(assert (= b!87539 b!87526))

(assert (= start!10842 b!87539))

(declare-fun b_lambda!3879 () Bool)

(assert (=> (not b_lambda!3879) (not b!87523)))

(declare-fun t!5260 () Bool)

(declare-fun tb!1701 () Bool)

(assert (=> (and b!87528 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) t!5260) tb!1701))

(declare-fun result!2931 () Bool)

(assert (=> tb!1701 (= result!2931 tp_is_empty!2539)))

(assert (=> b!87523 t!5260))

(declare-fun b_and!5265 () Bool)

(assert (= b_and!5261 (and (=> t!5260 result!2931) b_and!5265)))

(declare-fun t!5262 () Bool)

(declare-fun tb!1703 () Bool)

(assert (=> (and b!87539 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) t!5262) tb!1703))

(declare-fun result!2935 () Bool)

(assert (= result!2935 result!2931))

(assert (=> b!87523 t!5262))

(declare-fun b_and!5267 () Bool)

(assert (= b_and!5263 (and (=> t!5262 result!2935) b_and!5267)))

(declare-fun m!93243 () Bool)

(assert (=> b!87525 m!93243))

(declare-fun m!93245 () Bool)

(assert (=> b!87528 m!93245))

(declare-fun m!93247 () Bool)

(assert (=> b!87528 m!93247))

(declare-fun m!93249 () Bool)

(assert (=> b!87521 m!93249))

(declare-fun m!93251 () Bool)

(assert (=> b!87521 m!93251))

(declare-fun m!93253 () Bool)

(assert (=> b!87521 m!93253))

(declare-fun m!93255 () Bool)

(assert (=> b!87521 m!93255))

(assert (=> b!87521 m!93253))

(declare-fun m!93257 () Bool)

(assert (=> b!87521 m!93257))

(declare-fun m!93259 () Bool)

(assert (=> b!87521 m!93259))

(declare-fun m!93261 () Bool)

(assert (=> b!87521 m!93261))

(declare-fun m!93263 () Bool)

(assert (=> b!87521 m!93263))

(declare-fun m!93265 () Bool)

(assert (=> b!87521 m!93265))

(assert (=> b!87521 m!93261))

(declare-fun m!93267 () Bool)

(assert (=> b!87521 m!93267))

(declare-fun m!93269 () Bool)

(assert (=> b!87521 m!93269))

(assert (=> b!87521 m!93253))

(declare-fun m!93271 () Bool)

(assert (=> b!87521 m!93271))

(assert (=> b!87541 m!93253))

(assert (=> b!87541 m!93253))

(declare-fun m!93273 () Bool)

(assert (=> b!87541 m!93273))

(assert (=> b!87541 m!93253))

(declare-fun m!93275 () Bool)

(assert (=> b!87541 m!93275))

(declare-fun m!93277 () Bool)

(assert (=> b!87527 m!93277))

(declare-fun m!93279 () Bool)

(assert (=> b!87539 m!93279))

(declare-fun m!93281 () Bool)

(assert (=> b!87539 m!93281))

(declare-fun m!93283 () Bool)

(assert (=> mapNonEmpty!3419 m!93283))

(declare-fun m!93285 () Bool)

(assert (=> b!87522 m!93285))

(declare-fun m!93287 () Bool)

(assert (=> b!87522 m!93287))

(declare-fun m!93289 () Bool)

(assert (=> start!10842 m!93289))

(assert (=> b!87523 m!93253))

(declare-fun m!93291 () Bool)

(assert (=> b!87523 m!93291))

(declare-fun m!93293 () Bool)

(assert (=> b!87523 m!93293))

(assert (=> b!87523 m!93291))

(assert (=> b!87523 m!93293))

(declare-fun m!93295 () Bool)

(assert (=> b!87523 m!93295))

(declare-fun m!93297 () Bool)

(assert (=> b!87537 m!93297))

(declare-fun m!93299 () Bool)

(assert (=> b!87537 m!93299))

(assert (=> b!87537 m!93253))

(declare-fun m!93301 () Bool)

(assert (=> b!87537 m!93301))

(assert (=> b!87537 m!93253))

(assert (=> b!87537 m!93253))

(declare-fun m!93303 () Bool)

(assert (=> b!87537 m!93303))

(assert (=> b!87537 m!93253))

(declare-fun m!93305 () Bool)

(assert (=> b!87537 m!93305))

(declare-fun m!93307 () Bool)

(assert (=> mapNonEmpty!3420 m!93307))

(check-sat (not mapNonEmpty!3419) (not b_next!2247) (not b!87522) (not b!87521) (not b!87537) (not mapNonEmpty!3420) (not b!87523) (not b!87527) (not b_lambda!3879) (not b_next!2245) b_and!5267 b_and!5265 (not b!87541) (not start!10842) (not b!87539) tp_is_empty!2539 (not b!87525) (not b!87528))
(check-sat b_and!5265 b_and!5267 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun b_lambda!3885 () Bool)

(assert (= b_lambda!3879 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3885)))

(check-sat (not b_next!2247) (not b!87522) (not b!87521) (not b!87537) (not mapNonEmpty!3420) (not b!87523) (not b!87527) (not b_next!2245) b_and!5267 (not mapNonEmpty!3419) (not b_lambda!3885) b_and!5265 (not b!87541) (not start!10842) (not b!87539) tp_is_empty!2539 (not b!87525) (not b!87528))
(check-sat b_and!5265 b_and!5267 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun d!23275 () Bool)

(declare-fun res!44969 () Bool)

(declare-fun e!57144 () Bool)

(assert (=> d!23275 (=> (not res!44969) (not e!57144))))

(declare-fun simpleValid!59 (LongMapFixedSize!760) Bool)

(assert (=> d!23275 (= res!44969 (simpleValid!59 newMap!16))))

(assert (=> d!23275 (= (valid!338 newMap!16) e!57144)))

(declare-fun b!87680 () Bool)

(declare-fun res!44970 () Bool)

(assert (=> b!87680 (=> (not res!44970) (not e!57144))))

(declare-fun arrayCountValidKeys!0 (array!4019 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!87680 (= res!44970 (= (arrayCountValidKeys!0 (_keys!4033 newMap!16) #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (_size!429 newMap!16)))))

(declare-fun b!87681 () Bool)

(declare-fun res!44971 () Bool)

(assert (=> b!87681 (=> (not res!44971) (not e!57144))))

(assert (=> b!87681 (= res!44971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun b!87682 () Bool)

(assert (=> b!87682 (= e!57144 (arrayNoDuplicates!0 (_keys!4033 newMap!16) #b00000000000000000000000000000000 Nil!1528))))

(assert (= (and d!23275 res!44969) b!87680))

(assert (= (and b!87680 res!44970) b!87681))

(assert (= (and b!87681 res!44971) b!87682))

(declare-fun m!93441 () Bool)

(assert (=> d!23275 m!93441))

(declare-fun m!93443 () Bool)

(assert (=> b!87680 m!93443))

(declare-fun m!93445 () Bool)

(assert (=> b!87681 m!93445))

(declare-fun m!93447 () Bool)

(assert (=> b!87682 m!93447))

(assert (=> b!87525 d!23275))

(declare-fun b!87691 () Bool)

(declare-fun e!57152 () Bool)

(declare-fun call!8354 () Bool)

(assert (=> b!87691 (= e!57152 call!8354)))

(declare-fun b!87692 () Bool)

(declare-fun e!57151 () Bool)

(assert (=> b!87692 (= e!57151 e!57152)))

(declare-fun lt!41688 () (_ BitVec 64))

(assert (=> b!87692 (= lt!41688 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!41689 () Unit!2598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4019 (_ BitVec 64) (_ BitVec 32)) Unit!2598)

(assert (=> b!87692 (= lt!41689 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000))))

(assert (=> b!87692 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000)))

(declare-fun lt!41687 () Unit!2598)

(assert (=> b!87692 (= lt!41687 lt!41689)))

(declare-fun res!44976 () Bool)

(declare-datatypes ((SeekEntryResult!247 0))(
  ( (MissingZero!247 (index!3126 (_ BitVec 32))) (Found!247 (index!3127 (_ BitVec 32))) (Intermediate!247 (undefined!1059 Bool) (index!3128 (_ BitVec 32)) (x!12143 (_ BitVec 32))) (Undefined!247) (MissingVacant!247 (index!3129 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4019 (_ BitVec 32)) SeekEntryResult!247)

(assert (=> b!87692 (= res!44976 (= (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))) (Found!247 #b00000000000000000000000000000000)))))

(assert (=> b!87692 (=> (not res!44976) (not e!57152))))

(declare-fun b!87693 () Bool)

(assert (=> b!87693 (= e!57151 call!8354)))

(declare-fun bm!8351 () Bool)

(assert (=> bm!8351 (= call!8354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87694 () Bool)

(declare-fun e!57153 () Bool)

(assert (=> b!87694 (= e!57153 e!57151)))

(declare-fun c!14430 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!87694 (= c!14430 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!23277 () Bool)

(declare-fun res!44977 () Bool)

(assert (=> d!23277 (=> res!44977 e!57153)))

(assert (=> d!23277 (= res!44977 (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))) e!57153)))

(assert (= (and d!23277 (not res!44977)) b!87694))

(assert (= (and b!87694 c!14430) b!87692))

(assert (= (and b!87694 (not c!14430)) b!87693))

(assert (= (and b!87692 res!44976) b!87691))

(assert (= (or b!87691 b!87693) bm!8351))

(declare-fun m!93449 () Bool)

(assert (=> b!87692 m!93449))

(declare-fun m!93451 () Bool)

(assert (=> b!87692 m!93451))

(declare-fun m!93453 () Bool)

(assert (=> b!87692 m!93453))

(assert (=> b!87692 m!93449))

(declare-fun m!93455 () Bool)

(assert (=> b!87692 m!93455))

(declare-fun m!93457 () Bool)

(assert (=> bm!8351 m!93457))

(assert (=> b!87694 m!93449))

(assert (=> b!87694 m!93449))

(declare-fun m!93459 () Bool)

(assert (=> b!87694 m!93459))

(assert (=> b!87527 d!23277))

(declare-fun d!23279 () Bool)

(assert (=> d!23279 (= (array_inv!1201 (_keys!4033 newMap!16)) (bvsge (size!2158 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87539 d!23279))

(declare-fun d!23281 () Bool)

(assert (=> d!23281 (= (array_inv!1202 (_values!2341 newMap!16)) (bvsge (size!2159 (_values!2341 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87539 d!23281))

(declare-fun d!23283 () Bool)

(assert (=> d!23283 (= (+!110 (+!110 lt!41569 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (+!110 (+!110 lt!41569 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(declare-fun lt!41692 () Unit!2598)

(declare-fun choose!520 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64) V!3033) Unit!2598)

(assert (=> d!23283 (= lt!41692 (choose!520 lt!41569 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(assert (=> d!23283 (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23283 (= (addCommutativeForDiffKeys!29 lt!41569 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) lt!41692)))

(declare-fun bs!3705 () Bool)

(assert (= bs!3705 d!23283))

(assert (=> bs!3705 m!93253))

(declare-fun m!93461 () Bool)

(assert (=> bs!3705 m!93461))

(declare-fun m!93463 () Bool)

(assert (=> bs!3705 m!93463))

(assert (=> bs!3705 m!93463))

(declare-fun m!93465 () Bool)

(assert (=> bs!3705 m!93465))

(declare-fun m!93467 () Bool)

(assert (=> bs!3705 m!93467))

(declare-fun m!93469 () Bool)

(assert (=> bs!3705 m!93469))

(assert (=> bs!3705 m!93467))

(assert (=> b!87521 d!23283))

(declare-fun d!23285 () Bool)

(declare-fun e!57156 () Bool)

(assert (=> d!23285 e!57156))

(declare-fun res!44982 () Bool)

(assert (=> d!23285 (=> (not res!44982) (not e!57156))))

(declare-fun lt!41704 () ListLongMap!1453)

(assert (=> d!23285 (= res!44982 (contains!755 lt!41704 (_1!1116 lt!41572)))))

(declare-fun lt!41703 () List!1530)

(assert (=> d!23285 (= lt!41704 (ListLongMap!1454 lt!41703))))

(declare-fun lt!41702 () Unit!2598)

(declare-fun lt!41701 () Unit!2598)

(assert (=> d!23285 (= lt!41702 lt!41701)))

(declare-datatypes ((Option!145 0))(
  ( (Some!144 (v!2660 V!3033)) (None!143) )
))
(declare-fun getValueByKey!139 (List!1530 (_ BitVec 64)) Option!145)

(assert (=> d!23285 (= (getValueByKey!139 lt!41703 (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572)))))

(declare-fun lemmaContainsTupThenGetReturnValue!59 (List!1530 (_ BitVec 64) V!3033) Unit!2598)

(assert (=> d!23285 (= lt!41701 (lemmaContainsTupThenGetReturnValue!59 lt!41703 (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(declare-fun insertStrictlySorted!62 (List!1530 (_ BitVec 64) V!3033) List!1530)

(assert (=> d!23285 (= lt!41703 (insertStrictlySorted!62 (toList!742 lt!41557) (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(assert (=> d!23285 (= (+!110 lt!41557 lt!41572) lt!41704)))

(declare-fun b!87699 () Bool)

(declare-fun res!44983 () Bool)

(assert (=> b!87699 (=> (not res!44983) (not e!57156))))

(assert (=> b!87699 (= res!44983 (= (getValueByKey!139 (toList!742 lt!41704) (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572))))))

(declare-fun b!87700 () Bool)

(declare-fun contains!757 (List!1530 tuple2!2210) Bool)

(assert (=> b!87700 (= e!57156 (contains!757 (toList!742 lt!41704) lt!41572))))

(assert (= (and d!23285 res!44982) b!87699))

(assert (= (and b!87699 res!44983) b!87700))

(declare-fun m!93471 () Bool)

(assert (=> d!23285 m!93471))

(declare-fun m!93473 () Bool)

(assert (=> d!23285 m!93473))

(declare-fun m!93475 () Bool)

(assert (=> d!23285 m!93475))

(declare-fun m!93477 () Bool)

(assert (=> d!23285 m!93477))

(declare-fun m!93479 () Bool)

(assert (=> b!87699 m!93479))

(declare-fun m!93481 () Bool)

(assert (=> b!87700 m!93481))

(assert (=> b!87521 d!23285))

(declare-fun d!23287 () Bool)

(assert (=> d!23287 (= (+!110 (+!110 lt!41560 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (+!110 (+!110 lt!41560 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(declare-fun lt!41705 () Unit!2598)

(assert (=> d!23287 (= lt!41705 (choose!520 lt!41560 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(assert (=> d!23287 (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23287 (= (addCommutativeForDiffKeys!29 lt!41560 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))) lt!41705)))

(declare-fun bs!3706 () Bool)

(assert (= bs!3706 d!23287))

(assert (=> bs!3706 m!93253))

(declare-fun m!93483 () Bool)

(assert (=> bs!3706 m!93483))

(declare-fun m!93485 () Bool)

(assert (=> bs!3706 m!93485))

(assert (=> bs!3706 m!93485))

(declare-fun m!93487 () Bool)

(assert (=> bs!3706 m!93487))

(declare-fun m!93489 () Bool)

(assert (=> bs!3706 m!93489))

(declare-fun m!93491 () Bool)

(assert (=> bs!3706 m!93491))

(assert (=> bs!3706 m!93489))

(assert (=> b!87521 d!23287))

(declare-fun b!87725 () Bool)

(declare-fun e!57173 () Bool)

(declare-fun e!57171 () Bool)

(assert (=> b!87725 (= e!57173 e!57171)))

(assert (=> b!87725 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun res!44992 () Bool)

(declare-fun lt!41720 () ListLongMap!1453)

(assert (=> b!87725 (= res!44992 (contains!755 lt!41720 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!87725 (=> (not res!44992) (not e!57171))))

(declare-fun b!87726 () Bool)

(declare-fun e!57174 () Bool)

(assert (=> b!87726 (= e!57174 e!57173)))

(declare-fun c!14439 () Bool)

(declare-fun e!57172 () Bool)

(assert (=> b!87726 (= c!14439 e!57172)))

(declare-fun res!44994 () Bool)

(assert (=> b!87726 (=> (not res!44994) (not e!57172))))

(assert (=> b!87726 (= res!44994 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!87727 () Bool)

(declare-fun e!57176 () ListLongMap!1453)

(assert (=> b!87727 (= e!57176 (ListLongMap!1454 Nil!1527))))

(declare-fun b!87728 () Bool)

(assert (=> b!87728 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> b!87728 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun apply!83 (ListLongMap!1453 (_ BitVec 64)) V!3033)

(assert (=> b!87728 (= e!57171 (= (apply!83 lt!41720 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!87729 () Bool)

(declare-fun e!57177 () ListLongMap!1453)

(assert (=> b!87729 (= e!57176 e!57177)))

(declare-fun c!14440 () Bool)

(assert (=> b!87729 (= c!14440 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!87730 () Bool)

(declare-fun res!44993 () Bool)

(assert (=> b!87730 (=> (not res!44993) (not e!57174))))

(assert (=> b!87730 (= res!44993 (not (contains!755 lt!41720 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!8354 () Bool)

(declare-fun call!8357 () ListLongMap!1453)

(assert (=> bm!8354 (= call!8357 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87731 () Bool)

(assert (=> b!87731 (= e!57172 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!87731 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!87732 () Bool)

(declare-fun e!57175 () Bool)

(assert (=> b!87732 (= e!57175 (= lt!41720 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun d!23289 () Bool)

(assert (=> d!23289 e!57174))

(declare-fun res!44995 () Bool)

(assert (=> d!23289 (=> (not res!44995) (not e!57174))))

(assert (=> d!23289 (= res!44995 (not (contains!755 lt!41720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23289 (= lt!41720 e!57176)))

(declare-fun c!14441 () Bool)

(assert (=> d!23289 (= c!14441 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23289 (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23289 (= (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) lt!41720)))

(declare-fun b!87733 () Bool)

(declare-fun isEmpty!342 (ListLongMap!1453) Bool)

(assert (=> b!87733 (= e!57175 (isEmpty!342 lt!41720))))

(declare-fun b!87734 () Bool)

(declare-fun lt!41725 () Unit!2598)

(declare-fun lt!41721 () Unit!2598)

(assert (=> b!87734 (= lt!41725 lt!41721)))

(declare-fun lt!41723 () V!3033)

(declare-fun lt!41722 () (_ BitVec 64))

(declare-fun lt!41724 () (_ BitVec 64))

(declare-fun lt!41726 () ListLongMap!1453)

(assert (=> b!87734 (not (contains!755 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723)) lt!41722))))

(declare-fun addStillNotContains!33 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> b!87734 (= lt!41721 (addStillNotContains!33 lt!41726 lt!41724 lt!41723 lt!41722))))

(assert (=> b!87734 (= lt!41722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!87734 (= lt!41723 (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!87734 (= lt!41724 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!87734 (= lt!41726 call!8357)))

(assert (=> b!87734 (= e!57177 (+!110 call!8357 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!87735 () Bool)

(assert (=> b!87735 (= e!57177 call!8357)))

(declare-fun b!87736 () Bool)

(assert (=> b!87736 (= e!57173 e!57175)))

(declare-fun c!14442 () Bool)

(assert (=> b!87736 (= c!14442 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23289 c!14441) b!87727))

(assert (= (and d!23289 (not c!14441)) b!87729))

(assert (= (and b!87729 c!14440) b!87734))

(assert (= (and b!87729 (not c!14440)) b!87735))

(assert (= (or b!87734 b!87735) bm!8354))

(assert (= (and d!23289 res!44995) b!87730))

(assert (= (and b!87730 res!44993) b!87726))

(assert (= (and b!87726 res!44994) b!87731))

(assert (= (and b!87726 c!14439) b!87725))

(assert (= (and b!87726 (not c!14439)) b!87736))

(assert (= (and b!87725 res!44992) b!87728))

(assert (= (and b!87736 c!14442) b!87732))

(assert (= (and b!87736 (not c!14442)) b!87733))

(declare-fun b_lambda!3887 () Bool)

(assert (=> (not b_lambda!3887) (not b!87728)))

(assert (=> b!87728 t!5260))

(declare-fun b_and!5285 () Bool)

(assert (= b_and!5265 (and (=> t!5260 result!2931) b_and!5285)))

(assert (=> b!87728 t!5262))

(declare-fun b_and!5287 () Bool)

(assert (= b_and!5267 (and (=> t!5262 result!2935) b_and!5287)))

(declare-fun b_lambda!3889 () Bool)

(assert (=> (not b_lambda!3889) (not b!87734)))

(assert (=> b!87734 t!5260))

(declare-fun b_and!5289 () Bool)

(assert (= b_and!5285 (and (=> t!5260 result!2931) b_and!5289)))

(assert (=> b!87734 t!5262))

(declare-fun b_and!5291 () Bool)

(assert (= b_and!5287 (and (=> t!5262 result!2935) b_and!5291)))

(declare-fun m!93493 () Bool)

(assert (=> bm!8354 m!93493))

(declare-fun m!93495 () Bool)

(assert (=> b!87733 m!93495))

(declare-fun m!93497 () Bool)

(assert (=> b!87729 m!93497))

(assert (=> b!87729 m!93497))

(declare-fun m!93499 () Bool)

(assert (=> b!87729 m!93499))

(assert (=> b!87731 m!93497))

(assert (=> b!87731 m!93497))

(assert (=> b!87731 m!93499))

(assert (=> b!87732 m!93493))

(declare-fun m!93501 () Bool)

(assert (=> b!87734 m!93501))

(assert (=> b!87734 m!93293))

(declare-fun m!93503 () Bool)

(assert (=> b!87734 m!93503))

(assert (=> b!87734 m!93293))

(declare-fun m!93505 () Bool)

(assert (=> b!87734 m!93505))

(declare-fun m!93507 () Bool)

(assert (=> b!87734 m!93507))

(assert (=> b!87734 m!93497))

(assert (=> b!87734 m!93505))

(declare-fun m!93509 () Bool)

(assert (=> b!87734 m!93509))

(declare-fun m!93511 () Bool)

(assert (=> b!87734 m!93511))

(assert (=> b!87734 m!93501))

(assert (=> b!87725 m!93497))

(assert (=> b!87725 m!93497))

(declare-fun m!93513 () Bool)

(assert (=> b!87725 m!93513))

(declare-fun m!93515 () Bool)

(assert (=> d!23289 m!93515))

(assert (=> d!23289 m!93251))

(declare-fun m!93517 () Bool)

(assert (=> b!87730 m!93517))

(assert (=> b!87728 m!93501))

(assert (=> b!87728 m!93293))

(assert (=> b!87728 m!93503))

(assert (=> b!87728 m!93293))

(assert (=> b!87728 m!93497))

(declare-fun m!93519 () Bool)

(assert (=> b!87728 m!93519))

(assert (=> b!87728 m!93497))

(assert (=> b!87728 m!93501))

(assert (=> b!87521 d!23289))

(declare-fun d!23291 () Bool)

(declare-fun e!57178 () Bool)

(assert (=> d!23291 e!57178))

(declare-fun res!44996 () Bool)

(assert (=> d!23291 (=> (not res!44996) (not e!57178))))

(declare-fun lt!41730 () ListLongMap!1453)

(assert (=> d!23291 (= res!44996 (contains!755 lt!41730 (_1!1116 lt!41572)))))

(declare-fun lt!41729 () List!1530)

(assert (=> d!23291 (= lt!41730 (ListLongMap!1454 lt!41729))))

(declare-fun lt!41728 () Unit!2598)

(declare-fun lt!41727 () Unit!2598)

(assert (=> d!23291 (= lt!41728 lt!41727)))

(assert (=> d!23291 (= (getValueByKey!139 lt!41729 (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572)))))

(assert (=> d!23291 (= lt!41727 (lemmaContainsTupThenGetReturnValue!59 lt!41729 (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(assert (=> d!23291 (= lt!41729 (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(assert (=> d!23291 (= (+!110 lt!41560 lt!41572) lt!41730)))

(declare-fun b!87737 () Bool)

(declare-fun res!44997 () Bool)

(assert (=> b!87737 (=> (not res!44997) (not e!57178))))

(assert (=> b!87737 (= res!44997 (= (getValueByKey!139 (toList!742 lt!41730) (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572))))))

(declare-fun b!87738 () Bool)

(assert (=> b!87738 (= e!57178 (contains!757 (toList!742 lt!41730) lt!41572))))

(assert (= (and d!23291 res!44996) b!87737))

(assert (= (and b!87737 res!44997) b!87738))

(declare-fun m!93521 () Bool)

(assert (=> d!23291 m!93521))

(declare-fun m!93523 () Bool)

(assert (=> d!23291 m!93523))

(declare-fun m!93525 () Bool)

(assert (=> d!23291 m!93525))

(declare-fun m!93527 () Bool)

(assert (=> d!23291 m!93527))

(declare-fun m!93529 () Bool)

(assert (=> b!87737 m!93529))

(declare-fun m!93531 () Bool)

(assert (=> b!87738 m!93531))

(assert (=> b!87521 d!23291))

(declare-fun d!23293 () Bool)

(declare-fun e!57179 () Bool)

(assert (=> d!23293 e!57179))

(declare-fun res!44998 () Bool)

(assert (=> d!23293 (=> (not res!44998) (not e!57179))))

(declare-fun lt!41734 () ListLongMap!1453)

(assert (=> d!23293 (= res!44998 (contains!755 lt!41734 (_1!1116 lt!41556)))))

(declare-fun lt!41733 () List!1530)

(assert (=> d!23293 (= lt!41734 (ListLongMap!1454 lt!41733))))

(declare-fun lt!41732 () Unit!2598)

(declare-fun lt!41731 () Unit!2598)

(assert (=> d!23293 (= lt!41732 lt!41731)))

(assert (=> d!23293 (= (getValueByKey!139 lt!41733 (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556)))))

(assert (=> d!23293 (= lt!41731 (lemmaContainsTupThenGetReturnValue!59 lt!41733 (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (=> d!23293 (= lt!41733 (insertStrictlySorted!62 (toList!742 lt!41563) (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (=> d!23293 (= (+!110 lt!41563 lt!41556) lt!41734)))

(declare-fun b!87739 () Bool)

(declare-fun res!44999 () Bool)

(assert (=> b!87739 (=> (not res!44999) (not e!57179))))

(assert (=> b!87739 (= res!44999 (= (getValueByKey!139 (toList!742 lt!41734) (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556))))))

(declare-fun b!87740 () Bool)

(assert (=> b!87740 (= e!57179 (contains!757 (toList!742 lt!41734) lt!41556))))

(assert (= (and d!23293 res!44998) b!87739))

(assert (= (and b!87739 res!44999) b!87740))

(declare-fun m!93533 () Bool)

(assert (=> d!23293 m!93533))

(declare-fun m!93535 () Bool)

(assert (=> d!23293 m!93535))

(declare-fun m!93537 () Bool)

(assert (=> d!23293 m!93537))

(declare-fun m!93539 () Bool)

(assert (=> d!23293 m!93539))

(declare-fun m!93541 () Bool)

(assert (=> b!87739 m!93541))

(declare-fun m!93543 () Bool)

(assert (=> b!87740 m!93543))

(assert (=> b!87521 d!23293))

(declare-fun d!23295 () Bool)

(declare-fun e!57180 () Bool)

(assert (=> d!23295 e!57180))

(declare-fun res!45000 () Bool)

(assert (=> d!23295 (=> (not res!45000) (not e!57180))))

(declare-fun lt!41738 () ListLongMap!1453)

(assert (=> d!23295 (= res!45000 (contains!755 lt!41738 (_1!1116 lt!41562)))))

(declare-fun lt!41737 () List!1530)

(assert (=> d!23295 (= lt!41738 (ListLongMap!1454 lt!41737))))

(declare-fun lt!41736 () Unit!2598)

(declare-fun lt!41735 () Unit!2598)

(assert (=> d!23295 (= lt!41736 lt!41735)))

(assert (=> d!23295 (= (getValueByKey!139 lt!41737 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(assert (=> d!23295 (= lt!41735 (lemmaContainsTupThenGetReturnValue!59 lt!41737 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23295 (= lt!41737 (insertStrictlySorted!62 (toList!742 (+!110 lt!41560 lt!41572)) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23295 (= (+!110 (+!110 lt!41560 lt!41572) lt!41562) lt!41738)))

(declare-fun b!87741 () Bool)

(declare-fun res!45001 () Bool)

(assert (=> b!87741 (=> (not res!45001) (not e!57180))))

(assert (=> b!87741 (= res!45001 (= (getValueByKey!139 (toList!742 lt!41738) (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562))))))

(declare-fun b!87742 () Bool)

(assert (=> b!87742 (= e!57180 (contains!757 (toList!742 lt!41738) lt!41562))))

(assert (= (and d!23295 res!45000) b!87741))

(assert (= (and b!87741 res!45001) b!87742))

(declare-fun m!93545 () Bool)

(assert (=> d!23295 m!93545))

(declare-fun m!93547 () Bool)

(assert (=> d!23295 m!93547))

(declare-fun m!93549 () Bool)

(assert (=> d!23295 m!93549))

(declare-fun m!93551 () Bool)

(assert (=> d!23295 m!93551))

(declare-fun m!93553 () Bool)

(assert (=> b!87741 m!93553))

(declare-fun m!93555 () Bool)

(assert (=> b!87742 m!93555))

(assert (=> b!87521 d!23295))

(declare-fun d!23297 () Bool)

(declare-fun e!57181 () Bool)

(assert (=> d!23297 e!57181))

(declare-fun res!45002 () Bool)

(assert (=> d!23297 (=> (not res!45002) (not e!57181))))

(declare-fun lt!41742 () ListLongMap!1453)

(assert (=> d!23297 (= res!45002 (contains!755 lt!41742 (_1!1116 lt!41556)))))

(declare-fun lt!41741 () List!1530)

(assert (=> d!23297 (= lt!41742 (ListLongMap!1454 lt!41741))))

(declare-fun lt!41740 () Unit!2598)

(declare-fun lt!41739 () Unit!2598)

(assert (=> d!23297 (= lt!41740 lt!41739)))

(assert (=> d!23297 (= (getValueByKey!139 lt!41741 (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556)))))

(assert (=> d!23297 (= lt!41739 (lemmaContainsTupThenGetReturnValue!59 lt!41741 (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (=> d!23297 (= lt!41741 (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (=> d!23297 (= (+!110 lt!41569 lt!41556) lt!41742)))

(declare-fun b!87743 () Bool)

(declare-fun res!45003 () Bool)

(assert (=> b!87743 (=> (not res!45003) (not e!57181))))

(assert (=> b!87743 (= res!45003 (= (getValueByKey!139 (toList!742 lt!41742) (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556))))))

(declare-fun b!87744 () Bool)

(assert (=> b!87744 (= e!57181 (contains!757 (toList!742 lt!41742) lt!41556))))

(assert (= (and d!23297 res!45002) b!87743))

(assert (= (and b!87743 res!45003) b!87744))

(declare-fun m!93557 () Bool)

(assert (=> d!23297 m!93557))

(declare-fun m!93559 () Bool)

(assert (=> d!23297 m!93559))

(declare-fun m!93561 () Bool)

(assert (=> d!23297 m!93561))

(declare-fun m!93563 () Bool)

(assert (=> d!23297 m!93563))

(declare-fun m!93565 () Bool)

(assert (=> b!87743 m!93565))

(declare-fun m!93567 () Bool)

(assert (=> b!87744 m!93567))

(assert (=> b!87521 d!23297))

(declare-fun d!23299 () Bool)

(declare-fun e!57182 () Bool)

(assert (=> d!23299 e!57182))

(declare-fun res!45004 () Bool)

(assert (=> d!23299 (=> (not res!45004) (not e!57182))))

(declare-fun lt!41746 () ListLongMap!1453)

(assert (=> d!23299 (= res!45004 (contains!755 lt!41746 (_1!1116 lt!41562)))))

(declare-fun lt!41745 () List!1530)

(assert (=> d!23299 (= lt!41746 (ListLongMap!1454 lt!41745))))

(declare-fun lt!41744 () Unit!2598)

(declare-fun lt!41743 () Unit!2598)

(assert (=> d!23299 (= lt!41744 lt!41743)))

(assert (=> d!23299 (= (getValueByKey!139 lt!41745 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(assert (=> d!23299 (= lt!41743 (lemmaContainsTupThenGetReturnValue!59 lt!41745 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23299 (= lt!41745 (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23299 (= (+!110 lt!41569 lt!41562) lt!41746)))

(declare-fun b!87745 () Bool)

(declare-fun res!45005 () Bool)

(assert (=> b!87745 (=> (not res!45005) (not e!57182))))

(assert (=> b!87745 (= res!45005 (= (getValueByKey!139 (toList!742 lt!41746) (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562))))))

(declare-fun b!87746 () Bool)

(assert (=> b!87746 (= e!57182 (contains!757 (toList!742 lt!41746) lt!41562))))

(assert (= (and d!23299 res!45004) b!87745))

(assert (= (and b!87745 res!45005) b!87746))

(declare-fun m!93569 () Bool)

(assert (=> d!23299 m!93569))

(declare-fun m!93571 () Bool)

(assert (=> d!23299 m!93571))

(declare-fun m!93573 () Bool)

(assert (=> d!23299 m!93573))

(declare-fun m!93575 () Bool)

(assert (=> d!23299 m!93575))

(declare-fun m!93577 () Bool)

(assert (=> b!87745 m!93577))

(declare-fun m!93579 () Bool)

(assert (=> b!87746 m!93579))

(assert (=> b!87521 d!23299))

(declare-fun d!23301 () Bool)

(declare-fun e!57183 () Bool)

(assert (=> d!23301 e!57183))

(declare-fun res!45006 () Bool)

(assert (=> d!23301 (=> (not res!45006) (not e!57183))))

(declare-fun lt!41750 () ListLongMap!1453)

(assert (=> d!23301 (= res!45006 (contains!755 lt!41750 (_1!1116 lt!41562)))))

(declare-fun lt!41749 () List!1530)

(assert (=> d!23301 (= lt!41750 (ListLongMap!1454 lt!41749))))

(declare-fun lt!41748 () Unit!2598)

(declare-fun lt!41747 () Unit!2598)

(assert (=> d!23301 (= lt!41748 lt!41747)))

(assert (=> d!23301 (= (getValueByKey!139 lt!41749 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(assert (=> d!23301 (= lt!41747 (lemmaContainsTupThenGetReturnValue!59 lt!41749 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23301 (= lt!41749 (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (=> d!23301 (= (+!110 lt!41560 lt!41562) lt!41750)))

(declare-fun b!87747 () Bool)

(declare-fun res!45007 () Bool)

(assert (=> b!87747 (=> (not res!45007) (not e!57183))))

(assert (=> b!87747 (= res!45007 (= (getValueByKey!139 (toList!742 lt!41750) (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562))))))

(declare-fun b!87748 () Bool)

(assert (=> b!87748 (= e!57183 (contains!757 (toList!742 lt!41750) lt!41562))))

(assert (= (and d!23301 res!45006) b!87747))

(assert (= (and b!87747 res!45007) b!87748))

(declare-fun m!93581 () Bool)

(assert (=> d!23301 m!93581))

(declare-fun m!93583 () Bool)

(assert (=> d!23301 m!93583))

(declare-fun m!93585 () Bool)

(assert (=> d!23301 m!93585))

(declare-fun m!93587 () Bool)

(assert (=> d!23301 m!93587))

(declare-fun m!93589 () Bool)

(assert (=> b!87747 m!93589))

(declare-fun m!93591 () Bool)

(assert (=> b!87748 m!93591))

(assert (=> b!87521 d!23301))

(declare-fun d!23303 () Bool)

(assert (=> d!23303 (= (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992)))) (and (or (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000001111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000011111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000001111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000011111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000001111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000011111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000001111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000011111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000000111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000001111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000011111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000000111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000001111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000011111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000000111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000001111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000011111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000000111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000001111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000011111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00000111111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00001111111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00011111111111111111111111111111) (= (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6395 (v!2654 (underlying!288 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!87521 d!23303))

(declare-fun d!23305 () Bool)

(declare-fun c!14445 () Bool)

(assert (=> d!23305 (= c!14445 ((_ is ValueCellFull!926) (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun e!57186 () V!3033)

(assert (=> d!23305 (= (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57186)))

(declare-fun b!87753 () Bool)

(declare-fun get!1209 (ValueCell!926 V!3033) V!3033)

(assert (=> b!87753 (= e!57186 (get!1209 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87754 () Bool)

(declare-fun get!1210 (ValueCell!926 V!3033) V!3033)

(assert (=> b!87754 (= e!57186 (get!1210 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23305 c!14445) b!87753))

(assert (= (and d!23305 (not c!14445)) b!87754))

(assert (=> b!87753 m!93291))

(assert (=> b!87753 m!93293))

(declare-fun m!93593 () Bool)

(assert (=> b!87753 m!93593))

(assert (=> b!87754 m!93291))

(assert (=> b!87754 m!93293))

(declare-fun m!93595 () Bool)

(assert (=> b!87754 m!93595))

(assert (=> b!87523 d!23305))

(declare-fun d!23307 () Bool)

(assert (=> d!23307 (= (array_inv!1201 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvsge (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87528 d!23307))

(declare-fun d!23309 () Bool)

(assert (=> d!23309 (= (array_inv!1202 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvsge (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87528 d!23309))

(declare-fun d!23311 () Bool)

(assert (=> d!23311 (= (map!1189 newMap!16) (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bs!3707 () Bool)

(assert (= bs!3707 d!23311))

(declare-fun m!93597 () Bool)

(assert (=> bs!3707 m!93597))

(assert (=> b!87522 d!23311))

(declare-fun b!87797 () Bool)

(declare-fun e!57222 () Bool)

(declare-fun lt!41814 () ListLongMap!1453)

(assert (=> b!87797 (= e!57222 (= (apply!83 lt!41814 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87798 () Bool)

(declare-fun e!57214 () Bool)

(declare-fun e!57223 () Bool)

(assert (=> b!87798 (= e!57214 e!57223)))

(declare-fun res!45026 () Bool)

(declare-fun call!8378 () Bool)

(assert (=> b!87798 (= res!45026 call!8378)))

(assert (=> b!87798 (=> (not res!45026) (not e!57223))))

(declare-fun call!8373 () ListLongMap!1453)

(declare-fun c!14462 () Bool)

(declare-fun bm!8369 () Bool)

(declare-fun call!8377 () ListLongMap!1453)

(declare-fun c!14460 () Bool)

(declare-fun call!8374 () ListLongMap!1453)

(declare-fun call!8372 () ListLongMap!1453)

(assert (=> bm!8369 (= call!8372 (+!110 (ite c!14462 call!8377 (ite c!14460 call!8374 call!8373)) (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun b!87799 () Bool)

(declare-fun res!45028 () Bool)

(declare-fun e!57225 () Bool)

(assert (=> b!87799 (=> (not res!45028) (not e!57225))))

(declare-fun e!57224 () Bool)

(assert (=> b!87799 (= res!45028 e!57224)))

(declare-fun res!45034 () Bool)

(assert (=> b!87799 (=> res!45034 e!57224)))

(declare-fun e!57218 () Bool)

(assert (=> b!87799 (= res!45034 (not e!57218))))

(declare-fun res!45031 () Bool)

(assert (=> b!87799 (=> (not res!45031) (not e!57218))))

(assert (=> b!87799 (= res!45031 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!87800 () Bool)

(declare-fun e!57215 () Bool)

(assert (=> b!87800 (= e!57215 e!57222)))

(declare-fun res!45033 () Bool)

(declare-fun call!8376 () Bool)

(assert (=> b!87800 (= res!45033 call!8376)))

(assert (=> b!87800 (=> (not res!45033) (not e!57222))))

(declare-fun b!87801 () Bool)

(declare-fun e!57213 () ListLongMap!1453)

(assert (=> b!87801 (= e!57213 (+!110 call!8372 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun bm!8370 () Bool)

(declare-fun call!8375 () ListLongMap!1453)

(assert (=> bm!8370 (= call!8375 call!8372)))

(declare-fun b!87802 () Bool)

(assert (=> b!87802 (= e!57218 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!87803 () Bool)

(assert (=> b!87803 (= e!57214 (not call!8378))))

(declare-fun b!87804 () Bool)

(declare-fun e!57216 () ListLongMap!1453)

(assert (=> b!87804 (= e!57216 call!8373)))

(declare-fun b!87805 () Bool)

(declare-fun c!14459 () Bool)

(assert (=> b!87805 (= c!14459 (and (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57219 () ListLongMap!1453)

(assert (=> b!87805 (= e!57219 e!57216)))

(declare-fun bm!8371 () Bool)

(assert (=> bm!8371 (= call!8374 call!8377)))

(declare-fun b!87806 () Bool)

(declare-fun e!57217 () Bool)

(assert (=> b!87806 (= e!57217 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!87807 () Bool)

(assert (=> b!87807 (= e!57225 e!57214)))

(declare-fun c!14461 () Bool)

(assert (=> b!87807 (= c!14461 (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!87808 () Bool)

(declare-fun e!57220 () Unit!2598)

(declare-fun lt!41797 () Unit!2598)

(assert (=> b!87808 (= e!57220 lt!41797)))

(declare-fun lt!41796 () ListLongMap!1453)

(assert (=> b!87808 (= lt!41796 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41809 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41809 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41803 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41803 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41808 () Unit!2598)

(declare-fun addStillContains!59 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> b!87808 (= lt!41808 (addStillContains!59 lt!41796 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41803))))

(assert (=> b!87808 (contains!755 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41803)))

(declare-fun lt!41806 () Unit!2598)

(assert (=> b!87808 (= lt!41806 lt!41808)))

(declare-fun lt!41801 () ListLongMap!1453)

(assert (=> b!87808 (= lt!41801 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41795 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41795 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41812 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41812 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41798 () Unit!2598)

(declare-fun addApplyDifferent!59 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> b!87808 (= lt!41798 (addApplyDifferent!59 lt!41801 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41812))))

(assert (=> b!87808 (= (apply!83 (+!110 lt!41801 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41812) (apply!83 lt!41801 lt!41812))))

(declare-fun lt!41800 () Unit!2598)

(assert (=> b!87808 (= lt!41800 lt!41798)))

(declare-fun lt!41811 () ListLongMap!1453)

(assert (=> b!87808 (= lt!41811 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41804 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41804 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41807 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41807 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41816 () Unit!2598)

(assert (=> b!87808 (= lt!41816 (addApplyDifferent!59 lt!41811 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41807))))

(assert (=> b!87808 (= (apply!83 (+!110 lt!41811 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41807) (apply!83 lt!41811 lt!41807))))

(declare-fun lt!41813 () Unit!2598)

(assert (=> b!87808 (= lt!41813 lt!41816)))

(declare-fun lt!41810 () ListLongMap!1453)

(assert (=> b!87808 (= lt!41810 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun lt!41805 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41799 () (_ BitVec 64))

(assert (=> b!87808 (= lt!41799 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!87808 (= lt!41797 (addApplyDifferent!59 lt!41810 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41799))))

(assert (=> b!87808 (= (apply!83 (+!110 lt!41810 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41799) (apply!83 lt!41810 lt!41799))))

(declare-fun b!87809 () Bool)

(assert (=> b!87809 (= e!57219 call!8375)))

(declare-fun b!87810 () Bool)

(assert (=> b!87810 (= e!57223 (= (apply!83 lt!41814 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87811 () Bool)

(declare-fun e!57221 () Bool)

(assert (=> b!87811 (= e!57224 e!57221)))

(declare-fun res!45029 () Bool)

(assert (=> b!87811 (=> (not res!45029) (not e!57221))))

(assert (=> b!87811 (= res!45029 (contains!755 lt!41814 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!87811 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun d!23313 () Bool)

(assert (=> d!23313 e!57225))

(declare-fun res!45027 () Bool)

(assert (=> d!23313 (=> (not res!45027) (not e!57225))))

(assert (=> d!23313 (= res!45027 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun lt!41815 () ListLongMap!1453)

(assert (=> d!23313 (= lt!41814 lt!41815)))

(declare-fun lt!41802 () Unit!2598)

(assert (=> d!23313 (= lt!41802 e!57220)))

(declare-fun c!14463 () Bool)

(assert (=> d!23313 (= c!14463 e!57217)))

(declare-fun res!45032 () Bool)

(assert (=> d!23313 (=> (not res!45032) (not e!57217))))

(assert (=> d!23313 (= res!45032 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23313 (= lt!41815 e!57213)))

(assert (=> d!23313 (= c!14462 (and (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23313 (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23313 (= (getCurrentListMap!427 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) lt!41814)))

(declare-fun b!87812 () Bool)

(assert (=> b!87812 (= e!57213 e!57219)))

(assert (=> b!87812 (= c!14460 (and (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!87813 () Bool)

(assert (=> b!87813 (= e!57221 (= (apply!83 lt!41814 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87813 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> b!87813 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!87814 () Bool)

(declare-fun Unit!2609 () Unit!2598)

(assert (=> b!87814 (= e!57220 Unit!2609)))

(declare-fun bm!8372 () Bool)

(assert (=> bm!8372 (= call!8378 (contains!755 lt!41814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87815 () Bool)

(assert (=> b!87815 (= e!57216 call!8375)))

(declare-fun b!87816 () Bool)

(assert (=> b!87816 (= e!57215 (not call!8376))))

(declare-fun bm!8373 () Bool)

(assert (=> bm!8373 (= call!8373 call!8374)))

(declare-fun b!87817 () Bool)

(declare-fun res!45030 () Bool)

(assert (=> b!87817 (=> (not res!45030) (not e!57225))))

(assert (=> b!87817 (= res!45030 e!57215)))

(declare-fun c!14458 () Bool)

(assert (=> b!87817 (= c!14458 (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8374 () Bool)

(assert (=> bm!8374 (= call!8377 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun bm!8375 () Bool)

(assert (=> bm!8375 (= call!8376 (contains!755 lt!41814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23313 c!14462) b!87801))

(assert (= (and d!23313 (not c!14462)) b!87812))

(assert (= (and b!87812 c!14460) b!87809))

(assert (= (and b!87812 (not c!14460)) b!87805))

(assert (= (and b!87805 c!14459) b!87815))

(assert (= (and b!87805 (not c!14459)) b!87804))

(assert (= (or b!87815 b!87804) bm!8373))

(assert (= (or b!87809 bm!8373) bm!8371))

(assert (= (or b!87809 b!87815) bm!8370))

(assert (= (or b!87801 bm!8371) bm!8374))

(assert (= (or b!87801 bm!8370) bm!8369))

(assert (= (and d!23313 res!45032) b!87806))

(assert (= (and d!23313 c!14463) b!87808))

(assert (= (and d!23313 (not c!14463)) b!87814))

(assert (= (and d!23313 res!45027) b!87799))

(assert (= (and b!87799 res!45031) b!87802))

(assert (= (and b!87799 (not res!45034)) b!87811))

(assert (= (and b!87811 res!45029) b!87813))

(assert (= (and b!87799 res!45028) b!87817))

(assert (= (and b!87817 c!14458) b!87800))

(assert (= (and b!87817 (not c!14458)) b!87816))

(assert (= (and b!87800 res!45033) b!87797))

(assert (= (or b!87800 b!87816) bm!8375))

(assert (= (and b!87817 res!45030) b!87807))

(assert (= (and b!87807 c!14461) b!87798))

(assert (= (and b!87807 (not c!14461)) b!87803))

(assert (= (and b!87798 res!45026) b!87810))

(assert (= (or b!87798 b!87803) bm!8372))

(declare-fun b_lambda!3891 () Bool)

(assert (=> (not b_lambda!3891) (not b!87813)))

(assert (=> b!87813 t!5260))

(declare-fun b_and!5293 () Bool)

(assert (= b_and!5289 (and (=> t!5260 result!2931) b_and!5293)))

(assert (=> b!87813 t!5262))

(declare-fun b_and!5295 () Bool)

(assert (= b_and!5291 (and (=> t!5262 result!2935) b_and!5295)))

(assert (=> b!87811 m!93497))

(assert (=> b!87811 m!93497))

(declare-fun m!93599 () Bool)

(assert (=> b!87811 m!93599))

(declare-fun m!93601 () Bool)

(assert (=> bm!8375 m!93601))

(declare-fun m!93603 () Bool)

(assert (=> b!87810 m!93603))

(declare-fun m!93605 () Bool)

(assert (=> bm!8372 m!93605))

(assert (=> b!87802 m!93497))

(assert (=> b!87802 m!93497))

(assert (=> b!87802 m!93499))

(assert (=> b!87806 m!93497))

(assert (=> b!87806 m!93497))

(assert (=> b!87806 m!93499))

(declare-fun m!93607 () Bool)

(assert (=> bm!8369 m!93607))

(assert (=> b!87813 m!93293))

(assert (=> b!87813 m!93497))

(declare-fun m!93609 () Bool)

(assert (=> b!87813 m!93609))

(assert (=> b!87813 m!93501))

(assert (=> b!87813 m!93497))

(assert (=> b!87813 m!93501))

(assert (=> b!87813 m!93293))

(assert (=> b!87813 m!93503))

(declare-fun m!93611 () Bool)

(assert (=> b!87808 m!93611))

(declare-fun m!93613 () Bool)

(assert (=> b!87808 m!93613))

(declare-fun m!93615 () Bool)

(assert (=> b!87808 m!93615))

(declare-fun m!93617 () Bool)

(assert (=> b!87808 m!93617))

(declare-fun m!93619 () Bool)

(assert (=> b!87808 m!93619))

(assert (=> b!87808 m!93611))

(declare-fun m!93621 () Bool)

(assert (=> b!87808 m!93621))

(declare-fun m!93623 () Bool)

(assert (=> b!87808 m!93623))

(declare-fun m!93625 () Bool)

(assert (=> b!87808 m!93625))

(declare-fun m!93627 () Bool)

(assert (=> b!87808 m!93627))

(assert (=> b!87808 m!93497))

(declare-fun m!93629 () Bool)

(assert (=> b!87808 m!93629))

(assert (=> b!87808 m!93269))

(assert (=> b!87808 m!93621))

(declare-fun m!93631 () Bool)

(assert (=> b!87808 m!93631))

(assert (=> b!87808 m!93615))

(declare-fun m!93633 () Bool)

(assert (=> b!87808 m!93633))

(declare-fun m!93635 () Bool)

(assert (=> b!87808 m!93635))

(assert (=> b!87808 m!93631))

(declare-fun m!93637 () Bool)

(assert (=> b!87808 m!93637))

(declare-fun m!93639 () Bool)

(assert (=> b!87808 m!93639))

(assert (=> d!23313 m!93251))

(declare-fun m!93641 () Bool)

(assert (=> b!87797 m!93641))

(assert (=> bm!8374 m!93269))

(declare-fun m!93643 () Bool)

(assert (=> b!87801 m!93643))

(assert (=> b!87522 d!23313))

(declare-fun d!23315 () Bool)

(assert (=> d!23315 (= (valid!339 thiss!992) (valid!338 (v!2654 (underlying!288 thiss!992))))))

(declare-fun bs!3708 () Bool)

(assert (= bs!3708 d!23315))

(declare-fun m!93645 () Bool)

(assert (=> bs!3708 m!93645))

(assert (=> start!10842 d!23315))

(declare-fun d!23317 () Bool)

(assert (=> d!23317 (not (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41819 () Unit!2598)

(declare-fun choose!68 (array!4019 (_ BitVec 32) (_ BitVec 64) List!1531) Unit!2598)

(assert (=> d!23317 (= lt!41819 (choose!68 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528)))))

(assert (=> d!23317 (bvslt (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23317 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528)) lt!41819)))

(declare-fun bs!3709 () Bool)

(assert (= bs!3709 d!23317))

(assert (=> bs!3709 m!93253))

(assert (=> bs!3709 m!93303))

(assert (=> bs!3709 m!93253))

(declare-fun m!93647 () Bool)

(assert (=> bs!3709 m!93647))

(assert (=> b!87537 d!23317))

(declare-fun d!23319 () Bool)

(assert (=> d!23319 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) from!355 Nil!1528)))

(declare-fun lt!41822 () Unit!2598)

(declare-fun choose!39 (array!4019 (_ BitVec 32) (_ BitVec 32)) Unit!2598)

(assert (=> d!23319 (= lt!41822 (choose!39 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23319 (bvslt (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23319 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 from!355) lt!41822)))

(declare-fun bs!3710 () Bool)

(assert (= bs!3710 d!23319))

(assert (=> bs!3710 m!93299))

(declare-fun m!93649 () Bool)

(assert (=> bs!3710 m!93649))

(assert (=> b!87537 d!23319))

(declare-fun d!23321 () Bool)

(declare-fun res!45039 () Bool)

(declare-fun e!57230 () Bool)

(assert (=> d!23321 (=> res!45039 e!57230)))

(assert (=> d!23321 (= res!45039 (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23321 (= (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!57230)))

(declare-fun b!87822 () Bool)

(declare-fun e!57231 () Bool)

(assert (=> b!87822 (= e!57230 e!57231)))

(declare-fun res!45040 () Bool)

(assert (=> b!87822 (=> (not res!45040) (not e!57231))))

(assert (=> b!87822 (= res!45040 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!87823 () Bool)

(assert (=> b!87823 (= e!57231 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23321 (not res!45039)) b!87822))

(assert (= (and b!87822 res!45040) b!87823))

(assert (=> d!23321 m!93497))

(assert (=> b!87823 m!93253))

(declare-fun m!93651 () Bool)

(assert (=> b!87823 m!93651))

(assert (=> b!87537 d!23321))

(declare-fun d!23323 () Bool)

(declare-fun e!57234 () Bool)

(assert (=> d!23323 e!57234))

(declare-fun c!14466 () Bool)

(assert (=> d!23323 (= c!14466 (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!41825 () Unit!2598)

(declare-fun choose!521 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2598)

(assert (=> d!23323 (= lt!41825 (choose!521 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(assert (=> d!23323 (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23323 (= (lemmaListMapContainsThenArrayContainsFrom!69 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) lt!41825)))

(declare-fun b!87828 () Bool)

(assert (=> b!87828 (= e!57234 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!87829 () Bool)

(assert (=> b!87829 (= e!57234 (ite (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23323 c!14466) b!87828))

(assert (= (and d!23323 (not c!14466)) b!87829))

(assert (=> d!23323 m!93253))

(declare-fun m!93653 () Bool)

(assert (=> d!23323 m!93653))

(assert (=> d!23323 m!93251))

(assert (=> b!87828 m!93253))

(assert (=> b!87828 m!93303))

(assert (=> b!87537 d!23323))

(declare-fun b!87840 () Bool)

(declare-fun e!57244 () Bool)

(declare-fun call!8381 () Bool)

(assert (=> b!87840 (= e!57244 call!8381)))

(declare-fun b!87841 () Bool)

(declare-fun e!57245 () Bool)

(declare-fun contains!758 (List!1531 (_ BitVec 64)) Bool)

(assert (=> b!87841 (= e!57245 (contains!758 Nil!1528 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun bm!8378 () Bool)

(declare-fun c!14469 () Bool)

(assert (=> bm!8378 (= call!8381 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14469 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528) Nil!1528)))))

(declare-fun b!87842 () Bool)

(declare-fun e!57243 () Bool)

(assert (=> b!87842 (= e!57243 e!57244)))

(assert (=> b!87842 (= c!14469 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun d!23325 () Bool)

(declare-fun res!45048 () Bool)

(declare-fun e!57246 () Bool)

(assert (=> d!23325 (=> res!45048 e!57246)))

(assert (=> d!23325 (= res!45048 (bvsge from!355 (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23325 (= (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) from!355 Nil!1528) e!57246)))

(declare-fun b!87843 () Bool)

(assert (=> b!87843 (= e!57246 e!57243)))

(declare-fun res!45047 () Bool)

(assert (=> b!87843 (=> (not res!45047) (not e!57243))))

(assert (=> b!87843 (= res!45047 (not e!57245))))

(declare-fun res!45049 () Bool)

(assert (=> b!87843 (=> (not res!45049) (not e!57245))))

(assert (=> b!87843 (= res!45049 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!87844 () Bool)

(assert (=> b!87844 (= e!57244 call!8381)))

(assert (= (and d!23325 (not res!45048)) b!87843))

(assert (= (and b!87843 res!45049) b!87841))

(assert (= (and b!87843 res!45047) b!87842))

(assert (= (and b!87842 c!14469) b!87840))

(assert (= (and b!87842 (not c!14469)) b!87844))

(assert (= (or b!87840 b!87844) bm!8378))

(assert (=> b!87841 m!93253))

(assert (=> b!87841 m!93253))

(declare-fun m!93655 () Bool)

(assert (=> b!87841 m!93655))

(assert (=> bm!8378 m!93253))

(declare-fun m!93657 () Bool)

(assert (=> bm!8378 m!93657))

(assert (=> b!87842 m!93253))

(assert (=> b!87842 m!93253))

(declare-fun m!93659 () Bool)

(assert (=> b!87842 m!93659))

(assert (=> b!87843 m!93253))

(assert (=> b!87843 m!93253))

(assert (=> b!87843 m!93659))

(assert (=> b!87537 d!23325))

(declare-fun d!23327 () Bool)

(declare-fun e!57252 () Bool)

(assert (=> d!23327 e!57252))

(declare-fun res!45052 () Bool)

(assert (=> d!23327 (=> res!45052 e!57252)))

(declare-fun lt!41835 () Bool)

(assert (=> d!23327 (= res!45052 (not lt!41835))))

(declare-fun lt!41834 () Bool)

(assert (=> d!23327 (= lt!41835 lt!41834)))

(declare-fun lt!41836 () Unit!2598)

(declare-fun e!57251 () Unit!2598)

(assert (=> d!23327 (= lt!41836 e!57251)))

(declare-fun c!14472 () Bool)

(assert (=> d!23327 (= c!14472 lt!41834)))

(declare-fun containsKey!143 (List!1530 (_ BitVec 64)) Bool)

(assert (=> d!23327 (= lt!41834 (containsKey!143 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23327 (= (contains!755 lt!41555 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) lt!41835)))

(declare-fun b!87851 () Bool)

(declare-fun lt!41837 () Unit!2598)

(assert (=> b!87851 (= e!57251 lt!41837)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!92 (List!1530 (_ BitVec 64)) Unit!2598)

(assert (=> b!87851 (= lt!41837 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun isDefined!93 (Option!145) Bool)

(assert (=> b!87851 (isDefined!93 (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!87852 () Bool)

(declare-fun Unit!2610 () Unit!2598)

(assert (=> b!87852 (= e!57251 Unit!2610)))

(declare-fun b!87853 () Bool)

(assert (=> b!87853 (= e!57252 (isDefined!93 (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (= (and d!23327 c!14472) b!87851))

(assert (= (and d!23327 (not c!14472)) b!87852))

(assert (= (and d!23327 (not res!45052)) b!87853))

(assert (=> d!23327 m!93253))

(declare-fun m!93661 () Bool)

(assert (=> d!23327 m!93661))

(assert (=> b!87851 m!93253))

(declare-fun m!93663 () Bool)

(assert (=> b!87851 m!93663))

(assert (=> b!87851 m!93253))

(declare-fun m!93665 () Bool)

(assert (=> b!87851 m!93665))

(assert (=> b!87851 m!93665))

(declare-fun m!93667 () Bool)

(assert (=> b!87851 m!93667))

(assert (=> b!87853 m!93253))

(assert (=> b!87853 m!93665))

(assert (=> b!87853 m!93665))

(assert (=> b!87853 m!93667))

(assert (=> b!87541 d!23327))

(declare-fun b!87930 () Bool)

(declare-fun lt!41914 () Unit!2598)

(declare-fun lt!41900 () Unit!2598)

(assert (=> b!87930 (= lt!41914 lt!41900)))

(declare-fun call!8447 () Bool)

(assert (=> b!87930 call!8447))

(declare-fun lt!41893 () array!4021)

(declare-fun lt!41916 () SeekEntryResult!247)

(declare-fun lemmaValidKeyInArrayIsInListMap!91 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) Unit!2598)

(assert (=> b!87930 (= lt!41900 (lemmaValidKeyInArrayIsInListMap!91 (_keys!4033 newMap!16) lt!41893 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (defaultEntry!2358 newMap!16)))))

(assert (=> b!87930 (= lt!41893 (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))))))

(declare-fun lt!41904 () Unit!2598)

(declare-fun lt!41909 () Unit!2598)

(assert (=> b!87930 (= lt!41904 lt!41909)))

(declare-fun call!8444 () ListLongMap!1453)

(assert (=> b!87930 (= call!8444 (getCurrentListMap!427 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2598)

(assert (=> b!87930 (= lt!41909 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41902 () Unit!2598)

(declare-fun e!57294 () Unit!2598)

(assert (=> b!87930 (= lt!41902 e!57294)))

(declare-fun c!14501 () Bool)

(declare-fun call!8440 () ListLongMap!1453)

(assert (=> b!87930 (= c!14501 (contains!755 call!8440 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun e!57303 () tuple2!2212)

(assert (=> b!87930 (= e!57303 (tuple2!2213 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (_size!429 newMap!16) (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (_vacant!429 newMap!16))))))

(declare-fun bm!8427 () Bool)

(declare-fun call!8451 () SeekEntryResult!247)

(assert (=> bm!8427 (= call!8451 (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun b!87931 () Bool)

(declare-fun e!57297 () Bool)

(declare-fun e!57308 () Bool)

(assert (=> b!87931 (= e!57297 e!57308)))

(declare-fun call!8437 () ListLongMap!1453)

(declare-fun res!45090 () Bool)

(assert (=> b!87931 (= res!45090 (contains!755 call!8437 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> b!87931 (=> (not res!45090) (not e!57308))))

(declare-fun b!87932 () Bool)

(declare-fun e!57293 () Bool)

(declare-fun call!8443 () Bool)

(assert (=> b!87932 (= e!57293 (not call!8443))))

(declare-fun b!87933 () Bool)

(declare-fun e!57306 () Bool)

(declare-fun lt!41912 () SeekEntryResult!247)

(assert (=> b!87933 (= e!57306 ((_ is Undefined!247) lt!41912))))

(declare-fun b!87934 () Bool)

(declare-fun e!57301 () Unit!2598)

(declare-fun lt!41907 () Unit!2598)

(assert (=> b!87934 (= e!57301 lt!41907)))

(declare-fun call!8442 () Unit!2598)

(assert (=> b!87934 (= lt!41907 call!8442)))

(declare-fun call!8438 () SeekEntryResult!247)

(assert (=> b!87934 (= lt!41912 call!8438)))

(declare-fun c!14500 () Bool)

(assert (=> b!87934 (= c!14500 ((_ is MissingZero!247) lt!41912))))

(declare-fun e!57307 () Bool)

(assert (=> b!87934 e!57307))

(declare-fun b!87935 () Bool)

(declare-fun lt!41903 () tuple2!2212)

(declare-fun call!8449 () tuple2!2212)

(assert (=> b!87935 (= lt!41903 call!8449)))

(assert (=> b!87935 (= e!57303 (tuple2!2213 (_1!1117 lt!41903) (_2!1117 lt!41903)))))

(declare-fun call!8434 () ListLongMap!1453)

(declare-fun b!87936 () Bool)

(assert (=> b!87936 (= e!57308 (= call!8437 (+!110 call!8434 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun b!87937 () Bool)

(declare-fun lt!41892 () Unit!2598)

(assert (=> b!87937 (= lt!41892 e!57301)))

(declare-fun c!14503 () Bool)

(assert (=> b!87937 (= c!14503 call!8447)))

(declare-fun e!57295 () tuple2!2212)

(assert (=> b!87937 (= e!57295 (tuple2!2213 false newMap!16))))

(declare-fun bm!8428 () Bool)

(declare-fun call!8450 () ListLongMap!1453)

(declare-fun call!8430 () ListLongMap!1453)

(assert (=> bm!8428 (= call!8450 call!8430)))

(declare-fun bm!8429 () Bool)

(declare-fun call!8453 () Bool)

(assert (=> bm!8429 (= call!8443 call!8453)))

(declare-fun bm!8430 () Bool)

(declare-fun lt!41894 () tuple2!2212)

(assert (=> bm!8430 (= call!8437 (map!1189 (_2!1117 lt!41894)))))

(declare-fun bm!8431 () Bool)

(declare-fun call!8448 () Bool)

(assert (=> bm!8431 (= call!8448 call!8453)))

(declare-fun b!87938 () Bool)

(declare-fun Unit!2611 () Unit!2598)

(assert (=> b!87938 (= e!57294 Unit!2611)))

(declare-fun lt!41906 () Unit!2598)

(assert (=> b!87938 (= lt!41906 call!8442)))

(declare-fun lt!41915 () SeekEntryResult!247)

(declare-fun call!8441 () SeekEntryResult!247)

(assert (=> b!87938 (= lt!41915 call!8441)))

(declare-fun c!14506 () Bool)

(assert (=> b!87938 (= c!14506 ((_ is MissingZero!247) lt!41915))))

(declare-fun e!57304 () Bool)

(assert (=> b!87938 e!57304))

(declare-fun lt!41901 () Unit!2598)

(assert (=> b!87938 (= lt!41901 lt!41906)))

(assert (=> b!87938 false))

(declare-fun bm!8432 () Bool)

(declare-fun call!8452 () ListLongMap!1453)

(assert (=> bm!8432 (= call!8452 call!8440)))

(declare-fun b!87939 () Bool)

(declare-fun lt!41917 () Unit!2598)

(declare-fun lt!41908 () Unit!2598)

(assert (=> b!87939 (= lt!41917 lt!41908)))

(declare-fun call!8432 () ListLongMap!1453)

(assert (=> b!87939 (= call!8432 call!8452)))

(declare-fun lt!41897 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2598)

(assert (=> b!87939 (= lt!41908 (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41897 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41566 (defaultEntry!2358 newMap!16)))))

(assert (=> b!87939 (= lt!41897 (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!57309 () tuple2!2212)

(assert (=> b!87939 (= e!57309 (tuple2!2213 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6395 newMap!16) (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) (zeroValue!2248 newMap!16) lt!41566 (_size!429 newMap!16) (_keys!4033 newMap!16) (_values!2341 newMap!16) (_vacant!429 newMap!16))))))

(declare-fun b!87940 () Bool)

(declare-fun e!57296 () Bool)

(assert (=> b!87940 (= e!57296 (not call!8448))))

(declare-fun b!87941 () Bool)

(declare-fun res!45086 () Bool)

(declare-fun call!8433 () Bool)

(assert (=> b!87941 (= res!45086 call!8433)))

(declare-fun e!57312 () Bool)

(assert (=> b!87941 (=> (not res!45086) (not e!57312))))

(declare-fun b!87942 () Bool)

(declare-fun e!57300 () Bool)

(assert (=> b!87942 (= e!57300 ((_ is Undefined!247) lt!41915))))

(declare-fun b!87943 () Bool)

(declare-fun res!45084 () Bool)

(assert (=> b!87943 (=> (not res!45084) (not e!57296))))

(declare-fun call!8436 () Bool)

(assert (=> b!87943 (= res!45084 call!8436)))

(assert (=> b!87943 (= e!57304 e!57296)))

(declare-fun bm!8433 () Bool)

(declare-fun call!8435 () Bool)

(assert (=> bm!8433 (= call!8436 call!8435)))

(declare-fun b!87944 () Bool)

(declare-fun e!57302 () tuple2!2212)

(assert (=> b!87944 (= e!57302 e!57309)))

(declare-fun c!14502 () Bool)

(assert (=> b!87944 (= c!14502 (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87945 () Bool)

(declare-fun res!45083 () Bool)

(assert (=> b!87945 (=> (not res!45083) (not e!57296))))

(assert (=> b!87945 (= res!45083 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3126 lt!41915)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87946 () Bool)

(declare-fun c!14508 () Bool)

(assert (=> b!87946 (= c!14508 ((_ is MissingVacant!247) lt!41915))))

(assert (=> b!87946 (= e!57304 e!57300)))

(declare-fun bm!8434 () Bool)

(declare-fun call!8446 () Bool)

(assert (=> bm!8434 (= call!8446 call!8433)))

(declare-fun bm!8435 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2598)

(assert (=> bm!8435 (= call!8442 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8436 () Bool)

(assert (=> bm!8436 (= call!8441 call!8451)))

(declare-fun b!87947 () Bool)

(declare-fun e!57299 () tuple2!2212)

(assert (=> b!87947 (= e!57299 e!57303)))

(declare-fun c!14504 () Bool)

(assert (=> b!87947 (= c!14504 ((_ is MissingZero!247) lt!41916))))

(declare-fun d!23329 () Bool)

(declare-fun e!57310 () Bool)

(assert (=> d!23329 e!57310))

(declare-fun res!45087 () Bool)

(assert (=> d!23329 (=> (not res!45087) (not e!57310))))

(assert (=> d!23329 (= res!45087 (valid!338 (_2!1117 lt!41894)))))

(assert (=> d!23329 (= lt!41894 e!57302)))

(declare-fun c!14505 () Bool)

(assert (=> d!23329 (= c!14505 (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvneg (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (=> d!23329 (valid!338 newMap!16)))

(assert (=> d!23329 (= (update!123 newMap!16 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566) lt!41894)))

(declare-fun lt!41898 () SeekEntryResult!247)

(declare-fun b!87948 () Bool)

(assert (=> b!87948 (= e!57312 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41898)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun bm!8437 () Bool)

(declare-fun call!8439 () Bool)

(assert (=> bm!8437 (= call!8435 call!8439)))

(declare-fun b!87949 () Bool)

(declare-fun e!57305 () Bool)

(assert (=> b!87949 (= e!57300 e!57305)))

(declare-fun res!45094 () Bool)

(assert (=> b!87949 (= res!45094 call!8436)))

(assert (=> b!87949 (=> (not res!45094) (not e!57305))))

(declare-fun b!87950 () Bool)

(declare-fun Unit!2612 () Unit!2598)

(assert (=> b!87950 (= e!57301 Unit!2612)))

(declare-fun lt!41918 () Unit!2598)

(declare-fun call!8431 () Unit!2598)

(assert (=> b!87950 (= lt!41918 call!8431)))

(assert (=> b!87950 (= lt!41898 call!8438)))

(declare-fun res!45081 () Bool)

(assert (=> b!87950 (= res!45081 ((_ is Found!247) lt!41898))))

(assert (=> b!87950 (=> (not res!45081) (not e!57312))))

(assert (=> b!87950 e!57312))

(declare-fun lt!41896 () Unit!2598)

(assert (=> b!87950 (= lt!41896 lt!41918)))

(assert (=> b!87950 false))

(declare-fun bm!8438 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2598)

(assert (=> bm!8438 (= call!8431 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun b!87951 () Bool)

(declare-fun e!57311 () Bool)

(assert (=> b!87951 (= e!57306 e!57311)))

(declare-fun res!45082 () Bool)

(assert (=> b!87951 (= res!45082 call!8446)))

(assert (=> b!87951 (=> (not res!45082) (not e!57311))))

(declare-fun b!87952 () Bool)

(declare-fun res!45091 () Bool)

(assert (=> b!87952 (=> (not res!45091) (not e!57293))))

(assert (=> b!87952 (= res!45091 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3126 lt!41912)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87953 () Bool)

(declare-fun lt!41895 () SeekEntryResult!247)

(declare-fun e!57298 () Bool)

(assert (=> b!87953 (= e!57298 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41895)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!87954 () Bool)

(declare-fun res!45085 () Bool)

(assert (=> b!87954 (= res!45085 call!8435)))

(assert (=> b!87954 (=> (not res!45085) (not e!57298))))

(declare-fun bm!8439 () Bool)

(assert (=> bm!8439 (= call!8434 (map!1189 newMap!16))))

(declare-fun b!87955 () Bool)

(assert (=> b!87955 (= e!57311 (not call!8443))))

(declare-fun b!87956 () Bool)

(assert (=> b!87956 (= e!57302 e!57295)))

(assert (=> b!87956 (= lt!41916 (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun c!14498 () Bool)

(assert (=> b!87956 (= c!14498 ((_ is Undefined!247) lt!41916))))

(declare-fun b!87957 () Bool)

(assert (=> b!87957 (= e!57297 (= call!8437 call!8434))))

(declare-fun lt!41910 () (_ BitVec 32))

(declare-fun bm!8440 () Bool)

(assert (=> bm!8440 (= call!8430 (getCurrentListMap!427 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8441 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8441 (= call!8439 (inRange!0 (ite c!14498 (ite c!14503 (index!3127 lt!41898) (ite c!14500 (index!3126 lt!41912) (index!3129 lt!41912))) (ite c!14501 (index!3127 lt!41895) (ite c!14506 (index!3126 lt!41915) (index!3129 lt!41915)))) (mask!6395 newMap!16)))))

(declare-fun bm!8442 () Bool)

(assert (=> bm!8442 (= call!8438 call!8451)))

(declare-fun bm!8443 () Bool)

(declare-fun call!8445 () ListLongMap!1453)

(assert (=> bm!8443 (= call!8445 call!8430)))

(declare-fun b!87958 () Bool)

(declare-fun lt!41899 () Unit!2598)

(declare-fun lt!41911 () Unit!2598)

(assert (=> b!87958 (= lt!41899 lt!41911)))

(assert (=> b!87958 (= call!8432 call!8450)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!32 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2598)

(assert (=> b!87958 (= lt!41911 (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41910 (zeroValue!2248 newMap!16) lt!41566 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)))))

(assert (=> b!87958 (= lt!41910 (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!87958 (= e!57309 (tuple2!2213 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6395 newMap!16) (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) lt!41566 (minValue!2248 newMap!16) (_size!429 newMap!16) (_keys!4033 newMap!16) (_values!2341 newMap!16) (_vacant!429 newMap!16))))))

(declare-fun b!87959 () Bool)

(assert (=> b!87959 (= e!57305 (not call!8448))))

(declare-fun c!14507 () Bool)

(declare-fun bm!8444 () Bool)

(declare-fun updateHelperNewKey!32 (LongMapFixedSize!760 (_ BitVec 64) V!3033 (_ BitVec 32)) tuple2!2212)

(assert (=> bm!8444 (= call!8449 (updateHelperNewKey!32 newMap!16 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916))))))

(declare-fun b!87960 () Bool)

(declare-fun c!14499 () Bool)

(assert (=> b!87960 (= c!14499 ((_ is MissingVacant!247) lt!41912))))

(assert (=> b!87960 (= e!57307 e!57306)))

(declare-fun bm!8445 () Bool)

(assert (=> bm!8445 (= call!8432 call!8444)))

(declare-fun b!87961 () Bool)

(declare-fun lt!41905 () tuple2!2212)

(assert (=> b!87961 (= e!57299 (tuple2!2213 (_1!1117 lt!41905) (_2!1117 lt!41905)))))

(assert (=> b!87961 (= lt!41905 call!8449)))

(declare-fun b!87962 () Bool)

(declare-fun res!45092 () Bool)

(assert (=> b!87962 (= res!45092 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3129 lt!41912)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87962 (=> (not res!45092) (not e!57311))))

(declare-fun b!87963 () Bool)

(assert (=> b!87963 (= e!57310 e!57297)))

(declare-fun c!14497 () Bool)

(assert (=> b!87963 (= c!14497 (_1!1117 lt!41894))))

(declare-fun b!87964 () Bool)

(declare-fun lt!41913 () Unit!2598)

(assert (=> b!87964 (= e!57294 lt!41913)))

(assert (=> b!87964 (= lt!41913 call!8431)))

(assert (=> b!87964 (= lt!41895 call!8441)))

(declare-fun res!45093 () Bool)

(assert (=> b!87964 (= res!45093 ((_ is Found!247) lt!41895))))

(assert (=> b!87964 (=> (not res!45093) (not e!57298))))

(assert (=> b!87964 e!57298))

(declare-fun bm!8446 () Bool)

(assert (=> bm!8446 (= call!8453 (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!87965 () Bool)

(declare-fun res!45088 () Bool)

(assert (=> b!87965 (=> (not res!45088) (not e!57293))))

(assert (=> b!87965 (= res!45088 call!8446)))

(assert (=> b!87965 (= e!57307 e!57293)))

(declare-fun bm!8447 () Bool)

(assert (=> bm!8447 (= call!8447 (contains!755 call!8445 (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916)))))))

(declare-fun bm!8448 () Bool)

(assert (=> bm!8448 (= call!8444 (+!110 (ite c!14505 (ite c!14502 call!8452 call!8450) call!8440) (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun b!87966 () Bool)

(assert (=> b!87966 (= c!14507 ((_ is MissingVacant!247) lt!41916))))

(assert (=> b!87966 (= e!57295 e!57299)))

(declare-fun b!87967 () Bool)

(declare-fun res!45089 () Bool)

(assert (=> b!87967 (= res!45089 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3129 lt!41915)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87967 (=> (not res!45089) (not e!57305))))

(declare-fun bm!8449 () Bool)

(assert (=> bm!8449 (= call!8433 call!8439)))

(declare-fun bm!8450 () Bool)

(assert (=> bm!8450 (= call!8440 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(assert (= (and d!23329 c!14505) b!87944))

(assert (= (and d!23329 (not c!14505)) b!87956))

(assert (= (and b!87944 c!14502) b!87958))

(assert (= (and b!87944 (not c!14502)) b!87939))

(assert (= (or b!87958 b!87939) bm!8432))

(assert (= (or b!87958 b!87939) bm!8428))

(assert (= (or b!87958 b!87939) bm!8445))

(assert (= (and b!87956 c!14498) b!87937))

(assert (= (and b!87956 (not c!14498)) b!87966))

(assert (= (and b!87937 c!14503) b!87950))

(assert (= (and b!87937 (not c!14503)) b!87934))

(assert (= (and b!87950 res!45081) b!87941))

(assert (= (and b!87941 res!45086) b!87948))

(assert (= (and b!87934 c!14500) b!87965))

(assert (= (and b!87934 (not c!14500)) b!87960))

(assert (= (and b!87965 res!45088) b!87952))

(assert (= (and b!87952 res!45091) b!87932))

(assert (= (and b!87960 c!14499) b!87951))

(assert (= (and b!87960 (not c!14499)) b!87933))

(assert (= (and b!87951 res!45082) b!87962))

(assert (= (and b!87962 res!45092) b!87955))

(assert (= (or b!87965 b!87951) bm!8434))

(assert (= (or b!87932 b!87955) bm!8429))

(assert (= (or b!87941 bm!8434) bm!8449))

(assert (= (or b!87950 b!87934) bm!8442))

(assert (= (and b!87966 c!14507) b!87961))

(assert (= (and b!87966 (not c!14507)) b!87947))

(assert (= (and b!87947 c!14504) b!87935))

(assert (= (and b!87947 (not c!14504)) b!87930))

(assert (= (and b!87930 c!14501) b!87964))

(assert (= (and b!87930 (not c!14501)) b!87938))

(assert (= (and b!87964 res!45093) b!87954))

(assert (= (and b!87954 res!45085) b!87953))

(assert (= (and b!87938 c!14506) b!87943))

(assert (= (and b!87938 (not c!14506)) b!87946))

(assert (= (and b!87943 res!45084) b!87945))

(assert (= (and b!87945 res!45083) b!87940))

(assert (= (and b!87946 c!14508) b!87949))

(assert (= (and b!87946 (not c!14508)) b!87942))

(assert (= (and b!87949 res!45094) b!87967))

(assert (= (and b!87967 res!45089) b!87959))

(assert (= (or b!87943 b!87949) bm!8433))

(assert (= (or b!87940 b!87959) bm!8431))

(assert (= (or b!87954 bm!8433) bm!8437))

(assert (= (or b!87964 b!87938) bm!8436))

(assert (= (or b!87961 b!87935) bm!8444))

(assert (= (or bm!8449 bm!8437) bm!8441))

(assert (= (or b!87937 b!87930) bm!8443))

(assert (= (or bm!8429 bm!8431) bm!8446))

(assert (= (or b!87950 b!87964) bm!8438))

(assert (= (or bm!8442 bm!8436) bm!8427))

(assert (= (or b!87934 b!87938) bm!8435))

(assert (= (or b!87937 b!87930) bm!8447))

(assert (= (or bm!8428 bm!8443) bm!8440))

(assert (= (or bm!8432 b!87930) bm!8450))

(assert (= (or bm!8445 b!87930) bm!8448))

(assert (= (and d!23329 res!45087) b!87963))

(assert (= (and b!87963 c!14497) b!87931))

(assert (= (and b!87963 (not c!14497)) b!87957))

(assert (= (and b!87931 res!45090) b!87936))

(assert (= (or b!87936 b!87957) bm!8439))

(assert (= (or b!87931 b!87936 b!87957) bm!8430))

(declare-fun m!93669 () Bool)

(assert (=> b!87958 m!93669))

(declare-fun m!93671 () Bool)

(assert (=> b!87939 m!93671))

(assert (=> bm!8446 m!93253))

(declare-fun m!93673 () Bool)

(assert (=> bm!8446 m!93673))

(declare-fun m!93675 () Bool)

(assert (=> b!87930 m!93675))

(assert (=> b!87930 m!93253))

(declare-fun m!93677 () Bool)

(assert (=> b!87930 m!93677))

(declare-fun m!93679 () Bool)

(assert (=> b!87930 m!93679))

(assert (=> b!87930 m!93253))

(declare-fun m!93681 () Bool)

(assert (=> b!87930 m!93681))

(declare-fun m!93683 () Bool)

(assert (=> b!87930 m!93683))

(declare-fun m!93685 () Bool)

(assert (=> bm!8430 m!93685))

(assert (=> bm!8438 m!93253))

(declare-fun m!93687 () Bool)

(assert (=> bm!8438 m!93687))

(declare-fun m!93689 () Bool)

(assert (=> b!87936 m!93689))

(declare-fun m!93691 () Bool)

(assert (=> bm!8440 m!93691))

(assert (=> bm!8444 m!93253))

(declare-fun m!93693 () Bool)

(assert (=> bm!8444 m!93693))

(declare-fun m!93695 () Bool)

(assert (=> b!87952 m!93695))

(declare-fun m!93697 () Bool)

(assert (=> b!87948 m!93697))

(declare-fun m!93699 () Bool)

(assert (=> bm!8450 m!93699))

(declare-fun m!93701 () Bool)

(assert (=> b!87953 m!93701))

(declare-fun m!93703 () Bool)

(assert (=> b!87962 m!93703))

(assert (=> bm!8435 m!93253))

(declare-fun m!93705 () Bool)

(assert (=> bm!8435 m!93705))

(declare-fun m!93707 () Bool)

(assert (=> b!87967 m!93707))

(declare-fun m!93709 () Bool)

(assert (=> bm!8448 m!93709))

(declare-fun m!93711 () Bool)

(assert (=> b!87945 m!93711))

(assert (=> b!87956 m!93253))

(declare-fun m!93713 () Bool)

(assert (=> b!87956 m!93713))

(assert (=> bm!8427 m!93253))

(assert (=> bm!8427 m!93713))

(declare-fun m!93715 () Bool)

(assert (=> bm!8447 m!93715))

(declare-fun m!93717 () Bool)

(assert (=> bm!8447 m!93717))

(declare-fun m!93719 () Bool)

(assert (=> d!23329 m!93719))

(assert (=> d!23329 m!93243))

(assert (=> b!87931 m!93253))

(declare-fun m!93721 () Bool)

(assert (=> b!87931 m!93721))

(assert (=> bm!8439 m!93285))

(declare-fun m!93723 () Bool)

(assert (=> bm!8441 m!93723))

(assert (=> b!87541 d!23329))

(declare-fun condMapEmpty!3435 () Bool)

(declare-fun mapDefault!3435 () ValueCell!926)

(assert (=> mapNonEmpty!3420 (= condMapEmpty!3435 (= mapRest!3420 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3435)))))

(declare-fun e!57318 () Bool)

(declare-fun mapRes!3435 () Bool)

(assert (=> mapNonEmpty!3420 (= tp!8969 (and e!57318 mapRes!3435))))

(declare-fun mapIsEmpty!3435 () Bool)

(assert (=> mapIsEmpty!3435 mapRes!3435))

(declare-fun b!87974 () Bool)

(declare-fun e!57317 () Bool)

(assert (=> b!87974 (= e!57317 tp_is_empty!2539)))

(declare-fun b!87975 () Bool)

(assert (=> b!87975 (= e!57318 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3435 () Bool)

(declare-fun tp!8997 () Bool)

(assert (=> mapNonEmpty!3435 (= mapRes!3435 (and tp!8997 e!57317))))

(declare-fun mapRest!3435 () (Array (_ BitVec 32) ValueCell!926))

(declare-fun mapKey!3435 () (_ BitVec 32))

(declare-fun mapValue!3435 () ValueCell!926)

(assert (=> mapNonEmpty!3435 (= mapRest!3420 (store mapRest!3435 mapKey!3435 mapValue!3435))))

(assert (= (and mapNonEmpty!3420 condMapEmpty!3435) mapIsEmpty!3435))

(assert (= (and mapNonEmpty!3420 (not condMapEmpty!3435)) mapNonEmpty!3435))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!926) mapValue!3435)) b!87974))

(assert (= (and mapNonEmpty!3420 ((_ is ValueCellFull!926) mapDefault!3435)) b!87975))

(declare-fun m!93725 () Bool)

(assert (=> mapNonEmpty!3435 m!93725))

(declare-fun condMapEmpty!3436 () Bool)

(declare-fun mapDefault!3436 () ValueCell!926)

(assert (=> mapNonEmpty!3419 (= condMapEmpty!3436 (= mapRest!3419 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3436)))))

(declare-fun e!57320 () Bool)

(declare-fun mapRes!3436 () Bool)

(assert (=> mapNonEmpty!3419 (= tp!8970 (and e!57320 mapRes!3436))))

(declare-fun mapIsEmpty!3436 () Bool)

(assert (=> mapIsEmpty!3436 mapRes!3436))

(declare-fun b!87976 () Bool)

(declare-fun e!57319 () Bool)

(assert (=> b!87976 (= e!57319 tp_is_empty!2539)))

(declare-fun b!87977 () Bool)

(assert (=> b!87977 (= e!57320 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3436 () Bool)

(declare-fun tp!8998 () Bool)

(assert (=> mapNonEmpty!3436 (= mapRes!3436 (and tp!8998 e!57319))))

(declare-fun mapRest!3436 () (Array (_ BitVec 32) ValueCell!926))

(declare-fun mapValue!3436 () ValueCell!926)

(declare-fun mapKey!3436 () (_ BitVec 32))

(assert (=> mapNonEmpty!3436 (= mapRest!3419 (store mapRest!3436 mapKey!3436 mapValue!3436))))

(assert (= (and mapNonEmpty!3419 condMapEmpty!3436) mapIsEmpty!3436))

(assert (= (and mapNonEmpty!3419 (not condMapEmpty!3436)) mapNonEmpty!3436))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!926) mapValue!3436)) b!87976))

(assert (= (and mapNonEmpty!3419 ((_ is ValueCellFull!926) mapDefault!3436)) b!87977))

(declare-fun m!93727 () Bool)

(assert (=> mapNonEmpty!3436 m!93727))

(declare-fun b_lambda!3893 () Bool)

(assert (= b_lambda!3887 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3893)))

(declare-fun b_lambda!3895 () Bool)

(assert (= b_lambda!3889 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3895)))

(declare-fun b_lambda!3897 () Bool)

(assert (= b_lambda!3891 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3897)))

(check-sat (not d!23319) (not d!23329) (not bm!8447) (not bm!8372) (not b!87754) (not b_lambda!3885) (not b_next!2247) (not b!87853) (not b!87806) (not b!87732) (not b!87733) (not b!87841) (not b!87828) (not d!23283) (not b!87797) (not d!23317) (not b!87811) (not b!87813) (not d!23287) (not b!87725) (not b!87741) (not b!87746) (not b!87680) (not b!87956) (not b!87823) (not bm!8354) (not b!87744) (not d!23327) (not bm!8375) (not b!87939) (not bm!8450) (not bm!8444) b_and!5293 (not b!87931) (not mapNonEmpty!3435) (not bm!8438) (not bm!8369) (not b!87802) (not b!87739) (not d!23295) (not b!87730) (not b!87843) (not b!87742) tp_is_empty!2539 (not b!87753) (not b!87958) (not d!23311) (not b!87810) (not d!23291) (not b_lambda!3897) (not d!23313) (not b!87681) (not d!23293) (not bm!8378) (not bm!8441) (not b!87745) (not b!87743) (not b_lambda!3893) (not b!87694) (not b!87700) (not b!87738) (not b!87699) (not b!87731) (not d!23315) (not b!87936) (not b!87801) (not b!87682) (not bm!8440) (not b_next!2245) (not bm!8439) (not b!87737) (not bm!8351) (not b!87734) (not d!23301) (not bm!8427) (not b_lambda!3895) (not bm!8435) (not d!23297) (not bm!8446) (not b!87851) (not b!87747) b_and!5295 (not b!87808) (not b!87740) (not b!87729) (not d!23275) (not d!23285) (not bm!8430) (not b!87728) (not b!87930) (not d!23289) (not d!23299) (not mapNonEmpty!3436) (not b!87842) (not b!87748) (not bm!8374) (not d!23323) (not bm!8448) (not b!87692))
(check-sat b_and!5293 b_and!5295 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun d!23331 () Bool)

(declare-fun get!1211 (Option!145) V!3033)

(assert (=> d!23331 (= (apply!83 lt!41814 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1211 (getValueByKey!139 (toList!742 lt!41814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3711 () Bool)

(assert (= bs!3711 d!23331))

(declare-fun m!93729 () Bool)

(assert (=> bs!3711 m!93729))

(assert (=> bs!3711 m!93729))

(declare-fun m!93731 () Bool)

(assert (=> bs!3711 m!93731))

(assert (=> b!87810 d!23331))

(declare-fun d!23333 () Bool)

(declare-fun res!45095 () Bool)

(declare-fun e!57321 () Bool)

(assert (=> d!23333 (=> (not res!45095) (not e!57321))))

(assert (=> d!23333 (= res!45095 (simpleValid!59 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23333 (= (valid!338 (v!2654 (underlying!288 thiss!992))) e!57321)))

(declare-fun b!87978 () Bool)

(declare-fun res!45096 () Bool)

(assert (=> b!87978 (=> (not res!45096) (not e!57321))))

(assert (=> b!87978 (= res!45096 (= (arrayCountValidKeys!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))) (_size!429 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87979 () Bool)

(declare-fun res!45097 () Bool)

(assert (=> b!87979 (=> (not res!45097) (not e!57321))))

(assert (=> b!87979 (= res!45097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!87980 () Bool)

(assert (=> b!87980 (= e!57321 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 Nil!1528))))

(assert (= (and d!23333 res!45095) b!87978))

(assert (= (and b!87978 res!45096) b!87979))

(assert (= (and b!87979 res!45097) b!87980))

(declare-fun m!93733 () Bool)

(assert (=> d!23333 m!93733))

(declare-fun m!93735 () Bool)

(assert (=> b!87978 m!93735))

(assert (=> b!87979 m!93277))

(declare-fun m!93737 () Bool)

(assert (=> b!87980 m!93737))

(assert (=> d!23315 d!23333))

(declare-fun b!87993 () Bool)

(declare-fun c!14515 () Bool)

(declare-fun lt!41927 () (_ BitVec 64))

(assert (=> b!87993 (= c!14515 (= lt!41927 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57329 () SeekEntryResult!247)

(declare-fun e!57328 () SeekEntryResult!247)

(assert (=> b!87993 (= e!57329 e!57328)))

(declare-fun b!87994 () Bool)

(declare-fun e!57330 () SeekEntryResult!247)

(assert (=> b!87994 (= e!57330 Undefined!247)))

(declare-fun b!87995 () Bool)

(declare-fun lt!41925 () SeekEntryResult!247)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4019 (_ BitVec 32)) SeekEntryResult!247)

(assert (=> b!87995 (= e!57328 (seekKeyOrZeroReturnVacant!0 (x!12143 lt!41925) (index!3128 lt!41925) (index!3128 lt!41925) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun d!23335 () Bool)

(declare-fun lt!41926 () SeekEntryResult!247)

(assert (=> d!23335 (and (or ((_ is Undefined!247) lt!41926) (not ((_ is Found!247) lt!41926)) (and (bvsge (index!3127 lt!41926) #b00000000000000000000000000000000) (bvslt (index!3127 lt!41926) (size!2158 (_keys!4033 newMap!16))))) (or ((_ is Undefined!247) lt!41926) ((_ is Found!247) lt!41926) (not ((_ is MissingZero!247) lt!41926)) (and (bvsge (index!3126 lt!41926) #b00000000000000000000000000000000) (bvslt (index!3126 lt!41926) (size!2158 (_keys!4033 newMap!16))))) (or ((_ is Undefined!247) lt!41926) ((_ is Found!247) lt!41926) ((_ is MissingZero!247) lt!41926) (not ((_ is MissingVacant!247) lt!41926)) (and (bvsge (index!3129 lt!41926) #b00000000000000000000000000000000) (bvslt (index!3129 lt!41926) (size!2158 (_keys!4033 newMap!16))))) (or ((_ is Undefined!247) lt!41926) (ite ((_ is Found!247) lt!41926) (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41926)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (ite ((_ is MissingZero!247) lt!41926) (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3126 lt!41926)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!247) lt!41926) (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3129 lt!41926)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23335 (= lt!41926 e!57330)))

(declare-fun c!14517 () Bool)

(assert (=> d!23335 (= c!14517 (and ((_ is Intermediate!247) lt!41925) (undefined!1059 lt!41925)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4019 (_ BitVec 32)) SeekEntryResult!247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23335 (= lt!41925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (mask!6395 newMap!16)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(assert (=> d!23335 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23335 (= (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)) lt!41926)))

(declare-fun b!87996 () Bool)

(assert (=> b!87996 (= e!57328 (MissingZero!247 (index!3128 lt!41925)))))

(declare-fun b!87997 () Bool)

(assert (=> b!87997 (= e!57330 e!57329)))

(assert (=> b!87997 (= lt!41927 (select (arr!1912 (_keys!4033 newMap!16)) (index!3128 lt!41925)))))

(declare-fun c!14516 () Bool)

(assert (=> b!87997 (= c!14516 (= lt!41927 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!87998 () Bool)

(assert (=> b!87998 (= e!57329 (Found!247 (index!3128 lt!41925)))))

(assert (= (and d!23335 c!14517) b!87994))

(assert (= (and d!23335 (not c!14517)) b!87997))

(assert (= (and b!87997 c!14516) b!87998))

(assert (= (and b!87997 (not c!14516)) b!87993))

(assert (= (and b!87993 c!14515) b!87996))

(assert (= (and b!87993 (not c!14515)) b!87995))

(assert (=> b!87995 m!93253))

(declare-fun m!93739 () Bool)

(assert (=> b!87995 m!93739))

(declare-fun m!93741 () Bool)

(assert (=> d!23335 m!93741))

(declare-fun m!93743 () Bool)

(assert (=> d!23335 m!93743))

(declare-fun m!93745 () Bool)

(assert (=> d!23335 m!93745))

(assert (=> d!23335 m!93253))

(declare-fun m!93747 () Bool)

(assert (=> d!23335 m!93747))

(declare-fun m!93749 () Bool)

(assert (=> d!23335 m!93749))

(declare-fun m!93751 () Bool)

(assert (=> d!23335 m!93751))

(assert (=> d!23335 m!93253))

(assert (=> d!23335 m!93745))

(declare-fun m!93753 () Bool)

(assert (=> b!87997 m!93753))

(assert (=> bm!8427 d!23335))

(assert (=> b!87956 d!23335))

(declare-fun b!88008 () Bool)

(declare-fun e!57335 () Option!145)

(declare-fun e!57336 () Option!145)

(assert (=> b!88008 (= e!57335 e!57336)))

(declare-fun c!14523 () Bool)

(assert (=> b!88008 (= c!14523 (and ((_ is Cons!1526) (toList!742 lt!41704)) (not (= (_1!1116 (h!2118 (toList!742 lt!41704))) (_1!1116 lt!41572)))))))

(declare-fun d!23337 () Bool)

(declare-fun c!14522 () Bool)

(assert (=> d!23337 (= c!14522 (and ((_ is Cons!1526) (toList!742 lt!41704)) (= (_1!1116 (h!2118 (toList!742 lt!41704))) (_1!1116 lt!41572))))))

(assert (=> d!23337 (= (getValueByKey!139 (toList!742 lt!41704) (_1!1116 lt!41572)) e!57335)))

(declare-fun b!88009 () Bool)

(assert (=> b!88009 (= e!57336 (getValueByKey!139 (t!5263 (toList!742 lt!41704)) (_1!1116 lt!41572)))))

(declare-fun b!88007 () Bool)

(assert (=> b!88007 (= e!57335 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41704)))))))

(declare-fun b!88010 () Bool)

(assert (=> b!88010 (= e!57336 None!143)))

(assert (= (and d!23337 c!14522) b!88007))

(assert (= (and d!23337 (not c!14522)) b!88008))

(assert (= (and b!88008 c!14523) b!88009))

(assert (= (and b!88008 (not c!14523)) b!88010))

(declare-fun m!93755 () Bool)

(assert (=> b!88009 m!93755))

(assert (=> b!87699 d!23337))

(declare-fun d!23339 () Bool)

(declare-fun e!57337 () Bool)

(assert (=> d!23339 e!57337))

(declare-fun res!45098 () Bool)

(assert (=> d!23339 (=> (not res!45098) (not e!57337))))

(declare-fun lt!41931 () ListLongMap!1453)

(assert (=> d!23339 (= res!45098 (contains!755 lt!41931 (_1!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!41930 () List!1530)

(assert (=> d!23339 (= lt!41931 (ListLongMap!1454 lt!41930))))

(declare-fun lt!41929 () Unit!2598)

(declare-fun lt!41928 () Unit!2598)

(assert (=> d!23339 (= lt!41929 lt!41928)))

(assert (=> d!23339 (= (getValueByKey!139 lt!41930 (_1!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23339 (= lt!41928 (lemmaContainsTupThenGetReturnValue!59 lt!41930 (_1!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23339 (= lt!41930 (insertStrictlySorted!62 (toList!742 lt!41811) (_1!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23339 (= (+!110 lt!41811 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41931)))

(declare-fun b!88011 () Bool)

(declare-fun res!45099 () Bool)

(assert (=> b!88011 (=> (not res!45099) (not e!57337))))

(assert (=> b!88011 (= res!45099 (= (getValueByKey!139 (toList!742 lt!41931) (_1!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88012 () Bool)

(assert (=> b!88012 (= e!57337 (contains!757 (toList!742 lt!41931) (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23339 res!45098) b!88011))

(assert (= (and b!88011 res!45099) b!88012))

(declare-fun m!93757 () Bool)

(assert (=> d!23339 m!93757))

(declare-fun m!93759 () Bool)

(assert (=> d!23339 m!93759))

(declare-fun m!93761 () Bool)

(assert (=> d!23339 m!93761))

(declare-fun m!93763 () Bool)

(assert (=> d!23339 m!93763))

(declare-fun m!93765 () Bool)

(assert (=> b!88011 m!93765))

(declare-fun m!93767 () Bool)

(assert (=> b!88012 m!93767))

(assert (=> b!87808 d!23339))

(declare-fun d!23341 () Bool)

(declare-fun e!57339 () Bool)

(assert (=> d!23341 e!57339))

(declare-fun res!45100 () Bool)

(assert (=> d!23341 (=> res!45100 e!57339)))

(declare-fun lt!41933 () Bool)

(assert (=> d!23341 (= res!45100 (not lt!41933))))

(declare-fun lt!41932 () Bool)

(assert (=> d!23341 (= lt!41933 lt!41932)))

(declare-fun lt!41934 () Unit!2598)

(declare-fun e!57338 () Unit!2598)

(assert (=> d!23341 (= lt!41934 e!57338)))

(declare-fun c!14524 () Bool)

(assert (=> d!23341 (= c!14524 lt!41932)))

(assert (=> d!23341 (= lt!41932 (containsKey!143 (toList!742 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41803))))

(assert (=> d!23341 (= (contains!755 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41803) lt!41933)))

(declare-fun b!88013 () Bool)

(declare-fun lt!41935 () Unit!2598)

(assert (=> b!88013 (= e!57338 lt!41935)))

(assert (=> b!88013 (= lt!41935 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41803))))

(assert (=> b!88013 (isDefined!93 (getValueByKey!139 (toList!742 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41803))))

(declare-fun b!88014 () Bool)

(declare-fun Unit!2613 () Unit!2598)

(assert (=> b!88014 (= e!57338 Unit!2613)))

(declare-fun b!88015 () Bool)

(assert (=> b!88015 (= e!57339 (isDefined!93 (getValueByKey!139 (toList!742 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41803)))))

(assert (= (and d!23341 c!14524) b!88013))

(assert (= (and d!23341 (not c!14524)) b!88014))

(assert (= (and d!23341 (not res!45100)) b!88015))

(declare-fun m!93769 () Bool)

(assert (=> d!23341 m!93769))

(declare-fun m!93771 () Bool)

(assert (=> b!88013 m!93771))

(declare-fun m!93773 () Bool)

(assert (=> b!88013 m!93773))

(assert (=> b!88013 m!93773))

(declare-fun m!93775 () Bool)

(assert (=> b!88013 m!93775))

(assert (=> b!88015 m!93773))

(assert (=> b!88015 m!93773))

(assert (=> b!88015 m!93775))

(assert (=> b!87808 d!23341))

(declare-fun d!23343 () Bool)

(declare-fun e!57340 () Bool)

(assert (=> d!23343 e!57340))

(declare-fun res!45101 () Bool)

(assert (=> d!23343 (=> (not res!45101) (not e!57340))))

(declare-fun lt!41939 () ListLongMap!1453)

(assert (=> d!23343 (= res!45101 (contains!755 lt!41939 (_1!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!41938 () List!1530)

(assert (=> d!23343 (= lt!41939 (ListLongMap!1454 lt!41938))))

(declare-fun lt!41937 () Unit!2598)

(declare-fun lt!41936 () Unit!2598)

(assert (=> d!23343 (= lt!41937 lt!41936)))

(assert (=> d!23343 (= (getValueByKey!139 lt!41938 (_1!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23343 (= lt!41936 (lemmaContainsTupThenGetReturnValue!59 lt!41938 (_1!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23343 (= lt!41938 (insertStrictlySorted!62 (toList!742 lt!41796) (_1!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23343 (= (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41939)))

(declare-fun b!88016 () Bool)

(declare-fun res!45102 () Bool)

(assert (=> b!88016 (=> (not res!45102) (not e!57340))))

(assert (=> b!88016 (= res!45102 (= (getValueByKey!139 (toList!742 lt!41939) (_1!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88017 () Bool)

(assert (=> b!88017 (= e!57340 (contains!757 (toList!742 lt!41939) (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23343 res!45101) b!88016))

(assert (= (and b!88016 res!45102) b!88017))

(declare-fun m!93777 () Bool)

(assert (=> d!23343 m!93777))

(declare-fun m!93779 () Bool)

(assert (=> d!23343 m!93779))

(declare-fun m!93781 () Bool)

(assert (=> d!23343 m!93781))

(declare-fun m!93783 () Bool)

(assert (=> d!23343 m!93783))

(declare-fun m!93785 () Bool)

(assert (=> b!88016 m!93785))

(declare-fun m!93787 () Bool)

(assert (=> b!88017 m!93787))

(assert (=> b!87808 d!23343))

(declare-fun d!23345 () Bool)

(declare-fun e!57341 () Bool)

(assert (=> d!23345 e!57341))

(declare-fun res!45103 () Bool)

(assert (=> d!23345 (=> (not res!45103) (not e!57341))))

(declare-fun lt!41943 () ListLongMap!1453)

(assert (=> d!23345 (= res!45103 (contains!755 lt!41943 (_1!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!41942 () List!1530)

(assert (=> d!23345 (= lt!41943 (ListLongMap!1454 lt!41942))))

(declare-fun lt!41941 () Unit!2598)

(declare-fun lt!41940 () Unit!2598)

(assert (=> d!23345 (= lt!41941 lt!41940)))

(assert (=> d!23345 (= (getValueByKey!139 lt!41942 (_1!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23345 (= lt!41940 (lemmaContainsTupThenGetReturnValue!59 lt!41942 (_1!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23345 (= lt!41942 (insertStrictlySorted!62 (toList!742 lt!41801) (_1!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23345 (= (+!110 lt!41801 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41943)))

(declare-fun b!88018 () Bool)

(declare-fun res!45104 () Bool)

(assert (=> b!88018 (=> (not res!45104) (not e!57341))))

(assert (=> b!88018 (= res!45104 (= (getValueByKey!139 (toList!742 lt!41943) (_1!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88019 () Bool)

(assert (=> b!88019 (= e!57341 (contains!757 (toList!742 lt!41943) (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23345 res!45103) b!88018))

(assert (= (and b!88018 res!45104) b!88019))

(declare-fun m!93789 () Bool)

(assert (=> d!23345 m!93789))

(declare-fun m!93791 () Bool)

(assert (=> d!23345 m!93791))

(declare-fun m!93793 () Bool)

(assert (=> d!23345 m!93793))

(declare-fun m!93795 () Bool)

(assert (=> d!23345 m!93795))

(declare-fun m!93797 () Bool)

(assert (=> b!88018 m!93797))

(declare-fun m!93799 () Bool)

(assert (=> b!88019 m!93799))

(assert (=> b!87808 d!23345))

(assert (=> b!87808 d!23289))

(declare-fun d!23347 () Bool)

(assert (=> d!23347 (= (apply!83 lt!41801 lt!41812) (get!1211 (getValueByKey!139 (toList!742 lt!41801) lt!41812)))))

(declare-fun bs!3712 () Bool)

(assert (= bs!3712 d!23347))

(declare-fun m!93801 () Bool)

(assert (=> bs!3712 m!93801))

(assert (=> bs!3712 m!93801))

(declare-fun m!93803 () Bool)

(assert (=> bs!3712 m!93803))

(assert (=> b!87808 d!23347))

(declare-fun d!23349 () Bool)

(assert (=> d!23349 (contains!755 (+!110 lt!41796 (tuple2!2211 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41803)))

(declare-fun lt!41946 () Unit!2598)

(declare-fun choose!522 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> d!23349 (= lt!41946 (choose!522 lt!41796 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41803))))

(assert (=> d!23349 (contains!755 lt!41796 lt!41803)))

(assert (=> d!23349 (= (addStillContains!59 lt!41796 lt!41809 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41803) lt!41946)))

(declare-fun bs!3713 () Bool)

(assert (= bs!3713 d!23349))

(assert (=> bs!3713 m!93611))

(assert (=> bs!3713 m!93611))

(assert (=> bs!3713 m!93613))

(declare-fun m!93805 () Bool)

(assert (=> bs!3713 m!93805))

(declare-fun m!93807 () Bool)

(assert (=> bs!3713 m!93807))

(assert (=> b!87808 d!23349))

(declare-fun d!23351 () Bool)

(assert (=> d!23351 (= (apply!83 (+!110 lt!41811 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41807) (get!1211 (getValueByKey!139 (toList!742 (+!110 lt!41811 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41807)))))

(declare-fun bs!3714 () Bool)

(assert (= bs!3714 d!23351))

(declare-fun m!93809 () Bool)

(assert (=> bs!3714 m!93809))

(assert (=> bs!3714 m!93809))

(declare-fun m!93811 () Bool)

(assert (=> bs!3714 m!93811))

(assert (=> b!87808 d!23351))

(declare-fun d!23353 () Bool)

(declare-fun e!57342 () Bool)

(assert (=> d!23353 e!57342))

(declare-fun res!45105 () Bool)

(assert (=> d!23353 (=> (not res!45105) (not e!57342))))

(declare-fun lt!41950 () ListLongMap!1453)

(assert (=> d!23353 (= res!45105 (contains!755 lt!41950 (_1!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!41949 () List!1530)

(assert (=> d!23353 (= lt!41950 (ListLongMap!1454 lt!41949))))

(declare-fun lt!41948 () Unit!2598)

(declare-fun lt!41947 () Unit!2598)

(assert (=> d!23353 (= lt!41948 lt!41947)))

(assert (=> d!23353 (= (getValueByKey!139 lt!41949 (_1!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23353 (= lt!41947 (lemmaContainsTupThenGetReturnValue!59 lt!41949 (_1!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23353 (= lt!41949 (insertStrictlySorted!62 (toList!742 lt!41810) (_1!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23353 (= (+!110 lt!41810 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41950)))

(declare-fun b!88021 () Bool)

(declare-fun res!45106 () Bool)

(assert (=> b!88021 (=> (not res!45106) (not e!57342))))

(assert (=> b!88021 (= res!45106 (= (getValueByKey!139 (toList!742 lt!41950) (_1!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88022 () Bool)

(assert (=> b!88022 (= e!57342 (contains!757 (toList!742 lt!41950) (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23353 res!45105) b!88021))

(assert (= (and b!88021 res!45106) b!88022))

(declare-fun m!93813 () Bool)

(assert (=> d!23353 m!93813))

(declare-fun m!93815 () Bool)

(assert (=> d!23353 m!93815))

(declare-fun m!93817 () Bool)

(assert (=> d!23353 m!93817))

(declare-fun m!93819 () Bool)

(assert (=> d!23353 m!93819))

(declare-fun m!93821 () Bool)

(assert (=> b!88021 m!93821))

(declare-fun m!93823 () Bool)

(assert (=> b!88022 m!93823))

(assert (=> b!87808 d!23353))

(declare-fun d!23355 () Bool)

(assert (=> d!23355 (= (apply!83 (+!110 lt!41811 (tuple2!2211 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41807) (apply!83 lt!41811 lt!41807))))

(declare-fun lt!41953 () Unit!2598)

(declare-fun choose!523 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> d!23355 (= lt!41953 (choose!523 lt!41811 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41807))))

(declare-fun e!57345 () Bool)

(assert (=> d!23355 e!57345))

(declare-fun res!45109 () Bool)

(assert (=> d!23355 (=> (not res!45109) (not e!57345))))

(assert (=> d!23355 (= res!45109 (contains!755 lt!41811 lt!41807))))

(assert (=> d!23355 (= (addApplyDifferent!59 lt!41811 lt!41804 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41807) lt!41953)))

(declare-fun b!88026 () Bool)

(assert (=> b!88026 (= e!57345 (not (= lt!41807 lt!41804)))))

(assert (= (and d!23355 res!45109) b!88026))

(assert (=> d!23355 m!93615))

(declare-fun m!93825 () Bool)

(assert (=> d!23355 m!93825))

(declare-fun m!93827 () Bool)

(assert (=> d!23355 m!93827))

(assert (=> d!23355 m!93625))

(assert (=> d!23355 m!93615))

(assert (=> d!23355 m!93633))

(assert (=> b!87808 d!23355))

(declare-fun d!23357 () Bool)

(assert (=> d!23357 (= (apply!83 (+!110 lt!41810 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41799) (apply!83 lt!41810 lt!41799))))

(declare-fun lt!41954 () Unit!2598)

(assert (=> d!23357 (= lt!41954 (choose!523 lt!41810 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41799))))

(declare-fun e!57346 () Bool)

(assert (=> d!23357 e!57346))

(declare-fun res!45110 () Bool)

(assert (=> d!23357 (=> (not res!45110) (not e!57346))))

(assert (=> d!23357 (= res!45110 (contains!755 lt!41810 lt!41799))))

(assert (=> d!23357 (= (addApplyDifferent!59 lt!41810 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41799) lt!41954)))

(declare-fun b!88027 () Bool)

(assert (=> b!88027 (= e!57346 (not (= lt!41799 lt!41805)))))

(assert (= (and d!23357 res!45110) b!88027))

(assert (=> d!23357 m!93621))

(declare-fun m!93829 () Bool)

(assert (=> d!23357 m!93829))

(declare-fun m!93831 () Bool)

(assert (=> d!23357 m!93831))

(assert (=> d!23357 m!93635))

(assert (=> d!23357 m!93621))

(assert (=> d!23357 m!93623))

(assert (=> b!87808 d!23357))

(declare-fun d!23359 () Bool)

(assert (=> d!23359 (= (apply!83 lt!41810 lt!41799) (get!1211 (getValueByKey!139 (toList!742 lt!41810) lt!41799)))))

(declare-fun bs!3715 () Bool)

(assert (= bs!3715 d!23359))

(declare-fun m!93833 () Bool)

(assert (=> bs!3715 m!93833))

(assert (=> bs!3715 m!93833))

(declare-fun m!93835 () Bool)

(assert (=> bs!3715 m!93835))

(assert (=> b!87808 d!23359))

(declare-fun d!23361 () Bool)

(assert (=> d!23361 (= (apply!83 (+!110 lt!41801 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41812) (get!1211 (getValueByKey!139 (toList!742 (+!110 lt!41801 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41812)))))

(declare-fun bs!3716 () Bool)

(assert (= bs!3716 d!23361))

(declare-fun m!93837 () Bool)

(assert (=> bs!3716 m!93837))

(assert (=> bs!3716 m!93837))

(declare-fun m!93839 () Bool)

(assert (=> bs!3716 m!93839))

(assert (=> b!87808 d!23361))

(declare-fun d!23363 () Bool)

(assert (=> d!23363 (= (apply!83 lt!41811 lt!41807) (get!1211 (getValueByKey!139 (toList!742 lt!41811) lt!41807)))))

(declare-fun bs!3717 () Bool)

(assert (= bs!3717 d!23363))

(declare-fun m!93841 () Bool)

(assert (=> bs!3717 m!93841))

(assert (=> bs!3717 m!93841))

(declare-fun m!93843 () Bool)

(assert (=> bs!3717 m!93843))

(assert (=> b!87808 d!23363))

(declare-fun d!23365 () Bool)

(assert (=> d!23365 (= (apply!83 (+!110 lt!41810 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41799) (get!1211 (getValueByKey!139 (toList!742 (+!110 lt!41810 (tuple2!2211 lt!41805 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!41799)))))

(declare-fun bs!3718 () Bool)

(assert (= bs!3718 d!23365))

(declare-fun m!93845 () Bool)

(assert (=> bs!3718 m!93845))

(assert (=> bs!3718 m!93845))

(declare-fun m!93847 () Bool)

(assert (=> bs!3718 m!93847))

(assert (=> b!87808 d!23365))

(declare-fun d!23367 () Bool)

(assert (=> d!23367 (= (apply!83 (+!110 lt!41801 (tuple2!2211 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!41812) (apply!83 lt!41801 lt!41812))))

(declare-fun lt!41955 () Unit!2598)

(assert (=> d!23367 (= lt!41955 (choose!523 lt!41801 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41812))))

(declare-fun e!57347 () Bool)

(assert (=> d!23367 e!57347))

(declare-fun res!45111 () Bool)

(assert (=> d!23367 (=> (not res!45111) (not e!57347))))

(assert (=> d!23367 (= res!45111 (contains!755 lt!41801 lt!41812))))

(assert (=> d!23367 (= (addApplyDifferent!59 lt!41801 lt!41795 (minValue!2248 (v!2654 (underlying!288 thiss!992))) lt!41812) lt!41955)))

(declare-fun b!88028 () Bool)

(assert (=> b!88028 (= e!57347 (not (= lt!41812 lt!41795)))))

(assert (= (and d!23367 res!45111) b!88028))

(assert (=> d!23367 m!93631))

(declare-fun m!93849 () Bool)

(assert (=> d!23367 m!93849))

(declare-fun m!93851 () Bool)

(assert (=> d!23367 m!93851))

(assert (=> d!23367 m!93627))

(assert (=> d!23367 m!93631))

(assert (=> d!23367 m!93637))

(assert (=> b!87808 d!23367))

(declare-fun b!88029 () Bool)

(declare-fun e!57357 () Bool)

(declare-fun lt!41975 () ListLongMap!1453)

(assert (=> b!88029 (= e!57357 (= (apply!83 lt!41975 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16))))))

(declare-fun b!88030 () Bool)

(declare-fun e!57349 () Bool)

(declare-fun e!57358 () Bool)

(assert (=> b!88030 (= e!57349 e!57358)))

(declare-fun res!45112 () Bool)

(declare-fun call!8460 () Bool)

(assert (=> b!88030 (= res!45112 call!8460)))

(assert (=> b!88030 (=> (not res!45112) (not e!57358))))

(declare-fun call!8455 () ListLongMap!1453)

(declare-fun call!8454 () ListLongMap!1453)

(declare-fun call!8459 () ListLongMap!1453)

(declare-fun c!14529 () Bool)

(declare-fun bm!8451 () Bool)

(declare-fun call!8456 () ListLongMap!1453)

(declare-fun c!14527 () Bool)

(assert (=> bm!8451 (= call!8454 (+!110 (ite c!14529 call!8459 (ite c!14527 call!8456 call!8455)) (ite (or c!14529 c!14527) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16)))))))

(declare-fun b!88031 () Bool)

(declare-fun res!45114 () Bool)

(declare-fun e!57360 () Bool)

(assert (=> b!88031 (=> (not res!45114) (not e!57360))))

(declare-fun e!57359 () Bool)

(assert (=> b!88031 (= res!45114 e!57359)))

(declare-fun res!45120 () Bool)

(assert (=> b!88031 (=> res!45120 e!57359)))

(declare-fun e!57353 () Bool)

(assert (=> b!88031 (= res!45120 (not e!57353))))

(declare-fun res!45117 () Bool)

(assert (=> b!88031 (=> (not res!45117) (not e!57353))))

(assert (=> b!88031 (= res!45117 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88032 () Bool)

(declare-fun e!57350 () Bool)

(assert (=> b!88032 (= e!57350 e!57357)))

(declare-fun res!45119 () Bool)

(declare-fun call!8458 () Bool)

(assert (=> b!88032 (= res!45119 call!8458)))

(assert (=> b!88032 (=> (not res!45119) (not e!57357))))

(declare-fun b!88033 () Bool)

(declare-fun e!57348 () ListLongMap!1453)

(assert (=> b!88033 (= e!57348 (+!110 call!8454 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16))))))

(declare-fun bm!8452 () Bool)

(declare-fun call!8457 () ListLongMap!1453)

(assert (=> bm!8452 (= call!8457 call!8454)))

(declare-fun b!88034 () Bool)

(assert (=> b!88034 (= e!57353 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88035 () Bool)

(assert (=> b!88035 (= e!57349 (not call!8460))))

(declare-fun b!88036 () Bool)

(declare-fun e!57351 () ListLongMap!1453)

(assert (=> b!88036 (= e!57351 call!8455)))

(declare-fun c!14526 () Bool)

(declare-fun b!88037 () Bool)

(assert (=> b!88037 (= c!14526 (and (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57354 () ListLongMap!1453)

(assert (=> b!88037 (= e!57354 e!57351)))

(declare-fun bm!8453 () Bool)

(assert (=> bm!8453 (= call!8456 call!8459)))

(declare-fun b!88038 () Bool)

(declare-fun e!57352 () Bool)

(assert (=> b!88038 (= e!57352 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88039 () Bool)

(assert (=> b!88039 (= e!57360 e!57349)))

(declare-fun c!14528 () Bool)

(assert (=> b!88039 (= c!14528 (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88040 () Bool)

(declare-fun e!57355 () Unit!2598)

(declare-fun lt!41958 () Unit!2598)

(assert (=> b!88040 (= e!57355 lt!41958)))

(declare-fun lt!41957 () ListLongMap!1453)

(assert (=> b!88040 (= lt!41957 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41970 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41964 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41964 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!41969 () Unit!2598)

(assert (=> b!88040 (= lt!41969 (addStillContains!59 lt!41957 lt!41970 (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) lt!41964))))

(assert (=> b!88040 (contains!755 (+!110 lt!41957 (tuple2!2211 lt!41970 (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)))) lt!41964)))

(declare-fun lt!41967 () Unit!2598)

(assert (=> b!88040 (= lt!41967 lt!41969)))

(declare-fun lt!41962 () ListLongMap!1453)

(assert (=> b!88040 (= lt!41962 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41956 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41956 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41973 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41973 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!41959 () Unit!2598)

(assert (=> b!88040 (= lt!41959 (addApplyDifferent!59 lt!41962 lt!41956 (minValue!2248 newMap!16) lt!41973))))

(assert (=> b!88040 (= (apply!83 (+!110 lt!41962 (tuple2!2211 lt!41956 (minValue!2248 newMap!16))) lt!41973) (apply!83 lt!41962 lt!41973))))

(declare-fun lt!41961 () Unit!2598)

(assert (=> b!88040 (= lt!41961 lt!41959)))

(declare-fun lt!41972 () ListLongMap!1453)

(assert (=> b!88040 (= lt!41972 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41965 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41968 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41968 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!41977 () Unit!2598)

(assert (=> b!88040 (= lt!41977 (addApplyDifferent!59 lt!41972 lt!41965 (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) lt!41968))))

(assert (=> b!88040 (= (apply!83 (+!110 lt!41972 (tuple2!2211 lt!41965 (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)))) lt!41968) (apply!83 lt!41972 lt!41968))))

(declare-fun lt!41974 () Unit!2598)

(assert (=> b!88040 (= lt!41974 lt!41977)))

(declare-fun lt!41971 () ListLongMap!1453)

(assert (=> b!88040 (= lt!41971 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41966 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41966 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41960 () (_ BitVec 64))

(assert (=> b!88040 (= lt!41960 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88040 (= lt!41958 (addApplyDifferent!59 lt!41971 lt!41966 (minValue!2248 newMap!16) lt!41960))))

(assert (=> b!88040 (= (apply!83 (+!110 lt!41971 (tuple2!2211 lt!41966 (minValue!2248 newMap!16))) lt!41960) (apply!83 lt!41971 lt!41960))))

(declare-fun b!88041 () Bool)

(assert (=> b!88041 (= e!57354 call!8457)))

(declare-fun b!88042 () Bool)

(assert (=> b!88042 (= e!57358 (= (apply!83 lt!41975 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 newMap!16)))))

(declare-fun b!88043 () Bool)

(declare-fun e!57356 () Bool)

(assert (=> b!88043 (= e!57359 e!57356)))

(declare-fun res!45115 () Bool)

(assert (=> b!88043 (=> (not res!45115) (not e!57356))))

(assert (=> b!88043 (= res!45115 (contains!755 lt!41975 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88043 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun d!23369 () Bool)

(assert (=> d!23369 e!57360))

(declare-fun res!45113 () Bool)

(assert (=> d!23369 (=> (not res!45113) (not e!57360))))

(assert (=> d!23369 (= res!45113 (or (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))))

(declare-fun lt!41976 () ListLongMap!1453)

(assert (=> d!23369 (= lt!41975 lt!41976)))

(declare-fun lt!41963 () Unit!2598)

(assert (=> d!23369 (= lt!41963 e!57355)))

(declare-fun c!14530 () Bool)

(assert (=> d!23369 (= c!14530 e!57352)))

(declare-fun res!45118 () Bool)

(assert (=> d!23369 (=> (not res!45118) (not e!57352))))

(assert (=> d!23369 (= res!45118 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23369 (= lt!41976 e!57348)))

(assert (=> d!23369 (= c!14529 (and (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23369 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23369 (= (getCurrentListMap!427 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!41975)))

(declare-fun b!88044 () Bool)

(assert (=> b!88044 (= e!57348 e!57354)))

(assert (=> b!88044 (= c!14527 (and (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88045 () Bool)

(assert (=> b!88045 (= e!57356 (= (apply!83 lt!41975 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)) (get!1207 (select (arr!1913 (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893)) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2159 (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893))))))

(assert (=> b!88045 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88046 () Bool)

(declare-fun Unit!2614 () Unit!2598)

(assert (=> b!88046 (= e!57355 Unit!2614)))

(declare-fun bm!8454 () Bool)

(assert (=> bm!8454 (= call!8460 (contains!755 lt!41975 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88047 () Bool)

(assert (=> b!88047 (= e!57351 call!8457)))

(declare-fun b!88048 () Bool)

(assert (=> b!88048 (= e!57350 (not call!8458))))

(declare-fun bm!8455 () Bool)

(assert (=> bm!8455 (= call!8455 call!8456)))

(declare-fun b!88049 () Bool)

(declare-fun res!45116 () Bool)

(assert (=> b!88049 (=> (not res!45116) (not e!57360))))

(assert (=> b!88049 (= res!45116 e!57350)))

(declare-fun c!14525 () Bool)

(assert (=> b!88049 (= c!14525 (not (= (bvand (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8456 () Bool)

(assert (=> bm!8456 (= call!8459 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (ite (or c!14505 c!14498) (_values!2341 newMap!16) lt!41893) (mask!6395 newMap!16) (ite (and c!14505 c!14502) lt!41910 (extraKeys!2193 newMap!16)) (ite (and c!14505 c!14502) lt!41566 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8457 () Bool)

(assert (=> bm!8457 (= call!8458 (contains!755 lt!41975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23369 c!14529) b!88033))

(assert (= (and d!23369 (not c!14529)) b!88044))

(assert (= (and b!88044 c!14527) b!88041))

(assert (= (and b!88044 (not c!14527)) b!88037))

(assert (= (and b!88037 c!14526) b!88047))

(assert (= (and b!88037 (not c!14526)) b!88036))

(assert (= (or b!88047 b!88036) bm!8455))

(assert (= (or b!88041 bm!8455) bm!8453))

(assert (= (or b!88041 b!88047) bm!8452))

(assert (= (or b!88033 bm!8453) bm!8456))

(assert (= (or b!88033 bm!8452) bm!8451))

(assert (= (and d!23369 res!45118) b!88038))

(assert (= (and d!23369 c!14530) b!88040))

(assert (= (and d!23369 (not c!14530)) b!88046))

(assert (= (and d!23369 res!45113) b!88031))

(assert (= (and b!88031 res!45117) b!88034))

(assert (= (and b!88031 (not res!45120)) b!88043))

(assert (= (and b!88043 res!45115) b!88045))

(assert (= (and b!88031 res!45114) b!88049))

(assert (= (and b!88049 c!14525) b!88032))

(assert (= (and b!88049 (not c!14525)) b!88048))

(assert (= (and b!88032 res!45119) b!88029))

(assert (= (or b!88032 b!88048) bm!8457))

(assert (= (and b!88049 res!45116) b!88039))

(assert (= (and b!88039 c!14528) b!88030))

(assert (= (and b!88039 (not c!14528)) b!88035))

(assert (= (and b!88030 res!45112) b!88042))

(assert (= (or b!88030 b!88035) bm!8454))

(declare-fun b_lambda!3899 () Bool)

(assert (=> (not b_lambda!3899) (not b!88045)))

(declare-fun tb!1713 () Bool)

(declare-fun t!5277 () Bool)

(assert (=> (and b!87528 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 newMap!16)) t!5277) tb!1713))

(declare-fun result!2951 () Bool)

(assert (=> tb!1713 (= result!2951 tp_is_empty!2539)))

(assert (=> b!88045 t!5277))

(declare-fun b_and!5297 () Bool)

(assert (= b_and!5293 (and (=> t!5277 result!2951) b_and!5297)))

(declare-fun t!5279 () Bool)

(declare-fun tb!1715 () Bool)

(assert (=> (and b!87539 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 newMap!16)) t!5279) tb!1715))

(declare-fun result!2953 () Bool)

(assert (= result!2953 result!2951))

(assert (=> b!88045 t!5279))

(declare-fun b_and!5299 () Bool)

(assert (= b_and!5295 (and (=> t!5279 result!2953) b_and!5299)))

(declare-fun m!93853 () Bool)

(assert (=> b!88043 m!93853))

(assert (=> b!88043 m!93853))

(declare-fun m!93855 () Bool)

(assert (=> b!88043 m!93855))

(declare-fun m!93857 () Bool)

(assert (=> bm!8457 m!93857))

(declare-fun m!93859 () Bool)

(assert (=> b!88042 m!93859))

(declare-fun m!93861 () Bool)

(assert (=> bm!8454 m!93861))

(assert (=> b!88034 m!93853))

(assert (=> b!88034 m!93853))

(declare-fun m!93863 () Bool)

(assert (=> b!88034 m!93863))

(assert (=> b!88038 m!93853))

(assert (=> b!88038 m!93853))

(assert (=> b!88038 m!93863))

(declare-fun m!93865 () Bool)

(assert (=> bm!8451 m!93865))

(declare-fun m!93867 () Bool)

(assert (=> b!88045 m!93867))

(assert (=> b!88045 m!93853))

(declare-fun m!93869 () Bool)

(assert (=> b!88045 m!93869))

(declare-fun m!93871 () Bool)

(assert (=> b!88045 m!93871))

(assert (=> b!88045 m!93853))

(assert (=> b!88045 m!93871))

(assert (=> b!88045 m!93867))

(declare-fun m!93873 () Bool)

(assert (=> b!88045 m!93873))

(declare-fun m!93875 () Bool)

(assert (=> b!88040 m!93875))

(declare-fun m!93877 () Bool)

(assert (=> b!88040 m!93877))

(declare-fun m!93879 () Bool)

(assert (=> b!88040 m!93879))

(declare-fun m!93881 () Bool)

(assert (=> b!88040 m!93881))

(declare-fun m!93883 () Bool)

(assert (=> b!88040 m!93883))

(assert (=> b!88040 m!93875))

(declare-fun m!93885 () Bool)

(assert (=> b!88040 m!93885))

(declare-fun m!93887 () Bool)

(assert (=> b!88040 m!93887))

(declare-fun m!93889 () Bool)

(assert (=> b!88040 m!93889))

(declare-fun m!93891 () Bool)

(assert (=> b!88040 m!93891))

(assert (=> b!88040 m!93853))

(declare-fun m!93893 () Bool)

(assert (=> b!88040 m!93893))

(declare-fun m!93895 () Bool)

(assert (=> b!88040 m!93895))

(assert (=> b!88040 m!93885))

(declare-fun m!93897 () Bool)

(assert (=> b!88040 m!93897))

(assert (=> b!88040 m!93879))

(declare-fun m!93899 () Bool)

(assert (=> b!88040 m!93899))

(declare-fun m!93901 () Bool)

(assert (=> b!88040 m!93901))

(assert (=> b!88040 m!93897))

(declare-fun m!93903 () Bool)

(assert (=> b!88040 m!93903))

(declare-fun m!93905 () Bool)

(assert (=> b!88040 m!93905))

(assert (=> d!23369 m!93743))

(declare-fun m!93907 () Bool)

(assert (=> b!88029 m!93907))

(assert (=> bm!8456 m!93895))

(declare-fun m!93909 () Bool)

(assert (=> b!88033 m!93909))

(assert (=> bm!8440 d!23369))

(declare-fun d!23371 () Bool)

(assert (=> d!23371 (isDefined!93 (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun lt!41980 () Unit!2598)

(declare-fun choose!524 (List!1530 (_ BitVec 64)) Unit!2598)

(assert (=> d!23371 (= lt!41980 (choose!524 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun e!57363 () Bool)

(assert (=> d!23371 e!57363))

(declare-fun res!45123 () Bool)

(assert (=> d!23371 (=> (not res!45123) (not e!57363))))

(declare-fun isStrictlySorted!294 (List!1530) Bool)

(assert (=> d!23371 (= res!45123 (isStrictlySorted!294 (toList!742 lt!41555)))))

(assert (=> d!23371 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) lt!41980)))

(declare-fun b!88052 () Bool)

(assert (=> b!88052 (= e!57363 (containsKey!143 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (= (and d!23371 res!45123) b!88052))

(assert (=> d!23371 m!93253))

(assert (=> d!23371 m!93665))

(assert (=> d!23371 m!93665))

(assert (=> d!23371 m!93667))

(assert (=> d!23371 m!93253))

(declare-fun m!93911 () Bool)

(assert (=> d!23371 m!93911))

(declare-fun m!93913 () Bool)

(assert (=> d!23371 m!93913))

(assert (=> b!88052 m!93253))

(assert (=> b!88052 m!93661))

(assert (=> b!87851 d!23371))

(declare-fun d!23373 () Bool)

(declare-fun isEmpty!343 (Option!145) Bool)

(assert (=> d!23373 (= (isDefined!93 (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))) (not (isEmpty!343 (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))))

(declare-fun bs!3719 () Bool)

(assert (= bs!3719 d!23373))

(assert (=> bs!3719 m!93665))

(declare-fun m!93915 () Bool)

(assert (=> bs!3719 m!93915))

(assert (=> b!87851 d!23373))

(declare-fun b!88054 () Bool)

(declare-fun e!57364 () Option!145)

(declare-fun e!57365 () Option!145)

(assert (=> b!88054 (= e!57364 e!57365)))

(declare-fun c!14532 () Bool)

(assert (=> b!88054 (= c!14532 (and ((_ is Cons!1526) (toList!742 lt!41555)) (not (= (_1!1116 (h!2118 (toList!742 lt!41555))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))))

(declare-fun c!14531 () Bool)

(declare-fun d!23375 () Bool)

(assert (=> d!23375 (= c!14531 (and ((_ is Cons!1526) (toList!742 lt!41555)) (= (_1!1116 (h!2118 (toList!742 lt!41555))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (=> d!23375 (= (getValueByKey!139 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) e!57364)))

(declare-fun b!88055 () Bool)

(assert (=> b!88055 (= e!57365 (getValueByKey!139 (t!5263 (toList!742 lt!41555)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88053 () Bool)

(assert (=> b!88053 (= e!57364 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41555)))))))

(declare-fun b!88056 () Bool)

(assert (=> b!88056 (= e!57365 None!143)))

(assert (= (and d!23375 c!14531) b!88053))

(assert (= (and d!23375 (not c!14531)) b!88054))

(assert (= (and b!88054 c!14532) b!88055))

(assert (= (and b!88054 (not c!14532)) b!88056))

(assert (=> b!88055 m!93253))

(declare-fun m!93917 () Bool)

(assert (=> b!88055 m!93917))

(assert (=> b!87851 d!23375))

(declare-fun b!88057 () Bool)

(declare-fun e!57375 () Bool)

(declare-fun lt!42000 () ListLongMap!1453)

(assert (=> b!88057 (= e!57375 (= (apply!83 lt!42000 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 newMap!16)))))

(declare-fun b!88058 () Bool)

(declare-fun e!57367 () Bool)

(declare-fun e!57376 () Bool)

(assert (=> b!88058 (= e!57367 e!57376)))

(declare-fun res!45124 () Bool)

(declare-fun call!8467 () Bool)

(assert (=> b!88058 (= res!45124 call!8467)))

(assert (=> b!88058 (=> (not res!45124) (not e!57376))))

(declare-fun call!8466 () ListLongMap!1453)

(declare-fun c!14537 () Bool)

(declare-fun call!8463 () ListLongMap!1453)

(declare-fun c!14535 () Bool)

(declare-fun call!8461 () ListLongMap!1453)

(declare-fun bm!8458 () Bool)

(declare-fun call!8462 () ListLongMap!1453)

(assert (=> bm!8458 (= call!8461 (+!110 (ite c!14537 call!8466 (ite c!14535 call!8463 call!8462)) (ite (or c!14537 c!14535) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16)))))))

(declare-fun b!88059 () Bool)

(declare-fun res!45126 () Bool)

(declare-fun e!57378 () Bool)

(assert (=> b!88059 (=> (not res!45126) (not e!57378))))

(declare-fun e!57377 () Bool)

(assert (=> b!88059 (= res!45126 e!57377)))

(declare-fun res!45132 () Bool)

(assert (=> b!88059 (=> res!45132 e!57377)))

(declare-fun e!57371 () Bool)

(assert (=> b!88059 (= res!45132 (not e!57371))))

(declare-fun res!45129 () Bool)

(assert (=> b!88059 (=> (not res!45129) (not e!57371))))

(assert (=> b!88059 (= res!45129 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88060 () Bool)

(declare-fun e!57368 () Bool)

(assert (=> b!88060 (= e!57368 e!57375)))

(declare-fun res!45131 () Bool)

(declare-fun call!8465 () Bool)

(assert (=> b!88060 (= res!45131 call!8465)))

(assert (=> b!88060 (=> (not res!45131) (not e!57375))))

(declare-fun b!88061 () Bool)

(declare-fun e!57366 () ListLongMap!1453)

(assert (=> b!88061 (= e!57366 (+!110 call!8461 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16))))))

(declare-fun bm!8459 () Bool)

(declare-fun call!8464 () ListLongMap!1453)

(assert (=> bm!8459 (= call!8464 call!8461)))

(declare-fun b!88062 () Bool)

(assert (=> b!88062 (= e!57371 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88063 () Bool)

(assert (=> b!88063 (= e!57367 (not call!8467))))

(declare-fun b!88064 () Bool)

(declare-fun e!57369 () ListLongMap!1453)

(assert (=> b!88064 (= e!57369 call!8462)))

(declare-fun b!88065 () Bool)

(declare-fun c!14534 () Bool)

(assert (=> b!88065 (= c!14534 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57372 () ListLongMap!1453)

(assert (=> b!88065 (= e!57372 e!57369)))

(declare-fun bm!8460 () Bool)

(assert (=> bm!8460 (= call!8463 call!8466)))

(declare-fun b!88066 () Bool)

(declare-fun e!57370 () Bool)

(assert (=> b!88066 (= e!57370 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88067 () Bool)

(assert (=> b!88067 (= e!57378 e!57367)))

(declare-fun c!14536 () Bool)

(assert (=> b!88067 (= c!14536 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88068 () Bool)

(declare-fun e!57373 () Unit!2598)

(declare-fun lt!41983 () Unit!2598)

(assert (=> b!88068 (= e!57373 lt!41983)))

(declare-fun lt!41982 () ListLongMap!1453)

(assert (=> b!88068 (= lt!41982 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41995 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41989 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41989 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!41994 () Unit!2598)

(assert (=> b!88068 (= lt!41994 (addStillContains!59 lt!41982 lt!41995 (zeroValue!2248 newMap!16) lt!41989))))

(assert (=> b!88068 (contains!755 (+!110 lt!41982 (tuple2!2211 lt!41995 (zeroValue!2248 newMap!16))) lt!41989)))

(declare-fun lt!41992 () Unit!2598)

(assert (=> b!88068 (= lt!41992 lt!41994)))

(declare-fun lt!41987 () ListLongMap!1453)

(assert (=> b!88068 (= lt!41987 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41981 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41981 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41998 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41998 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!41984 () Unit!2598)

(assert (=> b!88068 (= lt!41984 (addApplyDifferent!59 lt!41987 lt!41981 (minValue!2248 newMap!16) lt!41998))))

(assert (=> b!88068 (= (apply!83 (+!110 lt!41987 (tuple2!2211 lt!41981 (minValue!2248 newMap!16))) lt!41998) (apply!83 lt!41987 lt!41998))))

(declare-fun lt!41986 () Unit!2598)

(assert (=> b!88068 (= lt!41986 lt!41984)))

(declare-fun lt!41997 () ListLongMap!1453)

(assert (=> b!88068 (= lt!41997 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41990 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41993 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41993 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42002 () Unit!2598)

(assert (=> b!88068 (= lt!42002 (addApplyDifferent!59 lt!41997 lt!41990 (zeroValue!2248 newMap!16) lt!41993))))

(assert (=> b!88068 (= (apply!83 (+!110 lt!41997 (tuple2!2211 lt!41990 (zeroValue!2248 newMap!16))) lt!41993) (apply!83 lt!41997 lt!41993))))

(declare-fun lt!41999 () Unit!2598)

(assert (=> b!88068 (= lt!41999 lt!42002)))

(declare-fun lt!41996 () ListLongMap!1453)

(assert (=> b!88068 (= lt!41996 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41991 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41991 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41985 () (_ BitVec 64))

(assert (=> b!88068 (= lt!41985 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88068 (= lt!41983 (addApplyDifferent!59 lt!41996 lt!41991 (minValue!2248 newMap!16) lt!41985))))

(assert (=> b!88068 (= (apply!83 (+!110 lt!41996 (tuple2!2211 lt!41991 (minValue!2248 newMap!16))) lt!41985) (apply!83 lt!41996 lt!41985))))

(declare-fun b!88069 () Bool)

(assert (=> b!88069 (= e!57372 call!8464)))

(declare-fun b!88070 () Bool)

(assert (=> b!88070 (= e!57376 (= (apply!83 lt!42000 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 newMap!16)))))

(declare-fun b!88071 () Bool)

(declare-fun e!57374 () Bool)

(assert (=> b!88071 (= e!57377 e!57374)))

(declare-fun res!45127 () Bool)

(assert (=> b!88071 (=> (not res!45127) (not e!57374))))

(assert (=> b!88071 (= res!45127 (contains!755 lt!42000 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun d!23377 () Bool)

(assert (=> d!23377 e!57378))

(declare-fun res!45125 () Bool)

(assert (=> d!23377 (=> (not res!45125) (not e!57378))))

(assert (=> d!23377 (= res!45125 (or (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))))

(declare-fun lt!42001 () ListLongMap!1453)

(assert (=> d!23377 (= lt!42000 lt!42001)))

(declare-fun lt!41988 () Unit!2598)

(assert (=> d!23377 (= lt!41988 e!57373)))

(declare-fun c!14538 () Bool)

(assert (=> d!23377 (= c!14538 e!57370)))

(declare-fun res!45130 () Bool)

(assert (=> d!23377 (=> (not res!45130) (not e!57370))))

(assert (=> d!23377 (= res!45130 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23377 (= lt!42001 e!57366)))

(assert (=> d!23377 (= c!14537 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23377 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23377 (= (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42000)))

(declare-fun b!88072 () Bool)

(assert (=> b!88072 (= e!57366 e!57372)))

(assert (=> b!88072 (= c!14535 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88073 () Bool)

(assert (=> b!88073 (= e!57374 (= (apply!83 lt!42000 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)) (get!1207 (select (arr!1913 (_values!2341 newMap!16)) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2159 (_values!2341 newMap!16))))))

(assert (=> b!88073 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88074 () Bool)

(declare-fun Unit!2615 () Unit!2598)

(assert (=> b!88074 (= e!57373 Unit!2615)))

(declare-fun bm!8461 () Bool)

(assert (=> bm!8461 (= call!8467 (contains!755 lt!42000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88075 () Bool)

(assert (=> b!88075 (= e!57369 call!8464)))

(declare-fun b!88076 () Bool)

(assert (=> b!88076 (= e!57368 (not call!8465))))

(declare-fun bm!8462 () Bool)

(assert (=> bm!8462 (= call!8462 call!8463)))

(declare-fun b!88077 () Bool)

(declare-fun res!45128 () Bool)

(assert (=> b!88077 (=> (not res!45128) (not e!57378))))

(assert (=> b!88077 (= res!45128 e!57368)))

(declare-fun c!14533 () Bool)

(assert (=> b!88077 (= c!14533 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8463 () Bool)

(assert (=> bm!8463 (= call!8466 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8464 () Bool)

(assert (=> bm!8464 (= call!8465 (contains!755 lt!42000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23377 c!14537) b!88061))

(assert (= (and d!23377 (not c!14537)) b!88072))

(assert (= (and b!88072 c!14535) b!88069))

(assert (= (and b!88072 (not c!14535)) b!88065))

(assert (= (and b!88065 c!14534) b!88075))

(assert (= (and b!88065 (not c!14534)) b!88064))

(assert (= (or b!88075 b!88064) bm!8462))

(assert (= (or b!88069 bm!8462) bm!8460))

(assert (= (or b!88069 b!88075) bm!8459))

(assert (= (or b!88061 bm!8460) bm!8463))

(assert (= (or b!88061 bm!8459) bm!8458))

(assert (= (and d!23377 res!45130) b!88066))

(assert (= (and d!23377 c!14538) b!88068))

(assert (= (and d!23377 (not c!14538)) b!88074))

(assert (= (and d!23377 res!45125) b!88059))

(assert (= (and b!88059 res!45129) b!88062))

(assert (= (and b!88059 (not res!45132)) b!88071))

(assert (= (and b!88071 res!45127) b!88073))

(assert (= (and b!88059 res!45126) b!88077))

(assert (= (and b!88077 c!14533) b!88060))

(assert (= (and b!88077 (not c!14533)) b!88076))

(assert (= (and b!88060 res!45131) b!88057))

(assert (= (or b!88060 b!88076) bm!8464))

(assert (= (and b!88077 res!45128) b!88067))

(assert (= (and b!88067 c!14536) b!88058))

(assert (= (and b!88067 (not c!14536)) b!88063))

(assert (= (and b!88058 res!45124) b!88070))

(assert (= (or b!88058 b!88063) bm!8461))

(declare-fun b_lambda!3901 () Bool)

(assert (=> (not b_lambda!3901) (not b!88073)))

(assert (=> b!88073 t!5277))

(declare-fun b_and!5301 () Bool)

(assert (= b_and!5297 (and (=> t!5277 result!2951) b_and!5301)))

(assert (=> b!88073 t!5279))

(declare-fun b_and!5303 () Bool)

(assert (= b_and!5299 (and (=> t!5279 result!2953) b_and!5303)))

(assert (=> b!88071 m!93853))

(assert (=> b!88071 m!93853))

(declare-fun m!93919 () Bool)

(assert (=> b!88071 m!93919))

(declare-fun m!93921 () Bool)

(assert (=> bm!8464 m!93921))

(declare-fun m!93923 () Bool)

(assert (=> b!88070 m!93923))

(declare-fun m!93925 () Bool)

(assert (=> bm!8461 m!93925))

(assert (=> b!88062 m!93853))

(assert (=> b!88062 m!93853))

(assert (=> b!88062 m!93863))

(assert (=> b!88066 m!93853))

(assert (=> b!88066 m!93853))

(assert (=> b!88066 m!93863))

(declare-fun m!93927 () Bool)

(assert (=> bm!8458 m!93927))

(assert (=> b!88073 m!93867))

(assert (=> b!88073 m!93853))

(declare-fun m!93929 () Bool)

(assert (=> b!88073 m!93929))

(declare-fun m!93931 () Bool)

(assert (=> b!88073 m!93931))

(assert (=> b!88073 m!93853))

(assert (=> b!88073 m!93931))

(assert (=> b!88073 m!93867))

(declare-fun m!93933 () Bool)

(assert (=> b!88073 m!93933))

(declare-fun m!93935 () Bool)

(assert (=> b!88068 m!93935))

(declare-fun m!93937 () Bool)

(assert (=> b!88068 m!93937))

(declare-fun m!93939 () Bool)

(assert (=> b!88068 m!93939))

(declare-fun m!93941 () Bool)

(assert (=> b!88068 m!93941))

(declare-fun m!93943 () Bool)

(assert (=> b!88068 m!93943))

(assert (=> b!88068 m!93935))

(declare-fun m!93945 () Bool)

(assert (=> b!88068 m!93945))

(declare-fun m!93947 () Bool)

(assert (=> b!88068 m!93947))

(declare-fun m!93949 () Bool)

(assert (=> b!88068 m!93949))

(declare-fun m!93951 () Bool)

(assert (=> b!88068 m!93951))

(assert (=> b!88068 m!93853))

(declare-fun m!93953 () Bool)

(assert (=> b!88068 m!93953))

(declare-fun m!93955 () Bool)

(assert (=> b!88068 m!93955))

(assert (=> b!88068 m!93945))

(declare-fun m!93957 () Bool)

(assert (=> b!88068 m!93957))

(assert (=> b!88068 m!93939))

(declare-fun m!93959 () Bool)

(assert (=> b!88068 m!93959))

(declare-fun m!93961 () Bool)

(assert (=> b!88068 m!93961))

(assert (=> b!88068 m!93957))

(declare-fun m!93963 () Bool)

(assert (=> b!88068 m!93963))

(declare-fun m!93965 () Bool)

(assert (=> b!88068 m!93965))

(assert (=> d!23377 m!93743))

(declare-fun m!93967 () Bool)

(assert (=> b!88057 m!93967))

(assert (=> bm!8463 m!93955))

(declare-fun m!93969 () Bool)

(assert (=> b!88061 m!93969))

(assert (=> d!23311 d!23377))

(assert (=> bm!8439 d!23311))

(assert (=> b!87853 d!23373))

(assert (=> b!87853 d!23375))

(declare-fun d!23379 () Bool)

(assert (=> d!23379 (= (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87806 d!23379))

(assert (=> b!87731 d!23379))

(declare-fun d!23381 () Bool)

(assert (=> d!23381 (= (+!110 (+!110 lt!41560 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (+!110 (+!110 lt!41560 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (=> d!23381 true))

(declare-fun _$28!146 () Unit!2598)

(assert (=> d!23381 (= (choose!520 lt!41560 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))) _$28!146)))

(declare-fun bs!3720 () Bool)

(assert (= bs!3720 d!23381))

(assert (=> bs!3720 m!93485))

(assert (=> bs!3720 m!93485))

(assert (=> bs!3720 m!93487))

(assert (=> bs!3720 m!93489))

(assert (=> bs!3720 m!93489))

(assert (=> bs!3720 m!93491))

(assert (=> d!23287 d!23381))

(declare-fun d!23383 () Bool)

(declare-fun e!57379 () Bool)

(assert (=> d!23383 e!57379))

(declare-fun res!45133 () Bool)

(assert (=> d!23383 (=> (not res!45133) (not e!57379))))

(declare-fun lt!42006 () ListLongMap!1453)

(assert (=> d!23383 (= res!45133 (contains!755 lt!42006 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun lt!42005 () List!1530)

(assert (=> d!23383 (= lt!42006 (ListLongMap!1454 lt!42005))))

(declare-fun lt!42004 () Unit!2598)

(declare-fun lt!42003 () Unit!2598)

(assert (=> d!23383 (= lt!42004 lt!42003)))

(assert (=> d!23383 (= (getValueByKey!139 lt!42005 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23383 (= lt!42003 (lemmaContainsTupThenGetReturnValue!59 lt!42005 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23383 (= lt!42005 (insertStrictlySorted!62 (toList!742 (+!110 lt!41560 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23383 (= (+!110 (+!110 lt!41560 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) lt!42006)))

(declare-fun b!88078 () Bool)

(declare-fun res!45134 () Bool)

(assert (=> b!88078 (=> (not res!45134) (not e!57379))))

(assert (=> b!88078 (= res!45134 (= (getValueByKey!139 (toList!742 lt!42006) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun b!88079 () Bool)

(assert (=> b!88079 (= e!57379 (contains!757 (toList!742 lt!42006) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (= (and d!23383 res!45133) b!88078))

(assert (= (and b!88078 res!45134) b!88079))

(declare-fun m!93971 () Bool)

(assert (=> d!23383 m!93971))

(declare-fun m!93973 () Bool)

(assert (=> d!23383 m!93973))

(declare-fun m!93975 () Bool)

(assert (=> d!23383 m!93975))

(declare-fun m!93977 () Bool)

(assert (=> d!23383 m!93977))

(declare-fun m!93979 () Bool)

(assert (=> b!88078 m!93979))

(declare-fun m!93981 () Bool)

(assert (=> b!88079 m!93981))

(assert (=> d!23287 d!23383))

(declare-fun d!23385 () Bool)

(declare-fun e!57380 () Bool)

(assert (=> d!23385 e!57380))

(declare-fun res!45135 () Bool)

(assert (=> d!23385 (=> (not res!45135) (not e!57380))))

(declare-fun lt!42010 () ListLongMap!1453)

(assert (=> d!23385 (= res!45135 (contains!755 lt!42010 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!42009 () List!1530)

(assert (=> d!23385 (= lt!42010 (ListLongMap!1454 lt!42009))))

(declare-fun lt!42008 () Unit!2598)

(declare-fun lt!42007 () Unit!2598)

(assert (=> d!23385 (= lt!42008 lt!42007)))

(assert (=> d!23385 (= (getValueByKey!139 lt!42009 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23385 (= lt!42007 (lemmaContainsTupThenGetReturnValue!59 lt!42009 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23385 (= lt!42009 (insertStrictlySorted!62 (toList!742 (+!110 lt!41560 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23385 (= (+!110 (+!110 lt!41560 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!42010)))

(declare-fun b!88080 () Bool)

(declare-fun res!45136 () Bool)

(assert (=> b!88080 (=> (not res!45136) (not e!57380))))

(assert (=> b!88080 (= res!45136 (= (getValueByKey!139 (toList!742 lt!42010) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88081 () Bool)

(assert (=> b!88081 (= e!57380 (contains!757 (toList!742 lt!42010) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23385 res!45135) b!88080))

(assert (= (and b!88080 res!45136) b!88081))

(declare-fun m!93983 () Bool)

(assert (=> d!23385 m!93983))

(declare-fun m!93985 () Bool)

(assert (=> d!23385 m!93985))

(declare-fun m!93987 () Bool)

(assert (=> d!23385 m!93987))

(declare-fun m!93989 () Bool)

(assert (=> d!23385 m!93989))

(declare-fun m!93991 () Bool)

(assert (=> b!88080 m!93991))

(declare-fun m!93993 () Bool)

(assert (=> b!88081 m!93993))

(assert (=> d!23287 d!23385))

(declare-fun d!23387 () Bool)

(declare-fun e!57381 () Bool)

(assert (=> d!23387 e!57381))

(declare-fun res!45137 () Bool)

(assert (=> d!23387 (=> (not res!45137) (not e!57381))))

(declare-fun lt!42014 () ListLongMap!1453)

(assert (=> d!23387 (= res!45137 (contains!755 lt!42014 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun lt!42013 () List!1530)

(assert (=> d!23387 (= lt!42014 (ListLongMap!1454 lt!42013))))

(declare-fun lt!42012 () Unit!2598)

(declare-fun lt!42011 () Unit!2598)

(assert (=> d!23387 (= lt!42012 lt!42011)))

(assert (=> d!23387 (= (getValueByKey!139 lt!42013 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23387 (= lt!42011 (lemmaContainsTupThenGetReturnValue!59 lt!42013 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23387 (= lt!42013 (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23387 (= (+!110 lt!41560 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) lt!42014)))

(declare-fun b!88082 () Bool)

(declare-fun res!45138 () Bool)

(assert (=> b!88082 (=> (not res!45138) (not e!57381))))

(assert (=> b!88082 (= res!45138 (= (getValueByKey!139 (toList!742 lt!42014) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun b!88083 () Bool)

(assert (=> b!88083 (= e!57381 (contains!757 (toList!742 lt!42014) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (= (and d!23387 res!45137) b!88082))

(assert (= (and b!88082 res!45138) b!88083))

(declare-fun m!93995 () Bool)

(assert (=> d!23387 m!93995))

(declare-fun m!93997 () Bool)

(assert (=> d!23387 m!93997))

(declare-fun m!93999 () Bool)

(assert (=> d!23387 m!93999))

(declare-fun m!94001 () Bool)

(assert (=> d!23387 m!94001))

(declare-fun m!94003 () Bool)

(assert (=> b!88082 m!94003))

(declare-fun m!94005 () Bool)

(assert (=> b!88083 m!94005))

(assert (=> d!23287 d!23387))

(declare-fun d!23389 () Bool)

(declare-fun e!57382 () Bool)

(assert (=> d!23389 e!57382))

(declare-fun res!45139 () Bool)

(assert (=> d!23389 (=> (not res!45139) (not e!57382))))

(declare-fun lt!42018 () ListLongMap!1453)

(assert (=> d!23389 (= res!45139 (contains!755 lt!42018 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!42017 () List!1530)

(assert (=> d!23389 (= lt!42018 (ListLongMap!1454 lt!42017))))

(declare-fun lt!42016 () Unit!2598)

(declare-fun lt!42015 () Unit!2598)

(assert (=> d!23389 (= lt!42016 lt!42015)))

(assert (=> d!23389 (= (getValueByKey!139 lt!42017 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23389 (= lt!42015 (lemmaContainsTupThenGetReturnValue!59 lt!42017 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23389 (= lt!42017 (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23389 (= (+!110 lt!41560 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!42018)))

(declare-fun b!88084 () Bool)

(declare-fun res!45140 () Bool)

(assert (=> b!88084 (=> (not res!45140) (not e!57382))))

(assert (=> b!88084 (= res!45140 (= (getValueByKey!139 (toList!742 lt!42018) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88085 () Bool)

(assert (=> b!88085 (= e!57382 (contains!757 (toList!742 lt!42018) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23389 res!45139) b!88084))

(assert (= (and b!88084 res!45140) b!88085))

(declare-fun m!94007 () Bool)

(assert (=> d!23389 m!94007))

(declare-fun m!94009 () Bool)

(assert (=> d!23389 m!94009))

(declare-fun m!94011 () Bool)

(assert (=> d!23389 m!94011))

(declare-fun m!94013 () Bool)

(assert (=> d!23389 m!94013))

(declare-fun m!94015 () Bool)

(assert (=> b!88084 m!94015))

(declare-fun m!94017 () Bool)

(assert (=> b!88085 m!94017))

(assert (=> d!23287 d!23389))

(declare-fun d!23391 () Bool)

(declare-fun e!57384 () Bool)

(assert (=> d!23391 e!57384))

(declare-fun res!45141 () Bool)

(assert (=> d!23391 (=> res!45141 e!57384)))

(declare-fun lt!42020 () Bool)

(assert (=> d!23391 (= res!45141 (not lt!42020))))

(declare-fun lt!42019 () Bool)

(assert (=> d!23391 (= lt!42020 lt!42019)))

(declare-fun lt!42021 () Unit!2598)

(declare-fun e!57383 () Unit!2598)

(assert (=> d!23391 (= lt!42021 e!57383)))

(declare-fun c!14539 () Bool)

(assert (=> d!23391 (= c!14539 lt!42019)))

(assert (=> d!23391 (= lt!42019 (containsKey!143 (toList!742 call!8445) (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916)))))))

(assert (=> d!23391 (= (contains!755 call!8445 (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916)))) lt!42020)))

(declare-fun b!88086 () Bool)

(declare-fun lt!42022 () Unit!2598)

(assert (=> b!88086 (= e!57383 lt!42022)))

(assert (=> b!88086 (= lt!42022 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 call!8445) (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916)))))))

(assert (=> b!88086 (isDefined!93 (getValueByKey!139 (toList!742 call!8445) (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916)))))))

(declare-fun b!88087 () Bool)

(declare-fun Unit!2616 () Unit!2598)

(assert (=> b!88087 (= e!57383 Unit!2616)))

(declare-fun b!88088 () Bool)

(assert (=> b!88088 (= e!57384 (isDefined!93 (getValueByKey!139 (toList!742 call!8445) (ite c!14498 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916))))))))

(assert (= (and d!23391 c!14539) b!88086))

(assert (= (and d!23391 (not c!14539)) b!88087))

(assert (= (and d!23391 (not res!45141)) b!88088))

(declare-fun m!94019 () Bool)

(assert (=> d!23391 m!94019))

(declare-fun m!94021 () Bool)

(assert (=> b!88086 m!94021))

(declare-fun m!94023 () Bool)

(assert (=> b!88086 m!94023))

(assert (=> b!88086 m!94023))

(declare-fun m!94025 () Bool)

(assert (=> b!88086 m!94025))

(assert (=> b!88088 m!94023))

(assert (=> b!88088 m!94023))

(assert (=> b!88088 m!94025))

(assert (=> bm!8447 d!23391))

(declare-fun d!23393 () Bool)

(declare-fun isEmpty!344 (List!1530) Bool)

(assert (=> d!23393 (= (isEmpty!342 lt!41720) (isEmpty!344 (toList!742 lt!41720)))))

(declare-fun bs!3721 () Bool)

(assert (= bs!3721 d!23393))

(declare-fun m!94027 () Bool)

(assert (=> bs!3721 m!94027))

(assert (=> b!87733 d!23393))

(declare-fun d!23395 () Bool)

(assert (=> d!23395 (= (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87843 d!23395))

(declare-fun d!23397 () Bool)

(declare-fun e!57385 () Bool)

(assert (=> d!23397 e!57385))

(declare-fun res!45142 () Bool)

(assert (=> d!23397 (=> (not res!45142) (not e!57385))))

(declare-fun lt!42026 () ListLongMap!1453)

(assert (=> d!23397 (= res!45142 (contains!755 lt!42026 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!42025 () List!1530)

(assert (=> d!23397 (= lt!42026 (ListLongMap!1454 lt!42025))))

(declare-fun lt!42024 () Unit!2598)

(declare-fun lt!42023 () Unit!2598)

(assert (=> d!23397 (= lt!42024 lt!42023)))

(assert (=> d!23397 (= (getValueByKey!139 lt!42025 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23397 (= lt!42023 (lemmaContainsTupThenGetReturnValue!59 lt!42025 (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23397 (= lt!42025 (insertStrictlySorted!62 (toList!742 call!8372) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23397 (= (+!110 call!8372 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!42026)))

(declare-fun b!88089 () Bool)

(declare-fun res!45143 () Bool)

(assert (=> b!88089 (=> (not res!45143) (not e!57385))))

(assert (=> b!88089 (= res!45143 (= (getValueByKey!139 (toList!742 lt!42026) (_1!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88090 () Bool)

(assert (=> b!88090 (= e!57385 (contains!757 (toList!742 lt!42026) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23397 res!45142) b!88089))

(assert (= (and b!88089 res!45143) b!88090))

(declare-fun m!94029 () Bool)

(assert (=> d!23397 m!94029))

(declare-fun m!94031 () Bool)

(assert (=> d!23397 m!94031))

(declare-fun m!94033 () Bool)

(assert (=> d!23397 m!94033))

(declare-fun m!94035 () Bool)

(assert (=> d!23397 m!94035))

(declare-fun m!94037 () Bool)

(assert (=> b!88089 m!94037))

(declare-fun m!94039 () Bool)

(assert (=> b!88090 m!94039))

(assert (=> b!87801 d!23397))

(assert (=> bm!8374 d!23289))

(declare-fun b!88091 () Bool)

(declare-fun e!57387 () Bool)

(declare-fun call!8468 () Bool)

(assert (=> b!88091 (= e!57387 call!8468)))

(declare-fun b!88092 () Bool)

(declare-fun e!57388 () Bool)

(assert (=> b!88092 (= e!57388 (contains!758 Nil!1528 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8465 () Bool)

(declare-fun c!14540 () Bool)

(assert (=> bm!8465 (= call!8468 (arrayNoDuplicates!0 (_keys!4033 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14540 (Cons!1527 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000) Nil!1528) Nil!1528)))))

(declare-fun b!88093 () Bool)

(declare-fun e!57386 () Bool)

(assert (=> b!88093 (= e!57386 e!57387)))

(assert (=> b!88093 (= c!14540 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!23399 () Bool)

(declare-fun res!45145 () Bool)

(declare-fun e!57389 () Bool)

(assert (=> d!23399 (=> res!45145 e!57389)))

(assert (=> d!23399 (= res!45145 (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23399 (= (arrayNoDuplicates!0 (_keys!4033 newMap!16) #b00000000000000000000000000000000 Nil!1528) e!57389)))

(declare-fun b!88094 () Bool)

(assert (=> b!88094 (= e!57389 e!57386)))

(declare-fun res!45144 () Bool)

(assert (=> b!88094 (=> (not res!45144) (not e!57386))))

(assert (=> b!88094 (= res!45144 (not e!57388))))

(declare-fun res!45146 () Bool)

(assert (=> b!88094 (=> (not res!45146) (not e!57388))))

(assert (=> b!88094 (= res!45146 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88095 () Bool)

(assert (=> b!88095 (= e!57387 call!8468)))

(assert (= (and d!23399 (not res!45145)) b!88094))

(assert (= (and b!88094 res!45146) b!88092))

(assert (= (and b!88094 res!45144) b!88093))

(assert (= (and b!88093 c!14540) b!88091))

(assert (= (and b!88093 (not c!14540)) b!88095))

(assert (= (or b!88091 b!88095) bm!8465))

(assert (=> b!88092 m!93853))

(assert (=> b!88092 m!93853))

(declare-fun m!94041 () Bool)

(assert (=> b!88092 m!94041))

(assert (=> bm!8465 m!93853))

(declare-fun m!94043 () Bool)

(assert (=> bm!8465 m!94043))

(assert (=> b!88093 m!93853))

(assert (=> b!88093 m!93853))

(assert (=> b!88093 m!93863))

(assert (=> b!88094 m!93853))

(assert (=> b!88094 m!93853))

(assert (=> b!88094 m!93863))

(assert (=> b!87682 d!23399))

(declare-fun d!23401 () Bool)

(declare-fun lt!42029 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!91 (List!1531) (InoxSet (_ BitVec 64)))

(assert (=> d!23401 (= lt!42029 (select (content!91 Nil!1528) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun e!57394 () Bool)

(assert (=> d!23401 (= lt!42029 e!57394)))

(declare-fun res!45151 () Bool)

(assert (=> d!23401 (=> (not res!45151) (not e!57394))))

(assert (=> d!23401 (= res!45151 ((_ is Cons!1527) Nil!1528))))

(assert (=> d!23401 (= (contains!758 Nil!1528 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) lt!42029)))

(declare-fun b!88100 () Bool)

(declare-fun e!57395 () Bool)

(assert (=> b!88100 (= e!57394 e!57395)))

(declare-fun res!45152 () Bool)

(assert (=> b!88100 (=> res!45152 e!57395)))

(assert (=> b!88100 (= res!45152 (= (h!2119 Nil!1528) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88101 () Bool)

(assert (=> b!88101 (= e!57395 (contains!758 (t!5264 Nil!1528) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (= (and d!23401 res!45151) b!88100))

(assert (= (and b!88100 (not res!45152)) b!88101))

(declare-fun m!94045 () Bool)

(assert (=> d!23401 m!94045))

(assert (=> d!23401 m!93253))

(declare-fun m!94047 () Bool)

(assert (=> d!23401 m!94047))

(assert (=> b!88101 m!93253))

(declare-fun m!94049 () Bool)

(assert (=> b!88101 m!94049))

(assert (=> b!87841 d!23401))

(declare-fun d!23403 () Bool)

(declare-fun e!57397 () Bool)

(assert (=> d!23403 e!57397))

(declare-fun res!45153 () Bool)

(assert (=> d!23403 (=> res!45153 e!57397)))

(declare-fun lt!42031 () Bool)

(assert (=> d!23403 (= res!45153 (not lt!42031))))

(declare-fun lt!42030 () Bool)

(assert (=> d!23403 (= lt!42031 lt!42030)))

(declare-fun lt!42032 () Unit!2598)

(declare-fun e!57396 () Unit!2598)

(assert (=> d!23403 (= lt!42032 e!57396)))

(declare-fun c!14541 () Bool)

(assert (=> d!23403 (= c!14541 lt!42030)))

(assert (=> d!23403 (= lt!42030 (containsKey!143 (toList!742 lt!41704) (_1!1116 lt!41572)))))

(assert (=> d!23403 (= (contains!755 lt!41704 (_1!1116 lt!41572)) lt!42031)))

(declare-fun b!88102 () Bool)

(declare-fun lt!42033 () Unit!2598)

(assert (=> b!88102 (= e!57396 lt!42033)))

(assert (=> b!88102 (= lt!42033 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41704) (_1!1116 lt!41572)))))

(assert (=> b!88102 (isDefined!93 (getValueByKey!139 (toList!742 lt!41704) (_1!1116 lt!41572)))))

(declare-fun b!88103 () Bool)

(declare-fun Unit!2617 () Unit!2598)

(assert (=> b!88103 (= e!57396 Unit!2617)))

(declare-fun b!88104 () Bool)

(assert (=> b!88104 (= e!57397 (isDefined!93 (getValueByKey!139 (toList!742 lt!41704) (_1!1116 lt!41572))))))

(assert (= (and d!23403 c!14541) b!88102))

(assert (= (and d!23403 (not c!14541)) b!88103))

(assert (= (and d!23403 (not res!45153)) b!88104))

(declare-fun m!94051 () Bool)

(assert (=> d!23403 m!94051))

(declare-fun m!94053 () Bool)

(assert (=> b!88102 m!94053))

(assert (=> b!88102 m!93479))

(assert (=> b!88102 m!93479))

(declare-fun m!94055 () Bool)

(assert (=> b!88102 m!94055))

(assert (=> b!88104 m!93479))

(assert (=> b!88104 m!93479))

(assert (=> b!88104 m!94055))

(assert (=> d!23285 d!23403))

(declare-fun b!88106 () Bool)

(declare-fun e!57398 () Option!145)

(declare-fun e!57399 () Option!145)

(assert (=> b!88106 (= e!57398 e!57399)))

(declare-fun c!14543 () Bool)

(assert (=> b!88106 (= c!14543 (and ((_ is Cons!1526) lt!41703) (not (= (_1!1116 (h!2118 lt!41703)) (_1!1116 lt!41572)))))))

(declare-fun d!23405 () Bool)

(declare-fun c!14542 () Bool)

(assert (=> d!23405 (= c!14542 (and ((_ is Cons!1526) lt!41703) (= (_1!1116 (h!2118 lt!41703)) (_1!1116 lt!41572))))))

(assert (=> d!23405 (= (getValueByKey!139 lt!41703 (_1!1116 lt!41572)) e!57398)))

(declare-fun b!88107 () Bool)

(assert (=> b!88107 (= e!57399 (getValueByKey!139 (t!5263 lt!41703) (_1!1116 lt!41572)))))

(declare-fun b!88105 () Bool)

(assert (=> b!88105 (= e!57398 (Some!144 (_2!1116 (h!2118 lt!41703))))))

(declare-fun b!88108 () Bool)

(assert (=> b!88108 (= e!57399 None!143)))

(assert (= (and d!23405 c!14542) b!88105))

(assert (= (and d!23405 (not c!14542)) b!88106))

(assert (= (and b!88106 c!14543) b!88107))

(assert (= (and b!88106 (not c!14543)) b!88108))

(declare-fun m!94057 () Bool)

(assert (=> b!88107 m!94057))

(assert (=> d!23285 d!23405))

(declare-fun d!23407 () Bool)

(assert (=> d!23407 (= (getValueByKey!139 lt!41703 (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572)))))

(declare-fun lt!42036 () Unit!2598)

(declare-fun choose!525 (List!1530 (_ BitVec 64) V!3033) Unit!2598)

(assert (=> d!23407 (= lt!42036 (choose!525 lt!41703 (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(declare-fun e!57402 () Bool)

(assert (=> d!23407 e!57402))

(declare-fun res!45158 () Bool)

(assert (=> d!23407 (=> (not res!45158) (not e!57402))))

(assert (=> d!23407 (= res!45158 (isStrictlySorted!294 lt!41703))))

(assert (=> d!23407 (= (lemmaContainsTupThenGetReturnValue!59 lt!41703 (_1!1116 lt!41572) (_2!1116 lt!41572)) lt!42036)))

(declare-fun b!88113 () Bool)

(declare-fun res!45159 () Bool)

(assert (=> b!88113 (=> (not res!45159) (not e!57402))))

(assert (=> b!88113 (= res!45159 (containsKey!143 lt!41703 (_1!1116 lt!41572)))))

(declare-fun b!88114 () Bool)

(assert (=> b!88114 (= e!57402 (contains!757 lt!41703 (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572))))))

(assert (= (and d!23407 res!45158) b!88113))

(assert (= (and b!88113 res!45159) b!88114))

(assert (=> d!23407 m!93473))

(declare-fun m!94059 () Bool)

(assert (=> d!23407 m!94059))

(declare-fun m!94061 () Bool)

(assert (=> d!23407 m!94061))

(declare-fun m!94063 () Bool)

(assert (=> b!88113 m!94063))

(declare-fun m!94065 () Bool)

(assert (=> b!88114 m!94065))

(assert (=> d!23285 d!23407))

(declare-fun b!88135 () Bool)

(declare-fun res!45164 () Bool)

(declare-fun e!57416 () Bool)

(assert (=> b!88135 (=> (not res!45164) (not e!57416))))

(declare-fun lt!42039 () List!1530)

(assert (=> b!88135 (= res!45164 (containsKey!143 lt!42039 (_1!1116 lt!41572)))))

(declare-fun c!14552 () Bool)

(declare-fun e!57413 () List!1530)

(declare-fun call!8476 () List!1530)

(declare-fun bm!8472 () Bool)

(declare-fun $colon$colon!72 (List!1530 tuple2!2210) List!1530)

(assert (=> bm!8472 (= call!8476 ($colon$colon!72 e!57413 (ite c!14552 (h!2118 (toList!742 lt!41557)) (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572)))))))

(declare-fun c!14555 () Bool)

(assert (=> bm!8472 (= c!14555 c!14552)))

(declare-fun b!88136 () Bool)

(declare-fun c!14554 () Bool)

(declare-fun c!14553 () Bool)

(assert (=> b!88136 (= e!57413 (ite c!14553 (t!5263 (toList!742 lt!41557)) (ite c!14554 (Cons!1526 (h!2118 (toList!742 lt!41557)) (t!5263 (toList!742 lt!41557))) Nil!1527)))))

(declare-fun b!88137 () Bool)

(assert (=> b!88137 (= e!57416 (contains!757 lt!42039 (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572))))))

(declare-fun b!88138 () Bool)

(declare-fun e!57417 () List!1530)

(declare-fun e!57415 () List!1530)

(assert (=> b!88138 (= e!57417 e!57415)))

(assert (=> b!88138 (= c!14553 (and ((_ is Cons!1526) (toList!742 lt!41557)) (= (_1!1116 (h!2118 (toList!742 lt!41557))) (_1!1116 lt!41572))))))

(declare-fun b!88140 () Bool)

(assert (=> b!88140 (= e!57417 call!8476)))

(declare-fun b!88141 () Bool)

(declare-fun call!8475 () List!1530)

(assert (=> b!88141 (= e!57415 call!8475)))

(declare-fun b!88142 () Bool)

(assert (=> b!88142 (= c!14554 (and ((_ is Cons!1526) (toList!742 lt!41557)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41557))) (_1!1116 lt!41572))))))

(declare-fun e!57414 () List!1530)

(assert (=> b!88142 (= e!57415 e!57414)))

(declare-fun bm!8473 () Bool)

(declare-fun call!8477 () List!1530)

(assert (=> bm!8473 (= call!8477 call!8475)))

(declare-fun bm!8474 () Bool)

(assert (=> bm!8474 (= call!8475 call!8476)))

(declare-fun b!88143 () Bool)

(assert (=> b!88143 (= e!57414 call!8477)))

(declare-fun b!88144 () Bool)

(assert (=> b!88144 (= e!57414 call!8477)))

(declare-fun d!23409 () Bool)

(assert (=> d!23409 e!57416))

(declare-fun res!45165 () Bool)

(assert (=> d!23409 (=> (not res!45165) (not e!57416))))

(assert (=> d!23409 (= res!45165 (isStrictlySorted!294 lt!42039))))

(assert (=> d!23409 (= lt!42039 e!57417)))

(assert (=> d!23409 (= c!14552 (and ((_ is Cons!1526) (toList!742 lt!41557)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41557))) (_1!1116 lt!41572))))))

(assert (=> d!23409 (isStrictlySorted!294 (toList!742 lt!41557))))

(assert (=> d!23409 (= (insertStrictlySorted!62 (toList!742 lt!41557) (_1!1116 lt!41572) (_2!1116 lt!41572)) lt!42039)))

(declare-fun b!88139 () Bool)

(assert (=> b!88139 (= e!57413 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41557)) (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(assert (= (and d!23409 c!14552) b!88140))

(assert (= (and d!23409 (not c!14552)) b!88138))

(assert (= (and b!88138 c!14553) b!88141))

(assert (= (and b!88138 (not c!14553)) b!88142))

(assert (= (and b!88142 c!14554) b!88143))

(assert (= (and b!88142 (not c!14554)) b!88144))

(assert (= (or b!88143 b!88144) bm!8473))

(assert (= (or b!88141 bm!8473) bm!8474))

(assert (= (or b!88140 bm!8474) bm!8472))

(assert (= (and bm!8472 c!14555) b!88139))

(assert (= (and bm!8472 (not c!14555)) b!88136))

(assert (= (and d!23409 res!45165) b!88135))

(assert (= (and b!88135 res!45164) b!88137))

(declare-fun m!94067 () Bool)

(assert (=> d!23409 m!94067))

(declare-fun m!94069 () Bool)

(assert (=> d!23409 m!94069))

(declare-fun m!94071 () Bool)

(assert (=> b!88135 m!94071))

(declare-fun m!94073 () Bool)

(assert (=> bm!8472 m!94073))

(declare-fun m!94075 () Bool)

(assert (=> b!88139 m!94075))

(declare-fun m!94077 () Bool)

(assert (=> b!88137 m!94077))

(assert (=> d!23285 d!23409))

(declare-fun d!23411 () Bool)

(declare-fun e!57420 () Bool)

(assert (=> d!23411 e!57420))

(declare-fun res!45171 () Bool)

(assert (=> d!23411 (=> (not res!45171) (not e!57420))))

(declare-fun lt!42045 () SeekEntryResult!247)

(assert (=> d!23411 (= res!45171 ((_ is Found!247) lt!42045))))

(assert (=> d!23411 (= lt!42045 (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun lt!42044 () Unit!2598)

(declare-fun choose!526 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2598)

(assert (=> d!23411 (= lt!42044 (choose!526 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23411 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23411 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)) lt!42044)))

(declare-fun b!88149 () Bool)

(declare-fun res!45170 () Bool)

(assert (=> b!88149 (=> (not res!45170) (not e!57420))))

(assert (=> b!88149 (= res!45170 (inRange!0 (index!3127 lt!42045) (mask!6395 newMap!16)))))

(declare-fun b!88150 () Bool)

(assert (=> b!88150 (= e!57420 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!42045)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> b!88150 (and (bvsge (index!3127 lt!42045) #b00000000000000000000000000000000) (bvslt (index!3127 lt!42045) (size!2158 (_keys!4033 newMap!16))))))

(assert (= (and d!23411 res!45171) b!88149))

(assert (= (and b!88149 res!45170) b!88150))

(assert (=> d!23411 m!93253))

(assert (=> d!23411 m!93713))

(assert (=> d!23411 m!93253))

(declare-fun m!94079 () Bool)

(assert (=> d!23411 m!94079))

(assert (=> d!23411 m!93743))

(declare-fun m!94081 () Bool)

(assert (=> b!88149 m!94081))

(declare-fun m!94083 () Bool)

(assert (=> b!88150 m!94083))

(assert (=> bm!8438 d!23411))

(declare-fun d!23413 () Bool)

(assert (=> d!23413 (= (map!1189 (_2!1117 lt!41894)) (getCurrentListMap!427 (_keys!4033 (_2!1117 lt!41894)) (_values!2341 (_2!1117 lt!41894)) (mask!6395 (_2!1117 lt!41894)) (extraKeys!2193 (_2!1117 lt!41894)) (zeroValue!2248 (_2!1117 lt!41894)) (minValue!2248 (_2!1117 lt!41894)) #b00000000000000000000000000000000 (defaultEntry!2358 (_2!1117 lt!41894))))))

(declare-fun bs!3722 () Bool)

(assert (= bs!3722 d!23413))

(declare-fun m!94085 () Bool)

(assert (=> bs!3722 m!94085))

(assert (=> bm!8430 d!23413))

(declare-fun d!23415 () Bool)

(declare-fun lt!42048 () Bool)

(declare-fun content!92 (List!1530) (InoxSet tuple2!2210))

(assert (=> d!23415 (= lt!42048 (select (content!92 (toList!742 lt!41746)) lt!41562))))

(declare-fun e!57426 () Bool)

(assert (=> d!23415 (= lt!42048 e!57426)))

(declare-fun res!45177 () Bool)

(assert (=> d!23415 (=> (not res!45177) (not e!57426))))

(assert (=> d!23415 (= res!45177 ((_ is Cons!1526) (toList!742 lt!41746)))))

(assert (=> d!23415 (= (contains!757 (toList!742 lt!41746) lt!41562) lt!42048)))

(declare-fun b!88155 () Bool)

(declare-fun e!57425 () Bool)

(assert (=> b!88155 (= e!57426 e!57425)))

(declare-fun res!45176 () Bool)

(assert (=> b!88155 (=> res!45176 e!57425)))

(assert (=> b!88155 (= res!45176 (= (h!2118 (toList!742 lt!41746)) lt!41562))))

(declare-fun b!88156 () Bool)

(assert (=> b!88156 (= e!57425 (contains!757 (t!5263 (toList!742 lt!41746)) lt!41562))))

(assert (= (and d!23415 res!45177) b!88155))

(assert (= (and b!88155 (not res!45176)) b!88156))

(declare-fun m!94087 () Bool)

(assert (=> d!23415 m!94087))

(declare-fun m!94089 () Bool)

(assert (=> d!23415 m!94089))

(declare-fun m!94091 () Bool)

(assert (=> b!88156 m!94091))

(assert (=> b!87746 d!23415))

(assert (=> b!87802 d!23379))

(declare-fun b!88157 () Bool)

(declare-fun e!57429 () Bool)

(declare-fun e!57427 () Bool)

(assert (=> b!88157 (= e!57429 e!57427)))

(assert (=> b!88157 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun lt!42049 () ListLongMap!1453)

(declare-fun res!45178 () Bool)

(assert (=> b!88157 (= res!45178 (contains!755 lt!42049 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88157 (=> (not res!45178) (not e!57427))))

(declare-fun b!88158 () Bool)

(declare-fun e!57430 () Bool)

(assert (=> b!88158 (= e!57430 e!57429)))

(declare-fun c!14556 () Bool)

(declare-fun e!57428 () Bool)

(assert (=> b!88158 (= c!14556 e!57428)))

(declare-fun res!45180 () Bool)

(assert (=> b!88158 (=> (not res!45180) (not e!57428))))

(assert (=> b!88158 (= res!45180 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!88159 () Bool)

(declare-fun e!57432 () ListLongMap!1453)

(assert (=> b!88159 (= e!57432 (ListLongMap!1454 Nil!1527))))

(declare-fun b!88160 () Bool)

(assert (=> b!88160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> b!88160 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2159 (_values!2341 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> b!88160 (= e!57427 (= (apply!83 lt!42049 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88161 () Bool)

(declare-fun e!57433 () ListLongMap!1453)

(assert (=> b!88161 (= e!57432 e!57433)))

(declare-fun c!14557 () Bool)

(assert (=> b!88161 (= c!14557 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88162 () Bool)

(declare-fun res!45179 () Bool)

(assert (=> b!88162 (=> (not res!45179) (not e!57430))))

(assert (=> b!88162 (= res!45179 (not (contains!755 lt!42049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!8475 () Bool)

(declare-fun call!8478 () ListLongMap!1453)

(assert (=> bm!8475 (= call!8478 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!88163 () Bool)

(assert (=> b!88163 (= e!57428 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88163 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun e!57431 () Bool)

(declare-fun b!88164 () Bool)

(assert (=> b!88164 (= e!57431 (= lt!42049 (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun d!23417 () Bool)

(assert (=> d!23417 e!57430))

(declare-fun res!45181 () Bool)

(assert (=> d!23417 (=> (not res!45181) (not e!57430))))

(assert (=> d!23417 (= res!45181 (not (contains!755 lt!42049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23417 (= lt!42049 e!57432)))

(declare-fun c!14558 () Bool)

(assert (=> d!23417 (= c!14558 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23417 (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23417 (= (getCurrentListMapNoExtraKeys!74 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) lt!42049)))

(declare-fun b!88165 () Bool)

(assert (=> b!88165 (= e!57431 (isEmpty!342 lt!42049))))

(declare-fun b!88166 () Bool)

(declare-fun lt!42054 () Unit!2598)

(declare-fun lt!42050 () Unit!2598)

(assert (=> b!88166 (= lt!42054 lt!42050)))

(declare-fun lt!42053 () (_ BitVec 64))

(declare-fun lt!42055 () ListLongMap!1453)

(declare-fun lt!42052 () V!3033)

(declare-fun lt!42051 () (_ BitVec 64))

(assert (=> b!88166 (not (contains!755 (+!110 lt!42055 (tuple2!2211 lt!42053 lt!42052)) lt!42051))))

(assert (=> b!88166 (= lt!42050 (addStillNotContains!33 lt!42055 lt!42053 lt!42052 lt!42051))))

(assert (=> b!88166 (= lt!42051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88166 (= lt!42052 (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88166 (= lt!42053 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!88166 (= lt!42055 call!8478)))

(assert (=> b!88166 (= e!57433 (+!110 call!8478 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88167 () Bool)

(assert (=> b!88167 (= e!57433 call!8478)))

(declare-fun b!88168 () Bool)

(assert (=> b!88168 (= e!57429 e!57431)))

(declare-fun c!14559 () Bool)

(assert (=> b!88168 (= c!14559 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23417 c!14558) b!88159))

(assert (= (and d!23417 (not c!14558)) b!88161))

(assert (= (and b!88161 c!14557) b!88166))

(assert (= (and b!88161 (not c!14557)) b!88167))

(assert (= (or b!88166 b!88167) bm!8475))

(assert (= (and d!23417 res!45181) b!88162))

(assert (= (and b!88162 res!45179) b!88158))

(assert (= (and b!88158 res!45180) b!88163))

(assert (= (and b!88158 c!14556) b!88157))

(assert (= (and b!88158 (not c!14556)) b!88168))

(assert (= (and b!88157 res!45178) b!88160))

(assert (= (and b!88168 c!14559) b!88164))

(assert (= (and b!88168 (not c!14559)) b!88165))

(declare-fun b_lambda!3903 () Bool)

(assert (=> (not b_lambda!3903) (not b!88160)))

(assert (=> b!88160 t!5260))

(declare-fun b_and!5305 () Bool)

(assert (= b_and!5301 (and (=> t!5260 result!2931) b_and!5305)))

(assert (=> b!88160 t!5262))

(declare-fun b_and!5307 () Bool)

(assert (= b_and!5303 (and (=> t!5262 result!2935) b_and!5307)))

(declare-fun b_lambda!3905 () Bool)

(assert (=> (not b_lambda!3905) (not b!88166)))

(assert (=> b!88166 t!5260))

(declare-fun b_and!5309 () Bool)

(assert (= b_and!5305 (and (=> t!5260 result!2931) b_and!5309)))

(assert (=> b!88166 t!5262))

(declare-fun b_and!5311 () Bool)

(assert (= b_and!5307 (and (=> t!5262 result!2935) b_and!5311)))

(declare-fun m!94093 () Bool)

(assert (=> bm!8475 m!94093))

(declare-fun m!94095 () Bool)

(assert (=> b!88165 m!94095))

(declare-fun m!94097 () Bool)

(assert (=> b!88161 m!94097))

(assert (=> b!88161 m!94097))

(declare-fun m!94099 () Bool)

(assert (=> b!88161 m!94099))

(assert (=> b!88163 m!94097))

(assert (=> b!88163 m!94097))

(assert (=> b!88163 m!94099))

(assert (=> b!88164 m!94093))

(declare-fun m!94101 () Bool)

(assert (=> b!88166 m!94101))

(assert (=> b!88166 m!93293))

(declare-fun m!94103 () Bool)

(assert (=> b!88166 m!94103))

(assert (=> b!88166 m!93293))

(declare-fun m!94105 () Bool)

(assert (=> b!88166 m!94105))

(declare-fun m!94107 () Bool)

(assert (=> b!88166 m!94107))

(assert (=> b!88166 m!94097))

(assert (=> b!88166 m!94105))

(declare-fun m!94109 () Bool)

(assert (=> b!88166 m!94109))

(declare-fun m!94111 () Bool)

(assert (=> b!88166 m!94111))

(assert (=> b!88166 m!94101))

(assert (=> b!88157 m!94097))

(assert (=> b!88157 m!94097))

(declare-fun m!94113 () Bool)

(assert (=> b!88157 m!94113))

(declare-fun m!94115 () Bool)

(assert (=> d!23417 m!94115))

(assert (=> d!23417 m!93251))

(declare-fun m!94117 () Bool)

(assert (=> b!88162 m!94117))

(assert (=> b!88160 m!94101))

(assert (=> b!88160 m!93293))

(assert (=> b!88160 m!94103))

(assert (=> b!88160 m!93293))

(assert (=> b!88160 m!94097))

(declare-fun m!94119 () Bool)

(assert (=> b!88160 m!94119))

(assert (=> b!88160 m!94097))

(assert (=> b!88160 m!94101))

(assert (=> bm!8354 d!23417))

(declare-fun b!88177 () Bool)

(declare-fun e!57438 () (_ BitVec 32))

(assert (=> b!88177 (= e!57438 #b00000000000000000000000000000000)))

(declare-fun b!88178 () Bool)

(declare-fun e!57439 () (_ BitVec 32))

(assert (=> b!88178 (= e!57438 e!57439)))

(declare-fun c!14565 () Bool)

(assert (=> b!88178 (= c!14565 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!23419 () Bool)

(declare-fun lt!42058 () (_ BitVec 32))

(assert (=> d!23419 (and (bvsge lt!42058 #b00000000000000000000000000000000) (bvsle lt!42058 (bvsub (size!2158 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!23419 (= lt!42058 e!57438)))

(declare-fun c!14564 () Bool)

(assert (=> d!23419 (= c!14564 (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23419 (and (bvsle #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2158 (_keys!4033 newMap!16)) (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23419 (= (arrayCountValidKeys!0 (_keys!4033 newMap!16) #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) lt!42058)))

(declare-fun b!88179 () Bool)

(declare-fun call!8481 () (_ BitVec 32))

(assert (=> b!88179 (= e!57439 call!8481)))

(declare-fun b!88180 () Bool)

(assert (=> b!88180 (= e!57439 (bvadd #b00000000000000000000000000000001 call!8481))))

(declare-fun bm!8478 () Bool)

(assert (=> bm!8478 (= call!8481 (arrayCountValidKeys!0 (_keys!4033 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2158 (_keys!4033 newMap!16))))))

(assert (= (and d!23419 c!14564) b!88177))

(assert (= (and d!23419 (not c!14564)) b!88178))

(assert (= (and b!88178 c!14565) b!88180))

(assert (= (and b!88178 (not c!14565)) b!88179))

(assert (= (or b!88180 b!88179) bm!8478))

(assert (=> b!88178 m!93853))

(assert (=> b!88178 m!93853))

(assert (=> b!88178 m!93863))

(declare-fun m!94121 () Bool)

(assert (=> bm!8478 m!94121))

(assert (=> b!87680 d!23419))

(declare-fun d!23421 () Bool)

(declare-fun e!57440 () Bool)

(assert (=> d!23421 e!57440))

(declare-fun res!45182 () Bool)

(assert (=> d!23421 (=> (not res!45182) (not e!57440))))

(declare-fun lt!42062 () ListLongMap!1453)

(assert (=> d!23421 (= res!45182 (contains!755 lt!42062 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun lt!42061 () List!1530)

(assert (=> d!23421 (= lt!42062 (ListLongMap!1454 lt!42061))))

(declare-fun lt!42060 () Unit!2598)

(declare-fun lt!42059 () Unit!2598)

(assert (=> d!23421 (= lt!42060 lt!42059)))

(assert (=> d!23421 (= (getValueByKey!139 lt!42061 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23421 (= lt!42059 (lemmaContainsTupThenGetReturnValue!59 lt!42061 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23421 (= lt!42061 (insertStrictlySorted!62 (toList!742 call!8434) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23421 (= (+!110 call!8434 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) lt!42062)))

(declare-fun b!88181 () Bool)

(declare-fun res!45183 () Bool)

(assert (=> b!88181 (=> (not res!45183) (not e!57440))))

(assert (=> b!88181 (= res!45183 (= (getValueByKey!139 (toList!742 lt!42062) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun b!88182 () Bool)

(assert (=> b!88182 (= e!57440 (contains!757 (toList!742 lt!42062) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (= (and d!23421 res!45182) b!88181))

(assert (= (and b!88181 res!45183) b!88182))

(declare-fun m!94123 () Bool)

(assert (=> d!23421 m!94123))

(declare-fun m!94125 () Bool)

(assert (=> d!23421 m!94125))

(declare-fun m!94127 () Bool)

(assert (=> d!23421 m!94127))

(declare-fun m!94129 () Bool)

(assert (=> d!23421 m!94129))

(declare-fun m!94131 () Bool)

(assert (=> b!88181 m!94131))

(declare-fun m!94133 () Bool)

(assert (=> b!88182 m!94133))

(assert (=> b!87936 d!23421))

(declare-fun d!23423 () Bool)

(declare-fun lt!42063 () Bool)

(assert (=> d!23423 (= lt!42063 (select (content!92 (toList!742 lt!41738)) lt!41562))))

(declare-fun e!57442 () Bool)

(assert (=> d!23423 (= lt!42063 e!57442)))

(declare-fun res!45185 () Bool)

(assert (=> d!23423 (=> (not res!45185) (not e!57442))))

(assert (=> d!23423 (= res!45185 ((_ is Cons!1526) (toList!742 lt!41738)))))

(assert (=> d!23423 (= (contains!757 (toList!742 lt!41738) lt!41562) lt!42063)))

(declare-fun b!88183 () Bool)

(declare-fun e!57441 () Bool)

(assert (=> b!88183 (= e!57442 e!57441)))

(declare-fun res!45184 () Bool)

(assert (=> b!88183 (=> res!45184 e!57441)))

(assert (=> b!88183 (= res!45184 (= (h!2118 (toList!742 lt!41738)) lt!41562))))

(declare-fun b!88184 () Bool)

(assert (=> b!88184 (= e!57441 (contains!757 (t!5263 (toList!742 lt!41738)) lt!41562))))

(assert (= (and d!23423 res!45185) b!88183))

(assert (= (and b!88183 (not res!45184)) b!88184))

(declare-fun m!94135 () Bool)

(assert (=> d!23423 m!94135))

(declare-fun m!94137 () Bool)

(assert (=> d!23423 m!94137))

(declare-fun m!94139 () Bool)

(assert (=> b!88184 m!94139))

(assert (=> b!87742 d!23423))

(assert (=> d!23317 d!23321))

(declare-fun d!23425 () Bool)

(assert (=> d!23425 (not (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23425 true))

(declare-fun _$68!76 () Unit!2598)

(assert (=> d!23425 (= (choose!68 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528)) _$68!76)))

(declare-fun bs!3723 () Bool)

(assert (= bs!3723 d!23425))

(assert (=> bs!3723 m!93253))

(assert (=> bs!3723 m!93303))

(assert (=> d!23317 d!23425))

(assert (=> b!87729 d!23379))

(declare-fun d!23427 () Bool)

(declare-fun e!57443 () Bool)

(assert (=> d!23427 e!57443))

(declare-fun res!45186 () Bool)

(assert (=> d!23427 (=> (not res!45186) (not e!57443))))

(declare-fun lt!42067 () ListLongMap!1453)

(assert (=> d!23427 (= res!45186 (contains!755 lt!42067 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!42066 () List!1530)

(assert (=> d!23427 (= lt!42067 (ListLongMap!1454 lt!42066))))

(declare-fun lt!42065 () Unit!2598)

(declare-fun lt!42064 () Unit!2598)

(assert (=> d!23427 (= lt!42065 lt!42064)))

(assert (=> d!23427 (= (getValueByKey!139 lt!42066 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23427 (= lt!42064 (lemmaContainsTupThenGetReturnValue!59 lt!42066 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23427 (= lt!42066 (insertStrictlySorted!62 (toList!742 (+!110 lt!41569 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23427 (= (+!110 (+!110 lt!41569 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!42067)))

(declare-fun b!88185 () Bool)

(declare-fun res!45187 () Bool)

(assert (=> b!88185 (=> (not res!45187) (not e!57443))))

(assert (=> b!88185 (= res!45187 (= (getValueByKey!139 (toList!742 lt!42067) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88186 () Bool)

(assert (=> b!88186 (= e!57443 (contains!757 (toList!742 lt!42067) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23427 res!45186) b!88185))

(assert (= (and b!88185 res!45187) b!88186))

(declare-fun m!94141 () Bool)

(assert (=> d!23427 m!94141))

(declare-fun m!94143 () Bool)

(assert (=> d!23427 m!94143))

(declare-fun m!94145 () Bool)

(assert (=> d!23427 m!94145))

(declare-fun m!94147 () Bool)

(assert (=> d!23427 m!94147))

(declare-fun m!94149 () Bool)

(assert (=> b!88185 m!94149))

(declare-fun m!94151 () Bool)

(assert (=> b!88186 m!94151))

(assert (=> d!23283 d!23427))

(declare-fun d!23429 () Bool)

(declare-fun e!57444 () Bool)

(assert (=> d!23429 e!57444))

(declare-fun res!45188 () Bool)

(assert (=> d!23429 (=> (not res!45188) (not e!57444))))

(declare-fun lt!42071 () ListLongMap!1453)

(assert (=> d!23429 (= res!45188 (contains!755 lt!42071 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun lt!42070 () List!1530)

(assert (=> d!23429 (= lt!42071 (ListLongMap!1454 lt!42070))))

(declare-fun lt!42069 () Unit!2598)

(declare-fun lt!42068 () Unit!2598)

(assert (=> d!23429 (= lt!42069 lt!42068)))

(assert (=> d!23429 (= (getValueByKey!139 lt!42070 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23429 (= lt!42068 (lemmaContainsTupThenGetReturnValue!59 lt!42070 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23429 (= lt!42070 (insertStrictlySorted!62 (toList!742 (+!110 lt!41569 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23429 (= (+!110 (+!110 lt!41569 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) lt!42071)))

(declare-fun b!88187 () Bool)

(declare-fun res!45189 () Bool)

(assert (=> b!88187 (=> (not res!45189) (not e!57444))))

(assert (=> b!88187 (= res!45189 (= (getValueByKey!139 (toList!742 lt!42071) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun b!88188 () Bool)

(assert (=> b!88188 (= e!57444 (contains!757 (toList!742 lt!42071) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (= (and d!23429 res!45188) b!88187))

(assert (= (and b!88187 res!45189) b!88188))

(declare-fun m!94153 () Bool)

(assert (=> d!23429 m!94153))

(declare-fun m!94155 () Bool)

(assert (=> d!23429 m!94155))

(declare-fun m!94157 () Bool)

(assert (=> d!23429 m!94157))

(declare-fun m!94159 () Bool)

(assert (=> d!23429 m!94159))

(declare-fun m!94161 () Bool)

(assert (=> b!88187 m!94161))

(declare-fun m!94163 () Bool)

(assert (=> b!88188 m!94163))

(assert (=> d!23283 d!23429))

(declare-fun d!23431 () Bool)

(assert (=> d!23431 (= (+!110 (+!110 lt!41569 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (+!110 (+!110 lt!41569 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (=> d!23431 true))

(declare-fun _$28!147 () Unit!2598)

(assert (=> d!23431 (= (choose!520 lt!41569 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) _$28!147)))

(declare-fun bs!3724 () Bool)

(assert (= bs!3724 d!23431))

(assert (=> bs!3724 m!93463))

(assert (=> bs!3724 m!93463))

(assert (=> bs!3724 m!93465))

(assert (=> bs!3724 m!93467))

(assert (=> bs!3724 m!93467))

(assert (=> bs!3724 m!93469))

(assert (=> d!23283 d!23431))

(declare-fun d!23433 () Bool)

(declare-fun e!57445 () Bool)

(assert (=> d!23433 e!57445))

(declare-fun res!45190 () Bool)

(assert (=> d!23433 (=> (not res!45190) (not e!57445))))

(declare-fun lt!42075 () ListLongMap!1453)

(assert (=> d!23433 (= res!45190 (contains!755 lt!42075 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(declare-fun lt!42074 () List!1530)

(assert (=> d!23433 (= lt!42075 (ListLongMap!1454 lt!42074))))

(declare-fun lt!42073 () Unit!2598)

(declare-fun lt!42072 () Unit!2598)

(assert (=> d!23433 (= lt!42073 lt!42072)))

(assert (=> d!23433 (= (getValueByKey!139 lt!42074 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23433 (= lt!42072 (lemmaContainsTupThenGetReturnValue!59 lt!42074 (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23433 (= lt!42074 (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (=> d!23433 (= (+!110 lt!41569 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))) lt!42075)))

(declare-fun b!88189 () Bool)

(declare-fun res!45191 () Bool)

(assert (=> b!88189 (=> (not res!45191) (not e!57445))))

(assert (=> b!88189 (= res!45191 (= (getValueByKey!139 (toList!742 lt!42075) (_1!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))))) (Some!144 (_2!1116 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun b!88190 () Bool)

(assert (=> b!88190 (= e!57445 (contains!757 (toList!742 lt!42075) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992))))))))

(assert (= (and d!23433 res!45190) b!88189))

(assert (= (and b!88189 res!45191) b!88190))

(declare-fun m!94165 () Bool)

(assert (=> d!23433 m!94165))

(declare-fun m!94167 () Bool)

(assert (=> d!23433 m!94167))

(declare-fun m!94169 () Bool)

(assert (=> d!23433 m!94169))

(declare-fun m!94171 () Bool)

(assert (=> d!23433 m!94171))

(declare-fun m!94173 () Bool)

(assert (=> b!88189 m!94173))

(declare-fun m!94175 () Bool)

(assert (=> b!88190 m!94175))

(assert (=> d!23283 d!23433))

(declare-fun d!23435 () Bool)

(declare-fun e!57446 () Bool)

(assert (=> d!23435 e!57446))

(declare-fun res!45192 () Bool)

(assert (=> d!23435 (=> (not res!45192) (not e!57446))))

(declare-fun lt!42079 () ListLongMap!1453)

(assert (=> d!23435 (= res!45192 (contains!755 lt!42079 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun lt!42078 () List!1530)

(assert (=> d!23435 (= lt!42079 (ListLongMap!1454 lt!42078))))

(declare-fun lt!42077 () Unit!2598)

(declare-fun lt!42076 () Unit!2598)

(assert (=> d!23435 (= lt!42077 lt!42076)))

(assert (=> d!23435 (= (getValueByKey!139 lt!42078 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23435 (= lt!42076 (lemmaContainsTupThenGetReturnValue!59 lt!42078 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23435 (= lt!42078 (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (=> d!23435 (= (+!110 lt!41569 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) lt!42079)))

(declare-fun b!88191 () Bool)

(declare-fun res!45193 () Bool)

(assert (=> b!88191 (=> (not res!45193) (not e!57446))))

(assert (=> b!88191 (= res!45193 (= (getValueByKey!139 (toList!742 lt!42079) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun b!88192 () Bool)

(assert (=> b!88192 (= e!57446 (contains!757 (toList!742 lt!42079) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))

(assert (= (and d!23435 res!45192) b!88191))

(assert (= (and b!88191 res!45193) b!88192))

(declare-fun m!94177 () Bool)

(assert (=> d!23435 m!94177))

(declare-fun m!94179 () Bool)

(assert (=> d!23435 m!94179))

(declare-fun m!94181 () Bool)

(assert (=> d!23435 m!94181))

(declare-fun m!94183 () Bool)

(assert (=> d!23435 m!94183))

(declare-fun m!94185 () Bool)

(assert (=> b!88191 m!94185))

(declare-fun m!94187 () Bool)

(assert (=> b!88192 m!94187))

(assert (=> d!23283 d!23435))

(declare-fun d!23437 () Bool)

(declare-fun lt!42080 () Bool)

(assert (=> d!23437 (= lt!42080 (select (content!92 (toList!742 lt!41742)) lt!41556))))

(declare-fun e!57448 () Bool)

(assert (=> d!23437 (= lt!42080 e!57448)))

(declare-fun res!45195 () Bool)

(assert (=> d!23437 (=> (not res!45195) (not e!57448))))

(assert (=> d!23437 (= res!45195 ((_ is Cons!1526) (toList!742 lt!41742)))))

(assert (=> d!23437 (= (contains!757 (toList!742 lt!41742) lt!41556) lt!42080)))

(declare-fun b!88193 () Bool)

(declare-fun e!57447 () Bool)

(assert (=> b!88193 (= e!57448 e!57447)))

(declare-fun res!45194 () Bool)

(assert (=> b!88193 (=> res!45194 e!57447)))

(assert (=> b!88193 (= res!45194 (= (h!2118 (toList!742 lt!41742)) lt!41556))))

(declare-fun b!88194 () Bool)

(assert (=> b!88194 (= e!57447 (contains!757 (t!5263 (toList!742 lt!41742)) lt!41556))))

(assert (= (and d!23437 res!45195) b!88193))

(assert (= (and b!88193 (not res!45194)) b!88194))

(declare-fun m!94189 () Bool)

(assert (=> d!23437 m!94189))

(declare-fun m!94191 () Bool)

(assert (=> d!23437 m!94191))

(declare-fun m!94193 () Bool)

(assert (=> b!88194 m!94193))

(assert (=> b!87744 d!23437))

(declare-fun d!23439 () Bool)

(declare-fun e!57450 () Bool)

(assert (=> d!23439 e!57450))

(declare-fun res!45196 () Bool)

(assert (=> d!23439 (=> res!45196 e!57450)))

(declare-fun lt!42082 () Bool)

(assert (=> d!23439 (= res!45196 (not lt!42082))))

(declare-fun lt!42081 () Bool)

(assert (=> d!23439 (= lt!42082 lt!42081)))

(declare-fun lt!42083 () Unit!2598)

(declare-fun e!57449 () Unit!2598)

(assert (=> d!23439 (= lt!42083 e!57449)))

(declare-fun c!14566 () Bool)

(assert (=> d!23439 (= c!14566 lt!42081)))

(assert (=> d!23439 (= lt!42081 (containsKey!143 (toList!742 lt!41720) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23439 (= (contains!755 lt!41720 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42082)))

(declare-fun b!88195 () Bool)

(declare-fun lt!42084 () Unit!2598)

(assert (=> b!88195 (= e!57449 lt!42084)))

(assert (=> b!88195 (= lt!42084 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41720) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88195 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88196 () Bool)

(declare-fun Unit!2618 () Unit!2598)

(assert (=> b!88196 (= e!57449 Unit!2618)))

(declare-fun b!88197 () Bool)

(assert (=> b!88197 (= e!57450 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23439 c!14566) b!88195))

(assert (= (and d!23439 (not c!14566)) b!88196))

(assert (= (and d!23439 (not res!45196)) b!88197))

(declare-fun m!94195 () Bool)

(assert (=> d!23439 m!94195))

(declare-fun m!94197 () Bool)

(assert (=> b!88195 m!94197))

(declare-fun m!94199 () Bool)

(assert (=> b!88195 m!94199))

(assert (=> b!88195 m!94199))

(declare-fun m!94201 () Bool)

(assert (=> b!88195 m!94201))

(assert (=> b!88197 m!94199))

(assert (=> b!88197 m!94199))

(assert (=> b!88197 m!94201))

(assert (=> d!23289 d!23439))

(assert (=> d!23289 d!23303))

(declare-fun b!88232 () Bool)

(declare-fun res!45221 () Bool)

(declare-fun e!57473 () Bool)

(assert (=> b!88232 (=> (not res!45221) (not e!57473))))

(declare-fun call!8490 () Bool)

(assert (=> b!88232 (= res!45221 call!8490)))

(declare-fun e!57469 () Bool)

(assert (=> b!88232 (= e!57469 e!57473)))

(declare-fun b!88233 () Bool)

(declare-fun call!8492 () Bool)

(assert (=> b!88233 (= e!57473 (not call!8492))))

(declare-fun bm!8487 () Bool)

(assert (=> bm!8487 (= call!8492 (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88234 () Bool)

(declare-fun e!57468 () Bool)

(declare-fun lt!42153 () tuple2!2212)

(assert (=> b!88234 (= e!57468 (= (map!1189 (_2!1117 lt!42153)) (+!110 (map!1189 newMap!16) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(declare-fun bm!8488 () Bool)

(declare-fun call!8491 () Bool)

(assert (=> bm!8488 (= call!8490 call!8491)))

(declare-fun b!88235 () Bool)

(declare-fun e!57471 () Bool)

(assert (=> b!88235 (= e!57471 (not call!8492))))

(declare-fun b!88236 () Bool)

(declare-fun res!45220 () Bool)

(declare-fun lt!42148 () SeekEntryResult!247)

(assert (=> b!88236 (= res!45220 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3129 lt!42148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88236 (=> (not res!45220) (not e!57471))))

(declare-fun b!88237 () Bool)

(declare-fun res!45222 () Bool)

(assert (=> b!88237 (= res!45222 call!8491)))

(declare-fun e!57472 () Bool)

(assert (=> b!88237 (=> (not res!45222) (not e!57472))))

(declare-fun d!23441 () Bool)

(assert (=> d!23441 e!57468))

(declare-fun res!45223 () Bool)

(assert (=> d!23441 (=> (not res!45223) (not e!57468))))

(assert (=> d!23441 (= res!45223 (_1!1117 lt!42153))))

(assert (=> d!23441 (= lt!42153 (tuple2!2213 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (bvadd (_size!429 newMap!16) #b00000000000000000000000000000001) (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (_vacant!429 newMap!16))))))

(declare-fun lt!42157 () Unit!2598)

(declare-fun lt!42164 () Unit!2598)

(assert (=> d!23441 (= lt!42157 lt!42164)))

(declare-fun lt!42158 () array!4019)

(declare-fun lt!42159 () array!4021)

(assert (=> d!23441 (contains!755 (getCurrentListMap!427 lt!42158 lt!42159 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916))))))

(assert (=> d!23441 (= lt!42164 (lemmaValidKeyInArrayIsInListMap!91 lt!42158 lt!42159 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23441 (= lt!42159 (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))))))

(assert (=> d!23441 (= lt!42158 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun lt!42166 () Unit!2598)

(declare-fun lt!42160 () Unit!2598)

(assert (=> d!23441 (= lt!42166 lt!42160)))

(declare-fun lt!42173 () array!4019)

(assert (=> d!23441 (= (arrayCountValidKeys!0 lt!42173 (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (bvadd (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4019 (_ BitVec 32)) Unit!2598)

(assert (=> d!23441 (= lt!42160 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!42173 (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916))))))

(assert (=> d!23441 (= lt!42173 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun lt!42161 () Unit!2598)

(declare-fun lt!42154 () Unit!2598)

(assert (=> d!23441 (= lt!42161 lt!42154)))

(declare-fun lt!42149 () array!4019)

(assert (=> d!23441 (arrayContainsKey!0 lt!42149 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23441 (= lt!42154 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!42149 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916))))))

(assert (=> d!23441 (= lt!42149 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun lt!42155 () Unit!2598)

(declare-fun lt!42151 () Unit!2598)

(assert (=> d!23441 (= lt!42155 lt!42151)))

(assert (=> d!23441 (= (+!110 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (getCurrentListMap!427 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!20 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2598)

(assert (=> d!23441 (= lt!42151 (lemmaAddValidKeyToArrayThenAddPairToListMap!20 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42174 () Unit!2598)

(declare-fun lt!42167 () Unit!2598)

(assert (=> d!23441 (= lt!42174 lt!42167)))

(assert (=> d!23441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))) (mask!6395 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4019 (_ BitVec 32) (_ BitVec 32)) Unit!2598)

(assert (=> d!23441 (= lt!42167 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (mask!6395 newMap!16)))))

(declare-fun lt!42146 () Unit!2598)

(declare-fun lt!42169 () Unit!2598)

(assert (=> d!23441 (= lt!42146 lt!42169)))

(assert (=> d!23441 (= (arrayCountValidKeys!0 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))) #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4033 newMap!16) #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4019 (_ BitVec 32) (_ BitVec 64)) Unit!2598)

(assert (=> d!23441 (= lt!42169 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4033 newMap!16) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun lt!42150 () Unit!2598)

(declare-fun lt!42145 () Unit!2598)

(assert (=> d!23441 (= lt!42150 lt!42145)))

(declare-fun lt!42165 () (_ BitVec 32))

(declare-fun lt!42156 () List!1531)

(assert (=> d!23441 (arrayNoDuplicates!0 (array!4020 (store (arr!1912 (_keys!4033 newMap!16)) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) (size!2158 (_keys!4033 newMap!16))) lt!42165 lt!42156)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4019 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1531) Unit!2598)

(assert (=> d!23441 (= lt!42145 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916)) lt!42165 lt!42156))))

(assert (=> d!23441 (= lt!42156 Nil!1528)))

(assert (=> d!23441 (= lt!42165 #b00000000000000000000000000000000)))

(declare-fun lt!42170 () Unit!2598)

(declare-fun e!57474 () Unit!2598)

(assert (=> d!23441 (= lt!42170 e!57474)))

(declare-fun c!14576 () Bool)

(assert (=> d!23441 (= c!14576 (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!42147 () Unit!2598)

(declare-fun e!57470 () Unit!2598)

(assert (=> d!23441 (= lt!42147 e!57470)))

(declare-fun c!14575 () Bool)

(assert (=> d!23441 (= c!14575 (contains!755 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23441 (valid!338 newMap!16)))

(assert (=> d!23441 (= (updateHelperNewKey!32 newMap!16 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (ite c!14507 (index!3129 lt!41916) (index!3126 lt!41916))) lt!42153)))

(declare-fun b!88238 () Bool)

(declare-fun e!57467 () Bool)

(assert (=> b!88238 (= e!57467 ((_ is Undefined!247) lt!42148))))

(declare-fun b!88239 () Bool)

(declare-fun Unit!2619 () Unit!2598)

(assert (=> b!88239 (= e!57474 Unit!2619)))

(declare-fun lt!42168 () Unit!2598)

(declare-fun lemmaArrayContainsKeyThenInListMap!20 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2598)

(assert (=> b!88239 (= lt!42168 (lemmaArrayContainsKeyThenInListMap!20 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(assert (=> b!88239 (contains!755 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))

(declare-fun lt!42152 () Unit!2598)

(assert (=> b!88239 (= lt!42152 lt!42168)))

(assert (=> b!88239 false))

(declare-fun c!14578 () Bool)

(declare-fun lt!42162 () SeekEntryResult!247)

(declare-fun bm!8489 () Bool)

(assert (=> bm!8489 (= call!8491 (inRange!0 (ite c!14575 (index!3127 lt!42162) (ite c!14578 (index!3126 lt!42148) (index!3129 lt!42148))) (mask!6395 newMap!16)))))

(declare-fun b!88240 () Bool)

(declare-fun c!14577 () Bool)

(assert (=> b!88240 (= c!14577 ((_ is MissingVacant!247) lt!42148))))

(assert (=> b!88240 (= e!57469 e!57467)))

(declare-fun b!88241 () Bool)

(assert (=> b!88241 (= e!57467 e!57471)))

(declare-fun res!45215 () Bool)

(assert (=> b!88241 (= res!45215 call!8490)))

(assert (=> b!88241 (=> (not res!45215) (not e!57471))))

(declare-fun b!88242 () Bool)

(declare-fun lt!42172 () Unit!2598)

(assert (=> b!88242 (= e!57470 lt!42172)))

(assert (=> b!88242 (= lt!42172 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun call!8493 () SeekEntryResult!247)

(assert (=> b!88242 (= lt!42148 call!8493)))

(assert (=> b!88242 (= c!14578 ((_ is MissingZero!247) lt!42148))))

(assert (=> b!88242 e!57469))

(declare-fun b!88243 () Bool)

(declare-fun res!45218 () Bool)

(assert (=> b!88243 (=> (not res!45218) (not e!57468))))

(assert (=> b!88243 (= res!45218 (contains!755 (map!1189 (_2!1117 lt!42153)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88244 () Bool)

(declare-fun Unit!2620 () Unit!2598)

(assert (=> b!88244 (= e!57470 Unit!2620)))

(declare-fun lt!42171 () Unit!2598)

(assert (=> b!88244 (= lt!42171 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> b!88244 (= lt!42162 call!8493)))

(declare-fun res!45217 () Bool)

(assert (=> b!88244 (= res!45217 ((_ is Found!247) lt!42162))))

(assert (=> b!88244 (=> (not res!45217) (not e!57472))))

(assert (=> b!88244 e!57472))

(declare-fun lt!42163 () Unit!2598)

(assert (=> b!88244 (= lt!42163 lt!42171)))

(assert (=> b!88244 false))

(declare-fun b!88245 () Bool)

(declare-fun res!45216 () Bool)

(assert (=> b!88245 (=> (not res!45216) (not e!57473))))

(assert (=> b!88245 (= res!45216 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3126 lt!42148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88246 () Bool)

(assert (=> b!88246 (= e!57472 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!42162)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88247 () Bool)

(declare-fun res!45219 () Bool)

(assert (=> b!88247 (=> (not res!45219) (not e!57468))))

(assert (=> b!88247 (= res!45219 (valid!338 (_2!1117 lt!42153)))))

(declare-fun b!88248 () Bool)

(declare-fun Unit!2621 () Unit!2598)

(assert (=> b!88248 (= e!57474 Unit!2621)))

(declare-fun bm!8490 () Bool)

(assert (=> bm!8490 (= call!8493 (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(assert (= (and d!23441 c!14575) b!88244))

(assert (= (and d!23441 (not c!14575)) b!88242))

(assert (= (and b!88244 res!45217) b!88237))

(assert (= (and b!88237 res!45222) b!88246))

(assert (= (and b!88242 c!14578) b!88232))

(assert (= (and b!88242 (not c!14578)) b!88240))

(assert (= (and b!88232 res!45221) b!88245))

(assert (= (and b!88245 res!45216) b!88233))

(assert (= (and b!88240 c!14577) b!88241))

(assert (= (and b!88240 (not c!14577)) b!88238))

(assert (= (and b!88241 res!45215) b!88236))

(assert (= (and b!88236 res!45220) b!88235))

(assert (= (or b!88232 b!88241) bm!8488))

(assert (= (or b!88233 b!88235) bm!8487))

(assert (= (or b!88237 bm!8488) bm!8489))

(assert (= (or b!88244 b!88242) bm!8490))

(assert (= (and d!23441 c!14576) b!88239))

(assert (= (and d!23441 (not c!14576)) b!88248))

(assert (= (and d!23441 res!45223) b!88247))

(assert (= (and b!88247 res!45219) b!88243))

(assert (= (and b!88243 res!45218) b!88234))

(assert (=> bm!8487 m!93253))

(assert (=> bm!8487 m!93673))

(declare-fun m!94203 () Bool)

(assert (=> bm!8489 m!94203))

(assert (=> b!88239 m!93253))

(declare-fun m!94205 () Bool)

(assert (=> b!88239 m!94205))

(assert (=> b!88239 m!93597))

(assert (=> b!88239 m!93597))

(assert (=> b!88239 m!93253))

(declare-fun m!94207 () Bool)

(assert (=> b!88239 m!94207))

(assert (=> bm!8490 m!93253))

(assert (=> bm!8490 m!93713))

(declare-fun m!94209 () Bool)

(assert (=> b!88245 m!94209))

(declare-fun m!94211 () Bool)

(assert (=> b!88236 m!94211))

(declare-fun m!94213 () Bool)

(assert (=> b!88247 m!94213))

(assert (=> b!88242 m!93253))

(assert (=> b!88242 m!93705))

(declare-fun m!94215 () Bool)

(assert (=> b!88246 m!94215))

(declare-fun m!94217 () Bool)

(assert (=> b!88234 m!94217))

(assert (=> b!88234 m!93285))

(assert (=> b!88234 m!93285))

(declare-fun m!94219 () Bool)

(assert (=> b!88234 m!94219))

(assert (=> b!88243 m!94217))

(assert (=> b!88243 m!94217))

(assert (=> b!88243 m!93253))

(declare-fun m!94221 () Bool)

(assert (=> b!88243 m!94221))

(assert (=> b!88244 m!93253))

(assert (=> b!88244 m!93687))

(declare-fun m!94223 () Bool)

(assert (=> d!23441 m!94223))

(declare-fun m!94225 () Bool)

(assert (=> d!23441 m!94225))

(declare-fun m!94227 () Bool)

(assert (=> d!23441 m!94227))

(assert (=> d!23441 m!93243))

(declare-fun m!94229 () Bool)

(assert (=> d!23441 m!94229))

(declare-fun m!94231 () Bool)

(assert (=> d!23441 m!94231))

(assert (=> d!23441 m!93253))

(declare-fun m!94233 () Bool)

(assert (=> d!23441 m!94233))

(assert (=> d!23441 m!93253))

(assert (=> d!23441 m!93673))

(declare-fun m!94235 () Bool)

(assert (=> d!23441 m!94235))

(declare-fun m!94237 () Bool)

(assert (=> d!23441 m!94237))

(declare-fun m!94239 () Bool)

(assert (=> d!23441 m!94239))

(assert (=> d!23441 m!93253))

(declare-fun m!94241 () Bool)

(assert (=> d!23441 m!94241))

(declare-fun m!94243 () Bool)

(assert (=> d!23441 m!94243))

(assert (=> d!23441 m!94225))

(assert (=> d!23441 m!93597))

(assert (=> d!23441 m!93253))

(assert (=> d!23441 m!94207))

(assert (=> d!23441 m!93253))

(declare-fun m!94245 () Bool)

(assert (=> d!23441 m!94245))

(assert (=> d!23441 m!93443))

(declare-fun m!94247 () Bool)

(assert (=> d!23441 m!94247))

(declare-fun m!94249 () Bool)

(assert (=> d!23441 m!94249))

(assert (=> d!23441 m!93597))

(declare-fun m!94251 () Bool)

(assert (=> d!23441 m!94251))

(assert (=> d!23441 m!93253))

(declare-fun m!94253 () Bool)

(assert (=> d!23441 m!94253))

(assert (=> d!23441 m!93253))

(declare-fun m!94255 () Bool)

(assert (=> d!23441 m!94255))

(assert (=> d!23441 m!93597))

(declare-fun m!94257 () Bool)

(assert (=> d!23441 m!94257))

(assert (=> d!23441 m!94223))

(assert (=> d!23441 m!93253))

(declare-fun m!94259 () Bool)

(assert (=> d!23441 m!94259))

(assert (=> bm!8444 d!23441))

(declare-fun d!23443 () Bool)

(declare-fun e!57476 () Bool)

(assert (=> d!23443 e!57476))

(declare-fun res!45224 () Bool)

(assert (=> d!23443 (=> res!45224 e!57476)))

(declare-fun lt!42176 () Bool)

(assert (=> d!23443 (= res!45224 (not lt!42176))))

(declare-fun lt!42175 () Bool)

(assert (=> d!23443 (= lt!42176 lt!42175)))

(declare-fun lt!42177 () Unit!2598)

(declare-fun e!57475 () Unit!2598)

(assert (=> d!23443 (= lt!42177 e!57475)))

(declare-fun c!14579 () Bool)

(assert (=> d!23443 (= c!14579 lt!42175)))

(assert (=> d!23443 (= lt!42175 (containsKey!143 (toList!742 lt!41720) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23443 (= (contains!755 lt!41720 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42176)))

(declare-fun b!88249 () Bool)

(declare-fun lt!42178 () Unit!2598)

(assert (=> b!88249 (= e!57475 lt!42178)))

(assert (=> b!88249 (= lt!42178 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41720) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88249 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88250 () Bool)

(declare-fun Unit!2622 () Unit!2598)

(assert (=> b!88250 (= e!57475 Unit!2622)))

(declare-fun b!88251 () Bool)

(assert (=> b!88251 (= e!57476 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23443 c!14579) b!88249))

(assert (= (and d!23443 (not c!14579)) b!88250))

(assert (= (and d!23443 (not res!45224)) b!88251))

(assert (=> d!23443 m!93497))

(declare-fun m!94261 () Bool)

(assert (=> d!23443 m!94261))

(assert (=> b!88249 m!93497))

(declare-fun m!94263 () Bool)

(assert (=> b!88249 m!94263))

(assert (=> b!88249 m!93497))

(declare-fun m!94265 () Bool)

(assert (=> b!88249 m!94265))

(assert (=> b!88249 m!94265))

(declare-fun m!94267 () Bool)

(assert (=> b!88249 m!94267))

(assert (=> b!88251 m!93497))

(assert (=> b!88251 m!94265))

(assert (=> b!88251 m!94265))

(assert (=> b!88251 m!94267))

(assert (=> b!87725 d!23443))

(declare-fun d!23445 () Bool)

(declare-fun lt!42179 () Bool)

(assert (=> d!23445 (= lt!42179 (select (content!92 (toList!742 lt!41730)) lt!41572))))

(declare-fun e!57478 () Bool)

(assert (=> d!23445 (= lt!42179 e!57478)))

(declare-fun res!45226 () Bool)

(assert (=> d!23445 (=> (not res!45226) (not e!57478))))

(assert (=> d!23445 (= res!45226 ((_ is Cons!1526) (toList!742 lt!41730)))))

(assert (=> d!23445 (= (contains!757 (toList!742 lt!41730) lt!41572) lt!42179)))

(declare-fun b!88252 () Bool)

(declare-fun e!57477 () Bool)

(assert (=> b!88252 (= e!57478 e!57477)))

(declare-fun res!45225 () Bool)

(assert (=> b!88252 (=> res!45225 e!57477)))

(assert (=> b!88252 (= res!45225 (= (h!2118 (toList!742 lt!41730)) lt!41572))))

(declare-fun b!88253 () Bool)

(assert (=> b!88253 (= e!57477 (contains!757 (t!5263 (toList!742 lt!41730)) lt!41572))))

(assert (= (and d!23445 res!45226) b!88252))

(assert (= (and b!88252 (not res!45225)) b!88253))

(declare-fun m!94269 () Bool)

(assert (=> d!23445 m!94269))

(declare-fun m!94271 () Bool)

(assert (=> d!23445 m!94271))

(declare-fun m!94273 () Bool)

(assert (=> b!88253 m!94273))

(assert (=> b!87738 d!23445))

(declare-fun b!88254 () Bool)

(declare-fun e!57480 () Bool)

(declare-fun call!8494 () Bool)

(assert (=> b!88254 (= e!57480 call!8494)))

(declare-fun b!88255 () Bool)

(declare-fun e!57479 () Bool)

(assert (=> b!88255 (= e!57479 e!57480)))

(declare-fun lt!42181 () (_ BitVec 64))

(assert (=> b!88255 (= lt!42181 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!42182 () Unit!2598)

(assert (=> b!88255 (= lt!42182 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!42181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!88255 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!42181 #b00000000000000000000000000000000)))

(declare-fun lt!42180 () Unit!2598)

(assert (=> b!88255 (= lt!42180 lt!42182)))

(declare-fun res!45227 () Bool)

(assert (=> b!88255 (= res!45227 (= (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))) (Found!247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!88255 (=> (not res!45227) (not e!57480))))

(declare-fun b!88256 () Bool)

(assert (=> b!88256 (= e!57479 call!8494)))

(declare-fun bm!8491 () Bool)

(assert (=> bm!8491 (= call!8494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun b!88257 () Bool)

(declare-fun e!57481 () Bool)

(assert (=> b!88257 (= e!57481 e!57479)))

(declare-fun c!14580 () Bool)

(assert (=> b!88257 (= c!14580 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!23447 () Bool)

(declare-fun res!45228 () Bool)

(assert (=> d!23447 (=> res!45228 e!57481)))

(assert (=> d!23447 (= res!45228 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23447 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))) e!57481)))

(assert (= (and d!23447 (not res!45228)) b!88257))

(assert (= (and b!88257 c!14580) b!88255))

(assert (= (and b!88257 (not c!14580)) b!88256))

(assert (= (and b!88255 res!45227) b!88254))

(assert (= (or b!88254 b!88256) bm!8491))

(declare-fun m!94275 () Bool)

(assert (=> b!88255 m!94275))

(declare-fun m!94277 () Bool)

(assert (=> b!88255 m!94277))

(declare-fun m!94279 () Bool)

(assert (=> b!88255 m!94279))

(assert (=> b!88255 m!94275))

(declare-fun m!94281 () Bool)

(assert (=> b!88255 m!94281))

(declare-fun m!94283 () Bool)

(assert (=> bm!8491 m!94283))

(assert (=> b!88257 m!94275))

(assert (=> b!88257 m!94275))

(declare-fun m!94285 () Bool)

(assert (=> b!88257 m!94285))

(assert (=> bm!8351 d!23447))

(declare-fun d!23449 () Bool)

(declare-fun res!45229 () Bool)

(declare-fun e!57482 () Bool)

(assert (=> d!23449 (=> (not res!45229) (not e!57482))))

(assert (=> d!23449 (= res!45229 (simpleValid!59 (_2!1117 lt!41894)))))

(assert (=> d!23449 (= (valid!338 (_2!1117 lt!41894)) e!57482)))

(declare-fun b!88258 () Bool)

(declare-fun res!45230 () Bool)

(assert (=> b!88258 (=> (not res!45230) (not e!57482))))

(assert (=> b!88258 (= res!45230 (= (arrayCountValidKeys!0 (_keys!4033 (_2!1117 lt!41894)) #b00000000000000000000000000000000 (size!2158 (_keys!4033 (_2!1117 lt!41894)))) (_size!429 (_2!1117 lt!41894))))))

(declare-fun b!88259 () Bool)

(declare-fun res!45231 () Bool)

(assert (=> b!88259 (=> (not res!45231) (not e!57482))))

(assert (=> b!88259 (= res!45231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 (_2!1117 lt!41894)) (mask!6395 (_2!1117 lt!41894))))))

(declare-fun b!88260 () Bool)

(assert (=> b!88260 (= e!57482 (arrayNoDuplicates!0 (_keys!4033 (_2!1117 lt!41894)) #b00000000000000000000000000000000 Nil!1528))))

(assert (= (and d!23449 res!45229) b!88258))

(assert (= (and b!88258 res!45230) b!88259))

(assert (= (and b!88259 res!45231) b!88260))

(declare-fun m!94287 () Bool)

(assert (=> d!23449 m!94287))

(declare-fun m!94289 () Bool)

(assert (=> b!88258 m!94289))

(declare-fun m!94291 () Bool)

(assert (=> b!88259 m!94291))

(declare-fun m!94293 () Bool)

(assert (=> b!88260 m!94293))

(assert (=> d!23329 d!23449))

(assert (=> d!23329 d!23275))

(declare-fun d!23451 () Bool)

(declare-fun lt!42183 () Bool)

(assert (=> d!23451 (= lt!42183 (select (content!92 (toList!742 lt!41734)) lt!41556))))

(declare-fun e!57484 () Bool)

(assert (=> d!23451 (= lt!42183 e!57484)))

(declare-fun res!45233 () Bool)

(assert (=> d!23451 (=> (not res!45233) (not e!57484))))

(assert (=> d!23451 (= res!45233 ((_ is Cons!1526) (toList!742 lt!41734)))))

(assert (=> d!23451 (= (contains!757 (toList!742 lt!41734) lt!41556) lt!42183)))

(declare-fun b!88261 () Bool)

(declare-fun e!57483 () Bool)

(assert (=> b!88261 (= e!57484 e!57483)))

(declare-fun res!45232 () Bool)

(assert (=> b!88261 (=> res!45232 e!57483)))

(assert (=> b!88261 (= res!45232 (= (h!2118 (toList!742 lt!41734)) lt!41556))))

(declare-fun b!88262 () Bool)

(assert (=> b!88262 (= e!57483 (contains!757 (t!5263 (toList!742 lt!41734)) lt!41556))))

(assert (= (and d!23451 res!45233) b!88261))

(assert (= (and b!88261 (not res!45232)) b!88262))

(declare-fun m!94295 () Bool)

(assert (=> d!23451 m!94295))

(declare-fun m!94297 () Bool)

(assert (=> d!23451 m!94297))

(declare-fun m!94299 () Bool)

(assert (=> b!88262 m!94299))

(assert (=> b!87740 d!23451))

(declare-fun d!23453 () Bool)

(assert (=> d!23453 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000)))

(declare-fun lt!42186 () Unit!2598)

(declare-fun choose!13 (array!4019 (_ BitVec 64) (_ BitVec 32)) Unit!2598)

(assert (=> d!23453 (= lt!42186 (choose!13 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000))))

(assert (=> d!23453 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23453 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000) lt!42186)))

(declare-fun bs!3725 () Bool)

(assert (= bs!3725 d!23453))

(assert (=> bs!3725 m!93453))

(declare-fun m!94301 () Bool)

(assert (=> bs!3725 m!94301))

(assert (=> b!87692 d!23453))

(declare-fun d!23455 () Bool)

(declare-fun res!45234 () Bool)

(declare-fun e!57485 () Bool)

(assert (=> d!23455 (=> res!45234 e!57485)))

(assert (=> d!23455 (= res!45234 (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) lt!41688))))

(assert (=> d!23455 (= (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 #b00000000000000000000000000000000) e!57485)))

(declare-fun b!88263 () Bool)

(declare-fun e!57486 () Bool)

(assert (=> b!88263 (= e!57485 e!57486)))

(declare-fun res!45235 () Bool)

(assert (=> b!88263 (=> (not res!45235) (not e!57486))))

(assert (=> b!88263 (= res!45235 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!88264 () Bool)

(assert (=> b!88264 (= e!57486 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) lt!41688 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23455 (not res!45234)) b!88263))

(assert (= (and b!88263 res!45235) b!88264))

(assert (=> d!23455 m!93449))

(declare-fun m!94303 () Bool)

(assert (=> b!88264 m!94303))

(assert (=> b!87692 d!23455))

(declare-fun b!88265 () Bool)

(declare-fun c!14581 () Bool)

(declare-fun lt!42189 () (_ BitVec 64))

(assert (=> b!88265 (= c!14581 (= lt!42189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57488 () SeekEntryResult!247)

(declare-fun e!57487 () SeekEntryResult!247)

(assert (=> b!88265 (= e!57488 e!57487)))

(declare-fun b!88266 () Bool)

(declare-fun e!57489 () SeekEntryResult!247)

(assert (=> b!88266 (= e!57489 Undefined!247)))

(declare-fun b!88267 () Bool)

(declare-fun lt!42187 () SeekEntryResult!247)

(assert (=> b!88267 (= e!57487 (seekKeyOrZeroReturnVacant!0 (x!12143 lt!42187) (index!3128 lt!42187) (index!3128 lt!42187) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(declare-fun d!23457 () Bool)

(declare-fun lt!42188 () SeekEntryResult!247)

(assert (=> d!23457 (and (or ((_ is Undefined!247) lt!42188) (not ((_ is Found!247) lt!42188)) (and (bvsge (index!3127 lt!42188) #b00000000000000000000000000000000) (bvslt (index!3127 lt!42188) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))) (or ((_ is Undefined!247) lt!42188) ((_ is Found!247) lt!42188) (not ((_ is MissingZero!247) lt!42188)) (and (bvsge (index!3126 lt!42188) #b00000000000000000000000000000000) (bvslt (index!3126 lt!42188) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))) (or ((_ is Undefined!247) lt!42188) ((_ is Found!247) lt!42188) ((_ is MissingZero!247) lt!42188) (not ((_ is MissingVacant!247) lt!42188)) (and (bvsge (index!3129 lt!42188) #b00000000000000000000000000000000) (bvslt (index!3129 lt!42188) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))) (or ((_ is Undefined!247) lt!42188) (ite ((_ is Found!247) lt!42188) (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (index!3127 lt!42188)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!247) lt!42188) (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (index!3126 lt!42188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!247) lt!42188) (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (index!3129 lt!42188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23457 (= lt!42188 e!57489)))

(declare-fun c!14583 () Bool)

(assert (=> d!23457 (= c!14583 (and ((_ is Intermediate!247) lt!42187) (undefined!1059 lt!42187)))))

(assert (=> d!23457 (= lt!42187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) (mask!6395 (v!2654 (underlying!288 thiss!992)))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))))))

(assert (=> d!23457 (validMask!0 (mask!6395 (v!2654 (underlying!288 thiss!992))))))

(assert (=> d!23457 (= (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) (_keys!4033 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992)))) lt!42188)))

(declare-fun b!88268 () Bool)

(assert (=> b!88268 (= e!57487 (MissingZero!247 (index!3128 lt!42187)))))

(declare-fun b!88269 () Bool)

(assert (=> b!88269 (= e!57489 e!57488)))

(assert (=> b!88269 (= lt!42189 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (index!3128 lt!42187)))))

(declare-fun c!14582 () Bool)

(assert (=> b!88269 (= c!14582 (= lt!42189 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!88270 () Bool)

(assert (=> b!88270 (= e!57488 (Found!247 (index!3128 lt!42187)))))

(assert (= (and d!23457 c!14583) b!88266))

(assert (= (and d!23457 (not c!14583)) b!88269))

(assert (= (and b!88269 c!14582) b!88270))

(assert (= (and b!88269 (not c!14582)) b!88265))

(assert (= (and b!88265 c!14581) b!88268))

(assert (= (and b!88265 (not c!14581)) b!88267))

(assert (=> b!88267 m!93449))

(declare-fun m!94305 () Bool)

(assert (=> b!88267 m!94305))

(declare-fun m!94307 () Bool)

(assert (=> d!23457 m!94307))

(assert (=> d!23457 m!93251))

(declare-fun m!94309 () Bool)

(assert (=> d!23457 m!94309))

(assert (=> d!23457 m!93449))

(declare-fun m!94311 () Bool)

(assert (=> d!23457 m!94311))

(declare-fun m!94313 () Bool)

(assert (=> d!23457 m!94313))

(declare-fun m!94315 () Bool)

(assert (=> d!23457 m!94315))

(assert (=> d!23457 m!93449))

(assert (=> d!23457 m!94309))

(declare-fun m!94317 () Bool)

(assert (=> b!88269 m!94317))

(assert (=> b!87692 d!23457))

(assert (=> d!23313 d!23303))

(declare-fun d!23459 () Bool)

(assert (=> d!23459 (= (+!110 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) lt!41910 lt!41566 (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42192 () Unit!2598)

(declare-fun choose!527 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2598)

(assert (=> d!23459 (= lt!42192 (choose!527 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41910 (zeroValue!2248 newMap!16) lt!41566 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23459 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23459 (= (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41910 (zeroValue!2248 newMap!16) lt!41566 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)) lt!42192)))

(declare-fun bs!3726 () Bool)

(assert (= bs!3726 d!23459))

(assert (=> bs!3726 m!93597))

(declare-fun m!94319 () Bool)

(assert (=> bs!3726 m!94319))

(declare-fun m!94321 () Bool)

(assert (=> bs!3726 m!94321))

(assert (=> bs!3726 m!93743))

(declare-fun m!94323 () Bool)

(assert (=> bs!3726 m!94323))

(assert (=> bs!3726 m!93597))

(assert (=> b!87958 d!23459))

(declare-fun d!23461 () Bool)

(assert (=> d!23461 (= (get!1209 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2653 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> b!87753 d!23461))

(declare-fun d!23463 () Bool)

(assert (=> d!23463 (= (inRange!0 (ite c!14498 (ite c!14503 (index!3127 lt!41898) (ite c!14500 (index!3126 lt!41912) (index!3129 lt!41912))) (ite c!14501 (index!3127 lt!41895) (ite c!14506 (index!3126 lt!41915) (index!3129 lt!41915)))) (mask!6395 newMap!16)) (and (bvsge (ite c!14498 (ite c!14503 (index!3127 lt!41898) (ite c!14500 (index!3126 lt!41912) (index!3129 lt!41912))) (ite c!14501 (index!3127 lt!41895) (ite c!14506 (index!3126 lt!41915) (index!3129 lt!41915)))) #b00000000000000000000000000000000) (bvslt (ite c!14498 (ite c!14503 (index!3127 lt!41898) (ite c!14500 (index!3126 lt!41912) (index!3129 lt!41912))) (ite c!14501 (index!3127 lt!41895) (ite c!14506 (index!3126 lt!41915) (index!3129 lt!41915)))) (bvadd (mask!6395 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8441 d!23463))

(declare-fun d!23465 () Bool)

(declare-fun e!57492 () Bool)

(assert (=> d!23465 e!57492))

(declare-fun res!45238 () Bool)

(assert (=> d!23465 (=> (not res!45238) (not e!57492))))

(assert (=> d!23465 (= res!45238 (and (bvsge (index!3127 lt!41916) #b00000000000000000000000000000000) (bvslt (index!3127 lt!41916) (size!2158 (_keys!4033 newMap!16)))))))

(declare-fun lt!42195 () Unit!2598)

(declare-fun choose!528 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) Unit!2598)

(assert (=> d!23465 (= lt!42195 (choose!528 (_keys!4033 newMap!16) lt!41893 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23465 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23465 (= (lemmaValidKeyInArrayIsInListMap!91 (_keys!4033 newMap!16) lt!41893 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (defaultEntry!2358 newMap!16)) lt!42195)))

(declare-fun b!88273 () Bool)

(assert (=> b!88273 (= e!57492 (contains!755 (getCurrentListMap!427 (_keys!4033 newMap!16) lt!41893 (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1912 (_keys!4033 newMap!16)) (index!3127 lt!41916))))))

(assert (= (and d!23465 res!45238) b!88273))

(declare-fun m!94325 () Bool)

(assert (=> d!23465 m!94325))

(assert (=> d!23465 m!93743))

(declare-fun m!94327 () Bool)

(assert (=> b!88273 m!94327))

(assert (=> b!88273 m!93715))

(assert (=> b!88273 m!94327))

(assert (=> b!88273 m!93715))

(declare-fun m!94329 () Bool)

(assert (=> b!88273 m!94329))

(assert (=> b!87930 d!23465))

(declare-fun b!88274 () Bool)

(declare-fun e!57502 () Bool)

(declare-fun lt!42215 () ListLongMap!1453)

(assert (=> b!88274 (= e!57502 (= (apply!83 lt!42215 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 newMap!16)))))

(declare-fun b!88275 () Bool)

(declare-fun e!57494 () Bool)

(declare-fun e!57503 () Bool)

(assert (=> b!88275 (= e!57494 e!57503)))

(declare-fun res!45239 () Bool)

(declare-fun call!8501 () Bool)

(assert (=> b!88275 (= res!45239 call!8501)))

(assert (=> b!88275 (=> (not res!45239) (not e!57503))))

(declare-fun call!8496 () ListLongMap!1453)

(declare-fun call!8495 () ListLongMap!1453)

(declare-fun bm!8492 () Bool)

(declare-fun call!8497 () ListLongMap!1453)

(declare-fun call!8500 () ListLongMap!1453)

(declare-fun c!14588 () Bool)

(declare-fun c!14586 () Bool)

(assert (=> bm!8492 (= call!8495 (+!110 (ite c!14588 call!8500 (ite c!14586 call!8497 call!8496)) (ite (or c!14588 c!14586) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16)))))))

(declare-fun b!88276 () Bool)

(declare-fun res!45241 () Bool)

(declare-fun e!57505 () Bool)

(assert (=> b!88276 (=> (not res!45241) (not e!57505))))

(declare-fun e!57504 () Bool)

(assert (=> b!88276 (= res!45241 e!57504)))

(declare-fun res!45247 () Bool)

(assert (=> b!88276 (=> res!45247 e!57504)))

(declare-fun e!57498 () Bool)

(assert (=> b!88276 (= res!45247 (not e!57498))))

(declare-fun res!45244 () Bool)

(assert (=> b!88276 (=> (not res!45244) (not e!57498))))

(assert (=> b!88276 (= res!45244 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88277 () Bool)

(declare-fun e!57495 () Bool)

(assert (=> b!88277 (= e!57495 e!57502)))

(declare-fun res!45246 () Bool)

(declare-fun call!8499 () Bool)

(assert (=> b!88277 (= res!45246 call!8499)))

(assert (=> b!88277 (=> (not res!45246) (not e!57502))))

(declare-fun b!88278 () Bool)

(declare-fun e!57493 () ListLongMap!1453)

(assert (=> b!88278 (= e!57493 (+!110 call!8495 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16))))))

(declare-fun bm!8493 () Bool)

(declare-fun call!8498 () ListLongMap!1453)

(assert (=> bm!8493 (= call!8498 call!8495)))

(declare-fun b!88279 () Bool)

(assert (=> b!88279 (= e!57498 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88280 () Bool)

(assert (=> b!88280 (= e!57494 (not call!8501))))

(declare-fun b!88281 () Bool)

(declare-fun e!57496 () ListLongMap!1453)

(assert (=> b!88281 (= e!57496 call!8496)))

(declare-fun b!88282 () Bool)

(declare-fun c!14585 () Bool)

(assert (=> b!88282 (= c!14585 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57499 () ListLongMap!1453)

(assert (=> b!88282 (= e!57499 e!57496)))

(declare-fun bm!8494 () Bool)

(assert (=> bm!8494 (= call!8497 call!8500)))

(declare-fun b!88283 () Bool)

(declare-fun e!57497 () Bool)

(assert (=> b!88283 (= e!57497 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88284 () Bool)

(assert (=> b!88284 (= e!57505 e!57494)))

(declare-fun c!14587 () Bool)

(assert (=> b!88284 (= c!14587 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88285 () Bool)

(declare-fun e!57500 () Unit!2598)

(declare-fun lt!42198 () Unit!2598)

(assert (=> b!88285 (= e!57500 lt!42198)))

(declare-fun lt!42197 () ListLongMap!1453)

(assert (=> b!88285 (= lt!42197 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42210 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42204 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42204 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42209 () Unit!2598)

(assert (=> b!88285 (= lt!42209 (addStillContains!59 lt!42197 lt!42210 (zeroValue!2248 newMap!16) lt!42204))))

(assert (=> b!88285 (contains!755 (+!110 lt!42197 (tuple2!2211 lt!42210 (zeroValue!2248 newMap!16))) lt!42204)))

(declare-fun lt!42207 () Unit!2598)

(assert (=> b!88285 (= lt!42207 lt!42209)))

(declare-fun lt!42202 () ListLongMap!1453)

(assert (=> b!88285 (= lt!42202 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42196 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42196 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42213 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42213 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42199 () Unit!2598)

(assert (=> b!88285 (= lt!42199 (addApplyDifferent!59 lt!42202 lt!42196 (minValue!2248 newMap!16) lt!42213))))

(assert (=> b!88285 (= (apply!83 (+!110 lt!42202 (tuple2!2211 lt!42196 (minValue!2248 newMap!16))) lt!42213) (apply!83 lt!42202 lt!42213))))

(declare-fun lt!42201 () Unit!2598)

(assert (=> b!88285 (= lt!42201 lt!42199)))

(declare-fun lt!42212 () ListLongMap!1453)

(assert (=> b!88285 (= lt!42212 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42205 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42205 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42208 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42208 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42217 () Unit!2598)

(assert (=> b!88285 (= lt!42217 (addApplyDifferent!59 lt!42212 lt!42205 (zeroValue!2248 newMap!16) lt!42208))))

(assert (=> b!88285 (= (apply!83 (+!110 lt!42212 (tuple2!2211 lt!42205 (zeroValue!2248 newMap!16))) lt!42208) (apply!83 lt!42212 lt!42208))))

(declare-fun lt!42214 () Unit!2598)

(assert (=> b!88285 (= lt!42214 lt!42217)))

(declare-fun lt!42211 () ListLongMap!1453)

(assert (=> b!88285 (= lt!42211 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42206 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42200 () (_ BitVec 64))

(assert (=> b!88285 (= lt!42200 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88285 (= lt!42198 (addApplyDifferent!59 lt!42211 lt!42206 (minValue!2248 newMap!16) lt!42200))))

(assert (=> b!88285 (= (apply!83 (+!110 lt!42211 (tuple2!2211 lt!42206 (minValue!2248 newMap!16))) lt!42200) (apply!83 lt!42211 lt!42200))))

(declare-fun b!88286 () Bool)

(assert (=> b!88286 (= e!57499 call!8498)))

(declare-fun b!88287 () Bool)

(assert (=> b!88287 (= e!57503 (= (apply!83 lt!42215 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 newMap!16)))))

(declare-fun b!88288 () Bool)

(declare-fun e!57501 () Bool)

(assert (=> b!88288 (= e!57504 e!57501)))

(declare-fun res!45242 () Bool)

(assert (=> b!88288 (=> (not res!45242) (not e!57501))))

(assert (=> b!88288 (= res!45242 (contains!755 lt!42215 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun d!23467 () Bool)

(assert (=> d!23467 e!57505))

(declare-fun res!45240 () Bool)

(assert (=> d!23467 (=> (not res!45240) (not e!57505))))

(assert (=> d!23467 (= res!45240 (or (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))))

(declare-fun lt!42216 () ListLongMap!1453)

(assert (=> d!23467 (= lt!42215 lt!42216)))

(declare-fun lt!42203 () Unit!2598)

(assert (=> d!23467 (= lt!42203 e!57500)))

(declare-fun c!14589 () Bool)

(assert (=> d!23467 (= c!14589 e!57497)))

(declare-fun res!45245 () Bool)

(assert (=> d!23467 (=> (not res!45245) (not e!57497))))

(assert (=> d!23467 (= res!45245 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23467 (= lt!42216 e!57493)))

(assert (=> d!23467 (= c!14588 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23467 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23467 (= (getCurrentListMap!427 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42215)))

(declare-fun b!88289 () Bool)

(assert (=> b!88289 (= e!57493 e!57499)))

(assert (=> b!88289 (= c!14586 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88290 () Bool)

(assert (=> b!88290 (= e!57501 (= (apply!83 lt!42215 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)) (get!1207 (select (arr!1913 (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88290 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2159 (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))))))))

(assert (=> b!88290 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88291 () Bool)

(declare-fun Unit!2623 () Unit!2598)

(assert (=> b!88291 (= e!57500 Unit!2623)))

(declare-fun bm!8495 () Bool)

(assert (=> bm!8495 (= call!8501 (contains!755 lt!42215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88292 () Bool)

(assert (=> b!88292 (= e!57496 call!8498)))

(declare-fun b!88293 () Bool)

(assert (=> b!88293 (= e!57495 (not call!8499))))

(declare-fun bm!8496 () Bool)

(assert (=> bm!8496 (= call!8496 call!8497)))

(declare-fun b!88294 () Bool)

(declare-fun res!45243 () Bool)

(assert (=> b!88294 (=> (not res!45243) (not e!57505))))

(assert (=> b!88294 (= res!45243 e!57495)))

(declare-fun c!14584 () Bool)

(assert (=> b!88294 (= c!14584 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8497 () Bool)

(assert (=> bm!8497 (= call!8500 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8498 () Bool)

(assert (=> bm!8498 (= call!8499 (contains!755 lt!42215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23467 c!14588) b!88278))

(assert (= (and d!23467 (not c!14588)) b!88289))

(assert (= (and b!88289 c!14586) b!88286))

(assert (= (and b!88289 (not c!14586)) b!88282))

(assert (= (and b!88282 c!14585) b!88292))

(assert (= (and b!88282 (not c!14585)) b!88281))

(assert (= (or b!88292 b!88281) bm!8496))

(assert (= (or b!88286 bm!8496) bm!8494))

(assert (= (or b!88286 b!88292) bm!8493))

(assert (= (or b!88278 bm!8494) bm!8497))

(assert (= (or b!88278 bm!8493) bm!8492))

(assert (= (and d!23467 res!45245) b!88283))

(assert (= (and d!23467 c!14589) b!88285))

(assert (= (and d!23467 (not c!14589)) b!88291))

(assert (= (and d!23467 res!45240) b!88276))

(assert (= (and b!88276 res!45244) b!88279))

(assert (= (and b!88276 (not res!45247)) b!88288))

(assert (= (and b!88288 res!45242) b!88290))

(assert (= (and b!88276 res!45241) b!88294))

(assert (= (and b!88294 c!14584) b!88277))

(assert (= (and b!88294 (not c!14584)) b!88293))

(assert (= (and b!88277 res!45246) b!88274))

(assert (= (or b!88277 b!88293) bm!8498))

(assert (= (and b!88294 res!45243) b!88284))

(assert (= (and b!88284 c!14587) b!88275))

(assert (= (and b!88284 (not c!14587)) b!88280))

(assert (= (and b!88275 res!45239) b!88287))

(assert (= (or b!88275 b!88280) bm!8495))

(declare-fun b_lambda!3907 () Bool)

(assert (=> (not b_lambda!3907) (not b!88290)))

(assert (=> b!88290 t!5277))

(declare-fun b_and!5313 () Bool)

(assert (= b_and!5309 (and (=> t!5277 result!2951) b_and!5313)))

(assert (=> b!88290 t!5279))

(declare-fun b_and!5315 () Bool)

(assert (= b_and!5311 (and (=> t!5279 result!2953) b_and!5315)))

(assert (=> b!88288 m!93853))

(assert (=> b!88288 m!93853))

(declare-fun m!94331 () Bool)

(assert (=> b!88288 m!94331))

(declare-fun m!94333 () Bool)

(assert (=> bm!8498 m!94333))

(declare-fun m!94335 () Bool)

(assert (=> b!88287 m!94335))

(declare-fun m!94337 () Bool)

(assert (=> bm!8495 m!94337))

(assert (=> b!88279 m!93853))

(assert (=> b!88279 m!93853))

(assert (=> b!88279 m!93863))

(assert (=> b!88283 m!93853))

(assert (=> b!88283 m!93853))

(assert (=> b!88283 m!93863))

(declare-fun m!94339 () Bool)

(assert (=> bm!8492 m!94339))

(assert (=> b!88290 m!93867))

(assert (=> b!88290 m!93853))

(declare-fun m!94341 () Bool)

(assert (=> b!88290 m!94341))

(declare-fun m!94343 () Bool)

(assert (=> b!88290 m!94343))

(assert (=> b!88290 m!93853))

(assert (=> b!88290 m!94343))

(assert (=> b!88290 m!93867))

(declare-fun m!94345 () Bool)

(assert (=> b!88290 m!94345))

(declare-fun m!94347 () Bool)

(assert (=> b!88285 m!94347))

(declare-fun m!94349 () Bool)

(assert (=> b!88285 m!94349))

(declare-fun m!94351 () Bool)

(assert (=> b!88285 m!94351))

(declare-fun m!94353 () Bool)

(assert (=> b!88285 m!94353))

(declare-fun m!94355 () Bool)

(assert (=> b!88285 m!94355))

(assert (=> b!88285 m!94347))

(declare-fun m!94357 () Bool)

(assert (=> b!88285 m!94357))

(declare-fun m!94359 () Bool)

(assert (=> b!88285 m!94359))

(declare-fun m!94361 () Bool)

(assert (=> b!88285 m!94361))

(declare-fun m!94363 () Bool)

(assert (=> b!88285 m!94363))

(assert (=> b!88285 m!93853))

(declare-fun m!94365 () Bool)

(assert (=> b!88285 m!94365))

(declare-fun m!94367 () Bool)

(assert (=> b!88285 m!94367))

(assert (=> b!88285 m!94357))

(declare-fun m!94369 () Bool)

(assert (=> b!88285 m!94369))

(assert (=> b!88285 m!94351))

(declare-fun m!94371 () Bool)

(assert (=> b!88285 m!94371))

(declare-fun m!94373 () Bool)

(assert (=> b!88285 m!94373))

(assert (=> b!88285 m!94369))

(declare-fun m!94375 () Bool)

(assert (=> b!88285 m!94375))

(declare-fun m!94377 () Bool)

(assert (=> b!88285 m!94377))

(assert (=> d!23467 m!93743))

(declare-fun m!94379 () Bool)

(assert (=> b!88274 m!94379))

(assert (=> bm!8497 m!94367))

(declare-fun m!94381 () Bool)

(assert (=> b!88278 m!94381))

(assert (=> b!87930 d!23467))

(declare-fun d!23469 () Bool)

(declare-fun e!57508 () Bool)

(assert (=> d!23469 e!57508))

(declare-fun res!45250 () Bool)

(assert (=> d!23469 (=> (not res!45250) (not e!57508))))

(assert (=> d!23469 (= res!45250 (and (bvsge (index!3127 lt!41916) #b00000000000000000000000000000000) (bvslt (index!3127 lt!41916) (size!2159 (_values!2341 newMap!16)))))))

(declare-fun lt!42220 () Unit!2598)

(declare-fun choose!529 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2598)

(assert (=> d!23469 (= lt!42220 (choose!529 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (defaultEntry!2358 newMap!16)))))

(assert (=> d!23469 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23469 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3127 lt!41916) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566 (defaultEntry!2358 newMap!16)) lt!42220)))

(declare-fun b!88297 () Bool)

(assert (=> b!88297 (= e!57508 (= (+!110 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)) (getCurrentListMap!427 (_keys!4033 newMap!16) (array!4022 (store (arr!1913 (_values!2341 newMap!16)) (index!3127 lt!41916) (ValueCellFull!926 lt!41566)) (size!2159 (_values!2341 newMap!16))) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))))))

(assert (= (and d!23469 res!45250) b!88297))

(assert (=> d!23469 m!93253))

(declare-fun m!94383 () Bool)

(assert (=> d!23469 m!94383))

(assert (=> d!23469 m!93743))

(assert (=> b!88297 m!93597))

(assert (=> b!88297 m!93597))

(assert (=> b!88297 m!94251))

(assert (=> b!88297 m!93675))

(assert (=> b!88297 m!93683))

(assert (=> b!87930 d!23469))

(declare-fun d!23471 () Bool)

(declare-fun e!57510 () Bool)

(assert (=> d!23471 e!57510))

(declare-fun res!45251 () Bool)

(assert (=> d!23471 (=> res!45251 e!57510)))

(declare-fun lt!42222 () Bool)

(assert (=> d!23471 (= res!45251 (not lt!42222))))

(declare-fun lt!42221 () Bool)

(assert (=> d!23471 (= lt!42222 lt!42221)))

(declare-fun lt!42223 () Unit!2598)

(declare-fun e!57509 () Unit!2598)

(assert (=> d!23471 (= lt!42223 e!57509)))

(declare-fun c!14590 () Bool)

(assert (=> d!23471 (= c!14590 lt!42221)))

(assert (=> d!23471 (= lt!42221 (containsKey!143 (toList!742 call!8440) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23471 (= (contains!755 call!8440 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) lt!42222)))

(declare-fun b!88298 () Bool)

(declare-fun lt!42224 () Unit!2598)

(assert (=> b!88298 (= e!57509 lt!42224)))

(assert (=> b!88298 (= lt!42224 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 call!8440) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> b!88298 (isDefined!93 (getValueByKey!139 (toList!742 call!8440) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88299 () Bool)

(declare-fun Unit!2624 () Unit!2598)

(assert (=> b!88299 (= e!57509 Unit!2624)))

(declare-fun b!88300 () Bool)

(assert (=> b!88300 (= e!57510 (isDefined!93 (getValueByKey!139 (toList!742 call!8440) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (= (and d!23471 c!14590) b!88298))

(assert (= (and d!23471 (not c!14590)) b!88299))

(assert (= (and d!23471 (not res!45251)) b!88300))

(assert (=> d!23471 m!93253))

(declare-fun m!94385 () Bool)

(assert (=> d!23471 m!94385))

(assert (=> b!88298 m!93253))

(declare-fun m!94387 () Bool)

(assert (=> b!88298 m!94387))

(assert (=> b!88298 m!93253))

(declare-fun m!94389 () Bool)

(assert (=> b!88298 m!94389))

(assert (=> b!88298 m!94389))

(declare-fun m!94391 () Bool)

(assert (=> b!88298 m!94391))

(assert (=> b!88300 m!93253))

(assert (=> b!88300 m!94389))

(assert (=> b!88300 m!94389))

(assert (=> b!88300 m!94391))

(assert (=> b!87930 d!23471))

(declare-fun d!23473 () Bool)

(declare-fun e!57512 () Bool)

(assert (=> d!23473 e!57512))

(declare-fun res!45252 () Bool)

(assert (=> d!23473 (=> res!45252 e!57512)))

(declare-fun lt!42226 () Bool)

(assert (=> d!23473 (= res!45252 (not lt!42226))))

(declare-fun lt!42225 () Bool)

(assert (=> d!23473 (= lt!42226 lt!42225)))

(declare-fun lt!42227 () Unit!2598)

(declare-fun e!57511 () Unit!2598)

(assert (=> d!23473 (= lt!42227 e!57511)))

(declare-fun c!14591 () Bool)

(assert (=> d!23473 (= c!14591 lt!42225)))

(assert (=> d!23473 (= lt!42225 (containsKey!143 (toList!742 lt!41814) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23473 (= (contains!755 lt!41814 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42226)))

(declare-fun b!88301 () Bool)

(declare-fun lt!42228 () Unit!2598)

(assert (=> b!88301 (= e!57511 lt!42228)))

(assert (=> b!88301 (= lt!42228 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41814) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88301 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88302 () Bool)

(declare-fun Unit!2625 () Unit!2598)

(assert (=> b!88302 (= e!57511 Unit!2625)))

(declare-fun b!88303 () Bool)

(assert (=> b!88303 (= e!57512 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23473 c!14591) b!88301))

(assert (= (and d!23473 (not c!14591)) b!88302))

(assert (= (and d!23473 (not res!45252)) b!88303))

(assert (=> d!23473 m!93497))

(declare-fun m!94393 () Bool)

(assert (=> d!23473 m!94393))

(assert (=> b!88301 m!93497))

(declare-fun m!94395 () Bool)

(assert (=> b!88301 m!94395))

(assert (=> b!88301 m!93497))

(declare-fun m!94397 () Bool)

(assert (=> b!88301 m!94397))

(assert (=> b!88301 m!94397))

(declare-fun m!94399 () Bool)

(assert (=> b!88301 m!94399))

(assert (=> b!88303 m!93497))

(assert (=> b!88303 m!94397))

(assert (=> b!88303 m!94397))

(assert (=> b!88303 m!94399))

(assert (=> b!87811 d!23473))

(declare-fun d!23475 () Bool)

(declare-fun e!57514 () Bool)

(assert (=> d!23475 e!57514))

(declare-fun res!45253 () Bool)

(assert (=> d!23475 (=> res!45253 e!57514)))

(declare-fun lt!42230 () Bool)

(assert (=> d!23475 (= res!45253 (not lt!42230))))

(declare-fun lt!42229 () Bool)

(assert (=> d!23475 (= lt!42230 lt!42229)))

(declare-fun lt!42231 () Unit!2598)

(declare-fun e!57513 () Unit!2598)

(assert (=> d!23475 (= lt!42231 e!57513)))

(declare-fun c!14592 () Bool)

(assert (=> d!23475 (= c!14592 lt!42229)))

(assert (=> d!23475 (= lt!42229 (containsKey!143 (toList!742 lt!41742) (_1!1116 lt!41556)))))

(assert (=> d!23475 (= (contains!755 lt!41742 (_1!1116 lt!41556)) lt!42230)))

(declare-fun b!88304 () Bool)

(declare-fun lt!42232 () Unit!2598)

(assert (=> b!88304 (= e!57513 lt!42232)))

(assert (=> b!88304 (= lt!42232 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41742) (_1!1116 lt!41556)))))

(assert (=> b!88304 (isDefined!93 (getValueByKey!139 (toList!742 lt!41742) (_1!1116 lt!41556)))))

(declare-fun b!88305 () Bool)

(declare-fun Unit!2626 () Unit!2598)

(assert (=> b!88305 (= e!57513 Unit!2626)))

(declare-fun b!88306 () Bool)

(assert (=> b!88306 (= e!57514 (isDefined!93 (getValueByKey!139 (toList!742 lt!41742) (_1!1116 lt!41556))))))

(assert (= (and d!23475 c!14592) b!88304))

(assert (= (and d!23475 (not c!14592)) b!88305))

(assert (= (and d!23475 (not res!45253)) b!88306))

(declare-fun m!94401 () Bool)

(assert (=> d!23475 m!94401))

(declare-fun m!94403 () Bool)

(assert (=> b!88304 m!94403))

(assert (=> b!88304 m!93565))

(assert (=> b!88304 m!93565))

(declare-fun m!94405 () Bool)

(assert (=> b!88304 m!94405))

(assert (=> b!88306 m!93565))

(assert (=> b!88306 m!93565))

(assert (=> b!88306 m!94405))

(assert (=> d!23297 d!23475))

(declare-fun b!88308 () Bool)

(declare-fun e!57515 () Option!145)

(declare-fun e!57516 () Option!145)

(assert (=> b!88308 (= e!57515 e!57516)))

(declare-fun c!14594 () Bool)

(assert (=> b!88308 (= c!14594 (and ((_ is Cons!1526) lt!41741) (not (= (_1!1116 (h!2118 lt!41741)) (_1!1116 lt!41556)))))))

(declare-fun d!23477 () Bool)

(declare-fun c!14593 () Bool)

(assert (=> d!23477 (= c!14593 (and ((_ is Cons!1526) lt!41741) (= (_1!1116 (h!2118 lt!41741)) (_1!1116 lt!41556))))))

(assert (=> d!23477 (= (getValueByKey!139 lt!41741 (_1!1116 lt!41556)) e!57515)))

(declare-fun b!88309 () Bool)

(assert (=> b!88309 (= e!57516 (getValueByKey!139 (t!5263 lt!41741) (_1!1116 lt!41556)))))

(declare-fun b!88307 () Bool)

(assert (=> b!88307 (= e!57515 (Some!144 (_2!1116 (h!2118 lt!41741))))))

(declare-fun b!88310 () Bool)

(assert (=> b!88310 (= e!57516 None!143)))

(assert (= (and d!23477 c!14593) b!88307))

(assert (= (and d!23477 (not c!14593)) b!88308))

(assert (= (and b!88308 c!14594) b!88309))

(assert (= (and b!88308 (not c!14594)) b!88310))

(declare-fun m!94407 () Bool)

(assert (=> b!88309 m!94407))

(assert (=> d!23297 d!23477))

(declare-fun d!23479 () Bool)

(assert (=> d!23479 (= (getValueByKey!139 lt!41741 (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556)))))

(declare-fun lt!42233 () Unit!2598)

(assert (=> d!23479 (= lt!42233 (choose!525 lt!41741 (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(declare-fun e!57517 () Bool)

(assert (=> d!23479 e!57517))

(declare-fun res!45254 () Bool)

(assert (=> d!23479 (=> (not res!45254) (not e!57517))))

(assert (=> d!23479 (= res!45254 (isStrictlySorted!294 lt!41741))))

(assert (=> d!23479 (= (lemmaContainsTupThenGetReturnValue!59 lt!41741 (_1!1116 lt!41556) (_2!1116 lt!41556)) lt!42233)))

(declare-fun b!88311 () Bool)

(declare-fun res!45255 () Bool)

(assert (=> b!88311 (=> (not res!45255) (not e!57517))))

(assert (=> b!88311 (= res!45255 (containsKey!143 lt!41741 (_1!1116 lt!41556)))))

(declare-fun b!88312 () Bool)

(assert (=> b!88312 (= e!57517 (contains!757 lt!41741 (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556))))))

(assert (= (and d!23479 res!45254) b!88311))

(assert (= (and b!88311 res!45255) b!88312))

(assert (=> d!23479 m!93559))

(declare-fun m!94409 () Bool)

(assert (=> d!23479 m!94409))

(declare-fun m!94411 () Bool)

(assert (=> d!23479 m!94411))

(declare-fun m!94413 () Bool)

(assert (=> b!88311 m!94413))

(declare-fun m!94415 () Bool)

(assert (=> b!88312 m!94415))

(assert (=> d!23297 d!23479))

(declare-fun b!88313 () Bool)

(declare-fun res!45256 () Bool)

(declare-fun e!57521 () Bool)

(assert (=> b!88313 (=> (not res!45256) (not e!57521))))

(declare-fun lt!42234 () List!1530)

(assert (=> b!88313 (= res!45256 (containsKey!143 lt!42234 (_1!1116 lt!41556)))))

(declare-fun bm!8499 () Bool)

(declare-fun c!14595 () Bool)

(declare-fun call!8503 () List!1530)

(declare-fun e!57518 () List!1530)

(assert (=> bm!8499 (= call!8503 ($colon$colon!72 e!57518 (ite c!14595 (h!2118 (toList!742 lt!41569)) (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556)))))))

(declare-fun c!14598 () Bool)

(assert (=> bm!8499 (= c!14598 c!14595)))

(declare-fun b!88314 () Bool)

(declare-fun c!14596 () Bool)

(declare-fun c!14597 () Bool)

(assert (=> b!88314 (= e!57518 (ite c!14596 (t!5263 (toList!742 lt!41569)) (ite c!14597 (Cons!1526 (h!2118 (toList!742 lt!41569)) (t!5263 (toList!742 lt!41569))) Nil!1527)))))

(declare-fun b!88315 () Bool)

(assert (=> b!88315 (= e!57521 (contains!757 lt!42234 (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556))))))

(declare-fun b!88316 () Bool)

(declare-fun e!57522 () List!1530)

(declare-fun e!57520 () List!1530)

(assert (=> b!88316 (= e!57522 e!57520)))

(assert (=> b!88316 (= c!14596 (and ((_ is Cons!1526) (toList!742 lt!41569)) (= (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41556))))))

(declare-fun b!88318 () Bool)

(assert (=> b!88318 (= e!57522 call!8503)))

(declare-fun b!88319 () Bool)

(declare-fun call!8502 () List!1530)

(assert (=> b!88319 (= e!57520 call!8502)))

(declare-fun b!88320 () Bool)

(assert (=> b!88320 (= c!14597 (and ((_ is Cons!1526) (toList!742 lt!41569)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41556))))))

(declare-fun e!57519 () List!1530)

(assert (=> b!88320 (= e!57520 e!57519)))

(declare-fun bm!8500 () Bool)

(declare-fun call!8504 () List!1530)

(assert (=> bm!8500 (= call!8504 call!8502)))

(declare-fun bm!8501 () Bool)

(assert (=> bm!8501 (= call!8502 call!8503)))

(declare-fun b!88321 () Bool)

(assert (=> b!88321 (= e!57519 call!8504)))

(declare-fun b!88322 () Bool)

(assert (=> b!88322 (= e!57519 call!8504)))

(declare-fun d!23481 () Bool)

(assert (=> d!23481 e!57521))

(declare-fun res!45257 () Bool)

(assert (=> d!23481 (=> (not res!45257) (not e!57521))))

(assert (=> d!23481 (= res!45257 (isStrictlySorted!294 lt!42234))))

(assert (=> d!23481 (= lt!42234 e!57522)))

(assert (=> d!23481 (= c!14595 (and ((_ is Cons!1526) (toList!742 lt!41569)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41556))))))

(assert (=> d!23481 (isStrictlySorted!294 (toList!742 lt!41569))))

(assert (=> d!23481 (= (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 lt!41556) (_2!1116 lt!41556)) lt!42234)))

(declare-fun b!88317 () Bool)

(assert (=> b!88317 (= e!57518 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41569)) (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (= (and d!23481 c!14595) b!88318))

(assert (= (and d!23481 (not c!14595)) b!88316))

(assert (= (and b!88316 c!14596) b!88319))

(assert (= (and b!88316 (not c!14596)) b!88320))

(assert (= (and b!88320 c!14597) b!88321))

(assert (= (and b!88320 (not c!14597)) b!88322))

(assert (= (or b!88321 b!88322) bm!8500))

(assert (= (or b!88319 bm!8500) bm!8501))

(assert (= (or b!88318 bm!8501) bm!8499))

(assert (= (and bm!8499 c!14598) b!88317))

(assert (= (and bm!8499 (not c!14598)) b!88314))

(assert (= (and d!23481 res!45257) b!88313))

(assert (= (and b!88313 res!45256) b!88315))

(declare-fun m!94417 () Bool)

(assert (=> d!23481 m!94417))

(declare-fun m!94419 () Bool)

(assert (=> d!23481 m!94419))

(declare-fun m!94421 () Bool)

(assert (=> b!88313 m!94421))

(declare-fun m!94423 () Bool)

(assert (=> bm!8499 m!94423))

(declare-fun m!94425 () Bool)

(assert (=> b!88317 m!94425))

(declare-fun m!94427 () Bool)

(assert (=> b!88315 m!94427))

(assert (=> d!23297 d!23481))

(declare-fun d!23483 () Bool)

(declare-fun res!45262 () Bool)

(declare-fun e!57527 () Bool)

(assert (=> d!23483 (=> res!45262 e!57527)))

(assert (=> d!23483 (= res!45262 (and ((_ is Cons!1526) (toList!742 lt!41555)) (= (_1!1116 (h!2118 (toList!742 lt!41555))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (=> d!23483 (= (containsKey!143 (toList!742 lt!41555) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) e!57527)))

(declare-fun b!88327 () Bool)

(declare-fun e!57528 () Bool)

(assert (=> b!88327 (= e!57527 e!57528)))

(declare-fun res!45263 () Bool)

(assert (=> b!88327 (=> (not res!45263) (not e!57528))))

(assert (=> b!88327 (= res!45263 (and (or (not ((_ is Cons!1526) (toList!742 lt!41555))) (bvsle (_1!1116 (h!2118 (toList!742 lt!41555))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))) ((_ is Cons!1526) (toList!742 lt!41555)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41555))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(declare-fun b!88328 () Bool)

(assert (=> b!88328 (= e!57528 (containsKey!143 (t!5263 (toList!742 lt!41555)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (= (and d!23483 (not res!45262)) b!88327))

(assert (= (and b!88327 res!45263) b!88328))

(assert (=> b!88328 m!93253))

(declare-fun m!94429 () Bool)

(assert (=> b!88328 m!94429))

(assert (=> d!23327 d!23483))

(assert (=> d!23319 d!23325))

(declare-fun d!23485 () Bool)

(assert (=> d!23485 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) from!355 Nil!1528)))

(assert (=> d!23485 true))

(declare-fun _$71!117 () Unit!2598)

(assert (=> d!23485 (= (choose!39 (_keys!4033 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!117)))

(declare-fun bs!3727 () Bool)

(assert (= bs!3727 d!23485))

(assert (=> bs!3727 m!93299))

(assert (=> d!23319 d!23485))

(declare-fun d!23487 () Bool)

(declare-fun e!57530 () Bool)

(assert (=> d!23487 e!57530))

(declare-fun res!45264 () Bool)

(assert (=> d!23487 (=> res!45264 e!57530)))

(declare-fun lt!42236 () Bool)

(assert (=> d!23487 (= res!45264 (not lt!42236))))

(declare-fun lt!42235 () Bool)

(assert (=> d!23487 (= lt!42236 lt!42235)))

(declare-fun lt!42237 () Unit!2598)

(declare-fun e!57529 () Unit!2598)

(assert (=> d!23487 (= lt!42237 e!57529)))

(declare-fun c!14599 () Bool)

(assert (=> d!23487 (= c!14599 lt!42235)))

(assert (=> d!23487 (= lt!42235 (containsKey!143 (toList!742 lt!41734) (_1!1116 lt!41556)))))

(assert (=> d!23487 (= (contains!755 lt!41734 (_1!1116 lt!41556)) lt!42236)))

(declare-fun b!88329 () Bool)

(declare-fun lt!42238 () Unit!2598)

(assert (=> b!88329 (= e!57529 lt!42238)))

(assert (=> b!88329 (= lt!42238 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41734) (_1!1116 lt!41556)))))

(assert (=> b!88329 (isDefined!93 (getValueByKey!139 (toList!742 lt!41734) (_1!1116 lt!41556)))))

(declare-fun b!88330 () Bool)

(declare-fun Unit!2627 () Unit!2598)

(assert (=> b!88330 (= e!57529 Unit!2627)))

(declare-fun b!88331 () Bool)

(assert (=> b!88331 (= e!57530 (isDefined!93 (getValueByKey!139 (toList!742 lt!41734) (_1!1116 lt!41556))))))

(assert (= (and d!23487 c!14599) b!88329))

(assert (= (and d!23487 (not c!14599)) b!88330))

(assert (= (and d!23487 (not res!45264)) b!88331))

(declare-fun m!94431 () Bool)

(assert (=> d!23487 m!94431))

(declare-fun m!94433 () Bool)

(assert (=> b!88329 m!94433))

(assert (=> b!88329 m!93541))

(assert (=> b!88329 m!93541))

(declare-fun m!94435 () Bool)

(assert (=> b!88329 m!94435))

(assert (=> b!88331 m!93541))

(assert (=> b!88331 m!93541))

(assert (=> b!88331 m!94435))

(assert (=> d!23293 d!23487))

(declare-fun b!88333 () Bool)

(declare-fun e!57531 () Option!145)

(declare-fun e!57532 () Option!145)

(assert (=> b!88333 (= e!57531 e!57532)))

(declare-fun c!14601 () Bool)

(assert (=> b!88333 (= c!14601 (and ((_ is Cons!1526) lt!41733) (not (= (_1!1116 (h!2118 lt!41733)) (_1!1116 lt!41556)))))))

(declare-fun d!23489 () Bool)

(declare-fun c!14600 () Bool)

(assert (=> d!23489 (= c!14600 (and ((_ is Cons!1526) lt!41733) (= (_1!1116 (h!2118 lt!41733)) (_1!1116 lt!41556))))))

(assert (=> d!23489 (= (getValueByKey!139 lt!41733 (_1!1116 lt!41556)) e!57531)))

(declare-fun b!88334 () Bool)

(assert (=> b!88334 (= e!57532 (getValueByKey!139 (t!5263 lt!41733) (_1!1116 lt!41556)))))

(declare-fun b!88332 () Bool)

(assert (=> b!88332 (= e!57531 (Some!144 (_2!1116 (h!2118 lt!41733))))))

(declare-fun b!88335 () Bool)

(assert (=> b!88335 (= e!57532 None!143)))

(assert (= (and d!23489 c!14600) b!88332))

(assert (= (and d!23489 (not c!14600)) b!88333))

(assert (= (and b!88333 c!14601) b!88334))

(assert (= (and b!88333 (not c!14601)) b!88335))

(declare-fun m!94437 () Bool)

(assert (=> b!88334 m!94437))

(assert (=> d!23293 d!23489))

(declare-fun d!23491 () Bool)

(assert (=> d!23491 (= (getValueByKey!139 lt!41733 (_1!1116 lt!41556)) (Some!144 (_2!1116 lt!41556)))))

(declare-fun lt!42239 () Unit!2598)

(assert (=> d!23491 (= lt!42239 (choose!525 lt!41733 (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(declare-fun e!57533 () Bool)

(assert (=> d!23491 e!57533))

(declare-fun res!45265 () Bool)

(assert (=> d!23491 (=> (not res!45265) (not e!57533))))

(assert (=> d!23491 (= res!45265 (isStrictlySorted!294 lt!41733))))

(assert (=> d!23491 (= (lemmaContainsTupThenGetReturnValue!59 lt!41733 (_1!1116 lt!41556) (_2!1116 lt!41556)) lt!42239)))

(declare-fun b!88336 () Bool)

(declare-fun res!45266 () Bool)

(assert (=> b!88336 (=> (not res!45266) (not e!57533))))

(assert (=> b!88336 (= res!45266 (containsKey!143 lt!41733 (_1!1116 lt!41556)))))

(declare-fun b!88337 () Bool)

(assert (=> b!88337 (= e!57533 (contains!757 lt!41733 (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556))))))

(assert (= (and d!23491 res!45265) b!88336))

(assert (= (and b!88336 res!45266) b!88337))

(assert (=> d!23491 m!93535))

(declare-fun m!94439 () Bool)

(assert (=> d!23491 m!94439))

(declare-fun m!94441 () Bool)

(assert (=> d!23491 m!94441))

(declare-fun m!94443 () Bool)

(assert (=> b!88336 m!94443))

(declare-fun m!94445 () Bool)

(assert (=> b!88337 m!94445))

(assert (=> d!23293 d!23491))

(declare-fun b!88338 () Bool)

(declare-fun res!45267 () Bool)

(declare-fun e!57537 () Bool)

(assert (=> b!88338 (=> (not res!45267) (not e!57537))))

(declare-fun lt!42240 () List!1530)

(assert (=> b!88338 (= res!45267 (containsKey!143 lt!42240 (_1!1116 lt!41556)))))

(declare-fun bm!8502 () Bool)

(declare-fun e!57534 () List!1530)

(declare-fun call!8506 () List!1530)

(declare-fun c!14602 () Bool)

(assert (=> bm!8502 (= call!8506 ($colon$colon!72 e!57534 (ite c!14602 (h!2118 (toList!742 lt!41563)) (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556)))))))

(declare-fun c!14605 () Bool)

(assert (=> bm!8502 (= c!14605 c!14602)))

(declare-fun c!14604 () Bool)

(declare-fun b!88339 () Bool)

(declare-fun c!14603 () Bool)

(assert (=> b!88339 (= e!57534 (ite c!14603 (t!5263 (toList!742 lt!41563)) (ite c!14604 (Cons!1526 (h!2118 (toList!742 lt!41563)) (t!5263 (toList!742 lt!41563))) Nil!1527)))))

(declare-fun b!88340 () Bool)

(assert (=> b!88340 (= e!57537 (contains!757 lt!42240 (tuple2!2211 (_1!1116 lt!41556) (_2!1116 lt!41556))))))

(declare-fun b!88341 () Bool)

(declare-fun e!57538 () List!1530)

(declare-fun e!57536 () List!1530)

(assert (=> b!88341 (= e!57538 e!57536)))

(assert (=> b!88341 (= c!14603 (and ((_ is Cons!1526) (toList!742 lt!41563)) (= (_1!1116 (h!2118 (toList!742 lt!41563))) (_1!1116 lt!41556))))))

(declare-fun b!88343 () Bool)

(assert (=> b!88343 (= e!57538 call!8506)))

(declare-fun b!88344 () Bool)

(declare-fun call!8505 () List!1530)

(assert (=> b!88344 (= e!57536 call!8505)))

(declare-fun b!88345 () Bool)

(assert (=> b!88345 (= c!14604 (and ((_ is Cons!1526) (toList!742 lt!41563)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41563))) (_1!1116 lt!41556))))))

(declare-fun e!57535 () List!1530)

(assert (=> b!88345 (= e!57536 e!57535)))

(declare-fun bm!8503 () Bool)

(declare-fun call!8507 () List!1530)

(assert (=> bm!8503 (= call!8507 call!8505)))

(declare-fun bm!8504 () Bool)

(assert (=> bm!8504 (= call!8505 call!8506)))

(declare-fun b!88346 () Bool)

(assert (=> b!88346 (= e!57535 call!8507)))

(declare-fun b!88347 () Bool)

(assert (=> b!88347 (= e!57535 call!8507)))

(declare-fun d!23493 () Bool)

(assert (=> d!23493 e!57537))

(declare-fun res!45268 () Bool)

(assert (=> d!23493 (=> (not res!45268) (not e!57537))))

(assert (=> d!23493 (= res!45268 (isStrictlySorted!294 lt!42240))))

(assert (=> d!23493 (= lt!42240 e!57538)))

(assert (=> d!23493 (= c!14602 (and ((_ is Cons!1526) (toList!742 lt!41563)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41563))) (_1!1116 lt!41556))))))

(assert (=> d!23493 (isStrictlySorted!294 (toList!742 lt!41563))))

(assert (=> d!23493 (= (insertStrictlySorted!62 (toList!742 lt!41563) (_1!1116 lt!41556) (_2!1116 lt!41556)) lt!42240)))

(declare-fun b!88342 () Bool)

(assert (=> b!88342 (= e!57534 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41563)) (_1!1116 lt!41556) (_2!1116 lt!41556)))))

(assert (= (and d!23493 c!14602) b!88343))

(assert (= (and d!23493 (not c!14602)) b!88341))

(assert (= (and b!88341 c!14603) b!88344))

(assert (= (and b!88341 (not c!14603)) b!88345))

(assert (= (and b!88345 c!14604) b!88346))

(assert (= (and b!88345 (not c!14604)) b!88347))

(assert (= (or b!88346 b!88347) bm!8503))

(assert (= (or b!88344 bm!8503) bm!8504))

(assert (= (or b!88343 bm!8504) bm!8502))

(assert (= (and bm!8502 c!14605) b!88342))

(assert (= (and bm!8502 (not c!14605)) b!88339))

(assert (= (and d!23493 res!45268) b!88338))

(assert (= (and b!88338 res!45267) b!88340))

(declare-fun m!94447 () Bool)

(assert (=> d!23493 m!94447))

(declare-fun m!94449 () Bool)

(assert (=> d!23493 m!94449))

(declare-fun m!94451 () Bool)

(assert (=> b!88338 m!94451))

(declare-fun m!94453 () Bool)

(assert (=> bm!8502 m!94453))

(declare-fun m!94455 () Bool)

(assert (=> b!88342 m!94455))

(declare-fun m!94457 () Bool)

(assert (=> b!88340 m!94457))

(assert (=> d!23293 d!23493))

(declare-fun b!88348 () Bool)

(declare-fun e!57548 () Bool)

(declare-fun lt!42260 () ListLongMap!1453)

(assert (=> b!88348 (= e!57548 (= (apply!83 lt!42260 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 newMap!16)))))

(declare-fun b!88349 () Bool)

(declare-fun e!57540 () Bool)

(declare-fun e!57549 () Bool)

(assert (=> b!88349 (= e!57540 e!57549)))

(declare-fun res!45269 () Bool)

(declare-fun call!8514 () Bool)

(assert (=> b!88349 (= res!45269 call!8514)))

(assert (=> b!88349 (=> (not res!45269) (not e!57549))))

(declare-fun call!8509 () ListLongMap!1453)

(declare-fun c!14610 () Bool)

(declare-fun call!8513 () ListLongMap!1453)

(declare-fun call!8508 () ListLongMap!1453)

(declare-fun c!14608 () Bool)

(declare-fun call!8510 () ListLongMap!1453)

(declare-fun bm!8505 () Bool)

(assert (=> bm!8505 (= call!8508 (+!110 (ite c!14610 call!8513 (ite c!14608 call!8510 call!8509)) (ite (or c!14610 c!14608) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16))))))))

(declare-fun b!88350 () Bool)

(declare-fun res!45271 () Bool)

(declare-fun e!57551 () Bool)

(assert (=> b!88350 (=> (not res!45271) (not e!57551))))

(declare-fun e!57550 () Bool)

(assert (=> b!88350 (= res!45271 e!57550)))

(declare-fun res!45277 () Bool)

(assert (=> b!88350 (=> res!45277 e!57550)))

(declare-fun e!57544 () Bool)

(assert (=> b!88350 (= res!45277 (not e!57544))))

(declare-fun res!45274 () Bool)

(assert (=> b!88350 (=> (not res!45274) (not e!57544))))

(assert (=> b!88350 (= res!45274 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88351 () Bool)

(declare-fun e!57541 () Bool)

(assert (=> b!88351 (= e!57541 e!57548)))

(declare-fun res!45276 () Bool)

(declare-fun call!8512 () Bool)

(assert (=> b!88351 (= res!45276 call!8512)))

(assert (=> b!88351 (=> (not res!45276) (not e!57548))))

(declare-fun b!88352 () Bool)

(declare-fun e!57539 () ListLongMap!1453)

(assert (=> b!88352 (= e!57539 (+!110 call!8508 (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)))))))

(declare-fun bm!8506 () Bool)

(declare-fun call!8511 () ListLongMap!1453)

(assert (=> bm!8506 (= call!8511 call!8508)))

(declare-fun b!88353 () Bool)

(assert (=> b!88353 (= e!57544 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88354 () Bool)

(assert (=> b!88354 (= e!57540 (not call!8514))))

(declare-fun b!88355 () Bool)

(declare-fun e!57542 () ListLongMap!1453)

(assert (=> b!88355 (= e!57542 call!8509)))

(declare-fun c!14607 () Bool)

(declare-fun b!88356 () Bool)

(assert (=> b!88356 (= c!14607 (and (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57545 () ListLongMap!1453)

(assert (=> b!88356 (= e!57545 e!57542)))

(declare-fun bm!8507 () Bool)

(assert (=> bm!8507 (= call!8510 call!8513)))

(declare-fun b!88357 () Bool)

(declare-fun e!57543 () Bool)

(assert (=> b!88357 (= e!57543 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88358 () Bool)

(assert (=> b!88358 (= e!57551 e!57540)))

(declare-fun c!14609 () Bool)

(assert (=> b!88358 (= c!14609 (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88359 () Bool)

(declare-fun e!57546 () Unit!2598)

(declare-fun lt!42243 () Unit!2598)

(assert (=> b!88359 (= e!57546 lt!42243)))

(declare-fun lt!42242 () ListLongMap!1453)

(assert (=> b!88359 (= lt!42242 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42255 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42249 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42249 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42254 () Unit!2598)

(assert (=> b!88359 (= lt!42254 (addStillContains!59 lt!42242 lt!42255 (zeroValue!2248 newMap!16) lt!42249))))

(assert (=> b!88359 (contains!755 (+!110 lt!42242 (tuple2!2211 lt!42255 (zeroValue!2248 newMap!16))) lt!42249)))

(declare-fun lt!42252 () Unit!2598)

(assert (=> b!88359 (= lt!42252 lt!42254)))

(declare-fun lt!42247 () ListLongMap!1453)

(assert (=> b!88359 (= lt!42247 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42241 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42241 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42258 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42258 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42244 () Unit!2598)

(assert (=> b!88359 (= lt!42244 (addApplyDifferent!59 lt!42247 lt!42241 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) lt!42258))))

(assert (=> b!88359 (= (apply!83 (+!110 lt!42247 (tuple2!2211 lt!42241 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)))) lt!42258) (apply!83 lt!42247 lt!42258))))

(declare-fun lt!42246 () Unit!2598)

(assert (=> b!88359 (= lt!42246 lt!42244)))

(declare-fun lt!42257 () ListLongMap!1453)

(assert (=> b!88359 (= lt!42257 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42250 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42250 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42253 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42253 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42262 () Unit!2598)

(assert (=> b!88359 (= lt!42262 (addApplyDifferent!59 lt!42257 lt!42250 (zeroValue!2248 newMap!16) lt!42253))))

(assert (=> b!88359 (= (apply!83 (+!110 lt!42257 (tuple2!2211 lt!42250 (zeroValue!2248 newMap!16))) lt!42253) (apply!83 lt!42257 lt!42253))))

(declare-fun lt!42259 () Unit!2598)

(assert (=> b!88359 (= lt!42259 lt!42262)))

(declare-fun lt!42256 () ListLongMap!1453)

(assert (=> b!88359 (= lt!42256 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42251 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42245 () (_ BitVec 64))

(assert (=> b!88359 (= lt!42245 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88359 (= lt!42243 (addApplyDifferent!59 lt!42256 lt!42251 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) lt!42245))))

(assert (=> b!88359 (= (apply!83 (+!110 lt!42256 (tuple2!2211 lt!42251 (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)))) lt!42245) (apply!83 lt!42256 lt!42245))))

(declare-fun b!88360 () Bool)

(assert (=> b!88360 (= e!57545 call!8511)))

(declare-fun b!88361 () Bool)

(assert (=> b!88361 (= e!57549 (= (apply!83 lt!42260 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16))))))

(declare-fun b!88362 () Bool)

(declare-fun e!57547 () Bool)

(assert (=> b!88362 (= e!57550 e!57547)))

(declare-fun res!45272 () Bool)

(assert (=> b!88362 (=> (not res!45272) (not e!57547))))

(assert (=> b!88362 (= res!45272 (contains!755 lt!42260 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun d!23495 () Bool)

(assert (=> d!23495 e!57551))

(declare-fun res!45270 () Bool)

(assert (=> d!23495 (=> (not res!45270) (not e!57551))))

(assert (=> d!23495 (= res!45270 (or (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))))

(declare-fun lt!42261 () ListLongMap!1453)

(assert (=> d!23495 (= lt!42260 lt!42261)))

(declare-fun lt!42248 () Unit!2598)

(assert (=> d!23495 (= lt!42248 e!57546)))

(declare-fun c!14611 () Bool)

(assert (=> d!23495 (= c!14611 e!57543)))

(declare-fun res!45275 () Bool)

(assert (=> d!23495 (=> (not res!45275) (not e!57543))))

(assert (=> d!23495 (= res!45275 (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23495 (= lt!42261 e!57539)))

(assert (=> d!23495 (= c!14610 (and (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23495 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23495 (= (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42260)))

(declare-fun b!88363 () Bool)

(assert (=> b!88363 (= e!57539 e!57545)))

(assert (=> b!88363 (= c!14608 (and (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88364 () Bool)

(assert (=> b!88364 (= e!57547 (= (apply!83 lt!42260 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)) (get!1207 (select (arr!1913 (_values!2341 newMap!16)) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2159 (_values!2341 newMap!16))))))

(assert (=> b!88364 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88365 () Bool)

(declare-fun Unit!2628 () Unit!2598)

(assert (=> b!88365 (= e!57546 Unit!2628)))

(declare-fun bm!8508 () Bool)

(assert (=> bm!8508 (= call!8514 (contains!755 lt!42260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88366 () Bool)

(assert (=> b!88366 (= e!57542 call!8511)))

(declare-fun b!88367 () Bool)

(assert (=> b!88367 (= e!57541 (not call!8512))))

(declare-fun bm!8509 () Bool)

(assert (=> bm!8509 (= call!8509 call!8510)))

(declare-fun b!88368 () Bool)

(declare-fun res!45273 () Bool)

(assert (=> b!88368 (=> (not res!45273) (not e!57551))))

(assert (=> b!88368 (= res!45273 e!57541)))

(declare-fun c!14606 () Bool)

(assert (=> b!88368 (= c!14606 (not (= (bvand (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8510 () Bool)

(assert (=> bm!8510 (= call!8513 (getCurrentListMapNoExtraKeys!74 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (ite c!14505 (ite c!14502 (extraKeys!2193 newMap!16) lt!41897) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14505 (ite c!14502 (minValue!2248 newMap!16) lt!41566) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8511 () Bool)

(assert (=> bm!8511 (= call!8512 (contains!755 lt!42260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23495 c!14610) b!88352))

(assert (= (and d!23495 (not c!14610)) b!88363))

(assert (= (and b!88363 c!14608) b!88360))

(assert (= (and b!88363 (not c!14608)) b!88356))

(assert (= (and b!88356 c!14607) b!88366))

(assert (= (and b!88356 (not c!14607)) b!88355))

(assert (= (or b!88366 b!88355) bm!8509))

(assert (= (or b!88360 bm!8509) bm!8507))

(assert (= (or b!88360 b!88366) bm!8506))

(assert (= (or b!88352 bm!8507) bm!8510))

(assert (= (or b!88352 bm!8506) bm!8505))

(assert (= (and d!23495 res!45275) b!88357))

(assert (= (and d!23495 c!14611) b!88359))

(assert (= (and d!23495 (not c!14611)) b!88365))

(assert (= (and d!23495 res!45270) b!88350))

(assert (= (and b!88350 res!45274) b!88353))

(assert (= (and b!88350 (not res!45277)) b!88362))

(assert (= (and b!88362 res!45272) b!88364))

(assert (= (and b!88350 res!45271) b!88368))

(assert (= (and b!88368 c!14606) b!88351))

(assert (= (and b!88368 (not c!14606)) b!88367))

(assert (= (and b!88351 res!45276) b!88348))

(assert (= (or b!88351 b!88367) bm!8511))

(assert (= (and b!88368 res!45273) b!88358))

(assert (= (and b!88358 c!14609) b!88349))

(assert (= (and b!88358 (not c!14609)) b!88354))

(assert (= (and b!88349 res!45269) b!88361))

(assert (= (or b!88349 b!88354) bm!8508))

(declare-fun b_lambda!3909 () Bool)

(assert (=> (not b_lambda!3909) (not b!88364)))

(assert (=> b!88364 t!5277))

(declare-fun b_and!5317 () Bool)

(assert (= b_and!5313 (and (=> t!5277 result!2951) b_and!5317)))

(assert (=> b!88364 t!5279))

(declare-fun b_and!5319 () Bool)

(assert (= b_and!5315 (and (=> t!5279 result!2953) b_and!5319)))

(assert (=> b!88362 m!93853))

(assert (=> b!88362 m!93853))

(declare-fun m!94459 () Bool)

(assert (=> b!88362 m!94459))

(declare-fun m!94461 () Bool)

(assert (=> bm!8511 m!94461))

(declare-fun m!94463 () Bool)

(assert (=> b!88361 m!94463))

(declare-fun m!94465 () Bool)

(assert (=> bm!8508 m!94465))

(assert (=> b!88353 m!93853))

(assert (=> b!88353 m!93853))

(assert (=> b!88353 m!93863))

(assert (=> b!88357 m!93853))

(assert (=> b!88357 m!93853))

(assert (=> b!88357 m!93863))

(declare-fun m!94467 () Bool)

(assert (=> bm!8505 m!94467))

(assert (=> b!88364 m!93867))

(assert (=> b!88364 m!93853))

(declare-fun m!94469 () Bool)

(assert (=> b!88364 m!94469))

(assert (=> b!88364 m!93931))

(assert (=> b!88364 m!93853))

(assert (=> b!88364 m!93931))

(assert (=> b!88364 m!93867))

(assert (=> b!88364 m!93933))

(declare-fun m!94471 () Bool)

(assert (=> b!88359 m!94471))

(declare-fun m!94473 () Bool)

(assert (=> b!88359 m!94473))

(declare-fun m!94475 () Bool)

(assert (=> b!88359 m!94475))

(declare-fun m!94477 () Bool)

(assert (=> b!88359 m!94477))

(declare-fun m!94479 () Bool)

(assert (=> b!88359 m!94479))

(assert (=> b!88359 m!94471))

(declare-fun m!94481 () Bool)

(assert (=> b!88359 m!94481))

(declare-fun m!94483 () Bool)

(assert (=> b!88359 m!94483))

(declare-fun m!94485 () Bool)

(assert (=> b!88359 m!94485))

(declare-fun m!94487 () Bool)

(assert (=> b!88359 m!94487))

(assert (=> b!88359 m!93853))

(declare-fun m!94489 () Bool)

(assert (=> b!88359 m!94489))

(declare-fun m!94491 () Bool)

(assert (=> b!88359 m!94491))

(assert (=> b!88359 m!94481))

(declare-fun m!94493 () Bool)

(assert (=> b!88359 m!94493))

(assert (=> b!88359 m!94475))

(declare-fun m!94495 () Bool)

(assert (=> b!88359 m!94495))

(declare-fun m!94497 () Bool)

(assert (=> b!88359 m!94497))

(assert (=> b!88359 m!94493))

(declare-fun m!94499 () Bool)

(assert (=> b!88359 m!94499))

(declare-fun m!94501 () Bool)

(assert (=> b!88359 m!94501))

(assert (=> d!23495 m!93743))

(declare-fun m!94503 () Bool)

(assert (=> b!88348 m!94503))

(assert (=> bm!8510 m!94491))

(declare-fun m!94505 () Bool)

(assert (=> b!88352 m!94505))

(assert (=> bm!8450 d!23495))

(declare-fun d!23497 () Bool)

(declare-fun lt!42263 () Bool)

(assert (=> d!23497 (= lt!42263 (select (content!92 (toList!742 lt!41704)) lt!41572))))

(declare-fun e!57553 () Bool)

(assert (=> d!23497 (= lt!42263 e!57553)))

(declare-fun res!45279 () Bool)

(assert (=> d!23497 (=> (not res!45279) (not e!57553))))

(assert (=> d!23497 (= res!45279 ((_ is Cons!1526) (toList!742 lt!41704)))))

(assert (=> d!23497 (= (contains!757 (toList!742 lt!41704) lt!41572) lt!42263)))

(declare-fun b!88369 () Bool)

(declare-fun e!57552 () Bool)

(assert (=> b!88369 (= e!57553 e!57552)))

(declare-fun res!45278 () Bool)

(assert (=> b!88369 (=> res!45278 e!57552)))

(assert (=> b!88369 (= res!45278 (= (h!2118 (toList!742 lt!41704)) lt!41572))))

(declare-fun b!88370 () Bool)

(assert (=> b!88370 (= e!57552 (contains!757 (t!5263 (toList!742 lt!41704)) lt!41572))))

(assert (= (and d!23497 res!45279) b!88369))

(assert (= (and b!88369 (not res!45278)) b!88370))

(declare-fun m!94507 () Bool)

(assert (=> d!23497 m!94507))

(declare-fun m!94509 () Bool)

(assert (=> d!23497 m!94509))

(declare-fun m!94511 () Bool)

(assert (=> b!88370 m!94511))

(assert (=> b!87700 d!23497))

(declare-fun d!23499 () Bool)

(declare-fun e!57555 () Bool)

(assert (=> d!23499 e!57555))

(declare-fun res!45280 () Bool)

(assert (=> d!23499 (=> res!45280 e!57555)))

(declare-fun lt!42265 () Bool)

(assert (=> d!23499 (= res!45280 (not lt!42265))))

(declare-fun lt!42264 () Bool)

(assert (=> d!23499 (= lt!42265 lt!42264)))

(declare-fun lt!42266 () Unit!2598)

(declare-fun e!57554 () Unit!2598)

(assert (=> d!23499 (= lt!42266 e!57554)))

(declare-fun c!14612 () Bool)

(assert (=> d!23499 (= c!14612 lt!42264)))

(assert (=> d!23499 (= lt!42264 (containsKey!143 (toList!742 lt!41738) (_1!1116 lt!41562)))))

(assert (=> d!23499 (= (contains!755 lt!41738 (_1!1116 lt!41562)) lt!42265)))

(declare-fun b!88371 () Bool)

(declare-fun lt!42267 () Unit!2598)

(assert (=> b!88371 (= e!57554 lt!42267)))

(assert (=> b!88371 (= lt!42267 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41738) (_1!1116 lt!41562)))))

(assert (=> b!88371 (isDefined!93 (getValueByKey!139 (toList!742 lt!41738) (_1!1116 lt!41562)))))

(declare-fun b!88372 () Bool)

(declare-fun Unit!2629 () Unit!2598)

(assert (=> b!88372 (= e!57554 Unit!2629)))

(declare-fun b!88373 () Bool)

(assert (=> b!88373 (= e!57555 (isDefined!93 (getValueByKey!139 (toList!742 lt!41738) (_1!1116 lt!41562))))))

(assert (= (and d!23499 c!14612) b!88371))

(assert (= (and d!23499 (not c!14612)) b!88372))

(assert (= (and d!23499 (not res!45280)) b!88373))

(declare-fun m!94513 () Bool)

(assert (=> d!23499 m!94513))

(declare-fun m!94515 () Bool)

(assert (=> b!88371 m!94515))

(assert (=> b!88371 m!93553))

(assert (=> b!88371 m!93553))

(declare-fun m!94517 () Bool)

(assert (=> b!88371 m!94517))

(assert (=> b!88373 m!93553))

(assert (=> b!88373 m!93553))

(assert (=> b!88373 m!94517))

(assert (=> d!23295 d!23499))

(declare-fun b!88375 () Bool)

(declare-fun e!57556 () Option!145)

(declare-fun e!57557 () Option!145)

(assert (=> b!88375 (= e!57556 e!57557)))

(declare-fun c!14614 () Bool)

(assert (=> b!88375 (= c!14614 (and ((_ is Cons!1526) lt!41737) (not (= (_1!1116 (h!2118 lt!41737)) (_1!1116 lt!41562)))))))

(declare-fun d!23501 () Bool)

(declare-fun c!14613 () Bool)

(assert (=> d!23501 (= c!14613 (and ((_ is Cons!1526) lt!41737) (= (_1!1116 (h!2118 lt!41737)) (_1!1116 lt!41562))))))

(assert (=> d!23501 (= (getValueByKey!139 lt!41737 (_1!1116 lt!41562)) e!57556)))

(declare-fun b!88376 () Bool)

(assert (=> b!88376 (= e!57557 (getValueByKey!139 (t!5263 lt!41737) (_1!1116 lt!41562)))))

(declare-fun b!88374 () Bool)

(assert (=> b!88374 (= e!57556 (Some!144 (_2!1116 (h!2118 lt!41737))))))

(declare-fun b!88377 () Bool)

(assert (=> b!88377 (= e!57557 None!143)))

(assert (= (and d!23501 c!14613) b!88374))

(assert (= (and d!23501 (not c!14613)) b!88375))

(assert (= (and b!88375 c!14614) b!88376))

(assert (= (and b!88375 (not c!14614)) b!88377))

(declare-fun m!94519 () Bool)

(assert (=> b!88376 m!94519))

(assert (=> d!23295 d!23501))

(declare-fun d!23503 () Bool)

(assert (=> d!23503 (= (getValueByKey!139 lt!41737 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(declare-fun lt!42268 () Unit!2598)

(assert (=> d!23503 (= lt!42268 (choose!525 lt!41737 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(declare-fun e!57558 () Bool)

(assert (=> d!23503 e!57558))

(declare-fun res!45281 () Bool)

(assert (=> d!23503 (=> (not res!45281) (not e!57558))))

(assert (=> d!23503 (= res!45281 (isStrictlySorted!294 lt!41737))))

(assert (=> d!23503 (= (lemmaContainsTupThenGetReturnValue!59 lt!41737 (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42268)))

(declare-fun b!88378 () Bool)

(declare-fun res!45282 () Bool)

(assert (=> b!88378 (=> (not res!45282) (not e!57558))))

(assert (=> b!88378 (= res!45282 (containsKey!143 lt!41737 (_1!1116 lt!41562)))))

(declare-fun b!88379 () Bool)

(assert (=> b!88379 (= e!57558 (contains!757 lt!41737 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(assert (= (and d!23503 res!45281) b!88378))

(assert (= (and b!88378 res!45282) b!88379))

(assert (=> d!23503 m!93547))

(declare-fun m!94521 () Bool)

(assert (=> d!23503 m!94521))

(declare-fun m!94523 () Bool)

(assert (=> d!23503 m!94523))

(declare-fun m!94525 () Bool)

(assert (=> b!88378 m!94525))

(declare-fun m!94527 () Bool)

(assert (=> b!88379 m!94527))

(assert (=> d!23295 d!23503))

(declare-fun b!88380 () Bool)

(declare-fun res!45283 () Bool)

(declare-fun e!57562 () Bool)

(assert (=> b!88380 (=> (not res!45283) (not e!57562))))

(declare-fun lt!42269 () List!1530)

(assert (=> b!88380 (= res!45283 (containsKey!143 lt!42269 (_1!1116 lt!41562)))))

(declare-fun bm!8512 () Bool)

(declare-fun call!8516 () List!1530)

(declare-fun e!57559 () List!1530)

(declare-fun c!14615 () Bool)

(assert (=> bm!8512 (= call!8516 ($colon$colon!72 e!57559 (ite c!14615 (h!2118 (toList!742 (+!110 lt!41560 lt!41572))) (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562)))))))

(declare-fun c!14618 () Bool)

(assert (=> bm!8512 (= c!14618 c!14615)))

(declare-fun c!14617 () Bool)

(declare-fun c!14616 () Bool)

(declare-fun b!88381 () Bool)

(assert (=> b!88381 (= e!57559 (ite c!14616 (t!5263 (toList!742 (+!110 lt!41560 lt!41572))) (ite c!14617 (Cons!1526 (h!2118 (toList!742 (+!110 lt!41560 lt!41572))) (t!5263 (toList!742 (+!110 lt!41560 lt!41572)))) Nil!1527)))))

(declare-fun b!88382 () Bool)

(assert (=> b!88382 (= e!57562 (contains!757 lt!42269 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(declare-fun b!88383 () Bool)

(declare-fun e!57563 () List!1530)

(declare-fun e!57561 () List!1530)

(assert (=> b!88383 (= e!57563 e!57561)))

(assert (=> b!88383 (= c!14616 (and ((_ is Cons!1526) (toList!742 (+!110 lt!41560 lt!41572))) (= (_1!1116 (h!2118 (toList!742 (+!110 lt!41560 lt!41572)))) (_1!1116 lt!41562))))))

(declare-fun b!88385 () Bool)

(assert (=> b!88385 (= e!57563 call!8516)))

(declare-fun b!88386 () Bool)

(declare-fun call!8515 () List!1530)

(assert (=> b!88386 (= e!57561 call!8515)))

(declare-fun b!88387 () Bool)

(assert (=> b!88387 (= c!14617 (and ((_ is Cons!1526) (toList!742 (+!110 lt!41560 lt!41572))) (bvsgt (_1!1116 (h!2118 (toList!742 (+!110 lt!41560 lt!41572)))) (_1!1116 lt!41562))))))

(declare-fun e!57560 () List!1530)

(assert (=> b!88387 (= e!57561 e!57560)))

(declare-fun bm!8513 () Bool)

(declare-fun call!8517 () List!1530)

(assert (=> bm!8513 (= call!8517 call!8515)))

(declare-fun bm!8514 () Bool)

(assert (=> bm!8514 (= call!8515 call!8516)))

(declare-fun b!88388 () Bool)

(assert (=> b!88388 (= e!57560 call!8517)))

(declare-fun b!88389 () Bool)

(assert (=> b!88389 (= e!57560 call!8517)))

(declare-fun d!23505 () Bool)

(assert (=> d!23505 e!57562))

(declare-fun res!45284 () Bool)

(assert (=> d!23505 (=> (not res!45284) (not e!57562))))

(assert (=> d!23505 (= res!45284 (isStrictlySorted!294 lt!42269))))

(assert (=> d!23505 (= lt!42269 e!57563)))

(assert (=> d!23505 (= c!14615 (and ((_ is Cons!1526) (toList!742 (+!110 lt!41560 lt!41572))) (bvslt (_1!1116 (h!2118 (toList!742 (+!110 lt!41560 lt!41572)))) (_1!1116 lt!41562))))))

(assert (=> d!23505 (isStrictlySorted!294 (toList!742 (+!110 lt!41560 lt!41572)))))

(assert (=> d!23505 (= (insertStrictlySorted!62 (toList!742 (+!110 lt!41560 lt!41572)) (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42269)))

(declare-fun b!88384 () Bool)

(assert (=> b!88384 (= e!57559 (insertStrictlySorted!62 (t!5263 (toList!742 (+!110 lt!41560 lt!41572))) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (= (and d!23505 c!14615) b!88385))

(assert (= (and d!23505 (not c!14615)) b!88383))

(assert (= (and b!88383 c!14616) b!88386))

(assert (= (and b!88383 (not c!14616)) b!88387))

(assert (= (and b!88387 c!14617) b!88388))

(assert (= (and b!88387 (not c!14617)) b!88389))

(assert (= (or b!88388 b!88389) bm!8513))

(assert (= (or b!88386 bm!8513) bm!8514))

(assert (= (or b!88385 bm!8514) bm!8512))

(assert (= (and bm!8512 c!14618) b!88384))

(assert (= (and bm!8512 (not c!14618)) b!88381))

(assert (= (and d!23505 res!45284) b!88380))

(assert (= (and b!88380 res!45283) b!88382))

(declare-fun m!94529 () Bool)

(assert (=> d!23505 m!94529))

(declare-fun m!94531 () Bool)

(assert (=> d!23505 m!94531))

(declare-fun m!94533 () Bool)

(assert (=> b!88380 m!94533))

(declare-fun m!94535 () Bool)

(assert (=> bm!8512 m!94535))

(declare-fun m!94537 () Bool)

(assert (=> b!88384 m!94537))

(declare-fun m!94539 () Bool)

(assert (=> b!88382 m!94539))

(assert (=> d!23295 d!23505))

(declare-fun d!23507 () Bool)

(declare-fun e!57566 () Bool)

(assert (=> d!23507 e!57566))

(declare-fun c!14621 () Bool)

(assert (=> d!23507 (= c!14621 (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23507 true))

(declare-fun _$29!111 () Unit!2598)

(assert (=> d!23507 (= (choose!521 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (_values!2341 (v!2654 (underlying!288 thiss!992))) (mask!6395 (v!2654 (underlying!288 thiss!992))) (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) (zeroValue!2248 (v!2654 (underlying!288 thiss!992))) (minValue!2248 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992)))) _$29!111)))

(declare-fun b!88394 () Bool)

(assert (=> b!88394 (= e!57566 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88395 () Bool)

(assert (=> b!88395 (= e!57566 (ite (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2654 (underlying!288 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23507 c!14621) b!88394))

(assert (= (and d!23507 (not c!14621)) b!88395))

(assert (=> b!88394 m!93253))

(assert (=> b!88394 m!93303))

(assert (=> d!23323 d!23507))

(assert (=> d!23323 d!23303))

(declare-fun d!23509 () Bool)

(assert (=> d!23509 (= (+!110 (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (getCurrentListMap!427 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) lt!41897 (zeroValue!2248 newMap!16) lt!41566 #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42272 () Unit!2598)

(declare-fun choose!530 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2598)

(assert (=> d!23509 (= lt!42272 (choose!530 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41897 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41566 (defaultEntry!2358 newMap!16)))))

(assert (=> d!23509 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23509 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) lt!41897 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41566 (defaultEntry!2358 newMap!16)) lt!42272)))

(declare-fun bs!3728 () Bool)

(assert (= bs!3728 d!23509))

(assert (=> bs!3728 m!93597))

(assert (=> bs!3728 m!93597))

(declare-fun m!94541 () Bool)

(assert (=> bs!3728 m!94541))

(assert (=> bs!3728 m!93743))

(declare-fun m!94543 () Bool)

(assert (=> bs!3728 m!94543))

(declare-fun m!94545 () Bool)

(assert (=> bs!3728 m!94545))

(assert (=> b!87939 d!23509))

(declare-fun d!23511 () Bool)

(declare-fun res!45285 () Bool)

(declare-fun e!57567 () Bool)

(assert (=> d!23511 (=> res!45285 e!57567)))

(assert (=> d!23511 (= res!45285 (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23511 (= (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!57567)))

(declare-fun b!88396 () Bool)

(declare-fun e!57568 () Bool)

(assert (=> b!88396 (= e!57567 e!57568)))

(declare-fun res!45286 () Bool)

(assert (=> b!88396 (=> (not res!45286) (not e!57568))))

(assert (=> b!88396 (= res!45286 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(declare-fun b!88397 () Bool)

(assert (=> b!88397 (= e!57568 (arrayContainsKey!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23511 (not res!45285)) b!88396))

(assert (= (and b!88396 res!45286) b!88397))

(assert (=> d!23511 m!94097))

(assert (=> b!88397 m!93253))

(declare-fun m!94547 () Bool)

(assert (=> b!88397 m!94547))

(assert (=> b!87823 d!23511))

(declare-fun d!23513 () Bool)

(declare-fun e!57570 () Bool)

(assert (=> d!23513 e!57570))

(declare-fun res!45287 () Bool)

(assert (=> d!23513 (=> res!45287 e!57570)))

(declare-fun lt!42274 () Bool)

(assert (=> d!23513 (= res!45287 (not lt!42274))))

(declare-fun lt!42273 () Bool)

(assert (=> d!23513 (= lt!42274 lt!42273)))

(declare-fun lt!42275 () Unit!2598)

(declare-fun e!57569 () Unit!2598)

(assert (=> d!23513 (= lt!42275 e!57569)))

(declare-fun c!14622 () Bool)

(assert (=> d!23513 (= c!14622 lt!42273)))

(assert (=> d!23513 (= lt!42273 (containsKey!143 (toList!742 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723))) lt!41722))))

(assert (=> d!23513 (= (contains!755 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723)) lt!41722) lt!42274)))

(declare-fun b!88398 () Bool)

(declare-fun lt!42276 () Unit!2598)

(assert (=> b!88398 (= e!57569 lt!42276)))

(assert (=> b!88398 (= lt!42276 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723))) lt!41722))))

(assert (=> b!88398 (isDefined!93 (getValueByKey!139 (toList!742 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723))) lt!41722))))

(declare-fun b!88399 () Bool)

(declare-fun Unit!2630 () Unit!2598)

(assert (=> b!88399 (= e!57569 Unit!2630)))

(declare-fun b!88400 () Bool)

(assert (=> b!88400 (= e!57570 (isDefined!93 (getValueByKey!139 (toList!742 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723))) lt!41722)))))

(assert (= (and d!23513 c!14622) b!88398))

(assert (= (and d!23513 (not c!14622)) b!88399))

(assert (= (and d!23513 (not res!45287)) b!88400))

(declare-fun m!94549 () Bool)

(assert (=> d!23513 m!94549))

(declare-fun m!94551 () Bool)

(assert (=> b!88398 m!94551))

(declare-fun m!94553 () Bool)

(assert (=> b!88398 m!94553))

(assert (=> b!88398 m!94553))

(declare-fun m!94555 () Bool)

(assert (=> b!88398 m!94555))

(assert (=> b!88400 m!94553))

(assert (=> b!88400 m!94553))

(assert (=> b!88400 m!94555))

(assert (=> b!87734 d!23513))

(declare-fun d!23515 () Bool)

(declare-fun e!57571 () Bool)

(assert (=> d!23515 e!57571))

(declare-fun res!45288 () Bool)

(assert (=> d!23515 (=> (not res!45288) (not e!57571))))

(declare-fun lt!42280 () ListLongMap!1453)

(assert (=> d!23515 (= res!45288 (contains!755 lt!42280 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!42279 () List!1530)

(assert (=> d!23515 (= lt!42280 (ListLongMap!1454 lt!42279))))

(declare-fun lt!42278 () Unit!2598)

(declare-fun lt!42277 () Unit!2598)

(assert (=> d!23515 (= lt!42278 lt!42277)))

(assert (=> d!23515 (= (getValueByKey!139 lt!42279 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23515 (= lt!42277 (lemmaContainsTupThenGetReturnValue!59 lt!42279 (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23515 (= lt!42279 (insertStrictlySorted!62 (toList!742 call!8357) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23515 (= (+!110 call!8357 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!42280)))

(declare-fun b!88401 () Bool)

(declare-fun res!45289 () Bool)

(assert (=> b!88401 (=> (not res!45289) (not e!57571))))

(assert (=> b!88401 (= res!45289 (= (getValueByKey!139 (toList!742 lt!42280) (_1!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!144 (_2!1116 (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!88402 () Bool)

(assert (=> b!88402 (= e!57571 (contains!757 (toList!742 lt!42280) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23515 res!45288) b!88401))

(assert (= (and b!88401 res!45289) b!88402))

(declare-fun m!94557 () Bool)

(assert (=> d!23515 m!94557))

(declare-fun m!94559 () Bool)

(assert (=> d!23515 m!94559))

(declare-fun m!94561 () Bool)

(assert (=> d!23515 m!94561))

(declare-fun m!94563 () Bool)

(assert (=> d!23515 m!94563))

(declare-fun m!94565 () Bool)

(assert (=> b!88401 m!94565))

(declare-fun m!94567 () Bool)

(assert (=> b!88402 m!94567))

(assert (=> b!87734 d!23515))

(declare-fun d!23517 () Bool)

(assert (=> d!23517 (not (contains!755 (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723)) lt!41722))))

(declare-fun lt!42283 () Unit!2598)

(declare-fun choose!531 (ListLongMap!1453 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2598)

(assert (=> d!23517 (= lt!42283 (choose!531 lt!41726 lt!41724 lt!41723 lt!41722))))

(declare-fun e!57574 () Bool)

(assert (=> d!23517 e!57574))

(declare-fun res!45292 () Bool)

(assert (=> d!23517 (=> (not res!45292) (not e!57574))))

(assert (=> d!23517 (= res!45292 (not (contains!755 lt!41726 lt!41722)))))

(assert (=> d!23517 (= (addStillNotContains!33 lt!41726 lt!41724 lt!41723 lt!41722) lt!42283)))

(declare-fun b!88406 () Bool)

(assert (=> b!88406 (= e!57574 (not (= lt!41724 lt!41722)))))

(assert (= (and d!23517 res!45292) b!88406))

(assert (=> d!23517 m!93505))

(assert (=> d!23517 m!93505))

(assert (=> d!23517 m!93507))

(declare-fun m!94569 () Bool)

(assert (=> d!23517 m!94569))

(declare-fun m!94571 () Bool)

(assert (=> d!23517 m!94571))

(assert (=> b!87734 d!23517))

(declare-fun d!23519 () Bool)

(declare-fun e!57575 () Bool)

(assert (=> d!23519 e!57575))

(declare-fun res!45293 () Bool)

(assert (=> d!23519 (=> (not res!45293) (not e!57575))))

(declare-fun lt!42287 () ListLongMap!1453)

(assert (=> d!23519 (= res!45293 (contains!755 lt!42287 (_1!1116 (tuple2!2211 lt!41724 lt!41723))))))

(declare-fun lt!42286 () List!1530)

(assert (=> d!23519 (= lt!42287 (ListLongMap!1454 lt!42286))))

(declare-fun lt!42285 () Unit!2598)

(declare-fun lt!42284 () Unit!2598)

(assert (=> d!23519 (= lt!42285 lt!42284)))

(assert (=> d!23519 (= (getValueByKey!139 lt!42286 (_1!1116 (tuple2!2211 lt!41724 lt!41723))) (Some!144 (_2!1116 (tuple2!2211 lt!41724 lt!41723))))))

(assert (=> d!23519 (= lt!42284 (lemmaContainsTupThenGetReturnValue!59 lt!42286 (_1!1116 (tuple2!2211 lt!41724 lt!41723)) (_2!1116 (tuple2!2211 lt!41724 lt!41723))))))

(assert (=> d!23519 (= lt!42286 (insertStrictlySorted!62 (toList!742 lt!41726) (_1!1116 (tuple2!2211 lt!41724 lt!41723)) (_2!1116 (tuple2!2211 lt!41724 lt!41723))))))

(assert (=> d!23519 (= (+!110 lt!41726 (tuple2!2211 lt!41724 lt!41723)) lt!42287)))

(declare-fun b!88407 () Bool)

(declare-fun res!45294 () Bool)

(assert (=> b!88407 (=> (not res!45294) (not e!57575))))

(assert (=> b!88407 (= res!45294 (= (getValueByKey!139 (toList!742 lt!42287) (_1!1116 (tuple2!2211 lt!41724 lt!41723))) (Some!144 (_2!1116 (tuple2!2211 lt!41724 lt!41723)))))))

(declare-fun b!88408 () Bool)

(assert (=> b!88408 (= e!57575 (contains!757 (toList!742 lt!42287) (tuple2!2211 lt!41724 lt!41723)))))

(assert (= (and d!23519 res!45293) b!88407))

(assert (= (and b!88407 res!45294) b!88408))

(declare-fun m!94573 () Bool)

(assert (=> d!23519 m!94573))

(declare-fun m!94575 () Bool)

(assert (=> d!23519 m!94575))

(declare-fun m!94577 () Bool)

(assert (=> d!23519 m!94577))

(declare-fun m!94579 () Bool)

(assert (=> d!23519 m!94579))

(declare-fun m!94581 () Bool)

(assert (=> b!88407 m!94581))

(declare-fun m!94583 () Bool)

(assert (=> b!88408 m!94583))

(assert (=> b!87734 d!23519))

(declare-fun d!23521 () Bool)

(declare-fun c!14623 () Bool)

(assert (=> d!23521 (= c!14623 ((_ is ValueCellFull!926) (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!57576 () V!3033)

(assert (=> d!23521 (= (get!1207 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57576)))

(declare-fun b!88409 () Bool)

(assert (=> b!88409 (= e!57576 (get!1209 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88410 () Bool)

(assert (=> b!88410 (= e!57576 (get!1210 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23521 c!14623) b!88409))

(assert (= (and d!23521 (not c!14623)) b!88410))

(assert (=> b!88409 m!93501))

(assert (=> b!88409 m!93293))

(declare-fun m!94585 () Bool)

(assert (=> b!88409 m!94585))

(assert (=> b!88410 m!93501))

(assert (=> b!88410 m!93293))

(declare-fun m!94587 () Bool)

(assert (=> b!88410 m!94587))

(assert (=> b!87734 d!23521))

(declare-fun d!23523 () Bool)

(declare-fun e!57578 () Bool)

(assert (=> d!23523 e!57578))

(declare-fun res!45295 () Bool)

(assert (=> d!23523 (=> res!45295 e!57578)))

(declare-fun lt!42289 () Bool)

(assert (=> d!23523 (= res!45295 (not lt!42289))))

(declare-fun lt!42288 () Bool)

(assert (=> d!23523 (= lt!42289 lt!42288)))

(declare-fun lt!42290 () Unit!2598)

(declare-fun e!57577 () Unit!2598)

(assert (=> d!23523 (= lt!42290 e!57577)))

(declare-fun c!14624 () Bool)

(assert (=> d!23523 (= c!14624 lt!42288)))

(assert (=> d!23523 (= lt!42288 (containsKey!143 (toList!742 lt!41730) (_1!1116 lt!41572)))))

(assert (=> d!23523 (= (contains!755 lt!41730 (_1!1116 lt!41572)) lt!42289)))

(declare-fun b!88411 () Bool)

(declare-fun lt!42291 () Unit!2598)

(assert (=> b!88411 (= e!57577 lt!42291)))

(assert (=> b!88411 (= lt!42291 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41730) (_1!1116 lt!41572)))))

(assert (=> b!88411 (isDefined!93 (getValueByKey!139 (toList!742 lt!41730) (_1!1116 lt!41572)))))

(declare-fun b!88412 () Bool)

(declare-fun Unit!2631 () Unit!2598)

(assert (=> b!88412 (= e!57577 Unit!2631)))

(declare-fun b!88413 () Bool)

(assert (=> b!88413 (= e!57578 (isDefined!93 (getValueByKey!139 (toList!742 lt!41730) (_1!1116 lt!41572))))))

(assert (= (and d!23523 c!14624) b!88411))

(assert (= (and d!23523 (not c!14624)) b!88412))

(assert (= (and d!23523 (not res!45295)) b!88413))

(declare-fun m!94589 () Bool)

(assert (=> d!23523 m!94589))

(declare-fun m!94591 () Bool)

(assert (=> b!88411 m!94591))

(assert (=> b!88411 m!93529))

(assert (=> b!88411 m!93529))

(declare-fun m!94593 () Bool)

(assert (=> b!88411 m!94593))

(assert (=> b!88413 m!93529))

(assert (=> b!88413 m!93529))

(assert (=> b!88413 m!94593))

(assert (=> d!23291 d!23523))

(declare-fun b!88415 () Bool)

(declare-fun e!57579 () Option!145)

(declare-fun e!57580 () Option!145)

(assert (=> b!88415 (= e!57579 e!57580)))

(declare-fun c!14626 () Bool)

(assert (=> b!88415 (= c!14626 (and ((_ is Cons!1526) lt!41729) (not (= (_1!1116 (h!2118 lt!41729)) (_1!1116 lt!41572)))))))

(declare-fun d!23525 () Bool)

(declare-fun c!14625 () Bool)

(assert (=> d!23525 (= c!14625 (and ((_ is Cons!1526) lt!41729) (= (_1!1116 (h!2118 lt!41729)) (_1!1116 lt!41572))))))

(assert (=> d!23525 (= (getValueByKey!139 lt!41729 (_1!1116 lt!41572)) e!57579)))

(declare-fun b!88416 () Bool)

(assert (=> b!88416 (= e!57580 (getValueByKey!139 (t!5263 lt!41729) (_1!1116 lt!41572)))))

(declare-fun b!88414 () Bool)

(assert (=> b!88414 (= e!57579 (Some!144 (_2!1116 (h!2118 lt!41729))))))

(declare-fun b!88417 () Bool)

(assert (=> b!88417 (= e!57580 None!143)))

(assert (= (and d!23525 c!14625) b!88414))

(assert (= (and d!23525 (not c!14625)) b!88415))

(assert (= (and b!88415 c!14626) b!88416))

(assert (= (and b!88415 (not c!14626)) b!88417))

(declare-fun m!94595 () Bool)

(assert (=> b!88416 m!94595))

(assert (=> d!23291 d!23525))

(declare-fun d!23527 () Bool)

(assert (=> d!23527 (= (getValueByKey!139 lt!41729 (_1!1116 lt!41572)) (Some!144 (_2!1116 lt!41572)))))

(declare-fun lt!42292 () Unit!2598)

(assert (=> d!23527 (= lt!42292 (choose!525 lt!41729 (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(declare-fun e!57581 () Bool)

(assert (=> d!23527 e!57581))

(declare-fun res!45296 () Bool)

(assert (=> d!23527 (=> (not res!45296) (not e!57581))))

(assert (=> d!23527 (= res!45296 (isStrictlySorted!294 lt!41729))))

(assert (=> d!23527 (= (lemmaContainsTupThenGetReturnValue!59 lt!41729 (_1!1116 lt!41572) (_2!1116 lt!41572)) lt!42292)))

(declare-fun b!88418 () Bool)

(declare-fun res!45297 () Bool)

(assert (=> b!88418 (=> (not res!45297) (not e!57581))))

(assert (=> b!88418 (= res!45297 (containsKey!143 lt!41729 (_1!1116 lt!41572)))))

(declare-fun b!88419 () Bool)

(assert (=> b!88419 (= e!57581 (contains!757 lt!41729 (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572))))))

(assert (= (and d!23527 res!45296) b!88418))

(assert (= (and b!88418 res!45297) b!88419))

(assert (=> d!23527 m!93523))

(declare-fun m!94597 () Bool)

(assert (=> d!23527 m!94597))

(declare-fun m!94599 () Bool)

(assert (=> d!23527 m!94599))

(declare-fun m!94601 () Bool)

(assert (=> b!88418 m!94601))

(declare-fun m!94603 () Bool)

(assert (=> b!88419 m!94603))

(assert (=> d!23291 d!23527))

(declare-fun b!88420 () Bool)

(declare-fun res!45298 () Bool)

(declare-fun e!57585 () Bool)

(assert (=> b!88420 (=> (not res!45298) (not e!57585))))

(declare-fun lt!42293 () List!1530)

(assert (=> b!88420 (= res!45298 (containsKey!143 lt!42293 (_1!1116 lt!41572)))))

(declare-fun bm!8515 () Bool)

(declare-fun call!8519 () List!1530)

(declare-fun c!14627 () Bool)

(declare-fun e!57582 () List!1530)

(assert (=> bm!8515 (= call!8519 ($colon$colon!72 e!57582 (ite c!14627 (h!2118 (toList!742 lt!41560)) (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572)))))))

(declare-fun c!14630 () Bool)

(assert (=> bm!8515 (= c!14630 c!14627)))

(declare-fun c!14629 () Bool)

(declare-fun c!14628 () Bool)

(declare-fun b!88421 () Bool)

(assert (=> b!88421 (= e!57582 (ite c!14628 (t!5263 (toList!742 lt!41560)) (ite c!14629 (Cons!1526 (h!2118 (toList!742 lt!41560)) (t!5263 (toList!742 lt!41560))) Nil!1527)))))

(declare-fun b!88422 () Bool)

(assert (=> b!88422 (= e!57585 (contains!757 lt!42293 (tuple2!2211 (_1!1116 lt!41572) (_2!1116 lt!41572))))))

(declare-fun b!88423 () Bool)

(declare-fun e!57586 () List!1530)

(declare-fun e!57584 () List!1530)

(assert (=> b!88423 (= e!57586 e!57584)))

(assert (=> b!88423 (= c!14628 (and ((_ is Cons!1526) (toList!742 lt!41560)) (= (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41572))))))

(declare-fun b!88425 () Bool)

(assert (=> b!88425 (= e!57586 call!8519)))

(declare-fun b!88426 () Bool)

(declare-fun call!8518 () List!1530)

(assert (=> b!88426 (= e!57584 call!8518)))

(declare-fun b!88427 () Bool)

(assert (=> b!88427 (= c!14629 (and ((_ is Cons!1526) (toList!742 lt!41560)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41572))))))

(declare-fun e!57583 () List!1530)

(assert (=> b!88427 (= e!57584 e!57583)))

(declare-fun bm!8516 () Bool)

(declare-fun call!8520 () List!1530)

(assert (=> bm!8516 (= call!8520 call!8518)))

(declare-fun bm!8517 () Bool)

(assert (=> bm!8517 (= call!8518 call!8519)))

(declare-fun b!88428 () Bool)

(assert (=> b!88428 (= e!57583 call!8520)))

(declare-fun b!88429 () Bool)

(assert (=> b!88429 (= e!57583 call!8520)))

(declare-fun d!23529 () Bool)

(assert (=> d!23529 e!57585))

(declare-fun res!45299 () Bool)

(assert (=> d!23529 (=> (not res!45299) (not e!57585))))

(assert (=> d!23529 (= res!45299 (isStrictlySorted!294 lt!42293))))

(assert (=> d!23529 (= lt!42293 e!57586)))

(assert (=> d!23529 (= c!14627 (and ((_ is Cons!1526) (toList!742 lt!41560)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41572))))))

(assert (=> d!23529 (isStrictlySorted!294 (toList!742 lt!41560))))

(assert (=> d!23529 (= (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 lt!41572) (_2!1116 lt!41572)) lt!42293)))

(declare-fun b!88424 () Bool)

(assert (=> b!88424 (= e!57582 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41560)) (_1!1116 lt!41572) (_2!1116 lt!41572)))))

(assert (= (and d!23529 c!14627) b!88425))

(assert (= (and d!23529 (not c!14627)) b!88423))

(assert (= (and b!88423 c!14628) b!88426))

(assert (= (and b!88423 (not c!14628)) b!88427))

(assert (= (and b!88427 c!14629) b!88428))

(assert (= (and b!88427 (not c!14629)) b!88429))

(assert (= (or b!88428 b!88429) bm!8516))

(assert (= (or b!88426 bm!8516) bm!8517))

(assert (= (or b!88425 bm!8517) bm!8515))

(assert (= (and bm!8515 c!14630) b!88424))

(assert (= (and bm!8515 (not c!14630)) b!88421))

(assert (= (and d!23529 res!45299) b!88420))

(assert (= (and b!88420 res!45298) b!88422))

(declare-fun m!94605 () Bool)

(assert (=> d!23529 m!94605))

(declare-fun m!94607 () Bool)

(assert (=> d!23529 m!94607))

(declare-fun m!94609 () Bool)

(assert (=> b!88420 m!94609))

(declare-fun m!94611 () Bool)

(assert (=> bm!8515 m!94611))

(declare-fun m!94613 () Bool)

(assert (=> b!88424 m!94613))

(declare-fun m!94615 () Bool)

(assert (=> b!88422 m!94615))

(assert (=> d!23291 d!23529))

(assert (=> b!87842 d!23395))

(declare-fun d!23531 () Bool)

(declare-fun lt!42294 () Bool)

(assert (=> d!23531 (= lt!42294 (select (content!92 (toList!742 lt!41750)) lt!41562))))

(declare-fun e!57588 () Bool)

(assert (=> d!23531 (= lt!42294 e!57588)))

(declare-fun res!45301 () Bool)

(assert (=> d!23531 (=> (not res!45301) (not e!57588))))

(assert (=> d!23531 (= res!45301 ((_ is Cons!1526) (toList!742 lt!41750)))))

(assert (=> d!23531 (= (contains!757 (toList!742 lt!41750) lt!41562) lt!42294)))

(declare-fun b!88430 () Bool)

(declare-fun e!57587 () Bool)

(assert (=> b!88430 (= e!57588 e!57587)))

(declare-fun res!45300 () Bool)

(assert (=> b!88430 (=> res!45300 e!57587)))

(assert (=> b!88430 (= res!45300 (= (h!2118 (toList!742 lt!41750)) lt!41562))))

(declare-fun b!88431 () Bool)

(assert (=> b!88431 (= e!57587 (contains!757 (t!5263 (toList!742 lt!41750)) lt!41562))))

(assert (= (and d!23531 res!45301) b!88430))

(assert (= (and b!88430 (not res!45300)) b!88431))

(declare-fun m!94617 () Bool)

(assert (=> d!23531 m!94617))

(declare-fun m!94619 () Bool)

(assert (=> d!23531 m!94619))

(declare-fun m!94621 () Bool)

(assert (=> b!88431 m!94621))

(assert (=> b!87748 d!23531))

(assert (=> b!87732 d!23417))

(declare-fun d!23533 () Bool)

(declare-fun e!57589 () Bool)

(assert (=> d!23533 e!57589))

(declare-fun res!45302 () Bool)

(assert (=> d!23533 (=> (not res!45302) (not e!57589))))

(declare-fun lt!42298 () ListLongMap!1453)

(assert (=> d!23533 (= res!45302 (contains!755 lt!42298 (_1!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(declare-fun lt!42297 () List!1530)

(assert (=> d!23533 (= lt!42298 (ListLongMap!1454 lt!42297))))

(declare-fun lt!42296 () Unit!2598)

(declare-fun lt!42295 () Unit!2598)

(assert (=> d!23533 (= lt!42296 lt!42295)))

(assert (=> d!23533 (= (getValueByKey!139 lt!42297 (_1!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))) (Some!144 (_2!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(assert (=> d!23533 (= lt!42295 (lemmaContainsTupThenGetReturnValue!59 lt!42297 (_1!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (_2!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(assert (=> d!23533 (= lt!42297 (insertStrictlySorted!62 (toList!742 (ite c!14505 (ite c!14502 call!8452 call!8450) call!8440)) (_1!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) (_2!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))))))

(assert (=> d!23533 (= (+!110 (ite c!14505 (ite c!14502 call!8452 call!8450) call!8440) (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))) lt!42298)))

(declare-fun b!88432 () Bool)

(declare-fun res!45303 () Bool)

(assert (=> b!88432 (=> (not res!45303) (not e!57589))))

(assert (=> b!88432 (= res!45303 (= (getValueByKey!139 (toList!742 lt!42298) (_1!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566)))) (Some!144 (_2!1116 (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))))

(declare-fun b!88433 () Bool)

(assert (=> b!88433 (= e!57589 (contains!757 (toList!742 lt!42298) (ite c!14505 (ite c!14502 (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41566) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41566)) (tuple2!2211 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) lt!41566))))))

(assert (= (and d!23533 res!45302) b!88432))

(assert (= (and b!88432 res!45303) b!88433))

(declare-fun m!94623 () Bool)

(assert (=> d!23533 m!94623))

(declare-fun m!94625 () Bool)

(assert (=> d!23533 m!94625))

(declare-fun m!94627 () Bool)

(assert (=> d!23533 m!94627))

(declare-fun m!94629 () Bool)

(assert (=> d!23533 m!94629))

(declare-fun m!94631 () Bool)

(assert (=> b!88432 m!94631))

(declare-fun m!94633 () Bool)

(assert (=> b!88433 m!94633))

(assert (=> bm!8448 d!23533))

(declare-fun d!23535 () Bool)

(declare-fun e!57591 () Bool)

(assert (=> d!23535 e!57591))

(declare-fun res!45304 () Bool)

(assert (=> d!23535 (=> res!45304 e!57591)))

(declare-fun lt!42300 () Bool)

(assert (=> d!23535 (= res!45304 (not lt!42300))))

(declare-fun lt!42299 () Bool)

(assert (=> d!23535 (= lt!42300 lt!42299)))

(declare-fun lt!42301 () Unit!2598)

(declare-fun e!57590 () Unit!2598)

(assert (=> d!23535 (= lt!42301 e!57590)))

(declare-fun c!14631 () Bool)

(assert (=> d!23535 (= c!14631 lt!42299)))

(assert (=> d!23535 (= lt!42299 (containsKey!143 (toList!742 lt!41720) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23535 (= (contains!755 lt!41720 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42300)))

(declare-fun b!88434 () Bool)

(declare-fun lt!42302 () Unit!2598)

(assert (=> b!88434 (= e!57590 lt!42302)))

(assert (=> b!88434 (= lt!42302 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41720) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88434 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88435 () Bool)

(declare-fun Unit!2632 () Unit!2598)

(assert (=> b!88435 (= e!57590 Unit!2632)))

(declare-fun b!88436 () Bool)

(assert (=> b!88436 (= e!57591 (isDefined!93 (getValueByKey!139 (toList!742 lt!41720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23535 c!14631) b!88434))

(assert (= (and d!23535 (not c!14631)) b!88435))

(assert (= (and d!23535 (not res!45304)) b!88436))

(declare-fun m!94635 () Bool)

(assert (=> d!23535 m!94635))

(declare-fun m!94637 () Bool)

(assert (=> b!88434 m!94637))

(declare-fun m!94639 () Bool)

(assert (=> b!88434 m!94639))

(assert (=> b!88434 m!94639))

(declare-fun m!94641 () Bool)

(assert (=> b!88434 m!94641))

(assert (=> b!88436 m!94639))

(assert (=> b!88436 m!94639))

(assert (=> b!88436 m!94641))

(assert (=> b!87730 d!23535))

(declare-fun b!88438 () Bool)

(declare-fun e!57592 () Option!145)

(declare-fun e!57593 () Option!145)

(assert (=> b!88438 (= e!57592 e!57593)))

(declare-fun c!14633 () Bool)

(assert (=> b!88438 (= c!14633 (and ((_ is Cons!1526) (toList!742 lt!41746)) (not (= (_1!1116 (h!2118 (toList!742 lt!41746))) (_1!1116 lt!41562)))))))

(declare-fun d!23537 () Bool)

(declare-fun c!14632 () Bool)

(assert (=> d!23537 (= c!14632 (and ((_ is Cons!1526) (toList!742 lt!41746)) (= (_1!1116 (h!2118 (toList!742 lt!41746))) (_1!1116 lt!41562))))))

(assert (=> d!23537 (= (getValueByKey!139 (toList!742 lt!41746) (_1!1116 lt!41562)) e!57592)))

(declare-fun b!88439 () Bool)

(assert (=> b!88439 (= e!57593 (getValueByKey!139 (t!5263 (toList!742 lt!41746)) (_1!1116 lt!41562)))))

(declare-fun b!88437 () Bool)

(assert (=> b!88437 (= e!57592 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41746)))))))

(declare-fun b!88440 () Bool)

(assert (=> b!88440 (= e!57593 None!143)))

(assert (= (and d!23537 c!14632) b!88437))

(assert (= (and d!23537 (not c!14632)) b!88438))

(assert (= (and b!88438 c!14633) b!88439))

(assert (= (and b!88438 (not c!14633)) b!88440))

(declare-fun m!94643 () Bool)

(assert (=> b!88439 m!94643))

(assert (=> b!87745 d!23537))

(declare-fun d!23539 () Bool)

(declare-fun e!57595 () Bool)

(assert (=> d!23539 e!57595))

(declare-fun res!45305 () Bool)

(assert (=> d!23539 (=> res!45305 e!57595)))

(declare-fun lt!42304 () Bool)

(assert (=> d!23539 (= res!45305 (not lt!42304))))

(declare-fun lt!42303 () Bool)

(assert (=> d!23539 (= lt!42304 lt!42303)))

(declare-fun lt!42305 () Unit!2598)

(declare-fun e!57594 () Unit!2598)

(assert (=> d!23539 (= lt!42305 e!57594)))

(declare-fun c!14634 () Bool)

(assert (=> d!23539 (= c!14634 lt!42303)))

(assert (=> d!23539 (= lt!42303 (containsKey!143 (toList!742 lt!41814) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23539 (= (contains!755 lt!41814 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42304)))

(declare-fun b!88441 () Bool)

(declare-fun lt!42306 () Unit!2598)

(assert (=> b!88441 (= e!57594 lt!42306)))

(assert (=> b!88441 (= lt!42306 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41814) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88441 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88442 () Bool)

(declare-fun Unit!2633 () Unit!2598)

(assert (=> b!88442 (= e!57594 Unit!2633)))

(declare-fun b!88443 () Bool)

(assert (=> b!88443 (= e!57595 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23539 c!14634) b!88441))

(assert (= (and d!23539 (not c!14634)) b!88442))

(assert (= (and d!23539 (not res!45305)) b!88443))

(declare-fun m!94645 () Bool)

(assert (=> d!23539 m!94645))

(declare-fun m!94647 () Bool)

(assert (=> b!88441 m!94647))

(declare-fun m!94649 () Bool)

(assert (=> b!88441 m!94649))

(assert (=> b!88441 m!94649))

(declare-fun m!94651 () Bool)

(assert (=> b!88441 m!94651))

(assert (=> b!88443 m!94649))

(assert (=> b!88443 m!94649))

(assert (=> b!88443 m!94651))

(assert (=> bm!8375 d!23539))

(declare-fun d!23541 () Bool)

(declare-fun res!45306 () Bool)

(declare-fun e!57596 () Bool)

(assert (=> d!23541 (=> res!45306 e!57596)))

(assert (=> d!23541 (= res!45306 (= (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23541 (= (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000) e!57596)))

(declare-fun b!88444 () Bool)

(declare-fun e!57597 () Bool)

(assert (=> b!88444 (= e!57596 e!57597)))

(declare-fun res!45307 () Bool)

(assert (=> b!88444 (=> (not res!45307) (not e!57597))))

(assert (=> b!88444 (= res!45307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88445 () Bool)

(assert (=> b!88445 (= e!57597 (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23541 (not res!45306)) b!88444))

(assert (= (and b!88444 res!45307) b!88445))

(assert (=> d!23541 m!93853))

(assert (=> b!88445 m!93253))

(declare-fun m!94653 () Bool)

(assert (=> b!88445 m!94653))

(assert (=> bm!8446 d!23541))

(declare-fun b!88446 () Bool)

(declare-fun e!57599 () Bool)

(declare-fun call!8521 () Bool)

(assert (=> b!88446 (= e!57599 call!8521)))

(declare-fun e!57600 () Bool)

(declare-fun b!88447 () Bool)

(assert (=> b!88447 (= e!57600 (contains!758 (ite c!14469 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528) Nil!1528) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun c!14635 () Bool)

(declare-fun bm!8518 () Bool)

(assert (=> bm!8518 (= call!8521 (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14635 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14469 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528) Nil!1528)) (ite c!14469 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528) Nil!1528))))))

(declare-fun b!88448 () Bool)

(declare-fun e!57598 () Bool)

(assert (=> b!88448 (= e!57598 e!57599)))

(assert (=> b!88448 (= c!14635 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!23543 () Bool)

(declare-fun res!45309 () Bool)

(declare-fun e!57601 () Bool)

(assert (=> d!23543 (=> res!45309 e!57601)))

(assert (=> d!23543 (= res!45309 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2158 (_keys!4033 (v!2654 (underlying!288 thiss!992))))))))

(assert (=> d!23543 (= (arrayNoDuplicates!0 (_keys!4033 (v!2654 (underlying!288 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14469 (Cons!1527 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) Nil!1528) Nil!1528)) e!57601)))

(declare-fun b!88449 () Bool)

(assert (=> b!88449 (= e!57601 e!57598)))

(declare-fun res!45308 () Bool)

(assert (=> b!88449 (=> (not res!45308) (not e!57598))))

(assert (=> b!88449 (= res!45308 (not e!57600))))

(declare-fun res!45310 () Bool)

(assert (=> b!88449 (=> (not res!45310) (not e!57600))))

(assert (=> b!88449 (= res!45310 (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88450 () Bool)

(assert (=> b!88450 (= e!57599 call!8521)))

(assert (= (and d!23543 (not res!45309)) b!88449))

(assert (= (and b!88449 res!45310) b!88447))

(assert (= (and b!88449 res!45308) b!88448))

(assert (= (and b!88448 c!14635) b!88446))

(assert (= (and b!88448 (not c!14635)) b!88450))

(assert (= (or b!88446 b!88450) bm!8518))

(declare-fun m!94655 () Bool)

(assert (=> b!88447 m!94655))

(assert (=> b!88447 m!94655))

(declare-fun m!94657 () Bool)

(assert (=> b!88447 m!94657))

(assert (=> bm!8518 m!94655))

(declare-fun m!94659 () Bool)

(assert (=> bm!8518 m!94659))

(assert (=> b!88448 m!94655))

(assert (=> b!88448 m!94655))

(declare-fun m!94661 () Bool)

(assert (=> b!88448 m!94661))

(assert (=> b!88449 m!94655))

(assert (=> b!88449 m!94655))

(assert (=> b!88449 m!94661))

(assert (=> bm!8378 d!23543))

(declare-fun b!88452 () Bool)

(declare-fun e!57602 () Option!145)

(declare-fun e!57603 () Option!145)

(assert (=> b!88452 (= e!57602 e!57603)))

(declare-fun c!14637 () Bool)

(assert (=> b!88452 (= c!14637 (and ((_ is Cons!1526) (toList!742 lt!41750)) (not (= (_1!1116 (h!2118 (toList!742 lt!41750))) (_1!1116 lt!41562)))))))

(declare-fun d!23545 () Bool)

(declare-fun c!14636 () Bool)

(assert (=> d!23545 (= c!14636 (and ((_ is Cons!1526) (toList!742 lt!41750)) (= (_1!1116 (h!2118 (toList!742 lt!41750))) (_1!1116 lt!41562))))))

(assert (=> d!23545 (= (getValueByKey!139 (toList!742 lt!41750) (_1!1116 lt!41562)) e!57602)))

(declare-fun b!88453 () Bool)

(assert (=> b!88453 (= e!57603 (getValueByKey!139 (t!5263 (toList!742 lt!41750)) (_1!1116 lt!41562)))))

(declare-fun b!88451 () Bool)

(assert (=> b!88451 (= e!57602 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41750)))))))

(declare-fun b!88454 () Bool)

(assert (=> b!88454 (= e!57603 None!143)))

(assert (= (and d!23545 c!14636) b!88451))

(assert (= (and d!23545 (not c!14636)) b!88452))

(assert (= (and b!88452 c!14637) b!88453))

(assert (= (and b!88452 (not c!14637)) b!88454))

(declare-fun m!94663 () Bool)

(assert (=> b!88453 m!94663))

(assert (=> b!87747 d!23545))

(declare-fun d!23547 () Bool)

(declare-fun e!57604 () Bool)

(assert (=> d!23547 e!57604))

(declare-fun res!45311 () Bool)

(assert (=> d!23547 (=> (not res!45311) (not e!57604))))

(declare-fun lt!42310 () ListLongMap!1453)

(assert (=> d!23547 (= res!45311 (contains!755 lt!42310 (_1!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(declare-fun lt!42309 () List!1530)

(assert (=> d!23547 (= lt!42310 (ListLongMap!1454 lt!42309))))

(declare-fun lt!42308 () Unit!2598)

(declare-fun lt!42307 () Unit!2598)

(assert (=> d!23547 (= lt!42308 lt!42307)))

(assert (=> d!23547 (= (getValueByKey!139 lt!42309 (_1!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))) (Some!144 (_2!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(assert (=> d!23547 (= lt!42307 (lemmaContainsTupThenGetReturnValue!59 lt!42309 (_1!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (_2!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(assert (=> d!23547 (= lt!42309 (insertStrictlySorted!62 (toList!742 (ite c!14462 call!8377 (ite c!14460 call!8374 call!8373))) (_1!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) (_2!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))))))

(assert (=> d!23547 (= (+!110 (ite c!14462 call!8377 (ite c!14460 call!8374 call!8373)) (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))) lt!42310)))

(declare-fun b!88455 () Bool)

(declare-fun res!45312 () Bool)

(assert (=> b!88455 (=> (not res!45312) (not e!57604))))

(assert (=> b!88455 (= res!45312 (= (getValueByKey!139 (toList!742 lt!42310) (_1!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992))))))) (Some!144 (_2!1116 (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))))

(declare-fun b!88456 () Bool)

(assert (=> b!88456 (= e!57604 (contains!757 (toList!742 lt!42310) (ite (or c!14462 c!14460) (tuple2!2211 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2654 (underlying!288 thiss!992)))) (tuple2!2211 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2654 (underlying!288 thiss!992)))))))))

(assert (= (and d!23547 res!45311) b!88455))

(assert (= (and b!88455 res!45312) b!88456))

(declare-fun m!94665 () Bool)

(assert (=> d!23547 m!94665))

(declare-fun m!94667 () Bool)

(assert (=> d!23547 m!94667))

(declare-fun m!94669 () Bool)

(assert (=> d!23547 m!94669))

(declare-fun m!94671 () Bool)

(assert (=> d!23547 m!94671))

(declare-fun m!94673 () Bool)

(assert (=> b!88455 m!94673))

(declare-fun m!94675 () Bool)

(assert (=> b!88456 m!94675))

(assert (=> bm!8369 d!23547))

(declare-fun b!88465 () Bool)

(declare-fun res!45323 () Bool)

(declare-fun e!57607 () Bool)

(assert (=> b!88465 (=> (not res!45323) (not e!57607))))

(assert (=> b!88465 (= res!45323 (and (= (size!2159 (_values!2341 newMap!16)) (bvadd (mask!6395 newMap!16) #b00000000000000000000000000000001)) (= (size!2158 (_keys!4033 newMap!16)) (size!2159 (_values!2341 newMap!16))) (bvsge (_size!429 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!429 newMap!16) (bvadd (mask!6395 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!88466 () Bool)

(declare-fun res!45322 () Bool)

(assert (=> b!88466 (=> (not res!45322) (not e!57607))))

(declare-fun size!2164 (LongMapFixedSize!760) (_ BitVec 32))

(assert (=> b!88466 (= res!45322 (bvsge (size!2164 newMap!16) (_size!429 newMap!16)))))

(declare-fun b!88467 () Bool)

(declare-fun res!45324 () Bool)

(assert (=> b!88467 (=> (not res!45324) (not e!57607))))

(assert (=> b!88467 (= res!45324 (= (size!2164 newMap!16) (bvadd (_size!429 newMap!16) (bvsdiv (bvadd (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!88468 () Bool)

(assert (=> b!88468 (= e!57607 (and (bvsge (extraKeys!2193 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2193 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!429 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!23549 () Bool)

(declare-fun res!45321 () Bool)

(assert (=> d!23549 (=> (not res!45321) (not e!57607))))

(assert (=> d!23549 (= res!45321 (validMask!0 (mask!6395 newMap!16)))))

(assert (=> d!23549 (= (simpleValid!59 newMap!16) e!57607)))

(assert (= (and d!23549 res!45321) b!88465))

(assert (= (and b!88465 res!45323) b!88466))

(assert (= (and b!88466 res!45322) b!88467))

(assert (= (and b!88467 res!45324) b!88468))

(declare-fun m!94677 () Bool)

(assert (=> b!88466 m!94677))

(assert (=> b!88467 m!94677))

(assert (=> d!23549 m!93743))

(assert (=> d!23275 d!23549))

(declare-fun b!88470 () Bool)

(declare-fun e!57608 () Option!145)

(declare-fun e!57609 () Option!145)

(assert (=> b!88470 (= e!57608 e!57609)))

(declare-fun c!14639 () Bool)

(assert (=> b!88470 (= c!14639 (and ((_ is Cons!1526) (toList!742 lt!41742)) (not (= (_1!1116 (h!2118 (toList!742 lt!41742))) (_1!1116 lt!41556)))))))

(declare-fun d!23551 () Bool)

(declare-fun c!14638 () Bool)

(assert (=> d!23551 (= c!14638 (and ((_ is Cons!1526) (toList!742 lt!41742)) (= (_1!1116 (h!2118 (toList!742 lt!41742))) (_1!1116 lt!41556))))))

(assert (=> d!23551 (= (getValueByKey!139 (toList!742 lt!41742) (_1!1116 lt!41556)) e!57608)))

(declare-fun b!88471 () Bool)

(assert (=> b!88471 (= e!57609 (getValueByKey!139 (t!5263 (toList!742 lt!41742)) (_1!1116 lt!41556)))))

(declare-fun b!88469 () Bool)

(assert (=> b!88469 (= e!57608 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41742)))))))

(declare-fun b!88472 () Bool)

(assert (=> b!88472 (= e!57609 None!143)))

(assert (= (and d!23551 c!14638) b!88469))

(assert (= (and d!23551 (not c!14638)) b!88470))

(assert (= (and b!88470 c!14639) b!88471))

(assert (= (and b!88470 (not c!14639)) b!88472))

(declare-fun m!94679 () Bool)

(assert (=> b!88471 m!94679))

(assert (=> b!87743 d!23551))

(declare-fun d!23553 () Bool)

(assert (=> d!23553 (= (apply!83 lt!41720 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1211 (getValueByKey!139 (toList!742 lt!41720) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3729 () Bool)

(assert (= bs!3729 d!23553))

(assert (=> bs!3729 m!93497))

(assert (=> bs!3729 m!94265))

(assert (=> bs!3729 m!94265))

(declare-fun m!94681 () Bool)

(assert (=> bs!3729 m!94681))

(assert (=> b!87728 d!23553))

(assert (=> b!87728 d!23521))

(declare-fun b!88473 () Bool)

(declare-fun e!57611 () Bool)

(declare-fun call!8522 () Bool)

(assert (=> b!88473 (= e!57611 call!8522)))

(declare-fun b!88474 () Bool)

(declare-fun e!57610 () Bool)

(assert (=> b!88474 (= e!57610 e!57611)))

(declare-fun lt!42312 () (_ BitVec 64))

(assert (=> b!88474 (= lt!42312 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42313 () Unit!2598)

(assert (=> b!88474 (= lt!42313 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4033 newMap!16) lt!42312 #b00000000000000000000000000000000))))

(assert (=> b!88474 (arrayContainsKey!0 (_keys!4033 newMap!16) lt!42312 #b00000000000000000000000000000000)))

(declare-fun lt!42311 () Unit!2598)

(assert (=> b!88474 (= lt!42311 lt!42313)))

(declare-fun res!45325 () Bool)

(assert (=> b!88474 (= res!45325 (= (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000) (_keys!4033 newMap!16) (mask!6395 newMap!16)) (Found!247 #b00000000000000000000000000000000)))))

(assert (=> b!88474 (=> (not res!45325) (not e!57611))))

(declare-fun b!88475 () Bool)

(assert (=> b!88475 (= e!57610 call!8522)))

(declare-fun bm!8519 () Bool)

(assert (=> bm!8519 (= call!8522 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun b!88476 () Bool)

(declare-fun e!57612 () Bool)

(assert (=> b!88476 (= e!57612 e!57610)))

(declare-fun c!14640 () Bool)

(assert (=> b!88476 (= c!14640 (validKeyInArray!0 (select (arr!1912 (_keys!4033 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!23555 () Bool)

(declare-fun res!45326 () Bool)

(assert (=> d!23555 (=> res!45326 e!57612)))

(assert (=> d!23555 (= res!45326 (bvsge #b00000000000000000000000000000000 (size!2158 (_keys!4033 newMap!16))))))

(assert (=> d!23555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4033 newMap!16) (mask!6395 newMap!16)) e!57612)))

(assert (= (and d!23555 (not res!45326)) b!88476))

(assert (= (and b!88476 c!14640) b!88474))

(assert (= (and b!88476 (not c!14640)) b!88475))

(assert (= (and b!88474 res!45325) b!88473))

(assert (= (or b!88473 b!88475) bm!8519))

(assert (=> b!88474 m!93853))

(declare-fun m!94683 () Bool)

(assert (=> b!88474 m!94683))

(declare-fun m!94685 () Bool)

(assert (=> b!88474 m!94685))

(assert (=> b!88474 m!93853))

(declare-fun m!94687 () Bool)

(assert (=> b!88474 m!94687))

(declare-fun m!94689 () Bool)

(assert (=> bm!8519 m!94689))

(assert (=> b!88476 m!93853))

(assert (=> b!88476 m!93853))

(assert (=> b!88476 m!93863))

(assert (=> b!87681 d!23555))

(declare-fun b!88478 () Bool)

(declare-fun e!57613 () Option!145)

(declare-fun e!57614 () Option!145)

(assert (=> b!88478 (= e!57613 e!57614)))

(declare-fun c!14642 () Bool)

(assert (=> b!88478 (= c!14642 (and ((_ is Cons!1526) (toList!742 lt!41734)) (not (= (_1!1116 (h!2118 (toList!742 lt!41734))) (_1!1116 lt!41556)))))))

(declare-fun d!23557 () Bool)

(declare-fun c!14641 () Bool)

(assert (=> d!23557 (= c!14641 (and ((_ is Cons!1526) (toList!742 lt!41734)) (= (_1!1116 (h!2118 (toList!742 lt!41734))) (_1!1116 lt!41556))))))

(assert (=> d!23557 (= (getValueByKey!139 (toList!742 lt!41734) (_1!1116 lt!41556)) e!57613)))

(declare-fun b!88479 () Bool)

(assert (=> b!88479 (= e!57614 (getValueByKey!139 (t!5263 (toList!742 lt!41734)) (_1!1116 lt!41556)))))

(declare-fun b!88477 () Bool)

(assert (=> b!88477 (= e!57613 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41734)))))))

(declare-fun b!88480 () Bool)

(assert (=> b!88480 (= e!57614 None!143)))

(assert (= (and d!23557 c!14641) b!88477))

(assert (= (and d!23557 (not c!14641)) b!88478))

(assert (= (and b!88478 c!14642) b!88479))

(assert (= (and b!88478 (not c!14642)) b!88480))

(declare-fun m!94691 () Bool)

(assert (=> b!88479 m!94691))

(assert (=> b!87739 d!23557))

(declare-fun d!23559 () Bool)

(declare-fun e!57616 () Bool)

(assert (=> d!23559 e!57616))

(declare-fun res!45327 () Bool)

(assert (=> d!23559 (=> res!45327 e!57616)))

(declare-fun lt!42315 () Bool)

(assert (=> d!23559 (= res!45327 (not lt!42315))))

(declare-fun lt!42314 () Bool)

(assert (=> d!23559 (= lt!42315 lt!42314)))

(declare-fun lt!42316 () Unit!2598)

(declare-fun e!57615 () Unit!2598)

(assert (=> d!23559 (= lt!42316 e!57615)))

(declare-fun c!14643 () Bool)

(assert (=> d!23559 (= c!14643 lt!42314)))

(assert (=> d!23559 (= lt!42314 (containsKey!143 (toList!742 lt!41814) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23559 (= (contains!755 lt!41814 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42315)))

(declare-fun b!88481 () Bool)

(declare-fun lt!42317 () Unit!2598)

(assert (=> b!88481 (= e!57615 lt!42317)))

(assert (=> b!88481 (= lt!42317 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41814) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88481 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88482 () Bool)

(declare-fun Unit!2634 () Unit!2598)

(assert (=> b!88482 (= e!57615 Unit!2634)))

(declare-fun b!88483 () Bool)

(assert (=> b!88483 (= e!57616 (isDefined!93 (getValueByKey!139 (toList!742 lt!41814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23559 c!14643) b!88481))

(assert (= (and d!23559 (not c!14643)) b!88482))

(assert (= (and d!23559 (not res!45327)) b!88483))

(declare-fun m!94693 () Bool)

(assert (=> d!23559 m!94693))

(declare-fun m!94695 () Bool)

(assert (=> b!88481 m!94695))

(assert (=> b!88481 m!93729))

(assert (=> b!88481 m!93729))

(declare-fun m!94697 () Bool)

(assert (=> b!88481 m!94697))

(assert (=> b!88483 m!93729))

(assert (=> b!88483 m!93729))

(assert (=> b!88483 m!94697))

(assert (=> bm!8372 d!23559))

(declare-fun d!23561 () Bool)

(assert (=> d!23561 (= (apply!83 lt!41814 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1211 (getValueByKey!139 (toList!742 lt!41814) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3730 () Bool)

(assert (= bs!3730 d!23561))

(assert (=> bs!3730 m!94649))

(assert (=> bs!3730 m!94649))

(declare-fun m!94699 () Bool)

(assert (=> bs!3730 m!94699))

(assert (=> b!87797 d!23561))

(declare-fun d!23563 () Bool)

(assert (=> d!23563 (= (get!1210 (select (arr!1913 (_values!2341 (v!2654 (underlying!288 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!345 (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87754 d!23563))

(declare-fun d!23565 () Bool)

(assert (=> d!23565 (= (validKeyInArray!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87694 d!23565))

(declare-fun b!88485 () Bool)

(declare-fun e!57617 () Option!145)

(declare-fun e!57618 () Option!145)

(assert (=> b!88485 (= e!57617 e!57618)))

(declare-fun c!14645 () Bool)

(assert (=> b!88485 (= c!14645 (and ((_ is Cons!1526) (toList!742 lt!41738)) (not (= (_1!1116 (h!2118 (toList!742 lt!41738))) (_1!1116 lt!41562)))))))

(declare-fun d!23567 () Bool)

(declare-fun c!14644 () Bool)

(assert (=> d!23567 (= c!14644 (and ((_ is Cons!1526) (toList!742 lt!41738)) (= (_1!1116 (h!2118 (toList!742 lt!41738))) (_1!1116 lt!41562))))))

(assert (=> d!23567 (= (getValueByKey!139 (toList!742 lt!41738) (_1!1116 lt!41562)) e!57617)))

(declare-fun b!88486 () Bool)

(assert (=> b!88486 (= e!57618 (getValueByKey!139 (t!5263 (toList!742 lt!41738)) (_1!1116 lt!41562)))))

(declare-fun b!88484 () Bool)

(assert (=> b!88484 (= e!57617 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41738)))))))

(declare-fun b!88487 () Bool)

(assert (=> b!88487 (= e!57618 None!143)))

(assert (= (and d!23567 c!14644) b!88484))

(assert (= (and d!23567 (not c!14644)) b!88485))

(assert (= (and b!88485 c!14645) b!88486))

(assert (= (and b!88485 (not c!14645)) b!88487))

(declare-fun m!94701 () Bool)

(assert (=> b!88486 m!94701))

(assert (=> b!87741 d!23567))

(declare-fun d!23569 () Bool)

(declare-fun e!57620 () Bool)

(assert (=> d!23569 e!57620))

(declare-fun res!45328 () Bool)

(assert (=> d!23569 (=> res!45328 e!57620)))

(declare-fun lt!42319 () Bool)

(assert (=> d!23569 (= res!45328 (not lt!42319))))

(declare-fun lt!42318 () Bool)

(assert (=> d!23569 (= lt!42319 lt!42318)))

(declare-fun lt!42320 () Unit!2598)

(declare-fun e!57619 () Unit!2598)

(assert (=> d!23569 (= lt!42320 e!57619)))

(declare-fun c!14646 () Bool)

(assert (=> d!23569 (= c!14646 lt!42318)))

(assert (=> d!23569 (= lt!42318 (containsKey!143 (toList!742 call!8437) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> d!23569 (= (contains!755 call!8437 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)) lt!42319)))

(declare-fun b!88488 () Bool)

(declare-fun lt!42321 () Unit!2598)

(assert (=> b!88488 (= e!57619 lt!42321)))

(assert (=> b!88488 (= lt!42321 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 call!8437) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(assert (=> b!88488 (isDefined!93 (getValueByKey!139 (toList!742 call!8437) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355)))))

(declare-fun b!88489 () Bool)

(declare-fun Unit!2635 () Unit!2598)

(assert (=> b!88489 (= e!57619 Unit!2635)))

(declare-fun b!88490 () Bool)

(assert (=> b!88490 (= e!57620 (isDefined!93 (getValueByKey!139 (toList!742 call!8437) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355))))))

(assert (= (and d!23569 c!14646) b!88488))

(assert (= (and d!23569 (not c!14646)) b!88489))

(assert (= (and d!23569 (not res!45328)) b!88490))

(assert (=> d!23569 m!93253))

(declare-fun m!94703 () Bool)

(assert (=> d!23569 m!94703))

(assert (=> b!88488 m!93253))

(declare-fun m!94705 () Bool)

(assert (=> b!88488 m!94705))

(assert (=> b!88488 m!93253))

(declare-fun m!94707 () Bool)

(assert (=> b!88488 m!94707))

(assert (=> b!88488 m!94707))

(declare-fun m!94709 () Bool)

(assert (=> b!88488 m!94709))

(assert (=> b!88490 m!93253))

(assert (=> b!88490 m!94707))

(assert (=> b!88490 m!94707))

(assert (=> b!88490 m!94709))

(assert (=> b!87931 d!23569))

(declare-fun d!23571 () Bool)

(declare-fun e!57622 () Bool)

(assert (=> d!23571 e!57622))

(declare-fun res!45329 () Bool)

(assert (=> d!23571 (=> res!45329 e!57622)))

(declare-fun lt!42323 () Bool)

(assert (=> d!23571 (= res!45329 (not lt!42323))))

(declare-fun lt!42322 () Bool)

(assert (=> d!23571 (= lt!42323 lt!42322)))

(declare-fun lt!42324 () Unit!2598)

(declare-fun e!57621 () Unit!2598)

(assert (=> d!23571 (= lt!42324 e!57621)))

(declare-fun c!14647 () Bool)

(assert (=> d!23571 (= c!14647 lt!42322)))

(assert (=> d!23571 (= lt!42322 (containsKey!143 (toList!742 lt!41746) (_1!1116 lt!41562)))))

(assert (=> d!23571 (= (contains!755 lt!41746 (_1!1116 lt!41562)) lt!42323)))

(declare-fun b!88491 () Bool)

(declare-fun lt!42325 () Unit!2598)

(assert (=> b!88491 (= e!57621 lt!42325)))

(assert (=> b!88491 (= lt!42325 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41746) (_1!1116 lt!41562)))))

(assert (=> b!88491 (isDefined!93 (getValueByKey!139 (toList!742 lt!41746) (_1!1116 lt!41562)))))

(declare-fun b!88492 () Bool)

(declare-fun Unit!2636 () Unit!2598)

(assert (=> b!88492 (= e!57621 Unit!2636)))

(declare-fun b!88493 () Bool)

(assert (=> b!88493 (= e!57622 (isDefined!93 (getValueByKey!139 (toList!742 lt!41746) (_1!1116 lt!41562))))))

(assert (= (and d!23571 c!14647) b!88491))

(assert (= (and d!23571 (not c!14647)) b!88492))

(assert (= (and d!23571 (not res!45329)) b!88493))

(declare-fun m!94711 () Bool)

(assert (=> d!23571 m!94711))

(declare-fun m!94713 () Bool)

(assert (=> b!88491 m!94713))

(assert (=> b!88491 m!93577))

(assert (=> b!88491 m!93577))

(declare-fun m!94715 () Bool)

(assert (=> b!88491 m!94715))

(assert (=> b!88493 m!93577))

(assert (=> b!88493 m!93577))

(assert (=> b!88493 m!94715))

(assert (=> d!23299 d!23571))

(declare-fun b!88495 () Bool)

(declare-fun e!57623 () Option!145)

(declare-fun e!57624 () Option!145)

(assert (=> b!88495 (= e!57623 e!57624)))

(declare-fun c!14649 () Bool)

(assert (=> b!88495 (= c!14649 (and ((_ is Cons!1526) lt!41745) (not (= (_1!1116 (h!2118 lt!41745)) (_1!1116 lt!41562)))))))

(declare-fun d!23573 () Bool)

(declare-fun c!14648 () Bool)

(assert (=> d!23573 (= c!14648 (and ((_ is Cons!1526) lt!41745) (= (_1!1116 (h!2118 lt!41745)) (_1!1116 lt!41562))))))

(assert (=> d!23573 (= (getValueByKey!139 lt!41745 (_1!1116 lt!41562)) e!57623)))

(declare-fun b!88496 () Bool)

(assert (=> b!88496 (= e!57624 (getValueByKey!139 (t!5263 lt!41745) (_1!1116 lt!41562)))))

(declare-fun b!88494 () Bool)

(assert (=> b!88494 (= e!57623 (Some!144 (_2!1116 (h!2118 lt!41745))))))

(declare-fun b!88497 () Bool)

(assert (=> b!88497 (= e!57624 None!143)))

(assert (= (and d!23573 c!14648) b!88494))

(assert (= (and d!23573 (not c!14648)) b!88495))

(assert (= (and b!88495 c!14649) b!88496))

(assert (= (and b!88495 (not c!14649)) b!88497))

(declare-fun m!94717 () Bool)

(assert (=> b!88496 m!94717))

(assert (=> d!23299 d!23573))

(declare-fun d!23575 () Bool)

(assert (=> d!23575 (= (getValueByKey!139 lt!41745 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(declare-fun lt!42326 () Unit!2598)

(assert (=> d!23575 (= lt!42326 (choose!525 lt!41745 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(declare-fun e!57625 () Bool)

(assert (=> d!23575 e!57625))

(declare-fun res!45330 () Bool)

(assert (=> d!23575 (=> (not res!45330) (not e!57625))))

(assert (=> d!23575 (= res!45330 (isStrictlySorted!294 lt!41745))))

(assert (=> d!23575 (= (lemmaContainsTupThenGetReturnValue!59 lt!41745 (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42326)))

(declare-fun b!88498 () Bool)

(declare-fun res!45331 () Bool)

(assert (=> b!88498 (=> (not res!45331) (not e!57625))))

(assert (=> b!88498 (= res!45331 (containsKey!143 lt!41745 (_1!1116 lt!41562)))))

(declare-fun b!88499 () Bool)

(assert (=> b!88499 (= e!57625 (contains!757 lt!41745 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(assert (= (and d!23575 res!45330) b!88498))

(assert (= (and b!88498 res!45331) b!88499))

(assert (=> d!23575 m!93571))

(declare-fun m!94719 () Bool)

(assert (=> d!23575 m!94719))

(declare-fun m!94721 () Bool)

(assert (=> d!23575 m!94721))

(declare-fun m!94723 () Bool)

(assert (=> b!88498 m!94723))

(declare-fun m!94725 () Bool)

(assert (=> b!88499 m!94725))

(assert (=> d!23299 d!23575))

(declare-fun b!88500 () Bool)

(declare-fun res!45332 () Bool)

(declare-fun e!57629 () Bool)

(assert (=> b!88500 (=> (not res!45332) (not e!57629))))

(declare-fun lt!42327 () List!1530)

(assert (=> b!88500 (= res!45332 (containsKey!143 lt!42327 (_1!1116 lt!41562)))))

(declare-fun call!8524 () List!1530)

(declare-fun e!57626 () List!1530)

(declare-fun c!14650 () Bool)

(declare-fun bm!8520 () Bool)

(assert (=> bm!8520 (= call!8524 ($colon$colon!72 e!57626 (ite c!14650 (h!2118 (toList!742 lt!41569)) (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562)))))))

(declare-fun c!14653 () Bool)

(assert (=> bm!8520 (= c!14653 c!14650)))

(declare-fun c!14652 () Bool)

(declare-fun c!14651 () Bool)

(declare-fun b!88501 () Bool)

(assert (=> b!88501 (= e!57626 (ite c!14651 (t!5263 (toList!742 lt!41569)) (ite c!14652 (Cons!1526 (h!2118 (toList!742 lt!41569)) (t!5263 (toList!742 lt!41569))) Nil!1527)))))

(declare-fun b!88502 () Bool)

(assert (=> b!88502 (= e!57629 (contains!757 lt!42327 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(declare-fun b!88503 () Bool)

(declare-fun e!57630 () List!1530)

(declare-fun e!57628 () List!1530)

(assert (=> b!88503 (= e!57630 e!57628)))

(assert (=> b!88503 (= c!14651 (and ((_ is Cons!1526) (toList!742 lt!41569)) (= (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41562))))))

(declare-fun b!88505 () Bool)

(assert (=> b!88505 (= e!57630 call!8524)))

(declare-fun b!88506 () Bool)

(declare-fun call!8523 () List!1530)

(assert (=> b!88506 (= e!57628 call!8523)))

(declare-fun b!88507 () Bool)

(assert (=> b!88507 (= c!14652 (and ((_ is Cons!1526) (toList!742 lt!41569)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41562))))))

(declare-fun e!57627 () List!1530)

(assert (=> b!88507 (= e!57628 e!57627)))

(declare-fun bm!8521 () Bool)

(declare-fun call!8525 () List!1530)

(assert (=> bm!8521 (= call!8525 call!8523)))

(declare-fun bm!8522 () Bool)

(assert (=> bm!8522 (= call!8523 call!8524)))

(declare-fun b!88508 () Bool)

(assert (=> b!88508 (= e!57627 call!8525)))

(declare-fun b!88509 () Bool)

(assert (=> b!88509 (= e!57627 call!8525)))

(declare-fun d!23577 () Bool)

(assert (=> d!23577 e!57629))

(declare-fun res!45333 () Bool)

(assert (=> d!23577 (=> (not res!45333) (not e!57629))))

(assert (=> d!23577 (= res!45333 (isStrictlySorted!294 lt!42327))))

(assert (=> d!23577 (= lt!42327 e!57630)))

(assert (=> d!23577 (= c!14650 (and ((_ is Cons!1526) (toList!742 lt!41569)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41569))) (_1!1116 lt!41562))))))

(assert (=> d!23577 (isStrictlySorted!294 (toList!742 lt!41569))))

(assert (=> d!23577 (= (insertStrictlySorted!62 (toList!742 lt!41569) (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42327)))

(declare-fun b!88504 () Bool)

(assert (=> b!88504 (= e!57626 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41569)) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (= (and d!23577 c!14650) b!88505))

(assert (= (and d!23577 (not c!14650)) b!88503))

(assert (= (and b!88503 c!14651) b!88506))

(assert (= (and b!88503 (not c!14651)) b!88507))

(assert (= (and b!88507 c!14652) b!88508))

(assert (= (and b!88507 (not c!14652)) b!88509))

(assert (= (or b!88508 b!88509) bm!8521))

(assert (= (or b!88506 bm!8521) bm!8522))

(assert (= (or b!88505 bm!8522) bm!8520))

(assert (= (and bm!8520 c!14653) b!88504))

(assert (= (and bm!8520 (not c!14653)) b!88501))

(assert (= (and d!23577 res!45333) b!88500))

(assert (= (and b!88500 res!45332) b!88502))

(declare-fun m!94727 () Bool)

(assert (=> d!23577 m!94727))

(assert (=> d!23577 m!94419))

(declare-fun m!94729 () Bool)

(assert (=> b!88500 m!94729))

(declare-fun m!94731 () Bool)

(assert (=> bm!8520 m!94731))

(declare-fun m!94733 () Bool)

(assert (=> b!88504 m!94733))

(declare-fun m!94735 () Bool)

(assert (=> b!88502 m!94735))

(assert (=> d!23299 d!23577))

(declare-fun d!23579 () Bool)

(assert (=> d!23579 (= (apply!83 lt!41814 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1211 (getValueByKey!139 (toList!742 lt!41814) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3731 () Bool)

(assert (= bs!3731 d!23579))

(assert (=> bs!3731 m!93497))

(assert (=> bs!3731 m!94397))

(assert (=> bs!3731 m!94397))

(declare-fun m!94737 () Bool)

(assert (=> bs!3731 m!94737))

(assert (=> b!87813 d!23579))

(assert (=> b!87813 d!23521))

(assert (=> b!87828 d!23321))

(declare-fun b!88526 () Bool)

(declare-fun e!57641 () Bool)

(declare-fun e!57639 () Bool)

(assert (=> b!88526 (= e!57641 e!57639)))

(declare-fun c!14658 () Bool)

(declare-fun lt!42333 () SeekEntryResult!247)

(assert (=> b!88526 (= c!14658 ((_ is MissingVacant!247) lt!42333))))

(declare-fun b!88527 () Bool)

(declare-fun res!45343 () Bool)

(declare-fun e!57642 () Bool)

(assert (=> b!88527 (=> (not res!45343) (not e!57642))))

(declare-fun call!8531 () Bool)

(assert (=> b!88527 (= res!45343 call!8531)))

(assert (=> b!88527 (= e!57639 e!57642)))

(declare-fun c!14659 () Bool)

(declare-fun bm!8527 () Bool)

(assert (=> bm!8527 (= call!8531 (inRange!0 (ite c!14659 (index!3126 lt!42333) (index!3129 lt!42333)) (mask!6395 newMap!16)))))

(declare-fun b!88528 () Bool)

(assert (=> b!88528 (and (bvsge (index!3126 lt!42333) #b00000000000000000000000000000000) (bvslt (index!3126 lt!42333) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun res!45345 () Bool)

(assert (=> b!88528 (= res!45345 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3126 lt!42333)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!57640 () Bool)

(assert (=> b!88528 (=> (not res!45345) (not e!57640))))

(declare-fun call!8530 () Bool)

(declare-fun bm!8528 () Bool)

(assert (=> bm!8528 (= call!8530 (arrayContainsKey!0 (_keys!4033 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88529 () Bool)

(assert (=> b!88529 (= e!57641 e!57640)))

(declare-fun res!45342 () Bool)

(assert (=> b!88529 (= res!45342 call!8531)))

(assert (=> b!88529 (=> (not res!45342) (not e!57640))))

(declare-fun d!23581 () Bool)

(assert (=> d!23581 e!57641))

(assert (=> d!23581 (= c!14659 ((_ is MissingZero!247) lt!42333))))

(assert (=> d!23581 (= lt!42333 (seekEntryOrOpen!0 (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (_keys!4033 newMap!16) (mask!6395 newMap!16)))))

(declare-fun lt!42332 () Unit!2598)

(declare-fun choose!532 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2598)

(assert (=> d!23581 (= lt!42332 (choose!532 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23581 (validMask!0 (mask!6395 newMap!16))))

(assert (=> d!23581 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4033 newMap!16) (_values!2341 newMap!16) (mask!6395 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1912 (_keys!4033 (v!2654 (underlying!288 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)) lt!42332)))

(declare-fun b!88530 () Bool)

(assert (=> b!88530 (= e!57640 (not call!8530))))

(declare-fun b!88531 () Bool)

(assert (=> b!88531 (= e!57642 (not call!8530))))

(declare-fun b!88532 () Bool)

(declare-fun res!45344 () Bool)

(assert (=> b!88532 (=> (not res!45344) (not e!57642))))

(assert (=> b!88532 (= res!45344 (= (select (arr!1912 (_keys!4033 newMap!16)) (index!3129 lt!42333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88532 (and (bvsge (index!3129 lt!42333) #b00000000000000000000000000000000) (bvslt (index!3129 lt!42333) (size!2158 (_keys!4033 newMap!16))))))

(declare-fun b!88533 () Bool)

(assert (=> b!88533 (= e!57639 ((_ is Undefined!247) lt!42333))))

(assert (= (and d!23581 c!14659) b!88529))

(assert (= (and d!23581 (not c!14659)) b!88526))

(assert (= (and b!88529 res!45342) b!88528))

(assert (= (and b!88528 res!45345) b!88530))

(assert (= (and b!88526 c!14658) b!88527))

(assert (= (and b!88526 (not c!14658)) b!88533))

(assert (= (and b!88527 res!45343) b!88532))

(assert (= (and b!88532 res!45344) b!88531))

(assert (= (or b!88529 b!88527) bm!8527))

(assert (= (or b!88530 b!88531) bm!8528))

(declare-fun m!94739 () Bool)

(assert (=> b!88528 m!94739))

(assert (=> d!23581 m!93253))

(assert (=> d!23581 m!93713))

(assert (=> d!23581 m!93253))

(declare-fun m!94741 () Bool)

(assert (=> d!23581 m!94741))

(assert (=> d!23581 m!93743))

(declare-fun m!94743 () Bool)

(assert (=> bm!8527 m!94743))

(declare-fun m!94745 () Bool)

(assert (=> b!88532 m!94745))

(assert (=> bm!8528 m!93253))

(assert (=> bm!8528 m!93673))

(assert (=> bm!8435 d!23581))

(declare-fun b!88535 () Bool)

(declare-fun e!57643 () Option!145)

(declare-fun e!57644 () Option!145)

(assert (=> b!88535 (= e!57643 e!57644)))

(declare-fun c!14661 () Bool)

(assert (=> b!88535 (= c!14661 (and ((_ is Cons!1526) (toList!742 lt!41730)) (not (= (_1!1116 (h!2118 (toList!742 lt!41730))) (_1!1116 lt!41572)))))))

(declare-fun d!23583 () Bool)

(declare-fun c!14660 () Bool)

(assert (=> d!23583 (= c!14660 (and ((_ is Cons!1526) (toList!742 lt!41730)) (= (_1!1116 (h!2118 (toList!742 lt!41730))) (_1!1116 lt!41572))))))

(assert (=> d!23583 (= (getValueByKey!139 (toList!742 lt!41730) (_1!1116 lt!41572)) e!57643)))

(declare-fun b!88536 () Bool)

(assert (=> b!88536 (= e!57644 (getValueByKey!139 (t!5263 (toList!742 lt!41730)) (_1!1116 lt!41572)))))

(declare-fun b!88534 () Bool)

(assert (=> b!88534 (= e!57643 (Some!144 (_2!1116 (h!2118 (toList!742 lt!41730)))))))

(declare-fun b!88537 () Bool)

(assert (=> b!88537 (= e!57644 None!143)))

(assert (= (and d!23583 c!14660) b!88534))

(assert (= (and d!23583 (not c!14660)) b!88535))

(assert (= (and b!88535 c!14661) b!88536))

(assert (= (and b!88535 (not c!14661)) b!88537))

(declare-fun m!94747 () Bool)

(assert (=> b!88536 m!94747))

(assert (=> b!87737 d!23583))

(declare-fun d!23585 () Bool)

(declare-fun e!57646 () Bool)

(assert (=> d!23585 e!57646))

(declare-fun res!45346 () Bool)

(assert (=> d!23585 (=> res!45346 e!57646)))

(declare-fun lt!42335 () Bool)

(assert (=> d!23585 (= res!45346 (not lt!42335))))

(declare-fun lt!42334 () Bool)

(assert (=> d!23585 (= lt!42335 lt!42334)))

(declare-fun lt!42336 () Unit!2598)

(declare-fun e!57645 () Unit!2598)

(assert (=> d!23585 (= lt!42336 e!57645)))

(declare-fun c!14662 () Bool)

(assert (=> d!23585 (= c!14662 lt!42334)))

(assert (=> d!23585 (= lt!42334 (containsKey!143 (toList!742 lt!41750) (_1!1116 lt!41562)))))

(assert (=> d!23585 (= (contains!755 lt!41750 (_1!1116 lt!41562)) lt!42335)))

(declare-fun b!88538 () Bool)

(declare-fun lt!42337 () Unit!2598)

(assert (=> b!88538 (= e!57645 lt!42337)))

(assert (=> b!88538 (= lt!42337 (lemmaContainsKeyImpliesGetValueByKeyDefined!92 (toList!742 lt!41750) (_1!1116 lt!41562)))))

(assert (=> b!88538 (isDefined!93 (getValueByKey!139 (toList!742 lt!41750) (_1!1116 lt!41562)))))

(declare-fun b!88539 () Bool)

(declare-fun Unit!2637 () Unit!2598)

(assert (=> b!88539 (= e!57645 Unit!2637)))

(declare-fun b!88540 () Bool)

(assert (=> b!88540 (= e!57646 (isDefined!93 (getValueByKey!139 (toList!742 lt!41750) (_1!1116 lt!41562))))))

(assert (= (and d!23585 c!14662) b!88538))

(assert (= (and d!23585 (not c!14662)) b!88539))

(assert (= (and d!23585 (not res!45346)) b!88540))

(declare-fun m!94749 () Bool)

(assert (=> d!23585 m!94749))

(declare-fun m!94751 () Bool)

(assert (=> b!88538 m!94751))

(assert (=> b!88538 m!93589))

(assert (=> b!88538 m!93589))

(declare-fun m!94753 () Bool)

(assert (=> b!88538 m!94753))

(assert (=> b!88540 m!93589))

(assert (=> b!88540 m!93589))

(assert (=> b!88540 m!94753))

(assert (=> d!23301 d!23585))

(declare-fun b!88542 () Bool)

(declare-fun e!57647 () Option!145)

(declare-fun e!57648 () Option!145)

(assert (=> b!88542 (= e!57647 e!57648)))

(declare-fun c!14664 () Bool)

(assert (=> b!88542 (= c!14664 (and ((_ is Cons!1526) lt!41749) (not (= (_1!1116 (h!2118 lt!41749)) (_1!1116 lt!41562)))))))

(declare-fun d!23587 () Bool)

(declare-fun c!14663 () Bool)

(assert (=> d!23587 (= c!14663 (and ((_ is Cons!1526) lt!41749) (= (_1!1116 (h!2118 lt!41749)) (_1!1116 lt!41562))))))

(assert (=> d!23587 (= (getValueByKey!139 lt!41749 (_1!1116 lt!41562)) e!57647)))

(declare-fun b!88543 () Bool)

(assert (=> b!88543 (= e!57648 (getValueByKey!139 (t!5263 lt!41749) (_1!1116 lt!41562)))))

(declare-fun b!88541 () Bool)

(assert (=> b!88541 (= e!57647 (Some!144 (_2!1116 (h!2118 lt!41749))))))

(declare-fun b!88544 () Bool)

(assert (=> b!88544 (= e!57648 None!143)))

(assert (= (and d!23587 c!14663) b!88541))

(assert (= (and d!23587 (not c!14663)) b!88542))

(assert (= (and b!88542 c!14664) b!88543))

(assert (= (and b!88542 (not c!14664)) b!88544))

(declare-fun m!94755 () Bool)

(assert (=> b!88543 m!94755))

(assert (=> d!23301 d!23587))

(declare-fun d!23589 () Bool)

(assert (=> d!23589 (= (getValueByKey!139 lt!41749 (_1!1116 lt!41562)) (Some!144 (_2!1116 lt!41562)))))

(declare-fun lt!42338 () Unit!2598)

(assert (=> d!23589 (= lt!42338 (choose!525 lt!41749 (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(declare-fun e!57649 () Bool)

(assert (=> d!23589 e!57649))

(declare-fun res!45347 () Bool)

(assert (=> d!23589 (=> (not res!45347) (not e!57649))))

(assert (=> d!23589 (= res!45347 (isStrictlySorted!294 lt!41749))))

(assert (=> d!23589 (= (lemmaContainsTupThenGetReturnValue!59 lt!41749 (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42338)))

(declare-fun b!88545 () Bool)

(declare-fun res!45348 () Bool)

(assert (=> b!88545 (=> (not res!45348) (not e!57649))))

(assert (=> b!88545 (= res!45348 (containsKey!143 lt!41749 (_1!1116 lt!41562)))))

(declare-fun b!88546 () Bool)

(assert (=> b!88546 (= e!57649 (contains!757 lt!41749 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(assert (= (and d!23589 res!45347) b!88545))

(assert (= (and b!88545 res!45348) b!88546))

(assert (=> d!23589 m!93583))

(declare-fun m!94757 () Bool)

(assert (=> d!23589 m!94757))

(declare-fun m!94759 () Bool)

(assert (=> d!23589 m!94759))

(declare-fun m!94761 () Bool)

(assert (=> b!88545 m!94761))

(declare-fun m!94763 () Bool)

(assert (=> b!88546 m!94763))

(assert (=> d!23301 d!23589))

(declare-fun b!88547 () Bool)

(declare-fun res!45349 () Bool)

(declare-fun e!57653 () Bool)

(assert (=> b!88547 (=> (not res!45349) (not e!57653))))

(declare-fun lt!42339 () List!1530)

(assert (=> b!88547 (= res!45349 (containsKey!143 lt!42339 (_1!1116 lt!41562)))))

(declare-fun call!8533 () List!1530)

(declare-fun c!14665 () Bool)

(declare-fun bm!8529 () Bool)

(declare-fun e!57650 () List!1530)

(assert (=> bm!8529 (= call!8533 ($colon$colon!72 e!57650 (ite c!14665 (h!2118 (toList!742 lt!41560)) (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562)))))))

(declare-fun c!14668 () Bool)

(assert (=> bm!8529 (= c!14668 c!14665)))

(declare-fun b!88548 () Bool)

(declare-fun c!14667 () Bool)

(declare-fun c!14666 () Bool)

(assert (=> b!88548 (= e!57650 (ite c!14666 (t!5263 (toList!742 lt!41560)) (ite c!14667 (Cons!1526 (h!2118 (toList!742 lt!41560)) (t!5263 (toList!742 lt!41560))) Nil!1527)))))

(declare-fun b!88549 () Bool)

(assert (=> b!88549 (= e!57653 (contains!757 lt!42339 (tuple2!2211 (_1!1116 lt!41562) (_2!1116 lt!41562))))))

(declare-fun b!88550 () Bool)

(declare-fun e!57654 () List!1530)

(declare-fun e!57652 () List!1530)

(assert (=> b!88550 (= e!57654 e!57652)))

(assert (=> b!88550 (= c!14666 (and ((_ is Cons!1526) (toList!742 lt!41560)) (= (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41562))))))

(declare-fun b!88552 () Bool)

(assert (=> b!88552 (= e!57654 call!8533)))

(declare-fun b!88553 () Bool)

(declare-fun call!8532 () List!1530)

(assert (=> b!88553 (= e!57652 call!8532)))

(declare-fun b!88554 () Bool)

(assert (=> b!88554 (= c!14667 (and ((_ is Cons!1526) (toList!742 lt!41560)) (bvsgt (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41562))))))

(declare-fun e!57651 () List!1530)

(assert (=> b!88554 (= e!57652 e!57651)))

(declare-fun bm!8530 () Bool)

(declare-fun call!8534 () List!1530)

(assert (=> bm!8530 (= call!8534 call!8532)))

(declare-fun bm!8531 () Bool)

(assert (=> bm!8531 (= call!8532 call!8533)))

(declare-fun b!88555 () Bool)

(assert (=> b!88555 (= e!57651 call!8534)))

(declare-fun b!88556 () Bool)

(assert (=> b!88556 (= e!57651 call!8534)))

(declare-fun d!23591 () Bool)

(assert (=> d!23591 e!57653))

(declare-fun res!45350 () Bool)

(assert (=> d!23591 (=> (not res!45350) (not e!57653))))

(assert (=> d!23591 (= res!45350 (isStrictlySorted!294 lt!42339))))

(assert (=> d!23591 (= lt!42339 e!57654)))

(assert (=> d!23591 (= c!14665 (and ((_ is Cons!1526) (toList!742 lt!41560)) (bvslt (_1!1116 (h!2118 (toList!742 lt!41560))) (_1!1116 lt!41562))))))

(assert (=> d!23591 (isStrictlySorted!294 (toList!742 lt!41560))))

(assert (=> d!23591 (= (insertStrictlySorted!62 (toList!742 lt!41560) (_1!1116 lt!41562) (_2!1116 lt!41562)) lt!42339)))

(declare-fun b!88551 () Bool)

(assert (=> b!88551 (= e!57650 (insertStrictlySorted!62 (t!5263 (toList!742 lt!41560)) (_1!1116 lt!41562) (_2!1116 lt!41562)))))

(assert (= (and d!23591 c!14665) b!88552))

(assert (= (and d!23591 (not c!14665)) b!88550))

(assert (= (and b!88550 c!14666) b!88553))

(assert (= (and b!88550 (not c!14666)) b!88554))

(assert (= (and b!88554 c!14667) b!88555))

(assert (= (and b!88554 (not c!14667)) b!88556))

(assert (= (or b!88555 b!88556) bm!8530))

(assert (= (or b!88553 bm!8530) bm!8531))

(assert (= (or b!88552 bm!8531) bm!8529))

(assert (= (and bm!8529 c!14668) b!88551))

(assert (= (and bm!8529 (not c!14668)) b!88548))

(assert (= (and d!23591 res!45350) b!88547))

(assert (= (and b!88547 res!45349) b!88549))

(declare-fun m!94765 () Bool)

(assert (=> d!23591 m!94765))

(assert (=> d!23591 m!94607))

(declare-fun m!94767 () Bool)

(assert (=> b!88547 m!94767))

(declare-fun m!94769 () Bool)

(assert (=> bm!8529 m!94769))

(declare-fun m!94771 () Bool)

(assert (=> b!88551 m!94771))

(declare-fun m!94773 () Bool)

(assert (=> b!88549 m!94773))

(assert (=> d!23301 d!23591))

(declare-fun condMapEmpty!3437 () Bool)

(declare-fun mapDefault!3437 () ValueCell!926)

(assert (=> mapNonEmpty!3436 (= condMapEmpty!3437 (= mapRest!3436 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3437)))))

(declare-fun e!57656 () Bool)

(declare-fun mapRes!3437 () Bool)

(assert (=> mapNonEmpty!3436 (= tp!8998 (and e!57656 mapRes!3437))))

(declare-fun mapIsEmpty!3437 () Bool)

(assert (=> mapIsEmpty!3437 mapRes!3437))

(declare-fun b!88557 () Bool)

(declare-fun e!57655 () Bool)

(assert (=> b!88557 (= e!57655 tp_is_empty!2539)))

(declare-fun b!88558 () Bool)

(assert (=> b!88558 (= e!57656 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3437 () Bool)

(declare-fun tp!8999 () Bool)

(assert (=> mapNonEmpty!3437 (= mapRes!3437 (and tp!8999 e!57655))))

(declare-fun mapValue!3437 () ValueCell!926)

(declare-fun mapKey!3437 () (_ BitVec 32))

(declare-fun mapRest!3437 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3437 (= mapRest!3436 (store mapRest!3437 mapKey!3437 mapValue!3437))))

(assert (= (and mapNonEmpty!3436 condMapEmpty!3437) mapIsEmpty!3437))

(assert (= (and mapNonEmpty!3436 (not condMapEmpty!3437)) mapNonEmpty!3437))

(assert (= (and mapNonEmpty!3437 ((_ is ValueCellFull!926) mapValue!3437)) b!88557))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!926) mapDefault!3437)) b!88558))

(declare-fun m!94775 () Bool)

(assert (=> mapNonEmpty!3437 m!94775))

(declare-fun condMapEmpty!3438 () Bool)

(declare-fun mapDefault!3438 () ValueCell!926)

(assert (=> mapNonEmpty!3435 (= condMapEmpty!3438 (= mapRest!3435 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3438)))))

(declare-fun e!57658 () Bool)

(declare-fun mapRes!3438 () Bool)

(assert (=> mapNonEmpty!3435 (= tp!8997 (and e!57658 mapRes!3438))))

(declare-fun mapIsEmpty!3438 () Bool)

(assert (=> mapIsEmpty!3438 mapRes!3438))

(declare-fun b!88559 () Bool)

(declare-fun e!57657 () Bool)

(assert (=> b!88559 (= e!57657 tp_is_empty!2539)))

(declare-fun b!88560 () Bool)

(assert (=> b!88560 (= e!57658 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3438 () Bool)

(declare-fun tp!9000 () Bool)

(assert (=> mapNonEmpty!3438 (= mapRes!3438 (and tp!9000 e!57657))))

(declare-fun mapKey!3438 () (_ BitVec 32))

(declare-fun mapValue!3438 () ValueCell!926)

(declare-fun mapRest!3438 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3438 (= mapRest!3435 (store mapRest!3438 mapKey!3438 mapValue!3438))))

(assert (= (and mapNonEmpty!3435 condMapEmpty!3438) mapIsEmpty!3438))

(assert (= (and mapNonEmpty!3435 (not condMapEmpty!3438)) mapNonEmpty!3438))

(assert (= (and mapNonEmpty!3438 ((_ is ValueCellFull!926) mapValue!3438)) b!88559))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!926) mapDefault!3438)) b!88560))

(declare-fun m!94777 () Bool)

(assert (=> mapNonEmpty!3438 m!94777))

(declare-fun b_lambda!3911 () Bool)

(assert (= b_lambda!3899 (or (and b!87528 b_free!2245 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87539 b_free!2247) b_lambda!3911)))

(declare-fun b_lambda!3913 () Bool)

(assert (= b_lambda!3909 (or (and b!87528 b_free!2245 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87539 b_free!2247) b_lambda!3913)))

(declare-fun b_lambda!3915 () Bool)

(assert (= b_lambda!3905 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3915)))

(declare-fun b_lambda!3917 () Bool)

(assert (= b_lambda!3901 (or (and b!87528 b_free!2245 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87539 b_free!2247) b_lambda!3917)))

(declare-fun b_lambda!3919 () Bool)

(assert (= b_lambda!3903 (or (and b!87528 b_free!2245) (and b!87539 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))))) b_lambda!3919)))

(declare-fun b_lambda!3921 () Bool)

(assert (= b_lambda!3907 (or (and b!87528 b_free!2245 (= (defaultEntry!2358 (v!2654 (underlying!288 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87539 b_free!2247) b_lambda!3921)))

(check-sat (not b!88285) (not b!88012) (not d!23485) (not b!88400) (not b!88407) (not b!88061) (not b_lambda!3885) (not b!88257) (not b!88353) (not d!23359) (not b!88409) (not b_lambda!3915) (not b!88379) (not b!88189) (not bm!8490) (not b!88545) (not mapNonEmpty!3438) (not b!88499) (not d!23513) (not b_next!2247) (not b!88194) (not b_lambda!3921) (not b!88410) (not b!88370) (not d!23443) (not b!88042) (not d!23431) (not d!23575) (not b!88340) (not b!88040) (not b!88082) (not b!88083) (not b_lambda!3919) (not b!88260) (not b!88104) (not b!88301) (not b!88547) (not d!23533) (not b!88504) (not b!88538) (not b!88476) (not b!88165) (not b!88156) (not d!23527) (not b!88359) (not b!88362) b_and!5317 (not bm!8454) (not bm!8472) (not b!88045) (not bm!8512) (not b!88416) (not bm!8505) (not b!88455) (not bm!8518) (not d!23393) (not b!88190) (not b!88192) (not b!88034) (not b!88073) (not b!88424) (not d!23449) (not b!88013) (not b!88009) (not b!88298) (not b!88084) (not bm!8489) (not bm!8528) (not b!88184) (not d!23413) (not b!88038) (not b!88445) (not d!23343) (not b!88273) (not b!88536) (not b!88348) (not d!23335) (not b!88278) (not b!88166) (not b!88181) (not b!88411) (not d!23499) (not bm!8461) (not bm!8463) (not bm!8520) (not b!88419) (not d!23341) (not d!23439) (not d!23453) (not d!23437) (not b!88498) (not b!88264) (not b_lambda!3913) (not bm!8498) (not b!88195) (not b!88466) (not d!23423) (not b!88364) (not d!23357) (not b!88334) (not b!88546) (not d!23561) (not bm!8511) (not b!88164) (not bm!8502) (not b!88432) (not d!23333) (not d!23493) (not b!88306) (not d!23427) (not b!88397) (not b!88279) (not b!88090) (not b!88107) (not d!23569) (not b!88336) (not d!23529) (not b!88500) (not b!88496) (not d!23361) (not b!88434) (not b!88490) (not b!88420) (not d!23509) (not d!23579) (not bm!8487) (not b!88488) (not b!88486) (not b!88373) (not b!88043) (not b!88102) (not b!88249) (not d!23387) (not b!88157) (not d!23471) (not b!88114) (not b!88139) (not b!88413) (not b!88242) (not b!88453) (not b!88402) (not d!23495) (not b!88101) (not b!88033) (not bm!8519) (not b!88070) (not b!88162) (not b!88251) (not d!23473) (not b!88055) (not d!23383) (not b!88502) (not d!23549) (not b!88371) (not bm!8529) (not b!88057) (not b!88317) (not d!23365) (not b!88398) (not d!23481) (not b!87995) tp_is_empty!2539 (not bm!8508) (not b!88384) (not b!88551) (not b!88015) (not b!88021) (not b_lambda!3911) (not d!23363) (not b_lambda!3917) (not b!88244) (not d!23389) (not d!23345) (not d!23571) (not bm!8475) (not d!23467) (not b_lambda!3897) (not d!23425) (not b!88197) (not b!88474) (not b!88338) (not bm!8492) (not d!23517) (not b!88311) (not b!88439) (not b!88086) (not b!88062) (not bm!8499) (not b!88418) (not d!23417) (not b!88052) (not b!88022) (not b!88329) (not b!88493) (not b!88068) (not d!23487) (not d!23523) (not b!88187) (not d!23403) (not d!23445) (not b_lambda!3893) (not d!23391) (not b!88188) (not b!88137) (not d!23553) (not b!88447) (not bm!8495) (not d!23585) (not d!23535) (not b!87978) (not b!88481) (not b!88449) (not b!88283) (not b!88549) (not b!88016) (not b!88093) (not d!23411) (not b!88253) (not b!88543) (not b!88186) (not d!23539) (not d!23589) (not d!23377) (not b!87980) (not b!88448) (not b!88331) (not d!23367) (not d!23469) (not d!23479) (not b!88313) (not bm!8451) (not b!88094) (not d!23577) (not d!23351) (not b!88079) (not b!88135) (not b_next!2245) (not b!88441) (not b!88255) (not d!23373) (not b!88479) (not b!88178) (not b!88309) (not b!88161) (not d!23435) (not b!88337) (not b!88071) (not bm!8456) (not b!88066) (not b!88191) (not b!88491) (not b!88258) (not d!23531) (not d!23475) (not b!88328) b_and!5319 (not d!23591) (not d!23503) (not b!88352) (not d!23339) (not b!88019) (not d!23581) (not b!88262) (not d!23429) (not b!88290) (not b!88267) (not d!23433) (not b!88382) (not b!88378) (not b_lambda!3895) (not b!88443) (not d!23381) (not b!88357) (not d!23347) (not d!23355) (not b!88380) (not b!88312) (not b!88394) (not b!88011) (not b!88149) (not bm!8491) (not bm!8515) (not b!88078) (not b!88431) (not d!23491) (not b!88259) (not d!23459) (not b!88018) (not bm!8457) (not d!23385) (not d!23409) (not d!23547) (not b!88401) (not bm!8497) (not b!88234) (not b!88361) (not b!88092) (not b!88182) (not b!88300) (not d!23497) (not d!23401) (not bm!8510) (not bm!8464) (not b!88422) (not b!88239) (not d!23441) (not bm!8465) (not d!23331) (not bm!8478) (not b!88243) (not b!87979) (not d!23407) (not b!88433) (not b!88085) (not d!23505) (not bm!8527) (not b!88081) (not bm!8458) (not b!88467) (not d!23421) (not d!23369) (not b!88303) (not b!88342) (not b!88408) (not b!88274) (not d!23519) (not b!88287) (not mapNonEmpty!3437) (not d!23451) (not b!88029) (not d!23397) (not d!23465) (not b!88089) (not b!88080) (not b!88160) (not d!23349) (not b!88471) (not d!23371) (not b!88436) (not b!88247) (not b!88456) (not d!23515) (not b!88088) (not b!88163) (not b!88017) (not d!23559) (not d!23415) (not b!88540) (not b!88483) (not b!88376) (not b!88113) (not b!88297) (not b!88288) (not b!88315) (not d!23457) (not d!23353) (not b!88185) (not b!88304))
(check-sat b_and!5317 b_and!5319 (not b_next!2245) (not b_next!2247))
