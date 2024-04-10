; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108392 () Bool)

(assert start!108392)

(declare-fun b_free!27939 () Bool)

(declare-fun b_next!27939 () Bool)

(assert (=> start!108392 (= b_free!27939 (not b_next!27939))))

(declare-fun tp!98927 () Bool)

(declare-fun b_and!45999 () Bool)

(assert (=> start!108392 (= tp!98927 b_and!45999)))

(declare-fun b!1279272 () Bool)

(declare-fun res!849802 () Bool)

(declare-fun e!730906 () Bool)

(assert (=> b!1279272 (=> (not res!849802) (not e!730906))))

(declare-datatypes ((array!84246 0))(
  ( (array!84247 (arr!40627 (Array (_ BitVec 32) (_ BitVec 64))) (size!41177 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84246)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84246 (_ BitVec 32)) Bool)

(assert (=> b!1279272 (= res!849802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279274 () Bool)

(declare-fun res!849803 () Bool)

(assert (=> b!1279274 (=> (not res!849803) (not e!730906))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279274 (= res!849803 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41177 _keys!1741))))))

(declare-fun b!1279275 () Bool)

(declare-fun e!730909 () Bool)

(declare-fun tp_is_empty!33579 () Bool)

(assert (=> b!1279275 (= e!730909 tp_is_empty!33579)))

(declare-fun mapIsEmpty!51920 () Bool)

(declare-fun mapRes!51920 () Bool)

(assert (=> mapIsEmpty!51920 mapRes!51920))

(declare-fun b!1279276 () Bool)

(assert (=> b!1279276 (= e!730906 false)))

(declare-datatypes ((V!49875 0))(
  ( (V!49876 (val!16864 Int)) )
))
(declare-fun minValue!1387 () V!49875)

(declare-fun zeroValue!1387 () V!49875)

(declare-datatypes ((ValueCell!15891 0))(
  ( (ValueCellFull!15891 (v!19464 V!49875)) (EmptyCell!15891) )
))
(declare-datatypes ((array!84248 0))(
  ( (array!84249 (arr!40628 (Array (_ BitVec 32) ValueCell!15891)) (size!41178 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84248)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!575990 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21576 0))(
  ( (tuple2!21577 (_1!10799 (_ BitVec 64)) (_2!10799 V!49875)) )
))
(declare-datatypes ((List!28775 0))(
  ( (Nil!28772) (Cons!28771 (h!29980 tuple2!21576) (t!42315 List!28775)) )
))
(declare-datatypes ((ListLongMap!19233 0))(
  ( (ListLongMap!19234 (toList!9632 List!28775)) )
))
(declare-fun contains!7747 (ListLongMap!19233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4716 (array!84246 array!84248 (_ BitVec 32) (_ BitVec 32) V!49875 V!49875 (_ BitVec 32) Int) ListLongMap!19233)

(assert (=> b!1279276 (= lt!575990 (contains!7747 (getCurrentListMap!4716 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!51920 () Bool)

(declare-fun tp!98926 () Bool)

(declare-fun e!730908 () Bool)

(assert (=> mapNonEmpty!51920 (= mapRes!51920 (and tp!98926 e!730908))))

(declare-fun mapValue!51920 () ValueCell!15891)

(declare-fun mapKey!51920 () (_ BitVec 32))

(declare-fun mapRest!51920 () (Array (_ BitVec 32) ValueCell!15891))

(assert (=> mapNonEmpty!51920 (= (arr!40628 _values!1445) (store mapRest!51920 mapKey!51920 mapValue!51920))))

(declare-fun b!1279277 () Bool)

(assert (=> b!1279277 (= e!730908 tp_is_empty!33579)))

(declare-fun b!1279278 () Bool)

(declare-fun e!730907 () Bool)

(assert (=> b!1279278 (= e!730907 (and e!730909 mapRes!51920))))

(declare-fun condMapEmpty!51920 () Bool)

(declare-fun mapDefault!51920 () ValueCell!15891)

(assert (=> b!1279278 (= condMapEmpty!51920 (= (arr!40628 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15891)) mapDefault!51920)))))

(declare-fun b!1279279 () Bool)

(declare-fun res!849805 () Bool)

(assert (=> b!1279279 (=> (not res!849805) (not e!730906))))

(declare-datatypes ((List!28776 0))(
  ( (Nil!28773) (Cons!28772 (h!29981 (_ BitVec 64)) (t!42316 List!28776)) )
))
(declare-fun arrayNoDuplicates!0 (array!84246 (_ BitVec 32) List!28776) Bool)

(assert (=> b!1279279 (= res!849805 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28773))))

(declare-fun res!849806 () Bool)

(assert (=> start!108392 (=> (not res!849806) (not e!730906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108392 (= res!849806 (validMask!0 mask!2175))))

(assert (=> start!108392 e!730906))

(assert (=> start!108392 tp_is_empty!33579))

(assert (=> start!108392 true))

(declare-fun array_inv!30845 (array!84248) Bool)

(assert (=> start!108392 (and (array_inv!30845 _values!1445) e!730907)))

(declare-fun array_inv!30846 (array!84246) Bool)

(assert (=> start!108392 (array_inv!30846 _keys!1741)))

(assert (=> start!108392 tp!98927))

(declare-fun b!1279273 () Bool)

(declare-fun res!849804 () Bool)

(assert (=> b!1279273 (=> (not res!849804) (not e!730906))))

(assert (=> b!1279273 (= res!849804 (and (= (size!41178 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41177 _keys!1741) (size!41178 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108392 res!849806) b!1279273))

(assert (= (and b!1279273 res!849804) b!1279272))

(assert (= (and b!1279272 res!849802) b!1279279))

(assert (= (and b!1279279 res!849805) b!1279274))

(assert (= (and b!1279274 res!849803) b!1279276))

(assert (= (and b!1279278 condMapEmpty!51920) mapIsEmpty!51920))

(assert (= (and b!1279278 (not condMapEmpty!51920)) mapNonEmpty!51920))

(get-info :version)

(assert (= (and mapNonEmpty!51920 ((_ is ValueCellFull!15891) mapValue!51920)) b!1279277))

(assert (= (and b!1279278 ((_ is ValueCellFull!15891) mapDefault!51920)) b!1279275))

(assert (= start!108392 b!1279278))

(declare-fun m!1174293 () Bool)

(assert (=> b!1279272 m!1174293))

(declare-fun m!1174295 () Bool)

(assert (=> start!108392 m!1174295))

(declare-fun m!1174297 () Bool)

(assert (=> start!108392 m!1174297))

(declare-fun m!1174299 () Bool)

(assert (=> start!108392 m!1174299))

(declare-fun m!1174301 () Bool)

(assert (=> b!1279279 m!1174301))

(declare-fun m!1174303 () Bool)

(assert (=> mapNonEmpty!51920 m!1174303))

(declare-fun m!1174305 () Bool)

(assert (=> b!1279276 m!1174305))

(assert (=> b!1279276 m!1174305))

(declare-fun m!1174307 () Bool)

(assert (=> b!1279276 m!1174307))

(check-sat b_and!45999 (not b!1279272) (not b_next!27939) (not b!1279276) (not b!1279279) tp_is_empty!33579 (not start!108392) (not mapNonEmpty!51920))
(check-sat b_and!45999 (not b_next!27939))
