; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!924 () Bool)

(assert start!924)

(declare-fun b_free!297 () Bool)

(declare-fun b_next!297 () Bool)

(assert (=> start!924 (= b_free!297 (not b_next!297))))

(declare-fun tp!1123 () Bool)

(declare-fun b_and!445 () Bool)

(assert (=> start!924 (= tp!1123 b_and!445)))

(declare-fun mapIsEmpty!536 () Bool)

(declare-fun mapRes!536 () Bool)

(assert (=> mapIsEmpty!536 mapRes!536))

(declare-fun b!7764 () Bool)

(declare-fun e!4363 () Bool)

(declare-fun e!4367 () Bool)

(assert (=> b!7764 (= e!4363 (and e!4367 mapRes!536))))

(declare-fun condMapEmpty!536 () Bool)

(declare-datatypes ((V!677 0))(
  ( (V!678 (val!193 Int)) )
))
(declare-datatypes ((ValueCell!171 0))(
  ( (ValueCellFull!171 (v!1285 V!677)) (EmptyCell!171) )
))
(declare-datatypes ((array!683 0))(
  ( (array!684 (arr!329 (Array (_ BitVec 32) ValueCell!171)) (size!391 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!683)

(declare-fun mapDefault!536 () ValueCell!171)

(assert (=> b!7764 (= condMapEmpty!536 (= (arr!329 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!171)) mapDefault!536)))))

(declare-fun b!7765 () Bool)

(declare-fun e!4364 () Bool)

(assert (=> b!7765 (= e!4364 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!1584 () Bool)

(declare-fun minValue!1434 () V!677)

(declare-datatypes ((array!685 0))(
  ( (array!686 (arr!330 (Array (_ BitVec 32) (_ BitVec 64))) (size!392 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!685)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!677)

(declare-datatypes ((tuple2!212 0))(
  ( (tuple2!213 (_1!106 (_ BitVec 64)) (_2!106 V!677)) )
))
(declare-datatypes ((List!222 0))(
  ( (Nil!219) (Cons!218 (h!784 tuple2!212) (t!2359 List!222)) )
))
(declare-datatypes ((ListLongMap!217 0))(
  ( (ListLongMap!218 (toList!124 List!222)) )
))
(declare-fun contains!99 (ListLongMap!217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!83 (array!685 array!683 (_ BitVec 32) (_ BitVec 32) V!677 V!677 (_ BitVec 32) Int) ListLongMap!217)

(assert (=> b!7765 (= lt!1584 (contains!99 (getCurrentListMap!83 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7766 () Bool)

(declare-fun res!7594 () Bool)

(assert (=> b!7766 (=> (not res!7594) (not e!4364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!685 (_ BitVec 32)) Bool)

(assert (=> b!7766 (= res!7594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7767 () Bool)

(declare-fun tp_is_empty!375 () Bool)

(assert (=> b!7767 (= e!4367 tp_is_empty!375)))

(declare-fun b!7768 () Bool)

(declare-fun res!7591 () Bool)

(assert (=> b!7768 (=> (not res!7591) (not e!4364))))

(assert (=> b!7768 (= res!7591 (and (= (size!391 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!392 _keys!1806) (size!391 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7769 () Bool)

(declare-fun res!7592 () Bool)

(assert (=> b!7769 (=> (not res!7592) (not e!4364))))

(declare-datatypes ((List!223 0))(
  ( (Nil!220) (Cons!219 (h!785 (_ BitVec 64)) (t!2360 List!223)) )
))
(declare-fun arrayNoDuplicates!0 (array!685 (_ BitVec 32) List!223) Bool)

(assert (=> b!7769 (= res!7592 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!220))))

(declare-fun res!7593 () Bool)

(assert (=> start!924 (=> (not res!7593) (not e!4364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!924 (= res!7593 (validMask!0 mask!2250))))

(assert (=> start!924 e!4364))

(assert (=> start!924 tp!1123))

(assert (=> start!924 true))

(declare-fun array_inv!245 (array!683) Bool)

(assert (=> start!924 (and (array_inv!245 _values!1492) e!4363)))

(assert (=> start!924 tp_is_empty!375))

(declare-fun array_inv!246 (array!685) Bool)

(assert (=> start!924 (array_inv!246 _keys!1806)))

(declare-fun mapNonEmpty!536 () Bool)

(declare-fun tp!1124 () Bool)

(declare-fun e!4366 () Bool)

(assert (=> mapNonEmpty!536 (= mapRes!536 (and tp!1124 e!4366))))

(declare-fun mapValue!536 () ValueCell!171)

(declare-fun mapRest!536 () (Array (_ BitVec 32) ValueCell!171))

(declare-fun mapKey!536 () (_ BitVec 32))

(assert (=> mapNonEmpty!536 (= (arr!329 _values!1492) (store mapRest!536 mapKey!536 mapValue!536))))

(declare-fun b!7770 () Bool)

(assert (=> b!7770 (= e!4366 tp_is_empty!375)))

(assert (= (and start!924 res!7593) b!7768))

(assert (= (and b!7768 res!7591) b!7766))

(assert (= (and b!7766 res!7594) b!7769))

(assert (= (and b!7769 res!7592) b!7765))

(assert (= (and b!7764 condMapEmpty!536) mapIsEmpty!536))

(assert (= (and b!7764 (not condMapEmpty!536)) mapNonEmpty!536))

(get-info :version)

(assert (= (and mapNonEmpty!536 ((_ is ValueCellFull!171) mapValue!536)) b!7770))

(assert (= (and b!7764 ((_ is ValueCellFull!171) mapDefault!536)) b!7767))

(assert (= start!924 b!7764))

(declare-fun m!4725 () Bool)

(assert (=> b!7766 m!4725))

(declare-fun m!4727 () Bool)

(assert (=> b!7769 m!4727))

(declare-fun m!4729 () Bool)

(assert (=> start!924 m!4729))

(declare-fun m!4731 () Bool)

(assert (=> start!924 m!4731))

(declare-fun m!4733 () Bool)

(assert (=> start!924 m!4733))

(declare-fun m!4735 () Bool)

(assert (=> mapNonEmpty!536 m!4735))

(declare-fun m!4737 () Bool)

(assert (=> b!7765 m!4737))

(assert (=> b!7765 m!4737))

(declare-fun m!4739 () Bool)

(assert (=> b!7765 m!4739))

(check-sat (not start!924) tp_is_empty!375 (not b!7765) (not b_next!297) (not b!7766) b_and!445 (not mapNonEmpty!536) (not b!7769))
(check-sat b_and!445 (not b_next!297))