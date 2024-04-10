; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108556 () Bool)

(assert start!108556)

(declare-fun b_free!28103 () Bool)

(declare-fun b_next!28103 () Bool)

(assert (=> start!108556 (= b_free!28103 (not b_next!28103))))

(declare-fun tp!99418 () Bool)

(declare-fun b_and!46163 () Bool)

(assert (=> start!108556 (= tp!99418 b_and!46163)))

(declare-fun res!851246 () Bool)

(declare-fun e!732145 () Bool)

(assert (=> start!108556 (=> (not res!851246) (not e!732145))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108556 (= res!851246 (validMask!0 mask!2175))))

(assert (=> start!108556 e!732145))

(declare-fun tp_is_empty!33743 () Bool)

(assert (=> start!108556 tp_is_empty!33743))

(assert (=> start!108556 true))

(declare-datatypes ((V!50093 0))(
  ( (V!50094 (val!16946 Int)) )
))
(declare-datatypes ((ValueCell!15973 0))(
  ( (ValueCellFull!15973 (v!19546 V!50093)) (EmptyCell!15973) )
))
(declare-datatypes ((array!84556 0))(
  ( (array!84557 (arr!40782 (Array (_ BitVec 32) ValueCell!15973)) (size!41332 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84556)

(declare-fun e!732148 () Bool)

(declare-fun array_inv!30947 (array!84556) Bool)

(assert (=> start!108556 (and (array_inv!30947 _values!1445) e!732148)))

(declare-datatypes ((array!84558 0))(
  ( (array!84559 (arr!40783 (Array (_ BitVec 32) (_ BitVec 64))) (size!41333 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84558)

(declare-fun array_inv!30948 (array!84558) Bool)

(assert (=> start!108556 (array_inv!30948 _keys!1741)))

(assert (=> start!108556 tp!99418))

(declare-fun b!1281453 () Bool)

(declare-fun res!851247 () Bool)

(assert (=> b!1281453 (=> (not res!851247) (not e!732145))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281453 (= res!851247 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41333 _keys!1741))))))

(declare-fun b!1281454 () Bool)

(declare-fun e!732144 () Bool)

(assert (=> b!1281454 (= e!732144 tp_is_empty!33743)))

(declare-fun b!1281455 () Bool)

(declare-fun res!851249 () Bool)

(assert (=> b!1281455 (=> (not res!851249) (not e!732145))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1281455 (= res!851249 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41333 _keys!1741)) (not (= (select (arr!40783 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1281456 () Bool)

(declare-fun res!851245 () Bool)

(assert (=> b!1281456 (=> (not res!851245) (not e!732145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84558 (_ BitVec 32)) Bool)

(assert (=> b!1281456 (= res!851245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281457 () Bool)

(declare-fun e!732149 () Bool)

(assert (=> b!1281457 (= e!732149 tp_is_empty!33743)))

(declare-fun b!1281458 () Bool)

(declare-fun e!732147 () Bool)

(assert (=> b!1281458 (= e!732145 (not e!732147))))

(declare-fun res!851250 () Bool)

(assert (=> b!1281458 (=> res!851250 e!732147)))

(assert (=> b!1281458 (= res!851250 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(declare-fun minValue!1387 () V!50093)

(declare-fun zeroValue!1387 () V!50093)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21698 0))(
  ( (tuple2!21699 (_1!10860 (_ BitVec 64)) (_2!10860 V!50093)) )
))
(declare-datatypes ((List!28892 0))(
  ( (Nil!28889) (Cons!28888 (h!30097 tuple2!21698) (t!42432 List!28892)) )
))
(declare-datatypes ((ListLongMap!19355 0))(
  ( (ListLongMap!19356 (toList!9693 List!28892)) )
))
(declare-fun contains!7808 (ListLongMap!19355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4777 (array!84558 array!84556 (_ BitVec 32) (_ BitVec 32) V!50093 V!50093 (_ BitVec 32) Int) ListLongMap!19355)

(assert (=> b!1281458 (contains!7808 (getCurrentListMap!4777 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42443 0))(
  ( (Unit!42444) )
))
(declare-fun lt!576235 () Unit!42443)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!26 (array!84558 array!84556 (_ BitVec 32) (_ BitVec 32) V!50093 V!50093 (_ BitVec 64) (_ BitVec 32) Int) Unit!42443)

(assert (=> b!1281458 (= lt!576235 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!26 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281459 () Bool)

(declare-fun mapRes!52166 () Bool)

(assert (=> b!1281459 (= e!732148 (and e!732149 mapRes!52166))))

(declare-fun condMapEmpty!52166 () Bool)

(declare-fun mapDefault!52166 () ValueCell!15973)

