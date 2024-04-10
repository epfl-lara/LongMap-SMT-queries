; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72880 () Bool)

(assert start!72880)

(declare-fun b_free!13795 () Bool)

(declare-fun b_next!13795 () Bool)

(assert (=> start!72880 (= b_free!13795 (not b_next!13795))))

(declare-fun tp!48889 () Bool)

(declare-fun b_and!22881 () Bool)

(assert (=> start!72880 (= tp!48889 b_and!22881)))

(declare-fun b!846001 () Bool)

(declare-fun e!472221 () Bool)

(declare-fun e!472220 () Bool)

(declare-fun mapRes!25496 () Bool)

(assert (=> b!846001 (= e!472221 (and e!472220 mapRes!25496))))

(declare-fun condMapEmpty!25496 () Bool)

(declare-datatypes ((V!26289 0))(
  ( (V!26290 (val!8013 Int)) )
))
(declare-datatypes ((ValueCell!7526 0))(
  ( (ValueCellFull!7526 (v!10438 V!26289)) (EmptyCell!7526) )
))
(declare-datatypes ((array!48080 0))(
  ( (array!48081 (arr!23071 (Array (_ BitVec 32) ValueCell!7526)) (size!23511 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48080)

(declare-fun mapDefault!25496 () ValueCell!7526)

