; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109488 () Bool)

(assert start!109488)

(declare-fun b_free!28977 () Bool)

(declare-fun b_next!28977 () Bool)

(assert (=> start!109488 (= b_free!28977 (not b_next!28977))))

(declare-fun tp!102049 () Bool)

(declare-fun b_and!47067 () Bool)

(assert (=> start!109488 (= tp!102049 b_and!47067)))

(declare-fun b!1296751 () Bool)

(declare-fun e!739799 () Bool)

(declare-fun tp_is_empty!34617 () Bool)

(assert (=> b!1296751 (= e!739799 tp_is_empty!34617)))

(declare-fun mapNonEmpty!53486 () Bool)

(declare-fun mapRes!53486 () Bool)

(declare-fun tp!102050 () Bool)

(declare-fun e!739801 () Bool)

(assert (=> mapNonEmpty!53486 (= mapRes!53486 (and tp!102050 e!739801))))

(declare-datatypes ((V!51259 0))(
  ( (V!51260 (val!17383 Int)) )
))
(declare-datatypes ((ValueCell!16410 0))(
  ( (ValueCellFull!16410 (v!19986 V!51259)) (EmptyCell!16410) )
))
(declare-fun mapValue!53486 () ValueCell!16410)

(declare-fun mapRest!53486 () (Array (_ BitVec 32) ValueCell!16410))

(declare-datatypes ((array!86252 0))(
  ( (array!86253 (arr!41627 (Array (_ BitVec 32) ValueCell!16410)) (size!42177 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86252)

(declare-fun mapKey!53486 () (_ BitVec 32))

(assert (=> mapNonEmpty!53486 (= (arr!41627 _values!1445) (store mapRest!53486 mapKey!53486 mapValue!53486))))

(declare-fun mapIsEmpty!53486 () Bool)

(assert (=> mapIsEmpty!53486 mapRes!53486))

(declare-fun b!1296752 () Bool)

(declare-fun res!861809 () Bool)

(declare-fun e!739798 () Bool)

(assert (=> b!1296752 (=> (not res!861809) (not e!739798))))

(declare-datatypes ((array!86254 0))(
  ( (array!86255 (arr!41628 (Array (_ BitVec 32) (_ BitVec 64))) (size!42178 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86254)

(declare-datatypes ((List!29533 0))(
  ( (Nil!29530) (Cons!29529 (h!30738 (_ BitVec 64)) (t!43097 List!29533)) )
))
(declare-fun arrayNoDuplicates!0 (array!86254 (_ BitVec 32) List!29533) Bool)

(assert (=> b!1296752 (= res!861809 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29530))))

(declare-fun b!1296753 () Bool)

(assert (=> b!1296753 (= e!739801 tp_is_empty!34617)))

(declare-fun b!1296754 () Bool)

(declare-fun res!861811 () Bool)

(assert (=> b!1296754 (=> (not res!861811) (not e!739798))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86254 (_ BitVec 32)) Bool)

(assert (=> b!1296754 (= res!861811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296755 () Bool)

(declare-fun res!861813 () Bool)

(assert (=> b!1296755 (=> (not res!861813) (not e!739798))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296755 (= res!861813 (and (= (size!42177 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42178 _keys!1741) (size!42177 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296756 () Bool)

(declare-fun res!861810 () Bool)

(assert (=> b!1296756 (=> (not res!861810) (not e!739798))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1296756 (= res!861810 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42178 _keys!1741))))))

(declare-fun b!1296757 () Bool)

(assert (=> b!1296757 (= e!739798 false)))

(declare-fun minValue!1387 () V!51259)

(declare-fun zeroValue!1387 () V!51259)

(declare-fun lt!580520 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22396 0))(
  ( (tuple2!22397 (_1!11209 (_ BitVec 64)) (_2!11209 V!51259)) )
))
(declare-datatypes ((List!29534 0))(
  ( (Nil!29531) (Cons!29530 (h!30739 tuple2!22396) (t!43098 List!29534)) )
))
(declare-datatypes ((ListLongMap!20053 0))(
  ( (ListLongMap!20054 (toList!10042 List!29534)) )
))
(declare-fun contains!8160 (ListLongMap!20053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5071 (array!86254 array!86252 (_ BitVec 32) (_ BitVec 32) V!51259 V!51259 (_ BitVec 32) Int) ListLongMap!20053)

(assert (=> b!1296757 (= lt!580520 (contains!8160 (getCurrentListMap!5071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!861812 () Bool)

(assert (=> start!109488 (=> (not res!861812) (not e!739798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109488 (= res!861812 (validMask!0 mask!2175))))

(assert (=> start!109488 e!739798))

(assert (=> start!109488 tp_is_empty!34617))

(assert (=> start!109488 true))

(declare-fun e!739802 () Bool)

(declare-fun array_inv!31505 (array!86252) Bool)

(assert (=> start!109488 (and (array_inv!31505 _values!1445) e!739802)))

(declare-fun array_inv!31506 (array!86254) Bool)

(assert (=> start!109488 (array_inv!31506 _keys!1741)))

(assert (=> start!109488 tp!102049))

(declare-fun b!1296750 () Bool)

(assert (=> b!1296750 (= e!739802 (and e!739799 mapRes!53486))))

(declare-fun condMapEmpty!53486 () Bool)

(declare-fun mapDefault!53486 () ValueCell!16410)

(assert (=> b!1296750 (= condMapEmpty!53486 (= (arr!41627 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16410)) mapDefault!53486)))))

(assert (= (and start!109488 res!861812) b!1296755))

(assert (= (and b!1296755 res!861813) b!1296754))

(assert (= (and b!1296754 res!861811) b!1296752))

(assert (= (and b!1296752 res!861809) b!1296756))

(assert (= (and b!1296756 res!861810) b!1296757))

(assert (= (and b!1296750 condMapEmpty!53486) mapIsEmpty!53486))

(assert (= (and b!1296750 (not condMapEmpty!53486)) mapNonEmpty!53486))

(get-info :version)

(assert (= (and mapNonEmpty!53486 ((_ is ValueCellFull!16410) mapValue!53486)) b!1296753))

(assert (= (and b!1296750 ((_ is ValueCellFull!16410) mapDefault!53486)) b!1296751))

(assert (= start!109488 b!1296750))

(declare-fun m!1188579 () Bool)

(assert (=> b!1296752 m!1188579))

(declare-fun m!1188581 () Bool)

(assert (=> mapNonEmpty!53486 m!1188581))

(declare-fun m!1188583 () Bool)

(assert (=> b!1296754 m!1188583))

(declare-fun m!1188585 () Bool)

(assert (=> start!109488 m!1188585))

(declare-fun m!1188587 () Bool)

(assert (=> start!109488 m!1188587))

(declare-fun m!1188589 () Bool)

(assert (=> start!109488 m!1188589))

(declare-fun m!1188591 () Bool)

(assert (=> b!1296757 m!1188591))

(assert (=> b!1296757 m!1188591))

(declare-fun m!1188593 () Bool)

(assert (=> b!1296757 m!1188593))

(check-sat (not mapNonEmpty!53486) (not b_next!28977) (not b!1296754) (not b!1296752) (not b!1296757) tp_is_empty!34617 b_and!47067 (not start!109488))
(check-sat b_and!47067 (not b_next!28977))
