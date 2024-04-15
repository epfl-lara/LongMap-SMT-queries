; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16300 () Bool)

(assert start!16300)

(declare-fun b!162473 () Bool)

(declare-fun b_free!3757 () Bool)

(declare-fun b_next!3757 () Bool)

(assert (=> b!162473 (= b_free!3757 (not b_next!3757))))

(declare-fun tp!13841 () Bool)

(declare-fun b_and!10145 () Bool)

(assert (=> b!162473 (= tp!13841 b_and!10145)))

(declare-fun b!162469 () Bool)

(declare-fun e!106513 () Bool)

(declare-fun e!106519 () Bool)

(assert (=> b!162469 (= e!106513 e!106519)))

(declare-fun res!76921 () Bool)

(assert (=> b!162469 (=> (not res!76921) (not e!106519))))

(declare-datatypes ((SeekEntryResult!398 0))(
  ( (MissingZero!398 (index!3760 (_ BitVec 32))) (Found!398 (index!3761 (_ BitVec 32))) (Intermediate!398 (undefined!1210 Bool) (index!3762 (_ BitVec 32)) (x!18005 (_ BitVec 32))) (Undefined!398) (MissingVacant!398 (index!3763 (_ BitVec 32))) )
))
(declare-fun lt!82322 () SeekEntryResult!398)

(get-info :version)

(assert (=> b!162469 (= res!76921 (and (not ((_ is Undefined!398) lt!82322)) (not ((_ is MissingVacant!398) lt!82322)) ((_ is MissingZero!398) lt!82322)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4393 0))(
  ( (V!4394 (val!1824 Int)) )
))
(declare-datatypes ((ValueCell!1436 0))(
  ( (ValueCellFull!1436 (v!3683 V!4393)) (EmptyCell!1436) )
))
(declare-datatypes ((array!6177 0))(
  ( (array!6178 (arr!2932 (Array (_ BitVec 32) (_ BitVec 64))) (size!3217 (_ BitVec 32))) )
))
(declare-datatypes ((array!6179 0))(
  ( (array!6180 (arr!2933 (Array (_ BitVec 32) ValueCell!1436)) (size!3218 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1780 0))(
  ( (LongMapFixedSize!1781 (defaultEntry!3332 Int) (mask!7959 (_ BitVec 32)) (extraKeys!3073 (_ BitVec 32)) (zeroValue!3175 V!4393) (minValue!3175 V!4393) (_size!939 (_ BitVec 32)) (_keys!5132 array!6177) (_values!3315 array!6179) (_vacant!939 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1780)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6177 (_ BitVec 32)) SeekEntryResult!398)

(assert (=> b!162469 (= lt!82322 (seekEntryOrOpen!0 key!828 (_keys!5132 thiss!1248) (mask!7959 thiss!1248)))))

(declare-fun b!162470 () Bool)

(declare-fun e!106516 () Bool)

(declare-fun tp_is_empty!3559 () Bool)

(assert (=> b!162470 (= e!106516 tp_is_empty!3559)))

(declare-fun b!162471 () Bool)

(declare-fun e!106515 () Bool)

(assert (=> b!162471 (= e!106515 tp_is_empty!3559)))

(declare-fun b!162472 () Bool)

(declare-fun res!76923 () Bool)

(assert (=> b!162472 (=> (not res!76923) (not e!106513))))

(assert (=> b!162472 (= res!76923 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6026 () Bool)

(declare-fun mapRes!6026 () Bool)

(declare-fun tp!13840 () Bool)

(assert (=> mapNonEmpty!6026 (= mapRes!6026 (and tp!13840 e!106515))))

(declare-fun mapKey!6026 () (_ BitVec 32))

(declare-fun mapValue!6026 () ValueCell!1436)

(declare-fun mapRest!6026 () (Array (_ BitVec 32) ValueCell!1436))

(assert (=> mapNonEmpty!6026 (= (arr!2933 (_values!3315 thiss!1248)) (store mapRest!6026 mapKey!6026 mapValue!6026))))

(declare-fun mapIsEmpty!6026 () Bool)

(assert (=> mapIsEmpty!6026 mapRes!6026))

(declare-fun e!106517 () Bool)

(declare-fun e!106514 () Bool)

(declare-fun array_inv!1887 (array!6177) Bool)

(declare-fun array_inv!1888 (array!6179) Bool)

(assert (=> b!162473 (= e!106517 (and tp!13841 tp_is_empty!3559 (array_inv!1887 (_keys!5132 thiss!1248)) (array_inv!1888 (_values!3315 thiss!1248)) e!106514))))

(declare-fun res!76922 () Bool)

(assert (=> start!16300 (=> (not res!76922) (not e!106513))))

(declare-fun valid!806 (LongMapFixedSize!1780) Bool)

(assert (=> start!16300 (= res!76922 (valid!806 thiss!1248))))

(assert (=> start!16300 e!106513))

(assert (=> start!16300 e!106517))

(assert (=> start!16300 true))

(assert (=> start!16300 tp_is_empty!3559))

(declare-fun b!162474 () Bool)

(assert (=> b!162474 (= e!106514 (and e!106516 mapRes!6026))))

(declare-fun condMapEmpty!6026 () Bool)

(declare-fun mapDefault!6026 () ValueCell!1436)

(assert (=> b!162474 (= condMapEmpty!6026 (= (arr!2933 (_values!3315 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1436)) mapDefault!6026)))))

(declare-fun b!162475 () Bool)

(assert (=> b!162475 (= e!106519 false)))

(declare-fun v!309 () V!4393)

(declare-fun lt!82323 () Bool)

(declare-datatypes ((tuple2!2996 0))(
  ( (tuple2!2997 (_1!1509 Bool) (_2!1509 LongMapFixedSize!1780)) )
))
(declare-fun updateHelperNewKey!88 (LongMapFixedSize!1780 (_ BitVec 64) V!4393 (_ BitVec 32)) tuple2!2996)

(assert (=> b!162475 (= lt!82323 (valid!806 (_2!1509 (updateHelperNewKey!88 thiss!1248 key!828 v!309 (index!3760 lt!82322)))))))

(assert (= (and start!16300 res!76922) b!162472))

(assert (= (and b!162472 res!76923) b!162469))

(assert (= (and b!162469 res!76921) b!162475))

(assert (= (and b!162474 condMapEmpty!6026) mapIsEmpty!6026))

(assert (= (and b!162474 (not condMapEmpty!6026)) mapNonEmpty!6026))

(assert (= (and mapNonEmpty!6026 ((_ is ValueCellFull!1436) mapValue!6026)) b!162471))

(assert (= (and b!162474 ((_ is ValueCellFull!1436) mapDefault!6026)) b!162470))

(assert (= b!162473 b!162474))

(assert (= start!16300 b!162473))

(declare-fun m!193051 () Bool)

(assert (=> start!16300 m!193051))

(declare-fun m!193053 () Bool)

(assert (=> b!162469 m!193053))

(declare-fun m!193055 () Bool)

(assert (=> b!162473 m!193055))

(declare-fun m!193057 () Bool)

(assert (=> b!162473 m!193057))

(declare-fun m!193059 () Bool)

(assert (=> mapNonEmpty!6026 m!193059))

(declare-fun m!193061 () Bool)

(assert (=> b!162475 m!193061))

(declare-fun m!193063 () Bool)

(assert (=> b!162475 m!193063))

(check-sat (not b!162475) (not b!162473) b_and!10145 (not b!162469) tp_is_empty!3559 (not start!16300) (not b_next!3757) (not mapNonEmpty!6026))
(check-sat b_and!10145 (not b_next!3757))
