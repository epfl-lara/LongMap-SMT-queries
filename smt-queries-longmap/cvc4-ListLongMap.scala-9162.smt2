; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110026 () Bool)

(assert start!110026)

(declare-fun b_free!29249 () Bool)

(declare-fun b_next!29249 () Bool)

(assert (=> start!110026 (= b_free!29249 (not b_next!29249))))

(declare-fun tp!102895 () Bool)

(declare-fun b_and!47407 () Bool)

(assert (=> start!110026 (= tp!102895 b_and!47407)))

(declare-fun b!1303054 () Bool)

(declare-fun e!743253 () Bool)

(declare-fun tp_is_empty!34889 () Bool)

(assert (=> b!1303054 (= e!743253 tp_is_empty!34889)))

(declare-fun b!1303055 () Bool)

(declare-fun res!865485 () Bool)

(declare-fun e!743255 () Bool)

(assert (=> b!1303055 (=> (not res!865485) (not e!743255))))

(declare-datatypes ((array!86792 0))(
  ( (array!86793 (arr!41888 (Array (_ BitVec 32) (_ BitVec 64))) (size!42438 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86792)

(declare-datatypes ((List!29733 0))(
  ( (Nil!29730) (Cons!29729 (h!30938 (_ BitVec 64)) (t!43325 List!29733)) )
))
(declare-fun arrayNoDuplicates!0 (array!86792 (_ BitVec 32) List!29733) Bool)

(assert (=> b!1303055 (= res!865485 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29730))))

(declare-fun b!1303056 () Bool)

(declare-fun res!865483 () Bool)

(assert (=> b!1303056 (=> (not res!865483) (not e!743255))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1303056 (= res!865483 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42438 _keys!1741))))))

(declare-fun b!1303057 () Bool)

(declare-fun e!743254 () Bool)

(assert (=> b!1303057 (= e!743255 (not e!743254))))

(declare-fun res!865490 () Bool)

(assert (=> b!1303057 (=> res!865490 e!743254)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1303057 (= res!865490 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51621 0))(
  ( (V!51622 (val!17519 Int)) )
))
(declare-datatypes ((tuple2!22606 0))(
  ( (tuple2!22607 (_1!11314 (_ BitVec 64)) (_2!11314 V!51621)) )
))
(declare-datatypes ((List!29734 0))(
  ( (Nil!29731) (Cons!29730 (h!30939 tuple2!22606) (t!43326 List!29734)) )
))
(declare-datatypes ((ListLongMap!20263 0))(
  ( (ListLongMap!20264 (toList!10147 List!29734)) )
))
(declare-fun contains!8281 (ListLongMap!20263 (_ BitVec 64)) Bool)

(assert (=> b!1303057 (not (contains!8281 (ListLongMap!20264 Nil!29731) k!1205))))

(declare-datatypes ((Unit!43142 0))(
  ( (Unit!43143) )
))
(declare-fun lt!583021 () Unit!43142)

(declare-fun emptyContainsNothing!212 ((_ BitVec 64)) Unit!43142)

(assert (=> b!1303057 (= lt!583021 (emptyContainsNothing!212 k!1205))))

(declare-fun b!1303059 () Bool)

(declare-fun lt!583025 () tuple2!22606)

(declare-fun lt!583022 () ListLongMap!20263)

(declare-fun +!4473 (ListLongMap!20263 tuple2!22606) ListLongMap!20263)

(assert (=> b!1303059 (= e!743254 (contains!8281 (+!4473 lt!583022 lt!583025) k!1205))))

(declare-fun lt!583020 () ListLongMap!20263)

(assert (=> b!1303059 (not (contains!8281 (+!4473 lt!583020 lt!583025) k!1205))))

(declare-fun minValue!1387 () V!51621)

(assert (=> b!1303059 (= lt!583025 (tuple2!22607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-fun lt!583023 () Unit!43142)

(declare-fun addStillNotContains!470 (ListLongMap!20263 (_ BitVec 64) V!51621 (_ BitVec 64)) Unit!43142)

(assert (=> b!1303059 (= lt!583023 (addStillNotContains!470 lt!583020 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1303059 (not (contains!8281 lt!583022 k!1205))))

(declare-fun zeroValue!1387 () V!51621)

(assert (=> b!1303059 (= lt!583022 (+!4473 lt!583020 (tuple2!22607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!583024 () Unit!43142)

(assert (=> b!1303059 (= lt!583024 (addStillNotContains!470 lt!583020 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16546 0))(
  ( (ValueCellFull!16546 (v!20134 V!51621)) (EmptyCell!16546) )
))
(declare-datatypes ((array!86794 0))(
  ( (array!86795 (arr!41889 (Array (_ BitVec 32) ValueCell!16546)) (size!42439 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86794)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6106 (array!86792 array!86794 (_ BitVec 32) (_ BitVec 32) V!51621 V!51621 (_ BitVec 32) Int) ListLongMap!20263)

(assert (=> b!1303059 (= lt!583020 (getCurrentListMapNoExtraKeys!6106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1303060 () Bool)

(declare-fun e!743257 () Bool)

(assert (=> b!1303060 (= e!743257 tp_is_empty!34889)))

(declare-fun mapIsEmpty!53923 () Bool)

(declare-fun mapRes!53923 () Bool)

(assert (=> mapIsEmpty!53923 mapRes!53923))

(declare-fun b!1303061 () Bool)

(declare-fun e!743256 () Bool)

(assert (=> b!1303061 (= e!743256 (and e!743257 mapRes!53923))))

(declare-fun condMapEmpty!53923 () Bool)

(declare-fun mapDefault!53923 () ValueCell!16546)

