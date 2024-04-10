; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108172 () Bool)

(assert start!108172)

(declare-fun b_free!27867 () Bool)

(declare-fun b_next!27867 () Bool)

(assert (=> start!108172 (= b_free!27867 (not b_next!27867))))

(declare-fun tp!98558 () Bool)

(declare-fun b_and!45925 () Bool)

(assert (=> start!108172 (= tp!98558 b_and!45925)))

(declare-fun b!1277403 () Bool)

(declare-fun e!729517 () Bool)

(declare-fun e!729518 () Bool)

(declare-fun mapRes!51659 () Bool)

(assert (=> b!1277403 (= e!729517 (and e!729518 mapRes!51659))))

(declare-fun condMapEmpty!51659 () Bool)

(declare-datatypes ((V!49659 0))(
  ( (V!49660 (val!16783 Int)) )
))
(declare-datatypes ((ValueCell!15810 0))(
  ( (ValueCellFull!15810 (v!19381 V!49659)) (EmptyCell!15810) )
))
(declare-datatypes ((array!83928 0))(
  ( (array!83929 (arr!40474 (Array (_ BitVec 32) ValueCell!15810)) (size!41024 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83928)

(declare-fun mapDefault!51659 () ValueCell!15810)

(assert (=> b!1277403 (= condMapEmpty!51659 (= (arr!40474 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15810)) mapDefault!51659)))))

(declare-fun b!1277405 () Bool)

(declare-fun res!848808 () Bool)

(declare-fun e!729516 () Bool)

(assert (=> b!1277405 (=> (not res!848808) (not e!729516))))

(declare-datatypes ((array!83930 0))(
  ( (array!83931 (arr!40475 (Array (_ BitVec 32) (_ BitVec 64))) (size!41025 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83930)

(declare-datatypes ((List!28703 0))(
  ( (Nil!28700) (Cons!28699 (h!29908 (_ BitVec 64)) (t!42241 List!28703)) )
))
(declare-fun arrayNoDuplicates!0 (array!83930 (_ BitVec 32) List!28703) Bool)

(assert (=> b!1277405 (= res!848808 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28700))))

(declare-fun b!1277406 () Bool)

(declare-fun res!848809 () Bool)

(assert (=> b!1277406 (=> (not res!848809) (not e!729516))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83930 (_ BitVec 32)) Bool)

(assert (=> b!1277406 (= res!848809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277407 () Bool)

(declare-fun e!729515 () Bool)

(declare-fun tp_is_empty!33417 () Bool)

(assert (=> b!1277407 (= e!729515 tp_is_empty!33417)))

(declare-fun mapIsEmpty!51659 () Bool)

(assert (=> mapIsEmpty!51659 mapRes!51659))

(declare-fun b!1277408 () Bool)

(assert (=> b!1277408 (= e!729516 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49659)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49659)

(declare-fun lt!575692 () Bool)

(declare-datatypes ((tuple2!21526 0))(
  ( (tuple2!21527 (_1!10774 (_ BitVec 64)) (_2!10774 V!49659)) )
))
(declare-datatypes ((List!28704 0))(
  ( (Nil!28701) (Cons!28700 (h!29909 tuple2!21526) (t!42242 List!28704)) )
))
(declare-datatypes ((ListLongMap!19183 0))(
  ( (ListLongMap!19184 (toList!9607 List!28704)) )
))
(declare-fun contains!7717 (ListLongMap!19183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4691 (array!83930 array!83928 (_ BitVec 32) (_ BitVec 32) V!49659 V!49659 (_ BitVec 32) Int) ListLongMap!19183)

(assert (=> b!1277408 (= lt!575692 (contains!7717 (getCurrentListMap!4691 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848810 () Bool)

(assert (=> start!108172 (=> (not res!848810) (not e!729516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108172 (= res!848810 (validMask!0 mask!1805))))

(assert (=> start!108172 e!729516))

(assert (=> start!108172 true))

(assert (=> start!108172 tp!98558))

(assert (=> start!108172 tp_is_empty!33417))

(declare-fun array_inv!30751 (array!83928) Bool)

(assert (=> start!108172 (and (array_inv!30751 _values!1187) e!729517)))

(declare-fun array_inv!30752 (array!83930) Bool)

(assert (=> start!108172 (array_inv!30752 _keys!1427)))

(declare-fun b!1277404 () Bool)

(declare-fun res!848811 () Bool)

(assert (=> b!1277404 (=> (not res!848811) (not e!729516))))

(assert (=> b!1277404 (= res!848811 (and (= (size!41024 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41025 _keys!1427) (size!41024 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277409 () Bool)

(assert (=> b!1277409 (= e!729518 tp_is_empty!33417)))

(declare-fun mapNonEmpty!51659 () Bool)

(declare-fun tp!98557 () Bool)

(assert (=> mapNonEmpty!51659 (= mapRes!51659 (and tp!98557 e!729515))))

(declare-fun mapKey!51659 () (_ BitVec 32))

(declare-fun mapValue!51659 () ValueCell!15810)

(declare-fun mapRest!51659 () (Array (_ BitVec 32) ValueCell!15810))

(assert (=> mapNonEmpty!51659 (= (arr!40474 _values!1187) (store mapRest!51659 mapKey!51659 mapValue!51659))))

(assert (= (and start!108172 res!848810) b!1277404))

(assert (= (and b!1277404 res!848811) b!1277406))

(assert (= (and b!1277406 res!848809) b!1277405))

(assert (= (and b!1277405 res!848808) b!1277408))

(assert (= (and b!1277403 condMapEmpty!51659) mapIsEmpty!51659))

(assert (= (and b!1277403 (not condMapEmpty!51659)) mapNonEmpty!51659))

(get-info :version)

(assert (= (and mapNonEmpty!51659 ((_ is ValueCellFull!15810) mapValue!51659)) b!1277407))

(assert (= (and b!1277403 ((_ is ValueCellFull!15810) mapDefault!51659)) b!1277409))

(assert (= start!108172 b!1277403))

(declare-fun m!1173033 () Bool)

(assert (=> b!1277406 m!1173033))

(declare-fun m!1173035 () Bool)

(assert (=> mapNonEmpty!51659 m!1173035))

(declare-fun m!1173037 () Bool)

(assert (=> b!1277408 m!1173037))

(assert (=> b!1277408 m!1173037))

(declare-fun m!1173039 () Bool)

(assert (=> b!1277408 m!1173039))

(declare-fun m!1173041 () Bool)

(assert (=> b!1277405 m!1173041))

(declare-fun m!1173043 () Bool)

(assert (=> start!108172 m!1173043))

(declare-fun m!1173045 () Bool)

(assert (=> start!108172 m!1173045))

(declare-fun m!1173047 () Bool)

(assert (=> start!108172 m!1173047))

(check-sat (not b!1277406) (not mapNonEmpty!51659) tp_is_empty!33417 (not b!1277408) b_and!45925 (not start!108172) (not b!1277405) (not b_next!27867))
(check-sat b_and!45925 (not b_next!27867))
