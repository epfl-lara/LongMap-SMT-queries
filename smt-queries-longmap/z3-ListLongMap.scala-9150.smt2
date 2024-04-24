; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109984 () Bool)

(assert start!109984)

(declare-fun b_free!29173 () Bool)

(declare-fun b_next!29173 () Bool)

(assert (=> start!109984 (= b_free!29173 (not b_next!29173))))

(declare-fun tp!102649 () Bool)

(declare-fun b_and!47283 () Bool)

(assert (=> start!109984 (= tp!102649 b_and!47283)))

(declare-fun b!1301419 () Bool)

(declare-fun res!864491 () Bool)

(declare-fun e!742499 () Bool)

(assert (=> b!1301419 (=> (not res!864491) (not e!742499))))

(declare-datatypes ((array!86677 0))(
  ( (array!86678 (arr!41831 (Array (_ BitVec 32) (_ BitVec 64))) (size!42382 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86677)

(declare-datatypes ((List!29720 0))(
  ( (Nil!29717) (Cons!29716 (h!30934 (_ BitVec 64)) (t!43284 List!29720)) )
))
(declare-fun arrayNoDuplicates!0 (array!86677 (_ BitVec 32) List!29720) Bool)

(assert (=> b!1301419 (= res!864491 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29717))))

(declare-fun b!1301420 () Bool)

(declare-fun e!742498 () Bool)

(declare-fun tp_is_empty!34813 () Bool)

(assert (=> b!1301420 (= e!742498 tp_is_empty!34813)))

(declare-fun b!1301422 () Bool)

(declare-fun res!864483 () Bool)

(assert (=> b!1301422 (=> (not res!864483) (not e!742499))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86677 (_ BitVec 32)) Bool)

(assert (=> b!1301422 (= res!864483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301423 () Bool)

(declare-fun e!742501 () Bool)

(declare-fun mapRes!53792 () Bool)

(assert (=> b!1301423 (= e!742501 (and e!742498 mapRes!53792))))

(declare-fun condMapEmpty!53792 () Bool)

(declare-datatypes ((V!51521 0))(
  ( (V!51522 (val!17481 Int)) )
))
(declare-datatypes ((ValueCell!16508 0))(
  ( (ValueCellFull!16508 (v!20083 V!51521)) (EmptyCell!16508) )
))
(declare-datatypes ((array!86679 0))(
  ( (array!86680 (arr!41832 (Array (_ BitVec 32) ValueCell!16508)) (size!42383 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86679)

(declare-fun mapDefault!53792 () ValueCell!16508)

(assert (=> b!1301423 (= condMapEmpty!53792 (= (arr!41832 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16508)) mapDefault!53792)))))

(declare-fun b!1301424 () Bool)

(declare-fun res!864486 () Bool)

(assert (=> b!1301424 (=> (not res!864486) (not e!742499))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1301424 (= res!864486 (and (= (size!42383 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42382 _keys!1741) (size!42383 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301425 () Bool)

(declare-fun res!864488 () Bool)

(assert (=> b!1301425 (=> (not res!864488) (not e!742499))))

(assert (=> b!1301425 (= res!864488 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1301426 () Bool)

(assert (=> b!1301426 (= e!742499 false)))

(declare-fun minValue!1387 () V!51521)

(declare-fun zeroValue!1387 () V!51521)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!581747 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22560 0))(
  ( (tuple2!22561 (_1!11291 (_ BitVec 64)) (_2!11291 V!51521)) )
))
(declare-datatypes ((List!29721 0))(
  ( (Nil!29718) (Cons!29717 (h!30935 tuple2!22560) (t!43285 List!29721)) )
))
(declare-datatypes ((ListLongMap!20225 0))(
  ( (ListLongMap!20226 (toList!10128 List!29721)) )
))
(declare-fun contains!8264 (ListLongMap!20225 (_ BitVec 64)) Bool)

(declare-fun +!4500 (ListLongMap!20225 tuple2!22560) ListLongMap!20225)

(declare-fun getCurrentListMapNoExtraKeys!6140 (array!86677 array!86679 (_ BitVec 32) (_ BitVec 32) V!51521 V!51521 (_ BitVec 32) Int) ListLongMap!20225)

(assert (=> b!1301426 (= lt!581747 (contains!8264 (+!4500 (getCurrentListMapNoExtraKeys!6140 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun b!1301427 () Bool)

(declare-fun res!864484 () Bool)

(assert (=> b!1301427 (=> (not res!864484) (not e!742499))))

(assert (=> b!1301427 (= res!864484 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42382 _keys!1741))))))

(declare-fun b!1301428 () Bool)

(declare-fun res!864490 () Bool)

(assert (=> b!1301428 (=> (not res!864490) (not e!742499))))

(declare-fun getCurrentListMap!5145 (array!86677 array!86679 (_ BitVec 32) (_ BitVec 32) V!51521 V!51521 (_ BitVec 32) Int) ListLongMap!20225)

(assert (=> b!1301428 (= res!864490 (contains!8264 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53792 () Bool)

(declare-fun tp!102650 () Bool)

(declare-fun e!742500 () Bool)

(assert (=> mapNonEmpty!53792 (= mapRes!53792 (and tp!102650 e!742500))))

(declare-fun mapValue!53792 () ValueCell!16508)

(declare-fun mapKey!53792 () (_ BitVec 32))

(declare-fun mapRest!53792 () (Array (_ BitVec 32) ValueCell!16508))

(assert (=> mapNonEmpty!53792 (= (arr!41832 _values!1445) (store mapRest!53792 mapKey!53792 mapValue!53792))))

(declare-fun b!1301429 () Bool)

(declare-fun res!864485 () Bool)

(assert (=> b!1301429 (=> (not res!864485) (not e!742499))))

(assert (=> b!1301429 (= res!864485 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42382 _keys!1741))))))

(declare-fun b!1301430 () Bool)

(declare-fun res!864489 () Bool)

(assert (=> b!1301430 (=> (not res!864489) (not e!742499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301430 (= res!864489 (validKeyInArray!0 (select (arr!41831 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!53792 () Bool)

(assert (=> mapIsEmpty!53792 mapRes!53792))

(declare-fun b!1301421 () Bool)

(assert (=> b!1301421 (= e!742500 tp_is_empty!34813)))

(declare-fun res!864487 () Bool)

(assert (=> start!109984 (=> (not res!864487) (not e!742499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109984 (= res!864487 (validMask!0 mask!2175))))

(assert (=> start!109984 e!742499))

(assert (=> start!109984 tp_is_empty!34813))

(assert (=> start!109984 true))

(declare-fun array_inv!31891 (array!86679) Bool)

(assert (=> start!109984 (and (array_inv!31891 _values!1445) e!742501)))

(declare-fun array_inv!31892 (array!86677) Bool)

(assert (=> start!109984 (array_inv!31892 _keys!1741)))

(assert (=> start!109984 tp!102649))

(assert (= (and start!109984 res!864487) b!1301424))

(assert (= (and b!1301424 res!864486) b!1301422))

(assert (= (and b!1301422 res!864483) b!1301419))

(assert (= (and b!1301419 res!864491) b!1301429))

(assert (= (and b!1301429 res!864485) b!1301428))

(assert (= (and b!1301428 res!864490) b!1301427))

(assert (= (and b!1301427 res!864484) b!1301430))

(assert (= (and b!1301430 res!864489) b!1301425))

(assert (= (and b!1301425 res!864488) b!1301426))

(assert (= (and b!1301423 condMapEmpty!53792) mapIsEmpty!53792))

(assert (= (and b!1301423 (not condMapEmpty!53792)) mapNonEmpty!53792))

(get-info :version)

(assert (= (and mapNonEmpty!53792 ((_ is ValueCellFull!16508) mapValue!53792)) b!1301421))

(assert (= (and b!1301423 ((_ is ValueCellFull!16508) mapDefault!53792)) b!1301420))

(assert (= start!109984 b!1301423))

(declare-fun m!1192747 () Bool)

(assert (=> b!1301428 m!1192747))

(assert (=> b!1301428 m!1192747))

(declare-fun m!1192749 () Bool)

(assert (=> b!1301428 m!1192749))

(declare-fun m!1192751 () Bool)

(assert (=> b!1301422 m!1192751))

(declare-fun m!1192753 () Bool)

(assert (=> b!1301426 m!1192753))

(assert (=> b!1301426 m!1192753))

(declare-fun m!1192755 () Bool)

(assert (=> b!1301426 m!1192755))

(assert (=> b!1301426 m!1192755))

(declare-fun m!1192757 () Bool)

(assert (=> b!1301426 m!1192757))

(declare-fun m!1192759 () Bool)

(assert (=> b!1301419 m!1192759))

(declare-fun m!1192761 () Bool)

(assert (=> mapNonEmpty!53792 m!1192761))

(declare-fun m!1192763 () Bool)

(assert (=> start!109984 m!1192763))

(declare-fun m!1192765 () Bool)

(assert (=> start!109984 m!1192765))

(declare-fun m!1192767 () Bool)

(assert (=> start!109984 m!1192767))

(declare-fun m!1192769 () Bool)

(assert (=> b!1301430 m!1192769))

(assert (=> b!1301430 m!1192769))

(declare-fun m!1192771 () Bool)

(assert (=> b!1301430 m!1192771))

(check-sat (not mapNonEmpty!53792) (not b!1301430) b_and!47283 (not b!1301426) (not start!109984) (not b!1301422) tp_is_empty!34813 (not b!1301428) (not b_next!29173) (not b!1301419))
(check-sat b_and!47283 (not b_next!29173))
