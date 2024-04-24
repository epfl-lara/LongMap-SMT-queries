; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108644 () Bool)

(assert start!108644)

(declare-fun b_free!27967 () Bool)

(declare-fun b_next!27967 () Bool)

(assert (=> start!108644 (= b_free!27967 (not b_next!27967))))

(declare-fun tp!99011 () Bool)

(declare-fun b_and!46029 () Bool)

(assert (=> start!108644 (= tp!99011 b_and!46029)))

(declare-fun b!1280915 () Bool)

(declare-fun res!850534 () Bool)

(declare-fun e!731963 () Bool)

(assert (=> b!1280915 (=> (not res!850534) (not e!731963))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49913 0))(
  ( (V!49914 (val!16878 Int)) )
))
(declare-datatypes ((ValueCell!15905 0))(
  ( (ValueCellFull!15905 (v!19473 V!49913)) (EmptyCell!15905) )
))
(declare-datatypes ((array!84327 0))(
  ( (array!84328 (arr!40663 (Array (_ BitVec 32) ValueCell!15905)) (size!41214 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84327)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84329 0))(
  ( (array!84330 (arr!40664 (Array (_ BitVec 32) (_ BitVec 64))) (size!41215 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84329)

(assert (=> b!1280915 (= res!850534 (and (= (size!41214 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41215 _keys!1741) (size!41214 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280916 () Bool)

(declare-fun e!731965 () Bool)

(declare-fun e!731964 () Bool)

(declare-fun mapRes!51962 () Bool)

(assert (=> b!1280916 (= e!731965 (and e!731964 mapRes!51962))))

(declare-fun condMapEmpty!51962 () Bool)

(declare-fun mapDefault!51962 () ValueCell!15905)

(assert (=> b!1280916 (= condMapEmpty!51962 (= (arr!40663 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15905)) mapDefault!51962)))))

(declare-fun b!1280917 () Bool)

(declare-fun tp_is_empty!33607 () Bool)

(assert (=> b!1280917 (= e!731964 tp_is_empty!33607)))

(declare-fun b!1280918 () Bool)

(declare-fun res!850537 () Bool)

(assert (=> b!1280918 (=> (not res!850537) (not e!731963))))

(declare-datatypes ((List!28832 0))(
  ( (Nil!28829) (Cons!28828 (h!30046 (_ BitVec 64)) (t!42364 List!28832)) )
))
(declare-fun arrayNoDuplicates!0 (array!84329 (_ BitVec 32) List!28832) Bool)

(assert (=> b!1280918 (= res!850537 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28829))))

(declare-fun res!850538 () Bool)

(assert (=> start!108644 (=> (not res!850538) (not e!731963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108644 (= res!850538 (validMask!0 mask!2175))))

(assert (=> start!108644 e!731963))

(assert (=> start!108644 tp_is_empty!33607))

(assert (=> start!108644 true))

(declare-fun array_inv!31067 (array!84327) Bool)

(assert (=> start!108644 (and (array_inv!31067 _values!1445) e!731965)))

(declare-fun array_inv!31068 (array!84329) Bool)

(assert (=> start!108644 (array_inv!31068 _keys!1741)))

(assert (=> start!108644 tp!99011))

(declare-fun b!1280919 () Bool)

(declare-fun res!850539 () Bool)

(assert (=> b!1280919 (=> (not res!850539) (not e!731963))))

(declare-fun minValue!1387 () V!49913)

(declare-fun zeroValue!1387 () V!49913)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21620 0))(
  ( (tuple2!21621 (_1!10821 (_ BitVec 64)) (_2!10821 V!49913)) )
))
(declare-datatypes ((List!28833 0))(
  ( (Nil!28830) (Cons!28829 (h!30047 tuple2!21620) (t!42365 List!28833)) )
))
(declare-datatypes ((ListLongMap!19285 0))(
  ( (ListLongMap!19286 (toList!9658 List!28833)) )
))
(declare-fun contains!7787 (ListLongMap!19285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4727 (array!84329 array!84327 (_ BitVec 32) (_ BitVec 32) V!49913 V!49913 (_ BitVec 32) Int) ListLongMap!19285)

(assert (=> b!1280919 (= res!850539 (contains!7787 (getCurrentListMap!4727 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!51962 () Bool)

(assert (=> mapIsEmpty!51962 mapRes!51962))

(declare-fun mapNonEmpty!51962 () Bool)

(declare-fun tp!99010 () Bool)

(declare-fun e!731967 () Bool)

(assert (=> mapNonEmpty!51962 (= mapRes!51962 (and tp!99010 e!731967))))

(declare-fun mapKey!51962 () (_ BitVec 32))

(declare-fun mapRest!51962 () (Array (_ BitVec 32) ValueCell!15905))

(declare-fun mapValue!51962 () ValueCell!15905)

(assert (=> mapNonEmpty!51962 (= (arr!40663 _values!1445) (store mapRest!51962 mapKey!51962 mapValue!51962))))

(declare-fun b!1280920 () Bool)

(assert (=> b!1280920 (= e!731967 tp_is_empty!33607)))

(declare-fun b!1280921 () Bool)

(assert (=> b!1280921 (= e!731963 (bvsgt from!2144 (size!41215 _keys!1741)))))

(declare-fun b!1280922 () Bool)

(declare-fun res!850536 () Bool)

(assert (=> b!1280922 (=> (not res!850536) (not e!731963))))

(assert (=> b!1280922 (= res!850536 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41215 _keys!1741))))))

(declare-fun b!1280923 () Bool)

(declare-fun res!850535 () Bool)

(assert (=> b!1280923 (=> (not res!850535) (not e!731963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84329 (_ BitVec 32)) Bool)

(assert (=> b!1280923 (= res!850535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108644 res!850538) b!1280915))

(assert (= (and b!1280915 res!850534) b!1280923))

(assert (= (and b!1280923 res!850535) b!1280918))

(assert (= (and b!1280918 res!850537) b!1280922))

(assert (= (and b!1280922 res!850536) b!1280919))

(assert (= (and b!1280919 res!850539) b!1280921))

(assert (= (and b!1280916 condMapEmpty!51962) mapIsEmpty!51962))

(assert (= (and b!1280916 (not condMapEmpty!51962)) mapNonEmpty!51962))

(get-info :version)

(assert (= (and mapNonEmpty!51962 ((_ is ValueCellFull!15905) mapValue!51962)) b!1280920))

(assert (= (and b!1280916 ((_ is ValueCellFull!15905) mapDefault!51962)) b!1280917))

(assert (= start!108644 b!1280916))

(declare-fun m!1176129 () Bool)

(assert (=> start!108644 m!1176129))

(declare-fun m!1176131 () Bool)

(assert (=> start!108644 m!1176131))

(declare-fun m!1176133 () Bool)

(assert (=> start!108644 m!1176133))

(declare-fun m!1176135 () Bool)

(assert (=> b!1280918 m!1176135))

(declare-fun m!1176137 () Bool)

(assert (=> b!1280919 m!1176137))

(assert (=> b!1280919 m!1176137))

(declare-fun m!1176139 () Bool)

(assert (=> b!1280919 m!1176139))

(declare-fun m!1176141 () Bool)

(assert (=> b!1280923 m!1176141))

(declare-fun m!1176143 () Bool)

(assert (=> mapNonEmpty!51962 m!1176143))

(check-sat tp_is_empty!33607 (not b_next!27967) (not b!1280919) (not b!1280923) b_and!46029 (not mapNonEmpty!51962) (not start!108644) (not b!1280918))
(check-sat b_and!46029 (not b_next!27967))
