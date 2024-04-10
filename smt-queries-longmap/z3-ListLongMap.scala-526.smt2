; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13148 () Bool)

(assert start!13148)

(declare-fun b!115530 () Bool)

(declare-fun b_free!2705 () Bool)

(declare-fun b_next!2705 () Bool)

(assert (=> b!115530 (= b_free!2705 (not b_next!2705))))

(declare-fun tp!10478 () Bool)

(declare-fun b_and!7175 () Bool)

(assert (=> b!115530 (= tp!10478 b_and!7175)))

(declare-fun b!115529 () Bool)

(declare-fun b_free!2707 () Bool)

(declare-fun b_next!2707 () Bool)

(assert (=> b!115529 (= b_free!2707 (not b_next!2707))))

(declare-fun tp!10477 () Bool)

(declare-fun b_and!7177 () Bool)

(assert (=> b!115529 (= tp!10477 b_and!7177)))

(declare-fun b!115522 () Bool)

(declare-fun e!75364 () Bool)

(declare-fun tp_is_empty!2769 () Bool)

(assert (=> b!115522 (= e!75364 tp_is_empty!2769)))

(declare-fun b!115523 () Bool)

(declare-fun e!75361 () Bool)

(assert (=> b!115523 (= e!75361 tp_is_empty!2769)))

(declare-fun b!115524 () Bool)

(declare-fun e!75366 () Bool)

(assert (=> b!115524 (= e!75366 false)))

(declare-datatypes ((V!3339 0))(
  ( (V!3340 (val!1429 Int)) )
))
(declare-datatypes ((tuple2!2522 0))(
  ( (tuple2!2523 (_1!1272 (_ BitVec 64)) (_2!1272 V!3339)) )
))
(declare-datatypes ((List!1673 0))(
  ( (Nil!1670) (Cons!1669 (h!2269 tuple2!2522) (t!5927 List!1673)) )
))
(declare-datatypes ((ListLongMap!1645 0))(
  ( (ListLongMap!1646 (toList!838 List!1673)) )
))
(declare-fun lt!60006 () ListLongMap!1645)

(declare-datatypes ((array!4541 0))(
  ( (array!4542 (arr!2153 (Array (_ BitVec 32) (_ BitVec 64))) (size!2413 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1041 0))(
  ( (ValueCellFull!1041 (v!3027 V!3339)) (EmptyCell!1041) )
))
(declare-datatypes ((array!4543 0))(
  ( (array!4544 (arr!2154 (Array (_ BitVec 32) ValueCell!1041)) (size!2414 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!990 0))(
  ( (LongMapFixedSize!991 (defaultEntry!2704 Int) (mask!6912 (_ BitVec 32)) (extraKeys!2493 (_ BitVec 32)) (zeroValue!2571 V!3339) (minValue!2571 V!3339) (_size!544 (_ BitVec 32)) (_keys!4426 array!4541) (_values!2687 array!4543) (_vacant!544 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!990)

(declare-fun map!1346 (LongMapFixedSize!990) ListLongMap!1645)

(assert (=> b!115524 (= lt!60006 (map!1346 newMap!16))))

(declare-fun lt!60005 () ListLongMap!1645)

(declare-datatypes ((Cell!790 0))(
  ( (Cell!791 (v!3028 LongMapFixedSize!990)) )
))
(declare-datatypes ((LongMap!790 0))(
  ( (LongMap!791 (underlying!406 Cell!790)) )
))
(declare-fun thiss!992 () LongMap!790)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!519 (array!4541 array!4543 (_ BitVec 32) (_ BitVec 32) V!3339 V!3339 (_ BitVec 32) Int) ListLongMap!1645)

(assert (=> b!115524 (= lt!60005 (getCurrentListMap!519 (_keys!4426 (v!3028 (underlying!406 thiss!992))) (_values!2687 (v!3028 (underlying!406 thiss!992))) (mask!6912 (v!3028 (underlying!406 thiss!992))) (extraKeys!2493 (v!3028 (underlying!406 thiss!992))) (zeroValue!2571 (v!3028 (underlying!406 thiss!992))) (minValue!2571 (v!3028 (underlying!406 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2704 (v!3028 (underlying!406 thiss!992)))))))

(declare-fun b!115525 () Bool)

(declare-fun e!75362 () Bool)

(assert (=> b!115525 (= e!75362 tp_is_empty!2769)))

(declare-fun b!115526 () Bool)

(declare-fun e!75358 () Bool)

(assert (=> b!115526 (= e!75358 tp_is_empty!2769)))

(declare-fun b!115527 () Bool)

(declare-fun res!56675 () Bool)

(assert (=> b!115527 (=> (not res!56675) (not e!75366))))

(declare-fun valid!470 (LongMapFixedSize!990) Bool)

(assert (=> b!115527 (= res!56675 (valid!470 newMap!16))))

(declare-fun mapNonEmpty!4240 () Bool)

(declare-fun mapRes!4240 () Bool)

(declare-fun tp!10480 () Bool)

(assert (=> mapNonEmpty!4240 (= mapRes!4240 (and tp!10480 e!75362))))

(declare-fun mapKey!4240 () (_ BitVec 32))

(declare-fun mapRest!4240 () (Array (_ BitVec 32) ValueCell!1041))

(declare-fun mapValue!4239 () ValueCell!1041)

(assert (=> mapNonEmpty!4240 (= (arr!2154 (_values!2687 (v!3028 (underlying!406 thiss!992)))) (store mapRest!4240 mapKey!4240 mapValue!4239))))

(declare-fun b!115528 () Bool)

(declare-fun res!56674 () Bool)

(assert (=> b!115528 (=> (not res!56674) (not e!75366))))

(assert (=> b!115528 (= res!56674 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2413 (_keys!4426 (v!3028 (underlying!406 thiss!992)))))))))

(declare-fun e!75363 () Bool)

(declare-fun e!75365 () Bool)

(declare-fun array_inv!1355 (array!4541) Bool)

(declare-fun array_inv!1356 (array!4543) Bool)

(assert (=> b!115529 (= e!75365 (and tp!10477 tp_is_empty!2769 (array_inv!1355 (_keys!4426 newMap!16)) (array_inv!1356 (_values!2687 newMap!16)) e!75363))))

(declare-fun res!56676 () Bool)

(assert (=> start!13148 (=> (not res!56676) (not e!75366))))

(declare-fun valid!471 (LongMap!790) Bool)

(assert (=> start!13148 (= res!56676 (valid!471 thiss!992))))

(assert (=> start!13148 e!75366))

(declare-fun e!75354 () Bool)

(assert (=> start!13148 e!75354))

(assert (=> start!13148 true))

(assert (=> start!13148 e!75365))

(declare-fun mapNonEmpty!4239 () Bool)

(declare-fun mapRes!4239 () Bool)

(declare-fun tp!10479 () Bool)

(assert (=> mapNonEmpty!4239 (= mapRes!4239 (and tp!10479 e!75361))))

(declare-fun mapValue!4240 () ValueCell!1041)

(declare-fun mapRest!4239 () (Array (_ BitVec 32) ValueCell!1041))

(declare-fun mapKey!4239 () (_ BitVec 32))

(assert (=> mapNonEmpty!4239 (= (arr!2154 (_values!2687 newMap!16)) (store mapRest!4239 mapKey!4239 mapValue!4240))))

(declare-fun e!75355 () Bool)

(declare-fun e!75356 () Bool)

(assert (=> b!115530 (= e!75355 (and tp!10478 tp_is_empty!2769 (array_inv!1355 (_keys!4426 (v!3028 (underlying!406 thiss!992)))) (array_inv!1356 (_values!2687 (v!3028 (underlying!406 thiss!992)))) e!75356))))

(declare-fun b!115531 () Bool)

(assert (=> b!115531 (= e!75363 (and e!75358 mapRes!4239))))

(declare-fun condMapEmpty!4240 () Bool)

(declare-fun mapDefault!4239 () ValueCell!1041)

(assert (=> b!115531 (= condMapEmpty!4240 (= (arr!2154 (_values!2687 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1041)) mapDefault!4239)))))

(declare-fun b!115532 () Bool)

(declare-fun e!75360 () Bool)

(assert (=> b!115532 (= e!75360 e!75355)))

(declare-fun mapIsEmpty!4239 () Bool)

(assert (=> mapIsEmpty!4239 mapRes!4240))

(declare-fun b!115533 () Bool)

(declare-fun res!56677 () Bool)

(assert (=> b!115533 (=> (not res!56677) (not e!75366))))

(assert (=> b!115533 (= res!56677 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6912 newMap!16)) (_size!544 (v!3028 (underlying!406 thiss!992)))))))

(declare-fun mapIsEmpty!4240 () Bool)

(assert (=> mapIsEmpty!4240 mapRes!4239))

(declare-fun b!115534 () Bool)

(assert (=> b!115534 (= e!75354 e!75360)))

(declare-fun b!115535 () Bool)

(assert (=> b!115535 (= e!75356 (and e!75364 mapRes!4240))))

(declare-fun condMapEmpty!4239 () Bool)

(declare-fun mapDefault!4240 () ValueCell!1041)

(assert (=> b!115535 (= condMapEmpty!4239 (= (arr!2154 (_values!2687 (v!3028 (underlying!406 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1041)) mapDefault!4240)))))

(assert (= (and start!13148 res!56676) b!115528))

(assert (= (and b!115528 res!56674) b!115527))

(assert (= (and b!115527 res!56675) b!115533))

(assert (= (and b!115533 res!56677) b!115524))

(assert (= (and b!115535 condMapEmpty!4239) mapIsEmpty!4239))

(assert (= (and b!115535 (not condMapEmpty!4239)) mapNonEmpty!4240))

(get-info :version)

(assert (= (and mapNonEmpty!4240 ((_ is ValueCellFull!1041) mapValue!4239)) b!115525))

(assert (= (and b!115535 ((_ is ValueCellFull!1041) mapDefault!4240)) b!115522))

(assert (= b!115530 b!115535))

(assert (= b!115532 b!115530))

(assert (= b!115534 b!115532))

(assert (= start!13148 b!115534))

(assert (= (and b!115531 condMapEmpty!4240) mapIsEmpty!4240))

(assert (= (and b!115531 (not condMapEmpty!4240)) mapNonEmpty!4239))

(assert (= (and mapNonEmpty!4239 ((_ is ValueCellFull!1041) mapValue!4240)) b!115523))

(assert (= (and b!115531 ((_ is ValueCellFull!1041) mapDefault!4239)) b!115526))

(assert (= b!115529 b!115531))

(assert (= start!13148 b!115529))

(declare-fun m!131613 () Bool)

(assert (=> mapNonEmpty!4239 m!131613))

(declare-fun m!131615 () Bool)

(assert (=> b!115529 m!131615))

(declare-fun m!131617 () Bool)

(assert (=> b!115529 m!131617))

(declare-fun m!131619 () Bool)

(assert (=> b!115527 m!131619))

(declare-fun m!131621 () Bool)

(assert (=> mapNonEmpty!4240 m!131621))

(declare-fun m!131623 () Bool)

(assert (=> b!115524 m!131623))

(declare-fun m!131625 () Bool)

(assert (=> b!115524 m!131625))

(declare-fun m!131627 () Bool)

(assert (=> start!13148 m!131627))

(declare-fun m!131629 () Bool)

(assert (=> b!115530 m!131629))

(declare-fun m!131631 () Bool)

(assert (=> b!115530 m!131631))

(check-sat (not b!115529) (not b_next!2705) (not b!115527) (not mapNonEmpty!4240) b_and!7175 b_and!7177 (not b!115530) (not b_next!2707) (not b!115524) (not start!13148) tp_is_empty!2769 (not mapNonEmpty!4239))
(check-sat b_and!7175 b_and!7177 (not b_next!2705) (not b_next!2707))
