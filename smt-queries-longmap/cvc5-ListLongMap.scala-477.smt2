; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9752 () Bool)

(assert start!9752)

(declare-fun b!72825 () Bool)

(declare-fun b_free!2113 () Bool)

(declare-fun b_next!2113 () Bool)

(assert (=> b!72825 (= b_free!2113 (not b_next!2113))))

(declare-fun tp!8517 () Bool)

(declare-fun b_and!4467 () Bool)

(assert (=> b!72825 (= tp!8517 b_and!4467)))

(declare-fun b!72815 () Bool)

(declare-fun b_free!2115 () Bool)

(declare-fun b_next!2115 () Bool)

(assert (=> b!72815 (= b_free!2115 (not b_next!2115))))

(declare-fun tp!8518 () Bool)

(declare-fun b_and!4469 () Bool)

(assert (=> b!72815 (= tp!8518 b_and!4469)))

(declare-fun b!72809 () Bool)

(declare-fun e!47629 () Bool)

(declare-fun e!47634 () Bool)

(declare-fun mapRes!3165 () Bool)

(assert (=> b!72809 (= e!47629 (and e!47634 mapRes!3165))))

(declare-fun condMapEmpty!3166 () Bool)

(declare-datatypes ((V!2945 0))(
  ( (V!2946 (val!1281 Int)) )
))
(declare-datatypes ((array!3891 0))(
  ( (array!3892 (arr!1857 (Array (_ BitVec 32) (_ BitVec 64))) (size!2095 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!893 0))(
  ( (ValueCellFull!893 (v!2527 V!2945)) (EmptyCell!893) )
))
(declare-datatypes ((array!3893 0))(
  ( (array!3894 (arr!1858 (Array (_ BitVec 32) ValueCell!893)) (size!2096 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!694 0))(
  ( (LongMapFixedSize!695 (defaultEntry!2212 Int) (mask!6179 (_ BitVec 32)) (extraKeys!2071 (_ BitVec 32)) (zeroValue!2114 V!2945) (minValue!2114 V!2945) (_size!396 (_ BitVec 32)) (_keys!3864 array!3891) (_values!2195 array!3893) (_vacant!396 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!496 0))(
  ( (Cell!497 (v!2528 LongMapFixedSize!694)) )
))
(declare-datatypes ((LongMap!496 0))(
  ( (LongMap!497 (underlying!259 Cell!496)) )
))
(declare-fun thiss!992 () LongMap!496)

(declare-fun mapDefault!3166 () ValueCell!893)

