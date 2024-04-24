; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109104 () Bool)

(assert start!109104)

(declare-fun b_free!28393 () Bool)

(declare-fun b_next!28393 () Bool)

(assert (=> start!109104 (= b_free!28393 (not b_next!28393))))

(declare-fun tp!100295 () Bool)

(declare-fun b_and!46461 () Bool)

(assert (=> start!109104 (= tp!100295 b_and!46461)))

(declare-fun b!1287223 () Bool)

(declare-fun res!854783 () Bool)

(declare-fun e!735357 () Bool)

(assert (=> b!1287223 (=> (not res!854783) (not e!735357))))

(declare-datatypes ((V!50481 0))(
  ( (V!50482 (val!17091 Int)) )
))
(declare-fun minValue!1387 () V!50481)

(declare-fun zeroValue!1387 () V!50481)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16118 0))(
  ( (ValueCellFull!16118 (v!19688 V!50481)) (EmptyCell!16118) )
))
(declare-datatypes ((array!85151 0))(
  ( (array!85152 (arr!41073 (Array (_ BitVec 32) ValueCell!16118)) (size!41624 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85151)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85153 0))(
  ( (array!85154 (arr!41074 (Array (_ BitVec 32) (_ BitVec 64))) (size!41625 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85153)

(declare-datatypes ((tuple2!21930 0))(
  ( (tuple2!21931 (_1!10976 (_ BitVec 64)) (_2!10976 V!50481)) )
))
(declare-datatypes ((List!29130 0))(
  ( (Nil!29127) (Cons!29126 (h!30344 tuple2!21930) (t!42666 List!29130)) )
))
(declare-datatypes ((ListLongMap!19595 0))(
  ( (ListLongMap!19596 (toList!9813 List!29130)) )
))
(declare-fun contains!7944 (ListLongMap!19595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4877 (array!85153 array!85151 (_ BitVec 32) (_ BitVec 32) V!50481 V!50481 (_ BitVec 32) Int) ListLongMap!19595)

(assert (=> b!1287223 (= res!854783 (contains!7944 (getCurrentListMap!4877 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287224 () Bool)

(declare-fun res!854782 () Bool)

(assert (=> b!1287224 (=> (not res!854782) (not e!735357))))

(assert (=> b!1287224 (= res!854782 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41625 _keys!1741))))))

(declare-fun b!1287225 () Bool)

(declare-fun e!735354 () Bool)

(declare-fun tp_is_empty!34033 () Bool)

(assert (=> b!1287225 (= e!735354 tp_is_empty!34033)))

(declare-fun b!1287226 () Bool)

(declare-fun e!735355 () Bool)

(assert (=> b!1287226 (= e!735355 tp_is_empty!34033)))

(declare-fun b!1287227 () Bool)

(declare-fun res!854785 () Bool)

(assert (=> b!1287227 (=> (not res!854785) (not e!735357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287227 (= res!854785 (validKeyInArray!0 (select (arr!41074 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!52607 () Bool)

(declare-fun mapRes!52607 () Bool)

(declare-fun tp!100294 () Bool)

(assert (=> mapNonEmpty!52607 (= mapRes!52607 (and tp!100294 e!735354))))

(declare-fun mapRest!52607 () (Array (_ BitVec 32) ValueCell!16118))

(declare-fun mapKey!52607 () (_ BitVec 32))

(declare-fun mapValue!52607 () ValueCell!16118)

(assert (=> mapNonEmpty!52607 (= (arr!41073 _values!1445) (store mapRest!52607 mapKey!52607 mapValue!52607))))

(declare-fun b!1287228 () Bool)

(declare-fun res!854777 () Bool)

(assert (=> b!1287228 (=> (not res!854777) (not e!735357))))

(assert (=> b!1287228 (= res!854777 (and (= (size!41624 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41625 _keys!1741) (size!41624 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287229 () Bool)

(declare-fun e!735353 () Bool)

(assert (=> b!1287229 (= e!735353 (and e!735355 mapRes!52607))))

(declare-fun condMapEmpty!52607 () Bool)

(declare-fun mapDefault!52607 () ValueCell!16118)

(assert (=> b!1287229 (= condMapEmpty!52607 (= (arr!41073 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16118)) mapDefault!52607)))))

(declare-fun b!1287230 () Bool)

(assert (=> b!1287230 (= e!735357 false)))

(declare-fun lt!577442 () Bool)

(declare-fun +!4353 (ListLongMap!19595 tuple2!21930) ListLongMap!19595)

(declare-fun getCurrentListMapNoExtraKeys!5985 (array!85153 array!85151 (_ BitVec 32) (_ BitVec 32) V!50481 V!50481 (_ BitVec 32) Int) ListLongMap!19595)

(assert (=> b!1287230 (= lt!577442 (contains!7944 (+!4353 (getCurrentListMapNoExtraKeys!5985 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun res!854778 () Bool)

(assert (=> start!109104 (=> (not res!854778) (not e!735357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109104 (= res!854778 (validMask!0 mask!2175))))

(assert (=> start!109104 e!735357))

(assert (=> start!109104 tp_is_empty!34033))

(assert (=> start!109104 true))

(declare-fun array_inv!31361 (array!85151) Bool)

(assert (=> start!109104 (and (array_inv!31361 _values!1445) e!735353)))

(declare-fun array_inv!31362 (array!85153) Bool)

(assert (=> start!109104 (array_inv!31362 _keys!1741)))

(assert (=> start!109104 tp!100295))

(declare-fun b!1287231 () Bool)

(declare-fun res!854781 () Bool)

(assert (=> b!1287231 (=> (not res!854781) (not e!735357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85153 (_ BitVec 32)) Bool)

(assert (=> b!1287231 (= res!854781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52607 () Bool)

(assert (=> mapIsEmpty!52607 mapRes!52607))

(declare-fun b!1287232 () Bool)

(declare-fun res!854779 () Bool)

(assert (=> b!1287232 (=> (not res!854779) (not e!735357))))

(assert (=> b!1287232 (= res!854779 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41625 _keys!1741))))))

(declare-fun b!1287233 () Bool)

(declare-fun res!854780 () Bool)

(assert (=> b!1287233 (=> (not res!854780) (not e!735357))))

(declare-datatypes ((List!29131 0))(
  ( (Nil!29128) (Cons!29127 (h!30345 (_ BitVec 64)) (t!42667 List!29131)) )
))
(declare-fun arrayNoDuplicates!0 (array!85153 (_ BitVec 32) List!29131) Bool)

(assert (=> b!1287233 (= res!854780 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29128))))

(declare-fun b!1287234 () Bool)

(declare-fun res!854784 () Bool)

(assert (=> b!1287234 (=> (not res!854784) (not e!735357))))

(assert (=> b!1287234 (= res!854784 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!109104 res!854778) b!1287228))

(assert (= (and b!1287228 res!854777) b!1287231))

(assert (= (and b!1287231 res!854781) b!1287233))

(assert (= (and b!1287233 res!854780) b!1287232))

(assert (= (and b!1287232 res!854779) b!1287223))

(assert (= (and b!1287223 res!854783) b!1287224))

(assert (= (and b!1287224 res!854782) b!1287227))

(assert (= (and b!1287227 res!854785) b!1287234))

(assert (= (and b!1287234 res!854784) b!1287230))

(assert (= (and b!1287229 condMapEmpty!52607) mapIsEmpty!52607))

(assert (= (and b!1287229 (not condMapEmpty!52607)) mapNonEmpty!52607))

(get-info :version)

(assert (= (and mapNonEmpty!52607 ((_ is ValueCellFull!16118) mapValue!52607)) b!1287225))

(assert (= (and b!1287229 ((_ is ValueCellFull!16118) mapDefault!52607)) b!1287226))

(assert (= start!109104 b!1287229))

(declare-fun m!1180723 () Bool)

(assert (=> b!1287230 m!1180723))

(assert (=> b!1287230 m!1180723))

(declare-fun m!1180725 () Bool)

(assert (=> b!1287230 m!1180725))

(assert (=> b!1287230 m!1180725))

(declare-fun m!1180727 () Bool)

(assert (=> b!1287230 m!1180727))

(declare-fun m!1180729 () Bool)

(assert (=> start!109104 m!1180729))

(declare-fun m!1180731 () Bool)

(assert (=> start!109104 m!1180731))

(declare-fun m!1180733 () Bool)

(assert (=> start!109104 m!1180733))

(declare-fun m!1180735 () Bool)

(assert (=> b!1287233 m!1180735))

(declare-fun m!1180737 () Bool)

(assert (=> mapNonEmpty!52607 m!1180737))

(declare-fun m!1180739 () Bool)

(assert (=> b!1287227 m!1180739))

(assert (=> b!1287227 m!1180739))

(declare-fun m!1180741 () Bool)

(assert (=> b!1287227 m!1180741))

(declare-fun m!1180743 () Bool)

(assert (=> b!1287223 m!1180743))

(assert (=> b!1287223 m!1180743))

(declare-fun m!1180745 () Bool)

(assert (=> b!1287223 m!1180745))

(declare-fun m!1180747 () Bool)

(assert (=> b!1287231 m!1180747))

(check-sat (not b!1287227) (not start!109104) (not b!1287231) tp_is_empty!34033 (not b_next!28393) (not b!1287223) (not b!1287230) b_and!46461 (not mapNonEmpty!52607) (not b!1287233))
(check-sat b_and!46461 (not b_next!28393))
