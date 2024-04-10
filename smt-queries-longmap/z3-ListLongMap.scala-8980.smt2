; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108642 () Bool)

(assert start!108642)

(declare-fun b_free!28155 () Bool)

(declare-fun b_next!28155 () Bool)

(assert (=> start!108642 (= b_free!28155 (not b_next!28155))))

(declare-fun tp!99581 () Bool)

(declare-fun b_and!46221 () Bool)

(assert (=> start!108642 (= tp!99581 b_and!46221)))

(declare-fun mapNonEmpty!52250 () Bool)

(declare-fun mapRes!52250 () Bool)

(declare-fun tp!99580 () Bool)

(declare-fun e!732725 () Bool)

(assert (=> mapNonEmpty!52250 (= mapRes!52250 (and tp!99580 e!732725))))

(declare-datatypes ((V!50163 0))(
  ( (V!50164 (val!16972 Int)) )
))
(declare-datatypes ((ValueCell!15999 0))(
  ( (ValueCellFull!15999 (v!19574 V!50163)) (EmptyCell!15999) )
))
(declare-datatypes ((array!84660 0))(
  ( (array!84661 (arr!40832 (Array (_ BitVec 32) ValueCell!15999)) (size!41382 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84660)

(declare-fun mapValue!52250 () ValueCell!15999)

(declare-fun mapRest!52250 () (Array (_ BitVec 32) ValueCell!15999))

(declare-fun mapKey!52250 () (_ BitVec 32))

(assert (=> mapNonEmpty!52250 (= (arr!40832 _values!1445) (store mapRest!52250 mapKey!52250 mapValue!52250))))

(declare-fun b!1282397 () Bool)

(declare-fun e!732723 () Bool)

(declare-fun e!732724 () Bool)

(assert (=> b!1282397 (= e!732723 (and e!732724 mapRes!52250))))

(declare-fun condMapEmpty!52250 () Bool)

(declare-fun mapDefault!52250 () ValueCell!15999)

(assert (=> b!1282397 (= condMapEmpty!52250 (= (arr!40832 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15999)) mapDefault!52250)))))

(declare-fun res!851811 () Bool)

(declare-fun e!732721 () Bool)

(assert (=> start!108642 (=> (not res!851811) (not e!732721))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108642 (= res!851811 (validMask!0 mask!2175))))

(assert (=> start!108642 e!732721))

(declare-fun tp_is_empty!33795 () Bool)

(assert (=> start!108642 tp_is_empty!33795))

(assert (=> start!108642 true))

(declare-fun array_inv!30979 (array!84660) Bool)

(assert (=> start!108642 (and (array_inv!30979 _values!1445) e!732723)))

(declare-datatypes ((array!84662 0))(
  ( (array!84663 (arr!40833 (Array (_ BitVec 32) (_ BitVec 64))) (size!41383 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84662)

(declare-fun array_inv!30980 (array!84662) Bool)

(assert (=> start!108642 (array_inv!30980 _keys!1741)))

(assert (=> start!108642 tp!99581))

(declare-fun b!1282398 () Bool)

(declare-fun res!851810 () Bool)

(assert (=> b!1282398 (=> (not res!851810) (not e!732721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84662 (_ BitVec 32)) Bool)

(assert (=> b!1282398 (= res!851810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282399 () Bool)

(assert (=> b!1282399 (= e!732721 false)))

(declare-fun minValue!1387 () V!50163)

(declare-fun zeroValue!1387 () V!50163)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576529 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21734 0))(
  ( (tuple2!21735 (_1!10878 (_ BitVec 64)) (_2!10878 V!50163)) )
))
(declare-datatypes ((List!28929 0))(
  ( (Nil!28926) (Cons!28925 (h!30134 tuple2!21734) (t!42473 List!28929)) )
))
(declare-datatypes ((ListLongMap!19391 0))(
  ( (ListLongMap!19392 (toList!9711 List!28929)) )
))
(declare-fun contains!7828 (ListLongMap!19391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4795 (array!84662 array!84660 (_ BitVec 32) (_ BitVec 32) V!50163 V!50163 (_ BitVec 32) Int) ListLongMap!19391)

(assert (=> b!1282399 (= lt!576529 (contains!7828 (getCurrentListMap!4795 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1282400 () Bool)

(assert (=> b!1282400 (= e!732724 tp_is_empty!33795)))

(declare-fun mapIsEmpty!52250 () Bool)

(assert (=> mapIsEmpty!52250 mapRes!52250))

(declare-fun b!1282401 () Bool)

(assert (=> b!1282401 (= e!732725 tp_is_empty!33795)))

(declare-fun b!1282402 () Bool)

(declare-fun res!851807 () Bool)

(assert (=> b!1282402 (=> (not res!851807) (not e!732721))))

(assert (=> b!1282402 (= res!851807 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41383 _keys!1741))))))

(declare-fun b!1282403 () Bool)

(declare-fun res!851809 () Bool)

(assert (=> b!1282403 (=> (not res!851809) (not e!732721))))

(assert (=> b!1282403 (= res!851809 (and (= (size!41382 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41383 _keys!1741) (size!41382 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282404 () Bool)

(declare-fun res!851808 () Bool)

(assert (=> b!1282404 (=> (not res!851808) (not e!732721))))

(declare-datatypes ((List!28930 0))(
  ( (Nil!28927) (Cons!28926 (h!30135 (_ BitVec 64)) (t!42474 List!28930)) )
))
(declare-fun arrayNoDuplicates!0 (array!84662 (_ BitVec 32) List!28930) Bool)

(assert (=> b!1282404 (= res!851808 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28927))))

(assert (= (and start!108642 res!851811) b!1282403))

(assert (= (and b!1282403 res!851809) b!1282398))

(assert (= (and b!1282398 res!851810) b!1282404))

(assert (= (and b!1282404 res!851808) b!1282402))

(assert (= (and b!1282402 res!851807) b!1282399))

(assert (= (and b!1282397 condMapEmpty!52250) mapIsEmpty!52250))

(assert (= (and b!1282397 (not condMapEmpty!52250)) mapNonEmpty!52250))

(get-info :version)

(assert (= (and mapNonEmpty!52250 ((_ is ValueCellFull!15999) mapValue!52250)) b!1282401))

(assert (= (and b!1282397 ((_ is ValueCellFull!15999) mapDefault!52250)) b!1282400))

(assert (= start!108642 b!1282397))

(declare-fun m!1176613 () Bool)

(assert (=> b!1282398 m!1176613))

(declare-fun m!1176615 () Bool)

(assert (=> b!1282404 m!1176615))

(declare-fun m!1176617 () Bool)

(assert (=> b!1282399 m!1176617))

(assert (=> b!1282399 m!1176617))

(declare-fun m!1176619 () Bool)

(assert (=> b!1282399 m!1176619))

(declare-fun m!1176621 () Bool)

(assert (=> mapNonEmpty!52250 m!1176621))

(declare-fun m!1176623 () Bool)

(assert (=> start!108642 m!1176623))

(declare-fun m!1176625 () Bool)

(assert (=> start!108642 m!1176625))

(declare-fun m!1176627 () Bool)

(assert (=> start!108642 m!1176627))

(check-sat (not b!1282398) (not mapNonEmpty!52250) (not start!108642) (not b!1282404) (not b!1282399) tp_is_empty!33795 (not b_next!28155) b_and!46221)
(check-sat b_and!46221 (not b_next!28155))
