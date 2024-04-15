; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108200 () Bool)

(assert start!108200)

(declare-fun b_free!27895 () Bool)

(declare-fun b_next!27895 () Bool)

(assert (=> start!108200 (= b_free!27895 (not b_next!27895))))

(declare-fun tp!98643 () Bool)

(declare-fun b_and!45935 () Bool)

(assert (=> start!108200 (= tp!98643 b_and!45935)))

(declare-fun res!848952 () Bool)

(declare-fun e!729696 () Bool)

(assert (=> start!108200 (=> (not res!848952) (not e!729696))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108200 (= res!848952 (validMask!0 mask!1805))))

(assert (=> start!108200 e!729696))

(assert (=> start!108200 true))

(assert (=> start!108200 tp!98643))

(declare-fun tp_is_empty!33445 () Bool)

(assert (=> start!108200 tp_is_empty!33445))

(declare-datatypes ((V!49697 0))(
  ( (V!49698 (val!16797 Int)) )
))
(declare-datatypes ((ValueCell!15824 0))(
  ( (ValueCellFull!15824 (v!19394 V!49697)) (EmptyCell!15824) )
))
(declare-datatypes ((array!83879 0))(
  ( (array!83880 (arr!40450 (Array (_ BitVec 32) ValueCell!15824)) (size!41002 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83879)

(declare-fun e!729699 () Bool)

(declare-fun array_inv!30893 (array!83879) Bool)

(assert (=> start!108200 (and (array_inv!30893 _values!1187) e!729699)))

(declare-datatypes ((array!83881 0))(
  ( (array!83882 (arr!40451 (Array (_ BitVec 32) (_ BitVec 64))) (size!41003 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83881)

(declare-fun array_inv!30894 (array!83881) Bool)

(assert (=> start!108200 (array_inv!30894 _keys!1427)))

(declare-fun b!1277633 () Bool)

(declare-fun e!729698 () Bool)

(declare-fun mapRes!51701 () Bool)

(assert (=> b!1277633 (= e!729699 (and e!729698 mapRes!51701))))

(declare-fun condMapEmpty!51701 () Bool)

(declare-fun mapDefault!51701 () ValueCell!15824)

(assert (=> b!1277633 (= condMapEmpty!51701 (= (arr!40450 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15824)) mapDefault!51701)))))

(declare-fun mapNonEmpty!51701 () Bool)

(declare-fun tp!98642 () Bool)

(declare-fun e!729700 () Bool)

(assert (=> mapNonEmpty!51701 (= mapRes!51701 (and tp!98642 e!729700))))

(declare-fun mapValue!51701 () ValueCell!15824)

(declare-fun mapKey!51701 () (_ BitVec 32))

(declare-fun mapRest!51701 () (Array (_ BitVec 32) ValueCell!15824))

(assert (=> mapNonEmpty!51701 (= (arr!40450 _values!1187) (store mapRest!51701 mapKey!51701 mapValue!51701))))

(declare-fun b!1277634 () Bool)

(assert (=> b!1277634 (= e!729696 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575556 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49697)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49697)

(declare-datatypes ((tuple2!21626 0))(
  ( (tuple2!21627 (_1!10824 (_ BitVec 64)) (_2!10824 V!49697)) )
))
(declare-datatypes ((List!28798 0))(
  ( (Nil!28795) (Cons!28794 (h!30003 tuple2!21626) (t!42328 List!28798)) )
))
(declare-datatypes ((ListLongMap!19283 0))(
  ( (ListLongMap!19284 (toList!9657 List!28798)) )
))
(declare-fun contains!7698 (ListLongMap!19283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4631 (array!83881 array!83879 (_ BitVec 32) (_ BitVec 32) V!49697 V!49697 (_ BitVec 32) Int) ListLongMap!19283)

(assert (=> b!1277634 (= lt!575556 (contains!7698 (getCurrentListMap!4631 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277635 () Bool)

(assert (=> b!1277635 (= e!729700 tp_is_empty!33445)))

(declare-fun mapIsEmpty!51701 () Bool)

(assert (=> mapIsEmpty!51701 mapRes!51701))

(declare-fun b!1277636 () Bool)

(assert (=> b!1277636 (= e!729698 tp_is_empty!33445)))

(declare-fun b!1277637 () Bool)

(declare-fun res!848949 () Bool)

(assert (=> b!1277637 (=> (not res!848949) (not e!729696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83881 (_ BitVec 32)) Bool)

(assert (=> b!1277637 (= res!848949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277638 () Bool)

(declare-fun res!848950 () Bool)

(assert (=> b!1277638 (=> (not res!848950) (not e!729696))))

(assert (=> b!1277638 (= res!848950 (and (= (size!41002 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41003 _keys!1427) (size!41002 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277639 () Bool)

(declare-fun res!848951 () Bool)

(assert (=> b!1277639 (=> (not res!848951) (not e!729696))))

(declare-datatypes ((List!28799 0))(
  ( (Nil!28796) (Cons!28795 (h!30004 (_ BitVec 64)) (t!42329 List!28799)) )
))
(declare-fun arrayNoDuplicates!0 (array!83881 (_ BitVec 32) List!28799) Bool)

(assert (=> b!1277639 (= res!848951 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28796))))

(assert (= (and start!108200 res!848952) b!1277638))

(assert (= (and b!1277638 res!848950) b!1277637))

(assert (= (and b!1277637 res!848949) b!1277639))

(assert (= (and b!1277639 res!848951) b!1277634))

(assert (= (and b!1277633 condMapEmpty!51701) mapIsEmpty!51701))

(assert (= (and b!1277633 (not condMapEmpty!51701)) mapNonEmpty!51701))

(get-info :version)

(assert (= (and mapNonEmpty!51701 ((_ is ValueCellFull!15824) mapValue!51701)) b!1277635))

(assert (= (and b!1277633 ((_ is ValueCellFull!15824) mapDefault!51701)) b!1277636))

(assert (= start!108200 b!1277633))

(declare-fun m!1172757 () Bool)

(assert (=> b!1277637 m!1172757))

(declare-fun m!1172759 () Bool)

(assert (=> b!1277639 m!1172759))

(declare-fun m!1172761 () Bool)

(assert (=> start!108200 m!1172761))

(declare-fun m!1172763 () Bool)

(assert (=> start!108200 m!1172763))

(declare-fun m!1172765 () Bool)

(assert (=> start!108200 m!1172765))

(declare-fun m!1172767 () Bool)

(assert (=> b!1277634 m!1172767))

(assert (=> b!1277634 m!1172767))

(declare-fun m!1172769 () Bool)

(assert (=> b!1277634 m!1172769))

(declare-fun m!1172771 () Bool)

(assert (=> mapNonEmpty!51701 m!1172771))

(check-sat (not b!1277639) (not b_next!27895) (not mapNonEmpty!51701) tp_is_empty!33445 (not start!108200) b_and!45935 (not b!1277634) (not b!1277637))
(check-sat b_and!45935 (not b_next!27895))
