; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108118 () Bool)

(assert start!108118)

(declare-fun b_free!27831 () Bool)

(declare-fun b_next!27831 () Bool)

(assert (=> start!108118 (= b_free!27831 (not b_next!27831))))

(declare-fun tp!98447 () Bool)

(declare-fun b_and!45887 () Bool)

(assert (=> start!108118 (= tp!98447 b_and!45887)))

(declare-fun b!1276796 () Bool)

(declare-fun e!729139 () Bool)

(declare-fun tp_is_empty!33381 () Bool)

(assert (=> b!1276796 (= e!729139 tp_is_empty!33381)))

(declare-fun b!1276797 () Bool)

(declare-fun res!848487 () Bool)

(declare-fun e!729141 () Bool)

(assert (=> b!1276797 (=> (not res!848487) (not e!729141))))

(declare-datatypes ((array!83854 0))(
  ( (array!83855 (arr!40438 (Array (_ BitVec 32) (_ BitVec 64))) (size!40988 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83854)

(declare-datatypes ((List!28676 0))(
  ( (Nil!28673) (Cons!28672 (h!29881 (_ BitVec 64)) (t!42212 List!28676)) )
))
(declare-fun arrayNoDuplicates!0 (array!83854 (_ BitVec 32) List!28676) Bool)

(assert (=> b!1276797 (= res!848487 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28673))))

(declare-fun res!848490 () Bool)

(assert (=> start!108118 (=> (not res!848490) (not e!729141))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108118 (= res!848490 (validMask!0 mask!1805))))

(assert (=> start!108118 e!729141))

(assert (=> start!108118 true))

(assert (=> start!108118 tp!98447))

(assert (=> start!108118 tp_is_empty!33381))

(declare-datatypes ((V!49611 0))(
  ( (V!49612 (val!16765 Int)) )
))
(declare-datatypes ((ValueCell!15792 0))(
  ( (ValueCellFull!15792 (v!19362 V!49611)) (EmptyCell!15792) )
))
(declare-datatypes ((array!83856 0))(
  ( (array!83857 (arr!40439 (Array (_ BitVec 32) ValueCell!15792)) (size!40989 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83856)

(declare-fun e!729137 () Bool)

(declare-fun array_inv!30729 (array!83856) Bool)

(assert (=> start!108118 (and (array_inv!30729 _values!1187) e!729137)))

(declare-fun array_inv!30730 (array!83854) Bool)

(assert (=> start!108118 (array_inv!30730 _keys!1427)))

(declare-fun mapNonEmpty!51602 () Bool)

(declare-fun mapRes!51602 () Bool)

(declare-fun tp!98446 () Bool)

(assert (=> mapNonEmpty!51602 (= mapRes!51602 (and tp!98446 e!729139))))

(declare-fun mapRest!51602 () (Array (_ BitVec 32) ValueCell!15792))

(declare-fun mapValue!51602 () ValueCell!15792)

(declare-fun mapKey!51602 () (_ BitVec 32))

(assert (=> mapNonEmpty!51602 (= (arr!40439 _values!1187) (store mapRest!51602 mapKey!51602 mapValue!51602))))

(declare-fun b!1276798 () Bool)

(declare-fun res!848489 () Bool)

(assert (=> b!1276798 (=> (not res!848489) (not e!729141))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276798 (= res!848489 (and (= (size!40989 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40988 _keys!1427) (size!40989 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51602 () Bool)

(assert (=> mapIsEmpty!51602 mapRes!51602))

(declare-fun b!1276799 () Bool)

(declare-fun res!848488 () Bool)

(assert (=> b!1276799 (=> (not res!848488) (not e!729141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83854 (_ BitVec 32)) Bool)

(assert (=> b!1276799 (= res!848488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276800 () Bool)

(assert (=> b!1276800 (= e!729141 false)))

(declare-fun lt!575539 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49611)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49611)

(declare-datatypes ((tuple2!21500 0))(
  ( (tuple2!21501 (_1!10761 (_ BitVec 64)) (_2!10761 V!49611)) )
))
(declare-datatypes ((List!28677 0))(
  ( (Nil!28674) (Cons!28673 (h!29882 tuple2!21500) (t!42213 List!28677)) )
))
(declare-datatypes ((ListLongMap!19157 0))(
  ( (ListLongMap!19158 (toList!9594 List!28677)) )
))
(declare-fun contains!7703 (ListLongMap!19157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4678 (array!83854 array!83856 (_ BitVec 32) (_ BitVec 32) V!49611 V!49611 (_ BitVec 32) Int) ListLongMap!19157)

(assert (=> b!1276800 (= lt!575539 (contains!7703 (getCurrentListMap!4678 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276801 () Bool)

(declare-fun e!729140 () Bool)

(assert (=> b!1276801 (= e!729137 (and e!729140 mapRes!51602))))

(declare-fun condMapEmpty!51602 () Bool)

(declare-fun mapDefault!51602 () ValueCell!15792)

(assert (=> b!1276801 (= condMapEmpty!51602 (= (arr!40439 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15792)) mapDefault!51602)))))

(declare-fun b!1276802 () Bool)

(assert (=> b!1276802 (= e!729140 tp_is_empty!33381)))

(assert (= (and start!108118 res!848490) b!1276798))

(assert (= (and b!1276798 res!848489) b!1276799))

(assert (= (and b!1276799 res!848488) b!1276797))

(assert (= (and b!1276797 res!848487) b!1276800))

(assert (= (and b!1276801 condMapEmpty!51602) mapIsEmpty!51602))

(assert (= (and b!1276801 (not condMapEmpty!51602)) mapNonEmpty!51602))

(get-info :version)

(assert (= (and mapNonEmpty!51602 ((_ is ValueCellFull!15792) mapValue!51602)) b!1276796))

(assert (= (and b!1276801 ((_ is ValueCellFull!15792) mapDefault!51602)) b!1276802))

(assert (= start!108118 b!1276801))

(declare-fun m!1172625 () Bool)

(assert (=> mapNonEmpty!51602 m!1172625))

(declare-fun m!1172627 () Bool)

(assert (=> b!1276799 m!1172627))

(declare-fun m!1172629 () Bool)

(assert (=> b!1276797 m!1172629))

(declare-fun m!1172631 () Bool)

(assert (=> b!1276800 m!1172631))

(assert (=> b!1276800 m!1172631))

(declare-fun m!1172633 () Bool)

(assert (=> b!1276800 m!1172633))

(declare-fun m!1172635 () Bool)

(assert (=> start!108118 m!1172635))

(declare-fun m!1172637 () Bool)

(assert (=> start!108118 m!1172637))

(declare-fun m!1172639 () Bool)

(assert (=> start!108118 m!1172639))

(check-sat tp_is_empty!33381 b_and!45887 (not mapNonEmpty!51602) (not b!1276797) (not b!1276800) (not b_next!27831) (not start!108118) (not b!1276799))
(check-sat b_and!45887 (not b_next!27831))
