; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109282 () Bool)

(assert start!109282)

(declare-fun b_free!28771 () Bool)

(declare-fun b_next!28771 () Bool)

(assert (=> start!109282 (= b_free!28771 (not b_next!28771))))

(declare-fun tp!101431 () Bool)

(declare-fun b_and!46861 () Bool)

(assert (=> start!109282 (= tp!101431 b_and!46861)))

(declare-fun b!1293080 () Bool)

(declare-fun res!859233 () Bool)

(declare-fun e!737996 () Bool)

(assert (=> b!1293080 (=> (not res!859233) (not e!737996))))

(declare-datatypes ((array!85852 0))(
  ( (array!85853 (arr!41427 (Array (_ BitVec 32) (_ BitVec 64))) (size!41977 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85852)

(declare-datatypes ((List!29387 0))(
  ( (Nil!29384) (Cons!29383 (h!30592 (_ BitVec 64)) (t!42951 List!29387)) )
))
(declare-fun arrayNoDuplicates!0 (array!85852 (_ BitVec 32) List!29387) Bool)

(assert (=> b!1293080 (= res!859233 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29384))))

(declare-fun res!859235 () Bool)

(assert (=> start!109282 (=> (not res!859235) (not e!737996))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109282 (= res!859235 (validMask!0 mask!2175))))

(assert (=> start!109282 e!737996))

(declare-fun tp_is_empty!34411 () Bool)

(assert (=> start!109282 tp_is_empty!34411))

(assert (=> start!109282 true))

(declare-datatypes ((V!50985 0))(
  ( (V!50986 (val!17280 Int)) )
))
(declare-datatypes ((ValueCell!16307 0))(
  ( (ValueCellFull!16307 (v!19883 V!50985)) (EmptyCell!16307) )
))
(declare-datatypes ((array!85854 0))(
  ( (array!85855 (arr!41428 (Array (_ BitVec 32) ValueCell!16307)) (size!41978 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85854)

(declare-fun e!737997 () Bool)

(declare-fun array_inv!31387 (array!85854) Bool)

(assert (=> start!109282 (and (array_inv!31387 _values!1445) e!737997)))

(declare-fun array_inv!31388 (array!85852) Bool)

(assert (=> start!109282 (array_inv!31388 _keys!1741)))

(assert (=> start!109282 tp!101431))

(declare-fun b!1293081 () Bool)

(declare-fun res!859231 () Bool)

(assert (=> b!1293081 (=> (not res!859231) (not e!737996))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1293081 (= res!859231 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41977 _keys!1741))))))

(declare-fun b!1293082 () Bool)

(declare-fun res!859234 () Bool)

(assert (=> b!1293082 (=> (not res!859234) (not e!737996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293082 (= res!859234 (not (validKeyInArray!0 (select (arr!41427 _keys!1741) from!2144))))))

(declare-fun b!1293083 () Bool)

(declare-fun res!859228 () Bool)

(assert (=> b!1293083 (=> (not res!859228) (not e!737996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85852 (_ BitVec 32)) Bool)

(assert (=> b!1293083 (= res!859228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293084 () Bool)

(declare-fun res!859230 () Bool)

(assert (=> b!1293084 (=> (not res!859230) (not e!737996))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293084 (= res!859230 (and (= (size!41978 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41977 _keys!1741) (size!41978 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293085 () Bool)

(declare-fun res!859229 () Bool)

(assert (=> b!1293085 (=> (not res!859229) (not e!737996))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1293085 (= res!859229 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41977 _keys!1741))))))

(declare-fun mapIsEmpty!53177 () Bool)

(declare-fun mapRes!53177 () Bool)

(assert (=> mapIsEmpty!53177 mapRes!53177))

(declare-fun b!1293086 () Bool)

(declare-fun e!737994 () Bool)

(assert (=> b!1293086 (= e!737994 true)))

(declare-datatypes ((tuple2!22238 0))(
  ( (tuple2!22239 (_1!11130 (_ BitVec 64)) (_2!11130 V!50985)) )
))
(declare-datatypes ((List!29388 0))(
  ( (Nil!29385) (Cons!29384 (h!30593 tuple2!22238) (t!42952 List!29388)) )
))
(declare-datatypes ((ListLongMap!19895 0))(
  ( (ListLongMap!19896 (toList!9963 List!29388)) )
))
(declare-fun lt!579460 () ListLongMap!19895)

(declare-fun zeroValue!1387 () V!50985)

(declare-fun contains!8081 (ListLongMap!19895 (_ BitVec 64)) Bool)

(declare-fun +!4397 (ListLongMap!19895 tuple2!22238) ListLongMap!19895)

(assert (=> b!1293086 (not (contains!8081 (+!4397 lt!579460 (tuple2!22239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42824 0))(
  ( (Unit!42825) )
))
(declare-fun lt!579461 () Unit!42824)

(declare-fun addStillNotContains!415 (ListLongMap!19895 (_ BitVec 64) V!50985 (_ BitVec 64)) Unit!42824)

(assert (=> b!1293086 (= lt!579461 (addStillNotContains!415 lt!579460 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50985)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6029 (array!85852 array!85854 (_ BitVec 32) (_ BitVec 32) V!50985 V!50985 (_ BitVec 32) Int) ListLongMap!19895)

(assert (=> b!1293086 (= lt!579460 (getCurrentListMapNoExtraKeys!6029 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293087 () Bool)

(declare-fun e!737999 () Bool)

(assert (=> b!1293087 (= e!737999 tp_is_empty!34411)))

(declare-fun b!1293088 () Bool)

(declare-fun e!737995 () Bool)

(assert (=> b!1293088 (= e!737997 (and e!737995 mapRes!53177))))

(declare-fun condMapEmpty!53177 () Bool)

(declare-fun mapDefault!53177 () ValueCell!16307)

