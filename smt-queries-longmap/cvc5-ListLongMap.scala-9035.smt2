; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108994 () Bool)

(assert start!108994)

(declare-fun b_free!28483 () Bool)

(declare-fun b_next!28483 () Bool)

(assert (=> start!108994 (= b_free!28483 (not b_next!28483))))

(declare-fun tp!100568 () Bool)

(declare-fun b_and!46573 () Bool)

(assert (=> start!108994 (= tp!100568 b_and!46573)))

(declare-fun b!1287993 () Bool)

(declare-fun res!855437 () Bool)

(declare-fun e!735500 () Bool)

(assert (=> b!1287993 (=> (not res!855437) (not e!735500))))

(declare-datatypes ((array!85294 0))(
  ( (array!85295 (arr!41148 (Array (_ BitVec 32) (_ BitVec 64))) (size!41698 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85294)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287993 (= res!855437 (not (validKeyInArray!0 (select (arr!41148 _keys!1741) from!2144))))))

(declare-fun b!1287994 () Bool)

(declare-fun res!855441 () Bool)

(assert (=> b!1287994 (=> (not res!855441) (not e!735500))))

(assert (=> b!1287994 (= res!855441 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41698 _keys!1741))))))

(declare-fun b!1287995 () Bool)

(declare-fun res!855444 () Bool)

(assert (=> b!1287995 (=> (not res!855444) (not e!735500))))

(declare-datatypes ((V!50601 0))(
  ( (V!50602 (val!17136 Int)) )
))
(declare-fun minValue!1387 () V!50601)

(declare-fun zeroValue!1387 () V!50601)

(declare-datatypes ((ValueCell!16163 0))(
  ( (ValueCellFull!16163 (v!19739 V!50601)) (EmptyCell!16163) )
))
(declare-datatypes ((array!85296 0))(
  ( (array!85297 (arr!41149 (Array (_ BitVec 32) ValueCell!16163)) (size!41699 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85296)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21994 0))(
  ( (tuple2!21995 (_1!11008 (_ BitVec 64)) (_2!11008 V!50601)) )
))
(declare-datatypes ((List!29169 0))(
  ( (Nil!29166) (Cons!29165 (h!30374 tuple2!21994) (t!42733 List!29169)) )
))
(declare-datatypes ((ListLongMap!19651 0))(
  ( (ListLongMap!19652 (toList!9841 List!29169)) )
))
(declare-fun contains!7959 (ListLongMap!19651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4909 (array!85294 array!85296 (_ BitVec 32) (_ BitVec 32) V!50601 V!50601 (_ BitVec 32) Int) ListLongMap!19651)

(assert (=> b!1287995 (= res!855444 (contains!7959 (getCurrentListMap!4909 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287996 () Bool)

(declare-fun res!855440 () Bool)

(assert (=> b!1287996 (=> (not res!855440) (not e!735500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85294 (_ BitVec 32)) Bool)

(assert (=> b!1287996 (= res!855440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!855442 () Bool)

(assert (=> start!108994 (=> (not res!855442) (not e!735500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108994 (= res!855442 (validMask!0 mask!2175))))

(assert (=> start!108994 e!735500))

(declare-fun tp_is_empty!34123 () Bool)

(assert (=> start!108994 tp_is_empty!34123))

(assert (=> start!108994 true))

(declare-fun e!735499 () Bool)

(declare-fun array_inv!31205 (array!85296) Bool)

(assert (=> start!108994 (and (array_inv!31205 _values!1445) e!735499)))

(declare-fun array_inv!31206 (array!85294) Bool)

(assert (=> start!108994 (array_inv!31206 _keys!1741)))

(assert (=> start!108994 tp!100568))

(declare-fun b!1287997 () Bool)

(declare-fun res!855443 () Bool)

(assert (=> b!1287997 (=> (not res!855443) (not e!735500))))

(assert (=> b!1287997 (= res!855443 (and (= (size!41699 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41698 _keys!1741) (size!41699 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287998 () Bool)

(declare-fun res!855438 () Bool)

(assert (=> b!1287998 (=> (not res!855438) (not e!735500))))

(declare-datatypes ((List!29170 0))(
  ( (Nil!29167) (Cons!29166 (h!30375 (_ BitVec 64)) (t!42734 List!29170)) )
))
(declare-fun arrayNoDuplicates!0 (array!85294 (_ BitVec 32) List!29170) Bool)

(assert (=> b!1287998 (= res!855438 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29167))))

(declare-fun b!1287999 () Bool)

(declare-fun res!855439 () Bool)

(assert (=> b!1287999 (=> (not res!855439) (not e!735500))))

(assert (=> b!1287999 (= res!855439 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41698 _keys!1741))))))

(declare-fun b!1288000 () Bool)

(declare-fun e!735501 () Bool)

(assert (=> b!1288000 (= e!735501 tp_is_empty!34123)))

(declare-fun mapIsEmpty!52745 () Bool)

(declare-fun mapRes!52745 () Bool)

(assert (=> mapIsEmpty!52745 mapRes!52745))

(declare-fun b!1288001 () Bool)

(declare-fun e!735503 () Bool)

(assert (=> b!1288001 (= e!735503 tp_is_empty!34123)))

(declare-fun b!1288002 () Bool)

(assert (=> b!1288002 (= e!735500 (not true))))

(assert (=> b!1288002 (not (contains!7959 (ListLongMap!19652 Nil!29166) k!1205))))

(declare-datatypes ((Unit!42602 0))(
  ( (Unit!42603) )
))
(declare-fun lt!577916 () Unit!42602)

(declare-fun emptyContainsNothing!30 ((_ BitVec 64)) Unit!42602)

(assert (=> b!1288002 (= lt!577916 (emptyContainsNothing!30 k!1205))))

(declare-fun b!1288003 () Bool)

(assert (=> b!1288003 (= e!735499 (and e!735501 mapRes!52745))))

(declare-fun condMapEmpty!52745 () Bool)

(declare-fun mapDefault!52745 () ValueCell!16163)

