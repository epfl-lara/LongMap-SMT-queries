; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111650 () Bool)

(assert start!111650)

(declare-fun b_free!30307 () Bool)

(declare-fun b_next!30307 () Bool)

(assert (=> start!111650 (= b_free!30307 (not b_next!30307))))

(declare-fun tp!106397 () Bool)

(declare-fun b_and!48773 () Bool)

(assert (=> start!111650 (= tp!106397 b_and!48773)))

(declare-fun b!1322590 () Bool)

(declare-fun e!754140 () Bool)

(declare-fun e!754144 () Bool)

(declare-fun mapRes!55838 () Bool)

(assert (=> b!1322590 (= e!754140 (and e!754144 mapRes!55838))))

(declare-fun condMapEmpty!55838 () Bool)

(declare-datatypes ((V!53273 0))(
  ( (V!53274 (val!18138 Int)) )
))
(declare-datatypes ((ValueCell!17165 0))(
  ( (ValueCellFull!17165 (v!20768 V!53273)) (EmptyCell!17165) )
))
(declare-datatypes ((array!89176 0))(
  ( (array!89177 (arr!43062 (Array (_ BitVec 32) ValueCell!17165)) (size!43612 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89176)

(declare-fun mapDefault!55838 () ValueCell!17165)

