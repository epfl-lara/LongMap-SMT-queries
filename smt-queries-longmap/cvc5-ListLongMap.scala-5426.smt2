; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72340 () Bool)

(assert start!72340)

(declare-fun b!838091 () Bool)

(declare-fun e!467844 () Bool)

(declare-fun e!467848 () Bool)

(declare-fun mapRes!24686 () Bool)

(assert (=> b!838091 (= e!467844 (and e!467848 mapRes!24686))))

(declare-fun condMapEmpty!24686 () Bool)

(declare-datatypes ((V!25569 0))(
  ( (V!25570 (val!7743 Int)) )
))
(declare-datatypes ((ValueCell!7256 0))(
  ( (ValueCellFull!7256 (v!10168 V!25569)) (EmptyCell!7256) )
))
(declare-datatypes ((array!47074 0))(
  ( (array!47075 (arr!22568 (Array (_ BitVec 32) ValueCell!7256)) (size!23008 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47074)

(declare-fun mapDefault!24686 () ValueCell!7256)

