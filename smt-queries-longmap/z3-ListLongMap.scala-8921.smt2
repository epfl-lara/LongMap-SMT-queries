; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108196 () Bool)

(assert start!108196)

(declare-fun b_free!27891 () Bool)

(declare-fun b_next!27891 () Bool)

(assert (=> start!108196 (= b_free!27891 (not b_next!27891))))

(declare-fun tp!98630 () Bool)

(declare-fun b_and!45949 () Bool)

(assert (=> start!108196 (= tp!98630 b_and!45949)))

(declare-fun mapIsEmpty!51695 () Bool)

(declare-fun mapRes!51695 () Bool)

(assert (=> mapIsEmpty!51695 mapRes!51695))

(declare-fun b!1277655 () Bool)

(declare-fun e!729699 () Bool)

(declare-fun tp_is_empty!33441 () Bool)

(assert (=> b!1277655 (= e!729699 tp_is_empty!33441)))

(declare-fun res!848955 () Bool)

(declare-fun e!729695 () Bool)

(assert (=> start!108196 (=> (not res!848955) (not e!729695))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108196 (= res!848955 (validMask!0 mask!1805))))

(assert (=> start!108196 e!729695))

(assert (=> start!108196 true))

(assert (=> start!108196 tp!98630))

(assert (=> start!108196 tp_is_empty!33441))

(declare-datatypes ((V!49691 0))(
  ( (V!49692 (val!16795 Int)) )
))
(declare-datatypes ((ValueCell!15822 0))(
  ( (ValueCellFull!15822 (v!19393 V!49691)) (EmptyCell!15822) )
))
(declare-datatypes ((array!83976 0))(
  ( (array!83977 (arr!40498 (Array (_ BitVec 32) ValueCell!15822)) (size!41048 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83976)

(declare-fun e!729696 () Bool)

(declare-fun array_inv!30769 (array!83976) Bool)

(assert (=> start!108196 (and (array_inv!30769 _values!1187) e!729696)))

(declare-datatypes ((array!83978 0))(
  ( (array!83979 (arr!40499 (Array (_ BitVec 32) (_ BitVec 64))) (size!41049 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83978)

(declare-fun array_inv!30770 (array!83978) Bool)

(assert (=> start!108196 (array_inv!30770 _keys!1427)))

(declare-fun b!1277656 () Bool)

(declare-fun e!729698 () Bool)

(assert (=> b!1277656 (= e!729696 (and e!729698 mapRes!51695))))

(declare-fun condMapEmpty!51695 () Bool)

(declare-fun mapDefault!51695 () ValueCell!15822)

(assert (=> b!1277656 (= condMapEmpty!51695 (= (arr!40498 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15822)) mapDefault!51695)))))

(declare-fun b!1277657 () Bool)

(declare-fun res!848952 () Bool)

(assert (=> b!1277657 (=> (not res!848952) (not e!729695))))

(declare-datatypes ((List!28719 0))(
  ( (Nil!28716) (Cons!28715 (h!29924 (_ BitVec 64)) (t!42257 List!28719)) )
))
(declare-fun arrayNoDuplicates!0 (array!83978 (_ BitVec 32) List!28719) Bool)

(assert (=> b!1277657 (= res!848952 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28716))))

(declare-fun b!1277658 () Bool)

(declare-fun res!848954 () Bool)

(assert (=> b!1277658 (=> (not res!848954) (not e!729695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83978 (_ BitVec 32)) Bool)

(assert (=> b!1277658 (= res!848954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277659 () Bool)

(declare-fun res!848953 () Bool)

(assert (=> b!1277659 (=> (not res!848953) (not e!729695))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277659 (= res!848953 (and (= (size!41048 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41049 _keys!1427) (size!41048 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51695 () Bool)

(declare-fun tp!98629 () Bool)

(assert (=> mapNonEmpty!51695 (= mapRes!51695 (and tp!98629 e!729699))))

(declare-fun mapValue!51695 () ValueCell!15822)

(declare-fun mapKey!51695 () (_ BitVec 32))

(declare-fun mapRest!51695 () (Array (_ BitVec 32) ValueCell!15822))

(assert (=> mapNonEmpty!51695 (= (arr!40498 _values!1187) (store mapRest!51695 mapKey!51695 mapValue!51695))))

(declare-fun b!1277660 () Bool)

(assert (=> b!1277660 (= e!729698 tp_is_empty!33441)))

(declare-fun b!1277661 () Bool)

(assert (=> b!1277661 (= e!729695 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49691)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49691)

(declare-fun lt!575728 () Bool)

(declare-datatypes ((tuple2!21542 0))(
  ( (tuple2!21543 (_1!10782 (_ BitVec 64)) (_2!10782 V!49691)) )
))
(declare-datatypes ((List!28720 0))(
  ( (Nil!28717) (Cons!28716 (h!29925 tuple2!21542) (t!42258 List!28720)) )
))
(declare-datatypes ((ListLongMap!19199 0))(
  ( (ListLongMap!19200 (toList!9615 List!28720)) )
))
(declare-fun contains!7725 (ListLongMap!19199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4699 (array!83978 array!83976 (_ BitVec 32) (_ BitVec 32) V!49691 V!49691 (_ BitVec 32) Int) ListLongMap!19199)

(assert (=> b!1277661 (= lt!575728 (contains!7725 (getCurrentListMap!4699 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108196 res!848955) b!1277659))

(assert (= (and b!1277659 res!848953) b!1277658))

(assert (= (and b!1277658 res!848954) b!1277657))

(assert (= (and b!1277657 res!848952) b!1277661))

(assert (= (and b!1277656 condMapEmpty!51695) mapIsEmpty!51695))

(assert (= (and b!1277656 (not condMapEmpty!51695)) mapNonEmpty!51695))

(get-info :version)

(assert (= (and mapNonEmpty!51695 ((_ is ValueCellFull!15822) mapValue!51695)) b!1277655))

(assert (= (and b!1277656 ((_ is ValueCellFull!15822) mapDefault!51695)) b!1277660))

(assert (= start!108196 b!1277656))

(declare-fun m!1173225 () Bool)

(assert (=> b!1277658 m!1173225))

(declare-fun m!1173227 () Bool)

(assert (=> b!1277661 m!1173227))

(assert (=> b!1277661 m!1173227))

(declare-fun m!1173229 () Bool)

(assert (=> b!1277661 m!1173229))

(declare-fun m!1173231 () Bool)

(assert (=> b!1277657 m!1173231))

(declare-fun m!1173233 () Bool)

(assert (=> mapNonEmpty!51695 m!1173233))

(declare-fun m!1173235 () Bool)

(assert (=> start!108196 m!1173235))

(declare-fun m!1173237 () Bool)

(assert (=> start!108196 m!1173237))

(declare-fun m!1173239 () Bool)

(assert (=> start!108196 m!1173239))

(check-sat tp_is_empty!33441 (not b!1277658) (not mapNonEmpty!51695) (not b!1277657) (not b!1277661) (not start!108196) (not b_next!27891) b_and!45949)
(check-sat b_and!45949 (not b_next!27891))
