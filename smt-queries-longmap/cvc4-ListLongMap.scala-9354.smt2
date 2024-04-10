; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111564 () Bool)

(assert start!111564)

(declare-fun b_free!30221 () Bool)

(declare-fun b_next!30221 () Bool)

(assert (=> start!111564 (= b_free!30221 (not b_next!30221))))

(declare-fun tp!106138 () Bool)

(declare-fun b_and!48601 () Bool)

(assert (=> start!111564 (= tp!106138 b_and!48601)))

(declare-fun b!1321085 () Bool)

(declare-fun e!753495 () Bool)

(declare-fun e!753498 () Bool)

(declare-fun mapRes!55709 () Bool)

(assert (=> b!1321085 (= e!753495 (and e!753498 mapRes!55709))))

(declare-fun condMapEmpty!55709 () Bool)

(declare-datatypes ((V!53157 0))(
  ( (V!53158 (val!18095 Int)) )
))
(declare-datatypes ((ValueCell!17122 0))(
  ( (ValueCellFull!17122 (v!20725 V!53157)) (EmptyCell!17122) )
))
(declare-datatypes ((array!89012 0))(
  ( (array!89013 (arr!42980 (Array (_ BitVec 32) ValueCell!17122)) (size!43530 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89012)

(declare-fun mapDefault!55709 () ValueCell!17122)

