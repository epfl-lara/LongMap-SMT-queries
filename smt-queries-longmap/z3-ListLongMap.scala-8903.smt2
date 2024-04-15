; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108068 () Bool)

(assert start!108068)

(declare-fun b_free!27781 () Bool)

(declare-fun b_next!27781 () Bool)

(assert (=> start!108068 (= b_free!27781 (not b_next!27781))))

(declare-fun tp!98298 () Bool)

(declare-fun b_and!45819 () Bool)

(assert (=> start!108068 (= tp!98298 b_and!45819)))

(declare-fun b!1276207 () Bool)

(declare-fun res!848162 () Bool)

(declare-fun e!728736 () Bool)

(assert (=> b!1276207 (=> (not res!848162) (not e!728736))))

(declare-datatypes ((array!83661 0))(
  ( (array!83662 (arr!40342 (Array (_ BitVec 32) (_ BitVec 64))) (size!40894 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83661)

(declare-datatypes ((List!28715 0))(
  ( (Nil!28712) (Cons!28711 (h!29920 (_ BitVec 64)) (t!42243 List!28715)) )
))
(declare-fun arrayNoDuplicates!0 (array!83661 (_ BitVec 32) List!28715) Bool)

(assert (=> b!1276207 (= res!848162 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28712))))

(declare-fun b!1276208 () Bool)

(declare-fun e!728735 () Bool)

(declare-fun tp_is_empty!33331 () Bool)

(assert (=> b!1276208 (= e!728735 tp_is_empty!33331)))

(declare-fun b!1276209 () Bool)

(assert (=> b!1276209 (= e!728736 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49545 0))(
  ( (V!49546 (val!16740 Int)) )
))
(declare-fun minValue!1129 () V!49545)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575286 () Bool)

(declare-datatypes ((ValueCell!15767 0))(
  ( (ValueCellFull!15767 (v!19336 V!49545)) (EmptyCell!15767) )
))
(declare-datatypes ((array!83663 0))(
  ( (array!83664 (arr!40343 (Array (_ BitVec 32) ValueCell!15767)) (size!40895 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83663)

(declare-fun zeroValue!1129 () V!49545)

(declare-datatypes ((tuple2!21544 0))(
  ( (tuple2!21545 (_1!10783 (_ BitVec 64)) (_2!10783 V!49545)) )
))
(declare-datatypes ((List!28716 0))(
  ( (Nil!28713) (Cons!28712 (h!29921 tuple2!21544) (t!42244 List!28716)) )
))
(declare-datatypes ((ListLongMap!19201 0))(
  ( (ListLongMap!19202 (toList!9616 List!28716)) )
))
(declare-fun contains!7656 (ListLongMap!19201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4590 (array!83661 array!83663 (_ BitVec 32) (_ BitVec 32) V!49545 V!49545 (_ BitVec 32) Int) ListLongMap!19201)

(assert (=> b!1276209 (= lt!575286 (contains!7656 (getCurrentListMap!4590 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276210 () Bool)

(declare-fun res!848163 () Bool)

(assert (=> b!1276210 (=> (not res!848163) (not e!728736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83661 (_ BitVec 32)) Bool)

(assert (=> b!1276210 (= res!848163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51527 () Bool)

(declare-fun mapRes!51527 () Bool)

(assert (=> mapIsEmpty!51527 mapRes!51527))

(declare-fun mapNonEmpty!51527 () Bool)

(declare-fun tp!98297 () Bool)

(declare-fun e!728734 () Bool)

(assert (=> mapNonEmpty!51527 (= mapRes!51527 (and tp!98297 e!728734))))

(declare-fun mapKey!51527 () (_ BitVec 32))

(declare-fun mapRest!51527 () (Array (_ BitVec 32) ValueCell!15767))

(declare-fun mapValue!51527 () ValueCell!15767)

(assert (=> mapNonEmpty!51527 (= (arr!40343 _values!1187) (store mapRest!51527 mapKey!51527 mapValue!51527))))

(declare-fun b!1276212 () Bool)

(assert (=> b!1276212 (= e!728734 tp_is_empty!33331)))

(declare-fun b!1276213 () Bool)

(declare-fun e!728737 () Bool)

(assert (=> b!1276213 (= e!728737 (and e!728735 mapRes!51527))))

(declare-fun condMapEmpty!51527 () Bool)

(declare-fun mapDefault!51527 () ValueCell!15767)

(assert (=> b!1276213 (= condMapEmpty!51527 (= (arr!40343 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15767)) mapDefault!51527)))))

(declare-fun b!1276211 () Bool)

(declare-fun res!848161 () Bool)

(assert (=> b!1276211 (=> (not res!848161) (not e!728736))))

(assert (=> b!1276211 (= res!848161 (and (= (size!40895 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40894 _keys!1427) (size!40895 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848160 () Bool)

(assert (=> start!108068 (=> (not res!848160) (not e!728736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108068 (= res!848160 (validMask!0 mask!1805))))

(assert (=> start!108068 e!728736))

(assert (=> start!108068 true))

(assert (=> start!108068 tp!98298))

(assert (=> start!108068 tp_is_empty!33331))

(declare-fun array_inv!30813 (array!83663) Bool)

(assert (=> start!108068 (and (array_inv!30813 _values!1187) e!728737)))

(declare-fun array_inv!30814 (array!83661) Bool)

(assert (=> start!108068 (array_inv!30814 _keys!1427)))

(assert (= (and start!108068 res!848160) b!1276211))

(assert (= (and b!1276211 res!848161) b!1276210))

(assert (= (and b!1276210 res!848163) b!1276207))

(assert (= (and b!1276207 res!848162) b!1276209))

(assert (= (and b!1276213 condMapEmpty!51527) mapIsEmpty!51527))

(assert (= (and b!1276213 (not condMapEmpty!51527)) mapNonEmpty!51527))

(get-info :version)

(assert (= (and mapNonEmpty!51527 ((_ is ValueCellFull!15767) mapValue!51527)) b!1276212))

(assert (= (and b!1276213 ((_ is ValueCellFull!15767) mapDefault!51527)) b!1276208))

(assert (= start!108068 b!1276213))

(declare-fun m!1171725 () Bool)

(assert (=> b!1276209 m!1171725))

(assert (=> b!1276209 m!1171725))

(declare-fun m!1171727 () Bool)

(assert (=> b!1276209 m!1171727))

(declare-fun m!1171729 () Bool)

(assert (=> b!1276210 m!1171729))

(declare-fun m!1171731 () Bool)

(assert (=> mapNonEmpty!51527 m!1171731))

(declare-fun m!1171733 () Bool)

(assert (=> b!1276207 m!1171733))

(declare-fun m!1171735 () Bool)

(assert (=> start!108068 m!1171735))

(declare-fun m!1171737 () Bool)

(assert (=> start!108068 m!1171737))

(declare-fun m!1171739 () Bool)

(assert (=> start!108068 m!1171739))

(check-sat (not b_next!27781) (not b!1276210) (not b!1276207) b_and!45819 tp_is_empty!33331 (not b!1276209) (not start!108068) (not mapNonEmpty!51527))
(check-sat b_and!45819 (not b_next!27781))
