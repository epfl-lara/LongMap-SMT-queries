; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109364 () Bool)

(assert start!109364)

(declare-fun b_free!28853 () Bool)

(declare-fun b_next!28853 () Bool)

(assert (=> start!109364 (= b_free!28853 (not b_next!28853))))

(declare-fun tp!101677 () Bool)

(declare-fun b_and!46943 () Bool)

(assert (=> start!109364 (= tp!101677 b_and!46943)))

(declare-fun b!1294503 () Bool)

(declare-fun res!860289 () Bool)

(declare-fun e!738679 () Bool)

(assert (=> b!1294503 (=> (not res!860289) (not e!738679))))

(declare-datatypes ((array!86008 0))(
  ( (array!86009 (arr!41505 (Array (_ BitVec 32) (_ BitVec 64))) (size!42055 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86008)

(declare-datatypes ((List!29441 0))(
  ( (Nil!29438) (Cons!29437 (h!30646 (_ BitVec 64)) (t!43005 List!29441)) )
))
(declare-fun arrayNoDuplicates!0 (array!86008 (_ BitVec 32) List!29441) Bool)

(assert (=> b!1294503 (= res!860289 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29438))))

(declare-fun b!1294505 () Bool)

(declare-fun res!860285 () Bool)

(assert (=> b!1294505 (=> (not res!860285) (not e!738679))))

(declare-datatypes ((V!51093 0))(
  ( (V!51094 (val!17321 Int)) )
))
(declare-fun minValue!1387 () V!51093)

(declare-fun zeroValue!1387 () V!51093)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16348 0))(
  ( (ValueCellFull!16348 (v!19924 V!51093)) (EmptyCell!16348) )
))
(declare-datatypes ((array!86010 0))(
  ( (array!86011 (arr!41506 (Array (_ BitVec 32) ValueCell!16348)) (size!42056 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86010)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22298 0))(
  ( (tuple2!22299 (_1!11160 (_ BitVec 64)) (_2!11160 V!51093)) )
))
(declare-datatypes ((List!29442 0))(
  ( (Nil!29439) (Cons!29438 (h!30647 tuple2!22298) (t!43006 List!29442)) )
))
(declare-datatypes ((ListLongMap!19955 0))(
  ( (ListLongMap!19956 (toList!9993 List!29442)) )
))
(declare-fun contains!8111 (ListLongMap!19955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5030 (array!86008 array!86010 (_ BitVec 32) (_ BitVec 32) V!51093 V!51093 (_ BitVec 32) Int) ListLongMap!19955)

(assert (=> b!1294505 (= res!860285 (contains!8111 (getCurrentListMap!5030 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294506 () Bool)

(declare-fun e!738682 () Bool)

(declare-fun e!738680 () Bool)

(declare-fun mapRes!53300 () Bool)

(assert (=> b!1294506 (= e!738682 (and e!738680 mapRes!53300))))

(declare-fun condMapEmpty!53300 () Bool)

(declare-fun mapDefault!53300 () ValueCell!16348)

