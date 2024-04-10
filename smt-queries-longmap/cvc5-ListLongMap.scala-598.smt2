; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15730 () Bool)

(assert start!15730)

(declare-fun b!156966 () Bool)

(declare-fun b_free!3397 () Bool)

(declare-fun b_next!3397 () Bool)

(assert (=> b!156966 (= b_free!3397 (not b_next!3397))))

(declare-fun tp!12716 () Bool)

(declare-fun b_and!9811 () Bool)

(assert (=> b!156966 (= tp!12716 b_and!9811)))

(declare-fun e!102665 () Bool)

(declare-fun e!102666 () Bool)

(declare-datatypes ((V!3913 0))(
  ( (V!3914 (val!1644 Int)) )
))
(declare-datatypes ((ValueCell!1256 0))(
  ( (ValueCellFull!1256 (v!3509 V!3913)) (EmptyCell!1256) )
))
(declare-datatypes ((array!5451 0))(
  ( (array!5452 (arr!2583 (Array (_ BitVec 32) (_ BitVec 64))) (size!2861 (_ BitVec 32))) )
))
(declare-datatypes ((array!5453 0))(
  ( (array!5454 (arr!2584 (Array (_ BitVec 32) ValueCell!1256)) (size!2862 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1420 0))(
  ( (LongMapFixedSize!1421 (defaultEntry!3152 Int) (mask!7617 (_ BitVec 32)) (extraKeys!2893 (_ BitVec 32)) (zeroValue!2995 V!3913) (minValue!2995 V!3913) (_size!759 (_ BitVec 32)) (_keys!4927 array!5451) (_values!3135 array!5453) (_vacant!759 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1420)

(declare-fun tp_is_empty!3199 () Bool)

(declare-fun array_inv!1631 (array!5451) Bool)

(declare-fun array_inv!1632 (array!5453) Bool)

(assert (=> b!156966 (= e!102665 (and tp!12716 tp_is_empty!3199 (array_inv!1631 (_keys!4927 thiss!1248)) (array_inv!1632 (_values!3135 thiss!1248)) e!102666))))

(declare-fun mapIsEmpty!5441 () Bool)

(declare-fun mapRes!5441 () Bool)

(assert (=> mapIsEmpty!5441 mapRes!5441))

(declare-fun b!156967 () Bool)

(declare-fun e!102668 () Bool)

(assert (=> b!156967 (= e!102668 tp_is_empty!3199)))

(declare-fun b!156968 () Bool)

(declare-fun res!74208 () Bool)

(declare-fun e!102667 () Bool)

(assert (=> b!156968 (=> (not res!74208) (not e!102667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156968 (= res!74208 (validMask!0 (mask!7617 thiss!1248)))))

(declare-fun b!156969 () Bool)

(assert (=> b!156969 (= e!102667 false)))

(declare-fun lt!81610 () Bool)

(declare-datatypes ((List!1866 0))(
  ( (Nil!1863) (Cons!1862 (h!2471 (_ BitVec 64)) (t!6668 List!1866)) )
))
(declare-fun arrayNoDuplicates!0 (array!5451 (_ BitVec 32) List!1866) Bool)

(assert (=> b!156969 (= lt!81610 (arrayNoDuplicates!0 (_keys!4927 thiss!1248) #b00000000000000000000000000000000 Nil!1863))))

(declare-fun b!156970 () Bool)

(declare-fun e!102669 () Bool)

(assert (=> b!156970 (= e!102669 tp_is_empty!3199)))

(declare-fun b!156971 () Bool)

(declare-fun res!74209 () Bool)

(assert (=> b!156971 (=> (not res!74209) (not e!102667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5451 (_ BitVec 32)) Bool)

(assert (=> b!156971 (= res!74209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4927 thiss!1248) (mask!7617 thiss!1248)))))

(declare-fun b!156972 () Bool)

(declare-fun res!74210 () Bool)

(assert (=> b!156972 (=> (not res!74210) (not e!102667))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156972 (= res!74210 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156973 () Bool)

(assert (=> b!156973 (= e!102666 (and e!102669 mapRes!5441))))

(declare-fun condMapEmpty!5441 () Bool)

(declare-fun mapDefault!5441 () ValueCell!1256)

