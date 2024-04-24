; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108960 () Bool)

(assert start!108960)

(declare-fun b_free!28249 () Bool)

(declare-fun b_next!28249 () Bool)

(assert (=> start!108960 (= b_free!28249 (not b_next!28249))))

(declare-fun tp!99863 () Bool)

(declare-fun b_and!46317 () Bool)

(assert (=> start!108960 (= tp!99863 b_and!46317)))

(declare-fun b!1285226 () Bool)

(declare-fun e!734277 () Bool)

(declare-fun e!734273 () Bool)

(declare-fun mapRes!52391 () Bool)

(assert (=> b!1285226 (= e!734277 (and e!734273 mapRes!52391))))

(declare-fun condMapEmpty!52391 () Bool)

(declare-datatypes ((V!50289 0))(
  ( (V!50290 (val!17019 Int)) )
))
(declare-datatypes ((ValueCell!16046 0))(
  ( (ValueCellFull!16046 (v!19616 V!50289)) (EmptyCell!16046) )
))
(declare-datatypes ((array!84867 0))(
  ( (array!84868 (arr!40931 (Array (_ BitVec 32) ValueCell!16046)) (size!41482 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84867)

(declare-fun mapDefault!52391 () ValueCell!16046)

(assert (=> b!1285226 (= condMapEmpty!52391 (= (arr!40931 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16046)) mapDefault!52391)))))

(declare-fun b!1285227 () Bool)

(declare-fun res!853433 () Bool)

(declare-fun e!734276 () Bool)

(assert (=> b!1285227 (=> (not res!853433) (not e!734276))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84869 0))(
  ( (array!84870 (arr!40932 (Array (_ BitVec 32) (_ BitVec 64))) (size!41483 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84869)

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1285227 (= res!853433 (and (= (size!41482 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41483 _keys!1741) (size!41482 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285228 () Bool)

(declare-fun res!853430 () Bool)

(assert (=> b!1285228 (=> (not res!853430) (not e!734276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84869 (_ BitVec 32)) Bool)

(assert (=> b!1285228 (= res!853430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285229 () Bool)

(declare-fun res!853429 () Bool)

(assert (=> b!1285229 (=> (not res!853429) (not e!734276))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285229 (= res!853429 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41483 _keys!1741))))))

(declare-fun mapNonEmpty!52391 () Bool)

(declare-fun tp!99862 () Bool)

(declare-fun e!734275 () Bool)

(assert (=> mapNonEmpty!52391 (= mapRes!52391 (and tp!99862 e!734275))))

(declare-fun mapValue!52391 () ValueCell!16046)

(declare-fun mapRest!52391 () (Array (_ BitVec 32) ValueCell!16046))

(declare-fun mapKey!52391 () (_ BitVec 32))

(assert (=> mapNonEmpty!52391 (= (arr!40931 _values!1445) (store mapRest!52391 mapKey!52391 mapValue!52391))))

(declare-fun b!1285230 () Bool)

(declare-fun res!853427 () Bool)

(assert (=> b!1285230 (=> (not res!853427) (not e!734276))))

(assert (=> b!1285230 (= res!853427 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285231 () Bool)

(declare-fun tp_is_empty!33889 () Bool)

(assert (=> b!1285231 (= e!734273 tp_is_empty!33889)))

(declare-fun b!1285232 () Bool)

(declare-fun res!853434 () Bool)

(assert (=> b!1285232 (=> (not res!853434) (not e!734276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285232 (= res!853434 (validKeyInArray!0 (select (arr!40932 _keys!1741) from!2144)))))

(declare-fun res!853432 () Bool)

(assert (=> start!108960 (=> (not res!853432) (not e!734276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108960 (= res!853432 (validMask!0 mask!2175))))

(assert (=> start!108960 e!734276))

(assert (=> start!108960 tp_is_empty!33889))

(assert (=> start!108960 true))

(declare-fun array_inv!31259 (array!84867) Bool)

(assert (=> start!108960 (and (array_inv!31259 _values!1445) e!734277)))

(declare-fun array_inv!31260 (array!84869) Bool)

(assert (=> start!108960 (array_inv!31260 _keys!1741)))

(assert (=> start!108960 tp!99863))

(declare-fun b!1285225 () Bool)

(declare-fun res!853431 () Bool)

(assert (=> b!1285225 (=> (not res!853431) (not e!734276))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285225 (= res!853431 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41483 _keys!1741))))))

(declare-fun b!1285233 () Bool)

(assert (=> b!1285233 (= e!734275 tp_is_empty!33889)))

(declare-fun b!1285234 () Bool)

(declare-fun res!853435 () Bool)

(assert (=> b!1285234 (=> (not res!853435) (not e!734276))))

(declare-datatypes ((List!29026 0))(
  ( (Nil!29023) (Cons!29022 (h!30240 (_ BitVec 64)) (t!42562 List!29026)) )
))
(declare-fun arrayNoDuplicates!0 (array!84869 (_ BitVec 32) List!29026) Bool)

(assert (=> b!1285234 (= res!853435 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29023))))

(declare-fun b!1285235 () Bool)

(assert (=> b!1285235 (= e!734276 (not (bvsle from!2144 (size!41483 _keys!1741))))))

(declare-datatypes ((tuple2!21818 0))(
  ( (tuple2!21819 (_1!10920 (_ BitVec 64)) (_2!10920 V!50289)) )
))
(declare-datatypes ((List!29027 0))(
  ( (Nil!29024) (Cons!29023 (h!30241 tuple2!21818) (t!42563 List!29027)) )
))
(declare-datatypes ((ListLongMap!19483 0))(
  ( (ListLongMap!19484 (toList!9757 List!29027)) )
))
(declare-fun lt!577220 () ListLongMap!19483)

(declare-fun contains!7888 (ListLongMap!19483 (_ BitVec 64)) Bool)

(assert (=> b!1285235 (contains!7888 lt!577220 k0!1205)))

(declare-datatypes ((Unit!42454 0))(
  ( (Unit!42455) )
))
(declare-fun lt!577219 () Unit!42454)

(declare-fun minValue!1387 () V!50289)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!17 ((_ BitVec 64) (_ BitVec 64) V!50289 ListLongMap!19483) Unit!42454)

(assert (=> b!1285235 (= lt!577219 (lemmaInListMapAfterAddingDiffThenInBefore!17 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577220))))

(declare-fun zeroValue!1387 () V!50289)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4342 (ListLongMap!19483 tuple2!21818) ListLongMap!19483)

(declare-fun getCurrentListMapNoExtraKeys!5974 (array!84869 array!84867 (_ BitVec 32) (_ BitVec 32) V!50289 V!50289 (_ BitVec 32) Int) ListLongMap!19483)

(assert (=> b!1285235 (= lt!577220 (+!4342 (getCurrentListMapNoExtraKeys!5974 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21819 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun mapIsEmpty!52391 () Bool)

(assert (=> mapIsEmpty!52391 mapRes!52391))

(declare-fun b!1285236 () Bool)

(declare-fun res!853428 () Bool)

(assert (=> b!1285236 (=> (not res!853428) (not e!734276))))

(declare-fun getCurrentListMap!4823 (array!84869 array!84867 (_ BitVec 32) (_ BitVec 32) V!50289 V!50289 (_ BitVec 32) Int) ListLongMap!19483)

(assert (=> b!1285236 (= res!853428 (contains!7888 (getCurrentListMap!4823 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108960 res!853432) b!1285227))

(assert (= (and b!1285227 res!853433) b!1285228))

(assert (= (and b!1285228 res!853430) b!1285234))

(assert (= (and b!1285234 res!853435) b!1285229))

(assert (= (and b!1285229 res!853429) b!1285236))

(assert (= (and b!1285236 res!853428) b!1285225))

(assert (= (and b!1285225 res!853431) b!1285232))

(assert (= (and b!1285232 res!853434) b!1285230))

(assert (= (and b!1285230 res!853427) b!1285235))

(assert (= (and b!1285226 condMapEmpty!52391) mapIsEmpty!52391))

(assert (= (and b!1285226 (not condMapEmpty!52391)) mapNonEmpty!52391))

(get-info :version)

(assert (= (and mapNonEmpty!52391 ((_ is ValueCellFull!16046) mapValue!52391)) b!1285233))

(assert (= (and b!1285226 ((_ is ValueCellFull!16046) mapDefault!52391)) b!1285231))

(assert (= start!108960 b!1285226))

(declare-fun m!1179349 () Bool)

(assert (=> b!1285234 m!1179349))

(declare-fun m!1179351 () Bool)

(assert (=> b!1285228 m!1179351))

(declare-fun m!1179353 () Bool)

(assert (=> mapNonEmpty!52391 m!1179353))

(declare-fun m!1179355 () Bool)

(assert (=> start!108960 m!1179355))

(declare-fun m!1179357 () Bool)

(assert (=> start!108960 m!1179357))

(declare-fun m!1179359 () Bool)

(assert (=> start!108960 m!1179359))

(declare-fun m!1179361 () Bool)

(assert (=> b!1285236 m!1179361))

(assert (=> b!1285236 m!1179361))

(declare-fun m!1179363 () Bool)

(assert (=> b!1285236 m!1179363))

(declare-fun m!1179365 () Bool)

(assert (=> b!1285235 m!1179365))

(declare-fun m!1179367 () Bool)

(assert (=> b!1285235 m!1179367))

(declare-fun m!1179369 () Bool)

(assert (=> b!1285235 m!1179369))

(assert (=> b!1285235 m!1179369))

(declare-fun m!1179371 () Bool)

(assert (=> b!1285235 m!1179371))

(declare-fun m!1179373 () Bool)

(assert (=> b!1285232 m!1179373))

(assert (=> b!1285232 m!1179373))

(declare-fun m!1179375 () Bool)

(assert (=> b!1285232 m!1179375))

(check-sat (not b!1285235) tp_is_empty!33889 (not b_next!28249) b_and!46317 (not b!1285228) (not start!108960) (not b!1285234) (not b!1285232) (not b!1285236) (not mapNonEmpty!52391))
(check-sat b_and!46317 (not b_next!28249))
