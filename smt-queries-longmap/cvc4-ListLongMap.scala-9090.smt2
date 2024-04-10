; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109328 () Bool)

(assert start!109328)

(declare-fun b_free!28817 () Bool)

(declare-fun b_next!28817 () Bool)

(assert (=> start!109328 (= b_free!28817 (not b_next!28817))))

(declare-fun tp!101570 () Bool)

(declare-fun b_and!46907 () Bool)

(assert (=> start!109328 (= tp!101570 b_and!46907)))

(declare-fun b!1293908 () Bool)

(declare-fun e!738408 () Bool)

(declare-fun e!738412 () Bool)

(assert (=> b!1293908 (= e!738408 (not e!738412))))

(declare-fun res!859856 () Bool)

(assert (=> b!1293908 (=> res!859856 e!738412)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293908 (= res!859856 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51045 0))(
  ( (V!51046 (val!17303 Int)) )
))
(declare-datatypes ((tuple2!22272 0))(
  ( (tuple2!22273 (_1!11147 (_ BitVec 64)) (_2!11147 V!51045)) )
))
(declare-datatypes ((List!29417 0))(
  ( (Nil!29414) (Cons!29413 (h!30622 tuple2!22272) (t!42981 List!29417)) )
))
(declare-datatypes ((ListLongMap!19929 0))(
  ( (ListLongMap!19930 (toList!9980 List!29417)) )
))
(declare-fun contains!8098 (ListLongMap!19929 (_ BitVec 64)) Bool)

(assert (=> b!1293908 (not (contains!8098 (ListLongMap!19930 Nil!29414) k!1205))))

(declare-datatypes ((Unit!42852 0))(
  ( (Unit!42853) )
))
(declare-fun lt!579667 () Unit!42852)

(declare-fun emptyContainsNothing!147 ((_ BitVec 64)) Unit!42852)

(assert (=> b!1293908 (= lt!579667 (emptyContainsNothing!147 k!1205))))

(declare-fun mapNonEmpty!53246 () Bool)

(declare-fun mapRes!53246 () Bool)

(declare-fun tp!101569 () Bool)

(declare-fun e!738413 () Bool)

(assert (=> mapNonEmpty!53246 (= mapRes!53246 (and tp!101569 e!738413))))

(declare-datatypes ((ValueCell!16330 0))(
  ( (ValueCellFull!16330 (v!19906 V!51045)) (EmptyCell!16330) )
))
(declare-fun mapValue!53246 () ValueCell!16330)

(declare-datatypes ((array!85940 0))(
  ( (array!85941 (arr!41471 (Array (_ BitVec 32) ValueCell!16330)) (size!42021 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85940)

(declare-fun mapRest!53246 () (Array (_ BitVec 32) ValueCell!16330))

(declare-fun mapKey!53246 () (_ BitVec 32))

(assert (=> mapNonEmpty!53246 (= (arr!41471 _values!1445) (store mapRest!53246 mapKey!53246 mapValue!53246))))

(declare-fun mapIsEmpty!53246 () Bool)

(assert (=> mapIsEmpty!53246 mapRes!53246))

(declare-fun b!1293910 () Bool)

(declare-fun res!859850 () Bool)

(assert (=> b!1293910 (=> (not res!859850) (not e!738408))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85942 0))(
  ( (array!85943 (arr!41472 (Array (_ BitVec 32) (_ BitVec 64))) (size!42022 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85942)

(assert (=> b!1293910 (= res!859850 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42022 _keys!1741))))))

(declare-fun b!1293911 () Bool)

(declare-fun res!859855 () Bool)

(assert (=> b!1293911 (=> (not res!859855) (not e!738408))))

(assert (=> b!1293911 (= res!859855 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42022 _keys!1741))))))

(declare-fun b!1293912 () Bool)

(assert (=> b!1293912 (= e!738412 true)))

(declare-fun lt!579666 () ListLongMap!19929)

(declare-fun zeroValue!1387 () V!51045)

(declare-fun +!4408 (ListLongMap!19929 tuple2!22272) ListLongMap!19929)

(assert (=> b!1293912 (not (contains!8098 (+!4408 lt!579666 (tuple2!22273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!579668 () Unit!42852)

(declare-fun addStillNotContains!426 (ListLongMap!19929 (_ BitVec 64) V!51045 (_ BitVec 64)) Unit!42852)

(assert (=> b!1293912 (= lt!579668 (addStillNotContains!426 lt!579666 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!51045)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6040 (array!85942 array!85940 (_ BitVec 32) (_ BitVec 32) V!51045 V!51045 (_ BitVec 32) Int) ListLongMap!19929)

(assert (=> b!1293912 (= lt!579666 (getCurrentListMapNoExtraKeys!6040 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293913 () Bool)

(declare-fun res!859851 () Bool)

(assert (=> b!1293913 (=> (not res!859851) (not e!738408))))

(declare-datatypes ((List!29418 0))(
  ( (Nil!29415) (Cons!29414 (h!30623 (_ BitVec 64)) (t!42982 List!29418)) )
))
(declare-fun arrayNoDuplicates!0 (array!85942 (_ BitVec 32) List!29418) Bool)

(assert (=> b!1293913 (= res!859851 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29415))))

(declare-fun b!1293914 () Bool)

(declare-fun e!738409 () Bool)

(declare-fun tp_is_empty!34457 () Bool)

(assert (=> b!1293914 (= e!738409 tp_is_empty!34457)))

(declare-fun b!1293915 () Bool)

(assert (=> b!1293915 (= e!738413 tp_is_empty!34457)))

(declare-fun b!1293916 () Bool)

(declare-fun res!859849 () Bool)

(assert (=> b!1293916 (=> (not res!859849) (not e!738408))))

(assert (=> b!1293916 (= res!859849 (and (= (size!42021 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42022 _keys!1741) (size!42021 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293909 () Bool)

(declare-fun res!859857 () Bool)

(assert (=> b!1293909 (=> (not res!859857) (not e!738408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293909 (= res!859857 (not (validKeyInArray!0 (select (arr!41472 _keys!1741) from!2144))))))

(declare-fun res!859853 () Bool)

(assert (=> start!109328 (=> (not res!859853) (not e!738408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109328 (= res!859853 (validMask!0 mask!2175))))

(assert (=> start!109328 e!738408))

(assert (=> start!109328 tp_is_empty!34457))

(assert (=> start!109328 true))

(declare-fun e!738410 () Bool)

(declare-fun array_inv!31411 (array!85940) Bool)

(assert (=> start!109328 (and (array_inv!31411 _values!1445) e!738410)))

(declare-fun array_inv!31412 (array!85942) Bool)

(assert (=> start!109328 (array_inv!31412 _keys!1741)))

(assert (=> start!109328 tp!101570))

(declare-fun b!1293917 () Bool)

(assert (=> b!1293917 (= e!738410 (and e!738409 mapRes!53246))))

(declare-fun condMapEmpty!53246 () Bool)

(declare-fun mapDefault!53246 () ValueCell!16330)

