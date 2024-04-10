; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113184 () Bool)

(assert start!113184)

(declare-fun b_free!31235 () Bool)

(declare-fun b_next!31235 () Bool)

(assert (=> start!113184 (= b_free!31235 (not b_next!31235))))

(declare-fun tp!109510 () Bool)

(declare-fun b_and!50377 () Bool)

(assert (=> start!113184 (= tp!109510 b_and!50377)))

(declare-fun b!1342359 () Bool)

(declare-fun res!890573 () Bool)

(declare-fun e!764243 () Bool)

(assert (=> b!1342359 (=> (not res!890573) (not e!764243))))

(declare-datatypes ((array!91320 0))(
  ( (array!91321 (arr!44116 (Array (_ BitVec 32) (_ BitVec 64))) (size!44666 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91320)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91320 (_ BitVec 32)) Bool)

(assert (=> b!1342359 (= res!890573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342360 () Bool)

(declare-fun e!764241 () Bool)

(declare-fun tp_is_empty!37235 () Bool)

(assert (=> b!1342360 (= e!764241 tp_is_empty!37235)))

(declare-fun b!1342361 () Bool)

(declare-fun res!890570 () Bool)

(assert (=> b!1342361 (=> (not res!890570) (not e!764243))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1342361 (= res!890570 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342363 () Bool)

(declare-fun res!890572 () Bool)

(assert (=> b!1342363 (=> (not res!890572) (not e!764243))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342363 (= res!890572 (validKeyInArray!0 (select (arr!44116 _keys!1571) from!1960)))))

(declare-fun b!1342364 () Bool)

(declare-fun res!890571 () Bool)

(assert (=> b!1342364 (=> (not res!890571) (not e!764243))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1342364 (= res!890571 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44666 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57559 () Bool)

(declare-fun mapRes!57559 () Bool)

(declare-fun tp!109509 () Bool)

(declare-fun e!764239 () Bool)

(assert (=> mapNonEmpty!57559 (= mapRes!57559 (and tp!109509 e!764239))))

(declare-datatypes ((V!54749 0))(
  ( (V!54750 (val!18692 Int)) )
))
(declare-datatypes ((ValueCell!17719 0))(
  ( (ValueCellFull!17719 (v!21340 V!54749)) (EmptyCell!17719) )
))
(declare-fun mapRest!57559 () (Array (_ BitVec 32) ValueCell!17719))

(declare-fun mapValue!57559 () ValueCell!17719)

(declare-datatypes ((array!91322 0))(
  ( (array!91323 (arr!44117 (Array (_ BitVec 32) ValueCell!17719)) (size!44667 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91322)

(declare-fun mapKey!57559 () (_ BitVec 32))

(assert (=> mapNonEmpty!57559 (= (arr!44117 _values!1303) (store mapRest!57559 mapKey!57559 mapValue!57559))))

(declare-fun b!1342365 () Bool)

(declare-fun e!764240 () Bool)

(assert (=> b!1342365 (= e!764240 (and e!764241 mapRes!57559))))

(declare-fun condMapEmpty!57559 () Bool)

(declare-fun mapDefault!57559 () ValueCell!17719)

