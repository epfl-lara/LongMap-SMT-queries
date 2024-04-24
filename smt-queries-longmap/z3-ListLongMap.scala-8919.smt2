; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108406 () Bool)

(assert start!108406)

(declare-fun b_free!27877 () Bool)

(declare-fun b_next!27877 () Bool)

(assert (=> start!108406 (= b_free!27877 (not b_next!27877))))

(declare-fun tp!98588 () Bool)

(declare-fun b_and!45937 () Bool)

(assert (=> start!108406 (= tp!98588 b_and!45937)))

(declare-fun b!1278813 () Bool)

(declare-fun e!730439 () Bool)

(declare-fun tp_is_empty!33427 () Bool)

(assert (=> b!1278813 (= e!730439 tp_is_empty!33427)))

(declare-fun b!1278814 () Bool)

(declare-fun res!849391 () Bool)

(declare-fun e!730437 () Bool)

(assert (=> b!1278814 (=> (not res!849391) (not e!730437))))

(declare-datatypes ((array!83977 0))(
  ( (array!83978 (arr!40494 (Array (_ BitVec 32) (_ BitVec 64))) (size!41045 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83977)

(declare-datatypes ((List!28740 0))(
  ( (Nil!28737) (Cons!28736 (h!29954 (_ BitVec 64)) (t!42270 List!28740)) )
))
(declare-fun arrayNoDuplicates!0 (array!83977 (_ BitVec 32) List!28740) Bool)

(assert (=> b!1278814 (= res!849391 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28737))))

(declare-fun b!1278815 () Bool)

(assert (=> b!1278815 (= e!730437 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!576191 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49673 0))(
  ( (V!49674 (val!16788 Int)) )
))
(declare-fun minValue!1129 () V!49673)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15815 0))(
  ( (ValueCellFull!15815 (v!19381 V!49673)) (EmptyCell!15815) )
))
(declare-datatypes ((array!83979 0))(
  ( (array!83980 (arr!40495 (Array (_ BitVec 32) ValueCell!15815)) (size!41046 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83979)

(declare-fun zeroValue!1129 () V!49673)

(declare-datatypes ((tuple2!21550 0))(
  ( (tuple2!21551 (_1!10786 (_ BitVec 64)) (_2!10786 V!49673)) )
))
(declare-datatypes ((List!28741 0))(
  ( (Nil!28738) (Cons!28737 (h!29955 tuple2!21550) (t!42271 List!28741)) )
))
(declare-datatypes ((ListLongMap!19215 0))(
  ( (ListLongMap!19216 (toList!9623 List!28741)) )
))
(declare-fun contains!7748 (ListLongMap!19215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4692 (array!83977 array!83979 (_ BitVec 32) (_ BitVec 32) V!49673 V!49673 (_ BitVec 32) Int) ListLongMap!19215)

(assert (=> b!1278815 (= lt!576191 (contains!7748 (getCurrentListMap!4692 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1278816 () Bool)

(declare-fun res!849389 () Bool)

(assert (=> b!1278816 (=> (not res!849389) (not e!730437))))

(assert (=> b!1278816 (= res!849389 (and (= (size!41046 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41045 _keys!1427) (size!41046 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51674 () Bool)

(declare-fun mapRes!51674 () Bool)

(declare-fun tp!98587 () Bool)

(declare-fun e!730440 () Bool)

(assert (=> mapNonEmpty!51674 (= mapRes!51674 (and tp!98587 e!730440))))

(declare-fun mapRest!51674 () (Array (_ BitVec 32) ValueCell!15815))

(declare-fun mapValue!51674 () ValueCell!15815)

(declare-fun mapKey!51674 () (_ BitVec 32))

(assert (=> mapNonEmpty!51674 (= (arr!40495 _values!1187) (store mapRest!51674 mapKey!51674 mapValue!51674))))

(declare-fun b!1278817 () Bool)

(assert (=> b!1278817 (= e!730440 tp_is_empty!33427)))

(declare-fun res!849388 () Bool)

(assert (=> start!108406 (=> (not res!849388) (not e!730437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108406 (= res!849388 (validMask!0 mask!1805))))

(assert (=> start!108406 e!730437))

(assert (=> start!108406 true))

(assert (=> start!108406 tp!98588))

(assert (=> start!108406 tp_is_empty!33427))

(declare-fun e!730441 () Bool)

(declare-fun array_inv!30951 (array!83979) Bool)

(assert (=> start!108406 (and (array_inv!30951 _values!1187) e!730441)))

(declare-fun array_inv!30952 (array!83977) Bool)

(assert (=> start!108406 (array_inv!30952 _keys!1427)))

(declare-fun mapIsEmpty!51674 () Bool)

(assert (=> mapIsEmpty!51674 mapRes!51674))

(declare-fun b!1278818 () Bool)

(declare-fun res!849390 () Bool)

(assert (=> b!1278818 (=> (not res!849390) (not e!730437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83977 (_ BitVec 32)) Bool)

(assert (=> b!1278818 (= res!849390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1278819 () Bool)

(assert (=> b!1278819 (= e!730441 (and e!730439 mapRes!51674))))

(declare-fun condMapEmpty!51674 () Bool)

(declare-fun mapDefault!51674 () ValueCell!15815)

(assert (=> b!1278819 (= condMapEmpty!51674 (= (arr!40495 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15815)) mapDefault!51674)))))

(assert (= (and start!108406 res!849388) b!1278816))

(assert (= (and b!1278816 res!849389) b!1278818))

(assert (= (and b!1278818 res!849390) b!1278814))

(assert (= (and b!1278814 res!849391) b!1278815))

(assert (= (and b!1278819 condMapEmpty!51674) mapIsEmpty!51674))

(assert (= (and b!1278819 (not condMapEmpty!51674)) mapNonEmpty!51674))

(get-info :version)

(assert (= (and mapNonEmpty!51674 ((_ is ValueCellFull!15815) mapValue!51674)) b!1278817))

(assert (= (and b!1278819 ((_ is ValueCellFull!15815) mapDefault!51674)) b!1278813))

(assert (= start!108406 b!1278819))

(declare-fun m!1174725 () Bool)

(assert (=> start!108406 m!1174725))

(declare-fun m!1174727 () Bool)

(assert (=> start!108406 m!1174727))

(declare-fun m!1174729 () Bool)

(assert (=> start!108406 m!1174729))

(declare-fun m!1174731 () Bool)

(assert (=> b!1278815 m!1174731))

(assert (=> b!1278815 m!1174731))

(declare-fun m!1174733 () Bool)

(assert (=> b!1278815 m!1174733))

(declare-fun m!1174735 () Bool)

(assert (=> b!1278814 m!1174735))

(declare-fun m!1174737 () Bool)

(assert (=> b!1278818 m!1174737))

(declare-fun m!1174739 () Bool)

(assert (=> mapNonEmpty!51674 m!1174739))

(check-sat tp_is_empty!33427 b_and!45937 (not b!1278814) (not b!1278815) (not b_next!27877) (not start!108406) (not mapNonEmpty!51674) (not b!1278818))
(check-sat b_and!45937 (not b_next!27877))
