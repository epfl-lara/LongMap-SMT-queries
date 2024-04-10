; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16328 () Bool)

(assert start!16328)

(declare-fun b!162891 () Bool)

(declare-fun b_free!3779 () Bool)

(declare-fun b_next!3779 () Bool)

(assert (=> b!162891 (= b_free!3779 (not b_next!3779))))

(declare-fun tp!13910 () Bool)

(declare-fun b_and!10193 () Bool)

(assert (=> b!162891 (= tp!13910 b_and!10193)))

(declare-fun b!162890 () Bool)

(declare-fun res!77132 () Bool)

(declare-fun e!106864 () Bool)

(assert (=> b!162890 (=> (not res!77132) (not e!106864))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162890 (= res!77132 (not (= key!828 (bvneg key!828))))))

(declare-fun e!106868 () Bool)

(declare-fun e!106869 () Bool)

(declare-fun tp_is_empty!3581 () Bool)

(declare-datatypes ((V!4421 0))(
  ( (V!4422 (val!1835 Int)) )
))
(declare-datatypes ((ValueCell!1447 0))(
  ( (ValueCellFull!1447 (v!3700 V!4421)) (EmptyCell!1447) )
))
(declare-datatypes ((array!6243 0))(
  ( (array!6244 (arr!2965 (Array (_ BitVec 32) (_ BitVec 64))) (size!3249 (_ BitVec 32))) )
))
(declare-datatypes ((array!6245 0))(
  ( (array!6246 (arr!2966 (Array (_ BitVec 32) ValueCell!1447)) (size!3250 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1802 0))(
  ( (LongMapFixedSize!1803 (defaultEntry!3343 Int) (mask!7979 (_ BitVec 32)) (extraKeys!3084 (_ BitVec 32)) (zeroValue!3186 V!4421) (minValue!3186 V!4421) (_size!950 (_ BitVec 32)) (_keys!5145 array!6243) (_values!3326 array!6245) (_vacant!950 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1802)

(declare-fun array_inv!1895 (array!6243) Bool)

(declare-fun array_inv!1896 (array!6245) Bool)

(assert (=> b!162891 (= e!106868 (and tp!13910 tp_is_empty!3581 (array_inv!1895 (_keys!5145 thiss!1248)) (array_inv!1896 (_values!3326 thiss!1248)) e!106869))))

(declare-fun mapIsEmpty!6062 () Bool)

(declare-fun mapRes!6062 () Bool)

(assert (=> mapIsEmpty!6062 mapRes!6062))

(declare-fun mapNonEmpty!6062 () Bool)

(declare-fun tp!13909 () Bool)

(declare-fun e!106865 () Bool)

(assert (=> mapNonEmpty!6062 (= mapRes!6062 (and tp!13909 e!106865))))

(declare-fun mapValue!6062 () ValueCell!1447)

(declare-fun mapKey!6062 () (_ BitVec 32))

(declare-fun mapRest!6062 () (Array (_ BitVec 32) ValueCell!1447))

(assert (=> mapNonEmpty!6062 (= (arr!2966 (_values!3326 thiss!1248)) (store mapRest!6062 mapKey!6062 mapValue!6062))))

(declare-fun b!162892 () Bool)

(declare-fun e!106867 () Bool)

(assert (=> b!162892 (= e!106869 (and e!106867 mapRes!6062))))

(declare-fun condMapEmpty!6062 () Bool)

(declare-fun mapDefault!6062 () ValueCell!1447)

