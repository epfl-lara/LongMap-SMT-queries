; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11262 () Bool)

(assert start!11262)

(declare-fun b!92523 () Bool)

(declare-fun b_free!2341 () Bool)

(declare-fun b_next!2341 () Bool)

(assert (=> b!92523 (= b_free!2341 (not b_next!2341))))

(declare-fun tp!9282 () Bool)

(declare-fun b_and!5605 () Bool)

(assert (=> b!92523 (= tp!9282 b_and!5605)))

(declare-fun b!92527 () Bool)

(declare-fun b_free!2343 () Bool)

(declare-fun b_next!2343 () Bool)

(assert (=> b!92527 (= b_free!2343 (not b_next!2343))))

(declare-fun tp!9283 () Bool)

(declare-fun b_and!5607 () Bool)

(assert (=> b!92527 (= tp!9283 b_and!5607)))

(declare-fun b!92515 () Bool)

(declare-fun res!47039 () Bool)

(declare-fun e!60309 () Bool)

(assert (=> b!92515 (=> (not res!47039) (not e!60309))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3097 0))(
  ( (V!3098 (val!1338 Int)) )
))
(declare-datatypes ((array!4131 0))(
  ( (array!4132 (arr!1964 (Array (_ BitVec 32) (_ BitVec 64))) (size!2212 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!950 0))(
  ( (ValueCellFull!950 (v!2735 V!3097)) (EmptyCell!950) )
))
(declare-datatypes ((array!4133 0))(
  ( (array!4134 (arr!1965 (Array (_ BitVec 32) ValueCell!950)) (size!2213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!808 0))(
  ( (LongMapFixedSize!809 (defaultEntry!2418 Int) (mask!6484 (_ BitVec 32)) (extraKeys!2247 (_ BitVec 32)) (zeroValue!2305 V!3097) (minValue!2305 V!3097) (_size!453 (_ BitVec 32)) (_keys!4100 array!4131) (_values!2401 array!4133) (_vacant!453 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!614 0))(
  ( (Cell!615 (v!2736 LongMapFixedSize!808)) )
))
(declare-datatypes ((LongMap!614 0))(
  ( (LongMap!615 (underlying!318 Cell!614)) )
))
(declare-fun thiss!992 () LongMap!614)

(assert (=> b!92515 (= res!47039 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2212 (_keys!4100 (v!2736 (underlying!318 thiss!992)))))))))

(declare-fun b!92516 () Bool)

(declare-fun e!60305 () Bool)

(declare-fun e!60303 () Bool)

(assert (=> b!92516 (= e!60305 e!60303)))

(declare-fun b!92517 () Bool)

(declare-fun e!60299 () Bool)

(declare-fun e!60315 () Bool)

(assert (=> b!92517 (= e!60299 (not e!60315))))

(declare-fun res!47040 () Bool)

(assert (=> b!92517 (=> res!47040 e!60315)))

(declare-datatypes ((tuple2!2252 0))(
  ( (tuple2!2253 (_1!1137 (_ BitVec 64)) (_2!1137 V!3097)) )
))
(declare-datatypes ((List!1541 0))(
  ( (Nil!1538) (Cons!1537 (h!2129 tuple2!2252) (t!5387 List!1541)) )
))
(declare-datatypes ((ListLongMap!1475 0))(
  ( (ListLongMap!1476 (toList!753 List!1541)) )
))
(declare-fun lt!45430 () ListLongMap!1475)

(declare-fun lt!45419 () ListLongMap!1475)

(assert (=> b!92517 (= res!47040 (or (not (= lt!45430 lt!45419)) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2212 (_keys!4100 (v!2736 (underlying!318 thiss!992)))))))))

(declare-datatypes ((tuple2!2254 0))(
  ( (tuple2!2255 (_1!1138 Bool) (_2!1138 LongMapFixedSize!808)) )
))
(declare-fun lt!45435 () tuple2!2254)

(declare-fun map!1227 (LongMapFixedSize!808) ListLongMap!1475)

(assert (=> b!92517 (= lt!45419 (map!1227 (_2!1138 lt!45435)))))

(declare-fun getCurrentListMap!443 (array!4131 array!4133 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!92517 (= lt!45430 (getCurrentListMap!443 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (_values!2401 (v!2736 (underlying!318 thiss!992))) (mask!6484 (v!2736 (underlying!318 thiss!992))) (extraKeys!2247 (v!2736 (underlying!318 thiss!992))) (zeroValue!2305 (v!2736 (underlying!318 thiss!992))) (minValue!2305 (v!2736 (underlying!318 thiss!992))) from!355 (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun lt!45425 () ListLongMap!1475)

(declare-fun lt!45429 () tuple2!2252)

(declare-fun lt!45426 () ListLongMap!1475)

(declare-fun lt!45420 () tuple2!2252)

(declare-fun +!122 (ListLongMap!1475 tuple2!2252) ListLongMap!1475)

(assert (=> b!92517 (= (+!122 lt!45426 lt!45429) (+!122 (+!122 lt!45425 lt!45429) lt!45420))))

(assert (=> b!92517 (= lt!45429 (tuple2!2253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2305 (v!2736 (underlying!318 thiss!992)))))))

(declare-datatypes ((Unit!2747 0))(
  ( (Unit!2748) )
))
(declare-fun lt!45433 () Unit!2747)

(declare-fun lt!45434 () V!3097)

(declare-fun addCommutativeForDiffKeys!42 (ListLongMap!1475 (_ BitVec 64) V!3097 (_ BitVec 64) V!3097) Unit!2747)

(assert (=> b!92517 (= lt!45433 (addCommutativeForDiffKeys!42 lt!45425 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) lt!45434 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2305 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun lt!45427 () ListLongMap!1475)

(assert (=> b!92517 (= lt!45427 lt!45426)))

(assert (=> b!92517 (= lt!45426 (+!122 lt!45425 lt!45420))))

(declare-fun lt!45417 () ListLongMap!1475)

(declare-fun lt!45431 () tuple2!2252)

(assert (=> b!92517 (= lt!45427 (+!122 lt!45417 lt!45431))))

(declare-fun lt!45424 () ListLongMap!1475)

(assert (=> b!92517 (= lt!45425 (+!122 lt!45424 lt!45431))))

(assert (=> b!92517 (= lt!45431 (tuple2!2253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2305 (v!2736 (underlying!318 thiss!992)))))))

(assert (=> b!92517 (= lt!45417 (+!122 lt!45424 lt!45420))))

(assert (=> b!92517 (= lt!45420 (tuple2!2253 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) lt!45434))))

(declare-fun lt!45428 () Unit!2747)

(assert (=> b!92517 (= lt!45428 (addCommutativeForDiffKeys!42 lt!45424 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) lt!45434 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2305 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!87 (array!4131 array!4133 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 32) Int) ListLongMap!1475)

(assert (=> b!92517 (= lt!45424 (getCurrentListMapNoExtraKeys!87 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (_values!2401 (v!2736 (underlying!318 thiss!992))) (mask!6484 (v!2736 (underlying!318 thiss!992))) (extraKeys!2247 (v!2736 (underlying!318 thiss!992))) (zeroValue!2305 (v!2736 (underlying!318 thiss!992))) (minValue!2305 (v!2736 (underlying!318 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun b!92518 () Bool)

(assert (=> b!92518 (= e!60315 (= (getCurrentListMap!443 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (_values!2401 (v!2736 (underlying!318 thiss!992))) (mask!6484 (v!2736 (underlying!318 thiss!992))) (extraKeys!2247 (v!2736 (underlying!318 thiss!992))) (zeroValue!2305 (v!2736 (underlying!318 thiss!992))) (minValue!2305 (v!2736 (underlying!318 thiss!992))) (bvadd #b00000000000000000000000000000001 (bvsub from!355 #b00000000000000000000000000000001)) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))) lt!45419))))

(declare-fun b!92519 () Bool)

(declare-fun e!60313 () Bool)

(declare-fun tp_is_empty!2587 () Bool)

(assert (=> b!92519 (= e!60313 tp_is_empty!2587)))

(declare-fun b!92520 () Bool)

(declare-fun e!60301 () Bool)

(declare-fun e!60304 () Bool)

(assert (=> b!92520 (= e!60301 e!60304)))

(declare-fun res!47042 () Bool)

(assert (=> b!92520 (=> (not res!47042) (not e!60304))))

(assert (=> b!92520 (= res!47042 (and (not (= (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1255 (ValueCell!950 V!3097) V!3097)

(declare-fun dynLambda!361 (Int (_ BitVec 64)) V!3097)

(assert (=> b!92520 (= lt!45434 (get!1255 (select (arr!1965 (_values!2401 (v!2736 (underlying!318 thiss!992)))) from!355) (dynLambda!361 (defaultEntry!2418 (v!2736 (underlying!318 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92521 () Bool)

(declare-fun res!47037 () Bool)

(assert (=> b!92521 (=> res!47037 e!60315)))

(declare-fun valid!369 (LongMapFixedSize!808) Bool)

(assert (=> b!92521 (= res!47037 (not (valid!369 (_2!1138 lt!45435))))))

(declare-fun b!92522 () Bool)

(declare-fun e!60300 () Bool)

(assert (=> b!92522 (= e!60300 tp_is_empty!2587)))

(declare-fun e!60310 () Bool)

(declare-fun e!60311 () Bool)

(declare-fun array_inv!1211 (array!4131) Bool)

(declare-fun array_inv!1212 (array!4133) Bool)

(assert (=> b!92523 (= e!60311 (and tp!9282 tp_is_empty!2587 (array_inv!1211 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) (array_inv!1212 (_values!2401 (v!2736 (underlying!318 thiss!992)))) e!60310))))

(declare-fun b!92524 () Bool)

(declare-fun e!60314 () Unit!2747)

(declare-fun Unit!2749 () Unit!2747)

(assert (=> b!92524 (= e!60314 Unit!2749)))

(declare-fun lt!45432 () Unit!2747)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!75 (array!4131 array!4133 (_ BitVec 32) (_ BitVec 32) V!3097 V!3097 (_ BitVec 64) (_ BitVec 32) Int) Unit!2747)

(assert (=> b!92524 (= lt!45432 (lemmaListMapContainsThenArrayContainsFrom!75 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (_values!2401 (v!2736 (underlying!318 thiss!992))) (mask!6484 (v!2736 (underlying!318 thiss!992))) (extraKeys!2247 (v!2736 (underlying!318 thiss!992))) (zeroValue!2305 (v!2736 (underlying!318 thiss!992))) (minValue!2305 (v!2736 (underlying!318 thiss!992))) (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!92524 (arrayContainsKey!0 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!45423 () Unit!2747)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4131 (_ BitVec 32) (_ BitVec 32)) Unit!2747)

(assert (=> b!92524 (= lt!45423 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4100 (v!2736 (underlying!318 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1542 0))(
  ( (Nil!1539) (Cons!1538 (h!2130 (_ BitVec 64)) (t!5388 List!1542)) )
))
(declare-fun arrayNoDuplicates!0 (array!4131 (_ BitVec 32) List!1542) Bool)

(assert (=> b!92524 (arrayNoDuplicates!0 (_keys!4100 (v!2736 (underlying!318 thiss!992))) from!355 Nil!1539)))

(declare-fun lt!45421 () Unit!2747)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4131 (_ BitVec 32) (_ BitVec 64) List!1542) Unit!2747)

(assert (=> b!92524 (= lt!45421 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) (Cons!1538 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) Nil!1539)))))

(assert (=> b!92524 false))

(declare-fun b!92525 () Bool)

(declare-fun e!60307 () Bool)

(assert (=> b!92525 (= e!60307 tp_is_empty!2587)))

(declare-fun b!92526 () Bool)

(assert (=> b!92526 (= e!60304 e!60299)))

(declare-fun res!47038 () Bool)

(assert (=> b!92526 (=> (not res!47038) (not e!60299))))

(assert (=> b!92526 (= res!47038 (and (_1!1138 lt!45435) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!45422 () Unit!2747)

(assert (=> b!92526 (= lt!45422 e!60314)))

(declare-fun lt!45416 () ListLongMap!1475)

(declare-fun c!15431 () Bool)

(declare-fun contains!773 (ListLongMap!1475 (_ BitVec 64)) Bool)

(assert (=> b!92526 (= c!15431 (contains!773 lt!45416 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!808)

(declare-fun update!137 (LongMapFixedSize!808 (_ BitVec 64) V!3097) tuple2!2254)

(assert (=> b!92526 (= lt!45435 (update!137 newMap!16 (select (arr!1964 (_keys!4100 (v!2736 (underlying!318 thiss!992)))) from!355) lt!45434))))

(declare-fun b!92528 () Bool)

(assert (=> b!92528 (= e!60303 e!60311)))

(declare-fun b!92529 () Bool)

(declare-fun res!47035 () Bool)

(assert (=> b!92529 (=> (not res!47035) (not e!60309))))

(assert (=> b!92529 (= res!47035 (valid!369 newMap!16))))

(declare-fun b!92530 () Bool)

(assert (=> b!92530 (= e!60309 e!60301)))

(declare-fun res!47043 () Bool)

(assert (=> b!92530 (=> (not res!47043) (not e!60301))))

(declare-fun lt!45418 () ListLongMap!1475)

(assert (=> b!92530 (= res!47043 (= lt!45418 lt!45416))))

(assert (=> b!92530 (= lt!45416 (map!1227 newMap!16))))

(assert (=> b!92530 (= lt!45418 (getCurrentListMap!443 (_keys!4100 (v!2736 (underlying!318 thiss!992))) (_values!2401 (v!2736 (underlying!318 thiss!992))) (mask!6484 (v!2736 (underlying!318 thiss!992))) (extraKeys!2247 (v!2736 (underlying!318 thiss!992))) (zeroValue!2305 (v!2736 (underlying!318 thiss!992))) (minValue!2305 (v!2736 (underlying!318 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun b!92531 () Bool)

(declare-fun res!47036 () Bool)

(assert (=> b!92531 (=> (not res!47036) (not e!60309))))

(assert (=> b!92531 (= res!47036 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6484 newMap!16)) (_size!453 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun mapNonEmpty!3589 () Bool)

(declare-fun mapRes!3590 () Bool)

(declare-fun tp!9284 () Bool)

(assert (=> mapNonEmpty!3589 (= mapRes!3590 (and tp!9284 e!60313))))

(declare-fun mapValue!3589 () ValueCell!950)

(declare-fun mapRest!3589 () (Array (_ BitVec 32) ValueCell!950))

(declare-fun mapKey!3589 () (_ BitVec 32))

(assert (=> mapNonEmpty!3589 (= (arr!1965 (_values!2401 newMap!16)) (store mapRest!3589 mapKey!3589 mapValue!3589))))

(declare-fun b!92532 () Bool)

(declare-fun e!60316 () Bool)

(assert (=> b!92532 (= e!60316 (and e!60307 mapRes!3590))))

(declare-fun condMapEmpty!3589 () Bool)

(declare-fun mapDefault!3590 () ValueCell!950)

(assert (=> b!92532 (= condMapEmpty!3589 (= (arr!1965 (_values!2401 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!950)) mapDefault!3590)))))

(declare-fun mapNonEmpty!3590 () Bool)

(declare-fun mapRes!3589 () Bool)

(declare-fun tp!9281 () Bool)

(assert (=> mapNonEmpty!3590 (= mapRes!3589 (and tp!9281 e!60300))))

(declare-fun mapKey!3590 () (_ BitVec 32))

(declare-fun mapValue!3590 () ValueCell!950)

(declare-fun mapRest!3590 () (Array (_ BitVec 32) ValueCell!950))

(assert (=> mapNonEmpty!3590 (= (arr!1965 (_values!2401 (v!2736 (underlying!318 thiss!992)))) (store mapRest!3590 mapKey!3590 mapValue!3590))))

(declare-fun mapIsEmpty!3589 () Bool)

(assert (=> mapIsEmpty!3589 mapRes!3590))

(declare-fun b!92533 () Bool)

(declare-fun res!47044 () Bool)

(assert (=> b!92533 (=> res!47044 e!60315)))

(assert (=> b!92533 (= res!47044 (bvslt (bvadd #b00000000000000000000000000000001 (mask!6484 (_2!1138 lt!45435))) (_size!453 (v!2736 (underlying!318 thiss!992)))))))

(declare-fun mapIsEmpty!3590 () Bool)

(assert (=> mapIsEmpty!3590 mapRes!3589))

(declare-fun b!92534 () Bool)

(declare-fun Unit!2750 () Unit!2747)

(assert (=> b!92534 (= e!60314 Unit!2750)))

(declare-fun b!92535 () Bool)

(declare-fun e!60312 () Bool)

(assert (=> b!92535 (= e!60310 (and e!60312 mapRes!3589))))

(declare-fun condMapEmpty!3590 () Bool)

(declare-fun mapDefault!3589 () ValueCell!950)

(assert (=> b!92535 (= condMapEmpty!3590 (= (arr!1965 (_values!2401 (v!2736 (underlying!318 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!950)) mapDefault!3589)))))

(declare-fun b!92536 () Bool)

(assert (=> b!92536 (= e!60312 tp_is_empty!2587)))

(declare-fun e!60306 () Bool)

(assert (=> b!92527 (= e!60306 (and tp!9283 tp_is_empty!2587 (array_inv!1211 (_keys!4100 newMap!16)) (array_inv!1212 (_values!2401 newMap!16)) e!60316))))

(declare-fun res!47041 () Bool)

(assert (=> start!11262 (=> (not res!47041) (not e!60309))))

(declare-fun valid!370 (LongMap!614) Bool)

(assert (=> start!11262 (= res!47041 (valid!370 thiss!992))))

(assert (=> start!11262 e!60309))

(assert (=> start!11262 e!60305))

(assert (=> start!11262 true))

(assert (=> start!11262 e!60306))

(assert (= (and start!11262 res!47041) b!92515))

(assert (= (and b!92515 res!47039) b!92529))

(assert (= (and b!92529 res!47035) b!92531))

(assert (= (and b!92531 res!47036) b!92530))

(assert (= (and b!92530 res!47043) b!92520))

(assert (= (and b!92520 res!47042) b!92526))

(assert (= (and b!92526 c!15431) b!92524))

(assert (= (and b!92526 (not c!15431)) b!92534))

(assert (= (and b!92526 res!47038) b!92517))

(assert (= (and b!92517 (not res!47040)) b!92521))

(assert (= (and b!92521 (not res!47037)) b!92533))

(assert (= (and b!92533 (not res!47044)) b!92518))

(assert (= (and b!92535 condMapEmpty!3590) mapIsEmpty!3590))

(assert (= (and b!92535 (not condMapEmpty!3590)) mapNonEmpty!3590))

(get-info :version)

(assert (= (and mapNonEmpty!3590 ((_ is ValueCellFull!950) mapValue!3590)) b!92522))

(assert (= (and b!92535 ((_ is ValueCellFull!950) mapDefault!3589)) b!92536))

(assert (= b!92523 b!92535))

(assert (= b!92528 b!92523))

(assert (= b!92516 b!92528))

(assert (= start!11262 b!92516))

(assert (= (and b!92532 condMapEmpty!3589) mapIsEmpty!3589))

(assert (= (and b!92532 (not condMapEmpty!3589)) mapNonEmpty!3589))

(assert (= (and mapNonEmpty!3589 ((_ is ValueCellFull!950) mapValue!3589)) b!92519))

(assert (= (and b!92532 ((_ is ValueCellFull!950) mapDefault!3590)) b!92525))

(assert (= b!92527 b!92532))

(assert (= start!11262 b!92527))

(declare-fun b_lambda!4087 () Bool)

(assert (=> (not b_lambda!4087) (not b!92520)))

(declare-fun t!5384 () Bool)

(declare-fun tb!1813 () Bool)

(assert (=> (and b!92523 (= (defaultEntry!2418 (v!2736 (underlying!318 thiss!992))) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))) t!5384) tb!1813))

(declare-fun result!3101 () Bool)

(assert (=> tb!1813 (= result!3101 tp_is_empty!2587)))

(assert (=> b!92520 t!5384))

(declare-fun b_and!5609 () Bool)

(assert (= b_and!5605 (and (=> t!5384 result!3101) b_and!5609)))

(declare-fun tb!1815 () Bool)

(declare-fun t!5386 () Bool)

(assert (=> (and b!92527 (= (defaultEntry!2418 newMap!16) (defaultEntry!2418 (v!2736 (underlying!318 thiss!992)))) t!5386) tb!1815))

(declare-fun result!3105 () Bool)

(assert (= result!3105 result!3101))

(assert (=> b!92520 t!5386))

(declare-fun b_and!5611 () Bool)

(assert (= b_and!5607 (and (=> t!5386 result!3105) b_and!5611)))

(declare-fun m!99817 () Bool)

(assert (=> b!92518 m!99817))

(declare-fun m!99819 () Bool)

(assert (=> b!92520 m!99819))

(declare-fun m!99821 () Bool)

(assert (=> b!92520 m!99821))

(declare-fun m!99823 () Bool)

(assert (=> b!92520 m!99823))

(assert (=> b!92520 m!99821))

(assert (=> b!92520 m!99823))

(declare-fun m!99825 () Bool)

(assert (=> b!92520 m!99825))

(declare-fun m!99827 () Bool)

(assert (=> mapNonEmpty!3589 m!99827))

(declare-fun m!99829 () Bool)

(assert (=> b!92530 m!99829))

(declare-fun m!99831 () Bool)

(assert (=> b!92530 m!99831))

(declare-fun m!99833 () Bool)

(assert (=> b!92523 m!99833))

(declare-fun m!99835 () Bool)

(assert (=> b!92523 m!99835))

(declare-fun m!99837 () Bool)

(assert (=> start!11262 m!99837))

(declare-fun m!99839 () Bool)

(assert (=> b!92524 m!99839))

(declare-fun m!99841 () Bool)

(assert (=> b!92524 m!99841))

(assert (=> b!92524 m!99819))

(declare-fun m!99843 () Bool)

(assert (=> b!92524 m!99843))

(assert (=> b!92524 m!99819))

(assert (=> b!92524 m!99819))

(declare-fun m!99845 () Bool)

(assert (=> b!92524 m!99845))

(assert (=> b!92524 m!99819))

(declare-fun m!99847 () Bool)

(assert (=> b!92524 m!99847))

(declare-fun m!99849 () Bool)

(assert (=> b!92529 m!99849))

(assert (=> b!92517 m!99819))

(declare-fun m!99851 () Bool)

(assert (=> b!92517 m!99851))

(declare-fun m!99853 () Bool)

(assert (=> b!92517 m!99853))

(declare-fun m!99855 () Bool)

(assert (=> b!92517 m!99855))

(declare-fun m!99857 () Bool)

(assert (=> b!92517 m!99857))

(declare-fun m!99859 () Bool)

(assert (=> b!92517 m!99859))

(declare-fun m!99861 () Bool)

(assert (=> b!92517 m!99861))

(declare-fun m!99863 () Bool)

(assert (=> b!92517 m!99863))

(declare-fun m!99865 () Bool)

(assert (=> b!92517 m!99865))

(assert (=> b!92517 m!99819))

(declare-fun m!99867 () Bool)

(assert (=> b!92517 m!99867))

(assert (=> b!92517 m!99819))

(declare-fun m!99869 () Bool)

(assert (=> b!92517 m!99869))

(declare-fun m!99871 () Bool)

(assert (=> b!92517 m!99871))

(assert (=> b!92517 m!99855))

(declare-fun m!99873 () Bool)

(assert (=> b!92517 m!99873))

(declare-fun m!99875 () Bool)

(assert (=> b!92527 m!99875))

(declare-fun m!99877 () Bool)

(assert (=> b!92527 m!99877))

(assert (=> b!92526 m!99819))

(assert (=> b!92526 m!99819))

(declare-fun m!99879 () Bool)

(assert (=> b!92526 m!99879))

(assert (=> b!92526 m!99819))

(declare-fun m!99881 () Bool)

(assert (=> b!92526 m!99881))

(declare-fun m!99883 () Bool)

(assert (=> b!92521 m!99883))

(declare-fun m!99885 () Bool)

(assert (=> mapNonEmpty!3590 m!99885))

(check-sat (not b!92524) (not b!92520) (not start!11262) (not b!92530) (not b!92526) (not b_lambda!4087) (not b_next!2341) (not b!92529) tp_is_empty!2587 (not b_next!2343) b_and!5609 (not b!92523) (not b!92518) (not b!92521) (not b!92517) (not b!92527) b_and!5611 (not mapNonEmpty!3589) (not mapNonEmpty!3590))
(check-sat b_and!5609 b_and!5611 (not b_next!2341) (not b_next!2343))
