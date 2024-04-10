; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98628 () Bool)

(assert start!98628)

(declare-fun b_free!24233 () Bool)

(declare-fun b_next!24233 () Bool)

(assert (=> start!98628 (= b_free!24233 (not b_next!24233))))

(declare-fun tp!85410 () Bool)

(declare-fun b_and!39315 () Bool)

(assert (=> start!98628 (= tp!85410 b_and!39315)))

(declare-fun b!1145730 () Bool)

(declare-fun e!651730 () Bool)

(declare-fun e!651728 () Bool)

(declare-fun mapRes!44969 () Bool)

(assert (=> b!1145730 (= e!651730 (and e!651728 mapRes!44969))))

(declare-fun condMapEmpty!44969 () Bool)

(declare-datatypes ((V!43477 0))(
  ( (V!43478 (val!14438 Int)) )
))
(declare-datatypes ((ValueCell!13672 0))(
  ( (ValueCellFull!13672 (v!17075 V!43477)) (EmptyCell!13672) )
))
(declare-datatypes ((array!74377 0))(
  ( (array!74378 (arr!35839 (Array (_ BitVec 32) ValueCell!13672)) (size!36375 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74377)

(declare-fun mapDefault!44969 () ValueCell!13672)

