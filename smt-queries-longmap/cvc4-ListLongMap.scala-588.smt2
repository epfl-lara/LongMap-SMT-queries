; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15674 () Bool)

(assert start!15674)

(declare-fun b!156210 () Bool)

(declare-fun b_free!3341 () Bool)

(declare-fun b_next!3341 () Bool)

(assert (=> b!156210 (= b_free!3341 (not b_next!3341))))

(declare-fun tp!12547 () Bool)

(declare-fun b_and!9755 () Bool)

(assert (=> b!156210 (= tp!12547 b_and!9755)))

(declare-fun tp_is_empty!3143 () Bool)

(declare-fun e!102161 () Bool)

(declare-fun e!102163 () Bool)

(declare-datatypes ((V!3837 0))(
  ( (V!3838 (val!1616 Int)) )
))
(declare-datatypes ((ValueCell!1228 0))(
  ( (ValueCellFull!1228 (v!3481 V!3837)) (EmptyCell!1228) )
))
(declare-datatypes ((array!5339 0))(
  ( (array!5340 (arr!2527 (Array (_ BitVec 32) (_ BitVec 64))) (size!2805 (_ BitVec 32))) )
))
(declare-datatypes ((array!5341 0))(
  ( (array!5342 (arr!2528 (Array (_ BitVec 32) ValueCell!1228)) (size!2806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1364 0))(
  ( (LongMapFixedSize!1365 (defaultEntry!3124 Int) (mask!7569 (_ BitVec 32)) (extraKeys!2865 (_ BitVec 32)) (zeroValue!2967 V!3837) (minValue!2967 V!3837) (_size!731 (_ BitVec 32)) (_keys!4899 array!5339) (_values!3107 array!5341) (_vacant!731 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1364)

(declare-fun array_inv!1597 (array!5339) Bool)

(declare-fun array_inv!1598 (array!5341) Bool)

(assert (=> b!156210 (= e!102161 (and tp!12547 tp_is_empty!3143 (array_inv!1597 (_keys!4899 thiss!1248)) (array_inv!1598 (_values!3107 thiss!1248)) e!102163))))

(declare-fun b!156211 () Bool)

(declare-fun e!102160 () Bool)

(assert (=> b!156211 (= e!102160 tp_is_empty!3143)))

(declare-fun b!156212 () Bool)

(declare-fun res!73790 () Bool)

(declare-fun e!102165 () Bool)

(assert (=> b!156212 (=> (not res!73790) (not e!102165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156212 (= res!73790 (validMask!0 (mask!7569 thiss!1248)))))

(declare-fun b!156213 () Bool)

(declare-fun res!73788 () Bool)

(assert (=> b!156213 (=> (not res!73788) (not e!102165))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156213 (= res!73788 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5357 () Bool)

(declare-fun mapRes!5357 () Bool)

(assert (=> mapIsEmpty!5357 mapRes!5357))

(declare-fun b!156214 () Bool)

(declare-fun res!73791 () Bool)

(assert (=> b!156214 (=> (not res!73791) (not e!102165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5339 (_ BitVec 32)) Bool)

(assert (=> b!156214 (= res!73791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4899 thiss!1248) (mask!7569 thiss!1248)))))

(declare-fun b!156215 () Bool)

(declare-fun e!102162 () Bool)

(assert (=> b!156215 (= e!102162 tp_is_empty!3143)))

(declare-fun mapNonEmpty!5357 () Bool)

(declare-fun tp!12548 () Bool)

(assert (=> mapNonEmpty!5357 (= mapRes!5357 (and tp!12548 e!102160))))

(declare-fun mapRest!5357 () (Array (_ BitVec 32) ValueCell!1228))

(declare-fun mapValue!5357 () ValueCell!1228)

(declare-fun mapKey!5357 () (_ BitVec 32))

(assert (=> mapNonEmpty!5357 (= (arr!2528 (_values!3107 thiss!1248)) (store mapRest!5357 mapKey!5357 mapValue!5357))))

(declare-fun res!73792 () Bool)

(assert (=> start!15674 (=> (not res!73792) (not e!102165))))

(declare-fun valid!662 (LongMapFixedSize!1364) Bool)

(assert (=> start!15674 (= res!73792 (valid!662 thiss!1248))))

(assert (=> start!15674 e!102165))

(assert (=> start!15674 e!102161))

(assert (=> start!15674 true))

(declare-fun b!156216 () Bool)

(assert (=> b!156216 (= e!102163 (and e!102162 mapRes!5357))))

(declare-fun condMapEmpty!5357 () Bool)

(declare-fun mapDefault!5357 () ValueCell!1228)

