; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108692 () Bool)

(assert start!108692)

(declare-fun b_free!28205 () Bool)

(declare-fun b_next!28205 () Bool)

(assert (=> start!108692 (= b_free!28205 (not b_next!28205))))

(declare-fun tp!99730 () Bool)

(declare-fun b_and!46271 () Bool)

(assert (=> start!108692 (= tp!99730 b_and!46271)))

(declare-fun b!1283129 () Bool)

(declare-fun res!852314 () Bool)

(declare-fun e!733099 () Bool)

(assert (=> b!1283129 (=> (not res!852314) (not e!733099))))

(declare-datatypes ((array!84752 0))(
  ( (array!84753 (arr!40878 (Array (_ BitVec 32) (_ BitVec 64))) (size!41428 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84752)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84752 (_ BitVec 32)) Bool)

(assert (=> b!1283129 (= res!852314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283130 () Bool)

(declare-fun res!852313 () Bool)

(assert (=> b!1283130 (=> (not res!852313) (not e!733099))))

(declare-datatypes ((V!50229 0))(
  ( (V!50230 (val!16997 Int)) )
))
(declare-datatypes ((ValueCell!16024 0))(
  ( (ValueCellFull!16024 (v!19599 V!50229)) (EmptyCell!16024) )
))
(declare-datatypes ((array!84754 0))(
  ( (array!84755 (arr!40879 (Array (_ BitVec 32) ValueCell!16024)) (size!41429 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84754)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283130 (= res!852313 (and (= (size!41429 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41428 _keys!1741) (size!41429 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52325 () Bool)

(declare-fun mapRes!52325 () Bool)

(assert (=> mapIsEmpty!52325 mapRes!52325))

(declare-fun b!1283131 () Bool)

(declare-fun res!852319 () Bool)

(assert (=> b!1283131 (=> (not res!852319) (not e!733099))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283131 (= res!852319 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41428 _keys!1741))))))

(declare-fun b!1283132 () Bool)

(declare-fun res!852317 () Bool)

(assert (=> b!1283132 (=> (not res!852317) (not e!733099))))

(declare-fun minValue!1387 () V!50229)

(declare-fun zeroValue!1387 () V!50229)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21766 0))(
  ( (tuple2!21767 (_1!10894 (_ BitVec 64)) (_2!10894 V!50229)) )
))
(declare-datatypes ((List!28963 0))(
  ( (Nil!28960) (Cons!28959 (h!30168 tuple2!21766) (t!42507 List!28963)) )
))
(declare-datatypes ((ListLongMap!19423 0))(
  ( (ListLongMap!19424 (toList!9727 List!28963)) )
))
(declare-fun contains!7844 (ListLongMap!19423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4811 (array!84752 array!84754 (_ BitVec 32) (_ BitVec 32) V!50229 V!50229 (_ BitVec 32) Int) ListLongMap!19423)

(assert (=> b!1283132 (= res!852317 (contains!7844 (getCurrentListMap!4811 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1283133 () Bool)

(declare-fun res!852318 () Bool)

(assert (=> b!1283133 (=> (not res!852318) (not e!733099))))

(declare-datatypes ((List!28964 0))(
  ( (Nil!28961) (Cons!28960 (h!30169 (_ BitVec 64)) (t!42508 List!28964)) )
))
(declare-fun arrayNoDuplicates!0 (array!84752 (_ BitVec 32) List!28964) Bool)

(assert (=> b!1283133 (= res!852318 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28961))))

(declare-fun b!1283134 () Bool)

(assert (=> b!1283134 (= e!733099 (not true))))

(declare-fun lt!576604 () ListLongMap!19423)

(assert (=> b!1283134 (contains!7844 lt!576604 k!1205)))

(declare-datatypes ((Unit!42465 0))(
  ( (Unit!42466) )
))
(declare-fun lt!576603 () Unit!42465)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!3 ((_ BitVec 64) (_ BitVec 64) V!50229 ListLongMap!19423) Unit!42465)

(assert (=> b!1283134 (= lt!576603 (lemmaInListMapAfterAddingDiffThenInBefore!3 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576604))))

(declare-fun +!4279 (ListLongMap!19423 tuple2!21766) ListLongMap!19423)

(declare-fun getCurrentListMapNoExtraKeys!5909 (array!84752 array!84754 (_ BitVec 32) (_ BitVec 32) V!50229 V!50229 (_ BitVec 32) Int) ListLongMap!19423)

(assert (=> b!1283134 (= lt!576604 (+!4279 (getCurrentListMapNoExtraKeys!5909 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21767 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283135 () Bool)

(declare-fun res!852320 () Bool)

(assert (=> b!1283135 (=> (not res!852320) (not e!733099))))

(assert (=> b!1283135 (= res!852320 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41428 _keys!1741))))))

(declare-fun b!1283128 () Bool)

(declare-fun res!852316 () Bool)

(assert (=> b!1283128 (=> (not res!852316) (not e!733099))))

(assert (=> b!1283128 (= res!852316 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!852321 () Bool)

(assert (=> start!108692 (=> (not res!852321) (not e!733099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108692 (= res!852321 (validMask!0 mask!2175))))

(assert (=> start!108692 e!733099))

(declare-fun tp_is_empty!33845 () Bool)

(assert (=> start!108692 tp_is_empty!33845))

(assert (=> start!108692 true))

(declare-fun e!733096 () Bool)

(declare-fun array_inv!31011 (array!84754) Bool)

(assert (=> start!108692 (and (array_inv!31011 _values!1445) e!733096)))

(declare-fun array_inv!31012 (array!84752) Bool)

(assert (=> start!108692 (array_inv!31012 _keys!1741)))

(assert (=> start!108692 tp!99730))

(declare-fun b!1283136 () Bool)

(declare-fun e!733098 () Bool)

(assert (=> b!1283136 (= e!733098 tp_is_empty!33845)))

(declare-fun b!1283137 () Bool)

(assert (=> b!1283137 (= e!733096 (and e!733098 mapRes!52325))))

(declare-fun condMapEmpty!52325 () Bool)

(declare-fun mapDefault!52325 () ValueCell!16024)

