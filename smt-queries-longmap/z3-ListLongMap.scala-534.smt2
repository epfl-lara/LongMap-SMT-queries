; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13436 () Bool)

(assert start!13436)

(declare-fun b!123263 () Bool)

(declare-fun b_free!2797 () Bool)

(declare-fun b_next!2797 () Bool)

(assert (=> b!123263 (= b_free!2797 (not b_next!2797))))

(declare-fun tp!10777 () Bool)

(declare-fun b_and!7565 () Bool)

(assert (=> b!123263 (= tp!10777 b_and!7565)))

(declare-fun b!123265 () Bool)

(declare-fun b_free!2799 () Bool)

(declare-fun b_next!2799 () Bool)

(assert (=> b!123265 (= b_free!2799 (not b_next!2799))))

(declare-fun tp!10780 () Bool)

(declare-fun b_and!7567 () Bool)

(assert (=> b!123265 (= tp!10780 b_and!7567)))

(declare-fun b!123258 () Bool)

(declare-fun e!80511 () Bool)

(declare-fun tp_is_empty!2815 () Bool)

(assert (=> b!123258 (= e!80511 tp_is_empty!2815)))

(declare-fun b!123259 () Bool)

(declare-fun e!80515 () Bool)

(declare-fun e!80512 () Bool)

(assert (=> b!123259 (= e!80515 e!80512)))

(declare-fun b!123260 () Bool)

(declare-fun e!80517 () Bool)

(assert (=> b!123260 (= e!80517 tp_is_empty!2815)))

(declare-fun b!123261 () Bool)

(declare-fun e!80509 () Bool)

(assert (=> b!123261 (= e!80509 false)))

(declare-datatypes ((V!3401 0))(
  ( (V!3402 (val!1452 Int)) )
))
(declare-datatypes ((tuple2!2506 0))(
  ( (tuple2!2507 (_1!1264 (_ BitVec 64)) (_2!1264 V!3401)) )
))
(declare-datatypes ((List!1669 0))(
  ( (Nil!1666) (Cons!1665 (h!2266 tuple2!2506) (t!5964 List!1669)) )
))
(declare-datatypes ((ListLongMap!1621 0))(
  ( (ListLongMap!1622 (toList!826 List!1669)) )
))
(declare-fun lt!63473 () ListLongMap!1621)

(declare-datatypes ((array!4627 0))(
  ( (array!4628 (arr!2192 (Array (_ BitVec 32) (_ BitVec 64))) (size!2454 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1064 0))(
  ( (ValueCellFull!1064 (v!3085 V!3401)) (EmptyCell!1064) )
))
(declare-datatypes ((array!4629 0))(
  ( (array!4630 (arr!2193 (Array (_ BitVec 32) ValueCell!1064)) (size!2455 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1036 0))(
  ( (LongMapFixedSize!1037 (defaultEntry!2751 Int) (mask!6987 (_ BitVec 32)) (extraKeys!2536 (_ BitVec 32)) (zeroValue!2616 V!3401) (minValue!2616 V!3401) (_size!567 (_ BitVec 32)) (_keys!4478 array!4627) (_values!2734 array!4629) (_vacant!567 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1036)

(declare-fun map!1367 (LongMapFixedSize!1036) ListLongMap!1621)

(assert (=> b!123261 (= lt!63473 (map!1367 newMap!16))))

(declare-fun lt!63474 () ListLongMap!1621)

(declare-datatypes ((Cell!834 0))(
  ( (Cell!835 (v!3086 LongMapFixedSize!1036)) )
))
(declare-datatypes ((LongMap!834 0))(
  ( (LongMap!835 (underlying!428 Cell!834)) )
))
(declare-fun thiss!992 () LongMap!834)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!507 (array!4627 array!4629 (_ BitVec 32) (_ BitVec 32) V!3401 V!3401 (_ BitVec 32) Int) ListLongMap!1621)

(assert (=> b!123261 (= lt!63474 (getCurrentListMap!507 (_keys!4478 (v!3086 (underlying!428 thiss!992))) (_values!2734 (v!3086 (underlying!428 thiss!992))) (mask!6987 (v!3086 (underlying!428 thiss!992))) (extraKeys!2536 (v!3086 (underlying!428 thiss!992))) (zeroValue!2616 (v!3086 (underlying!428 thiss!992))) (minValue!2616 (v!3086 (underlying!428 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2751 (v!3086 (underlying!428 thiss!992)))))))

(declare-fun b!123262 () Bool)

(declare-fun e!80514 () Bool)

(declare-fun e!80507 () Bool)

(declare-fun mapRes!4401 () Bool)

(assert (=> b!123262 (= e!80514 (and e!80507 mapRes!4401))))

(declare-fun condMapEmpty!4401 () Bool)

(declare-fun mapDefault!4402 () ValueCell!1064)

(assert (=> b!123262 (= condMapEmpty!4401 (= (arr!2193 (_values!2734 (v!3086 (underlying!428 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1064)) mapDefault!4402)))))

(declare-fun array_inv!1373 (array!4627) Bool)

(declare-fun array_inv!1374 (array!4629) Bool)

(assert (=> b!123263 (= e!80512 (and tp!10777 tp_is_empty!2815 (array_inv!1373 (_keys!4478 (v!3086 (underlying!428 thiss!992)))) (array_inv!1374 (_values!2734 (v!3086 (underlying!428 thiss!992)))) e!80514))))

(declare-fun mapNonEmpty!4401 () Bool)

(declare-fun tp!10779 () Bool)

(assert (=> mapNonEmpty!4401 (= mapRes!4401 (and tp!10779 e!80517))))

(declare-fun mapRest!4401 () (Array (_ BitVec 32) ValueCell!1064))

(declare-fun mapKey!4402 () (_ BitVec 32))

(declare-fun mapValue!4401 () ValueCell!1064)

(assert (=> mapNonEmpty!4401 (= (arr!2193 (_values!2734 (v!3086 (underlying!428 thiss!992)))) (store mapRest!4401 mapKey!4402 mapValue!4401))))

(declare-fun e!80510 () Bool)

(declare-fun e!80508 () Bool)

(assert (=> b!123265 (= e!80510 (and tp!10780 tp_is_empty!2815 (array_inv!1373 (_keys!4478 newMap!16)) (array_inv!1374 (_values!2734 newMap!16)) e!80508))))

(declare-fun mapIsEmpty!4401 () Bool)

(assert (=> mapIsEmpty!4401 mapRes!4401))

(declare-fun b!123266 () Bool)

(declare-fun e!80519 () Bool)

(assert (=> b!123266 (= e!80519 e!80515)))

(declare-fun mapNonEmpty!4402 () Bool)

(declare-fun mapRes!4402 () Bool)

(declare-fun tp!10778 () Bool)

(declare-fun e!80516 () Bool)

(assert (=> mapNonEmpty!4402 (= mapRes!4402 (and tp!10778 e!80516))))

(declare-fun mapKey!4401 () (_ BitVec 32))

(declare-fun mapValue!4402 () ValueCell!1064)

(declare-fun mapRest!4402 () (Array (_ BitVec 32) ValueCell!1064))

(assert (=> mapNonEmpty!4402 (= (arr!2193 (_values!2734 newMap!16)) (store mapRest!4402 mapKey!4401 mapValue!4402))))

(declare-fun b!123267 () Bool)

(declare-fun res!59862 () Bool)

(assert (=> b!123267 (=> (not res!59862) (not e!80509))))

(assert (=> b!123267 (= res!59862 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2454 (_keys!4478 (v!3086 (underlying!428 thiss!992)))))))))

(declare-fun b!123264 () Bool)

(assert (=> b!123264 (= e!80507 tp_is_empty!2815)))

(declare-fun res!59864 () Bool)

(assert (=> start!13436 (=> (not res!59864) (not e!80509))))

(declare-fun valid!503 (LongMap!834) Bool)

(assert (=> start!13436 (= res!59864 (valid!503 thiss!992))))

(assert (=> start!13436 e!80509))

(assert (=> start!13436 e!80519))

(assert (=> start!13436 true))

(assert (=> start!13436 e!80510))

(declare-fun b!123268 () Bool)

(assert (=> b!123268 (= e!80508 (and e!80511 mapRes!4402))))

(declare-fun condMapEmpty!4402 () Bool)

(declare-fun mapDefault!4401 () ValueCell!1064)

(assert (=> b!123268 (= condMapEmpty!4402 (= (arr!2193 (_values!2734 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1064)) mapDefault!4401)))))

(declare-fun b!123269 () Bool)

(declare-fun res!59861 () Bool)

(assert (=> b!123269 (=> (not res!59861) (not e!80509))))

(declare-fun valid!504 (LongMapFixedSize!1036) Bool)

(assert (=> b!123269 (= res!59861 (valid!504 newMap!16))))

(declare-fun b!123270 () Bool)

(assert (=> b!123270 (= e!80516 tp_is_empty!2815)))

(declare-fun b!123271 () Bool)

(declare-fun res!59863 () Bool)

(assert (=> b!123271 (=> (not res!59863) (not e!80509))))

(assert (=> b!123271 (= res!59863 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6987 newMap!16)) (_size!567 (v!3086 (underlying!428 thiss!992)))))))

(declare-fun mapIsEmpty!4402 () Bool)

(assert (=> mapIsEmpty!4402 mapRes!4402))

(assert (= (and start!13436 res!59864) b!123267))

(assert (= (and b!123267 res!59862) b!123269))

(assert (= (and b!123269 res!59861) b!123271))

(assert (= (and b!123271 res!59863) b!123261))

(assert (= (and b!123262 condMapEmpty!4401) mapIsEmpty!4401))

(assert (= (and b!123262 (not condMapEmpty!4401)) mapNonEmpty!4401))

(get-info :version)

(assert (= (and mapNonEmpty!4401 ((_ is ValueCellFull!1064) mapValue!4401)) b!123260))

(assert (= (and b!123262 ((_ is ValueCellFull!1064) mapDefault!4402)) b!123264))

(assert (= b!123263 b!123262))

(assert (= b!123259 b!123263))

(assert (= b!123266 b!123259))

(assert (= start!13436 b!123266))

(assert (= (and b!123268 condMapEmpty!4402) mapIsEmpty!4402))

(assert (= (and b!123268 (not condMapEmpty!4402)) mapNonEmpty!4402))

(assert (= (and mapNonEmpty!4402 ((_ is ValueCellFull!1064) mapValue!4402)) b!123270))

(assert (= (and b!123268 ((_ is ValueCellFull!1064) mapDefault!4401)) b!123258))

(assert (= b!123265 b!123268))

(assert (= start!13436 b!123265))

(declare-fun m!143469 () Bool)

(assert (=> b!123265 m!143469))

(declare-fun m!143471 () Bool)

(assert (=> b!123265 m!143471))

(declare-fun m!143473 () Bool)

(assert (=> b!123263 m!143473))

(declare-fun m!143475 () Bool)

(assert (=> b!123263 m!143475))

(declare-fun m!143477 () Bool)

(assert (=> mapNonEmpty!4401 m!143477))

(declare-fun m!143479 () Bool)

(assert (=> b!123269 m!143479))

(declare-fun m!143481 () Bool)

(assert (=> b!123261 m!143481))

(declare-fun m!143483 () Bool)

(assert (=> b!123261 m!143483))

(declare-fun m!143485 () Bool)

(assert (=> mapNonEmpty!4402 m!143485))

(declare-fun m!143487 () Bool)

(assert (=> start!13436 m!143487))

(check-sat b_and!7565 (not b!123269) tp_is_empty!2815 (not b!123263) (not mapNonEmpty!4401) (not mapNonEmpty!4402) (not start!13436) (not b_next!2799) b_and!7567 (not b_next!2797) (not b!123265) (not b!123261))
(check-sat b_and!7565 b_and!7567 (not b_next!2797) (not b_next!2799))
