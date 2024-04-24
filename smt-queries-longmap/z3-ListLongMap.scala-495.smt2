; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11156 () Bool)

(assert start!11156)

(declare-fun b!91365 () Bool)

(declare-fun b_free!2329 () Bool)

(declare-fun b_next!2329 () Bool)

(assert (=> b!91365 (= b_free!2329 (not b_next!2329))))

(declare-fun tp!9241 () Bool)

(declare-fun b_and!5533 () Bool)

(assert (=> b!91365 (= tp!9241 b_and!5533)))

(declare-fun b!91371 () Bool)

(declare-fun b_free!2331 () Bool)

(declare-fun b_next!2331 () Bool)

(assert (=> b!91371 (= b_free!2331 (not b_next!2331))))

(declare-fun tp!9240 () Bool)

(declare-fun b_and!5535 () Bool)

(assert (=> b!91371 (= tp!9240 b_and!5535)))

(declare-fun b!91354 () Bool)

(declare-fun e!59588 () Bool)

(declare-fun tp_is_empty!2581 () Bool)

(assert (=> b!91354 (= e!59588 tp_is_empty!2581)))

(declare-fun b!91355 () Bool)

(declare-fun e!59589 () Bool)

(declare-fun e!59587 () Bool)

(assert (=> b!91355 (= e!59589 (not e!59587))))

(declare-fun res!46519 () Bool)

(assert (=> b!91355 (=> res!46519 e!59587)))

(declare-datatypes ((V!3089 0))(
  ( (V!3090 (val!1335 Int)) )
))
(declare-datatypes ((array!4117 0))(
  ( (array!4118 (arr!1958 (Array (_ BitVec 32) (_ BitVec 64))) (size!2205 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!947 0))(
  ( (ValueCellFull!947 (v!2722 V!3089)) (EmptyCell!947) )
))
(declare-datatypes ((array!4119 0))(
  ( (array!4120 (arr!1959 (Array (_ BitVec 32) ValueCell!947)) (size!2206 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!802 0))(
  ( (LongMapFixedSize!803 (defaultEntry!2405 Int) (mask!6465 (_ BitVec 32)) (extraKeys!2236 (_ BitVec 32)) (zeroValue!2293 V!3089) (minValue!2293 V!3089) (_size!450 (_ BitVec 32)) (_keys!4085 array!4117) (_values!2388 array!4119) (_vacant!450 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2242 0))(
  ( (tuple2!2243 (_1!1132 Bool) (_2!1132 LongMapFixedSize!802)) )
))
(declare-fun lt!44543 () tuple2!2242)

(declare-datatypes ((Cell!608 0))(
  ( (Cell!609 (v!2723 LongMapFixedSize!802)) )
))
(declare-datatypes ((LongMap!608 0))(
  ( (LongMap!609 (underlying!315 Cell!608)) )
))
(declare-fun thiss!992 () LongMap!608)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2244 0))(
  ( (tuple2!2245 (_1!1133 (_ BitVec 64)) (_2!1133 V!3089)) )
))
(declare-datatypes ((List!1537 0))(
  ( (Nil!1534) (Cons!1533 (h!2125 tuple2!2244) (t!5363 List!1537)) )
))
(declare-datatypes ((ListLongMap!1471 0))(
  ( (ListLongMap!1472 (toList!751 List!1537)) )
))
(declare-fun getCurrentListMap!441 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1471)

(declare-fun map!1223 (LongMapFixedSize!802) ListLongMap!1471)

(assert (=> b!91355 (= res!46519 (not (= (getCurrentListMap!441 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) (map!1223 (_2!1132 lt!44543)))))))

(declare-fun lt!44530 () ListLongMap!1471)

(declare-fun lt!44534 () tuple2!2244)

(declare-fun lt!44536 () tuple2!2244)

(declare-fun lt!44533 () ListLongMap!1471)

(declare-fun +!120 (ListLongMap!1471 tuple2!2244) ListLongMap!1471)

(assert (=> b!91355 (= (+!120 lt!44530 lt!44536) (+!120 (+!120 lt!44533 lt!44536) lt!44534))))

(assert (=> b!91355 (= lt!44536 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44529 () V!3089)

(declare-datatypes ((Unit!2702 0))(
  ( (Unit!2703) )
))
(declare-fun lt!44535 () Unit!2702)

(declare-fun addCommutativeForDiffKeys!40 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64) V!3089) Unit!2702)

(assert (=> b!91355 (= lt!44535 (addCommutativeForDiffKeys!40 lt!44533 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44537 () ListLongMap!1471)

(assert (=> b!91355 (= lt!44537 lt!44530)))

(assert (=> b!91355 (= lt!44530 (+!120 lt!44533 lt!44534))))

(declare-fun lt!44528 () ListLongMap!1471)

(declare-fun lt!44540 () tuple2!2244)

(assert (=> b!91355 (= lt!44537 (+!120 lt!44528 lt!44540))))

(declare-fun lt!44531 () ListLongMap!1471)

(assert (=> b!91355 (= lt!44533 (+!120 lt!44531 lt!44540))))

(assert (=> b!91355 (= lt!44540 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(assert (=> b!91355 (= lt!44528 (+!120 lt!44531 lt!44534))))

(assert (=> b!91355 (= lt!44534 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))

(declare-fun lt!44526 () Unit!2702)

(assert (=> b!91355 (= lt!44526 (addCommutativeForDiffKeys!40 lt!44531 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!85 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1471)

(assert (=> b!91355 (= lt!44531 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91356 () Bool)

(declare-fun e!59590 () Bool)

(declare-fun mapRes!3565 () Bool)

(assert (=> b!91356 (= e!59590 (and e!59588 mapRes!3565))))

(declare-fun condMapEmpty!3565 () Bool)

(declare-fun mapDefault!3566 () ValueCell!947)

(assert (=> b!91356 (= condMapEmpty!3565 (= (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3566)))))

(declare-fun b!91357 () Bool)

(declare-fun res!46520 () Bool)

(declare-fun e!59586 () Bool)

(assert (=> b!91357 (=> (not res!46520) (not e!59586))))

(assert (=> b!91357 (= res!46520 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun mapNonEmpty!3565 () Bool)

(declare-fun tp!9239 () Bool)

(declare-fun e!59597 () Bool)

(assert (=> mapNonEmpty!3565 (= mapRes!3565 (and tp!9239 e!59597))))

(declare-fun mapValue!3565 () ValueCell!947)

(declare-fun mapRest!3565 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapKey!3565 () (_ BitVec 32))

(assert (=> mapNonEmpty!3565 (= (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (store mapRest!3565 mapKey!3565 mapValue!3565))))

(declare-fun b!91358 () Bool)

(declare-fun e!59580 () Bool)

(declare-fun e!59591 () Bool)

(assert (=> b!91358 (= e!59580 e!59591)))

(declare-fun b!91359 () Bool)

(declare-fun e!59594 () Bool)

(assert (=> b!91359 (= e!59594 e!59580)))

(declare-fun b!91360 () Bool)

(declare-fun res!46526 () Bool)

(assert (=> b!91360 (=> res!46526 e!59587)))

(declare-fun valid!363 (LongMapFixedSize!802) Bool)

(assert (=> b!91360 (= res!46526 (not (valid!363 (_2!1132 lt!44543))))))

(declare-fun b!91361 () Bool)

(declare-fun e!59595 () Unit!2702)

(declare-fun Unit!2704 () Unit!2702)

(assert (=> b!91361 (= e!59595 Unit!2704)))

(declare-fun b!91362 () Bool)

(assert (=> b!91362 (= e!59587 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6465 (_2!1132 lt!44543))) (_size!450 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91363 () Bool)

(declare-fun res!46521 () Bool)

(assert (=> b!91363 (=> (not res!46521) (not e!59586))))

(declare-fun newMap!16 () LongMapFixedSize!802)

(assert (=> b!91363 (= res!46521 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6465 newMap!16)) (_size!450 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91364 () Bool)

(declare-fun e!59584 () Bool)

(assert (=> b!91364 (= e!59584 tp_is_empty!2581)))

(declare-fun mapNonEmpty!3566 () Bool)

(declare-fun mapRes!3566 () Bool)

(declare-fun tp!9242 () Bool)

(declare-fun e!59596 () Bool)

(assert (=> mapNonEmpty!3566 (= mapRes!3566 (and tp!9242 e!59596))))

(declare-fun mapRest!3566 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3566 () ValueCell!947)

(declare-fun mapKey!3566 () (_ BitVec 32))

(assert (=> mapNonEmpty!3566 (= (arr!1959 (_values!2388 newMap!16)) (store mapRest!3566 mapKey!3566 mapValue!3566))))

(declare-fun array_inv!1205 (array!4117) Bool)

(declare-fun array_inv!1206 (array!4119) Bool)

(assert (=> b!91365 (= e!59591 (and tp!9241 tp_is_empty!2581 (array_inv!1205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (array_inv!1206 (_values!2388 (v!2723 (underlying!315 thiss!992)))) e!59590))))

(declare-fun b!91366 () Bool)

(declare-fun Unit!2705 () Unit!2702)

(assert (=> b!91366 (= e!59595 Unit!2705)))

(declare-fun lt!44541 () Unit!2702)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!73 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2702)

(assert (=> b!91366 (= lt!44541 (lemmaListMapContainsThenArrayContainsFrom!73 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!91366 (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44527 () Unit!2702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4117 (_ BitVec 32) (_ BitVec 32)) Unit!2702)

(assert (=> b!91366 (= lt!44527 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1538 0))(
  ( (Nil!1535) (Cons!1534 (h!2126 (_ BitVec 64)) (t!5364 List!1538)) )
))
(declare-fun arrayNoDuplicates!0 (array!4117 (_ BitVec 32) List!1538) Bool)

(assert (=> b!91366 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) from!355 Nil!1535)))

(declare-fun lt!44532 () Unit!2702)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4117 (_ BitVec 32) (_ BitVec 64) List!1538) Unit!2702)

(assert (=> b!91366 (= lt!44532 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535)))))

(assert (=> b!91366 false))

(declare-fun b!91367 () Bool)

(declare-fun res!46527 () Bool)

(assert (=> b!91367 (=> (not res!46527) (not e!59586))))

(assert (=> b!91367 (= res!46527 (valid!363 newMap!16))))

(declare-fun b!91368 () Bool)

(assert (=> b!91368 (= e!59596 tp_is_empty!2581)))

(declare-fun b!91369 () Bool)

(declare-fun e!59585 () Bool)

(declare-fun e!59592 () Bool)

(assert (=> b!91369 (= e!59585 e!59592)))

(declare-fun res!46528 () Bool)

(assert (=> b!91369 (=> (not res!46528) (not e!59592))))

(assert (=> b!91369 (= res!46528 (and (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1247 (ValueCell!947 V!3089) V!3089)

(declare-fun dynLambda!358 (Int (_ BitVec 64)) V!3089)

(assert (=> b!91369 (= lt!44529 (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91370 () Bool)

(declare-fun res!46523 () Bool)

(assert (=> b!91370 (=> res!46523 e!59587)))

(assert (=> b!91370 (= res!46523 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun e!59593 () Bool)

(declare-fun e!59582 () Bool)

(assert (=> b!91371 (= e!59582 (and tp!9240 tp_is_empty!2581 (array_inv!1205 (_keys!4085 newMap!16)) (array_inv!1206 (_values!2388 newMap!16)) e!59593))))

(declare-fun mapIsEmpty!3566 () Bool)

(assert (=> mapIsEmpty!3566 mapRes!3565))

(declare-fun res!46525 () Bool)

(assert (=> start!11156 (=> (not res!46525) (not e!59586))))

(declare-fun valid!364 (LongMap!608) Bool)

(assert (=> start!11156 (= res!46525 (valid!364 thiss!992))))

(assert (=> start!11156 e!59586))

(assert (=> start!11156 e!59594))

(assert (=> start!11156 true))

(assert (=> start!11156 e!59582))

(declare-fun mapIsEmpty!3565 () Bool)

(assert (=> mapIsEmpty!3565 mapRes!3566))

(declare-fun b!91372 () Bool)

(assert (=> b!91372 (= e!59592 e!59589)))

(declare-fun res!46522 () Bool)

(assert (=> b!91372 (=> (not res!46522) (not e!59589))))

(assert (=> b!91372 (= res!46522 (and (_1!1132 lt!44543) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44542 () Unit!2702)

(assert (=> b!91372 (= lt!44542 e!59595)))

(declare-fun lt!44539 () ListLongMap!1471)

(declare-fun c!15165 () Bool)

(declare-fun contains!769 (ListLongMap!1471 (_ BitVec 64)) Bool)

(assert (=> b!91372 (= c!15165 (contains!769 lt!44539 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun update!135 (LongMapFixedSize!802 (_ BitVec 64) V!3089) tuple2!2242)

(assert (=> b!91372 (= lt!44543 (update!135 newMap!16 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))

(declare-fun b!91373 () Bool)

(assert (=> b!91373 (= e!59586 e!59585)))

(declare-fun res!46524 () Bool)

(assert (=> b!91373 (=> (not res!46524) (not e!59585))))

(declare-fun lt!44538 () ListLongMap!1471)

(assert (=> b!91373 (= res!46524 (= lt!44538 lt!44539))))

(assert (=> b!91373 (= lt!44539 (map!1223 newMap!16))))

(assert (=> b!91373 (= lt!44538 (getCurrentListMap!441 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91374 () Bool)

(assert (=> b!91374 (= e!59597 tp_is_empty!2581)))

(declare-fun b!91375 () Bool)

(assert (=> b!91375 (= e!59593 (and e!59584 mapRes!3566))))

(declare-fun condMapEmpty!3566 () Bool)

(declare-fun mapDefault!3565 () ValueCell!947)

(assert (=> b!91375 (= condMapEmpty!3566 (= (arr!1959 (_values!2388 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3565)))))

(assert (= (and start!11156 res!46525) b!91357))

(assert (= (and b!91357 res!46520) b!91367))

(assert (= (and b!91367 res!46527) b!91363))

(assert (= (and b!91363 res!46521) b!91373))

(assert (= (and b!91373 res!46524) b!91369))

(assert (= (and b!91369 res!46528) b!91372))

(assert (= (and b!91372 c!15165) b!91366))

(assert (= (and b!91372 (not c!15165)) b!91361))

(assert (= (and b!91372 res!46522) b!91355))

(assert (= (and b!91355 (not res!46519)) b!91370))

(assert (= (and b!91370 (not res!46523)) b!91360))

(assert (= (and b!91360 (not res!46526)) b!91362))

(assert (= (and b!91356 condMapEmpty!3565) mapIsEmpty!3566))

(assert (= (and b!91356 (not condMapEmpty!3565)) mapNonEmpty!3565))

(get-info :version)

(assert (= (and mapNonEmpty!3565 ((_ is ValueCellFull!947) mapValue!3565)) b!91374))

(assert (= (and b!91356 ((_ is ValueCellFull!947) mapDefault!3566)) b!91354))

(assert (= b!91365 b!91356))

(assert (= b!91358 b!91365))

(assert (= b!91359 b!91358))

(assert (= start!11156 b!91359))

(assert (= (and b!91375 condMapEmpty!3566) mapIsEmpty!3565))

(assert (= (and b!91375 (not condMapEmpty!3566)) mapNonEmpty!3566))

(assert (= (and mapNonEmpty!3566 ((_ is ValueCellFull!947) mapValue!3566)) b!91368))

(assert (= (and b!91375 ((_ is ValueCellFull!947) mapDefault!3565)) b!91364))

(assert (= b!91371 b!91375))

(assert (= start!11156 b!91371))

(declare-fun b_lambda!4033 () Bool)

(assert (=> (not b_lambda!4033) (not b!91369)))

(declare-fun t!5360 () Bool)

(declare-fun tb!1793 () Bool)

(assert (=> (and b!91365 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) t!5360) tb!1793))

(declare-fun result!3073 () Bool)

(assert (=> tb!1793 (= result!3073 tp_is_empty!2581)))

(assert (=> b!91369 t!5360))

(declare-fun b_and!5537 () Bool)

(assert (= b_and!5533 (and (=> t!5360 result!3073) b_and!5537)))

(declare-fun tb!1795 () Bool)

(declare-fun t!5362 () Bool)

(assert (=> (and b!91371 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) t!5362) tb!1795))

(declare-fun result!3077 () Bool)

(assert (= result!3077 result!3073))

(assert (=> b!91369 t!5362))

(declare-fun b_and!5539 () Bool)

(assert (= b_and!5535 (and (=> t!5362 result!3077) b_and!5539)))

(declare-fun m!98059 () Bool)

(assert (=> b!91369 m!98059))

(declare-fun m!98061 () Bool)

(assert (=> b!91369 m!98061))

(declare-fun m!98063 () Bool)

(assert (=> b!91369 m!98063))

(assert (=> b!91369 m!98061))

(assert (=> b!91369 m!98063))

(declare-fun m!98065 () Bool)

(assert (=> b!91369 m!98065))

(declare-fun m!98067 () Bool)

(assert (=> mapNonEmpty!3565 m!98067))

(declare-fun m!98069 () Bool)

(assert (=> b!91360 m!98069))

(declare-fun m!98071 () Bool)

(assert (=> b!91366 m!98071))

(declare-fun m!98073 () Bool)

(assert (=> b!91366 m!98073))

(assert (=> b!91366 m!98059))

(declare-fun m!98075 () Bool)

(assert (=> b!91366 m!98075))

(assert (=> b!91366 m!98059))

(assert (=> b!91366 m!98059))

(declare-fun m!98077 () Bool)

(assert (=> b!91366 m!98077))

(assert (=> b!91366 m!98059))

(declare-fun m!98079 () Bool)

(assert (=> b!91366 m!98079))

(assert (=> b!91372 m!98059))

(assert (=> b!91372 m!98059))

(declare-fun m!98081 () Bool)

(assert (=> b!91372 m!98081))

(assert (=> b!91372 m!98059))

(declare-fun m!98083 () Bool)

(assert (=> b!91372 m!98083))

(declare-fun m!98085 () Bool)

(assert (=> b!91373 m!98085))

(declare-fun m!98087 () Bool)

(assert (=> b!91373 m!98087))

(declare-fun m!98089 () Bool)

(assert (=> b!91355 m!98089))

(declare-fun m!98091 () Bool)

(assert (=> b!91355 m!98091))

(declare-fun m!98093 () Bool)

(assert (=> b!91355 m!98093))

(declare-fun m!98095 () Bool)

(assert (=> b!91355 m!98095))

(assert (=> b!91355 m!98059))

(declare-fun m!98097 () Bool)

(assert (=> b!91355 m!98097))

(assert (=> b!91355 m!98059))

(declare-fun m!98099 () Bool)

(assert (=> b!91355 m!98099))

(declare-fun m!98101 () Bool)

(assert (=> b!91355 m!98101))

(declare-fun m!98103 () Bool)

(assert (=> b!91355 m!98103))

(declare-fun m!98105 () Bool)

(assert (=> b!91355 m!98105))

(assert (=> b!91355 m!98059))

(declare-fun m!98107 () Bool)

(assert (=> b!91355 m!98107))

(declare-fun m!98109 () Bool)

(assert (=> b!91355 m!98109))

(assert (=> b!91355 m!98093))

(declare-fun m!98111 () Bool)

(assert (=> b!91355 m!98111))

(declare-fun m!98113 () Bool)

(assert (=> b!91367 m!98113))

(declare-fun m!98115 () Bool)

(assert (=> start!11156 m!98115))

(declare-fun m!98117 () Bool)

(assert (=> b!91365 m!98117))

(declare-fun m!98119 () Bool)

(assert (=> b!91365 m!98119))

(declare-fun m!98121 () Bool)

(assert (=> b!91371 m!98121))

(declare-fun m!98123 () Bool)

(assert (=> b!91371 m!98123))

(declare-fun m!98125 () Bool)

(assert (=> mapNonEmpty!3566 m!98125))

(check-sat (not b!91367) (not b!91365) (not mapNonEmpty!3565) (not b!91360) b_and!5537 (not b!91373) (not b_lambda!4033) (not b!91371) tp_is_empty!2581 b_and!5539 (not mapNonEmpty!3566) (not b!91372) (not b!91369) (not b!91366) (not b_next!2331) (not b_next!2329) (not b!91355) (not start!11156))
(check-sat b_and!5537 b_and!5539 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun b_lambda!4039 () Bool)

(assert (= b_lambda!4033 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4039)))

(check-sat (not b!91367) (not b!91365) (not mapNonEmpty!3565) (not b!91360) b_and!5537 (not b!91373) (not b_lambda!4039) (not b!91371) tp_is_empty!2581 b_and!5539 (not mapNonEmpty!3566) (not b!91372) (not b!91369) (not b!91366) (not b_next!2331) (not b_next!2329) (not b!91355) (not start!11156))
(check-sat b_and!5537 b_and!5539 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun d!24099 () Bool)

(declare-fun res!46595 () Bool)

(declare-fun e!59708 () Bool)

(assert (=> d!24099 (=> (not res!46595) (not e!59708))))

(declare-fun simpleValid!63 (LongMapFixedSize!802) Bool)

(assert (=> d!24099 (= res!46595 (simpleValid!63 (_2!1132 lt!44543)))))

(assert (=> d!24099 (= (valid!363 (_2!1132 lt!44543)) e!59708)))

(declare-fun b!91520 () Bool)

(declare-fun res!46596 () Bool)

(assert (=> b!91520 (=> (not res!46596) (not e!59708))))

(declare-fun arrayCountValidKeys!0 (array!4117 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!91520 (= res!46596 (= (arrayCountValidKeys!0 (_keys!4085 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))) (_size!450 (_2!1132 lt!44543))))))

(declare-fun b!91521 () Bool)

(declare-fun res!46597 () Bool)

(assert (=> b!91521 (=> (not res!46597) (not e!59708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4117 (_ BitVec 32)) Bool)

(assert (=> b!91521 (= res!46597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543))))))

(declare-fun b!91522 () Bool)

(assert (=> b!91522 (= e!59708 (arrayNoDuplicates!0 (_keys!4085 (_2!1132 lt!44543)) #b00000000000000000000000000000000 Nil!1535))))

(assert (= (and d!24099 res!46595) b!91520))

(assert (= (and b!91520 res!46596) b!91521))

(assert (= (and b!91521 res!46597) b!91522))

(declare-fun m!98263 () Bool)

(assert (=> d!24099 m!98263))

(declare-fun m!98265 () Bool)

(assert (=> b!91520 m!98265))

(declare-fun m!98267 () Bool)

(assert (=> b!91521 m!98267))

(declare-fun m!98269 () Bool)

(assert (=> b!91522 m!98269))

(assert (=> b!91360 d!24099))

(declare-fun d!24101 () Bool)

(assert (=> d!24101 (= (array_inv!1205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvsge (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91365 d!24101))

(declare-fun d!24103 () Bool)

(assert (=> d!24103 (= (array_inv!1206 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvsge (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!91365 d!24103))

(declare-fun d!24105 () Bool)

(assert (=> d!24105 (= (+!120 (+!120 lt!44531 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (+!120 (+!120 lt!44531 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(declare-fun lt!44654 () Unit!2702)

(declare-fun choose!550 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64) V!3089) Unit!2702)

(assert (=> d!24105 (= lt!44654 (choose!550 lt!44531 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(assert (=> d!24105 (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24105 (= (addCommutativeForDiffKeys!40 lt!44531 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) lt!44654)))

(declare-fun bs!3804 () Bool)

(assert (= bs!3804 d!24105))

(declare-fun m!98271 () Bool)

(assert (=> bs!3804 m!98271))

(declare-fun m!98273 () Bool)

(assert (=> bs!3804 m!98273))

(declare-fun m!98275 () Bool)

(assert (=> bs!3804 m!98275))

(declare-fun m!98277 () Bool)

(assert (=> bs!3804 m!98277))

(assert (=> bs!3804 m!98275))

(assert (=> bs!3804 m!98271))

(assert (=> bs!3804 m!98059))

(declare-fun m!98279 () Bool)

(assert (=> bs!3804 m!98279))

(assert (=> b!91355 d!24105))

(declare-fun b!91547 () Bool)

(declare-fun res!46607 () Bool)

(declare-fun e!59725 () Bool)

(assert (=> b!91547 (=> (not res!46607) (not e!59725))))

(declare-fun lt!44675 () ListLongMap!1471)

(assert (=> b!91547 (= res!46607 (not (contains!769 lt!44675 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91548 () Bool)

(declare-fun e!59723 () Bool)

(declare-fun e!59728 () Bool)

(assert (=> b!91548 (= e!59723 e!59728)))

(declare-fun c!15183 () Bool)

(assert (=> b!91548 (= c!15183 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91549 () Bool)

(assert (=> b!91549 (= e!59728 (= lt!44675 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91550 () Bool)

(declare-fun e!59729 () ListLongMap!1471)

(declare-fun e!59724 () ListLongMap!1471)

(assert (=> b!91550 (= e!59729 e!59724)))

(declare-fun c!15182 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!91550 (= c!15182 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91551 () Bool)

(declare-fun isEmpty!352 (ListLongMap!1471) Bool)

(assert (=> b!91551 (= e!59728 (isEmpty!352 lt!44675))))

(declare-fun b!91552 () Bool)

(declare-fun e!59726 () Bool)

(assert (=> b!91552 (= e!59726 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91552 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!91553 () Bool)

(declare-fun call!8915 () ListLongMap!1471)

(assert (=> b!91553 (= e!59724 call!8915)))

(declare-fun d!24107 () Bool)

(assert (=> d!24107 e!59725))

(declare-fun res!46609 () Bool)

(assert (=> d!24107 (=> (not res!46609) (not e!59725))))

(assert (=> d!24107 (= res!46609 (not (contains!769 lt!44675 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24107 (= lt!44675 e!59729)))

(declare-fun c!15181 () Bool)

(assert (=> d!24107 (= c!15181 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!24107 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24107 (= (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!44675)))

(declare-fun bm!8912 () Bool)

(assert (=> bm!8912 (= call!8915 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91554 () Bool)

(assert (=> b!91554 (= e!59725 e!59723)))

(declare-fun c!15180 () Bool)

(assert (=> b!91554 (= c!15180 e!59726)))

(declare-fun res!46606 () Bool)

(assert (=> b!91554 (=> (not res!46606) (not e!59726))))

(assert (=> b!91554 (= res!46606 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91555 () Bool)

(declare-fun e!59727 () Bool)

(assert (=> b!91555 (= e!59723 e!59727)))

(assert (=> b!91555 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun res!46608 () Bool)

(assert (=> b!91555 (= res!46608 (contains!769 lt!44675 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91555 (=> (not res!46608) (not e!59727))))

(declare-fun b!91556 () Bool)

(declare-fun lt!44674 () Unit!2702)

(declare-fun lt!44672 () Unit!2702)

(assert (=> b!91556 (= lt!44674 lt!44672)))

(declare-fun lt!44671 () ListLongMap!1471)

(declare-fun lt!44673 () (_ BitVec 64))

(declare-fun lt!44670 () (_ BitVec 64))

(declare-fun lt!44669 () V!3089)

(assert (=> b!91556 (not (contains!769 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669)) lt!44673))))

(declare-fun addStillNotContains!38 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> b!91556 (= lt!44672 (addStillNotContains!38 lt!44671 lt!44670 lt!44669 lt!44673))))

(assert (=> b!91556 (= lt!44673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!91556 (= lt!44669 (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!91556 (= lt!44670 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91556 (= lt!44671 call!8915)))

(assert (=> b!91556 (= e!59724 (+!120 call!8915 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!91557 () Bool)

(assert (=> b!91557 (= e!59729 (ListLongMap!1472 Nil!1534))))

(declare-fun b!91558 () Bool)

(assert (=> b!91558 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!91558 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun apply!87 (ListLongMap!1471 (_ BitVec 64)) V!3089)

(assert (=> b!91558 (= e!59727 (= (apply!87 lt!44675 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!24107 c!15181) b!91557))

(assert (= (and d!24107 (not c!15181)) b!91550))

(assert (= (and b!91550 c!15182) b!91556))

(assert (= (and b!91550 (not c!15182)) b!91553))

(assert (= (or b!91556 b!91553) bm!8912))

(assert (= (and d!24107 res!46609) b!91547))

(assert (= (and b!91547 res!46607) b!91554))

(assert (= (and b!91554 res!46606) b!91552))

(assert (= (and b!91554 c!15180) b!91555))

(assert (= (and b!91554 (not c!15180)) b!91548))

(assert (= (and b!91555 res!46608) b!91558))

(assert (= (and b!91548 c!15183) b!91549))

(assert (= (and b!91548 (not c!15183)) b!91551))

(declare-fun b_lambda!4041 () Bool)

(assert (=> (not b_lambda!4041) (not b!91556)))

(assert (=> b!91556 t!5360))

(declare-fun b_and!5557 () Bool)

(assert (= b_and!5537 (and (=> t!5360 result!3073) b_and!5557)))

(assert (=> b!91556 t!5362))

(declare-fun b_and!5559 () Bool)

(assert (= b_and!5539 (and (=> t!5362 result!3077) b_and!5559)))

(declare-fun b_lambda!4043 () Bool)

(assert (=> (not b_lambda!4043) (not b!91558)))

(assert (=> b!91558 t!5360))

(declare-fun b_and!5561 () Bool)

(assert (= b_and!5557 (and (=> t!5360 result!3073) b_and!5561)))

(assert (=> b!91558 t!5362))

(declare-fun b_and!5563 () Bool)

(assert (= b_and!5559 (and (=> t!5362 result!3077) b_and!5563)))

(declare-fun m!98281 () Bool)

(assert (=> b!91551 m!98281))

(declare-fun m!98283 () Bool)

(assert (=> b!91549 m!98283))

(declare-fun m!98285 () Bool)

(assert (=> b!91552 m!98285))

(assert (=> b!91552 m!98285))

(declare-fun m!98287 () Bool)

(assert (=> b!91552 m!98287))

(declare-fun m!98289 () Bool)

(assert (=> d!24107 m!98289))

(declare-fun m!98291 () Bool)

(assert (=> d!24107 m!98291))

(assert (=> bm!8912 m!98283))

(assert (=> b!91550 m!98285))

(assert (=> b!91550 m!98285))

(assert (=> b!91550 m!98287))

(declare-fun m!98293 () Bool)

(assert (=> b!91547 m!98293))

(assert (=> b!91555 m!98285))

(assert (=> b!91555 m!98285))

(declare-fun m!98295 () Bool)

(assert (=> b!91555 m!98295))

(assert (=> b!91558 m!98285))

(assert (=> b!91558 m!98285))

(declare-fun m!98297 () Bool)

(assert (=> b!91558 m!98297))

(declare-fun m!98299 () Bool)

(assert (=> b!91558 m!98299))

(assert (=> b!91558 m!98299))

(assert (=> b!91558 m!98063))

(declare-fun m!98301 () Bool)

(assert (=> b!91558 m!98301))

(assert (=> b!91558 m!98063))

(assert (=> b!91556 m!98285))

(declare-fun m!98303 () Bool)

(assert (=> b!91556 m!98303))

(declare-fun m!98305 () Bool)

(assert (=> b!91556 m!98305))

(declare-fun m!98307 () Bool)

(assert (=> b!91556 m!98307))

(assert (=> b!91556 m!98299))

(assert (=> b!91556 m!98299))

(assert (=> b!91556 m!98063))

(assert (=> b!91556 m!98301))

(assert (=> b!91556 m!98063))

(declare-fun m!98309 () Bool)

(assert (=> b!91556 m!98309))

(assert (=> b!91556 m!98303))

(assert (=> b!91355 d!24107))

(declare-fun d!24109 () Bool)

(declare-fun e!59732 () Bool)

(assert (=> d!24109 e!59732))

(declare-fun res!46614 () Bool)

(assert (=> d!24109 (=> (not res!46614) (not e!59732))))

(declare-fun lt!44684 () ListLongMap!1471)

(assert (=> d!24109 (= res!46614 (contains!769 lt!44684 (_1!1133 lt!44534)))))

(declare-fun lt!44687 () List!1537)

(assert (=> d!24109 (= lt!44684 (ListLongMap!1472 lt!44687))))

(declare-fun lt!44685 () Unit!2702)

(declare-fun lt!44686 () Unit!2702)

(assert (=> d!24109 (= lt!44685 lt!44686)))

(declare-datatypes ((Option!152 0))(
  ( (Some!151 (v!2729 V!3089)) (None!150) )
))
(declare-fun getValueByKey!146 (List!1537 (_ BitVec 64)) Option!152)

(assert (=> d!24109 (= (getValueByKey!146 lt!44687 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(declare-fun lemmaContainsTupThenGetReturnValue!63 (List!1537 (_ BitVec 64) V!3089) Unit!2702)

(assert (=> d!24109 (= lt!44686 (lemmaContainsTupThenGetReturnValue!63 lt!44687 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun insertStrictlySorted!66 (List!1537 (_ BitVec 64) V!3089) List!1537)

(assert (=> d!24109 (= lt!44687 (insertStrictlySorted!66 (toList!751 (+!120 lt!44533 lt!44536)) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(assert (=> d!24109 (= (+!120 (+!120 lt!44533 lt!44536) lt!44534) lt!44684)))

(declare-fun b!91563 () Bool)

(declare-fun res!46615 () Bool)

(assert (=> b!91563 (=> (not res!46615) (not e!59732))))

(assert (=> b!91563 (= res!46615 (= (getValueByKey!146 (toList!751 lt!44684) (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534))))))

(declare-fun b!91564 () Bool)

(declare-fun contains!771 (List!1537 tuple2!2244) Bool)

(assert (=> b!91564 (= e!59732 (contains!771 (toList!751 lt!44684) lt!44534))))

(assert (= (and d!24109 res!46614) b!91563))

(assert (= (and b!91563 res!46615) b!91564))

(declare-fun m!98311 () Bool)

(assert (=> d!24109 m!98311))

(declare-fun m!98313 () Bool)

(assert (=> d!24109 m!98313))

(declare-fun m!98315 () Bool)

(assert (=> d!24109 m!98315))

(declare-fun m!98317 () Bool)

(assert (=> d!24109 m!98317))

(declare-fun m!98319 () Bool)

(assert (=> b!91563 m!98319))

(declare-fun m!98321 () Bool)

(assert (=> b!91564 m!98321))

(assert (=> b!91355 d!24109))

(declare-fun d!24111 () Bool)

(declare-fun e!59733 () Bool)

(assert (=> d!24111 e!59733))

(declare-fun res!46616 () Bool)

(assert (=> d!24111 (=> (not res!46616) (not e!59733))))

(declare-fun lt!44688 () ListLongMap!1471)

(assert (=> d!24111 (= res!46616 (contains!769 lt!44688 (_1!1133 lt!44536)))))

(declare-fun lt!44691 () List!1537)

(assert (=> d!24111 (= lt!44688 (ListLongMap!1472 lt!44691))))

(declare-fun lt!44689 () Unit!2702)

(declare-fun lt!44690 () Unit!2702)

(assert (=> d!24111 (= lt!44689 lt!44690)))

(assert (=> d!24111 (= (getValueByKey!146 lt!44691 (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536)))))

(assert (=> d!24111 (= lt!44690 (lemmaContainsTupThenGetReturnValue!63 lt!44691 (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(assert (=> d!24111 (= lt!44691 (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(assert (=> d!24111 (= (+!120 lt!44533 lt!44536) lt!44688)))

(declare-fun b!91565 () Bool)

(declare-fun res!46617 () Bool)

(assert (=> b!91565 (=> (not res!46617) (not e!59733))))

(assert (=> b!91565 (= res!46617 (= (getValueByKey!146 (toList!751 lt!44688) (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536))))))

(declare-fun b!91566 () Bool)

(assert (=> b!91566 (= e!59733 (contains!771 (toList!751 lt!44688) lt!44536))))

(assert (= (and d!24111 res!46616) b!91565))

(assert (= (and b!91565 res!46617) b!91566))

(declare-fun m!98323 () Bool)

(assert (=> d!24111 m!98323))

(declare-fun m!98325 () Bool)

(assert (=> d!24111 m!98325))

(declare-fun m!98327 () Bool)

(assert (=> d!24111 m!98327))

(declare-fun m!98329 () Bool)

(assert (=> d!24111 m!98329))

(declare-fun m!98331 () Bool)

(assert (=> b!91565 m!98331))

(declare-fun m!98333 () Bool)

(assert (=> b!91566 m!98333))

(assert (=> b!91355 d!24111))

(declare-fun d!24113 () Bool)

(declare-fun e!59734 () Bool)

(assert (=> d!24113 e!59734))

(declare-fun res!46618 () Bool)

(assert (=> d!24113 (=> (not res!46618) (not e!59734))))

(declare-fun lt!44692 () ListLongMap!1471)

(assert (=> d!24113 (= res!46618 (contains!769 lt!44692 (_1!1133 lt!44534)))))

(declare-fun lt!44695 () List!1537)

(assert (=> d!24113 (= lt!44692 (ListLongMap!1472 lt!44695))))

(declare-fun lt!44693 () Unit!2702)

(declare-fun lt!44694 () Unit!2702)

(assert (=> d!24113 (= lt!44693 lt!44694)))

(assert (=> d!24113 (= (getValueByKey!146 lt!44695 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(assert (=> d!24113 (= lt!44694 (lemmaContainsTupThenGetReturnValue!63 lt!44695 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(assert (=> d!24113 (= lt!44695 (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(assert (=> d!24113 (= (+!120 lt!44533 lt!44534) lt!44692)))

(declare-fun b!91567 () Bool)

(declare-fun res!46619 () Bool)

(assert (=> b!91567 (=> (not res!46619) (not e!59734))))

(assert (=> b!91567 (= res!46619 (= (getValueByKey!146 (toList!751 lt!44692) (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534))))))

(declare-fun b!91568 () Bool)

(assert (=> b!91568 (= e!59734 (contains!771 (toList!751 lt!44692) lt!44534))))

(assert (= (and d!24113 res!46618) b!91567))

(assert (= (and b!91567 res!46619) b!91568))

(declare-fun m!98335 () Bool)

(assert (=> d!24113 m!98335))

(declare-fun m!98337 () Bool)

(assert (=> d!24113 m!98337))

(declare-fun m!98339 () Bool)

(assert (=> d!24113 m!98339))

(declare-fun m!98341 () Bool)

(assert (=> d!24113 m!98341))

(declare-fun m!98343 () Bool)

(assert (=> b!91567 m!98343))

(declare-fun m!98345 () Bool)

(assert (=> b!91568 m!98345))

(assert (=> b!91355 d!24113))

(declare-fun d!24115 () Bool)

(declare-fun e!59735 () Bool)

(assert (=> d!24115 e!59735))

(declare-fun res!46620 () Bool)

(assert (=> d!24115 (=> (not res!46620) (not e!59735))))

(declare-fun lt!44696 () ListLongMap!1471)

(assert (=> d!24115 (= res!46620 (contains!769 lt!44696 (_1!1133 lt!44540)))))

(declare-fun lt!44699 () List!1537)

(assert (=> d!24115 (= lt!44696 (ListLongMap!1472 lt!44699))))

(declare-fun lt!44697 () Unit!2702)

(declare-fun lt!44698 () Unit!2702)

(assert (=> d!24115 (= lt!44697 lt!44698)))

(assert (=> d!24115 (= (getValueByKey!146 lt!44699 (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540)))))

(assert (=> d!24115 (= lt!44698 (lemmaContainsTupThenGetReturnValue!63 lt!44699 (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(assert (=> d!24115 (= lt!44699 (insertStrictlySorted!66 (toList!751 lt!44528) (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(assert (=> d!24115 (= (+!120 lt!44528 lt!44540) lt!44696)))

(declare-fun b!91569 () Bool)

(declare-fun res!46621 () Bool)

(assert (=> b!91569 (=> (not res!46621) (not e!59735))))

(assert (=> b!91569 (= res!46621 (= (getValueByKey!146 (toList!751 lt!44696) (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540))))))

(declare-fun b!91570 () Bool)

(assert (=> b!91570 (= e!59735 (contains!771 (toList!751 lt!44696) lt!44540))))

(assert (= (and d!24115 res!46620) b!91569))

(assert (= (and b!91569 res!46621) b!91570))

(declare-fun m!98347 () Bool)

(assert (=> d!24115 m!98347))

(declare-fun m!98349 () Bool)

(assert (=> d!24115 m!98349))

(declare-fun m!98351 () Bool)

(assert (=> d!24115 m!98351))

(declare-fun m!98353 () Bool)

(assert (=> d!24115 m!98353))

(declare-fun m!98355 () Bool)

(assert (=> b!91569 m!98355))

(declare-fun m!98357 () Bool)

(assert (=> b!91570 m!98357))

(assert (=> b!91355 d!24115))

(declare-fun d!24117 () Bool)

(declare-fun e!59736 () Bool)

(assert (=> d!24117 e!59736))

(declare-fun res!46622 () Bool)

(assert (=> d!24117 (=> (not res!46622) (not e!59736))))

(declare-fun lt!44700 () ListLongMap!1471)

(assert (=> d!24117 (= res!46622 (contains!769 lt!44700 (_1!1133 lt!44540)))))

(declare-fun lt!44703 () List!1537)

(assert (=> d!24117 (= lt!44700 (ListLongMap!1472 lt!44703))))

(declare-fun lt!44701 () Unit!2702)

(declare-fun lt!44702 () Unit!2702)

(assert (=> d!24117 (= lt!44701 lt!44702)))

(assert (=> d!24117 (= (getValueByKey!146 lt!44703 (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540)))))

(assert (=> d!24117 (= lt!44702 (lemmaContainsTupThenGetReturnValue!63 lt!44703 (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(assert (=> d!24117 (= lt!44703 (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(assert (=> d!24117 (= (+!120 lt!44531 lt!44540) lt!44700)))

(declare-fun b!91571 () Bool)

(declare-fun res!46623 () Bool)

(assert (=> b!91571 (=> (not res!46623) (not e!59736))))

(assert (=> b!91571 (= res!46623 (= (getValueByKey!146 (toList!751 lt!44700) (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540))))))

(declare-fun b!91572 () Bool)

(assert (=> b!91572 (= e!59736 (contains!771 (toList!751 lt!44700) lt!44540))))

(assert (= (and d!24117 res!46622) b!91571))

(assert (= (and b!91571 res!46623) b!91572))

(declare-fun m!98359 () Bool)

(assert (=> d!24117 m!98359))

(declare-fun m!98361 () Bool)

(assert (=> d!24117 m!98361))

(declare-fun m!98363 () Bool)

(assert (=> d!24117 m!98363))

(declare-fun m!98365 () Bool)

(assert (=> d!24117 m!98365))

(declare-fun m!98367 () Bool)

(assert (=> b!91571 m!98367))

(declare-fun m!98369 () Bool)

(assert (=> b!91572 m!98369))

(assert (=> b!91355 d!24117))

(declare-fun d!24119 () Bool)

(assert (=> d!24119 (= (+!120 (+!120 lt!44533 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (+!120 (+!120 lt!44533 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(declare-fun lt!44704 () Unit!2702)

(assert (=> d!24119 (= lt!44704 (choose!550 lt!44533 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(assert (=> d!24119 (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24119 (= (addCommutativeForDiffKeys!40 lt!44533 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))) lt!44704)))

(declare-fun bs!3805 () Bool)

(assert (= bs!3805 d!24119))

(declare-fun m!98371 () Bool)

(assert (=> bs!3805 m!98371))

(declare-fun m!98373 () Bool)

(assert (=> bs!3805 m!98373))

(declare-fun m!98375 () Bool)

(assert (=> bs!3805 m!98375))

(declare-fun m!98377 () Bool)

(assert (=> bs!3805 m!98377))

(assert (=> bs!3805 m!98375))

(assert (=> bs!3805 m!98371))

(assert (=> bs!3805 m!98059))

(declare-fun m!98379 () Bool)

(assert (=> bs!3805 m!98379))

(assert (=> b!91355 d!24119))

(declare-fun d!24121 () Bool)

(declare-fun e!59737 () Bool)

(assert (=> d!24121 e!59737))

(declare-fun res!46624 () Bool)

(assert (=> d!24121 (=> (not res!46624) (not e!59737))))

(declare-fun lt!44705 () ListLongMap!1471)

(assert (=> d!24121 (= res!46624 (contains!769 lt!44705 (_1!1133 lt!44536)))))

(declare-fun lt!44708 () List!1537)

(assert (=> d!24121 (= lt!44705 (ListLongMap!1472 lt!44708))))

(declare-fun lt!44706 () Unit!2702)

(declare-fun lt!44707 () Unit!2702)

(assert (=> d!24121 (= lt!44706 lt!44707)))

(assert (=> d!24121 (= (getValueByKey!146 lt!44708 (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536)))))

(assert (=> d!24121 (= lt!44707 (lemmaContainsTupThenGetReturnValue!63 lt!44708 (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(assert (=> d!24121 (= lt!44708 (insertStrictlySorted!66 (toList!751 lt!44530) (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(assert (=> d!24121 (= (+!120 lt!44530 lt!44536) lt!44705)))

(declare-fun b!91573 () Bool)

(declare-fun res!46625 () Bool)

(assert (=> b!91573 (=> (not res!46625) (not e!59737))))

(assert (=> b!91573 (= res!46625 (= (getValueByKey!146 (toList!751 lt!44705) (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536))))))

(declare-fun b!91574 () Bool)

(assert (=> b!91574 (= e!59737 (contains!771 (toList!751 lt!44705) lt!44536))))

(assert (= (and d!24121 res!46624) b!91573))

(assert (= (and b!91573 res!46625) b!91574))

(declare-fun m!98381 () Bool)

(assert (=> d!24121 m!98381))

(declare-fun m!98383 () Bool)

(assert (=> d!24121 m!98383))

(declare-fun m!98385 () Bool)

(assert (=> d!24121 m!98385))

(declare-fun m!98387 () Bool)

(assert (=> d!24121 m!98387))

(declare-fun m!98389 () Bool)

(assert (=> b!91573 m!98389))

(declare-fun m!98391 () Bool)

(assert (=> b!91574 m!98391))

(assert (=> b!91355 d!24121))

(declare-fun b!91617 () Bool)

(declare-fun e!59776 () Bool)

(declare-fun e!59765 () Bool)

(assert (=> b!91617 (= e!59776 e!59765)))

(declare-fun res!46645 () Bool)

(assert (=> b!91617 (=> (not res!46645) (not e!59765))))

(declare-fun lt!44758 () ListLongMap!1471)

(assert (=> b!91617 (= res!46645 (contains!769 lt!44758 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!91617 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91618 () Bool)

(declare-fun res!46648 () Bool)

(declare-fun e!59773 () Bool)

(assert (=> b!91618 (=> (not res!46648) (not e!59773))))

(declare-fun e!59770 () Bool)

(assert (=> b!91618 (= res!46648 e!59770)))

(declare-fun c!15201 () Bool)

(assert (=> b!91618 (= c!15201 (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91619 () Bool)

(declare-fun call!8933 () Bool)

(assert (=> b!91619 (= e!59770 (not call!8933))))

(declare-fun b!91620 () Bool)

(declare-fun res!46647 () Bool)

(assert (=> b!91620 (=> (not res!46647) (not e!59773))))

(assert (=> b!91620 (= res!46647 e!59776)))

(declare-fun res!46646 () Bool)

(assert (=> b!91620 (=> res!46646 e!59776)))

(declare-fun e!59769 () Bool)

(assert (=> b!91620 (= res!46646 (not e!59769))))

(declare-fun res!46650 () Bool)

(assert (=> b!91620 (=> (not res!46650) (not e!59769))))

(assert (=> b!91620 (= res!46650 (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91621 () Bool)

(declare-fun e!59775 () Unit!2702)

(declare-fun lt!44759 () Unit!2702)

(assert (=> b!91621 (= e!59775 lt!44759)))

(declare-fun lt!44773 () ListLongMap!1471)

(assert (=> b!91621 (= lt!44773 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44753 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44757 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44757 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(declare-fun lt!44755 () Unit!2702)

(declare-fun addStillContains!63 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> b!91621 (= lt!44755 (addStillContains!63 lt!44773 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44757))))

(assert (=> b!91621 (contains!769 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44757)))

(declare-fun lt!44766 () Unit!2702)

(assert (=> b!91621 (= lt!44766 lt!44755)))

(declare-fun lt!44769 () ListLongMap!1471)

(assert (=> b!91621 (= lt!44769 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44771 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44761 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44761 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(declare-fun lt!44774 () Unit!2702)

(declare-fun addApplyDifferent!63 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> b!91621 (= lt!44774 (addApplyDifferent!63 lt!44769 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44761))))

(assert (=> b!91621 (= (apply!87 (+!120 lt!44769 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44761) (apply!87 lt!44769 lt!44761))))

(declare-fun lt!44767 () Unit!2702)

(assert (=> b!91621 (= lt!44767 lt!44774)))

(declare-fun lt!44770 () ListLongMap!1471)

(assert (=> b!91621 (= lt!44770 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44762 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44754 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44754 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(declare-fun lt!44756 () Unit!2702)

(assert (=> b!91621 (= lt!44756 (addApplyDifferent!63 lt!44770 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44754))))

(assert (=> b!91621 (= (apply!87 (+!120 lt!44770 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44754) (apply!87 lt!44770 lt!44754))))

(declare-fun lt!44763 () Unit!2702)

(assert (=> b!91621 (= lt!44763 lt!44756)))

(declare-fun lt!44764 () ListLongMap!1471)

(assert (=> b!91621 (= lt!44764 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44760 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44760 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44768 () (_ BitVec 64))

(assert (=> b!91621 (= lt!44768 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(assert (=> b!91621 (= lt!44759 (addApplyDifferent!63 lt!44764 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44768))))

(assert (=> b!91621 (= (apply!87 (+!120 lt!44764 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44768) (apply!87 lt!44764 lt!44768))))

(declare-fun b!91622 () Bool)

(declare-fun e!59772 () Bool)

(assert (=> b!91622 (= e!59772 (= (apply!87 lt!44758 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun d!24123 () Bool)

(assert (=> d!24123 e!59773))

(declare-fun res!46649 () Bool)

(assert (=> d!24123 (=> (not res!46649) (not e!59773))))

(assert (=> d!24123 (= res!46649 (or (bvsge from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun lt!44772 () ListLongMap!1471)

(assert (=> d!24123 (= lt!44758 lt!44772)))

(declare-fun lt!44765 () Unit!2702)

(assert (=> d!24123 (= lt!44765 e!59775)))

(declare-fun c!15200 () Bool)

(declare-fun e!59764 () Bool)

(assert (=> d!24123 (= c!15200 e!59764)))

(declare-fun res!46652 () Bool)

(assert (=> d!24123 (=> (not res!46652) (not e!59764))))

(assert (=> d!24123 (= res!46652 (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun e!59766 () ListLongMap!1471)

(assert (=> d!24123 (= lt!44772 e!59766)))

(declare-fun c!15197 () Bool)

(assert (=> d!24123 (= c!15197 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24123 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24123 (= (getCurrentListMap!441 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!44758)))

(declare-fun b!91623 () Bool)

(declare-fun e!59774 () ListLongMap!1471)

(declare-fun call!8932 () ListLongMap!1471)

(assert (=> b!91623 (= e!59774 call!8932)))

(declare-fun bm!8927 () Bool)

(declare-fun call!8935 () ListLongMap!1471)

(declare-fun call!8930 () ListLongMap!1471)

(assert (=> bm!8927 (= call!8935 call!8930)))

(declare-fun b!91624 () Bool)

(declare-fun e!59767 () Bool)

(assert (=> b!91624 (= e!59773 e!59767)))

(declare-fun c!15198 () Bool)

(assert (=> b!91624 (= c!15198 (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91625 () Bool)

(assert (=> b!91625 (= e!59764 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91626 () Bool)

(declare-fun e!59768 () Bool)

(assert (=> b!91626 (= e!59768 (= (apply!87 lt!44758 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91627 () Bool)

(declare-fun c!15196 () Bool)

(assert (=> b!91627 (= c!15196 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59771 () ListLongMap!1471)

(assert (=> b!91627 (= e!59771 e!59774)))

(declare-fun b!91628 () Bool)

(assert (=> b!91628 (= e!59767 e!59768)))

(declare-fun res!46644 () Bool)

(declare-fun call!8936 () Bool)

(assert (=> b!91628 (= res!46644 call!8936)))

(assert (=> b!91628 (=> (not res!46644) (not e!59768))))

(declare-fun bm!8928 () Bool)

(assert (=> bm!8928 (= call!8933 (contains!769 lt!44758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91629 () Bool)

(assert (=> b!91629 (= e!59766 e!59771)))

(declare-fun c!15199 () Bool)

(assert (=> b!91629 (= c!15199 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8929 () Bool)

(assert (=> bm!8929 (= call!8936 (contains!769 lt!44758 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8930 () Bool)

(declare-fun call!8934 () ListLongMap!1471)

(assert (=> bm!8930 (= call!8934 call!8935)))

(declare-fun call!8931 () ListLongMap!1471)

(declare-fun bm!8931 () Bool)

(assert (=> bm!8931 (= call!8931 (+!120 (ite c!15197 call!8930 (ite c!15199 call!8935 call!8934)) (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun b!91630 () Bool)

(assert (=> b!91630 (= e!59774 call!8934)))

(declare-fun b!91631 () Bool)

(assert (=> b!91631 (= e!59767 (not call!8936))))

(declare-fun bm!8932 () Bool)

(assert (=> bm!8932 (= call!8930 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91632 () Bool)

(assert (=> b!91632 (= e!59771 call!8932)))

(declare-fun b!91633 () Bool)

(assert (=> b!91633 (= e!59766 (+!120 call!8931 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91634 () Bool)

(assert (=> b!91634 (= e!59769 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun bm!8933 () Bool)

(assert (=> bm!8933 (= call!8932 call!8931)))

(declare-fun b!91635 () Bool)

(assert (=> b!91635 (= e!59770 e!59772)))

(declare-fun res!46651 () Bool)

(assert (=> b!91635 (= res!46651 call!8933)))

(assert (=> b!91635 (=> (not res!46651) (not e!59772))))

(declare-fun b!91636 () Bool)

(declare-fun Unit!2713 () Unit!2702)

(assert (=> b!91636 (= e!59775 Unit!2713)))

(declare-fun b!91637 () Bool)

(assert (=> b!91637 (= e!59765 (= (apply!87 lt!44758 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91637 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!91637 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24123 c!15197) b!91633))

(assert (= (and d!24123 (not c!15197)) b!91629))

(assert (= (and b!91629 c!15199) b!91632))

(assert (= (and b!91629 (not c!15199)) b!91627))

(assert (= (and b!91627 c!15196) b!91623))

(assert (= (and b!91627 (not c!15196)) b!91630))

(assert (= (or b!91623 b!91630) bm!8930))

(assert (= (or b!91632 bm!8930) bm!8927))

(assert (= (or b!91632 b!91623) bm!8933))

(assert (= (or b!91633 bm!8927) bm!8932))

(assert (= (or b!91633 bm!8933) bm!8931))

(assert (= (and d!24123 res!46652) b!91625))

(assert (= (and d!24123 c!15200) b!91621))

(assert (= (and d!24123 (not c!15200)) b!91636))

(assert (= (and d!24123 res!46649) b!91620))

(assert (= (and b!91620 res!46650) b!91634))

(assert (= (and b!91620 (not res!46646)) b!91617))

(assert (= (and b!91617 res!46645) b!91637))

(assert (= (and b!91620 res!46647) b!91618))

(assert (= (and b!91618 c!15201) b!91635))

(assert (= (and b!91618 (not c!15201)) b!91619))

(assert (= (and b!91635 res!46651) b!91622))

(assert (= (or b!91635 b!91619) bm!8928))

(assert (= (and b!91618 res!46648) b!91624))

(assert (= (and b!91624 c!15198) b!91628))

(assert (= (and b!91624 (not c!15198)) b!91631))

(assert (= (and b!91628 res!46644) b!91626))

(assert (= (or b!91628 b!91631) bm!8929))

(declare-fun b_lambda!4045 () Bool)

(assert (=> (not b_lambda!4045) (not b!91637)))

(assert (=> b!91637 t!5360))

(declare-fun b_and!5565 () Bool)

(assert (= b_and!5561 (and (=> t!5360 result!3073) b_and!5565)))

(assert (=> b!91637 t!5362))

(declare-fun b_and!5567 () Bool)

(assert (= b_and!5563 (and (=> t!5362 result!3077) b_and!5567)))

(assert (=> b!91625 m!98059))

(assert (=> b!91625 m!98059))

(declare-fun m!98393 () Bool)

(assert (=> b!91625 m!98393))

(declare-fun m!98395 () Bool)

(assert (=> bm!8928 m!98395))

(declare-fun m!98397 () Bool)

(assert (=> b!91621 m!98397))

(declare-fun m!98399 () Bool)

(assert (=> b!91621 m!98399))

(declare-fun m!98401 () Bool)

(assert (=> b!91621 m!98401))

(declare-fun m!98403 () Bool)

(assert (=> b!91621 m!98403))

(assert (=> b!91621 m!98059))

(declare-fun m!98405 () Bool)

(assert (=> b!91621 m!98405))

(assert (=> b!91621 m!98401))

(declare-fun m!98407 () Bool)

(assert (=> b!91621 m!98407))

(declare-fun m!98409 () Bool)

(assert (=> b!91621 m!98409))

(declare-fun m!98411 () Bool)

(assert (=> b!91621 m!98411))

(assert (=> b!91621 m!98405))

(declare-fun m!98413 () Bool)

(assert (=> b!91621 m!98413))

(declare-fun m!98415 () Bool)

(assert (=> b!91621 m!98415))

(declare-fun m!98417 () Bool)

(assert (=> b!91621 m!98417))

(assert (=> b!91621 m!98397))

(declare-fun m!98419 () Bool)

(assert (=> b!91621 m!98419))

(declare-fun m!98421 () Bool)

(assert (=> b!91621 m!98421))

(declare-fun m!98423 () Bool)

(assert (=> b!91621 m!98423))

(declare-fun m!98425 () Bool)

(assert (=> b!91621 m!98425))

(assert (=> b!91621 m!98407))

(declare-fun m!98427 () Bool)

(assert (=> b!91621 m!98427))

(assert (=> d!24123 m!98291))

(assert (=> b!91637 m!98063))

(assert (=> b!91637 m!98061))

(assert (=> b!91637 m!98059))

(assert (=> b!91637 m!98059))

(declare-fun m!98429 () Bool)

(assert (=> b!91637 m!98429))

(assert (=> b!91637 m!98061))

(assert (=> b!91637 m!98063))

(assert (=> b!91637 m!98065))

(declare-fun m!98431 () Bool)

(assert (=> bm!8929 m!98431))

(assert (=> bm!8932 m!98427))

(assert (=> b!91634 m!98059))

(assert (=> b!91634 m!98059))

(assert (=> b!91634 m!98393))

(declare-fun m!98433 () Bool)

(assert (=> b!91633 m!98433))

(declare-fun m!98435 () Bool)

(assert (=> b!91626 m!98435))

(declare-fun m!98437 () Bool)

(assert (=> b!91622 m!98437))

(declare-fun m!98439 () Bool)

(assert (=> bm!8931 m!98439))

(assert (=> b!91617 m!98059))

(assert (=> b!91617 m!98059))

(declare-fun m!98441 () Bool)

(assert (=> b!91617 m!98441))

(assert (=> b!91355 d!24123))

(declare-fun d!24125 () Bool)

(declare-fun e!59777 () Bool)

(assert (=> d!24125 e!59777))

(declare-fun res!46653 () Bool)

(assert (=> d!24125 (=> (not res!46653) (not e!59777))))

(declare-fun lt!44775 () ListLongMap!1471)

(assert (=> d!24125 (= res!46653 (contains!769 lt!44775 (_1!1133 lt!44534)))))

(declare-fun lt!44778 () List!1537)

(assert (=> d!24125 (= lt!44775 (ListLongMap!1472 lt!44778))))

(declare-fun lt!44776 () Unit!2702)

(declare-fun lt!44777 () Unit!2702)

(assert (=> d!24125 (= lt!44776 lt!44777)))

(assert (=> d!24125 (= (getValueByKey!146 lt!44778 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(assert (=> d!24125 (= lt!44777 (lemmaContainsTupThenGetReturnValue!63 lt!44778 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(assert (=> d!24125 (= lt!44778 (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(assert (=> d!24125 (= (+!120 lt!44531 lt!44534) lt!44775)))

(declare-fun b!91638 () Bool)

(declare-fun res!46654 () Bool)

(assert (=> b!91638 (=> (not res!46654) (not e!59777))))

(assert (=> b!91638 (= res!46654 (= (getValueByKey!146 (toList!751 lt!44775) (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534))))))

(declare-fun b!91639 () Bool)

(assert (=> b!91639 (= e!59777 (contains!771 (toList!751 lt!44775) lt!44534))))

(assert (= (and d!24125 res!46653) b!91638))

(assert (= (and b!91638 res!46654) b!91639))

(declare-fun m!98443 () Bool)

(assert (=> d!24125 m!98443))

(declare-fun m!98445 () Bool)

(assert (=> d!24125 m!98445))

(declare-fun m!98447 () Bool)

(assert (=> d!24125 m!98447))

(declare-fun m!98449 () Bool)

(assert (=> d!24125 m!98449))

(declare-fun m!98451 () Bool)

(assert (=> b!91638 m!98451))

(declare-fun m!98453 () Bool)

(assert (=> b!91639 m!98453))

(assert (=> b!91355 d!24125))

(declare-fun d!24127 () Bool)

(assert (=> d!24127 (= (map!1223 (_2!1132 lt!44543)) (getCurrentListMap!441 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun bs!3806 () Bool)

(assert (= bs!3806 d!24127))

(declare-fun m!98455 () Bool)

(assert (=> bs!3806 m!98455))

(assert (=> b!91355 d!24127))

(declare-fun d!24129 () Bool)

(assert (=> d!24129 (= (valid!364 thiss!992) (valid!363 (v!2723 (underlying!315 thiss!992))))))

(declare-fun bs!3807 () Bool)

(assert (= bs!3807 d!24129))

(declare-fun m!98457 () Bool)

(assert (=> bs!3807 m!98457))

(assert (=> start!11156 d!24129))

(declare-fun d!24131 () Bool)

(assert (=> d!24131 (= (map!1223 newMap!16) (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun bs!3808 () Bool)

(assert (= bs!3808 d!24131))

(declare-fun m!98459 () Bool)

(assert (=> bs!3808 m!98459))

(assert (=> b!91373 d!24131))

(declare-fun b!91640 () Bool)

(declare-fun e!59790 () Bool)

(declare-fun e!59779 () Bool)

(assert (=> b!91640 (= e!59790 e!59779)))

(declare-fun res!46656 () Bool)

(assert (=> b!91640 (=> (not res!46656) (not e!59779))))

(declare-fun lt!44784 () ListLongMap!1471)

(assert (=> b!91640 (= res!46656 (contains!769 lt!44784 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!91640 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91641 () Bool)

(declare-fun res!46659 () Bool)

(declare-fun e!59787 () Bool)

(assert (=> b!91641 (=> (not res!46659) (not e!59787))))

(declare-fun e!59784 () Bool)

(assert (=> b!91641 (= res!46659 e!59784)))

(declare-fun c!15207 () Bool)

(assert (=> b!91641 (= c!15207 (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91642 () Bool)

(declare-fun call!8940 () Bool)

(assert (=> b!91642 (= e!59784 (not call!8940))))

(declare-fun b!91643 () Bool)

(declare-fun res!46658 () Bool)

(assert (=> b!91643 (=> (not res!46658) (not e!59787))))

(assert (=> b!91643 (= res!46658 e!59790)))

(declare-fun res!46657 () Bool)

(assert (=> b!91643 (=> res!46657 e!59790)))

(declare-fun e!59783 () Bool)

(assert (=> b!91643 (= res!46657 (not e!59783))))

(declare-fun res!46661 () Bool)

(assert (=> b!91643 (=> (not res!46661) (not e!59783))))

(assert (=> b!91643 (= res!46661 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91644 () Bool)

(declare-fun e!59789 () Unit!2702)

(declare-fun lt!44785 () Unit!2702)

(assert (=> b!91644 (= e!59789 lt!44785)))

(declare-fun lt!44799 () ListLongMap!1471)

(assert (=> b!91644 (= lt!44799 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44779 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44783 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44783 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44781 () Unit!2702)

(assert (=> b!91644 (= lt!44781 (addStillContains!63 lt!44799 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44783))))

(assert (=> b!91644 (contains!769 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44783)))

(declare-fun lt!44792 () Unit!2702)

(assert (=> b!91644 (= lt!44792 lt!44781)))

(declare-fun lt!44795 () ListLongMap!1471)

(assert (=> b!91644 (= lt!44795 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44797 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44787 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44787 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44800 () Unit!2702)

(assert (=> b!91644 (= lt!44800 (addApplyDifferent!63 lt!44795 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44787))))

(assert (=> b!91644 (= (apply!87 (+!120 lt!44795 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44787) (apply!87 lt!44795 lt!44787))))

(declare-fun lt!44793 () Unit!2702)

(assert (=> b!91644 (= lt!44793 lt!44800)))

(declare-fun lt!44796 () ListLongMap!1471)

(assert (=> b!91644 (= lt!44796 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44788 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44780 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44780 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44782 () Unit!2702)

(assert (=> b!91644 (= lt!44782 (addApplyDifferent!63 lt!44796 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44780))))

(assert (=> b!91644 (= (apply!87 (+!120 lt!44796 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44780) (apply!87 lt!44796 lt!44780))))

(declare-fun lt!44789 () Unit!2702)

(assert (=> b!91644 (= lt!44789 lt!44782)))

(declare-fun lt!44790 () ListLongMap!1471)

(assert (=> b!91644 (= lt!44790 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun lt!44786 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44786 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44794 () (_ BitVec 64))

(assert (=> b!91644 (= lt!44794 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!91644 (= lt!44785 (addApplyDifferent!63 lt!44790 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44794))))

(assert (=> b!91644 (= (apply!87 (+!120 lt!44790 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44794) (apply!87 lt!44790 lt!44794))))

(declare-fun b!91645 () Bool)

(declare-fun e!59786 () Bool)

(assert (=> b!91645 (= e!59786 (= (apply!87 lt!44784 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun d!24133 () Bool)

(assert (=> d!24133 e!59787))

(declare-fun res!46660 () Bool)

(assert (=> d!24133 (=> (not res!46660) (not e!59787))))

(assert (=> d!24133 (= res!46660 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun lt!44798 () ListLongMap!1471)

(assert (=> d!24133 (= lt!44784 lt!44798)))

(declare-fun lt!44791 () Unit!2702)

(assert (=> d!24133 (= lt!44791 e!59789)))

(declare-fun c!15206 () Bool)

(declare-fun e!59778 () Bool)

(assert (=> d!24133 (= c!15206 e!59778)))

(declare-fun res!46663 () Bool)

(assert (=> d!24133 (=> (not res!46663) (not e!59778))))

(assert (=> d!24133 (= res!46663 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun e!59780 () ListLongMap!1471)

(assert (=> d!24133 (= lt!44798 e!59780)))

(declare-fun c!15203 () Bool)

(assert (=> d!24133 (= c!15203 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24133 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24133 (= (getCurrentListMap!441 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!44784)))

(declare-fun b!91646 () Bool)

(declare-fun e!59788 () ListLongMap!1471)

(declare-fun call!8939 () ListLongMap!1471)

(assert (=> b!91646 (= e!59788 call!8939)))

(declare-fun bm!8934 () Bool)

(declare-fun call!8942 () ListLongMap!1471)

(declare-fun call!8937 () ListLongMap!1471)

(assert (=> bm!8934 (= call!8942 call!8937)))

(declare-fun b!91647 () Bool)

(declare-fun e!59781 () Bool)

(assert (=> b!91647 (= e!59787 e!59781)))

(declare-fun c!15204 () Bool)

(assert (=> b!91647 (= c!15204 (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91648 () Bool)

(assert (=> b!91648 (= e!59778 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!91649 () Bool)

(declare-fun e!59782 () Bool)

(assert (=> b!91649 (= e!59782 (= (apply!87 lt!44784 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91650 () Bool)

(declare-fun c!15202 () Bool)

(assert (=> b!91650 (= c!15202 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59785 () ListLongMap!1471)

(assert (=> b!91650 (= e!59785 e!59788)))

(declare-fun b!91651 () Bool)

(assert (=> b!91651 (= e!59781 e!59782)))

(declare-fun res!46655 () Bool)

(declare-fun call!8943 () Bool)

(assert (=> b!91651 (= res!46655 call!8943)))

(assert (=> b!91651 (=> (not res!46655) (not e!59782))))

(declare-fun bm!8935 () Bool)

(assert (=> bm!8935 (= call!8940 (contains!769 lt!44784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91652 () Bool)

(assert (=> b!91652 (= e!59780 e!59785)))

(declare-fun c!15205 () Bool)

(assert (=> b!91652 (= c!15205 (and (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8936 () Bool)

(assert (=> bm!8936 (= call!8943 (contains!769 lt!44784 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8937 () Bool)

(declare-fun call!8941 () ListLongMap!1471)

(assert (=> bm!8937 (= call!8941 call!8942)))

(declare-fun call!8938 () ListLongMap!1471)

(declare-fun bm!8938 () Bool)

(assert (=> bm!8938 (= call!8938 (+!120 (ite c!15203 call!8937 (ite c!15205 call!8942 call!8941)) (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun b!91653 () Bool)

(assert (=> b!91653 (= e!59788 call!8941)))

(declare-fun b!91654 () Bool)

(assert (=> b!91654 (= e!59781 (not call!8943))))

(declare-fun bm!8939 () Bool)

(assert (=> bm!8939 (= call!8937 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!91655 () Bool)

(assert (=> b!91655 (= e!59785 call!8939)))

(declare-fun b!91656 () Bool)

(assert (=> b!91656 (= e!59780 (+!120 call!8938 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91657 () Bool)

(assert (=> b!91657 (= e!59783 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8940 () Bool)

(assert (=> bm!8940 (= call!8939 call!8938)))

(declare-fun b!91658 () Bool)

(assert (=> b!91658 (= e!59784 e!59786)))

(declare-fun res!46662 () Bool)

(assert (=> b!91658 (= res!46662 call!8940)))

(assert (=> b!91658 (=> (not res!46662) (not e!59786))))

(declare-fun b!91659 () Bool)

(declare-fun Unit!2714 () Unit!2702)

(assert (=> b!91659 (= e!59789 Unit!2714)))

(declare-fun b!91660 () Bool)

(assert (=> b!91660 (= e!59779 (= (apply!87 lt!44784 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91660 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!91660 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24133 c!15203) b!91656))

(assert (= (and d!24133 (not c!15203)) b!91652))

(assert (= (and b!91652 c!15205) b!91655))

(assert (= (and b!91652 (not c!15205)) b!91650))

(assert (= (and b!91650 c!15202) b!91646))

(assert (= (and b!91650 (not c!15202)) b!91653))

(assert (= (or b!91646 b!91653) bm!8937))

(assert (= (or b!91655 bm!8937) bm!8934))

(assert (= (or b!91655 b!91646) bm!8940))

(assert (= (or b!91656 bm!8934) bm!8939))

(assert (= (or b!91656 bm!8940) bm!8938))

(assert (= (and d!24133 res!46663) b!91648))

(assert (= (and d!24133 c!15206) b!91644))

(assert (= (and d!24133 (not c!15206)) b!91659))

(assert (= (and d!24133 res!46660) b!91643))

(assert (= (and b!91643 res!46661) b!91657))

(assert (= (and b!91643 (not res!46657)) b!91640))

(assert (= (and b!91640 res!46656) b!91660))

(assert (= (and b!91643 res!46658) b!91641))

(assert (= (and b!91641 c!15207) b!91658))

(assert (= (and b!91641 (not c!15207)) b!91642))

(assert (= (and b!91658 res!46662) b!91645))

(assert (= (or b!91658 b!91642) bm!8935))

(assert (= (and b!91641 res!46659) b!91647))

(assert (= (and b!91647 c!15204) b!91651))

(assert (= (and b!91647 (not c!15204)) b!91654))

(assert (= (and b!91651 res!46655) b!91649))

(assert (= (or b!91651 b!91654) bm!8936))

(declare-fun b_lambda!4047 () Bool)

(assert (=> (not b_lambda!4047) (not b!91660)))

(assert (=> b!91660 t!5360))

(declare-fun b_and!5569 () Bool)

(assert (= b_and!5565 (and (=> t!5360 result!3073) b_and!5569)))

(assert (=> b!91660 t!5362))

(declare-fun b_and!5571 () Bool)

(assert (= b_and!5567 (and (=> t!5362 result!3077) b_and!5571)))

(assert (=> b!91648 m!98285))

(assert (=> b!91648 m!98285))

(assert (=> b!91648 m!98287))

(declare-fun m!98461 () Bool)

(assert (=> bm!8935 m!98461))

(declare-fun m!98463 () Bool)

(assert (=> b!91644 m!98463))

(declare-fun m!98465 () Bool)

(assert (=> b!91644 m!98465))

(declare-fun m!98467 () Bool)

(assert (=> b!91644 m!98467))

(declare-fun m!98469 () Bool)

(assert (=> b!91644 m!98469))

(assert (=> b!91644 m!98285))

(declare-fun m!98471 () Bool)

(assert (=> b!91644 m!98471))

(assert (=> b!91644 m!98467))

(declare-fun m!98473 () Bool)

(assert (=> b!91644 m!98473))

(declare-fun m!98475 () Bool)

(assert (=> b!91644 m!98475))

(declare-fun m!98477 () Bool)

(assert (=> b!91644 m!98477))

(assert (=> b!91644 m!98471))

(declare-fun m!98479 () Bool)

(assert (=> b!91644 m!98479))

(declare-fun m!98481 () Bool)

(assert (=> b!91644 m!98481))

(declare-fun m!98483 () Bool)

(assert (=> b!91644 m!98483))

(assert (=> b!91644 m!98463))

(declare-fun m!98485 () Bool)

(assert (=> b!91644 m!98485))

(declare-fun m!98487 () Bool)

(assert (=> b!91644 m!98487))

(declare-fun m!98489 () Bool)

(assert (=> b!91644 m!98489))

(declare-fun m!98491 () Bool)

(assert (=> b!91644 m!98491))

(assert (=> b!91644 m!98473))

(assert (=> b!91644 m!98103))

(assert (=> d!24133 m!98291))

(assert (=> b!91660 m!98063))

(assert (=> b!91660 m!98299))

(assert (=> b!91660 m!98285))

(assert (=> b!91660 m!98285))

(declare-fun m!98493 () Bool)

(assert (=> b!91660 m!98493))

(assert (=> b!91660 m!98299))

(assert (=> b!91660 m!98063))

(assert (=> b!91660 m!98301))

(declare-fun m!98495 () Bool)

(assert (=> bm!8936 m!98495))

(assert (=> bm!8939 m!98103))

(assert (=> b!91657 m!98285))

(assert (=> b!91657 m!98285))

(assert (=> b!91657 m!98287))

(declare-fun m!98497 () Bool)

(assert (=> b!91656 m!98497))

(declare-fun m!98499 () Bool)

(assert (=> b!91649 m!98499))

(declare-fun m!98501 () Bool)

(assert (=> b!91645 m!98501))

(declare-fun m!98503 () Bool)

(assert (=> bm!8938 m!98503))

(assert (=> b!91640 m!98285))

(assert (=> b!91640 m!98285))

(declare-fun m!98505 () Bool)

(assert (=> b!91640 m!98505))

(assert (=> b!91373 d!24133))

(declare-fun d!24135 () Bool)

(declare-fun c!15210 () Bool)

(assert (=> d!24135 (= c!15210 ((_ is ValueCellFull!947) (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun e!59793 () V!3089)

(assert (=> d!24135 (= (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59793)))

(declare-fun b!91665 () Bool)

(declare-fun get!1250 (ValueCell!947 V!3089) V!3089)

(assert (=> b!91665 (= e!59793 (get!1250 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91666 () Bool)

(declare-fun get!1251 (ValueCell!947 V!3089) V!3089)

(assert (=> b!91666 (= e!59793 (get!1251 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24135 c!15210) b!91665))

(assert (= (and d!24135 (not c!15210)) b!91666))

(assert (=> b!91665 m!98061))

(assert (=> b!91665 m!98063))

(declare-fun m!98507 () Bool)

(assert (=> b!91665 m!98507))

(assert (=> b!91666 m!98061))

(assert (=> b!91666 m!98063))

(declare-fun m!98509 () Bool)

(assert (=> b!91666 m!98509))

(assert (=> b!91369 d!24135))

(declare-fun d!24137 () Bool)

(declare-fun res!46664 () Bool)

(declare-fun e!59794 () Bool)

(assert (=> d!24137 (=> (not res!46664) (not e!59794))))

(assert (=> d!24137 (= res!46664 (simpleValid!63 newMap!16))))

(assert (=> d!24137 (= (valid!363 newMap!16) e!59794)))

(declare-fun b!91667 () Bool)

(declare-fun res!46665 () Bool)

(assert (=> b!91667 (=> (not res!46665) (not e!59794))))

(assert (=> b!91667 (= res!46665 (= (arrayCountValidKeys!0 (_keys!4085 newMap!16) #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (_size!450 newMap!16)))))

(declare-fun b!91668 () Bool)

(declare-fun res!46666 () Bool)

(assert (=> b!91668 (=> (not res!46666) (not e!59794))))

(assert (=> b!91668 (= res!46666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun b!91669 () Bool)

(assert (=> b!91669 (= e!59794 (arrayNoDuplicates!0 (_keys!4085 newMap!16) #b00000000000000000000000000000000 Nil!1535))))

(assert (= (and d!24137 res!46664) b!91667))

(assert (= (and b!91667 res!46665) b!91668))

(assert (= (and b!91668 res!46666) b!91669))

(declare-fun m!98511 () Bool)

(assert (=> d!24137 m!98511))

(declare-fun m!98513 () Bool)

(assert (=> b!91667 m!98513))

(declare-fun m!98515 () Bool)

(assert (=> b!91668 m!98515))

(declare-fun m!98517 () Bool)

(assert (=> b!91669 m!98517))

(assert (=> b!91367 d!24137))

(declare-fun d!24139 () Bool)

(declare-fun e!59799 () Bool)

(assert (=> d!24139 e!59799))

(declare-fun res!46669 () Bool)

(assert (=> d!24139 (=> res!46669 e!59799)))

(declare-fun lt!44810 () Bool)

(assert (=> d!24139 (= res!46669 (not lt!44810))))

(declare-fun lt!44811 () Bool)

(assert (=> d!24139 (= lt!44810 lt!44811)))

(declare-fun lt!44812 () Unit!2702)

(declare-fun e!59800 () Unit!2702)

(assert (=> d!24139 (= lt!44812 e!59800)))

(declare-fun c!15213 () Bool)

(assert (=> d!24139 (= c!15213 lt!44811)))

(declare-fun containsKey!149 (List!1537 (_ BitVec 64)) Bool)

(assert (=> d!24139 (= lt!44811 (containsKey!149 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24139 (= (contains!769 lt!44539 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!44810)))

(declare-fun b!91676 () Bool)

(declare-fun lt!44809 () Unit!2702)

(assert (=> b!91676 (= e!59800 lt!44809)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!97 (List!1537 (_ BitVec 64)) Unit!2702)

(assert (=> b!91676 (= lt!44809 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun isDefined!98 (Option!152) Bool)

(assert (=> b!91676 (isDefined!98 (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91677 () Bool)

(declare-fun Unit!2715 () Unit!2702)

(assert (=> b!91677 (= e!59800 Unit!2715)))

(declare-fun b!91678 () Bool)

(assert (=> b!91678 (= e!59799 (isDefined!98 (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (= (and d!24139 c!15213) b!91676))

(assert (= (and d!24139 (not c!15213)) b!91677))

(assert (= (and d!24139 (not res!46669)) b!91678))

(assert (=> d!24139 m!98059))

(declare-fun m!98519 () Bool)

(assert (=> d!24139 m!98519))

(assert (=> b!91676 m!98059))

(declare-fun m!98521 () Bool)

(assert (=> b!91676 m!98521))

(assert (=> b!91676 m!98059))

(declare-fun m!98523 () Bool)

(assert (=> b!91676 m!98523))

(assert (=> b!91676 m!98523))

(declare-fun m!98525 () Bool)

(assert (=> b!91676 m!98525))

(assert (=> b!91678 m!98059))

(assert (=> b!91678 m!98523))

(assert (=> b!91678 m!98523))

(assert (=> b!91678 m!98525))

(assert (=> b!91372 d!24139))

(declare-fun bm!8989 () Bool)

(declare-fun call!9006 () Bool)

(declare-fun call!8995 () Bool)

(assert (=> bm!8989 (= call!9006 call!8995)))

(declare-fun call!9001 () Unit!2702)

(declare-fun bm!8990 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2702)

(assert (=> bm!8990 (= call!9001 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(declare-fun b!91759 () Bool)

(declare-fun res!46711 () Bool)

(declare-fun e!59853 () Bool)

(assert (=> b!91759 (=> (not res!46711) (not e!59853))))

(declare-datatypes ((SeekEntryResult!242 0))(
  ( (MissingZero!242 (index!3108 (_ BitVec 32))) (Found!242 (index!3109 (_ BitVec 32))) (Intermediate!242 (undefined!1054 Bool) (index!3110 (_ BitVec 32)) (x!12441 (_ BitVec 32))) (Undefined!242) (MissingVacant!242 (index!3111 (_ BitVec 32))) )
))
(declare-fun lt!44880 () SeekEntryResult!242)

(assert (=> b!91759 (= res!46711 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3108 lt!44880)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8991 () Bool)

(declare-fun call!9007 () SeekEntryResult!242)

(declare-fun call!8996 () SeekEntryResult!242)

(assert (=> bm!8991 (= call!9007 call!8996)))

(declare-fun lt!44882 () array!4119)

(declare-fun bm!8992 () Bool)

(declare-fun c!15242 () Bool)

(declare-fun call!9008 () ListLongMap!1471)

(declare-fun c!15248 () Bool)

(declare-fun c!15252 () Bool)

(declare-fun lt!44891 () (_ BitVec 32))

(assert (=> bm!8992 (= call!9008 (getCurrentListMap!441 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91760 () Bool)

(declare-fun e!59851 () Bool)

(declare-fun e!59859 () Bool)

(assert (=> b!91760 (= e!59851 e!59859)))

(declare-fun res!46708 () Bool)

(declare-fun call!8997 () Bool)

(assert (=> b!91760 (= res!46708 call!8997)))

(assert (=> b!91760 (=> (not res!46708) (not e!59859))))

(declare-fun bm!8993 () Bool)

(declare-fun c!15243 () Bool)

(declare-fun lt!44881 () SeekEntryResult!242)

(declare-fun call!8998 () tuple2!2242)

(declare-fun updateHelperNewKey!36 (LongMapFixedSize!802 (_ BitVec 64) V!3089 (_ BitVec 32)) tuple2!2242)

(assert (=> bm!8993 (= call!8998 (updateHelperNewKey!36 newMap!16 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881))))))

(declare-fun b!91761 () Bool)

(declare-fun call!8999 () Bool)

(assert (=> b!91761 (= e!59853 (not call!8999))))

(declare-fun b!91762 () Bool)

(declare-fun res!46704 () Bool)

(assert (=> b!91762 (= res!46704 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3111 lt!44880)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91762 (=> (not res!46704) (not e!59859))))

(declare-fun b!91763 () Bool)

(declare-fun e!59856 () tuple2!2242)

(declare-fun e!59848 () tuple2!2242)

(assert (=> b!91763 (= e!59856 e!59848)))

(declare-fun c!15249 () Bool)

(assert (=> b!91763 (= c!15249 ((_ is MissingZero!242) lt!44881))))

(declare-fun b!91764 () Bool)

(declare-fun e!59845 () Bool)

(declare-fun lt!44878 () SeekEntryResult!242)

(assert (=> b!91764 (= e!59845 ((_ is Undefined!242) lt!44878))))

(declare-fun b!91765 () Bool)

(declare-fun e!59862 () Bool)

(declare-fun e!59854 () Bool)

(assert (=> b!91765 (= e!59862 e!59854)))

(declare-fun call!9000 () ListLongMap!1471)

(declare-fun res!46701 () Bool)

(assert (=> b!91765 (= res!46701 (contains!769 call!9000 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!91765 (=> (not res!46701) (not e!59854))))

(declare-fun b!91766 () Bool)

(declare-fun e!59850 () Unit!2702)

(declare-fun lt!44885 () Unit!2702)

(assert (=> b!91766 (= e!59850 lt!44885)))

(assert (=> b!91766 (= lt!44885 call!9001)))

(declare-fun lt!44887 () SeekEntryResult!242)

(declare-fun call!9014 () SeekEntryResult!242)

(assert (=> b!91766 (= lt!44887 call!9014)))

(declare-fun res!46698 () Bool)

(assert (=> b!91766 (= res!46698 ((_ is Found!242) lt!44887))))

(declare-fun e!59858 () Bool)

(assert (=> b!91766 (=> (not res!46698) (not e!59858))))

(assert (=> b!91766 e!59858))

(declare-fun b!91767 () Bool)

(declare-fun e!59860 () Unit!2702)

(declare-fun Unit!2716 () Unit!2702)

(assert (=> b!91767 (= e!59860 Unit!2716)))

(declare-fun lt!44886 () Unit!2702)

(assert (=> b!91767 (= lt!44886 call!9001)))

(declare-fun lt!44868 () SeekEntryResult!242)

(assert (=> b!91767 (= lt!44868 call!9007)))

(declare-fun res!46700 () Bool)

(assert (=> b!91767 (= res!46700 ((_ is Found!242) lt!44868))))

(declare-fun e!59857 () Bool)

(assert (=> b!91767 (=> (not res!46700) (not e!59857))))

(assert (=> b!91767 e!59857))

(declare-fun lt!44893 () Unit!2702)

(assert (=> b!91767 (= lt!44893 lt!44886)))

(assert (=> b!91767 false))

(declare-fun b!91768 () Bool)

(declare-fun e!59861 () ListLongMap!1471)

(assert (=> b!91768 (= e!59861 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91769 () Bool)

(declare-fun e!59846 () Bool)

(declare-fun call!9003 () Bool)

(assert (=> b!91769 (= e!59846 (not call!9003))))

(declare-fun b!91770 () Bool)

(declare-fun res!46703 () Bool)

(assert (=> b!91770 (= res!46703 call!9006)))

(assert (=> b!91770 (=> (not res!46703) (not e!59858))))

(declare-fun bm!8994 () Bool)

(declare-fun call!8993 () ListLongMap!1471)

(declare-fun call!9002 () ListLongMap!1471)

(assert (=> bm!8994 (= call!8993 call!9002)))

(declare-fun bm!8995 () Bool)

(declare-fun call!9011 () Bool)

(assert (=> bm!8995 (= call!9003 call!9011)))

(declare-fun bm!8996 () Bool)

(declare-fun lt!44876 () tuple2!2242)

(assert (=> bm!8996 (= call!9000 (map!1223 (_2!1132 lt!44876)))))

(declare-fun b!91771 () Bool)

(declare-fun res!46705 () Bool)

(assert (=> b!91771 (= res!46705 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3111 lt!44878)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91771 (=> (not res!46705) (not e!59846))))

(declare-fun bm!8997 () Bool)

(declare-fun call!9009 () ListLongMap!1471)

(assert (=> bm!8997 (= call!9009 (+!120 e!59861 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun c!15247 () Bool)

(assert (=> bm!8997 (= c!15247 c!15248)))

(declare-fun b!91772 () Bool)

(declare-fun e!59863 () Bool)

(assert (=> b!91772 (= e!59863 (not call!9003))))

(declare-fun b!91773 () Bool)

(declare-fun lt!44888 () tuple2!2242)

(assert (=> b!91773 (= lt!44888 call!8998)))

(assert (=> b!91773 (= e!59848 (tuple2!2243 (_1!1132 lt!44888) (_2!1132 lt!44888)))))

(declare-fun bm!8998 () Bool)

(assert (=> bm!8998 (= call!9014 call!8996)))

(declare-fun b!91774 () Bool)

(declare-fun call!8992 () ListLongMap!1471)

(assert (=> b!91774 (= e!59861 (ite c!15252 call!8993 call!8992))))

(declare-fun bm!8999 () Bool)

(assert (=> bm!8999 (= call!9011 (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!91775 () Bool)

(declare-fun res!46706 () Bool)

(assert (=> b!91775 (=> (not res!46706) (not e!59853))))

(assert (=> b!91775 (= res!46706 call!8997)))

(declare-fun e!59843 () Bool)

(assert (=> b!91775 (= e!59843 e!59853)))

(declare-fun b!91776 () Bool)

(declare-fun lt!44871 () Unit!2702)

(assert (=> b!91776 (= lt!44871 e!59860)))

(declare-fun c!15245 () Bool)

(declare-fun call!8994 () Bool)

(assert (=> b!91776 (= c!15245 call!8994)))

(declare-fun e!59852 () tuple2!2242)

(assert (=> b!91776 (= e!59852 (tuple2!2243 false newMap!16))))

(declare-fun bm!9000 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4117 (_ BitVec 32)) SeekEntryResult!242)

(assert (=> bm!9000 (= call!8996 (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun b!91777 () Bool)

(declare-fun lt!44890 () Unit!2702)

(assert (=> b!91777 (= e!59860 lt!44890)))

(declare-fun call!9005 () Unit!2702)

(assert (=> b!91777 (= lt!44890 call!9005)))

(assert (=> b!91777 (= lt!44880 call!9007)))

(declare-fun c!15240 () Bool)

(assert (=> b!91777 (= c!15240 ((_ is MissingZero!242) lt!44880))))

(assert (=> b!91777 e!59843))

(declare-fun bm!9001 () Bool)

(declare-fun call!9004 () ListLongMap!1471)

(assert (=> bm!9001 (= call!9004 (map!1223 newMap!16))))

(declare-fun b!91778 () Bool)

(declare-fun c!15251 () Bool)

(assert (=> b!91778 (= c!15251 ((_ is MissingVacant!242) lt!44880))))

(assert (=> b!91778 (= e!59843 e!59851)))

(declare-fun b!91779 () Bool)

(assert (=> b!91779 (= e!59862 (= call!9000 call!9004))))

(declare-fun bm!9002 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2702)

(assert (=> bm!9002 (= call!9005 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(declare-fun b!91780 () Bool)

(declare-fun lt!44869 () Unit!2702)

(declare-fun lt!44872 () Unit!2702)

(assert (=> b!91780 (= lt!44869 lt!44872)))

(declare-fun call!9013 () ListLongMap!1471)

(assert (=> b!91780 (= call!9013 call!8993)))

(declare-fun lt!44875 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2702)

(assert (=> b!91780 (= lt!44872 (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44875 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44529 (defaultEntry!2405 newMap!16)))))

(assert (=> b!91780 (= lt!44875 (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!59855 () tuple2!2242)

(assert (=> b!91780 (= e!59855 (tuple2!2243 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6465 newMap!16) (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) (zeroValue!2293 newMap!16) lt!44529 (_size!450 newMap!16) (_keys!4085 newMap!16) (_values!2388 newMap!16) (_vacant!450 newMap!16))))))

(declare-fun bm!9003 () Bool)

(assert (=> bm!9003 (= call!8999 call!9011)))

(declare-fun b!91781 () Bool)

(declare-fun e!59847 () tuple2!2242)

(assert (=> b!91781 (= e!59847 e!59855)))

(assert (=> b!91781 (= c!15252 (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9004 () Bool)

(declare-fun call!9010 () Bool)

(assert (=> bm!9004 (= call!9010 call!8995)))

(declare-fun b!91782 () Bool)

(assert (=> b!91782 (= e!59851 ((_ is Undefined!242) lt!44880))))

(declare-fun b!91783 () Bool)

(declare-fun lt!44892 () Unit!2702)

(declare-fun lt!44889 () Unit!2702)

(assert (=> b!91783 (= lt!44892 lt!44889)))

(assert (=> b!91783 (= call!9013 call!8992)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!36 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2702)

(assert (=> b!91783 (= lt!44889 (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44891 (zeroValue!2293 newMap!16) lt!44529 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)))))

(assert (=> b!91783 (= lt!44891 (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!91783 (= e!59855 (tuple2!2243 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6465 newMap!16) (bvor (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) lt!44529 (minValue!2293 newMap!16) (_size!450 newMap!16) (_keys!4085 newMap!16) (_values!2388 newMap!16) (_vacant!450 newMap!16))))))

(declare-fun bm!9005 () Bool)

(declare-fun call!9015 () ListLongMap!1471)

(assert (=> bm!9005 (= call!9015 call!9008)))

(declare-fun bm!9006 () Bool)

(assert (=> bm!9006 (= call!8994 (contains!769 call!9015 (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881)))))))

(declare-fun b!91784 () Bool)

(assert (=> b!91784 (= e!59854 (= call!9000 (+!120 call!9004 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun b!91785 () Bool)

(declare-fun res!46710 () Bool)

(assert (=> b!91785 (=> (not res!46710) (not e!59863))))

(assert (=> b!91785 (= res!46710 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3108 lt!44878)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91786 () Bool)

(assert (=> b!91786 (= e!59845 e!59846)))

(declare-fun res!46699 () Bool)

(declare-fun call!9012 () Bool)

(assert (=> b!91786 (= res!46699 call!9012)))

(assert (=> b!91786 (=> (not res!46699) (not e!59846))))

(declare-fun b!91787 () Bool)

(declare-fun res!46709 () Bool)

(assert (=> b!91787 (=> (not res!46709) (not e!59863))))

(assert (=> b!91787 (= res!46709 call!9012)))

(declare-fun e!59849 () Bool)

(assert (=> b!91787 (= e!59849 e!59863)))

(declare-fun b!91788 () Bool)

(declare-fun res!46702 () Bool)

(assert (=> b!91788 (= res!46702 call!9010)))

(assert (=> b!91788 (=> (not res!46702) (not e!59857))))

(declare-fun bm!9007 () Bool)

(assert (=> bm!9007 (= call!9012 call!9006)))

(declare-fun b!91789 () Bool)

(declare-fun e!59844 () Bool)

(assert (=> b!91789 (= e!59844 e!59862)))

(declare-fun c!15241 () Bool)

(assert (=> b!91789 (= c!15241 (_1!1132 lt!44876))))

(declare-fun bm!9008 () Bool)

(assert (=> bm!9008 (= call!8997 call!9010)))

(declare-fun d!24141 () Bool)

(assert (=> d!24141 e!59844))

(declare-fun res!46707 () Bool)

(assert (=> d!24141 (=> (not res!46707) (not e!59844))))

(assert (=> d!24141 (= res!46707 (valid!363 (_2!1132 lt!44876)))))

(assert (=> d!24141 (= lt!44876 e!59847)))

(assert (=> d!24141 (= c!15248 (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvneg (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (=> d!24141 (valid!363 newMap!16)))

(assert (=> d!24141 (= (update!135 newMap!16 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529) lt!44876)))

(declare-fun bm!9009 () Bool)

(declare-fun c!15250 () Bool)

(declare-fun c!15244 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!9009 (= call!8995 (inRange!0 (ite c!15242 (ite c!15245 (index!3109 lt!44868) (ite c!15240 (index!3108 lt!44880) (index!3111 lt!44880))) (ite c!15244 (index!3109 lt!44887) (ite c!15250 (index!3108 lt!44878) (index!3111 lt!44878)))) (mask!6465 newMap!16)))))

(declare-fun b!91790 () Bool)

(assert (=> b!91790 (= e!59857 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44868)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91791 () Bool)

(assert (=> b!91791 (= e!59847 e!59852)))

(assert (=> b!91791 (= lt!44881 (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(assert (=> b!91791 (= c!15242 ((_ is Undefined!242) lt!44881))))

(declare-fun b!91792 () Bool)

(assert (=> b!91792 (= e!59858 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44887)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91793 () Bool)

(declare-fun lt!44884 () Unit!2702)

(declare-fun lt!44883 () Unit!2702)

(assert (=> b!91793 (= lt!44884 lt!44883)))

(assert (=> b!91793 call!8994))

(declare-fun lemmaValidKeyInArrayIsInListMap!96 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) Unit!2702)

(assert (=> b!91793 (= lt!44883 (lemmaValidKeyInArrayIsInListMap!96 (_keys!4085 newMap!16) lt!44882 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (defaultEntry!2405 newMap!16)))))

(assert (=> b!91793 (= lt!44882 (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))))))

(declare-fun lt!44873 () Unit!2702)

(declare-fun lt!44867 () Unit!2702)

(assert (=> b!91793 (= lt!44873 lt!44867)))

(assert (=> b!91793 (= call!9009 call!9002)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2702)

(assert (=> b!91793 (= lt!44867 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44870 () Unit!2702)

(assert (=> b!91793 (= lt!44870 e!59850)))

(assert (=> b!91793 (= c!15244 (contains!769 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!91793 (= e!59848 (tuple2!2243 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (_size!450 newMap!16) (_keys!4085 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))) (_vacant!450 newMap!16))))))

(declare-fun b!91794 () Bool)

(declare-fun c!15246 () Bool)

(assert (=> b!91794 (= c!15246 ((_ is MissingVacant!242) lt!44878))))

(assert (=> b!91794 (= e!59849 e!59845)))

(declare-fun b!91795 () Bool)

(declare-fun lt!44879 () tuple2!2242)

(assert (=> b!91795 (= e!59856 (tuple2!2243 (_1!1132 lt!44879) (_2!1132 lt!44879)))))

(assert (=> b!91795 (= lt!44879 call!8998)))

(declare-fun bm!9010 () Bool)

(assert (=> bm!9010 (= call!9013 call!9009)))

(declare-fun bm!9011 () Bool)

(assert (=> bm!9011 (= call!9002 (getCurrentListMap!441 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun bm!9012 () Bool)

(assert (=> bm!9012 (= call!8992 call!9008)))

(declare-fun b!91796 () Bool)

(assert (=> b!91796 (= e!59859 (not call!8999))))

(declare-fun b!91797 () Bool)

(declare-fun Unit!2717 () Unit!2702)

(assert (=> b!91797 (= e!59850 Unit!2717)))

(declare-fun lt!44874 () Unit!2702)

(assert (=> b!91797 (= lt!44874 call!9005)))

(assert (=> b!91797 (= lt!44878 call!9014)))

(assert (=> b!91797 (= c!15250 ((_ is MissingZero!242) lt!44878))))

(assert (=> b!91797 e!59849))

(declare-fun lt!44877 () Unit!2702)

(assert (=> b!91797 (= lt!44877 lt!44874)))

(assert (=> b!91797 false))

(declare-fun b!91798 () Bool)

(assert (=> b!91798 (= c!15243 ((_ is MissingVacant!242) lt!44881))))

(assert (=> b!91798 (= e!59852 e!59856)))

(assert (= (and d!24141 c!15248) b!91781))

(assert (= (and d!24141 (not c!15248)) b!91791))

(assert (= (and b!91781 c!15252) b!91783))

(assert (= (and b!91781 (not c!15252)) b!91780))

(assert (= (or b!91783 b!91780) bm!9012))

(assert (= (or b!91783 b!91780) bm!8994))

(assert (= (or b!91783 b!91780) bm!9010))

(assert (= (and b!91791 c!15242) b!91776))

(assert (= (and b!91791 (not c!15242)) b!91798))

(assert (= (and b!91776 c!15245) b!91767))

(assert (= (and b!91776 (not c!15245)) b!91777))

(assert (= (and b!91767 res!46700) b!91788))

(assert (= (and b!91788 res!46702) b!91790))

(assert (= (and b!91777 c!15240) b!91775))

(assert (= (and b!91777 (not c!15240)) b!91778))

(assert (= (and b!91775 res!46706) b!91759))

(assert (= (and b!91759 res!46711) b!91761))

(assert (= (and b!91778 c!15251) b!91760))

(assert (= (and b!91778 (not c!15251)) b!91782))

(assert (= (and b!91760 res!46708) b!91762))

(assert (= (and b!91762 res!46704) b!91796))

(assert (= (or b!91775 b!91760) bm!9008))

(assert (= (or b!91761 b!91796) bm!9003))

(assert (= (or b!91788 bm!9008) bm!9004))

(assert (= (or b!91767 b!91777) bm!8991))

(assert (= (and b!91798 c!15243) b!91795))

(assert (= (and b!91798 (not c!15243)) b!91763))

(assert (= (and b!91763 c!15249) b!91773))

(assert (= (and b!91763 (not c!15249)) b!91793))

(assert (= (and b!91793 c!15244) b!91766))

(assert (= (and b!91793 (not c!15244)) b!91797))

(assert (= (and b!91766 res!46698) b!91770))

(assert (= (and b!91770 res!46703) b!91792))

(assert (= (and b!91797 c!15250) b!91787))

(assert (= (and b!91797 (not c!15250)) b!91794))

(assert (= (and b!91787 res!46709) b!91785))

(assert (= (and b!91785 res!46710) b!91772))

(assert (= (and b!91794 c!15246) b!91786))

(assert (= (and b!91794 (not c!15246)) b!91764))

(assert (= (and b!91786 res!46699) b!91771))

(assert (= (and b!91771 res!46705) b!91769))

(assert (= (or b!91787 b!91786) bm!9007))

(assert (= (or b!91772 b!91769) bm!8995))

(assert (= (or b!91770 bm!9007) bm!8989))

(assert (= (or b!91766 b!91797) bm!8998))

(assert (= (or b!91795 b!91773) bm!8993))

(assert (= (or bm!9003 bm!8995) bm!8999))

(assert (= (or bm!9004 bm!8989) bm!9009))

(assert (= (or bm!8991 bm!8998) bm!9000))

(assert (= (or b!91777 b!91797) bm!9002))

(assert (= (or b!91776 b!91793) bm!9005))

(assert (= (or b!91767 b!91766) bm!8990))

(assert (= (or b!91776 b!91793) bm!9006))

(assert (= (or bm!9012 bm!9005) bm!8992))

(assert (= (or bm!8994 b!91793) bm!9011))

(assert (= (or bm!9010 b!91793) bm!8997))

(assert (= (and bm!8997 c!15247) b!91774))

(assert (= (and bm!8997 (not c!15247)) b!91768))

(assert (= (and d!24141 res!46707) b!91789))

(assert (= (and b!91789 c!15241) b!91765))

(assert (= (and b!91789 (not c!15241)) b!91779))

(assert (= (and b!91765 res!46701) b!91784))

(assert (= (or b!91784 b!91779) bm!9001))

(assert (= (or b!91765 b!91784 b!91779) bm!8996))

(declare-fun m!98527 () Bool)

(assert (=> bm!9011 m!98527))

(declare-fun m!98529 () Bool)

(assert (=> bm!9011 m!98529))

(declare-fun m!98531 () Bool)

(assert (=> bm!9006 m!98531))

(declare-fun m!98533 () Bool)

(assert (=> bm!9006 m!98533))

(assert (=> b!91765 m!98059))

(declare-fun m!98535 () Bool)

(assert (=> b!91765 m!98535))

(assert (=> b!91793 m!98059))

(declare-fun m!98537 () Bool)

(assert (=> b!91793 m!98537))

(assert (=> b!91793 m!98459))

(assert (=> b!91793 m!98059))

(declare-fun m!98539 () Bool)

(assert (=> b!91793 m!98539))

(declare-fun m!98541 () Bool)

(assert (=> b!91793 m!98541))

(assert (=> b!91793 m!98527))

(assert (=> b!91793 m!98459))

(declare-fun m!98543 () Bool)

(assert (=> b!91785 m!98543))

(declare-fun m!98545 () Bool)

(assert (=> b!91780 m!98545))

(assert (=> bm!9001 m!98085))

(declare-fun m!98547 () Bool)

(assert (=> bm!9009 m!98547))

(assert (=> bm!8999 m!98059))

(declare-fun m!98549 () Bool)

(assert (=> bm!8999 m!98549))

(declare-fun m!98551 () Bool)

(assert (=> b!91771 m!98551))

(assert (=> bm!8990 m!98059))

(declare-fun m!98553 () Bool)

(assert (=> bm!8990 m!98553))

(declare-fun m!98555 () Bool)

(assert (=> b!91784 m!98555))

(declare-fun m!98557 () Bool)

(assert (=> d!24141 m!98557))

(assert (=> d!24141 m!98113))

(assert (=> b!91791 m!98059))

(declare-fun m!98559 () Bool)

(assert (=> b!91791 m!98559))

(declare-fun m!98561 () Bool)

(assert (=> bm!8997 m!98561))

(declare-fun m!98563 () Bool)

(assert (=> b!91762 m!98563))

(declare-fun m!98565 () Bool)

(assert (=> bm!8996 m!98565))

(declare-fun m!98567 () Bool)

(assert (=> b!91792 m!98567))

(declare-fun m!98569 () Bool)

(assert (=> b!91790 m!98569))

(declare-fun m!98571 () Bool)

(assert (=> bm!8992 m!98571))

(assert (=> bm!9000 m!98059))

(assert (=> bm!9000 m!98559))

(declare-fun m!98573 () Bool)

(assert (=> b!91783 m!98573))

(assert (=> bm!8993 m!98059))

(declare-fun m!98575 () Bool)

(assert (=> bm!8993 m!98575))

(assert (=> bm!9002 m!98059))

(declare-fun m!98577 () Bool)

(assert (=> bm!9002 m!98577))

(declare-fun m!98579 () Bool)

(assert (=> b!91759 m!98579))

(assert (=> b!91768 m!98459))

(assert (=> b!91372 d!24141))

(declare-fun d!24143 () Bool)

(assert (=> d!24143 (= (array_inv!1205 (_keys!4085 newMap!16)) (bvsge (size!2205 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91371 d!24143))

(declare-fun d!24145 () Bool)

(assert (=> d!24145 (= (array_inv!1206 (_values!2388 newMap!16)) (bvsge (size!2206 (_values!2388 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91371 d!24145))

(declare-fun d!24147 () Bool)

(assert (=> d!24147 (not (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!44896 () Unit!2702)

(declare-fun choose!68 (array!4117 (_ BitVec 32) (_ BitVec 64) List!1538) Unit!2702)

(assert (=> d!24147 (= lt!44896 (choose!68 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535)))))

(assert (=> d!24147 (bvslt (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24147 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535)) lt!44896)))

(declare-fun bs!3809 () Bool)

(assert (= bs!3809 d!24147))

(assert (=> bs!3809 m!98059))

(assert (=> bs!3809 m!98077))

(assert (=> bs!3809 m!98059))

(declare-fun m!98581 () Bool)

(assert (=> bs!3809 m!98581))

(assert (=> b!91366 d!24147))

(declare-fun d!24149 () Bool)

(assert (=> d!24149 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) from!355 Nil!1535)))

(declare-fun lt!44899 () Unit!2702)

(declare-fun choose!39 (array!4117 (_ BitVec 32) (_ BitVec 32)) Unit!2702)

(assert (=> d!24149 (= lt!44899 (choose!39 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!24149 (bvslt (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!24149 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 from!355) lt!44899)))

(declare-fun bs!3810 () Bool)

(assert (= bs!3810 d!24149))

(assert (=> bs!3810 m!98073))

(declare-fun m!98583 () Bool)

(assert (=> bs!3810 m!98583))

(assert (=> b!91366 d!24149))

(declare-fun d!24151 () Bool)

(declare-fun res!46716 () Bool)

(declare-fun e!59868 () Bool)

(assert (=> d!24151 (=> res!46716 e!59868)))

(assert (=> d!24151 (= res!46716 (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24151 (= (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!59868)))

(declare-fun b!91803 () Bool)

(declare-fun e!59869 () Bool)

(assert (=> b!91803 (= e!59868 e!59869)))

(declare-fun res!46717 () Bool)

(assert (=> b!91803 (=> (not res!46717) (not e!59869))))

(assert (=> b!91803 (= res!46717 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91804 () Bool)

(assert (=> b!91804 (= e!59869 (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!24151 (not res!46716)) b!91803))

(assert (= (and b!91803 res!46717) b!91804))

(assert (=> d!24151 m!98285))

(assert (=> b!91804 m!98059))

(declare-fun m!98585 () Bool)

(assert (=> b!91804 m!98585))

(assert (=> b!91366 d!24151))

(declare-fun d!24153 () Bool)

(declare-fun e!59872 () Bool)

(assert (=> d!24153 e!59872))

(declare-fun c!15255 () Bool)

(assert (=> d!24153 (= c!15255 (and (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!44902 () Unit!2702)

(declare-fun choose!551 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2702)

(assert (=> d!24153 (= lt!44902 (choose!551 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(assert (=> d!24153 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24153 (= (lemmaListMapContainsThenArrayContainsFrom!73 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!44902)))

(declare-fun b!91809 () Bool)

(assert (=> b!91809 (= e!59872 (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!91810 () Bool)

(assert (=> b!91810 (= e!59872 (ite (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24153 c!15255) b!91809))

(assert (= (and d!24153 (not c!15255)) b!91810))

(assert (=> d!24153 m!98059))

(declare-fun m!98587 () Bool)

(assert (=> d!24153 m!98587))

(assert (=> d!24153 m!98291))

(assert (=> b!91809 m!98059))

(assert (=> b!91809 m!98077))

(assert (=> b!91366 d!24153))

(declare-fun b!91821 () Bool)

(declare-fun e!59884 () Bool)

(declare-fun e!59881 () Bool)

(assert (=> b!91821 (= e!59884 e!59881)))

(declare-fun c!15258 () Bool)

(assert (=> b!91821 (= c!15258 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91822 () Bool)

(declare-fun call!9018 () Bool)

(assert (=> b!91822 (= e!59881 call!9018)))

(declare-fun b!91823 () Bool)

(declare-fun e!59883 () Bool)

(assert (=> b!91823 (= e!59883 e!59884)))

(declare-fun res!46726 () Bool)

(assert (=> b!91823 (=> (not res!46726) (not e!59884))))

(declare-fun e!59882 () Bool)

(assert (=> b!91823 (= res!46726 (not e!59882))))

(declare-fun res!46724 () Bool)

(assert (=> b!91823 (=> (not res!46724) (not e!59882))))

(assert (=> b!91823 (= res!46724 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun d!24155 () Bool)

(declare-fun res!46725 () Bool)

(assert (=> d!24155 (=> res!46725 e!59883)))

(assert (=> d!24155 (= res!46725 (bvsge from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> d!24155 (= (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) from!355 Nil!1535) e!59883)))

(declare-fun bm!9015 () Bool)

(assert (=> bm!9015 (= call!9018 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15258 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535) Nil!1535)))))

(declare-fun b!91824 () Bool)

(declare-fun contains!772 (List!1538 (_ BitVec 64)) Bool)

(assert (=> b!91824 (= e!59882 (contains!772 Nil!1535 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91825 () Bool)

(assert (=> b!91825 (= e!59881 call!9018)))

(assert (= (and d!24155 (not res!46725)) b!91823))

(assert (= (and b!91823 res!46724) b!91824))

(assert (= (and b!91823 res!46726) b!91821))

(assert (= (and b!91821 c!15258) b!91822))

(assert (= (and b!91821 (not c!15258)) b!91825))

(assert (= (or b!91822 b!91825) bm!9015))

(assert (=> b!91821 m!98059))

(assert (=> b!91821 m!98059))

(assert (=> b!91821 m!98393))

(assert (=> b!91823 m!98059))

(assert (=> b!91823 m!98059))

(assert (=> b!91823 m!98393))

(assert (=> bm!9015 m!98059))

(declare-fun m!98589 () Bool)

(assert (=> bm!9015 m!98589))

(assert (=> b!91824 m!98059))

(assert (=> b!91824 m!98059))

(declare-fun m!98591 () Bool)

(assert (=> b!91824 m!98591))

(assert (=> b!91366 d!24155))

(declare-fun condMapEmpty!3581 () Bool)

(declare-fun mapDefault!3581 () ValueCell!947)

(assert (=> mapNonEmpty!3566 (= condMapEmpty!3581 (= mapRest!3566 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3581)))))

(declare-fun e!59889 () Bool)

(declare-fun mapRes!3581 () Bool)

(assert (=> mapNonEmpty!3566 (= tp!9242 (and e!59889 mapRes!3581))))

(declare-fun b!91833 () Bool)

(assert (=> b!91833 (= e!59889 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3581 () Bool)

(assert (=> mapIsEmpty!3581 mapRes!3581))

(declare-fun mapNonEmpty!3581 () Bool)

(declare-fun tp!9269 () Bool)

(declare-fun e!59890 () Bool)

(assert (=> mapNonEmpty!3581 (= mapRes!3581 (and tp!9269 e!59890))))

(declare-fun mapKey!3581 () (_ BitVec 32))

(declare-fun mapRest!3581 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3581 () ValueCell!947)

(assert (=> mapNonEmpty!3581 (= mapRest!3566 (store mapRest!3581 mapKey!3581 mapValue!3581))))

(declare-fun b!91832 () Bool)

(assert (=> b!91832 (= e!59890 tp_is_empty!2581)))

(assert (= (and mapNonEmpty!3566 condMapEmpty!3581) mapIsEmpty!3581))

(assert (= (and mapNonEmpty!3566 (not condMapEmpty!3581)) mapNonEmpty!3581))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!947) mapValue!3581)) b!91832))

(assert (= (and mapNonEmpty!3566 ((_ is ValueCellFull!947) mapDefault!3581)) b!91833))

(declare-fun m!98593 () Bool)

(assert (=> mapNonEmpty!3581 m!98593))

(declare-fun condMapEmpty!3582 () Bool)

(declare-fun mapDefault!3582 () ValueCell!947)

(assert (=> mapNonEmpty!3565 (= condMapEmpty!3582 (= mapRest!3565 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3582)))))

(declare-fun e!59891 () Bool)

(declare-fun mapRes!3582 () Bool)

(assert (=> mapNonEmpty!3565 (= tp!9239 (and e!59891 mapRes!3582))))

(declare-fun b!91835 () Bool)

(assert (=> b!91835 (= e!59891 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3582 () Bool)

(assert (=> mapIsEmpty!3582 mapRes!3582))

(declare-fun mapNonEmpty!3582 () Bool)

(declare-fun tp!9270 () Bool)

(declare-fun e!59892 () Bool)

(assert (=> mapNonEmpty!3582 (= mapRes!3582 (and tp!9270 e!59892))))

(declare-fun mapValue!3582 () ValueCell!947)

(declare-fun mapRest!3582 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapKey!3582 () (_ BitVec 32))

(assert (=> mapNonEmpty!3582 (= mapRest!3565 (store mapRest!3582 mapKey!3582 mapValue!3582))))

(declare-fun b!91834 () Bool)

(assert (=> b!91834 (= e!59892 tp_is_empty!2581)))

(assert (= (and mapNonEmpty!3565 condMapEmpty!3582) mapIsEmpty!3582))

(assert (= (and mapNonEmpty!3565 (not condMapEmpty!3582)) mapNonEmpty!3582))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!947) mapValue!3582)) b!91834))

(assert (= (and mapNonEmpty!3565 ((_ is ValueCellFull!947) mapDefault!3582)) b!91835))

(declare-fun m!98595 () Bool)

(assert (=> mapNonEmpty!3582 m!98595))

(declare-fun b_lambda!4049 () Bool)

(assert (= b_lambda!4047 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4049)))

(declare-fun b_lambda!4051 () Bool)

(assert (= b_lambda!4041 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4051)))

(declare-fun b_lambda!4053 () Bool)

(assert (= b_lambda!4045 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4053)))

(declare-fun b_lambda!4055 () Bool)

(assert (= b_lambda!4043 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4055)))

(check-sat (not b!91634) (not bm!8912) (not b!91571) (not d!24147) (not b!91637) (not b!91556) (not d!24123) (not d!24105) (not d!24129) (not b!91809) (not mapNonEmpty!3581) (not b!91570) (not b!91626) (not d!24117) (not d!24111) (not b!91780) (not b!91645) (not b!91572) (not b!91791) (not bm!8929) (not b!91638) (not b!91550) (not d!24125) (not b!91667) (not b!91678) (not bm!8997) (not b!91520) (not b!91551) (not b!91564) b_and!5571 (not d!24137) (not b!91765) (not d!24121) (not d!24107) (not bm!8992) (not b!91648) (not b!91793) (not b!91784) (not bm!8935) (not b!91783) (not bm!8999) (not b!91549) (not b!91617) (not b_lambda!4039) (not b!91660) (not b!91566) (not d!24141) (not b_lambda!4049) (not b!91665) (not b!91563) (not d!24131) (not bm!8993) (not bm!8996) (not bm!8931) (not d!24149) (not b!91823) (not b!91622) (not bm!8990) (not b!91574) (not b!91669) (not d!24115) (not b!91639) (not b!91568) (not d!24113) (not b_lambda!4053) (not d!24127) (not b!91668) (not b_lambda!4055) (not bm!8932) (not bm!8939) (not b!91565) (not b!91522) (not b_lambda!4051) (not d!24119) (not b!91521) (not b!91569) (not b!91625) (not bm!9015) (not bm!9006) (not b!91824) (not d!24139) (not b!91676) (not b!91656) (not b!91666) (not b!91573) (not d!24153) tp_is_empty!2581 (not b!91555) (not b!91558) (not b!91644) (not b_next!2331) (not d!24099) (not b_next!2329) (not b!91657) (not bm!9009) (not b!91567) b_and!5569 (not b!91821) (not b!91552) (not d!24109) (not b!91649) (not b!91621) (not b!91640) (not b!91547) (not d!24133) (not b!91768) (not bm!9000) (not mapNonEmpty!3582) (not bm!9001) (not bm!8938) (not b!91633) (not b!91804) (not bm!9011) (not bm!8936) (not bm!8928) (not bm!9002))
(check-sat b_and!5569 b_and!5571 (not b_next!2329) (not b_next!2331))
(get-model)

(declare-fun d!24157 () Bool)

(declare-fun e!59893 () Bool)

(assert (=> d!24157 e!59893))

(declare-fun res!46727 () Bool)

(assert (=> d!24157 (=> res!46727 e!59893)))

(declare-fun lt!44904 () Bool)

(assert (=> d!24157 (= res!46727 (not lt!44904))))

(declare-fun lt!44905 () Bool)

(assert (=> d!24157 (= lt!44904 lt!44905)))

(declare-fun lt!44906 () Unit!2702)

(declare-fun e!59894 () Unit!2702)

(assert (=> d!24157 (= lt!44906 e!59894)))

(declare-fun c!15259 () Bool)

(assert (=> d!24157 (= c!15259 lt!44905)))

(assert (=> d!24157 (= lt!44905 (containsKey!149 (toList!751 lt!44675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24157 (= (contains!769 lt!44675 #b1000000000000000000000000000000000000000000000000000000000000000) lt!44904)))

(declare-fun b!91836 () Bool)

(declare-fun lt!44903 () Unit!2702)

(assert (=> b!91836 (= e!59894 lt!44903)))

(assert (=> b!91836 (= lt!44903 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91836 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91837 () Bool)

(declare-fun Unit!2718 () Unit!2702)

(assert (=> b!91837 (= e!59894 Unit!2718)))

(declare-fun b!91838 () Bool)

(assert (=> b!91838 (= e!59893 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24157 c!15259) b!91836))

(assert (= (and d!24157 (not c!15259)) b!91837))

(assert (= (and d!24157 (not res!46727)) b!91838))

(declare-fun m!98597 () Bool)

(assert (=> d!24157 m!98597))

(declare-fun m!98599 () Bool)

(assert (=> b!91836 m!98599))

(declare-fun m!98601 () Bool)

(assert (=> b!91836 m!98601))

(assert (=> b!91836 m!98601))

(declare-fun m!98603 () Bool)

(assert (=> b!91836 m!98603))

(assert (=> b!91838 m!98601))

(assert (=> b!91838 m!98601))

(assert (=> b!91838 m!98603))

(assert (=> b!91547 d!24157))

(declare-fun d!24159 () Bool)

(assert (=> d!24159 (isDefined!98 (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun lt!44909 () Unit!2702)

(declare-fun choose!552 (List!1537 (_ BitVec 64)) Unit!2702)

(assert (=> d!24159 (= lt!44909 (choose!552 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun e!59897 () Bool)

(assert (=> d!24159 e!59897))

(declare-fun res!46730 () Bool)

(assert (=> d!24159 (=> (not res!46730) (not e!59897))))

(declare-fun isStrictlySorted!288 (List!1537) Bool)

(assert (=> d!24159 (= res!46730 (isStrictlySorted!288 (toList!751 lt!44539)))))

(assert (=> d!24159 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!44909)))

(declare-fun b!91841 () Bool)

(assert (=> b!91841 (= e!59897 (containsKey!149 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (= (and d!24159 res!46730) b!91841))

(assert (=> d!24159 m!98059))

(assert (=> d!24159 m!98523))

(assert (=> d!24159 m!98523))

(assert (=> d!24159 m!98525))

(assert (=> d!24159 m!98059))

(declare-fun m!98605 () Bool)

(assert (=> d!24159 m!98605))

(declare-fun m!98607 () Bool)

(assert (=> d!24159 m!98607))

(assert (=> b!91841 m!98059))

(assert (=> b!91841 m!98519))

(assert (=> b!91676 d!24159))

(declare-fun d!24161 () Bool)

(declare-fun isEmpty!353 (Option!152) Bool)

(assert (=> d!24161 (= (isDefined!98 (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))) (not (isEmpty!353 (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))))

(declare-fun bs!3811 () Bool)

(assert (= bs!3811 d!24161))

(assert (=> bs!3811 m!98523))

(declare-fun m!98609 () Bool)

(assert (=> bs!3811 m!98609))

(assert (=> b!91676 d!24161))

(declare-fun e!59903 () Option!152)

(declare-fun b!91852 () Bool)

(assert (=> b!91852 (= e!59903 (getValueByKey!146 (t!5363 (toList!751 lt!44539)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91853 () Bool)

(assert (=> b!91853 (= e!59903 None!150)))

(declare-fun c!15264 () Bool)

(declare-fun d!24163 () Bool)

(assert (=> d!24163 (= c!15264 (and ((_ is Cons!1533) (toList!751 lt!44539)) (= (_1!1133 (h!2125 (toList!751 lt!44539))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(declare-fun e!59902 () Option!152)

(assert (=> d!24163 (= (getValueByKey!146 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) e!59902)))

(declare-fun b!91851 () Bool)

(assert (=> b!91851 (= e!59902 e!59903)))

(declare-fun c!15265 () Bool)

(assert (=> b!91851 (= c!15265 (and ((_ is Cons!1533) (toList!751 lt!44539)) (not (= (_1!1133 (h!2125 (toList!751 lt!44539))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))))

(declare-fun b!91850 () Bool)

(assert (=> b!91850 (= e!59902 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44539)))))))

(assert (= (and d!24163 c!15264) b!91850))

(assert (= (and d!24163 (not c!15264)) b!91851))

(assert (= (and b!91851 c!15265) b!91852))

(assert (= (and b!91851 (not c!15265)) b!91853))

(assert (=> b!91852 m!98059))

(declare-fun m!98611 () Bool)

(assert (=> b!91852 m!98611))

(assert (=> b!91676 d!24163))

(declare-fun d!24165 () Bool)

(declare-fun e!59904 () Bool)

(assert (=> d!24165 e!59904))

(declare-fun res!46731 () Bool)

(assert (=> d!24165 (=> (not res!46731) (not e!59904))))

(declare-fun lt!44910 () ListLongMap!1471)

(assert (=> d!24165 (= res!46731 (contains!769 lt!44910 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!44913 () List!1537)

(assert (=> d!24165 (= lt!44910 (ListLongMap!1472 lt!44913))))

(declare-fun lt!44911 () Unit!2702)

(declare-fun lt!44912 () Unit!2702)

(assert (=> d!24165 (= lt!44911 lt!44912)))

(assert (=> d!24165 (= (getValueByKey!146 lt!44913 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24165 (= lt!44912 (lemmaContainsTupThenGetReturnValue!63 lt!44913 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24165 (= lt!44913 (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24165 (= (+!120 lt!44533 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44910)))

(declare-fun b!91854 () Bool)

(declare-fun res!46732 () Bool)

(assert (=> b!91854 (=> (not res!46732) (not e!59904))))

(assert (=> b!91854 (= res!46732 (= (getValueByKey!146 (toList!751 lt!44910) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!91855 () Bool)

(assert (=> b!91855 (= e!59904 (contains!771 (toList!751 lt!44910) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24165 res!46731) b!91854))

(assert (= (and b!91854 res!46732) b!91855))

(declare-fun m!98613 () Bool)

(assert (=> d!24165 m!98613))

(declare-fun m!98615 () Bool)

(assert (=> d!24165 m!98615))

(declare-fun m!98617 () Bool)

(assert (=> d!24165 m!98617))

(declare-fun m!98619 () Bool)

(assert (=> d!24165 m!98619))

(declare-fun m!98621 () Bool)

(assert (=> b!91854 m!98621))

(declare-fun m!98623 () Bool)

(assert (=> b!91855 m!98623))

(assert (=> d!24119 d!24165))

(declare-fun d!24167 () Bool)

(declare-fun e!59905 () Bool)

(assert (=> d!24167 e!59905))

(declare-fun res!46733 () Bool)

(assert (=> d!24167 (=> (not res!46733) (not e!59905))))

(declare-fun lt!44914 () ListLongMap!1471)

(assert (=> d!24167 (= res!46733 (contains!769 lt!44914 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun lt!44917 () List!1537)

(assert (=> d!24167 (= lt!44914 (ListLongMap!1472 lt!44917))))

(declare-fun lt!44915 () Unit!2702)

(declare-fun lt!44916 () Unit!2702)

(assert (=> d!24167 (= lt!44915 lt!44916)))

(assert (=> d!24167 (= (getValueByKey!146 lt!44917 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24167 (= lt!44916 (lemmaContainsTupThenGetReturnValue!63 lt!44917 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24167 (= lt!44917 (insertStrictlySorted!66 (toList!751 (+!120 lt!44533 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24167 (= (+!120 (+!120 lt!44533 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) lt!44914)))

(declare-fun b!91856 () Bool)

(declare-fun res!46734 () Bool)

(assert (=> b!91856 (=> (not res!46734) (not e!59905))))

(assert (=> b!91856 (= res!46734 (= (getValueByKey!146 (toList!751 lt!44914) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun b!91857 () Bool)

(assert (=> b!91857 (= e!59905 (contains!771 (toList!751 lt!44914) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (= (and d!24167 res!46733) b!91856))

(assert (= (and b!91856 res!46734) b!91857))

(declare-fun m!98625 () Bool)

(assert (=> d!24167 m!98625))

(declare-fun m!98627 () Bool)

(assert (=> d!24167 m!98627))

(declare-fun m!98629 () Bool)

(assert (=> d!24167 m!98629))

(declare-fun m!98631 () Bool)

(assert (=> d!24167 m!98631))

(declare-fun m!98633 () Bool)

(assert (=> b!91856 m!98633))

(declare-fun m!98635 () Bool)

(assert (=> b!91857 m!98635))

(assert (=> d!24119 d!24167))

(declare-fun d!24169 () Bool)

(assert (=> d!24169 (= (+!120 (+!120 lt!44533 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (+!120 (+!120 lt!44533 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (=> d!24169 true))

(declare-fun _$28!154 () Unit!2702)

(assert (=> d!24169 (= (choose!550 lt!44533 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))) _$28!154)))

(declare-fun bs!3812 () Bool)

(assert (= bs!3812 d!24169))

(assert (=> bs!3812 m!98371))

(assert (=> bs!3812 m!98371))

(assert (=> bs!3812 m!98373))

(assert (=> bs!3812 m!98375))

(assert (=> bs!3812 m!98375))

(assert (=> bs!3812 m!98377))

(assert (=> d!24119 d!24169))

(declare-fun d!24171 () Bool)

(declare-fun e!59906 () Bool)

(assert (=> d!24171 e!59906))

(declare-fun res!46735 () Bool)

(assert (=> d!24171 (=> (not res!46735) (not e!59906))))

(declare-fun lt!44918 () ListLongMap!1471)

(assert (=> d!24171 (= res!46735 (contains!769 lt!44918 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!44921 () List!1537)

(assert (=> d!24171 (= lt!44918 (ListLongMap!1472 lt!44921))))

(declare-fun lt!44919 () Unit!2702)

(declare-fun lt!44920 () Unit!2702)

(assert (=> d!24171 (= lt!44919 lt!44920)))

(assert (=> d!24171 (= (getValueByKey!146 lt!44921 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24171 (= lt!44920 (lemmaContainsTupThenGetReturnValue!63 lt!44921 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24171 (= lt!44921 (insertStrictlySorted!66 (toList!751 (+!120 lt!44533 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24171 (= (+!120 (+!120 lt!44533 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44918)))

(declare-fun b!91858 () Bool)

(declare-fun res!46736 () Bool)

(assert (=> b!91858 (=> (not res!46736) (not e!59906))))

(assert (=> b!91858 (= res!46736 (= (getValueByKey!146 (toList!751 lt!44918) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!91859 () Bool)

(assert (=> b!91859 (= e!59906 (contains!771 (toList!751 lt!44918) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24171 res!46735) b!91858))

(assert (= (and b!91858 res!46736) b!91859))

(declare-fun m!98637 () Bool)

(assert (=> d!24171 m!98637))

(declare-fun m!98639 () Bool)

(assert (=> d!24171 m!98639))

(declare-fun m!98641 () Bool)

(assert (=> d!24171 m!98641))

(declare-fun m!98643 () Bool)

(assert (=> d!24171 m!98643))

(declare-fun m!98645 () Bool)

(assert (=> b!91858 m!98645))

(declare-fun m!98647 () Bool)

(assert (=> b!91859 m!98647))

(assert (=> d!24119 d!24171))

(declare-fun d!24173 () Bool)

(declare-fun e!59907 () Bool)

(assert (=> d!24173 e!59907))

(declare-fun res!46737 () Bool)

(assert (=> d!24173 (=> (not res!46737) (not e!59907))))

(declare-fun lt!44922 () ListLongMap!1471)

(assert (=> d!24173 (= res!46737 (contains!769 lt!44922 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun lt!44925 () List!1537)

(assert (=> d!24173 (= lt!44922 (ListLongMap!1472 lt!44925))))

(declare-fun lt!44923 () Unit!2702)

(declare-fun lt!44924 () Unit!2702)

(assert (=> d!24173 (= lt!44923 lt!44924)))

(assert (=> d!24173 (= (getValueByKey!146 lt!44925 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24173 (= lt!44924 (lemmaContainsTupThenGetReturnValue!63 lt!44925 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24173 (= lt!44925 (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24173 (= (+!120 lt!44533 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) lt!44922)))

(declare-fun b!91860 () Bool)

(declare-fun res!46738 () Bool)

(assert (=> b!91860 (=> (not res!46738) (not e!59907))))

(assert (=> b!91860 (= res!46738 (= (getValueByKey!146 (toList!751 lt!44922) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun b!91861 () Bool)

(assert (=> b!91861 (= e!59907 (contains!771 (toList!751 lt!44922) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (= (and d!24173 res!46737) b!91860))

(assert (= (and b!91860 res!46738) b!91861))

(declare-fun m!98649 () Bool)

(assert (=> d!24173 m!98649))

(declare-fun m!98651 () Bool)

(assert (=> d!24173 m!98651))

(declare-fun m!98653 () Bool)

(assert (=> d!24173 m!98653))

(declare-fun m!98655 () Bool)

(assert (=> d!24173 m!98655))

(declare-fun m!98657 () Bool)

(assert (=> b!91860 m!98657))

(declare-fun m!98659 () Bool)

(assert (=> b!91861 m!98659))

(assert (=> d!24119 d!24173))

(declare-fun bm!9024 () Bool)

(declare-fun call!9030 () Bool)

(assert (=> bm!9024 (= call!9030 (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!91896 () Bool)

(declare-fun res!46758 () Bool)

(declare-fun lt!45012 () SeekEntryResult!242)

(assert (=> b!91896 (= res!46758 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3111 lt!45012)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!59926 () Bool)

(assert (=> b!91896 (=> (not res!46758) (not e!59926))))

(declare-fun b!91897 () Bool)

(declare-fun res!46761 () Bool)

(declare-fun e!59930 () Bool)

(assert (=> b!91897 (=> (not res!46761) (not e!59930))))

(declare-fun lt!44986 () tuple2!2242)

(assert (=> b!91897 (= res!46761 (valid!363 (_2!1132 lt!44986)))))

(declare-fun b!91898 () Bool)

(assert (=> b!91898 (= e!59926 (not call!9030))))

(declare-fun b!91899 () Bool)

(declare-fun e!59929 () Unit!2702)

(declare-fun lt!44993 () Unit!2702)

(assert (=> b!91899 (= e!59929 lt!44993)))

(assert (=> b!91899 (= lt!44993 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(declare-fun call!9028 () SeekEntryResult!242)

(assert (=> b!91899 (= lt!45012 call!9028)))

(declare-fun c!15277 () Bool)

(assert (=> b!91899 (= c!15277 ((_ is MissingZero!242) lt!45012))))

(declare-fun e!59928 () Bool)

(assert (=> b!91899 e!59928))

(declare-fun bm!9025 () Bool)

(assert (=> bm!9025 (= call!9028 (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun e!59924 () Bool)

(declare-fun b!91900 () Bool)

(declare-fun lt!44989 () SeekEntryResult!242)

(assert (=> b!91900 (= e!59924 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44989)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!91901 () Bool)

(declare-fun Unit!2719 () Unit!2702)

(assert (=> b!91901 (= e!59929 Unit!2719)))

(declare-fun lt!44996 () Unit!2702)

(assert (=> b!91901 (= lt!44996 (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> b!91901 (= lt!44989 call!9028)))

(declare-fun res!46762 () Bool)

(assert (=> b!91901 (= res!46762 ((_ is Found!242) lt!44989))))

(assert (=> b!91901 (=> (not res!46762) (not e!59924))))

(assert (=> b!91901 e!59924))

(declare-fun lt!45004 () Unit!2702)

(assert (=> b!91901 (= lt!45004 lt!44996)))

(assert (=> b!91901 false))

(declare-fun b!91902 () Bool)

(declare-fun e!59927 () Unit!2702)

(declare-fun Unit!2720 () Unit!2702)

(assert (=> b!91902 (= e!59927 Unit!2720)))

(declare-fun lt!45008 () Unit!2702)

(declare-fun lemmaArrayContainsKeyThenInListMap!22 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) (_ BitVec 32) Int) Unit!2702)

(assert (=> b!91902 (= lt!45008 (lemmaArrayContainsKeyThenInListMap!22 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(assert (=> b!91902 (contains!769 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(declare-fun lt!44992 () Unit!2702)

(assert (=> b!91902 (= lt!44992 lt!45008)))

(assert (=> b!91902 false))

(declare-fun b!91903 () Bool)

(declare-fun res!46765 () Bool)

(declare-fun call!9027 () Bool)

(assert (=> b!91903 (= res!46765 call!9027)))

(assert (=> b!91903 (=> (not res!46765) (not e!59924))))

(declare-fun d!24175 () Bool)

(assert (=> d!24175 e!59930))

(declare-fun res!46759 () Bool)

(assert (=> d!24175 (=> (not res!46759) (not e!59930))))

(assert (=> d!24175 (= res!46759 (_1!1132 lt!44986))))

(assert (=> d!24175 (= lt!44986 (tuple2!2243 true (LongMapFixedSize!803 (defaultEntry!2405 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (bvadd (_size!450 newMap!16) #b00000000000000000000000000000001) (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))) (_vacant!450 newMap!16))))))

(declare-fun lt!44991 () Unit!2702)

(declare-fun lt!44994 () Unit!2702)

(assert (=> d!24175 (= lt!44991 lt!44994)))

(declare-fun lt!44988 () array!4119)

(declare-fun lt!45009 () array!4117)

(assert (=> d!24175 (contains!769 (getCurrentListMap!441 lt!45009 lt!44988 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881))))))

(assert (=> d!24175 (= lt!44994 (lemmaValidKeyInArrayIsInListMap!96 lt!45009 lt!44988 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24175 (= lt!44988 (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))))))

(assert (=> d!24175 (= lt!45009 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun lt!45002 () Unit!2702)

(declare-fun lt!45011 () Unit!2702)

(assert (=> d!24175 (= lt!45002 lt!45011)))

(declare-fun lt!44997 () array!4117)

(assert (=> d!24175 (= (arrayCountValidKeys!0 lt!44997 (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (bvadd (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4117 (_ BitVec 32)) Unit!2702)

(assert (=> d!24175 (= lt!45011 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!44997 (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881))))))

(assert (=> d!24175 (= lt!44997 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun lt!45010 () Unit!2702)

(declare-fun lt!45013 () Unit!2702)

(assert (=> d!24175 (= lt!45010 lt!45013)))

(declare-fun lt!45015 () array!4117)

(assert (=> d!24175 (arrayContainsKey!0 lt!45015 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4117 (_ BitVec 64) (_ BitVec 32)) Unit!2702)

(assert (=> d!24175 (= lt!45013 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!45015 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881))))))

(assert (=> d!24175 (= lt!45015 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun lt!45000 () Unit!2702)

(declare-fun lt!44999 () Unit!2702)

(assert (=> d!24175 (= lt!45000 lt!44999)))

(assert (=> d!24175 (= (+!120 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (getCurrentListMap!441 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!22 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2702)

(assert (=> d!24175 (= lt!44999 (lemmaAddValidKeyToArrayThenAddPairToListMap!22 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!44995 () Unit!2702)

(declare-fun lt!44987 () Unit!2702)

(assert (=> d!24175 (= lt!44995 lt!44987)))

(assert (=> d!24175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))) (mask!6465 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4117 (_ BitVec 32) (_ BitVec 32)) Unit!2702)

(assert (=> d!24175 (= lt!44987 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (mask!6465 newMap!16)))))

(declare-fun lt!45005 () Unit!2702)

(declare-fun lt!44990 () Unit!2702)

(assert (=> d!24175 (= lt!45005 lt!44990)))

(assert (=> d!24175 (= (arrayCountValidKeys!0 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))) #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4085 newMap!16) #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4117 (_ BitVec 32) (_ BitVec 64)) Unit!2702)

(assert (=> d!24175 (= lt!44990 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4085 newMap!16) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun lt!45006 () Unit!2702)

(declare-fun lt!45003 () Unit!2702)

(assert (=> d!24175 (= lt!45006 lt!45003)))

(declare-fun lt!45007 () List!1538)

(declare-fun lt!45014 () (_ BitVec 32))

(assert (=> d!24175 (arrayNoDuplicates!0 (array!4118 (store (arr!1958 (_keys!4085 newMap!16)) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (size!2205 (_keys!4085 newMap!16))) lt!45014 lt!45007)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4117 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1538) Unit!2702)

(assert (=> d!24175 (= lt!45003 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881)) lt!45014 lt!45007))))

(assert (=> d!24175 (= lt!45007 Nil!1535)))

(assert (=> d!24175 (= lt!45014 #b00000000000000000000000000000000)))

(declare-fun lt!44998 () Unit!2702)

(assert (=> d!24175 (= lt!44998 e!59927)))

(declare-fun c!15275 () Bool)

(assert (=> d!24175 (= c!15275 (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!45001 () Unit!2702)

(assert (=> d!24175 (= lt!45001 e!59929)))

(declare-fun c!15276 () Bool)

(assert (=> d!24175 (= c!15276 (contains!769 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24175 (valid!363 newMap!16)))

(assert (=> d!24175 (= (updateHelperNewKey!36 newMap!16 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (ite c!15243 (index!3111 lt!44881) (index!3108 lt!44881))) lt!44986)))

(declare-fun b!91904 () Bool)

(declare-fun c!15274 () Bool)

(assert (=> b!91904 (= c!15274 ((_ is MissingVacant!242) lt!45012))))

(declare-fun e!59931 () Bool)

(assert (=> b!91904 (= e!59928 e!59931)))

(declare-fun b!91905 () Bool)

(assert (=> b!91905 (= e!59930 (= (map!1223 (_2!1132 lt!44986)) (+!120 (map!1223 newMap!16) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun b!91906 () Bool)

(declare-fun Unit!2721 () Unit!2702)

(assert (=> b!91906 (= e!59927 Unit!2721)))

(declare-fun b!91907 () Bool)

(assert (=> b!91907 (= e!59931 e!59926)))

(declare-fun res!46764 () Bool)

(declare-fun call!9029 () Bool)

(assert (=> b!91907 (= res!46764 call!9029)))

(assert (=> b!91907 (=> (not res!46764) (not e!59926))))

(declare-fun b!91908 () Bool)

(assert (=> b!91908 (= e!59931 ((_ is Undefined!242) lt!45012))))

(declare-fun b!91909 () Bool)

(declare-fun res!46763 () Bool)

(assert (=> b!91909 (=> (not res!46763) (not e!59930))))

(assert (=> b!91909 (= res!46763 (contains!769 (map!1223 (_2!1132 lt!44986)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun bm!9026 () Bool)

(assert (=> bm!9026 (= call!9029 call!9027)))

(declare-fun b!91910 () Bool)

(declare-fun res!46757 () Bool)

(declare-fun e!59925 () Bool)

(assert (=> b!91910 (=> (not res!46757) (not e!59925))))

(assert (=> b!91910 (= res!46757 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3108 lt!45012)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9027 () Bool)

(assert (=> bm!9027 (= call!9027 (inRange!0 (ite c!15276 (index!3109 lt!44989) (ite c!15277 (index!3108 lt!45012) (index!3111 lt!45012))) (mask!6465 newMap!16)))))

(declare-fun b!91911 () Bool)

(declare-fun res!46760 () Bool)

(assert (=> b!91911 (=> (not res!46760) (not e!59925))))

(assert (=> b!91911 (= res!46760 call!9029)))

(assert (=> b!91911 (= e!59928 e!59925)))

(declare-fun b!91912 () Bool)

(assert (=> b!91912 (= e!59925 (not call!9030))))

(assert (= (and d!24175 c!15276) b!91901))

(assert (= (and d!24175 (not c!15276)) b!91899))

(assert (= (and b!91901 res!46762) b!91903))

(assert (= (and b!91903 res!46765) b!91900))

(assert (= (and b!91899 c!15277) b!91911))

(assert (= (and b!91899 (not c!15277)) b!91904))

(assert (= (and b!91911 res!46760) b!91910))

(assert (= (and b!91910 res!46757) b!91912))

(assert (= (and b!91904 c!15274) b!91907))

(assert (= (and b!91904 (not c!15274)) b!91908))

(assert (= (and b!91907 res!46764) b!91896))

(assert (= (and b!91896 res!46758) b!91898))

(assert (= (or b!91911 b!91907) bm!9026))

(assert (= (or b!91912 b!91898) bm!9024))

(assert (= (or b!91903 bm!9026) bm!9027))

(assert (= (or b!91901 b!91899) bm!9025))

(assert (= (and d!24175 c!15275) b!91902))

(assert (= (and d!24175 (not c!15275)) b!91906))

(assert (= (and d!24175 res!46759) b!91897))

(assert (= (and b!91897 res!46761) b!91909))

(assert (= (and b!91909 res!46763) b!91905))

(assert (=> bm!9024 m!98059))

(assert (=> bm!9024 m!98549))

(declare-fun m!98661 () Bool)

(assert (=> b!91910 m!98661))

(declare-fun m!98663 () Bool)

(assert (=> b!91905 m!98663))

(assert (=> b!91905 m!98085))

(assert (=> b!91905 m!98085))

(declare-fun m!98665 () Bool)

(assert (=> b!91905 m!98665))

(declare-fun m!98667 () Bool)

(assert (=> b!91896 m!98667))

(assert (=> b!91899 m!98059))

(assert (=> b!91899 m!98577))

(assert (=> b!91909 m!98663))

(assert (=> b!91909 m!98663))

(assert (=> b!91909 m!98059))

(declare-fun m!98669 () Bool)

(assert (=> b!91909 m!98669))

(declare-fun m!98671 () Bool)

(assert (=> b!91897 m!98671))

(declare-fun m!98673 () Bool)

(assert (=> d!24175 m!98673))

(assert (=> d!24175 m!98059))

(declare-fun m!98675 () Bool)

(assert (=> d!24175 m!98675))

(declare-fun m!98677 () Bool)

(assert (=> d!24175 m!98677))

(assert (=> d!24175 m!98059))

(declare-fun m!98679 () Bool)

(assert (=> d!24175 m!98679))

(declare-fun m!98681 () Bool)

(assert (=> d!24175 m!98681))

(assert (=> d!24175 m!98059))

(declare-fun m!98683 () Bool)

(assert (=> d!24175 m!98683))

(assert (=> d!24175 m!98059))

(declare-fun m!98685 () Bool)

(assert (=> d!24175 m!98685))

(assert (=> d!24175 m!98459))

(assert (=> d!24175 m!98059))

(assert (=> d!24175 m!98539))

(declare-fun m!98687 () Bool)

(assert (=> d!24175 m!98687))

(declare-fun m!98689 () Bool)

(assert (=> d!24175 m!98689))

(declare-fun m!98691 () Bool)

(assert (=> d!24175 m!98691))

(assert (=> d!24175 m!98059))

(declare-fun m!98693 () Bool)

(assert (=> d!24175 m!98693))

(declare-fun m!98695 () Bool)

(assert (=> d!24175 m!98695))

(assert (=> d!24175 m!98459))

(assert (=> d!24175 m!98113))

(declare-fun m!98697 () Bool)

(assert (=> d!24175 m!98697))

(declare-fun m!98699 () Bool)

(assert (=> d!24175 m!98699))

(assert (=> d!24175 m!98513))

(assert (=> d!24175 m!98059))

(assert (=> d!24175 m!98549))

(assert (=> d!24175 m!98059))

(declare-fun m!98701 () Bool)

(assert (=> d!24175 m!98701))

(declare-fun m!98703 () Bool)

(assert (=> d!24175 m!98703))

(declare-fun m!98705 () Bool)

(assert (=> d!24175 m!98705))

(assert (=> d!24175 m!98459))

(declare-fun m!98707 () Bool)

(assert (=> d!24175 m!98707))

(assert (=> d!24175 m!98699))

(assert (=> d!24175 m!98677))

(declare-fun m!98709 () Bool)

(assert (=> d!24175 m!98709))

(assert (=> b!91902 m!98059))

(declare-fun m!98711 () Bool)

(assert (=> b!91902 m!98711))

(assert (=> b!91902 m!98459))

(assert (=> b!91902 m!98459))

(assert (=> b!91902 m!98059))

(assert (=> b!91902 m!98539))

(declare-fun m!98713 () Bool)

(assert (=> bm!9027 m!98713))

(assert (=> b!91901 m!98059))

(assert (=> b!91901 m!98553))

(assert (=> bm!9025 m!98059))

(assert (=> bm!9025 m!98559))

(declare-fun m!98715 () Bool)

(assert (=> b!91900 m!98715))

(assert (=> bm!8993 d!24175))

(declare-fun d!24177 () Bool)

(assert (=> d!24177 (= (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (and (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91634 d!24177))

(declare-fun b!91915 () Bool)

(declare-fun e!59933 () Option!152)

(assert (=> b!91915 (= e!59933 (getValueByKey!146 (t!5363 (toList!751 lt!44688)) (_1!1133 lt!44536)))))

(declare-fun b!91916 () Bool)

(assert (=> b!91916 (= e!59933 None!150)))

(declare-fun d!24179 () Bool)

(declare-fun c!15278 () Bool)

(assert (=> d!24179 (= c!15278 (and ((_ is Cons!1533) (toList!751 lt!44688)) (= (_1!1133 (h!2125 (toList!751 lt!44688))) (_1!1133 lt!44536))))))

(declare-fun e!59932 () Option!152)

(assert (=> d!24179 (= (getValueByKey!146 (toList!751 lt!44688) (_1!1133 lt!44536)) e!59932)))

(declare-fun b!91914 () Bool)

(assert (=> b!91914 (= e!59932 e!59933)))

(declare-fun c!15279 () Bool)

(assert (=> b!91914 (= c!15279 (and ((_ is Cons!1533) (toList!751 lt!44688)) (not (= (_1!1133 (h!2125 (toList!751 lt!44688))) (_1!1133 lt!44536)))))))

(declare-fun b!91913 () Bool)

(assert (=> b!91913 (= e!59932 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44688)))))))

(assert (= (and d!24179 c!15278) b!91913))

(assert (= (and d!24179 (not c!15278)) b!91914))

(assert (= (and b!91914 c!15279) b!91915))

(assert (= (and b!91914 (not c!15279)) b!91916))

(declare-fun m!98717 () Bool)

(assert (=> b!91915 m!98717))

(assert (=> b!91565 d!24179))

(declare-fun d!24181 () Bool)

(declare-fun isEmpty!354 (List!1537) Bool)

(assert (=> d!24181 (= (isEmpty!352 lt!44675) (isEmpty!354 (toList!751 lt!44675)))))

(declare-fun bs!3813 () Bool)

(assert (= bs!3813 d!24181))

(declare-fun m!98719 () Bool)

(assert (=> bs!3813 m!98719))

(assert (=> b!91551 d!24181))

(assert (=> bm!9001 d!24131))

(declare-fun d!24183 () Bool)

(assert (=> d!24183 (= (get!1250 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2722 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!91665 d!24183))

(declare-fun d!24185 () Bool)

(declare-fun get!1252 (Option!152) V!3089)

(assert (=> d!24185 (= (apply!87 lt!44758 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (get!1252 (getValueByKey!146 (toList!751 lt!44758) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(declare-fun bs!3814 () Bool)

(assert (= bs!3814 d!24185))

(assert (=> bs!3814 m!98059))

(declare-fun m!98721 () Bool)

(assert (=> bs!3814 m!98721))

(assert (=> bs!3814 m!98721))

(declare-fun m!98723 () Bool)

(assert (=> bs!3814 m!98723))

(assert (=> b!91637 d!24185))

(assert (=> b!91637 d!24135))

(declare-fun b!91919 () Bool)

(declare-fun e!59935 () Option!152)

(assert (=> b!91919 (= e!59935 (getValueByKey!146 (t!5363 (toList!751 lt!44696)) (_1!1133 lt!44540)))))

(declare-fun b!91920 () Bool)

(assert (=> b!91920 (= e!59935 None!150)))

(declare-fun d!24187 () Bool)

(declare-fun c!15280 () Bool)

(assert (=> d!24187 (= c!15280 (and ((_ is Cons!1533) (toList!751 lt!44696)) (= (_1!1133 (h!2125 (toList!751 lt!44696))) (_1!1133 lt!44540))))))

(declare-fun e!59934 () Option!152)

(assert (=> d!24187 (= (getValueByKey!146 (toList!751 lt!44696) (_1!1133 lt!44540)) e!59934)))

(declare-fun b!91918 () Bool)

(assert (=> b!91918 (= e!59934 e!59935)))

(declare-fun c!15281 () Bool)

(assert (=> b!91918 (= c!15281 (and ((_ is Cons!1533) (toList!751 lt!44696)) (not (= (_1!1133 (h!2125 (toList!751 lt!44696))) (_1!1133 lt!44540)))))))

(declare-fun b!91917 () Bool)

(assert (=> b!91917 (= e!59934 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44696)))))))

(assert (= (and d!24187 c!15280) b!91917))

(assert (= (and d!24187 (not c!15280)) b!91918))

(assert (= (and b!91918 c!15281) b!91919))

(assert (= (and b!91918 (not c!15281)) b!91920))

(declare-fun m!98725 () Bool)

(assert (=> b!91919 m!98725))

(assert (=> b!91569 d!24187))

(declare-fun d!24189 () Bool)

(assert (=> d!24189 (= (+!120 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) lt!44875 (zeroValue!2293 newMap!16) lt!44529 #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45018 () Unit!2702)

(declare-fun choose!553 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2702)

(assert (=> d!24189 (= lt!45018 (choose!553 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44875 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44529 (defaultEntry!2405 newMap!16)))))

(assert (=> d!24189 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24189 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44875 (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) lt!44529 (defaultEntry!2405 newMap!16)) lt!45018)))

(declare-fun bs!3815 () Bool)

(assert (= bs!3815 d!24189))

(declare-fun m!98727 () Bool)

(assert (=> bs!3815 m!98727))

(assert (=> bs!3815 m!98459))

(declare-fun m!98729 () Bool)

(assert (=> bs!3815 m!98729))

(declare-fun m!98731 () Bool)

(assert (=> bs!3815 m!98731))

(assert (=> bs!3815 m!98459))

(declare-fun m!98733 () Bool)

(assert (=> bs!3815 m!98733))

(assert (=> b!91780 d!24189))

(declare-fun d!24191 () Bool)

(declare-fun lt!45021 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!96 (List!1537) (InoxSet tuple2!2244))

(assert (=> d!24191 (= lt!45021 (select (content!96 (toList!751 lt!44775)) lt!44534))))

(declare-fun e!59941 () Bool)

(assert (=> d!24191 (= lt!45021 e!59941)))

(declare-fun res!46770 () Bool)

(assert (=> d!24191 (=> (not res!46770) (not e!59941))))

(assert (=> d!24191 (= res!46770 ((_ is Cons!1533) (toList!751 lt!44775)))))

(assert (=> d!24191 (= (contains!771 (toList!751 lt!44775) lt!44534) lt!45021)))

(declare-fun b!91925 () Bool)

(declare-fun e!59940 () Bool)

(assert (=> b!91925 (= e!59941 e!59940)))

(declare-fun res!46771 () Bool)

(assert (=> b!91925 (=> res!46771 e!59940)))

(assert (=> b!91925 (= res!46771 (= (h!2125 (toList!751 lt!44775)) lt!44534))))

(declare-fun b!91926 () Bool)

(assert (=> b!91926 (= e!59940 (contains!771 (t!5363 (toList!751 lt!44775)) lt!44534))))

(assert (= (and d!24191 res!46770) b!91925))

(assert (= (and b!91925 (not res!46771)) b!91926))

(declare-fun m!98735 () Bool)

(assert (=> d!24191 m!98735))

(declare-fun m!98737 () Bool)

(assert (=> d!24191 m!98737))

(declare-fun m!98739 () Bool)

(assert (=> b!91926 m!98739))

(assert (=> b!91639 d!24191))

(declare-fun b!91927 () Bool)

(declare-fun e!59954 () Bool)

(declare-fun e!59943 () Bool)

(assert (=> b!91927 (= e!59954 e!59943)))

(declare-fun res!46773 () Bool)

(assert (=> b!91927 (=> (not res!46773) (not e!59943))))

(declare-fun lt!45027 () ListLongMap!1471)

(assert (=> b!91927 (= res!46773 (contains!769 lt!45027 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!91927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!91928 () Bool)

(declare-fun res!46776 () Bool)

(declare-fun e!59951 () Bool)

(assert (=> b!91928 (=> (not res!46776) (not e!59951))))

(declare-fun e!59948 () Bool)

(assert (=> b!91928 (= res!46776 e!59948)))

(declare-fun c!15287 () Bool)

(assert (=> b!91928 (= c!15287 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!91929 () Bool)

(declare-fun call!9034 () Bool)

(assert (=> b!91929 (= e!59948 (not call!9034))))

(declare-fun b!91930 () Bool)

(declare-fun res!46775 () Bool)

(assert (=> b!91930 (=> (not res!46775) (not e!59951))))

(assert (=> b!91930 (= res!46775 e!59954)))

(declare-fun res!46774 () Bool)

(assert (=> b!91930 (=> res!46774 e!59954)))

(declare-fun e!59947 () Bool)

(assert (=> b!91930 (= res!46774 (not e!59947))))

(declare-fun res!46778 () Bool)

(assert (=> b!91930 (=> (not res!46778) (not e!59947))))

(assert (=> b!91930 (= res!46778 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!91931 () Bool)

(declare-fun e!59953 () Unit!2702)

(declare-fun lt!45028 () Unit!2702)

(assert (=> b!91931 (= e!59953 lt!45028)))

(declare-fun lt!45042 () ListLongMap!1471)

(assert (=> b!91931 (= lt!45042 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45022 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45026 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45026 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45024 () Unit!2702)

(assert (=> b!91931 (= lt!45024 (addStillContains!63 lt!45042 lt!45022 (zeroValue!2293 newMap!16) lt!45026))))

(assert (=> b!91931 (contains!769 (+!120 lt!45042 (tuple2!2245 lt!45022 (zeroValue!2293 newMap!16))) lt!45026)))

(declare-fun lt!45035 () Unit!2702)

(assert (=> b!91931 (= lt!45035 lt!45024)))

(declare-fun lt!45038 () ListLongMap!1471)

(assert (=> b!91931 (= lt!45038 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45040 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45040 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45030 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45030 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45043 () Unit!2702)

(assert (=> b!91931 (= lt!45043 (addApplyDifferent!63 lt!45038 lt!45040 (minValue!2293 newMap!16) lt!45030))))

(assert (=> b!91931 (= (apply!87 (+!120 lt!45038 (tuple2!2245 lt!45040 (minValue!2293 newMap!16))) lt!45030) (apply!87 lt!45038 lt!45030))))

(declare-fun lt!45036 () Unit!2702)

(assert (=> b!91931 (= lt!45036 lt!45043)))

(declare-fun lt!45039 () ListLongMap!1471)

(assert (=> b!91931 (= lt!45039 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45031 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45023 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45023 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45025 () Unit!2702)

(assert (=> b!91931 (= lt!45025 (addApplyDifferent!63 lt!45039 lt!45031 (zeroValue!2293 newMap!16) lt!45023))))

(assert (=> b!91931 (= (apply!87 (+!120 lt!45039 (tuple2!2245 lt!45031 (zeroValue!2293 newMap!16))) lt!45023) (apply!87 lt!45039 lt!45023))))

(declare-fun lt!45032 () Unit!2702)

(assert (=> b!91931 (= lt!45032 lt!45025)))

(declare-fun lt!45033 () ListLongMap!1471)

(assert (=> b!91931 (= lt!45033 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45029 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45029 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45037 () (_ BitVec 64))

(assert (=> b!91931 (= lt!45037 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!91931 (= lt!45028 (addApplyDifferent!63 lt!45033 lt!45029 (minValue!2293 newMap!16) lt!45037))))

(assert (=> b!91931 (= (apply!87 (+!120 lt!45033 (tuple2!2245 lt!45029 (minValue!2293 newMap!16))) lt!45037) (apply!87 lt!45033 lt!45037))))

(declare-fun b!91932 () Bool)

(declare-fun e!59950 () Bool)

(assert (=> b!91932 (= e!59950 (= (apply!87 lt!45027 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 newMap!16)))))

(declare-fun d!24193 () Bool)

(assert (=> d!24193 e!59951))

(declare-fun res!46777 () Bool)

(assert (=> d!24193 (=> (not res!46777) (not e!59951))))

(assert (=> d!24193 (= res!46777 (or (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))))

(declare-fun lt!45041 () ListLongMap!1471)

(assert (=> d!24193 (= lt!45027 lt!45041)))

(declare-fun lt!45034 () Unit!2702)

(assert (=> d!24193 (= lt!45034 e!59953)))

(declare-fun c!15286 () Bool)

(declare-fun e!59942 () Bool)

(assert (=> d!24193 (= c!15286 e!59942)))

(declare-fun res!46780 () Bool)

(assert (=> d!24193 (=> (not res!46780) (not e!59942))))

(assert (=> d!24193 (= res!46780 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun e!59944 () ListLongMap!1471)

(assert (=> d!24193 (= lt!45041 e!59944)))

(declare-fun c!15283 () Bool)

(assert (=> d!24193 (= c!15283 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24193 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24193 (= (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!45027)))

(declare-fun b!91933 () Bool)

(declare-fun e!59952 () ListLongMap!1471)

(declare-fun call!9033 () ListLongMap!1471)

(assert (=> b!91933 (= e!59952 call!9033)))

(declare-fun bm!9028 () Bool)

(declare-fun call!9036 () ListLongMap!1471)

(declare-fun call!9031 () ListLongMap!1471)

(assert (=> bm!9028 (= call!9036 call!9031)))

(declare-fun b!91934 () Bool)

(declare-fun e!59945 () Bool)

(assert (=> b!91934 (= e!59951 e!59945)))

(declare-fun c!15284 () Bool)

(assert (=> b!91934 (= c!15284 (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!91935 () Bool)

(assert (=> b!91935 (= e!59942 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!91936 () Bool)

(declare-fun e!59946 () Bool)

(assert (=> b!91936 (= e!59946 (= (apply!87 lt!45027 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 newMap!16)))))

(declare-fun b!91937 () Bool)

(declare-fun c!15282 () Bool)

(assert (=> b!91937 (= c!15282 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!59949 () ListLongMap!1471)

(assert (=> b!91937 (= e!59949 e!59952)))

(declare-fun b!91938 () Bool)

(assert (=> b!91938 (= e!59945 e!59946)))

(declare-fun res!46772 () Bool)

(declare-fun call!9037 () Bool)

(assert (=> b!91938 (= res!46772 call!9037)))

(assert (=> b!91938 (=> (not res!46772) (not e!59946))))

(declare-fun bm!9029 () Bool)

(assert (=> bm!9029 (= call!9034 (contains!769 lt!45027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!91939 () Bool)

(assert (=> b!91939 (= e!59944 e!59949)))

(declare-fun c!15285 () Bool)

(assert (=> b!91939 (= c!15285 (and (not (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9030 () Bool)

(assert (=> bm!9030 (= call!9037 (contains!769 lt!45027 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9031 () Bool)

(declare-fun call!9035 () ListLongMap!1471)

(assert (=> bm!9031 (= call!9035 call!9036)))

(declare-fun call!9032 () ListLongMap!1471)

(declare-fun bm!9032 () Bool)

(assert (=> bm!9032 (= call!9032 (+!120 (ite c!15283 call!9031 (ite c!15285 call!9036 call!9035)) (ite (or c!15283 c!15285) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 newMap!16)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16)))))))

(declare-fun b!91940 () Bool)

(assert (=> b!91940 (= e!59952 call!9035)))

(declare-fun b!91941 () Bool)

(assert (=> b!91941 (= e!59945 (not call!9037))))

(declare-fun bm!9033 () Bool)

(assert (=> bm!9033 (= call!9031 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!91942 () Bool)

(assert (=> b!91942 (= e!59949 call!9033)))

(declare-fun b!91943 () Bool)

(assert (=> b!91943 (= e!59944 (+!120 call!9032 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16))))))

(declare-fun b!91944 () Bool)

(assert (=> b!91944 (= e!59947 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9034 () Bool)

(assert (=> bm!9034 (= call!9033 call!9032)))

(declare-fun b!91945 () Bool)

(assert (=> b!91945 (= e!59948 e!59950)))

(declare-fun res!46779 () Bool)

(assert (=> b!91945 (= res!46779 call!9034)))

(assert (=> b!91945 (=> (not res!46779) (not e!59950))))

(declare-fun b!91946 () Bool)

(declare-fun Unit!2722 () Unit!2702)

(assert (=> b!91946 (= e!59953 Unit!2722)))

(declare-fun b!91947 () Bool)

(assert (=> b!91947 (= e!59943 (= (apply!87 lt!45027 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)) (get!1247 (select (arr!1959 (_values!2388 newMap!16)) #b00000000000000000000000000000000) (dynLambda!358 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2206 (_values!2388 newMap!16))))))

(assert (=> b!91947 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (= (and d!24193 c!15283) b!91943))

(assert (= (and d!24193 (not c!15283)) b!91939))

(assert (= (and b!91939 c!15285) b!91942))

(assert (= (and b!91939 (not c!15285)) b!91937))

(assert (= (and b!91937 c!15282) b!91933))

(assert (= (and b!91937 (not c!15282)) b!91940))

(assert (= (or b!91933 b!91940) bm!9031))

(assert (= (or b!91942 bm!9031) bm!9028))

(assert (= (or b!91942 b!91933) bm!9034))

(assert (= (or b!91943 bm!9028) bm!9033))

(assert (= (or b!91943 bm!9034) bm!9032))

(assert (= (and d!24193 res!46780) b!91935))

(assert (= (and d!24193 c!15286) b!91931))

(assert (= (and d!24193 (not c!15286)) b!91946))

(assert (= (and d!24193 res!46777) b!91930))

(assert (= (and b!91930 res!46778) b!91944))

(assert (= (and b!91930 (not res!46774)) b!91927))

(assert (= (and b!91927 res!46773) b!91947))

(assert (= (and b!91930 res!46775) b!91928))

(assert (= (and b!91928 c!15287) b!91945))

(assert (= (and b!91928 (not c!15287)) b!91929))

(assert (= (and b!91945 res!46779) b!91932))

(assert (= (or b!91945 b!91929) bm!9029))

(assert (= (and b!91928 res!46776) b!91934))

(assert (= (and b!91934 c!15284) b!91938))

(assert (= (and b!91934 (not c!15284)) b!91941))

(assert (= (and b!91938 res!46772) b!91936))

(assert (= (or b!91938 b!91941) bm!9030))

(declare-fun b_lambda!4057 () Bool)

(assert (=> (not b_lambda!4057) (not b!91947)))

(declare-fun tb!1805 () Bool)

(declare-fun t!5376 () Bool)

(assert (=> (and b!91365 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 newMap!16)) t!5376) tb!1805))

(declare-fun result!3093 () Bool)

(assert (=> tb!1805 (= result!3093 tp_is_empty!2581)))

(assert (=> b!91947 t!5376))

(declare-fun b_and!5573 () Bool)

(assert (= b_and!5569 (and (=> t!5376 result!3093) b_and!5573)))

(declare-fun t!5378 () Bool)

(declare-fun tb!1807 () Bool)

(assert (=> (and b!91371 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 newMap!16)) t!5378) tb!1807))

(declare-fun result!3095 () Bool)

(assert (= result!3095 result!3093))

(assert (=> b!91947 t!5378))

(declare-fun b_and!5575 () Bool)

(assert (= b_and!5571 (and (=> t!5378 result!3095) b_and!5575)))

(declare-fun m!98741 () Bool)

(assert (=> b!91935 m!98741))

(assert (=> b!91935 m!98741))

(declare-fun m!98743 () Bool)

(assert (=> b!91935 m!98743))

(declare-fun m!98745 () Bool)

(assert (=> bm!9029 m!98745))

(declare-fun m!98747 () Bool)

(assert (=> b!91931 m!98747))

(declare-fun m!98749 () Bool)

(assert (=> b!91931 m!98749))

(declare-fun m!98751 () Bool)

(assert (=> b!91931 m!98751))

(declare-fun m!98753 () Bool)

(assert (=> b!91931 m!98753))

(assert (=> b!91931 m!98741))

(declare-fun m!98755 () Bool)

(assert (=> b!91931 m!98755))

(assert (=> b!91931 m!98751))

(declare-fun m!98757 () Bool)

(assert (=> b!91931 m!98757))

(declare-fun m!98759 () Bool)

(assert (=> b!91931 m!98759))

(declare-fun m!98761 () Bool)

(assert (=> b!91931 m!98761))

(assert (=> b!91931 m!98755))

(declare-fun m!98763 () Bool)

(assert (=> b!91931 m!98763))

(declare-fun m!98765 () Bool)

(assert (=> b!91931 m!98765))

(declare-fun m!98767 () Bool)

(assert (=> b!91931 m!98767))

(assert (=> b!91931 m!98747))

(declare-fun m!98769 () Bool)

(assert (=> b!91931 m!98769))

(declare-fun m!98771 () Bool)

(assert (=> b!91931 m!98771))

(declare-fun m!98773 () Bool)

(assert (=> b!91931 m!98773))

(declare-fun m!98775 () Bool)

(assert (=> b!91931 m!98775))

(assert (=> b!91931 m!98757))

(declare-fun m!98777 () Bool)

(assert (=> b!91931 m!98777))

(assert (=> d!24193 m!98733))

(declare-fun m!98779 () Bool)

(assert (=> b!91947 m!98779))

(declare-fun m!98781 () Bool)

(assert (=> b!91947 m!98781))

(assert (=> b!91947 m!98741))

(assert (=> b!91947 m!98741))

(declare-fun m!98783 () Bool)

(assert (=> b!91947 m!98783))

(assert (=> b!91947 m!98781))

(assert (=> b!91947 m!98779))

(declare-fun m!98785 () Bool)

(assert (=> b!91947 m!98785))

(declare-fun m!98787 () Bool)

(assert (=> bm!9030 m!98787))

(assert (=> bm!9033 m!98777))

(assert (=> b!91944 m!98741))

(assert (=> b!91944 m!98741))

(assert (=> b!91944 m!98743))

(declare-fun m!98789 () Bool)

(assert (=> b!91943 m!98789))

(declare-fun m!98791 () Bool)

(assert (=> b!91936 m!98791))

(declare-fun m!98793 () Bool)

(assert (=> b!91932 m!98793))

(declare-fun m!98795 () Bool)

(assert (=> bm!9032 m!98795))

(assert (=> b!91927 m!98741))

(assert (=> b!91927 m!98741))

(declare-fun m!98797 () Bool)

(assert (=> b!91927 m!98797))

(assert (=> b!91768 d!24193))

(declare-fun d!24195 () Bool)

(assert (=> d!24195 (= (apply!87 lt!44758 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1252 (getValueByKey!146 (toList!751 lt!44758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3816 () Bool)

(assert (= bs!3816 d!24195))

(declare-fun m!98799 () Bool)

(assert (=> bs!3816 m!98799))

(assert (=> bs!3816 m!98799))

(declare-fun m!98801 () Bool)

(assert (=> bs!3816 m!98801))

(assert (=> b!91626 d!24195))

(assert (=> d!24147 d!24151))

(declare-fun d!24197 () Bool)

(assert (=> d!24197 (not (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!24197 true))

(declare-fun _$68!82 () Unit!2702)

(assert (=> d!24197 (= (choose!68 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535)) _$68!82)))

(declare-fun bs!3817 () Bool)

(assert (= bs!3817 d!24197))

(assert (=> bs!3817 m!98059))

(assert (=> bs!3817 m!98077))

(assert (=> d!24147 d!24197))

(declare-fun d!24199 () Bool)

(assert (=> d!24199 (= (apply!87 lt!44675 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1252 (getValueByKey!146 (toList!751 lt!44675) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3818 () Bool)

(assert (= bs!3818 d!24199))

(assert (=> bs!3818 m!98285))

(declare-fun m!98803 () Bool)

(assert (=> bs!3818 m!98803))

(assert (=> bs!3818 m!98803))

(declare-fun m!98805 () Bool)

(assert (=> bs!3818 m!98805))

(assert (=> b!91558 d!24199))

(declare-fun d!24201 () Bool)

(declare-fun c!15288 () Bool)

(assert (=> d!24201 (= c!15288 ((_ is ValueCellFull!947) (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!59955 () V!3089)

(assert (=> d!24201 (= (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!59955)))

(declare-fun b!91948 () Bool)

(assert (=> b!91948 (= e!59955 (get!1250 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91949 () Bool)

(assert (=> b!91949 (= e!59955 (get!1251 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24201 c!15288) b!91948))

(assert (= (and d!24201 (not c!15288)) b!91949))

(assert (=> b!91948 m!98299))

(assert (=> b!91948 m!98063))

(declare-fun m!98807 () Bool)

(assert (=> b!91948 m!98807))

(assert (=> b!91949 m!98299))

(assert (=> b!91949 m!98063))

(declare-fun m!98809 () Bool)

(assert (=> b!91949 m!98809))

(assert (=> b!91558 d!24201))

(declare-fun d!24203 () Bool)

(declare-fun res!46781 () Bool)

(declare-fun e!59956 () Bool)

(assert (=> d!24203 (=> (not res!46781) (not e!59956))))

(assert (=> d!24203 (= res!46781 (simpleValid!63 (_2!1132 lt!44876)))))

(assert (=> d!24203 (= (valid!363 (_2!1132 lt!44876)) e!59956)))

(declare-fun b!91950 () Bool)

(declare-fun res!46782 () Bool)

(assert (=> b!91950 (=> (not res!46782) (not e!59956))))

(assert (=> b!91950 (= res!46782 (= (arrayCountValidKeys!0 (_keys!4085 (_2!1132 lt!44876)) #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44876)))) (_size!450 (_2!1132 lt!44876))))))

(declare-fun b!91951 () Bool)

(declare-fun res!46783 () Bool)

(assert (=> b!91951 (=> (not res!46783) (not e!59956))))

(assert (=> b!91951 (= res!46783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 (_2!1132 lt!44876)) (mask!6465 (_2!1132 lt!44876))))))

(declare-fun b!91952 () Bool)

(assert (=> b!91952 (= e!59956 (arrayNoDuplicates!0 (_keys!4085 (_2!1132 lt!44876)) #b00000000000000000000000000000000 Nil!1535))))

(assert (= (and d!24203 res!46781) b!91950))

(assert (= (and b!91950 res!46782) b!91951))

(assert (= (and b!91951 res!46783) b!91952))

(declare-fun m!98811 () Bool)

(assert (=> d!24203 m!98811))

(declare-fun m!98813 () Bool)

(assert (=> b!91950 m!98813))

(declare-fun m!98815 () Bool)

(assert (=> b!91951 m!98815))

(declare-fun m!98817 () Bool)

(assert (=> b!91952 m!98817))

(assert (=> d!24141 d!24203))

(assert (=> d!24141 d!24137))

(declare-fun b!91953 () Bool)

(declare-fun e!59960 () Bool)

(declare-fun e!59957 () Bool)

(assert (=> b!91953 (= e!59960 e!59957)))

(declare-fun c!15289 () Bool)

(assert (=> b!91953 (= c!15289 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!91954 () Bool)

(declare-fun call!9038 () Bool)

(assert (=> b!91954 (= e!59957 call!9038)))

(declare-fun b!91955 () Bool)

(declare-fun e!59959 () Bool)

(assert (=> b!91955 (= e!59959 e!59960)))

(declare-fun res!46786 () Bool)

(assert (=> b!91955 (=> (not res!46786) (not e!59960))))

(declare-fun e!59958 () Bool)

(assert (=> b!91955 (= res!46786 (not e!59958))))

(declare-fun res!46784 () Bool)

(assert (=> b!91955 (=> (not res!46784) (not e!59958))))

(assert (=> b!91955 (= res!46784 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!24205 () Bool)

(declare-fun res!46785 () Bool)

(assert (=> d!24205 (=> res!46785 e!59959)))

(assert (=> d!24205 (= res!46785 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> d!24205 (= (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!15258 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535) Nil!1535)) e!59959)))

(declare-fun bm!9035 () Bool)

(assert (=> bm!9035 (= call!9038 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!15289 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!15258 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535) Nil!1535)) (ite c!15258 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535) Nil!1535))))))

(declare-fun b!91956 () Bool)

(assert (=> b!91956 (= e!59958 (contains!772 (ite c!15258 (Cons!1534 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) Nil!1535) Nil!1535) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!91957 () Bool)

(assert (=> b!91957 (= e!59957 call!9038)))

(assert (= (and d!24205 (not res!46785)) b!91955))

(assert (= (and b!91955 res!46784) b!91956))

(assert (= (and b!91955 res!46786) b!91953))

(assert (= (and b!91953 c!15289) b!91954))

(assert (= (and b!91953 (not c!15289)) b!91957))

(assert (= (or b!91954 b!91957) bm!9035))

(declare-fun m!98819 () Bool)

(assert (=> b!91953 m!98819))

(assert (=> b!91953 m!98819))

(declare-fun m!98821 () Bool)

(assert (=> b!91953 m!98821))

(assert (=> b!91955 m!98819))

(assert (=> b!91955 m!98819))

(assert (=> b!91955 m!98821))

(assert (=> bm!9035 m!98819))

(declare-fun m!98823 () Bool)

(assert (=> bm!9035 m!98823))

(assert (=> b!91956 m!98819))

(assert (=> b!91956 m!98819))

(declare-fun m!98825 () Bool)

(assert (=> b!91956 m!98825))

(assert (=> bm!9015 d!24205))

(assert (=> bm!8939 d!24107))

(declare-fun d!24207 () Bool)

(declare-fun e!59961 () Bool)

(assert (=> d!24207 e!59961))

(declare-fun res!46787 () Bool)

(assert (=> d!24207 (=> (not res!46787) (not e!59961))))

(declare-fun lt!45044 () ListLongMap!1471)

(assert (=> d!24207 (= res!46787 (contains!769 lt!45044 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun lt!45047 () List!1537)

(assert (=> d!24207 (= lt!45044 (ListLongMap!1472 lt!45047))))

(declare-fun lt!45045 () Unit!2702)

(declare-fun lt!45046 () Unit!2702)

(assert (=> d!24207 (= lt!45045 lt!45046)))

(assert (=> d!24207 (= (getValueByKey!146 lt!45047 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24207 (= lt!45046 (lemmaContainsTupThenGetReturnValue!63 lt!45047 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24207 (= lt!45047 (insertStrictlySorted!66 (toList!751 call!9004) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24207 (= (+!120 call!9004 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) lt!45044)))

(declare-fun b!91958 () Bool)

(declare-fun res!46788 () Bool)

(assert (=> b!91958 (=> (not res!46788) (not e!59961))))

(assert (=> b!91958 (= res!46788 (= (getValueByKey!146 (toList!751 lt!45044) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun b!91959 () Bool)

(assert (=> b!91959 (= e!59961 (contains!771 (toList!751 lt!45044) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (= (and d!24207 res!46787) b!91958))

(assert (= (and b!91958 res!46788) b!91959))

(declare-fun m!98827 () Bool)

(assert (=> d!24207 m!98827))

(declare-fun m!98829 () Bool)

(assert (=> d!24207 m!98829))

(declare-fun m!98831 () Bool)

(assert (=> d!24207 m!98831))

(declare-fun m!98833 () Bool)

(assert (=> d!24207 m!98833))

(declare-fun m!98835 () Bool)

(assert (=> b!91958 m!98835))

(declare-fun m!98837 () Bool)

(assert (=> b!91959 m!98837))

(assert (=> b!91784 d!24207))

(declare-fun d!24209 () Bool)

(assert (=> d!24209 (= (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992)))) (and (or (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000001111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000011111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000001111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000011111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000001111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000011111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000001111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000011111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000000111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000001111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000011111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000000111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000001111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000011111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000000111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000001111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000011111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000000111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000001111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000011111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00000111111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00001111111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00011111111111111111111111111111) (= (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6465 (v!2723 (underlying!315 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!24123 d!24209))

(declare-fun b!91968 () Bool)

(declare-fun e!59967 () (_ BitVec 32))

(assert (=> b!91968 (= e!59967 #b00000000000000000000000000000000)))

(declare-fun b!91969 () Bool)

(declare-fun e!59966 () (_ BitVec 32))

(declare-fun call!9041 () (_ BitVec 32))

(assert (=> b!91969 (= e!59966 call!9041)))

(declare-fun b!91970 () Bool)

(assert (=> b!91970 (= e!59966 (bvadd #b00000000000000000000000000000001 call!9041))))

(declare-fun d!24211 () Bool)

(declare-fun lt!45050 () (_ BitVec 32))

(assert (=> d!24211 (and (bvsge lt!45050 #b00000000000000000000000000000000) (bvsle lt!45050 (bvsub (size!2205 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!24211 (= lt!45050 e!59967)))

(declare-fun c!15295 () Bool)

(assert (=> d!24211 (= c!15295 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (=> d!24211 (and (bvsle #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2205 (_keys!4085 newMap!16)) (size!2205 (_keys!4085 newMap!16))))))

(assert (=> d!24211 (= (arrayCountValidKeys!0 (_keys!4085 newMap!16) #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) lt!45050)))

(declare-fun b!91971 () Bool)

(assert (=> b!91971 (= e!59967 e!59966)))

(declare-fun c!15294 () Bool)

(assert (=> b!91971 (= c!15294 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9038 () Bool)

(assert (=> bm!9038 (= call!9041 (arrayCountValidKeys!0 (_keys!4085 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2205 (_keys!4085 newMap!16))))))

(assert (= (and d!24211 c!15295) b!91968))

(assert (= (and d!24211 (not c!15295)) b!91971))

(assert (= (and b!91971 c!15294) b!91970))

(assert (= (and b!91971 (not c!15294)) b!91969))

(assert (= (or b!91970 b!91969) bm!9038))

(assert (=> b!91971 m!98741))

(assert (=> b!91971 m!98741))

(assert (=> b!91971 m!98743))

(declare-fun m!98839 () Bool)

(assert (=> bm!9038 m!98839))

(assert (=> b!91667 d!24211))

(declare-fun d!24213 () Bool)

(declare-fun e!59970 () Bool)

(assert (=> d!24213 e!59970))

(declare-fun res!46794 () Bool)

(assert (=> d!24213 (=> (not res!46794) (not e!59970))))

(declare-fun lt!45055 () SeekEntryResult!242)

(assert (=> d!24213 (= res!46794 ((_ is Found!242) lt!45055))))

(assert (=> d!24213 (= lt!45055 (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun lt!45056 () Unit!2702)

(declare-fun choose!554 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2702)

(assert (=> d!24213 (= lt!45056 (choose!554 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24213 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24213 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)) lt!45056)))

(declare-fun b!91976 () Bool)

(declare-fun res!46793 () Bool)

(assert (=> b!91976 (=> (not res!46793) (not e!59970))))

(assert (=> b!91976 (= res!46793 (inRange!0 (index!3109 lt!45055) (mask!6465 newMap!16)))))

(declare-fun b!91977 () Bool)

(assert (=> b!91977 (= e!59970 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!45055)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!91977 (and (bvsge (index!3109 lt!45055) #b00000000000000000000000000000000) (bvslt (index!3109 lt!45055) (size!2205 (_keys!4085 newMap!16))))))

(assert (= (and d!24213 res!46794) b!91976))

(assert (= (and b!91976 res!46793) b!91977))

(assert (=> d!24213 m!98059))

(assert (=> d!24213 m!98559))

(assert (=> d!24213 m!98059))

(declare-fun m!98841 () Bool)

(assert (=> d!24213 m!98841))

(assert (=> d!24213 m!98733))

(declare-fun m!98843 () Bool)

(assert (=> b!91976 m!98843))

(declare-fun m!98845 () Bool)

(assert (=> b!91977 m!98845))

(assert (=> bm!8990 d!24213))

(declare-fun b!91978 () Bool)

(declare-fun e!59972 () (_ BitVec 32))

(assert (=> b!91978 (= e!59972 #b00000000000000000000000000000000)))

(declare-fun b!91979 () Bool)

(declare-fun e!59971 () (_ BitVec 32))

(declare-fun call!9042 () (_ BitVec 32))

(assert (=> b!91979 (= e!59971 call!9042)))

(declare-fun b!91980 () Bool)

(assert (=> b!91980 (= e!59971 (bvadd #b00000000000000000000000000000001 call!9042))))

(declare-fun d!24215 () Bool)

(declare-fun lt!45057 () (_ BitVec 32))

(assert (=> d!24215 (and (bvsge lt!45057 #b00000000000000000000000000000000) (bvsle lt!45057 (bvsub (size!2205 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(assert (=> d!24215 (= lt!45057 e!59972)))

(declare-fun c!15297 () Bool)

(assert (=> d!24215 (= c!15297 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (=> d!24215 (and (bvsle #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2205 (_keys!4085 (_2!1132 lt!44543))) (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (=> d!24215 (= (arrayCountValidKeys!0 (_keys!4085 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))) lt!45057)))

(declare-fun b!91981 () Bool)

(assert (=> b!91981 (= e!59972 e!59971)))

(declare-fun c!15296 () Bool)

(assert (=> b!91981 (= c!15296 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun bm!9039 () Bool)

(assert (=> bm!9039 (= call!9042 (arrayCountValidKeys!0 (_keys!4085 (_2!1132 lt!44543)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (= (and d!24215 c!15297) b!91978))

(assert (= (and d!24215 (not c!15297)) b!91981))

(assert (= (and b!91981 c!15296) b!91980))

(assert (= (and b!91981 (not c!15296)) b!91979))

(assert (= (or b!91980 b!91979) bm!9039))

(declare-fun m!98847 () Bool)

(assert (=> b!91981 m!98847))

(assert (=> b!91981 m!98847))

(declare-fun m!98849 () Bool)

(assert (=> b!91981 m!98849))

(declare-fun m!98851 () Bool)

(assert (=> bm!9039 m!98851))

(assert (=> b!91520 d!24215))

(declare-fun d!24217 () Bool)

(declare-fun res!46795 () Bool)

(declare-fun e!59973 () Bool)

(assert (=> d!24217 (=> res!46795 e!59973)))

(assert (=> d!24217 (= res!46795 (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24217 (= (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!59973)))

(declare-fun b!91982 () Bool)

(declare-fun e!59974 () Bool)

(assert (=> b!91982 (= e!59973 e!59974)))

(declare-fun res!46796 () Bool)

(assert (=> b!91982 (=> (not res!46796) (not e!59974))))

(assert (=> b!91982 (= res!46796 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!91983 () Bool)

(assert (=> b!91983 (= e!59974 (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!24217 (not res!46795)) b!91982))

(assert (= (and b!91982 res!46796) b!91983))

(declare-fun m!98853 () Bool)

(assert (=> d!24217 m!98853))

(assert (=> b!91983 m!98059))

(declare-fun m!98855 () Bool)

(assert (=> b!91983 m!98855))

(assert (=> b!91804 d!24217))

(declare-fun d!24219 () Bool)

(declare-fun e!59975 () Bool)

(assert (=> d!24219 e!59975))

(declare-fun res!46797 () Bool)

(assert (=> d!24219 (=> res!46797 e!59975)))

(declare-fun lt!45059 () Bool)

(assert (=> d!24219 (= res!46797 (not lt!45059))))

(declare-fun lt!45060 () Bool)

(assert (=> d!24219 (= lt!45059 lt!45060)))

(declare-fun lt!45061 () Unit!2702)

(declare-fun e!59976 () Unit!2702)

(assert (=> d!24219 (= lt!45061 e!59976)))

(declare-fun c!15298 () Bool)

(assert (=> d!24219 (= c!15298 lt!45060)))

(assert (=> d!24219 (= lt!45060 (containsKey!149 (toList!751 lt!44775) (_1!1133 lt!44534)))))

(assert (=> d!24219 (= (contains!769 lt!44775 (_1!1133 lt!44534)) lt!45059)))

(declare-fun b!91984 () Bool)

(declare-fun lt!45058 () Unit!2702)

(assert (=> b!91984 (= e!59976 lt!45058)))

(assert (=> b!91984 (= lt!45058 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44775) (_1!1133 lt!44534)))))

(assert (=> b!91984 (isDefined!98 (getValueByKey!146 (toList!751 lt!44775) (_1!1133 lt!44534)))))

(declare-fun b!91985 () Bool)

(declare-fun Unit!2723 () Unit!2702)

(assert (=> b!91985 (= e!59976 Unit!2723)))

(declare-fun b!91986 () Bool)

(assert (=> b!91986 (= e!59975 (isDefined!98 (getValueByKey!146 (toList!751 lt!44775) (_1!1133 lt!44534))))))

(assert (= (and d!24219 c!15298) b!91984))

(assert (= (and d!24219 (not c!15298)) b!91985))

(assert (= (and d!24219 (not res!46797)) b!91986))

(declare-fun m!98857 () Bool)

(assert (=> d!24219 m!98857))

(declare-fun m!98859 () Bool)

(assert (=> b!91984 m!98859))

(assert (=> b!91984 m!98451))

(assert (=> b!91984 m!98451))

(declare-fun m!98861 () Bool)

(assert (=> b!91984 m!98861))

(assert (=> b!91986 m!98451))

(assert (=> b!91986 m!98451))

(assert (=> b!91986 m!98861))

(assert (=> d!24125 d!24219))

(declare-fun b!91989 () Bool)

(declare-fun e!59978 () Option!152)

(assert (=> b!91989 (= e!59978 (getValueByKey!146 (t!5363 lt!44778) (_1!1133 lt!44534)))))

(declare-fun b!91990 () Bool)

(assert (=> b!91990 (= e!59978 None!150)))

(declare-fun d!24221 () Bool)

(declare-fun c!15299 () Bool)

(assert (=> d!24221 (= c!15299 (and ((_ is Cons!1533) lt!44778) (= (_1!1133 (h!2125 lt!44778)) (_1!1133 lt!44534))))))

(declare-fun e!59977 () Option!152)

(assert (=> d!24221 (= (getValueByKey!146 lt!44778 (_1!1133 lt!44534)) e!59977)))

(declare-fun b!91988 () Bool)

(assert (=> b!91988 (= e!59977 e!59978)))

(declare-fun c!15300 () Bool)

(assert (=> b!91988 (= c!15300 (and ((_ is Cons!1533) lt!44778) (not (= (_1!1133 (h!2125 lt!44778)) (_1!1133 lt!44534)))))))

(declare-fun b!91987 () Bool)

(assert (=> b!91987 (= e!59977 (Some!151 (_2!1133 (h!2125 lt!44778))))))

(assert (= (and d!24221 c!15299) b!91987))

(assert (= (and d!24221 (not c!15299)) b!91988))

(assert (= (and b!91988 c!15300) b!91989))

(assert (= (and b!91988 (not c!15300)) b!91990))

(declare-fun m!98863 () Bool)

(assert (=> b!91989 m!98863))

(assert (=> d!24125 d!24221))

(declare-fun d!24223 () Bool)

(assert (=> d!24223 (= (getValueByKey!146 lt!44778 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(declare-fun lt!45064 () Unit!2702)

(declare-fun choose!555 (List!1537 (_ BitVec 64) V!3089) Unit!2702)

(assert (=> d!24223 (= lt!45064 (choose!555 lt!44778 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun e!59981 () Bool)

(assert (=> d!24223 e!59981))

(declare-fun res!46802 () Bool)

(assert (=> d!24223 (=> (not res!46802) (not e!59981))))

(assert (=> d!24223 (= res!46802 (isStrictlySorted!288 lt!44778))))

(assert (=> d!24223 (= (lemmaContainsTupThenGetReturnValue!63 lt!44778 (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45064)))

(declare-fun b!91995 () Bool)

(declare-fun res!46803 () Bool)

(assert (=> b!91995 (=> (not res!46803) (not e!59981))))

(assert (=> b!91995 (= res!46803 (containsKey!149 lt!44778 (_1!1133 lt!44534)))))

(declare-fun b!91996 () Bool)

(assert (=> b!91996 (= e!59981 (contains!771 lt!44778 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24223 res!46802) b!91995))

(assert (= (and b!91995 res!46803) b!91996))

(assert (=> d!24223 m!98445))

(declare-fun m!98865 () Bool)

(assert (=> d!24223 m!98865))

(declare-fun m!98867 () Bool)

(assert (=> d!24223 m!98867))

(declare-fun m!98869 () Bool)

(assert (=> b!91995 m!98869))

(declare-fun m!98871 () Bool)

(assert (=> b!91996 m!98871))

(assert (=> d!24125 d!24223))

(declare-fun c!15312 () Bool)

(declare-fun b!92017 () Bool)

(declare-fun e!59995 () List!1537)

(declare-fun c!15309 () Bool)

(assert (=> b!92017 (= e!59995 (ite c!15312 (t!5363 (toList!751 lt!44531)) (ite c!15309 (Cons!1533 (h!2125 (toList!751 lt!44531)) (t!5363 (toList!751 lt!44531))) Nil!1534)))))

(declare-fun call!9049 () List!1537)

(declare-fun c!15310 () Bool)

(declare-fun bm!9046 () Bool)

(declare-fun $colon$colon!74 (List!1537 tuple2!2244) List!1537)

(assert (=> bm!9046 (= call!9049 ($colon$colon!74 e!59995 (ite c!15310 (h!2125 (toList!751 lt!44531)) (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534)))))))

(declare-fun c!15311 () Bool)

(assert (=> bm!9046 (= c!15311 c!15310)))

(declare-fun b!92018 () Bool)

(assert (=> b!92018 (= e!59995 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44531)) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun d!24225 () Bool)

(declare-fun e!59992 () Bool)

(assert (=> d!24225 e!59992))

(declare-fun res!46809 () Bool)

(assert (=> d!24225 (=> (not res!46809) (not e!59992))))

(declare-fun lt!45067 () List!1537)

(assert (=> d!24225 (= res!46809 (isStrictlySorted!288 lt!45067))))

(declare-fun e!59996 () List!1537)

(assert (=> d!24225 (= lt!45067 e!59996)))

(assert (=> d!24225 (= c!15310 (and ((_ is Cons!1533) (toList!751 lt!44531)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44534))))))

(assert (=> d!24225 (isStrictlySorted!288 (toList!751 lt!44531))))

(assert (=> d!24225 (= (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45067)))

(declare-fun b!92019 () Bool)

(declare-fun e!59993 () List!1537)

(declare-fun call!9050 () List!1537)

(assert (=> b!92019 (= e!59993 call!9050)))

(declare-fun b!92020 () Bool)

(declare-fun e!59994 () List!1537)

(declare-fun call!9051 () List!1537)

(assert (=> b!92020 (= e!59994 call!9051)))

(declare-fun b!92021 () Bool)

(declare-fun res!46808 () Bool)

(assert (=> b!92021 (=> (not res!46808) (not e!59992))))

(assert (=> b!92021 (= res!46808 (containsKey!149 lt!45067 (_1!1133 lt!44534)))))

(declare-fun bm!9047 () Bool)

(assert (=> bm!9047 (= call!9050 call!9049)))

(declare-fun b!92022 () Bool)

(assert (=> b!92022 (= e!59994 call!9051)))

(declare-fun bm!9048 () Bool)

(assert (=> bm!9048 (= call!9051 call!9050)))

(declare-fun b!92023 () Bool)

(assert (=> b!92023 (= e!59996 call!9049)))

(declare-fun b!92024 () Bool)

(assert (=> b!92024 (= c!15309 (and ((_ is Cons!1533) (toList!751 lt!44531)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44534))))))

(assert (=> b!92024 (= e!59993 e!59994)))

(declare-fun b!92025 () Bool)

(assert (=> b!92025 (= e!59996 e!59993)))

(assert (=> b!92025 (= c!15312 (and ((_ is Cons!1533) (toList!751 lt!44531)) (= (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44534))))))

(declare-fun b!92026 () Bool)

(assert (=> b!92026 (= e!59992 (contains!771 lt!45067 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24225 c!15310) b!92023))

(assert (= (and d!24225 (not c!15310)) b!92025))

(assert (= (and b!92025 c!15312) b!92019))

(assert (= (and b!92025 (not c!15312)) b!92024))

(assert (= (and b!92024 c!15309) b!92020))

(assert (= (and b!92024 (not c!15309)) b!92022))

(assert (= (or b!92020 b!92022) bm!9048))

(assert (= (or b!92019 bm!9048) bm!9047))

(assert (= (or b!92023 bm!9047) bm!9046))

(assert (= (and bm!9046 c!15311) b!92018))

(assert (= (and bm!9046 (not c!15311)) b!92017))

(assert (= (and d!24225 res!46809) b!92021))

(assert (= (and b!92021 res!46808) b!92026))

(declare-fun m!98873 () Bool)

(assert (=> bm!9046 m!98873))

(declare-fun m!98875 () Bool)

(assert (=> b!92021 m!98875))

(declare-fun m!98877 () Bool)

(assert (=> d!24225 m!98877))

(declare-fun m!98879 () Bool)

(assert (=> d!24225 m!98879))

(declare-fun m!98881 () Bool)

(assert (=> b!92026 m!98881))

(declare-fun m!98883 () Bool)

(assert (=> b!92018 m!98883))

(assert (=> d!24125 d!24225))

(declare-fun d!24227 () Bool)

(declare-fun res!46810 () Bool)

(declare-fun e!59997 () Bool)

(assert (=> d!24227 (=> res!46810 e!59997)))

(assert (=> d!24227 (= res!46810 (= (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24227 (= (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000) e!59997)))

(declare-fun b!92027 () Bool)

(declare-fun e!59998 () Bool)

(assert (=> b!92027 (= e!59997 e!59998)))

(declare-fun res!46811 () Bool)

(assert (=> b!92027 (=> (not res!46811) (not e!59998))))

(assert (=> b!92027 (= res!46811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92028 () Bool)

(assert (=> b!92028 (= e!59998 (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!24227 (not res!46810)) b!92027))

(assert (= (and b!92027 res!46811) b!92028))

(assert (=> d!24227 m!98741))

(assert (=> b!92028 m!98059))

(declare-fun m!98885 () Bool)

(assert (=> b!92028 m!98885))

(assert (=> bm!8999 d!24227))

(declare-fun d!24229 () Bool)

(declare-fun e!59999 () Bool)

(assert (=> d!24229 e!59999))

(declare-fun res!46812 () Bool)

(assert (=> d!24229 (=> (not res!46812) (not e!59999))))

(declare-fun lt!45068 () ListLongMap!1471)

(assert (=> d!24229 (= res!46812 (contains!769 lt!45068 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45071 () List!1537)

(assert (=> d!24229 (= lt!45068 (ListLongMap!1472 lt!45071))))

(declare-fun lt!45069 () Unit!2702)

(declare-fun lt!45070 () Unit!2702)

(assert (=> d!24229 (= lt!45069 lt!45070)))

(assert (=> d!24229 (= (getValueByKey!146 lt!45071 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24229 (= lt!45070 (lemmaContainsTupThenGetReturnValue!63 lt!45071 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24229 (= lt!45071 (insertStrictlySorted!66 (toList!751 call!8931) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24229 (= (+!120 call!8931 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45068)))

(declare-fun b!92029 () Bool)

(declare-fun res!46813 () Bool)

(assert (=> b!92029 (=> (not res!46813) (not e!59999))))

(assert (=> b!92029 (= res!46813 (= (getValueByKey!146 (toList!751 lt!45068) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92030 () Bool)

(assert (=> b!92030 (= e!59999 (contains!771 (toList!751 lt!45068) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24229 res!46812) b!92029))

(assert (= (and b!92029 res!46813) b!92030))

(declare-fun m!98887 () Bool)

(assert (=> d!24229 m!98887))

(declare-fun m!98889 () Bool)

(assert (=> d!24229 m!98889))

(declare-fun m!98891 () Bool)

(assert (=> d!24229 m!98891))

(declare-fun m!98893 () Bool)

(assert (=> d!24229 m!98893))

(declare-fun m!98895 () Bool)

(assert (=> b!92029 m!98895))

(declare-fun m!98897 () Bool)

(assert (=> b!92030 m!98897))

(assert (=> b!91633 d!24229))

(declare-fun d!24231 () Bool)

(declare-fun e!60002 () Bool)

(assert (=> d!24231 e!60002))

(declare-fun c!15315 () Bool)

(assert (=> d!24231 (= c!15315 (and (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!24231 true))

(declare-fun _$29!117 () Unit!2702)

(assert (=> d!24231 (= (choose!551 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) _$29!117)))

(declare-fun b!92035 () Bool)

(assert (=> b!92035 (= e!60002 (arrayContainsKey!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!92036 () Bool)

(assert (=> b!92036 (= e!60002 (ite (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!24231 c!15315) b!92035))

(assert (= (and d!24231 (not c!15315)) b!92036))

(assert (=> b!92035 m!98059))

(assert (=> b!92035 m!98077))

(assert (=> d!24153 d!24231))

(assert (=> d!24153 d!24209))

(declare-fun d!24233 () Bool)

(assert (=> d!24233 (= (inRange!0 (ite c!15242 (ite c!15245 (index!3109 lt!44868) (ite c!15240 (index!3108 lt!44880) (index!3111 lt!44880))) (ite c!15244 (index!3109 lt!44887) (ite c!15250 (index!3108 lt!44878) (index!3111 lt!44878)))) (mask!6465 newMap!16)) (and (bvsge (ite c!15242 (ite c!15245 (index!3109 lt!44868) (ite c!15240 (index!3108 lt!44880) (index!3111 lt!44880))) (ite c!15244 (index!3109 lt!44887) (ite c!15250 (index!3108 lt!44878) (index!3111 lt!44878)))) #b00000000000000000000000000000000) (bvslt (ite c!15242 (ite c!15245 (index!3109 lt!44868) (ite c!15240 (index!3108 lt!44880) (index!3111 lt!44880))) (ite c!15244 (index!3109 lt!44887) (ite c!15250 (index!3108 lt!44878) (index!3111 lt!44878)))) (bvadd (mask!6465 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!9009 d!24233))

(declare-fun d!24235 () Bool)

(declare-fun lt!45072 () Bool)

(assert (=> d!24235 (= lt!45072 (select (content!96 (toList!751 lt!44684)) lt!44534))))

(declare-fun e!60004 () Bool)

(assert (=> d!24235 (= lt!45072 e!60004)))

(declare-fun res!46814 () Bool)

(assert (=> d!24235 (=> (not res!46814) (not e!60004))))

(assert (=> d!24235 (= res!46814 ((_ is Cons!1533) (toList!751 lt!44684)))))

(assert (=> d!24235 (= (contains!771 (toList!751 lt!44684) lt!44534) lt!45072)))

(declare-fun b!92037 () Bool)

(declare-fun e!60003 () Bool)

(assert (=> b!92037 (= e!60004 e!60003)))

(declare-fun res!46815 () Bool)

(assert (=> b!92037 (=> res!46815 e!60003)))

(assert (=> b!92037 (= res!46815 (= (h!2125 (toList!751 lt!44684)) lt!44534))))

(declare-fun b!92038 () Bool)

(assert (=> b!92038 (= e!60003 (contains!771 (t!5363 (toList!751 lt!44684)) lt!44534))))

(assert (= (and d!24235 res!46814) b!92037))

(assert (= (and b!92037 (not res!46815)) b!92038))

(declare-fun m!98899 () Bool)

(assert (=> d!24235 m!98899))

(declare-fun m!98901 () Bool)

(assert (=> d!24235 m!98901))

(declare-fun m!98903 () Bool)

(assert (=> b!92038 m!98903))

(assert (=> b!91564 d!24235))

(declare-fun d!24237 () Bool)

(assert (=> d!24237 (= (apply!87 lt!44758 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1252 (getValueByKey!146 (toList!751 lt!44758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3819 () Bool)

(assert (= bs!3819 d!24237))

(declare-fun m!98905 () Bool)

(assert (=> bs!3819 m!98905))

(assert (=> bs!3819 m!98905))

(declare-fun m!98907 () Bool)

(assert (=> bs!3819 m!98907))

(assert (=> b!91622 d!24237))

(declare-fun d!24239 () Bool)

(assert (=> d!24239 (= (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!91550 d!24239))

(declare-fun d!24241 () Bool)

(declare-fun lt!45073 () Bool)

(assert (=> d!24241 (= lt!45073 (select (content!96 (toList!751 lt!44692)) lt!44534))))

(declare-fun e!60006 () Bool)

(assert (=> d!24241 (= lt!45073 e!60006)))

(declare-fun res!46816 () Bool)

(assert (=> d!24241 (=> (not res!46816) (not e!60006))))

(assert (=> d!24241 (= res!46816 ((_ is Cons!1533) (toList!751 lt!44692)))))

(assert (=> d!24241 (= (contains!771 (toList!751 lt!44692) lt!44534) lt!45073)))

(declare-fun b!92039 () Bool)

(declare-fun e!60005 () Bool)

(assert (=> b!92039 (= e!60006 e!60005)))

(declare-fun res!46817 () Bool)

(assert (=> b!92039 (=> res!46817 e!60005)))

(assert (=> b!92039 (= res!46817 (= (h!2125 (toList!751 lt!44692)) lt!44534))))

(declare-fun b!92040 () Bool)

(assert (=> b!92040 (= e!60005 (contains!771 (t!5363 (toList!751 lt!44692)) lt!44534))))

(assert (= (and d!24241 res!46816) b!92039))

(assert (= (and b!92039 (not res!46817)) b!92040))

(declare-fun m!98909 () Bool)

(assert (=> d!24241 m!98909))

(declare-fun m!98911 () Bool)

(assert (=> d!24241 m!98911))

(declare-fun m!98913 () Bool)

(assert (=> b!92040 m!98913))

(assert (=> b!91568 d!24241))

(assert (=> b!91809 d!24151))

(declare-fun b!92043 () Bool)

(declare-fun e!60008 () Option!152)

(assert (=> b!92043 (= e!60008 (getValueByKey!146 (t!5363 (toList!751 lt!44775)) (_1!1133 lt!44534)))))

(declare-fun b!92044 () Bool)

(assert (=> b!92044 (= e!60008 None!150)))

(declare-fun d!24243 () Bool)

(declare-fun c!15316 () Bool)

(assert (=> d!24243 (= c!15316 (and ((_ is Cons!1533) (toList!751 lt!44775)) (= (_1!1133 (h!2125 (toList!751 lt!44775))) (_1!1133 lt!44534))))))

(declare-fun e!60007 () Option!152)

(assert (=> d!24243 (= (getValueByKey!146 (toList!751 lt!44775) (_1!1133 lt!44534)) e!60007)))

(declare-fun b!92042 () Bool)

(assert (=> b!92042 (= e!60007 e!60008)))

(declare-fun c!15317 () Bool)

(assert (=> b!92042 (= c!15317 (and ((_ is Cons!1533) (toList!751 lt!44775)) (not (= (_1!1133 (h!2125 (toList!751 lt!44775))) (_1!1133 lt!44534)))))))

(declare-fun b!92041 () Bool)

(assert (=> b!92041 (= e!60007 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44775)))))))

(assert (= (and d!24243 c!15316) b!92041))

(assert (= (and d!24243 (not c!15316)) b!92042))

(assert (= (and b!92042 c!15317) b!92043))

(assert (= (and b!92042 (not c!15317)) b!92044))

(declare-fun m!98915 () Bool)

(assert (=> b!92043 m!98915))

(assert (=> b!91638 d!24243))

(declare-fun d!24245 () Bool)

(declare-fun e!60011 () Bool)

(assert (=> d!24245 e!60011))

(declare-fun res!46820 () Bool)

(assert (=> d!24245 (=> (not res!46820) (not e!60011))))

(assert (=> d!24245 (= res!46820 (and (bvsge (index!3109 lt!44881) #b00000000000000000000000000000000) (bvslt (index!3109 lt!44881) (size!2205 (_keys!4085 newMap!16)))))))

(declare-fun lt!45076 () Unit!2702)

(declare-fun choose!556 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) Unit!2702)

(assert (=> d!24245 (= lt!45076 (choose!556 (_keys!4085 newMap!16) lt!44882 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24245 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24245 (= (lemmaValidKeyInArrayIsInListMap!96 (_keys!4085 newMap!16) lt!44882 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (defaultEntry!2405 newMap!16)) lt!45076)))

(declare-fun b!92047 () Bool)

(assert (=> b!92047 (= e!60011 (contains!769 (getCurrentListMap!441 (_keys!4085 newMap!16) lt!44882 (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881))))))

(assert (= (and d!24245 res!46820) b!92047))

(declare-fun m!98917 () Bool)

(assert (=> d!24245 m!98917))

(assert (=> d!24245 m!98733))

(declare-fun m!98919 () Bool)

(assert (=> b!92047 m!98919))

(assert (=> b!92047 m!98531))

(assert (=> b!92047 m!98919))

(assert (=> b!92047 m!98531))

(declare-fun m!98921 () Bool)

(assert (=> b!92047 m!98921))

(assert (=> b!91793 d!24245))

(declare-fun d!24247 () Bool)

(declare-fun e!60014 () Bool)

(assert (=> d!24247 e!60014))

(declare-fun res!46823 () Bool)

(assert (=> d!24247 (=> (not res!46823) (not e!60014))))

(assert (=> d!24247 (= res!46823 (and (bvsge (index!3109 lt!44881) #b00000000000000000000000000000000) (bvslt (index!3109 lt!44881) (size!2206 (_values!2388 newMap!16)))))))

(declare-fun lt!45079 () Unit!2702)

(declare-fun choose!557 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) (_ BitVec 64) V!3089 Int) Unit!2702)

(assert (=> d!24247 (= lt!45079 (choose!557 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (defaultEntry!2405 newMap!16)))))

(assert (=> d!24247 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24247 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (index!3109 lt!44881) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 (defaultEntry!2405 newMap!16)) lt!45079)))

(declare-fun b!92050 () Bool)

(assert (=> b!92050 (= e!60014 (= (+!120 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (getCurrentListMap!441 (_keys!4085 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))))))

(assert (= (and d!24247 res!46823) b!92050))

(assert (=> d!24247 m!98059))

(declare-fun m!98923 () Bool)

(assert (=> d!24247 m!98923))

(assert (=> d!24247 m!98733))

(assert (=> b!92050 m!98459))

(assert (=> b!92050 m!98459))

(assert (=> b!92050 m!98707))

(assert (=> b!92050 m!98527))

(declare-fun m!98925 () Bool)

(assert (=> b!92050 m!98925))

(assert (=> b!91793 d!24247))

(declare-fun d!24249 () Bool)

(declare-fun e!60015 () Bool)

(assert (=> d!24249 e!60015))

(declare-fun res!46824 () Bool)

(assert (=> d!24249 (=> res!46824 e!60015)))

(declare-fun lt!45081 () Bool)

(assert (=> d!24249 (= res!46824 (not lt!45081))))

(declare-fun lt!45082 () Bool)

(assert (=> d!24249 (= lt!45081 lt!45082)))

(declare-fun lt!45083 () Unit!2702)

(declare-fun e!60016 () Unit!2702)

(assert (=> d!24249 (= lt!45083 e!60016)))

(declare-fun c!15318 () Bool)

(assert (=> d!24249 (= c!15318 lt!45082)))

(assert (=> d!24249 (= lt!45082 (containsKey!149 (toList!751 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24249 (= (contains!769 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!45081)))

(declare-fun b!92051 () Bool)

(declare-fun lt!45080 () Unit!2702)

(assert (=> b!92051 (= e!60016 lt!45080)))

(assert (=> b!92051 (= lt!45080 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!92051 (isDefined!98 (getValueByKey!146 (toList!751 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92052 () Bool)

(declare-fun Unit!2724 () Unit!2702)

(assert (=> b!92052 (= e!60016 Unit!2724)))

(declare-fun b!92053 () Bool)

(assert (=> b!92053 (= e!60015 (isDefined!98 (getValueByKey!146 (toList!751 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (= (and d!24249 c!15318) b!92051))

(assert (= (and d!24249 (not c!15318)) b!92052))

(assert (= (and d!24249 (not res!46824)) b!92053))

(assert (=> d!24249 m!98059))

(declare-fun m!98927 () Bool)

(assert (=> d!24249 m!98927))

(assert (=> b!92051 m!98059))

(declare-fun m!98929 () Bool)

(assert (=> b!92051 m!98929))

(assert (=> b!92051 m!98059))

(declare-fun m!98931 () Bool)

(assert (=> b!92051 m!98931))

(assert (=> b!92051 m!98931))

(declare-fun m!98933 () Bool)

(assert (=> b!92051 m!98933))

(assert (=> b!92053 m!98059))

(assert (=> b!92053 m!98931))

(assert (=> b!92053 m!98931))

(assert (=> b!92053 m!98933))

(assert (=> b!91793 d!24249))

(assert (=> b!91793 d!24193))

(assert (=> b!91625 d!24177))

(declare-fun b!92070 () Bool)

(declare-fun e!60025 () Bool)

(declare-fun e!60026 () Bool)

(assert (=> b!92070 (= e!60025 e!60026)))

(declare-fun c!15324 () Bool)

(declare-fun lt!45088 () SeekEntryResult!242)

(assert (=> b!92070 (= c!15324 ((_ is MissingVacant!242) lt!45088))))

(declare-fun b!92071 () Bool)

(declare-fun e!60027 () Bool)

(declare-fun call!9056 () Bool)

(assert (=> b!92071 (= e!60027 (not call!9056))))

(declare-fun b!92072 () Bool)

(declare-fun res!46833 () Bool)

(assert (=> b!92072 (=> (not res!46833) (not e!60027))))

(declare-fun call!9057 () Bool)

(assert (=> b!92072 (= res!46833 call!9057)))

(assert (=> b!92072 (= e!60026 e!60027)))

(declare-fun bm!9053 () Bool)

(assert (=> bm!9053 (= call!9056 (arrayContainsKey!0 (_keys!4085 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun c!15323 () Bool)

(declare-fun bm!9054 () Bool)

(assert (=> bm!9054 (= call!9057 (inRange!0 (ite c!15323 (index!3108 lt!45088) (index!3111 lt!45088)) (mask!6465 newMap!16)))))

(declare-fun b!92073 () Bool)

(declare-fun res!46834 () Bool)

(assert (=> b!92073 (=> (not res!46834) (not e!60027))))

(assert (=> b!92073 (= res!46834 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3111 lt!45088)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92073 (and (bvsge (index!3111 lt!45088) #b00000000000000000000000000000000) (bvslt (index!3111 lt!45088) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92075 () Bool)

(declare-fun e!60028 () Bool)

(assert (=> b!92075 (= e!60028 (not call!9056))))

(declare-fun b!92076 () Bool)

(assert (=> b!92076 (= e!60025 e!60028)))

(declare-fun res!46835 () Bool)

(assert (=> b!92076 (= res!46835 call!9057)))

(assert (=> b!92076 (=> (not res!46835) (not e!60028))))

(declare-fun b!92077 () Bool)

(assert (=> b!92077 (= e!60026 ((_ is Undefined!242) lt!45088))))

(declare-fun d!24251 () Bool)

(assert (=> d!24251 e!60025))

(assert (=> d!24251 (= c!15323 ((_ is MissingZero!242) lt!45088))))

(assert (=> d!24251 (= lt!45088 (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun lt!45089 () Unit!2702)

(declare-fun choose!558 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 64) Int) Unit!2702)

(assert (=> d!24251 (= lt!45089 (choose!558 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24251 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24251 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (defaultEntry!2405 newMap!16)) lt!45089)))

(declare-fun b!92074 () Bool)

(assert (=> b!92074 (and (bvsge (index!3108 lt!45088) #b00000000000000000000000000000000) (bvslt (index!3108 lt!45088) (size!2205 (_keys!4085 newMap!16))))))

(declare-fun res!46836 () Bool)

(assert (=> b!92074 (= res!46836 (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3108 lt!45088)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92074 (=> (not res!46836) (not e!60028))))

(assert (= (and d!24251 c!15323) b!92076))

(assert (= (and d!24251 (not c!15323)) b!92070))

(assert (= (and b!92076 res!46835) b!92074))

(assert (= (and b!92074 res!46836) b!92075))

(assert (= (and b!92070 c!15324) b!92072))

(assert (= (and b!92070 (not c!15324)) b!92077))

(assert (= (and b!92072 res!46833) b!92073))

(assert (= (and b!92073 res!46834) b!92071))

(assert (= (or b!92076 b!92072) bm!9054))

(assert (= (or b!92075 b!92071) bm!9053))

(declare-fun m!98935 () Bool)

(assert (=> b!92074 m!98935))

(assert (=> bm!9053 m!98059))

(assert (=> bm!9053 m!98549))

(declare-fun m!98937 () Bool)

(assert (=> b!92073 m!98937))

(assert (=> d!24251 m!98059))

(assert (=> d!24251 m!98559))

(assert (=> d!24251 m!98059))

(declare-fun m!98939 () Bool)

(assert (=> d!24251 m!98939))

(assert (=> d!24251 m!98733))

(declare-fun m!98941 () Bool)

(assert (=> bm!9054 m!98941))

(assert (=> bm!9002 d!24251))

(declare-fun d!24253 () Bool)

(declare-fun res!46841 () Bool)

(declare-fun e!60033 () Bool)

(assert (=> d!24253 (=> res!46841 e!60033)))

(assert (=> d!24253 (= res!46841 (and ((_ is Cons!1533) (toList!751 lt!44539)) (= (_1!1133 (h!2125 (toList!751 lt!44539))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (=> d!24253 (= (containsKey!149 (toList!751 lt!44539) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) e!60033)))

(declare-fun b!92082 () Bool)

(declare-fun e!60034 () Bool)

(assert (=> b!92082 (= e!60033 e!60034)))

(declare-fun res!46842 () Bool)

(assert (=> b!92082 (=> (not res!46842) (not e!60034))))

(assert (=> b!92082 (= res!46842 (and (or (not ((_ is Cons!1533) (toList!751 lt!44539))) (bvsle (_1!1133 (h!2125 (toList!751 lt!44539))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))) ((_ is Cons!1533) (toList!751 lt!44539)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44539))) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(declare-fun b!92083 () Bool)

(assert (=> b!92083 (= e!60034 (containsKey!149 (t!5363 (toList!751 lt!44539)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (= (and d!24253 (not res!46841)) b!92082))

(assert (= (and b!92082 res!46842) b!92083))

(assert (=> b!92083 m!98059))

(declare-fun m!98943 () Bool)

(assert (=> b!92083 m!98943))

(assert (=> d!24139 d!24253))

(declare-fun b!92084 () Bool)

(declare-fun res!46844 () Bool)

(declare-fun e!60037 () Bool)

(assert (=> b!92084 (=> (not res!46844) (not e!60037))))

(declare-fun lt!45096 () ListLongMap!1471)

(assert (=> b!92084 (= res!46844 (not (contains!769 lt!45096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92085 () Bool)

(declare-fun e!60035 () Bool)

(declare-fun e!60040 () Bool)

(assert (=> b!92085 (= e!60035 e!60040)))

(declare-fun c!15328 () Bool)

(assert (=> b!92085 (= c!15328 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92086 () Bool)

(assert (=> b!92086 (= e!60040 (= lt!45096 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92087 () Bool)

(declare-fun e!60041 () ListLongMap!1471)

(declare-fun e!60036 () ListLongMap!1471)

(assert (=> b!92087 (= e!60041 e!60036)))

(declare-fun c!15327 () Bool)

(assert (=> b!92087 (= c!15327 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!92088 () Bool)

(assert (=> b!92088 (= e!60040 (isEmpty!352 lt!45096))))

(declare-fun b!92089 () Bool)

(declare-fun e!60038 () Bool)

(assert (=> b!92089 (= e!60038 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92089 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!92090 () Bool)

(declare-fun call!9058 () ListLongMap!1471)

(assert (=> b!92090 (= e!60036 call!9058)))

(declare-fun d!24255 () Bool)

(assert (=> d!24255 e!60037))

(declare-fun res!46846 () Bool)

(assert (=> d!24255 (=> (not res!46846) (not e!60037))))

(assert (=> d!24255 (= res!46846 (not (contains!769 lt!45096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24255 (= lt!45096 e!60041)))

(declare-fun c!15326 () Bool)

(assert (=> d!24255 (= c!15326 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> d!24255 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24255 (= (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!45096)))

(declare-fun bm!9055 () Bool)

(assert (=> bm!9055 (= call!9058 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!92091 () Bool)

(assert (=> b!92091 (= e!60037 e!60035)))

(declare-fun c!15325 () Bool)

(assert (=> b!92091 (= c!15325 e!60038)))

(declare-fun res!46843 () Bool)

(assert (=> b!92091 (=> (not res!46843) (not e!60038))))

(assert (=> b!92091 (= res!46843 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92092 () Bool)

(declare-fun e!60039 () Bool)

(assert (=> b!92092 (= e!60035 e!60039)))

(assert (=> b!92092 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun res!46845 () Bool)

(assert (=> b!92092 (= res!46845 (contains!769 lt!45096 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!92092 (=> (not res!46845) (not e!60039))))

(declare-fun b!92093 () Bool)

(declare-fun lt!45095 () Unit!2702)

(declare-fun lt!45093 () Unit!2702)

(assert (=> b!92093 (= lt!45095 lt!45093)))

(declare-fun lt!45091 () (_ BitVec 64))

(declare-fun lt!45094 () (_ BitVec 64))

(declare-fun lt!45092 () ListLongMap!1471)

(declare-fun lt!45090 () V!3089)

(assert (=> b!92093 (not (contains!769 (+!120 lt!45092 (tuple2!2245 lt!45091 lt!45090)) lt!45094))))

(assert (=> b!92093 (= lt!45093 (addStillNotContains!38 lt!45092 lt!45091 lt!45090 lt!45094))))

(assert (=> b!92093 (= lt!45094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!92093 (= lt!45090 (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!92093 (= lt!45091 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!92093 (= lt!45092 call!9058)))

(assert (=> b!92093 (= e!60036 (+!120 call!9058 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!92094 () Bool)

(assert (=> b!92094 (= e!60041 (ListLongMap!1472 Nil!1534))))

(declare-fun b!92095 () Bool)

(assert (=> b!92095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!92095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!92095 (= e!60039 (= (apply!87 lt!45096 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!24255 c!15326) b!92094))

(assert (= (and d!24255 (not c!15326)) b!92087))

(assert (= (and b!92087 c!15327) b!92093))

(assert (= (and b!92087 (not c!15327)) b!92090))

(assert (= (or b!92093 b!92090) bm!9055))

(assert (= (and d!24255 res!46846) b!92084))

(assert (= (and b!92084 res!46844) b!92091))

(assert (= (and b!92091 res!46843) b!92089))

(assert (= (and b!92091 c!15325) b!92092))

(assert (= (and b!92091 (not c!15325)) b!92085))

(assert (= (and b!92092 res!46845) b!92095))

(assert (= (and b!92085 c!15328) b!92086))

(assert (= (and b!92085 (not c!15328)) b!92088))

(declare-fun b_lambda!4059 () Bool)

(assert (=> (not b_lambda!4059) (not b!92093)))

(assert (=> b!92093 t!5360))

(declare-fun b_and!5577 () Bool)

(assert (= b_and!5573 (and (=> t!5360 result!3073) b_and!5577)))

(assert (=> b!92093 t!5362))

(declare-fun b_and!5579 () Bool)

(assert (= b_and!5575 (and (=> t!5362 result!3077) b_and!5579)))

(declare-fun b_lambda!4061 () Bool)

(assert (=> (not b_lambda!4061) (not b!92095)))

(assert (=> b!92095 t!5360))

(declare-fun b_and!5581 () Bool)

(assert (= b_and!5577 (and (=> t!5360 result!3073) b_and!5581)))

(assert (=> b!92095 t!5362))

(declare-fun b_and!5583 () Bool)

(assert (= b_and!5579 (and (=> t!5362 result!3077) b_and!5583)))

(declare-fun m!98945 () Bool)

(assert (=> b!92088 m!98945))

(declare-fun m!98947 () Bool)

(assert (=> b!92086 m!98947))

(assert (=> b!92089 m!98853))

(assert (=> b!92089 m!98853))

(declare-fun m!98949 () Bool)

(assert (=> b!92089 m!98949))

(declare-fun m!98951 () Bool)

(assert (=> d!24255 m!98951))

(assert (=> d!24255 m!98291))

(assert (=> bm!9055 m!98947))

(assert (=> b!92087 m!98853))

(assert (=> b!92087 m!98853))

(assert (=> b!92087 m!98949))

(declare-fun m!98953 () Bool)

(assert (=> b!92084 m!98953))

(assert (=> b!92092 m!98853))

(assert (=> b!92092 m!98853))

(declare-fun m!98955 () Bool)

(assert (=> b!92092 m!98955))

(assert (=> b!92095 m!98853))

(assert (=> b!92095 m!98853))

(declare-fun m!98957 () Bool)

(assert (=> b!92095 m!98957))

(declare-fun m!98959 () Bool)

(assert (=> b!92095 m!98959))

(assert (=> b!92095 m!98959))

(assert (=> b!92095 m!98063))

(declare-fun m!98961 () Bool)

(assert (=> b!92095 m!98961))

(assert (=> b!92095 m!98063))

(assert (=> b!92093 m!98853))

(declare-fun m!98963 () Bool)

(assert (=> b!92093 m!98963))

(declare-fun m!98965 () Bool)

(assert (=> b!92093 m!98965))

(declare-fun m!98967 () Bool)

(assert (=> b!92093 m!98967))

(assert (=> b!92093 m!98959))

(assert (=> b!92093 m!98959))

(assert (=> b!92093 m!98063))

(assert (=> b!92093 m!98961))

(assert (=> b!92093 m!98063))

(declare-fun m!98969 () Bool)

(assert (=> b!92093 m!98969))

(assert (=> b!92093 m!98963))

(assert (=> bm!8912 d!24255))

(declare-fun d!24257 () Bool)

(declare-fun lt!45097 () Bool)

(assert (=> d!24257 (= lt!45097 (select (content!96 (toList!751 lt!44700)) lt!44540))))

(declare-fun e!60043 () Bool)

(assert (=> d!24257 (= lt!45097 e!60043)))

(declare-fun res!46847 () Bool)

(assert (=> d!24257 (=> (not res!46847) (not e!60043))))

(assert (=> d!24257 (= res!46847 ((_ is Cons!1533) (toList!751 lt!44700)))))

(assert (=> d!24257 (= (contains!771 (toList!751 lt!44700) lt!44540) lt!45097)))

(declare-fun b!92096 () Bool)

(declare-fun e!60042 () Bool)

(assert (=> b!92096 (= e!60043 e!60042)))

(declare-fun res!46848 () Bool)

(assert (=> b!92096 (=> res!46848 e!60042)))

(assert (=> b!92096 (= res!46848 (= (h!2125 (toList!751 lt!44700)) lt!44540))))

(declare-fun b!92097 () Bool)

(assert (=> b!92097 (= e!60042 (contains!771 (t!5363 (toList!751 lt!44700)) lt!44540))))

(assert (= (and d!24257 res!46847) b!92096))

(assert (= (and b!92096 (not res!46848)) b!92097))

(declare-fun m!98971 () Bool)

(assert (=> d!24257 m!98971))

(declare-fun m!98973 () Bool)

(assert (=> d!24257 m!98973))

(declare-fun m!98975 () Bool)

(assert (=> b!92097 m!98975))

(assert (=> b!91572 d!24257))

(declare-fun d!24259 () Bool)

(declare-fun e!60044 () Bool)

(assert (=> d!24259 e!60044))

(declare-fun res!46849 () Bool)

(assert (=> d!24259 (=> res!46849 e!60044)))

(declare-fun lt!45099 () Bool)

(assert (=> d!24259 (= res!46849 (not lt!45099))))

(declare-fun lt!45100 () Bool)

(assert (=> d!24259 (= lt!45099 lt!45100)))

(declare-fun lt!45101 () Unit!2702)

(declare-fun e!60045 () Unit!2702)

(assert (=> d!24259 (= lt!45101 e!60045)))

(declare-fun c!15329 () Bool)

(assert (=> d!24259 (= c!15329 lt!45100)))

(assert (=> d!24259 (= lt!45100 (containsKey!149 (toList!751 lt!44784) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24259 (= (contains!769 lt!44784 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45099)))

(declare-fun b!92098 () Bool)

(declare-fun lt!45098 () Unit!2702)

(assert (=> b!92098 (= e!60045 lt!45098)))

(assert (=> b!92098 (= lt!45098 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44784) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92098 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92099 () Bool)

(declare-fun Unit!2725 () Unit!2702)

(assert (=> b!92099 (= e!60045 Unit!2725)))

(declare-fun b!92100 () Bool)

(assert (=> b!92100 (= e!60044 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24259 c!15329) b!92098))

(assert (= (and d!24259 (not c!15329)) b!92099))

(assert (= (and d!24259 (not res!46849)) b!92100))

(declare-fun m!98977 () Bool)

(assert (=> d!24259 m!98977))

(declare-fun m!98979 () Bool)

(assert (=> b!92098 m!98979))

(declare-fun m!98981 () Bool)

(assert (=> b!92098 m!98981))

(assert (=> b!92098 m!98981))

(declare-fun m!98983 () Bool)

(assert (=> b!92098 m!98983))

(assert (=> b!92100 m!98981))

(assert (=> b!92100 m!98981))

(assert (=> b!92100 m!98983))

(assert (=> bm!8936 d!24259))

(declare-fun b!92101 () Bool)

(declare-fun e!60058 () Bool)

(declare-fun e!60047 () Bool)

(assert (=> b!92101 (= e!60058 e!60047)))

(declare-fun res!46851 () Bool)

(assert (=> b!92101 (=> (not res!46851) (not e!60047))))

(declare-fun lt!45107 () ListLongMap!1471)

(assert (=> b!92101 (= res!46851 (contains!769 lt!45107 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92102 () Bool)

(declare-fun res!46854 () Bool)

(declare-fun e!60055 () Bool)

(assert (=> b!92102 (=> (not res!46854) (not e!60055))))

(declare-fun e!60052 () Bool)

(assert (=> b!92102 (= res!46854 e!60052)))

(declare-fun c!15335 () Bool)

(assert (=> b!92102 (= c!15335 (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!92103 () Bool)

(declare-fun call!9062 () Bool)

(assert (=> b!92103 (= e!60052 (not call!9062))))

(declare-fun b!92104 () Bool)

(declare-fun res!46853 () Bool)

(assert (=> b!92104 (=> (not res!46853) (not e!60055))))

(assert (=> b!92104 (= res!46853 e!60058)))

(declare-fun res!46852 () Bool)

(assert (=> b!92104 (=> res!46852 e!60058)))

(declare-fun e!60051 () Bool)

(assert (=> b!92104 (= res!46852 (not e!60051))))

(declare-fun res!46856 () Bool)

(assert (=> b!92104 (=> (not res!46856) (not e!60051))))

(assert (=> b!92104 (= res!46856 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92105 () Bool)

(declare-fun e!60057 () Unit!2702)

(declare-fun lt!45108 () Unit!2702)

(assert (=> b!92105 (= e!60057 lt!45108)))

(declare-fun lt!45122 () ListLongMap!1471)

(assert (=> b!92105 (= lt!45122 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45102 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45106 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45106 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45104 () Unit!2702)

(assert (=> b!92105 (= lt!45104 (addStillContains!63 lt!45122 lt!45102 (zeroValue!2293 newMap!16) lt!45106))))

(assert (=> b!92105 (contains!769 (+!120 lt!45122 (tuple2!2245 lt!45102 (zeroValue!2293 newMap!16))) lt!45106)))

(declare-fun lt!45115 () Unit!2702)

(assert (=> b!92105 (= lt!45115 lt!45104)))

(declare-fun lt!45118 () ListLongMap!1471)

(assert (=> b!92105 (= lt!45118 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45120 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45110 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45110 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45123 () Unit!2702)

(assert (=> b!92105 (= lt!45123 (addApplyDifferent!63 lt!45118 lt!45120 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) lt!45110))))

(assert (=> b!92105 (= (apply!87 (+!120 lt!45118 (tuple2!2245 lt!45120 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)))) lt!45110) (apply!87 lt!45118 lt!45110))))

(declare-fun lt!45116 () Unit!2702)

(assert (=> b!92105 (= lt!45116 lt!45123)))

(declare-fun lt!45119 () ListLongMap!1471)

(assert (=> b!92105 (= lt!45119 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45111 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45103 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45103 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45105 () Unit!2702)

(assert (=> b!92105 (= lt!45105 (addApplyDifferent!63 lt!45119 lt!45111 (zeroValue!2293 newMap!16) lt!45103))))

(assert (=> b!92105 (= (apply!87 (+!120 lt!45119 (tuple2!2245 lt!45111 (zeroValue!2293 newMap!16))) lt!45103) (apply!87 lt!45119 lt!45103))))

(declare-fun lt!45112 () Unit!2702)

(assert (=> b!92105 (= lt!45112 lt!45105)))

(declare-fun lt!45113 () ListLongMap!1471)

(assert (=> b!92105 (= lt!45113 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45109 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45117 () (_ BitVec 64))

(assert (=> b!92105 (= lt!45117 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92105 (= lt!45108 (addApplyDifferent!63 lt!45113 lt!45109 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) lt!45117))))

(assert (=> b!92105 (= (apply!87 (+!120 lt!45113 (tuple2!2245 lt!45109 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)))) lt!45117) (apply!87 lt!45113 lt!45117))))

(declare-fun b!92106 () Bool)

(declare-fun e!60054 () Bool)

(assert (=> b!92106 (= e!60054 (= (apply!87 lt!45107 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 newMap!16)))))

(declare-fun d!24261 () Bool)

(assert (=> d!24261 e!60055))

(declare-fun res!46855 () Bool)

(assert (=> d!24261 (=> (not res!46855) (not e!60055))))

(assert (=> d!24261 (= res!46855 (or (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))))

(declare-fun lt!45121 () ListLongMap!1471)

(assert (=> d!24261 (= lt!45107 lt!45121)))

(declare-fun lt!45114 () Unit!2702)

(assert (=> d!24261 (= lt!45114 e!60057)))

(declare-fun c!15334 () Bool)

(declare-fun e!60046 () Bool)

(assert (=> d!24261 (= c!15334 e!60046)))

(declare-fun res!46858 () Bool)

(assert (=> d!24261 (=> (not res!46858) (not e!60046))))

(assert (=> d!24261 (= res!46858 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun e!60048 () ListLongMap!1471)

(assert (=> d!24261 (= lt!45121 e!60048)))

(declare-fun c!15331 () Bool)

(assert (=> d!24261 (= c!15331 (and (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24261 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24261 (= (getCurrentListMap!441 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!45107)))

(declare-fun b!92107 () Bool)

(declare-fun e!60056 () ListLongMap!1471)

(declare-fun call!9061 () ListLongMap!1471)

(assert (=> b!92107 (= e!60056 call!9061)))

(declare-fun bm!9056 () Bool)

(declare-fun call!9064 () ListLongMap!1471)

(declare-fun call!9059 () ListLongMap!1471)

(assert (=> bm!9056 (= call!9064 call!9059)))

(declare-fun b!92108 () Bool)

(declare-fun e!60049 () Bool)

(assert (=> b!92108 (= e!60055 e!60049)))

(declare-fun c!15332 () Bool)

(assert (=> b!92108 (= c!15332 (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92109 () Bool)

(assert (=> b!92109 (= e!60046 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92110 () Bool)

(declare-fun e!60050 () Bool)

(assert (=> b!92110 (= e!60050 (= (apply!87 lt!45107 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16))))))

(declare-fun b!92111 () Bool)

(declare-fun c!15330 () Bool)

(assert (=> b!92111 (= c!15330 (and (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60053 () ListLongMap!1471)

(assert (=> b!92111 (= e!60053 e!60056)))

(declare-fun b!92112 () Bool)

(assert (=> b!92112 (= e!60049 e!60050)))

(declare-fun res!46850 () Bool)

(declare-fun call!9065 () Bool)

(assert (=> b!92112 (= res!46850 call!9065)))

(assert (=> b!92112 (=> (not res!46850) (not e!60050))))

(declare-fun bm!9057 () Bool)

(assert (=> bm!9057 (= call!9062 (contains!769 lt!45107 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92113 () Bool)

(assert (=> b!92113 (= e!60048 e!60053)))

(declare-fun c!15333 () Bool)

(assert (=> b!92113 (= c!15333 (and (not (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9058 () Bool)

(assert (=> bm!9058 (= call!9065 (contains!769 lt!45107 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9059 () Bool)

(declare-fun call!9063 () ListLongMap!1471)

(assert (=> bm!9059 (= call!9063 call!9064)))

(declare-fun bm!9060 () Bool)

(declare-fun call!9060 () ListLongMap!1471)

(assert (=> bm!9060 (= call!9060 (+!120 (ite c!15331 call!9059 (ite c!15333 call!9064 call!9063)) (ite (or c!15331 c!15333) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 newMap!16)) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16))))))))

(declare-fun b!92114 () Bool)

(assert (=> b!92114 (= e!60056 call!9063)))

(declare-fun b!92115 () Bool)

(assert (=> b!92115 (= e!60049 (not call!9065))))

(declare-fun bm!9061 () Bool)

(assert (=> bm!9061 (= call!9059 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))) (mask!6465 newMap!16) (ite c!15248 (ite c!15252 (extraKeys!2236 newMap!16) lt!44875) (extraKeys!2236 newMap!16)) (zeroValue!2293 newMap!16) (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!92116 () Bool)

(assert (=> b!92116 (= e!60053 call!9061)))

(declare-fun b!92117 () Bool)

(assert (=> b!92117 (= e!60048 (+!120 call!9060 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!15248 (ite c!15252 (minValue!2293 newMap!16) lt!44529) (minValue!2293 newMap!16)))))))

(declare-fun b!92118 () Bool)

(assert (=> b!92118 (= e!60051 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9062 () Bool)

(assert (=> bm!9062 (= call!9061 call!9060)))

(declare-fun b!92119 () Bool)

(assert (=> b!92119 (= e!60052 e!60054)))

(declare-fun res!46857 () Bool)

(assert (=> b!92119 (= res!46857 call!9062)))

(assert (=> b!92119 (=> (not res!46857) (not e!60054))))

(declare-fun b!92120 () Bool)

(declare-fun Unit!2726 () Unit!2702)

(assert (=> b!92120 (= e!60057 Unit!2726)))

(declare-fun b!92121 () Bool)

(assert (=> b!92121 (= e!60047 (= (apply!87 lt!45107 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)) (get!1247 (select (arr!1959 (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!358 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2206 (ite c!15248 (_values!2388 newMap!16) (array!4120 (store (arr!1959 (_values!2388 newMap!16)) (index!3109 lt!44881) (ValueCellFull!947 lt!44529)) (size!2206 (_values!2388 newMap!16)))))))))

(assert (=> b!92121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (= (and d!24261 c!15331) b!92117))

(assert (= (and d!24261 (not c!15331)) b!92113))

(assert (= (and b!92113 c!15333) b!92116))

(assert (= (and b!92113 (not c!15333)) b!92111))

(assert (= (and b!92111 c!15330) b!92107))

(assert (= (and b!92111 (not c!15330)) b!92114))

(assert (= (or b!92107 b!92114) bm!9059))

(assert (= (or b!92116 bm!9059) bm!9056))

(assert (= (or b!92116 b!92107) bm!9062))

(assert (= (or b!92117 bm!9056) bm!9061))

(assert (= (or b!92117 bm!9062) bm!9060))

(assert (= (and d!24261 res!46858) b!92109))

(assert (= (and d!24261 c!15334) b!92105))

(assert (= (and d!24261 (not c!15334)) b!92120))

(assert (= (and d!24261 res!46855) b!92104))

(assert (= (and b!92104 res!46856) b!92118))

(assert (= (and b!92104 (not res!46852)) b!92101))

(assert (= (and b!92101 res!46851) b!92121))

(assert (= (and b!92104 res!46853) b!92102))

(assert (= (and b!92102 c!15335) b!92119))

(assert (= (and b!92102 (not c!15335)) b!92103))

(assert (= (and b!92119 res!46857) b!92106))

(assert (= (or b!92119 b!92103) bm!9057))

(assert (= (and b!92102 res!46854) b!92108))

(assert (= (and b!92108 c!15332) b!92112))

(assert (= (and b!92108 (not c!15332)) b!92115))

(assert (= (and b!92112 res!46850) b!92110))

(assert (= (or b!92112 b!92115) bm!9058))

(declare-fun b_lambda!4063 () Bool)

(assert (=> (not b_lambda!4063) (not b!92121)))

(assert (=> b!92121 t!5376))

(declare-fun b_and!5585 () Bool)

(assert (= b_and!5581 (and (=> t!5376 result!3093) b_and!5585)))

(assert (=> b!92121 t!5378))

(declare-fun b_and!5587 () Bool)

(assert (= b_and!5583 (and (=> t!5378 result!3095) b_and!5587)))

(assert (=> b!92109 m!98741))

(assert (=> b!92109 m!98741))

(assert (=> b!92109 m!98743))

(declare-fun m!98985 () Bool)

(assert (=> bm!9057 m!98985))

(declare-fun m!98987 () Bool)

(assert (=> b!92105 m!98987))

(declare-fun m!98989 () Bool)

(assert (=> b!92105 m!98989))

(declare-fun m!98991 () Bool)

(assert (=> b!92105 m!98991))

(declare-fun m!98993 () Bool)

(assert (=> b!92105 m!98993))

(assert (=> b!92105 m!98741))

(declare-fun m!98995 () Bool)

(assert (=> b!92105 m!98995))

(assert (=> b!92105 m!98991))

(declare-fun m!98997 () Bool)

(assert (=> b!92105 m!98997))

(declare-fun m!98999 () Bool)

(assert (=> b!92105 m!98999))

(declare-fun m!99001 () Bool)

(assert (=> b!92105 m!99001))

(assert (=> b!92105 m!98995))

(declare-fun m!99003 () Bool)

(assert (=> b!92105 m!99003))

(declare-fun m!99005 () Bool)

(assert (=> b!92105 m!99005))

(declare-fun m!99007 () Bool)

(assert (=> b!92105 m!99007))

(assert (=> b!92105 m!98987))

(declare-fun m!99009 () Bool)

(assert (=> b!92105 m!99009))

(declare-fun m!99011 () Bool)

(assert (=> b!92105 m!99011))

(declare-fun m!99013 () Bool)

(assert (=> b!92105 m!99013))

(declare-fun m!99015 () Bool)

(assert (=> b!92105 m!99015))

(assert (=> b!92105 m!98997))

(declare-fun m!99017 () Bool)

(assert (=> b!92105 m!99017))

(assert (=> d!24261 m!98733))

(assert (=> b!92121 m!98779))

(declare-fun m!99019 () Bool)

(assert (=> b!92121 m!99019))

(assert (=> b!92121 m!98741))

(assert (=> b!92121 m!98741))

(declare-fun m!99021 () Bool)

(assert (=> b!92121 m!99021))

(assert (=> b!92121 m!99019))

(assert (=> b!92121 m!98779))

(declare-fun m!99023 () Bool)

(assert (=> b!92121 m!99023))

(declare-fun m!99025 () Bool)

(assert (=> bm!9058 m!99025))

(assert (=> bm!9061 m!99017))

(assert (=> b!92118 m!98741))

(assert (=> b!92118 m!98741))

(assert (=> b!92118 m!98743))

(declare-fun m!99027 () Bool)

(assert (=> b!92117 m!99027))

(declare-fun m!99029 () Bool)

(assert (=> b!92110 m!99029))

(declare-fun m!99031 () Bool)

(assert (=> b!92106 m!99031))

(declare-fun m!99033 () Bool)

(assert (=> bm!9060 m!99033))

(assert (=> b!92101 m!98741))

(assert (=> b!92101 m!98741))

(declare-fun m!99035 () Bool)

(assert (=> b!92101 m!99035))

(assert (=> bm!9011 d!24261))

(declare-fun d!24263 () Bool)

(declare-fun e!60059 () Bool)

(assert (=> d!24263 e!60059))

(declare-fun res!46859 () Bool)

(assert (=> d!24263 (=> res!46859 e!60059)))

(declare-fun lt!45125 () Bool)

(assert (=> d!24263 (= res!46859 (not lt!45125))))

(declare-fun lt!45126 () Bool)

(assert (=> d!24263 (= lt!45125 lt!45126)))

(declare-fun lt!45127 () Unit!2702)

(declare-fun e!60060 () Unit!2702)

(assert (=> d!24263 (= lt!45127 e!60060)))

(declare-fun c!15336 () Bool)

(assert (=> d!24263 (= c!15336 lt!45126)))

(assert (=> d!24263 (= lt!45126 (containsKey!149 (toList!751 lt!44758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24263 (= (contains!769 lt!44758 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45125)))

(declare-fun b!92122 () Bool)

(declare-fun lt!45124 () Unit!2702)

(assert (=> b!92122 (= e!60060 lt!45124)))

(assert (=> b!92122 (= lt!45124 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92122 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92123 () Bool)

(declare-fun Unit!2727 () Unit!2702)

(assert (=> b!92123 (= e!60060 Unit!2727)))

(declare-fun b!92124 () Bool)

(assert (=> b!92124 (= e!60059 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24263 c!15336) b!92122))

(assert (= (and d!24263 (not c!15336)) b!92123))

(assert (= (and d!24263 (not res!46859)) b!92124))

(declare-fun m!99037 () Bool)

(assert (=> d!24263 m!99037))

(declare-fun m!99039 () Bool)

(assert (=> b!92122 m!99039))

(assert (=> b!92122 m!98905))

(assert (=> b!92122 m!98905))

(declare-fun m!99041 () Bool)

(assert (=> b!92122 m!99041))

(assert (=> b!92124 m!98905))

(assert (=> b!92124 m!98905))

(assert (=> b!92124 m!99041))

(assert (=> bm!8928 d!24263))

(declare-fun b!92136 () Bool)

(declare-fun e!60063 () Bool)

(assert (=> b!92136 (= e!60063 (and (bvsge (extraKeys!2236 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2236 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!450 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!92135 () Bool)

(declare-fun res!46869 () Bool)

(assert (=> b!92135 (=> (not res!46869) (not e!60063))))

(declare-fun size!2211 (LongMapFixedSize!802) (_ BitVec 32))

(assert (=> b!92135 (= res!46869 (= (size!2211 newMap!16) (bvadd (_size!450 newMap!16) (bvsdiv (bvadd (extraKeys!2236 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!92134 () Bool)

(declare-fun res!46871 () Bool)

(assert (=> b!92134 (=> (not res!46871) (not e!60063))))

(assert (=> b!92134 (= res!46871 (bvsge (size!2211 newMap!16) (_size!450 newMap!16)))))

(declare-fun d!24265 () Bool)

(declare-fun res!46870 () Bool)

(assert (=> d!24265 (=> (not res!46870) (not e!60063))))

(assert (=> d!24265 (= res!46870 (validMask!0 (mask!6465 newMap!16)))))

(assert (=> d!24265 (= (simpleValid!63 newMap!16) e!60063)))

(declare-fun b!92133 () Bool)

(declare-fun res!46868 () Bool)

(assert (=> b!92133 (=> (not res!46868) (not e!60063))))

(assert (=> b!92133 (= res!46868 (and (= (size!2206 (_values!2388 newMap!16)) (bvadd (mask!6465 newMap!16) #b00000000000000000000000000000001)) (= (size!2205 (_keys!4085 newMap!16)) (size!2206 (_values!2388 newMap!16))) (bvsge (_size!450 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!450 newMap!16) (bvadd (mask!6465 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!24265 res!46870) b!92133))

(assert (= (and b!92133 res!46868) b!92134))

(assert (= (and b!92134 res!46871) b!92135))

(assert (= (and b!92135 res!46869) b!92136))

(declare-fun m!99043 () Bool)

(assert (=> b!92135 m!99043))

(assert (=> b!92134 m!99043))

(assert (=> d!24265 m!98733))

(assert (=> d!24137 d!24265))

(assert (=> b!91821 d!24177))

(declare-fun d!24267 () Bool)

(declare-fun e!60064 () Bool)

(assert (=> d!24267 e!60064))

(declare-fun res!46872 () Bool)

(assert (=> d!24267 (=> (not res!46872) (not e!60064))))

(declare-fun lt!45128 () ListLongMap!1471)

(assert (=> d!24267 (= res!46872 (contains!769 lt!45128 (_1!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun lt!45131 () List!1537)

(assert (=> d!24267 (= lt!45128 (ListLongMap!1472 lt!45131))))

(declare-fun lt!45129 () Unit!2702)

(declare-fun lt!45130 () Unit!2702)

(assert (=> d!24267 (= lt!45129 lt!45130)))

(assert (=> d!24267 (= (getValueByKey!146 lt!45131 (_1!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))) (Some!151 (_2!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24267 (= lt!45130 (lemmaContainsTupThenGetReturnValue!63 lt!45131 (_1!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_2!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24267 (= lt!45131 (insertStrictlySorted!66 (toList!751 (ite c!15197 call!8930 (ite c!15199 call!8935 call!8934))) (_1!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_2!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24267 (= (+!120 (ite c!15197 call!8930 (ite c!15199 call!8935 call!8934)) (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!45128)))

(declare-fun b!92137 () Bool)

(declare-fun res!46873 () Bool)

(assert (=> b!92137 (=> (not res!46873) (not e!60064))))

(assert (=> b!92137 (= res!46873 (= (getValueByKey!146 (toList!751 lt!45128) (_1!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))) (Some!151 (_2!1133 (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))))

(declare-fun b!92138 () Bool)

(assert (=> b!92138 (= e!60064 (contains!771 (toList!751 lt!45128) (ite (or c!15197 c!15199) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (= (and d!24267 res!46872) b!92137))

(assert (= (and b!92137 res!46873) b!92138))

(declare-fun m!99045 () Bool)

(assert (=> d!24267 m!99045))

(declare-fun m!99047 () Bool)

(assert (=> d!24267 m!99047))

(declare-fun m!99049 () Bool)

(assert (=> d!24267 m!99049))

(declare-fun m!99051 () Bool)

(assert (=> d!24267 m!99051))

(declare-fun m!99053 () Bool)

(assert (=> b!92137 m!99053))

(declare-fun m!99055 () Bool)

(assert (=> b!92138 m!99055))

(assert (=> bm!8931 d!24267))

(declare-fun d!24269 () Bool)

(declare-fun e!60065 () Bool)

(assert (=> d!24269 e!60065))

(declare-fun res!46874 () Bool)

(assert (=> d!24269 (=> res!46874 e!60065)))

(declare-fun lt!45133 () Bool)

(assert (=> d!24269 (= res!46874 (not lt!45133))))

(declare-fun lt!45134 () Bool)

(assert (=> d!24269 (= lt!45133 lt!45134)))

(declare-fun lt!45135 () Unit!2702)

(declare-fun e!60066 () Unit!2702)

(assert (=> d!24269 (= lt!45135 e!60066)))

(declare-fun c!15337 () Bool)

(assert (=> d!24269 (= c!15337 lt!45134)))

(assert (=> d!24269 (= lt!45134 (containsKey!149 (toList!751 call!9015) (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881)))))))

(assert (=> d!24269 (= (contains!769 call!9015 (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881)))) lt!45133)))

(declare-fun b!92139 () Bool)

(declare-fun lt!45132 () Unit!2702)

(assert (=> b!92139 (= e!60066 lt!45132)))

(assert (=> b!92139 (= lt!45132 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 call!9015) (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881)))))))

(assert (=> b!92139 (isDefined!98 (getValueByKey!146 (toList!751 call!9015) (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881)))))))

(declare-fun b!92140 () Bool)

(declare-fun Unit!2728 () Unit!2702)

(assert (=> b!92140 (= e!60066 Unit!2728)))

(declare-fun b!92141 () Bool)

(assert (=> b!92141 (= e!60065 (isDefined!98 (getValueByKey!146 (toList!751 call!9015) (ite c!15242 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!44881))))))))

(assert (= (and d!24269 c!15337) b!92139))

(assert (= (and d!24269 (not c!15337)) b!92140))

(assert (= (and d!24269 (not res!46874)) b!92141))

(declare-fun m!99057 () Bool)

(assert (=> d!24269 m!99057))

(declare-fun m!99059 () Bool)

(assert (=> b!92139 m!99059))

(declare-fun m!99061 () Bool)

(assert (=> b!92139 m!99061))

(assert (=> b!92139 m!99061))

(declare-fun m!99063 () Bool)

(assert (=> b!92139 m!99063))

(assert (=> b!92141 m!99061))

(assert (=> b!92141 m!99061))

(assert (=> b!92141 m!99063))

(assert (=> bm!9006 d!24269))

(declare-fun d!24271 () Bool)

(declare-fun e!60067 () Bool)

(assert (=> d!24271 e!60067))

(declare-fun res!46875 () Bool)

(assert (=> d!24271 (=> (not res!46875) (not e!60067))))

(declare-fun lt!45136 () ListLongMap!1471)

(assert (=> d!24271 (= res!46875 (contains!769 lt!45136 (_1!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun lt!45139 () List!1537)

(assert (=> d!24271 (= lt!45136 (ListLongMap!1472 lt!45139))))

(declare-fun lt!45137 () Unit!2702)

(declare-fun lt!45138 () Unit!2702)

(assert (=> d!24271 (= lt!45137 lt!45138)))

(assert (=> d!24271 (= (getValueByKey!146 lt!45139 (_1!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))) (Some!151 (_2!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(assert (=> d!24271 (= lt!45138 (lemmaContainsTupThenGetReturnValue!63 lt!45139 (_1!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (_2!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(assert (=> d!24271 (= lt!45139 (insertStrictlySorted!66 (toList!751 e!59861) (_1!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (_2!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(assert (=> d!24271 (= (+!120 e!59861 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) lt!45136)))

(declare-fun b!92142 () Bool)

(declare-fun res!46876 () Bool)

(assert (=> b!92142 (=> (not res!46876) (not e!60067))))

(assert (=> b!92142 (= res!46876 (= (getValueByKey!146 (toList!751 lt!45136) (_1!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))) (Some!151 (_2!1133 (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))))

(declare-fun b!92143 () Bool)

(assert (=> b!92143 (= e!60067 (contains!771 (toList!751 lt!45136) (ite c!15248 (ite c!15252 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (= (and d!24271 res!46875) b!92142))

(assert (= (and b!92142 res!46876) b!92143))

(declare-fun m!99065 () Bool)

(assert (=> d!24271 m!99065))

(declare-fun m!99067 () Bool)

(assert (=> d!24271 m!99067))

(declare-fun m!99069 () Bool)

(assert (=> d!24271 m!99069))

(declare-fun m!99071 () Bool)

(assert (=> d!24271 m!99071))

(declare-fun m!99073 () Bool)

(assert (=> b!92142 m!99073))

(declare-fun m!99075 () Bool)

(assert (=> b!92143 m!99075))

(assert (=> bm!8997 d!24271))

(declare-fun d!24273 () Bool)

(declare-fun lt!45142 () Bool)

(declare-fun content!97 (List!1538) (InoxSet (_ BitVec 64)))

(assert (=> d!24273 (= lt!45142 (select (content!97 Nil!1535) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun e!60072 () Bool)

(assert (=> d!24273 (= lt!45142 e!60072)))

(declare-fun res!46881 () Bool)

(assert (=> d!24273 (=> (not res!46881) (not e!60072))))

(assert (=> d!24273 (= res!46881 ((_ is Cons!1534) Nil!1535))))

(assert (=> d!24273 (= (contains!772 Nil!1535 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!45142)))

(declare-fun b!92148 () Bool)

(declare-fun e!60073 () Bool)

(assert (=> b!92148 (= e!60072 e!60073)))

(declare-fun res!46882 () Bool)

(assert (=> b!92148 (=> res!46882 e!60073)))

(assert (=> b!92148 (= res!46882 (= (h!2126 Nil!1535) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92149 () Bool)

(assert (=> b!92149 (= e!60073 (contains!772 (t!5364 Nil!1535) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (= (and d!24273 res!46881) b!92148))

(assert (= (and b!92148 (not res!46882)) b!92149))

(declare-fun m!99077 () Bool)

(assert (=> d!24273 m!99077))

(assert (=> d!24273 m!98059))

(declare-fun m!99079 () Bool)

(assert (=> d!24273 m!99079))

(assert (=> b!92149 m!98059))

(declare-fun m!99081 () Bool)

(assert (=> b!92149 m!99081))

(assert (=> b!91824 d!24273))

(declare-fun d!24275 () Bool)

(declare-fun e!60074 () Bool)

(assert (=> d!24275 e!60074))

(declare-fun res!46883 () Bool)

(assert (=> d!24275 (=> res!46883 e!60074)))

(declare-fun lt!45144 () Bool)

(assert (=> d!24275 (= res!46883 (not lt!45144))))

(declare-fun lt!45145 () Bool)

(assert (=> d!24275 (= lt!45144 lt!45145)))

(declare-fun lt!45146 () Unit!2702)

(declare-fun e!60075 () Unit!2702)

(assert (=> d!24275 (= lt!45146 e!60075)))

(declare-fun c!15338 () Bool)

(assert (=> d!24275 (= c!15338 lt!45145)))

(assert (=> d!24275 (= lt!45145 (containsKey!149 (toList!751 lt!44692) (_1!1133 lt!44534)))))

(assert (=> d!24275 (= (contains!769 lt!44692 (_1!1133 lt!44534)) lt!45144)))

(declare-fun b!92150 () Bool)

(declare-fun lt!45143 () Unit!2702)

(assert (=> b!92150 (= e!60075 lt!45143)))

(assert (=> b!92150 (= lt!45143 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44692) (_1!1133 lt!44534)))))

(assert (=> b!92150 (isDefined!98 (getValueByKey!146 (toList!751 lt!44692) (_1!1133 lt!44534)))))

(declare-fun b!92151 () Bool)

(declare-fun Unit!2729 () Unit!2702)

(assert (=> b!92151 (= e!60075 Unit!2729)))

(declare-fun b!92152 () Bool)

(assert (=> b!92152 (= e!60074 (isDefined!98 (getValueByKey!146 (toList!751 lt!44692) (_1!1133 lt!44534))))))

(assert (= (and d!24275 c!15338) b!92150))

(assert (= (and d!24275 (not c!15338)) b!92151))

(assert (= (and d!24275 (not res!46883)) b!92152))

(declare-fun m!99083 () Bool)

(assert (=> d!24275 m!99083))

(declare-fun m!99085 () Bool)

(assert (=> b!92150 m!99085))

(assert (=> b!92150 m!98343))

(assert (=> b!92150 m!98343))

(declare-fun m!99087 () Bool)

(assert (=> b!92150 m!99087))

(assert (=> b!92152 m!98343))

(assert (=> b!92152 m!98343))

(assert (=> b!92152 m!99087))

(assert (=> d!24113 d!24275))

(declare-fun b!92155 () Bool)

(declare-fun e!60077 () Option!152)

(assert (=> b!92155 (= e!60077 (getValueByKey!146 (t!5363 lt!44695) (_1!1133 lt!44534)))))

(declare-fun b!92156 () Bool)

(assert (=> b!92156 (= e!60077 None!150)))

(declare-fun d!24277 () Bool)

(declare-fun c!15339 () Bool)

(assert (=> d!24277 (= c!15339 (and ((_ is Cons!1533) lt!44695) (= (_1!1133 (h!2125 lt!44695)) (_1!1133 lt!44534))))))

(declare-fun e!60076 () Option!152)

(assert (=> d!24277 (= (getValueByKey!146 lt!44695 (_1!1133 lt!44534)) e!60076)))

(declare-fun b!92154 () Bool)

(assert (=> b!92154 (= e!60076 e!60077)))

(declare-fun c!15340 () Bool)

(assert (=> b!92154 (= c!15340 (and ((_ is Cons!1533) lt!44695) (not (= (_1!1133 (h!2125 lt!44695)) (_1!1133 lt!44534)))))))

(declare-fun b!92153 () Bool)

(assert (=> b!92153 (= e!60076 (Some!151 (_2!1133 (h!2125 lt!44695))))))

(assert (= (and d!24277 c!15339) b!92153))

(assert (= (and d!24277 (not c!15339)) b!92154))

(assert (= (and b!92154 c!15340) b!92155))

(assert (= (and b!92154 (not c!15340)) b!92156))

(declare-fun m!99089 () Bool)

(assert (=> b!92155 m!99089))

(assert (=> d!24113 d!24277))

(declare-fun d!24279 () Bool)

(assert (=> d!24279 (= (getValueByKey!146 lt!44695 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(declare-fun lt!45147 () Unit!2702)

(assert (=> d!24279 (= lt!45147 (choose!555 lt!44695 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun e!60078 () Bool)

(assert (=> d!24279 e!60078))

(declare-fun res!46884 () Bool)

(assert (=> d!24279 (=> (not res!46884) (not e!60078))))

(assert (=> d!24279 (= res!46884 (isStrictlySorted!288 lt!44695))))

(assert (=> d!24279 (= (lemmaContainsTupThenGetReturnValue!63 lt!44695 (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45147)))

(declare-fun b!92157 () Bool)

(declare-fun res!46885 () Bool)

(assert (=> b!92157 (=> (not res!46885) (not e!60078))))

(assert (=> b!92157 (= res!46885 (containsKey!149 lt!44695 (_1!1133 lt!44534)))))

(declare-fun b!92158 () Bool)

(assert (=> b!92158 (= e!60078 (contains!771 lt!44695 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24279 res!46884) b!92157))

(assert (= (and b!92157 res!46885) b!92158))

(assert (=> d!24279 m!98337))

(declare-fun m!99091 () Bool)

(assert (=> d!24279 m!99091))

(declare-fun m!99093 () Bool)

(assert (=> d!24279 m!99093))

(declare-fun m!99095 () Bool)

(assert (=> b!92157 m!99095))

(declare-fun m!99097 () Bool)

(assert (=> b!92158 m!99097))

(assert (=> d!24113 d!24279))

(declare-fun c!15344 () Bool)

(declare-fun e!60082 () List!1537)

(declare-fun b!92159 () Bool)

(declare-fun c!15341 () Bool)

(assert (=> b!92159 (= e!60082 (ite c!15344 (t!5363 (toList!751 lt!44533)) (ite c!15341 (Cons!1533 (h!2125 (toList!751 lt!44533)) (t!5363 (toList!751 lt!44533))) Nil!1534)))))

(declare-fun call!9066 () List!1537)

(declare-fun c!15342 () Bool)

(declare-fun bm!9063 () Bool)

(assert (=> bm!9063 (= call!9066 ($colon$colon!74 e!60082 (ite c!15342 (h!2125 (toList!751 lt!44533)) (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534)))))))

(declare-fun c!15343 () Bool)

(assert (=> bm!9063 (= c!15343 c!15342)))

(declare-fun b!92160 () Bool)

(assert (=> b!92160 (= e!60082 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44533)) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun d!24281 () Bool)

(declare-fun e!60079 () Bool)

(assert (=> d!24281 e!60079))

(declare-fun res!46887 () Bool)

(assert (=> d!24281 (=> (not res!46887) (not e!60079))))

(declare-fun lt!45148 () List!1537)

(assert (=> d!24281 (= res!46887 (isStrictlySorted!288 lt!45148))))

(declare-fun e!60083 () List!1537)

(assert (=> d!24281 (= lt!45148 e!60083)))

(assert (=> d!24281 (= c!15342 (and ((_ is Cons!1533) (toList!751 lt!44533)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44534))))))

(assert (=> d!24281 (isStrictlySorted!288 (toList!751 lt!44533))))

(assert (=> d!24281 (= (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45148)))

(declare-fun b!92161 () Bool)

(declare-fun e!60080 () List!1537)

(declare-fun call!9067 () List!1537)

(assert (=> b!92161 (= e!60080 call!9067)))

(declare-fun b!92162 () Bool)

(declare-fun e!60081 () List!1537)

(declare-fun call!9068 () List!1537)

(assert (=> b!92162 (= e!60081 call!9068)))

(declare-fun b!92163 () Bool)

(declare-fun res!46886 () Bool)

(assert (=> b!92163 (=> (not res!46886) (not e!60079))))

(assert (=> b!92163 (= res!46886 (containsKey!149 lt!45148 (_1!1133 lt!44534)))))

(declare-fun bm!9064 () Bool)

(assert (=> bm!9064 (= call!9067 call!9066)))

(declare-fun b!92164 () Bool)

(assert (=> b!92164 (= e!60081 call!9068)))

(declare-fun bm!9065 () Bool)

(assert (=> bm!9065 (= call!9068 call!9067)))

(declare-fun b!92165 () Bool)

(assert (=> b!92165 (= e!60083 call!9066)))

(declare-fun b!92166 () Bool)

(assert (=> b!92166 (= c!15341 (and ((_ is Cons!1533) (toList!751 lt!44533)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44534))))))

(assert (=> b!92166 (= e!60080 e!60081)))

(declare-fun b!92167 () Bool)

(assert (=> b!92167 (= e!60083 e!60080)))

(assert (=> b!92167 (= c!15344 (and ((_ is Cons!1533) (toList!751 lt!44533)) (= (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44534))))))

(declare-fun b!92168 () Bool)

(assert (=> b!92168 (= e!60079 (contains!771 lt!45148 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24281 c!15342) b!92165))

(assert (= (and d!24281 (not c!15342)) b!92167))

(assert (= (and b!92167 c!15344) b!92161))

(assert (= (and b!92167 (not c!15344)) b!92166))

(assert (= (and b!92166 c!15341) b!92162))

(assert (= (and b!92166 (not c!15341)) b!92164))

(assert (= (or b!92162 b!92164) bm!9065))

(assert (= (or b!92161 bm!9065) bm!9064))

(assert (= (or b!92165 bm!9064) bm!9063))

(assert (= (and bm!9063 c!15343) b!92160))

(assert (= (and bm!9063 (not c!15343)) b!92159))

(assert (= (and d!24281 res!46887) b!92163))

(assert (= (and b!92163 res!46886) b!92168))

(declare-fun m!99099 () Bool)

(assert (=> bm!9063 m!99099))

(declare-fun m!99101 () Bool)

(assert (=> b!92163 m!99101))

(declare-fun m!99103 () Bool)

(assert (=> d!24281 m!99103))

(declare-fun m!99105 () Bool)

(assert (=> d!24281 m!99105))

(declare-fun m!99107 () Bool)

(assert (=> b!92168 m!99107))

(declare-fun m!99109 () Bool)

(assert (=> b!92160 m!99109))

(assert (=> d!24113 d!24281))

(assert (=> b!91657 d!24239))

(declare-fun b!92172 () Bool)

(declare-fun e!60084 () Bool)

(assert (=> b!92172 (= e!60084 (and (bvsge (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000000) (bvsle (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000011) (bvsge (_vacant!450 (_2!1132 lt!44543)) #b00000000000000000000000000000000)))))

(declare-fun b!92171 () Bool)

(declare-fun res!46889 () Bool)

(assert (=> b!92171 (=> (not res!46889) (not e!60084))))

(assert (=> b!92171 (= res!46889 (= (size!2211 (_2!1132 lt!44543)) (bvadd (_size!450 (_2!1132 lt!44543)) (bvsdiv (bvadd (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!92170 () Bool)

(declare-fun res!46891 () Bool)

(assert (=> b!92170 (=> (not res!46891) (not e!60084))))

(assert (=> b!92170 (= res!46891 (bvsge (size!2211 (_2!1132 lt!44543)) (_size!450 (_2!1132 lt!44543))))))

(declare-fun d!24283 () Bool)

(declare-fun res!46890 () Bool)

(assert (=> d!24283 (=> (not res!46890) (not e!60084))))

(assert (=> d!24283 (= res!46890 (validMask!0 (mask!6465 (_2!1132 lt!44543))))))

(assert (=> d!24283 (= (simpleValid!63 (_2!1132 lt!44543)) e!60084)))

(declare-fun b!92169 () Bool)

(declare-fun res!46888 () Bool)

(assert (=> b!92169 (=> (not res!46888) (not e!60084))))

(assert (=> b!92169 (= res!46888 (and (= (size!2206 (_values!2388 (_2!1132 lt!44543))) (bvadd (mask!6465 (_2!1132 lt!44543)) #b00000000000000000000000000000001)) (= (size!2205 (_keys!4085 (_2!1132 lt!44543))) (size!2206 (_values!2388 (_2!1132 lt!44543)))) (bvsge (_size!450 (_2!1132 lt!44543)) #b00000000000000000000000000000000) (bvsle (_size!450 (_2!1132 lt!44543)) (bvadd (mask!6465 (_2!1132 lt!44543)) #b00000000000000000000000000000001))))))

(assert (= (and d!24283 res!46890) b!92169))

(assert (= (and b!92169 res!46888) b!92170))

(assert (= (and b!92170 res!46891) b!92171))

(assert (= (and b!92171 res!46889) b!92172))

(declare-fun m!99111 () Bool)

(assert (=> b!92171 m!99111))

(assert (=> b!92170 m!99111))

(declare-fun m!99113 () Bool)

(assert (=> d!24283 m!99113))

(assert (=> d!24099 d!24283))

(declare-fun b!92173 () Bool)

(declare-fun e!60097 () Bool)

(declare-fun e!60086 () Bool)

(assert (=> b!92173 (= e!60097 e!60086)))

(declare-fun res!46893 () Bool)

(assert (=> b!92173 (=> (not res!46893) (not e!60086))))

(declare-fun lt!45154 () ListLongMap!1471)

(assert (=> b!92173 (= res!46893 (contains!769 lt!45154 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!92173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92174 () Bool)

(declare-fun res!46896 () Bool)

(declare-fun e!60094 () Bool)

(assert (=> b!92174 (=> (not res!46896) (not e!60094))))

(declare-fun e!60091 () Bool)

(assert (=> b!92174 (= res!46896 e!60091)))

(declare-fun c!15350 () Bool)

(assert (=> b!92174 (= c!15350 (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!92175 () Bool)

(declare-fun call!9072 () Bool)

(assert (=> b!92175 (= e!60091 (not call!9072))))

(declare-fun b!92176 () Bool)

(declare-fun res!46895 () Bool)

(assert (=> b!92176 (=> (not res!46895) (not e!60094))))

(assert (=> b!92176 (= res!46895 e!60097)))

(declare-fun res!46894 () Bool)

(assert (=> b!92176 (=> res!46894 e!60097)))

(declare-fun e!60090 () Bool)

(assert (=> b!92176 (= res!46894 (not e!60090))))

(declare-fun res!46898 () Bool)

(assert (=> b!92176 (=> (not res!46898) (not e!60090))))

(assert (=> b!92176 (= res!46898 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun b!92177 () Bool)

(declare-fun e!60096 () Unit!2702)

(declare-fun lt!45155 () Unit!2702)

(assert (=> b!92177 (= e!60096 lt!45155)))

(declare-fun lt!45169 () ListLongMap!1471)

(assert (=> b!92177 (= lt!45169 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45149 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45153 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45153 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45151 () Unit!2702)

(assert (=> b!92177 (= lt!45151 (addStillContains!63 lt!45169 lt!45149 (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) lt!45153))))

(assert (=> b!92177 (contains!769 (+!120 lt!45169 (tuple2!2245 lt!45149 (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)))) lt!45153)))

(declare-fun lt!45162 () Unit!2702)

(assert (=> b!92177 (= lt!45162 lt!45151)))

(declare-fun lt!45165 () ListLongMap!1471)

(assert (=> b!92177 (= lt!45165 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45167 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45167 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45157 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45157 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45170 () Unit!2702)

(assert (=> b!92177 (= lt!45170 (addApplyDifferent!63 lt!45165 lt!45167 (minValue!2293 newMap!16) lt!45157))))

(assert (=> b!92177 (= (apply!87 (+!120 lt!45165 (tuple2!2245 lt!45167 (minValue!2293 newMap!16))) lt!45157) (apply!87 lt!45165 lt!45157))))

(declare-fun lt!45163 () Unit!2702)

(assert (=> b!92177 (= lt!45163 lt!45170)))

(declare-fun lt!45166 () ListLongMap!1471)

(assert (=> b!92177 (= lt!45166 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45158 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45150 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45150 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45152 () Unit!2702)

(assert (=> b!92177 (= lt!45152 (addApplyDifferent!63 lt!45166 lt!45158 (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) lt!45150))))

(assert (=> b!92177 (= (apply!87 (+!120 lt!45166 (tuple2!2245 lt!45158 (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)))) lt!45150) (apply!87 lt!45166 lt!45150))))

(declare-fun lt!45159 () Unit!2702)

(assert (=> b!92177 (= lt!45159 lt!45152)))

(declare-fun lt!45160 () ListLongMap!1471)

(assert (=> b!92177 (= lt!45160 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45156 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45164 () (_ BitVec 64))

(assert (=> b!92177 (= lt!45164 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!92177 (= lt!45155 (addApplyDifferent!63 lt!45160 lt!45156 (minValue!2293 newMap!16) lt!45164))))

(assert (=> b!92177 (= (apply!87 (+!120 lt!45160 (tuple2!2245 lt!45156 (minValue!2293 newMap!16))) lt!45164) (apply!87 lt!45160 lt!45164))))

(declare-fun b!92178 () Bool)

(declare-fun e!60093 () Bool)

(assert (=> b!92178 (= e!60093 (= (apply!87 lt!45154 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16))))))

(declare-fun d!24285 () Bool)

(assert (=> d!24285 e!60094))

(declare-fun res!46897 () Bool)

(assert (=> d!24285 (=> (not res!46897) (not e!60094))))

(assert (=> d!24285 (= res!46897 (or (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))))

(declare-fun lt!45168 () ListLongMap!1471)

(assert (=> d!24285 (= lt!45154 lt!45168)))

(declare-fun lt!45161 () Unit!2702)

(assert (=> d!24285 (= lt!45161 e!60096)))

(declare-fun c!15349 () Bool)

(declare-fun e!60085 () Bool)

(assert (=> d!24285 (= c!15349 e!60085)))

(declare-fun res!46900 () Bool)

(assert (=> d!24285 (=> (not res!46900) (not e!60085))))

(assert (=> d!24285 (= res!46900 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(declare-fun e!60087 () ListLongMap!1471)

(assert (=> d!24285 (= lt!45168 e!60087)))

(declare-fun c!15346 () Bool)

(assert (=> d!24285 (= c!15346 (and (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24285 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24285 (= (getCurrentListMap!441 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) lt!45154)))

(declare-fun b!92179 () Bool)

(declare-fun e!60095 () ListLongMap!1471)

(declare-fun call!9071 () ListLongMap!1471)

(assert (=> b!92179 (= e!60095 call!9071)))

(declare-fun bm!9066 () Bool)

(declare-fun call!9074 () ListLongMap!1471)

(declare-fun call!9069 () ListLongMap!1471)

(assert (=> bm!9066 (= call!9074 call!9069)))

(declare-fun b!92180 () Bool)

(declare-fun e!60088 () Bool)

(assert (=> b!92180 (= e!60094 e!60088)))

(declare-fun c!15347 () Bool)

(assert (=> b!92180 (= c!15347 (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92181 () Bool)

(assert (=> b!92181 (= e!60085 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92182 () Bool)

(declare-fun e!60089 () Bool)

(assert (=> b!92182 (= e!60089 (= (apply!87 lt!45154 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 newMap!16)))))

(declare-fun c!15345 () Bool)

(declare-fun b!92183 () Bool)

(assert (=> b!92183 (= c!15345 (and (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60092 () ListLongMap!1471)

(assert (=> b!92183 (= e!60092 e!60095)))

(declare-fun b!92184 () Bool)

(assert (=> b!92184 (= e!60088 e!60089)))

(declare-fun res!46892 () Bool)

(declare-fun call!9075 () Bool)

(assert (=> b!92184 (= res!46892 call!9075)))

(assert (=> b!92184 (=> (not res!46892) (not e!60089))))

(declare-fun bm!9067 () Bool)

(assert (=> bm!9067 (= call!9072 (contains!769 lt!45154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92185 () Bool)

(assert (=> b!92185 (= e!60087 e!60092)))

(declare-fun c!15348 () Bool)

(assert (=> b!92185 (= c!15348 (and (not (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9068 () Bool)

(assert (=> bm!9068 (= call!9075 (contains!769 lt!45154 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9069 () Bool)

(declare-fun call!9073 () ListLongMap!1471)

(assert (=> bm!9069 (= call!9073 call!9074)))

(declare-fun call!9070 () ListLongMap!1471)

(declare-fun bm!9070 () Bool)

(assert (=> bm!9070 (= call!9070 (+!120 (ite c!15346 call!9069 (ite c!15348 call!9074 call!9073)) (ite (or c!15346 c!15348) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16)))))))

(declare-fun b!92186 () Bool)

(assert (=> b!92186 (= e!60095 call!9073)))

(declare-fun b!92187 () Bool)

(assert (=> b!92187 (= e!60088 (not call!9075))))

(declare-fun bm!9071 () Bool)

(assert (=> bm!9071 (= call!9069 (getCurrentListMapNoExtraKeys!85 (_keys!4085 newMap!16) (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882) (mask!6465 newMap!16) (ite (and c!15248 c!15252) lt!44891 (extraKeys!2236 newMap!16)) (ite (and c!15248 c!15252) lt!44529 (zeroValue!2293 newMap!16)) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun b!92188 () Bool)

(assert (=> b!92188 (= e!60092 call!9071)))

(declare-fun b!92189 () Bool)

(assert (=> b!92189 (= e!60087 (+!120 call!9070 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 newMap!16))))))

(declare-fun b!92190 () Bool)

(assert (=> b!92190 (= e!60090 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!9072 () Bool)

(assert (=> bm!9072 (= call!9071 call!9070)))

(declare-fun b!92191 () Bool)

(assert (=> b!92191 (= e!60091 e!60093)))

(declare-fun res!46899 () Bool)

(assert (=> b!92191 (= res!46899 call!9072)))

(assert (=> b!92191 (=> (not res!46899) (not e!60093))))

(declare-fun b!92192 () Bool)

(declare-fun Unit!2730 () Unit!2702)

(assert (=> b!92192 (= e!60096 Unit!2730)))

(declare-fun b!92193 () Bool)

(assert (=> b!92193 (= e!60086 (= (apply!87 lt!45154 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)) (get!1247 (select (arr!1959 (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882)) #b00000000000000000000000000000000) (dynLambda!358 (defaultEntry!2405 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2206 (ite (or c!15248 c!15242) (_values!2388 newMap!16) lt!44882))))))

(assert (=> b!92193 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (= (and d!24285 c!15346) b!92189))

(assert (= (and d!24285 (not c!15346)) b!92185))

(assert (= (and b!92185 c!15348) b!92188))

(assert (= (and b!92185 (not c!15348)) b!92183))

(assert (= (and b!92183 c!15345) b!92179))

(assert (= (and b!92183 (not c!15345)) b!92186))

(assert (= (or b!92179 b!92186) bm!9069))

(assert (= (or b!92188 bm!9069) bm!9066))

(assert (= (or b!92188 b!92179) bm!9072))

(assert (= (or b!92189 bm!9066) bm!9071))

(assert (= (or b!92189 bm!9072) bm!9070))

(assert (= (and d!24285 res!46900) b!92181))

(assert (= (and d!24285 c!15349) b!92177))

(assert (= (and d!24285 (not c!15349)) b!92192))

(assert (= (and d!24285 res!46897) b!92176))

(assert (= (and b!92176 res!46898) b!92190))

(assert (= (and b!92176 (not res!46894)) b!92173))

(assert (= (and b!92173 res!46893) b!92193))

(assert (= (and b!92176 res!46895) b!92174))

(assert (= (and b!92174 c!15350) b!92191))

(assert (= (and b!92174 (not c!15350)) b!92175))

(assert (= (and b!92191 res!46899) b!92178))

(assert (= (or b!92191 b!92175) bm!9067))

(assert (= (and b!92174 res!46896) b!92180))

(assert (= (and b!92180 c!15347) b!92184))

(assert (= (and b!92180 (not c!15347)) b!92187))

(assert (= (and b!92184 res!46892) b!92182))

(assert (= (or b!92184 b!92187) bm!9068))

(declare-fun b_lambda!4065 () Bool)

(assert (=> (not b_lambda!4065) (not b!92193)))

(assert (=> b!92193 t!5376))

(declare-fun b_and!5589 () Bool)

(assert (= b_and!5585 (and (=> t!5376 result!3093) b_and!5589)))

(assert (=> b!92193 t!5378))

(declare-fun b_and!5591 () Bool)

(assert (= b_and!5587 (and (=> t!5378 result!3095) b_and!5591)))

(assert (=> b!92181 m!98741))

(assert (=> b!92181 m!98741))

(assert (=> b!92181 m!98743))

(declare-fun m!99115 () Bool)

(assert (=> bm!9067 m!99115))

(declare-fun m!99117 () Bool)

(assert (=> b!92177 m!99117))

(declare-fun m!99119 () Bool)

(assert (=> b!92177 m!99119))

(declare-fun m!99121 () Bool)

(assert (=> b!92177 m!99121))

(declare-fun m!99123 () Bool)

(assert (=> b!92177 m!99123))

(assert (=> b!92177 m!98741))

(declare-fun m!99125 () Bool)

(assert (=> b!92177 m!99125))

(assert (=> b!92177 m!99121))

(declare-fun m!99127 () Bool)

(assert (=> b!92177 m!99127))

(declare-fun m!99129 () Bool)

(assert (=> b!92177 m!99129))

(declare-fun m!99131 () Bool)

(assert (=> b!92177 m!99131))

(assert (=> b!92177 m!99125))

(declare-fun m!99133 () Bool)

(assert (=> b!92177 m!99133))

(declare-fun m!99135 () Bool)

(assert (=> b!92177 m!99135))

(declare-fun m!99137 () Bool)

(assert (=> b!92177 m!99137))

(assert (=> b!92177 m!99117))

(declare-fun m!99139 () Bool)

(assert (=> b!92177 m!99139))

(declare-fun m!99141 () Bool)

(assert (=> b!92177 m!99141))

(declare-fun m!99143 () Bool)

(assert (=> b!92177 m!99143))

(declare-fun m!99145 () Bool)

(assert (=> b!92177 m!99145))

(assert (=> b!92177 m!99127))

(declare-fun m!99147 () Bool)

(assert (=> b!92177 m!99147))

(assert (=> d!24285 m!98733))

(assert (=> b!92193 m!98779))

(declare-fun m!99149 () Bool)

(assert (=> b!92193 m!99149))

(assert (=> b!92193 m!98741))

(assert (=> b!92193 m!98741))

(declare-fun m!99151 () Bool)

(assert (=> b!92193 m!99151))

(assert (=> b!92193 m!99149))

(assert (=> b!92193 m!98779))

(declare-fun m!99153 () Bool)

(assert (=> b!92193 m!99153))

(declare-fun m!99155 () Bool)

(assert (=> bm!9068 m!99155))

(assert (=> bm!9071 m!99147))

(assert (=> b!92190 m!98741))

(assert (=> b!92190 m!98741))

(assert (=> b!92190 m!98743))

(declare-fun m!99157 () Bool)

(assert (=> b!92189 m!99157))

(declare-fun m!99159 () Bool)

(assert (=> b!92182 m!99159))

(declare-fun m!99161 () Bool)

(assert (=> b!92178 m!99161))

(declare-fun m!99163 () Bool)

(assert (=> bm!9070 m!99163))

(assert (=> b!92173 m!98741))

(assert (=> b!92173 m!98741))

(declare-fun m!99165 () Bool)

(assert (=> b!92173 m!99165))

(assert (=> bm!8992 d!24285))

(declare-fun d!24287 () Bool)

(declare-fun e!60098 () Bool)

(assert (=> d!24287 e!60098))

(declare-fun res!46901 () Bool)

(assert (=> d!24287 (=> res!46901 e!60098)))

(declare-fun lt!45172 () Bool)

(assert (=> d!24287 (= res!46901 (not lt!45172))))

(declare-fun lt!45173 () Bool)

(assert (=> d!24287 (= lt!45172 lt!45173)))

(declare-fun lt!45174 () Unit!2702)

(declare-fun e!60099 () Unit!2702)

(assert (=> d!24287 (= lt!45174 e!60099)))

(declare-fun c!15351 () Bool)

(assert (=> d!24287 (= c!15351 lt!45173)))

(assert (=> d!24287 (= lt!45173 (containsKey!149 (toList!751 lt!44758) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24287 (= (contains!769 lt!44758 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!45172)))

(declare-fun b!92194 () Bool)

(declare-fun lt!45171 () Unit!2702)

(assert (=> b!92194 (= e!60099 lt!45171)))

(assert (=> b!92194 (= lt!45171 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44758) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!92194 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92195 () Bool)

(declare-fun Unit!2731 () Unit!2702)

(assert (=> b!92195 (= e!60099 Unit!2731)))

(declare-fun b!92196 () Bool)

(assert (=> b!92196 (= e!60098 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (= (and d!24287 c!15351) b!92194))

(assert (= (and d!24287 (not c!15351)) b!92195))

(assert (= (and d!24287 (not res!46901)) b!92196))

(assert (=> d!24287 m!98059))

(declare-fun m!99167 () Bool)

(assert (=> d!24287 m!99167))

(assert (=> b!92194 m!98059))

(declare-fun m!99169 () Bool)

(assert (=> b!92194 m!99169))

(assert (=> b!92194 m!98059))

(assert (=> b!92194 m!98721))

(assert (=> b!92194 m!98721))

(declare-fun m!99171 () Bool)

(assert (=> b!92194 m!99171))

(assert (=> b!92196 m!98059))

(assert (=> b!92196 m!98721))

(assert (=> b!92196 m!98721))

(assert (=> b!92196 m!99171))

(assert (=> b!91617 d!24287))

(declare-fun d!24289 () Bool)

(declare-fun e!60100 () Bool)

(assert (=> d!24289 e!60100))

(declare-fun res!46902 () Bool)

(assert (=> d!24289 (=> res!46902 e!60100)))

(declare-fun lt!45176 () Bool)

(assert (=> d!24289 (= res!46902 (not lt!45176))))

(declare-fun lt!45177 () Bool)

(assert (=> d!24289 (= lt!45176 lt!45177)))

(declare-fun lt!45178 () Unit!2702)

(declare-fun e!60101 () Unit!2702)

(assert (=> d!24289 (= lt!45178 e!60101)))

(declare-fun c!15352 () Bool)

(assert (=> d!24289 (= c!15352 lt!45177)))

(assert (=> d!24289 (= lt!45177 (containsKey!149 (toList!751 lt!44675) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24289 (= (contains!769 lt!44675 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45176)))

(declare-fun b!92197 () Bool)

(declare-fun lt!45175 () Unit!2702)

(assert (=> b!92197 (= e!60101 lt!45175)))

(assert (=> b!92197 (= lt!45175 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44675) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92197 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92198 () Bool)

(declare-fun Unit!2732 () Unit!2702)

(assert (=> b!92198 (= e!60101 Unit!2732)))

(declare-fun b!92199 () Bool)

(assert (=> b!92199 (= e!60100 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24289 c!15352) b!92197))

(assert (= (and d!24289 (not c!15352)) b!92198))

(assert (= (and d!24289 (not res!46902)) b!92199))

(declare-fun m!99173 () Bool)

(assert (=> d!24289 m!99173))

(declare-fun m!99175 () Bool)

(assert (=> b!92197 m!99175))

(declare-fun m!99177 () Bool)

(assert (=> b!92197 m!99177))

(assert (=> b!92197 m!99177))

(declare-fun m!99179 () Bool)

(assert (=> b!92197 m!99179))

(assert (=> b!92199 m!99177))

(assert (=> b!92199 m!99177))

(assert (=> b!92199 m!99179))

(assert (=> d!24107 d!24289))

(assert (=> d!24107 d!24209))

(declare-fun d!24291 () Bool)

(declare-fun e!60102 () Bool)

(assert (=> d!24291 e!60102))

(declare-fun res!46903 () Bool)

(assert (=> d!24291 (=> res!46903 e!60102)))

(declare-fun lt!45180 () Bool)

(assert (=> d!24291 (= res!46903 (not lt!45180))))

(declare-fun lt!45181 () Bool)

(assert (=> d!24291 (= lt!45180 lt!45181)))

(declare-fun lt!45182 () Unit!2702)

(declare-fun e!60103 () Unit!2702)

(assert (=> d!24291 (= lt!45182 e!60103)))

(declare-fun c!15353 () Bool)

(assert (=> d!24291 (= c!15353 lt!45181)))

(assert (=> d!24291 (= lt!45181 (containsKey!149 (toList!751 lt!44700) (_1!1133 lt!44540)))))

(assert (=> d!24291 (= (contains!769 lt!44700 (_1!1133 lt!44540)) lt!45180)))

(declare-fun b!92200 () Bool)

(declare-fun lt!45179 () Unit!2702)

(assert (=> b!92200 (= e!60103 lt!45179)))

(assert (=> b!92200 (= lt!45179 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44700) (_1!1133 lt!44540)))))

(assert (=> b!92200 (isDefined!98 (getValueByKey!146 (toList!751 lt!44700) (_1!1133 lt!44540)))))

(declare-fun b!92201 () Bool)

(declare-fun Unit!2733 () Unit!2702)

(assert (=> b!92201 (= e!60103 Unit!2733)))

(declare-fun b!92202 () Bool)

(assert (=> b!92202 (= e!60102 (isDefined!98 (getValueByKey!146 (toList!751 lt!44700) (_1!1133 lt!44540))))))

(assert (= (and d!24291 c!15353) b!92200))

(assert (= (and d!24291 (not c!15353)) b!92201))

(assert (= (and d!24291 (not res!46903)) b!92202))

(declare-fun m!99181 () Bool)

(assert (=> d!24291 m!99181))

(declare-fun m!99183 () Bool)

(assert (=> b!92200 m!99183))

(assert (=> b!92200 m!98367))

(assert (=> b!92200 m!98367))

(declare-fun m!99185 () Bool)

(assert (=> b!92200 m!99185))

(assert (=> b!92202 m!98367))

(assert (=> b!92202 m!98367))

(assert (=> b!92202 m!99185))

(assert (=> d!24117 d!24291))

(declare-fun b!92205 () Bool)

(declare-fun e!60105 () Option!152)

(assert (=> b!92205 (= e!60105 (getValueByKey!146 (t!5363 lt!44703) (_1!1133 lt!44540)))))

(declare-fun b!92206 () Bool)

(assert (=> b!92206 (= e!60105 None!150)))

(declare-fun d!24293 () Bool)

(declare-fun c!15354 () Bool)

(assert (=> d!24293 (= c!15354 (and ((_ is Cons!1533) lt!44703) (= (_1!1133 (h!2125 lt!44703)) (_1!1133 lt!44540))))))

(declare-fun e!60104 () Option!152)

(assert (=> d!24293 (= (getValueByKey!146 lt!44703 (_1!1133 lt!44540)) e!60104)))

(declare-fun b!92204 () Bool)

(assert (=> b!92204 (= e!60104 e!60105)))

(declare-fun c!15355 () Bool)

(assert (=> b!92204 (= c!15355 (and ((_ is Cons!1533) lt!44703) (not (= (_1!1133 (h!2125 lt!44703)) (_1!1133 lt!44540)))))))

(declare-fun b!92203 () Bool)

(assert (=> b!92203 (= e!60104 (Some!151 (_2!1133 (h!2125 lt!44703))))))

(assert (= (and d!24293 c!15354) b!92203))

(assert (= (and d!24293 (not c!15354)) b!92204))

(assert (= (and b!92204 c!15355) b!92205))

(assert (= (and b!92204 (not c!15355)) b!92206))

(declare-fun m!99187 () Bool)

(assert (=> b!92205 m!99187))

(assert (=> d!24117 d!24293))

(declare-fun d!24295 () Bool)

(assert (=> d!24295 (= (getValueByKey!146 lt!44703 (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540)))))

(declare-fun lt!45183 () Unit!2702)

(assert (=> d!24295 (= lt!45183 (choose!555 lt!44703 (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(declare-fun e!60106 () Bool)

(assert (=> d!24295 e!60106))

(declare-fun res!46904 () Bool)

(assert (=> d!24295 (=> (not res!46904) (not e!60106))))

(assert (=> d!24295 (= res!46904 (isStrictlySorted!288 lt!44703))))

(assert (=> d!24295 (= (lemmaContainsTupThenGetReturnValue!63 lt!44703 (_1!1133 lt!44540) (_2!1133 lt!44540)) lt!45183)))

(declare-fun b!92207 () Bool)

(declare-fun res!46905 () Bool)

(assert (=> b!92207 (=> (not res!46905) (not e!60106))))

(assert (=> b!92207 (= res!46905 (containsKey!149 lt!44703 (_1!1133 lt!44540)))))

(declare-fun b!92208 () Bool)

(assert (=> b!92208 (= e!60106 (contains!771 lt!44703 (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540))))))

(assert (= (and d!24295 res!46904) b!92207))

(assert (= (and b!92207 res!46905) b!92208))

(assert (=> d!24295 m!98361))

(declare-fun m!99189 () Bool)

(assert (=> d!24295 m!99189))

(declare-fun m!99191 () Bool)

(assert (=> d!24295 m!99191))

(declare-fun m!99193 () Bool)

(assert (=> b!92207 m!99193))

(declare-fun m!99195 () Bool)

(assert (=> b!92208 m!99195))

(assert (=> d!24117 d!24295))

(declare-fun b!92209 () Bool)

(declare-fun c!15359 () Bool)

(declare-fun e!60110 () List!1537)

(declare-fun c!15356 () Bool)

(assert (=> b!92209 (= e!60110 (ite c!15359 (t!5363 (toList!751 lt!44531)) (ite c!15356 (Cons!1533 (h!2125 (toList!751 lt!44531)) (t!5363 (toList!751 lt!44531))) Nil!1534)))))

(declare-fun bm!9073 () Bool)

(declare-fun c!15357 () Bool)

(declare-fun call!9076 () List!1537)

(assert (=> bm!9073 (= call!9076 ($colon$colon!74 e!60110 (ite c!15357 (h!2125 (toList!751 lt!44531)) (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540)))))))

(declare-fun c!15358 () Bool)

(assert (=> bm!9073 (= c!15358 c!15357)))

(declare-fun b!92210 () Bool)

(assert (=> b!92210 (= e!60110 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44531)) (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(declare-fun d!24297 () Bool)

(declare-fun e!60107 () Bool)

(assert (=> d!24297 e!60107))

(declare-fun res!46907 () Bool)

(assert (=> d!24297 (=> (not res!46907) (not e!60107))))

(declare-fun lt!45184 () List!1537)

(assert (=> d!24297 (= res!46907 (isStrictlySorted!288 lt!45184))))

(declare-fun e!60111 () List!1537)

(assert (=> d!24297 (= lt!45184 e!60111)))

(assert (=> d!24297 (= c!15357 (and ((_ is Cons!1533) (toList!751 lt!44531)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44540))))))

(assert (=> d!24297 (isStrictlySorted!288 (toList!751 lt!44531))))

(assert (=> d!24297 (= (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 lt!44540) (_2!1133 lt!44540)) lt!45184)))

(declare-fun b!92211 () Bool)

(declare-fun e!60108 () List!1537)

(declare-fun call!9077 () List!1537)

(assert (=> b!92211 (= e!60108 call!9077)))

(declare-fun b!92212 () Bool)

(declare-fun e!60109 () List!1537)

(declare-fun call!9078 () List!1537)

(assert (=> b!92212 (= e!60109 call!9078)))

(declare-fun b!92213 () Bool)

(declare-fun res!46906 () Bool)

(assert (=> b!92213 (=> (not res!46906) (not e!60107))))

(assert (=> b!92213 (= res!46906 (containsKey!149 lt!45184 (_1!1133 lt!44540)))))

(declare-fun bm!9074 () Bool)

(assert (=> bm!9074 (= call!9077 call!9076)))

(declare-fun b!92214 () Bool)

(assert (=> b!92214 (= e!60109 call!9078)))

(declare-fun bm!9075 () Bool)

(assert (=> bm!9075 (= call!9078 call!9077)))

(declare-fun b!92215 () Bool)

(assert (=> b!92215 (= e!60111 call!9076)))

(declare-fun b!92216 () Bool)

(assert (=> b!92216 (= c!15356 (and ((_ is Cons!1533) (toList!751 lt!44531)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44540))))))

(assert (=> b!92216 (= e!60108 e!60109)))

(declare-fun b!92217 () Bool)

(assert (=> b!92217 (= e!60111 e!60108)))

(assert (=> b!92217 (= c!15359 (and ((_ is Cons!1533) (toList!751 lt!44531)) (= (_1!1133 (h!2125 (toList!751 lt!44531))) (_1!1133 lt!44540))))))

(declare-fun b!92218 () Bool)

(assert (=> b!92218 (= e!60107 (contains!771 lt!45184 (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540))))))

(assert (= (and d!24297 c!15357) b!92215))

(assert (= (and d!24297 (not c!15357)) b!92217))

(assert (= (and b!92217 c!15359) b!92211))

(assert (= (and b!92217 (not c!15359)) b!92216))

(assert (= (and b!92216 c!15356) b!92212))

(assert (= (and b!92216 (not c!15356)) b!92214))

(assert (= (or b!92212 b!92214) bm!9075))

(assert (= (or b!92211 bm!9075) bm!9074))

(assert (= (or b!92215 bm!9074) bm!9073))

(assert (= (and bm!9073 c!15358) b!92210))

(assert (= (and bm!9073 (not c!15358)) b!92209))

(assert (= (and d!24297 res!46907) b!92213))

(assert (= (and b!92213 res!46906) b!92218))

(declare-fun m!99197 () Bool)

(assert (=> bm!9073 m!99197))

(declare-fun m!99199 () Bool)

(assert (=> b!92213 m!99199))

(declare-fun m!99201 () Bool)

(assert (=> d!24297 m!99201))

(assert (=> d!24297 m!98879))

(declare-fun m!99203 () Bool)

(assert (=> b!92218 m!99203))

(declare-fun m!99205 () Bool)

(assert (=> b!92210 m!99205))

(assert (=> d!24117 d!24297))

(declare-fun d!24299 () Bool)

(assert (=> d!24299 (= (apply!87 lt!44784 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1252 (getValueByKey!146 (toList!751 lt!44784) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3820 () Bool)

(assert (= bs!3820 d!24299))

(assert (=> bs!3820 m!98285))

(declare-fun m!99207 () Bool)

(assert (=> bs!3820 m!99207))

(assert (=> bs!3820 m!99207))

(declare-fun m!99209 () Bool)

(assert (=> bs!3820 m!99209))

(assert (=> b!91660 d!24299))

(assert (=> b!91660 d!24201))

(assert (=> b!91678 d!24161))

(assert (=> b!91678 d!24163))

(declare-fun b!92221 () Bool)

(declare-fun e!60113 () Option!152)

(assert (=> b!92221 (= e!60113 (getValueByKey!146 (t!5363 (toList!751 lt!44684)) (_1!1133 lt!44534)))))

(declare-fun b!92222 () Bool)

(assert (=> b!92222 (= e!60113 None!150)))

(declare-fun d!24301 () Bool)

(declare-fun c!15360 () Bool)

(assert (=> d!24301 (= c!15360 (and ((_ is Cons!1533) (toList!751 lt!44684)) (= (_1!1133 (h!2125 (toList!751 lt!44684))) (_1!1133 lt!44534))))))

(declare-fun e!60112 () Option!152)

(assert (=> d!24301 (= (getValueByKey!146 (toList!751 lt!44684) (_1!1133 lt!44534)) e!60112)))

(declare-fun b!92220 () Bool)

(assert (=> b!92220 (= e!60112 e!60113)))

(declare-fun c!15361 () Bool)

(assert (=> b!92220 (= c!15361 (and ((_ is Cons!1533) (toList!751 lt!44684)) (not (= (_1!1133 (h!2125 (toList!751 lt!44684))) (_1!1133 lt!44534)))))))

(declare-fun b!92219 () Bool)

(assert (=> b!92219 (= e!60112 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44684)))))))

(assert (= (and d!24301 c!15360) b!92219))

(assert (= (and d!24301 (not c!15360)) b!92220))

(assert (= (and b!92220 c!15361) b!92221))

(assert (= (and b!92220 (not c!15361)) b!92222))

(declare-fun m!99211 () Bool)

(assert (=> b!92221 m!99211))

(assert (=> b!91563 d!24301))

(declare-fun d!24303 () Bool)

(declare-fun lt!45185 () Bool)

(assert (=> d!24303 (= lt!45185 (select (content!96 (toList!751 lt!44705)) lt!44536))))

(declare-fun e!60115 () Bool)

(assert (=> d!24303 (= lt!45185 e!60115)))

(declare-fun res!46908 () Bool)

(assert (=> d!24303 (=> (not res!46908) (not e!60115))))

(assert (=> d!24303 (= res!46908 ((_ is Cons!1533) (toList!751 lt!44705)))))

(assert (=> d!24303 (= (contains!771 (toList!751 lt!44705) lt!44536) lt!45185)))

(declare-fun b!92223 () Bool)

(declare-fun e!60114 () Bool)

(assert (=> b!92223 (= e!60115 e!60114)))

(declare-fun res!46909 () Bool)

(assert (=> b!92223 (=> res!46909 e!60114)))

(assert (=> b!92223 (= res!46909 (= (h!2125 (toList!751 lt!44705)) lt!44536))))

(declare-fun b!92224 () Bool)

(assert (=> b!92224 (= e!60114 (contains!771 (t!5363 (toList!751 lt!44705)) lt!44536))))

(assert (= (and d!24303 res!46908) b!92223))

(assert (= (and b!92223 (not res!46909)) b!92224))

(declare-fun m!99213 () Bool)

(assert (=> d!24303 m!99213))

(declare-fun m!99215 () Bool)

(assert (=> d!24303 m!99215))

(declare-fun m!99217 () Bool)

(assert (=> b!92224 m!99217))

(assert (=> b!91574 d!24303))

(declare-fun b!92225 () Bool)

(declare-fun res!46911 () Bool)

(declare-fun e!60118 () Bool)

(assert (=> b!92225 (=> (not res!46911) (not e!60118))))

(declare-fun lt!45192 () ListLongMap!1471)

(assert (=> b!92225 (= res!46911 (not (contains!769 lt!45192 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92226 () Bool)

(declare-fun e!60116 () Bool)

(declare-fun e!60121 () Bool)

(assert (=> b!92226 (= e!60116 e!60121)))

(declare-fun c!15365 () Bool)

(assert (=> b!92226 (= c!15365 (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92227 () Bool)

(assert (=> b!92227 (= e!60121 (= lt!45192 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92228 () Bool)

(declare-fun e!60122 () ListLongMap!1471)

(declare-fun e!60117 () ListLongMap!1471)

(assert (=> b!92228 (= e!60122 e!60117)))

(declare-fun c!15364 () Bool)

(assert (=> b!92228 (= c!15364 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92229 () Bool)

(assert (=> b!92229 (= e!60121 (isEmpty!352 lt!45192))))

(declare-fun b!92230 () Bool)

(declare-fun e!60119 () Bool)

(assert (=> b!92230 (= e!60119 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!92230 (bvsge from!355 #b00000000000000000000000000000000)))

(declare-fun b!92231 () Bool)

(declare-fun call!9079 () ListLongMap!1471)

(assert (=> b!92231 (= e!60117 call!9079)))

(declare-fun d!24305 () Bool)

(assert (=> d!24305 e!60118))

(declare-fun res!46913 () Bool)

(assert (=> d!24305 (=> (not res!46913) (not e!60118))))

(assert (=> d!24305 (= res!46913 (not (contains!769 lt!45192 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24305 (= lt!45192 e!60122)))

(declare-fun c!15363 () Bool)

(assert (=> d!24305 (= c!15363 (bvsge from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> d!24305 (validMask!0 (mask!6465 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24305 (= (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) from!355 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))) lt!45192)))

(declare-fun bm!9076 () Bool)

(assert (=> bm!9076 (= call!9079 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (_values!2388 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992))) (extraKeys!2236 (v!2723 (underlying!315 thiss!992))) (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) (minValue!2293 (v!2723 (underlying!315 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!92232 () Bool)

(assert (=> b!92232 (= e!60118 e!60116)))

(declare-fun c!15362 () Bool)

(assert (=> b!92232 (= c!15362 e!60119)))

(declare-fun res!46910 () Bool)

(assert (=> b!92232 (=> (not res!46910) (not e!60119))))

(assert (=> b!92232 (= res!46910 (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun b!92233 () Bool)

(declare-fun e!60120 () Bool)

(assert (=> b!92233 (= e!60116 e!60120)))

(assert (=> b!92233 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(declare-fun res!46912 () Bool)

(assert (=> b!92233 (= res!46912 (contains!769 lt!45192 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!92233 (=> (not res!46912) (not e!60120))))

(declare-fun b!92234 () Bool)

(declare-fun lt!45191 () Unit!2702)

(declare-fun lt!45189 () Unit!2702)

(assert (=> b!92234 (= lt!45191 lt!45189)))

(declare-fun lt!45188 () ListLongMap!1471)

(declare-fun lt!45187 () (_ BitVec 64))

(declare-fun lt!45190 () (_ BitVec 64))

(declare-fun lt!45186 () V!3089)

(assert (=> b!92234 (not (contains!769 (+!120 lt!45188 (tuple2!2245 lt!45187 lt!45186)) lt!45190))))

(assert (=> b!92234 (= lt!45189 (addStillNotContains!38 lt!45188 lt!45187 lt!45186 lt!45190))))

(assert (=> b!92234 (= lt!45190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!92234 (= lt!45186 (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!92234 (= lt!45187 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))

(assert (=> b!92234 (= lt!45188 call!9079)))

(assert (=> b!92234 (= e!60117 (+!120 call!9079 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!92235 () Bool)

(assert (=> b!92235 (= e!60122 (ListLongMap!1472 Nil!1534))))

(declare-fun b!92236 () Bool)

(assert (=> b!92236 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!92236 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2206 (_values!2388 (v!2723 (underlying!315 thiss!992))))))))

(assert (=> b!92236 (= e!60120 (= (apply!87 lt!45192 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!24305 c!15363) b!92235))

(assert (= (and d!24305 (not c!15363)) b!92228))

(assert (= (and b!92228 c!15364) b!92234))

(assert (= (and b!92228 (not c!15364)) b!92231))

(assert (= (or b!92234 b!92231) bm!9076))

(assert (= (and d!24305 res!46913) b!92225))

(assert (= (and b!92225 res!46911) b!92232))

(assert (= (and b!92232 res!46910) b!92230))

(assert (= (and b!92232 c!15362) b!92233))

(assert (= (and b!92232 (not c!15362)) b!92226))

(assert (= (and b!92233 res!46912) b!92236))

(assert (= (and b!92226 c!15365) b!92227))

(assert (= (and b!92226 (not c!15365)) b!92229))

(declare-fun b_lambda!4067 () Bool)

(assert (=> (not b_lambda!4067) (not b!92234)))

(assert (=> b!92234 t!5360))

(declare-fun b_and!5593 () Bool)

(assert (= b_and!5589 (and (=> t!5360 result!3073) b_and!5593)))

(assert (=> b!92234 t!5362))

(declare-fun b_and!5595 () Bool)

(assert (= b_and!5591 (and (=> t!5362 result!3077) b_and!5595)))

(declare-fun b_lambda!4069 () Bool)

(assert (=> (not b_lambda!4069) (not b!92236)))

(assert (=> b!92236 t!5360))

(declare-fun b_and!5597 () Bool)

(assert (= b_and!5593 (and (=> t!5360 result!3073) b_and!5597)))

(assert (=> b!92236 t!5362))

(declare-fun b_and!5599 () Bool)

(assert (= b_and!5595 (and (=> t!5362 result!3077) b_and!5599)))

(declare-fun m!99219 () Bool)

(assert (=> b!92229 m!99219))

(declare-fun m!99221 () Bool)

(assert (=> b!92227 m!99221))

(assert (=> b!92230 m!98059))

(assert (=> b!92230 m!98059))

(assert (=> b!92230 m!98393))

(declare-fun m!99223 () Bool)

(assert (=> d!24305 m!99223))

(assert (=> d!24305 m!98291))

(assert (=> bm!9076 m!99221))

(assert (=> b!92228 m!98059))

(assert (=> b!92228 m!98059))

(assert (=> b!92228 m!98393))

(declare-fun m!99225 () Bool)

(assert (=> b!92225 m!99225))

(assert (=> b!92233 m!98059))

(assert (=> b!92233 m!98059))

(declare-fun m!99227 () Bool)

(assert (=> b!92233 m!99227))

(assert (=> b!92236 m!98059))

(assert (=> b!92236 m!98059))

(declare-fun m!99229 () Bool)

(assert (=> b!92236 m!99229))

(assert (=> b!92236 m!98061))

(assert (=> b!92236 m!98061))

(assert (=> b!92236 m!98063))

(assert (=> b!92236 m!98065))

(assert (=> b!92236 m!98063))

(assert (=> b!92234 m!98059))

(declare-fun m!99231 () Bool)

(assert (=> b!92234 m!99231))

(declare-fun m!99233 () Bool)

(assert (=> b!92234 m!99233))

(declare-fun m!99235 () Bool)

(assert (=> b!92234 m!99235))

(assert (=> b!92234 m!98061))

(assert (=> b!92234 m!98061))

(assert (=> b!92234 m!98063))

(assert (=> b!92234 m!98065))

(assert (=> b!92234 m!98063))

(declare-fun m!99237 () Bool)

(assert (=> b!92234 m!99237))

(assert (=> b!92234 m!99231))

(assert (=> b!91621 d!24305))

(declare-fun d!24307 () Bool)

(assert (=> d!24307 (= (apply!87 (+!120 lt!44770 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44754) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44770 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44754)))))

(declare-fun bs!3821 () Bool)

(assert (= bs!3821 d!24307))

(declare-fun m!99239 () Bool)

(assert (=> bs!3821 m!99239))

(assert (=> bs!3821 m!99239))

(declare-fun m!99241 () Bool)

(assert (=> bs!3821 m!99241))

(assert (=> b!91621 d!24307))

(declare-fun d!24309 () Bool)

(declare-fun e!60123 () Bool)

(assert (=> d!24309 e!60123))

(declare-fun res!46914 () Bool)

(assert (=> d!24309 (=> (not res!46914) (not e!60123))))

(declare-fun lt!45193 () ListLongMap!1471)

(assert (=> d!24309 (= res!46914 (contains!769 lt!45193 (_1!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45196 () List!1537)

(assert (=> d!24309 (= lt!45193 (ListLongMap!1472 lt!45196))))

(declare-fun lt!45194 () Unit!2702)

(declare-fun lt!45195 () Unit!2702)

(assert (=> d!24309 (= lt!45194 lt!45195)))

(assert (=> d!24309 (= (getValueByKey!146 lt!45196 (_1!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24309 (= lt!45195 (lemmaContainsTupThenGetReturnValue!63 lt!45196 (_1!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24309 (= lt!45196 (insertStrictlySorted!66 (toList!751 lt!44769) (_1!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24309 (= (+!120 lt!44769 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45193)))

(declare-fun b!92237 () Bool)

(declare-fun res!46915 () Bool)

(assert (=> b!92237 (=> (not res!46915) (not e!60123))))

(assert (=> b!92237 (= res!46915 (= (getValueByKey!146 (toList!751 lt!45193) (_1!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92238 () Bool)

(assert (=> b!92238 (= e!60123 (contains!771 (toList!751 lt!45193) (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24309 res!46914) b!92237))

(assert (= (and b!92237 res!46915) b!92238))

(declare-fun m!99243 () Bool)

(assert (=> d!24309 m!99243))

(declare-fun m!99245 () Bool)

(assert (=> d!24309 m!99245))

(declare-fun m!99247 () Bool)

(assert (=> d!24309 m!99247))

(declare-fun m!99249 () Bool)

(assert (=> d!24309 m!99249))

(declare-fun m!99251 () Bool)

(assert (=> b!92237 m!99251))

(declare-fun m!99253 () Bool)

(assert (=> b!92238 m!99253))

(assert (=> b!91621 d!24309))

(declare-fun d!24311 () Bool)

(declare-fun e!60124 () Bool)

(assert (=> d!24311 e!60124))

(declare-fun res!46916 () Bool)

(assert (=> d!24311 (=> (not res!46916) (not e!60124))))

(declare-fun lt!45197 () ListLongMap!1471)

(assert (=> d!24311 (= res!46916 (contains!769 lt!45197 (_1!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45200 () List!1537)

(assert (=> d!24311 (= lt!45197 (ListLongMap!1472 lt!45200))))

(declare-fun lt!45198 () Unit!2702)

(declare-fun lt!45199 () Unit!2702)

(assert (=> d!24311 (= lt!45198 lt!45199)))

(assert (=> d!24311 (= (getValueByKey!146 lt!45200 (_1!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24311 (= lt!45199 (lemmaContainsTupThenGetReturnValue!63 lt!45200 (_1!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24311 (= lt!45200 (insertStrictlySorted!66 (toList!751 lt!44764) (_1!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24311 (= (+!120 lt!44764 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45197)))

(declare-fun b!92239 () Bool)

(declare-fun res!46917 () Bool)

(assert (=> b!92239 (=> (not res!46917) (not e!60124))))

(assert (=> b!92239 (= res!46917 (= (getValueByKey!146 (toList!751 lt!45197) (_1!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92240 () Bool)

(assert (=> b!92240 (= e!60124 (contains!771 (toList!751 lt!45197) (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24311 res!46916) b!92239))

(assert (= (and b!92239 res!46917) b!92240))

(declare-fun m!99255 () Bool)

(assert (=> d!24311 m!99255))

(declare-fun m!99257 () Bool)

(assert (=> d!24311 m!99257))

(declare-fun m!99259 () Bool)

(assert (=> d!24311 m!99259))

(declare-fun m!99261 () Bool)

(assert (=> d!24311 m!99261))

(declare-fun m!99263 () Bool)

(assert (=> b!92239 m!99263))

(declare-fun m!99265 () Bool)

(assert (=> b!92240 m!99265))

(assert (=> b!91621 d!24311))

(declare-fun d!24313 () Bool)

(assert (=> d!24313 (= (apply!87 lt!44770 lt!44754) (get!1252 (getValueByKey!146 (toList!751 lt!44770) lt!44754)))))

(declare-fun bs!3822 () Bool)

(assert (= bs!3822 d!24313))

(declare-fun m!99267 () Bool)

(assert (=> bs!3822 m!99267))

(assert (=> bs!3822 m!99267))

(declare-fun m!99269 () Bool)

(assert (=> bs!3822 m!99269))

(assert (=> b!91621 d!24313))

(declare-fun d!24315 () Bool)

(assert (=> d!24315 (contains!769 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44757)))

(declare-fun lt!45203 () Unit!2702)

(declare-fun choose!559 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> d!24315 (= lt!45203 (choose!559 lt!44773 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44757))))

(assert (=> d!24315 (contains!769 lt!44773 lt!44757)))

(assert (=> d!24315 (= (addStillContains!63 lt!44773 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44757) lt!45203)))

(declare-fun bs!3823 () Bool)

(assert (= bs!3823 d!24315))

(assert (=> bs!3823 m!98405))

(assert (=> bs!3823 m!98405))

(assert (=> bs!3823 m!98413))

(declare-fun m!99271 () Bool)

(assert (=> bs!3823 m!99271))

(declare-fun m!99273 () Bool)

(assert (=> bs!3823 m!99273))

(assert (=> b!91621 d!24315))

(declare-fun d!24317 () Bool)

(assert (=> d!24317 (= (apply!87 (+!120 lt!44764 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44768) (apply!87 lt!44764 lt!44768))))

(declare-fun lt!45206 () Unit!2702)

(declare-fun choose!560 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> d!24317 (= lt!45206 (choose!560 lt!44764 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44768))))

(declare-fun e!60127 () Bool)

(assert (=> d!24317 e!60127))

(declare-fun res!46920 () Bool)

(assert (=> d!24317 (=> (not res!46920) (not e!60127))))

(assert (=> d!24317 (= res!46920 (contains!769 lt!44764 lt!44768))))

(assert (=> d!24317 (= (addApplyDifferent!63 lt!44764 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44768) lt!45206)))

(declare-fun b!92245 () Bool)

(assert (=> b!92245 (= e!60127 (not (= lt!44768 lt!44760)))))

(assert (= (and d!24317 res!46920) b!92245))

(assert (=> d!24317 m!98425))

(assert (=> d!24317 m!98407))

(assert (=> d!24317 m!98409))

(assert (=> d!24317 m!98407))

(declare-fun m!99275 () Bool)

(assert (=> d!24317 m!99275))

(declare-fun m!99277 () Bool)

(assert (=> d!24317 m!99277))

(assert (=> b!91621 d!24317))

(declare-fun d!24319 () Bool)

(assert (=> d!24319 (= (apply!87 lt!44769 lt!44761) (get!1252 (getValueByKey!146 (toList!751 lt!44769) lt!44761)))))

(declare-fun bs!3824 () Bool)

(assert (= bs!3824 d!24319))

(declare-fun m!99279 () Bool)

(assert (=> bs!3824 m!99279))

(assert (=> bs!3824 m!99279))

(declare-fun m!99281 () Bool)

(assert (=> bs!3824 m!99281))

(assert (=> b!91621 d!24319))

(declare-fun d!24321 () Bool)

(assert (=> d!24321 (= (apply!87 (+!120 lt!44769 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44761) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44769 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44761)))))

(declare-fun bs!3825 () Bool)

(assert (= bs!3825 d!24321))

(declare-fun m!99283 () Bool)

(assert (=> bs!3825 m!99283))

(assert (=> bs!3825 m!99283))

(declare-fun m!99285 () Bool)

(assert (=> bs!3825 m!99285))

(assert (=> b!91621 d!24321))

(declare-fun d!24323 () Bool)

(assert (=> d!24323 (= (apply!87 (+!120 lt!44764 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44768) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44764 (tuple2!2245 lt!44760 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44768)))))

(declare-fun bs!3826 () Bool)

(assert (= bs!3826 d!24323))

(declare-fun m!99287 () Bool)

(assert (=> bs!3826 m!99287))

(assert (=> bs!3826 m!99287))

(declare-fun m!99289 () Bool)

(assert (=> bs!3826 m!99289))

(assert (=> b!91621 d!24323))

(declare-fun d!24325 () Bool)

(assert (=> d!24325 (= (apply!87 (+!120 lt!44769 (tuple2!2245 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44761) (apply!87 lt!44769 lt!44761))))

(declare-fun lt!45207 () Unit!2702)

(assert (=> d!24325 (= lt!45207 (choose!560 lt!44769 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44761))))

(declare-fun e!60128 () Bool)

(assert (=> d!24325 e!60128))

(declare-fun res!46921 () Bool)

(assert (=> d!24325 (=> (not res!46921) (not e!60128))))

(assert (=> d!24325 (= res!46921 (contains!769 lt!44769 lt!44761))))

(assert (=> d!24325 (= (addApplyDifferent!63 lt!44769 lt!44771 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44761) lt!45207)))

(declare-fun b!92246 () Bool)

(assert (=> b!92246 (= e!60128 (not (= lt!44761 lt!44771)))))

(assert (= (and d!24325 res!46921) b!92246))

(assert (=> d!24325 m!98421))

(assert (=> d!24325 m!98401))

(assert (=> d!24325 m!98403))

(assert (=> d!24325 m!98401))

(declare-fun m!99291 () Bool)

(assert (=> d!24325 m!99291))

(declare-fun m!99293 () Bool)

(assert (=> d!24325 m!99293))

(assert (=> b!91621 d!24325))

(declare-fun d!24327 () Bool)

(declare-fun e!60129 () Bool)

(assert (=> d!24327 e!60129))

(declare-fun res!46922 () Bool)

(assert (=> d!24327 (=> (not res!46922) (not e!60129))))

(declare-fun lt!45208 () ListLongMap!1471)

(assert (=> d!24327 (= res!46922 (contains!769 lt!45208 (_1!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45211 () List!1537)

(assert (=> d!24327 (= lt!45208 (ListLongMap!1472 lt!45211))))

(declare-fun lt!45209 () Unit!2702)

(declare-fun lt!45210 () Unit!2702)

(assert (=> d!24327 (= lt!45209 lt!45210)))

(assert (=> d!24327 (= (getValueByKey!146 lt!45211 (_1!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24327 (= lt!45210 (lemmaContainsTupThenGetReturnValue!63 lt!45211 (_1!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24327 (= lt!45211 (insertStrictlySorted!66 (toList!751 lt!44773) (_1!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24327 (= (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45208)))

(declare-fun b!92247 () Bool)

(declare-fun res!46923 () Bool)

(assert (=> b!92247 (=> (not res!46923) (not e!60129))))

(assert (=> b!92247 (= res!46923 (= (getValueByKey!146 (toList!751 lt!45208) (_1!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92248 () Bool)

(assert (=> b!92248 (= e!60129 (contains!771 (toList!751 lt!45208) (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24327 res!46922) b!92247))

(assert (= (and b!92247 res!46923) b!92248))

(declare-fun m!99295 () Bool)

(assert (=> d!24327 m!99295))

(declare-fun m!99297 () Bool)

(assert (=> d!24327 m!99297))

(declare-fun m!99299 () Bool)

(assert (=> d!24327 m!99299))

(declare-fun m!99301 () Bool)

(assert (=> d!24327 m!99301))

(declare-fun m!99303 () Bool)

(assert (=> b!92247 m!99303))

(declare-fun m!99305 () Bool)

(assert (=> b!92248 m!99305))

(assert (=> b!91621 d!24327))

(declare-fun d!24329 () Bool)

(assert (=> d!24329 (= (apply!87 (+!120 lt!44770 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44754) (apply!87 lt!44770 lt!44754))))

(declare-fun lt!45212 () Unit!2702)

(assert (=> d!24329 (= lt!45212 (choose!560 lt!44770 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44754))))

(declare-fun e!60130 () Bool)

(assert (=> d!24329 e!60130))

(declare-fun res!46924 () Bool)

(assert (=> d!24329 (=> (not res!46924) (not e!60130))))

(assert (=> d!24329 (= res!46924 (contains!769 lt!44770 lt!44754))))

(assert (=> d!24329 (= (addApplyDifferent!63 lt!44770 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44754) lt!45212)))

(declare-fun b!92249 () Bool)

(assert (=> b!92249 (= e!60130 (not (= lt!44754 lt!44762)))))

(assert (= (and d!24329 res!46924) b!92249))

(assert (=> d!24329 m!98423))

(assert (=> d!24329 m!98397))

(assert (=> d!24329 m!98419))

(assert (=> d!24329 m!98397))

(declare-fun m!99307 () Bool)

(assert (=> d!24329 m!99307))

(declare-fun m!99309 () Bool)

(assert (=> d!24329 m!99309))

(assert (=> b!91621 d!24329))

(declare-fun d!24331 () Bool)

(declare-fun e!60131 () Bool)

(assert (=> d!24331 e!60131))

(declare-fun res!46925 () Bool)

(assert (=> d!24331 (=> res!46925 e!60131)))

(declare-fun lt!45214 () Bool)

(assert (=> d!24331 (= res!46925 (not lt!45214))))

(declare-fun lt!45215 () Bool)

(assert (=> d!24331 (= lt!45214 lt!45215)))

(declare-fun lt!45216 () Unit!2702)

(declare-fun e!60132 () Unit!2702)

(assert (=> d!24331 (= lt!45216 e!60132)))

(declare-fun c!15366 () Bool)

(assert (=> d!24331 (= c!15366 lt!45215)))

(assert (=> d!24331 (= lt!45215 (containsKey!149 (toList!751 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44757))))

(assert (=> d!24331 (= (contains!769 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44757) lt!45214)))

(declare-fun b!92250 () Bool)

(declare-fun lt!45213 () Unit!2702)

(assert (=> b!92250 (= e!60132 lt!45213)))

(assert (=> b!92250 (= lt!45213 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44757))))

(assert (=> b!92250 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44757))))

(declare-fun b!92251 () Bool)

(declare-fun Unit!2734 () Unit!2702)

(assert (=> b!92251 (= e!60132 Unit!2734)))

(declare-fun b!92252 () Bool)

(assert (=> b!92252 (= e!60131 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44773 (tuple2!2245 lt!44753 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44757)))))

(assert (= (and d!24331 c!15366) b!92250))

(assert (= (and d!24331 (not c!15366)) b!92251))

(assert (= (and d!24331 (not res!46925)) b!92252))

(declare-fun m!99311 () Bool)

(assert (=> d!24331 m!99311))

(declare-fun m!99313 () Bool)

(assert (=> b!92250 m!99313))

(declare-fun m!99315 () Bool)

(assert (=> b!92250 m!99315))

(assert (=> b!92250 m!99315))

(declare-fun m!99317 () Bool)

(assert (=> b!92250 m!99317))

(assert (=> b!92252 m!99315))

(assert (=> b!92252 m!99315))

(assert (=> b!92252 m!99317))

(assert (=> b!91621 d!24331))

(declare-fun d!24333 () Bool)

(assert (=> d!24333 (= (apply!87 lt!44764 lt!44768) (get!1252 (getValueByKey!146 (toList!751 lt!44764) lt!44768)))))

(declare-fun bs!3827 () Bool)

(assert (= bs!3827 d!24333))

(declare-fun m!99319 () Bool)

(assert (=> bs!3827 m!99319))

(assert (=> bs!3827 m!99319))

(declare-fun m!99321 () Bool)

(assert (=> bs!3827 m!99321))

(assert (=> b!91621 d!24333))

(declare-fun d!24335 () Bool)

(declare-fun e!60133 () Bool)

(assert (=> d!24335 e!60133))

(declare-fun res!46926 () Bool)

(assert (=> d!24335 (=> (not res!46926) (not e!60133))))

(declare-fun lt!45217 () ListLongMap!1471)

(assert (=> d!24335 (= res!46926 (contains!769 lt!45217 (_1!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45220 () List!1537)

(assert (=> d!24335 (= lt!45217 (ListLongMap!1472 lt!45220))))

(declare-fun lt!45218 () Unit!2702)

(declare-fun lt!45219 () Unit!2702)

(assert (=> d!24335 (= lt!45218 lt!45219)))

(assert (=> d!24335 (= (getValueByKey!146 lt!45220 (_1!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24335 (= lt!45219 (lemmaContainsTupThenGetReturnValue!63 lt!45220 (_1!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24335 (= lt!45220 (insertStrictlySorted!66 (toList!751 lt!44770) (_1!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24335 (= (+!120 lt!44770 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45217)))

(declare-fun b!92253 () Bool)

(declare-fun res!46927 () Bool)

(assert (=> b!92253 (=> (not res!46927) (not e!60133))))

(assert (=> b!92253 (= res!46927 (= (getValueByKey!146 (toList!751 lt!45217) (_1!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92254 () Bool)

(assert (=> b!92254 (= e!60133 (contains!771 (toList!751 lt!45217) (tuple2!2245 lt!44762 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24335 res!46926) b!92253))

(assert (= (and b!92253 res!46927) b!92254))

(declare-fun m!99323 () Bool)

(assert (=> d!24335 m!99323))

(declare-fun m!99325 () Bool)

(assert (=> d!24335 m!99325))

(declare-fun m!99327 () Bool)

(assert (=> d!24335 m!99327))

(declare-fun m!99329 () Bool)

(assert (=> d!24335 m!99329))

(declare-fun m!99331 () Bool)

(assert (=> b!92253 m!99331))

(declare-fun m!99333 () Bool)

(assert (=> b!92254 m!99333))

(assert (=> b!91621 d!24335))

(assert (=> b!91549 d!24255))

(declare-fun b!92267 () Bool)

(declare-fun e!60142 () SeekEntryResult!242)

(declare-fun lt!45227 () SeekEntryResult!242)

(assert (=> b!92267 (= e!60142 (MissingZero!242 (index!3110 lt!45227)))))

(declare-fun b!92268 () Bool)

(declare-fun c!15374 () Bool)

(declare-fun lt!45228 () (_ BitVec 64))

(assert (=> b!92268 (= c!15374 (= lt!45228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!60141 () SeekEntryResult!242)

(assert (=> b!92268 (= e!60141 e!60142)))

(declare-fun b!92269 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4117 (_ BitVec 32)) SeekEntryResult!242)

(assert (=> b!92269 (= e!60142 (seekKeyOrZeroReturnVacant!0 (x!12441 lt!45227) (index!3110 lt!45227) (index!3110 lt!45227) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun d!24337 () Bool)

(declare-fun lt!45229 () SeekEntryResult!242)

(assert (=> d!24337 (and (or ((_ is Undefined!242) lt!45229) (not ((_ is Found!242) lt!45229)) (and (bvsge (index!3109 lt!45229) #b00000000000000000000000000000000) (bvslt (index!3109 lt!45229) (size!2205 (_keys!4085 newMap!16))))) (or ((_ is Undefined!242) lt!45229) ((_ is Found!242) lt!45229) (not ((_ is MissingZero!242) lt!45229)) (and (bvsge (index!3108 lt!45229) #b00000000000000000000000000000000) (bvslt (index!3108 lt!45229) (size!2205 (_keys!4085 newMap!16))))) (or ((_ is Undefined!242) lt!45229) ((_ is Found!242) lt!45229) ((_ is MissingZero!242) lt!45229) (not ((_ is MissingVacant!242) lt!45229)) (and (bvsge (index!3111 lt!45229) #b00000000000000000000000000000000) (bvslt (index!3111 lt!45229) (size!2205 (_keys!4085 newMap!16))))) (or ((_ is Undefined!242) lt!45229) (ite ((_ is Found!242) lt!45229) (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3109 lt!45229)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) (ite ((_ is MissingZero!242) lt!45229) (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3108 lt!45229)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!242) lt!45229) (= (select (arr!1958 (_keys!4085 newMap!16)) (index!3111 lt!45229)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!60140 () SeekEntryResult!242)

(assert (=> d!24337 (= lt!45229 e!60140)))

(declare-fun c!15373 () Bool)

(assert (=> d!24337 (= c!15373 (and ((_ is Intermediate!242) lt!45227) (undefined!1054 lt!45227)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4117 (_ BitVec 32)) SeekEntryResult!242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!24337 (= lt!45227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (mask!6465 newMap!16)) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(assert (=> d!24337 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24337 (= (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) (_keys!4085 newMap!16) (mask!6465 newMap!16)) lt!45229)))

(declare-fun b!92270 () Bool)

(assert (=> b!92270 (= e!60140 e!60141)))

(assert (=> b!92270 (= lt!45228 (select (arr!1958 (_keys!4085 newMap!16)) (index!3110 lt!45227)))))

(declare-fun c!15375 () Bool)

(assert (=> b!92270 (= c!15375 (= lt!45228 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92271 () Bool)

(assert (=> b!92271 (= e!60141 (Found!242 (index!3110 lt!45227)))))

(declare-fun b!92272 () Bool)

(assert (=> b!92272 (= e!60140 Undefined!242)))

(assert (= (and d!24337 c!15373) b!92272))

(assert (= (and d!24337 (not c!15373)) b!92270))

(assert (= (and b!92270 c!15375) b!92271))

(assert (= (and b!92270 (not c!15375)) b!92268))

(assert (= (and b!92268 c!15374) b!92267))

(assert (= (and b!92268 (not c!15374)) b!92269))

(assert (=> b!92269 m!98059))

(declare-fun m!99335 () Bool)

(assert (=> b!92269 m!99335))

(declare-fun m!99337 () Bool)

(assert (=> d!24337 m!99337))

(assert (=> d!24337 m!98059))

(declare-fun m!99339 () Bool)

(assert (=> d!24337 m!99339))

(assert (=> d!24337 m!98733))

(declare-fun m!99341 () Bool)

(assert (=> d!24337 m!99341))

(assert (=> d!24337 m!98059))

(assert (=> d!24337 m!99337))

(declare-fun m!99343 () Bool)

(assert (=> d!24337 m!99343))

(declare-fun m!99345 () Bool)

(assert (=> d!24337 m!99345))

(declare-fun m!99347 () Bool)

(assert (=> b!92270 m!99347))

(assert (=> bm!9000 d!24337))

(declare-fun b!92275 () Bool)

(declare-fun e!60144 () Option!152)

(assert (=> b!92275 (= e!60144 (getValueByKey!146 (t!5363 (toList!751 lt!44692)) (_1!1133 lt!44534)))))

(declare-fun b!92276 () Bool)

(assert (=> b!92276 (= e!60144 None!150)))

(declare-fun d!24339 () Bool)

(declare-fun c!15376 () Bool)

(assert (=> d!24339 (= c!15376 (and ((_ is Cons!1533) (toList!751 lt!44692)) (= (_1!1133 (h!2125 (toList!751 lt!44692))) (_1!1133 lt!44534))))))

(declare-fun e!60143 () Option!152)

(assert (=> d!24339 (= (getValueByKey!146 (toList!751 lt!44692) (_1!1133 lt!44534)) e!60143)))

(declare-fun b!92274 () Bool)

(assert (=> b!92274 (= e!60143 e!60144)))

(declare-fun c!15377 () Bool)

(assert (=> b!92274 (= c!15377 (and ((_ is Cons!1533) (toList!751 lt!44692)) (not (= (_1!1133 (h!2125 (toList!751 lt!44692))) (_1!1133 lt!44534)))))))

(declare-fun b!92273 () Bool)

(assert (=> b!92273 (= e!60143 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44692)))))))

(assert (= (and d!24339 c!15376) b!92273))

(assert (= (and d!24339 (not c!15376)) b!92274))

(assert (= (and b!92274 c!15377) b!92275))

(assert (= (and b!92274 (not c!15377)) b!92276))

(declare-fun m!99349 () Bool)

(assert (=> b!92275 m!99349))

(assert (=> b!91567 d!24339))

(declare-fun d!24341 () Bool)

(assert (=> d!24341 (= (apply!87 lt!44784 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1252 (getValueByKey!146 (toList!751 lt!44784) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3828 () Bool)

(assert (= bs!3828 d!24341))

(assert (=> bs!3828 m!98981))

(assert (=> bs!3828 m!98981))

(declare-fun m!99351 () Bool)

(assert (=> bs!3828 m!99351))

(assert (=> b!91649 d!24341))

(declare-fun b!92279 () Bool)

(declare-fun e!60146 () Option!152)

(assert (=> b!92279 (= e!60146 (getValueByKey!146 (t!5363 (toList!751 lt!44700)) (_1!1133 lt!44540)))))

(declare-fun b!92280 () Bool)

(assert (=> b!92280 (= e!60146 None!150)))

(declare-fun d!24343 () Bool)

(declare-fun c!15378 () Bool)

(assert (=> d!24343 (= c!15378 (and ((_ is Cons!1533) (toList!751 lt!44700)) (= (_1!1133 (h!2125 (toList!751 lt!44700))) (_1!1133 lt!44540))))))

(declare-fun e!60145 () Option!152)

(assert (=> d!24343 (= (getValueByKey!146 (toList!751 lt!44700) (_1!1133 lt!44540)) e!60145)))

(declare-fun b!92278 () Bool)

(assert (=> b!92278 (= e!60145 e!60146)))

(declare-fun c!15379 () Bool)

(assert (=> b!92278 (= c!15379 (and ((_ is Cons!1533) (toList!751 lt!44700)) (not (= (_1!1133 (h!2125 (toList!751 lt!44700))) (_1!1133 lt!44540)))))))

(declare-fun b!92277 () Bool)

(assert (=> b!92277 (= e!60145 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44700)))))))

(assert (= (and d!24343 c!15378) b!92277))

(assert (= (and d!24343 (not c!15378)) b!92278))

(assert (= (and b!92278 c!15379) b!92279))

(assert (= (and b!92278 (not c!15379)) b!92280))

(declare-fun m!99353 () Bool)

(assert (=> b!92279 m!99353))

(assert (=> b!91571 d!24343))

(assert (=> b!91556 d!24201))

(declare-fun d!24345 () Bool)

(assert (=> d!24345 (not (contains!769 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669)) lt!44673))))

(declare-fun lt!45232 () Unit!2702)

(declare-fun choose!561 (ListLongMap!1471 (_ BitVec 64) V!3089 (_ BitVec 64)) Unit!2702)

(assert (=> d!24345 (= lt!45232 (choose!561 lt!44671 lt!44670 lt!44669 lt!44673))))

(declare-fun e!60149 () Bool)

(assert (=> d!24345 e!60149))

(declare-fun res!46930 () Bool)

(assert (=> d!24345 (=> (not res!46930) (not e!60149))))

(assert (=> d!24345 (= res!46930 (not (contains!769 lt!44671 lt!44673)))))

(assert (=> d!24345 (= (addStillNotContains!38 lt!44671 lt!44670 lt!44669 lt!44673) lt!45232)))

(declare-fun b!92284 () Bool)

(assert (=> b!92284 (= e!60149 (not (= lt!44670 lt!44673)))))

(assert (= (and d!24345 res!46930) b!92284))

(assert (=> d!24345 m!98303))

(assert (=> d!24345 m!98303))

(assert (=> d!24345 m!98305))

(declare-fun m!99355 () Bool)

(assert (=> d!24345 m!99355))

(declare-fun m!99357 () Bool)

(assert (=> d!24345 m!99357))

(assert (=> b!91556 d!24345))

(declare-fun d!24347 () Bool)

(declare-fun e!60150 () Bool)

(assert (=> d!24347 e!60150))

(declare-fun res!46931 () Bool)

(assert (=> d!24347 (=> (not res!46931) (not e!60150))))

(declare-fun lt!45233 () ListLongMap!1471)

(assert (=> d!24347 (= res!46931 (contains!769 lt!45233 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!45236 () List!1537)

(assert (=> d!24347 (= lt!45233 (ListLongMap!1472 lt!45236))))

(declare-fun lt!45234 () Unit!2702)

(declare-fun lt!45235 () Unit!2702)

(assert (=> d!24347 (= lt!45234 lt!45235)))

(assert (=> d!24347 (= (getValueByKey!146 lt!45236 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24347 (= lt!45235 (lemmaContainsTupThenGetReturnValue!63 lt!45236 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24347 (= lt!45236 (insertStrictlySorted!66 (toList!751 call!8915) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!24347 (= (+!120 call!8915 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!45233)))

(declare-fun b!92285 () Bool)

(declare-fun res!46932 () Bool)

(assert (=> b!92285 (=> (not res!46932) (not e!60150))))

(assert (=> b!92285 (= res!46932 (= (getValueByKey!146 (toList!751 lt!45233) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!92286 () Bool)

(assert (=> b!92286 (= e!60150 (contains!771 (toList!751 lt!45233) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1247 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!24347 res!46931) b!92285))

(assert (= (and b!92285 res!46932) b!92286))

(declare-fun m!99359 () Bool)

(assert (=> d!24347 m!99359))

(declare-fun m!99361 () Bool)

(assert (=> d!24347 m!99361))

(declare-fun m!99363 () Bool)

(assert (=> d!24347 m!99363))

(declare-fun m!99365 () Bool)

(assert (=> d!24347 m!99365))

(declare-fun m!99367 () Bool)

(assert (=> b!92285 m!99367))

(declare-fun m!99369 () Bool)

(assert (=> b!92286 m!99369))

(assert (=> b!91556 d!24347))

(declare-fun d!24349 () Bool)

(declare-fun e!60151 () Bool)

(assert (=> d!24349 e!60151))

(declare-fun res!46933 () Bool)

(assert (=> d!24349 (=> res!46933 e!60151)))

(declare-fun lt!45238 () Bool)

(assert (=> d!24349 (= res!46933 (not lt!45238))))

(declare-fun lt!45239 () Bool)

(assert (=> d!24349 (= lt!45238 lt!45239)))

(declare-fun lt!45240 () Unit!2702)

(declare-fun e!60152 () Unit!2702)

(assert (=> d!24349 (= lt!45240 e!60152)))

(declare-fun c!15380 () Bool)

(assert (=> d!24349 (= c!15380 lt!45239)))

(assert (=> d!24349 (= lt!45239 (containsKey!149 (toList!751 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669))) lt!44673))))

(assert (=> d!24349 (= (contains!769 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669)) lt!44673) lt!45238)))

(declare-fun b!92287 () Bool)

(declare-fun lt!45237 () Unit!2702)

(assert (=> b!92287 (= e!60152 lt!45237)))

(assert (=> b!92287 (= lt!45237 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669))) lt!44673))))

(assert (=> b!92287 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669))) lt!44673))))

(declare-fun b!92288 () Bool)

(declare-fun Unit!2735 () Unit!2702)

(assert (=> b!92288 (= e!60152 Unit!2735)))

(declare-fun b!92289 () Bool)

(assert (=> b!92289 (= e!60151 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669))) lt!44673)))))

(assert (= (and d!24349 c!15380) b!92287))

(assert (= (and d!24349 (not c!15380)) b!92288))

(assert (= (and d!24349 (not res!46933)) b!92289))

(declare-fun m!99371 () Bool)

(assert (=> d!24349 m!99371))

(declare-fun m!99373 () Bool)

(assert (=> b!92287 m!99373))

(declare-fun m!99375 () Bool)

(assert (=> b!92287 m!99375))

(assert (=> b!92287 m!99375))

(declare-fun m!99377 () Bool)

(assert (=> b!92287 m!99377))

(assert (=> b!92289 m!99375))

(assert (=> b!92289 m!99375))

(assert (=> b!92289 m!99377))

(assert (=> b!91556 d!24349))

(declare-fun d!24351 () Bool)

(declare-fun e!60153 () Bool)

(assert (=> d!24351 e!60153))

(declare-fun res!46934 () Bool)

(assert (=> d!24351 (=> (not res!46934) (not e!60153))))

(declare-fun lt!45241 () ListLongMap!1471)

(assert (=> d!24351 (= res!46934 (contains!769 lt!45241 (_1!1133 (tuple2!2245 lt!44670 lt!44669))))))

(declare-fun lt!45244 () List!1537)

(assert (=> d!24351 (= lt!45241 (ListLongMap!1472 lt!45244))))

(declare-fun lt!45242 () Unit!2702)

(declare-fun lt!45243 () Unit!2702)

(assert (=> d!24351 (= lt!45242 lt!45243)))

(assert (=> d!24351 (= (getValueByKey!146 lt!45244 (_1!1133 (tuple2!2245 lt!44670 lt!44669))) (Some!151 (_2!1133 (tuple2!2245 lt!44670 lt!44669))))))

(assert (=> d!24351 (= lt!45243 (lemmaContainsTupThenGetReturnValue!63 lt!45244 (_1!1133 (tuple2!2245 lt!44670 lt!44669)) (_2!1133 (tuple2!2245 lt!44670 lt!44669))))))

(assert (=> d!24351 (= lt!45244 (insertStrictlySorted!66 (toList!751 lt!44671) (_1!1133 (tuple2!2245 lt!44670 lt!44669)) (_2!1133 (tuple2!2245 lt!44670 lt!44669))))))

(assert (=> d!24351 (= (+!120 lt!44671 (tuple2!2245 lt!44670 lt!44669)) lt!45241)))

(declare-fun b!92290 () Bool)

(declare-fun res!46935 () Bool)

(assert (=> b!92290 (=> (not res!46935) (not e!60153))))

(assert (=> b!92290 (= res!46935 (= (getValueByKey!146 (toList!751 lt!45241) (_1!1133 (tuple2!2245 lt!44670 lt!44669))) (Some!151 (_2!1133 (tuple2!2245 lt!44670 lt!44669)))))))

(declare-fun b!92291 () Bool)

(assert (=> b!92291 (= e!60153 (contains!771 (toList!751 lt!45241) (tuple2!2245 lt!44670 lt!44669)))))

(assert (= (and d!24351 res!46934) b!92290))

(assert (= (and b!92290 res!46935) b!92291))

(declare-fun m!99379 () Bool)

(assert (=> d!24351 m!99379))

(declare-fun m!99381 () Bool)

(assert (=> d!24351 m!99381))

(declare-fun m!99383 () Bool)

(assert (=> d!24351 m!99383))

(declare-fun m!99385 () Bool)

(assert (=> d!24351 m!99385))

(declare-fun m!99387 () Bool)

(assert (=> b!92290 m!99387))

(declare-fun m!99389 () Bool)

(assert (=> b!92291 m!99389))

(assert (=> b!91556 d!24351))

(declare-fun d!24353 () Bool)

(declare-fun e!60154 () Bool)

(assert (=> d!24353 e!60154))

(declare-fun res!46936 () Bool)

(assert (=> d!24353 (=> res!46936 e!60154)))

(declare-fun lt!45246 () Bool)

(assert (=> d!24353 (= res!46936 (not lt!45246))))

(declare-fun lt!45247 () Bool)

(assert (=> d!24353 (= lt!45246 lt!45247)))

(declare-fun lt!45248 () Unit!2702)

(declare-fun e!60155 () Unit!2702)

(assert (=> d!24353 (= lt!45248 e!60155)))

(declare-fun c!15381 () Bool)

(assert (=> d!24353 (= c!15381 lt!45247)))

(assert (=> d!24353 (= lt!45247 (containsKey!149 (toList!751 lt!44684) (_1!1133 lt!44534)))))

(assert (=> d!24353 (= (contains!769 lt!44684 (_1!1133 lt!44534)) lt!45246)))

(declare-fun b!92292 () Bool)

(declare-fun lt!45245 () Unit!2702)

(assert (=> b!92292 (= e!60155 lt!45245)))

(assert (=> b!92292 (= lt!45245 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44684) (_1!1133 lt!44534)))))

(assert (=> b!92292 (isDefined!98 (getValueByKey!146 (toList!751 lt!44684) (_1!1133 lt!44534)))))

(declare-fun b!92293 () Bool)

(declare-fun Unit!2736 () Unit!2702)

(assert (=> b!92293 (= e!60155 Unit!2736)))

(declare-fun b!92294 () Bool)

(assert (=> b!92294 (= e!60154 (isDefined!98 (getValueByKey!146 (toList!751 lt!44684) (_1!1133 lt!44534))))))

(assert (= (and d!24353 c!15381) b!92292))

(assert (= (and d!24353 (not c!15381)) b!92293))

(assert (= (and d!24353 (not res!46936)) b!92294))

(declare-fun m!99391 () Bool)

(assert (=> d!24353 m!99391))

(declare-fun m!99393 () Bool)

(assert (=> b!92292 m!99393))

(assert (=> b!92292 m!98319))

(assert (=> b!92292 m!98319))

(declare-fun m!99395 () Bool)

(assert (=> b!92292 m!99395))

(assert (=> b!92294 m!98319))

(assert (=> b!92294 m!98319))

(assert (=> b!92294 m!99395))

(assert (=> d!24109 d!24353))

(declare-fun b!92297 () Bool)

(declare-fun e!60157 () Option!152)

(assert (=> b!92297 (= e!60157 (getValueByKey!146 (t!5363 lt!44687) (_1!1133 lt!44534)))))

(declare-fun b!92298 () Bool)

(assert (=> b!92298 (= e!60157 None!150)))

(declare-fun d!24355 () Bool)

(declare-fun c!15382 () Bool)

(assert (=> d!24355 (= c!15382 (and ((_ is Cons!1533) lt!44687) (= (_1!1133 (h!2125 lt!44687)) (_1!1133 lt!44534))))))

(declare-fun e!60156 () Option!152)

(assert (=> d!24355 (= (getValueByKey!146 lt!44687 (_1!1133 lt!44534)) e!60156)))

(declare-fun b!92296 () Bool)

(assert (=> b!92296 (= e!60156 e!60157)))

(declare-fun c!15383 () Bool)

(assert (=> b!92296 (= c!15383 (and ((_ is Cons!1533) lt!44687) (not (= (_1!1133 (h!2125 lt!44687)) (_1!1133 lt!44534)))))))

(declare-fun b!92295 () Bool)

(assert (=> b!92295 (= e!60156 (Some!151 (_2!1133 (h!2125 lt!44687))))))

(assert (= (and d!24355 c!15382) b!92295))

(assert (= (and d!24355 (not c!15382)) b!92296))

(assert (= (and b!92296 c!15383) b!92297))

(assert (= (and b!92296 (not c!15383)) b!92298))

(declare-fun m!99397 () Bool)

(assert (=> b!92297 m!99397))

(assert (=> d!24109 d!24355))

(declare-fun d!24357 () Bool)

(assert (=> d!24357 (= (getValueByKey!146 lt!44687 (_1!1133 lt!44534)) (Some!151 (_2!1133 lt!44534)))))

(declare-fun lt!45249 () Unit!2702)

(assert (=> d!24357 (= lt!45249 (choose!555 lt!44687 (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun e!60158 () Bool)

(assert (=> d!24357 e!60158))

(declare-fun res!46937 () Bool)

(assert (=> d!24357 (=> (not res!46937) (not e!60158))))

(assert (=> d!24357 (= res!46937 (isStrictlySorted!288 lt!44687))))

(assert (=> d!24357 (= (lemmaContainsTupThenGetReturnValue!63 lt!44687 (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45249)))

(declare-fun b!92299 () Bool)

(declare-fun res!46938 () Bool)

(assert (=> b!92299 (=> (not res!46938) (not e!60158))))

(assert (=> b!92299 (= res!46938 (containsKey!149 lt!44687 (_1!1133 lt!44534)))))

(declare-fun b!92300 () Bool)

(assert (=> b!92300 (= e!60158 (contains!771 lt!44687 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24357 res!46937) b!92299))

(assert (= (and b!92299 res!46938) b!92300))

(assert (=> d!24357 m!98313))

(declare-fun m!99399 () Bool)

(assert (=> d!24357 m!99399))

(declare-fun m!99401 () Bool)

(assert (=> d!24357 m!99401))

(declare-fun m!99403 () Bool)

(assert (=> b!92299 m!99403))

(declare-fun m!99405 () Bool)

(assert (=> b!92300 m!99405))

(assert (=> d!24109 d!24357))

(declare-fun b!92301 () Bool)

(declare-fun c!15387 () Bool)

(declare-fun e!60162 () List!1537)

(declare-fun c!15384 () Bool)

(assert (=> b!92301 (= e!60162 (ite c!15387 (t!5363 (toList!751 (+!120 lt!44533 lt!44536))) (ite c!15384 (Cons!1533 (h!2125 (toList!751 (+!120 lt!44533 lt!44536))) (t!5363 (toList!751 (+!120 lt!44533 lt!44536)))) Nil!1534)))))

(declare-fun call!9080 () List!1537)

(declare-fun bm!9077 () Bool)

(declare-fun c!15385 () Bool)

(assert (=> bm!9077 (= call!9080 ($colon$colon!74 e!60162 (ite c!15385 (h!2125 (toList!751 (+!120 lt!44533 lt!44536))) (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534)))))))

(declare-fun c!15386 () Bool)

(assert (=> bm!9077 (= c!15386 c!15385)))

(declare-fun b!92302 () Bool)

(assert (=> b!92302 (= e!60162 (insertStrictlySorted!66 (t!5363 (toList!751 (+!120 lt!44533 lt!44536))) (_1!1133 lt!44534) (_2!1133 lt!44534)))))

(declare-fun d!24359 () Bool)

(declare-fun e!60159 () Bool)

(assert (=> d!24359 e!60159))

(declare-fun res!46940 () Bool)

(assert (=> d!24359 (=> (not res!46940) (not e!60159))))

(declare-fun lt!45250 () List!1537)

(assert (=> d!24359 (= res!46940 (isStrictlySorted!288 lt!45250))))

(declare-fun e!60163 () List!1537)

(assert (=> d!24359 (= lt!45250 e!60163)))

(assert (=> d!24359 (= c!15385 (and ((_ is Cons!1533) (toList!751 (+!120 lt!44533 lt!44536))) (bvslt (_1!1133 (h!2125 (toList!751 (+!120 lt!44533 lt!44536)))) (_1!1133 lt!44534))))))

(assert (=> d!24359 (isStrictlySorted!288 (toList!751 (+!120 lt!44533 lt!44536)))))

(assert (=> d!24359 (= (insertStrictlySorted!66 (toList!751 (+!120 lt!44533 lt!44536)) (_1!1133 lt!44534) (_2!1133 lt!44534)) lt!45250)))

(declare-fun b!92303 () Bool)

(declare-fun e!60160 () List!1537)

(declare-fun call!9081 () List!1537)

(assert (=> b!92303 (= e!60160 call!9081)))

(declare-fun b!92304 () Bool)

(declare-fun e!60161 () List!1537)

(declare-fun call!9082 () List!1537)

(assert (=> b!92304 (= e!60161 call!9082)))

(declare-fun b!92305 () Bool)

(declare-fun res!46939 () Bool)

(assert (=> b!92305 (=> (not res!46939) (not e!60159))))

(assert (=> b!92305 (= res!46939 (containsKey!149 lt!45250 (_1!1133 lt!44534)))))

(declare-fun bm!9078 () Bool)

(assert (=> bm!9078 (= call!9081 call!9080)))

(declare-fun b!92306 () Bool)

(assert (=> b!92306 (= e!60161 call!9082)))

(declare-fun bm!9079 () Bool)

(assert (=> bm!9079 (= call!9082 call!9081)))

(declare-fun b!92307 () Bool)

(assert (=> b!92307 (= e!60163 call!9080)))

(declare-fun b!92308 () Bool)

(assert (=> b!92308 (= c!15384 (and ((_ is Cons!1533) (toList!751 (+!120 lt!44533 lt!44536))) (bvsgt (_1!1133 (h!2125 (toList!751 (+!120 lt!44533 lt!44536)))) (_1!1133 lt!44534))))))

(assert (=> b!92308 (= e!60160 e!60161)))

(declare-fun b!92309 () Bool)

(assert (=> b!92309 (= e!60163 e!60160)))

(assert (=> b!92309 (= c!15387 (and ((_ is Cons!1533) (toList!751 (+!120 lt!44533 lt!44536))) (= (_1!1133 (h!2125 (toList!751 (+!120 lt!44533 lt!44536)))) (_1!1133 lt!44534))))))

(declare-fun b!92310 () Bool)

(assert (=> b!92310 (= e!60159 (contains!771 lt!45250 (tuple2!2245 (_1!1133 lt!44534) (_2!1133 lt!44534))))))

(assert (= (and d!24359 c!15385) b!92307))

(assert (= (and d!24359 (not c!15385)) b!92309))

(assert (= (and b!92309 c!15387) b!92303))

(assert (= (and b!92309 (not c!15387)) b!92308))

(assert (= (and b!92308 c!15384) b!92304))

(assert (= (and b!92308 (not c!15384)) b!92306))

(assert (= (or b!92304 b!92306) bm!9079))

(assert (= (or b!92303 bm!9079) bm!9078))

(assert (= (or b!92307 bm!9078) bm!9077))

(assert (= (and bm!9077 c!15386) b!92302))

(assert (= (and bm!9077 (not c!15386)) b!92301))

(assert (= (and d!24359 res!46940) b!92305))

(assert (= (and b!92305 res!46939) b!92310))

(declare-fun m!99407 () Bool)

(assert (=> bm!9077 m!99407))

(declare-fun m!99409 () Bool)

(assert (=> b!92305 m!99409))

(declare-fun m!99411 () Bool)

(assert (=> d!24359 m!99411))

(declare-fun m!99413 () Bool)

(assert (=> d!24359 m!99413))

(declare-fun m!99415 () Bool)

(assert (=> b!92310 m!99415))

(declare-fun m!99417 () Bool)

(assert (=> b!92302 m!99417))

(assert (=> d!24109 d!24359))

(assert (=> b!91823 d!24177))

(declare-fun d!24361 () Bool)

(declare-fun e!60164 () Bool)

(assert (=> d!24361 e!60164))

(declare-fun res!46941 () Bool)

(assert (=> d!24361 (=> (not res!46941) (not e!60164))))

(declare-fun lt!45251 () ListLongMap!1471)

(assert (=> d!24361 (= res!46941 (contains!769 lt!45251 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45254 () List!1537)

(assert (=> d!24361 (= lt!45251 (ListLongMap!1472 lt!45254))))

(declare-fun lt!45252 () Unit!2702)

(declare-fun lt!45253 () Unit!2702)

(assert (=> d!24361 (= lt!45252 lt!45253)))

(assert (=> d!24361 (= (getValueByKey!146 lt!45254 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24361 (= lt!45253 (lemmaContainsTupThenGetReturnValue!63 lt!45254 (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24361 (= lt!45254 (insertStrictlySorted!66 (toList!751 call!8938) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24361 (= (+!120 call!8938 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45251)))

(declare-fun b!92311 () Bool)

(declare-fun res!46942 () Bool)

(assert (=> b!92311 (=> (not res!46942) (not e!60164))))

(assert (=> b!92311 (= res!46942 (= (getValueByKey!146 (toList!751 lt!45251) (_1!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92312 () Bool)

(assert (=> b!92312 (= e!60164 (contains!771 (toList!751 lt!45251) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24361 res!46941) b!92311))

(assert (= (and b!92311 res!46942) b!92312))

(declare-fun m!99419 () Bool)

(assert (=> d!24361 m!99419))

(declare-fun m!99421 () Bool)

(assert (=> d!24361 m!99421))

(declare-fun m!99423 () Bool)

(assert (=> d!24361 m!99423))

(declare-fun m!99425 () Bool)

(assert (=> d!24361 m!99425))

(declare-fun m!99427 () Bool)

(assert (=> b!92311 m!99427))

(declare-fun m!99429 () Bool)

(assert (=> b!92312 m!99429))

(assert (=> b!91656 d!24361))

(declare-fun d!24363 () Bool)

(declare-fun e!60165 () Bool)

(assert (=> d!24363 e!60165))

(declare-fun res!46943 () Bool)

(assert (=> d!24363 (=> res!46943 e!60165)))

(declare-fun lt!45256 () Bool)

(assert (=> d!24363 (= res!46943 (not lt!45256))))

(declare-fun lt!45257 () Bool)

(assert (=> d!24363 (= lt!45256 lt!45257)))

(declare-fun lt!45258 () Unit!2702)

(declare-fun e!60166 () Unit!2702)

(assert (=> d!24363 (= lt!45258 e!60166)))

(declare-fun c!15388 () Bool)

(assert (=> d!24363 (= c!15388 lt!45257)))

(assert (=> d!24363 (= lt!45257 (containsKey!149 (toList!751 lt!44705) (_1!1133 lt!44536)))))

(assert (=> d!24363 (= (contains!769 lt!44705 (_1!1133 lt!44536)) lt!45256)))

(declare-fun b!92313 () Bool)

(declare-fun lt!45255 () Unit!2702)

(assert (=> b!92313 (= e!60166 lt!45255)))

(assert (=> b!92313 (= lt!45255 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44705) (_1!1133 lt!44536)))))

(assert (=> b!92313 (isDefined!98 (getValueByKey!146 (toList!751 lt!44705) (_1!1133 lt!44536)))))

(declare-fun b!92314 () Bool)

(declare-fun Unit!2737 () Unit!2702)

(assert (=> b!92314 (= e!60166 Unit!2737)))

(declare-fun b!92315 () Bool)

(assert (=> b!92315 (= e!60165 (isDefined!98 (getValueByKey!146 (toList!751 lt!44705) (_1!1133 lt!44536))))))

(assert (= (and d!24363 c!15388) b!92313))

(assert (= (and d!24363 (not c!15388)) b!92314))

(assert (= (and d!24363 (not res!46943)) b!92315))

(declare-fun m!99431 () Bool)

(assert (=> d!24363 m!99431))

(declare-fun m!99433 () Bool)

(assert (=> b!92313 m!99433))

(assert (=> b!92313 m!98389))

(assert (=> b!92313 m!98389))

(declare-fun m!99435 () Bool)

(assert (=> b!92313 m!99435))

(assert (=> b!92315 m!98389))

(assert (=> b!92315 m!98389))

(assert (=> b!92315 m!99435))

(assert (=> d!24121 d!24363))

(declare-fun b!92318 () Bool)

(declare-fun e!60168 () Option!152)

(assert (=> b!92318 (= e!60168 (getValueByKey!146 (t!5363 lt!44708) (_1!1133 lt!44536)))))

(declare-fun b!92319 () Bool)

(assert (=> b!92319 (= e!60168 None!150)))

(declare-fun d!24365 () Bool)

(declare-fun c!15389 () Bool)

(assert (=> d!24365 (= c!15389 (and ((_ is Cons!1533) lt!44708) (= (_1!1133 (h!2125 lt!44708)) (_1!1133 lt!44536))))))

(declare-fun e!60167 () Option!152)

(assert (=> d!24365 (= (getValueByKey!146 lt!44708 (_1!1133 lt!44536)) e!60167)))

(declare-fun b!92317 () Bool)

(assert (=> b!92317 (= e!60167 e!60168)))

(declare-fun c!15390 () Bool)

(assert (=> b!92317 (= c!15390 (and ((_ is Cons!1533) lt!44708) (not (= (_1!1133 (h!2125 lt!44708)) (_1!1133 lt!44536)))))))

(declare-fun b!92316 () Bool)

(assert (=> b!92316 (= e!60167 (Some!151 (_2!1133 (h!2125 lt!44708))))))

(assert (= (and d!24365 c!15389) b!92316))

(assert (= (and d!24365 (not c!15389)) b!92317))

(assert (= (and b!92317 c!15390) b!92318))

(assert (= (and b!92317 (not c!15390)) b!92319))

(declare-fun m!99437 () Bool)

(assert (=> b!92318 m!99437))

(assert (=> d!24121 d!24365))

(declare-fun d!24367 () Bool)

(assert (=> d!24367 (= (getValueByKey!146 lt!44708 (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536)))))

(declare-fun lt!45259 () Unit!2702)

(assert (=> d!24367 (= lt!45259 (choose!555 lt!44708 (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(declare-fun e!60169 () Bool)

(assert (=> d!24367 e!60169))

(declare-fun res!46944 () Bool)

(assert (=> d!24367 (=> (not res!46944) (not e!60169))))

(assert (=> d!24367 (= res!46944 (isStrictlySorted!288 lt!44708))))

(assert (=> d!24367 (= (lemmaContainsTupThenGetReturnValue!63 lt!44708 (_1!1133 lt!44536) (_2!1133 lt!44536)) lt!45259)))

(declare-fun b!92320 () Bool)

(declare-fun res!46945 () Bool)

(assert (=> b!92320 (=> (not res!46945) (not e!60169))))

(assert (=> b!92320 (= res!46945 (containsKey!149 lt!44708 (_1!1133 lt!44536)))))

(declare-fun b!92321 () Bool)

(assert (=> b!92321 (= e!60169 (contains!771 lt!44708 (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536))))))

(assert (= (and d!24367 res!46944) b!92320))

(assert (= (and b!92320 res!46945) b!92321))

(assert (=> d!24367 m!98383))

(declare-fun m!99439 () Bool)

(assert (=> d!24367 m!99439))

(declare-fun m!99441 () Bool)

(assert (=> d!24367 m!99441))

(declare-fun m!99443 () Bool)

(assert (=> b!92320 m!99443))

(declare-fun m!99445 () Bool)

(assert (=> b!92321 m!99445))

(assert (=> d!24121 d!24367))

(declare-fun c!15391 () Bool)

(declare-fun b!92322 () Bool)

(declare-fun e!60173 () List!1537)

(declare-fun c!15394 () Bool)

(assert (=> b!92322 (= e!60173 (ite c!15394 (t!5363 (toList!751 lt!44530)) (ite c!15391 (Cons!1533 (h!2125 (toList!751 lt!44530)) (t!5363 (toList!751 lt!44530))) Nil!1534)))))

(declare-fun bm!9080 () Bool)

(declare-fun call!9083 () List!1537)

(declare-fun c!15392 () Bool)

(assert (=> bm!9080 (= call!9083 ($colon$colon!74 e!60173 (ite c!15392 (h!2125 (toList!751 lt!44530)) (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536)))))))

(declare-fun c!15393 () Bool)

(assert (=> bm!9080 (= c!15393 c!15392)))

(declare-fun b!92323 () Bool)

(assert (=> b!92323 (= e!60173 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44530)) (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(declare-fun d!24369 () Bool)

(declare-fun e!60170 () Bool)

(assert (=> d!24369 e!60170))

(declare-fun res!46947 () Bool)

(assert (=> d!24369 (=> (not res!46947) (not e!60170))))

(declare-fun lt!45260 () List!1537)

(assert (=> d!24369 (= res!46947 (isStrictlySorted!288 lt!45260))))

(declare-fun e!60174 () List!1537)

(assert (=> d!24369 (= lt!45260 e!60174)))

(assert (=> d!24369 (= c!15392 (and ((_ is Cons!1533) (toList!751 lt!44530)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44530))) (_1!1133 lt!44536))))))

(assert (=> d!24369 (isStrictlySorted!288 (toList!751 lt!44530))))

(assert (=> d!24369 (= (insertStrictlySorted!66 (toList!751 lt!44530) (_1!1133 lt!44536) (_2!1133 lt!44536)) lt!45260)))

(declare-fun b!92324 () Bool)

(declare-fun e!60171 () List!1537)

(declare-fun call!9084 () List!1537)

(assert (=> b!92324 (= e!60171 call!9084)))

(declare-fun b!92325 () Bool)

(declare-fun e!60172 () List!1537)

(declare-fun call!9085 () List!1537)

(assert (=> b!92325 (= e!60172 call!9085)))

(declare-fun b!92326 () Bool)

(declare-fun res!46946 () Bool)

(assert (=> b!92326 (=> (not res!46946) (not e!60170))))

(assert (=> b!92326 (= res!46946 (containsKey!149 lt!45260 (_1!1133 lt!44536)))))

(declare-fun bm!9081 () Bool)

(assert (=> bm!9081 (= call!9084 call!9083)))

(declare-fun b!92327 () Bool)

(assert (=> b!92327 (= e!60172 call!9085)))

(declare-fun bm!9082 () Bool)

(assert (=> bm!9082 (= call!9085 call!9084)))

(declare-fun b!92328 () Bool)

(assert (=> b!92328 (= e!60174 call!9083)))

(declare-fun b!92329 () Bool)

(assert (=> b!92329 (= c!15391 (and ((_ is Cons!1533) (toList!751 lt!44530)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44530))) (_1!1133 lt!44536))))))

(assert (=> b!92329 (= e!60171 e!60172)))

(declare-fun b!92330 () Bool)

(assert (=> b!92330 (= e!60174 e!60171)))

(assert (=> b!92330 (= c!15394 (and ((_ is Cons!1533) (toList!751 lt!44530)) (= (_1!1133 (h!2125 (toList!751 lt!44530))) (_1!1133 lt!44536))))))

(declare-fun b!92331 () Bool)

(assert (=> b!92331 (= e!60170 (contains!771 lt!45260 (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536))))))

(assert (= (and d!24369 c!15392) b!92328))

(assert (= (and d!24369 (not c!15392)) b!92330))

(assert (= (and b!92330 c!15394) b!92324))

(assert (= (and b!92330 (not c!15394)) b!92329))

(assert (= (and b!92329 c!15391) b!92325))

(assert (= (and b!92329 (not c!15391)) b!92327))

(assert (= (or b!92325 b!92327) bm!9082))

(assert (= (or b!92324 bm!9082) bm!9081))

(assert (= (or b!92328 bm!9081) bm!9080))

(assert (= (and bm!9080 c!15393) b!92323))

(assert (= (and bm!9080 (not c!15393)) b!92322))

(assert (= (and d!24369 res!46947) b!92326))

(assert (= (and b!92326 res!46946) b!92331))

(declare-fun m!99447 () Bool)

(assert (=> bm!9080 m!99447))

(declare-fun m!99449 () Bool)

(assert (=> b!92326 m!99449))

(declare-fun m!99451 () Bool)

(assert (=> d!24369 m!99451))

(declare-fun m!99453 () Bool)

(assert (=> d!24369 m!99453))

(declare-fun m!99455 () Bool)

(assert (=> b!92331 m!99455))

(declare-fun m!99457 () Bool)

(assert (=> b!92323 m!99457))

(assert (=> d!24121 d!24369))

(declare-fun b!92332 () Bool)

(declare-fun e!60178 () Bool)

(declare-fun e!60175 () Bool)

(assert (=> b!92332 (= e!60178 e!60175)))

(declare-fun c!15395 () Bool)

(assert (=> b!92332 (= c!15395 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92333 () Bool)

(declare-fun call!9086 () Bool)

(assert (=> b!92333 (= e!60175 call!9086)))

(declare-fun b!92334 () Bool)

(declare-fun e!60177 () Bool)

(assert (=> b!92334 (= e!60177 e!60178)))

(declare-fun res!46950 () Bool)

(assert (=> b!92334 (=> (not res!46950) (not e!60178))))

(declare-fun e!60176 () Bool)

(assert (=> b!92334 (= res!46950 (not e!60176))))

(declare-fun res!46948 () Bool)

(assert (=> b!92334 (=> (not res!46948) (not e!60176))))

(assert (=> b!92334 (= res!46948 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!24371 () Bool)

(declare-fun res!46949 () Bool)

(assert (=> d!24371 (=> res!46949 e!60177)))

(assert (=> d!24371 (= res!46949 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (=> d!24371 (= (arrayNoDuplicates!0 (_keys!4085 newMap!16) #b00000000000000000000000000000000 Nil!1535) e!60177)))

(declare-fun bm!9083 () Bool)

(assert (=> bm!9083 (= call!9086 (arrayNoDuplicates!0 (_keys!4085 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15395 (Cons!1534 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000) Nil!1535) Nil!1535)))))

(declare-fun b!92335 () Bool)

(assert (=> b!92335 (= e!60176 (contains!772 Nil!1535 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92336 () Bool)

(assert (=> b!92336 (= e!60175 call!9086)))

(assert (= (and d!24371 (not res!46949)) b!92334))

(assert (= (and b!92334 res!46948) b!92335))

(assert (= (and b!92334 res!46950) b!92332))

(assert (= (and b!92332 c!15395) b!92333))

(assert (= (and b!92332 (not c!15395)) b!92336))

(assert (= (or b!92333 b!92336) bm!9083))

(assert (=> b!92332 m!98741))

(assert (=> b!92332 m!98741))

(assert (=> b!92332 m!98743))

(assert (=> b!92334 m!98741))

(assert (=> b!92334 m!98741))

(assert (=> b!92334 m!98743))

(assert (=> bm!9083 m!98741))

(declare-fun m!99459 () Bool)

(assert (=> bm!9083 m!99459))

(assert (=> b!92335 m!98741))

(assert (=> b!92335 m!98741))

(declare-fun m!99461 () Bool)

(assert (=> b!92335 m!99461))

(assert (=> b!91669 d!24371))

(assert (=> bm!8932 d!24305))

(declare-fun d!24373 () Bool)

(assert (=> d!24373 (= (apply!87 lt!44784 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1252 (getValueByKey!146 (toList!751 lt!44784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3829 () Bool)

(assert (= bs!3829 d!24373))

(declare-fun m!99463 () Bool)

(assert (=> bs!3829 m!99463))

(assert (=> bs!3829 m!99463))

(declare-fun m!99465 () Bool)

(assert (=> bs!3829 m!99465))

(assert (=> b!91645 d!24373))

(assert (=> d!24133 d!24209))

(declare-fun b!92337 () Bool)

(declare-fun e!60191 () Bool)

(declare-fun e!60180 () Bool)

(assert (=> b!92337 (= e!60191 e!60180)))

(declare-fun res!46952 () Bool)

(assert (=> b!92337 (=> (not res!46952) (not e!60180))))

(declare-fun lt!45266 () ListLongMap!1471)

(assert (=> b!92337 (= res!46952 (contains!769 lt!45266 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(assert (=> b!92337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(declare-fun b!92338 () Bool)

(declare-fun res!46955 () Bool)

(declare-fun e!60188 () Bool)

(assert (=> b!92338 (=> (not res!46955) (not e!60188))))

(declare-fun e!60185 () Bool)

(assert (=> b!92338 (= res!46955 e!60185)))

(declare-fun c!15401 () Bool)

(assert (=> b!92338 (= c!15401 (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!92339 () Bool)

(declare-fun call!9090 () Bool)

(assert (=> b!92339 (= e!60185 (not call!9090))))

(declare-fun b!92340 () Bool)

(declare-fun res!46954 () Bool)

(assert (=> b!92340 (=> (not res!46954) (not e!60188))))

(assert (=> b!92340 (= res!46954 e!60191)))

(declare-fun res!46953 () Bool)

(assert (=> b!92340 (=> res!46953 e!60191)))

(declare-fun e!60184 () Bool)

(assert (=> b!92340 (= res!46953 (not e!60184))))

(declare-fun res!46957 () Bool)

(assert (=> b!92340 (=> (not res!46957) (not e!60184))))

(assert (=> b!92340 (= res!46957 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(declare-fun b!92341 () Bool)

(declare-fun e!60190 () Unit!2702)

(declare-fun lt!45267 () Unit!2702)

(assert (=> b!92341 (= e!60190 lt!45267)))

(declare-fun lt!45281 () ListLongMap!1471)

(assert (=> b!92341 (= lt!45281 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun lt!45261 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45265 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45265 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000))))

(declare-fun lt!45263 () Unit!2702)

(assert (=> b!92341 (= lt!45263 (addStillContains!63 lt!45281 lt!45261 (zeroValue!2293 (_2!1132 lt!44543)) lt!45265))))

(assert (=> b!92341 (contains!769 (+!120 lt!45281 (tuple2!2245 lt!45261 (zeroValue!2293 (_2!1132 lt!44543)))) lt!45265)))

(declare-fun lt!45274 () Unit!2702)

(assert (=> b!92341 (= lt!45274 lt!45263)))

(declare-fun lt!45277 () ListLongMap!1471)

(assert (=> b!92341 (= lt!45277 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun lt!45279 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45279 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45269 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45269 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000))))

(declare-fun lt!45282 () Unit!2702)

(assert (=> b!92341 (= lt!45282 (addApplyDifferent!63 lt!45277 lt!45279 (minValue!2293 (_2!1132 lt!44543)) lt!45269))))

(assert (=> b!92341 (= (apply!87 (+!120 lt!45277 (tuple2!2245 lt!45279 (minValue!2293 (_2!1132 lt!44543)))) lt!45269) (apply!87 lt!45277 lt!45269))))

(declare-fun lt!45275 () Unit!2702)

(assert (=> b!92341 (= lt!45275 lt!45282)))

(declare-fun lt!45278 () ListLongMap!1471)

(assert (=> b!92341 (= lt!45278 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun lt!45270 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45262 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45262 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000))))

(declare-fun lt!45264 () Unit!2702)

(assert (=> b!92341 (= lt!45264 (addApplyDifferent!63 lt!45278 lt!45270 (zeroValue!2293 (_2!1132 lt!44543)) lt!45262))))

(assert (=> b!92341 (= (apply!87 (+!120 lt!45278 (tuple2!2245 lt!45270 (zeroValue!2293 (_2!1132 lt!44543)))) lt!45262) (apply!87 lt!45278 lt!45262))))

(declare-fun lt!45271 () Unit!2702)

(assert (=> b!92341 (= lt!45271 lt!45264)))

(declare-fun lt!45272 () ListLongMap!1471)

(assert (=> b!92341 (= lt!45272 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun lt!45268 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45268 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45276 () (_ BitVec 64))

(assert (=> b!92341 (= lt!45276 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000))))

(assert (=> b!92341 (= lt!45267 (addApplyDifferent!63 lt!45272 lt!45268 (minValue!2293 (_2!1132 lt!44543)) lt!45276))))

(assert (=> b!92341 (= (apply!87 (+!120 lt!45272 (tuple2!2245 lt!45268 (minValue!2293 (_2!1132 lt!44543)))) lt!45276) (apply!87 lt!45272 lt!45276))))

(declare-fun b!92342 () Bool)

(declare-fun e!60187 () Bool)

(assert (=> b!92342 (= e!60187 (= (apply!87 lt!45266 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2293 (_2!1132 lt!44543))))))

(declare-fun d!24375 () Bool)

(assert (=> d!24375 e!60188))

(declare-fun res!46956 () Bool)

(assert (=> d!24375 (=> (not res!46956) (not e!60188))))

(assert (=> d!24375 (= res!46956 (or (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))))

(declare-fun lt!45280 () ListLongMap!1471)

(assert (=> d!24375 (= lt!45266 lt!45280)))

(declare-fun lt!45273 () Unit!2702)

(assert (=> d!24375 (= lt!45273 e!60190)))

(declare-fun c!15400 () Bool)

(declare-fun e!60179 () Bool)

(assert (=> d!24375 (= c!15400 e!60179)))

(declare-fun res!46959 () Bool)

(assert (=> d!24375 (=> (not res!46959) (not e!60179))))

(assert (=> d!24375 (= res!46959 (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(declare-fun e!60181 () ListLongMap!1471)

(assert (=> d!24375 (= lt!45280 e!60181)))

(declare-fun c!15397 () Bool)

(assert (=> d!24375 (= c!15397 (and (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!24375 (validMask!0 (mask!6465 (_2!1132 lt!44543)))))

(assert (=> d!24375 (= (getCurrentListMap!441 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))) lt!45266)))

(declare-fun b!92343 () Bool)

(declare-fun e!60189 () ListLongMap!1471)

(declare-fun call!9089 () ListLongMap!1471)

(assert (=> b!92343 (= e!60189 call!9089)))

(declare-fun bm!9084 () Bool)

(declare-fun call!9092 () ListLongMap!1471)

(declare-fun call!9087 () ListLongMap!1471)

(assert (=> bm!9084 (= call!9092 call!9087)))

(declare-fun b!92344 () Bool)

(declare-fun e!60182 () Bool)

(assert (=> b!92344 (= e!60188 e!60182)))

(declare-fun c!15398 () Bool)

(assert (=> b!92344 (= c!15398 (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!92345 () Bool)

(assert (=> b!92345 (= e!60179 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun b!92346 () Bool)

(declare-fun e!60183 () Bool)

(assert (=> b!92346 (= e!60183 (= (apply!87 lt!45266 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2293 (_2!1132 lt!44543))))))

(declare-fun b!92347 () Bool)

(declare-fun c!15396 () Bool)

(assert (=> b!92347 (= c!15396 (and (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!60186 () ListLongMap!1471)

(assert (=> b!92347 (= e!60186 e!60189)))

(declare-fun b!92348 () Bool)

(assert (=> b!92348 (= e!60182 e!60183)))

(declare-fun res!46951 () Bool)

(declare-fun call!9093 () Bool)

(assert (=> b!92348 (= res!46951 call!9093)))

(assert (=> b!92348 (=> (not res!46951) (not e!60183))))

(declare-fun bm!9085 () Bool)

(assert (=> bm!9085 (= call!9090 (contains!769 lt!45266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92349 () Bool)

(assert (=> b!92349 (= e!60181 e!60186)))

(declare-fun c!15399 () Bool)

(assert (=> b!92349 (= c!15399 (and (not (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2236 (_2!1132 lt!44543)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!9086 () Bool)

(assert (=> bm!9086 (= call!9093 (contains!769 lt!45266 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!9087 () Bool)

(declare-fun call!9091 () ListLongMap!1471)

(assert (=> bm!9087 (= call!9091 call!9092)))

(declare-fun bm!9088 () Bool)

(declare-fun call!9088 () ListLongMap!1471)

(assert (=> bm!9088 (= call!9088 (+!120 (ite c!15397 call!9087 (ite c!15399 call!9092 call!9091)) (ite (or c!15397 c!15399) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (_2!1132 lt!44543))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (_2!1132 lt!44543))))))))

(declare-fun b!92350 () Bool)

(assert (=> b!92350 (= e!60189 call!9091)))

(declare-fun b!92351 () Bool)

(assert (=> b!92351 (= e!60182 (not call!9093))))

(declare-fun bm!9089 () Bool)

(assert (=> bm!9089 (= call!9087 (getCurrentListMapNoExtraKeys!85 (_keys!4085 (_2!1132 lt!44543)) (_values!2388 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543)) (extraKeys!2236 (_2!1132 lt!44543)) (zeroValue!2293 (_2!1132 lt!44543)) (minValue!2293 (_2!1132 lt!44543)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44543))))))

(declare-fun b!92352 () Bool)

(assert (=> b!92352 (= e!60186 call!9089)))

(declare-fun b!92353 () Bool)

(assert (=> b!92353 (= e!60181 (+!120 call!9088 (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (_2!1132 lt!44543)))))))

(declare-fun b!92354 () Bool)

(assert (=> b!92354 (= e!60184 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun bm!9090 () Bool)

(assert (=> bm!9090 (= call!9089 call!9088)))

(declare-fun b!92355 () Bool)

(assert (=> b!92355 (= e!60185 e!60187)))

(declare-fun res!46958 () Bool)

(assert (=> b!92355 (= res!46958 call!9090)))

(assert (=> b!92355 (=> (not res!46958) (not e!60187))))

(declare-fun b!92356 () Bool)

(declare-fun Unit!2738 () Unit!2702)

(assert (=> b!92356 (= e!60190 Unit!2738)))

(declare-fun b!92357 () Bool)

(assert (=> b!92357 (= e!60180 (= (apply!87 lt!45266 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)) (get!1247 (select (arr!1959 (_values!2388 (_2!1132 lt!44543))) #b00000000000000000000000000000000) (dynLambda!358 (defaultEntry!2405 (_2!1132 lt!44543)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!92357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2206 (_values!2388 (_2!1132 lt!44543)))))))

(assert (=> b!92357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (= (and d!24375 c!15397) b!92353))

(assert (= (and d!24375 (not c!15397)) b!92349))

(assert (= (and b!92349 c!15399) b!92352))

(assert (= (and b!92349 (not c!15399)) b!92347))

(assert (= (and b!92347 c!15396) b!92343))

(assert (= (and b!92347 (not c!15396)) b!92350))

(assert (= (or b!92343 b!92350) bm!9087))

(assert (= (or b!92352 bm!9087) bm!9084))

(assert (= (or b!92352 b!92343) bm!9090))

(assert (= (or b!92353 bm!9084) bm!9089))

(assert (= (or b!92353 bm!9090) bm!9088))

(assert (= (and d!24375 res!46959) b!92345))

(assert (= (and d!24375 c!15400) b!92341))

(assert (= (and d!24375 (not c!15400)) b!92356))

(assert (= (and d!24375 res!46956) b!92340))

(assert (= (and b!92340 res!46957) b!92354))

(assert (= (and b!92340 (not res!46953)) b!92337))

(assert (= (and b!92337 res!46952) b!92357))

(assert (= (and b!92340 res!46954) b!92338))

(assert (= (and b!92338 c!15401) b!92355))

(assert (= (and b!92338 (not c!15401)) b!92339))

(assert (= (and b!92355 res!46958) b!92342))

(assert (= (or b!92355 b!92339) bm!9085))

(assert (= (and b!92338 res!46955) b!92344))

(assert (= (and b!92344 c!15398) b!92348))

(assert (= (and b!92344 (not c!15398)) b!92351))

(assert (= (and b!92348 res!46951) b!92346))

(assert (= (or b!92348 b!92351) bm!9086))

(declare-fun b_lambda!4071 () Bool)

(assert (=> (not b_lambda!4071) (not b!92357)))

(declare-fun t!5380 () Bool)

(declare-fun tb!1809 () Bool)

(assert (=> (and b!91365 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 (_2!1132 lt!44543))) t!5380) tb!1809))

(declare-fun result!3097 () Bool)

(assert (=> tb!1809 (= result!3097 tp_is_empty!2581)))

(assert (=> b!92357 t!5380))

(declare-fun b_and!5601 () Bool)

(assert (= b_and!5597 (and (=> t!5380 result!3097) b_and!5601)))

(declare-fun tb!1811 () Bool)

(declare-fun t!5382 () Bool)

(assert (=> (and b!91371 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (_2!1132 lt!44543))) t!5382) tb!1811))

(declare-fun result!3099 () Bool)

(assert (= result!3099 result!3097))

(assert (=> b!92357 t!5382))

(declare-fun b_and!5603 () Bool)

(assert (= b_and!5599 (and (=> t!5382 result!3099) b_and!5603)))

(assert (=> b!92345 m!98847))

(assert (=> b!92345 m!98847))

(assert (=> b!92345 m!98849))

(declare-fun m!99467 () Bool)

(assert (=> bm!9085 m!99467))

(declare-fun m!99469 () Bool)

(assert (=> b!92341 m!99469))

(declare-fun m!99471 () Bool)

(assert (=> b!92341 m!99471))

(declare-fun m!99473 () Bool)

(assert (=> b!92341 m!99473))

(declare-fun m!99475 () Bool)

(assert (=> b!92341 m!99475))

(assert (=> b!92341 m!98847))

(declare-fun m!99477 () Bool)

(assert (=> b!92341 m!99477))

(assert (=> b!92341 m!99473))

(declare-fun m!99479 () Bool)

(assert (=> b!92341 m!99479))

(declare-fun m!99481 () Bool)

(assert (=> b!92341 m!99481))

(declare-fun m!99483 () Bool)

(assert (=> b!92341 m!99483))

(assert (=> b!92341 m!99477))

(declare-fun m!99485 () Bool)

(assert (=> b!92341 m!99485))

(declare-fun m!99487 () Bool)

(assert (=> b!92341 m!99487))

(declare-fun m!99489 () Bool)

(assert (=> b!92341 m!99489))

(assert (=> b!92341 m!99469))

(declare-fun m!99491 () Bool)

(assert (=> b!92341 m!99491))

(declare-fun m!99493 () Bool)

(assert (=> b!92341 m!99493))

(declare-fun m!99495 () Bool)

(assert (=> b!92341 m!99495))

(declare-fun m!99497 () Bool)

(assert (=> b!92341 m!99497))

(assert (=> b!92341 m!99479))

(declare-fun m!99499 () Bool)

(assert (=> b!92341 m!99499))

(assert (=> d!24375 m!99113))

(declare-fun m!99501 () Bool)

(assert (=> b!92357 m!99501))

(declare-fun m!99503 () Bool)

(assert (=> b!92357 m!99503))

(assert (=> b!92357 m!98847))

(assert (=> b!92357 m!98847))

(declare-fun m!99505 () Bool)

(assert (=> b!92357 m!99505))

(assert (=> b!92357 m!99503))

(assert (=> b!92357 m!99501))

(declare-fun m!99507 () Bool)

(assert (=> b!92357 m!99507))

(declare-fun m!99509 () Bool)

(assert (=> bm!9086 m!99509))

(assert (=> bm!9089 m!99499))

(assert (=> b!92354 m!98847))

(assert (=> b!92354 m!98847))

(assert (=> b!92354 m!98849))

(declare-fun m!99511 () Bool)

(assert (=> b!92353 m!99511))

(declare-fun m!99513 () Bool)

(assert (=> b!92346 m!99513))

(declare-fun m!99515 () Bool)

(assert (=> b!92342 m!99515))

(declare-fun m!99517 () Bool)

(assert (=> bm!9088 m!99517))

(assert (=> b!92337 m!98847))

(assert (=> b!92337 m!98847))

(declare-fun m!99519 () Bool)

(assert (=> b!92337 m!99519))

(assert (=> d!24127 d!24375))

(declare-fun b!92358 () Bool)

(declare-fun e!60195 () Bool)

(declare-fun e!60192 () Bool)

(assert (=> b!92358 (= e!60195 e!60192)))

(declare-fun c!15402 () Bool)

(assert (=> b!92358 (= c!15402 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun b!92359 () Bool)

(declare-fun call!9094 () Bool)

(assert (=> b!92359 (= e!60192 call!9094)))

(declare-fun b!92360 () Bool)

(declare-fun e!60194 () Bool)

(assert (=> b!92360 (= e!60194 e!60195)))

(declare-fun res!46962 () Bool)

(assert (=> b!92360 (=> (not res!46962) (not e!60195))))

(declare-fun e!60193 () Bool)

(assert (=> b!92360 (= res!46962 (not e!60193))))

(declare-fun res!46960 () Bool)

(assert (=> b!92360 (=> (not res!46960) (not e!60193))))

(assert (=> b!92360 (= res!46960 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun d!24377 () Bool)

(declare-fun res!46961 () Bool)

(assert (=> d!24377 (=> res!46961 e!60194)))

(assert (=> d!24377 (= res!46961 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (=> d!24377 (= (arrayNoDuplicates!0 (_keys!4085 (_2!1132 lt!44543)) #b00000000000000000000000000000000 Nil!1535) e!60194)))

(declare-fun bm!9091 () Bool)

(assert (=> bm!9091 (= call!9094 (arrayNoDuplicates!0 (_keys!4085 (_2!1132 lt!44543)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!15402 (Cons!1534 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000) Nil!1535) Nil!1535)))))

(declare-fun b!92361 () Bool)

(assert (=> b!92361 (= e!60193 (contains!772 Nil!1535 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun b!92362 () Bool)

(assert (=> b!92362 (= e!60192 call!9094)))

(assert (= (and d!24377 (not res!46961)) b!92360))

(assert (= (and b!92360 res!46960) b!92361))

(assert (= (and b!92360 res!46962) b!92358))

(assert (= (and b!92358 c!15402) b!92359))

(assert (= (and b!92358 (not c!15402)) b!92362))

(assert (= (or b!92359 b!92362) bm!9091))

(assert (=> b!92358 m!98847))

(assert (=> b!92358 m!98847))

(assert (=> b!92358 m!98849))

(assert (=> b!92360 m!98847))

(assert (=> b!92360 m!98847))

(assert (=> b!92360 m!98849))

(assert (=> bm!9091 m!98847))

(declare-fun m!99521 () Bool)

(assert (=> bm!9091 m!99521))

(assert (=> b!92361 m!98847))

(assert (=> b!92361 m!98847))

(declare-fun m!99523 () Bool)

(assert (=> b!92361 m!99523))

(assert (=> b!91522 d!24377))

(assert (=> b!91648 d!24239))

(declare-fun b!92365 () Bool)

(declare-fun e!60197 () Option!152)

(assert (=> b!92365 (= e!60197 (getValueByKey!146 (t!5363 (toList!751 lt!44705)) (_1!1133 lt!44536)))))

(declare-fun b!92366 () Bool)

(assert (=> b!92366 (= e!60197 None!150)))

(declare-fun d!24379 () Bool)

(declare-fun c!15403 () Bool)

(assert (=> d!24379 (= c!15403 (and ((_ is Cons!1533) (toList!751 lt!44705)) (= (_1!1133 (h!2125 (toList!751 lt!44705))) (_1!1133 lt!44536))))))

(declare-fun e!60196 () Option!152)

(assert (=> d!24379 (= (getValueByKey!146 (toList!751 lt!44705) (_1!1133 lt!44536)) e!60196)))

(declare-fun b!92364 () Bool)

(assert (=> b!92364 (= e!60196 e!60197)))

(declare-fun c!15404 () Bool)

(assert (=> b!92364 (= c!15404 (and ((_ is Cons!1533) (toList!751 lt!44705)) (not (= (_1!1133 (h!2125 (toList!751 lt!44705))) (_1!1133 lt!44536)))))))

(declare-fun b!92363 () Bool)

(assert (=> b!92363 (= e!60196 (Some!151 (_2!1133 (h!2125 (toList!751 lt!44705)))))))

(assert (= (and d!24379 c!15403) b!92363))

(assert (= (and d!24379 (not c!15403)) b!92364))

(assert (= (and b!92364 c!15404) b!92365))

(assert (= (and b!92364 (not c!15404)) b!92366))

(declare-fun m!99525 () Bool)

(assert (=> b!92365 m!99525))

(assert (=> b!91573 d!24379))

(declare-fun d!24381 () Bool)

(declare-fun lt!45283 () Bool)

(assert (=> d!24381 (= lt!45283 (select (content!96 (toList!751 lt!44688)) lt!44536))))

(declare-fun e!60199 () Bool)

(assert (=> d!24381 (= lt!45283 e!60199)))

(declare-fun res!46963 () Bool)

(assert (=> d!24381 (=> (not res!46963) (not e!60199))))

(assert (=> d!24381 (= res!46963 ((_ is Cons!1533) (toList!751 lt!44688)))))

(assert (=> d!24381 (= (contains!771 (toList!751 lt!44688) lt!44536) lt!45283)))

(declare-fun b!92367 () Bool)

(declare-fun e!60198 () Bool)

(assert (=> b!92367 (= e!60199 e!60198)))

(declare-fun res!46964 () Bool)

(assert (=> b!92367 (=> res!46964 e!60198)))

(assert (=> b!92367 (= res!46964 (= (h!2125 (toList!751 lt!44688)) lt!44536))))

(declare-fun b!92368 () Bool)

(assert (=> b!92368 (= e!60198 (contains!771 (t!5363 (toList!751 lt!44688)) lt!44536))))

(assert (= (and d!24381 res!46963) b!92367))

(assert (= (and b!92367 (not res!46964)) b!92368))

(declare-fun m!99527 () Bool)

(assert (=> d!24381 m!99527))

(declare-fun m!99529 () Bool)

(assert (=> d!24381 m!99529))

(declare-fun m!99531 () Bool)

(assert (=> b!92368 m!99531))

(assert (=> b!91566 d!24381))

(assert (=> d!24149 d!24155))

(declare-fun d!24383 () Bool)

(assert (=> d!24383 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) from!355 Nil!1535)))

(assert (=> d!24383 true))

(declare-fun _$71!123 () Unit!2702)

(assert (=> d!24383 (= (choose!39 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!123)))

(declare-fun bs!3830 () Bool)

(assert (= bs!3830 d!24383))

(assert (=> bs!3830 m!98073))

(assert (=> d!24149 d!24383))

(assert (=> b!91552 d!24239))

(declare-fun d!24385 () Bool)

(declare-fun e!60200 () Bool)

(assert (=> d!24385 e!60200))

(declare-fun res!46965 () Bool)

(assert (=> d!24385 (=> res!46965 e!60200)))

(declare-fun lt!45285 () Bool)

(assert (=> d!24385 (= res!46965 (not lt!45285))))

(declare-fun lt!45286 () Bool)

(assert (=> d!24385 (= lt!45285 lt!45286)))

(declare-fun lt!45287 () Unit!2702)

(declare-fun e!60201 () Unit!2702)

(assert (=> d!24385 (= lt!45287 e!60201)))

(declare-fun c!15405 () Bool)

(assert (=> d!24385 (= c!15405 lt!45286)))

(assert (=> d!24385 (= lt!45286 (containsKey!149 (toList!751 call!9000) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> d!24385 (= (contains!769 call!9000 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)) lt!45285)))

(declare-fun b!92369 () Bool)

(declare-fun lt!45284 () Unit!2702)

(assert (=> b!92369 (= e!60201 lt!45284)))

(assert (=> b!92369 (= lt!45284 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 call!9000) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(assert (=> b!92369 (isDefined!98 (getValueByKey!146 (toList!751 call!9000) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355)))))

(declare-fun b!92370 () Bool)

(declare-fun Unit!2739 () Unit!2702)

(assert (=> b!92370 (= e!60201 Unit!2739)))

(declare-fun b!92371 () Bool)

(assert (=> b!92371 (= e!60200 (isDefined!98 (getValueByKey!146 (toList!751 call!9000) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355))))))

(assert (= (and d!24385 c!15405) b!92369))

(assert (= (and d!24385 (not c!15405)) b!92370))

(assert (= (and d!24385 (not res!46965)) b!92371))

(assert (=> d!24385 m!98059))

(declare-fun m!99533 () Bool)

(assert (=> d!24385 m!99533))

(assert (=> b!92369 m!98059))

(declare-fun m!99535 () Bool)

(assert (=> b!92369 m!99535))

(assert (=> b!92369 m!98059))

(declare-fun m!99537 () Bool)

(assert (=> b!92369 m!99537))

(assert (=> b!92369 m!99537))

(declare-fun m!99539 () Bool)

(assert (=> b!92369 m!99539))

(assert (=> b!92371 m!98059))

(assert (=> b!92371 m!99537))

(assert (=> b!92371 m!99537))

(assert (=> b!92371 m!99539))

(assert (=> b!91765 d!24385))

(declare-fun d!24387 () Bool)

(assert (=> d!24387 (= (get!1251 (select (arr!1959 (_values!2388 (v!2723 (underlying!315 thiss!992)))) from!355) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!358 (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!91666 d!24387))

(assert (=> b!91791 d!24337))

(declare-fun d!24389 () Bool)

(declare-fun lt!45288 () Bool)

(assert (=> d!24389 (= lt!45288 (select (content!96 (toList!751 lt!44696)) lt!44540))))

(declare-fun e!60203 () Bool)

(assert (=> d!24389 (= lt!45288 e!60203)))

(declare-fun res!46966 () Bool)

(assert (=> d!24389 (=> (not res!46966) (not e!60203))))

(assert (=> d!24389 (= res!46966 ((_ is Cons!1533) (toList!751 lt!44696)))))

(assert (=> d!24389 (= (contains!771 (toList!751 lt!44696) lt!44540) lt!45288)))

(declare-fun b!92372 () Bool)

(declare-fun e!60202 () Bool)

(assert (=> b!92372 (= e!60203 e!60202)))

(declare-fun res!46967 () Bool)

(assert (=> b!92372 (=> res!46967 e!60202)))

(assert (=> b!92372 (= res!46967 (= (h!2125 (toList!751 lt!44696)) lt!44540))))

(declare-fun b!92373 () Bool)

(assert (=> b!92373 (= e!60202 (contains!771 (t!5363 (toList!751 lt!44696)) lt!44540))))

(assert (= (and d!24389 res!46966) b!92372))

(assert (= (and b!92372 (not res!46967)) b!92373))

(declare-fun m!99541 () Bool)

(assert (=> d!24389 m!99541))

(declare-fun m!99543 () Bool)

(assert (=> d!24389 m!99543))

(declare-fun m!99545 () Bool)

(assert (=> b!92373 m!99545))

(assert (=> b!91570 d!24389))

(declare-fun d!24391 () Bool)

(declare-fun e!60204 () Bool)

(assert (=> d!24391 e!60204))

(declare-fun res!46968 () Bool)

(assert (=> d!24391 (=> res!46968 e!60204)))

(declare-fun lt!45290 () Bool)

(assert (=> d!24391 (= res!46968 (not lt!45290))))

(declare-fun lt!45291 () Bool)

(assert (=> d!24391 (= lt!45290 lt!45291)))

(declare-fun lt!45292 () Unit!2702)

(declare-fun e!60205 () Unit!2702)

(assert (=> d!24391 (= lt!45292 e!60205)))

(declare-fun c!15406 () Bool)

(assert (=> d!24391 (= c!15406 lt!45291)))

(assert (=> d!24391 (= lt!45291 (containsKey!149 (toList!751 lt!44784) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24391 (= (contains!769 lt!44784 #b0000000000000000000000000000000000000000000000000000000000000000) lt!45290)))

(declare-fun b!92374 () Bool)

(declare-fun lt!45289 () Unit!2702)

(assert (=> b!92374 (= e!60205 lt!45289)))

(assert (=> b!92374 (= lt!45289 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44784) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92374 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92375 () Bool)

(declare-fun Unit!2740 () Unit!2702)

(assert (=> b!92375 (= e!60205 Unit!2740)))

(declare-fun b!92376 () Bool)

(assert (=> b!92376 (= e!60204 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24391 c!15406) b!92374))

(assert (= (and d!24391 (not c!15406)) b!92375))

(assert (= (and d!24391 (not res!46968)) b!92376))

(declare-fun m!99547 () Bool)

(assert (=> d!24391 m!99547))

(declare-fun m!99549 () Bool)

(assert (=> b!92374 m!99549))

(assert (=> b!92374 m!99463))

(assert (=> b!92374 m!99463))

(declare-fun m!99551 () Bool)

(assert (=> b!92374 m!99551))

(assert (=> b!92376 m!99463))

(assert (=> b!92376 m!99463))

(assert (=> b!92376 m!99551))

(assert (=> bm!8935 d!24391))

(declare-fun d!24393 () Bool)

(declare-fun res!46969 () Bool)

(declare-fun e!60206 () Bool)

(assert (=> d!24393 (=> (not res!46969) (not e!60206))))

(assert (=> d!24393 (= res!46969 (simpleValid!63 (v!2723 (underlying!315 thiss!992))))))

(assert (=> d!24393 (= (valid!363 (v!2723 (underlying!315 thiss!992))) e!60206)))

(declare-fun b!92377 () Bool)

(declare-fun res!46970 () Bool)

(assert (=> b!92377 (=> (not res!46970) (not e!60206))))

(assert (=> b!92377 (= res!46970 (= (arrayCountValidKeys!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 (size!2205 (_keys!4085 (v!2723 (underlying!315 thiss!992))))) (_size!450 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!92378 () Bool)

(declare-fun res!46971 () Bool)

(assert (=> b!92378 (=> (not res!46971) (not e!60206))))

(assert (=> b!92378 (= res!46971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 (v!2723 (underlying!315 thiss!992))) (mask!6465 (v!2723 (underlying!315 thiss!992)))))))

(declare-fun b!92379 () Bool)

(assert (=> b!92379 (= e!60206 (arrayNoDuplicates!0 (_keys!4085 (v!2723 (underlying!315 thiss!992))) #b00000000000000000000000000000000 Nil!1535))))

(assert (= (and d!24393 res!46969) b!92377))

(assert (= (and b!92377 res!46970) b!92378))

(assert (= (and b!92378 res!46971) b!92379))

(declare-fun m!99553 () Bool)

(assert (=> d!24393 m!99553))

(declare-fun m!99555 () Bool)

(assert (=> b!92377 m!99555))

(declare-fun m!99557 () Bool)

(assert (=> b!92378 m!99557))

(declare-fun m!99559 () Bool)

(assert (=> b!92379 m!99559))

(assert (=> d!24129 d!24393))

(declare-fun d!24395 () Bool)

(declare-fun e!60207 () Bool)

(assert (=> d!24395 e!60207))

(declare-fun res!46972 () Bool)

(assert (=> d!24395 (=> res!46972 e!60207)))

(declare-fun lt!45294 () Bool)

(assert (=> d!24395 (= res!46972 (not lt!45294))))

(declare-fun lt!45295 () Bool)

(assert (=> d!24395 (= lt!45294 lt!45295)))

(declare-fun lt!45296 () Unit!2702)

(declare-fun e!60208 () Unit!2702)

(assert (=> d!24395 (= lt!45296 e!60208)))

(declare-fun c!15407 () Bool)

(assert (=> d!24395 (= c!15407 lt!45295)))

(assert (=> d!24395 (= lt!45295 (containsKey!149 (toList!751 lt!44675) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24395 (= (contains!769 lt!44675 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!45294)))

(declare-fun b!92380 () Bool)

(declare-fun lt!45293 () Unit!2702)

(assert (=> b!92380 (= e!60208 lt!45293)))

(assert (=> b!92380 (= lt!45293 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44675) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!92380 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!92381 () Bool)

(declare-fun Unit!2741 () Unit!2702)

(assert (=> b!92381 (= e!60208 Unit!2741)))

(declare-fun b!92382 () Bool)

(assert (=> b!92382 (= e!60207 (isDefined!98 (getValueByKey!146 (toList!751 lt!44675) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24395 c!15407) b!92380))

(assert (= (and d!24395 (not c!15407)) b!92381))

(assert (= (and d!24395 (not res!46972)) b!92382))

(assert (=> d!24395 m!98285))

(declare-fun m!99561 () Bool)

(assert (=> d!24395 m!99561))

(assert (=> b!92380 m!98285))

(declare-fun m!99563 () Bool)

(assert (=> b!92380 m!99563))

(assert (=> b!92380 m!98285))

(assert (=> b!92380 m!98803))

(assert (=> b!92380 m!98803))

(declare-fun m!99565 () Bool)

(assert (=> b!92380 m!99565))

(assert (=> b!92382 m!98285))

(assert (=> b!92382 m!98803))

(assert (=> b!92382 m!98803))

(assert (=> b!92382 m!99565))

(assert (=> b!91555 d!24395))

(declare-fun d!24397 () Bool)

(declare-fun e!60209 () Bool)

(assert (=> d!24397 e!60209))

(declare-fun res!46973 () Bool)

(assert (=> d!24397 (=> (not res!46973) (not e!60209))))

(declare-fun lt!45297 () ListLongMap!1471)

(assert (=> d!24397 (= res!46973 (contains!769 lt!45297 (_1!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun lt!45300 () List!1537)

(assert (=> d!24397 (= lt!45297 (ListLongMap!1472 lt!45300))))

(declare-fun lt!45298 () Unit!2702)

(declare-fun lt!45299 () Unit!2702)

(assert (=> d!24397 (= lt!45298 lt!45299)))

(assert (=> d!24397 (= (getValueByKey!146 lt!45300 (_1!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))) (Some!151 (_2!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24397 (= lt!45299 (lemmaContainsTupThenGetReturnValue!63 lt!45300 (_1!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_2!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24397 (= lt!45300 (insertStrictlySorted!66 (toList!751 (ite c!15203 call!8937 (ite c!15205 call!8942 call!8941))) (_1!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_2!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(assert (=> d!24397 (= (+!120 (ite c!15203 call!8937 (ite c!15205 call!8942 call!8941)) (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!45297)))

(declare-fun b!92383 () Bool)

(declare-fun res!46974 () Bool)

(assert (=> b!92383 (=> (not res!46974) (not e!60209))))

(assert (=> b!92383 (= res!46974 (= (getValueByKey!146 (toList!751 lt!45297) (_1!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))) (Some!151 (_2!1133 (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))))

(declare-fun b!92384 () Bool)

(assert (=> b!92384 (= e!60209 (contains!771 (toList!751 lt!45297) (ite (or c!15203 c!15205) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) (tuple2!2245 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (= (and d!24397 res!46973) b!92383))

(assert (= (and b!92383 res!46974) b!92384))

(declare-fun m!99567 () Bool)

(assert (=> d!24397 m!99567))

(declare-fun m!99569 () Bool)

(assert (=> d!24397 m!99569))

(declare-fun m!99571 () Bool)

(assert (=> d!24397 m!99571))

(declare-fun m!99573 () Bool)

(assert (=> d!24397 m!99573))

(declare-fun m!99575 () Bool)

(assert (=> b!92383 m!99575))

(declare-fun m!99577 () Bool)

(assert (=> b!92384 m!99577))

(assert (=> bm!8938 d!24397))

(declare-fun d!24399 () Bool)

(assert (=> d!24399 (= (+!120 (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) (zeroValue!2293 newMap!16) (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 lt!44529)) (getCurrentListMap!441 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) lt!44891 lt!44529 (minValue!2293 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2405 newMap!16)))))

(declare-fun lt!45303 () Unit!2702)

(declare-fun choose!562 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 V!3089 Int) Unit!2702)

(assert (=> d!24399 (= lt!45303 (choose!562 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44891 (zeroValue!2293 newMap!16) lt!44529 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)))))

(assert (=> d!24399 (validMask!0 (mask!6465 newMap!16))))

(assert (=> d!24399 (= (lemmaChangeZeroKeyThenAddPairToListMap!36 (_keys!4085 newMap!16) (_values!2388 newMap!16) (mask!6465 newMap!16) (extraKeys!2236 newMap!16) lt!44891 (zeroValue!2293 newMap!16) lt!44529 (minValue!2293 newMap!16) (defaultEntry!2405 newMap!16)) lt!45303)))

(declare-fun bs!3831 () Bool)

(assert (= bs!3831 d!24399))

(assert (=> bs!3831 m!98733))

(declare-fun m!99579 () Bool)

(assert (=> bs!3831 m!99579))

(declare-fun m!99581 () Bool)

(assert (=> bs!3831 m!99581))

(assert (=> bs!3831 m!98459))

(assert (=> bs!3831 m!98459))

(declare-fun m!99583 () Bool)

(assert (=> bs!3831 m!99583))

(assert (=> b!91783 d!24399))

(declare-fun d!24401 () Bool)

(assert (=> d!24401 (= (map!1223 (_2!1132 lt!44876)) (getCurrentListMap!441 (_keys!4085 (_2!1132 lt!44876)) (_values!2388 (_2!1132 lt!44876)) (mask!6465 (_2!1132 lt!44876)) (extraKeys!2236 (_2!1132 lt!44876)) (zeroValue!2293 (_2!1132 lt!44876)) (minValue!2293 (_2!1132 lt!44876)) #b00000000000000000000000000000000 (defaultEntry!2405 (_2!1132 lt!44876))))))

(declare-fun bs!3832 () Bool)

(assert (= bs!3832 d!24401))

(declare-fun m!99585 () Bool)

(assert (=> bs!3832 m!99585))

(assert (=> bm!8996 d!24401))

(declare-fun d!24403 () Bool)

(declare-fun e!60210 () Bool)

(assert (=> d!24403 e!60210))

(declare-fun res!46975 () Bool)

(assert (=> d!24403 (=> res!46975 e!60210)))

(declare-fun lt!45305 () Bool)

(assert (=> d!24403 (= res!46975 (not lt!45305))))

(declare-fun lt!45306 () Bool)

(assert (=> d!24403 (= lt!45305 lt!45306)))

(declare-fun lt!45307 () Unit!2702)

(declare-fun e!60211 () Unit!2702)

(assert (=> d!24403 (= lt!45307 e!60211)))

(declare-fun c!15408 () Bool)

(assert (=> d!24403 (= c!15408 lt!45306)))

(assert (=> d!24403 (= lt!45306 (containsKey!149 (toList!751 lt!44758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24403 (= (contains!769 lt!44758 #b1000000000000000000000000000000000000000000000000000000000000000) lt!45305)))

(declare-fun b!92385 () Bool)

(declare-fun lt!45304 () Unit!2702)

(assert (=> b!92385 (= e!60211 lt!45304)))

(assert (=> b!92385 (= lt!45304 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!92385 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92386 () Bool)

(declare-fun Unit!2742 () Unit!2702)

(assert (=> b!92386 (= e!60211 Unit!2742)))

(declare-fun b!92387 () Bool)

(assert (=> b!92387 (= e!60210 (isDefined!98 (getValueByKey!146 (toList!751 lt!44758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!24403 c!15408) b!92385))

(assert (= (and d!24403 (not c!15408)) b!92386))

(assert (= (and d!24403 (not res!46975)) b!92387))

(declare-fun m!99587 () Bool)

(assert (=> d!24403 m!99587))

(declare-fun m!99589 () Bool)

(assert (=> b!92385 m!99589))

(assert (=> b!92385 m!98799))

(assert (=> b!92385 m!98799))

(declare-fun m!99591 () Bool)

(assert (=> b!92385 m!99591))

(assert (=> b!92387 m!98799))

(assert (=> b!92387 m!98799))

(assert (=> b!92387 m!99591))

(assert (=> bm!8929 d!24403))

(declare-fun d!24405 () Bool)

(declare-fun e!60212 () Bool)

(assert (=> d!24405 e!60212))

(declare-fun res!46976 () Bool)

(assert (=> d!24405 (=> res!46976 e!60212)))

(declare-fun lt!45309 () Bool)

(assert (=> d!24405 (= res!46976 (not lt!45309))))

(declare-fun lt!45310 () Bool)

(assert (=> d!24405 (= lt!45309 lt!45310)))

(declare-fun lt!45311 () Unit!2702)

(declare-fun e!60213 () Unit!2702)

(assert (=> d!24405 (= lt!45311 e!60213)))

(declare-fun c!15409 () Bool)

(assert (=> d!24405 (= c!15409 lt!45310)))

(assert (=> d!24405 (= lt!45310 (containsKey!149 (toList!751 lt!44688) (_1!1133 lt!44536)))))

(assert (=> d!24405 (= (contains!769 lt!44688 (_1!1133 lt!44536)) lt!45309)))

(declare-fun b!92388 () Bool)

(declare-fun lt!45308 () Unit!2702)

(assert (=> b!92388 (= e!60213 lt!45308)))

(assert (=> b!92388 (= lt!45308 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44688) (_1!1133 lt!44536)))))

(assert (=> b!92388 (isDefined!98 (getValueByKey!146 (toList!751 lt!44688) (_1!1133 lt!44536)))))

(declare-fun b!92389 () Bool)

(declare-fun Unit!2743 () Unit!2702)

(assert (=> b!92389 (= e!60213 Unit!2743)))

(declare-fun b!92390 () Bool)

(assert (=> b!92390 (= e!60212 (isDefined!98 (getValueByKey!146 (toList!751 lt!44688) (_1!1133 lt!44536))))))

(assert (= (and d!24405 c!15409) b!92388))

(assert (= (and d!24405 (not c!15409)) b!92389))

(assert (= (and d!24405 (not res!46976)) b!92390))

(declare-fun m!99593 () Bool)

(assert (=> d!24405 m!99593))

(declare-fun m!99595 () Bool)

(assert (=> b!92388 m!99595))

(assert (=> b!92388 m!98331))

(assert (=> b!92388 m!98331))

(declare-fun m!99597 () Bool)

(assert (=> b!92388 m!99597))

(assert (=> b!92390 m!98331))

(assert (=> b!92390 m!98331))

(assert (=> b!92390 m!99597))

(assert (=> d!24111 d!24405))

(declare-fun b!92393 () Bool)

(declare-fun e!60215 () Option!152)

(assert (=> b!92393 (= e!60215 (getValueByKey!146 (t!5363 lt!44691) (_1!1133 lt!44536)))))

(declare-fun b!92394 () Bool)

(assert (=> b!92394 (= e!60215 None!150)))

(declare-fun d!24407 () Bool)

(declare-fun c!15410 () Bool)

(assert (=> d!24407 (= c!15410 (and ((_ is Cons!1533) lt!44691) (= (_1!1133 (h!2125 lt!44691)) (_1!1133 lt!44536))))))

(declare-fun e!60214 () Option!152)

(assert (=> d!24407 (= (getValueByKey!146 lt!44691 (_1!1133 lt!44536)) e!60214)))

(declare-fun b!92392 () Bool)

(assert (=> b!92392 (= e!60214 e!60215)))

(declare-fun c!15411 () Bool)

(assert (=> b!92392 (= c!15411 (and ((_ is Cons!1533) lt!44691) (not (= (_1!1133 (h!2125 lt!44691)) (_1!1133 lt!44536)))))))

(declare-fun b!92391 () Bool)

(assert (=> b!92391 (= e!60214 (Some!151 (_2!1133 (h!2125 lt!44691))))))

(assert (= (and d!24407 c!15410) b!92391))

(assert (= (and d!24407 (not c!15410)) b!92392))

(assert (= (and b!92392 c!15411) b!92393))

(assert (= (and b!92392 (not c!15411)) b!92394))

(declare-fun m!99599 () Bool)

(assert (=> b!92393 m!99599))

(assert (=> d!24111 d!24407))

(declare-fun d!24409 () Bool)

(assert (=> d!24409 (= (getValueByKey!146 lt!44691 (_1!1133 lt!44536)) (Some!151 (_2!1133 lt!44536)))))

(declare-fun lt!45312 () Unit!2702)

(assert (=> d!24409 (= lt!45312 (choose!555 lt!44691 (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(declare-fun e!60216 () Bool)

(assert (=> d!24409 e!60216))

(declare-fun res!46977 () Bool)

(assert (=> d!24409 (=> (not res!46977) (not e!60216))))

(assert (=> d!24409 (= res!46977 (isStrictlySorted!288 lt!44691))))

(assert (=> d!24409 (= (lemmaContainsTupThenGetReturnValue!63 lt!44691 (_1!1133 lt!44536) (_2!1133 lt!44536)) lt!45312)))

(declare-fun b!92395 () Bool)

(declare-fun res!46978 () Bool)

(assert (=> b!92395 (=> (not res!46978) (not e!60216))))

(assert (=> b!92395 (= res!46978 (containsKey!149 lt!44691 (_1!1133 lt!44536)))))

(declare-fun b!92396 () Bool)

(assert (=> b!92396 (= e!60216 (contains!771 lt!44691 (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536))))))

(assert (= (and d!24409 res!46977) b!92395))

(assert (= (and b!92395 res!46978) b!92396))

(assert (=> d!24409 m!98325))

(declare-fun m!99601 () Bool)

(assert (=> d!24409 m!99601))

(declare-fun m!99603 () Bool)

(assert (=> d!24409 m!99603))

(declare-fun m!99605 () Bool)

(assert (=> b!92395 m!99605))

(declare-fun m!99607 () Bool)

(assert (=> b!92396 m!99607))

(assert (=> d!24111 d!24409))

(declare-fun c!15415 () Bool)

(declare-fun c!15412 () Bool)

(declare-fun b!92397 () Bool)

(declare-fun e!60220 () List!1537)

(assert (=> b!92397 (= e!60220 (ite c!15415 (t!5363 (toList!751 lt!44533)) (ite c!15412 (Cons!1533 (h!2125 (toList!751 lt!44533)) (t!5363 (toList!751 lt!44533))) Nil!1534)))))

(declare-fun call!9095 () List!1537)

(declare-fun bm!9092 () Bool)

(declare-fun c!15413 () Bool)

(assert (=> bm!9092 (= call!9095 ($colon$colon!74 e!60220 (ite c!15413 (h!2125 (toList!751 lt!44533)) (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536)))))))

(declare-fun c!15414 () Bool)

(assert (=> bm!9092 (= c!15414 c!15413)))

(declare-fun b!92398 () Bool)

(assert (=> b!92398 (= e!60220 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44533)) (_1!1133 lt!44536) (_2!1133 lt!44536)))))

(declare-fun d!24411 () Bool)

(declare-fun e!60217 () Bool)

(assert (=> d!24411 e!60217))

(declare-fun res!46980 () Bool)

(assert (=> d!24411 (=> (not res!46980) (not e!60217))))

(declare-fun lt!45313 () List!1537)

(assert (=> d!24411 (= res!46980 (isStrictlySorted!288 lt!45313))))

(declare-fun e!60221 () List!1537)

(assert (=> d!24411 (= lt!45313 e!60221)))

(assert (=> d!24411 (= c!15413 (and ((_ is Cons!1533) (toList!751 lt!44533)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44536))))))

(assert (=> d!24411 (isStrictlySorted!288 (toList!751 lt!44533))))

(assert (=> d!24411 (= (insertStrictlySorted!66 (toList!751 lt!44533) (_1!1133 lt!44536) (_2!1133 lt!44536)) lt!45313)))

(declare-fun b!92399 () Bool)

(declare-fun e!60218 () List!1537)

(declare-fun call!9096 () List!1537)

(assert (=> b!92399 (= e!60218 call!9096)))

(declare-fun b!92400 () Bool)

(declare-fun e!60219 () List!1537)

(declare-fun call!9097 () List!1537)

(assert (=> b!92400 (= e!60219 call!9097)))

(declare-fun b!92401 () Bool)

(declare-fun res!46979 () Bool)

(assert (=> b!92401 (=> (not res!46979) (not e!60217))))

(assert (=> b!92401 (= res!46979 (containsKey!149 lt!45313 (_1!1133 lt!44536)))))

(declare-fun bm!9093 () Bool)

(assert (=> bm!9093 (= call!9096 call!9095)))

(declare-fun b!92402 () Bool)

(assert (=> b!92402 (= e!60219 call!9097)))

(declare-fun bm!9094 () Bool)

(assert (=> bm!9094 (= call!9097 call!9096)))

(declare-fun b!92403 () Bool)

(assert (=> b!92403 (= e!60221 call!9095)))

(declare-fun b!92404 () Bool)

(assert (=> b!92404 (= c!15412 (and ((_ is Cons!1533) (toList!751 lt!44533)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44536))))))

(assert (=> b!92404 (= e!60218 e!60219)))

(declare-fun b!92405 () Bool)

(assert (=> b!92405 (= e!60221 e!60218)))

(assert (=> b!92405 (= c!15415 (and ((_ is Cons!1533) (toList!751 lt!44533)) (= (_1!1133 (h!2125 (toList!751 lt!44533))) (_1!1133 lt!44536))))))

(declare-fun b!92406 () Bool)

(assert (=> b!92406 (= e!60217 (contains!771 lt!45313 (tuple2!2245 (_1!1133 lt!44536) (_2!1133 lt!44536))))))

(assert (= (and d!24411 c!15413) b!92403))

(assert (= (and d!24411 (not c!15413)) b!92405))

(assert (= (and b!92405 c!15415) b!92399))

(assert (= (and b!92405 (not c!15415)) b!92404))

(assert (= (and b!92404 c!15412) b!92400))

(assert (= (and b!92404 (not c!15412)) b!92402))

(assert (= (or b!92400 b!92402) bm!9094))

(assert (= (or b!92399 bm!9094) bm!9093))

(assert (= (or b!92403 bm!9093) bm!9092))

(assert (= (and bm!9092 c!15414) b!92398))

(assert (= (and bm!9092 (not c!15414)) b!92397))

(assert (= (and d!24411 res!46980) b!92401))

(assert (= (and b!92401 res!46979) b!92406))

(declare-fun m!99609 () Bool)

(assert (=> bm!9092 m!99609))

(declare-fun m!99611 () Bool)

(assert (=> b!92401 m!99611))

(declare-fun m!99613 () Bool)

(assert (=> d!24411 m!99613))

(assert (=> d!24411 m!99105))

(declare-fun m!99615 () Bool)

(assert (=> b!92406 m!99615))

(declare-fun m!99617 () Bool)

(assert (=> b!92398 m!99617))

(assert (=> d!24111 d!24411))

(assert (=> d!24131 d!24193))

(declare-fun d!24413 () Bool)

(declare-fun e!60222 () Bool)

(assert (=> d!24413 e!60222))

(declare-fun res!46981 () Bool)

(assert (=> d!24413 (=> res!46981 e!60222)))

(declare-fun lt!45315 () Bool)

(assert (=> d!24413 (= res!46981 (not lt!45315))))

(declare-fun lt!45316 () Bool)

(assert (=> d!24413 (= lt!45315 lt!45316)))

(declare-fun lt!45317 () Unit!2702)

(declare-fun e!60223 () Unit!2702)

(assert (=> d!24413 (= lt!45317 e!60223)))

(declare-fun c!15416 () Bool)

(assert (=> d!24413 (= c!15416 lt!45316)))

(assert (=> d!24413 (= lt!45316 (containsKey!149 (toList!751 lt!44784) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!24413 (= (contains!769 lt!44784 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!45315)))

(declare-fun b!92407 () Bool)

(declare-fun lt!45314 () Unit!2702)

(assert (=> b!92407 (= e!60223 lt!45314)))

(assert (=> b!92407 (= lt!45314 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44784) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!92407 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!92408 () Bool)

(declare-fun Unit!2744 () Unit!2702)

(assert (=> b!92408 (= e!60223 Unit!2744)))

(declare-fun b!92409 () Bool)

(assert (=> b!92409 (= e!60222 (isDefined!98 (getValueByKey!146 (toList!751 lt!44784) (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!24413 c!15416) b!92407))

(assert (= (and d!24413 (not c!15416)) b!92408))

(assert (= (and d!24413 (not res!46981)) b!92409))

(assert (=> d!24413 m!98285))

(declare-fun m!99619 () Bool)

(assert (=> d!24413 m!99619))

(assert (=> b!92407 m!98285))

(declare-fun m!99621 () Bool)

(assert (=> b!92407 m!99621))

(assert (=> b!92407 m!98285))

(assert (=> b!92407 m!99207))

(assert (=> b!92407 m!99207))

(declare-fun m!99623 () Bool)

(assert (=> b!92407 m!99623))

(assert (=> b!92409 m!98285))

(assert (=> b!92409 m!99207))

(assert (=> b!92409 m!99207))

(assert (=> b!92409 m!99623))

(assert (=> b!91640 d!24413))

(declare-fun d!24415 () Bool)

(declare-fun res!46986 () Bool)

(declare-fun e!60230 () Bool)

(assert (=> d!24415 (=> res!46986 e!60230)))

(assert (=> d!24415 (= res!46986 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 newMap!16))))))

(assert (=> d!24415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 newMap!16) (mask!6465 newMap!16)) e!60230)))

(declare-fun b!92418 () Bool)

(declare-fun e!60232 () Bool)

(declare-fun e!60231 () Bool)

(assert (=> b!92418 (= e!60232 e!60231)))

(declare-fun lt!45325 () (_ BitVec 64))

(assert (=> b!92418 (= lt!45325 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!45326 () Unit!2702)

(assert (=> b!92418 (= lt!45326 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4085 newMap!16) lt!45325 #b00000000000000000000000000000000))))

(assert (=> b!92418 (arrayContainsKey!0 (_keys!4085 newMap!16) lt!45325 #b00000000000000000000000000000000)))

(declare-fun lt!45324 () Unit!2702)

(assert (=> b!92418 (= lt!45324 lt!45326)))

(declare-fun res!46987 () Bool)

(assert (=> b!92418 (= res!46987 (= (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000) (_keys!4085 newMap!16) (mask!6465 newMap!16)) (Found!242 #b00000000000000000000000000000000)))))

(assert (=> b!92418 (=> (not res!46987) (not e!60231))))

(declare-fun bm!9097 () Bool)

(declare-fun call!9100 () Bool)

(assert (=> bm!9097 (= call!9100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4085 newMap!16) (mask!6465 newMap!16)))))

(declare-fun b!92419 () Bool)

(assert (=> b!92419 (= e!60232 call!9100)))

(declare-fun b!92420 () Bool)

(assert (=> b!92420 (= e!60230 e!60232)))

(declare-fun c!15419 () Bool)

(assert (=> b!92420 (= c!15419 (validKeyInArray!0 (select (arr!1958 (_keys!4085 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!92421 () Bool)

(assert (=> b!92421 (= e!60231 call!9100)))

(assert (= (and d!24415 (not res!46986)) b!92420))

(assert (= (and b!92420 c!15419) b!92418))

(assert (= (and b!92420 (not c!15419)) b!92419))

(assert (= (and b!92418 res!46987) b!92421))

(assert (= (or b!92421 b!92419) bm!9097))

(assert (=> b!92418 m!98741))

(declare-fun m!99625 () Bool)

(assert (=> b!92418 m!99625))

(declare-fun m!99627 () Bool)

(assert (=> b!92418 m!99627))

(assert (=> b!92418 m!98741))

(declare-fun m!99629 () Bool)

(assert (=> b!92418 m!99629))

(declare-fun m!99631 () Bool)

(assert (=> bm!9097 m!99631))

(assert (=> b!92420 m!98741))

(assert (=> b!92420 m!98741))

(assert (=> b!92420 m!98743))

(assert (=> b!91668 d!24415))

(declare-fun d!24417 () Bool)

(declare-fun res!46988 () Bool)

(declare-fun e!60233 () Bool)

(assert (=> d!24417 (=> res!46988 e!60233)))

(assert (=> d!24417 (= res!46988 (bvsge #b00000000000000000000000000000000 (size!2205 (_keys!4085 (_2!1132 lt!44543)))))))

(assert (=> d!24417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4085 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543))) e!60233)))

(declare-fun b!92422 () Bool)

(declare-fun e!60235 () Bool)

(declare-fun e!60234 () Bool)

(assert (=> b!92422 (= e!60235 e!60234)))

(declare-fun lt!45328 () (_ BitVec 64))

(assert (=> b!92422 (= lt!45328 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000))))

(declare-fun lt!45329 () Unit!2702)

(assert (=> b!92422 (= lt!45329 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4085 (_2!1132 lt!44543)) lt!45328 #b00000000000000000000000000000000))))

(assert (=> b!92422 (arrayContainsKey!0 (_keys!4085 (_2!1132 lt!44543)) lt!45328 #b00000000000000000000000000000000)))

(declare-fun lt!45327 () Unit!2702)

(assert (=> b!92422 (= lt!45327 lt!45329)))

(declare-fun res!46989 () Bool)

(assert (=> b!92422 (= res!46989 (= (seekEntryOrOpen!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000) (_keys!4085 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543))) (Found!242 #b00000000000000000000000000000000)))))

(assert (=> b!92422 (=> (not res!46989) (not e!60234))))

(declare-fun bm!9098 () Bool)

(declare-fun call!9101 () Bool)

(assert (=> bm!9098 (= call!9101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4085 (_2!1132 lt!44543)) (mask!6465 (_2!1132 lt!44543))))))

(declare-fun b!92423 () Bool)

(assert (=> b!92423 (= e!60235 call!9101)))

(declare-fun b!92424 () Bool)

(assert (=> b!92424 (= e!60233 e!60235)))

(declare-fun c!15420 () Bool)

(assert (=> b!92424 (= c!15420 (validKeyInArray!0 (select (arr!1958 (_keys!4085 (_2!1132 lt!44543))) #b00000000000000000000000000000000)))))

(declare-fun b!92425 () Bool)

(assert (=> b!92425 (= e!60234 call!9101)))

(assert (= (and d!24417 (not res!46988)) b!92424))

(assert (= (and b!92424 c!15420) b!92422))

(assert (= (and b!92424 (not c!15420)) b!92423))

(assert (= (and b!92422 res!46989) b!92425))

(assert (= (or b!92425 b!92423) bm!9098))

(assert (=> b!92422 m!98847))

(declare-fun m!99633 () Bool)

(assert (=> b!92422 m!99633))

(declare-fun m!99635 () Bool)

(assert (=> b!92422 m!99635))

(assert (=> b!92422 m!98847))

(declare-fun m!99637 () Bool)

(assert (=> b!92422 m!99637))

(declare-fun m!99639 () Bool)

(assert (=> bm!9098 m!99639))

(assert (=> b!92424 m!98847))

(assert (=> b!92424 m!98847))

(assert (=> b!92424 m!98849))

(assert (=> b!91521 d!24417))

(declare-fun d!24419 () Bool)

(declare-fun e!60236 () Bool)

(assert (=> d!24419 e!60236))

(declare-fun res!46990 () Bool)

(assert (=> d!24419 (=> (not res!46990) (not e!60236))))

(declare-fun lt!45330 () ListLongMap!1471)

(assert (=> d!24419 (= res!46990 (contains!769 lt!45330 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun lt!45333 () List!1537)

(assert (=> d!24419 (= lt!45330 (ListLongMap!1472 lt!45333))))

(declare-fun lt!45331 () Unit!2702)

(declare-fun lt!45332 () Unit!2702)

(assert (=> d!24419 (= lt!45331 lt!45332)))

(assert (=> d!24419 (= (getValueByKey!146 lt!45333 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24419 (= lt!45332 (lemmaContainsTupThenGetReturnValue!63 lt!45333 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24419 (= lt!45333 (insertStrictlySorted!66 (toList!751 (+!120 lt!44531 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24419 (= (+!120 (+!120 lt!44531 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) lt!45330)))

(declare-fun b!92426 () Bool)

(declare-fun res!46991 () Bool)

(assert (=> b!92426 (=> (not res!46991) (not e!60236))))

(assert (=> b!92426 (= res!46991 (= (getValueByKey!146 (toList!751 lt!45330) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun b!92427 () Bool)

(assert (=> b!92427 (= e!60236 (contains!771 (toList!751 lt!45330) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (= (and d!24419 res!46990) b!92426))

(assert (= (and b!92426 res!46991) b!92427))

(declare-fun m!99641 () Bool)

(assert (=> d!24419 m!99641))

(declare-fun m!99643 () Bool)

(assert (=> d!24419 m!99643))

(declare-fun m!99645 () Bool)

(assert (=> d!24419 m!99645))

(declare-fun m!99647 () Bool)

(assert (=> d!24419 m!99647))

(declare-fun m!99649 () Bool)

(assert (=> b!92426 m!99649))

(declare-fun m!99651 () Bool)

(assert (=> b!92427 m!99651))

(assert (=> d!24105 d!24419))

(declare-fun d!24421 () Bool)

(declare-fun e!60237 () Bool)

(assert (=> d!24421 e!60237))

(declare-fun res!46992 () Bool)

(assert (=> d!24421 (=> (not res!46992) (not e!60237))))

(declare-fun lt!45334 () ListLongMap!1471)

(assert (=> d!24421 (= res!46992 (contains!769 lt!45334 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(declare-fun lt!45337 () List!1537)

(assert (=> d!24421 (= lt!45334 (ListLongMap!1472 lt!45337))))

(declare-fun lt!45335 () Unit!2702)

(declare-fun lt!45336 () Unit!2702)

(assert (=> d!24421 (= lt!45335 lt!45336)))

(assert (=> d!24421 (= (getValueByKey!146 lt!45337 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24421 (= lt!45336 (lemmaContainsTupThenGetReturnValue!63 lt!45337 (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24421 (= lt!45337 (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))))))

(assert (=> d!24421 (= (+!120 lt!44531 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) lt!45334)))

(declare-fun b!92428 () Bool)

(declare-fun res!46993 () Bool)

(assert (=> b!92428 (=> (not res!46993) (not e!60237))))

(assert (=> b!92428 (= res!46993 (= (getValueByKey!146 (toList!751 lt!45334) (_1!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (Some!151 (_2!1133 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))))

(declare-fun b!92429 () Bool)

(assert (=> b!92429 (= e!60237 (contains!771 (toList!751 lt!45334) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (= (and d!24421 res!46992) b!92428))

(assert (= (and b!92428 res!46993) b!92429))

(declare-fun m!99653 () Bool)

(assert (=> d!24421 m!99653))

(declare-fun m!99655 () Bool)

(assert (=> d!24421 m!99655))

(declare-fun m!99657 () Bool)

(assert (=> d!24421 m!99657))

(declare-fun m!99659 () Bool)

(assert (=> d!24421 m!99659))

(declare-fun m!99661 () Bool)

(assert (=> b!92428 m!99661))

(declare-fun m!99663 () Bool)

(assert (=> b!92429 m!99663))

(assert (=> d!24105 d!24421))

(declare-fun d!24423 () Bool)

(assert (=> d!24423 (= (+!120 (+!120 lt!44531 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (+!120 (+!120 lt!44531 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)))))

(assert (=> d!24423 true))

(declare-fun _$28!155 () Unit!2702)

(assert (=> d!24423 (= (choose!550 lt!44531 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))) _$28!155)))

(declare-fun bs!3833 () Bool)

(assert (= bs!3833 d!24423))

(assert (=> bs!3833 m!98271))

(assert (=> bs!3833 m!98271))

(assert (=> bs!3833 m!98273))

(assert (=> bs!3833 m!98275))

(assert (=> bs!3833 m!98275))

(assert (=> bs!3833 m!98277))

(assert (=> d!24105 d!24423))

(declare-fun d!24425 () Bool)

(declare-fun e!60238 () Bool)

(assert (=> d!24425 e!60238))

(declare-fun res!46994 () Bool)

(assert (=> d!24425 (=> (not res!46994) (not e!60238))))

(declare-fun lt!45338 () ListLongMap!1471)

(assert (=> d!24425 (= res!46994 (contains!769 lt!45338 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45341 () List!1537)

(assert (=> d!24425 (= lt!45338 (ListLongMap!1472 lt!45341))))

(declare-fun lt!45339 () Unit!2702)

(declare-fun lt!45340 () Unit!2702)

(assert (=> d!24425 (= lt!45339 lt!45340)))

(assert (=> d!24425 (= (getValueByKey!146 lt!45341 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24425 (= lt!45340 (lemmaContainsTupThenGetReturnValue!63 lt!45341 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24425 (= lt!45341 (insertStrictlySorted!66 (toList!751 lt!44531) (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24425 (= (+!120 lt!44531 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45338)))

(declare-fun b!92430 () Bool)

(declare-fun res!46995 () Bool)

(assert (=> b!92430 (=> (not res!46995) (not e!60238))))

(assert (=> b!92430 (= res!46995 (= (getValueByKey!146 (toList!751 lt!45338) (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92431 () Bool)

(assert (=> b!92431 (= e!60238 (contains!771 (toList!751 lt!45338) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24425 res!46994) b!92430))

(assert (= (and b!92430 res!46995) b!92431))

(declare-fun m!99665 () Bool)

(assert (=> d!24425 m!99665))

(declare-fun m!99667 () Bool)

(assert (=> d!24425 m!99667))

(declare-fun m!99669 () Bool)

(assert (=> d!24425 m!99669))

(declare-fun m!99671 () Bool)

(assert (=> d!24425 m!99671))

(declare-fun m!99673 () Bool)

(assert (=> b!92430 m!99673))

(declare-fun m!99675 () Bool)

(assert (=> b!92431 m!99675))

(assert (=> d!24105 d!24425))

(declare-fun d!24427 () Bool)

(declare-fun e!60239 () Bool)

(assert (=> d!24427 e!60239))

(declare-fun res!46996 () Bool)

(assert (=> d!24427 (=> (not res!46996) (not e!60239))))

(declare-fun lt!45342 () ListLongMap!1471)

(assert (=> d!24427 (= res!46996 (contains!769 lt!45342 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45345 () List!1537)

(assert (=> d!24427 (= lt!45342 (ListLongMap!1472 lt!45345))))

(declare-fun lt!45343 () Unit!2702)

(declare-fun lt!45344 () Unit!2702)

(assert (=> d!24427 (= lt!45343 lt!45344)))

(assert (=> d!24427 (= (getValueByKey!146 lt!45345 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24427 (= lt!45344 (lemmaContainsTupThenGetReturnValue!63 lt!45345 (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24427 (= lt!45345 (insertStrictlySorted!66 (toList!751 (+!120 lt!44531 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529))) (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24427 (= (+!120 (+!120 lt!44531 (tuple2!2245 (select (arr!1958 (_keys!4085 (v!2723 (underlying!315 thiss!992)))) from!355) lt!44529)) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45342)))

(declare-fun b!92432 () Bool)

(declare-fun res!46997 () Bool)

(assert (=> b!92432 (=> (not res!46997) (not e!60239))))

(assert (=> b!92432 (= res!46997 (= (getValueByKey!146 (toList!751 lt!45342) (_1!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92433 () Bool)

(assert (=> b!92433 (= e!60239 (contains!771 (toList!751 lt!45342) (tuple2!2245 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24427 res!46996) b!92432))

(assert (= (and b!92432 res!46997) b!92433))

(declare-fun m!99677 () Bool)

(assert (=> d!24427 m!99677))

(declare-fun m!99679 () Bool)

(assert (=> d!24427 m!99679))

(declare-fun m!99681 () Bool)

(assert (=> d!24427 m!99681))

(declare-fun m!99683 () Bool)

(assert (=> d!24427 m!99683))

(declare-fun m!99685 () Bool)

(assert (=> b!92432 m!99685))

(declare-fun m!99687 () Bool)

(assert (=> b!92433 m!99687))

(assert (=> d!24105 d!24427))

(declare-fun d!24429 () Bool)

(declare-fun e!60240 () Bool)

(assert (=> d!24429 e!60240))

(declare-fun res!46998 () Bool)

(assert (=> d!24429 (=> (not res!46998) (not e!60240))))

(declare-fun lt!45346 () ListLongMap!1471)

(assert (=> d!24429 (= res!46998 (contains!769 lt!45346 (_1!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45349 () List!1537)

(assert (=> d!24429 (= lt!45346 (ListLongMap!1472 lt!45349))))

(declare-fun lt!45347 () Unit!2702)

(declare-fun lt!45348 () Unit!2702)

(assert (=> d!24429 (= lt!45347 lt!45348)))

(assert (=> d!24429 (= (getValueByKey!146 lt!45349 (_1!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24429 (= lt!45348 (lemmaContainsTupThenGetReturnValue!63 lt!45349 (_1!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24429 (= lt!45349 (insertStrictlySorted!66 (toList!751 lt!44796) (_1!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24429 (= (+!120 lt!44796 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45346)))

(declare-fun b!92434 () Bool)

(declare-fun res!46999 () Bool)

(assert (=> b!92434 (=> (not res!46999) (not e!60240))))

(assert (=> b!92434 (= res!46999 (= (getValueByKey!146 (toList!751 lt!45346) (_1!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92435 () Bool)

(assert (=> b!92435 (= e!60240 (contains!771 (toList!751 lt!45346) (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24429 res!46998) b!92434))

(assert (= (and b!92434 res!46999) b!92435))

(declare-fun m!99689 () Bool)

(assert (=> d!24429 m!99689))

(declare-fun m!99691 () Bool)

(assert (=> d!24429 m!99691))

(declare-fun m!99693 () Bool)

(assert (=> d!24429 m!99693))

(declare-fun m!99695 () Bool)

(assert (=> d!24429 m!99695))

(declare-fun m!99697 () Bool)

(assert (=> b!92434 m!99697))

(declare-fun m!99699 () Bool)

(assert (=> b!92435 m!99699))

(assert (=> b!91644 d!24429))

(declare-fun d!24431 () Bool)

(assert (=> d!24431 (= (apply!87 (+!120 lt!44795 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44787) (apply!87 lt!44795 lt!44787))))

(declare-fun lt!45350 () Unit!2702)

(assert (=> d!24431 (= lt!45350 (choose!560 lt!44795 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44787))))

(declare-fun e!60241 () Bool)

(assert (=> d!24431 e!60241))

(declare-fun res!47000 () Bool)

(assert (=> d!24431 (=> (not res!47000) (not e!60241))))

(assert (=> d!24431 (= res!47000 (contains!769 lt!44795 lt!44787))))

(assert (=> d!24431 (= (addApplyDifferent!63 lt!44795 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44787) lt!45350)))

(declare-fun b!92436 () Bool)

(assert (=> b!92436 (= e!60241 (not (= lt!44787 lt!44797)))))

(assert (= (and d!24431 res!47000) b!92436))

(assert (=> d!24431 m!98487))

(assert (=> d!24431 m!98467))

(assert (=> d!24431 m!98469))

(assert (=> d!24431 m!98467))

(declare-fun m!99701 () Bool)

(assert (=> d!24431 m!99701))

(declare-fun m!99703 () Bool)

(assert (=> d!24431 m!99703))

(assert (=> b!91644 d!24431))

(declare-fun d!24433 () Bool)

(assert (=> d!24433 (= (apply!87 (+!120 lt!44795 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44787) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44795 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44787)))))

(declare-fun bs!3834 () Bool)

(assert (= bs!3834 d!24433))

(declare-fun m!99705 () Bool)

(assert (=> bs!3834 m!99705))

(assert (=> bs!3834 m!99705))

(declare-fun m!99707 () Bool)

(assert (=> bs!3834 m!99707))

(assert (=> b!91644 d!24433))

(declare-fun d!24435 () Bool)

(declare-fun e!60242 () Bool)

(assert (=> d!24435 e!60242))

(declare-fun res!47001 () Bool)

(assert (=> d!24435 (=> (not res!47001) (not e!60242))))

(declare-fun lt!45351 () ListLongMap!1471)

(assert (=> d!24435 (= res!47001 (contains!769 lt!45351 (_1!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45354 () List!1537)

(assert (=> d!24435 (= lt!45351 (ListLongMap!1472 lt!45354))))

(declare-fun lt!45352 () Unit!2702)

(declare-fun lt!45353 () Unit!2702)

(assert (=> d!24435 (= lt!45352 lt!45353)))

(assert (=> d!24435 (= (getValueByKey!146 lt!45354 (_1!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24435 (= lt!45353 (lemmaContainsTupThenGetReturnValue!63 lt!45354 (_1!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24435 (= lt!45354 (insertStrictlySorted!66 (toList!751 lt!44790) (_1!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24435 (= (+!120 lt!44790 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45351)))

(declare-fun b!92437 () Bool)

(declare-fun res!47002 () Bool)

(assert (=> b!92437 (=> (not res!47002) (not e!60242))))

(assert (=> b!92437 (= res!47002 (= (getValueByKey!146 (toList!751 lt!45351) (_1!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92438 () Bool)

(assert (=> b!92438 (= e!60242 (contains!771 (toList!751 lt!45351) (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24435 res!47001) b!92437))

(assert (= (and b!92437 res!47002) b!92438))

(declare-fun m!99709 () Bool)

(assert (=> d!24435 m!99709))

(declare-fun m!99711 () Bool)

(assert (=> d!24435 m!99711))

(declare-fun m!99713 () Bool)

(assert (=> d!24435 m!99713))

(declare-fun m!99715 () Bool)

(assert (=> d!24435 m!99715))

(declare-fun m!99717 () Bool)

(assert (=> b!92437 m!99717))

(declare-fun m!99719 () Bool)

(assert (=> b!92438 m!99719))

(assert (=> b!91644 d!24435))

(assert (=> b!91644 d!24107))

(declare-fun d!24437 () Bool)

(assert (=> d!24437 (contains!769 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44783)))

(declare-fun lt!45355 () Unit!2702)

(assert (=> d!24437 (= lt!45355 (choose!559 lt!44799 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44783))))

(assert (=> d!24437 (contains!769 lt!44799 lt!44783)))

(assert (=> d!24437 (= (addStillContains!63 lt!44799 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44783) lt!45355)))

(declare-fun bs!3835 () Bool)

(assert (= bs!3835 d!24437))

(assert (=> bs!3835 m!98471))

(assert (=> bs!3835 m!98471))

(assert (=> bs!3835 m!98479))

(declare-fun m!99721 () Bool)

(assert (=> bs!3835 m!99721))

(declare-fun m!99723 () Bool)

(assert (=> bs!3835 m!99723))

(assert (=> b!91644 d!24437))

(declare-fun d!24439 () Bool)

(assert (=> d!24439 (= (apply!87 (+!120 lt!44796 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44780) (apply!87 lt!44796 lt!44780))))

(declare-fun lt!45356 () Unit!2702)

(assert (=> d!24439 (= lt!45356 (choose!560 lt!44796 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44780))))

(declare-fun e!60243 () Bool)

(assert (=> d!24439 e!60243))

(declare-fun res!47003 () Bool)

(assert (=> d!24439 (=> (not res!47003) (not e!60243))))

(assert (=> d!24439 (= res!47003 (contains!769 lt!44796 lt!44780))))

(assert (=> d!24439 (= (addApplyDifferent!63 lt!44796 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44780) lt!45356)))

(declare-fun b!92439 () Bool)

(assert (=> b!92439 (= e!60243 (not (= lt!44780 lt!44788)))))

(assert (= (and d!24439 res!47003) b!92439))

(assert (=> d!24439 m!98489))

(assert (=> d!24439 m!98463))

(assert (=> d!24439 m!98485))

(assert (=> d!24439 m!98463))

(declare-fun m!99725 () Bool)

(assert (=> d!24439 m!99725))

(declare-fun m!99727 () Bool)

(assert (=> d!24439 m!99727))

(assert (=> b!91644 d!24439))

(declare-fun d!24441 () Bool)

(assert (=> d!24441 (= (apply!87 lt!44795 lt!44787) (get!1252 (getValueByKey!146 (toList!751 lt!44795) lt!44787)))))

(declare-fun bs!3836 () Bool)

(assert (= bs!3836 d!24441))

(declare-fun m!99729 () Bool)

(assert (=> bs!3836 m!99729))

(assert (=> bs!3836 m!99729))

(declare-fun m!99731 () Bool)

(assert (=> bs!3836 m!99731))

(assert (=> b!91644 d!24441))

(declare-fun d!24443 () Bool)

(declare-fun e!60244 () Bool)

(assert (=> d!24443 e!60244))

(declare-fun res!47004 () Bool)

(assert (=> d!24443 (=> res!47004 e!60244)))

(declare-fun lt!45358 () Bool)

(assert (=> d!24443 (= res!47004 (not lt!45358))))

(declare-fun lt!45359 () Bool)

(assert (=> d!24443 (= lt!45358 lt!45359)))

(declare-fun lt!45360 () Unit!2702)

(declare-fun e!60245 () Unit!2702)

(assert (=> d!24443 (= lt!45360 e!60245)))

(declare-fun c!15421 () Bool)

(assert (=> d!24443 (= c!15421 lt!45359)))

(assert (=> d!24443 (= lt!45359 (containsKey!149 (toList!751 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44783))))

(assert (=> d!24443 (= (contains!769 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44783) lt!45358)))

(declare-fun b!92440 () Bool)

(declare-fun lt!45357 () Unit!2702)

(assert (=> b!92440 (= e!60245 lt!45357)))

(assert (=> b!92440 (= lt!45357 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44783))))

(assert (=> b!92440 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44783))))

(declare-fun b!92441 () Bool)

(declare-fun Unit!2745 () Unit!2702)

(assert (=> b!92441 (= e!60245 Unit!2745)))

(declare-fun b!92442 () Bool)

(assert (=> b!92442 (= e!60244 (isDefined!98 (getValueByKey!146 (toList!751 (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44783)))))

(assert (= (and d!24443 c!15421) b!92440))

(assert (= (and d!24443 (not c!15421)) b!92441))

(assert (= (and d!24443 (not res!47004)) b!92442))

(declare-fun m!99733 () Bool)

(assert (=> d!24443 m!99733))

(declare-fun m!99735 () Bool)

(assert (=> b!92440 m!99735))

(declare-fun m!99737 () Bool)

(assert (=> b!92440 m!99737))

(assert (=> b!92440 m!99737))

(declare-fun m!99739 () Bool)

(assert (=> b!92440 m!99739))

(assert (=> b!92442 m!99737))

(assert (=> b!92442 m!99737))

(assert (=> b!92442 m!99739))

(assert (=> b!91644 d!24443))

(declare-fun d!24445 () Bool)

(assert (=> d!24445 (= (apply!87 (+!120 lt!44796 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44780) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44796 (tuple2!2245 lt!44788 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44780)))))

(declare-fun bs!3837 () Bool)

(assert (= bs!3837 d!24445))

(declare-fun m!99741 () Bool)

(assert (=> bs!3837 m!99741))

(assert (=> bs!3837 m!99741))

(declare-fun m!99743 () Bool)

(assert (=> bs!3837 m!99743))

(assert (=> b!91644 d!24445))

(declare-fun d!24447 () Bool)

(declare-fun e!60246 () Bool)

(assert (=> d!24447 e!60246))

(declare-fun res!47005 () Bool)

(assert (=> d!24447 (=> (not res!47005) (not e!60246))))

(declare-fun lt!45361 () ListLongMap!1471)

(assert (=> d!24447 (= res!47005 (contains!769 lt!45361 (_1!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45364 () List!1537)

(assert (=> d!24447 (= lt!45361 (ListLongMap!1472 lt!45364))))

(declare-fun lt!45362 () Unit!2702)

(declare-fun lt!45363 () Unit!2702)

(assert (=> d!24447 (= lt!45362 lt!45363)))

(assert (=> d!24447 (= (getValueByKey!146 lt!45364 (_1!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24447 (= lt!45363 (lemmaContainsTupThenGetReturnValue!63 lt!45364 (_1!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24447 (= lt!45364 (insertStrictlySorted!66 (toList!751 lt!44795) (_1!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24447 (= (+!120 lt!44795 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45361)))

(declare-fun b!92443 () Bool)

(declare-fun res!47006 () Bool)

(assert (=> b!92443 (=> (not res!47006) (not e!60246))))

(assert (=> b!92443 (= res!47006 (= (getValueByKey!146 (toList!751 lt!45361) (_1!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92444 () Bool)

(assert (=> b!92444 (= e!60246 (contains!771 (toList!751 lt!45361) (tuple2!2245 lt!44797 (minValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24447 res!47005) b!92443))

(assert (= (and b!92443 res!47006) b!92444))

(declare-fun m!99745 () Bool)

(assert (=> d!24447 m!99745))

(declare-fun m!99747 () Bool)

(assert (=> d!24447 m!99747))

(declare-fun m!99749 () Bool)

(assert (=> d!24447 m!99749))

(declare-fun m!99751 () Bool)

(assert (=> d!24447 m!99751))

(declare-fun m!99753 () Bool)

(assert (=> b!92443 m!99753))

(declare-fun m!99755 () Bool)

(assert (=> b!92444 m!99755))

(assert (=> b!91644 d!24447))

(declare-fun d!24449 () Bool)

(assert (=> d!24449 (= (apply!87 lt!44796 lt!44780) (get!1252 (getValueByKey!146 (toList!751 lt!44796) lt!44780)))))

(declare-fun bs!3838 () Bool)

(assert (= bs!3838 d!24449))

(declare-fun m!99757 () Bool)

(assert (=> bs!3838 m!99757))

(assert (=> bs!3838 m!99757))

(declare-fun m!99759 () Bool)

(assert (=> bs!3838 m!99759))

(assert (=> b!91644 d!24449))

(declare-fun d!24451 () Bool)

(assert (=> d!24451 (= (apply!87 (+!120 lt!44790 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44794) (apply!87 lt!44790 lt!44794))))

(declare-fun lt!45365 () Unit!2702)

(assert (=> d!24451 (= lt!45365 (choose!560 lt!44790 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44794))))

(declare-fun e!60247 () Bool)

(assert (=> d!24451 e!60247))

(declare-fun res!47007 () Bool)

(assert (=> d!24451 (=> (not res!47007) (not e!60247))))

(assert (=> d!24451 (= res!47007 (contains!769 lt!44790 lt!44794))))

(assert (=> d!24451 (= (addApplyDifferent!63 lt!44790 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))) lt!44794) lt!45365)))

(declare-fun b!92445 () Bool)

(assert (=> b!92445 (= e!60247 (not (= lt!44794 lt!44786)))))

(assert (= (and d!24451 res!47007) b!92445))

(assert (=> d!24451 m!98491))

(assert (=> d!24451 m!98473))

(assert (=> d!24451 m!98475))

(assert (=> d!24451 m!98473))

(declare-fun m!99761 () Bool)

(assert (=> d!24451 m!99761))

(declare-fun m!99763 () Bool)

(assert (=> d!24451 m!99763))

(assert (=> b!91644 d!24451))

(declare-fun d!24453 () Bool)

(assert (=> d!24453 (= (apply!87 (+!120 lt!44790 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!44794) (get!1252 (getValueByKey!146 (toList!751 (+!120 lt!44790 (tuple2!2245 lt!44786 (minValue!2293 (v!2723 (underlying!315 thiss!992)))))) lt!44794)))))

(declare-fun bs!3839 () Bool)

(assert (= bs!3839 d!24453))

(declare-fun m!99765 () Bool)

(assert (=> bs!3839 m!99765))

(assert (=> bs!3839 m!99765))

(declare-fun m!99767 () Bool)

(assert (=> bs!3839 m!99767))

(assert (=> b!91644 d!24453))

(declare-fun d!24455 () Bool)

(declare-fun e!60248 () Bool)

(assert (=> d!24455 e!60248))

(declare-fun res!47008 () Bool)

(assert (=> d!24455 (=> (not res!47008) (not e!60248))))

(declare-fun lt!45366 () ListLongMap!1471)

(assert (=> d!24455 (= res!47008 (contains!769 lt!45366 (_1!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(declare-fun lt!45369 () List!1537)

(assert (=> d!24455 (= lt!45366 (ListLongMap!1472 lt!45369))))

(declare-fun lt!45367 () Unit!2702)

(declare-fun lt!45368 () Unit!2702)

(assert (=> d!24455 (= lt!45367 lt!45368)))

(assert (=> d!24455 (= (getValueByKey!146 lt!45369 (_1!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24455 (= lt!45368 (lemmaContainsTupThenGetReturnValue!63 lt!45369 (_1!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24455 (= lt!45369 (insertStrictlySorted!66 (toList!751 lt!44799) (_1!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) (_2!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))))))

(assert (=> d!24455 (= (+!120 lt!44799 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))) lt!45366)))

(declare-fun b!92446 () Bool)

(declare-fun res!47009 () Bool)

(assert (=> b!92446 (=> (not res!47009) (not e!60248))))

(assert (=> b!92446 (= res!47009 (= (getValueByKey!146 (toList!751 lt!45366) (_1!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992)))))) (Some!151 (_2!1133 (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))))

(declare-fun b!92447 () Bool)

(assert (=> b!92447 (= e!60248 (contains!771 (toList!751 lt!45366) (tuple2!2245 lt!44779 (zeroValue!2293 (v!2723 (underlying!315 thiss!992))))))))

(assert (= (and d!24455 res!47008) b!92446))

(assert (= (and b!92446 res!47009) b!92447))

(declare-fun m!99769 () Bool)

(assert (=> d!24455 m!99769))

(declare-fun m!99771 () Bool)

(assert (=> d!24455 m!99771))

(declare-fun m!99773 () Bool)

(assert (=> d!24455 m!99773))

(declare-fun m!99775 () Bool)

(assert (=> d!24455 m!99775))

(declare-fun m!99777 () Bool)

(assert (=> b!92446 m!99777))

(declare-fun m!99779 () Bool)

(assert (=> b!92447 m!99779))

(assert (=> b!91644 d!24455))

(declare-fun d!24457 () Bool)

(assert (=> d!24457 (= (apply!87 lt!44790 lt!44794) (get!1252 (getValueByKey!146 (toList!751 lt!44790) lt!44794)))))

(declare-fun bs!3840 () Bool)

(assert (= bs!3840 d!24457))

(declare-fun m!99781 () Bool)

(assert (=> bs!3840 m!99781))

(assert (=> bs!3840 m!99781))

(declare-fun m!99783 () Bool)

(assert (=> bs!3840 m!99783))

(assert (=> b!91644 d!24457))

(declare-fun d!24459 () Bool)

(declare-fun e!60249 () Bool)

(assert (=> d!24459 e!60249))

(declare-fun res!47010 () Bool)

(assert (=> d!24459 (=> res!47010 e!60249)))

(declare-fun lt!45371 () Bool)

(assert (=> d!24459 (= res!47010 (not lt!45371))))

(declare-fun lt!45372 () Bool)

(assert (=> d!24459 (= lt!45371 lt!45372)))

(declare-fun lt!45373 () Unit!2702)

(declare-fun e!60250 () Unit!2702)

(assert (=> d!24459 (= lt!45373 e!60250)))

(declare-fun c!15422 () Bool)

(assert (=> d!24459 (= c!15422 lt!45372)))

(assert (=> d!24459 (= lt!45372 (containsKey!149 (toList!751 lt!44696) (_1!1133 lt!44540)))))

(assert (=> d!24459 (= (contains!769 lt!44696 (_1!1133 lt!44540)) lt!45371)))

(declare-fun b!92448 () Bool)

(declare-fun lt!45370 () Unit!2702)

(assert (=> b!92448 (= e!60250 lt!45370)))

(assert (=> b!92448 (= lt!45370 (lemmaContainsKeyImpliesGetValueByKeyDefined!97 (toList!751 lt!44696) (_1!1133 lt!44540)))))

(assert (=> b!92448 (isDefined!98 (getValueByKey!146 (toList!751 lt!44696) (_1!1133 lt!44540)))))

(declare-fun b!92449 () Bool)

(declare-fun Unit!2746 () Unit!2702)

(assert (=> b!92449 (= e!60250 Unit!2746)))

(declare-fun b!92450 () Bool)

(assert (=> b!92450 (= e!60249 (isDefined!98 (getValueByKey!146 (toList!751 lt!44696) (_1!1133 lt!44540))))))

(assert (= (and d!24459 c!15422) b!92448))

(assert (= (and d!24459 (not c!15422)) b!92449))

(assert (= (and d!24459 (not res!47010)) b!92450))

(declare-fun m!99785 () Bool)

(assert (=> d!24459 m!99785))

(declare-fun m!99787 () Bool)

(assert (=> b!92448 m!99787))

(assert (=> b!92448 m!98355))

(assert (=> b!92448 m!98355))

(declare-fun m!99789 () Bool)

(assert (=> b!92448 m!99789))

(assert (=> b!92450 m!98355))

(assert (=> b!92450 m!98355))

(assert (=> b!92450 m!99789))

(assert (=> d!24115 d!24459))

(declare-fun b!92453 () Bool)

(declare-fun e!60252 () Option!152)

(assert (=> b!92453 (= e!60252 (getValueByKey!146 (t!5363 lt!44699) (_1!1133 lt!44540)))))

(declare-fun b!92454 () Bool)

(assert (=> b!92454 (= e!60252 None!150)))

(declare-fun d!24461 () Bool)

(declare-fun c!15423 () Bool)

(assert (=> d!24461 (= c!15423 (and ((_ is Cons!1533) lt!44699) (= (_1!1133 (h!2125 lt!44699)) (_1!1133 lt!44540))))))

(declare-fun e!60251 () Option!152)

(assert (=> d!24461 (= (getValueByKey!146 lt!44699 (_1!1133 lt!44540)) e!60251)))

(declare-fun b!92452 () Bool)

(assert (=> b!92452 (= e!60251 e!60252)))

(declare-fun c!15424 () Bool)

(assert (=> b!92452 (= c!15424 (and ((_ is Cons!1533) lt!44699) (not (= (_1!1133 (h!2125 lt!44699)) (_1!1133 lt!44540)))))))

(declare-fun b!92451 () Bool)

(assert (=> b!92451 (= e!60251 (Some!151 (_2!1133 (h!2125 lt!44699))))))

(assert (= (and d!24461 c!15423) b!92451))

(assert (= (and d!24461 (not c!15423)) b!92452))

(assert (= (and b!92452 c!15424) b!92453))

(assert (= (and b!92452 (not c!15424)) b!92454))

(declare-fun m!99791 () Bool)

(assert (=> b!92453 m!99791))

(assert (=> d!24115 d!24461))

(declare-fun d!24463 () Bool)

(assert (=> d!24463 (= (getValueByKey!146 lt!44699 (_1!1133 lt!44540)) (Some!151 (_2!1133 lt!44540)))))

(declare-fun lt!45374 () Unit!2702)

(assert (=> d!24463 (= lt!45374 (choose!555 lt!44699 (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(declare-fun e!60253 () Bool)

(assert (=> d!24463 e!60253))

(declare-fun res!47011 () Bool)

(assert (=> d!24463 (=> (not res!47011) (not e!60253))))

(assert (=> d!24463 (= res!47011 (isStrictlySorted!288 lt!44699))))

(assert (=> d!24463 (= (lemmaContainsTupThenGetReturnValue!63 lt!44699 (_1!1133 lt!44540) (_2!1133 lt!44540)) lt!45374)))

(declare-fun b!92455 () Bool)

(declare-fun res!47012 () Bool)

(assert (=> b!92455 (=> (not res!47012) (not e!60253))))

(assert (=> b!92455 (= res!47012 (containsKey!149 lt!44699 (_1!1133 lt!44540)))))

(declare-fun b!92456 () Bool)

(assert (=> b!92456 (= e!60253 (contains!771 lt!44699 (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540))))))

(assert (= (and d!24463 res!47011) b!92455))

(assert (= (and b!92455 res!47012) b!92456))

(assert (=> d!24463 m!98349))

(declare-fun m!99793 () Bool)

(assert (=> d!24463 m!99793))

(declare-fun m!99795 () Bool)

(assert (=> d!24463 m!99795))

(declare-fun m!99797 () Bool)

(assert (=> b!92455 m!99797))

(declare-fun m!99799 () Bool)

(assert (=> b!92456 m!99799))

(assert (=> d!24115 d!24463))

(declare-fun c!15428 () Bool)

(declare-fun b!92457 () Bool)

(declare-fun c!15425 () Bool)

(declare-fun e!60257 () List!1537)

(assert (=> b!92457 (= e!60257 (ite c!15428 (t!5363 (toList!751 lt!44528)) (ite c!15425 (Cons!1533 (h!2125 (toList!751 lt!44528)) (t!5363 (toList!751 lt!44528))) Nil!1534)))))

(declare-fun bm!9099 () Bool)

(declare-fun c!15426 () Bool)

(declare-fun call!9102 () List!1537)

(assert (=> bm!9099 (= call!9102 ($colon$colon!74 e!60257 (ite c!15426 (h!2125 (toList!751 lt!44528)) (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540)))))))

(declare-fun c!15427 () Bool)

(assert (=> bm!9099 (= c!15427 c!15426)))

(declare-fun b!92458 () Bool)

(assert (=> b!92458 (= e!60257 (insertStrictlySorted!66 (t!5363 (toList!751 lt!44528)) (_1!1133 lt!44540) (_2!1133 lt!44540)))))

(declare-fun d!24465 () Bool)

(declare-fun e!60254 () Bool)

(assert (=> d!24465 e!60254))

(declare-fun res!47014 () Bool)

(assert (=> d!24465 (=> (not res!47014) (not e!60254))))

(declare-fun lt!45375 () List!1537)

(assert (=> d!24465 (= res!47014 (isStrictlySorted!288 lt!45375))))

(declare-fun e!60258 () List!1537)

(assert (=> d!24465 (= lt!45375 e!60258)))

(assert (=> d!24465 (= c!15426 (and ((_ is Cons!1533) (toList!751 lt!44528)) (bvslt (_1!1133 (h!2125 (toList!751 lt!44528))) (_1!1133 lt!44540))))))

(assert (=> d!24465 (isStrictlySorted!288 (toList!751 lt!44528))))

(assert (=> d!24465 (= (insertStrictlySorted!66 (toList!751 lt!44528) (_1!1133 lt!44540) (_2!1133 lt!44540)) lt!45375)))

(declare-fun b!92459 () Bool)

(declare-fun e!60255 () List!1537)

(declare-fun call!9103 () List!1537)

(assert (=> b!92459 (= e!60255 call!9103)))

(declare-fun b!92460 () Bool)

(declare-fun e!60256 () List!1537)

(declare-fun call!9104 () List!1537)

(assert (=> b!92460 (= e!60256 call!9104)))

(declare-fun b!92461 () Bool)

(declare-fun res!47013 () Bool)

(assert (=> b!92461 (=> (not res!47013) (not e!60254))))

(assert (=> b!92461 (= res!47013 (containsKey!149 lt!45375 (_1!1133 lt!44540)))))

(declare-fun bm!9100 () Bool)

(assert (=> bm!9100 (= call!9103 call!9102)))

(declare-fun b!92462 () Bool)

(assert (=> b!92462 (= e!60256 call!9104)))

(declare-fun bm!9101 () Bool)

(assert (=> bm!9101 (= call!9104 call!9103)))

(declare-fun b!92463 () Bool)

(assert (=> b!92463 (= e!60258 call!9102)))

(declare-fun b!92464 () Bool)

(assert (=> b!92464 (= c!15425 (and ((_ is Cons!1533) (toList!751 lt!44528)) (bvsgt (_1!1133 (h!2125 (toList!751 lt!44528))) (_1!1133 lt!44540))))))

(assert (=> b!92464 (= e!60255 e!60256)))

(declare-fun b!92465 () Bool)

(assert (=> b!92465 (= e!60258 e!60255)))

(assert (=> b!92465 (= c!15428 (and ((_ is Cons!1533) (toList!751 lt!44528)) (= (_1!1133 (h!2125 (toList!751 lt!44528))) (_1!1133 lt!44540))))))

(declare-fun b!92466 () Bool)

(assert (=> b!92466 (= e!60254 (contains!771 lt!45375 (tuple2!2245 (_1!1133 lt!44540) (_2!1133 lt!44540))))))

(assert (= (and d!24465 c!15426) b!92463))

(assert (= (and d!24465 (not c!15426)) b!92465))

(assert (= (and b!92465 c!15428) b!92459))

(assert (= (and b!92465 (not c!15428)) b!92464))

(assert (= (and b!92464 c!15425) b!92460))

(assert (= (and b!92464 (not c!15425)) b!92462))

(assert (= (or b!92460 b!92462) bm!9101))

(assert (= (or b!92459 bm!9101) bm!9100))

(assert (= (or b!92463 bm!9100) bm!9099))

(assert (= (and bm!9099 c!15427) b!92458))

(assert (= (and bm!9099 (not c!15427)) b!92457))

(assert (= (and d!24465 res!47014) b!92461))

(assert (= (and b!92461 res!47013) b!92466))

(declare-fun m!99801 () Bool)

(assert (=> bm!9099 m!99801))

(declare-fun m!99803 () Bool)

(assert (=> b!92461 m!99803))

(declare-fun m!99805 () Bool)

(assert (=> d!24465 m!99805))

(declare-fun m!99807 () Bool)

(assert (=> d!24465 m!99807))

(declare-fun m!99809 () Bool)

(assert (=> b!92466 m!99809))

(declare-fun m!99811 () Bool)

(assert (=> b!92458 m!99811))

(assert (=> d!24115 d!24465))

(declare-fun condMapEmpty!3583 () Bool)

(declare-fun mapDefault!3583 () ValueCell!947)

(assert (=> mapNonEmpty!3581 (= condMapEmpty!3583 (= mapRest!3581 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3583)))))

(declare-fun e!60259 () Bool)

(declare-fun mapRes!3583 () Bool)

(assert (=> mapNonEmpty!3581 (= tp!9269 (and e!60259 mapRes!3583))))

(declare-fun b!92468 () Bool)

(assert (=> b!92468 (= e!60259 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3583 () Bool)

(assert (=> mapIsEmpty!3583 mapRes!3583))

(declare-fun mapNonEmpty!3583 () Bool)

(declare-fun tp!9271 () Bool)

(declare-fun e!60260 () Bool)

(assert (=> mapNonEmpty!3583 (= mapRes!3583 (and tp!9271 e!60260))))

(declare-fun mapRest!3583 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3583 () ValueCell!947)

(declare-fun mapKey!3583 () (_ BitVec 32))

(assert (=> mapNonEmpty!3583 (= mapRest!3581 (store mapRest!3583 mapKey!3583 mapValue!3583))))

(declare-fun b!92467 () Bool)

(assert (=> b!92467 (= e!60260 tp_is_empty!2581)))

(assert (= (and mapNonEmpty!3581 condMapEmpty!3583) mapIsEmpty!3583))

(assert (= (and mapNonEmpty!3581 (not condMapEmpty!3583)) mapNonEmpty!3583))

(assert (= (and mapNonEmpty!3583 ((_ is ValueCellFull!947) mapValue!3583)) b!92467))

(assert (= (and mapNonEmpty!3581 ((_ is ValueCellFull!947) mapDefault!3583)) b!92468))

(declare-fun m!99813 () Bool)

(assert (=> mapNonEmpty!3583 m!99813))

(declare-fun condMapEmpty!3584 () Bool)

(declare-fun mapDefault!3584 () ValueCell!947)

(assert (=> mapNonEmpty!3582 (= condMapEmpty!3584 (= mapRest!3582 ((as const (Array (_ BitVec 32) ValueCell!947)) mapDefault!3584)))))

(declare-fun e!60261 () Bool)

(declare-fun mapRes!3584 () Bool)

(assert (=> mapNonEmpty!3582 (= tp!9270 (and e!60261 mapRes!3584))))

(declare-fun b!92470 () Bool)

(assert (=> b!92470 (= e!60261 tp_is_empty!2581)))

(declare-fun mapIsEmpty!3584 () Bool)

(assert (=> mapIsEmpty!3584 mapRes!3584))

(declare-fun mapNonEmpty!3584 () Bool)

(declare-fun tp!9272 () Bool)

(declare-fun e!60262 () Bool)

(assert (=> mapNonEmpty!3584 (= mapRes!3584 (and tp!9272 e!60262))))

(declare-fun mapRest!3584 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3584 () ValueCell!947)

(declare-fun mapKey!3584 () (_ BitVec 32))

(assert (=> mapNonEmpty!3584 (= mapRest!3582 (store mapRest!3584 mapKey!3584 mapValue!3584))))

(declare-fun b!92469 () Bool)

(assert (=> b!92469 (= e!60262 tp_is_empty!2581)))

(assert (= (and mapNonEmpty!3582 condMapEmpty!3584) mapIsEmpty!3584))

(assert (= (and mapNonEmpty!3582 (not condMapEmpty!3584)) mapNonEmpty!3584))

(assert (= (and mapNonEmpty!3584 ((_ is ValueCellFull!947) mapValue!3584)) b!92469))

(assert (= (and mapNonEmpty!3582 ((_ is ValueCellFull!947) mapDefault!3584)) b!92470))

(declare-fun m!99815 () Bool)

(assert (=> mapNonEmpty!3584 m!99815))

(declare-fun b_lambda!4073 () Bool)

(assert (= b_lambda!4063 (or (and b!91365 b_free!2329 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91371 b_free!2331) b_lambda!4073)))

(declare-fun b_lambda!4075 () Bool)

(assert (= b_lambda!4067 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4075)))

(declare-fun b_lambda!4077 () Bool)

(assert (= b_lambda!4059 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4077)))

(declare-fun b_lambda!4079 () Bool)

(assert (= b_lambda!4061 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4079)))

(declare-fun b_lambda!4081 () Bool)

(assert (= b_lambda!4069 (or (and b!91365 b_free!2329) (and b!91371 b_free!2331 (= (defaultEntry!2405 newMap!16) (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))))) b_lambda!4081)))

(declare-fun b_lambda!4083 () Bool)

(assert (= b_lambda!4065 (or (and b!91365 b_free!2329 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91371 b_free!2331) b_lambda!4083)))

(declare-fun b_lambda!4085 () Bool)

(assert (= b_lambda!4057 (or (and b!91365 b_free!2329 (= (defaultEntry!2405 (v!2723 (underlying!315 thiss!992))) (defaultEntry!2405 newMap!16))) (and b!91371 b_free!2331) b_lambda!4085)))

(check-sat (not d!24249) (not b!92300) (not b_lambda!4085) (not d!24175) (not bm!9070) (not d!24409) (not b!92225) (not bm!9089) (not b!92431) (not b!92432) (not d!24305) (not b!91841) (not b!92234) (not b!92224) (not b!92299) (not b!92083) (not d!24463) (not bm!9053) (not bm!9092) (not d!24171) (not b!92294) (not b!92360) (not b!92289) (not b!92196) (not b!92030) (not b!92401) (not d!24323) (not b!91836) (not b!92371) (not b!92026) (not b!92194) (not d!24289) (not d!24207) (not b!92368) (not b!92279) (not d!24351) (not b!92345) (not b!92043) (not b!92418) (not b!92437) (not b!92320) (not bm!9077) (not d!24181) (not b!92138) (not b!92208) (not d!24337) (not bm!9097) (not d!24259) (not d!24427) (not bm!9086) (not b!92051) (not b!92378) (not d!24287) (not b!91948) (not b!92305) (not b!91902) (not b!92200) (not b!92354) (not b!92038) (not b_lambda!4073) (not b!92383) (not b!91989) (not b!92213) (not bm!9035) (not d!24303) (not b!92205) (not b!92377) (not b!92124) (not d!24283) (not b!92337) (not b!91932) (not bm!9058) (not b!92346) (not bm!9054) (not bm!9076) (not b_lambda!4075) (not d!24223) (not b_lambda!4077) (not b!92442) (not bm!9083) (not b!92171) (not b!91950) (not b!91838) (not b!92197) (not d!24269) (not bm!9060) (not b!92321) (not b!92021) (not b!92237) (not b!92177) (not b!92453) (not b!92210) (not b!92424) (not b!92313) (not d!24229) (not b!92254) (not b!91955) (not bm!9038) (not bm!9071) (not d!24385) (not d!24369) (not b!92236) (not b!92252) (not b!91931) (not b!92396) (not b!92229) (not d!24423) (not d!24419) (not b!92384) (not bm!9098) (not b!92087) (not d!24299) (not d!24309) (not b!92089) (not b!92207) (not bm!9039) (not b!92379) (not b!92178) (not b!92149) (not b!92084) (not bm!9099) (not b!92181) (not b!91952) (not b!92446) (not bm!9067) (not d!24375) (not b!92438) (not b!91909) (not b!92121) (not b!91854) (not b!92135) (not b!91858) (not b!92182) (not b!92342) (not d!24459) (not b!92047) (not b!91947) (not d!24425) (not b!92088) (not b!92429) (not b!91995) (not b!92238) (not b!92050) (not d!24391) (not b!92387) (not b!92398) (not b!91855) (not b!92286) (not b!92100) (not b!92285) (not d!24267) (not d!24397) (not b!92430) (not b!91951) (not d!24383) (not bm!9032) (not b!92152) (not d!24341) (not b!92365) (not b!92447) (not b!91959) (not b!92218) (not b!92393) (not bm!9027) (not b!92443) (not d!24307) (not d!24335) (not b!91981) (not b!92239) (not d!24195) (not b_lambda!4049) (not b!92450) (not b!92358) (not d!24185) (not b!92407) (not b!92427) (not b!92444) (not mapNonEmpty!3584) (not b!92160) (not b_lambda!4039) (not b!92158) (not b!92173) (not b!91919) (not b!92053) (not b!92228) (not b!92117) (not b!92395) (not b!92318) (not b!92028) (not b!91897) (not b!92227) (not b!92142) (not b!91927) (not bm!9029) (not b!92101) (not d!24367) (not b!92435) (not b!92312) (not b!92139) (not b!92093) (not bm!9025) (not d!24311) (not d!24435) (not b!92221) (not b!92380) (not d!24361) (not b_lambda!4053) (not d!24325) (not bm!9073) (not d!24281) (not bm!9061) (not d!24173) (not b!92189) (not b!91901) (not b!92422) (not b!92291) (not d!24405) (not b!92361) (not b_lambda!4081) (not b!92086) (not b!92018) (not b!92035) (not b!92193) (not d!24225) (not d!24421) (not d!24321) (not b!92097) (not b!92122) (not b_lambda!4055) (not d!24235) (not b!92374) (not b!91899) (not b!92331) (not d!24389) (not d!24213) (not b!92134) (not b_lambda!4079) (not b!92109) (not d!24161) (not b!92382) (not b!92448) (not b!91986) (not bm!9091) (not d!24257) (not b!92426) (not d!24285) (not b!92170) (not b!92334) (not b!92143) (not b!92230) (not b!92357) (not d!24189) (not b!92253) (not bm!9055) (not b!92433) (not d!24403) (not b!91926) (not d!24327) (not d!24263) (not b!92040) (not bm!9085) (not b!92455) (not d!24445) (not d!24193) (not d!24273) (not d!24441) (not b!92269) (not d!24313) (not b_lambda!4051) (not bm!9088) (not d!24437) (not b!92373) (not b!91856) (not d!24237) (not d!24455) (not d!24429) (not d!24245) (not d!24453) (not d!24265) (not b!91861) (not d!24347) (not bm!9033) (not b!92428) (not b!92141) (not b!91983) (not d!24169) (not d!24451) (not b!92155) (not b!92409) (not d!24219) (not d!24167) (not b!92332) (not d!24399) (not b!91915) (not d!24333) (not d!24197) (not mapNonEmpty!3583) (not b!92315) (not b!92092) (not b!92335) (not b!91996) (not bm!9080) (not b!92248) (not d!24359) (not d!24457) (not d!24353) (not b!92376) (not b!92311) (not b!92353) (not b!92029) (not b!92275) (not d!24319) (not d!24295) (not b!92420) (not b!92150) (not d!24395) (not b!91958) (not b!92388) (not d!24165) (not d!24357) b_and!5601 (not b!92137) (not d!24381) (not bm!9024) tp_is_empty!2581 (not d!24191) (not b!92240) (not b!92292) (not d!24261) (not b!92456) (not b_next!2331) (not d!24275) (not d!24251) (not d!24297) (not b_next!2329) (not b!91905) (not b!92247) (not d!24411) (not b!92326) (not b!91949) (not b!91971) (not d!24329) (not bm!9046) (not b!92190) (not b!92202) (not b!92163) (not d!24159) (not b!91984) (not b!92287) (not b!92341) (not b!92106) (not b!91936) (not bm!9063) (not b_lambda!4071) (not b!92406) (not bm!9057) b_and!5603 (not b!92310) (not d!24443) (not b!92118) (not b!92302) (not b!92098) (not d!24349) (not d!24373) (not d!24393) (not b!92323) (not b_lambda!4083) (not d!24247) (not b!92290) (not b!91943) (not d!24203) (not d!24317) (not b!91860) (not b!92461) (not d!24241) (not d!24433) (not b!92105) (not bm!9030) (not b!92157) (not d!24157) (not d!24271) (not d!24447) (not d!24279) (not d!24431) (not b!91976) (not b!92466) (not b!92233) (not b!92385) (not d!24291) (not b!91935) (not b!91852) (not d!24331) (not b!92095) (not b!91944) (not b!92250) (not d!24413) (not b!92369) (not d!24315) (not b!91956) (not d!24465) (not d!24199) (not d!24449) (not b!92434) (not d!24439) (not b!92297) (not b!91953) (not b!92199) (not b!92440) (not d!24345) (not b!92458) (not d!24363) (not b!91859) (not b!92168) (not d!24401) (not b!92110) (not bm!9068) (not b!91857) (not b!92390) (not d!24255))
(check-sat b_and!5601 b_and!5603 (not b_next!2329) (not b_next!2331))
