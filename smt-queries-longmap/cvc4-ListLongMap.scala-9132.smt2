; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109580 () Bool)

(assert start!109580)

(declare-fun b_free!29069 () Bool)

(declare-fun b_next!29069 () Bool)

(assert (=> start!109580 (= b_free!29069 (not b_next!29069))))

(declare-fun tp!102325 () Bool)

(declare-fun b_and!47159 () Bool)

(assert (=> start!109580 (= tp!102325 b_and!47159)))

(declare-fun b!1297897 () Bool)

(declare-fun e!740489 () Bool)

(declare-fun tp_is_empty!34709 () Bool)

(assert (=> b!1297897 (= e!740489 tp_is_empty!34709)))

(declare-fun b!1297898 () Bool)

(declare-fun res!862548 () Bool)

(declare-fun e!740492 () Bool)

(assert (=> b!1297898 (=> (not res!862548) (not e!740492))))

(declare-datatypes ((V!51381 0))(
  ( (V!51382 (val!17429 Int)) )
))
(declare-fun minValue!1387 () V!51381)

(declare-fun zeroValue!1387 () V!51381)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16456 0))(
  ( (ValueCellFull!16456 (v!20032 V!51381)) (EmptyCell!16456) )
))
(declare-datatypes ((array!86426 0))(
  ( (array!86427 (arr!41714 (Array (_ BitVec 32) ValueCell!16456)) (size!42264 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86426)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86428 0))(
  ( (array!86429 (arr!41715 (Array (_ BitVec 32) (_ BitVec 64))) (size!42265 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86428)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22466 0))(
  ( (tuple2!22467 (_1!11244 (_ BitVec 64)) (_2!11244 V!51381)) )
))
(declare-datatypes ((List!29599 0))(
  ( (Nil!29596) (Cons!29595 (h!30804 tuple2!22466) (t!43163 List!29599)) )
))
(declare-datatypes ((ListLongMap!20123 0))(
  ( (ListLongMap!20124 (toList!10077 List!29599)) )
))
(declare-fun contains!8195 (ListLongMap!20123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5106 (array!86428 array!86426 (_ BitVec 32) (_ BitVec 32) V!51381 V!51381 (_ BitVec 32) Int) ListLongMap!20123)

(assert (=> b!1297898 (= res!862548 (contains!8195 (getCurrentListMap!5106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297899 () Bool)

(assert (=> b!1297899 (= e!740492 (not true))))

(assert (=> b!1297899 (contains!8195 (getCurrentListMap!5106 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42967 0))(
  ( (Unit!42968) )
))
(declare-fun lt!580649 () Unit!42967)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!36 (array!86428 array!86426 (_ BitVec 32) (_ BitVec 32) V!51381 V!51381 (_ BitVec 64) (_ BitVec 32) Int) Unit!42967)

(assert (=> b!1297899 (= lt!580649 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!36 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297900 () Bool)

(declare-fun e!740490 () Bool)

(declare-fun e!740491 () Bool)

(declare-fun mapRes!53624 () Bool)

(assert (=> b!1297900 (= e!740490 (and e!740491 mapRes!53624))))

(declare-fun condMapEmpty!53624 () Bool)

(declare-fun mapDefault!53624 () ValueCell!16456)

