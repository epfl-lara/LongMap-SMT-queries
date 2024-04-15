; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108450 () Bool)

(assert start!108450)

(declare-fun b_free!27997 () Bool)

(declare-fun b_next!27997 () Bool)

(assert (=> start!108450 (= b_free!27997 (not b_next!27997))))

(declare-fun tp!99102 () Bool)

(declare-fun b_and!46039 () Bool)

(assert (=> start!108450 (= tp!99102 b_and!46039)))

(declare-fun b!1279913 () Bool)

(declare-fun res!850223 () Bool)

(declare-fun e!731316 () Bool)

(assert (=> b!1279913 (=> (not res!850223) (not e!731316))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49953 0))(
  ( (V!49954 (val!16893 Int)) )
))
(declare-datatypes ((ValueCell!15920 0))(
  ( (ValueCellFull!15920 (v!19492 V!49953)) (EmptyCell!15920) )
))
(declare-datatypes ((array!84245 0))(
  ( (array!84246 (arr!40627 (Array (_ BitVec 32) ValueCell!15920)) (size!41179 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84245)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84247 0))(
  ( (array!84248 (arr!40628 (Array (_ BitVec 32) (_ BitVec 64))) (size!41180 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84247)

(assert (=> b!1279913 (= res!850223 (and (= (size!41179 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41180 _keys!1741) (size!41179 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279914 () Bool)

(declare-fun res!850219 () Bool)

(assert (=> b!1279914 (=> (not res!850219) (not e!731316))))

(declare-datatypes ((List!28882 0))(
  ( (Nil!28879) (Cons!28878 (h!30087 (_ BitVec 64)) (t!42414 List!28882)) )
))
(declare-fun arrayNoDuplicates!0 (array!84247 (_ BitVec 32) List!28882) Bool)

(assert (=> b!1279914 (= res!850219 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28879))))

(declare-fun b!1279915 () Bool)

(declare-fun e!731312 () Bool)

(declare-fun tp_is_empty!33637 () Bool)

(assert (=> b!1279915 (= e!731312 tp_is_empty!33637)))

(declare-fun b!1279916 () Bool)

(declare-fun e!731313 () Bool)

(declare-fun e!731314 () Bool)

(declare-fun mapRes!52007 () Bool)

(assert (=> b!1279916 (= e!731313 (and e!731314 mapRes!52007))))

(declare-fun condMapEmpty!52007 () Bool)

(declare-fun mapDefault!52007 () ValueCell!15920)

(assert (=> b!1279916 (= condMapEmpty!52007 (= (arr!40627 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15920)) mapDefault!52007)))))

(declare-fun mapNonEmpty!52007 () Bool)

(declare-fun tp!99101 () Bool)

(assert (=> mapNonEmpty!52007 (= mapRes!52007 (and tp!99101 e!731312))))

(declare-fun mapRest!52007 () (Array (_ BitVec 32) ValueCell!15920))

(declare-fun mapKey!52007 () (_ BitVec 32))

(declare-fun mapValue!52007 () ValueCell!15920)

(assert (=> mapNonEmpty!52007 (= (arr!40627 _values!1445) (store mapRest!52007 mapKey!52007 mapValue!52007))))

(declare-fun b!1279917 () Bool)

(assert (=> b!1279917 (= e!731314 tp_is_empty!33637)))

(declare-fun b!1279918 () Bool)

(declare-fun res!850221 () Bool)

(assert (=> b!1279918 (=> (not res!850221) (not e!731316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84247 (_ BitVec 32)) Bool)

(assert (=> b!1279918 (= res!850221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!850222 () Bool)

(assert (=> start!108450 (=> (not res!850222) (not e!731316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108450 (= res!850222 (validMask!0 mask!2175))))

(assert (=> start!108450 e!731316))

(assert (=> start!108450 tp_is_empty!33637))

(assert (=> start!108450 true))

(declare-fun array_inv!31007 (array!84245) Bool)

(assert (=> start!108450 (and (array_inv!31007 _values!1445) e!731313)))

(declare-fun array_inv!31008 (array!84247) Bool)

(assert (=> start!108450 (array_inv!31008 _keys!1741)))

(assert (=> start!108450 tp!99102))

(declare-fun mapIsEmpty!52007 () Bool)

(assert (=> mapIsEmpty!52007 mapRes!52007))

(declare-fun b!1279919 () Bool)

(assert (=> b!1279919 (= e!731316 false)))

(declare-fun minValue!1387 () V!49953)

(declare-fun zeroValue!1387 () V!49953)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575890 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21692 0))(
  ( (tuple2!21693 (_1!10857 (_ BitVec 64)) (_2!10857 V!49953)) )
))
(declare-datatypes ((List!28883 0))(
  ( (Nil!28880) (Cons!28879 (h!30088 tuple2!21692) (t!42415 List!28883)) )
))
(declare-datatypes ((ListLongMap!19349 0))(
  ( (ListLongMap!19350 (toList!9690 List!28883)) )
))
(declare-fun contains!7735 (ListLongMap!19349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4664 (array!84247 array!84245 (_ BitVec 32) (_ BitVec 32) V!49953 V!49953 (_ BitVec 32) Int) ListLongMap!19349)

(assert (=> b!1279919 (= lt!575890 (contains!7735 (getCurrentListMap!4664 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279920 () Bool)

(declare-fun res!850220 () Bool)

(assert (=> b!1279920 (=> (not res!850220) (not e!731316))))

(assert (=> b!1279920 (= res!850220 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41180 _keys!1741))))))

(assert (= (and start!108450 res!850222) b!1279913))

(assert (= (and b!1279913 res!850223) b!1279918))

(assert (= (and b!1279918 res!850221) b!1279914))

(assert (= (and b!1279914 res!850219) b!1279920))

(assert (= (and b!1279920 res!850220) b!1279919))

(assert (= (and b!1279916 condMapEmpty!52007) mapIsEmpty!52007))

(assert (= (and b!1279916 (not condMapEmpty!52007)) mapNonEmpty!52007))

(get-info :version)

(assert (= (and mapNonEmpty!52007 ((_ is ValueCellFull!15920) mapValue!52007)) b!1279915))

(assert (= (and b!1279916 ((_ is ValueCellFull!15920) mapDefault!52007)) b!1279917))

(assert (= start!108450 b!1279916))

(declare-fun m!1174257 () Bool)

(assert (=> b!1279918 m!1174257))

(declare-fun m!1174259 () Bool)

(assert (=> b!1279914 m!1174259))

(declare-fun m!1174261 () Bool)

(assert (=> b!1279919 m!1174261))

(assert (=> b!1279919 m!1174261))

(declare-fun m!1174263 () Bool)

(assert (=> b!1279919 m!1174263))

(declare-fun m!1174265 () Bool)

(assert (=> start!108450 m!1174265))

(declare-fun m!1174267 () Bool)

(assert (=> start!108450 m!1174267))

(declare-fun m!1174269 () Bool)

(assert (=> start!108450 m!1174269))

(declare-fun m!1174271 () Bool)

(assert (=> mapNonEmpty!52007 m!1174271))

(check-sat b_and!46039 (not start!108450) (not b!1279918) (not mapNonEmpty!52007) (not b!1279914) (not b!1279919) (not b_next!27997) tp_is_empty!33637)
(check-sat b_and!46039 (not b_next!27997))
