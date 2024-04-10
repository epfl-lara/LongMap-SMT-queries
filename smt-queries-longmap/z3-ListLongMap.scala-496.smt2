; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11260 () Bool)

(assert start!11260)

(declare-fun b!92663 () Bool)

(declare-fun b_free!2345 () Bool)

(declare-fun b_next!2345 () Bool)

(assert (=> b!92663 (= b_free!2345 (not b_next!2345))))

(declare-fun tp!9293 () Bool)

(declare-fun b_and!5619 () Bool)

(assert (=> b!92663 (= tp!9293 b_and!5619)))

(declare-fun b!92664 () Bool)

(declare-fun b_free!2347 () Bool)

(declare-fun b_next!2347 () Bool)

(assert (=> b!92664 (= b_free!2347 (not b_next!2347))))

(declare-fun tp!9295 () Bool)

(declare-fun b_and!5621 () Bool)

(assert (=> b!92664 (= tp!9295 b_and!5621)))

(declare-fun b!92649 () Bool)

(declare-fun e!60400 () Bool)

(declare-fun e!60413 () Bool)

(assert (=> b!92649 (= e!60400 e!60413)))

(declare-fun res!47100 () Bool)

(assert (=> b!92649 (=> (not res!47100) (not e!60413))))

(declare-datatypes ((V!3099 0))(
  ( (V!3100 (val!1339 Int)) )
))
(declare-datatypes ((array!4149 0))(
  ( (array!4150 (arr!1973 (Array (_ BitVec 32) (_ BitVec 64))) (size!2221 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!951 0))(
  ( (ValueCellFull!951 (v!2733 V!3099)) (EmptyCell!951) )
))
(declare-datatypes ((array!4151 0))(
  ( (array!4152 (arr!1974 (Array (_ BitVec 32) ValueCell!951)) (size!2222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!810 0))(
  ( (LongMapFixedSize!811 (defaultEntry!2419 Int) (mask!6485 (_ BitVec 32)) (extraKeys!2248 (_ BitVec 32)) (zeroValue!2306 V!3099) (minValue!2306 V!3099) (_size!454 (_ BitVec 32)) (_keys!4101 array!4149) (_values!2402 array!4151) (_vacant!454 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!610 0))(
  ( (Cell!611 (v!2734 LongMapFixedSize!810)) )
))
(declare-datatypes ((LongMap!610 0))(
  ( (LongMap!611 (underlying!316 Cell!610)) )
))
(declare-fun thiss!992 () LongMap!610)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!92649 (= res!47100 (and (not (= (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45551 () V!3099)

(declare-fun get!1244 (ValueCell!951 V!3099) V!3099)

(declare-fun dynLambda!356 (Int (_ BitVec 64)) V!3099)

(assert (=> b!92649 (= lt!45551 (get!1244 (select (arr!1974 (_values!2402 (v!2734 (underlying!316 thiss!992)))) from!355) (dynLambda!356 (defaultEntry!2419 (v!2734 (underlying!316 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92650 () Bool)

(declare-fun e!60401 () Bool)

(declare-fun tp_is_empty!2589 () Bool)

(assert (=> b!92650 (= e!60401 tp_is_empty!2589)))

(declare-fun b!92651 () Bool)

(declare-fun res!47101 () Bool)

(declare-fun e!60397 () Bool)

(assert (=> b!92651 (=> res!47101 e!60397)))

(declare-datatypes ((tuple2!2278 0))(
  ( (tuple2!2279 (_1!1150 Bool) (_2!1150 LongMapFixedSize!810)) )
))
(declare-fun lt!45539 () tuple2!2278)

(assert (=> b!92651 (= res!47101 (bvslt (bvadd #b00000000000000000000000000000001 (mask!6485 (_2!1150 lt!45539))) (_size!454 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun b!92652 () Bool)

(declare-fun e!60412 () Bool)

(declare-fun e!60404 () Bool)

(assert (=> b!92652 (= e!60412 e!60404)))

(declare-fun b!92653 () Bool)

(declare-fun e!60399 () Bool)

(assert (=> b!92653 (= e!60399 tp_is_empty!2589)))

(declare-fun b!92654 () Bool)

(declare-fun e!60402 () Bool)

(assert (=> b!92654 (= e!60404 e!60402)))

(declare-fun b!92655 () Bool)

(declare-fun e!60396 () Bool)

(assert (=> b!92655 (= e!60396 e!60400)))

(declare-fun res!47105 () Bool)

(assert (=> b!92655 (=> (not res!47105) (not e!60400))))

(declare-datatypes ((tuple2!2280 0))(
  ( (tuple2!2281 (_1!1151 (_ BitVec 64)) (_2!1151 V!3099)) )
))
(declare-datatypes ((List!1556 0))(
  ( (Nil!1553) (Cons!1552 (h!2144 tuple2!2280) (t!5410 List!1556)) )
))
(declare-datatypes ((ListLongMap!1505 0))(
  ( (ListLongMap!1506 (toList!768 List!1556)) )
))
(declare-fun lt!45544 () ListLongMap!1505)

(declare-fun lt!45552 () ListLongMap!1505)

(assert (=> b!92655 (= res!47105 (= lt!45544 lt!45552))))

(declare-fun newMap!16 () LongMapFixedSize!810)

(declare-fun map!1227 (LongMapFixedSize!810) ListLongMap!1505)

(assert (=> b!92655 (= lt!45552 (map!1227 newMap!16))))

(declare-fun getCurrentListMap!460 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3099 V!3099 (_ BitVec 32) Int) ListLongMap!1505)

(assert (=> b!92655 (= lt!45544 (getCurrentListMap!460 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (_values!2402 (v!2734 (underlying!316 thiss!992))) (mask!6485 (v!2734 (underlying!316 thiss!992))) (extraKeys!2248 (v!2734 (underlying!316 thiss!992))) (zeroValue!2306 (v!2734 (underlying!316 thiss!992))) (minValue!2306 (v!2734 (underlying!316 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun b!92657 () Bool)

(declare-fun e!60411 () Bool)

(assert (=> b!92657 (= e!60413 e!60411)))

(declare-fun res!47104 () Bool)

(assert (=> b!92657 (=> (not res!47104) (not e!60411))))

(assert (=> b!92657 (= res!47104 (and (_1!1150 lt!45539) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2763 0))(
  ( (Unit!2764) )
))
(declare-fun lt!45547 () Unit!2763)

(declare-fun e!60398 () Unit!2763)

(assert (=> b!92657 (= lt!45547 e!60398)))

(declare-fun c!15451 () Bool)

(declare-fun contains!782 (ListLongMap!1505 (_ BitVec 64)) Bool)

(assert (=> b!92657 (= c!15451 (contains!782 lt!45552 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355)))))

(declare-fun update!129 (LongMapFixedSize!810 (_ BitVec 64) V!3099) tuple2!2278)

(assert (=> b!92657 (= lt!45539 (update!129 newMap!16 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) lt!45551))))

(declare-fun mapNonEmpty!3595 () Bool)

(declare-fun mapRes!3595 () Bool)

(declare-fun tp!9296 () Bool)

(declare-fun e!60405 () Bool)

(assert (=> mapNonEmpty!3595 (= mapRes!3595 (and tp!9296 e!60405))))

(declare-fun mapRest!3595 () (Array (_ BitVec 32) ValueCell!951))

(declare-fun mapKey!3596 () (_ BitVec 32))

(declare-fun mapValue!3596 () ValueCell!951)

(assert (=> mapNonEmpty!3595 (= (arr!1974 (_values!2402 newMap!16)) (store mapRest!3595 mapKey!3596 mapValue!3596))))

(declare-fun mapIsEmpty!3595 () Bool)

(declare-fun mapRes!3596 () Bool)

(assert (=> mapIsEmpty!3595 mapRes!3596))

(declare-fun b!92658 () Bool)

(declare-fun e!60407 () Bool)

(assert (=> b!92658 (= e!60407 (and e!60401 mapRes!3595))))

(declare-fun condMapEmpty!3595 () Bool)

(declare-fun mapDefault!3595 () ValueCell!951)

(assert (=> b!92658 (= condMapEmpty!3595 (= (arr!1974 (_values!2402 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!951)) mapDefault!3595)))))

(declare-fun b!92659 () Bool)

(declare-fun res!47103 () Bool)

(assert (=> b!92659 (=> (not res!47103) (not e!60396))))

(declare-fun valid!358 (LongMapFixedSize!810) Bool)

(assert (=> b!92659 (= res!47103 (valid!358 newMap!16))))

(declare-fun b!92660 () Bool)

(declare-fun Unit!2765 () Unit!2763)

(assert (=> b!92660 (= e!60398 Unit!2765)))

(declare-fun lt!45550 () Unit!2763)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!80 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3099 V!3099 (_ BitVec 64) (_ BitVec 32) Int) Unit!2763)

(assert (=> b!92660 (= lt!45550 (lemmaListMapContainsThenArrayContainsFrom!80 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (_values!2402 (v!2734 (underlying!316 thiss!992))) (mask!6485 (v!2734 (underlying!316 thiss!992))) (extraKeys!2248 (v!2734 (underlying!316 thiss!992))) (zeroValue!2306 (v!2734 (underlying!316 thiss!992))) (minValue!2306 (v!2734 (underlying!316 thiss!992))) (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92660 (arrayContainsKey!0 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45542 () Unit!2763)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4149 (_ BitVec 32) (_ BitVec 32)) Unit!2763)

(assert (=> b!92660 (= lt!45542 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4101 (v!2734 (underlying!316 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1557 0))(
  ( (Nil!1554) (Cons!1553 (h!2145 (_ BitVec 64)) (t!5411 List!1557)) )
))
(declare-fun arrayNoDuplicates!0 (array!4149 (_ BitVec 32) List!1557) Bool)

(assert (=> b!92660 (arrayNoDuplicates!0 (_keys!4101 (v!2734 (underlying!316 thiss!992))) from!355 Nil!1554)))

(declare-fun lt!45540 () Unit!2763)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4149 (_ BitVec 32) (_ BitVec 64) List!1557) Unit!2763)

(assert (=> b!92660 (= lt!45540 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) (Cons!1553 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) Nil!1554)))))

(assert (=> b!92660 false))

(declare-fun b!92661 () Bool)

(declare-fun Unit!2766 () Unit!2763)

(assert (=> b!92661 (= e!60398 Unit!2766)))

(declare-fun b!92662 () Bool)

(declare-fun lt!45538 () ListLongMap!1505)

(assert (=> b!92662 (= e!60397 (= (getCurrentListMap!460 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (_values!2402 (v!2734 (underlying!316 thiss!992))) (mask!6485 (v!2734 (underlying!316 thiss!992))) (extraKeys!2248 (v!2734 (underlying!316 thiss!992))) (zeroValue!2306 (v!2734 (underlying!316 thiss!992))) (minValue!2306 (v!2734 (underlying!316 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))) lt!45538))))

(declare-fun e!60410 () Bool)

(declare-fun array_inv!1223 (array!4149) Bool)

(declare-fun array_inv!1224 (array!4151) Bool)

(assert (=> b!92663 (= e!60402 (and tp!9293 tp_is_empty!2589 (array_inv!1223 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) (array_inv!1224 (_values!2402 (v!2734 (underlying!316 thiss!992)))) e!60410))))

(declare-fun e!60406 () Bool)

(assert (=> b!92664 (= e!60406 (and tp!9295 tp_is_empty!2589 (array_inv!1223 (_keys!4101 newMap!16)) (array_inv!1224 (_values!2402 newMap!16)) e!60407))))

(declare-fun b!92665 () Bool)

(declare-fun res!47102 () Bool)

(assert (=> b!92665 (=> (not res!47102) (not e!60396))))

(assert (=> b!92665 (= res!47102 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2221 (_keys!4101 (v!2734 (underlying!316 thiss!992)))))))))

(declare-fun b!92656 () Bool)

(declare-fun e!60409 () Bool)

(assert (=> b!92656 (= e!60410 (and e!60409 mapRes!3596))))

(declare-fun condMapEmpty!3596 () Bool)

(declare-fun mapDefault!3596 () ValueCell!951)

(assert (=> b!92656 (= condMapEmpty!3596 (= (arr!1974 (_values!2402 (v!2734 (underlying!316 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!951)) mapDefault!3596)))))

(declare-fun res!47106 () Bool)

(assert (=> start!11260 (=> (not res!47106) (not e!60396))))

(declare-fun valid!359 (LongMap!610) Bool)

(assert (=> start!11260 (= res!47106 (valid!359 thiss!992))))

(assert (=> start!11260 e!60396))

(assert (=> start!11260 e!60412))

(assert (=> start!11260 true))

(assert (=> start!11260 e!60406))

(declare-fun b!92666 () Bool)

(assert (=> b!92666 (= e!60405 tp_is_empty!2589)))

(declare-fun mapNonEmpty!3596 () Bool)

(declare-fun tp!9294 () Bool)

(assert (=> mapNonEmpty!3596 (= mapRes!3596 (and tp!9294 e!60399))))

(declare-fun mapKey!3595 () (_ BitVec 32))

(declare-fun mapValue!3595 () ValueCell!951)

(declare-fun mapRest!3596 () (Array (_ BitVec 32) ValueCell!951))

(assert (=> mapNonEmpty!3596 (= (arr!1974 (_values!2402 (v!2734 (underlying!316 thiss!992)))) (store mapRest!3596 mapKey!3595 mapValue!3595))))

(declare-fun b!92667 () Bool)

(declare-fun res!47099 () Bool)

(assert (=> b!92667 (=> res!47099 e!60397)))

(assert (=> b!92667 (= res!47099 (not (valid!358 (_2!1150 lt!45539))))))

(declare-fun b!92668 () Bool)

(assert (=> b!92668 (= e!60409 tp_is_empty!2589)))

(declare-fun mapIsEmpty!3596 () Bool)

(assert (=> mapIsEmpty!3596 mapRes!3595))

(declare-fun b!92669 () Bool)

(declare-fun res!47098 () Bool)

(assert (=> b!92669 (=> (not res!47098) (not e!60396))))

(assert (=> b!92669 (= res!47098 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6485 newMap!16)) (_size!454 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun b!92670 () Bool)

(assert (=> b!92670 (= e!60411 (not e!60397))))

(declare-fun res!47097 () Bool)

(assert (=> b!92670 (=> res!47097 e!60397)))

(declare-fun lt!45549 () ListLongMap!1505)

(assert (=> b!92670 (= res!47097 (or (not (= lt!45549 lt!45538)) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2221 (_keys!4101 (v!2734 (underlying!316 thiss!992)))))))))

(assert (=> b!92670 (= lt!45538 (map!1227 (_2!1150 lt!45539)))))

(assert (=> b!92670 (= lt!45549 (getCurrentListMap!460 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (_values!2402 (v!2734 (underlying!316 thiss!992))) (mask!6485 (v!2734 (underlying!316 thiss!992))) (extraKeys!2248 (v!2734 (underlying!316 thiss!992))) (zeroValue!2306 (v!2734 (underlying!316 thiss!992))) (minValue!2306 (v!2734 (underlying!316 thiss!992))) from!355 (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun lt!45537 () ListLongMap!1505)

(declare-fun lt!45543 () tuple2!2280)

(declare-fun lt!45545 () tuple2!2280)

(declare-fun lt!45548 () ListLongMap!1505)

(declare-fun +!128 (ListLongMap!1505 tuple2!2280) ListLongMap!1505)

(assert (=> b!92670 (= (+!128 lt!45537 lt!45545) (+!128 (+!128 lt!45548 lt!45545) lt!45543))))

(assert (=> b!92670 (= lt!45545 (tuple2!2281 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2306 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun lt!45534 () Unit!2763)

(declare-fun addCommutativeForDiffKeys!47 (ListLongMap!1505 (_ BitVec 64) V!3099 (_ BitVec 64) V!3099) Unit!2763)

(assert (=> b!92670 (= lt!45534 (addCommutativeForDiffKeys!47 lt!45548 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) lt!45551 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2306 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun lt!45541 () ListLongMap!1505)

(assert (=> b!92670 (= lt!45541 lt!45537)))

(assert (=> b!92670 (= lt!45537 (+!128 lt!45548 lt!45543))))

(declare-fun lt!45546 () ListLongMap!1505)

(declare-fun lt!45533 () tuple2!2280)

(assert (=> b!92670 (= lt!45541 (+!128 lt!45546 lt!45533))))

(declare-fun lt!45536 () ListLongMap!1505)

(assert (=> b!92670 (= lt!45548 (+!128 lt!45536 lt!45533))))

(assert (=> b!92670 (= lt!45533 (tuple2!2281 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2306 (v!2734 (underlying!316 thiss!992)))))))

(assert (=> b!92670 (= lt!45546 (+!128 lt!45536 lt!45543))))

(assert (=> b!92670 (= lt!45543 (tuple2!2281 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) lt!45551))))

(declare-fun lt!45535 () Unit!2763)

(assert (=> b!92670 (= lt!45535 (addCommutativeForDiffKeys!47 lt!45536 (select (arr!1973 (_keys!4101 (v!2734 (underlying!316 thiss!992)))) from!355) lt!45551 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2306 (v!2734 (underlying!316 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!93 (array!4149 array!4151 (_ BitVec 32) (_ BitVec 32) V!3099 V!3099 (_ BitVec 32) Int) ListLongMap!1505)

(assert (=> b!92670 (= lt!45536 (getCurrentListMapNoExtraKeys!93 (_keys!4101 (v!2734 (underlying!316 thiss!992))) (_values!2402 (v!2734 (underlying!316 thiss!992))) (mask!6485 (v!2734 (underlying!316 thiss!992))) (extraKeys!2248 (v!2734 (underlying!316 thiss!992))) (zeroValue!2306 (v!2734 (underlying!316 thiss!992))) (minValue!2306 (v!2734 (underlying!316 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))))))

(assert (= (and start!11260 res!47106) b!92665))

(assert (= (and b!92665 res!47102) b!92659))

(assert (= (and b!92659 res!47103) b!92669))

(assert (= (and b!92669 res!47098) b!92655))

(assert (= (and b!92655 res!47105) b!92649))

(assert (= (and b!92649 res!47100) b!92657))

(assert (= (and b!92657 c!15451) b!92660))

(assert (= (and b!92657 (not c!15451)) b!92661))

(assert (= (and b!92657 res!47104) b!92670))

(assert (= (and b!92670 (not res!47097)) b!92667))

(assert (= (and b!92667 (not res!47099)) b!92651))

(assert (= (and b!92651 (not res!47101)) b!92662))

(assert (= (and b!92656 condMapEmpty!3596) mapIsEmpty!3595))

(assert (= (and b!92656 (not condMapEmpty!3596)) mapNonEmpty!3596))

(get-info :version)

(assert (= (and mapNonEmpty!3596 ((_ is ValueCellFull!951) mapValue!3595)) b!92653))

(assert (= (and b!92656 ((_ is ValueCellFull!951) mapDefault!3596)) b!92668))

(assert (= b!92663 b!92656))

(assert (= b!92654 b!92663))

(assert (= b!92652 b!92654))

(assert (= start!11260 b!92652))

(assert (= (and b!92658 condMapEmpty!3595) mapIsEmpty!3596))

(assert (= (and b!92658 (not condMapEmpty!3595)) mapNonEmpty!3595))

(assert (= (and mapNonEmpty!3595 ((_ is ValueCellFull!951) mapValue!3596)) b!92666))

(assert (= (and b!92658 ((_ is ValueCellFull!951) mapDefault!3595)) b!92650))

(assert (= b!92664 b!92658))

(assert (= start!11260 b!92664))

(declare-fun b_lambda!4091 () Bool)

(assert (=> (not b_lambda!4091) (not b!92649)))

(declare-fun t!5407 () Bool)

(declare-fun tb!1821 () Bool)

(assert (=> (and b!92663 (= (defaultEntry!2419 (v!2734 (underlying!316 thiss!992))) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))) t!5407) tb!1821))

(declare-fun result!3111 () Bool)

(assert (=> tb!1821 (= result!3111 tp_is_empty!2589)))

(assert (=> b!92649 t!5407))

(declare-fun b_and!5623 () Bool)

(assert (= b_and!5619 (and (=> t!5407 result!3111) b_and!5623)))

(declare-fun t!5409 () Bool)

(declare-fun tb!1823 () Bool)

(assert (=> (and b!92664 (= (defaultEntry!2419 newMap!16) (defaultEntry!2419 (v!2734 (underlying!316 thiss!992)))) t!5409) tb!1823))

(declare-fun result!3115 () Bool)

(assert (= result!3115 result!3111))

(assert (=> b!92649 t!5409))

(declare-fun b_and!5625 () Bool)

(assert (= b_and!5621 (and (=> t!5409 result!3115) b_and!5625)))

(declare-fun m!100067 () Bool)

(assert (=> mapNonEmpty!3595 m!100067))

(declare-fun m!100069 () Bool)

(assert (=> b!92664 m!100069))

(declare-fun m!100071 () Bool)

(assert (=> b!92664 m!100071))

(declare-fun m!100073 () Bool)

(assert (=> b!92660 m!100073))

(declare-fun m!100075 () Bool)

(assert (=> b!92660 m!100075))

(declare-fun m!100077 () Bool)

(assert (=> b!92660 m!100077))

(declare-fun m!100079 () Bool)

(assert (=> b!92660 m!100079))

(assert (=> b!92660 m!100077))

(assert (=> b!92660 m!100077))

(declare-fun m!100081 () Bool)

(assert (=> b!92660 m!100081))

(assert (=> b!92660 m!100077))

(declare-fun m!100083 () Bool)

(assert (=> b!92660 m!100083))

(assert (=> b!92649 m!100077))

(declare-fun m!100085 () Bool)

(assert (=> b!92649 m!100085))

(declare-fun m!100087 () Bool)

(assert (=> b!92649 m!100087))

(assert (=> b!92649 m!100085))

(assert (=> b!92649 m!100087))

(declare-fun m!100089 () Bool)

(assert (=> b!92649 m!100089))

(declare-fun m!100091 () Bool)

(assert (=> mapNonEmpty!3596 m!100091))

(declare-fun m!100093 () Bool)

(assert (=> b!92655 m!100093))

(declare-fun m!100095 () Bool)

(assert (=> b!92655 m!100095))

(assert (=> b!92657 m!100077))

(assert (=> b!92657 m!100077))

(declare-fun m!100097 () Bool)

(assert (=> b!92657 m!100097))

(assert (=> b!92657 m!100077))

(declare-fun m!100099 () Bool)

(assert (=> b!92657 m!100099))

(declare-fun m!100101 () Bool)

(assert (=> b!92659 m!100101))

(declare-fun m!100103 () Bool)

(assert (=> b!92667 m!100103))

(declare-fun m!100105 () Bool)

(assert (=> b!92670 m!100105))

(declare-fun m!100107 () Bool)

(assert (=> b!92670 m!100107))

(declare-fun m!100109 () Bool)

(assert (=> b!92670 m!100109))

(declare-fun m!100111 () Bool)

(assert (=> b!92670 m!100111))

(declare-fun m!100113 () Bool)

(assert (=> b!92670 m!100113))

(declare-fun m!100115 () Bool)

(assert (=> b!92670 m!100115))

(declare-fun m!100117 () Bool)

(assert (=> b!92670 m!100117))

(assert (=> b!92670 m!100077))

(assert (=> b!92670 m!100109))

(assert (=> b!92670 m!100077))

(declare-fun m!100119 () Bool)

(assert (=> b!92670 m!100119))

(assert (=> b!92670 m!100077))

(declare-fun m!100121 () Bool)

(assert (=> b!92670 m!100121))

(declare-fun m!100123 () Bool)

(assert (=> b!92670 m!100123))

(declare-fun m!100125 () Bool)

(assert (=> b!92670 m!100125))

(declare-fun m!100127 () Bool)

(assert (=> b!92670 m!100127))

(declare-fun m!100129 () Bool)

(assert (=> b!92662 m!100129))

(declare-fun m!100131 () Bool)

(assert (=> start!11260 m!100131))

(declare-fun m!100133 () Bool)

(assert (=> b!92663 m!100133))

(declare-fun m!100135 () Bool)

(assert (=> b!92663 m!100135))

(check-sat (not b!92660) (not mapNonEmpty!3595) (not b_next!2347) (not b!92655) b_and!5623 b_and!5625 (not b!92664) (not mapNonEmpty!3596) (not b!92662) (not b_next!2345) tp_is_empty!2589 (not start!11260) (not b!92657) (not b!92670) (not b!92667) (not b!92659) (not b_lambda!4091) (not b!92663) (not b!92649))
(check-sat b_and!5623 b_and!5625 (not b_next!2345) (not b_next!2347))
