; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43480 () Bool)

(assert start!43480)

(declare-fun b_free!12259 () Bool)

(declare-fun b_next!12259 () Bool)

(assert (=> start!43480 (= b_free!12259 (not b_next!12259))))

(declare-fun tp!43060 () Bool)

(declare-fun b_and!21019 () Bool)

(assert (=> start!43480 (= tp!43060 b_and!21019)))

(declare-fun b!481747 () Bool)

(declare-fun e!283443 () Bool)

(declare-fun e!283438 () Bool)

(declare-fun mapRes!22366 () Bool)

(assert (=> b!481747 (= e!283443 (and e!283438 mapRes!22366))))

(declare-fun condMapEmpty!22366 () Bool)

(declare-datatypes ((V!19433 0))(
  ( (V!19434 (val!6933 Int)) )
))
(declare-datatypes ((ValueCell!6524 0))(
  ( (ValueCellFull!6524 (v!9226 V!19433)) (EmptyCell!6524) )
))
(declare-datatypes ((array!31205 0))(
  ( (array!31206 (arr!15005 (Array (_ BitVec 32) ValueCell!6524)) (size!15363 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31205)

(declare-fun mapDefault!22366 () ValueCell!6524)

