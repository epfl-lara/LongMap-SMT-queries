; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111548 () Bool)

(assert start!111548)

(declare-fun b_free!30205 () Bool)

(declare-fun b_next!30205 () Bool)

(assert (=> start!111548 (= b_free!30205 (not b_next!30205))))

(declare-fun tp!106091 () Bool)

(declare-fun b_and!48569 () Bool)

(assert (=> start!111548 (= tp!106091 b_and!48569)))

(declare-fun b!1320805 () Bool)

(declare-fun e!753375 () Bool)

(declare-fun tp_is_empty!36025 () Bool)

(assert (=> b!1320805 (= e!753375 tp_is_empty!36025)))

(declare-fun b!1320806 () Bool)

(declare-fun res!876637 () Bool)

(declare-fun e!753377 () Bool)

(assert (=> b!1320806 (=> (not res!876637) (not e!753377))))

(declare-datatypes ((array!88980 0))(
  ( (array!88981 (arr!42964 (Array (_ BitVec 32) (_ BitVec 64))) (size!43514 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88980)

(declare-datatypes ((List!30442 0))(
  ( (Nil!30439) (Cons!30438 (h!31647 (_ BitVec 64)) (t!44196 List!30442)) )
))
(declare-fun arrayNoDuplicates!0 (array!88980 (_ BitVec 32) List!30442) Bool)

(assert (=> b!1320806 (= res!876637 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30439))))

(declare-fun b!1320807 () Bool)

(declare-fun e!753379 () Bool)

(declare-fun e!753378 () Bool)

(declare-fun mapRes!55685 () Bool)

(assert (=> b!1320807 (= e!753379 (and e!753378 mapRes!55685))))

(declare-fun condMapEmpty!55685 () Bool)

(declare-datatypes ((V!53137 0))(
  ( (V!53138 (val!18087 Int)) )
))
(declare-datatypes ((ValueCell!17114 0))(
  ( (ValueCellFull!17114 (v!20717 V!53137)) (EmptyCell!17114) )
))
(declare-datatypes ((array!88982 0))(
  ( (array!88983 (arr!42965 (Array (_ BitVec 32) ValueCell!17114)) (size!43515 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88982)

(declare-fun mapDefault!55685 () ValueCell!17114)

