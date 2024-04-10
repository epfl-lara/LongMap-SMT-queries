; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109362 () Bool)

(assert start!109362)

(declare-fun b_free!28851 () Bool)

(declare-fun b_next!28851 () Bool)

(assert (=> start!109362 (= b_free!28851 (not b_next!28851))))

(declare-fun tp!101671 () Bool)

(declare-fun b_and!46941 () Bool)

(assert (=> start!109362 (= tp!101671 b_and!46941)))

(declare-fun b!1294470 () Bool)

(declare-fun e!738665 () Bool)

(declare-fun tp_is_empty!34491 () Bool)

(assert (=> b!1294470 (= e!738665 tp_is_empty!34491)))

(declare-fun res!860260 () Bool)

(declare-fun e!738664 () Bool)

(assert (=> start!109362 (=> (not res!860260) (not e!738664))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109362 (= res!860260 (validMask!0 mask!2175))))

(assert (=> start!109362 e!738664))

(assert (=> start!109362 tp_is_empty!34491))

(assert (=> start!109362 true))

(declare-datatypes ((V!51091 0))(
  ( (V!51092 (val!17320 Int)) )
))
(declare-datatypes ((ValueCell!16347 0))(
  ( (ValueCellFull!16347 (v!19923 V!51091)) (EmptyCell!16347) )
))
(declare-datatypes ((array!86004 0))(
  ( (array!86005 (arr!41503 (Array (_ BitVec 32) ValueCell!16347)) (size!42053 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86004)

(declare-fun e!738666 () Bool)

(declare-fun array_inv!31433 (array!86004) Bool)

(assert (=> start!109362 (and (array_inv!31433 _values!1445) e!738666)))

(declare-datatypes ((array!86006 0))(
  ( (array!86007 (arr!41504 (Array (_ BitVec 32) (_ BitVec 64))) (size!42054 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86006)

(declare-fun array_inv!31434 (array!86006) Bool)

(assert (=> start!109362 (array_inv!31434 _keys!1741)))

(assert (=> start!109362 tp!101671))

(declare-fun b!1294471 () Bool)

(declare-fun e!738667 () Bool)

(assert (=> b!1294471 (= e!738667 tp_is_empty!34491)))

(declare-fun b!1294472 () Bool)

(assert (=> b!1294472 (= e!738664 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22296 0))(
  ( (tuple2!22297 (_1!11159 (_ BitVec 64)) (_2!11159 V!51091)) )
))
(declare-datatypes ((List!29439 0))(
  ( (Nil!29436) (Cons!29435 (h!30644 tuple2!22296) (t!43003 List!29439)) )
))
(declare-datatypes ((ListLongMap!19953 0))(
  ( (ListLongMap!19954 (toList!9992 List!29439)) )
))
(declare-fun contains!8110 (ListLongMap!19953 (_ BitVec 64)) Bool)

(assert (=> b!1294472 (not (contains!8110 (ListLongMap!19954 Nil!29436) k0!1205))))

(declare-datatypes ((Unit!42874 0))(
  ( (Unit!42875) )
))
(declare-fun lt!579719 () Unit!42874)

(declare-fun emptyContainsNothing!158 ((_ BitVec 64)) Unit!42874)

(assert (=> b!1294472 (= lt!579719 (emptyContainsNothing!158 k0!1205))))

(declare-fun b!1294473 () Bool)

(declare-fun res!860264 () Bool)

(assert (=> b!1294473 (=> (not res!860264) (not e!738664))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294473 (= res!860264 (and (= (size!42053 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42054 _keys!1741) (size!42053 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53297 () Bool)

(declare-fun mapRes!53297 () Bool)

(declare-fun tp!101672 () Bool)

(assert (=> mapNonEmpty!53297 (= mapRes!53297 (and tp!101672 e!738665))))

(declare-fun mapValue!53297 () ValueCell!16347)

(declare-fun mapKey!53297 () (_ BitVec 32))

(declare-fun mapRest!53297 () (Array (_ BitVec 32) ValueCell!16347))

(assert (=> mapNonEmpty!53297 (= (arr!41503 _values!1445) (store mapRest!53297 mapKey!53297 mapValue!53297))))

(declare-fun b!1294474 () Bool)

(declare-fun res!860262 () Bool)

(assert (=> b!1294474 (=> (not res!860262) (not e!738664))))

(declare-fun minValue!1387 () V!51091)

(declare-fun zeroValue!1387 () V!51091)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5029 (array!86006 array!86004 (_ BitVec 32) (_ BitVec 32) V!51091 V!51091 (_ BitVec 32) Int) ListLongMap!19953)

(assert (=> b!1294474 (= res!860262 (contains!8110 (getCurrentListMap!5029 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294475 () Bool)

(declare-fun res!860263 () Bool)

(assert (=> b!1294475 (=> (not res!860263) (not e!738664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86006 (_ BitVec 32)) Bool)

(assert (=> b!1294475 (= res!860263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294476 () Bool)

(declare-fun res!860259 () Bool)

(assert (=> b!1294476 (=> (not res!860259) (not e!738664))))

(assert (=> b!1294476 (= res!860259 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42054 _keys!1741))))))

(declare-fun b!1294477 () Bool)

(assert (=> b!1294477 (= e!738666 (and e!738667 mapRes!53297))))

(declare-fun condMapEmpty!53297 () Bool)

(declare-fun mapDefault!53297 () ValueCell!16347)

(assert (=> b!1294477 (= condMapEmpty!53297 (= (arr!41503 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16347)) mapDefault!53297)))))

(declare-fun b!1294478 () Bool)

(declare-fun res!860265 () Bool)

(assert (=> b!1294478 (=> (not res!860265) (not e!738664))))

(declare-datatypes ((List!29440 0))(
  ( (Nil!29437) (Cons!29436 (h!30645 (_ BitVec 64)) (t!43004 List!29440)) )
))
(declare-fun arrayNoDuplicates!0 (array!86006 (_ BitVec 32) List!29440) Bool)

(assert (=> b!1294478 (= res!860265 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29437))))

(declare-fun b!1294479 () Bool)

(declare-fun res!860261 () Bool)

(assert (=> b!1294479 (=> (not res!860261) (not e!738664))))

(assert (=> b!1294479 (= res!860261 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42054 _keys!1741))))))

(declare-fun b!1294480 () Bool)

(declare-fun res!860258 () Bool)

(assert (=> b!1294480 (=> (not res!860258) (not e!738664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294480 (= res!860258 (not (validKeyInArray!0 (select (arr!41504 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53297 () Bool)

(assert (=> mapIsEmpty!53297 mapRes!53297))

(assert (= (and start!109362 res!860260) b!1294473))

(assert (= (and b!1294473 res!860264) b!1294475))

(assert (= (and b!1294475 res!860263) b!1294478))

(assert (= (and b!1294478 res!860265) b!1294479))

(assert (= (and b!1294479 res!860261) b!1294474))

(assert (= (and b!1294474 res!860262) b!1294476))

(assert (= (and b!1294476 res!860259) b!1294480))

(assert (= (and b!1294480 res!860258) b!1294472))

(assert (= (and b!1294477 condMapEmpty!53297) mapIsEmpty!53297))

(assert (= (and b!1294477 (not condMapEmpty!53297)) mapNonEmpty!53297))

(get-info :version)

(assert (= (and mapNonEmpty!53297 ((_ is ValueCellFull!16347) mapValue!53297)) b!1294470))

(assert (= (and b!1294477 ((_ is ValueCellFull!16347) mapDefault!53297)) b!1294471))

(assert (= start!109362 b!1294477))

(declare-fun m!1186667 () Bool)

(assert (=> b!1294480 m!1186667))

(assert (=> b!1294480 m!1186667))

(declare-fun m!1186669 () Bool)

(assert (=> b!1294480 m!1186669))

(declare-fun m!1186671 () Bool)

(assert (=> start!109362 m!1186671))

(declare-fun m!1186673 () Bool)

(assert (=> start!109362 m!1186673))

(declare-fun m!1186675 () Bool)

(assert (=> start!109362 m!1186675))

(declare-fun m!1186677 () Bool)

(assert (=> b!1294475 m!1186677))

(declare-fun m!1186679 () Bool)

(assert (=> b!1294472 m!1186679))

(declare-fun m!1186681 () Bool)

(assert (=> b!1294472 m!1186681))

(declare-fun m!1186683 () Bool)

(assert (=> b!1294478 m!1186683))

(declare-fun m!1186685 () Bool)

(assert (=> b!1294474 m!1186685))

(assert (=> b!1294474 m!1186685))

(declare-fun m!1186687 () Bool)

(assert (=> b!1294474 m!1186687))

(declare-fun m!1186689 () Bool)

(assert (=> mapNonEmpty!53297 m!1186689))

(check-sat (not b!1294475) (not b!1294474) tp_is_empty!34491 (not b!1294478) (not start!109362) (not b_next!28851) (not b!1294472) (not mapNonEmpty!53297) b_and!46941 (not b!1294480))
(check-sat b_and!46941 (not b_next!28851))
