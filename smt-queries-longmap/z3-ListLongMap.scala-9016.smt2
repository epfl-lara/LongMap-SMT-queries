; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108856 () Bool)

(assert start!108856)

(declare-fun b_free!28369 () Bool)

(declare-fun b_next!28369 () Bool)

(assert (=> start!108856 (= b_free!28369 (not b_next!28369))))

(declare-fun tp!100223 () Bool)

(declare-fun b_and!46417 () Bool)

(assert (=> start!108856 (= tp!100223 b_and!46417)))

(declare-fun b!1285496 () Bool)

(declare-fun e!734301 () Bool)

(declare-fun tp_is_empty!34009 () Bool)

(assert (=> b!1285496 (= e!734301 tp_is_empty!34009)))

(declare-fun b!1285497 () Bool)

(declare-fun e!734300 () Bool)

(assert (=> b!1285497 (= e!734300 false)))

(declare-datatypes ((V!50449 0))(
  ( (V!50450 (val!17079 Int)) )
))
(declare-fun zeroValue!1387 () V!50449)

(declare-datatypes ((ValueCell!16106 0))(
  ( (ValueCellFull!16106 (v!19680 V!50449)) (EmptyCell!16106) )
))
(declare-datatypes ((array!84961 0))(
  ( (array!84962 (arr!40983 (Array (_ BitVec 32) ValueCell!16106)) (size!41535 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84961)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84963 0))(
  ( (array!84964 (arr!40984 (Array (_ BitVec 32) (_ BitVec 64))) (size!41536 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84963)

(declare-fun minValue!1387 () V!50449)

(declare-fun lt!576753 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21956 0))(
  ( (tuple2!21957 (_1!10989 (_ BitVec 64)) (_2!10989 V!50449)) )
))
(declare-datatypes ((List!29134 0))(
  ( (Nil!29131) (Cons!29130 (h!30339 tuple2!21956) (t!42670 List!29134)) )
))
(declare-datatypes ((ListLongMap!19613 0))(
  ( (ListLongMap!19614 (toList!9822 List!29134)) )
))
(declare-fun contains!7869 (ListLongMap!19613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4792 (array!84963 array!84961 (_ BitVec 32) (_ BitVec 32) V!50449 V!50449 (_ BitVec 32) Int) ListLongMap!19613)

(assert (=> b!1285497 (= lt!576753 (contains!7869 (getCurrentListMap!4792 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52571 () Bool)

(declare-fun mapRes!52571 () Bool)

(assert (=> mapIsEmpty!52571 mapRes!52571))

(declare-fun b!1285498 () Bool)

(declare-fun e!734299 () Bool)

(assert (=> b!1285498 (= e!734299 tp_is_empty!34009)))

(declare-fun b!1285499 () Bool)

(declare-fun res!853980 () Bool)

(assert (=> b!1285499 (=> (not res!853980) (not e!734300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84963 (_ BitVec 32)) Bool)

(assert (=> b!1285499 (= res!853980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285500 () Bool)

(declare-fun res!853981 () Bool)

(assert (=> b!1285500 (=> (not res!853981) (not e!734300))))

(assert (=> b!1285500 (= res!853981 (and (= (size!41535 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41536 _keys!1741) (size!41535 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52571 () Bool)

(declare-fun tp!100224 () Bool)

(assert (=> mapNonEmpty!52571 (= mapRes!52571 (and tp!100224 e!734299))))

(declare-fun mapRest!52571 () (Array (_ BitVec 32) ValueCell!16106))

(declare-fun mapValue!52571 () ValueCell!16106)

(declare-fun mapKey!52571 () (_ BitVec 32))

(assert (=> mapNonEmpty!52571 (= (arr!40983 _values!1445) (store mapRest!52571 mapKey!52571 mapValue!52571))))

(declare-fun b!1285501 () Bool)

(declare-fun e!734297 () Bool)

(assert (=> b!1285501 (= e!734297 (and e!734301 mapRes!52571))))

(declare-fun condMapEmpty!52571 () Bool)

(declare-fun mapDefault!52571 () ValueCell!16106)

(assert (=> b!1285501 (= condMapEmpty!52571 (= (arr!40983 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16106)) mapDefault!52571)))))

(declare-fun b!1285502 () Bool)

(declare-fun res!853983 () Bool)

(assert (=> b!1285502 (=> (not res!853983) (not e!734300))))

(declare-datatypes ((List!29135 0))(
  ( (Nil!29132) (Cons!29131 (h!30340 (_ BitVec 64)) (t!42671 List!29135)) )
))
(declare-fun arrayNoDuplicates!0 (array!84963 (_ BitVec 32) List!29135) Bool)

(assert (=> b!1285502 (= res!853983 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29132))))

(declare-fun b!1285495 () Bool)

(declare-fun res!853979 () Bool)

(assert (=> b!1285495 (=> (not res!853979) (not e!734300))))

(assert (=> b!1285495 (= res!853979 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41536 _keys!1741))))))

(declare-fun res!853982 () Bool)

(assert (=> start!108856 (=> (not res!853982) (not e!734300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108856 (= res!853982 (validMask!0 mask!2175))))

(assert (=> start!108856 e!734300))

(assert (=> start!108856 tp_is_empty!34009))

(assert (=> start!108856 true))

(declare-fun array_inv!31241 (array!84961) Bool)

(assert (=> start!108856 (and (array_inv!31241 _values!1445) e!734297)))

(declare-fun array_inv!31242 (array!84963) Bool)

(assert (=> start!108856 (array_inv!31242 _keys!1741)))

(assert (=> start!108856 tp!100223))

(assert (= (and start!108856 res!853982) b!1285500))

(assert (= (and b!1285500 res!853981) b!1285499))

(assert (= (and b!1285499 res!853980) b!1285502))

(assert (= (and b!1285502 res!853983) b!1285495))

(assert (= (and b!1285495 res!853979) b!1285497))

(assert (= (and b!1285501 condMapEmpty!52571) mapIsEmpty!52571))

(assert (= (and b!1285501 (not condMapEmpty!52571)) mapNonEmpty!52571))

(get-info :version)

(assert (= (and mapNonEmpty!52571 ((_ is ValueCellFull!16106) mapValue!52571)) b!1285498))

(assert (= (and b!1285501 ((_ is ValueCellFull!16106) mapDefault!52571)) b!1285496))

(assert (= start!108856 b!1285501))

(declare-fun m!1178377 () Bool)

(assert (=> start!108856 m!1178377))

(declare-fun m!1178379 () Bool)

(assert (=> start!108856 m!1178379))

(declare-fun m!1178381 () Bool)

(assert (=> start!108856 m!1178381))

(declare-fun m!1178383 () Bool)

(assert (=> b!1285497 m!1178383))

(assert (=> b!1285497 m!1178383))

(declare-fun m!1178385 () Bool)

(assert (=> b!1285497 m!1178385))

(declare-fun m!1178387 () Bool)

(assert (=> mapNonEmpty!52571 m!1178387))

(declare-fun m!1178389 () Bool)

(assert (=> b!1285502 m!1178389))

(declare-fun m!1178391 () Bool)

(assert (=> b!1285499 m!1178391))

(check-sat (not start!108856) (not b!1285497) tp_is_empty!34009 (not b_next!28369) b_and!46417 (not b!1285499) (not b!1285502) (not mapNonEmpty!52571))
(check-sat b_and!46417 (not b_next!28369))
