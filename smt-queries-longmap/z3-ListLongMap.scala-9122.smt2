; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109518 () Bool)

(assert start!109518)

(declare-fun b_free!29007 () Bool)

(declare-fun b_next!29007 () Bool)

(assert (=> start!109518 (= b_free!29007 (not b_next!29007))))

(declare-fun tp!102139 () Bool)

(declare-fun b_and!47097 () Bool)

(assert (=> start!109518 (= tp!102139 b_and!47097)))

(declare-fun res!862046 () Bool)

(declare-fun e!740027 () Bool)

(assert (=> start!109518 (=> (not res!862046) (not e!740027))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109518 (= res!862046 (validMask!0 mask!2175))))

(assert (=> start!109518 e!740027))

(declare-fun tp_is_empty!34647 () Bool)

(assert (=> start!109518 tp_is_empty!34647))

(assert (=> start!109518 true))

(declare-datatypes ((V!51299 0))(
  ( (V!51300 (val!17398 Int)) )
))
(declare-datatypes ((ValueCell!16425 0))(
  ( (ValueCellFull!16425 (v!20001 V!51299)) (EmptyCell!16425) )
))
(declare-datatypes ((array!86306 0))(
  ( (array!86307 (arr!41654 (Array (_ BitVec 32) ValueCell!16425)) (size!42204 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86306)

(declare-fun e!740026 () Bool)

(declare-fun array_inv!31525 (array!86306) Bool)

(assert (=> start!109518 (and (array_inv!31525 _values!1445) e!740026)))

(declare-datatypes ((array!86308 0))(
  ( (array!86309 (arr!41655 (Array (_ BitVec 32) (_ BitVec 64))) (size!42205 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86308)

(declare-fun array_inv!31526 (array!86308) Bool)

(assert (=> start!109518 (array_inv!31526 _keys!1741)))

(assert (=> start!109518 tp!102139))

(declare-fun b!1297119 () Bool)

(declare-fun e!740025 () Bool)

(declare-fun mapRes!53531 () Bool)

(assert (=> b!1297119 (= e!740026 (and e!740025 mapRes!53531))))

(declare-fun condMapEmpty!53531 () Bool)

(declare-fun mapDefault!53531 () ValueCell!16425)

(assert (=> b!1297119 (= condMapEmpty!53531 (= (arr!41654 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16425)) mapDefault!53531)))))

(declare-fun b!1297120 () Bool)

(declare-fun res!862044 () Bool)

(assert (=> b!1297120 (=> (not res!862044) (not e!740027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86308 (_ BitVec 32)) Bool)

(assert (=> b!1297120 (= res!862044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297121 () Bool)

(declare-fun res!862045 () Bool)

(assert (=> b!1297121 (=> (not res!862045) (not e!740027))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297121 (= res!862045 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42205 _keys!1741))))))

(declare-fun b!1297122 () Bool)

(declare-fun res!862043 () Bool)

(assert (=> b!1297122 (=> (not res!862043) (not e!740027))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297122 (= res!862043 (and (= (size!42204 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42205 _keys!1741) (size!42204 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53531 () Bool)

(assert (=> mapIsEmpty!53531 mapRes!53531))

(declare-fun b!1297123 () Bool)

(declare-fun e!740024 () Bool)

(assert (=> b!1297123 (= e!740024 tp_is_empty!34647)))

(declare-fun mapNonEmpty!53531 () Bool)

(declare-fun tp!102140 () Bool)

(assert (=> mapNonEmpty!53531 (= mapRes!53531 (and tp!102140 e!740024))))

(declare-fun mapRest!53531 () (Array (_ BitVec 32) ValueCell!16425))

(declare-fun mapValue!53531 () ValueCell!16425)

(declare-fun mapKey!53531 () (_ BitVec 32))

(assert (=> mapNonEmpty!53531 (= (arr!41654 _values!1445) (store mapRest!53531 mapKey!53531 mapValue!53531))))

(declare-fun b!1297124 () Bool)

(declare-fun res!862047 () Bool)

(assert (=> b!1297124 (=> (not res!862047) (not e!740027))))

(declare-datatypes ((List!29553 0))(
  ( (Nil!29550) (Cons!29549 (h!30758 (_ BitVec 64)) (t!43117 List!29553)) )
))
(declare-fun arrayNoDuplicates!0 (array!86308 (_ BitVec 32) List!29553) Bool)

(assert (=> b!1297124 (= res!862047 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29550))))

(declare-fun b!1297125 () Bool)

(assert (=> b!1297125 (= e!740025 tp_is_empty!34647)))

(declare-fun b!1297126 () Bool)

(assert (=> b!1297126 (= e!740027 false)))

(declare-fun minValue!1387 () V!51299)

(declare-fun zeroValue!1387 () V!51299)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580556 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22418 0))(
  ( (tuple2!22419 (_1!11220 (_ BitVec 64)) (_2!11220 V!51299)) )
))
(declare-datatypes ((List!29554 0))(
  ( (Nil!29551) (Cons!29550 (h!30759 tuple2!22418) (t!43118 List!29554)) )
))
(declare-datatypes ((ListLongMap!20075 0))(
  ( (ListLongMap!20076 (toList!10053 List!29554)) )
))
(declare-fun contains!8171 (ListLongMap!20075 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5082 (array!86308 array!86306 (_ BitVec 32) (_ BitVec 32) V!51299 V!51299 (_ BitVec 32) Int) ListLongMap!20075)

(assert (=> b!1297126 (= lt!580556 (contains!8171 (getCurrentListMap!5082 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109518 res!862046) b!1297122))

(assert (= (and b!1297122 res!862043) b!1297120))

(assert (= (and b!1297120 res!862044) b!1297124))

(assert (= (and b!1297124 res!862047) b!1297121))

(assert (= (and b!1297121 res!862045) b!1297126))

(assert (= (and b!1297119 condMapEmpty!53531) mapIsEmpty!53531))

(assert (= (and b!1297119 (not condMapEmpty!53531)) mapNonEmpty!53531))

(get-info :version)

(assert (= (and mapNonEmpty!53531 ((_ is ValueCellFull!16425) mapValue!53531)) b!1297123))

(assert (= (and b!1297119 ((_ is ValueCellFull!16425) mapDefault!53531)) b!1297125))

(assert (= start!109518 b!1297119))

(declare-fun m!1188819 () Bool)

(assert (=> mapNonEmpty!53531 m!1188819))

(declare-fun m!1188821 () Bool)

(assert (=> b!1297120 m!1188821))

(declare-fun m!1188823 () Bool)

(assert (=> b!1297124 m!1188823))

(declare-fun m!1188825 () Bool)

(assert (=> start!109518 m!1188825))

(declare-fun m!1188827 () Bool)

(assert (=> start!109518 m!1188827))

(declare-fun m!1188829 () Bool)

(assert (=> start!109518 m!1188829))

(declare-fun m!1188831 () Bool)

(assert (=> b!1297126 m!1188831))

(assert (=> b!1297126 m!1188831))

(declare-fun m!1188833 () Bool)

(assert (=> b!1297126 m!1188833))

(check-sat b_and!47097 (not b!1297126) (not mapNonEmpty!53531) (not start!109518) (not b!1297120) (not b_next!29007) tp_is_empty!34647 (not b!1297124))
(check-sat b_and!47097 (not b_next!29007))
