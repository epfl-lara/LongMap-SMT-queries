; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111486 () Bool)

(assert start!111486)

(declare-fun b_free!30143 () Bool)

(declare-fun b_next!30143 () Bool)

(assert (=> start!111486 (= b_free!30143 (not b_next!30143))))

(declare-fun tp!105904 () Bool)

(declare-fun b_and!48445 () Bool)

(assert (=> start!111486 (= tp!105904 b_and!48445)))

(declare-fun b!1319721 () Bool)

(declare-fun e!752911 () Bool)

(declare-fun e!752913 () Bool)

(declare-fun mapRes!55592 () Bool)

(assert (=> b!1319721 (= e!752911 (and e!752913 mapRes!55592))))

(declare-fun condMapEmpty!55592 () Bool)

(declare-datatypes ((V!53053 0))(
  ( (V!53054 (val!18056 Int)) )
))
(declare-datatypes ((ValueCell!17083 0))(
  ( (ValueCellFull!17083 (v!20686 V!53053)) (EmptyCell!17083) )
))
(declare-datatypes ((array!88864 0))(
  ( (array!88865 (arr!42906 (Array (_ BitVec 32) ValueCell!17083)) (size!43456 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88864)

(declare-fun mapDefault!55592 () ValueCell!17083)

