; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112116 () Bool)

(assert start!112116)

(declare-fun b!1327901 () Bool)

(declare-fun e!757035 () Bool)

(assert (=> b!1327901 (= e!757035 false)))

(declare-fun lt!590773 () Bool)

(declare-datatypes ((array!89742 0))(
  ( (array!89743 (arr!43337 (Array (_ BitVec 32) (_ BitVec 64))) (size!43887 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89742)

(declare-datatypes ((List!30701 0))(
  ( (Nil!30698) (Cons!30697 (h!31906 (_ BitVec 64)) (t!44707 List!30701)) )
))
(declare-fun arrayNoDuplicates!0 (array!89742 (_ BitVec 32) List!30701) Bool)

(assert (=> b!1327901 (= lt!590773 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30698))))

(declare-fun b!1327902 () Bool)

(declare-fun e!757036 () Bool)

(declare-fun tp_is_empty!36421 () Bool)

(assert (=> b!1327902 (= e!757036 tp_is_empty!36421)))

(declare-fun b!1327903 () Bool)

(declare-fun e!757032 () Bool)

(declare-fun mapRes!56305 () Bool)

(assert (=> b!1327903 (= e!757032 (and e!757036 mapRes!56305))))

(declare-fun condMapEmpty!56305 () Bool)

(declare-datatypes ((V!53665 0))(
  ( (V!53666 (val!18285 Int)) )
))
(declare-datatypes ((ValueCell!17312 0))(
  ( (ValueCellFull!17312 (v!20922 V!53665)) (EmptyCell!17312) )
))
(declare-datatypes ((array!89744 0))(
  ( (array!89745 (arr!43338 (Array (_ BitVec 32) ValueCell!17312)) (size!43888 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89744)

(declare-fun mapDefault!56305 () ValueCell!17312)

