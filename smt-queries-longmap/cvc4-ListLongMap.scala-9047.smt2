; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109070 () Bool)

(assert start!109070)

(declare-fun b_free!28559 () Bool)

(declare-fun b_next!28559 () Bool)

(assert (=> start!109070 (= b_free!28559 (not b_next!28559))))

(declare-fun tp!100796 () Bool)

(declare-fun b_and!46649 () Bool)

(assert (=> start!109070 (= tp!100796 b_and!46649)))

(declare-fun b!1289345 () Bool)

(declare-fun e!736168 () Bool)

(declare-fun e!736169 () Bool)

(assert (=> b!1289345 (= e!736168 (not e!736169))))

(declare-fun res!856453 () Bool)

(assert (=> b!1289345 (=> res!856453 e!736169)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289345 (= res!856453 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50701 0))(
  ( (V!50702 (val!17174 Int)) )
))
(declare-datatypes ((tuple2!22058 0))(
  ( (tuple2!22059 (_1!11040 (_ BitVec 64)) (_2!11040 V!50701)) )
))
(declare-datatypes ((List!29227 0))(
  ( (Nil!29224) (Cons!29223 (h!30432 tuple2!22058) (t!42791 List!29227)) )
))
(declare-datatypes ((ListLongMap!19715 0))(
  ( (ListLongMap!19716 (toList!9873 List!29227)) )
))
(declare-fun contains!7991 (ListLongMap!19715 (_ BitVec 64)) Bool)

(assert (=> b!1289345 (not (contains!7991 (ListLongMap!19716 Nil!29224) k!1205))))

(declare-datatypes ((Unit!42664 0))(
  ( (Unit!42665) )
))
(declare-fun lt!578228 () Unit!42664)

(declare-fun emptyContainsNothing!60 ((_ BitVec 64)) Unit!42664)

(assert (=> b!1289345 (= lt!578228 (emptyContainsNothing!60 k!1205))))

(declare-fun b!1289346 () Bool)

(declare-fun res!856451 () Bool)

(assert (=> b!1289346 (=> (not res!856451) (not e!736168))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16201 0))(
  ( (ValueCellFull!16201 (v!19777 V!50701)) (EmptyCell!16201) )
))
(declare-datatypes ((array!85440 0))(
  ( (array!85441 (arr!41221 (Array (_ BitVec 32) ValueCell!16201)) (size!41771 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85440)

(declare-datatypes ((array!85442 0))(
  ( (array!85443 (arr!41222 (Array (_ BitVec 32) (_ BitVec 64))) (size!41772 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85442)

(assert (=> b!1289346 (= res!856451 (and (= (size!41771 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41772 _keys!1741) (size!41771 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52859 () Bool)

(declare-fun mapRes!52859 () Bool)

(declare-fun tp!100795 () Bool)

(declare-fun e!736172 () Bool)

(assert (=> mapNonEmpty!52859 (= mapRes!52859 (and tp!100795 e!736172))))

(declare-fun mapRest!52859 () (Array (_ BitVec 32) ValueCell!16201))

(declare-fun mapValue!52859 () ValueCell!16201)

(declare-fun mapKey!52859 () (_ BitVec 32))

(assert (=> mapNonEmpty!52859 (= (arr!41221 _values!1445) (store mapRest!52859 mapKey!52859 mapValue!52859))))

(declare-fun b!1289347 () Bool)

(declare-fun res!856450 () Bool)

(assert (=> b!1289347 (=> (not res!856450) (not e!736168))))

(declare-fun minValue!1387 () V!50701)

(declare-fun zeroValue!1387 () V!50701)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4933 (array!85442 array!85440 (_ BitVec 32) (_ BitVec 32) V!50701 V!50701 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1289347 (= res!856450 (contains!7991 (getCurrentListMap!4933 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289348 () Bool)

(declare-fun tp_is_empty!34199 () Bool)

(assert (=> b!1289348 (= e!736172 tp_is_empty!34199)))

(declare-fun b!1289349 () Bool)

(declare-fun res!856455 () Bool)

(assert (=> b!1289349 (=> (not res!856455) (not e!736168))))

(declare-datatypes ((List!29228 0))(
  ( (Nil!29225) (Cons!29224 (h!30433 (_ BitVec 64)) (t!42792 List!29228)) )
))
(declare-fun arrayNoDuplicates!0 (array!85442 (_ BitVec 32) List!29228) Bool)

(assert (=> b!1289349 (= res!856455 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29225))))

(declare-fun b!1289350 () Bool)

(assert (=> b!1289350 (= e!736169 true)))

(declare-fun lt!578225 () Bool)

(declare-fun lt!578226 () ListLongMap!19715)

(assert (=> b!1289350 (= lt!578225 (contains!7991 lt!578226 k!1205))))

(declare-fun +!4345 (ListLongMap!19715 tuple2!22058) ListLongMap!19715)

(assert (=> b!1289350 (not (contains!7991 (+!4345 lt!578226 (tuple2!22059 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578227 () Unit!42664)

(declare-fun addStillNotContains!363 (ListLongMap!19715 (_ BitVec 64) V!50701 (_ BitVec 64)) Unit!42664)

(assert (=> b!1289350 (= lt!578227 (addStillNotContains!363 lt!578226 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5976 (array!85442 array!85440 (_ BitVec 32) (_ BitVec 32) V!50701 V!50701 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1289350 (= lt!578226 (getCurrentListMapNoExtraKeys!5976 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289351 () Bool)

(declare-fun res!856454 () Bool)

(assert (=> b!1289351 (=> (not res!856454) (not e!736168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289351 (= res!856454 (not (validKeyInArray!0 (select (arr!41222 _keys!1741) from!2144))))))

(declare-fun b!1289352 () Bool)

(declare-fun res!856452 () Bool)

(assert (=> b!1289352 (=> (not res!856452) (not e!736168))))

(assert (=> b!1289352 (= res!856452 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41772 _keys!1741))))))

(declare-fun b!1289353 () Bool)

(declare-fun res!856448 () Bool)

(assert (=> b!1289353 (=> (not res!856448) (not e!736168))))

(assert (=> b!1289353 (= res!856448 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41772 _keys!1741))))))

(declare-fun res!856449 () Bool)

(assert (=> start!109070 (=> (not res!856449) (not e!736168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109070 (= res!856449 (validMask!0 mask!2175))))

(assert (=> start!109070 e!736168))

(assert (=> start!109070 tp_is_empty!34199))

(assert (=> start!109070 true))

(declare-fun e!736170 () Bool)

(declare-fun array_inv!31247 (array!85440) Bool)

(assert (=> start!109070 (and (array_inv!31247 _values!1445) e!736170)))

(declare-fun array_inv!31248 (array!85442) Bool)

(assert (=> start!109070 (array_inv!31248 _keys!1741)))

(assert (=> start!109070 tp!100796))

(declare-fun b!1289354 () Bool)

(declare-fun e!736171 () Bool)

(assert (=> b!1289354 (= e!736170 (and e!736171 mapRes!52859))))

(declare-fun condMapEmpty!52859 () Bool)

(declare-fun mapDefault!52859 () ValueCell!16201)

