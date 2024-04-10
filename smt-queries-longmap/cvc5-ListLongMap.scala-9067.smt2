; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109186 () Bool)

(assert start!109186)

(declare-fun b_free!28675 () Bool)

(declare-fun b_next!28675 () Bool)

(assert (=> start!109186 (= b_free!28675 (not b_next!28675))))

(declare-fun tp!101144 () Bool)

(declare-fun b_and!46765 () Bool)

(assert (=> start!109186 (= tp!101144 b_and!46765)))

(declare-fun b!1291433 () Bool)

(declare-fun res!858014 () Bool)

(declare-fun e!737212 () Bool)

(assert (=> b!1291433 (=> (not res!858014) (not e!737212))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50857 0))(
  ( (V!50858 (val!17232 Int)) )
))
(declare-datatypes ((ValueCell!16259 0))(
  ( (ValueCellFull!16259 (v!19835 V!50857)) (EmptyCell!16259) )
))
(declare-datatypes ((array!85666 0))(
  ( (array!85667 (arr!41334 (Array (_ BitVec 32) ValueCell!16259)) (size!41884 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85666)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85668 0))(
  ( (array!85669 (arr!41335 (Array (_ BitVec 32) (_ BitVec 64))) (size!41885 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85668)

(assert (=> b!1291433 (= res!858014 (and (= (size!41884 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41885 _keys!1741) (size!41884 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291434 () Bool)

(declare-fun res!858015 () Bool)

(assert (=> b!1291434 (=> (not res!858015) (not e!737212))))

(declare-datatypes ((List!29313 0))(
  ( (Nil!29310) (Cons!29309 (h!30518 (_ BitVec 64)) (t!42877 List!29313)) )
))
(declare-fun arrayNoDuplicates!0 (array!85668 (_ BitVec 32) List!29313) Bool)

(assert (=> b!1291434 (= res!858015 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29310))))

(declare-fun res!858013 () Bool)

(assert (=> start!109186 (=> (not res!858013) (not e!737212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109186 (= res!858013 (validMask!0 mask!2175))))

(assert (=> start!109186 e!737212))

(declare-fun tp_is_empty!34315 () Bool)

(assert (=> start!109186 tp_is_empty!34315))

(assert (=> start!109186 true))

(declare-fun e!737215 () Bool)

(declare-fun array_inv!31321 (array!85666) Bool)

(assert (=> start!109186 (and (array_inv!31321 _values!1445) e!737215)))

(declare-fun array_inv!31322 (array!85668) Bool)

(assert (=> start!109186 (array_inv!31322 _keys!1741)))

(assert (=> start!109186 tp!101144))

(declare-fun b!1291435 () Bool)

(declare-fun e!737213 () Bool)

(assert (=> b!1291435 (= e!737213 true)))

(assert (=> b!1291435 false))

(declare-fun minValue!1387 () V!50857)

(declare-datatypes ((tuple2!22156 0))(
  ( (tuple2!22157 (_1!11089 (_ BitVec 64)) (_2!11089 V!50857)) )
))
(declare-datatypes ((List!29314 0))(
  ( (Nil!29311) (Cons!29310 (h!30519 tuple2!22156) (t!42878 List!29314)) )
))
(declare-datatypes ((ListLongMap!19813 0))(
  ( (ListLongMap!19814 (toList!9922 List!29314)) )
))
(declare-fun lt!579123 () ListLongMap!19813)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((Unit!42756 0))(
  ( (Unit!42757) )
))
(declare-fun lt!579125 () Unit!42756)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!60 ((_ BitVec 64) (_ BitVec 64) V!50857 ListLongMap!19813) Unit!42756)

(assert (=> b!1291435 (= lt!579125 (lemmaInListMapAfterAddingDiffThenInBefore!60 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579123))))

(declare-fun lt!579126 () ListLongMap!19813)

(declare-fun contains!8040 (ListLongMap!19813 (_ BitVec 64)) Bool)

(declare-fun +!4386 (ListLongMap!19813 tuple2!22156) ListLongMap!19813)

(assert (=> b!1291435 (not (contains!8040 (+!4386 lt!579126 (tuple2!22157 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579127 () Unit!42756)

(declare-fun addStillNotContains!404 (ListLongMap!19813 (_ BitVec 64) V!50857 (_ BitVec 64)) Unit!42756)

(assert (=> b!1291435 (= lt!579127 (addStillNotContains!404 lt!579126 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291435 (not (contains!8040 lt!579123 k!1205))))

(declare-fun zeroValue!1387 () V!50857)

(assert (=> b!1291435 (= lt!579123 (+!4386 lt!579126 (tuple2!22157 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579124 () Unit!42756)

(assert (=> b!1291435 (= lt!579124 (addStillNotContains!404 lt!579126 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6017 (array!85668 array!85666 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19813)

(assert (=> b!1291435 (= lt!579126 (getCurrentListMapNoExtraKeys!6017 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291436 () Bool)

(declare-fun res!858021 () Bool)

(assert (=> b!1291436 (=> (not res!858021) (not e!737212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291436 (= res!858021 (not (validKeyInArray!0 (select (arr!41335 _keys!1741) from!2144))))))

(declare-fun b!1291437 () Bool)

(assert (=> b!1291437 (= e!737212 (not e!737213))))

(declare-fun res!858016 () Bool)

(assert (=> b!1291437 (=> res!858016 e!737213)))

(assert (=> b!1291437 (= res!858016 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291437 (not (contains!8040 (ListLongMap!19814 Nil!29311) k!1205))))

(declare-fun lt!579128 () Unit!42756)

(declare-fun emptyContainsNothing!100 ((_ BitVec 64)) Unit!42756)

(assert (=> b!1291437 (= lt!579128 (emptyContainsNothing!100 k!1205))))

(declare-fun mapNonEmpty!53033 () Bool)

(declare-fun mapRes!53033 () Bool)

(declare-fun tp!101143 () Bool)

(declare-fun e!737211 () Bool)

(assert (=> mapNonEmpty!53033 (= mapRes!53033 (and tp!101143 e!737211))))

(declare-fun mapValue!53033 () ValueCell!16259)

(declare-fun mapKey!53033 () (_ BitVec 32))

(declare-fun mapRest!53033 () (Array (_ BitVec 32) ValueCell!16259))

(assert (=> mapNonEmpty!53033 (= (arr!41334 _values!1445) (store mapRest!53033 mapKey!53033 mapValue!53033))))

(declare-fun b!1291438 () Bool)

(declare-fun e!737216 () Bool)

(assert (=> b!1291438 (= e!737216 tp_is_empty!34315)))

(declare-fun b!1291439 () Bool)

(declare-fun res!858020 () Bool)

(assert (=> b!1291439 (=> (not res!858020) (not e!737212))))

(assert (=> b!1291439 (= res!858020 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41885 _keys!1741))))))

(declare-fun mapIsEmpty!53033 () Bool)

(assert (=> mapIsEmpty!53033 mapRes!53033))

(declare-fun b!1291440 () Bool)

(declare-fun res!858018 () Bool)

(assert (=> b!1291440 (=> (not res!858018) (not e!737212))))

(declare-fun getCurrentListMap!4973 (array!85668 array!85666 (_ BitVec 32) (_ BitVec 32) V!50857 V!50857 (_ BitVec 32) Int) ListLongMap!19813)

(assert (=> b!1291440 (= res!858018 (contains!8040 (getCurrentListMap!4973 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291441 () Bool)

(declare-fun res!858017 () Bool)

(assert (=> b!1291441 (=> (not res!858017) (not e!737212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85668 (_ BitVec 32)) Bool)

(assert (=> b!1291441 (= res!858017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291442 () Bool)

(declare-fun res!858019 () Bool)

(assert (=> b!1291442 (=> (not res!858019) (not e!737212))))

(assert (=> b!1291442 (= res!858019 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41885 _keys!1741))))))

(declare-fun b!1291443 () Bool)

(assert (=> b!1291443 (= e!737211 tp_is_empty!34315)))

(declare-fun b!1291444 () Bool)

(assert (=> b!1291444 (= e!737215 (and e!737216 mapRes!53033))))

(declare-fun condMapEmpty!53033 () Bool)

(declare-fun mapDefault!53033 () ValueCell!16259)

