; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108086 () Bool)

(assert start!108086)

(declare-fun b_free!27799 () Bool)

(declare-fun b_next!27799 () Bool)

(assert (=> start!108086 (= b_free!27799 (not b_next!27799))))

(declare-fun tp!98351 () Bool)

(declare-fun b_and!45837 () Bool)

(assert (=> start!108086 (= tp!98351 b_and!45837)))

(declare-fun mapIsEmpty!51554 () Bool)

(declare-fun mapRes!51554 () Bool)

(assert (=> mapIsEmpty!51554 mapRes!51554))

(declare-fun b!1276396 () Bool)

(declare-fun res!848270 () Bool)

(declare-fun e!728870 () Bool)

(assert (=> b!1276396 (=> (not res!848270) (not e!728870))))

(declare-datatypes ((array!83693 0))(
  ( (array!83694 (arr!40358 (Array (_ BitVec 32) (_ BitVec 64))) (size!40910 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83693)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83693 (_ BitVec 32)) Bool)

(assert (=> b!1276396 (= res!848270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276397 () Bool)

(declare-fun e!728869 () Bool)

(declare-fun tp_is_empty!33349 () Bool)

(assert (=> b!1276397 (= e!728869 tp_is_empty!33349)))

(declare-fun b!1276398 () Bool)

(declare-fun res!848271 () Bool)

(assert (=> b!1276398 (=> (not res!848271) (not e!728870))))

(declare-datatypes ((List!28728 0))(
  ( (Nil!28725) (Cons!28724 (h!29933 (_ BitVec 64)) (t!42256 List!28728)) )
))
(declare-fun arrayNoDuplicates!0 (array!83693 (_ BitVec 32) List!28728) Bool)

(assert (=> b!1276398 (= res!848271 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28725))))

(declare-fun res!848268 () Bool)

(assert (=> start!108086 (=> (not res!848268) (not e!728870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108086 (= res!848268 (validMask!0 mask!1805))))

(assert (=> start!108086 e!728870))

(assert (=> start!108086 true))

(assert (=> start!108086 tp!98351))

(assert (=> start!108086 tp_is_empty!33349))

(declare-datatypes ((V!49569 0))(
  ( (V!49570 (val!16749 Int)) )
))
(declare-datatypes ((ValueCell!15776 0))(
  ( (ValueCellFull!15776 (v!19345 V!49569)) (EmptyCell!15776) )
))
(declare-datatypes ((array!83695 0))(
  ( (array!83696 (arr!40359 (Array (_ BitVec 32) ValueCell!15776)) (size!40911 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83695)

(declare-fun e!728872 () Bool)

(declare-fun array_inv!30827 (array!83695) Bool)

(assert (=> start!108086 (and (array_inv!30827 _values!1187) e!728872)))

(declare-fun array_inv!30828 (array!83693) Bool)

(assert (=> start!108086 (array_inv!30828 _keys!1427)))

(declare-fun mapNonEmpty!51554 () Bool)

(declare-fun tp!98352 () Bool)

(declare-fun e!728868 () Bool)

(assert (=> mapNonEmpty!51554 (= mapRes!51554 (and tp!98352 e!728868))))

(declare-fun mapValue!51554 () ValueCell!15776)

(declare-fun mapRest!51554 () (Array (_ BitVec 32) ValueCell!15776))

(declare-fun mapKey!51554 () (_ BitVec 32))

(assert (=> mapNonEmpty!51554 (= (arr!40359 _values!1187) (store mapRest!51554 mapKey!51554 mapValue!51554))))

(declare-fun b!1276399 () Bool)

(assert (=> b!1276399 (= e!728868 tp_is_empty!33349)))

(declare-fun b!1276400 () Bool)

(declare-fun res!848269 () Bool)

(assert (=> b!1276400 (=> (not res!848269) (not e!728870))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276400 (= res!848269 (and (= (size!40911 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40910 _keys!1427) (size!40911 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276401 () Bool)

(assert (=> b!1276401 (= e!728872 (and e!728869 mapRes!51554))))

(declare-fun condMapEmpty!51554 () Bool)

(declare-fun mapDefault!51554 () ValueCell!15776)

(assert (=> b!1276401 (= condMapEmpty!51554 (= (arr!40359 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15776)) mapDefault!51554)))))

(declare-fun b!1276402 () Bool)

(assert (=> b!1276402 (= e!728870 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49569)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49569)

(declare-fun lt!575313 () Bool)

(declare-datatypes ((tuple2!21558 0))(
  ( (tuple2!21559 (_1!10790 (_ BitVec 64)) (_2!10790 V!49569)) )
))
(declare-datatypes ((List!28729 0))(
  ( (Nil!28726) (Cons!28725 (h!29934 tuple2!21558) (t!42257 List!28729)) )
))
(declare-datatypes ((ListLongMap!19215 0))(
  ( (ListLongMap!19216 (toList!9623 List!28729)) )
))
(declare-fun contains!7663 (ListLongMap!19215 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4597 (array!83693 array!83695 (_ BitVec 32) (_ BitVec 32) V!49569 V!49569 (_ BitVec 32) Int) ListLongMap!19215)

(assert (=> b!1276402 (= lt!575313 (contains!7663 (getCurrentListMap!4597 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(assert (= (and start!108086 res!848268) b!1276400))

(assert (= (and b!1276400 res!848269) b!1276396))

(assert (= (and b!1276396 res!848270) b!1276398))

(assert (= (and b!1276398 res!848271) b!1276402))

(assert (= (and b!1276401 condMapEmpty!51554) mapIsEmpty!51554))

(assert (= (and b!1276401 (not condMapEmpty!51554)) mapNonEmpty!51554))

(get-info :version)

(assert (= (and mapNonEmpty!51554 ((_ is ValueCellFull!15776) mapValue!51554)) b!1276399))

(assert (= (and b!1276401 ((_ is ValueCellFull!15776) mapDefault!51554)) b!1276397))

(assert (= start!108086 b!1276401))

(declare-fun m!1171869 () Bool)

(assert (=> start!108086 m!1171869))

(declare-fun m!1171871 () Bool)

(assert (=> start!108086 m!1171871))

(declare-fun m!1171873 () Bool)

(assert (=> start!108086 m!1171873))

(declare-fun m!1171875 () Bool)

(assert (=> mapNonEmpty!51554 m!1171875))

(declare-fun m!1171877 () Bool)

(assert (=> b!1276398 m!1171877))

(declare-fun m!1171879 () Bool)

(assert (=> b!1276402 m!1171879))

(assert (=> b!1276402 m!1171879))

(declare-fun m!1171881 () Bool)

(assert (=> b!1276402 m!1171881))

(declare-fun m!1171883 () Bool)

(assert (=> b!1276396 m!1171883))

(check-sat b_and!45837 (not b_next!27799) (not b!1276398) (not start!108086) (not mapNonEmpty!51554) tp_is_empty!33349 (not b!1276402) (not b!1276396))
(check-sat b_and!45837 (not b_next!27799))
