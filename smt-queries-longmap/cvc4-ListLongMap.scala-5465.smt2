; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72578 () Bool)

(assert start!72578)

(declare-fun b!842534 () Bool)

(declare-fun e!469955 () Bool)

(declare-fun e!469956 () Bool)

(declare-fun mapRes!25043 () Bool)

(assert (=> b!842534 (= e!469955 (and e!469956 mapRes!25043))))

(declare-fun condMapEmpty!25043 () Bool)

(declare-datatypes ((V!25885 0))(
  ( (V!25886 (val!7862 Int)) )
))
(declare-datatypes ((ValueCell!7375 0))(
  ( (ValueCellFull!7375 (v!10287 V!25885)) (EmptyCell!7375) )
))
(declare-datatypes ((array!47532 0))(
  ( (array!47533 (arr!22797 (Array (_ BitVec 32) ValueCell!7375)) (size!23237 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47532)

(declare-fun mapDefault!25043 () ValueCell!7375)

