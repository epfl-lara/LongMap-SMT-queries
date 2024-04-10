; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111886 () Bool)

(assert start!111886)

(declare-fun b_free!30485 () Bool)

(declare-fun b_next!30485 () Bool)

(assert (=> start!111886 (= b_free!30485 (not b_next!30485))))

(declare-fun tp!106935 () Bool)

(declare-fun b_and!49065 () Bool)

(assert (=> start!111886 (= tp!106935 b_and!49065)))

(declare-fun b!1325768 () Bool)

(declare-fun e!755736 () Bool)

(declare-fun e!755737 () Bool)

(declare-fun mapRes!56109 () Bool)

(assert (=> b!1325768 (= e!755736 (and e!755737 mapRes!56109))))

(declare-fun condMapEmpty!56109 () Bool)

(declare-datatypes ((V!53509 0))(
  ( (V!53510 (val!18227 Int)) )
))
(declare-datatypes ((ValueCell!17254 0))(
  ( (ValueCellFull!17254 (v!20860 V!53509)) (EmptyCell!17254) )
))
(declare-datatypes ((array!89518 0))(
  ( (array!89519 (arr!43232 (Array (_ BitVec 32) ValueCell!17254)) (size!43782 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89518)

(declare-fun mapDefault!56109 () ValueCell!17254)

