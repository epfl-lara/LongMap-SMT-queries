; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8718 () Bool)

(assert start!8718)

(declare-fun b!60416 () Bool)

(declare-fun b_free!1973 () Bool)

(declare-fun b_next!1973 () Bool)

(assert (=> b!60416 (= b_free!1973 (not b_next!1973))))

(declare-fun tp!8041 () Bool)

(declare-fun b_and!3667 () Bool)

(assert (=> b!60416 (= tp!8041 b_and!3667)))

(declare-fun b!60426 () Bool)

(declare-fun b_free!1975 () Bool)

(declare-fun b_next!1975 () Bool)

(assert (=> b!60426 (= b_free!1975 (not b_next!1975))))

(declare-fun tp!8040 () Bool)

(declare-fun b_and!3669 () Bool)

(assert (=> b!60426 (= tp!8040 b_and!3669)))

(declare-fun b!60413 () Bool)

(declare-fun e!39707 () Bool)

(declare-fun tp_is_empty!2403 () Bool)

(assert (=> b!60413 (= e!39707 tp_is_empty!2403)))

(declare-fun b!60414 () Bool)

(declare-fun e!39700 () Bool)

(assert (=> b!60414 (= e!39700 tp_is_empty!2403)))

(declare-fun mapNonEmpty!2899 () Bool)

(declare-fun mapRes!2899 () Bool)

(declare-fun tp!8039 () Bool)

(assert (=> mapNonEmpty!2899 (= mapRes!2899 (and tp!8039 e!39707))))

(declare-datatypes ((V!2851 0))(
  ( (V!2852 (val!1246 Int)) )
))
(declare-datatypes ((ValueCell!858 0))(
  ( (ValueCellFull!858 (v!2397 V!2851)) (EmptyCell!858) )
))
(declare-fun mapValue!2900 () ValueCell!858)

(declare-datatypes ((array!3735 0))(
  ( (array!3736 (arr!1787 (Array (_ BitVec 32) (_ BitVec 64))) (size!2018 (_ BitVec 32))) )
))
(declare-datatypes ((array!3737 0))(
  ( (array!3738 (arr!1788 (Array (_ BitVec 32) ValueCell!858)) (size!2019 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!624 0))(
  ( (LongMapFixedSize!625 (defaultEntry!2064 Int) (mask!5958 (_ BitVec 32)) (extraKeys!1947 (_ BitVec 32)) (zeroValue!1978 V!2851) (minValue!1978 V!2851) (_size!361 (_ BitVec 32)) (_keys!3692 array!3735) (_values!2047 array!3737) (_vacant!361 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!624)

(declare-fun mapRest!2900 () (Array (_ BitVec 32) ValueCell!858))

(declare-fun mapKey!2900 () (_ BitVec 32))

(assert (=> mapNonEmpty!2899 (= (arr!1788 (_values!2047 newMap!16)) (store mapRest!2900 mapKey!2900 mapValue!2900))))

(declare-fun b!60415 () Bool)

(declare-fun e!39704 () Bool)

(declare-fun e!39706 () Bool)

(assert (=> b!60415 (= e!39704 e!39706)))

(declare-fun res!33423 () Bool)

(assert (=> b!60415 (=> (not res!33423) (not e!39706))))

(declare-datatypes ((tuple2!2024 0))(
  ( (tuple2!2025 (_1!1023 Bool) (_2!1023 LongMapFixedSize!624)) )
))
(declare-fun lt!24761 () tuple2!2024)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!60415 (= res!33423 (and (_1!1023 lt!24761) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!1617 0))(
  ( (Unit!1618) )
))
(declare-fun lt!24758 () Unit!1617)

(declare-fun e!39705 () Unit!1617)

(assert (=> b!60415 (= lt!24758 e!39705)))

(declare-datatypes ((Cell!434 0))(
  ( (Cell!435 (v!2398 LongMapFixedSize!624)) )
))
(declare-datatypes ((LongMap!434 0))(
  ( (LongMap!435 (underlying!228 Cell!434)) )
))
(declare-fun thiss!992 () LongMap!434)

(declare-fun c!7853 () Bool)

(declare-datatypes ((tuple2!2026 0))(
  ( (tuple2!2027 (_1!1024 (_ BitVec 64)) (_2!1024 V!2851)) )
))
(declare-datatypes ((List!1432 0))(
  ( (Nil!1429) (Cons!1428 (h!2010 tuple2!2026) (t!4790 List!1432)) )
))
(declare-datatypes ((ListLongMap!1365 0))(
  ( (ListLongMap!1366 (toList!698 List!1432)) )
))
(declare-fun lt!24762 () ListLongMap!1365)

(declare-fun contains!685 (ListLongMap!1365 (_ BitVec 64)) Bool)

(assert (=> b!60415 (= c!7853 (contains!685 lt!24762 (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355)))))

(declare-fun update!74 (LongMapFixedSize!624 (_ BitVec 64) V!2851) tuple2!2024)

(declare-fun get!1072 (ValueCell!858 V!2851) V!2851)

(declare-fun dynLambda!305 (Int (_ BitVec 64)) V!2851)

(assert (=> b!60415 (= lt!24761 (update!74 newMap!16 (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) (get!1072 (select (arr!1788 (_values!2047 (v!2398 (underlying!228 thiss!992)))) from!355) (dynLambda!305 (defaultEntry!2064 (v!2398 (underlying!228 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!39711 () Bool)

(declare-fun e!39701 () Bool)

(declare-fun array_inv!1105 (array!3735) Bool)

(declare-fun array_inv!1106 (array!3737) Bool)

(assert (=> b!60416 (= e!39701 (and tp!8041 tp_is_empty!2403 (array_inv!1105 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) (array_inv!1106 (_values!2047 (v!2398 (underlying!228 thiss!992)))) e!39711))))

(declare-fun b!60417 () Bool)

(declare-fun e!39703 () Bool)

(assert (=> b!60417 (= e!39703 e!39701)))

(declare-fun b!60418 () Bool)

(assert (=> b!60418 (= e!39706 (and (= (size!2019 (_values!2047 (v!2398 (underlying!228 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5958 (v!2398 (underlying!228 thiss!992))))) (= (size!2018 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) (size!2019 (_values!2047 (v!2398 (underlying!228 thiss!992))))) (bvslt (mask!5958 (v!2398 (underlying!228 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun res!33418 () Bool)

(declare-fun e!39713 () Bool)

(assert (=> start!8718 (=> (not res!33418) (not e!39713))))

(declare-fun valid!257 (LongMap!434) Bool)

(assert (=> start!8718 (= res!33418 (valid!257 thiss!992))))

(assert (=> start!8718 e!39713))

(declare-fun e!39702 () Bool)

(assert (=> start!8718 e!39702))

(assert (=> start!8718 true))

(declare-fun e!39712 () Bool)

(assert (=> start!8718 e!39712))

(declare-fun b!60419 () Bool)

(declare-fun Unit!1619 () Unit!1617)

(assert (=> b!60419 (= e!39705 Unit!1619)))

(declare-fun b!60420 () Bool)

(declare-fun res!33419 () Bool)

(assert (=> b!60420 (=> (not res!33419) (not e!39713))))

(assert (=> b!60420 (= res!33419 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2018 (_keys!3692 (v!2398 (underlying!228 thiss!992)))))))))

(declare-fun b!60421 () Bool)

(declare-fun res!33421 () Bool)

(assert (=> b!60421 (=> (not res!33421) (not e!39713))))

(assert (=> b!60421 (= res!33421 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5958 newMap!16)) (_size!361 (v!2398 (underlying!228 thiss!992)))))))

(declare-fun b!60422 () Bool)

(declare-fun res!33422 () Bool)

(assert (=> b!60422 (=> (not res!33422) (not e!39713))))

(declare-fun valid!258 (LongMapFixedSize!624) Bool)

(assert (=> b!60422 (= res!33422 (valid!258 newMap!16))))

(declare-fun b!60423 () Bool)

(declare-fun e!39699 () Bool)

(assert (=> b!60423 (= e!39699 tp_is_empty!2403)))

(declare-fun b!60424 () Bool)

(assert (=> b!60424 (= e!39713 e!39704)))

(declare-fun res!33424 () Bool)

(assert (=> b!60424 (=> (not res!33424) (not e!39704))))

(declare-fun lt!24763 () ListLongMap!1365)

(assert (=> b!60424 (= res!33424 (and (= lt!24763 lt!24762) (not (= (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1108 (LongMapFixedSize!624) ListLongMap!1365)

(assert (=> b!60424 (= lt!24762 (map!1108 newMap!16))))

(declare-fun getCurrentListMap!403 (array!3735 array!3737 (_ BitVec 32) (_ BitVec 32) V!2851 V!2851 (_ BitVec 32) Int) ListLongMap!1365)

(assert (=> b!60424 (= lt!24763 (getCurrentListMap!403 (_keys!3692 (v!2398 (underlying!228 thiss!992))) (_values!2047 (v!2398 (underlying!228 thiss!992))) (mask!5958 (v!2398 (underlying!228 thiss!992))) (extraKeys!1947 (v!2398 (underlying!228 thiss!992))) (zeroValue!1978 (v!2398 (underlying!228 thiss!992))) (minValue!1978 (v!2398 (underlying!228 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2064 (v!2398 (underlying!228 thiss!992)))))))

(declare-fun mapIsEmpty!2899 () Bool)

(assert (=> mapIsEmpty!2899 mapRes!2899))

(declare-fun b!60425 () Bool)

(assert (=> b!60425 (= e!39702 e!39703)))

(declare-fun e!39710 () Bool)

(assert (=> b!60426 (= e!39712 (and tp!8040 tp_is_empty!2403 (array_inv!1105 (_keys!3692 newMap!16)) (array_inv!1106 (_values!2047 newMap!16)) e!39710))))

(declare-fun b!60427 () Bool)

(assert (=> b!60427 (= e!39710 (and e!39699 mapRes!2899))))

(declare-fun condMapEmpty!2900 () Bool)

(declare-fun mapDefault!2899 () ValueCell!858)

(assert (=> b!60427 (= condMapEmpty!2900 (= (arr!1788 (_values!2047 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!858)) mapDefault!2899)))))

(declare-fun b!60428 () Bool)

(declare-fun e!39709 () Bool)

(declare-fun mapRes!2900 () Bool)

(assert (=> b!60428 (= e!39711 (and e!39709 mapRes!2900))))

(declare-fun condMapEmpty!2899 () Bool)

(declare-fun mapDefault!2900 () ValueCell!858)

(assert (=> b!60428 (= condMapEmpty!2899 (= (arr!1788 (_values!2047 (v!2398 (underlying!228 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!858)) mapDefault!2900)))))

(declare-fun b!60429 () Bool)

(declare-fun Unit!1620 () Unit!1617)

(assert (=> b!60429 (= e!39705 Unit!1620)))

(declare-fun lt!24764 () Unit!1617)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!31 (array!3735 array!3737 (_ BitVec 32) (_ BitVec 32) V!2851 V!2851 (_ BitVec 64) (_ BitVec 32) Int) Unit!1617)

(assert (=> b!60429 (= lt!24764 (lemmaListMapContainsThenArrayContainsFrom!31 (_keys!3692 (v!2398 (underlying!228 thiss!992))) (_values!2047 (v!2398 (underlying!228 thiss!992))) (mask!5958 (v!2398 (underlying!228 thiss!992))) (extraKeys!1947 (v!2398 (underlying!228 thiss!992))) (zeroValue!1978 (v!2398 (underlying!228 thiss!992))) (minValue!1978 (v!2398 (underlying!228 thiss!992))) (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2064 (v!2398 (underlying!228 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!60429 (arrayContainsKey!0 (_keys!3692 (v!2398 (underlying!228 thiss!992))) (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!24760 () Unit!1617)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3735 (_ BitVec 32) (_ BitVec 32)) Unit!1617)

(assert (=> b!60429 (= lt!24760 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3692 (v!2398 (underlying!228 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1433 0))(
  ( (Nil!1430) (Cons!1429 (h!2011 (_ BitVec 64)) (t!4791 List!1433)) )
))
(declare-fun arrayNoDuplicates!0 (array!3735 (_ BitVec 32) List!1433) Bool)

(assert (=> b!60429 (arrayNoDuplicates!0 (_keys!3692 (v!2398 (underlying!228 thiss!992))) from!355 Nil!1430)))

(declare-fun lt!24759 () Unit!1617)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3735 (_ BitVec 32) (_ BitVec 64) List!1433) Unit!1617)

(assert (=> b!60429 (= lt!24759 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3692 (v!2398 (underlying!228 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) (Cons!1429 (select (arr!1787 (_keys!3692 (v!2398 (underlying!228 thiss!992)))) from!355) Nil!1430)))))

(assert (=> b!60429 false))

(declare-fun b!60430 () Bool)

(declare-fun res!33420 () Bool)

(assert (=> b!60430 (=> (not res!33420) (not e!39706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!60430 (= res!33420 (validMask!0 (mask!5958 (v!2398 (underlying!228 thiss!992)))))))

(declare-fun mapNonEmpty!2900 () Bool)

(declare-fun tp!8042 () Bool)

(assert (=> mapNonEmpty!2900 (= mapRes!2900 (and tp!8042 e!39700))))

(declare-fun mapValue!2899 () ValueCell!858)

(declare-fun mapKey!2899 () (_ BitVec 32))

(declare-fun mapRest!2899 () (Array (_ BitVec 32) ValueCell!858))

(assert (=> mapNonEmpty!2900 (= (arr!1788 (_values!2047 (v!2398 (underlying!228 thiss!992)))) (store mapRest!2899 mapKey!2899 mapValue!2899))))

(declare-fun b!60431 () Bool)

(assert (=> b!60431 (= e!39709 tp_is_empty!2403)))

(declare-fun mapIsEmpty!2900 () Bool)

(assert (=> mapIsEmpty!2900 mapRes!2900))

(assert (= (and start!8718 res!33418) b!60420))

(assert (= (and b!60420 res!33419) b!60422))

(assert (= (and b!60422 res!33422) b!60421))

(assert (= (and b!60421 res!33421) b!60424))

(assert (= (and b!60424 res!33424) b!60415))

(assert (= (and b!60415 c!7853) b!60429))

(assert (= (and b!60415 (not c!7853)) b!60419))

(assert (= (and b!60415 res!33423) b!60430))

(assert (= (and b!60430 res!33420) b!60418))

(assert (= (and b!60428 condMapEmpty!2899) mapIsEmpty!2900))

(assert (= (and b!60428 (not condMapEmpty!2899)) mapNonEmpty!2900))

(get-info :version)

(assert (= (and mapNonEmpty!2900 ((_ is ValueCellFull!858) mapValue!2899)) b!60414))

(assert (= (and b!60428 ((_ is ValueCellFull!858) mapDefault!2900)) b!60431))

(assert (= b!60416 b!60428))

(assert (= b!60417 b!60416))

(assert (= b!60425 b!60417))

(assert (= start!8718 b!60425))

(assert (= (and b!60427 condMapEmpty!2900) mapIsEmpty!2899))

(assert (= (and b!60427 (not condMapEmpty!2900)) mapNonEmpty!2899))

(assert (= (and mapNonEmpty!2899 ((_ is ValueCellFull!858) mapValue!2900)) b!60413))

(assert (= (and b!60427 ((_ is ValueCellFull!858) mapDefault!2899)) b!60423))

(assert (= b!60426 b!60427))

(assert (= start!8718 b!60426))

(declare-fun b_lambda!2679 () Bool)

(assert (=> (not b_lambda!2679) (not b!60415)))

(declare-fun t!4787 () Bool)

(declare-fun tb!1333 () Bool)

(assert (=> (and b!60416 (= (defaultEntry!2064 (v!2398 (underlying!228 thiss!992))) (defaultEntry!2064 (v!2398 (underlying!228 thiss!992)))) t!4787) tb!1333))

(declare-fun result!2395 () Bool)

(assert (=> tb!1333 (= result!2395 tp_is_empty!2403)))

(assert (=> b!60415 t!4787))

(declare-fun b_and!3671 () Bool)

(assert (= b_and!3667 (and (=> t!4787 result!2395) b_and!3671)))

(declare-fun tb!1335 () Bool)

(declare-fun t!4789 () Bool)

(assert (=> (and b!60426 (= (defaultEntry!2064 newMap!16) (defaultEntry!2064 (v!2398 (underlying!228 thiss!992)))) t!4789) tb!1335))

(declare-fun result!2399 () Bool)

(assert (= result!2399 result!2395))

(assert (=> b!60415 t!4789))

(declare-fun b_and!3673 () Bool)

(assert (= b_and!3669 (and (=> t!4789 result!2399) b_and!3673)))

(declare-fun m!53181 () Bool)

(assert (=> b!60426 m!53181))

(declare-fun m!53183 () Bool)

(assert (=> b!60426 m!53183))

(declare-fun m!53185 () Bool)

(assert (=> mapNonEmpty!2899 m!53185))

(declare-fun m!53187 () Bool)

(assert (=> b!60422 m!53187))

(declare-fun m!53189 () Bool)

(assert (=> b!60424 m!53189))

(declare-fun m!53191 () Bool)

(assert (=> b!60424 m!53191))

(declare-fun m!53193 () Bool)

(assert (=> b!60424 m!53193))

(declare-fun m!53195 () Bool)

(assert (=> b!60429 m!53195))

(declare-fun m!53197 () Bool)

(assert (=> b!60429 m!53197))

(assert (=> b!60429 m!53189))

(declare-fun m!53199 () Bool)

(assert (=> b!60429 m!53199))

(assert (=> b!60429 m!53189))

(assert (=> b!60429 m!53189))

(declare-fun m!53201 () Bool)

(assert (=> b!60429 m!53201))

(assert (=> b!60429 m!53189))

(declare-fun m!53203 () Bool)

(assert (=> b!60429 m!53203))

(declare-fun m!53205 () Bool)

(assert (=> b!60415 m!53205))

(declare-fun m!53207 () Bool)

(assert (=> b!60415 m!53207))

(declare-fun m!53209 () Bool)

(assert (=> b!60415 m!53209))

(assert (=> b!60415 m!53189))

(assert (=> b!60415 m!53189))

(assert (=> b!60415 m!53209))

(declare-fun m!53211 () Bool)

(assert (=> b!60415 m!53211))

(assert (=> b!60415 m!53205))

(assert (=> b!60415 m!53207))

(assert (=> b!60415 m!53189))

(declare-fun m!53213 () Bool)

(assert (=> b!60415 m!53213))

(declare-fun m!53215 () Bool)

(assert (=> b!60416 m!53215))

(declare-fun m!53217 () Bool)

(assert (=> b!60416 m!53217))

(declare-fun m!53219 () Bool)

(assert (=> b!60430 m!53219))

(declare-fun m!53221 () Bool)

(assert (=> mapNonEmpty!2900 m!53221))

(declare-fun m!53223 () Bool)

(assert (=> start!8718 m!53223))

(check-sat (not b!60415) (not b!60424) (not b!60422) b_and!3671 (not mapNonEmpty!2899) (not b!60426) (not b_next!1973) (not mapNonEmpty!2900) (not b!60416) (not b!60430) (not b_lambda!2679) (not b!60429) (not b_next!1975) tp_is_empty!2403 b_and!3673 (not start!8718))
(check-sat b_and!3671 b_and!3673 (not b_next!1973) (not b_next!1975))
