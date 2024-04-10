; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108482 () Bool)

(assert start!108482)

(declare-fun b_free!28029 () Bool)

(declare-fun b_next!28029 () Bool)

(assert (=> start!108482 (= b_free!28029 (not b_next!28029))))

(declare-fun tp!99197 () Bool)

(declare-fun b_and!46089 () Bool)

(assert (=> start!108482 (= tp!99197 b_and!46089)))

(declare-fun b!1280361 () Bool)

(declare-fun res!850488 () Bool)

(declare-fun e!731584 () Bool)

(assert (=> b!1280361 (=> (not res!850488) (not e!731584))))

(declare-datatypes ((array!84416 0))(
  ( (array!84417 (arr!40712 (Array (_ BitVec 32) (_ BitVec 64))) (size!41262 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84416)

(declare-datatypes ((List!28839 0))(
  ( (Nil!28836) (Cons!28835 (h!30044 (_ BitVec 64)) (t!42379 List!28839)) )
))
(declare-fun arrayNoDuplicates!0 (array!84416 (_ BitVec 32) List!28839) Bool)

(assert (=> b!1280361 (= res!850488 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28836))))

(declare-fun mapNonEmpty!52055 () Bool)

(declare-fun mapRes!52055 () Bool)

(declare-fun tp!99196 () Bool)

(declare-fun e!731581 () Bool)

(assert (=> mapNonEmpty!52055 (= mapRes!52055 (and tp!99196 e!731581))))

(declare-datatypes ((V!49995 0))(
  ( (V!49996 (val!16909 Int)) )
))
(declare-datatypes ((ValueCell!15936 0))(
  ( (ValueCellFull!15936 (v!19509 V!49995)) (EmptyCell!15936) )
))
(declare-fun mapValue!52055 () ValueCell!15936)

(declare-fun mapRest!52055 () (Array (_ BitVec 32) ValueCell!15936))

(declare-datatypes ((array!84418 0))(
  ( (array!84419 (arr!40713 (Array (_ BitVec 32) ValueCell!15936)) (size!41263 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84418)

(declare-fun mapKey!52055 () (_ BitVec 32))

(assert (=> mapNonEmpty!52055 (= (arr!40713 _values!1445) (store mapRest!52055 mapKey!52055 mapValue!52055))))

(declare-fun b!1280362 () Bool)

(declare-fun e!731585 () Bool)

(declare-fun tp_is_empty!33669 () Bool)

(assert (=> b!1280362 (= e!731585 tp_is_empty!33669)))

(declare-fun b!1280364 () Bool)

(declare-fun res!850487 () Bool)

(assert (=> b!1280364 (=> (not res!850487) (not e!731584))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280364 (= res!850487 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41262 _keys!1741))))))

(declare-fun b!1280365 () Bool)

(assert (=> b!1280365 (= e!731584 false)))

(declare-fun zeroValue!1387 () V!49995)

(declare-fun lt!576116 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!49995)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21640 0))(
  ( (tuple2!21641 (_1!10831 (_ BitVec 64)) (_2!10831 V!49995)) )
))
(declare-datatypes ((List!28840 0))(
  ( (Nil!28837) (Cons!28836 (h!30045 tuple2!21640) (t!42380 List!28840)) )
))
(declare-datatypes ((ListLongMap!19297 0))(
  ( (ListLongMap!19298 (toList!9664 List!28840)) )
))
(declare-fun contains!7779 (ListLongMap!19297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4748 (array!84416 array!84418 (_ BitVec 32) (_ BitVec 32) V!49995 V!49995 (_ BitVec 32) Int) ListLongMap!19297)

(assert (=> b!1280365 (= lt!576116 (contains!7779 (getCurrentListMap!4748 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280366 () Bool)

(declare-fun res!850486 () Bool)

(assert (=> b!1280366 (=> (not res!850486) (not e!731584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84416 (_ BitVec 32)) Bool)

(assert (=> b!1280366 (= res!850486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280367 () Bool)

(assert (=> b!1280367 (= e!731581 tp_is_empty!33669)))

(declare-fun mapIsEmpty!52055 () Bool)

(assert (=> mapIsEmpty!52055 mapRes!52055))

(declare-fun b!1280368 () Bool)

(declare-fun e!731583 () Bool)

(assert (=> b!1280368 (= e!731583 (and e!731585 mapRes!52055))))

(declare-fun condMapEmpty!52055 () Bool)

(declare-fun mapDefault!52055 () ValueCell!15936)

(assert (=> b!1280368 (= condMapEmpty!52055 (= (arr!40713 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15936)) mapDefault!52055)))))

(declare-fun b!1280363 () Bool)

(declare-fun res!850489 () Bool)

(assert (=> b!1280363 (=> (not res!850489) (not e!731584))))

(assert (=> b!1280363 (= res!850489 (and (= (size!41263 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41262 _keys!1741) (size!41263 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850490 () Bool)

(assert (=> start!108482 (=> (not res!850490) (not e!731584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108482 (= res!850490 (validMask!0 mask!2175))))

(assert (=> start!108482 e!731584))

(assert (=> start!108482 tp_is_empty!33669))

(assert (=> start!108482 true))

(declare-fun array_inv!30901 (array!84418) Bool)

(assert (=> start!108482 (and (array_inv!30901 _values!1445) e!731583)))

(declare-fun array_inv!30902 (array!84416) Bool)

(assert (=> start!108482 (array_inv!30902 _keys!1741)))

(assert (=> start!108482 tp!99197))

(assert (= (and start!108482 res!850490) b!1280363))

(assert (= (and b!1280363 res!850489) b!1280366))

(assert (= (and b!1280366 res!850486) b!1280361))

(assert (= (and b!1280361 res!850488) b!1280364))

(assert (= (and b!1280364 res!850487) b!1280365))

(assert (= (and b!1280368 condMapEmpty!52055) mapIsEmpty!52055))

(assert (= (and b!1280368 (not condMapEmpty!52055)) mapNonEmpty!52055))

(get-info :version)

(assert (= (and mapNonEmpty!52055 ((_ is ValueCellFull!15936) mapValue!52055)) b!1280367))

(assert (= (and b!1280368 ((_ is ValueCellFull!15936) mapDefault!52055)) b!1280362))

(assert (= start!108482 b!1280368))

(declare-fun m!1175013 () Bool)

(assert (=> b!1280361 m!1175013))

(declare-fun m!1175015 () Bool)

(assert (=> mapNonEmpty!52055 m!1175015))

(declare-fun m!1175017 () Bool)

(assert (=> start!108482 m!1175017))

(declare-fun m!1175019 () Bool)

(assert (=> start!108482 m!1175019))

(declare-fun m!1175021 () Bool)

(assert (=> start!108482 m!1175021))

(declare-fun m!1175023 () Bool)

(assert (=> b!1280366 m!1175023))

(declare-fun m!1175025 () Bool)

(assert (=> b!1280365 m!1175025))

(assert (=> b!1280365 m!1175025))

(declare-fun m!1175027 () Bool)

(assert (=> b!1280365 m!1175027))

(check-sat (not b!1280361) (not start!108482) tp_is_empty!33669 (not b!1280365) (not b!1280366) (not b_next!28029) b_and!46089 (not mapNonEmpty!52055))
(check-sat b_and!46089 (not b_next!28029))
