; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108424 () Bool)

(assert start!108424)

(declare-fun b_free!27895 () Bool)

(declare-fun b_next!27895 () Bool)

(assert (=> start!108424 (= b_free!27895 (not b_next!27895))))

(declare-fun tp!98642 () Bool)

(declare-fun b_and!45955 () Bool)

(assert (=> start!108424 (= tp!98642 b_and!45955)))

(declare-fun b!1279002 () Bool)

(declare-fun e!730575 () Bool)

(declare-fun e!730576 () Bool)

(declare-fun mapRes!51701 () Bool)

(assert (=> b!1279002 (= e!730575 (and e!730576 mapRes!51701))))

(declare-fun condMapEmpty!51701 () Bool)

(declare-datatypes ((V!49697 0))(
  ( (V!49698 (val!16797 Int)) )
))
(declare-datatypes ((ValueCell!15824 0))(
  ( (ValueCellFull!15824 (v!19390 V!49697)) (EmptyCell!15824) )
))
(declare-datatypes ((array!84011 0))(
  ( (array!84012 (arr!40511 (Array (_ BitVec 32) ValueCell!15824)) (size!41062 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84011)

(declare-fun mapDefault!51701 () ValueCell!15824)

(assert (=> b!1279002 (= condMapEmpty!51701 (= (arr!40511 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15824)) mapDefault!51701)))))

(declare-fun b!1279003 () Bool)

(declare-fun res!849498 () Bool)

(declare-fun e!730574 () Bool)

(assert (=> b!1279003 (=> (not res!849498) (not e!730574))))

(declare-datatypes ((array!84013 0))(
  ( (array!84014 (arr!40512 (Array (_ BitVec 32) (_ BitVec 64))) (size!41063 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84013)

(declare-datatypes ((List!28755 0))(
  ( (Nil!28752) (Cons!28751 (h!29969 (_ BitVec 64)) (t!42285 List!28755)) )
))
(declare-fun arrayNoDuplicates!0 (array!84013 (_ BitVec 32) List!28755) Bool)

(assert (=> b!1279003 (= res!849498 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28752))))

(declare-fun b!1279004 () Bool)

(assert (=> b!1279004 (= e!730574 false)))

(declare-fun lt!576218 () Bool)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49697)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49697)

(declare-datatypes ((tuple2!21566 0))(
  ( (tuple2!21567 (_1!10794 (_ BitVec 64)) (_2!10794 V!49697)) )
))
(declare-datatypes ((List!28756 0))(
  ( (Nil!28753) (Cons!28752 (h!29970 tuple2!21566) (t!42286 List!28756)) )
))
(declare-datatypes ((ListLongMap!19231 0))(
  ( (ListLongMap!19232 (toList!9631 List!28756)) )
))
(declare-fun contains!7756 (ListLongMap!19231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4700 (array!84013 array!84011 (_ BitVec 32) (_ BitVec 32) V!49697 V!49697 (_ BitVec 32) Int) ListLongMap!19231)

(assert (=> b!1279004 (= lt!576218 (contains!7756 (getCurrentListMap!4700 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!849497 () Bool)

(assert (=> start!108424 (=> (not res!849497) (not e!730574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108424 (= res!849497 (validMask!0 mask!1805))))

(assert (=> start!108424 e!730574))

(assert (=> start!108424 true))

(assert (=> start!108424 tp!98642))

(declare-fun tp_is_empty!33445 () Bool)

(assert (=> start!108424 tp_is_empty!33445))

(declare-fun array_inv!30963 (array!84011) Bool)

(assert (=> start!108424 (and (array_inv!30963 _values!1187) e!730575)))

(declare-fun array_inv!30964 (array!84013) Bool)

(assert (=> start!108424 (array_inv!30964 _keys!1427)))

(declare-fun b!1279005 () Bool)

(declare-fun res!849499 () Bool)

(assert (=> b!1279005 (=> (not res!849499) (not e!730574))))

(assert (=> b!1279005 (= res!849499 (and (= (size!41062 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41063 _keys!1427) (size!41062 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51701 () Bool)

(declare-fun tp!98641 () Bool)

(declare-fun e!730572 () Bool)

(assert (=> mapNonEmpty!51701 (= mapRes!51701 (and tp!98641 e!730572))))

(declare-fun mapRest!51701 () (Array (_ BitVec 32) ValueCell!15824))

(declare-fun mapKey!51701 () (_ BitVec 32))

(declare-fun mapValue!51701 () ValueCell!15824)

(assert (=> mapNonEmpty!51701 (= (arr!40511 _values!1187) (store mapRest!51701 mapKey!51701 mapValue!51701))))

(declare-fun b!1279006 () Bool)

(assert (=> b!1279006 (= e!730576 tp_is_empty!33445)))

(declare-fun b!1279007 () Bool)

(assert (=> b!1279007 (= e!730572 tp_is_empty!33445)))

(declare-fun b!1279008 () Bool)

(declare-fun res!849496 () Bool)

(assert (=> b!1279008 (=> (not res!849496) (not e!730574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84013 (_ BitVec 32)) Bool)

(assert (=> b!1279008 (= res!849496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51701 () Bool)

(assert (=> mapIsEmpty!51701 mapRes!51701))

(assert (= (and start!108424 res!849497) b!1279005))

(assert (= (and b!1279005 res!849499) b!1279008))

(assert (= (and b!1279008 res!849496) b!1279003))

(assert (= (and b!1279003 res!849498) b!1279004))

(assert (= (and b!1279002 condMapEmpty!51701) mapIsEmpty!51701))

(assert (= (and b!1279002 (not condMapEmpty!51701)) mapNonEmpty!51701))

(get-info :version)

(assert (= (and mapNonEmpty!51701 ((_ is ValueCellFull!15824) mapValue!51701)) b!1279007))

(assert (= (and b!1279002 ((_ is ValueCellFull!15824) mapDefault!51701)) b!1279006))

(assert (= start!108424 b!1279002))

(declare-fun m!1174869 () Bool)

(assert (=> b!1279008 m!1174869))

(declare-fun m!1174871 () Bool)

(assert (=> b!1279003 m!1174871))

(declare-fun m!1174873 () Bool)

(assert (=> start!108424 m!1174873))

(declare-fun m!1174875 () Bool)

(assert (=> start!108424 m!1174875))

(declare-fun m!1174877 () Bool)

(assert (=> start!108424 m!1174877))

(declare-fun m!1174879 () Bool)

(assert (=> mapNonEmpty!51701 m!1174879))

(declare-fun m!1174881 () Bool)

(assert (=> b!1279004 m!1174881))

(assert (=> b!1279004 m!1174881))

(declare-fun m!1174883 () Bool)

(assert (=> b!1279004 m!1174883))

(check-sat b_and!45955 (not b!1279004) (not mapNonEmpty!51701) (not b_next!27895) tp_is_empty!33445 (not b!1279008) (not start!108424) (not b!1279003))
(check-sat b_and!45955 (not b_next!27895))
