; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108182 () Bool)

(assert start!108182)

(declare-fun b_free!27877 () Bool)

(declare-fun b_next!27877 () Bool)

(assert (=> start!108182 (= b_free!27877 (not b_next!27877))))

(declare-fun tp!98588 () Bool)

(declare-fun b_and!45917 () Bool)

(assert (=> start!108182 (= tp!98588 b_and!45917)))

(declare-fun res!848842 () Bool)

(declare-fun e!729562 () Bool)

(assert (=> start!108182 (=> (not res!848842) (not e!729562))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108182 (= res!848842 (validMask!0 mask!1805))))

(assert (=> start!108182 e!729562))

(assert (=> start!108182 true))

(assert (=> start!108182 tp!98588))

(declare-fun tp_is_empty!33427 () Bool)

(assert (=> start!108182 tp_is_empty!33427))

(declare-datatypes ((V!49673 0))(
  ( (V!49674 (val!16788 Int)) )
))
(declare-datatypes ((ValueCell!15815 0))(
  ( (ValueCellFull!15815 (v!19385 V!49673)) (EmptyCell!15815) )
))
(declare-datatypes ((array!83845 0))(
  ( (array!83846 (arr!40433 (Array (_ BitVec 32) ValueCell!15815)) (size!40985 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83845)

(declare-fun e!729565 () Bool)

(declare-fun array_inv!30879 (array!83845) Bool)

(assert (=> start!108182 (and (array_inv!30879 _values!1187) e!729565)))

(declare-datatypes ((array!83847 0))(
  ( (array!83848 (arr!40434 (Array (_ BitVec 32) (_ BitVec 64))) (size!40986 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83847)

(declare-fun array_inv!30880 (array!83847) Bool)

(assert (=> start!108182 (array_inv!30880 _keys!1427)))

(declare-fun b!1277444 () Bool)

(declare-fun e!729561 () Bool)

(assert (=> b!1277444 (= e!729561 tp_is_empty!33427)))

(declare-fun b!1277445 () Bool)

(declare-fun res!848843 () Bool)

(assert (=> b!1277445 (=> (not res!848843) (not e!729562))))

(declare-datatypes ((List!28786 0))(
  ( (Nil!28783) (Cons!28782 (h!29991 (_ BitVec 64)) (t!42316 List!28786)) )
))
(declare-fun arrayNoDuplicates!0 (array!83847 (_ BitVec 32) List!28786) Bool)

(assert (=> b!1277445 (= res!848843 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28783))))

(declare-fun mapNonEmpty!51674 () Bool)

(declare-fun mapRes!51674 () Bool)

(declare-fun tp!98589 () Bool)

(assert (=> mapNonEmpty!51674 (= mapRes!51674 (and tp!98589 e!729561))))

(declare-fun mapValue!51674 () ValueCell!15815)

(declare-fun mapKey!51674 () (_ BitVec 32))

(declare-fun mapRest!51674 () (Array (_ BitVec 32) ValueCell!15815))

(assert (=> mapNonEmpty!51674 (= (arr!40433 _values!1187) (store mapRest!51674 mapKey!51674 mapValue!51674))))

(declare-fun b!1277446 () Bool)

(assert (=> b!1277446 (= e!729562 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49673)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49673)

(declare-fun lt!575529 () Bool)

(declare-datatypes ((tuple2!21616 0))(
  ( (tuple2!21617 (_1!10819 (_ BitVec 64)) (_2!10819 V!49673)) )
))
(declare-datatypes ((List!28787 0))(
  ( (Nil!28784) (Cons!28783 (h!29992 tuple2!21616) (t!42317 List!28787)) )
))
(declare-datatypes ((ListLongMap!19273 0))(
  ( (ListLongMap!19274 (toList!9652 List!28787)) )
))
(declare-fun contains!7693 (ListLongMap!19273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4626 (array!83847 array!83845 (_ BitVec 32) (_ BitVec 32) V!49673 V!49673 (_ BitVec 32) Int) ListLongMap!19273)

(assert (=> b!1277446 (= lt!575529 (contains!7693 (getCurrentListMap!4626 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51674 () Bool)

(assert (=> mapIsEmpty!51674 mapRes!51674))

(declare-fun b!1277447 () Bool)

(declare-fun res!848844 () Bool)

(assert (=> b!1277447 (=> (not res!848844) (not e!729562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83847 (_ BitVec 32)) Bool)

(assert (=> b!1277447 (= res!848844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277448 () Bool)

(declare-fun e!729564 () Bool)

(assert (=> b!1277448 (= e!729564 tp_is_empty!33427)))

(declare-fun b!1277449 () Bool)

(assert (=> b!1277449 (= e!729565 (and e!729564 mapRes!51674))))

(declare-fun condMapEmpty!51674 () Bool)

(declare-fun mapDefault!51674 () ValueCell!15815)

(assert (=> b!1277449 (= condMapEmpty!51674 (= (arr!40433 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15815)) mapDefault!51674)))))

(declare-fun b!1277450 () Bool)

(declare-fun res!848841 () Bool)

(assert (=> b!1277450 (=> (not res!848841) (not e!729562))))

(assert (=> b!1277450 (= res!848841 (and (= (size!40985 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40986 _keys!1427) (size!40985 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!108182 res!848842) b!1277450))

(assert (= (and b!1277450 res!848841) b!1277447))

(assert (= (and b!1277447 res!848844) b!1277445))

(assert (= (and b!1277445 res!848843) b!1277446))

(assert (= (and b!1277449 condMapEmpty!51674) mapIsEmpty!51674))

(assert (= (and b!1277449 (not condMapEmpty!51674)) mapNonEmpty!51674))

(get-info :version)

(assert (= (and mapNonEmpty!51674 ((_ is ValueCellFull!15815) mapValue!51674)) b!1277444))

(assert (= (and b!1277449 ((_ is ValueCellFull!15815) mapDefault!51674)) b!1277448))

(assert (= start!108182 b!1277449))

(declare-fun m!1172613 () Bool)

(assert (=> mapNonEmpty!51674 m!1172613))

(declare-fun m!1172615 () Bool)

(assert (=> b!1277446 m!1172615))

(assert (=> b!1277446 m!1172615))

(declare-fun m!1172617 () Bool)

(assert (=> b!1277446 m!1172617))

(declare-fun m!1172619 () Bool)

(assert (=> b!1277445 m!1172619))

(declare-fun m!1172621 () Bool)

(assert (=> b!1277447 m!1172621))

(declare-fun m!1172623 () Bool)

(assert (=> start!108182 m!1172623))

(declare-fun m!1172625 () Bool)

(assert (=> start!108182 m!1172625))

(declare-fun m!1172627 () Bool)

(assert (=> start!108182 m!1172627))

(check-sat (not b!1277447) (not mapNonEmpty!51674) tp_is_empty!33427 (not b!1277445) (not b_next!27877) b_and!45917 (not start!108182) (not b!1277446))
(check-sat b_and!45917 (not b_next!27877))
