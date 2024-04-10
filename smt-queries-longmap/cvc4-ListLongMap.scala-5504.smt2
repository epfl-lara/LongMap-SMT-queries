; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72812 () Bool)

(assert start!72812)

(declare-fun b!844991 () Bool)

(declare-fun e!471709 () Bool)

(declare-fun e!471708 () Bool)

(declare-fun mapRes!25394 () Bool)

(assert (=> b!844991 (= e!471709 (and e!471708 mapRes!25394))))

(declare-fun condMapEmpty!25394 () Bool)

(declare-datatypes ((V!26197 0))(
  ( (V!26198 (val!7979 Int)) )
))
(declare-datatypes ((ValueCell!7492 0))(
  ( (ValueCellFull!7492 (v!10404 V!26197)) (EmptyCell!7492) )
))
(declare-datatypes ((array!47952 0))(
  ( (array!47953 (arr!23007 (Array (_ BitVec 32) ValueCell!7492)) (size!23447 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47952)

(declare-fun mapDefault!25394 () ValueCell!7492)

