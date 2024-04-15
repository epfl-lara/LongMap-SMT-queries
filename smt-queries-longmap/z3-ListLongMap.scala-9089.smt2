; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109318 () Bool)

(assert start!109318)

(declare-fun b_free!28807 () Bool)

(declare-fun b_next!28807 () Bool)

(assert (=> start!109318 (= b_free!28807 (not b_next!28807))))

(declare-fun tp!101541 () Bool)

(declare-fun b_and!46879 () Bool)

(assert (=> start!109318 (= tp!101541 b_and!46879)))

(declare-fun b!1293664 () Bool)

(declare-fun res!859687 () Bool)

(declare-fun e!738292 () Bool)

(assert (=> b!1293664 (=> (not res!859687) (not e!738292))))

(declare-datatypes ((array!85807 0))(
  ( (array!85808 (arr!41405 (Array (_ BitVec 32) (_ BitVec 64))) (size!41957 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85807)

(declare-datatypes ((List!29448 0))(
  ( (Nil!29445) (Cons!29444 (h!30653 (_ BitVec 64)) (t!43004 List!29448)) )
))
(declare-fun arrayNoDuplicates!0 (array!85807 (_ BitVec 32) List!29448) Bool)

(assert (=> b!1293664 (= res!859687 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29445))))

(declare-fun b!1293665 () Bool)

(declare-fun e!738291 () Bool)

(assert (=> b!1293665 (= e!738292 (not e!738291))))

(declare-fun res!859690 () Bool)

(assert (=> b!1293665 (=> res!859690 e!738291)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293665 (= res!859690 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51033 0))(
  ( (V!51034 (val!17298 Int)) )
))
(declare-datatypes ((tuple2!22302 0))(
  ( (tuple2!22303 (_1!11162 (_ BitVec 64)) (_2!11162 V!51033)) )
))
(declare-datatypes ((List!29449 0))(
  ( (Nil!29446) (Cons!29445 (h!30654 tuple2!22302) (t!43005 List!29449)) )
))
(declare-datatypes ((ListLongMap!19959 0))(
  ( (ListLongMap!19960 (toList!9995 List!29449)) )
))
(declare-fun contains!8043 (ListLongMap!19959 (_ BitVec 64)) Bool)

(assert (=> b!1293665 (not (contains!8043 (ListLongMap!19960 Nil!29446) k0!1205))))

(declare-datatypes ((Unit!42668 0))(
  ( (Unit!42669) )
))
(declare-fun lt!579445 () Unit!42668)

(declare-fun emptyContainsNothing!128 ((_ BitVec 64)) Unit!42668)

(assert (=> b!1293665 (= lt!579445 (emptyContainsNothing!128 k0!1205))))

(declare-fun b!1293666 () Bool)

(declare-fun res!859694 () Bool)

(assert (=> b!1293666 (=> (not res!859694) (not e!738292))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293666 (= res!859694 (not (validKeyInArray!0 (select (arr!41405 _keys!1741) from!2144))))))

(declare-fun b!1293667 () Bool)

(declare-fun res!859691 () Bool)

(assert (=> b!1293667 (=> (not res!859691) (not e!738292))))

(assert (=> b!1293667 (= res!859691 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41957 _keys!1741))))))

(declare-fun b!1293668 () Bool)

(declare-fun res!859692 () Bool)

(assert (=> b!1293668 (=> (not res!859692) (not e!738292))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85807 (_ BitVec 32)) Bool)

(assert (=> b!1293668 (= res!859692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293669 () Bool)

(declare-fun e!738294 () Bool)

(declare-fun tp_is_empty!34447 () Bool)

(assert (=> b!1293669 (= e!738294 tp_is_empty!34447)))

(declare-fun b!1293670 () Bool)

(declare-fun res!859693 () Bool)

(assert (=> b!1293670 (=> (not res!859693) (not e!738292))))

(declare-datatypes ((ValueCell!16325 0))(
  ( (ValueCellFull!16325 (v!19900 V!51033)) (EmptyCell!16325) )
))
(declare-datatypes ((array!85809 0))(
  ( (array!85810 (arr!41406 (Array (_ BitVec 32) ValueCell!16325)) (size!41958 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85809)

(assert (=> b!1293670 (= res!859693 (and (= (size!41958 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41957 _keys!1741) (size!41958 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53231 () Bool)

(declare-fun mapRes!53231 () Bool)

(assert (=> mapIsEmpty!53231 mapRes!53231))

(declare-fun b!1293671 () Bool)

(assert (=> b!1293671 (= e!738291 true)))

(declare-fun lt!579444 () ListLongMap!19959)

(declare-fun zeroValue!1387 () V!51033)

(declare-fun +!4440 (ListLongMap!19959 tuple2!22302) ListLongMap!19959)

(assert (=> b!1293671 (not (contains!8043 (+!4440 lt!579444 (tuple2!22303 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579443 () Unit!42668)

(declare-fun addStillNotContains!417 (ListLongMap!19959 (_ BitVec 64) V!51033 (_ BitVec 64)) Unit!42668)

(assert (=> b!1293671 (= lt!579443 (addStillNotContains!417 lt!579444 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51033)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6072 (array!85807 array!85809 (_ BitVec 32) (_ BitVec 32) V!51033 V!51033 (_ BitVec 32) Int) ListLongMap!19959)

(assert (=> b!1293671 (= lt!579444 (getCurrentListMapNoExtraKeys!6072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53231 () Bool)

(declare-fun tp!101540 () Bool)

(declare-fun e!738293 () Bool)

(assert (=> mapNonEmpty!53231 (= mapRes!53231 (and tp!101540 e!738293))))

(declare-fun mapKey!53231 () (_ BitVec 32))

(declare-fun mapValue!53231 () ValueCell!16325)

(declare-fun mapRest!53231 () (Array (_ BitVec 32) ValueCell!16325))

(assert (=> mapNonEmpty!53231 (= (arr!41406 _values!1445) (store mapRest!53231 mapKey!53231 mapValue!53231))))

(declare-fun b!1293673 () Bool)

(declare-fun res!859688 () Bool)

(assert (=> b!1293673 (=> (not res!859688) (not e!738292))))

(assert (=> b!1293673 (= res!859688 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41957 _keys!1741))))))

(declare-fun b!1293674 () Bool)

(declare-fun e!738290 () Bool)

(assert (=> b!1293674 (= e!738290 (and e!738294 mapRes!53231))))

(declare-fun condMapEmpty!53231 () Bool)

(declare-fun mapDefault!53231 () ValueCell!16325)

(assert (=> b!1293674 (= condMapEmpty!53231 (= (arr!41406 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16325)) mapDefault!53231)))))

(declare-fun b!1293675 () Bool)

(assert (=> b!1293675 (= e!738293 tp_is_empty!34447)))

(declare-fun res!859695 () Bool)

(assert (=> start!109318 (=> (not res!859695) (not e!738292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109318 (= res!859695 (validMask!0 mask!2175))))

(assert (=> start!109318 e!738292))

(assert (=> start!109318 tp_is_empty!34447))

(assert (=> start!109318 true))

(declare-fun array_inv!31523 (array!85809) Bool)

(assert (=> start!109318 (and (array_inv!31523 _values!1445) e!738290)))

(declare-fun array_inv!31524 (array!85807) Bool)

(assert (=> start!109318 (array_inv!31524 _keys!1741)))

(assert (=> start!109318 tp!101541))

(declare-fun b!1293672 () Bool)

(declare-fun res!859689 () Bool)

(assert (=> b!1293672 (=> (not res!859689) (not e!738292))))

(declare-fun getCurrentListMap!4929 (array!85807 array!85809 (_ BitVec 32) (_ BitVec 32) V!51033 V!51033 (_ BitVec 32) Int) ListLongMap!19959)

(assert (=> b!1293672 (= res!859689 (contains!8043 (getCurrentListMap!4929 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109318 res!859695) b!1293670))

(assert (= (and b!1293670 res!859693) b!1293668))

(assert (= (and b!1293668 res!859692) b!1293664))

(assert (= (and b!1293664 res!859687) b!1293667))

(assert (= (and b!1293667 res!859691) b!1293672))

(assert (= (and b!1293672 res!859689) b!1293673))

(assert (= (and b!1293673 res!859688) b!1293666))

(assert (= (and b!1293666 res!859694) b!1293665))

(assert (= (and b!1293665 (not res!859690)) b!1293671))

(assert (= (and b!1293674 condMapEmpty!53231) mapIsEmpty!53231))

(assert (= (and b!1293674 (not condMapEmpty!53231)) mapNonEmpty!53231))

(get-info :version)

(assert (= (and mapNonEmpty!53231 ((_ is ValueCellFull!16325) mapValue!53231)) b!1293675))

(assert (= (and b!1293674 ((_ is ValueCellFull!16325) mapDefault!53231)) b!1293669))

(assert (= start!109318 b!1293674))

(declare-fun m!1185591 () Bool)

(assert (=> start!109318 m!1185591))

(declare-fun m!1185593 () Bool)

(assert (=> start!109318 m!1185593))

(declare-fun m!1185595 () Bool)

(assert (=> start!109318 m!1185595))

(declare-fun m!1185597 () Bool)

(assert (=> b!1293671 m!1185597))

(assert (=> b!1293671 m!1185597))

(declare-fun m!1185599 () Bool)

(assert (=> b!1293671 m!1185599))

(declare-fun m!1185601 () Bool)

(assert (=> b!1293671 m!1185601))

(declare-fun m!1185603 () Bool)

(assert (=> b!1293671 m!1185603))

(declare-fun m!1185605 () Bool)

(assert (=> b!1293672 m!1185605))

(assert (=> b!1293672 m!1185605))

(declare-fun m!1185607 () Bool)

(assert (=> b!1293672 m!1185607))

(declare-fun m!1185609 () Bool)

(assert (=> mapNonEmpty!53231 m!1185609))

(declare-fun m!1185611 () Bool)

(assert (=> b!1293665 m!1185611))

(declare-fun m!1185613 () Bool)

(assert (=> b!1293665 m!1185613))

(declare-fun m!1185615 () Bool)

(assert (=> b!1293666 m!1185615))

(assert (=> b!1293666 m!1185615))

(declare-fun m!1185617 () Bool)

(assert (=> b!1293666 m!1185617))

(declare-fun m!1185619 () Bool)

(assert (=> b!1293664 m!1185619))

(declare-fun m!1185621 () Bool)

(assert (=> b!1293668 m!1185621))

(check-sat (not b!1293664) (not b_next!28807) (not start!109318) (not b!1293672) (not b!1293668) (not b!1293666) tp_is_empty!34447 (not b!1293665) b_and!46879 (not b!1293671) (not mapNonEmpty!53231))
(check-sat b_and!46879 (not b_next!28807))
