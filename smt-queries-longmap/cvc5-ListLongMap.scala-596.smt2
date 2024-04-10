; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15718 () Bool)

(assert start!15718)

(declare-fun b!156805 () Bool)

(declare-fun b_free!3385 () Bool)

(declare-fun b_next!3385 () Bool)

(assert (=> b!156805 (= b_free!3385 (not b_next!3385))))

(declare-fun tp!12679 () Bool)

(declare-fun b_and!9799 () Bool)

(assert (=> b!156805 (= tp!12679 b_and!9799)))

(declare-fun mapNonEmpty!5423 () Bool)

(declare-fun mapRes!5423 () Bool)

(declare-fun tp!12680 () Bool)

(declare-fun e!102559 () Bool)

(assert (=> mapNonEmpty!5423 (= mapRes!5423 (and tp!12680 e!102559))))

(declare-fun mapKey!5423 () (_ BitVec 32))

(declare-datatypes ((V!3897 0))(
  ( (V!3898 (val!1638 Int)) )
))
(declare-datatypes ((ValueCell!1250 0))(
  ( (ValueCellFull!1250 (v!3503 V!3897)) (EmptyCell!1250) )
))
(declare-fun mapValue!5423 () ValueCell!1250)

(declare-datatypes ((array!5427 0))(
  ( (array!5428 (arr!2571 (Array (_ BitVec 32) (_ BitVec 64))) (size!2849 (_ BitVec 32))) )
))
(declare-datatypes ((array!5429 0))(
  ( (array!5430 (arr!2572 (Array (_ BitVec 32) ValueCell!1250)) (size!2850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1408 0))(
  ( (LongMapFixedSize!1409 (defaultEntry!3146 Int) (mask!7607 (_ BitVec 32)) (extraKeys!2887 (_ BitVec 32)) (zeroValue!2989 V!3897) (minValue!2989 V!3897) (_size!753 (_ BitVec 32)) (_keys!4921 array!5427) (_values!3129 array!5429) (_vacant!753 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1408)

(declare-fun mapRest!5423 () (Array (_ BitVec 32) ValueCell!1250))

(assert (=> mapNonEmpty!5423 (= (arr!2572 (_values!3129 thiss!1248)) (store mapRest!5423 mapKey!5423 mapValue!5423))))

(declare-fun b!156804 () Bool)

(declare-fun res!74121 () Bool)

(declare-fun e!102560 () Bool)

(assert (=> b!156804 (=> (not res!74121) (not e!102560))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156804 (= res!74121 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!3187 () Bool)

(declare-fun e!102556 () Bool)

(declare-fun e!102557 () Bool)

(declare-fun array_inv!1623 (array!5427) Bool)

(declare-fun array_inv!1624 (array!5429) Bool)

(assert (=> b!156805 (= e!102557 (and tp!12679 tp_is_empty!3187 (array_inv!1623 (_keys!4921 thiss!1248)) (array_inv!1624 (_values!3129 thiss!1248)) e!102556))))

(declare-fun b!156806 () Bool)

(declare-fun res!74118 () Bool)

(assert (=> b!156806 (=> (not res!74118) (not e!102560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5427 (_ BitVec 32)) Bool)

(assert (=> b!156806 (= res!74118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4921 thiss!1248) (mask!7607 thiss!1248)))))

(declare-fun b!156807 () Bool)

(declare-fun e!102561 () Bool)

(assert (=> b!156807 (= e!102556 (and e!102561 mapRes!5423))))

(declare-fun condMapEmpty!5423 () Bool)

(declare-fun mapDefault!5423 () ValueCell!1250)

