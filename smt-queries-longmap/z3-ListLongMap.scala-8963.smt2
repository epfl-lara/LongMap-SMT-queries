; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108728 () Bool)

(assert start!108728)

(declare-fun b_free!28051 () Bool)

(declare-fun b_next!28051 () Bool)

(assert (=> start!108728 (= b_free!28051 (not b_next!28051))))

(declare-fun tp!99263 () Bool)

(declare-fun b_and!46113 () Bool)

(assert (=> start!108728 (= tp!99263 b_and!46113)))

(declare-fun b!1281970 () Bool)

(declare-fun res!851214 () Bool)

(declare-fun e!732595 () Bool)

(assert (=> b!1281970 (=> (not res!851214) (not e!732595))))

(declare-datatypes ((V!50025 0))(
  ( (V!50026 (val!16920 Int)) )
))
(declare-fun minValue!1387 () V!50025)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15947 0))(
  ( (ValueCellFull!15947 (v!19515 V!50025)) (EmptyCell!15947) )
))
(declare-datatypes ((array!84487 0))(
  ( (array!84488 (arr!40743 (Array (_ BitVec 32) ValueCell!15947)) (size!41294 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84487)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84489 0))(
  ( (array!84490 (arr!40744 (Array (_ BitVec 32) (_ BitVec 64))) (size!41295 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84489)

(declare-fun zeroValue!1387 () V!50025)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21678 0))(
  ( (tuple2!21679 (_1!10850 (_ BitVec 64)) (_2!10850 V!50025)) )
))
(declare-datatypes ((List!28893 0))(
  ( (Nil!28890) (Cons!28889 (h!30107 tuple2!21678) (t!42425 List!28893)) )
))
(declare-datatypes ((ListLongMap!19343 0))(
  ( (ListLongMap!19344 (toList!9687 List!28893)) )
))
(declare-fun contains!7816 (ListLongMap!19343 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4756 (array!84489 array!84487 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 32) Int) ListLongMap!19343)

(assert (=> b!1281970 (= res!851214 (contains!7816 (getCurrentListMap!4756 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281971 () Bool)

(declare-fun res!851215 () Bool)

(assert (=> b!1281971 (=> (not res!851215) (not e!732595))))

(assert (=> b!1281971 (= res!851215 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41295 _keys!1741))))))

(declare-fun b!1281972 () Bool)

(declare-fun e!732594 () Bool)

(declare-fun tp_is_empty!33691 () Bool)

(assert (=> b!1281972 (= e!732594 tp_is_empty!33691)))

(declare-fun b!1281973 () Bool)

(declare-fun res!851213 () Bool)

(assert (=> b!1281973 (=> (not res!851213) (not e!732595))))

(assert (=> b!1281973 (= res!851213 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41295 _keys!1741)) (not (= (select (arr!40744 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1281974 () Bool)

(declare-fun res!851216 () Bool)

(assert (=> b!1281974 (=> (not res!851216) (not e!732595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84489 (_ BitVec 32)) Bool)

(assert (=> b!1281974 (= res!851216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52088 () Bool)

(declare-fun mapRes!52088 () Bool)

(declare-fun tp!99262 () Bool)

(assert (=> mapNonEmpty!52088 (= mapRes!52088 (and tp!99262 e!732594))))

(declare-fun mapKey!52088 () (_ BitVec 32))

(declare-fun mapValue!52088 () ValueCell!15947)

(declare-fun mapRest!52088 () (Array (_ BitVec 32) ValueCell!15947))

(assert (=> mapNonEmpty!52088 (= (arr!40743 _values!1445) (store mapRest!52088 mapKey!52088 mapValue!52088))))

(declare-fun b!1281975 () Bool)

(declare-fun e!732596 () Bool)

(assert (=> b!1281975 (= e!732596 tp_is_empty!33691)))

(declare-fun b!1281976 () Bool)

(assert (=> b!1281976 (= e!732595 (not true))))

(assert (=> b!1281976 (contains!7816 (getCurrentListMap!4756 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42364 0))(
  ( (Unit!42365) )
))
(declare-fun lt!576633 () Unit!42364)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!3 (array!84489 array!84487 (_ BitVec 32) (_ BitVec 32) V!50025 V!50025 (_ BitVec 64) (_ BitVec 32) Int) Unit!42364)

(assert (=> b!1281976 (= lt!576633 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!3 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281977 () Bool)

(declare-fun res!851217 () Bool)

(assert (=> b!1281977 (=> (not res!851217) (not e!732595))))

(assert (=> b!1281977 (= res!851217 (and (= (size!41294 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41295 _keys!1741) (size!41294 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281978 () Bool)

(declare-fun res!851211 () Bool)

(assert (=> b!1281978 (=> (not res!851211) (not e!732595))))

(declare-datatypes ((List!28894 0))(
  ( (Nil!28891) (Cons!28890 (h!30108 (_ BitVec 64)) (t!42426 List!28894)) )
))
(declare-fun arrayNoDuplicates!0 (array!84489 (_ BitVec 32) List!28894) Bool)

(assert (=> b!1281978 (= res!851211 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28891))))

(declare-fun b!1281979 () Bool)

(declare-fun e!732593 () Bool)

(assert (=> b!1281979 (= e!732593 (and e!732596 mapRes!52088))))

(declare-fun condMapEmpty!52088 () Bool)

(declare-fun mapDefault!52088 () ValueCell!15947)

(assert (=> b!1281979 (= condMapEmpty!52088 (= (arr!40743 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15947)) mapDefault!52088)))))

(declare-fun res!851212 () Bool)

(assert (=> start!108728 (=> (not res!851212) (not e!732595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108728 (= res!851212 (validMask!0 mask!2175))))

(assert (=> start!108728 e!732595))

(assert (=> start!108728 tp_is_empty!33691))

(assert (=> start!108728 true))

(declare-fun array_inv!31127 (array!84487) Bool)

(assert (=> start!108728 (and (array_inv!31127 _values!1445) e!732593)))

(declare-fun array_inv!31128 (array!84489) Bool)

(assert (=> start!108728 (array_inv!31128 _keys!1741)))

(assert (=> start!108728 tp!99263))

(declare-fun mapIsEmpty!52088 () Bool)

(assert (=> mapIsEmpty!52088 mapRes!52088))

(assert (= (and start!108728 res!851212) b!1281977))

(assert (= (and b!1281977 res!851217) b!1281974))

(assert (= (and b!1281974 res!851216) b!1281978))

(assert (= (and b!1281978 res!851211) b!1281971))

(assert (= (and b!1281971 res!851215) b!1281970))

(assert (= (and b!1281970 res!851214) b!1281973))

(assert (= (and b!1281973 res!851213) b!1281976))

(assert (= (and b!1281979 condMapEmpty!52088) mapIsEmpty!52088))

(assert (= (and b!1281979 (not condMapEmpty!52088)) mapNonEmpty!52088))

(get-info :version)

(assert (= (and mapNonEmpty!52088 ((_ is ValueCellFull!15947) mapValue!52088)) b!1281972))

(assert (= (and b!1281979 ((_ is ValueCellFull!15947) mapDefault!52088)) b!1281975))

(assert (= start!108728 b!1281979))

(declare-fun m!1176849 () Bool)

(assert (=> mapNonEmpty!52088 m!1176849))

(declare-fun m!1176851 () Bool)

(assert (=> start!108728 m!1176851))

(declare-fun m!1176853 () Bool)

(assert (=> start!108728 m!1176853))

(declare-fun m!1176855 () Bool)

(assert (=> start!108728 m!1176855))

(declare-fun m!1176857 () Bool)

(assert (=> b!1281978 m!1176857))

(declare-fun m!1176859 () Bool)

(assert (=> b!1281970 m!1176859))

(assert (=> b!1281970 m!1176859))

(declare-fun m!1176861 () Bool)

(assert (=> b!1281970 m!1176861))

(declare-fun m!1176863 () Bool)

(assert (=> b!1281973 m!1176863))

(declare-fun m!1176865 () Bool)

(assert (=> b!1281976 m!1176865))

(assert (=> b!1281976 m!1176865))

(declare-fun m!1176867 () Bool)

(assert (=> b!1281976 m!1176867))

(declare-fun m!1176869 () Bool)

(assert (=> b!1281976 m!1176869))

(declare-fun m!1176871 () Bool)

(assert (=> b!1281974 m!1176871))

(check-sat (not b!1281970) (not b!1281978) tp_is_empty!33691 (not b!1281976) (not start!108728) (not b!1281974) (not b_next!28051) b_and!46113 (not mapNonEmpty!52088))
(check-sat b_and!46113 (not b_next!28051))
