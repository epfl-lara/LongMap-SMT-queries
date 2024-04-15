; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108110 () Bool)

(assert start!108110)

(declare-fun b_free!27823 () Bool)

(declare-fun b_next!27823 () Bool)

(assert (=> start!108110 (= b_free!27823 (not b_next!27823))))

(declare-fun tp!98424 () Bool)

(declare-fun b_and!45861 () Bool)

(assert (=> start!108110 (= tp!98424 b_and!45861)))

(declare-fun b!1276648 () Bool)

(declare-fun e!729051 () Bool)

(declare-fun tp_is_empty!33373 () Bool)

(assert (=> b!1276648 (= e!729051 tp_is_empty!33373)))

(declare-fun b!1276649 () Bool)

(declare-fun res!848414 () Bool)

(declare-fun e!729049 () Bool)

(assert (=> b!1276649 (=> (not res!848414) (not e!729049))))

(declare-datatypes ((array!83739 0))(
  ( (array!83740 (arr!40381 (Array (_ BitVec 32) (_ BitVec 64))) (size!40933 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83739)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83739 (_ BitVec 32)) Bool)

(assert (=> b!1276649 (= res!848414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276650 () Bool)

(declare-fun res!848413 () Bool)

(assert (=> b!1276650 (=> (not res!848413) (not e!729049))))

(declare-datatypes ((List!28747 0))(
  ( (Nil!28744) (Cons!28743 (h!29952 (_ BitVec 64)) (t!42275 List!28747)) )
))
(declare-fun arrayNoDuplicates!0 (array!83739 (_ BitVec 32) List!28747) Bool)

(assert (=> b!1276650 (= res!848413 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28744))))

(declare-fun b!1276651 () Bool)

(declare-fun e!729048 () Bool)

(assert (=> b!1276651 (= e!729048 tp_is_empty!33373)))

(declare-fun b!1276652 () Bool)

(assert (=> b!1276652 (= e!729049 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575349 () Bool)

(declare-datatypes ((V!49601 0))(
  ( (V!49602 (val!16761 Int)) )
))
(declare-fun minValue!1129 () V!49601)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15788 0))(
  ( (ValueCellFull!15788 (v!19357 V!49601)) (EmptyCell!15788) )
))
(declare-datatypes ((array!83741 0))(
  ( (array!83742 (arr!40382 (Array (_ BitVec 32) ValueCell!15788)) (size!40934 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83741)

(declare-fun zeroValue!1129 () V!49601)

(declare-datatypes ((tuple2!21578 0))(
  ( (tuple2!21579 (_1!10800 (_ BitVec 64)) (_2!10800 V!49601)) )
))
(declare-datatypes ((List!28748 0))(
  ( (Nil!28745) (Cons!28744 (h!29953 tuple2!21578) (t!42276 List!28748)) )
))
(declare-datatypes ((ListLongMap!19235 0))(
  ( (ListLongMap!19236 (toList!9633 List!28748)) )
))
(declare-fun contains!7673 (ListLongMap!19235 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4607 (array!83739 array!83741 (_ BitVec 32) (_ BitVec 32) V!49601 V!49601 (_ BitVec 32) Int) ListLongMap!19235)

(assert (=> b!1276652 (= lt!575349 (contains!7673 (getCurrentListMap!4607 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51590 () Bool)

(declare-fun mapRes!51590 () Bool)

(assert (=> mapIsEmpty!51590 mapRes!51590))

(declare-fun res!848412 () Bool)

(assert (=> start!108110 (=> (not res!848412) (not e!729049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108110 (= res!848412 (validMask!0 mask!1805))))

(assert (=> start!108110 e!729049))

(assert (=> start!108110 true))

(assert (=> start!108110 tp!98424))

(assert (=> start!108110 tp_is_empty!33373))

(declare-fun e!729050 () Bool)

(declare-fun array_inv!30843 (array!83741) Bool)

(assert (=> start!108110 (and (array_inv!30843 _values!1187) e!729050)))

(declare-fun array_inv!30844 (array!83739) Bool)

(assert (=> start!108110 (array_inv!30844 _keys!1427)))

(declare-fun b!1276653 () Bool)

(assert (=> b!1276653 (= e!729050 (and e!729048 mapRes!51590))))

(declare-fun condMapEmpty!51590 () Bool)

(declare-fun mapDefault!51590 () ValueCell!15788)

(assert (=> b!1276653 (= condMapEmpty!51590 (= (arr!40382 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15788)) mapDefault!51590)))))

(declare-fun b!1276654 () Bool)

(declare-fun res!848415 () Bool)

(assert (=> b!1276654 (=> (not res!848415) (not e!729049))))

(assert (=> b!1276654 (= res!848415 (and (= (size!40934 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40933 _keys!1427) (size!40934 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51590 () Bool)

(declare-fun tp!98423 () Bool)

(assert (=> mapNonEmpty!51590 (= mapRes!51590 (and tp!98423 e!729051))))

(declare-fun mapRest!51590 () (Array (_ BitVec 32) ValueCell!15788))

(declare-fun mapValue!51590 () ValueCell!15788)

(declare-fun mapKey!51590 () (_ BitVec 32))

(assert (=> mapNonEmpty!51590 (= (arr!40382 _values!1187) (store mapRest!51590 mapKey!51590 mapValue!51590))))

(assert (= (and start!108110 res!848412) b!1276654))

(assert (= (and b!1276654 res!848415) b!1276649))

(assert (= (and b!1276649 res!848414) b!1276650))

(assert (= (and b!1276650 res!848413) b!1276652))

(assert (= (and b!1276653 condMapEmpty!51590) mapIsEmpty!51590))

(assert (= (and b!1276653 (not condMapEmpty!51590)) mapNonEmpty!51590))

(get-info :version)

(assert (= (and mapNonEmpty!51590 ((_ is ValueCellFull!15788) mapValue!51590)) b!1276648))

(assert (= (and b!1276653 ((_ is ValueCellFull!15788) mapDefault!51590)) b!1276651))

(assert (= start!108110 b!1276653))

(declare-fun m!1172061 () Bool)

(assert (=> start!108110 m!1172061))

(declare-fun m!1172063 () Bool)

(assert (=> start!108110 m!1172063))

(declare-fun m!1172065 () Bool)

(assert (=> start!108110 m!1172065))

(declare-fun m!1172067 () Bool)

(assert (=> b!1276649 m!1172067))

(declare-fun m!1172069 () Bool)

(assert (=> b!1276652 m!1172069))

(assert (=> b!1276652 m!1172069))

(declare-fun m!1172071 () Bool)

(assert (=> b!1276652 m!1172071))

(declare-fun m!1172073 () Bool)

(assert (=> b!1276650 m!1172073))

(declare-fun m!1172075 () Bool)

(assert (=> mapNonEmpty!51590 m!1172075))

(check-sat (not b!1276649) (not b!1276650) (not b_next!27823) (not start!108110) (not b!1276652) (not mapNonEmpty!51590) tp_is_empty!33373 b_and!45861)
(check-sat b_and!45861 (not b_next!27823))
