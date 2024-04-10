; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16248 () Bool)

(assert start!16248)

(declare-fun b!162116 () Bool)

(declare-fun b_free!3709 () Bool)

(declare-fun b_next!3709 () Bool)

(assert (=> b!162116 (= b_free!3709 (not b_next!3709))))

(declare-fun tp!13697 () Bool)

(declare-fun b_and!10123 () Bool)

(assert (=> b!162116 (= tp!13697 b_and!10123)))

(declare-fun mapNonEmpty!5954 () Bool)

(declare-fun mapRes!5954 () Bool)

(declare-fun tp!13696 () Bool)

(declare-fun e!106133 () Bool)

(assert (=> mapNonEmpty!5954 (= mapRes!5954 (and tp!13696 e!106133))))

(declare-fun mapKey!5954 () (_ BitVec 32))

(declare-datatypes ((V!4329 0))(
  ( (V!4330 (val!1800 Int)) )
))
(declare-datatypes ((ValueCell!1412 0))(
  ( (ValueCellFull!1412 (v!3665 V!4329)) (EmptyCell!1412) )
))
(declare-fun mapValue!5954 () ValueCell!1412)

(declare-datatypes ((array!6101 0))(
  ( (array!6102 (arr!2895 (Array (_ BitVec 32) (_ BitVec 64))) (size!3179 (_ BitVec 32))) )
))
(declare-datatypes ((array!6103 0))(
  ( (array!6104 (arr!2896 (Array (_ BitVec 32) ValueCell!1412)) (size!3180 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1732 0))(
  ( (LongMapFixedSize!1733 (defaultEntry!3308 Int) (mask!7920 (_ BitVec 32)) (extraKeys!3049 (_ BitVec 32)) (zeroValue!3151 V!4329) (minValue!3151 V!4329) (_size!915 (_ BitVec 32)) (_keys!5109 array!6101) (_values!3291 array!6103) (_vacant!915 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1732)

(declare-fun mapRest!5954 () (Array (_ BitVec 32) ValueCell!1412))

(assert (=> mapNonEmpty!5954 (= (arr!2896 (_values!3291 thiss!1248)) (store mapRest!5954 mapKey!5954 mapValue!5954))))

(declare-fun mapIsEmpty!5954 () Bool)

(assert (=> mapIsEmpty!5954 mapRes!5954))

(declare-fun b!162112 () Bool)

(declare-fun e!106128 () Bool)

(declare-fun tp_is_empty!3511 () Bool)

(assert (=> b!162112 (= e!106128 tp_is_empty!3511)))

(declare-fun b!162113 () Bool)

(declare-fun e!106134 () Bool)

(declare-fun e!106130 () Bool)

(assert (=> b!162113 (= e!106134 e!106130)))

(declare-fun res!76802 () Bool)

(assert (=> b!162113 (=> (not res!76802) (not e!106130))))

(declare-datatypes ((SeekEntryResult!371 0))(
  ( (MissingZero!371 (index!3652 (_ BitVec 32))) (Found!371 (index!3653 (_ BitVec 32))) (Intermediate!371 (undefined!1183 Bool) (index!3654 (_ BitVec 32)) (x!17915 (_ BitVec 32))) (Undefined!371) (MissingVacant!371 (index!3655 (_ BitVec 32))) )
))
(declare-fun lt!82378 () SeekEntryResult!371)

(assert (=> b!162113 (= res!76802 (and (not (is-Undefined!371 lt!82378)) (is-MissingVacant!371 lt!82378)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6101 (_ BitVec 32)) SeekEntryResult!371)

(assert (=> b!162113 (= lt!82378 (seekEntryOrOpen!0 key!828 (_keys!5109 thiss!1248) (mask!7920 thiss!1248)))))

(declare-fun b!162114 () Bool)

(declare-fun res!76800 () Bool)

(assert (=> b!162114 (=> (not res!76800) (not e!106134))))

(assert (=> b!162114 (= res!76800 (not (= key!828 (bvneg key!828))))))

(declare-fun res!76801 () Bool)

(assert (=> start!16248 (=> (not res!76801) (not e!106134))))

(declare-fun valid!787 (LongMapFixedSize!1732) Bool)

(assert (=> start!16248 (= res!76801 (valid!787 thiss!1248))))

(assert (=> start!16248 e!106134))

(declare-fun e!106132 () Bool)

(assert (=> start!16248 e!106132))

(assert (=> start!16248 true))

(assert (=> start!16248 tp_is_empty!3511))

(declare-fun b!162115 () Bool)

(assert (=> b!162115 (= e!106133 tp_is_empty!3511)))

(declare-fun e!106131 () Bool)

(declare-fun array_inv!1851 (array!6101) Bool)

(declare-fun array_inv!1852 (array!6103) Bool)

(assert (=> b!162116 (= e!106132 (and tp!13697 tp_is_empty!3511 (array_inv!1851 (_keys!5109 thiss!1248)) (array_inv!1852 (_values!3291 thiss!1248)) e!106131))))

(declare-fun b!162117 () Bool)

(assert (=> b!162117 (= e!106131 (and e!106128 mapRes!5954))))

(declare-fun condMapEmpty!5954 () Bool)

(declare-fun mapDefault!5954 () ValueCell!1412)

