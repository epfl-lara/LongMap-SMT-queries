; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109688 () Bool)

(assert start!109688)

(declare-fun b_free!29141 () Bool)

(declare-fun b_next!29141 () Bool)

(assert (=> start!109688 (= b_free!29141 (not b_next!29141))))

(declare-fun tp!102547 () Bool)

(declare-fun b_and!47237 () Bool)

(assert (=> start!109688 (= tp!102547 b_and!47237)))

(declare-fun b!1299232 () Bool)

(declare-fun res!863409 () Bool)

(declare-fun e!741214 () Bool)

(assert (=> b!1299232 (=> (not res!863409) (not e!741214))))

(declare-datatypes ((array!86570 0))(
  ( (array!86571 (arr!41784 (Array (_ BitVec 32) (_ BitVec 64))) (size!42334 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86570)

(declare-datatypes ((List!29656 0))(
  ( (Nil!29653) (Cons!29652 (h!30861 (_ BitVec 64)) (t!43224 List!29656)) )
))
(declare-fun arrayNoDuplicates!0 (array!86570 (_ BitVec 32) List!29656) Bool)

(assert (=> b!1299232 (= res!863409 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29653))))

(declare-fun b!1299233 () Bool)

(declare-fun e!741217 () Bool)

(declare-fun tp_is_empty!34781 () Bool)

(assert (=> b!1299233 (= e!741217 tp_is_empty!34781)))

(declare-fun b!1299234 () Bool)

(assert (=> b!1299234 (= e!741214 false)))

(declare-datatypes ((V!51477 0))(
  ( (V!51478 (val!17465 Int)) )
))
(declare-fun minValue!1387 () V!51477)

(declare-fun zeroValue!1387 () V!51477)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16492 0))(
  ( (ValueCellFull!16492 (v!20070 V!51477)) (EmptyCell!16492) )
))
(declare-datatypes ((array!86572 0))(
  ( (array!86573 (arr!41785 (Array (_ BitVec 32) ValueCell!16492)) (size!42335 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86572)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!580963 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22526 0))(
  ( (tuple2!22527 (_1!11274 (_ BitVec 64)) (_2!11274 V!51477)) )
))
(declare-datatypes ((List!29657 0))(
  ( (Nil!29654) (Cons!29653 (h!30862 tuple2!22526) (t!43225 List!29657)) )
))
(declare-datatypes ((ListLongMap!20183 0))(
  ( (ListLongMap!20184 (toList!10107 List!29657)) )
))
(declare-fun contains!8227 (ListLongMap!20183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5136 (array!86570 array!86572 (_ BitVec 32) (_ BitVec 32) V!51477 V!51477 (_ BitVec 32) Int) ListLongMap!20183)

(assert (=> b!1299234 (= lt!580963 (contains!8227 (getCurrentListMap!5136 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!863407 () Bool)

(assert (=> start!109688 (=> (not res!863407) (not e!741214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109688 (= res!863407 (validMask!0 mask!2175))))

(assert (=> start!109688 e!741214))

(assert (=> start!109688 tp_is_empty!34781))

(assert (=> start!109688 true))

(declare-fun e!741216 () Bool)

(declare-fun array_inv!31623 (array!86572) Bool)

(assert (=> start!109688 (and (array_inv!31623 _values!1445) e!741216)))

(declare-fun array_inv!31624 (array!86570) Bool)

(assert (=> start!109688 (array_inv!31624 _keys!1741)))

(assert (=> start!109688 tp!102547))

(declare-fun mapIsEmpty!53738 () Bool)

(declare-fun mapRes!53738 () Bool)

(assert (=> mapIsEmpty!53738 mapRes!53738))

(declare-fun b!1299235 () Bool)

(assert (=> b!1299235 (= e!741216 (and e!741217 mapRes!53738))))

(declare-fun condMapEmpty!53738 () Bool)

(declare-fun mapDefault!53738 () ValueCell!16492)

