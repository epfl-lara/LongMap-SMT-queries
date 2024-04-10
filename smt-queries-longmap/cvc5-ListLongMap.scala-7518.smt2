; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95332 () Bool)

(assert start!95332)

(declare-fun b!1077052 () Bool)

(declare-fun e!615768 () Bool)

(declare-datatypes ((array!69115 0))(
  ( (array!69116 (arr!33239 (Array (_ BitVec 32) (_ BitVec 64))) (size!33775 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69115)

(assert (=> b!1077052 (= e!615768 (bvsgt #b00000000000000000000000000000000 (size!33775 _keys!1070)))))

(declare-fun mapIsEmpty!40855 () Bool)

(declare-fun mapRes!40855 () Bool)

(assert (=> mapIsEmpty!40855 mapRes!40855))

(declare-fun b!1077053 () Bool)

(declare-fun e!615765 () Bool)

(declare-fun e!615767 () Bool)

(assert (=> b!1077053 (= e!615765 (and e!615767 mapRes!40855))))

(declare-fun condMapEmpty!40855 () Bool)

(declare-datatypes ((V!39905 0))(
  ( (V!39906 (val!13098 Int)) )
))
(declare-datatypes ((ValueCell!12332 0))(
  ( (ValueCellFull!12332 (v!15717 V!39905)) (EmptyCell!12332) )
))
(declare-datatypes ((array!69117 0))(
  ( (array!69118 (arr!33240 (Array (_ BitVec 32) ValueCell!12332)) (size!33776 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69117)

(declare-fun mapDefault!40855 () ValueCell!12332)

