; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108528 () Bool)

(assert start!108528)

(declare-fun b_free!28075 () Bool)

(declare-fun b_next!28075 () Bool)

(assert (=> start!108528 (= b_free!28075 (not b_next!28075))))

(declare-fun tp!99336 () Bool)

(declare-fun b_and!46117 () Bool)

(assert (=> start!108528 (= tp!99336 b_and!46117)))

(declare-fun b!1280961 () Bool)

(declare-fun e!731898 () Bool)

(declare-fun tp_is_empty!33715 () Bool)

(assert (=> b!1280961 (= e!731898 tp_is_empty!33715)))

(declare-fun mapNonEmpty!52124 () Bool)

(declare-fun mapRes!52124 () Bool)

(declare-fun tp!99335 () Bool)

(declare-fun e!731900 () Bool)

(assert (=> mapNonEmpty!52124 (= mapRes!52124 (and tp!99335 e!731900))))

(declare-datatypes ((V!50057 0))(
  ( (V!50058 (val!16932 Int)) )
))
(declare-datatypes ((ValueCell!15959 0))(
  ( (ValueCellFull!15959 (v!19531 V!50057)) (EmptyCell!15959) )
))
(declare-fun mapRest!52124 () (Array (_ BitVec 32) ValueCell!15959))

(declare-datatypes ((array!84397 0))(
  ( (array!84398 (arr!40703 (Array (_ BitVec 32) ValueCell!15959)) (size!41255 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84397)

(declare-fun mapValue!52124 () ValueCell!15959)

(declare-fun mapKey!52124 () (_ BitVec 32))

(assert (=> mapNonEmpty!52124 (= (arr!40703 _values!1445) (store mapRest!52124 mapKey!52124 mapValue!52124))))

(declare-fun b!1280962 () Bool)

(declare-fun res!850922 () Bool)

(declare-fun e!731899 () Bool)

(assert (=> b!1280962 (=> (not res!850922) (not e!731899))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84399 0))(
  ( (array!84400 (arr!40704 (Array (_ BitVec 32) (_ BitVec 64))) (size!41256 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84399)

(assert (=> b!1280962 (= res!850922 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41256 _keys!1741))))))

(declare-fun b!1280963 () Bool)

(declare-fun e!731901 () Bool)

(assert (=> b!1280963 (= e!731901 (and e!731898 mapRes!52124))))

(declare-fun condMapEmpty!52124 () Bool)

(declare-fun mapDefault!52124 () ValueCell!15959)

(assert (=> b!1280963 (= condMapEmpty!52124 (= (arr!40703 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15959)) mapDefault!52124)))))

(declare-fun b!1280964 () Bool)

(declare-fun res!850918 () Bool)

(assert (=> b!1280964 (=> (not res!850918) (not e!731899))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280964 (= res!850918 (and (= (size!41255 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41256 _keys!1741) (size!41255 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850921 () Bool)

(assert (=> start!108528 (=> (not res!850921) (not e!731899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108528 (= res!850921 (validMask!0 mask!2175))))

(assert (=> start!108528 e!731899))

(assert (=> start!108528 tp_is_empty!33715))

(assert (=> start!108528 true))

(declare-fun array_inv!31053 (array!84397) Bool)

(assert (=> start!108528 (and (array_inv!31053 _values!1445) e!731901)))

(declare-fun array_inv!31054 (array!84399) Bool)

(assert (=> start!108528 (array_inv!31054 _keys!1741)))

(assert (=> start!108528 tp!99336))

(declare-fun b!1280965 () Bool)

(assert (=> b!1280965 (= e!731899 (not true))))

(declare-fun minValue!1387 () V!50057)

(declare-fun zeroValue!1387 () V!50057)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21746 0))(
  ( (tuple2!21747 (_1!10884 (_ BitVec 64)) (_2!10884 V!50057)) )
))
(declare-datatypes ((List!28938 0))(
  ( (Nil!28935) (Cons!28934 (h!30143 tuple2!21746) (t!42470 List!28938)) )
))
(declare-datatypes ((ListLongMap!19403 0))(
  ( (ListLongMap!19404 (toList!9717 List!28938)) )
))
(declare-fun contains!7762 (ListLongMap!19403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4691 (array!84399 array!84397 (_ BitVec 32) (_ BitVec 32) V!50057 V!50057 (_ BitVec 32) Int) ListLongMap!19403)

(assert (=> b!1280965 (contains!7762 (getCurrentListMap!4691 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42261 0))(
  ( (Unit!42262) )
))
(declare-fun lt!576007 () Unit!42261)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 (array!84399 array!84397 (_ BitVec 32) (_ BitVec 32) V!50057 V!50057 (_ BitVec 64) (_ BitVec 32) Int) Unit!42261)

(assert (=> b!1280965 (= lt!576007 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!12 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280966 () Bool)

(declare-fun res!850919 () Bool)

(assert (=> b!1280966 (=> (not res!850919) (not e!731899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84399 (_ BitVec 32)) Bool)

(assert (=> b!1280966 (= res!850919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280967 () Bool)

(declare-fun res!850916 () Bool)

(assert (=> b!1280967 (=> (not res!850916) (not e!731899))))

(assert (=> b!1280967 (= res!850916 (contains!7762 (getCurrentListMap!4691 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280968 () Bool)

(declare-fun res!850920 () Bool)

(assert (=> b!1280968 (=> (not res!850920) (not e!731899))))

(assert (=> b!1280968 (= res!850920 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41256 _keys!1741)) (not (= (select (arr!40704 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280969 () Bool)

(assert (=> b!1280969 (= e!731900 tp_is_empty!33715)))

(declare-fun mapIsEmpty!52124 () Bool)

(assert (=> mapIsEmpty!52124 mapRes!52124))

(declare-fun b!1280970 () Bool)

(declare-fun res!850917 () Bool)

(assert (=> b!1280970 (=> (not res!850917) (not e!731899))))

(declare-datatypes ((List!28939 0))(
  ( (Nil!28936) (Cons!28935 (h!30144 (_ BitVec 64)) (t!42471 List!28939)) )
))
(declare-fun arrayNoDuplicates!0 (array!84399 (_ BitVec 32) List!28939) Bool)

(assert (=> b!1280970 (= res!850917 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28936))))

(assert (= (and start!108528 res!850921) b!1280964))

(assert (= (and b!1280964 res!850918) b!1280966))

(assert (= (and b!1280966 res!850919) b!1280970))

(assert (= (and b!1280970 res!850917) b!1280962))

(assert (= (and b!1280962 res!850922) b!1280967))

(assert (= (and b!1280967 res!850916) b!1280968))

(assert (= (and b!1280968 res!850920) b!1280965))

(assert (= (and b!1280963 condMapEmpty!52124) mapIsEmpty!52124))

(assert (= (and b!1280963 (not condMapEmpty!52124)) mapNonEmpty!52124))

(get-info :version)

(assert (= (and mapNonEmpty!52124 ((_ is ValueCellFull!15959) mapValue!52124)) b!1280969))

(assert (= (and b!1280963 ((_ is ValueCellFull!15959) mapDefault!52124)) b!1280961))

(assert (= start!108528 b!1280963))

(declare-fun m!1175025 () Bool)

(assert (=> mapNonEmpty!52124 m!1175025))

(declare-fun m!1175027 () Bool)

(assert (=> b!1280967 m!1175027))

(assert (=> b!1280967 m!1175027))

(declare-fun m!1175029 () Bool)

(assert (=> b!1280967 m!1175029))

(declare-fun m!1175031 () Bool)

(assert (=> b!1280970 m!1175031))

(declare-fun m!1175033 () Bool)

(assert (=> b!1280968 m!1175033))

(declare-fun m!1175035 () Bool)

(assert (=> b!1280966 m!1175035))

(declare-fun m!1175037 () Bool)

(assert (=> b!1280965 m!1175037))

(assert (=> b!1280965 m!1175037))

(declare-fun m!1175039 () Bool)

(assert (=> b!1280965 m!1175039))

(declare-fun m!1175041 () Bool)

(assert (=> b!1280965 m!1175041))

(declare-fun m!1175043 () Bool)

(assert (=> start!108528 m!1175043))

(declare-fun m!1175045 () Bool)

(assert (=> start!108528 m!1175045))

(declare-fun m!1175047 () Bool)

(assert (=> start!108528 m!1175047))

(check-sat (not b!1280965) (not b!1280967) (not b!1280970) (not mapNonEmpty!52124) b_and!46117 (not b!1280966) tp_is_empty!33715 (not start!108528) (not b_next!28075))
(check-sat b_and!46117 (not b_next!28075))
