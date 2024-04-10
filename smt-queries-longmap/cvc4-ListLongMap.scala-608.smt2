; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15844 () Bool)

(assert start!15844)

(declare-fun b!157802 () Bool)

(declare-fun b_free!3461 () Bool)

(declare-fun b_next!3461 () Bool)

(assert (=> b!157802 (= b_free!3461 (not b_next!3461))))

(declare-fun tp!12922 () Bool)

(declare-fun b_and!9875 () Bool)

(assert (=> b!157802 (= tp!12922 b_and!9875)))

(declare-fun b!157799 () Bool)

(declare-fun e!103360 () Bool)

(declare-fun tp_is_empty!3263 () Bool)

(assert (=> b!157799 (= e!103360 tp_is_empty!3263)))

(declare-fun b!157800 () Bool)

(declare-fun e!103358 () Bool)

(declare-datatypes ((V!3997 0))(
  ( (V!3998 (val!1676 Int)) )
))
(declare-datatypes ((ValueCell!1288 0))(
  ( (ValueCellFull!1288 (v!3541 V!3997)) (EmptyCell!1288) )
))
(declare-datatypes ((array!5587 0))(
  ( (array!5588 (arr!2647 (Array (_ BitVec 32) (_ BitVec 64))) (size!2927 (_ BitVec 32))) )
))
(declare-datatypes ((array!5589 0))(
  ( (array!5590 (arr!2648 (Array (_ BitVec 32) ValueCell!1288)) (size!2928 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1484 0))(
  ( (LongMapFixedSize!1485 (defaultEntry!3184 Int) (mask!7675 (_ BitVec 32)) (extraKeys!2925 (_ BitVec 32)) (zeroValue!3027 V!3997) (minValue!3027 V!3997) (_size!791 (_ BitVec 32)) (_keys!4961 array!5587) (_values!3167 array!5589) (_vacant!791 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1484)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157800 (= e!103358 (not (validMask!0 (mask!7675 thiss!1248))))))

(declare-fun b!157801 () Bool)

(declare-fun res!74574 () Bool)

(assert (=> b!157801 (=> (not res!74574) (not e!103358))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157801 (= res!74574 (not (= key!828 (bvneg key!828))))))

(declare-fun e!103361 () Bool)

(declare-fun e!103362 () Bool)

(declare-fun array_inv!1685 (array!5587) Bool)

(declare-fun array_inv!1686 (array!5589) Bool)

(assert (=> b!157802 (= e!103362 (and tp!12922 tp_is_empty!3263 (array_inv!1685 (_keys!4961 thiss!1248)) (array_inv!1686 (_values!3167 thiss!1248)) e!103361))))

(declare-fun b!157803 () Bool)

(declare-fun e!103363 () Bool)

(declare-fun mapRes!5551 () Bool)

(assert (=> b!157803 (= e!103361 (and e!103363 mapRes!5551))))

(declare-fun condMapEmpty!5551 () Bool)

(declare-fun mapDefault!5551 () ValueCell!1288)

