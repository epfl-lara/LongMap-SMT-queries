; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15916 () Bool)

(assert start!15916)

(declare-fun b!158274 () Bool)

(declare-fun b_free!3475 () Bool)

(declare-fun b_next!3475 () Bool)

(assert (=> b!158274 (= b_free!3475 (not b_next!3475))))

(declare-fun tp!12974 () Bool)

(declare-fun b_and!9889 () Bool)

(assert (=> b!158274 (= tp!12974 b_and!9889)))

(declare-fun b!158267 () Bool)

(declare-fun e!103652 () Bool)

(declare-datatypes ((V!4017 0))(
  ( (V!4018 (val!1683 Int)) )
))
(declare-datatypes ((ValueCell!1295 0))(
  ( (ValueCellFull!1295 (v!3548 V!4017)) (EmptyCell!1295) )
))
(declare-datatypes ((array!5621 0))(
  ( (array!5622 (arr!2661 (Array (_ BitVec 32) (_ BitVec 64))) (size!2943 (_ BitVec 32))) )
))
(declare-datatypes ((array!5623 0))(
  ( (array!5624 (arr!2662 (Array (_ BitVec 32) ValueCell!1295)) (size!2944 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1498 0))(
  ( (LongMapFixedSize!1499 (defaultEntry!3191 Int) (mask!7702 (_ BitVec 32)) (extraKeys!2932 (_ BitVec 32)) (zeroValue!3034 V!4017) (minValue!3034 V!4017) (_size!798 (_ BitVec 32)) (_keys!4977 array!5621) (_values!3174 array!5623) (_vacant!798 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1498)

(assert (=> b!158267 (= e!103652 (and (= (size!2944 (_values!3174 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7702 thiss!1248))) (= (size!2943 (_keys!4977 thiss!1248)) (size!2944 (_values!3174 thiss!1248))) (bvslt (mask!7702 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!158268 () Bool)

(declare-fun res!74758 () Bool)

(assert (=> b!158268 (=> (not res!74758) (not e!103652))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158268 (= res!74758 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158269 () Bool)

(declare-fun res!74759 () Bool)

(assert (=> b!158269 (=> (not res!74759) (not e!103652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158269 (= res!74759 (validMask!0 (mask!7702 thiss!1248)))))

(declare-fun mapNonEmpty!5583 () Bool)

(declare-fun mapRes!5583 () Bool)

(declare-fun tp!12975 () Bool)

(declare-fun e!103653 () Bool)

(assert (=> mapNonEmpty!5583 (= mapRes!5583 (and tp!12975 e!103653))))

(declare-fun mapValue!5583 () ValueCell!1295)

(declare-fun mapKey!5583 () (_ BitVec 32))

(declare-fun mapRest!5583 () (Array (_ BitVec 32) ValueCell!1295))

(assert (=> mapNonEmpty!5583 (= (arr!2662 (_values!3174 thiss!1248)) (store mapRest!5583 mapKey!5583 mapValue!5583))))

(declare-fun b!158270 () Bool)

(declare-fun tp_is_empty!3277 () Bool)

(assert (=> b!158270 (= e!103653 tp_is_empty!3277)))

(declare-fun b!158271 () Bool)

(declare-fun e!103651 () Bool)

(assert (=> b!158271 (= e!103651 tp_is_empty!3277)))

(declare-fun b!158272 () Bool)

(declare-fun e!103654 () Bool)

(assert (=> b!158272 (= e!103654 (and e!103651 mapRes!5583))))

(declare-fun condMapEmpty!5583 () Bool)

(declare-fun mapDefault!5583 () ValueCell!1295)

