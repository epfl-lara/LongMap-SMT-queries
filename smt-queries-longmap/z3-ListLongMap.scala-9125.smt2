; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109534 () Bool)

(assert start!109534)

(declare-fun b_free!29023 () Bool)

(declare-fun b_next!29023 () Bool)

(assert (=> start!109534 (= b_free!29023 (not b_next!29023))))

(declare-fun tp!102188 () Bool)

(declare-fun b_and!47095 () Bool)

(assert (=> start!109534 (= tp!102188 b_and!47095)))

(declare-fun res!862139 () Bool)

(declare-fun e!740116 () Bool)

(assert (=> start!109534 (=> (not res!862139) (not e!740116))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109534 (= res!862139 (validMask!0 mask!2175))))

(assert (=> start!109534 e!740116))

(declare-fun tp_is_empty!34663 () Bool)

(assert (=> start!109534 tp_is_empty!34663))

(assert (=> start!109534 true))

(declare-datatypes ((V!51321 0))(
  ( (V!51322 (val!17406 Int)) )
))
(declare-datatypes ((ValueCell!16433 0))(
  ( (ValueCellFull!16433 (v!20008 V!51321)) (EmptyCell!16433) )
))
(declare-datatypes ((array!86235 0))(
  ( (array!86236 (arr!41619 (Array (_ BitVec 32) ValueCell!16433)) (size!42171 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86235)

(declare-fun e!740117 () Bool)

(declare-fun array_inv!31667 (array!86235) Bool)

(assert (=> start!109534 (and (array_inv!31667 _values!1445) e!740117)))

(declare-datatypes ((array!86237 0))(
  ( (array!86238 (arr!41620 (Array (_ BitVec 32) (_ BitVec 64))) (size!42172 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86237)

(declare-fun array_inv!31668 (array!86237) Bool)

(assert (=> start!109534 (array_inv!31668 _keys!1741)))

(assert (=> start!109534 tp!102188))

(declare-fun b!1297247 () Bool)

(declare-fun res!862140 () Bool)

(assert (=> b!1297247 (=> (not res!862140) (not e!740116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86237 (_ BitVec 32)) Bool)

(assert (=> b!1297247 (= res!862140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297248 () Bool)

(declare-fun e!740114 () Bool)

(declare-fun mapRes!53555 () Bool)

(assert (=> b!1297248 (= e!740117 (and e!740114 mapRes!53555))))

(declare-fun condMapEmpty!53555 () Bool)

(declare-fun mapDefault!53555 () ValueCell!16433)

(assert (=> b!1297248 (= condMapEmpty!53555 (= (arr!41619 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16433)) mapDefault!53555)))))

(declare-fun b!1297249 () Bool)

(declare-fun e!740118 () Bool)

(assert (=> b!1297249 (= e!740118 tp_is_empty!34663)))

(declare-fun b!1297250 () Bool)

(assert (=> b!1297250 (= e!740116 false)))

(declare-fun minValue!1387 () V!51321)

(declare-fun zeroValue!1387 () V!51321)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580402 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22488 0))(
  ( (tuple2!22489 (_1!11255 (_ BitVec 64)) (_2!11255 V!51321)) )
))
(declare-datatypes ((List!29612 0))(
  ( (Nil!29609) (Cons!29608 (h!30817 tuple2!22488) (t!43168 List!29612)) )
))
(declare-datatypes ((ListLongMap!20145 0))(
  ( (ListLongMap!20146 (toList!10088 List!29612)) )
))
(declare-fun contains!8136 (ListLongMap!20145 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5004 (array!86237 array!86235 (_ BitVec 32) (_ BitVec 32) V!51321 V!51321 (_ BitVec 32) Int) ListLongMap!20145)

(assert (=> b!1297250 (= lt!580402 (contains!8136 (getCurrentListMap!5004 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297251 () Bool)

(assert (=> b!1297251 (= e!740114 tp_is_empty!34663)))

(declare-fun mapNonEmpty!53555 () Bool)

(declare-fun tp!102189 () Bool)

(assert (=> mapNonEmpty!53555 (= mapRes!53555 (and tp!102189 e!740118))))

(declare-fun mapRest!53555 () (Array (_ BitVec 32) ValueCell!16433))

(declare-fun mapValue!53555 () ValueCell!16433)

(declare-fun mapKey!53555 () (_ BitVec 32))

(assert (=> mapNonEmpty!53555 (= (arr!41619 _values!1445) (store mapRest!53555 mapKey!53555 mapValue!53555))))

(declare-fun mapIsEmpty!53555 () Bool)

(assert (=> mapIsEmpty!53555 mapRes!53555))

(declare-fun b!1297252 () Bool)

(declare-fun res!862137 () Bool)

(assert (=> b!1297252 (=> (not res!862137) (not e!740116))))

(declare-datatypes ((List!29613 0))(
  ( (Nil!29610) (Cons!29609 (h!30818 (_ BitVec 64)) (t!43169 List!29613)) )
))
(declare-fun arrayNoDuplicates!0 (array!86237 (_ BitVec 32) List!29613) Bool)

(assert (=> b!1297252 (= res!862137 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29610))))

(declare-fun b!1297253 () Bool)

(declare-fun res!862138 () Bool)

(assert (=> b!1297253 (=> (not res!862138) (not e!740116))))

(assert (=> b!1297253 (= res!862138 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42172 _keys!1741))))))

(declare-fun b!1297254 () Bool)

(declare-fun res!862136 () Bool)

(assert (=> b!1297254 (=> (not res!862136) (not e!740116))))

(assert (=> b!1297254 (= res!862136 (and (= (size!42171 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42172 _keys!1741) (size!42171 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109534 res!862139) b!1297254))

(assert (= (and b!1297254 res!862136) b!1297247))

(assert (= (and b!1297247 res!862140) b!1297252))

(assert (= (and b!1297252 res!862137) b!1297253))

(assert (= (and b!1297253 res!862138) b!1297250))

(assert (= (and b!1297248 condMapEmpty!53555) mapIsEmpty!53555))

(assert (= (and b!1297248 (not condMapEmpty!53555)) mapNonEmpty!53555))

(get-info :version)

(assert (= (and mapNonEmpty!53555 ((_ is ValueCellFull!16433) mapValue!53555)) b!1297249))

(assert (= (and b!1297248 ((_ is ValueCellFull!16433) mapDefault!53555)) b!1297251))

(assert (= start!109534 b!1297248))

(declare-fun m!1188447 () Bool)

(assert (=> mapNonEmpty!53555 m!1188447))

(declare-fun m!1188449 () Bool)

(assert (=> b!1297247 m!1188449))

(declare-fun m!1188451 () Bool)

(assert (=> b!1297252 m!1188451))

(declare-fun m!1188453 () Bool)

(assert (=> b!1297250 m!1188453))

(assert (=> b!1297250 m!1188453))

(declare-fun m!1188455 () Bool)

(assert (=> b!1297250 m!1188455))

(declare-fun m!1188457 () Bool)

(assert (=> start!109534 m!1188457))

(declare-fun m!1188459 () Bool)

(assert (=> start!109534 m!1188459))

(declare-fun m!1188461 () Bool)

(assert (=> start!109534 m!1188461))

(check-sat (not b!1297252) (not start!109534) tp_is_empty!34663 (not b!1297247) b_and!47095 (not b_next!29023) (not mapNonEmpty!53555) (not b!1297250))
(check-sat b_and!47095 (not b_next!29023))
