; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109240 () Bool)

(assert start!109240)

(declare-fun b_free!28729 () Bool)

(declare-fun b_next!28729 () Bool)

(assert (=> start!109240 (= b_free!28729 (not b_next!28729))))

(declare-fun tp!101305 () Bool)

(declare-fun b_and!46819 () Bool)

(assert (=> start!109240 (= tp!101305 b_and!46819)))

(declare-fun b!1292349 () Bool)

(declare-fun res!858687 () Bool)

(declare-fun e!737643 () Bool)

(assert (=> b!1292349 (=> (not res!858687) (not e!737643))))

(declare-datatypes ((array!85770 0))(
  ( (array!85771 (arr!41386 (Array (_ BitVec 32) (_ BitVec 64))) (size!41936 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85770)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292349 (= res!858687 (not (validKeyInArray!0 (select (arr!41386 _keys!1741) from!2144))))))

(declare-fun b!1292350 () Bool)

(assert (=> b!1292350 (= e!737643 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50929 0))(
  ( (V!50930 (val!17259 Int)) )
))
(declare-datatypes ((tuple2!22204 0))(
  ( (tuple2!22205 (_1!11113 (_ BitVec 64)) (_2!11113 V!50929)) )
))
(declare-datatypes ((List!29357 0))(
  ( (Nil!29354) (Cons!29353 (h!30562 tuple2!22204) (t!42921 List!29357)) )
))
(declare-datatypes ((ListLongMap!19861 0))(
  ( (ListLongMap!19862 (toList!9946 List!29357)) )
))
(declare-fun contains!8064 (ListLongMap!19861 (_ BitVec 64)) Bool)

(assert (=> b!1292350 (not (contains!8064 (ListLongMap!19862 Nil!29354) k!1205))))

(declare-datatypes ((Unit!42800 0))(
  ( (Unit!42801) )
))
(declare-fun lt!579329 () Unit!42800)

(declare-fun emptyContainsNothing!122 ((_ BitVec 64)) Unit!42800)

(assert (=> b!1292350 (= lt!579329 (emptyContainsNothing!122 k!1205))))

(declare-fun b!1292351 () Bool)

(declare-fun res!858691 () Bool)

(assert (=> b!1292351 (=> (not res!858691) (not e!737643))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85770 (_ BitVec 32)) Bool)

(assert (=> b!1292351 (= res!858691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292352 () Bool)

(declare-fun e!737642 () Bool)

(declare-fun tp_is_empty!34369 () Bool)

(assert (=> b!1292352 (= e!737642 tp_is_empty!34369)))

(declare-fun b!1292353 () Bool)

(declare-fun res!858686 () Bool)

(assert (=> b!1292353 (=> (not res!858686) (not e!737643))))

(assert (=> b!1292353 (= res!858686 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41936 _keys!1741))))))

(declare-fun res!858690 () Bool)

(assert (=> start!109240 (=> (not res!858690) (not e!737643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109240 (= res!858690 (validMask!0 mask!2175))))

(assert (=> start!109240 e!737643))

(assert (=> start!109240 tp_is_empty!34369))

(assert (=> start!109240 true))

(declare-datatypes ((ValueCell!16286 0))(
  ( (ValueCellFull!16286 (v!19862 V!50929)) (EmptyCell!16286) )
))
(declare-datatypes ((array!85772 0))(
  ( (array!85773 (arr!41387 (Array (_ BitVec 32) ValueCell!16286)) (size!41937 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85772)

(declare-fun e!737641 () Bool)

(declare-fun array_inv!31359 (array!85772) Bool)

(assert (=> start!109240 (and (array_inv!31359 _values!1445) e!737641)))

(declare-fun array_inv!31360 (array!85770) Bool)

(assert (=> start!109240 (array_inv!31360 _keys!1741)))

(assert (=> start!109240 tp!101305))

(declare-fun b!1292354 () Bool)

(declare-fun res!858693 () Bool)

(assert (=> b!1292354 (=> (not res!858693) (not e!737643))))

(declare-fun minValue!1387 () V!50929)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50929)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4992 (array!85770 array!85772 (_ BitVec 32) (_ BitVec 32) V!50929 V!50929 (_ BitVec 32) Int) ListLongMap!19861)

(assert (=> b!1292354 (= res!858693 (contains!8064 (getCurrentListMap!4992 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53114 () Bool)

(declare-fun mapRes!53114 () Bool)

(assert (=> mapIsEmpty!53114 mapRes!53114))

(declare-fun b!1292355 () Bool)

(declare-fun res!858689 () Bool)

(assert (=> b!1292355 (=> (not res!858689) (not e!737643))))

(assert (=> b!1292355 (= res!858689 (and (= (size!41937 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41936 _keys!1741) (size!41937 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292356 () Bool)

(declare-fun res!858692 () Bool)

(assert (=> b!1292356 (=> (not res!858692) (not e!737643))))

(assert (=> b!1292356 (= res!858692 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41936 _keys!1741))))))

(declare-fun b!1292357 () Bool)

(assert (=> b!1292357 (= e!737641 (and e!737642 mapRes!53114))))

(declare-fun condMapEmpty!53114 () Bool)

(declare-fun mapDefault!53114 () ValueCell!16286)

