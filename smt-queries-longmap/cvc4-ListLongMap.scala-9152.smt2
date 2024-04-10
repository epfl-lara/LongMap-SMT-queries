; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109796 () Bool)

(assert start!109796)

(declare-fun b_free!29189 () Bool)

(declare-fun b_next!29189 () Bool)

(assert (=> start!109796 (= b_free!29189 (not b_next!29189))))

(declare-fun tp!102700 () Bool)

(declare-fun b_and!47303 () Bool)

(assert (=> start!109796 (= tp!102700 b_and!47303)))

(declare-fun b!1300556 () Bool)

(declare-fun res!864245 () Bool)

(declare-fun e!741870 () Bool)

(assert (=> b!1300556 (=> (not res!864245) (not e!741870))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86670 0))(
  ( (array!86671 (arr!41831 (Array (_ BitVec 32) (_ BitVec 64))) (size!42381 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86670)

(assert (=> b!1300556 (= res!864245 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42381 _keys!1741))))))

(declare-fun b!1300557 () Bool)

(declare-fun e!741872 () Bool)

(declare-fun tp_is_empty!34829 () Bool)

(assert (=> b!1300557 (= e!741872 tp_is_empty!34829)))

(declare-fun mapNonEmpty!53819 () Bool)

(declare-fun mapRes!53819 () Bool)

(declare-fun tp!102701 () Bool)

(declare-fun e!741868 () Bool)

(assert (=> mapNonEmpty!53819 (= mapRes!53819 (and tp!102701 e!741868))))

(declare-datatypes ((V!51541 0))(
  ( (V!51542 (val!17489 Int)) )
))
(declare-datatypes ((ValueCell!16516 0))(
  ( (ValueCellFull!16516 (v!20097 V!51541)) (EmptyCell!16516) )
))
(declare-fun mapValue!53819 () ValueCell!16516)

(declare-fun mapRest!53819 () (Array (_ BitVec 32) ValueCell!16516))

(declare-datatypes ((array!86672 0))(
  ( (array!86673 (arr!41832 (Array (_ BitVec 32) ValueCell!16516)) (size!42382 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86672)

(declare-fun mapKey!53819 () (_ BitVec 32))

(assert (=> mapNonEmpty!53819 (= (arr!41832 _values!1445) (store mapRest!53819 mapKey!53819 mapValue!53819))))

(declare-fun b!1300558 () Bool)

(declare-fun res!864247 () Bool)

(assert (=> b!1300558 (=> (not res!864247) (not e!741870))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300558 (= res!864247 (and (= (size!42382 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42381 _keys!1741) (size!42382 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300560 () Bool)

(declare-fun res!864248 () Bool)

(assert (=> b!1300560 (=> (not res!864248) (not e!741870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300560 (= res!864248 (validKeyInArray!0 (select (arr!41831 _keys!1741) from!2144)))))

(declare-fun b!1300561 () Bool)

(declare-fun res!864244 () Bool)

(assert (=> b!1300561 (=> (not res!864244) (not e!741870))))

(declare-fun minValue!1387 () V!51541)

(declare-fun zeroValue!1387 () V!51541)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22556 0))(
  ( (tuple2!22557 (_1!11289 (_ BitVec 64)) (_2!11289 V!51541)) )
))
(declare-datatypes ((List!29689 0))(
  ( (Nil!29686) (Cons!29685 (h!30894 tuple2!22556) (t!43263 List!29689)) )
))
(declare-datatypes ((ListLongMap!20213 0))(
  ( (ListLongMap!20214 (toList!10122 List!29689)) )
))
(declare-fun contains!8248 (ListLongMap!20213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5149 (array!86670 array!86672 (_ BitVec 32) (_ BitVec 32) V!51541 V!51541 (_ BitVec 32) Int) ListLongMap!20213)

(assert (=> b!1300561 (= res!864244 (contains!8248 (getCurrentListMap!5149 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53819 () Bool)

(assert (=> mapIsEmpty!53819 mapRes!53819))

(declare-fun b!1300562 () Bool)

(declare-fun res!864251 () Bool)

(assert (=> b!1300562 (=> (not res!864251) (not e!741870))))

(assert (=> b!1300562 (= res!864251 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300563 () Bool)

(declare-fun res!864246 () Bool)

(assert (=> b!1300563 (=> (not res!864246) (not e!741870))))

(assert (=> b!1300563 (= res!864246 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42381 _keys!1741))))))

(declare-fun b!1300564 () Bool)

(assert (=> b!1300564 (= e!741868 tp_is_empty!34829)))

(declare-fun b!1300565 () Bool)

(declare-fun res!864250 () Bool)

(assert (=> b!1300565 (=> (not res!864250) (not e!741870))))

(declare-datatypes ((List!29690 0))(
  ( (Nil!29687) (Cons!29686 (h!30895 (_ BitVec 64)) (t!43264 List!29690)) )
))
(declare-fun arrayNoDuplicates!0 (array!86670 (_ BitVec 32) List!29690) Bool)

(assert (=> b!1300565 (= res!864250 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29687))))

(declare-fun res!864249 () Bool)

(assert (=> start!109796 (=> (not res!864249) (not e!741870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109796 (= res!864249 (validMask!0 mask!2175))))

(assert (=> start!109796 e!741870))

(assert (=> start!109796 tp_is_empty!34829))

(assert (=> start!109796 true))

(declare-fun e!741871 () Bool)

(declare-fun array_inv!31651 (array!86672) Bool)

(assert (=> start!109796 (and (array_inv!31651 _values!1445) e!741871)))

(declare-fun array_inv!31652 (array!86670) Bool)

(assert (=> start!109796 (array_inv!31652 _keys!1741)))

(assert (=> start!109796 tp!102700))

(declare-fun b!1300559 () Bool)

(assert (=> b!1300559 (= e!741871 (and e!741872 mapRes!53819))))

(declare-fun condMapEmpty!53819 () Bool)

(declare-fun mapDefault!53819 () ValueCell!16516)

