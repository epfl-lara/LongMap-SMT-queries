; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16246 () Bool)

(assert start!16246)

(declare-fun b!162102 () Bool)

(declare-fun b_free!3703 () Bool)

(declare-fun b_next!3703 () Bool)

(assert (=> b!162102 (= b_free!3703 (not b_next!3703))))

(declare-fun tp!13679 () Bool)

(declare-fun b_and!10131 () Bool)

(assert (=> b!162102 (= tp!13679 b_and!10131)))

(declare-fun b!162097 () Bool)

(declare-fun e!106095 () Bool)

(declare-fun tp_is_empty!3505 () Bool)

(assert (=> b!162097 (= e!106095 tp_is_empty!3505)))

(declare-fun b!162098 () Bool)

(declare-fun e!106091 () Bool)

(assert (=> b!162098 (= e!106091 false)))

(declare-fun lt!82418 () Bool)

(declare-datatypes ((SeekEntryResult!365 0))(
  ( (MissingZero!365 (index!3628 (_ BitVec 32))) (Found!365 (index!3629 (_ BitVec 32))) (Intermediate!365 (undefined!1177 Bool) (index!3630 (_ BitVec 32)) (x!17901 (_ BitVec 32))) (Undefined!365) (MissingVacant!365 (index!3631 (_ BitVec 32))) )
))
(declare-fun lt!82419 () SeekEntryResult!365)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4321 0))(
  ( (V!4322 (val!1797 Int)) )
))
(declare-fun v!309 () V!4321)

(declare-datatypes ((ValueCell!1409 0))(
  ( (ValueCellFull!1409 (v!3663 V!4321)) (EmptyCell!1409) )
))
(declare-datatypes ((array!6075 0))(
  ( (array!6076 (arr!2882 (Array (_ BitVec 32) (_ BitVec 64))) (size!3166 (_ BitVec 32))) )
))
(declare-datatypes ((array!6077 0))(
  ( (array!6078 (arr!2883 (Array (_ BitVec 32) ValueCell!1409)) (size!3167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1726 0))(
  ( (LongMapFixedSize!1727 (defaultEntry!3305 Int) (mask!7915 (_ BitVec 32)) (extraKeys!3046 (_ BitVec 32)) (zeroValue!3148 V!4321) (minValue!3148 V!4321) (_size!912 (_ BitVec 32)) (_keys!5106 array!6075) (_values!3288 array!6077) (_vacant!912 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1726)

(declare-fun valid!803 (LongMapFixedSize!1726) Bool)

(declare-datatypes ((tuple2!2938 0))(
  ( (tuple2!2939 (_1!1480 Bool) (_2!1480 LongMapFixedSize!1726)) )
))
(declare-fun updateHelperNewKey!77 (LongMapFixedSize!1726 (_ BitVec 64) V!4321 (_ BitVec 32)) tuple2!2938)

(assert (=> b!162098 (= lt!82418 (valid!803 (_2!1480 (updateHelperNewKey!77 thiss!1248 key!828 v!309 (index!3631 lt!82419)))))))

(declare-fun mapIsEmpty!5945 () Bool)

(declare-fun mapRes!5945 () Bool)

(assert (=> mapIsEmpty!5945 mapRes!5945))

(declare-fun b!162099 () Bool)

(declare-fun res!76794 () Bool)

(declare-fun e!106092 () Bool)

(assert (=> b!162099 (=> (not res!76794) (not e!106092))))

(assert (=> b!162099 (= res!76794 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162100 () Bool)

(assert (=> b!162100 (= e!106092 e!106091)))

(declare-fun res!76796 () Bool)

(assert (=> b!162100 (=> (not res!76796) (not e!106091))))

(get-info :version)

(assert (=> b!162100 (= res!76796 (and (not ((_ is Undefined!365) lt!82419)) ((_ is MissingVacant!365) lt!82419)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6075 (_ BitVec 32)) SeekEntryResult!365)

(assert (=> b!162100 (= lt!82419 (seekEntryOrOpen!0 key!828 (_keys!5106 thiss!1248) (mask!7915 thiss!1248)))))

(declare-fun b!162101 () Bool)

(declare-fun e!106089 () Bool)

(assert (=> b!162101 (= e!106089 tp_is_empty!3505)))

(declare-fun res!76795 () Bool)

(assert (=> start!16246 (=> (not res!76795) (not e!106092))))

(assert (=> start!16246 (= res!76795 (valid!803 thiss!1248))))

(assert (=> start!16246 e!106092))

(declare-fun e!106094 () Bool)

(assert (=> start!16246 e!106094))

(assert (=> start!16246 true))

(assert (=> start!16246 tp_is_empty!3505))

(declare-fun b!162096 () Bool)

(declare-fun e!106090 () Bool)

(assert (=> b!162096 (= e!106090 (and e!106089 mapRes!5945))))

(declare-fun condMapEmpty!5945 () Bool)

(declare-fun mapDefault!5945 () ValueCell!1409)

(assert (=> b!162096 (= condMapEmpty!5945 (= (arr!2883 (_values!3288 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1409)) mapDefault!5945)))))

(declare-fun array_inv!1847 (array!6075) Bool)

(declare-fun array_inv!1848 (array!6077) Bool)

(assert (=> b!162102 (= e!106094 (and tp!13679 tp_is_empty!3505 (array_inv!1847 (_keys!5106 thiss!1248)) (array_inv!1848 (_values!3288 thiss!1248)) e!106090))))

(declare-fun mapNonEmpty!5945 () Bool)

(declare-fun tp!13678 () Bool)

(assert (=> mapNonEmpty!5945 (= mapRes!5945 (and tp!13678 e!106095))))

(declare-fun mapRest!5945 () (Array (_ BitVec 32) ValueCell!1409))

(declare-fun mapValue!5945 () ValueCell!1409)

(declare-fun mapKey!5945 () (_ BitVec 32))

(assert (=> mapNonEmpty!5945 (= (arr!2883 (_values!3288 thiss!1248)) (store mapRest!5945 mapKey!5945 mapValue!5945))))

(assert (= (and start!16246 res!76795) b!162099))

(assert (= (and b!162099 res!76794) b!162100))

(assert (= (and b!162100 res!76796) b!162098))

(assert (= (and b!162096 condMapEmpty!5945) mapIsEmpty!5945))

(assert (= (and b!162096 (not condMapEmpty!5945)) mapNonEmpty!5945))

(assert (= (and mapNonEmpty!5945 ((_ is ValueCellFull!1409) mapValue!5945)) b!162097))

(assert (= (and b!162096 ((_ is ValueCellFull!1409) mapDefault!5945)) b!162101))

(assert (= b!162102 b!162096))

(assert (= start!16246 b!162102))

(declare-fun m!193499 () Bool)

(assert (=> b!162102 m!193499))

(declare-fun m!193501 () Bool)

(assert (=> b!162102 m!193501))

(declare-fun m!193503 () Bool)

(assert (=> b!162100 m!193503))

(declare-fun m!193505 () Bool)

(assert (=> mapNonEmpty!5945 m!193505))

(declare-fun m!193507 () Bool)

(assert (=> start!16246 m!193507))

(declare-fun m!193509 () Bool)

(assert (=> b!162098 m!193509))

(declare-fun m!193511 () Bool)

(assert (=> b!162098 m!193511))

(check-sat (not start!16246) tp_is_empty!3505 (not b!162102) (not mapNonEmpty!5945) (not b!162100) b_and!10131 (not b_next!3703) (not b!162098))
(check-sat b_and!10131 (not b_next!3703))
