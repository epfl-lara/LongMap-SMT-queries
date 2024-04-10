; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16258 () Bool)

(assert start!16258)

(declare-fun b!162209 () Bool)

(declare-fun b_free!3719 () Bool)

(declare-fun b_next!3719 () Bool)

(assert (=> b!162209 (= b_free!3719 (not b_next!3719))))

(declare-fun tp!13726 () Bool)

(declare-fun b_and!10133 () Bool)

(assert (=> b!162209 (= tp!13726 b_and!10133)))

(declare-fun e!106225 () Bool)

(declare-fun e!106227 () Bool)

(declare-fun tp_is_empty!3521 () Bool)

(declare-datatypes ((V!4341 0))(
  ( (V!4342 (val!1805 Int)) )
))
(declare-datatypes ((ValueCell!1417 0))(
  ( (ValueCellFull!1417 (v!3670 V!4341)) (EmptyCell!1417) )
))
(declare-datatypes ((array!6121 0))(
  ( (array!6122 (arr!2905 (Array (_ BitVec 32) (_ BitVec 64))) (size!3189 (_ BitVec 32))) )
))
(declare-datatypes ((array!6123 0))(
  ( (array!6124 (arr!2906 (Array (_ BitVec 32) ValueCell!1417)) (size!3190 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1742 0))(
  ( (LongMapFixedSize!1743 (defaultEntry!3313 Int) (mask!7927 (_ BitVec 32)) (extraKeys!3054 (_ BitVec 32)) (zeroValue!3156 V!4341) (minValue!3156 V!4341) (_size!920 (_ BitVec 32)) (_keys!5114 array!6121) (_values!3296 array!6123) (_vacant!920 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1742)

(declare-fun array_inv!1859 (array!6121) Bool)

(declare-fun array_inv!1860 (array!6123) Bool)

(assert (=> b!162209 (= e!106227 (and tp!13726 tp_is_empty!3521 (array_inv!1859 (_keys!5114 thiss!1248)) (array_inv!1860 (_values!3296 thiss!1248)) e!106225))))

(declare-fun b!162210 () Bool)

(declare-fun e!106230 () Bool)

(assert (=> b!162210 (= e!106230 tp_is_empty!3521)))

(declare-fun b!162211 () Bool)

(declare-fun res!76837 () Bool)

(declare-fun e!106226 () Bool)

(assert (=> b!162211 (=> (not res!76837) (not e!106226))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162211 (= res!76837 (not (= key!828 (bvneg key!828))))))

(declare-fun b!162212 () Bool)

(declare-fun e!106229 () Bool)

(declare-fun mapRes!5969 () Bool)

(assert (=> b!162212 (= e!106225 (and e!106229 mapRes!5969))))

(declare-fun condMapEmpty!5969 () Bool)

(declare-fun mapDefault!5969 () ValueCell!1417)

