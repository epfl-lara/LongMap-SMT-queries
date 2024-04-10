; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108804 () Bool)

(assert start!108804)

(declare-fun b_free!28317 () Bool)

(declare-fun b_next!28317 () Bool)

(assert (=> start!108804 (= b_free!28317 (not b_next!28317))))

(declare-fun tp!100066 () Bool)

(declare-fun b_and!46383 () Bool)

(assert (=> start!108804 (= tp!100066 b_and!46383)))

(declare-fun b!1284851 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun e!733939 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84972 0))(
  ( (array!84973 (arr!40988 (Array (_ BitVec 32) (_ BitVec 64))) (size!41538 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84972)

(assert (=> b!1284851 (= e!733939 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt from!2144 (size!41538 _keys!1741))))))

(declare-fun b!1284852 () Bool)

(declare-fun res!853536 () Bool)

(assert (=> b!1284852 (=> (not res!853536) (not e!733939))))

(declare-datatypes ((List!29044 0))(
  ( (Nil!29041) (Cons!29040 (h!30249 (_ BitVec 64)) (t!42588 List!29044)) )
))
(declare-fun arrayNoDuplicates!0 (array!84972 (_ BitVec 32) List!29044) Bool)

(assert (=> b!1284852 (= res!853536 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29041))))

(declare-fun b!1284853 () Bool)

(declare-fun e!733937 () Bool)

(declare-fun tp_is_empty!33957 () Bool)

(assert (=> b!1284853 (= e!733937 tp_is_empty!33957)))

(declare-fun mapIsEmpty!52493 () Bool)

(declare-fun mapRes!52493 () Bool)

(assert (=> mapIsEmpty!52493 mapRes!52493))

(declare-fun res!853539 () Bool)

(assert (=> start!108804 (=> (not res!853539) (not e!733939))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108804 (= res!853539 (validMask!0 mask!2175))))

(assert (=> start!108804 e!733939))

(assert (=> start!108804 tp_is_empty!33957))

(assert (=> start!108804 true))

(declare-datatypes ((V!50379 0))(
  ( (V!50380 (val!17053 Int)) )
))
(declare-datatypes ((ValueCell!16080 0))(
  ( (ValueCellFull!16080 (v!19655 V!50379)) (EmptyCell!16080) )
))
(declare-datatypes ((array!84974 0))(
  ( (array!84975 (arr!40989 (Array (_ BitVec 32) ValueCell!16080)) (size!41539 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84974)

(declare-fun e!733940 () Bool)

(declare-fun array_inv!31089 (array!84974) Bool)

(assert (=> start!108804 (and (array_inv!31089 _values!1445) e!733940)))

(declare-fun array_inv!31090 (array!84972) Bool)

(assert (=> start!108804 (array_inv!31090 _keys!1741)))

(assert (=> start!108804 tp!100066))

(declare-fun b!1284854 () Bool)

(declare-fun e!733938 () Bool)

(assert (=> b!1284854 (= e!733938 tp_is_empty!33957)))

(declare-fun b!1284855 () Bool)

(declare-fun res!853537 () Bool)

(assert (=> b!1284855 (=> (not res!853537) (not e!733939))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1284855 (= res!853537 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41538 _keys!1741))))))

(declare-fun b!1284856 () Bool)

(declare-fun res!853535 () Bool)

(assert (=> b!1284856 (=> (not res!853535) (not e!733939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284856 (= res!853535 (validKeyInArray!0 (select (arr!40988 _keys!1741) from!2144)))))

(declare-fun b!1284857 () Bool)

(assert (=> b!1284857 (= e!733940 (and e!733937 mapRes!52493))))

(declare-fun condMapEmpty!52493 () Bool)

(declare-fun mapDefault!52493 () ValueCell!16080)

(assert (=> b!1284857 (= condMapEmpty!52493 (= (arr!40989 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16080)) mapDefault!52493)))))

(declare-fun b!1284858 () Bool)

(declare-fun res!853532 () Bool)

(assert (=> b!1284858 (=> (not res!853532) (not e!733939))))

(assert (=> b!1284858 (= res!853532 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41538 _keys!1741))))))

(declare-fun mapNonEmpty!52493 () Bool)

(declare-fun tp!100067 () Bool)

(assert (=> mapNonEmpty!52493 (= mapRes!52493 (and tp!100067 e!733938))))

(declare-fun mapValue!52493 () ValueCell!16080)

(declare-fun mapRest!52493 () (Array (_ BitVec 32) ValueCell!16080))

(declare-fun mapKey!52493 () (_ BitVec 32))

(assert (=> mapNonEmpty!52493 (= (arr!40989 _values!1445) (store mapRest!52493 mapKey!52493 mapValue!52493))))

(declare-fun b!1284859 () Bool)

(declare-fun res!853534 () Bool)

(assert (=> b!1284859 (=> (not res!853534) (not e!733939))))

(declare-fun minValue!1387 () V!50379)

(declare-fun zeroValue!1387 () V!50379)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21850 0))(
  ( (tuple2!21851 (_1!10936 (_ BitVec 64)) (_2!10936 V!50379)) )
))
(declare-datatypes ((List!29045 0))(
  ( (Nil!29042) (Cons!29041 (h!30250 tuple2!21850) (t!42589 List!29045)) )
))
(declare-datatypes ((ListLongMap!19507 0))(
  ( (ListLongMap!19508 (toList!9769 List!29045)) )
))
(declare-fun contains!7886 (ListLongMap!19507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4848 (array!84972 array!84974 (_ BitVec 32) (_ BitVec 32) V!50379 V!50379 (_ BitVec 32) Int) ListLongMap!19507)

(assert (=> b!1284859 (= res!853534 (contains!7886 (getCurrentListMap!4848 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284860 () Bool)

(declare-fun res!853533 () Bool)

(assert (=> b!1284860 (=> (not res!853533) (not e!733939))))

(assert (=> b!1284860 (= res!853533 (and (= (size!41539 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41538 _keys!1741) (size!41539 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284861 () Bool)

(declare-fun res!853538 () Bool)

(assert (=> b!1284861 (=> (not res!853538) (not e!733939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84972 (_ BitVec 32)) Bool)

(assert (=> b!1284861 (= res!853538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108804 res!853539) b!1284860))

(assert (= (and b!1284860 res!853533) b!1284861))

(assert (= (and b!1284861 res!853538) b!1284852))

(assert (= (and b!1284852 res!853536) b!1284858))

(assert (= (and b!1284858 res!853532) b!1284859))

(assert (= (and b!1284859 res!853534) b!1284855))

(assert (= (and b!1284855 res!853537) b!1284856))

(assert (= (and b!1284856 res!853535) b!1284851))

(assert (= (and b!1284857 condMapEmpty!52493) mapIsEmpty!52493))

(assert (= (and b!1284857 (not condMapEmpty!52493)) mapNonEmpty!52493))

(get-info :version)

(assert (= (and mapNonEmpty!52493 ((_ is ValueCellFull!16080) mapValue!52493)) b!1284854))

(assert (= (and b!1284857 ((_ is ValueCellFull!16080) mapDefault!52493)) b!1284853))

(assert (= start!108804 b!1284857))

(declare-fun m!1178393 () Bool)

(assert (=> b!1284859 m!1178393))

(assert (=> b!1284859 m!1178393))

(declare-fun m!1178395 () Bool)

(assert (=> b!1284859 m!1178395))

(declare-fun m!1178397 () Bool)

(assert (=> b!1284852 m!1178397))

(declare-fun m!1178399 () Bool)

(assert (=> mapNonEmpty!52493 m!1178399))

(declare-fun m!1178401 () Bool)

(assert (=> b!1284861 m!1178401))

(declare-fun m!1178403 () Bool)

(assert (=> start!108804 m!1178403))

(declare-fun m!1178405 () Bool)

(assert (=> start!108804 m!1178405))

(declare-fun m!1178407 () Bool)

(assert (=> start!108804 m!1178407))

(declare-fun m!1178409 () Bool)

(assert (=> b!1284856 m!1178409))

(assert (=> b!1284856 m!1178409))

(declare-fun m!1178411 () Bool)

(assert (=> b!1284856 m!1178411))

(check-sat (not b!1284859) b_and!46383 (not mapNonEmpty!52493) (not b_next!28317) (not b!1284861) (not start!108804) tp_is_empty!33957 (not b!1284856) (not b!1284852))
(check-sat b_and!46383 (not b_next!28317))
