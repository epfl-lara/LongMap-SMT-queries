; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108660 () Bool)

(assert start!108660)

(declare-fun b_free!28173 () Bool)

(declare-fun b_next!28173 () Bool)

(assert (=> start!108660 (= b_free!28173 (not b_next!28173))))

(declare-fun tp!99635 () Bool)

(declare-fun b_and!46239 () Bool)

(assert (=> start!108660 (= tp!99635 b_and!46239)))

(declare-fun b!1282614 () Bool)

(declare-fun res!851944 () Bool)

(declare-fun e!732857 () Bool)

(assert (=> b!1282614 (=> (not res!851944) (not e!732857))))

(declare-datatypes ((array!84696 0))(
  ( (array!84697 (arr!40850 (Array (_ BitVec 32) (_ BitVec 64))) (size!41400 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84696)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84696 (_ BitVec 32)) Bool)

(assert (=> b!1282614 (= res!851944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52277 () Bool)

(declare-fun mapRes!52277 () Bool)

(assert (=> mapIsEmpty!52277 mapRes!52277))

(declare-fun b!1282615 () Bool)

(declare-fun e!732859 () Bool)

(declare-fun tp_is_empty!33813 () Bool)

(assert (=> b!1282615 (= e!732859 tp_is_empty!33813)))

(declare-fun b!1282616 () Bool)

(declare-fun res!851946 () Bool)

(assert (=> b!1282616 (=> (not res!851946) (not e!732857))))

(declare-datatypes ((V!50187 0))(
  ( (V!50188 (val!16981 Int)) )
))
(declare-datatypes ((ValueCell!16008 0))(
  ( (ValueCellFull!16008 (v!19583 V!50187)) (EmptyCell!16008) )
))
(declare-datatypes ((array!84698 0))(
  ( (array!84699 (arr!40851 (Array (_ BitVec 32) ValueCell!16008)) (size!41401 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84698)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1282616 (= res!851946 (and (= (size!41401 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41400 _keys!1741) (size!41401 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282617 () Bool)

(declare-fun e!732858 () Bool)

(assert (=> b!1282617 (= e!732858 tp_is_empty!33813)))

(declare-fun b!1282618 () Bool)

(declare-fun res!851943 () Bool)

(assert (=> b!1282618 (=> (not res!851943) (not e!732857))))

(declare-datatypes ((List!28942 0))(
  ( (Nil!28939) (Cons!28938 (h!30147 (_ BitVec 64)) (t!42486 List!28942)) )
))
(declare-fun arrayNoDuplicates!0 (array!84696 (_ BitVec 32) List!28942) Bool)

(assert (=> b!1282618 (= res!851943 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28939))))

(declare-fun res!851945 () Bool)

(assert (=> start!108660 (=> (not res!851945) (not e!732857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108660 (= res!851945 (validMask!0 mask!2175))))

(assert (=> start!108660 e!732857))

(assert (=> start!108660 tp_is_empty!33813))

(assert (=> start!108660 true))

(declare-fun e!732856 () Bool)

(declare-fun array_inv!30989 (array!84698) Bool)

(assert (=> start!108660 (and (array_inv!30989 _values!1445) e!732856)))

(declare-fun array_inv!30990 (array!84696) Bool)

(assert (=> start!108660 (array_inv!30990 _keys!1741)))

(assert (=> start!108660 tp!99635))

(declare-fun b!1282613 () Bool)

(assert (=> b!1282613 (= e!732856 (and e!732859 mapRes!52277))))

(declare-fun condMapEmpty!52277 () Bool)

(declare-fun mapDefault!52277 () ValueCell!16008)

(assert (=> b!1282613 (= condMapEmpty!52277 (= (arr!40851 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16008)) mapDefault!52277)))))

(declare-fun b!1282619 () Bool)

(declare-fun res!851942 () Bool)

(assert (=> b!1282619 (=> (not res!851942) (not e!732857))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282619 (= res!851942 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41400 _keys!1741))))))

(declare-fun mapNonEmpty!52277 () Bool)

(declare-fun tp!99634 () Bool)

(assert (=> mapNonEmpty!52277 (= mapRes!52277 (and tp!99634 e!732858))))

(declare-fun mapValue!52277 () ValueCell!16008)

(declare-fun mapRest!52277 () (Array (_ BitVec 32) ValueCell!16008))

(declare-fun mapKey!52277 () (_ BitVec 32))

(assert (=> mapNonEmpty!52277 (= (arr!40851 _values!1445) (store mapRest!52277 mapKey!52277 mapValue!52277))))

(declare-fun b!1282620 () Bool)

(assert (=> b!1282620 (= e!732857 false)))

(declare-fun minValue!1387 () V!50187)

(declare-fun zeroValue!1387 () V!50187)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576556 () Bool)

(declare-datatypes ((tuple2!21746 0))(
  ( (tuple2!21747 (_1!10884 (_ BitVec 64)) (_2!10884 V!50187)) )
))
(declare-datatypes ((List!28943 0))(
  ( (Nil!28940) (Cons!28939 (h!30148 tuple2!21746) (t!42487 List!28943)) )
))
(declare-datatypes ((ListLongMap!19403 0))(
  ( (ListLongMap!19404 (toList!9717 List!28943)) )
))
(declare-fun contains!7834 (ListLongMap!19403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4801 (array!84696 array!84698 (_ BitVec 32) (_ BitVec 32) V!50187 V!50187 (_ BitVec 32) Int) ListLongMap!19403)

(assert (=> b!1282620 (= lt!576556 (contains!7834 (getCurrentListMap!4801 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108660 res!851945) b!1282616))

(assert (= (and b!1282616 res!851946) b!1282614))

(assert (= (and b!1282614 res!851944) b!1282618))

(assert (= (and b!1282618 res!851943) b!1282619))

(assert (= (and b!1282619 res!851942) b!1282620))

(assert (= (and b!1282613 condMapEmpty!52277) mapIsEmpty!52277))

(assert (= (and b!1282613 (not condMapEmpty!52277)) mapNonEmpty!52277))

(get-info :version)

(assert (= (and mapNonEmpty!52277 ((_ is ValueCellFull!16008) mapValue!52277)) b!1282617))

(assert (= (and b!1282613 ((_ is ValueCellFull!16008) mapDefault!52277)) b!1282615))

(assert (= start!108660 b!1282613))

(declare-fun m!1176757 () Bool)

(assert (=> start!108660 m!1176757))

(declare-fun m!1176759 () Bool)

(assert (=> start!108660 m!1176759))

(declare-fun m!1176761 () Bool)

(assert (=> start!108660 m!1176761))

(declare-fun m!1176763 () Bool)

(assert (=> b!1282620 m!1176763))

(assert (=> b!1282620 m!1176763))

(declare-fun m!1176765 () Bool)

(assert (=> b!1282620 m!1176765))

(declare-fun m!1176767 () Bool)

(assert (=> b!1282614 m!1176767))

(declare-fun m!1176769 () Bool)

(assert (=> mapNonEmpty!52277 m!1176769))

(declare-fun m!1176771 () Bool)

(assert (=> b!1282618 m!1176771))

(check-sat b_and!46239 (not b_next!28173) (not b!1282618) (not start!108660) (not b!1282620) (not mapNonEmpty!52277) (not b!1282614) tp_is_empty!33813)
(check-sat b_and!46239 (not b_next!28173))
