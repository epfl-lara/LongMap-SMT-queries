; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108298 () Bool)

(assert start!108298)

(declare-fun b_free!27787 () Bool)

(declare-fun b_next!27787 () Bool)

(assert (=> start!108298 (= b_free!27787 (not b_next!27787))))

(declare-fun tp!98315 () Bool)

(declare-fun b_and!45845 () Bool)

(assert (=> start!108298 (= tp!98315 b_and!45845)))

(declare-fun b!1277639 () Bool)

(declare-fun e!729658 () Bool)

(declare-fun e!729656 () Bool)

(declare-fun mapRes!51536 () Bool)

(assert (=> b!1277639 (= e!729658 (and e!729656 mapRes!51536))))

(declare-fun condMapEmpty!51536 () Bool)

(declare-datatypes ((V!49553 0))(
  ( (V!49554 (val!16743 Int)) )
))
(declare-datatypes ((ValueCell!15770 0))(
  ( (ValueCellFull!15770 (v!19335 V!49553)) (EmptyCell!15770) )
))
(declare-datatypes ((array!83797 0))(
  ( (array!83798 (arr!40405 (Array (_ BitVec 32) ValueCell!15770)) (size!40956 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83797)

(declare-fun mapDefault!51536 () ValueCell!15770)

(assert (=> b!1277639 (= condMapEmpty!51536 (= (arr!40405 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15770)) mapDefault!51536)))))

(declare-fun b!1277640 () Bool)

(declare-fun res!848743 () Bool)

(declare-fun e!729654 () Bool)

(assert (=> b!1277640 (=> (not res!848743) (not e!729654))))

(declare-datatypes ((array!83799 0))(
  ( (array!83800 (arr!40406 (Array (_ BitVec 32) (_ BitVec 64))) (size!40957 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83799)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83799 (_ BitVec 32)) Bool)

(assert (=> b!1277640 (= res!848743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51536 () Bool)

(assert (=> mapIsEmpty!51536 mapRes!51536))

(declare-fun b!1277641 () Bool)

(declare-fun e!729657 () Bool)

(declare-fun tp_is_empty!33337 () Bool)

(assert (=> b!1277641 (= e!729657 tp_is_empty!33337)))

(declare-fun b!1277642 () Bool)

(assert (=> b!1277642 (= e!729654 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49553)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575957 () Bool)

(declare-fun zeroValue!1129 () V!49553)

(declare-datatypes ((tuple2!21482 0))(
  ( (tuple2!21483 (_1!10752 (_ BitVec 64)) (_2!10752 V!49553)) )
))
(declare-datatypes ((List!28676 0))(
  ( (Nil!28673) (Cons!28672 (h!29890 tuple2!21482) (t!42204 List!28676)) )
))
(declare-datatypes ((ListLongMap!19147 0))(
  ( (ListLongMap!19148 (toList!9589 List!28676)) )
))
(declare-fun contains!7713 (ListLongMap!19147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4658 (array!83799 array!83797 (_ BitVec 32) (_ BitVec 32) V!49553 V!49553 (_ BitVec 32) Int) ListLongMap!19147)

(assert (=> b!1277642 (= lt!575957 (contains!7713 (getCurrentListMap!4658 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277643 () Bool)

(declare-fun res!848744 () Bool)

(assert (=> b!1277643 (=> (not res!848744) (not e!729654))))

(declare-datatypes ((List!28677 0))(
  ( (Nil!28674) (Cons!28673 (h!29891 (_ BitVec 64)) (t!42205 List!28677)) )
))
(declare-fun arrayNoDuplicates!0 (array!83799 (_ BitVec 32) List!28677) Bool)

(assert (=> b!1277643 (= res!848744 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28674))))

(declare-fun mapNonEmpty!51536 () Bool)

(declare-fun tp!98314 () Bool)

(assert (=> mapNonEmpty!51536 (= mapRes!51536 (and tp!98314 e!729657))))

(declare-fun mapKey!51536 () (_ BitVec 32))

(declare-fun mapRest!51536 () (Array (_ BitVec 32) ValueCell!15770))

(declare-fun mapValue!51536 () ValueCell!15770)

(assert (=> mapNonEmpty!51536 (= (arr!40405 _values!1187) (store mapRest!51536 mapKey!51536 mapValue!51536))))

(declare-fun b!1277644 () Bool)

(declare-fun res!848746 () Bool)

(assert (=> b!1277644 (=> (not res!848746) (not e!729654))))

(assert (=> b!1277644 (= res!848746 (and (= (size!40956 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40957 _keys!1427) (size!40956 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277645 () Bool)

(assert (=> b!1277645 (= e!729656 tp_is_empty!33337)))

(declare-fun res!848745 () Bool)

(assert (=> start!108298 (=> (not res!848745) (not e!729654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108298 (= res!848745 (validMask!0 mask!1805))))

(assert (=> start!108298 e!729654))

(assert (=> start!108298 true))

(assert (=> start!108298 tp!98315))

(assert (=> start!108298 tp_is_empty!33337))

(declare-fun array_inv!30893 (array!83797) Bool)

(assert (=> start!108298 (and (array_inv!30893 _values!1187) e!729658)))

(declare-fun array_inv!30894 (array!83799) Bool)

(assert (=> start!108298 (array_inv!30894 _keys!1427)))

(assert (= (and start!108298 res!848745) b!1277644))

(assert (= (and b!1277644 res!848746) b!1277640))

(assert (= (and b!1277640 res!848743) b!1277643))

(assert (= (and b!1277643 res!848744) b!1277642))

(assert (= (and b!1277639 condMapEmpty!51536) mapIsEmpty!51536))

(assert (= (and b!1277639 (not condMapEmpty!51536)) mapNonEmpty!51536))

(get-info :version)

(assert (= (and mapNonEmpty!51536 ((_ is ValueCellFull!15770) mapValue!51536)) b!1277641))

(assert (= (and b!1277639 ((_ is ValueCellFull!15770) mapDefault!51536)) b!1277645))

(assert (= start!108298 b!1277639))

(declare-fun m!1173885 () Bool)

(assert (=> b!1277643 m!1173885))

(declare-fun m!1173887 () Bool)

(assert (=> mapNonEmpty!51536 m!1173887))

(declare-fun m!1173889 () Bool)

(assert (=> b!1277640 m!1173889))

(declare-fun m!1173891 () Bool)

(assert (=> b!1277642 m!1173891))

(assert (=> b!1277642 m!1173891))

(declare-fun m!1173893 () Bool)

(assert (=> b!1277642 m!1173893))

(declare-fun m!1173895 () Bool)

(assert (=> start!108298 m!1173895))

(declare-fun m!1173897 () Bool)

(assert (=> start!108298 m!1173897))

(declare-fun m!1173899 () Bool)

(assert (=> start!108298 m!1173899))

(check-sat (not start!108298) (not b!1277640) (not b!1277643) (not mapNonEmpty!51536) b_and!45845 (not b!1277642) tp_is_empty!33337 (not b_next!27787))
(check-sat b_and!45845 (not b_next!27787))
