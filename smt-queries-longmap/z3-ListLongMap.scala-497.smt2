; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11268 () Bool)

(assert start!11268)

(declare-fun b!92654 () Bool)

(declare-fun b_free!2353 () Bool)

(declare-fun b_next!2353 () Bool)

(assert (=> b!92654 (= b_free!2353 (not b_next!2353))))

(declare-fun tp!9319 () Bool)

(declare-fun b_and!5621 () Bool)

(assert (=> b!92654 (= tp!9319 b_and!5621)))

(declare-fun b!92665 () Bool)

(declare-fun b_free!2355 () Bool)

(declare-fun b_next!2355 () Bool)

(assert (=> b!92665 (= b_free!2355 (not b_next!2355))))

(declare-fun tp!9320 () Bool)

(declare-fun b_and!5623 () Bool)

(assert (=> b!92665 (= tp!9320 b_and!5623)))

(declare-fun b!92645 () Bool)

(declare-fun res!47101 () Bool)

(declare-fun e!60433 () Bool)

(assert (=> b!92645 (=> (not res!47101) (not e!60433))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3105 0))(
  ( (V!3106 (val!1341 Int)) )
))
(declare-datatypes ((array!4137 0))(
  ( (array!4138 (arr!1966 (Array (_ BitVec 32) (_ BitVec 64))) (size!2215 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!953 0))(
  ( (ValueCellFull!953 (v!2731 V!3105)) (EmptyCell!953) )
))
(declare-datatypes ((array!4139 0))(
  ( (array!4140 (arr!1967 (Array (_ BitVec 32) ValueCell!953)) (size!2216 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!814 0))(
  ( (LongMapFixedSize!815 (defaultEntry!2421 Int) (mask!6488 (_ BitVec 32)) (extraKeys!2250 (_ BitVec 32)) (zeroValue!2308 V!3105) (minValue!2308 V!3105) (_size!456 (_ BitVec 32)) (_keys!4102 array!4137) (_values!2404 array!4139) (_vacant!456 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!606 0))(
  ( (Cell!607 (v!2732 LongMapFixedSize!814)) )
))
(declare-datatypes ((LongMap!606 0))(
  ( (LongMap!607 (underlying!314 Cell!606)) )
))
(declare-fun thiss!992 () LongMap!606)

(assert (=> b!92645 (= res!47101 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2215 (_keys!4102 (v!2732 (underlying!314 thiss!992)))))))))

(declare-fun mapIsEmpty!3607 () Bool)

(declare-fun mapRes!3608 () Bool)

(assert (=> mapIsEmpty!3607 mapRes!3608))

(declare-fun b!92646 () Bool)

(declare-fun res!47102 () Bool)

(assert (=> b!92646 (=> (not res!47102) (not e!60433))))

(declare-fun newMap!16 () LongMapFixedSize!814)

(assert (=> b!92646 (= res!47102 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6488 newMap!16)) (_size!456 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun b!92647 () Bool)

(declare-fun e!60420 () Bool)

(declare-fun e!60434 () Bool)

(assert (=> b!92647 (= e!60420 e!60434)))

(declare-fun b!92648 () Bool)

(declare-fun e!60422 () Bool)

(declare-fun tp_is_empty!2593 () Bool)

(assert (=> b!92648 (= e!60422 tp_is_empty!2593)))

(declare-fun b!92649 () Bool)

(declare-fun e!60430 () Bool)

(assert (=> b!92649 (= e!60430 tp_is_empty!2593)))

(declare-fun b!92650 () Bool)

(declare-datatypes ((Unit!2766 0))(
  ( (Unit!2767) )
))
(declare-fun e!60435 () Unit!2766)

(declare-fun Unit!2768 () Unit!2766)

(assert (=> b!92650 (= e!60435 Unit!2768)))

(declare-fun mapNonEmpty!3607 () Bool)

(declare-fun tp!9318 () Bool)

(assert (=> mapNonEmpty!3607 (= mapRes!3608 (and tp!9318 e!60430))))

(declare-fun mapRest!3607 () (Array (_ BitVec 32) ValueCell!953))

(declare-fun mapKey!3607 () (_ BitVec 32))

(declare-fun mapValue!3607 () ValueCell!953)

(assert (=> mapNonEmpty!3607 (= (arr!1967 (_values!2404 newMap!16)) (store mapRest!3607 mapKey!3607 mapValue!3607))))

(declare-fun b!92651 () Bool)

(declare-fun e!60425 () Bool)

(declare-fun e!60431 () Bool)

(assert (=> b!92651 (= e!60425 e!60431)))

(declare-fun res!47104 () Bool)

(assert (=> b!92651 (=> res!47104 e!60431)))

(declare-datatypes ((tuple2!2270 0))(
  ( (tuple2!2271 (_1!1146 Bool) (_2!1146 LongMapFixedSize!814)) )
))
(declare-fun lt!45556 () tuple2!2270)

(assert (=> b!92651 (= res!47104 (not (_1!1146 lt!45556)))))

(declare-fun lt!45570 () tuple2!2270)

(declare-fun repackFrom!10 (LongMap!606 LongMapFixedSize!814 (_ BitVec 32)) tuple2!2270)

(assert (=> b!92651 (= lt!45556 (repackFrom!10 thiss!992 (_2!1146 lt!45570) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun b!92653 () Bool)

(declare-fun e!60424 () Bool)

(assert (=> b!92653 (= e!60424 e!60420)))

(declare-fun e!60421 () Bool)

(declare-fun array_inv!1229 (array!4137) Bool)

(declare-fun array_inv!1230 (array!4139) Bool)

(assert (=> b!92654 (= e!60434 (and tp!9319 tp_is_empty!2593 (array_inv!1229 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) (array_inv!1230 (_values!2404 (v!2732 (underlying!314 thiss!992)))) e!60421))))

(declare-fun b!92655 () Bool)

(declare-fun mapRes!3607 () Bool)

(assert (=> b!92655 (= e!60421 (and e!60422 mapRes!3607))))

(declare-fun condMapEmpty!3608 () Bool)

(declare-fun mapDefault!3607 () ValueCell!953)

(assert (=> b!92655 (= condMapEmpty!3608 (= (arr!1967 (_values!2404 (v!2732 (underlying!314 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!953)) mapDefault!3607)))))

(declare-fun mapIsEmpty!3608 () Bool)

(assert (=> mapIsEmpty!3608 mapRes!3607))

(declare-fun b!92656 () Bool)

(declare-fun e!60423 () Bool)

(declare-fun e!60429 () Bool)

(assert (=> b!92656 (= e!60423 (and e!60429 mapRes!3608))))

(declare-fun condMapEmpty!3607 () Bool)

(declare-fun mapDefault!3608 () ValueCell!953)

(assert (=> b!92656 (= condMapEmpty!3607 (= (arr!1967 (_values!2404 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!953)) mapDefault!3608)))))

(declare-fun b!92657 () Bool)

(declare-fun res!47103 () Bool)

(assert (=> b!92657 (=> (not res!47103) (not e!60433))))

(declare-fun valid!368 (LongMapFixedSize!814) Bool)

(assert (=> b!92657 (= res!47103 (valid!368 newMap!16))))

(declare-fun b!92658 () Bool)

(assert (=> b!92658 (= e!60429 tp_is_empty!2593)))

(declare-fun b!92659 () Bool)

(declare-fun Unit!2769 () Unit!2766)

(assert (=> b!92659 (= e!60435 Unit!2769)))

(declare-fun lt!45573 () Unit!2766)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!84 (array!4137 array!4139 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 64) (_ BitVec 32) Int) Unit!2766)

(assert (=> b!92659 (= lt!45573 (lemmaListMapContainsThenArrayContainsFrom!84 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (_values!2404 (v!2732 (underlying!314 thiss!992))) (mask!6488 (v!2732 (underlying!314 thiss!992))) (extraKeys!2250 (v!2732 (underlying!314 thiss!992))) (zeroValue!2308 (v!2732 (underlying!314 thiss!992))) (minValue!2308 (v!2732 (underlying!314 thiss!992))) (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92659 (arrayContainsKey!0 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45562 () Unit!2766)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4137 (_ BitVec 32) (_ BitVec 32)) Unit!2766)

(assert (=> b!92659 (= lt!45562 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4102 (v!2732 (underlying!314 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1561 0))(
  ( (Nil!1558) (Cons!1557 (h!2149 (_ BitVec 64)) (t!5418 List!1561)) )
))
(declare-fun arrayNoDuplicates!0 (array!4137 (_ BitVec 32) List!1561) Bool)

(assert (=> b!92659 (arrayNoDuplicates!0 (_keys!4102 (v!2732 (underlying!314 thiss!992))) from!355 Nil!1558)))

(declare-fun lt!45560 () Unit!2766)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4137 (_ BitVec 32) (_ BitVec 64) List!1561) Unit!2766)

(assert (=> b!92659 (= lt!45560 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) (Cons!1557 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) Nil!1558)))))

(assert (=> b!92659 false))

(declare-fun b!92660 () Bool)

(declare-fun e!60426 () Bool)

(assert (=> b!92660 (= e!60426 tp_is_empty!2593)))

(declare-fun b!92661 () Bool)

(declare-fun e!60427 () Bool)

(declare-fun e!60436 () Bool)

(assert (=> b!92661 (= e!60427 e!60436)))

(declare-fun res!47105 () Bool)

(assert (=> b!92661 (=> (not res!47105) (not e!60436))))

(assert (=> b!92661 (= res!47105 (and (not (= (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45566 () V!3105)

(declare-fun get!1251 (ValueCell!953 V!3105) V!3105)

(declare-fun dynLambda!358 (Int (_ BitVec 64)) V!3105)

(assert (=> b!92661 (= lt!45566 (get!1251 (select (arr!1967 (_values!2404 (v!2732 (underlying!314 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2421 (v!2732 (underlying!314 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92662 () Bool)

(assert (=> b!92662 (= e!60431 true)))

(declare-fun lt!45554 () Bool)

(assert (=> b!92662 (= lt!45554 (valid!368 (_2!1146 lt!45556)))))

(declare-fun mapNonEmpty!3608 () Bool)

(declare-fun tp!9317 () Bool)

(assert (=> mapNonEmpty!3608 (= mapRes!3607 (and tp!9317 e!60426))))

(declare-fun mapValue!3608 () ValueCell!953)

(declare-fun mapRest!3608 () (Array (_ BitVec 32) ValueCell!953))

(declare-fun mapKey!3608 () (_ BitVec 32))

(assert (=> mapNonEmpty!3608 (= (arr!1967 (_values!2404 (v!2732 (underlying!314 thiss!992)))) (store mapRest!3608 mapKey!3608 mapValue!3608))))

(declare-fun b!92663 () Bool)

(declare-fun e!60428 () Bool)

(assert (=> b!92663 (= e!60428 (not e!60425))))

(declare-fun res!47097 () Bool)

(assert (=> b!92663 (=> res!47097 e!60425)))

(declare-datatypes ((tuple2!2272 0))(
  ( (tuple2!2273 (_1!1147 (_ BitVec 64)) (_2!1147 V!3105)) )
))
(declare-datatypes ((List!1562 0))(
  ( (Nil!1559) (Cons!1558 (h!2150 tuple2!2272) (t!5419 List!1562)) )
))
(declare-datatypes ((ListLongMap!1485 0))(
  ( (ListLongMap!1486 (toList!758 List!1562)) )
))
(declare-fun getCurrentListMap!441 (array!4137 array!4139 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1485)

(declare-fun map!1219 (LongMapFixedSize!814) ListLongMap!1485)

(assert (=> b!92663 (= res!47097 (not (= (getCurrentListMap!441 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (_values!2404 (v!2732 (underlying!314 thiss!992))) (mask!6488 (v!2732 (underlying!314 thiss!992))) (extraKeys!2250 (v!2732 (underlying!314 thiss!992))) (zeroValue!2308 (v!2732 (underlying!314 thiss!992))) (minValue!2308 (v!2732 (underlying!314 thiss!992))) from!355 (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))) (map!1219 (_2!1146 lt!45570)))))))

(declare-fun lt!45555 () tuple2!2272)

(declare-fun lt!45564 () tuple2!2272)

(declare-fun lt!45563 () ListLongMap!1485)

(declare-fun lt!45568 () ListLongMap!1485)

(declare-fun +!121 (ListLongMap!1485 tuple2!2272) ListLongMap!1485)

(assert (=> b!92663 (= (+!121 lt!45563 lt!45564) (+!121 (+!121 lt!45568 lt!45564) lt!45555))))

(assert (=> b!92663 (= lt!45564 (tuple2!2273 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun lt!45567 () Unit!2766)

(declare-fun addCommutativeForDiffKeys!40 (ListLongMap!1485 (_ BitVec 64) V!3105 (_ BitVec 64) V!3105) Unit!2766)

(assert (=> b!92663 (= lt!45567 (addCommutativeForDiffKeys!40 lt!45568 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) lt!45566 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2308 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun lt!45571 () ListLongMap!1485)

(assert (=> b!92663 (= lt!45571 lt!45563)))

(assert (=> b!92663 (= lt!45563 (+!121 lt!45568 lt!45555))))

(declare-fun lt!45572 () ListLongMap!1485)

(declare-fun lt!45557 () tuple2!2272)

(assert (=> b!92663 (= lt!45571 (+!121 lt!45572 lt!45557))))

(declare-fun lt!45569 () ListLongMap!1485)

(assert (=> b!92663 (= lt!45568 (+!121 lt!45569 lt!45557))))

(assert (=> b!92663 (= lt!45557 (tuple2!2273 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2732 (underlying!314 thiss!992)))))))

(assert (=> b!92663 (= lt!45572 (+!121 lt!45569 lt!45555))))

(assert (=> b!92663 (= lt!45555 (tuple2!2273 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) lt!45566))))

(declare-fun lt!45561 () Unit!2766)

(assert (=> b!92663 (= lt!45561 (addCommutativeForDiffKeys!40 lt!45569 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) lt!45566 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2308 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!85 (array!4137 array!4139 (_ BitVec 32) (_ BitVec 32) V!3105 V!3105 (_ BitVec 32) Int) ListLongMap!1485)

(assert (=> b!92663 (= lt!45569 (getCurrentListMapNoExtraKeys!85 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (_values!2404 (v!2732 (underlying!314 thiss!992))) (mask!6488 (v!2732 (underlying!314 thiss!992))) (extraKeys!2250 (v!2732 (underlying!314 thiss!992))) (zeroValue!2308 (v!2732 (underlying!314 thiss!992))) (minValue!2308 (v!2732 (underlying!314 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))))))

(declare-fun res!47098 () Bool)

(assert (=> start!11268 (=> (not res!47098) (not e!60433))))

(declare-fun valid!369 (LongMap!606) Bool)

(assert (=> start!11268 (= res!47098 (valid!369 thiss!992))))

(assert (=> start!11268 e!60433))

(assert (=> start!11268 e!60424))

(assert (=> start!11268 true))

(declare-fun e!60419 () Bool)

(assert (=> start!11268 e!60419))

(declare-fun b!92652 () Bool)

(assert (=> b!92652 (= e!60436 e!60428)))

(declare-fun res!47100 () Bool)

(assert (=> b!92652 (=> (not res!47100) (not e!60428))))

(assert (=> b!92652 (= res!47100 (and (_1!1146 lt!45570) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!45558 () Unit!2766)

(assert (=> b!92652 (= lt!45558 e!60435)))

(declare-fun lt!45565 () ListLongMap!1485)

(declare-fun c!15417 () Bool)

(declare-fun contains!777 (ListLongMap!1485 (_ BitVec 64)) Bool)

(assert (=> b!92652 (= c!15417 (contains!777 lt!45565 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355)))))

(declare-fun update!135 (LongMapFixedSize!814 (_ BitVec 64) V!3105) tuple2!2270)

(assert (=> b!92652 (= lt!45570 (update!135 newMap!16 (select (arr!1966 (_keys!4102 (v!2732 (underlying!314 thiss!992)))) from!355) lt!45566))))

(declare-fun b!92664 () Bool)

(assert (=> b!92664 (= e!60433 e!60427)))

(declare-fun res!47099 () Bool)

(assert (=> b!92664 (=> (not res!47099) (not e!60427))))

(declare-fun lt!45559 () ListLongMap!1485)

(assert (=> b!92664 (= res!47099 (= lt!45559 lt!45565))))

(assert (=> b!92664 (= lt!45565 (map!1219 newMap!16))))

(assert (=> b!92664 (= lt!45559 (getCurrentListMap!441 (_keys!4102 (v!2732 (underlying!314 thiss!992))) (_values!2404 (v!2732 (underlying!314 thiss!992))) (mask!6488 (v!2732 (underlying!314 thiss!992))) (extraKeys!2250 (v!2732 (underlying!314 thiss!992))) (zeroValue!2308 (v!2732 (underlying!314 thiss!992))) (minValue!2308 (v!2732 (underlying!314 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))))))

(assert (=> b!92665 (= e!60419 (and tp!9320 tp_is_empty!2593 (array_inv!1229 (_keys!4102 newMap!16)) (array_inv!1230 (_values!2404 newMap!16)) e!60423))))

(assert (= (and start!11268 res!47098) b!92645))

(assert (= (and b!92645 res!47101) b!92657))

(assert (= (and b!92657 res!47103) b!92646))

(assert (= (and b!92646 res!47102) b!92664))

(assert (= (and b!92664 res!47099) b!92661))

(assert (= (and b!92661 res!47105) b!92652))

(assert (= (and b!92652 c!15417) b!92659))

(assert (= (and b!92652 (not c!15417)) b!92650))

(assert (= (and b!92652 res!47100) b!92663))

(assert (= (and b!92663 (not res!47097)) b!92651))

(assert (= (and b!92651 (not res!47104)) b!92662))

(assert (= (and b!92655 condMapEmpty!3608) mapIsEmpty!3608))

(assert (= (and b!92655 (not condMapEmpty!3608)) mapNonEmpty!3608))

(get-info :version)

(assert (= (and mapNonEmpty!3608 ((_ is ValueCellFull!953) mapValue!3608)) b!92660))

(assert (= (and b!92655 ((_ is ValueCellFull!953) mapDefault!3607)) b!92648))

(assert (= b!92654 b!92655))

(assert (= b!92647 b!92654))

(assert (= b!92653 b!92647))

(assert (= start!11268 b!92653))

(assert (= (and b!92656 condMapEmpty!3607) mapIsEmpty!3607))

(assert (= (and b!92656 (not condMapEmpty!3607)) mapNonEmpty!3607))

(assert (= (and mapNonEmpty!3607 ((_ is ValueCellFull!953) mapValue!3607)) b!92649))

(assert (= (and b!92656 ((_ is ValueCellFull!953) mapDefault!3608)) b!92658))

(assert (= b!92665 b!92656))

(assert (= start!11268 b!92665))

(declare-fun b_lambda!4085 () Bool)

(assert (=> (not b_lambda!4085) (not b!92661)))

(declare-fun t!5415 () Bool)

(declare-fun tb!1825 () Bool)

(assert (=> (and b!92654 (= (defaultEntry!2421 (v!2732 (underlying!314 thiss!992))) (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))) t!5415) tb!1825))

(declare-fun result!3119 () Bool)

(assert (=> tb!1825 (= result!3119 tp_is_empty!2593)))

(assert (=> b!92661 t!5415))

(declare-fun b_and!5625 () Bool)

(assert (= b_and!5621 (and (=> t!5415 result!3119) b_and!5625)))

(declare-fun t!5417 () Bool)

(declare-fun tb!1827 () Bool)

(assert (=> (and b!92665 (= (defaultEntry!2421 newMap!16) (defaultEntry!2421 (v!2732 (underlying!314 thiss!992)))) t!5417) tb!1827))

(declare-fun result!3123 () Bool)

(assert (= result!3123 result!3119))

(assert (=> b!92661 t!5417))

(declare-fun b_and!5627 () Bool)

(assert (= b_and!5623 (and (=> t!5417 result!3123) b_and!5627)))

(declare-fun m!99865 () Bool)

(assert (=> start!11268 m!99865))

(declare-fun m!99867 () Bool)

(assert (=> b!92652 m!99867))

(assert (=> b!92652 m!99867))

(declare-fun m!99869 () Bool)

(assert (=> b!92652 m!99869))

(assert (=> b!92652 m!99867))

(declare-fun m!99871 () Bool)

(assert (=> b!92652 m!99871))

(declare-fun m!99873 () Bool)

(assert (=> b!92664 m!99873))

(declare-fun m!99875 () Bool)

(assert (=> b!92664 m!99875))

(declare-fun m!99877 () Bool)

(assert (=> b!92663 m!99877))

(declare-fun m!99879 () Bool)

(assert (=> b!92663 m!99879))

(assert (=> b!92663 m!99867))

(declare-fun m!99881 () Bool)

(assert (=> b!92663 m!99881))

(declare-fun m!99883 () Bool)

(assert (=> b!92663 m!99883))

(assert (=> b!92663 m!99867))

(assert (=> b!92663 m!99867))

(declare-fun m!99885 () Bool)

(assert (=> b!92663 m!99885))

(declare-fun m!99887 () Bool)

(assert (=> b!92663 m!99887))

(declare-fun m!99889 () Bool)

(assert (=> b!92663 m!99889))

(declare-fun m!99891 () Bool)

(assert (=> b!92663 m!99891))

(declare-fun m!99893 () Bool)

(assert (=> b!92663 m!99893))

(declare-fun m!99895 () Bool)

(assert (=> b!92663 m!99895))

(declare-fun m!99897 () Bool)

(assert (=> b!92663 m!99897))

(assert (=> b!92663 m!99879))

(declare-fun m!99899 () Bool)

(assert (=> b!92663 m!99899))

(assert (=> b!92661 m!99867))

(declare-fun m!99901 () Bool)

(assert (=> b!92661 m!99901))

(declare-fun m!99903 () Bool)

(assert (=> b!92661 m!99903))

(assert (=> b!92661 m!99901))

(assert (=> b!92661 m!99903))

(declare-fun m!99905 () Bool)

(assert (=> b!92661 m!99905))

(declare-fun m!99907 () Bool)

(assert (=> b!92657 m!99907))

(declare-fun m!99909 () Bool)

(assert (=> b!92665 m!99909))

(declare-fun m!99911 () Bool)

(assert (=> b!92665 m!99911))

(declare-fun m!99913 () Bool)

(assert (=> b!92654 m!99913))

(declare-fun m!99915 () Bool)

(assert (=> b!92654 m!99915))

(declare-fun m!99917 () Bool)

(assert (=> b!92651 m!99917))

(declare-fun m!99919 () Bool)

(assert (=> b!92662 m!99919))

(declare-fun m!99921 () Bool)

(assert (=> mapNonEmpty!3608 m!99921))

(declare-fun m!99923 () Bool)

(assert (=> mapNonEmpty!3607 m!99923))

(declare-fun m!99925 () Bool)

(assert (=> b!92659 m!99925))

(declare-fun m!99927 () Bool)

(assert (=> b!92659 m!99927))

(assert (=> b!92659 m!99867))

(declare-fun m!99929 () Bool)

(assert (=> b!92659 m!99929))

(assert (=> b!92659 m!99867))

(assert (=> b!92659 m!99867))

(declare-fun m!99931 () Bool)

(assert (=> b!92659 m!99931))

(assert (=> b!92659 m!99867))

(declare-fun m!99933 () Bool)

(assert (=> b!92659 m!99933))

(check-sat (not mapNonEmpty!3607) b_and!5625 (not b!92661) (not mapNonEmpty!3608) (not b!92663) (not b!92652) (not b_next!2355) (not b!92662) (not b!92665) (not b!92651) (not start!11268) (not b_next!2353) b_and!5627 (not b!92664) (not b!92654) (not b!92659) (not b!92657) tp_is_empty!2593 (not b_lambda!4085))
(check-sat b_and!5625 b_and!5627 (not b_next!2353) (not b_next!2355))
