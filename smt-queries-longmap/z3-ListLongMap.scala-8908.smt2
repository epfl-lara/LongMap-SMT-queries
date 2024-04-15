; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108098 () Bool)

(assert start!108098)

(declare-fun b_free!27811 () Bool)

(declare-fun b_next!27811 () Bool)

(assert (=> start!108098 (= b_free!27811 (not b_next!27811))))

(declare-fun tp!98387 () Bool)

(declare-fun b_and!45849 () Bool)

(assert (=> start!108098 (= tp!98387 b_and!45849)))

(declare-fun mapNonEmpty!51572 () Bool)

(declare-fun mapRes!51572 () Bool)

(declare-fun tp!98388 () Bool)

(declare-fun e!728960 () Bool)

(assert (=> mapNonEmpty!51572 (= mapRes!51572 (and tp!98388 e!728960))))

(declare-datatypes ((V!49585 0))(
  ( (V!49586 (val!16755 Int)) )
))
(declare-datatypes ((ValueCell!15782 0))(
  ( (ValueCellFull!15782 (v!19351 V!49585)) (EmptyCell!15782) )
))
(declare-fun mapRest!51572 () (Array (_ BitVec 32) ValueCell!15782))

(declare-fun mapKey!51572 () (_ BitVec 32))

(declare-fun mapValue!51572 () ValueCell!15782)

(declare-datatypes ((array!83715 0))(
  ( (array!83716 (arr!40369 (Array (_ BitVec 32) ValueCell!15782)) (size!40921 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83715)

(assert (=> mapNonEmpty!51572 (= (arr!40369 _values!1187) (store mapRest!51572 mapKey!51572 mapValue!51572))))

(declare-fun b!1276522 () Bool)

(declare-fun tp_is_empty!33361 () Bool)

(assert (=> b!1276522 (= e!728960 tp_is_empty!33361)))

(declare-fun mapIsEmpty!51572 () Bool)

(assert (=> mapIsEmpty!51572 mapRes!51572))

(declare-fun b!1276523 () Bool)

(declare-fun res!848342 () Bool)

(declare-fun e!728962 () Bool)

(assert (=> b!1276523 (=> (not res!848342) (not e!728962))))

(declare-datatypes ((array!83717 0))(
  ( (array!83718 (arr!40370 (Array (_ BitVec 32) (_ BitVec 64))) (size!40922 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83717)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83717 (_ BitVec 32)) Bool)

(assert (=> b!1276523 (= res!848342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276524 () Bool)

(assert (=> b!1276524 (= e!728962 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49585)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575331 () Bool)

(declare-fun zeroValue!1129 () V!49585)

(declare-datatypes ((tuple2!21568 0))(
  ( (tuple2!21569 (_1!10795 (_ BitVec 64)) (_2!10795 V!49585)) )
))
(declare-datatypes ((List!28736 0))(
  ( (Nil!28733) (Cons!28732 (h!29941 tuple2!21568) (t!42264 List!28736)) )
))
(declare-datatypes ((ListLongMap!19225 0))(
  ( (ListLongMap!19226 (toList!9628 List!28736)) )
))
(declare-fun contains!7668 (ListLongMap!19225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4602 (array!83717 array!83715 (_ BitVec 32) (_ BitVec 32) V!49585 V!49585 (_ BitVec 32) Int) ListLongMap!19225)

(assert (=> b!1276524 (= lt!575331 (contains!7668 (getCurrentListMap!4602 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276525 () Bool)

(declare-fun res!848343 () Bool)

(assert (=> b!1276525 (=> (not res!848343) (not e!728962))))

(assert (=> b!1276525 (= res!848343 (and (= (size!40921 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40922 _keys!1427) (size!40921 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276526 () Bool)

(declare-fun e!728961 () Bool)

(assert (=> b!1276526 (= e!728961 tp_is_empty!33361)))

(declare-fun b!1276527 () Bool)

(declare-fun res!848340 () Bool)

(assert (=> b!1276527 (=> (not res!848340) (not e!728962))))

(declare-datatypes ((List!28737 0))(
  ( (Nil!28734) (Cons!28733 (h!29942 (_ BitVec 64)) (t!42265 List!28737)) )
))
(declare-fun arrayNoDuplicates!0 (array!83717 (_ BitVec 32) List!28737) Bool)

(assert (=> b!1276527 (= res!848340 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28734))))

(declare-fun b!1276528 () Bool)

(declare-fun e!728959 () Bool)

(assert (=> b!1276528 (= e!728959 (and e!728961 mapRes!51572))))

(declare-fun condMapEmpty!51572 () Bool)

(declare-fun mapDefault!51572 () ValueCell!15782)

(assert (=> b!1276528 (= condMapEmpty!51572 (= (arr!40369 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15782)) mapDefault!51572)))))

(declare-fun res!848341 () Bool)

(assert (=> start!108098 (=> (not res!848341) (not e!728962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108098 (= res!848341 (validMask!0 mask!1805))))

(assert (=> start!108098 e!728962))

(assert (=> start!108098 true))

(assert (=> start!108098 tp!98387))

(assert (=> start!108098 tp_is_empty!33361))

(declare-fun array_inv!30833 (array!83715) Bool)

(assert (=> start!108098 (and (array_inv!30833 _values!1187) e!728959)))

(declare-fun array_inv!30834 (array!83717) Bool)

(assert (=> start!108098 (array_inv!30834 _keys!1427)))

(assert (= (and start!108098 res!848341) b!1276525))

(assert (= (and b!1276525 res!848343) b!1276523))

(assert (= (and b!1276523 res!848342) b!1276527))

(assert (= (and b!1276527 res!848340) b!1276524))

(assert (= (and b!1276528 condMapEmpty!51572) mapIsEmpty!51572))

(assert (= (and b!1276528 (not condMapEmpty!51572)) mapNonEmpty!51572))

(get-info :version)

(assert (= (and mapNonEmpty!51572 ((_ is ValueCellFull!15782) mapValue!51572)) b!1276522))

(assert (= (and b!1276528 ((_ is ValueCellFull!15782) mapDefault!51572)) b!1276526))

(assert (= start!108098 b!1276528))

(declare-fun m!1171965 () Bool)

(assert (=> start!108098 m!1171965))

(declare-fun m!1171967 () Bool)

(assert (=> start!108098 m!1171967))

(declare-fun m!1171969 () Bool)

(assert (=> start!108098 m!1171969))

(declare-fun m!1171971 () Bool)

(assert (=> b!1276523 m!1171971))

(declare-fun m!1171973 () Bool)

(assert (=> mapNonEmpty!51572 m!1171973))

(declare-fun m!1171975 () Bool)

(assert (=> b!1276527 m!1171975))

(declare-fun m!1171977 () Bool)

(assert (=> b!1276524 m!1171977))

(assert (=> b!1276524 m!1171977))

(declare-fun m!1171979 () Bool)

(assert (=> b!1276524 m!1171979))

(check-sat (not b!1276523) (not start!108098) (not b!1276524) tp_is_empty!33361 b_and!45849 (not b!1276527) (not b_next!27811) (not mapNonEmpty!51572))
(check-sat b_and!45849 (not b_next!27811))
