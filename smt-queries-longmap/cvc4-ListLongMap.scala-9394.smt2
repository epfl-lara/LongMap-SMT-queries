; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111804 () Bool)

(assert start!111804)

(declare-fun b_free!30461 () Bool)

(declare-fun b_next!30461 () Bool)

(assert (=> start!111804 (= b_free!30461 (not b_next!30461))))

(declare-fun tp!106858 () Bool)

(declare-fun b_and!49003 () Bool)

(assert (=> start!111804 (= tp!106858 b_and!49003)))

(declare-fun b!1324937 () Bool)

(declare-fun e!755298 () Bool)

(declare-fun e!755297 () Bool)

(declare-fun mapRes!56069 () Bool)

(assert (=> b!1324937 (= e!755298 (and e!755297 mapRes!56069))))

(declare-fun condMapEmpty!56069 () Bool)

(declare-datatypes ((V!53477 0))(
  ( (V!53478 (val!18215 Int)) )
))
(declare-datatypes ((ValueCell!17242 0))(
  ( (ValueCellFull!17242 (v!20845 V!53477)) (EmptyCell!17242) )
))
(declare-datatypes ((array!89470 0))(
  ( (array!89471 (arr!43209 (Array (_ BitVec 32) ValueCell!17242)) (size!43759 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89470)

(declare-fun mapDefault!56069 () ValueCell!17242)

