; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72886 () Bool)

(assert start!72886)

(declare-fun b_free!13801 () Bool)

(declare-fun b_next!13801 () Bool)

(assert (=> start!72886 (= b_free!13801 (not b_next!13801))))

(declare-fun tp!48907 () Bool)

(declare-fun b_and!22887 () Bool)

(assert (=> start!72886 (= tp!48907 b_and!22887)))

(declare-fun b!846100 () Bool)

(declare-fun e!472264 () Bool)

(declare-fun e!472263 () Bool)

(declare-fun mapRes!25505 () Bool)

(assert (=> b!846100 (= e!472264 (and e!472263 mapRes!25505))))

(declare-fun condMapEmpty!25505 () Bool)

(declare-datatypes ((V!26297 0))(
  ( (V!26298 (val!8016 Int)) )
))
(declare-datatypes ((ValueCell!7529 0))(
  ( (ValueCellFull!7529 (v!10441 V!26297)) (EmptyCell!7529) )
))
(declare-datatypes ((array!48090 0))(
  ( (array!48091 (arr!23076 (Array (_ BitVec 32) ValueCell!7529)) (size!23516 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48090)

(declare-fun mapDefault!25505 () ValueCell!7529)

