; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108292 () Bool)

(assert start!108292)

(declare-fun b_free!27781 () Bool)

(declare-fun b_next!27781 () Bool)

(assert (=> start!108292 (= b_free!27781 (not b_next!27781))))

(declare-fun tp!98297 () Bool)

(declare-fun b_and!45839 () Bool)

(assert (=> start!108292 (= tp!98297 b_and!45839)))

(declare-fun b!1277576 () Bool)

(declare-fun res!848710 () Bool)

(declare-fun e!729611 () Bool)

(assert (=> b!1277576 (=> (not res!848710) (not e!729611))))

(declare-datatypes ((array!83785 0))(
  ( (array!83786 (arr!40399 (Array (_ BitVec 32) (_ BitVec 64))) (size!40950 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83785)

(declare-datatypes ((List!28671 0))(
  ( (Nil!28668) (Cons!28667 (h!29885 (_ BitVec 64)) (t!42199 List!28671)) )
))
(declare-fun arrayNoDuplicates!0 (array!83785 (_ BitVec 32) List!28671) Bool)

(assert (=> b!1277576 (= res!848710 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28668))))

(declare-fun mapIsEmpty!51527 () Bool)

(declare-fun mapRes!51527 () Bool)

(assert (=> mapIsEmpty!51527 mapRes!51527))

(declare-fun b!1277577 () Bool)

(declare-fun res!848707 () Bool)

(assert (=> b!1277577 (=> (not res!848707) (not e!729611))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49545 0))(
  ( (V!49546 (val!16740 Int)) )
))
(declare-datatypes ((ValueCell!15767 0))(
  ( (ValueCellFull!15767 (v!19332 V!49545)) (EmptyCell!15767) )
))
(declare-datatypes ((array!83787 0))(
  ( (array!83788 (arr!40400 (Array (_ BitVec 32) ValueCell!15767)) (size!40951 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83787)

(declare-fun mask!1805 () (_ BitVec 32))

(assert (=> b!1277577 (= res!848707 (and (= (size!40951 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40950 _keys!1427) (size!40951 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848709 () Bool)

(assert (=> start!108292 (=> (not res!848709) (not e!729611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108292 (= res!848709 (validMask!0 mask!1805))))

(assert (=> start!108292 e!729611))

(assert (=> start!108292 true))

(assert (=> start!108292 tp!98297))

(declare-fun tp_is_empty!33331 () Bool)

(assert (=> start!108292 tp_is_empty!33331))

(declare-fun e!729613 () Bool)

(declare-fun array_inv!30889 (array!83787) Bool)

(assert (=> start!108292 (and (array_inv!30889 _values!1187) e!729613)))

(declare-fun array_inv!30890 (array!83785) Bool)

(assert (=> start!108292 (array_inv!30890 _keys!1427)))

(declare-fun b!1277578 () Bool)

(assert (=> b!1277578 (= e!729611 false)))

(declare-fun lt!575948 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49545)

(declare-fun zeroValue!1129 () V!49545)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((tuple2!21478 0))(
  ( (tuple2!21479 (_1!10750 (_ BitVec 64)) (_2!10750 V!49545)) )
))
(declare-datatypes ((List!28672 0))(
  ( (Nil!28669) (Cons!28668 (h!29886 tuple2!21478) (t!42200 List!28672)) )
))
(declare-datatypes ((ListLongMap!19143 0))(
  ( (ListLongMap!19144 (toList!9587 List!28672)) )
))
(declare-fun contains!7711 (ListLongMap!19143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4656 (array!83785 array!83787 (_ BitVec 32) (_ BitVec 32) V!49545 V!49545 (_ BitVec 32) Int) ListLongMap!19143)

(assert (=> b!1277578 (= lt!575948 (contains!7711 (getCurrentListMap!4656 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277579 () Bool)

(declare-fun e!729610 () Bool)

(assert (=> b!1277579 (= e!729610 tp_is_empty!33331)))

(declare-fun b!1277580 () Bool)

(declare-fun res!848708 () Bool)

(assert (=> b!1277580 (=> (not res!848708) (not e!729611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83785 (_ BitVec 32)) Bool)

(assert (=> b!1277580 (= res!848708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51527 () Bool)

(declare-fun tp!98296 () Bool)

(assert (=> mapNonEmpty!51527 (= mapRes!51527 (and tp!98296 e!729610))))

(declare-fun mapKey!51527 () (_ BitVec 32))

(declare-fun mapRest!51527 () (Array (_ BitVec 32) ValueCell!15767))

(declare-fun mapValue!51527 () ValueCell!15767)

(assert (=> mapNonEmpty!51527 (= (arr!40400 _values!1187) (store mapRest!51527 mapKey!51527 mapValue!51527))))

(declare-fun b!1277581 () Bool)

(declare-fun e!729612 () Bool)

(assert (=> b!1277581 (= e!729612 tp_is_empty!33331)))

(declare-fun b!1277582 () Bool)

(assert (=> b!1277582 (= e!729613 (and e!729612 mapRes!51527))))

(declare-fun condMapEmpty!51527 () Bool)

(declare-fun mapDefault!51527 () ValueCell!15767)

(assert (=> b!1277582 (= condMapEmpty!51527 (= (arr!40400 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15767)) mapDefault!51527)))))

(assert (= (and start!108292 res!848709) b!1277577))

(assert (= (and b!1277577 res!848707) b!1277580))

(assert (= (and b!1277580 res!848708) b!1277576))

(assert (= (and b!1277576 res!848710) b!1277578))

(assert (= (and b!1277582 condMapEmpty!51527) mapIsEmpty!51527))

(assert (= (and b!1277582 (not condMapEmpty!51527)) mapNonEmpty!51527))

(get-info :version)

(assert (= (and mapNonEmpty!51527 ((_ is ValueCellFull!15767) mapValue!51527)) b!1277579))

(assert (= (and b!1277582 ((_ is ValueCellFull!15767) mapDefault!51527)) b!1277581))

(assert (= start!108292 b!1277582))

(declare-fun m!1173837 () Bool)

(assert (=> b!1277576 m!1173837))

(declare-fun m!1173839 () Bool)

(assert (=> mapNonEmpty!51527 m!1173839))

(declare-fun m!1173841 () Bool)

(assert (=> b!1277578 m!1173841))

(assert (=> b!1277578 m!1173841))

(declare-fun m!1173843 () Bool)

(assert (=> b!1277578 m!1173843))

(declare-fun m!1173845 () Bool)

(assert (=> b!1277580 m!1173845))

(declare-fun m!1173847 () Bool)

(assert (=> start!108292 m!1173847))

(declare-fun m!1173849 () Bool)

(assert (=> start!108292 m!1173849))

(declare-fun m!1173851 () Bool)

(assert (=> start!108292 m!1173851))

(check-sat tp_is_empty!33331 (not start!108292) b_and!45839 (not b!1277576) (not b_next!27781) (not mapNonEmpty!51527) (not b!1277580) (not b!1277578))
(check-sat b_and!45839 (not b_next!27781))
