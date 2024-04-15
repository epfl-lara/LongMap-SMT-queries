; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!706 () Bool)

(assert start!706)

(declare-fun b_free!139 () Bool)

(declare-fun b_next!139 () Bool)

(assert (=> start!706 (= b_free!139 (not b_next!139))))

(declare-fun tp!640 () Bool)

(declare-fun b_and!281 () Bool)

(assert (=> start!706 (= tp!640 b_and!281)))

(declare-fun mapIsEmpty!290 () Bool)

(declare-fun mapRes!290 () Bool)

(assert (=> mapIsEmpty!290 mapRes!290))

(declare-fun mapNonEmpty!290 () Bool)

(declare-fun tp!641 () Bool)

(declare-fun e!2536 () Bool)

(assert (=> mapNonEmpty!290 (= mapRes!290 (and tp!641 e!2536))))

(declare-datatypes ((V!467 0))(
  ( (V!468 (val!114 Int)) )
))
(declare-datatypes ((ValueCell!92 0))(
  ( (ValueCellFull!92 (v!1203 V!467)) (EmptyCell!92) )
))
(declare-datatypes ((array!361 0))(
  ( (array!362 (arr!171 (Array (_ BitVec 32) ValueCell!92)) (size!233 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!361)

(declare-fun mapValue!290 () ValueCell!92)

(declare-fun mapKey!290 () (_ BitVec 32))

(declare-fun mapRest!290 () (Array (_ BitVec 32) ValueCell!92))

(assert (=> mapNonEmpty!290 (= (arr!171 _values!1492) (store mapRest!290 mapKey!290 mapValue!290))))

(declare-fun b!4751 () Bool)

(declare-fun res!5875 () Bool)

(declare-fun e!2537 () Bool)

(assert (=> b!4751 (=> (not res!5875) (not e!2537))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!363 0))(
  ( (array!364 (arr!172 (Array (_ BitVec 32) (_ BitVec 64))) (size!234 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!363)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!467)

(declare-fun minValue!1434 () V!467)

(declare-datatypes ((tuple2!102 0))(
  ( (tuple2!103 (_1!51 (_ BitVec 64)) (_2!51 V!467)) )
))
(declare-datatypes ((List!109 0))(
  ( (Nil!106) (Cons!105 (h!671 tuple2!102) (t!2240 List!109)) )
))
(declare-datatypes ((ListLongMap!107 0))(
  ( (ListLongMap!108 (toList!69 List!109)) )
))
(declare-fun contains!41 (ListLongMap!107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!28 (array!363 array!361 (_ BitVec 32) (_ BitVec 32) V!467 V!467 (_ BitVec 32) Int) ListLongMap!107)

(assert (=> b!4751 (= res!5875 (contains!41 (getCurrentListMap!28 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4752 () Bool)

(declare-fun res!5876 () Bool)

(assert (=> b!4752 (=> (not res!5876) (not e!2537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4752 (= res!5876 (validKeyInArray!0 k0!1278))))

(declare-fun b!4753 () Bool)

(declare-fun e!2534 () Bool)

(declare-fun tp_is_empty!217 () Bool)

(assert (=> b!4753 (= e!2534 tp_is_empty!217)))

(declare-fun b!4754 () Bool)

(declare-fun res!5874 () Bool)

(assert (=> b!4754 (=> (not res!5874) (not e!2537))))

(declare-datatypes ((List!110 0))(
  ( (Nil!107) (Cons!106 (h!672 (_ BitVec 64)) (t!2241 List!110)) )
))
(declare-fun arrayNoDuplicates!0 (array!363 (_ BitVec 32) List!110) Bool)

(assert (=> b!4754 (= res!5874 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!107))))

(declare-fun b!4755 () Bool)

(declare-fun e!2535 () Bool)

(declare-fun arrayContainsKey!0 (array!363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4755 (= e!2535 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4756 () Bool)

(declare-fun e!2533 () Bool)

(assert (=> b!4756 (= e!2533 (and e!2534 mapRes!290))))

(declare-fun condMapEmpty!290 () Bool)

(declare-fun mapDefault!290 () ValueCell!92)

(assert (=> b!4756 (= condMapEmpty!290 (= (arr!171 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!92)) mapDefault!290)))))

(declare-fun b!4757 () Bool)

(assert (=> b!4757 (= e!2537 (not true))))

(assert (=> b!4757 e!2535))

(declare-fun c!281 () Bool)

(assert (=> b!4757 (= c!281 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!47 0))(
  ( (Unit!48) )
))
(declare-fun lt!789 () Unit!47)

(declare-fun lemmaKeyInListMapIsInArray!11 (array!363 array!361 (_ BitVec 32) (_ BitVec 32) V!467 V!467 (_ BitVec 64) Int) Unit!47)

(assert (=> b!4757 (= lt!789 (lemmaKeyInListMapIsInArray!11 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun res!5877 () Bool)

(assert (=> start!706 (=> (not res!5877) (not e!2537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!706 (= res!5877 (validMask!0 mask!2250))))

(assert (=> start!706 e!2537))

(assert (=> start!706 tp!640))

(assert (=> start!706 true))

(declare-fun array_inv!119 (array!361) Bool)

(assert (=> start!706 (and (array_inv!119 _values!1492) e!2533)))

(assert (=> start!706 tp_is_empty!217))

(declare-fun array_inv!120 (array!363) Bool)

(assert (=> start!706 (array_inv!120 _keys!1806)))

(declare-fun b!4758 () Bool)

(declare-fun res!5878 () Bool)

(assert (=> b!4758 (=> (not res!5878) (not e!2537))))

(assert (=> b!4758 (= res!5878 (and (= (size!233 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!234 _keys!1806) (size!233 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4759 () Bool)

(assert (=> b!4759 (= e!2535 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4760 () Bool)

(assert (=> b!4760 (= e!2536 tp_is_empty!217)))

(declare-fun b!4761 () Bool)

(declare-fun res!5873 () Bool)

(assert (=> b!4761 (=> (not res!5873) (not e!2537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!363 (_ BitVec 32)) Bool)

(assert (=> b!4761 (= res!5873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!706 res!5877) b!4758))

(assert (= (and b!4758 res!5878) b!4761))

(assert (= (and b!4761 res!5873) b!4754))

(assert (= (and b!4754 res!5874) b!4751))

(assert (= (and b!4751 res!5875) b!4752))

(assert (= (and b!4752 res!5876) b!4757))

(assert (= (and b!4757 c!281) b!4755))

(assert (= (and b!4757 (not c!281)) b!4759))

(assert (= (and b!4756 condMapEmpty!290) mapIsEmpty!290))

(assert (= (and b!4756 (not condMapEmpty!290)) mapNonEmpty!290))

(get-info :version)

(assert (= (and mapNonEmpty!290 ((_ is ValueCellFull!92) mapValue!290)) b!4760))

(assert (= (and b!4756 ((_ is ValueCellFull!92) mapDefault!290)) b!4753))

(assert (= start!706 b!4756))

(declare-fun m!2573 () Bool)

(assert (=> b!4761 m!2573))

(declare-fun m!2575 () Bool)

(assert (=> b!4757 m!2575))

(declare-fun m!2577 () Bool)

(assert (=> b!4752 m!2577))

(declare-fun m!2579 () Bool)

(assert (=> b!4751 m!2579))

(assert (=> b!4751 m!2579))

(declare-fun m!2581 () Bool)

(assert (=> b!4751 m!2581))

(declare-fun m!2583 () Bool)

(assert (=> start!706 m!2583))

(declare-fun m!2585 () Bool)

(assert (=> start!706 m!2585))

(declare-fun m!2587 () Bool)

(assert (=> start!706 m!2587))

(declare-fun m!2589 () Bool)

(assert (=> b!4754 m!2589))

(declare-fun m!2591 () Bool)

(assert (=> b!4755 m!2591))

(declare-fun m!2593 () Bool)

(assert (=> mapNonEmpty!290 m!2593))

(check-sat (not b!4754) (not b!4752) (not b!4757) (not start!706) (not b!4761) (not mapNonEmpty!290) (not b!4755) (not b_next!139) b_and!281 (not b!4751) tp_is_empty!217)
(check-sat b_and!281 (not b_next!139))
