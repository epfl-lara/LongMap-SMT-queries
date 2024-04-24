; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108966 () Bool)

(assert start!108966)

(declare-fun b_free!28255 () Bool)

(declare-fun b_next!28255 () Bool)

(assert (=> start!108966 (= b_free!28255 (not b_next!28255))))

(declare-fun tp!99880 () Bool)

(declare-fun b_and!46323 () Bool)

(assert (=> start!108966 (= tp!99880 b_and!46323)))

(declare-fun res!853509 () Bool)

(declare-fun e!734320 () Bool)

(assert (=> start!108966 (=> (not res!853509) (not e!734320))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108966 (= res!853509 (validMask!0 mask!2175))))

(assert (=> start!108966 e!734320))

(declare-fun tp_is_empty!33895 () Bool)

(assert (=> start!108966 tp_is_empty!33895))

(assert (=> start!108966 true))

(declare-datatypes ((V!50297 0))(
  ( (V!50298 (val!17022 Int)) )
))
(declare-datatypes ((ValueCell!16049 0))(
  ( (ValueCellFull!16049 (v!19619 V!50297)) (EmptyCell!16049) )
))
(declare-datatypes ((array!84879 0))(
  ( (array!84880 (arr!40937 (Array (_ BitVec 32) ValueCell!16049)) (size!41488 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84879)

(declare-fun e!734318 () Bool)

(declare-fun array_inv!31263 (array!84879) Bool)

(assert (=> start!108966 (and (array_inv!31263 _values!1445) e!734318)))

(declare-datatypes ((array!84881 0))(
  ( (array!84882 (arr!40938 (Array (_ BitVec 32) (_ BitVec 64))) (size!41489 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84881)

(declare-fun array_inv!31264 (array!84881) Bool)

(assert (=> start!108966 (array_inv!31264 _keys!1741)))

(assert (=> start!108966 tp!99880))

(declare-fun b!1285333 () Bool)

(declare-fun res!853508 () Bool)

(assert (=> b!1285333 (=> (not res!853508) (not e!734320))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285333 (= res!853508 (and (= (size!41488 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41489 _keys!1741) (size!41488 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285334 () Bool)

(declare-fun res!853510 () Bool)

(assert (=> b!1285334 (=> (not res!853510) (not e!734320))))

(declare-datatypes ((List!29030 0))(
  ( (Nil!29027) (Cons!29026 (h!30244 (_ BitVec 64)) (t!42566 List!29030)) )
))
(declare-fun arrayNoDuplicates!0 (array!84881 (_ BitVec 32) List!29030) Bool)

(assert (=> b!1285334 (= res!853510 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29027))))

(declare-fun b!1285335 () Bool)

(declare-fun res!853516 () Bool)

(assert (=> b!1285335 (=> (not res!853516) (not e!734320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84881 (_ BitVec 32)) Bool)

(assert (=> b!1285335 (= res!853516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285336 () Bool)

(declare-fun res!853515 () Bool)

(assert (=> b!1285336 (=> (not res!853515) (not e!734320))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285336 (= res!853515 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41489 _keys!1741))))))

(declare-fun b!1285337 () Bool)

(declare-fun res!853511 () Bool)

(assert (=> b!1285337 (=> (not res!853511) (not e!734320))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1285337 (= res!853511 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41489 _keys!1741))))))

(declare-fun b!1285338 () Bool)

(declare-fun res!853513 () Bool)

(assert (=> b!1285338 (=> (not res!853513) (not e!734320))))

(declare-fun minValue!1387 () V!50297)

(declare-fun zeroValue!1387 () V!50297)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21824 0))(
  ( (tuple2!21825 (_1!10923 (_ BitVec 64)) (_2!10923 V!50297)) )
))
(declare-datatypes ((List!29031 0))(
  ( (Nil!29028) (Cons!29027 (h!30245 tuple2!21824) (t!42567 List!29031)) )
))
(declare-datatypes ((ListLongMap!19489 0))(
  ( (ListLongMap!19490 (toList!9760 List!29031)) )
))
(declare-fun contains!7891 (ListLongMap!19489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4826 (array!84881 array!84879 (_ BitVec 32) (_ BitVec 32) V!50297 V!50297 (_ BitVec 32) Int) ListLongMap!19489)

(assert (=> b!1285338 (= res!853513 (contains!7891 (getCurrentListMap!4826 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285339 () Bool)

(declare-fun e!734321 () Bool)

(assert (=> b!1285339 (= e!734321 tp_is_empty!33895)))

(declare-fun mapNonEmpty!52400 () Bool)

(declare-fun mapRes!52400 () Bool)

(declare-fun tp!99881 () Bool)

(assert (=> mapNonEmpty!52400 (= mapRes!52400 (and tp!99881 e!734321))))

(declare-fun mapValue!52400 () ValueCell!16049)

(declare-fun mapRest!52400 () (Array (_ BitVec 32) ValueCell!16049))

(declare-fun mapKey!52400 () (_ BitVec 32))

(assert (=> mapNonEmpty!52400 (= (arr!40937 _values!1445) (store mapRest!52400 mapKey!52400 mapValue!52400))))

(declare-fun mapIsEmpty!52400 () Bool)

(assert (=> mapIsEmpty!52400 mapRes!52400))

(declare-fun b!1285340 () Bool)

(declare-fun res!853512 () Bool)

(assert (=> b!1285340 (=> (not res!853512) (not e!734320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285340 (= res!853512 (validKeyInArray!0 (select (arr!40938 _keys!1741) from!2144)))))

(declare-fun b!1285341 () Bool)

(assert (=> b!1285341 (= e!734320 (not true))))

(declare-fun lt!577238 () ListLongMap!19489)

(assert (=> b!1285341 (contains!7891 lt!577238 k0!1205)))

(declare-datatypes ((Unit!42456 0))(
  ( (Unit!42457) )
))
(declare-fun lt!577237 () Unit!42456)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!18 ((_ BitVec 64) (_ BitVec 64) V!50297 ListLongMap!19489) Unit!42456)

(assert (=> b!1285341 (= lt!577237 (lemmaInListMapAfterAddingDiffThenInBefore!18 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577238))))

(declare-fun +!4343 (ListLongMap!19489 tuple2!21824) ListLongMap!19489)

(declare-fun getCurrentListMapNoExtraKeys!5975 (array!84881 array!84879 (_ BitVec 32) (_ BitVec 32) V!50297 V!50297 (_ BitVec 32) Int) ListLongMap!19489)

(assert (=> b!1285341 (= lt!577238 (+!4343 (getCurrentListMapNoExtraKeys!5975 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21825 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1285342 () Bool)

(declare-fun res!853514 () Bool)

(assert (=> b!1285342 (=> (not res!853514) (not e!734320))))

(assert (=> b!1285342 (= res!853514 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1285343 () Bool)

(declare-fun e!734319 () Bool)

(assert (=> b!1285343 (= e!734318 (and e!734319 mapRes!52400))))

(declare-fun condMapEmpty!52400 () Bool)

(declare-fun mapDefault!52400 () ValueCell!16049)

(assert (=> b!1285343 (= condMapEmpty!52400 (= (arr!40937 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16049)) mapDefault!52400)))))

(declare-fun b!1285344 () Bool)

(assert (=> b!1285344 (= e!734319 tp_is_empty!33895)))

(assert (= (and start!108966 res!853509) b!1285333))

(assert (= (and b!1285333 res!853508) b!1285335))

(assert (= (and b!1285335 res!853516) b!1285334))

(assert (= (and b!1285334 res!853510) b!1285336))

(assert (= (and b!1285336 res!853515) b!1285338))

(assert (= (and b!1285338 res!853513) b!1285337))

(assert (= (and b!1285337 res!853511) b!1285340))

(assert (= (and b!1285340 res!853512) b!1285342))

(assert (= (and b!1285342 res!853514) b!1285341))

(assert (= (and b!1285343 condMapEmpty!52400) mapIsEmpty!52400))

(assert (= (and b!1285343 (not condMapEmpty!52400)) mapNonEmpty!52400))

(get-info :version)

(assert (= (and mapNonEmpty!52400 ((_ is ValueCellFull!16049) mapValue!52400)) b!1285339))

(assert (= (and b!1285343 ((_ is ValueCellFull!16049) mapDefault!52400)) b!1285344))

(assert (= start!108966 b!1285343))

(declare-fun m!1179433 () Bool)

(assert (=> b!1285334 m!1179433))

(declare-fun m!1179435 () Bool)

(assert (=> start!108966 m!1179435))

(declare-fun m!1179437 () Bool)

(assert (=> start!108966 m!1179437))

(declare-fun m!1179439 () Bool)

(assert (=> start!108966 m!1179439))

(declare-fun m!1179441 () Bool)

(assert (=> b!1285340 m!1179441))

(assert (=> b!1285340 m!1179441))

(declare-fun m!1179443 () Bool)

(assert (=> b!1285340 m!1179443))

(declare-fun m!1179445 () Bool)

(assert (=> b!1285341 m!1179445))

(declare-fun m!1179447 () Bool)

(assert (=> b!1285341 m!1179447))

(declare-fun m!1179449 () Bool)

(assert (=> b!1285341 m!1179449))

(assert (=> b!1285341 m!1179449))

(declare-fun m!1179451 () Bool)

(assert (=> b!1285341 m!1179451))

(declare-fun m!1179453 () Bool)

(assert (=> b!1285338 m!1179453))

(assert (=> b!1285338 m!1179453))

(declare-fun m!1179455 () Bool)

(assert (=> b!1285338 m!1179455))

(declare-fun m!1179457 () Bool)

(assert (=> b!1285335 m!1179457))

(declare-fun m!1179459 () Bool)

(assert (=> mapNonEmpty!52400 m!1179459))

(check-sat (not mapNonEmpty!52400) (not b!1285334) (not b!1285335) (not b_next!28255) (not start!108966) b_and!46323 (not b!1285341) tp_is_empty!33895 (not b!1285338) (not b!1285340))
(check-sat b_and!46323 (not b_next!28255))
