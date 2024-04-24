; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109200 () Bool)

(assert start!109200)

(declare-fun b_free!28465 () Bool)

(declare-fun b_next!28465 () Bool)

(assert (=> start!109200 (= b_free!28465 (not b_next!28465))))

(declare-fun tp!100514 () Bool)

(declare-fun b_and!46557 () Bool)

(assert (=> start!109200 (= tp!100514 b_and!46557)))

(declare-fun b!1289001 () Bool)

(declare-fun res!855742 () Bool)

(declare-fun e!736214 () Bool)

(assert (=> b!1289001 (=> (not res!855742) (not e!736214))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50577 0))(
  ( (V!50578 (val!17127 Int)) )
))
(declare-datatypes ((ValueCell!16154 0))(
  ( (ValueCellFull!16154 (v!19725 V!50577)) (EmptyCell!16154) )
))
(declare-datatypes ((array!85293 0))(
  ( (array!85294 (arr!41143 (Array (_ BitVec 32) ValueCell!16154)) (size!41694 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85293)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85295 0))(
  ( (array!85296 (arr!41144 (Array (_ BitVec 32) (_ BitVec 64))) (size!41695 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85295)

(assert (=> b!1289001 (= res!855742 (and (= (size!41694 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41695 _keys!1741) (size!41694 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289002 () Bool)

(declare-fun res!855747 () Bool)

(assert (=> b!1289002 (=> (not res!855747) (not e!736214))))

(declare-fun minValue!1387 () V!50577)

(declare-fun zeroValue!1387 () V!50577)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21994 0))(
  ( (tuple2!21995 (_1!11008 (_ BitVec 64)) (_2!11008 V!50577)) )
))
(declare-datatypes ((List!29184 0))(
  ( (Nil!29181) (Cons!29180 (h!30398 tuple2!21994) (t!42740 List!29184)) )
))
(declare-datatypes ((ListLongMap!19659 0))(
  ( (ListLongMap!19660 (toList!9845 List!29184)) )
))
(declare-fun contains!7976 (ListLongMap!19659 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4897 (array!85295 array!85293 (_ BitVec 32) (_ BitVec 32) V!50577 V!50577 (_ BitVec 32) Int) ListLongMap!19659)

(assert (=> b!1289002 (= res!855747 (contains!7976 (getCurrentListMap!4897 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52718 () Bool)

(declare-fun mapRes!52718 () Bool)

(assert (=> mapIsEmpty!52718 mapRes!52718))

(declare-fun b!1289003 () Bool)

(declare-fun e!736215 () Bool)

(declare-fun tp_is_empty!34105 () Bool)

(assert (=> b!1289003 (= e!736215 tp_is_empty!34105)))

(declare-fun b!1289004 () Bool)

(declare-fun e!736212 () Bool)

(assert (=> b!1289004 (= e!736212 tp_is_empty!34105)))

(declare-fun b!1289005 () Bool)

(assert (=> b!1289005 (= e!736214 (not true))))

(assert (=> b!1289005 (not (contains!7976 (ListLongMap!19660 Nil!29181) k0!1205))))

(declare-datatypes ((Unit!42545 0))(
  ( (Unit!42546) )
))
(declare-fun lt!578373 () Unit!42545)

(declare-fun emptyContainsNothing!26 ((_ BitVec 64)) Unit!42545)

(assert (=> b!1289005 (= lt!578373 (emptyContainsNothing!26 k0!1205))))

(declare-fun b!1289006 () Bool)

(declare-fun e!736213 () Bool)

(assert (=> b!1289006 (= e!736213 (and e!736215 mapRes!52718))))

(declare-fun condMapEmpty!52718 () Bool)

(declare-fun mapDefault!52718 () ValueCell!16154)

(assert (=> b!1289006 (= condMapEmpty!52718 (= (arr!41143 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16154)) mapDefault!52718)))))

(declare-fun res!855744 () Bool)

(assert (=> start!109200 (=> (not res!855744) (not e!736214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109200 (= res!855744 (validMask!0 mask!2175))))

(assert (=> start!109200 e!736214))

(assert (=> start!109200 tp_is_empty!34105))

(assert (=> start!109200 true))

(declare-fun array_inv!31403 (array!85293) Bool)

(assert (=> start!109200 (and (array_inv!31403 _values!1445) e!736213)))

(declare-fun array_inv!31404 (array!85295) Bool)

(assert (=> start!109200 (array_inv!31404 _keys!1741)))

(assert (=> start!109200 tp!100514))

(declare-fun b!1289007 () Bool)

(declare-fun res!855745 () Bool)

(assert (=> b!1289007 (=> (not res!855745) (not e!736214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85295 (_ BitVec 32)) Bool)

(assert (=> b!1289007 (= res!855745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289008 () Bool)

(declare-fun res!855743 () Bool)

(assert (=> b!1289008 (=> (not res!855743) (not e!736214))))

(assert (=> b!1289008 (= res!855743 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41695 _keys!1741))))))

(declare-fun b!1289009 () Bool)

(declare-fun res!855741 () Bool)

(assert (=> b!1289009 (=> (not res!855741) (not e!736214))))

(assert (=> b!1289009 (= res!855741 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41695 _keys!1741))))))

(declare-fun b!1289010 () Bool)

(declare-fun res!855746 () Bool)

(assert (=> b!1289010 (=> (not res!855746) (not e!736214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289010 (= res!855746 (not (validKeyInArray!0 (select (arr!41144 _keys!1741) from!2144))))))

(declare-fun b!1289011 () Bool)

(declare-fun res!855748 () Bool)

(assert (=> b!1289011 (=> (not res!855748) (not e!736214))))

(declare-datatypes ((List!29185 0))(
  ( (Nil!29182) (Cons!29181 (h!30399 (_ BitVec 64)) (t!42741 List!29185)) )
))
(declare-fun arrayNoDuplicates!0 (array!85295 (_ BitVec 32) List!29185) Bool)

(assert (=> b!1289011 (= res!855748 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29182))))

(declare-fun mapNonEmpty!52718 () Bool)

(declare-fun tp!100513 () Bool)

(assert (=> mapNonEmpty!52718 (= mapRes!52718 (and tp!100513 e!736212))))

(declare-fun mapValue!52718 () ValueCell!16154)

(declare-fun mapRest!52718 () (Array (_ BitVec 32) ValueCell!16154))

(declare-fun mapKey!52718 () (_ BitVec 32))

(assert (=> mapNonEmpty!52718 (= (arr!41143 _values!1445) (store mapRest!52718 mapKey!52718 mapValue!52718))))

(assert (= (and start!109200 res!855744) b!1289001))

(assert (= (and b!1289001 res!855742) b!1289007))

(assert (= (and b!1289007 res!855745) b!1289011))

(assert (= (and b!1289011 res!855748) b!1289009))

(assert (= (and b!1289009 res!855741) b!1289002))

(assert (= (and b!1289002 res!855747) b!1289008))

(assert (= (and b!1289008 res!855743) b!1289010))

(assert (= (and b!1289010 res!855746) b!1289005))

(assert (= (and b!1289006 condMapEmpty!52718) mapIsEmpty!52718))

(assert (= (and b!1289006 (not condMapEmpty!52718)) mapNonEmpty!52718))

(get-info :version)

(assert (= (and mapNonEmpty!52718 ((_ is ValueCellFull!16154) mapValue!52718)) b!1289004))

(assert (= (and b!1289006 ((_ is ValueCellFull!16154) mapDefault!52718)) b!1289003))

(assert (= start!109200 b!1289006))

(declare-fun m!1182105 () Bool)

(assert (=> b!1289011 m!1182105))

(declare-fun m!1182107 () Bool)

(assert (=> start!109200 m!1182107))

(declare-fun m!1182109 () Bool)

(assert (=> start!109200 m!1182109))

(declare-fun m!1182111 () Bool)

(assert (=> start!109200 m!1182111))

(declare-fun m!1182113 () Bool)

(assert (=> mapNonEmpty!52718 m!1182113))

(declare-fun m!1182115 () Bool)

(assert (=> b!1289005 m!1182115))

(declare-fun m!1182117 () Bool)

(assert (=> b!1289005 m!1182117))

(declare-fun m!1182119 () Bool)

(assert (=> b!1289007 m!1182119))

(declare-fun m!1182121 () Bool)

(assert (=> b!1289010 m!1182121))

(assert (=> b!1289010 m!1182121))

(declare-fun m!1182123 () Bool)

(assert (=> b!1289010 m!1182123))

(declare-fun m!1182125 () Bool)

(assert (=> b!1289002 m!1182125))

(assert (=> b!1289002 m!1182125))

(declare-fun m!1182127 () Bool)

(assert (=> b!1289002 m!1182127))

(check-sat (not start!109200) (not b!1289011) (not b!1289010) (not b!1289007) (not b_next!28465) (not b!1289002) (not b!1289005) b_and!46557 tp_is_empty!34105 (not mapNonEmpty!52718))
(check-sat b_and!46557 (not b_next!28465))
