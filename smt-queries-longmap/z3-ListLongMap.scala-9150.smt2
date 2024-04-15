; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109760 () Bool)

(assert start!109760)

(declare-fun b_free!29173 () Bool)

(declare-fun b_next!29173 () Bool)

(assert (=> start!109760 (= b_free!29173 (not b_next!29173))))

(declare-fun tp!102651 () Bool)

(declare-fun b_and!47263 () Bool)

(assert (=> start!109760 (= tp!102651 b_and!47263)))

(declare-fun mapNonEmpty!53792 () Bool)

(declare-fun mapRes!53792 () Bool)

(declare-fun tp!102650 () Bool)

(declare-fun e!741621 () Bool)

(assert (=> mapNonEmpty!53792 (= mapRes!53792 (and tp!102650 e!741621))))

(declare-fun mapKey!53792 () (_ BitVec 32))

(declare-datatypes ((V!51521 0))(
  ( (V!51522 (val!17481 Int)) )
))
(declare-datatypes ((ValueCell!16508 0))(
  ( (ValueCellFull!16508 (v!20087 V!51521)) (EmptyCell!16508) )
))
(declare-fun mapRest!53792 () (Array (_ BitVec 32) ValueCell!16508))

(declare-datatypes ((array!86535 0))(
  ( (array!86536 (arr!41765 (Array (_ BitVec 32) ValueCell!16508)) (size!42317 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86535)

(declare-fun mapValue!53792 () ValueCell!16508)

(assert (=> mapNonEmpty!53792 (= (arr!41765 _values!1445) (store mapRest!53792 mapKey!53792 mapValue!53792))))

(declare-fun b!1300050 () Bool)

(declare-fun res!863943 () Bool)

(declare-fun e!741622 () Bool)

(assert (=> b!1300050 (=> (not res!863943) (not e!741622))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86537 0))(
  ( (array!86538 (arr!41766 (Array (_ BitVec 32) (_ BitVec 64))) (size!42318 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86537)

(assert (=> b!1300050 (= res!863943 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42318 _keys!1741))))))

(declare-fun b!1300052 () Bool)

(declare-fun e!741625 () Bool)

(declare-fun tp_is_empty!34813 () Bool)

(assert (=> b!1300052 (= e!741625 tp_is_empty!34813)))

(declare-fun b!1300053 () Bool)

(assert (=> b!1300053 (= e!741621 tp_is_empty!34813)))

(declare-fun b!1300054 () Bool)

(declare-fun res!863936 () Bool)

(assert (=> b!1300054 (=> (not res!863936) (not e!741622))))

(declare-datatypes ((List!29712 0))(
  ( (Nil!29709) (Cons!29708 (h!30917 (_ BitVec 64)) (t!43276 List!29712)) )
))
(declare-fun arrayNoDuplicates!0 (array!86537 (_ BitVec 32) List!29712) Bool)

(assert (=> b!1300054 (= res!863936 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29709))))

(declare-fun b!1300055 () Bool)

(declare-fun res!863937 () Bool)

(assert (=> b!1300055 (=> (not res!863937) (not e!741622))))

(declare-fun minValue!1387 () V!51521)

(declare-fun zeroValue!1387 () V!51521)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22594 0))(
  ( (tuple2!22595 (_1!11308 (_ BitVec 64)) (_2!11308 V!51521)) )
))
(declare-datatypes ((List!29713 0))(
  ( (Nil!29710) (Cons!29709 (h!30918 tuple2!22594) (t!43277 List!29713)) )
))
(declare-datatypes ((ListLongMap!20251 0))(
  ( (ListLongMap!20252 (toList!10141 List!29713)) )
))
(declare-fun contains!8195 (ListLongMap!20251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5056 (array!86537 array!86535 (_ BitVec 32) (_ BitVec 32) V!51521 V!51521 (_ BitVec 32) Int) ListLongMap!20251)

(assert (=> b!1300055 (= res!863937 (contains!8195 (getCurrentListMap!5056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300056 () Bool)

(declare-fun res!863944 () Bool)

(assert (=> b!1300056 (=> (not res!863944) (not e!741622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86537 (_ BitVec 32)) Bool)

(assert (=> b!1300056 (= res!863944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300057 () Bool)

(declare-fun res!863939 () Bool)

(assert (=> b!1300057 (=> (not res!863939) (not e!741622))))

(assert (=> b!1300057 (= res!863939 (and (= (size!42317 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42318 _keys!1741) (size!42317 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300058 () Bool)

(assert (=> b!1300058 (= e!741622 false)))

(declare-fun lt!581085 () Bool)

(declare-fun +!4485 (ListLongMap!20251 tuple2!22594) ListLongMap!20251)

(declare-fun getCurrentListMapNoExtraKeys!6116 (array!86537 array!86535 (_ BitVec 32) (_ BitVec 32) V!51521 V!51521 (_ BitVec 32) Int) ListLongMap!20251)

(assert (=> b!1300058 (= lt!581085 (contains!8195 (+!4485 (getCurrentListMapNoExtraKeys!6116 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun b!1300051 () Bool)

(declare-fun res!863942 () Bool)

(assert (=> b!1300051 (=> (not res!863942) (not e!741622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300051 (= res!863942 (validKeyInArray!0 (select (arr!41766 _keys!1741) from!2144)))))

(declare-fun res!863941 () Bool)

(assert (=> start!109760 (=> (not res!863941) (not e!741622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109760 (= res!863941 (validMask!0 mask!2175))))

(assert (=> start!109760 e!741622))

(assert (=> start!109760 tp_is_empty!34813))

(assert (=> start!109760 true))

(declare-fun e!741624 () Bool)

(declare-fun array_inv!31767 (array!86535) Bool)

(assert (=> start!109760 (and (array_inv!31767 _values!1445) e!741624)))

(declare-fun array_inv!31768 (array!86537) Bool)

(assert (=> start!109760 (array_inv!31768 _keys!1741)))

(assert (=> start!109760 tp!102651))

(declare-fun b!1300059 () Bool)

(declare-fun res!863938 () Bool)

(assert (=> b!1300059 (=> (not res!863938) (not e!741622))))

(assert (=> b!1300059 (= res!863938 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42318 _keys!1741))))))

(declare-fun b!1300060 () Bool)

(assert (=> b!1300060 (= e!741624 (and e!741625 mapRes!53792))))

(declare-fun condMapEmpty!53792 () Bool)

(declare-fun mapDefault!53792 () ValueCell!16508)

(assert (=> b!1300060 (= condMapEmpty!53792 (= (arr!41765 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16508)) mapDefault!53792)))))

(declare-fun b!1300061 () Bool)

(declare-fun res!863940 () Bool)

(assert (=> b!1300061 (=> (not res!863940) (not e!741622))))

(assert (=> b!1300061 (= res!863940 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!53792 () Bool)

(assert (=> mapIsEmpty!53792 mapRes!53792))

(assert (= (and start!109760 res!863941) b!1300057))

(assert (= (and b!1300057 res!863939) b!1300056))

(assert (= (and b!1300056 res!863944) b!1300054))

(assert (= (and b!1300054 res!863936) b!1300059))

(assert (= (and b!1300059 res!863938) b!1300055))

(assert (= (and b!1300055 res!863937) b!1300050))

(assert (= (and b!1300050 res!863943) b!1300051))

(assert (= (and b!1300051 res!863942) b!1300061))

(assert (= (and b!1300061 res!863940) b!1300058))

(assert (= (and b!1300060 condMapEmpty!53792) mapIsEmpty!53792))

(assert (= (and b!1300060 (not condMapEmpty!53792)) mapNonEmpty!53792))

(get-info :version)

(assert (= (and mapNonEmpty!53792 ((_ is ValueCellFull!16508) mapValue!53792)) b!1300053))

(assert (= (and b!1300060 ((_ is ValueCellFull!16508) mapDefault!53792)) b!1300052))

(assert (= start!109760 b!1300060))

(declare-fun m!1190629 () Bool)

(assert (=> start!109760 m!1190629))

(declare-fun m!1190631 () Bool)

(assert (=> start!109760 m!1190631))

(declare-fun m!1190633 () Bool)

(assert (=> start!109760 m!1190633))

(declare-fun m!1190635 () Bool)

(assert (=> mapNonEmpty!53792 m!1190635))

(declare-fun m!1190637 () Bool)

(assert (=> b!1300055 m!1190637))

(assert (=> b!1300055 m!1190637))

(declare-fun m!1190639 () Bool)

(assert (=> b!1300055 m!1190639))

(declare-fun m!1190641 () Bool)

(assert (=> b!1300056 m!1190641))

(declare-fun m!1190643 () Bool)

(assert (=> b!1300054 m!1190643))

(declare-fun m!1190645 () Bool)

(assert (=> b!1300051 m!1190645))

(assert (=> b!1300051 m!1190645))

(declare-fun m!1190647 () Bool)

(assert (=> b!1300051 m!1190647))

(declare-fun m!1190649 () Bool)

(assert (=> b!1300058 m!1190649))

(assert (=> b!1300058 m!1190649))

(declare-fun m!1190651 () Bool)

(assert (=> b!1300058 m!1190651))

(assert (=> b!1300058 m!1190651))

(declare-fun m!1190653 () Bool)

(assert (=> b!1300058 m!1190653))

(check-sat (not b!1300056) (not b!1300058) (not start!109760) (not b_next!29173) (not b!1300055) (not mapNonEmpty!53792) (not b!1300054) (not b!1300051) tp_is_empty!34813 b_and!47263)
(check-sat b_and!47263 (not b_next!29173))
