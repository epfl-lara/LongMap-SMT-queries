; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108698 () Bool)

(assert start!108698)

(declare-fun b_free!28211 () Bool)

(declare-fun b_next!28211 () Bool)

(assert (=> start!108698 (= b_free!28211 (not b_next!28211))))

(declare-fun tp!99748 () Bool)

(declare-fun b_and!46277 () Bool)

(assert (=> start!108698 (= tp!99748 b_and!46277)))

(declare-fun b!1283236 () Bool)

(declare-fun res!852397 () Bool)

(declare-fun e!733142 () Bool)

(assert (=> b!1283236 (=> (not res!852397) (not e!733142))))

(declare-datatypes ((array!84764 0))(
  ( (array!84765 (arr!40884 (Array (_ BitVec 32) (_ BitVec 64))) (size!41434 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84764)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283236 (= res!852397 (validKeyInArray!0 (select (arr!40884 _keys!1741) from!2144)))))

(declare-fun b!1283237 () Bool)

(declare-fun res!852398 () Bool)

(assert (=> b!1283237 (=> (not res!852398) (not e!733142))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50237 0))(
  ( (V!50238 (val!17000 Int)) )
))
(declare-datatypes ((ValueCell!16027 0))(
  ( (ValueCellFull!16027 (v!19602 V!50237)) (EmptyCell!16027) )
))
(declare-datatypes ((array!84766 0))(
  ( (array!84767 (arr!40885 (Array (_ BitVec 32) ValueCell!16027)) (size!41435 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84766)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283237 (= res!852398 (and (= (size!41435 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41434 _keys!1741) (size!41435 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283238 () Bool)

(declare-fun res!852396 () Bool)

(assert (=> b!1283238 (=> (not res!852396) (not e!733142))))

(assert (=> b!1283238 (= res!852396 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41434 _keys!1741))))))

(declare-fun b!1283239 () Bool)

(declare-fun res!852402 () Bool)

(assert (=> b!1283239 (=> (not res!852402) (not e!733142))))

(declare-datatypes ((List!28967 0))(
  ( (Nil!28964) (Cons!28963 (h!30172 (_ BitVec 64)) (t!42511 List!28967)) )
))
(declare-fun arrayNoDuplicates!0 (array!84764 (_ BitVec 32) List!28967) Bool)

(assert (=> b!1283239 (= res!852402 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28964))))

(declare-fun mapIsEmpty!52334 () Bool)

(declare-fun mapRes!52334 () Bool)

(assert (=> mapIsEmpty!52334 mapRes!52334))

(declare-fun b!1283240 () Bool)

(declare-fun e!733141 () Bool)

(declare-fun tp_is_empty!33851 () Bool)

(assert (=> b!1283240 (= e!733141 tp_is_empty!33851)))

(declare-fun b!1283241 () Bool)

(declare-fun res!852400 () Bool)

(assert (=> b!1283241 (=> (not res!852400) (not e!733142))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1283241 (= res!852400 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41434 _keys!1741))))))

(declare-fun b!1283242 () Bool)

(declare-fun e!733144 () Bool)

(declare-fun e!733145 () Bool)

(assert (=> b!1283242 (= e!733144 (and e!733145 mapRes!52334))))

(declare-fun condMapEmpty!52334 () Bool)

(declare-fun mapDefault!52334 () ValueCell!16027)

