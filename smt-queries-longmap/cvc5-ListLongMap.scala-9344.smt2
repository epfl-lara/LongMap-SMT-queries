; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111500 () Bool)

(assert start!111500)

(declare-fun b_free!30157 () Bool)

(declare-fun b_next!30157 () Bool)

(assert (=> start!111500 (= b_free!30157 (not b_next!30157))))

(declare-fun tp!105946 () Bool)

(declare-fun b_and!48473 () Bool)

(assert (=> start!111500 (= tp!105946 b_and!48473)))

(declare-fun b!1319965 () Bool)

(declare-fun e!753019 () Bool)

(declare-fun e!753017 () Bool)

(declare-fun mapRes!55613 () Bool)

(assert (=> b!1319965 (= e!753019 (and e!753017 mapRes!55613))))

(declare-fun condMapEmpty!55613 () Bool)

(declare-datatypes ((V!53073 0))(
  ( (V!53074 (val!18063 Int)) )
))
(declare-datatypes ((ValueCell!17090 0))(
  ( (ValueCellFull!17090 (v!20693 V!53073)) (EmptyCell!17090) )
))
(declare-datatypes ((array!88888 0))(
  ( (array!88889 (arr!42918 (Array (_ BitVec 32) ValueCell!17090)) (size!43468 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88888)

(declare-fun mapDefault!55613 () ValueCell!17090)

