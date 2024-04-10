; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109180 () Bool)

(assert start!109180)

(declare-fun b_free!28669 () Bool)

(declare-fun b_next!28669 () Bool)

(assert (=> start!109180 (= b_free!28669 (not b_next!28669))))

(declare-fun tp!101126 () Bool)

(declare-fun b_and!46759 () Bool)

(assert (=> start!109180 (= tp!101126 b_and!46759)))

(declare-fun b!1291325 () Bool)

(declare-fun e!737157 () Bool)

(assert (=> b!1291325 (= e!737157 true)))

(assert (=> b!1291325 false))

(declare-datatypes ((V!50849 0))(
  ( (V!50850 (val!17229 Int)) )
))
(declare-fun minValue!1387 () V!50849)

(declare-datatypes ((tuple2!22150 0))(
  ( (tuple2!22151 (_1!11086 (_ BitVec 64)) (_2!11086 V!50849)) )
))
(declare-datatypes ((List!29308 0))(
  ( (Nil!29305) (Cons!29304 (h!30513 tuple2!22150) (t!42872 List!29308)) )
))
(declare-datatypes ((ListLongMap!19807 0))(
  ( (ListLongMap!19808 (toList!9919 List!29308)) )
))
(declare-fun lt!579072 () ListLongMap!19807)

(declare-datatypes ((Unit!42750 0))(
  ( (Unit!42751) )
))
(declare-fun lt!579074 () Unit!42750)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!57 ((_ BitVec 64) (_ BitVec 64) V!50849 ListLongMap!19807) Unit!42750)

(assert (=> b!1291325 (= lt!579074 (lemmaInListMapAfterAddingDiffThenInBefore!57 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579072))))

(declare-fun lt!579070 () ListLongMap!19807)

(declare-fun contains!8037 (ListLongMap!19807 (_ BitVec 64)) Bool)

(declare-fun +!4383 (ListLongMap!19807 tuple2!22150) ListLongMap!19807)

(assert (=> b!1291325 (not (contains!8037 (+!4383 lt!579070 (tuple2!22151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579073 () Unit!42750)

(declare-fun addStillNotContains!401 (ListLongMap!19807 (_ BitVec 64) V!50849 (_ BitVec 64)) Unit!42750)

(assert (=> b!1291325 (= lt!579073 (addStillNotContains!401 lt!579070 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291325 (not (contains!8037 lt!579072 k!1205))))

(declare-fun zeroValue!1387 () V!50849)

(assert (=> b!1291325 (= lt!579072 (+!4383 lt!579070 (tuple2!22151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579071 () Unit!42750)

(assert (=> b!1291325 (= lt!579071 (addStillNotContains!401 lt!579070 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16256 0))(
  ( (ValueCellFull!16256 (v!19832 V!50849)) (EmptyCell!16256) )
))
(declare-datatypes ((array!85654 0))(
  ( (array!85655 (arr!41328 (Array (_ BitVec 32) ValueCell!16256)) (size!41878 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85654)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85656 0))(
  ( (array!85657 (arr!41329 (Array (_ BitVec 32) (_ BitVec 64))) (size!41879 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85656)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6014 (array!85656 array!85654 (_ BitVec 32) (_ BitVec 32) V!50849 V!50849 (_ BitVec 32) Int) ListLongMap!19807)

(assert (=> b!1291325 (= lt!579070 (getCurrentListMapNoExtraKeys!6014 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291326 () Bool)

(declare-fun e!737159 () Bool)

(declare-fun e!737160 () Bool)

(declare-fun mapRes!53024 () Bool)

(assert (=> b!1291326 (= e!737159 (and e!737160 mapRes!53024))))

(declare-fun condMapEmpty!53024 () Bool)

(declare-fun mapDefault!53024 () ValueCell!16256)

