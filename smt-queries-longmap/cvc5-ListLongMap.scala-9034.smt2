; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108988 () Bool)

(assert start!108988)

(declare-fun b_free!28477 () Bool)

(declare-fun b_next!28477 () Bool)

(assert (=> start!108988 (= b_free!28477 (not b_next!28477))))

(declare-fun tp!100550 () Bool)

(declare-fun b_and!46567 () Bool)

(assert (=> start!108988 (= tp!100550 b_and!46567)))

(declare-fun b!1287894 () Bool)

(declare-fun res!855368 () Bool)

(declare-fun e!735455 () Bool)

(assert (=> b!1287894 (=> (not res!855368) (not e!735455))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50593 0))(
  ( (V!50594 (val!17133 Int)) )
))
(declare-datatypes ((ValueCell!16160 0))(
  ( (ValueCellFull!16160 (v!19736 V!50593)) (EmptyCell!16160) )
))
(declare-datatypes ((array!85282 0))(
  ( (array!85283 (arr!41142 (Array (_ BitVec 32) ValueCell!16160)) (size!41692 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85282)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85284 0))(
  ( (array!85285 (arr!41143 (Array (_ BitVec 32) (_ BitVec 64))) (size!41693 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85284)

(assert (=> b!1287894 (= res!855368 (and (= (size!41692 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41693 _keys!1741) (size!41692 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287895 () Bool)

(declare-fun res!855366 () Bool)

(assert (=> b!1287895 (=> (not res!855366) (not e!735455))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287895 (= res!855366 (not (validKeyInArray!0 (select (arr!41143 _keys!1741) from!2144))))))

(declare-fun b!1287896 () Bool)

(assert (=> b!1287896 (= e!735455 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21988 0))(
  ( (tuple2!21989 (_1!11005 (_ BitVec 64)) (_2!11005 V!50593)) )
))
(declare-datatypes ((List!29165 0))(
  ( (Nil!29162) (Cons!29161 (h!30370 tuple2!21988) (t!42729 List!29165)) )
))
(declare-datatypes ((ListLongMap!19645 0))(
  ( (ListLongMap!19646 (toList!9838 List!29165)) )
))
(declare-fun contains!7956 (ListLongMap!19645 (_ BitVec 64)) Bool)

(assert (=> b!1287896 (not (contains!7956 (ListLongMap!19646 Nil!29162) k!1205))))

(declare-datatypes ((Unit!42596 0))(
  ( (Unit!42597) )
))
(declare-fun lt!577907 () Unit!42596)

(declare-fun emptyContainsNothing!27 ((_ BitVec 64)) Unit!42596)

(assert (=> b!1287896 (= lt!577907 (emptyContainsNothing!27 k!1205))))

(declare-fun b!1287897 () Bool)

(declare-fun e!735456 () Bool)

(declare-fun e!735454 () Bool)

(declare-fun mapRes!52736 () Bool)

(assert (=> b!1287897 (= e!735456 (and e!735454 mapRes!52736))))

(declare-fun condMapEmpty!52736 () Bool)

(declare-fun mapDefault!52736 () ValueCell!16160)

