; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16250 () Bool)

(assert start!16250)

(declare-fun b!162139 () Bool)

(declare-fun b_free!3711 () Bool)

(declare-fun b_next!3711 () Bool)

(assert (=> b!162139 (= b_free!3711 (not b_next!3711))))

(declare-fun tp!13703 () Bool)

(declare-fun b_and!10125 () Bool)

(assert (=> b!162139 (= tp!13703 b_and!10125)))

(declare-fun mapNonEmpty!5957 () Bool)

(declare-fun mapRes!5957 () Bool)

(declare-fun tp!13702 () Bool)

(declare-fun e!106151 () Bool)

(assert (=> mapNonEmpty!5957 (= mapRes!5957 (and tp!13702 e!106151))))

(declare-fun mapKey!5957 () (_ BitVec 32))

(declare-datatypes ((V!4331 0))(
  ( (V!4332 (val!1801 Int)) )
))
(declare-datatypes ((ValueCell!1413 0))(
  ( (ValueCellFull!1413 (v!3666 V!4331)) (EmptyCell!1413) )
))
(declare-fun mapValue!5957 () ValueCell!1413)

(declare-datatypes ((array!6105 0))(
  ( (array!6106 (arr!2897 (Array (_ BitVec 32) (_ BitVec 64))) (size!3181 (_ BitVec 32))) )
))
(declare-datatypes ((array!6107 0))(
  ( (array!6108 (arr!2898 (Array (_ BitVec 32) ValueCell!1413)) (size!3182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1734 0))(
  ( (LongMapFixedSize!1735 (defaultEntry!3309 Int) (mask!7921 (_ BitVec 32)) (extraKeys!3050 (_ BitVec 32)) (zeroValue!3152 V!4331) (minValue!3152 V!4331) (_size!916 (_ BitVec 32)) (_keys!5110 array!6105) (_values!3292 array!6107) (_vacant!916 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1734)

(declare-fun mapRest!5957 () (Array (_ BitVec 32) ValueCell!1413))

(assert (=> mapNonEmpty!5957 (= (arr!2898 (_values!3292 thiss!1248)) (store mapRest!5957 mapKey!5957 mapValue!5957))))

(declare-fun b!162133 () Bool)

(declare-fun tp_is_empty!3513 () Bool)

(assert (=> b!162133 (= e!106151 tp_is_empty!3513)))

(declare-fun b!162134 () Bool)

(declare-fun e!106149 () Bool)

(assert (=> b!162134 (= e!106149 false)))

(declare-fun lt!82384 () Bool)

(declare-datatypes ((SeekEntryResult!372 0))(
  ( (MissingZero!372 (index!3656 (_ BitVec 32))) (Found!372 (index!3657 (_ BitVec 32))) (Intermediate!372 (undefined!1184 Bool) (index!3658 (_ BitVec 32)) (x!17916 (_ BitVec 32))) (Undefined!372) (MissingVacant!372 (index!3659 (_ BitVec 32))) )
))
(declare-fun lt!82383 () SeekEntryResult!372)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4331)

(declare-fun valid!788 (LongMapFixedSize!1734) Bool)

(declare-datatypes ((tuple2!2990 0))(
  ( (tuple2!2991 (_1!1506 Bool) (_2!1506 LongMapFixedSize!1734)) )
))
(declare-fun updateHelperNewKey!78 (LongMapFixedSize!1734 (_ BitVec 64) V!4331 (_ BitVec 32)) tuple2!2990)

(assert (=> b!162134 (= lt!82384 (valid!788 (_2!1506 (updateHelperNewKey!78 thiss!1248 key!828 v!309 (index!3659 lt!82383)))))))

(declare-fun b!162135 () Bool)

(declare-fun res!76810 () Bool)

(declare-fun e!106150 () Bool)

(assert (=> b!162135 (=> (not res!76810) (not e!106150))))

(assert (=> b!162135 (= res!76810 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162136 () Bool)

(assert (=> b!162136 (= e!106150 e!106149)))

(declare-fun res!76811 () Bool)

(assert (=> b!162136 (=> (not res!76811) (not e!106149))))

(get-info :version)

(assert (=> b!162136 (= res!76811 (and (not ((_ is Undefined!372) lt!82383)) ((_ is MissingVacant!372) lt!82383)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6105 (_ BitVec 32)) SeekEntryResult!372)

(assert (=> b!162136 (= lt!82383 (seekEntryOrOpen!0 key!828 (_keys!5110 thiss!1248) (mask!7921 thiss!1248)))))

(declare-fun b!162137 () Bool)

(declare-fun e!106152 () Bool)

(assert (=> b!162137 (= e!106152 tp_is_empty!3513)))

(declare-fun b!162138 () Bool)

(declare-fun e!106153 () Bool)

(assert (=> b!162138 (= e!106153 (and e!106152 mapRes!5957))))

(declare-fun condMapEmpty!5957 () Bool)

(declare-fun mapDefault!5957 () ValueCell!1413)

(assert (=> b!162138 (= condMapEmpty!5957 (= (arr!2898 (_values!3292 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1413)) mapDefault!5957)))))

(declare-fun res!76809 () Bool)

(assert (=> start!16250 (=> (not res!76809) (not e!106150))))

(assert (=> start!16250 (= res!76809 (valid!788 thiss!1248))))

(assert (=> start!16250 e!106150))

(declare-fun e!106154 () Bool)

(assert (=> start!16250 e!106154))

(assert (=> start!16250 true))

(assert (=> start!16250 tp_is_empty!3513))

(declare-fun mapIsEmpty!5957 () Bool)

(assert (=> mapIsEmpty!5957 mapRes!5957))

(declare-fun array_inv!1853 (array!6105) Bool)

(declare-fun array_inv!1854 (array!6107) Bool)

(assert (=> b!162139 (= e!106154 (and tp!13703 tp_is_empty!3513 (array_inv!1853 (_keys!5110 thiss!1248)) (array_inv!1854 (_values!3292 thiss!1248)) e!106153))))

(assert (= (and start!16250 res!76809) b!162135))

(assert (= (and b!162135 res!76810) b!162136))

(assert (= (and b!162136 res!76811) b!162134))

(assert (= (and b!162138 condMapEmpty!5957) mapIsEmpty!5957))

(assert (= (and b!162138 (not condMapEmpty!5957)) mapNonEmpty!5957))

(assert (= (and mapNonEmpty!5957 ((_ is ValueCellFull!1413) mapValue!5957)) b!162133))

(assert (= (and b!162138 ((_ is ValueCellFull!1413) mapDefault!5957)) b!162137))

(assert (= b!162139 b!162138))

(assert (= start!16250 b!162139))

(declare-fun m!193373 () Bool)

(assert (=> mapNonEmpty!5957 m!193373))

(declare-fun m!193375 () Bool)

(assert (=> start!16250 m!193375))

(declare-fun m!193377 () Bool)

(assert (=> b!162139 m!193377))

(declare-fun m!193379 () Bool)

(assert (=> b!162139 m!193379))

(declare-fun m!193381 () Bool)

(assert (=> b!162136 m!193381))

(declare-fun m!193383 () Bool)

(assert (=> b!162134 m!193383))

(declare-fun m!193385 () Bool)

(assert (=> b!162134 m!193385))

(check-sat tp_is_empty!3513 (not b_next!3711) (not mapNonEmpty!5957) (not b!162136) b_and!10125 (not b!162139) (not b!162134) (not start!16250))
(check-sat b_and!10125 (not b_next!3711))
