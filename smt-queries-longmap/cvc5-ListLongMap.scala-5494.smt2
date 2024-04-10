; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72748 () Bool)

(assert start!72748)

(declare-fun mapIsEmpty!25298 () Bool)

(declare-fun mapRes!25298 () Bool)

(assert (=> mapIsEmpty!25298 mapRes!25298))

(declare-fun b!844319 () Bool)

(declare-fun e!471229 () Bool)

(declare-fun tp_is_empty!15799 () Bool)

(assert (=> b!844319 (= e!471229 tp_is_empty!15799)))

(declare-fun b!844320 () Bool)

(declare-fun e!471228 () Bool)

(assert (=> b!844320 (= e!471228 (and e!471229 mapRes!25298))))

(declare-fun condMapEmpty!25298 () Bool)

(declare-datatypes ((V!26113 0))(
  ( (V!26114 (val!7947 Int)) )
))
(declare-datatypes ((ValueCell!7460 0))(
  ( (ValueCellFull!7460 (v!10372 V!26113)) (EmptyCell!7460) )
))
(declare-datatypes ((array!47834 0))(
  ( (array!47835 (arr!22948 (Array (_ BitVec 32) ValueCell!7460)) (size!23388 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47834)

(declare-fun mapDefault!25298 () ValueCell!7460)

