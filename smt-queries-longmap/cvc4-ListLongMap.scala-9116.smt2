; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109484 () Bool)

(assert start!109484)

(declare-fun b_free!28973 () Bool)

(declare-fun b_next!28973 () Bool)

(assert (=> start!109484 (= b_free!28973 (not b_next!28973))))

(declare-fun tp!102037 () Bool)

(declare-fun b_and!47063 () Bool)

(assert (=> start!109484 (= tp!102037 b_and!47063)))

(declare-fun b!1296702 () Bool)

(declare-fun res!861780 () Bool)

(declare-fun e!739768 () Bool)

(assert (=> b!1296702 (=> (not res!861780) (not e!739768))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51253 0))(
  ( (V!51254 (val!17381 Int)) )
))
(declare-datatypes ((ValueCell!16408 0))(
  ( (ValueCellFull!16408 (v!19984 V!51253)) (EmptyCell!16408) )
))
(declare-datatypes ((array!86244 0))(
  ( (array!86245 (arr!41623 (Array (_ BitVec 32) ValueCell!16408)) (size!42173 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86244)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86246 0))(
  ( (array!86247 (arr!41624 (Array (_ BitVec 32) (_ BitVec 64))) (size!42174 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86246)

(assert (=> b!1296702 (= res!861780 (and (= (size!42173 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42174 _keys!1741) (size!42173 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296703 () Bool)

(declare-fun res!861779 () Bool)

(assert (=> b!1296703 (=> (not res!861779) (not e!739768))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296703 (= res!861779 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42174 _keys!1741))))))

(declare-fun b!1296704 () Bool)

(declare-fun e!739770 () Bool)

(declare-fun e!739772 () Bool)

(declare-fun mapRes!53480 () Bool)

(assert (=> b!1296704 (= e!739770 (and e!739772 mapRes!53480))))

(declare-fun condMapEmpty!53480 () Bool)

(declare-fun mapDefault!53480 () ValueCell!16408)

