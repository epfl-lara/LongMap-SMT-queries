; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108316 () Bool)

(assert start!108316)

(declare-fun b_free!27805 () Bool)

(declare-fun b_next!27805 () Bool)

(assert (=> start!108316 (= b_free!27805 (not b_next!27805))))

(declare-fun tp!98368 () Bool)

(declare-fun b_and!45863 () Bool)

(assert (=> start!108316 (= tp!98368 b_and!45863)))

(declare-fun b!1277828 () Bool)

(declare-fun e!729790 () Bool)

(assert (=> b!1277828 (= e!729790 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49577 0))(
  ( (V!49578 (val!16752 Int)) )
))
(declare-fun minValue!1129 () V!49577)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15779 0))(
  ( (ValueCellFull!15779 (v!19344 V!49577)) (EmptyCell!15779) )
))
(declare-datatypes ((array!83833 0))(
  ( (array!83834 (arr!40423 (Array (_ BitVec 32) ValueCell!15779)) (size!40974 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83833)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun zeroValue!1129 () V!49577)

(declare-fun lt!575984 () Bool)

(declare-datatypes ((array!83835 0))(
  ( (array!83836 (arr!40424 (Array (_ BitVec 32) (_ BitVec 64))) (size!40975 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83835)

(declare-datatypes ((tuple2!21500 0))(
  ( (tuple2!21501 (_1!10761 (_ BitVec 64)) (_2!10761 V!49577)) )
))
(declare-datatypes ((List!28691 0))(
  ( (Nil!28688) (Cons!28687 (h!29905 tuple2!21500) (t!42219 List!28691)) )
))
(declare-datatypes ((ListLongMap!19165 0))(
  ( (ListLongMap!19166 (toList!9598 List!28691)) )
))
(declare-fun contains!7722 (ListLongMap!19165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4667 (array!83835 array!83833 (_ BitVec 32) (_ BitVec 32) V!49577 V!49577 (_ BitVec 32) Int) ListLongMap!19165)

(assert (=> b!1277828 (= lt!575984 (contains!7722 (getCurrentListMap!4667 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51563 () Bool)

(declare-fun mapRes!51563 () Bool)

(assert (=> mapIsEmpty!51563 mapRes!51563))

(declare-fun b!1277829 () Bool)

(declare-fun res!848854 () Bool)

(assert (=> b!1277829 (=> (not res!848854) (not e!729790))))

(assert (=> b!1277829 (= res!848854 (and (= (size!40974 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40975 _keys!1427) (size!40974 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277830 () Bool)

(declare-fun e!729791 () Bool)

(declare-fun tp_is_empty!33355 () Bool)

(assert (=> b!1277830 (= e!729791 tp_is_empty!33355)))

(declare-fun b!1277831 () Bool)

(declare-fun e!729792 () Bool)

(assert (=> b!1277831 (= e!729792 (and e!729791 mapRes!51563))))

(declare-fun condMapEmpty!51563 () Bool)

(declare-fun mapDefault!51563 () ValueCell!15779)

(assert (=> b!1277831 (= condMapEmpty!51563 (= (arr!40423 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15779)) mapDefault!51563)))))

(declare-fun b!1277832 () Bool)

(declare-fun e!729789 () Bool)

(assert (=> b!1277832 (= e!729789 tp_is_empty!33355)))

(declare-fun b!1277833 () Bool)

(declare-fun res!848852 () Bool)

(assert (=> b!1277833 (=> (not res!848852) (not e!729790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83835 (_ BitVec 32)) Bool)

(assert (=> b!1277833 (= res!848852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51563 () Bool)

(declare-fun tp!98369 () Bool)

(assert (=> mapNonEmpty!51563 (= mapRes!51563 (and tp!98369 e!729789))))

(declare-fun mapValue!51563 () ValueCell!15779)

(declare-fun mapKey!51563 () (_ BitVec 32))

(declare-fun mapRest!51563 () (Array (_ BitVec 32) ValueCell!15779))

(assert (=> mapNonEmpty!51563 (= (arr!40423 _values!1187) (store mapRest!51563 mapKey!51563 mapValue!51563))))

(declare-fun res!848851 () Bool)

(assert (=> start!108316 (=> (not res!848851) (not e!729790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108316 (= res!848851 (validMask!0 mask!1805))))

(assert (=> start!108316 e!729790))

(assert (=> start!108316 true))

(assert (=> start!108316 tp!98368))

(assert (=> start!108316 tp_is_empty!33355))

(declare-fun array_inv!30907 (array!83833) Bool)

(assert (=> start!108316 (and (array_inv!30907 _values!1187) e!729792)))

(declare-fun array_inv!30908 (array!83835) Bool)

(assert (=> start!108316 (array_inv!30908 _keys!1427)))

(declare-fun b!1277834 () Bool)

(declare-fun res!848853 () Bool)

(assert (=> b!1277834 (=> (not res!848853) (not e!729790))))

(declare-datatypes ((List!28692 0))(
  ( (Nil!28689) (Cons!28688 (h!29906 (_ BitVec 64)) (t!42220 List!28692)) )
))
(declare-fun arrayNoDuplicates!0 (array!83835 (_ BitVec 32) List!28692) Bool)

(assert (=> b!1277834 (= res!848853 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28689))))

(assert (= (and start!108316 res!848851) b!1277829))

(assert (= (and b!1277829 res!848854) b!1277833))

(assert (= (and b!1277833 res!848852) b!1277834))

(assert (= (and b!1277834 res!848853) b!1277828))

(assert (= (and b!1277831 condMapEmpty!51563) mapIsEmpty!51563))

(assert (= (and b!1277831 (not condMapEmpty!51563)) mapNonEmpty!51563))

(get-info :version)

(assert (= (and mapNonEmpty!51563 ((_ is ValueCellFull!15779) mapValue!51563)) b!1277832))

(assert (= (and b!1277831 ((_ is ValueCellFull!15779) mapDefault!51563)) b!1277830))

(assert (= start!108316 b!1277831))

(declare-fun m!1174029 () Bool)

(assert (=> mapNonEmpty!51563 m!1174029))

(declare-fun m!1174031 () Bool)

(assert (=> start!108316 m!1174031))

(declare-fun m!1174033 () Bool)

(assert (=> start!108316 m!1174033))

(declare-fun m!1174035 () Bool)

(assert (=> start!108316 m!1174035))

(declare-fun m!1174037 () Bool)

(assert (=> b!1277834 m!1174037))

(declare-fun m!1174039 () Bool)

(assert (=> b!1277828 m!1174039))

(assert (=> b!1277828 m!1174039))

(declare-fun m!1174041 () Bool)

(assert (=> b!1277828 m!1174041))

(declare-fun m!1174043 () Bool)

(assert (=> b!1277833 m!1174043))

(check-sat tp_is_empty!33355 (not b!1277828) (not b!1277834) (not start!108316) (not b_next!27805) (not mapNonEmpty!51563) (not b!1277833) b_and!45863)
(check-sat b_and!45863 (not b_next!27805))
