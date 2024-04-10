; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109346 () Bool)

(assert start!109346)

(declare-fun b_free!28835 () Bool)

(declare-fun b_next!28835 () Bool)

(assert (=> start!109346 (= b_free!28835 (not b_next!28835))))

(declare-fun tp!101624 () Bool)

(declare-fun b_and!46925 () Bool)

(assert (=> start!109346 (= tp!101624 b_and!46925)))

(declare-fun b!1294206 () Bool)

(declare-fun res!860071 () Bool)

(declare-fun e!738545 () Bool)

(assert (=> b!1294206 (=> (not res!860071) (not e!738545))))

(declare-datatypes ((array!85972 0))(
  ( (array!85973 (arr!41487 (Array (_ BitVec 32) (_ BitVec 64))) (size!42037 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85972)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85972 (_ BitVec 32)) Bool)

(assert (=> b!1294206 (= res!860071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294207 () Bool)

(assert (=> b!1294207 (= e!738545 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51069 0))(
  ( (V!51070 (val!17312 Int)) )
))
(declare-datatypes ((tuple2!22282 0))(
  ( (tuple2!22283 (_1!11152 (_ BitVec 64)) (_2!11152 V!51069)) )
))
(declare-datatypes ((List!29427 0))(
  ( (Nil!29424) (Cons!29423 (h!30632 tuple2!22282) (t!42991 List!29427)) )
))
(declare-datatypes ((ListLongMap!19939 0))(
  ( (ListLongMap!19940 (toList!9985 List!29427)) )
))
(declare-fun contains!8103 (ListLongMap!19939 (_ BitVec 64)) Bool)

(assert (=> b!1294207 (not (contains!8103 (ListLongMap!19940 Nil!29424) k!1205))))

(declare-datatypes ((Unit!42862 0))(
  ( (Unit!42863) )
))
(declare-fun lt!579695 () Unit!42862)

(declare-fun emptyContainsNothing!152 ((_ BitVec 64)) Unit!42862)

(assert (=> b!1294207 (= lt!579695 (emptyContainsNothing!152 k!1205))))

(declare-fun b!1294208 () Bool)

(declare-fun e!738547 () Bool)

(declare-fun tp_is_empty!34475 () Bool)

(assert (=> b!1294208 (= e!738547 tp_is_empty!34475)))

(declare-fun b!1294209 () Bool)

(declare-fun e!738544 () Bool)

(assert (=> b!1294209 (= e!738544 tp_is_empty!34475)))

(declare-fun mapIsEmpty!53273 () Bool)

(declare-fun mapRes!53273 () Bool)

(assert (=> mapIsEmpty!53273 mapRes!53273))

(declare-fun mapNonEmpty!53273 () Bool)

(declare-fun tp!101623 () Bool)

(assert (=> mapNonEmpty!53273 (= mapRes!53273 (and tp!101623 e!738547))))

(declare-fun mapKey!53273 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16339 0))(
  ( (ValueCellFull!16339 (v!19915 V!51069)) (EmptyCell!16339) )
))
(declare-datatypes ((array!85974 0))(
  ( (array!85975 (arr!41488 (Array (_ BitVec 32) ValueCell!16339)) (size!42038 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85974)

(declare-fun mapValue!53273 () ValueCell!16339)

(declare-fun mapRest!53273 () (Array (_ BitVec 32) ValueCell!16339))

(assert (=> mapNonEmpty!53273 (= (arr!41488 _values!1445) (store mapRest!53273 mapKey!53273 mapValue!53273))))

(declare-fun b!1294210 () Bool)

(declare-fun res!860068 () Bool)

(assert (=> b!1294210 (=> (not res!860068) (not e!738545))))

(declare-fun minValue!1387 () V!51069)

(declare-fun zeroValue!1387 () V!51069)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5024 (array!85972 array!85974 (_ BitVec 32) (_ BitVec 32) V!51069 V!51069 (_ BitVec 32) Int) ListLongMap!19939)

(assert (=> b!1294210 (= res!860068 (contains!8103 (getCurrentListMap!5024 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294211 () Bool)

(declare-fun e!738546 () Bool)

(assert (=> b!1294211 (= e!738546 (and e!738544 mapRes!53273))))

(declare-fun condMapEmpty!53273 () Bool)

(declare-fun mapDefault!53273 () ValueCell!16339)

