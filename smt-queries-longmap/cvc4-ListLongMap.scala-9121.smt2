; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109514 () Bool)

(assert start!109514)

(declare-fun b_free!29003 () Bool)

(declare-fun b_next!29003 () Bool)

(assert (=> start!109514 (= b_free!29003 (not b_next!29003))))

(declare-fun tp!102127 () Bool)

(declare-fun b_and!47093 () Bool)

(assert (=> start!109514 (= tp!102127 b_and!47093)))

(declare-fun b!1297071 () Bool)

(declare-fun res!862013 () Bool)

(declare-fun e!739997 () Bool)

(assert (=> b!1297071 (=> (not res!862013) (not e!739997))))

(declare-datatypes ((array!86300 0))(
  ( (array!86301 (arr!41651 (Array (_ BitVec 32) (_ BitVec 64))) (size!42201 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86300)

(declare-datatypes ((List!29551 0))(
  ( (Nil!29548) (Cons!29547 (h!30756 (_ BitVec 64)) (t!43115 List!29551)) )
))
(declare-fun arrayNoDuplicates!0 (array!86300 (_ BitVec 32) List!29551) Bool)

(assert (=> b!1297071 (= res!862013 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29548))))

(declare-fun b!1297072 () Bool)

(declare-fun e!739996 () Bool)

(declare-fun tp_is_empty!34643 () Bool)

(assert (=> b!1297072 (= e!739996 tp_is_empty!34643)))

(declare-fun b!1297073 () Bool)

(assert (=> b!1297073 (= e!739997 false)))

(declare-datatypes ((V!51293 0))(
  ( (V!51294 (val!17396 Int)) )
))
(declare-fun minValue!1387 () V!51293)

(declare-fun zeroValue!1387 () V!51293)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16423 0))(
  ( (ValueCellFull!16423 (v!19999 V!51293)) (EmptyCell!16423) )
))
(declare-datatypes ((array!86302 0))(
  ( (array!86303 (arr!41652 (Array (_ BitVec 32) ValueCell!16423)) (size!42202 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86302)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580550 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22416 0))(
  ( (tuple2!22417 (_1!11219 (_ BitVec 64)) (_2!11219 V!51293)) )
))
(declare-datatypes ((List!29552 0))(
  ( (Nil!29549) (Cons!29548 (h!30757 tuple2!22416) (t!43116 List!29552)) )
))
(declare-datatypes ((ListLongMap!20073 0))(
  ( (ListLongMap!20074 (toList!10052 List!29552)) )
))
(declare-fun contains!8170 (ListLongMap!20073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5081 (array!86300 array!86302 (_ BitVec 32) (_ BitVec 32) V!51293 V!51293 (_ BitVec 32) Int) ListLongMap!20073)

(assert (=> b!1297073 (= lt!580550 (contains!8170 (getCurrentListMap!5081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297074 () Bool)

(declare-fun res!862017 () Bool)

(assert (=> b!1297074 (=> (not res!862017) (not e!739997))))

(assert (=> b!1297074 (= res!862017 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42201 _keys!1741))))))

(declare-fun b!1297075 () Bool)

(declare-fun res!862016 () Bool)

(assert (=> b!1297075 (=> (not res!862016) (not e!739997))))

(assert (=> b!1297075 (= res!862016 (and (= (size!42202 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42201 _keys!1741) (size!42202 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297076 () Bool)

(declare-fun e!739993 () Bool)

(assert (=> b!1297076 (= e!739993 tp_is_empty!34643)))

(declare-fun res!862014 () Bool)

(assert (=> start!109514 (=> (not res!862014) (not e!739997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109514 (= res!862014 (validMask!0 mask!2175))))

(assert (=> start!109514 e!739997))

(assert (=> start!109514 tp_is_empty!34643))

(assert (=> start!109514 true))

(declare-fun e!739994 () Bool)

(declare-fun array_inv!31523 (array!86302) Bool)

(assert (=> start!109514 (and (array_inv!31523 _values!1445) e!739994)))

(declare-fun array_inv!31524 (array!86300) Bool)

(assert (=> start!109514 (array_inv!31524 _keys!1741)))

(assert (=> start!109514 tp!102127))

(declare-fun mapIsEmpty!53525 () Bool)

(declare-fun mapRes!53525 () Bool)

(assert (=> mapIsEmpty!53525 mapRes!53525))

(declare-fun mapNonEmpty!53525 () Bool)

(declare-fun tp!102128 () Bool)

(assert (=> mapNonEmpty!53525 (= mapRes!53525 (and tp!102128 e!739993))))

(declare-fun mapValue!53525 () ValueCell!16423)

(declare-fun mapKey!53525 () (_ BitVec 32))

(declare-fun mapRest!53525 () (Array (_ BitVec 32) ValueCell!16423))

(assert (=> mapNonEmpty!53525 (= (arr!41652 _values!1445) (store mapRest!53525 mapKey!53525 mapValue!53525))))

(declare-fun b!1297077 () Bool)

(declare-fun res!862015 () Bool)

(assert (=> b!1297077 (=> (not res!862015) (not e!739997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86300 (_ BitVec 32)) Bool)

(assert (=> b!1297077 (= res!862015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297078 () Bool)

(assert (=> b!1297078 (= e!739994 (and e!739996 mapRes!53525))))

(declare-fun condMapEmpty!53525 () Bool)

(declare-fun mapDefault!53525 () ValueCell!16423)

