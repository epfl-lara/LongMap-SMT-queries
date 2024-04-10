; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13224 () Bool)

(assert start!13224)

(declare-fun b!116538 () Bool)

(declare-fun b_free!2753 () Bool)

(declare-fun b_next!2753 () Bool)

(assert (=> b!116538 (= b_free!2753 (not b_next!2753))))

(declare-fun tp!10634 () Bool)

(declare-fun b_and!7259 () Bool)

(assert (=> b!116538 (= tp!10634 b_and!7259)))

(declare-fun b!116542 () Bool)

(declare-fun b_free!2755 () Bool)

(declare-fun b_next!2755 () Bool)

(assert (=> b!116542 (= b_free!2755 (not b_next!2755))))

(declare-fun tp!10631 () Bool)

(declare-fun b_and!7261 () Bool)

(assert (=> b!116542 (= tp!10631 b_and!7261)))

(declare-datatypes ((V!3371 0))(
  ( (V!3372 (val!1441 Int)) )
))
(declare-datatypes ((array!4593 0))(
  ( (array!4594 (arr!2177 (Array (_ BitVec 32) (_ BitVec 64))) (size!2438 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1053 0))(
  ( (ValueCellFull!1053 (v!3051 V!3371)) (EmptyCell!1053) )
))
(declare-datatypes ((array!4595 0))(
  ( (array!4596 (arr!2178 (Array (_ BitVec 32) ValueCell!1053)) (size!2439 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1014 0))(
  ( (LongMapFixedSize!1015 (defaultEntry!2719 Int) (mask!6937 (_ BitVec 32)) (extraKeys!2508 (_ BitVec 32)) (zeroValue!2586 V!3371) (minValue!2586 V!3371) (_size!556 (_ BitVec 32)) (_keys!4442 array!4593) (_values!2702 array!4595) (_vacant!556 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!812 0))(
  ( (Cell!813 (v!3052 LongMapFixedSize!1014)) )
))
(declare-datatypes ((LongMap!812 0))(
  ( (LongMap!813 (underlying!417 Cell!812)) )
))
(declare-fun thiss!992 () LongMap!812)

(declare-fun tp_is_empty!2793 () Bool)

(declare-fun e!76114 () Bool)

(declare-fun e!76120 () Bool)

(declare-fun array_inv!1371 (array!4593) Bool)

(declare-fun array_inv!1372 (array!4595) Bool)

(assert (=> b!116538 (= e!76120 (and tp!10634 tp_is_empty!2793 (array_inv!1371 (_keys!4442 (v!3052 (underlying!417 thiss!992)))) (array_inv!1372 (_values!2702 (v!3052 (underlying!417 thiss!992)))) e!76114))))

(declare-fun b!116539 () Bool)

(declare-fun res!57087 () Bool)

(declare-fun e!76112 () Bool)

(assert (=> b!116539 (=> (not res!57087) (not e!76112))))

(declare-fun newMap!16 () LongMapFixedSize!1014)

(assert (=> b!116539 (= res!57087 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6937 newMap!16)) (_size!556 (v!3052 (underlying!417 thiss!992)))))))

(declare-fun b!116540 () Bool)

(declare-fun e!76122 () Bool)

(assert (=> b!116540 (= e!76122 tp_is_empty!2793)))

(declare-fun b!116541 () Bool)

(declare-fun res!57084 () Bool)

(assert (=> b!116541 (=> (not res!57084) (not e!76112))))

(declare-fun valid!481 (LongMapFixedSize!1014) Bool)

(assert (=> b!116541 (= res!57084 (valid!481 newMap!16))))

(declare-fun e!76118 () Bool)

(declare-fun e!76111 () Bool)

(assert (=> b!116542 (= e!76111 (and tp!10631 tp_is_empty!2793 (array_inv!1371 (_keys!4442 newMap!16)) (array_inv!1372 (_values!2702 newMap!16)) e!76118))))

(declare-fun b!116543 () Bool)

(declare-fun e!76115 () Bool)

(declare-fun mapRes!4321 () Bool)

(assert (=> b!116543 (= e!76114 (and e!76115 mapRes!4321))))

(declare-fun condMapEmpty!4322 () Bool)

(declare-fun mapDefault!4322 () ValueCell!1053)

(assert (=> b!116543 (= condMapEmpty!4322 (= (arr!2178 (_values!2702 (v!3052 (underlying!417 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1053)) mapDefault!4322)))))

(declare-fun b!116544 () Bool)

(assert (=> b!116544 (= e!76112 false)))

(declare-datatypes ((tuple2!2540 0))(
  ( (tuple2!2541 (_1!1281 (_ BitVec 64)) (_2!1281 V!3371)) )
))
(declare-datatypes ((List!1680 0))(
  ( (Nil!1677) (Cons!1676 (h!2276 tuple2!2540) (t!5946 List!1680)) )
))
(declare-datatypes ((ListLongMap!1655 0))(
  ( (ListLongMap!1656 (toList!843 List!1680)) )
))
(declare-fun lt!60489 () ListLongMap!1655)

(declare-fun map!1359 (LongMapFixedSize!1014) ListLongMap!1655)

(assert (=> b!116544 (= lt!60489 (map!1359 newMap!16))))

(declare-fun lt!60488 () ListLongMap!1655)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!524 (array!4593 array!4595 (_ BitVec 32) (_ BitVec 32) V!3371 V!3371 (_ BitVec 32) Int) ListLongMap!1655)

(assert (=> b!116544 (= lt!60488 (getCurrentListMap!524 (_keys!4442 (v!3052 (underlying!417 thiss!992))) (_values!2702 (v!3052 (underlying!417 thiss!992))) (mask!6937 (v!3052 (underlying!417 thiss!992))) (extraKeys!2508 (v!3052 (underlying!417 thiss!992))) (zeroValue!2586 (v!3052 (underlying!417 thiss!992))) (minValue!2586 (v!3052 (underlying!417 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2719 (v!3052 (underlying!417 thiss!992)))))))

(declare-fun b!116545 () Bool)

(declare-fun e!76121 () Bool)

(declare-fun mapRes!4322 () Bool)

(assert (=> b!116545 (= e!76118 (and e!76121 mapRes!4322))))

(declare-fun condMapEmpty!4321 () Bool)

(declare-fun mapDefault!4321 () ValueCell!1053)

(assert (=> b!116545 (= condMapEmpty!4321 (= (arr!2178 (_values!2702 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1053)) mapDefault!4321)))))

(declare-fun mapNonEmpty!4321 () Bool)

(declare-fun tp!10632 () Bool)

(declare-fun e!76113 () Bool)

(assert (=> mapNonEmpty!4321 (= mapRes!4322 (and tp!10632 e!76113))))

(declare-fun mapRest!4321 () (Array (_ BitVec 32) ValueCell!1053))

(declare-fun mapValue!4322 () ValueCell!1053)

(declare-fun mapKey!4322 () (_ BitVec 32))

(assert (=> mapNonEmpty!4321 (= (arr!2178 (_values!2702 newMap!16)) (store mapRest!4321 mapKey!4322 mapValue!4322))))

(declare-fun b!116546 () Bool)

(declare-fun e!76110 () Bool)

(assert (=> b!116546 (= e!76110 e!76120)))

(declare-fun b!116548 () Bool)

(assert (=> b!116548 (= e!76113 tp_is_empty!2793)))

(declare-fun b!116549 () Bool)

(assert (=> b!116549 (= e!76115 tp_is_empty!2793)))

(declare-fun b!116550 () Bool)

(declare-fun e!76117 () Bool)

(assert (=> b!116550 (= e!76117 e!76110)))

(declare-fun mapIsEmpty!4321 () Bool)

(assert (=> mapIsEmpty!4321 mapRes!4321))

(declare-fun b!116551 () Bool)

(declare-fun res!57085 () Bool)

(assert (=> b!116551 (=> (not res!57085) (not e!76112))))

(assert (=> b!116551 (= res!57085 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2438 (_keys!4442 (v!3052 (underlying!417 thiss!992)))))))))

(declare-fun mapIsEmpty!4322 () Bool)

(assert (=> mapIsEmpty!4322 mapRes!4322))

(declare-fun mapNonEmpty!4322 () Bool)

(declare-fun tp!10633 () Bool)

(assert (=> mapNonEmpty!4322 (= mapRes!4321 (and tp!10633 e!76122))))

(declare-fun mapRest!4322 () (Array (_ BitVec 32) ValueCell!1053))

(declare-fun mapKey!4321 () (_ BitVec 32))

(declare-fun mapValue!4321 () ValueCell!1053)

(assert (=> mapNonEmpty!4322 (= (arr!2178 (_values!2702 (v!3052 (underlying!417 thiss!992)))) (store mapRest!4322 mapKey!4321 mapValue!4321))))

(declare-fun res!57086 () Bool)

(assert (=> start!13224 (=> (not res!57086) (not e!76112))))

(declare-fun valid!482 (LongMap!812) Bool)

(assert (=> start!13224 (= res!57086 (valid!482 thiss!992))))

(assert (=> start!13224 e!76112))

(assert (=> start!13224 e!76117))

(assert (=> start!13224 true))

(assert (=> start!13224 e!76111))

(declare-fun b!116547 () Bool)

(assert (=> b!116547 (= e!76121 tp_is_empty!2793)))

(assert (= (and start!13224 res!57086) b!116551))

(assert (= (and b!116551 res!57085) b!116541))

(assert (= (and b!116541 res!57084) b!116539))

(assert (= (and b!116539 res!57087) b!116544))

(assert (= (and b!116543 condMapEmpty!4322) mapIsEmpty!4321))

(assert (= (and b!116543 (not condMapEmpty!4322)) mapNonEmpty!4322))

(get-info :version)

(assert (= (and mapNonEmpty!4322 ((_ is ValueCellFull!1053) mapValue!4321)) b!116540))

(assert (= (and b!116543 ((_ is ValueCellFull!1053) mapDefault!4322)) b!116549))

(assert (= b!116538 b!116543))

(assert (= b!116546 b!116538))

(assert (= b!116550 b!116546))

(assert (= start!13224 b!116550))

(assert (= (and b!116545 condMapEmpty!4321) mapIsEmpty!4322))

(assert (= (and b!116545 (not condMapEmpty!4321)) mapNonEmpty!4321))

(assert (= (and mapNonEmpty!4321 ((_ is ValueCellFull!1053) mapValue!4322)) b!116548))

(assert (= (and b!116545 ((_ is ValueCellFull!1053) mapDefault!4321)) b!116547))

(assert (= b!116542 b!116545))

(assert (= start!13224 b!116542))

(declare-fun m!132619 () Bool)

(assert (=> start!13224 m!132619))

(declare-fun m!132621 () Bool)

(assert (=> mapNonEmpty!4322 m!132621))

(declare-fun m!132623 () Bool)

(assert (=> b!116542 m!132623))

(declare-fun m!132625 () Bool)

(assert (=> b!116542 m!132625))

(declare-fun m!132627 () Bool)

(assert (=> b!116541 m!132627))

(declare-fun m!132629 () Bool)

(assert (=> b!116544 m!132629))

(declare-fun m!132631 () Bool)

(assert (=> b!116544 m!132631))

(declare-fun m!132633 () Bool)

(assert (=> b!116538 m!132633))

(declare-fun m!132635 () Bool)

(assert (=> b!116538 m!132635))

(declare-fun m!132637 () Bool)

(assert (=> mapNonEmpty!4321 m!132637))

(check-sat (not b!116541) (not b!116538) b_and!7259 (not b_next!2755) tp_is_empty!2793 (not b_next!2753) (not mapNonEmpty!4322) (not mapNonEmpty!4321) (not b!116542) b_and!7261 (not start!13224) (not b!116544))
(check-sat b_and!7259 b_and!7261 (not b_next!2753) (not b_next!2755))
