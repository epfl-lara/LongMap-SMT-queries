; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72692 () Bool)

(assert start!72692)

(declare-fun b!843731 () Bool)

(declare-fun e!470810 () Bool)

(declare-fun e!470808 () Bool)

(declare-fun mapRes!25214 () Bool)

(assert (=> b!843731 (= e!470810 (and e!470808 mapRes!25214))))

(declare-fun condMapEmpty!25214 () Bool)

(declare-datatypes ((V!26037 0))(
  ( (V!26038 (val!7919 Int)) )
))
(declare-datatypes ((ValueCell!7432 0))(
  ( (ValueCellFull!7432 (v!10344 V!26037)) (EmptyCell!7432) )
))
(declare-datatypes ((array!47732 0))(
  ( (array!47733 (arr!22897 (Array (_ BitVec 32) ValueCell!7432)) (size!23337 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47732)

(declare-fun mapDefault!25214 () ValueCell!7432)

