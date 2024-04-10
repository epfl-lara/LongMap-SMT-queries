; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16262 () Bool)

(assert start!16262)

(declare-fun b!162246 () Bool)

(declare-fun b_free!3723 () Bool)

(declare-fun b_next!3723 () Bool)

(assert (=> b!162246 (= b_free!3723 (not b_next!3723))))

(declare-fun tp!13739 () Bool)

(declare-fun b_and!10137 () Bool)

(assert (=> b!162246 (= tp!13739 b_and!10137)))

(declare-fun b!162245 () Bool)

(declare-fun e!106263 () Bool)

(declare-fun tp_is_empty!3525 () Bool)

(assert (=> b!162245 (= e!106263 tp_is_empty!3525)))

(declare-fun e!106262 () Bool)

(declare-fun e!106261 () Bool)

(declare-datatypes ((V!4347 0))(
  ( (V!4348 (val!1807 Int)) )
))
(declare-datatypes ((ValueCell!1419 0))(
  ( (ValueCellFull!1419 (v!3672 V!4347)) (EmptyCell!1419) )
))
(declare-datatypes ((array!6129 0))(
  ( (array!6130 (arr!2909 (Array (_ BitVec 32) (_ BitVec 64))) (size!3193 (_ BitVec 32))) )
))
(declare-datatypes ((array!6131 0))(
  ( (array!6132 (arr!2910 (Array (_ BitVec 32) ValueCell!1419)) (size!3194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1746 0))(
  ( (LongMapFixedSize!1747 (defaultEntry!3315 Int) (mask!7931 (_ BitVec 32)) (extraKeys!3056 (_ BitVec 32)) (zeroValue!3158 V!4347) (minValue!3158 V!4347) (_size!922 (_ BitVec 32)) (_keys!5116 array!6129) (_values!3298 array!6131) (_vacant!922 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1746)

(declare-fun array_inv!1861 (array!6129) Bool)

(declare-fun array_inv!1862 (array!6131) Bool)

(assert (=> b!162246 (= e!106261 (and tp!13739 tp_is_empty!3525 (array_inv!1861 (_keys!5116 thiss!1248)) (array_inv!1862 (_values!3298 thiss!1248)) e!106262))))

(declare-fun b!162247 () Bool)

(declare-fun mapRes!5975 () Bool)

(assert (=> b!162247 (= e!106262 (and e!106263 mapRes!5975))))

(declare-fun condMapEmpty!5975 () Bool)

(declare-fun mapDefault!5975 () ValueCell!1419)

(assert (=> b!162247 (= condMapEmpty!5975 (= (arr!2910 (_values!3298 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1419)) mapDefault!5975)))))

(declare-fun mapIsEmpty!5975 () Bool)

(assert (=> mapIsEmpty!5975 mapRes!5975))

(declare-fun b!162248 () Bool)

(declare-fun e!106264 () Bool)

(assert (=> b!162248 (= e!106264 tp_is_empty!3525)))

(declare-fun mapNonEmpty!5975 () Bool)

(declare-fun tp!13738 () Bool)

(assert (=> mapNonEmpty!5975 (= mapRes!5975 (and tp!13738 e!106264))))

(declare-fun mapKey!5975 () (_ BitVec 32))

(declare-fun mapValue!5975 () ValueCell!1419)

(declare-fun mapRest!5975 () (Array (_ BitVec 32) ValueCell!1419))

(assert (=> mapNonEmpty!5975 (= (arr!2910 (_values!3298 thiss!1248)) (store mapRest!5975 mapKey!5975 mapValue!5975))))

(declare-fun b!162250 () Bool)

(declare-fun e!106265 () Bool)

(declare-datatypes ((SeekEntryResult!377 0))(
  ( (MissingZero!377 (index!3676 (_ BitVec 32))) (Found!377 (index!3677 (_ BitVec 32))) (Intermediate!377 (undefined!1189 Bool) (index!3678 (_ BitVec 32)) (x!17937 (_ BitVec 32))) (Undefined!377) (MissingVacant!377 (index!3679 (_ BitVec 32))) )
))
(declare-fun lt!82405 () SeekEntryResult!377)

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(assert (=> b!162250 (= e!106265 (and (not ((_ is Undefined!377) lt!82405)) (not ((_ is MissingVacant!377) lt!82405)) ((_ is MissingZero!377) lt!82405) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6129 (_ BitVec 32)) SeekEntryResult!377)

(assert (=> b!162250 (= lt!82405 (seekEntryOrOpen!0 key!828 (_keys!5116 thiss!1248) (mask!7931 thiss!1248)))))

(declare-fun res!76849 () Bool)

(assert (=> start!16262 (=> (not res!76849) (not e!106265))))

(declare-fun valid!791 (LongMapFixedSize!1746) Bool)

(assert (=> start!16262 (= res!76849 (valid!791 thiss!1248))))

(assert (=> start!16262 e!106265))

(assert (=> start!16262 e!106261))

(assert (=> start!16262 true))

(declare-fun b!162249 () Bool)

(declare-fun res!76850 () Bool)

(assert (=> b!162249 (=> (not res!76850) (not e!106265))))

(assert (=> b!162249 (= res!76850 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16262 res!76849) b!162249))

(assert (= (and b!162249 res!76850) b!162250))

(assert (= (and b!162247 condMapEmpty!5975) mapIsEmpty!5975))

(assert (= (and b!162247 (not condMapEmpty!5975)) mapNonEmpty!5975))

(assert (= (and mapNonEmpty!5975 ((_ is ValueCellFull!1419) mapValue!5975)) b!162248))

(assert (= (and b!162247 ((_ is ValueCellFull!1419) mapDefault!5975)) b!162245))

(assert (= b!162246 b!162247))

(assert (= start!16262 b!162246))

(declare-fun m!193441 () Bool)

(assert (=> b!162246 m!193441))

(declare-fun m!193443 () Bool)

(assert (=> b!162246 m!193443))

(declare-fun m!193445 () Bool)

(assert (=> mapNonEmpty!5975 m!193445))

(declare-fun m!193447 () Bool)

(assert (=> b!162250 m!193447))

(declare-fun m!193449 () Bool)

(assert (=> start!16262 m!193449))

(check-sat tp_is_empty!3525 (not b_next!3723) (not mapNonEmpty!5975) b_and!10137 (not b!162246) (not start!16262) (not b!162250))
(check-sat b_and!10137 (not b_next!3723))
