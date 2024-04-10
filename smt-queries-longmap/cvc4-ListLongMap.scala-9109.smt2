; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109442 () Bool)

(assert start!109442)

(declare-fun b_free!28931 () Bool)

(declare-fun b_next!28931 () Bool)

(assert (=> start!109442 (= b_free!28931 (not b_next!28931))))

(declare-fun tp!101911 () Bool)

(declare-fun b_and!47021 () Bool)

(assert (=> start!109442 (= tp!101911 b_and!47021)))

(declare-fun b!1295879 () Bool)

(declare-fun res!861309 () Bool)

(declare-fun e!739358 () Bool)

(assert (=> b!1295879 (=> (not res!861309) (not e!739358))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51197 0))(
  ( (V!51198 (val!17360 Int)) )
))
(declare-datatypes ((ValueCell!16387 0))(
  ( (ValueCellFull!16387 (v!19963 V!51197)) (EmptyCell!16387) )
))
(declare-datatypes ((array!86162 0))(
  ( (array!86163 (arr!41582 (Array (_ BitVec 32) ValueCell!16387)) (size!42132 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86162)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86164 0))(
  ( (array!86165 (arr!41583 (Array (_ BitVec 32) (_ BitVec 64))) (size!42133 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86164)

(assert (=> b!1295879 (= res!861309 (and (= (size!42132 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42133 _keys!1741) (size!42132 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295880 () Bool)

(declare-fun res!861307 () Bool)

(assert (=> b!1295880 (=> (not res!861307) (not e!739358))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1295880 (= res!861307 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42133 _keys!1741))))))

(declare-fun mapIsEmpty!53417 () Bool)

(declare-fun mapRes!53417 () Bool)

(assert (=> mapIsEmpty!53417 mapRes!53417))

(declare-fun b!1295881 () Bool)

(declare-fun e!739356 () Bool)

(assert (=> b!1295881 (= e!739356 (bvsle from!2144 (size!42133 _keys!1741)))))

(declare-datatypes ((tuple2!22358 0))(
  ( (tuple2!22359 (_1!11190 (_ BitVec 64)) (_2!11190 V!51197)) )
))
(declare-datatypes ((List!29499 0))(
  ( (Nil!29496) (Cons!29495 (h!30704 tuple2!22358) (t!43063 List!29499)) )
))
(declare-datatypes ((ListLongMap!20015 0))(
  ( (ListLongMap!20016 (toList!10023 List!29499)) )
))
(declare-fun lt!580010 () ListLongMap!20015)

(declare-fun minValue!1387 () V!51197)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8141 (ListLongMap!20015 (_ BitVec 64)) Bool)

(declare-fun +!4427 (ListLongMap!20015 tuple2!22358) ListLongMap!20015)

(assert (=> b!1295881 (not (contains!8141 (+!4427 lt!580010 (tuple2!22359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42924 0))(
  ( (Unit!42925) )
))
(declare-fun lt!580008 () Unit!42924)

(declare-fun addStillNotContains!445 (ListLongMap!20015 (_ BitVec 64) V!51197 (_ BitVec 64)) Unit!42924)

(assert (=> b!1295881 (= lt!580008 (addStillNotContains!445 lt!580010 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51197)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6060 (array!86164 array!86162 (_ BitVec 32) (_ BitVec 32) V!51197 V!51197 (_ BitVec 32) Int) ListLongMap!20015)

(assert (=> b!1295881 (= lt!580010 (getCurrentListMapNoExtraKeys!6060 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295882 () Bool)

(declare-fun res!861310 () Bool)

(assert (=> b!1295882 (=> (not res!861310) (not e!739358))))

(declare-fun getCurrentListMap!5056 (array!86164 array!86162 (_ BitVec 32) (_ BitVec 32) V!51197 V!51197 (_ BitVec 32) Int) ListLongMap!20015)

(assert (=> b!1295882 (= res!861310 (contains!8141 (getCurrentListMap!5056 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1295884 () Bool)

(declare-fun e!739355 () Bool)

(declare-fun tp_is_empty!34571 () Bool)

(assert (=> b!1295884 (= e!739355 tp_is_empty!34571)))

(declare-fun b!1295885 () Bool)

(declare-fun res!861312 () Bool)

(assert (=> b!1295885 (=> (not res!861312) (not e!739358))))

(assert (=> b!1295885 (= res!861312 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42133 _keys!1741))))))

(declare-fun b!1295886 () Bool)

(declare-fun res!861308 () Bool)

(assert (=> b!1295886 (=> (not res!861308) (not e!739358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86164 (_ BitVec 32)) Bool)

(assert (=> b!1295886 (= res!861308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295887 () Bool)

(declare-fun e!739353 () Bool)

(assert (=> b!1295887 (= e!739353 tp_is_empty!34571)))

(declare-fun b!1295888 () Bool)

(assert (=> b!1295888 (= e!739358 (not e!739356))))

(declare-fun res!861314 () Bool)

(assert (=> b!1295888 (=> res!861314 e!739356)))

(assert (=> b!1295888 (= res!861314 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295888 (not (contains!8141 (ListLongMap!20016 Nil!29496) k!1205))))

(declare-fun lt!580009 () Unit!42924)

(declare-fun emptyContainsNothing!181 ((_ BitVec 64)) Unit!42924)

(assert (=> b!1295888 (= lt!580009 (emptyContainsNothing!181 k!1205))))

(declare-fun b!1295889 () Bool)

(declare-fun res!861311 () Bool)

(assert (=> b!1295889 (=> (not res!861311) (not e!739358))))

(declare-datatypes ((List!29500 0))(
  ( (Nil!29497) (Cons!29496 (h!30705 (_ BitVec 64)) (t!43064 List!29500)) )
))
(declare-fun arrayNoDuplicates!0 (array!86164 (_ BitVec 32) List!29500) Bool)

(assert (=> b!1295889 (= res!861311 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29497))))

(declare-fun res!861315 () Bool)

(assert (=> start!109442 (=> (not res!861315) (not e!739358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109442 (= res!861315 (validMask!0 mask!2175))))

(assert (=> start!109442 e!739358))

(assert (=> start!109442 tp_is_empty!34571))

(assert (=> start!109442 true))

(declare-fun e!739357 () Bool)

(declare-fun array_inv!31479 (array!86162) Bool)

(assert (=> start!109442 (and (array_inv!31479 _values!1445) e!739357)))

(declare-fun array_inv!31480 (array!86164) Bool)

(assert (=> start!109442 (array_inv!31480 _keys!1741)))

(assert (=> start!109442 tp!101911))

(declare-fun b!1295883 () Bool)

(declare-fun res!861313 () Bool)

(assert (=> b!1295883 (=> (not res!861313) (not e!739358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295883 (= res!861313 (not (validKeyInArray!0 (select (arr!41583 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53417 () Bool)

(declare-fun tp!101912 () Bool)

(assert (=> mapNonEmpty!53417 (= mapRes!53417 (and tp!101912 e!739353))))

(declare-fun mapRest!53417 () (Array (_ BitVec 32) ValueCell!16387))

(declare-fun mapValue!53417 () ValueCell!16387)

(declare-fun mapKey!53417 () (_ BitVec 32))

(assert (=> mapNonEmpty!53417 (= (arr!41582 _values!1445) (store mapRest!53417 mapKey!53417 mapValue!53417))))

(declare-fun b!1295890 () Bool)

(assert (=> b!1295890 (= e!739357 (and e!739355 mapRes!53417))))

(declare-fun condMapEmpty!53417 () Bool)

(declare-fun mapDefault!53417 () ValueCell!16387)

