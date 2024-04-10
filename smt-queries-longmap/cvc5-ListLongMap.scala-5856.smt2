; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75666 () Bool)

(assert start!75666)

(declare-fun b!889613 () Bool)

(declare-fun b_free!15637 () Bool)

(declare-fun b_next!15637 () Bool)

(assert (=> b!889613 (= b_free!15637 (not b_next!15637))))

(declare-fun tp!54879 () Bool)

(declare-fun b_and!25877 () Bool)

(assert (=> b!889613 (= tp!54879 b_and!25877)))

(declare-fun mapIsEmpty!28502 () Bool)

(declare-fun mapRes!28502 () Bool)

(assert (=> mapIsEmpty!28502 mapRes!28502))

(declare-fun b!889606 () Bool)

(declare-fun e!495916 () Bool)

(declare-fun e!495919 () Bool)

(assert (=> b!889606 (= e!495916 (and e!495919 mapRes!28502))))

(declare-fun condMapEmpty!28502 () Bool)

(declare-datatypes ((array!51910 0))(
  ( (array!51911 (arr!24961 (Array (_ BitVec 32) (_ BitVec 64))) (size!25405 (_ BitVec 32))) )
))
(declare-datatypes ((V!28919 0))(
  ( (V!28920 (val!9033 Int)) )
))
(declare-datatypes ((ValueCell!8501 0))(
  ( (ValueCellFull!8501 (v!11511 V!28919)) (EmptyCell!8501) )
))
(declare-datatypes ((array!51912 0))(
  ( (array!51913 (arr!24962 (Array (_ BitVec 32) ValueCell!8501)) (size!25406 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4018 0))(
  ( (LongMapFixedSize!4019 (defaultEntry!5206 Int) (mask!25659 (_ BitVec 32)) (extraKeys!4900 (_ BitVec 32)) (zeroValue!5004 V!28919) (minValue!5004 V!28919) (_size!2064 (_ BitVec 32)) (_keys!9889 array!51910) (_values!5191 array!51912) (_vacant!2064 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4018)

(declare-fun mapDefault!28502 () ValueCell!8501)

