; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72590 () Bool)

(assert start!72590)

(declare-fun b!842660 () Bool)

(declare-fun e!470047 () Bool)

(declare-fun e!470044 () Bool)

(declare-fun mapRes!25061 () Bool)

(assert (=> b!842660 (= e!470047 (and e!470044 mapRes!25061))))

(declare-fun condMapEmpty!25061 () Bool)

(declare-datatypes ((V!25901 0))(
  ( (V!25902 (val!7868 Int)) )
))
(declare-datatypes ((ValueCell!7381 0))(
  ( (ValueCellFull!7381 (v!10293 V!25901)) (EmptyCell!7381) )
))
(declare-datatypes ((array!47552 0))(
  ( (array!47553 (arr!22807 (Array (_ BitVec 32) ValueCell!7381)) (size!23247 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47552)

(declare-fun mapDefault!25061 () ValueCell!7381)

