; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13150 () Bool)

(assert start!13150)

(declare-fun b!115412 () Bool)

(declare-fun b_free!2701 () Bool)

(declare-fun b_next!2701 () Bool)

(assert (=> b!115412 (= b_free!2701 (not b_next!2701))))

(declare-fun tp!10465 () Bool)

(declare-fun b_and!7165 () Bool)

(assert (=> b!115412 (= tp!10465 b_and!7165)))

(declare-fun b!115416 () Bool)

(declare-fun b_free!2703 () Bool)

(declare-fun b_next!2703 () Bool)

(assert (=> b!115416 (= b_free!2703 (not b_next!2703))))

(declare-fun tp!10466 () Bool)

(declare-fun b_and!7167 () Bool)

(assert (=> b!115416 (= tp!10466 b_and!7167)))

(declare-fun mapNonEmpty!4233 () Bool)

(declare-fun mapRes!4233 () Bool)

(declare-fun tp!10468 () Bool)

(declare-fun e!75275 () Bool)

(assert (=> mapNonEmpty!4233 (= mapRes!4233 (and tp!10468 e!75275))))

(declare-datatypes ((V!3337 0))(
  ( (V!3338 (val!1428 Int)) )
))
(declare-datatypes ((ValueCell!1040 0))(
  ( (ValueCellFull!1040 (v!3026 V!3337)) (EmptyCell!1040) )
))
(declare-fun mapRest!4233 () (Array (_ BitVec 32) ValueCell!1040))

(declare-fun mapKey!4234 () (_ BitVec 32))

(declare-fun mapValue!4234 () ValueCell!1040)

(declare-datatypes ((array!4523 0))(
  ( (array!4524 (arr!2144 (Array (_ BitVec 32) (_ BitVec 64))) (size!2404 (_ BitVec 32))) )
))
(declare-datatypes ((array!4525 0))(
  ( (array!4526 (arr!2145 (Array (_ BitVec 32) ValueCell!1040)) (size!2405 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!988 0))(
  ( (LongMapFixedSize!989 (defaultEntry!2703 Int) (mask!6911 (_ BitVec 32)) (extraKeys!2492 (_ BitVec 32)) (zeroValue!2570 V!3337) (minValue!2570 V!3337) (_size!543 (_ BitVec 32)) (_keys!4425 array!4523) (_values!2686 array!4525) (_vacant!543 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!988)

(assert (=> mapNonEmpty!4233 (= (arr!2145 (_values!2686 newMap!16)) (store mapRest!4233 mapKey!4234 mapValue!4234))))

(declare-fun b!115408 () Bool)

(declare-fun res!56631 () Bool)

(declare-fun e!75270 () Bool)

(assert (=> b!115408 (=> (not res!56631) (not e!75270))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((Cell!788 0))(
  ( (Cell!789 (v!3027 LongMapFixedSize!988)) )
))
(declare-datatypes ((LongMap!788 0))(
  ( (LongMap!789 (underlying!405 Cell!788)) )
))
(declare-fun thiss!992 () LongMap!788)

(assert (=> b!115408 (= res!56631 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2404 (_keys!4425 (v!3027 (underlying!405 thiss!992)))))))))

(declare-fun res!56630 () Bool)

(assert (=> start!13150 (=> (not res!56630) (not e!75270))))

(declare-fun valid!475 (LongMap!788) Bool)

(assert (=> start!13150 (= res!56630 (valid!475 thiss!992))))

(assert (=> start!13150 e!75270))

(declare-fun e!75272 () Bool)

(assert (=> start!13150 e!75272))

(assert (=> start!13150 true))

(declare-fun e!75269 () Bool)

(assert (=> start!13150 e!75269))

(declare-fun mapIsEmpty!4233 () Bool)

(declare-fun mapRes!4234 () Bool)

(assert (=> mapIsEmpty!4233 mapRes!4234))

(declare-fun b!115409 () Bool)

(declare-fun e!75279 () Bool)

(declare-fun tp_is_empty!2767 () Bool)

(assert (=> b!115409 (= e!75279 tp_is_empty!2767)))

(declare-fun b!115410 () Bool)

(declare-fun e!75278 () Bool)

(declare-fun e!75276 () Bool)

(assert (=> b!115410 (= e!75278 e!75276)))

(declare-fun b!115411 () Bool)

(assert (=> b!115411 (= e!75272 e!75278)))

(declare-fun e!75280 () Bool)

(declare-fun array_inv!1337 (array!4523) Bool)

(declare-fun array_inv!1338 (array!4525) Bool)

(assert (=> b!115412 (= e!75276 (and tp!10465 tp_is_empty!2767 (array_inv!1337 (_keys!4425 (v!3027 (underlying!405 thiss!992)))) (array_inv!1338 (_values!2686 (v!3027 (underlying!405 thiss!992)))) e!75280))))

(declare-fun mapIsEmpty!4234 () Bool)

(assert (=> mapIsEmpty!4234 mapRes!4233))

(declare-fun b!115413 () Bool)

(declare-fun e!75273 () Bool)

(assert (=> b!115413 (= e!75273 tp_is_empty!2767)))

(declare-fun b!115414 () Bool)

(declare-fun res!56633 () Bool)

(assert (=> b!115414 (=> (not res!56633) (not e!75270))))

(declare-fun valid!476 (LongMapFixedSize!988) Bool)

(assert (=> b!115414 (= res!56633 (valid!476 newMap!16))))

(declare-fun b!115415 () Bool)

(declare-fun res!56632 () Bool)

(assert (=> b!115415 (=> (not res!56632) (not e!75270))))

(assert (=> b!115415 (= res!56632 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6911 newMap!16)) (_size!543 (v!3027 (underlying!405 thiss!992)))))))

(declare-fun e!75271 () Bool)

(assert (=> b!115416 (= e!75269 (and tp!10466 tp_is_empty!2767 (array_inv!1337 (_keys!4425 newMap!16)) (array_inv!1338 (_values!2686 newMap!16)) e!75271))))

(declare-fun b!115417 () Bool)

(assert (=> b!115417 (= e!75271 (and e!75273 mapRes!4233))))

(declare-fun condMapEmpty!4233 () Bool)

(declare-fun mapDefault!4234 () ValueCell!1040)

(assert (=> b!115417 (= condMapEmpty!4233 (= (arr!2145 (_values!2686 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1040)) mapDefault!4234)))))

(declare-fun b!115418 () Bool)

(assert (=> b!115418 (= e!75270 false)))

(declare-datatypes ((tuple2!2468 0))(
  ( (tuple2!2469 (_1!1245 (_ BitVec 64)) (_2!1245 V!3337)) )
))
(declare-datatypes ((List!1650 0))(
  ( (Nil!1647) (Cons!1646 (h!2246 tuple2!2468) (t!5900 List!1650)) )
))
(declare-datatypes ((ListLongMap!1595 0))(
  ( (ListLongMap!1596 (toList!813 List!1650)) )
))
(declare-fun lt!59943 () ListLongMap!1595)

(declare-fun map!1338 (LongMapFixedSize!988) ListLongMap!1595)

(assert (=> b!115418 (= lt!59943 (map!1338 newMap!16))))

(declare-fun lt!59942 () ListLongMap!1595)

(declare-fun getCurrentListMap!494 (array!4523 array!4525 (_ BitVec 32) (_ BitVec 32) V!3337 V!3337 (_ BitVec 32) Int) ListLongMap!1595)

(assert (=> b!115418 (= lt!59942 (getCurrentListMap!494 (_keys!4425 (v!3027 (underlying!405 thiss!992))) (_values!2686 (v!3027 (underlying!405 thiss!992))) (mask!6911 (v!3027 (underlying!405 thiss!992))) (extraKeys!2492 (v!3027 (underlying!405 thiss!992))) (zeroValue!2570 (v!3027 (underlying!405 thiss!992))) (minValue!2570 (v!3027 (underlying!405 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2703 (v!3027 (underlying!405 thiss!992)))))))

(declare-fun b!115419 () Bool)

(declare-fun e!75281 () Bool)

(assert (=> b!115419 (= e!75280 (and e!75281 mapRes!4234))))

(declare-fun condMapEmpty!4234 () Bool)

(declare-fun mapDefault!4233 () ValueCell!1040)

(assert (=> b!115419 (= condMapEmpty!4234 (= (arr!2145 (_values!2686 (v!3027 (underlying!405 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1040)) mapDefault!4233)))))

(declare-fun b!115420 () Bool)

(assert (=> b!115420 (= e!75281 tp_is_empty!2767)))

(declare-fun mapNonEmpty!4234 () Bool)

(declare-fun tp!10467 () Bool)

(assert (=> mapNonEmpty!4234 (= mapRes!4234 (and tp!10467 e!75279))))

(declare-fun mapRest!4234 () (Array (_ BitVec 32) ValueCell!1040))

(declare-fun mapValue!4233 () ValueCell!1040)

(declare-fun mapKey!4233 () (_ BitVec 32))

(assert (=> mapNonEmpty!4234 (= (arr!2145 (_values!2686 (v!3027 (underlying!405 thiss!992)))) (store mapRest!4234 mapKey!4233 mapValue!4233))))

(declare-fun b!115421 () Bool)

(assert (=> b!115421 (= e!75275 tp_is_empty!2767)))

(assert (= (and start!13150 res!56630) b!115408))

(assert (= (and b!115408 res!56631) b!115414))

(assert (= (and b!115414 res!56633) b!115415))

(assert (= (and b!115415 res!56632) b!115418))

(assert (= (and b!115419 condMapEmpty!4234) mapIsEmpty!4233))

(assert (= (and b!115419 (not condMapEmpty!4234)) mapNonEmpty!4234))

(get-info :version)

(assert (= (and mapNonEmpty!4234 ((_ is ValueCellFull!1040) mapValue!4233)) b!115409))

(assert (= (and b!115419 ((_ is ValueCellFull!1040) mapDefault!4233)) b!115420))

(assert (= b!115412 b!115419))

(assert (= b!115410 b!115412))

(assert (= b!115411 b!115410))

(assert (= start!13150 b!115411))

(assert (= (and b!115417 condMapEmpty!4233) mapIsEmpty!4234))

(assert (= (and b!115417 (not condMapEmpty!4233)) mapNonEmpty!4233))

(assert (= (and mapNonEmpty!4233 ((_ is ValueCellFull!1040) mapValue!4234)) b!115421))

(assert (= (and b!115417 ((_ is ValueCellFull!1040) mapDefault!4234)) b!115413))

(assert (= b!115416 b!115417))

(assert (= start!13150 b!115416))

(declare-fun m!131409 () Bool)

(assert (=> mapNonEmpty!4234 m!131409))

(declare-fun m!131411 () Bool)

(assert (=> start!13150 m!131411))

(declare-fun m!131413 () Bool)

(assert (=> mapNonEmpty!4233 m!131413))

(declare-fun m!131415 () Bool)

(assert (=> b!115414 m!131415))

(declare-fun m!131417 () Bool)

(assert (=> b!115416 m!131417))

(declare-fun m!131419 () Bool)

(assert (=> b!115416 m!131419))

(declare-fun m!131421 () Bool)

(assert (=> b!115412 m!131421))

(declare-fun m!131423 () Bool)

(assert (=> b!115412 m!131423))

(declare-fun m!131425 () Bool)

(assert (=> b!115418 m!131425))

(declare-fun m!131427 () Bool)

(assert (=> b!115418 m!131427))

(check-sat b_and!7167 (not b!115412) (not b_next!2701) (not b!115414) tp_is_empty!2767 (not b!115416) (not b_next!2703) (not mapNonEmpty!4233) (not mapNonEmpty!4234) (not start!13150) b_and!7165 (not b!115418))
(check-sat b_and!7165 b_and!7167 (not b_next!2701) (not b_next!2703))
