; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109012 () Bool)

(assert start!109012)

(declare-fun b_free!28501 () Bool)

(declare-fun b_next!28501 () Bool)

(assert (=> start!109012 (= b_free!28501 (not b_next!28501))))

(declare-fun tp!100621 () Bool)

(declare-fun b_and!46591 () Bool)

(assert (=> start!109012 (= tp!100621 b_and!46591)))

(declare-fun b!1288301 () Bool)

(declare-fun e!735650 () Bool)

(declare-fun e!735647 () Bool)

(declare-fun mapRes!52772 () Bool)

(assert (=> b!1288301 (= e!735650 (and e!735647 mapRes!52772))))

(declare-fun condMapEmpty!52772 () Bool)

(declare-datatypes ((V!50625 0))(
  ( (V!50626 (val!17145 Int)) )
))
(declare-datatypes ((ValueCell!16172 0))(
  ( (ValueCellFull!16172 (v!19748 V!50625)) (EmptyCell!16172) )
))
(declare-datatypes ((array!85330 0))(
  ( (array!85331 (arr!41166 (Array (_ BitVec 32) ValueCell!16172)) (size!41716 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85330)

(declare-fun mapDefault!52772 () ValueCell!16172)

