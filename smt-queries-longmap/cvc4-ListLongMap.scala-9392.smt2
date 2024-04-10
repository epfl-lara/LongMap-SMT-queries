; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111792 () Bool)

(assert start!111792)

(declare-fun b_free!30449 () Bool)

(declare-fun b_next!30449 () Bool)

(assert (=> start!111792 (= b_free!30449 (not b_next!30449))))

(declare-fun tp!106823 () Bool)

(declare-fun b_and!48987 () Bool)

(assert (=> start!111792 (= tp!106823 b_and!48987)))

(declare-fun b!1324735 () Bool)

(declare-fun e!755209 () Bool)

(declare-fun e!755206 () Bool)

(declare-fun mapRes!56051 () Bool)

(assert (=> b!1324735 (= e!755209 (and e!755206 mapRes!56051))))

(declare-fun condMapEmpty!56051 () Bool)

(declare-datatypes ((V!53461 0))(
  ( (V!53462 (val!18209 Int)) )
))
(declare-datatypes ((ValueCell!17236 0))(
  ( (ValueCellFull!17236 (v!20839 V!53461)) (EmptyCell!17236) )
))
(declare-datatypes ((array!89448 0))(
  ( (array!89449 (arr!43198 (Array (_ BitVec 32) ValueCell!17236)) (size!43748 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89448)

(declare-fun mapDefault!56051 () ValueCell!17236)

