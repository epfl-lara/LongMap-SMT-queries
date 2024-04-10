; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75716 () Bool)

(assert start!75716)

(declare-fun b!890219 () Bool)

(declare-fun b_free!15687 () Bool)

(declare-fun b_next!15687 () Bool)

(assert (=> b!890219 (= b_free!15687 (not b_next!15687))))

(declare-fun tp!55030 () Bool)

(declare-fun b_and!25927 () Bool)

(assert (=> b!890219 (= tp!55030 b_and!25927)))

(declare-fun mapIsEmpty!28577 () Bool)

(declare-fun mapRes!28577 () Bool)

(assert (=> mapIsEmpty!28577 mapRes!28577))

(declare-fun b!890217 () Bool)

(declare-fun e!496442 () Bool)

(declare-fun tp_is_empty!18015 () Bool)

(assert (=> b!890217 (= e!496442 tp_is_empty!18015)))

(declare-fun b!890218 () Bool)

(declare-fun res!603187 () Bool)

(declare-fun e!496441 () Bool)

(assert (=> b!890218 (=> (not res!603187) (not e!496441))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890218 (= res!603187 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890220 () Bool)

(declare-fun e!496440 () Bool)

(declare-fun e!496444 () Bool)

(assert (=> b!890220 (= e!496440 (and e!496444 mapRes!28577))))

(declare-fun condMapEmpty!28577 () Bool)

(declare-datatypes ((array!52010 0))(
  ( (array!52011 (arr!25011 (Array (_ BitVec 32) (_ BitVec 64))) (size!25455 (_ BitVec 32))) )
))
(declare-datatypes ((V!28985 0))(
  ( (V!28986 (val!9058 Int)) )
))
(declare-datatypes ((ValueCell!8526 0))(
  ( (ValueCellFull!8526 (v!11536 V!28985)) (EmptyCell!8526) )
))
(declare-datatypes ((array!52012 0))(
  ( (array!52013 (arr!25012 (Array (_ BitVec 32) ValueCell!8526)) (size!25456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4068 0))(
  ( (LongMapFixedSize!4069 (defaultEntry!5231 Int) (mask!25700 (_ BitVec 32)) (extraKeys!4925 (_ BitVec 32)) (zeroValue!5029 V!28985) (minValue!5029 V!28985) (_size!2089 (_ BitVec 32)) (_keys!9914 array!52010) (_values!5216 array!52012) (_vacant!2089 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4068)

(declare-fun mapDefault!28577 () ValueCell!8526)

(assert (=> b!890220 (= condMapEmpty!28577 (= (arr!25012 (_values!5216 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8526)) mapDefault!28577)))))

(declare-fun b!890221 () Bool)

(declare-fun e!496443 () Bool)

(declare-datatypes ((SeekEntryResult!8794 0))(
  ( (MissingZero!8794 (index!37547 (_ BitVec 32))) (Found!8794 (index!37548 (_ BitVec 32))) (Intermediate!8794 (undefined!9606 Bool) (index!37549 (_ BitVec 32)) (x!75618 (_ BitVec 32))) (Undefined!8794) (MissingVacant!8794 (index!37550 (_ BitVec 32))) )
))
(declare-fun lt!402220 () SeekEntryResult!8794)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890221 (= e!496443 (inRange!0 (index!37548 lt!402220) (mask!25700 thiss!1181)))))

(declare-fun mapNonEmpty!28577 () Bool)

(declare-fun tp!55029 () Bool)

(assert (=> mapNonEmpty!28577 (= mapRes!28577 (and tp!55029 e!496442))))

(declare-fun mapKey!28577 () (_ BitVec 32))

(declare-fun mapRest!28577 () (Array (_ BitVec 32) ValueCell!8526))

(declare-fun mapValue!28577 () ValueCell!8526)

(assert (=> mapNonEmpty!28577 (= (arr!25012 (_values!5216 thiss!1181)) (store mapRest!28577 mapKey!28577 mapValue!28577))))

(declare-fun b!890222 () Bool)

(assert (=> b!890222 (= e!496441 (not true))))

(assert (=> b!890222 e!496443))

(declare-fun res!603186 () Bool)

(assert (=> b!890222 (=> res!603186 e!496443)))

(get-info :version)

(assert (=> b!890222 (= res!603186 (not ((_ is Found!8794) lt!402220)))))

(declare-datatypes ((Unit!30292 0))(
  ( (Unit!30293) )
))
(declare-fun lt!402219 () Unit!30292)

(declare-fun lemmaSeekEntryGivesInRangeIndex!8 (array!52010 array!52012 (_ BitVec 32) (_ BitVec 32) V!28985 V!28985 (_ BitVec 64)) Unit!30292)

(assert (=> b!890222 (= lt!402219 (lemmaSeekEntryGivesInRangeIndex!8 (_keys!9914 thiss!1181) (_values!5216 thiss!1181) (mask!25700 thiss!1181) (extraKeys!4925 thiss!1181) (zeroValue!5029 thiss!1181) (minValue!5029 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52010 (_ BitVec 32)) SeekEntryResult!8794)

(assert (=> b!890222 (= lt!402220 (seekEntry!0 key!785 (_keys!9914 thiss!1181) (mask!25700 thiss!1181)))))

(declare-fun b!890223 () Bool)

(assert (=> b!890223 (= e!496444 tp_is_empty!18015)))

(declare-fun e!496446 () Bool)

(declare-fun array_inv!19666 (array!52010) Bool)

(declare-fun array_inv!19667 (array!52012) Bool)

(assert (=> b!890219 (= e!496446 (and tp!55030 tp_is_empty!18015 (array_inv!19666 (_keys!9914 thiss!1181)) (array_inv!19667 (_values!5216 thiss!1181)) e!496440))))

(declare-fun res!603188 () Bool)

(assert (=> start!75716 (=> (not res!603188) (not e!496441))))

(declare-fun valid!1579 (LongMapFixedSize!4068) Bool)

(assert (=> start!75716 (= res!603188 (valid!1579 thiss!1181))))

(assert (=> start!75716 e!496441))

(assert (=> start!75716 e!496446))

(assert (=> start!75716 true))

(assert (= (and start!75716 res!603188) b!890218))

(assert (= (and b!890218 res!603187) b!890222))

(assert (= (and b!890222 (not res!603186)) b!890221))

(assert (= (and b!890220 condMapEmpty!28577) mapIsEmpty!28577))

(assert (= (and b!890220 (not condMapEmpty!28577)) mapNonEmpty!28577))

(assert (= (and mapNonEmpty!28577 ((_ is ValueCellFull!8526) mapValue!28577)) b!890217))

(assert (= (and b!890220 ((_ is ValueCellFull!8526) mapDefault!28577)) b!890223))

(assert (= b!890219 b!890220))

(assert (= start!75716 b!890219))

(declare-fun m!828833 () Bool)

(assert (=> start!75716 m!828833))

(declare-fun m!828835 () Bool)

(assert (=> b!890221 m!828835))

(declare-fun m!828837 () Bool)

(assert (=> b!890219 m!828837))

(declare-fun m!828839 () Bool)

(assert (=> b!890219 m!828839))

(declare-fun m!828841 () Bool)

(assert (=> b!890222 m!828841))

(declare-fun m!828843 () Bool)

(assert (=> b!890222 m!828843))

(declare-fun m!828845 () Bool)

(assert (=> mapNonEmpty!28577 m!828845))

(check-sat (not start!75716) (not b!890221) b_and!25927 (not mapNonEmpty!28577) (not b_next!15687) (not b!890222) (not b!890219) tp_is_empty!18015)
(check-sat b_and!25927 (not b_next!15687))
