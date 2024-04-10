; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109178 () Bool)

(assert start!109178)

(declare-fun b_free!28667 () Bool)

(declare-fun b_next!28667 () Bool)

(assert (=> start!109178 (= b_free!28667 (not b_next!28667))))

(declare-fun tp!101120 () Bool)

(declare-fun b_and!46757 () Bool)

(assert (=> start!109178 (= tp!101120 b_and!46757)))

(declare-fun b!1291289 () Bool)

(declare-fun res!857912 () Bool)

(declare-fun e!737143 () Bool)

(assert (=> b!1291289 (=> (not res!857912) (not e!737143))))

(declare-datatypes ((V!50845 0))(
  ( (V!50846 (val!17228 Int)) )
))
(declare-fun minValue!1387 () V!50845)

(declare-fun zeroValue!1387 () V!50845)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16255 0))(
  ( (ValueCellFull!16255 (v!19831 V!50845)) (EmptyCell!16255) )
))
(declare-datatypes ((array!85650 0))(
  ( (array!85651 (arr!41326 (Array (_ BitVec 32) ValueCell!16255)) (size!41876 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85650)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85652 0))(
  ( (array!85653 (arr!41327 (Array (_ BitVec 32) (_ BitVec 64))) (size!41877 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85652)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22148 0))(
  ( (tuple2!22149 (_1!11085 (_ BitVec 64)) (_2!11085 V!50845)) )
))
(declare-datatypes ((List!29307 0))(
  ( (Nil!29304) (Cons!29303 (h!30512 tuple2!22148) (t!42871 List!29307)) )
))
(declare-datatypes ((ListLongMap!19805 0))(
  ( (ListLongMap!19806 (toList!9918 List!29307)) )
))
(declare-fun contains!8036 (ListLongMap!19805 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4970 (array!85652 array!85650 (_ BitVec 32) (_ BitVec 32) V!50845 V!50845 (_ BitVec 32) Int) ListLongMap!19805)

(assert (=> b!1291289 (= res!857912 (contains!8036 (getCurrentListMap!4970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53021 () Bool)

(declare-fun mapRes!53021 () Bool)

(assert (=> mapIsEmpty!53021 mapRes!53021))

(declare-fun b!1291290 () Bool)

(declare-fun e!737142 () Bool)

(assert (=> b!1291290 (= e!737142 true)))

(assert (=> b!1291290 false))

(declare-datatypes ((Unit!42748 0))(
  ( (Unit!42749) )
))
(declare-fun lt!579052 () Unit!42748)

(declare-fun lt!579053 () ListLongMap!19805)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!56 ((_ BitVec 64) (_ BitVec 64) V!50845 ListLongMap!19805) Unit!42748)

(assert (=> b!1291290 (= lt!579052 (lemmaInListMapAfterAddingDiffThenInBefore!56 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579053))))

(declare-fun lt!579051 () ListLongMap!19805)

(declare-fun +!4382 (ListLongMap!19805 tuple2!22148) ListLongMap!19805)

(assert (=> b!1291290 (not (contains!8036 (+!4382 lt!579051 (tuple2!22149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579054 () Unit!42748)

(declare-fun addStillNotContains!400 (ListLongMap!19805 (_ BitVec 64) V!50845 (_ BitVec 64)) Unit!42748)

(assert (=> b!1291290 (= lt!579054 (addStillNotContains!400 lt!579051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291290 (not (contains!8036 lt!579053 k!1205))))

(assert (=> b!1291290 (= lt!579053 (+!4382 lt!579051 (tuple2!22149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579055 () Unit!42748)

(assert (=> b!1291290 (= lt!579055 (addStillNotContains!400 lt!579051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6013 (array!85652 array!85650 (_ BitVec 32) (_ BitVec 32) V!50845 V!50845 (_ BitVec 32) Int) ListLongMap!19805)

(assert (=> b!1291290 (= lt!579051 (getCurrentListMapNoExtraKeys!6013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!53021 () Bool)

(declare-fun tp!101119 () Bool)

(declare-fun e!737141 () Bool)

(assert (=> mapNonEmpty!53021 (= mapRes!53021 (and tp!101119 e!737141))))

(declare-fun mapRest!53021 () (Array (_ BitVec 32) ValueCell!16255))

(declare-fun mapValue!53021 () ValueCell!16255)

(declare-fun mapKey!53021 () (_ BitVec 32))

(assert (=> mapNonEmpty!53021 (= (arr!41326 _values!1445) (store mapRest!53021 mapKey!53021 mapValue!53021))))

(declare-fun b!1291291 () Bool)

(declare-fun e!737139 () Bool)

(declare-fun e!737140 () Bool)

(assert (=> b!1291291 (= e!737139 (and e!737140 mapRes!53021))))

(declare-fun condMapEmpty!53021 () Bool)

(declare-fun mapDefault!53021 () ValueCell!16255)

