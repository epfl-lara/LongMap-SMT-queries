; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82284 () Bool)

(assert start!82284)

(declare-fun b_free!18557 () Bool)

(declare-fun b_next!18557 () Bool)

(assert (=> start!82284 (= b_free!18557 (not b_next!18557))))

(declare-fun tp!64632 () Bool)

(declare-fun b_and!30045 () Bool)

(assert (=> start!82284 (= tp!64632 b_and!30045)))

(declare-fun b!959243 () Bool)

(declare-fun e!540747 () Bool)

(declare-fun e!540749 () Bool)

(declare-fun mapRes!33874 () Bool)

(assert (=> b!959243 (= e!540747 (and e!540749 mapRes!33874))))

(declare-fun condMapEmpty!33874 () Bool)

(declare-datatypes ((V!33333 0))(
  ( (V!33334 (val!10682 Int)) )
))
(declare-datatypes ((ValueCell!10150 0))(
  ( (ValueCellFull!10150 (v!13239 V!33333)) (EmptyCell!10150) )
))
(declare-datatypes ((array!58623 0))(
  ( (array!58624 (arr!28185 (Array (_ BitVec 32) ValueCell!10150)) (size!28664 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58623)

(declare-fun mapDefault!33874 () ValueCell!10150)

