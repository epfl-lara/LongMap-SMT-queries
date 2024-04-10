; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108202 () Bool)

(assert start!108202)

(declare-fun b_free!27897 () Bool)

(declare-fun b_next!27897 () Bool)

(assert (=> start!108202 (= b_free!27897 (not b_next!27897))))

(declare-fun tp!98648 () Bool)

(declare-fun b_and!45955 () Bool)

(assert (=> start!108202 (= tp!98648 b_and!45955)))

(declare-fun b!1277718 () Bool)

(declare-fun e!729742 () Bool)

(assert (=> b!1277718 (= e!729742 false)))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun lt!575737 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49699 0))(
  ( (V!49700 (val!16798 Int)) )
))
(declare-fun minValue!1129 () V!49699)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15825 0))(
  ( (ValueCellFull!15825 (v!19396 V!49699)) (EmptyCell!15825) )
))
(declare-datatypes ((array!83986 0))(
  ( (array!83987 (arr!40503 (Array (_ BitVec 32) ValueCell!15825)) (size!41053 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83986)

(declare-fun zeroValue!1129 () V!49699)

(declare-datatypes ((array!83988 0))(
  ( (array!83989 (arr!40504 (Array (_ BitVec 32) (_ BitVec 64))) (size!41054 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83988)

(declare-datatypes ((tuple2!21546 0))(
  ( (tuple2!21547 (_1!10784 (_ BitVec 64)) (_2!10784 V!49699)) )
))
(declare-datatypes ((List!28723 0))(
  ( (Nil!28720) (Cons!28719 (h!29928 tuple2!21546) (t!42261 List!28723)) )
))
(declare-datatypes ((ListLongMap!19203 0))(
  ( (ListLongMap!19204 (toList!9617 List!28723)) )
))
(declare-fun contains!7727 (ListLongMap!19203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4701 (array!83988 array!83986 (_ BitVec 32) (_ BitVec 32) V!49699 V!49699 (_ BitVec 32) Int) ListLongMap!19203)

(assert (=> b!1277718 (= lt!575737 (contains!7727 (getCurrentListMap!4701 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun res!848989 () Bool)

(assert (=> start!108202 (=> (not res!848989) (not e!729742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108202 (= res!848989 (validMask!0 mask!1805))))

(assert (=> start!108202 e!729742))

(assert (=> start!108202 true))

(assert (=> start!108202 tp!98648))

(declare-fun tp_is_empty!33447 () Bool)

(assert (=> start!108202 tp_is_empty!33447))

(declare-fun e!729744 () Bool)

(declare-fun array_inv!30771 (array!83986) Bool)

(assert (=> start!108202 (and (array_inv!30771 _values!1187) e!729744)))

(declare-fun array_inv!30772 (array!83988) Bool)

(assert (=> start!108202 (array_inv!30772 _keys!1427)))

(declare-fun b!1277719 () Bool)

(declare-fun e!729741 () Bool)

(assert (=> b!1277719 (= e!729741 tp_is_empty!33447)))

(declare-fun b!1277720 () Bool)

(declare-fun res!848990 () Bool)

(assert (=> b!1277720 (=> (not res!848990) (not e!729742))))

(declare-datatypes ((List!28724 0))(
  ( (Nil!28721) (Cons!28720 (h!29929 (_ BitVec 64)) (t!42262 List!28724)) )
))
(declare-fun arrayNoDuplicates!0 (array!83988 (_ BitVec 32) List!28724) Bool)

(assert (=> b!1277720 (= res!848990 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28721))))

(declare-fun b!1277721 () Bool)

(declare-fun e!729743 () Bool)

(assert (=> b!1277721 (= e!729743 tp_is_empty!33447)))

(declare-fun mapIsEmpty!51704 () Bool)

(declare-fun mapRes!51704 () Bool)

(assert (=> mapIsEmpty!51704 mapRes!51704))

(declare-fun b!1277722 () Bool)

(declare-fun res!848991 () Bool)

(assert (=> b!1277722 (=> (not res!848991) (not e!729742))))

(assert (=> b!1277722 (= res!848991 (and (= (size!41053 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41054 _keys!1427) (size!41053 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277723 () Bool)

(declare-fun res!848988 () Bool)

(assert (=> b!1277723 (=> (not res!848988) (not e!729742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83988 (_ BitVec 32)) Bool)

(assert (=> b!1277723 (= res!848988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277724 () Bool)

(assert (=> b!1277724 (= e!729744 (and e!729743 mapRes!51704))))

(declare-fun condMapEmpty!51704 () Bool)

(declare-fun mapDefault!51704 () ValueCell!15825)

(assert (=> b!1277724 (= condMapEmpty!51704 (= (arr!40503 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15825)) mapDefault!51704)))))

(declare-fun mapNonEmpty!51704 () Bool)

(declare-fun tp!98647 () Bool)

(assert (=> mapNonEmpty!51704 (= mapRes!51704 (and tp!98647 e!729741))))

(declare-fun mapValue!51704 () ValueCell!15825)

(declare-fun mapKey!51704 () (_ BitVec 32))

(declare-fun mapRest!51704 () (Array (_ BitVec 32) ValueCell!15825))

(assert (=> mapNonEmpty!51704 (= (arr!40503 _values!1187) (store mapRest!51704 mapKey!51704 mapValue!51704))))

(assert (= (and start!108202 res!848989) b!1277722))

(assert (= (and b!1277722 res!848991) b!1277723))

(assert (= (and b!1277723 res!848988) b!1277720))

(assert (= (and b!1277720 res!848990) b!1277718))

(assert (= (and b!1277724 condMapEmpty!51704) mapIsEmpty!51704))

(assert (= (and b!1277724 (not condMapEmpty!51704)) mapNonEmpty!51704))

(get-info :version)

(assert (= (and mapNonEmpty!51704 ((_ is ValueCellFull!15825) mapValue!51704)) b!1277719))

(assert (= (and b!1277724 ((_ is ValueCellFull!15825) mapDefault!51704)) b!1277721))

(assert (= start!108202 b!1277724))

(declare-fun m!1173273 () Bool)

(assert (=> b!1277723 m!1173273))

(declare-fun m!1173275 () Bool)

(assert (=> mapNonEmpty!51704 m!1173275))

(declare-fun m!1173277 () Bool)

(assert (=> start!108202 m!1173277))

(declare-fun m!1173279 () Bool)

(assert (=> start!108202 m!1173279))

(declare-fun m!1173281 () Bool)

(assert (=> start!108202 m!1173281))

(declare-fun m!1173283 () Bool)

(assert (=> b!1277720 m!1173283))

(declare-fun m!1173285 () Bool)

(assert (=> b!1277718 m!1173285))

(assert (=> b!1277718 m!1173285))

(declare-fun m!1173287 () Bool)

(assert (=> b!1277718 m!1173287))

(check-sat (not start!108202) (not b!1277720) (not mapNonEmpty!51704) (not b!1277718) (not b_next!27897) b_and!45955 tp_is_empty!33447 (not b!1277723))
(check-sat b_and!45955 (not b_next!27897))
