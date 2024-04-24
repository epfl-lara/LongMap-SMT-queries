; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108286 () Bool)

(assert start!108286)

(declare-fun b_free!27775 () Bool)

(declare-fun b_next!27775 () Bool)

(assert (=> start!108286 (= b_free!27775 (not b_next!27775))))

(declare-fun tp!98278 () Bool)

(declare-fun b_and!45833 () Bool)

(assert (=> start!108286 (= tp!98278 b_and!45833)))

(declare-fun b!1277513 () Bool)

(declare-fun res!848674 () Bool)

(declare-fun e!729565 () Bool)

(assert (=> b!1277513 (=> (not res!848674) (not e!729565))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-datatypes ((array!83773 0))(
  ( (array!83774 (arr!40393 (Array (_ BitVec 32) (_ BitVec 64))) (size!40944 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83773)

(declare-datatypes ((V!49537 0))(
  ( (V!49538 (val!16737 Int)) )
))
(declare-datatypes ((ValueCell!15764 0))(
  ( (ValueCellFull!15764 (v!19329 V!49537)) (EmptyCell!15764) )
))
(declare-datatypes ((array!83775 0))(
  ( (array!83776 (arr!40394 (Array (_ BitVec 32) ValueCell!15764)) (size!40945 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83775)

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277513 (= res!848674 (and (= (size!40945 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40944 _keys!1427) (size!40945 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277514 () Bool)

(declare-fun res!848672 () Bool)

(assert (=> b!1277514 (=> (not res!848672) (not e!729565))))

(declare-datatypes ((List!28666 0))(
  ( (Nil!28663) (Cons!28662 (h!29880 (_ BitVec 64)) (t!42194 List!28666)) )
))
(declare-fun arrayNoDuplicates!0 (array!83773 (_ BitVec 32) List!28666) Bool)

(assert (=> b!1277514 (= res!848672 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28663))))

(declare-fun b!1277515 () Bool)

(assert (=> b!1277515 (= e!729565 false)))

(declare-fun minValue!1129 () V!49537)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49537)

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575939 () Bool)

(declare-datatypes ((tuple2!21474 0))(
  ( (tuple2!21475 (_1!10748 (_ BitVec 64)) (_2!10748 V!49537)) )
))
(declare-datatypes ((List!28667 0))(
  ( (Nil!28664) (Cons!28663 (h!29881 tuple2!21474) (t!42195 List!28667)) )
))
(declare-datatypes ((ListLongMap!19139 0))(
  ( (ListLongMap!19140 (toList!9585 List!28667)) )
))
(declare-fun contains!7709 (ListLongMap!19139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4654 (array!83773 array!83775 (_ BitVec 32) (_ BitVec 32) V!49537 V!49537 (_ BitVec 32) Int) ListLongMap!19139)

(assert (=> b!1277515 (= lt!575939 (contains!7709 (getCurrentListMap!4654 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277516 () Bool)

(declare-fun e!729564 () Bool)

(declare-fun tp_is_empty!33325 () Bool)

(assert (=> b!1277516 (= e!729564 tp_is_empty!33325)))

(declare-fun b!1277517 () Bool)

(declare-fun res!848671 () Bool)

(assert (=> b!1277517 (=> (not res!848671) (not e!729565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83773 (_ BitVec 32)) Bool)

(assert (=> b!1277517 (= res!848671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277518 () Bool)

(declare-fun e!729567 () Bool)

(assert (=> b!1277518 (= e!729567 tp_is_empty!33325)))

(declare-fun res!848673 () Bool)

(assert (=> start!108286 (=> (not res!848673) (not e!729565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108286 (= res!848673 (validMask!0 mask!1805))))

(assert (=> start!108286 e!729565))

(assert (=> start!108286 true))

(assert (=> start!108286 tp!98278))

(assert (=> start!108286 tp_is_empty!33325))

(declare-fun e!729566 () Bool)

(declare-fun array_inv!30885 (array!83775) Bool)

(assert (=> start!108286 (and (array_inv!30885 _values!1187) e!729566)))

(declare-fun array_inv!30886 (array!83773) Bool)

(assert (=> start!108286 (array_inv!30886 _keys!1427)))

(declare-fun mapIsEmpty!51518 () Bool)

(declare-fun mapRes!51518 () Bool)

(assert (=> mapIsEmpty!51518 mapRes!51518))

(declare-fun b!1277519 () Bool)

(assert (=> b!1277519 (= e!729566 (and e!729567 mapRes!51518))))

(declare-fun condMapEmpty!51518 () Bool)

(declare-fun mapDefault!51518 () ValueCell!15764)

(assert (=> b!1277519 (= condMapEmpty!51518 (= (arr!40394 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15764)) mapDefault!51518)))))

(declare-fun mapNonEmpty!51518 () Bool)

(declare-fun tp!98279 () Bool)

(assert (=> mapNonEmpty!51518 (= mapRes!51518 (and tp!98279 e!729564))))

(declare-fun mapKey!51518 () (_ BitVec 32))

(declare-fun mapRest!51518 () (Array (_ BitVec 32) ValueCell!15764))

(declare-fun mapValue!51518 () ValueCell!15764)

(assert (=> mapNonEmpty!51518 (= (arr!40394 _values!1187) (store mapRest!51518 mapKey!51518 mapValue!51518))))

(assert (= (and start!108286 res!848673) b!1277513))

(assert (= (and b!1277513 res!848674) b!1277517))

(assert (= (and b!1277517 res!848671) b!1277514))

(assert (= (and b!1277514 res!848672) b!1277515))

(assert (= (and b!1277519 condMapEmpty!51518) mapIsEmpty!51518))

(assert (= (and b!1277519 (not condMapEmpty!51518)) mapNonEmpty!51518))

(get-info :version)

(assert (= (and mapNonEmpty!51518 ((_ is ValueCellFull!15764) mapValue!51518)) b!1277516))

(assert (= (and b!1277519 ((_ is ValueCellFull!15764) mapDefault!51518)) b!1277518))

(assert (= start!108286 b!1277519))

(declare-fun m!1173789 () Bool)

(assert (=> b!1277514 m!1173789))

(declare-fun m!1173791 () Bool)

(assert (=> b!1277517 m!1173791))

(declare-fun m!1173793 () Bool)

(assert (=> start!108286 m!1173793))

(declare-fun m!1173795 () Bool)

(assert (=> start!108286 m!1173795))

(declare-fun m!1173797 () Bool)

(assert (=> start!108286 m!1173797))

(declare-fun m!1173799 () Bool)

(assert (=> b!1277515 m!1173799))

(assert (=> b!1277515 m!1173799))

(declare-fun m!1173801 () Bool)

(assert (=> b!1277515 m!1173801))

(declare-fun m!1173803 () Bool)

(assert (=> mapNonEmpty!51518 m!1173803))

(check-sat (not b!1277517) (not start!108286) tp_is_empty!33325 (not b_next!27775) b_and!45833 (not b!1277515) (not mapNonEmpty!51518) (not b!1277514))
(check-sat b_and!45833 (not b_next!27775))
