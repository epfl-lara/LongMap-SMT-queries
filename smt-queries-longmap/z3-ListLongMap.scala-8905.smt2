; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108080 () Bool)

(assert start!108080)

(declare-fun b_free!27793 () Bool)

(declare-fun b_next!27793 () Bool)

(assert (=> start!108080 (= b_free!27793 (not b_next!27793))))

(declare-fun tp!98334 () Bool)

(declare-fun b_and!45831 () Bool)

(assert (=> start!108080 (= tp!98334 b_and!45831)))

(declare-fun b!1276333 () Bool)

(declare-fun e!728823 () Bool)

(declare-fun tp_is_empty!33343 () Bool)

(assert (=> b!1276333 (= e!728823 tp_is_empty!33343)))

(declare-fun b!1276334 () Bool)

(declare-fun e!728826 () Bool)

(declare-fun e!728824 () Bool)

(declare-fun mapRes!51545 () Bool)

(assert (=> b!1276334 (= e!728826 (and e!728824 mapRes!51545))))

(declare-fun condMapEmpty!51545 () Bool)

(declare-datatypes ((V!49561 0))(
  ( (V!49562 (val!16746 Int)) )
))
(declare-datatypes ((ValueCell!15773 0))(
  ( (ValueCellFull!15773 (v!19342 V!49561)) (EmptyCell!15773) )
))
(declare-datatypes ((array!83683 0))(
  ( (array!83684 (arr!40353 (Array (_ BitVec 32) ValueCell!15773)) (size!40905 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83683)

(declare-fun mapDefault!51545 () ValueCell!15773)

(assert (=> b!1276334 (= condMapEmpty!51545 (= (arr!40353 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15773)) mapDefault!51545)))))

(declare-fun mapIsEmpty!51545 () Bool)

(assert (=> mapIsEmpty!51545 mapRes!51545))

(declare-fun mapNonEmpty!51545 () Bool)

(declare-fun tp!98333 () Bool)

(assert (=> mapNonEmpty!51545 (= mapRes!51545 (and tp!98333 e!728823))))

(declare-fun mapRest!51545 () (Array (_ BitVec 32) ValueCell!15773))

(declare-fun mapKey!51545 () (_ BitVec 32))

(declare-fun mapValue!51545 () ValueCell!15773)

(assert (=> mapNonEmpty!51545 (= (arr!40353 _values!1187) (store mapRest!51545 mapKey!51545 mapValue!51545))))

(declare-fun b!1276335 () Bool)

(declare-fun res!848232 () Bool)

(declare-fun e!728825 () Bool)

(assert (=> b!1276335 (=> (not res!848232) (not e!728825))))

(declare-datatypes ((array!83685 0))(
  ( (array!83686 (arr!40354 (Array (_ BitVec 32) (_ BitVec 64))) (size!40906 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83685)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83685 (_ BitVec 32)) Bool)

(assert (=> b!1276335 (= res!848232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276336 () Bool)

(declare-fun res!848233 () Bool)

(assert (=> b!1276336 (=> (not res!848233) (not e!728825))))

(declare-datatypes ((List!28724 0))(
  ( (Nil!28721) (Cons!28720 (h!29929 (_ BitVec 64)) (t!42252 List!28724)) )
))
(declare-fun arrayNoDuplicates!0 (array!83685 (_ BitVec 32) List!28724) Bool)

(assert (=> b!1276336 (= res!848233 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28721))))

(declare-fun b!1276337 () Bool)

(assert (=> b!1276337 (= e!728825 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575304 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49561)

(declare-fun minValue!1129 () V!49561)

(declare-datatypes ((tuple2!21554 0))(
  ( (tuple2!21555 (_1!10788 (_ BitVec 64)) (_2!10788 V!49561)) )
))
(declare-datatypes ((List!28725 0))(
  ( (Nil!28722) (Cons!28721 (h!29930 tuple2!21554) (t!42253 List!28725)) )
))
(declare-datatypes ((ListLongMap!19211 0))(
  ( (ListLongMap!19212 (toList!9621 List!28725)) )
))
(declare-fun contains!7661 (ListLongMap!19211 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4595 (array!83685 array!83683 (_ BitVec 32) (_ BitVec 32) V!49561 V!49561 (_ BitVec 32) Int) ListLongMap!19211)

(assert (=> b!1276337 (= lt!575304 (contains!7661 (getCurrentListMap!4595 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848235 () Bool)

(assert (=> start!108080 (=> (not res!848235) (not e!728825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108080 (= res!848235 (validMask!0 mask!1805))))

(assert (=> start!108080 e!728825))

(assert (=> start!108080 true))

(assert (=> start!108080 tp!98334))

(assert (=> start!108080 tp_is_empty!33343))

(declare-fun array_inv!30823 (array!83683) Bool)

(assert (=> start!108080 (and (array_inv!30823 _values!1187) e!728826)))

(declare-fun array_inv!30824 (array!83685) Bool)

(assert (=> start!108080 (array_inv!30824 _keys!1427)))

(declare-fun b!1276338 () Bool)

(assert (=> b!1276338 (= e!728824 tp_is_empty!33343)))

(declare-fun b!1276339 () Bool)

(declare-fun res!848234 () Bool)

(assert (=> b!1276339 (=> (not res!848234) (not e!728825))))

(assert (=> b!1276339 (= res!848234 (and (= (size!40905 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40906 _keys!1427) (size!40905 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108080 res!848235) b!1276339))

(assert (= (and b!1276339 res!848234) b!1276335))

(assert (= (and b!1276335 res!848232) b!1276336))

(assert (= (and b!1276336 res!848233) b!1276337))

(assert (= (and b!1276334 condMapEmpty!51545) mapIsEmpty!51545))

(assert (= (and b!1276334 (not condMapEmpty!51545)) mapNonEmpty!51545))

(get-info :version)

(assert (= (and mapNonEmpty!51545 ((_ is ValueCellFull!15773) mapValue!51545)) b!1276333))

(assert (= (and b!1276334 ((_ is ValueCellFull!15773) mapDefault!51545)) b!1276338))

(assert (= start!108080 b!1276334))

(declare-fun m!1171821 () Bool)

(assert (=> b!1276335 m!1171821))

(declare-fun m!1171823 () Bool)

(assert (=> b!1276337 m!1171823))

(assert (=> b!1276337 m!1171823))

(declare-fun m!1171825 () Bool)

(assert (=> b!1276337 m!1171825))

(declare-fun m!1171827 () Bool)

(assert (=> b!1276336 m!1171827))

(declare-fun m!1171829 () Bool)

(assert (=> mapNonEmpty!51545 m!1171829))

(declare-fun m!1171831 () Bool)

(assert (=> start!108080 m!1171831))

(declare-fun m!1171833 () Bool)

(assert (=> start!108080 m!1171833))

(declare-fun m!1171835 () Bool)

(assert (=> start!108080 m!1171835))

(check-sat b_and!45831 (not b!1276336) (not b_next!27793) tp_is_empty!33343 (not b!1276337) (not start!108080) (not b!1276335) (not mapNonEmpty!51545))
(check-sat b_and!45831 (not b_next!27793))
