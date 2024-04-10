; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111608 () Bool)

(assert start!111608)

(declare-fun b_free!30265 () Bool)

(declare-fun b_next!30265 () Bool)

(assert (=> start!111608 (= b_free!30265 (not b_next!30265))))

(declare-fun tp!106271 () Bool)

(declare-fun b_and!48689 () Bool)

(assert (=> start!111608 (= tp!106271 b_and!48689)))

(declare-fun b!1321855 () Bool)

(declare-fun e!753827 () Bool)

(declare-fun e!753825 () Bool)

(declare-fun mapRes!55775 () Bool)

(assert (=> b!1321855 (= e!753827 (and e!753825 mapRes!55775))))

(declare-fun condMapEmpty!55775 () Bool)

(declare-datatypes ((V!53217 0))(
  ( (V!53218 (val!18117 Int)) )
))
(declare-datatypes ((ValueCell!17144 0))(
  ( (ValueCellFull!17144 (v!20747 V!53217)) (EmptyCell!17144) )
))
(declare-datatypes ((array!89094 0))(
  ( (array!89095 (arr!43021 (Array (_ BitVec 32) ValueCell!17144)) (size!43571 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89094)

(declare-fun mapDefault!55775 () ValueCell!17144)

