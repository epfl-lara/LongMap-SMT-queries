; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132004 () Bool)

(assert start!132004)

(declare-fun b_free!31717 () Bool)

(declare-fun b_next!31717 () Bool)

(assert (=> start!132004 (= b_free!31717 (not b_next!31717))))

(declare-fun tp!111403 () Bool)

(declare-fun b_and!51127 () Bool)

(assert (=> start!132004 (= tp!111403 b_and!51127)))

(declare-fun b!1546649 () Bool)

(declare-fun e!860910 () Bool)

(declare-fun e!860908 () Bool)

(declare-fun mapRes!58693 () Bool)

(assert (=> b!1546649 (= e!860910 (and e!860908 mapRes!58693))))

(declare-fun condMapEmpty!58693 () Bool)

(declare-datatypes ((V!59101 0))(
  ( (V!59102 (val!19074 Int)) )
))
(declare-datatypes ((ValueCell!18086 0))(
  ( (ValueCellFull!18086 (v!21875 V!59101)) (EmptyCell!18086) )
))
(declare-datatypes ((array!103192 0))(
  ( (array!103193 (arr!49798 (Array (_ BitVec 32) ValueCell!18086)) (size!50348 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103192)

(declare-fun mapDefault!58693 () ValueCell!18086)

