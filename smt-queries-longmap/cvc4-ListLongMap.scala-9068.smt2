; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109196 () Bool)

(assert start!109196)

(declare-fun b_free!28685 () Bool)

(declare-fun b_next!28685 () Bool)

(assert (=> start!109196 (= b_free!28685 (not b_next!28685))))

(declare-fun tp!101173 () Bool)

(declare-fun b_and!46775 () Bool)

(assert (=> start!109196 (= tp!101173 b_and!46775)))

(declare-fun b!1291613 () Bool)

(declare-fun e!737305 () Bool)

(declare-fun e!737306 () Bool)

(assert (=> b!1291613 (= e!737305 (not e!737306))))

(declare-fun res!858150 () Bool)

(assert (=> b!1291613 (=> res!858150 e!737306)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291613 (= res!858150 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50869 0))(
  ( (V!50870 (val!17237 Int)) )
))
(declare-datatypes ((tuple2!22166 0))(
  ( (tuple2!22167 (_1!11094 (_ BitVec 64)) (_2!11094 V!50869)) )
))
(declare-datatypes ((List!29322 0))(
  ( (Nil!29319) (Cons!29318 (h!30527 tuple2!22166) (t!42886 List!29322)) )
))
(declare-datatypes ((ListLongMap!19823 0))(
  ( (ListLongMap!19824 (toList!9927 List!29322)) )
))
(declare-fun contains!8045 (ListLongMap!19823 (_ BitVec 64)) Bool)

(assert (=> b!1291613 (not (contains!8045 (ListLongMap!19824 Nil!29319) k!1205))))

(declare-datatypes ((Unit!42764 0))(
  ( (Unit!42765) )
))
(declare-fun lt!579213 () Unit!42764)

(declare-fun emptyContainsNothing!104 ((_ BitVec 64)) Unit!42764)

(assert (=> b!1291613 (= lt!579213 (emptyContainsNothing!104 k!1205))))

(declare-fun b!1291614 () Bool)

(declare-fun res!858153 () Bool)

(assert (=> b!1291614 (=> (not res!858153) (not e!737305))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16264 0))(
  ( (ValueCellFull!16264 (v!19840 V!50869)) (EmptyCell!16264) )
))
(declare-datatypes ((array!85686 0))(
  ( (array!85687 (arr!41344 (Array (_ BitVec 32) ValueCell!16264)) (size!41894 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85686)

(declare-datatypes ((array!85688 0))(
  ( (array!85689 (arr!41345 (Array (_ BitVec 32) (_ BitVec 64))) (size!41895 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85688)

(assert (=> b!1291614 (= res!858153 (and (= (size!41894 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41895 _keys!1741) (size!41894 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291615 () Bool)

(declare-fun e!737302 () Bool)

(declare-fun tp_is_empty!34325 () Bool)

(assert (=> b!1291615 (= e!737302 tp_is_empty!34325)))

(declare-fun b!1291616 () Bool)

(declare-fun res!858156 () Bool)

(assert (=> b!1291616 (=> (not res!858156) (not e!737305))))

(declare-datatypes ((List!29323 0))(
  ( (Nil!29320) (Cons!29319 (h!30528 (_ BitVec 64)) (t!42887 List!29323)) )
))
(declare-fun arrayNoDuplicates!0 (array!85688 (_ BitVec 32) List!29323) Bool)

(assert (=> b!1291616 (= res!858156 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29320))))

(declare-fun b!1291617 () Bool)

(declare-fun res!858155 () Bool)

(assert (=> b!1291617 (=> (not res!858155) (not e!737305))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291617 (= res!858155 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41895 _keys!1741))))))

(declare-fun b!1291618 () Bool)

(declare-fun res!858148 () Bool)

(assert (=> b!1291618 (=> (not res!858148) (not e!737305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85688 (_ BitVec 32)) Bool)

(assert (=> b!1291618 (= res!858148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291619 () Bool)

(declare-fun res!858154 () Bool)

(assert (=> b!1291619 (=> (not res!858154) (not e!737305))))

(assert (=> b!1291619 (= res!858154 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41895 _keys!1741))))))

(declare-fun b!1291620 () Bool)

(declare-fun res!858152 () Bool)

(assert (=> b!1291620 (=> (not res!858152) (not e!737305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291620 (= res!858152 (not (validKeyInArray!0 (select (arr!41345 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53048 () Bool)

(declare-fun mapRes!53048 () Bool)

(assert (=> mapIsEmpty!53048 mapRes!53048))

(declare-fun b!1291622 () Bool)

(assert (=> b!1291622 (= e!737306 true)))

(assert (=> b!1291622 false))

(declare-fun minValue!1387 () V!50869)

(declare-fun lt!579215 () ListLongMap!19823)

(declare-fun lt!579214 () Unit!42764)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!64 ((_ BitVec 64) (_ BitVec 64) V!50869 ListLongMap!19823) Unit!42764)

(assert (=> b!1291622 (= lt!579214 (lemmaInListMapAfterAddingDiffThenInBefore!64 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579215))))

(declare-fun lt!579216 () ListLongMap!19823)

(declare-fun +!4390 (ListLongMap!19823 tuple2!22166) ListLongMap!19823)

(assert (=> b!1291622 (not (contains!8045 (+!4390 lt!579216 (tuple2!22167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579217 () Unit!42764)

(declare-fun addStillNotContains!408 (ListLongMap!19823 (_ BitVec 64) V!50869 (_ BitVec 64)) Unit!42764)

(assert (=> b!1291622 (= lt!579217 (addStillNotContains!408 lt!579216 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291622 (not (contains!8045 lt!579215 k!1205))))

(declare-fun zeroValue!1387 () V!50869)

(assert (=> b!1291622 (= lt!579215 (+!4390 lt!579216 (tuple2!22167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579218 () Unit!42764)

(assert (=> b!1291622 (= lt!579218 (addStillNotContains!408 lt!579216 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6021 (array!85688 array!85686 (_ BitVec 32) (_ BitVec 32) V!50869 V!50869 (_ BitVec 32) Int) ListLongMap!19823)

(assert (=> b!1291622 (= lt!579216 (getCurrentListMapNoExtraKeys!6021 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291623 () Bool)

(declare-fun e!737301 () Bool)

(assert (=> b!1291623 (= e!737301 tp_is_empty!34325)))

(declare-fun mapNonEmpty!53048 () Bool)

(declare-fun tp!101174 () Bool)

(assert (=> mapNonEmpty!53048 (= mapRes!53048 (and tp!101174 e!737302))))

(declare-fun mapKey!53048 () (_ BitVec 32))

(declare-fun mapRest!53048 () (Array (_ BitVec 32) ValueCell!16264))

(declare-fun mapValue!53048 () ValueCell!16264)

(assert (=> mapNonEmpty!53048 (= (arr!41344 _values!1445) (store mapRest!53048 mapKey!53048 mapValue!53048))))

(declare-fun b!1291624 () Bool)

(declare-fun e!737303 () Bool)

(assert (=> b!1291624 (= e!737303 (and e!737301 mapRes!53048))))

(declare-fun condMapEmpty!53048 () Bool)

(declare-fun mapDefault!53048 () ValueCell!16264)

