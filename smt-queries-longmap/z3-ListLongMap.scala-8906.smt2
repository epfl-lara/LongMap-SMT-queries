; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108310 () Bool)

(assert start!108310)

(declare-fun b_free!27799 () Bool)

(declare-fun b_next!27799 () Bool)

(assert (=> start!108310 (= b_free!27799 (not b_next!27799))))

(declare-fun tp!98350 () Bool)

(declare-fun b_and!45857 () Bool)

(assert (=> start!108310 (= tp!98350 b_and!45857)))

(declare-fun mapNonEmpty!51554 () Bool)

(declare-fun mapRes!51554 () Bool)

(declare-fun tp!98351 () Bool)

(declare-fun e!729746 () Bool)

(assert (=> mapNonEmpty!51554 (= mapRes!51554 (and tp!98351 e!729746))))

(declare-datatypes ((V!49569 0))(
  ( (V!49570 (val!16749 Int)) )
))
(declare-datatypes ((ValueCell!15776 0))(
  ( (ValueCellFull!15776 (v!19341 V!49569)) (EmptyCell!15776) )
))
(declare-fun mapValue!51554 () ValueCell!15776)

(declare-fun mapRest!51554 () (Array (_ BitVec 32) ValueCell!15776))

(declare-fun mapKey!51554 () (_ BitVec 32))

(declare-datatypes ((array!83821 0))(
  ( (array!83822 (arr!40417 (Array (_ BitVec 32) ValueCell!15776)) (size!40968 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83821)

(assert (=> mapNonEmpty!51554 (= (arr!40417 _values!1187) (store mapRest!51554 mapKey!51554 mapValue!51554))))

(declare-fun b!1277766 () Bool)

(declare-fun e!729748 () Bool)

(declare-fun tp_is_empty!33349 () Bool)

(assert (=> b!1277766 (= e!729748 tp_is_empty!33349)))

(declare-fun b!1277767 () Bool)

(declare-fun res!848815 () Bool)

(declare-fun e!729745 () Bool)

(assert (=> b!1277767 (=> (not res!848815) (not e!729745))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83823 0))(
  ( (array!83824 (arr!40418 (Array (_ BitVec 32) (_ BitVec 64))) (size!40969 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83823)

(assert (=> b!1277767 (= res!848815 (and (= (size!40968 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40969 _keys!1427) (size!40968 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51554 () Bool)

(assert (=> mapIsEmpty!51554 mapRes!51554))

(declare-fun b!1277768 () Bool)

(assert (=> b!1277768 (= e!729746 tp_is_empty!33349)))

(declare-fun b!1277769 () Bool)

(declare-fun res!848818 () Bool)

(assert (=> b!1277769 (=> (not res!848818) (not e!729745))))

(declare-datatypes ((List!28686 0))(
  ( (Nil!28683) (Cons!28682 (h!29900 (_ BitVec 64)) (t!42214 List!28686)) )
))
(declare-fun arrayNoDuplicates!0 (array!83823 (_ BitVec 32) List!28686) Bool)

(assert (=> b!1277769 (= res!848818 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28683))))

(declare-fun b!1277770 () Bool)

(declare-fun res!848816 () Bool)

(assert (=> b!1277770 (=> (not res!848816) (not e!729745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83823 (_ BitVec 32)) Bool)

(assert (=> b!1277770 (= res!848816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277771 () Bool)

(assert (=> b!1277771 (= e!729745 false)))

(declare-fun lt!575975 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49569)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49569)

(declare-datatypes ((tuple2!21494 0))(
  ( (tuple2!21495 (_1!10758 (_ BitVec 64)) (_2!10758 V!49569)) )
))
(declare-datatypes ((List!28687 0))(
  ( (Nil!28684) (Cons!28683 (h!29901 tuple2!21494) (t!42215 List!28687)) )
))
(declare-datatypes ((ListLongMap!19159 0))(
  ( (ListLongMap!19160 (toList!9595 List!28687)) )
))
(declare-fun contains!7719 (ListLongMap!19159 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4664 (array!83823 array!83821 (_ BitVec 32) (_ BitVec 32) V!49569 V!49569 (_ BitVec 32) Int) ListLongMap!19159)

(assert (=> b!1277771 (= lt!575975 (contains!7719 (getCurrentListMap!4664 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277765 () Bool)

(declare-fun e!729747 () Bool)

(assert (=> b!1277765 (= e!729747 (and e!729748 mapRes!51554))))

(declare-fun condMapEmpty!51554 () Bool)

(declare-fun mapDefault!51554 () ValueCell!15776)

(assert (=> b!1277765 (= condMapEmpty!51554 (= (arr!40417 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15776)) mapDefault!51554)))))

(declare-fun res!848817 () Bool)

(assert (=> start!108310 (=> (not res!848817) (not e!729745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108310 (= res!848817 (validMask!0 mask!1805))))

(assert (=> start!108310 e!729745))

(assert (=> start!108310 true))

(assert (=> start!108310 tp!98350))

(assert (=> start!108310 tp_is_empty!33349))

(declare-fun array_inv!30903 (array!83821) Bool)

(assert (=> start!108310 (and (array_inv!30903 _values!1187) e!729747)))

(declare-fun array_inv!30904 (array!83823) Bool)

(assert (=> start!108310 (array_inv!30904 _keys!1427)))

(assert (= (and start!108310 res!848817) b!1277767))

(assert (= (and b!1277767 res!848815) b!1277770))

(assert (= (and b!1277770 res!848816) b!1277769))

(assert (= (and b!1277769 res!848818) b!1277771))

(assert (= (and b!1277765 condMapEmpty!51554) mapIsEmpty!51554))

(assert (= (and b!1277765 (not condMapEmpty!51554)) mapNonEmpty!51554))

(get-info :version)

(assert (= (and mapNonEmpty!51554 ((_ is ValueCellFull!15776) mapValue!51554)) b!1277768))

(assert (= (and b!1277765 ((_ is ValueCellFull!15776) mapDefault!51554)) b!1277766))

(assert (= start!108310 b!1277765))

(declare-fun m!1173981 () Bool)

(assert (=> start!108310 m!1173981))

(declare-fun m!1173983 () Bool)

(assert (=> start!108310 m!1173983))

(declare-fun m!1173985 () Bool)

(assert (=> start!108310 m!1173985))

(declare-fun m!1173987 () Bool)

(assert (=> mapNonEmpty!51554 m!1173987))

(declare-fun m!1173989 () Bool)

(assert (=> b!1277771 m!1173989))

(assert (=> b!1277771 m!1173989))

(declare-fun m!1173991 () Bool)

(assert (=> b!1277771 m!1173991))

(declare-fun m!1173993 () Bool)

(assert (=> b!1277770 m!1173993))

(declare-fun m!1173995 () Bool)

(assert (=> b!1277769 m!1173995))

(check-sat b_and!45857 (not b!1277771) (not b!1277770) (not b!1277769) (not b_next!27799) tp_is_empty!33349 (not mapNonEmpty!51554) (not start!108310))
(check-sat b_and!45857 (not b_next!27799))
