; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71378 () Bool)

(assert start!71378)

(declare-fun b_free!13459 () Bool)

(declare-fun b_next!13459 () Bool)

(assert (=> start!71378 (= b_free!13459 (not b_next!13459))))

(declare-fun tp!47151 () Bool)

(declare-fun b_and!22441 () Bool)

(assert (=> start!71378 (= tp!47151 b_and!22441)))

(declare-fun b!828981 () Bool)

(declare-fun e!462022 () Bool)

(declare-fun e!462021 () Bool)

(declare-fun mapRes!24394 () Bool)

(assert (=> b!828981 (= e!462022 (and e!462021 mapRes!24394))))

(declare-fun condMapEmpty!24394 () Bool)

(declare-datatypes ((V!25227 0))(
  ( (V!25228 (val!7632 Int)) )
))
(declare-datatypes ((ValueCell!7169 0))(
  ( (ValueCellFull!7169 (v!10070 V!25227)) (EmptyCell!7169) )
))
(declare-datatypes ((array!46502 0))(
  ( (array!46503 (arr!22291 (Array (_ BitVec 32) ValueCell!7169)) (size!22712 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46502)

(declare-fun mapDefault!24394 () ValueCell!7169)

