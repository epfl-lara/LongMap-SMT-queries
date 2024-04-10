; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108756 () Bool)

(assert start!108756)

(declare-fun b_free!28269 () Bool)

(declare-fun b_next!28269 () Bool)

(assert (=> start!108756 (= b_free!28269 (not b_next!28269))))

(declare-fun tp!99922 () Bool)

(declare-fun b_and!46335 () Bool)

(assert (=> start!108756 (= tp!99922 b_and!46335)))

(declare-fun res!853157 () Bool)

(declare-fun e!733578 () Bool)

(assert (=> start!108756 (=> (not res!853157) (not e!733578))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108756 (= res!853157 (validMask!0 mask!2175))))

(assert (=> start!108756 e!733578))

(declare-fun tp_is_empty!33909 () Bool)

(assert (=> start!108756 tp_is_empty!33909))

(assert (=> start!108756 true))

(declare-datatypes ((V!50315 0))(
  ( (V!50316 (val!17029 Int)) )
))
(declare-datatypes ((ValueCell!16056 0))(
  ( (ValueCellFull!16056 (v!19631 V!50315)) (EmptyCell!16056) )
))
(declare-datatypes ((array!84876 0))(
  ( (array!84877 (arr!40940 (Array (_ BitVec 32) ValueCell!16056)) (size!41490 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84876)

(declare-fun e!733580 () Bool)

(declare-fun array_inv!31049 (array!84876) Bool)

(assert (=> start!108756 (and (array_inv!31049 _values!1445) e!733580)))

(declare-datatypes ((array!84878 0))(
  ( (array!84879 (arr!40941 (Array (_ BitVec 32) (_ BitVec 64))) (size!41491 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84878)

(declare-fun array_inv!31050 (array!84878) Bool)

(assert (=> start!108756 (array_inv!31050 _keys!1741)))

(assert (=> start!108756 tp!99922))

(declare-fun b!1284260 () Bool)

(declare-fun res!853160 () Bool)

(assert (=> b!1284260 (=> (not res!853160) (not e!733578))))

(declare-datatypes ((List!29009 0))(
  ( (Nil!29006) (Cons!29005 (h!30214 (_ BitVec 64)) (t!42553 List!29009)) )
))
(declare-fun arrayNoDuplicates!0 (array!84878 (_ BitVec 32) List!29009) Bool)

(assert (=> b!1284260 (= res!853160 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29006))))

(declare-fun b!1284261 () Bool)

(declare-fun e!733576 () Bool)

(declare-fun mapRes!52421 () Bool)

(assert (=> b!1284261 (= e!733580 (and e!733576 mapRes!52421))))

(declare-fun condMapEmpty!52421 () Bool)

(declare-fun mapDefault!52421 () ValueCell!16056)

(assert (=> b!1284261 (= condMapEmpty!52421 (= (arr!40940 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16056)) mapDefault!52421)))))

(declare-fun b!1284262 () Bool)

(declare-fun res!853161 () Bool)

(assert (=> b!1284262 (=> (not res!853161) (not e!733578))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284262 (= res!853161 (and (= (size!41490 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41491 _keys!1741) (size!41490 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284263 () Bool)

(declare-fun e!733579 () Bool)

(assert (=> b!1284263 (= e!733579 tp_is_empty!33909)))

(declare-fun b!1284264 () Bool)

(declare-fun res!853159 () Bool)

(assert (=> b!1284264 (=> (not res!853159) (not e!733578))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284264 (= res!853159 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41491 _keys!1741))))))

(declare-fun b!1284265 () Bool)

(assert (=> b!1284265 (= e!733576 tp_is_empty!33909)))

(declare-fun b!1284266 () Bool)

(assert (=> b!1284266 (= e!733578 false)))

(declare-fun minValue!1387 () V!50315)

(declare-fun zeroValue!1387 () V!50315)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576790 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21816 0))(
  ( (tuple2!21817 (_1!10919 (_ BitVec 64)) (_2!10919 V!50315)) )
))
(declare-datatypes ((List!29010 0))(
  ( (Nil!29007) (Cons!29006 (h!30215 tuple2!21816) (t!42554 List!29010)) )
))
(declare-datatypes ((ListLongMap!19473 0))(
  ( (ListLongMap!19474 (toList!9752 List!29010)) )
))
(declare-fun contains!7869 (ListLongMap!19473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4831 (array!84878 array!84876 (_ BitVec 32) (_ BitVec 32) V!50315 V!50315 (_ BitVec 32) Int) ListLongMap!19473)

(assert (=> b!1284266 (= lt!576790 (contains!7869 (getCurrentListMap!4831 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284267 () Bool)

(declare-fun res!853158 () Bool)

(assert (=> b!1284267 (=> (not res!853158) (not e!733578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84878 (_ BitVec 32)) Bool)

(assert (=> b!1284267 (= res!853158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52421 () Bool)

(declare-fun tp!99923 () Bool)

(assert (=> mapNonEmpty!52421 (= mapRes!52421 (and tp!99923 e!733579))))

(declare-fun mapKey!52421 () (_ BitVec 32))

(declare-fun mapValue!52421 () ValueCell!16056)

(declare-fun mapRest!52421 () (Array (_ BitVec 32) ValueCell!16056))

(assert (=> mapNonEmpty!52421 (= (arr!40940 _values!1445) (store mapRest!52421 mapKey!52421 mapValue!52421))))

(declare-fun mapIsEmpty!52421 () Bool)

(assert (=> mapIsEmpty!52421 mapRes!52421))

(assert (= (and start!108756 res!853157) b!1284262))

(assert (= (and b!1284262 res!853161) b!1284267))

(assert (= (and b!1284267 res!853158) b!1284260))

(assert (= (and b!1284260 res!853160) b!1284264))

(assert (= (and b!1284264 res!853159) b!1284266))

(assert (= (and b!1284261 condMapEmpty!52421) mapIsEmpty!52421))

(assert (= (and b!1284261 (not condMapEmpty!52421)) mapNonEmpty!52421))

(get-info :version)

(assert (= (and mapNonEmpty!52421 ((_ is ValueCellFull!16056) mapValue!52421)) b!1284263))

(assert (= (and b!1284261 ((_ is ValueCellFull!16056) mapDefault!52421)) b!1284265))

(assert (= start!108756 b!1284261))

(declare-fun m!1178005 () Bool)

(assert (=> mapNonEmpty!52421 m!1178005))

(declare-fun m!1178007 () Bool)

(assert (=> b!1284260 m!1178007))

(declare-fun m!1178009 () Bool)

(assert (=> b!1284267 m!1178009))

(declare-fun m!1178011 () Bool)

(assert (=> start!108756 m!1178011))

(declare-fun m!1178013 () Bool)

(assert (=> start!108756 m!1178013))

(declare-fun m!1178015 () Bool)

(assert (=> start!108756 m!1178015))

(declare-fun m!1178017 () Bool)

(assert (=> b!1284266 m!1178017))

(assert (=> b!1284266 m!1178017))

(declare-fun m!1178019 () Bool)

(assert (=> b!1284266 m!1178019))

(check-sat (not b!1284260) b_and!46335 (not b_next!28269) tp_is_empty!33909 (not b!1284267) (not start!108756) (not mapNonEmpty!52421) (not b!1284266))
(check-sat b_and!46335 (not b_next!28269))
