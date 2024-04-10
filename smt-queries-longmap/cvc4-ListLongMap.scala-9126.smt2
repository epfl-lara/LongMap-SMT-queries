; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109544 () Bool)

(assert start!109544)

(declare-fun b_free!29033 () Bool)

(declare-fun b_next!29033 () Bool)

(assert (=> start!109544 (= b_free!29033 (not b_next!29033))))

(declare-fun tp!102217 () Bool)

(declare-fun b_and!47123 () Bool)

(assert (=> start!109544 (= tp!102217 b_and!47123)))

(declare-fun b!1297431 () Bool)

(declare-fun res!862240 () Bool)

(declare-fun e!740222 () Bool)

(assert (=> b!1297431 (=> (not res!862240) (not e!740222))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86356 0))(
  ( (array!86357 (arr!41679 (Array (_ BitVec 32) (_ BitVec 64))) (size!42229 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86356)

(assert (=> b!1297431 (= res!862240 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42229 _keys!1741))))))

(declare-fun mapNonEmpty!53570 () Bool)

(declare-fun mapRes!53570 () Bool)

(declare-fun tp!102218 () Bool)

(declare-fun e!740218 () Bool)

(assert (=> mapNonEmpty!53570 (= mapRes!53570 (and tp!102218 e!740218))))

(declare-datatypes ((V!51333 0))(
  ( (V!51334 (val!17411 Int)) )
))
(declare-datatypes ((ValueCell!16438 0))(
  ( (ValueCellFull!16438 (v!20014 V!51333)) (EmptyCell!16438) )
))
(declare-fun mapValue!53570 () ValueCell!16438)

(declare-datatypes ((array!86358 0))(
  ( (array!86359 (arr!41680 (Array (_ BitVec 32) ValueCell!16438)) (size!42230 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86358)

(declare-fun mapKey!53570 () (_ BitVec 32))

(declare-fun mapRest!53570 () (Array (_ BitVec 32) ValueCell!16438))

(assert (=> mapNonEmpty!53570 (= (arr!41680 _values!1445) (store mapRest!53570 mapKey!53570 mapValue!53570))))

(declare-fun b!1297432 () Bool)

(declare-fun res!862238 () Bool)

(assert (=> b!1297432 (=> (not res!862238) (not e!740222))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297432 (= res!862238 (and (= (size!42230 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42229 _keys!1741) (size!42230 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!862242 () Bool)

(assert (=> start!109544 (=> (not res!862242) (not e!740222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109544 (= res!862242 (validMask!0 mask!2175))))

(assert (=> start!109544 e!740222))

(declare-fun tp_is_empty!34673 () Bool)

(assert (=> start!109544 tp_is_empty!34673))

(assert (=> start!109544 true))

(declare-fun e!740219 () Bool)

(declare-fun array_inv!31545 (array!86358) Bool)

(assert (=> start!109544 (and (array_inv!31545 _values!1445) e!740219)))

(declare-fun array_inv!31546 (array!86356) Bool)

(assert (=> start!109544 (array_inv!31546 _keys!1741)))

(assert (=> start!109544 tp!102217))

(declare-fun b!1297433 () Bool)

(assert (=> b!1297433 (= e!740218 tp_is_empty!34673)))

(declare-fun b!1297434 () Bool)

(declare-fun e!740220 () Bool)

(assert (=> b!1297434 (= e!740220 tp_is_empty!34673)))

(declare-fun b!1297435 () Bool)

(assert (=> b!1297435 (= e!740222 false)))

(declare-fun minValue!1387 () V!51333)

(declare-fun zeroValue!1387 () V!51333)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580595 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22434 0))(
  ( (tuple2!22435 (_1!11228 (_ BitVec 64)) (_2!11228 V!51333)) )
))
(declare-datatypes ((List!29570 0))(
  ( (Nil!29567) (Cons!29566 (h!30775 tuple2!22434) (t!43134 List!29570)) )
))
(declare-datatypes ((ListLongMap!20091 0))(
  ( (ListLongMap!20092 (toList!10061 List!29570)) )
))
(declare-fun contains!8179 (ListLongMap!20091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5090 (array!86356 array!86358 (_ BitVec 32) (_ BitVec 32) V!51333 V!51333 (_ BitVec 32) Int) ListLongMap!20091)

(assert (=> b!1297435 (= lt!580595 (contains!8179 (getCurrentListMap!5090 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297436 () Bool)

(declare-fun res!862241 () Bool)

(assert (=> b!1297436 (=> (not res!862241) (not e!740222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86356 (_ BitVec 32)) Bool)

(assert (=> b!1297436 (= res!862241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297437 () Bool)

(declare-fun res!862239 () Bool)

(assert (=> b!1297437 (=> (not res!862239) (not e!740222))))

(declare-datatypes ((List!29571 0))(
  ( (Nil!29568) (Cons!29567 (h!30776 (_ BitVec 64)) (t!43135 List!29571)) )
))
(declare-fun arrayNoDuplicates!0 (array!86356 (_ BitVec 32) List!29571) Bool)

(assert (=> b!1297437 (= res!862239 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29568))))

(declare-fun b!1297438 () Bool)

(assert (=> b!1297438 (= e!740219 (and e!740220 mapRes!53570))))

(declare-fun condMapEmpty!53570 () Bool)

(declare-fun mapDefault!53570 () ValueCell!16438)

