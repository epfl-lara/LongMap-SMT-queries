; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16282 () Bool)

(assert start!16282)

(declare-fun b!162434 () Bool)

(declare-fun b_free!3743 () Bool)

(declare-fun b_next!3743 () Bool)

(assert (=> b!162434 (= b_free!3743 (not b_next!3743))))

(declare-fun tp!13798 () Bool)

(declare-fun b_and!10157 () Bool)

(assert (=> b!162434 (= tp!13798 b_and!10157)))

(declare-fun b!162433 () Bool)

(declare-fun res!76919 () Bool)

(declare-fun e!106450 () Bool)

(assert (=> b!162433 (=> (not res!76919) (not e!106450))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162433 (= res!76919 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3545 () Bool)

(declare-fun e!106455 () Bool)

(declare-fun e!106449 () Bool)

(declare-datatypes ((V!4373 0))(
  ( (V!4374 (val!1817 Int)) )
))
(declare-datatypes ((ValueCell!1429 0))(
  ( (ValueCellFull!1429 (v!3682 V!4373)) (EmptyCell!1429) )
))
(declare-datatypes ((array!6169 0))(
  ( (array!6170 (arr!2929 (Array (_ BitVec 32) (_ BitVec 64))) (size!3213 (_ BitVec 32))) )
))
(declare-datatypes ((array!6171 0))(
  ( (array!6172 (arr!2930 (Array (_ BitVec 32) ValueCell!1429)) (size!3214 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1766 0))(
  ( (LongMapFixedSize!1767 (defaultEntry!3325 Int) (mask!7947 (_ BitVec 32)) (extraKeys!3066 (_ BitVec 32)) (zeroValue!3168 V!4373) (minValue!3168 V!4373) (_size!932 (_ BitVec 32)) (_keys!5126 array!6169) (_values!3308 array!6171) (_vacant!932 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1766)

(declare-fun array_inv!1875 (array!6169) Bool)

(declare-fun array_inv!1876 (array!6171) Bool)

(assert (=> b!162434 (= e!106455 (and tp!13798 tp_is_empty!3545 (array_inv!1875 (_keys!5126 thiss!1248)) (array_inv!1876 (_values!3308 thiss!1248)) e!106449))))

(declare-fun mapIsEmpty!6005 () Bool)

(declare-fun mapRes!6005 () Bool)

(assert (=> mapIsEmpty!6005 mapRes!6005))

(declare-fun res!76918 () Bool)

(assert (=> start!16282 (=> (not res!76918) (not e!106450))))

(declare-fun valid!799 (LongMapFixedSize!1766) Bool)

(assert (=> start!16282 (= res!76918 (valid!799 thiss!1248))))

(assert (=> start!16282 e!106450))

(assert (=> start!16282 e!106455))

(assert (=> start!16282 true))

(assert (=> start!16282 tp_is_empty!3545))

(declare-fun b!162435 () Bool)

(declare-fun e!106452 () Bool)

(assert (=> b!162435 (= e!106452 tp_is_empty!3545)))

(declare-fun mapNonEmpty!6005 () Bool)

(declare-fun tp!13799 () Bool)

(assert (=> mapNonEmpty!6005 (= mapRes!6005 (and tp!13799 e!106452))))

(declare-fun mapValue!6005 () ValueCell!1429)

(declare-fun mapKey!6005 () (_ BitVec 32))

(declare-fun mapRest!6005 () (Array (_ BitVec 32) ValueCell!1429))

(assert (=> mapNonEmpty!6005 (= (arr!2930 (_values!3308 thiss!1248)) (store mapRest!6005 mapKey!6005 mapValue!6005))))

(declare-fun b!162436 () Bool)

(declare-fun e!106453 () Bool)

(assert (=> b!162436 (= e!106449 (and e!106453 mapRes!6005))))

(declare-fun condMapEmpty!6005 () Bool)

(declare-fun mapDefault!6005 () ValueCell!1429)

