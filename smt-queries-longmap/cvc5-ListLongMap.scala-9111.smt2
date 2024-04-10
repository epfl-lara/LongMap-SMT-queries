; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109450 () Bool)

(assert start!109450)

(declare-fun b_free!28939 () Bool)

(declare-fun b_next!28939 () Bool)

(assert (=> start!109450 (= b_free!28939 (not b_next!28939))))

(declare-fun tp!101935 () Bool)

(declare-fun b_and!47029 () Bool)

(assert (=> start!109450 (= tp!101935 b_and!47029)))

(declare-fun b!1296023 () Bool)

(declare-fun res!861415 () Bool)

(declare-fun e!739427 () Bool)

(assert (=> b!1296023 (=> (not res!861415) (not e!739427))))

(declare-datatypes ((V!51209 0))(
  ( (V!51210 (val!17364 Int)) )
))
(declare-fun minValue!1387 () V!51209)

(declare-fun zeroValue!1387 () V!51209)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16391 0))(
  ( (ValueCellFull!16391 (v!19967 V!51209)) (EmptyCell!16391) )
))
(declare-datatypes ((array!86176 0))(
  ( (array!86177 (arr!41589 (Array (_ BitVec 32) ValueCell!16391)) (size!42139 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86176)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86178 0))(
  ( (array!86179 (arr!41590 (Array (_ BitVec 32) (_ BitVec 64))) (size!42140 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86178)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22362 0))(
  ( (tuple2!22363 (_1!11192 (_ BitVec 64)) (_2!11192 V!51209)) )
))
(declare-datatypes ((List!29504 0))(
  ( (Nil!29501) (Cons!29500 (h!30709 tuple2!22362) (t!43068 List!29504)) )
))
(declare-datatypes ((ListLongMap!20019 0))(
  ( (ListLongMap!20020 (toList!10025 List!29504)) )
))
(declare-fun contains!8143 (ListLongMap!20019 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5058 (array!86178 array!86176 (_ BitVec 32) (_ BitVec 32) V!51209 V!51209 (_ BitVec 32) Int) ListLongMap!20019)

(assert (=> b!1296023 (= res!861415 (contains!8143 (getCurrentListMap!5058 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53429 () Bool)

(declare-fun mapRes!53429 () Bool)

(assert (=> mapIsEmpty!53429 mapRes!53429))

(declare-fun b!1296024 () Bool)

(declare-fun res!861422 () Bool)

(assert (=> b!1296024 (=> (not res!861422) (not e!739427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296024 (= res!861422 (not (validKeyInArray!0 (select (arr!41590 _keys!1741) from!2144))))))

(declare-fun b!1296025 () Bool)

(declare-fun e!739428 () Bool)

(assert (=> b!1296025 (= e!739427 (not e!739428))))

(declare-fun res!861417 () Bool)

(assert (=> b!1296025 (=> res!861417 e!739428)))

(assert (=> b!1296025 (= res!861417 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296025 (not (contains!8143 (ListLongMap!20020 Nil!29501) k!1205))))

(declare-datatypes ((Unit!42928 0))(
  ( (Unit!42929) )
))
(declare-fun lt!580045 () Unit!42928)

(declare-fun emptyContainsNothing!183 ((_ BitVec 64)) Unit!42928)

(assert (=> b!1296025 (= lt!580045 (emptyContainsNothing!183 k!1205))))

(declare-fun b!1296026 () Bool)

(declare-fun e!739426 () Bool)

(declare-fun e!739429 () Bool)

(assert (=> b!1296026 (= e!739426 (and e!739429 mapRes!53429))))

(declare-fun condMapEmpty!53429 () Bool)

(declare-fun mapDefault!53429 () ValueCell!16391)

