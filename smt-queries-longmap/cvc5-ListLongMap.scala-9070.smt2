; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109204 () Bool)

(assert start!109204)

(declare-fun b_free!28693 () Bool)

(declare-fun b_next!28693 () Bool)

(assert (=> start!109204 (= b_free!28693 (not b_next!28693))))

(declare-fun tp!101197 () Bool)

(declare-fun b_and!46783 () Bool)

(assert (=> start!109204 (= tp!101197 b_and!46783)))

(declare-fun b!1291755 () Bool)

(declare-fun e!737374 () Bool)

(assert (=> b!1291755 (= e!737374 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50881 0))(
  ( (V!50882 (val!17241 Int)) )
))
(declare-datatypes ((tuple2!22174 0))(
  ( (tuple2!22175 (_1!11098 (_ BitVec 64)) (_2!11098 V!50881)) )
))
(declare-datatypes ((List!29328 0))(
  ( (Nil!29325) (Cons!29324 (h!30533 tuple2!22174) (t!42892 List!29328)) )
))
(declare-datatypes ((ListLongMap!19831 0))(
  ( (ListLongMap!19832 (toList!9931 List!29328)) )
))
(declare-fun contains!8049 (ListLongMap!19831 (_ BitVec 64)) Bool)

(assert (=> b!1291755 (not (contains!8049 (ListLongMap!19832 Nil!29325) k!1205))))

(declare-datatypes ((Unit!42772 0))(
  ( (Unit!42773) )
))
(declare-fun lt!579275 () Unit!42772)

(declare-fun emptyContainsNothing!108 ((_ BitVec 64)) Unit!42772)

(assert (=> b!1291755 (= lt!579275 (emptyContainsNothing!108 k!1205))))

(declare-fun b!1291756 () Bool)

(declare-fun res!858261 () Bool)

(assert (=> b!1291756 (=> (not res!858261) (not e!737374))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85702 0))(
  ( (array!85703 (arr!41352 (Array (_ BitVec 32) (_ BitVec 64))) (size!41902 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85702)

(assert (=> b!1291756 (= res!858261 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41902 _keys!1741))))))

(declare-fun mapNonEmpty!53060 () Bool)

(declare-fun mapRes!53060 () Bool)

(declare-fun tp!101198 () Bool)

(declare-fun e!737375 () Bool)

(assert (=> mapNonEmpty!53060 (= mapRes!53060 (and tp!101198 e!737375))))

(declare-datatypes ((ValueCell!16268 0))(
  ( (ValueCellFull!16268 (v!19844 V!50881)) (EmptyCell!16268) )
))
(declare-fun mapValue!53060 () ValueCell!16268)

(declare-datatypes ((array!85704 0))(
  ( (array!85705 (arr!41353 (Array (_ BitVec 32) ValueCell!16268)) (size!41903 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85704)

(declare-fun mapKey!53060 () (_ BitVec 32))

(declare-fun mapRest!53060 () (Array (_ BitVec 32) ValueCell!16268))

(assert (=> mapNonEmpty!53060 (= (arr!41353 _values!1445) (store mapRest!53060 mapKey!53060 mapValue!53060))))

(declare-fun mapIsEmpty!53060 () Bool)

(assert (=> mapIsEmpty!53060 mapRes!53060))

(declare-fun b!1291757 () Bool)

(declare-fun res!858255 () Bool)

(assert (=> b!1291757 (=> (not res!858255) (not e!737374))))

(declare-datatypes ((List!29329 0))(
  ( (Nil!29326) (Cons!29325 (h!30534 (_ BitVec 64)) (t!42893 List!29329)) )
))
(declare-fun arrayNoDuplicates!0 (array!85702 (_ BitVec 32) List!29329) Bool)

(assert (=> b!1291757 (= res!858255 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29326))))

(declare-fun b!1291758 () Bool)

(declare-fun res!858257 () Bool)

(assert (=> b!1291758 (=> (not res!858257) (not e!737374))))

(declare-fun minValue!1387 () V!50881)

(declare-fun zeroValue!1387 () V!50881)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4979 (array!85702 array!85704 (_ BitVec 32) (_ BitVec 32) V!50881 V!50881 (_ BitVec 32) Int) ListLongMap!19831)

(assert (=> b!1291758 (= res!858257 (contains!8049 (getCurrentListMap!4979 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291760 () Bool)

(declare-fun e!737373 () Bool)

(declare-fun tp_is_empty!34333 () Bool)

(assert (=> b!1291760 (= e!737373 tp_is_empty!34333)))

(declare-fun b!1291761 () Bool)

(declare-fun res!858258 () Bool)

(assert (=> b!1291761 (=> (not res!858258) (not e!737374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291761 (= res!858258 (not (validKeyInArray!0 (select (arr!41352 _keys!1741) from!2144))))))

(declare-fun b!1291759 () Bool)

(declare-fun res!858260 () Bool)

(assert (=> b!1291759 (=> (not res!858260) (not e!737374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85702 (_ BitVec 32)) Bool)

(assert (=> b!1291759 (= res!858260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858254 () Bool)

(assert (=> start!109204 (=> (not res!858254) (not e!737374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109204 (= res!858254 (validMask!0 mask!2175))))

(assert (=> start!109204 e!737374))

(assert (=> start!109204 tp_is_empty!34333))

(assert (=> start!109204 true))

(declare-fun e!737371 () Bool)

(declare-fun array_inv!31331 (array!85704) Bool)

(assert (=> start!109204 (and (array_inv!31331 _values!1445) e!737371)))

(declare-fun array_inv!31332 (array!85702) Bool)

(assert (=> start!109204 (array_inv!31332 _keys!1741)))

(assert (=> start!109204 tp!101197))

(declare-fun b!1291762 () Bool)

(assert (=> b!1291762 (= e!737375 tp_is_empty!34333)))

(declare-fun b!1291763 () Bool)

(declare-fun res!858256 () Bool)

(assert (=> b!1291763 (=> (not res!858256) (not e!737374))))

(assert (=> b!1291763 (= res!858256 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41902 _keys!1741))))))

(declare-fun b!1291764 () Bool)

(assert (=> b!1291764 (= e!737371 (and e!737373 mapRes!53060))))

(declare-fun condMapEmpty!53060 () Bool)

(declare-fun mapDefault!53060 () ValueCell!16268)

