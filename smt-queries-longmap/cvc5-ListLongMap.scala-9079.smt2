; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109258 () Bool)

(assert start!109258)

(declare-fun b_free!28747 () Bool)

(declare-fun b_next!28747 () Bool)

(assert (=> start!109258 (= b_free!28747 (not b_next!28747))))

(declare-fun tp!101360 () Bool)

(declare-fun b_and!46837 () Bool)

(assert (=> start!109258 (= tp!101360 b_and!46837)))

(declare-fun b!1292648 () Bool)

(declare-fun res!858905 () Bool)

(declare-fun e!737780 () Bool)

(assert (=> b!1292648 (=> (not res!858905) (not e!737780))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50953 0))(
  ( (V!50954 (val!17268 Int)) )
))
(declare-datatypes ((ValueCell!16295 0))(
  ( (ValueCellFull!16295 (v!19871 V!50953)) (EmptyCell!16295) )
))
(declare-datatypes ((array!85806 0))(
  ( (array!85807 (arr!41404 (Array (_ BitVec 32) ValueCell!16295)) (size!41954 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85806)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85808 0))(
  ( (array!85809 (arr!41405 (Array (_ BitVec 32) (_ BitVec 64))) (size!41955 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85808)

(assert (=> b!1292648 (= res!858905 (and (= (size!41954 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41955 _keys!1741) (size!41954 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292649 () Bool)

(declare-fun e!737783 () Bool)

(declare-fun tp_is_empty!34387 () Bool)

(assert (=> b!1292649 (= e!737783 tp_is_empty!34387)))

(declare-fun res!858912 () Bool)

(assert (=> start!109258 (=> (not res!858912) (not e!737780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109258 (= res!858912 (validMask!0 mask!2175))))

(assert (=> start!109258 e!737780))

(assert (=> start!109258 tp_is_empty!34387))

(assert (=> start!109258 true))

(declare-fun e!737779 () Bool)

(declare-fun array_inv!31369 (array!85806) Bool)

(assert (=> start!109258 (and (array_inv!31369 _values!1445) e!737779)))

(declare-fun array_inv!31370 (array!85808) Bool)

(assert (=> start!109258 (array_inv!31370 _keys!1741)))

(assert (=> start!109258 tp!101360))

(declare-fun b!1292650 () Bool)

(declare-fun res!858911 () Bool)

(assert (=> b!1292650 (=> (not res!858911) (not e!737780))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1292650 (= res!858911 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41955 _keys!1741))))))

(declare-fun b!1292651 () Bool)

(declare-fun res!858907 () Bool)

(assert (=> b!1292651 (=> (not res!858907) (not e!737780))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1292651 (= res!858907 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41955 _keys!1741))))))

(declare-fun b!1292652 () Bool)

(declare-fun res!858908 () Bool)

(assert (=> b!1292652 (=> (not res!858908) (not e!737780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85808 (_ BitVec 32)) Bool)

(assert (=> b!1292652 (= res!858908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292653 () Bool)

(declare-fun e!737778 () Bool)

(assert (=> b!1292653 (= e!737780 (not e!737778))))

(declare-fun res!858906 () Bool)

(assert (=> b!1292653 (=> res!858906 e!737778)))

(assert (=> b!1292653 (= res!858906 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22220 0))(
  ( (tuple2!22221 (_1!11121 (_ BitVec 64)) (_2!11121 V!50953)) )
))
(declare-datatypes ((List!29371 0))(
  ( (Nil!29368) (Cons!29367 (h!30576 tuple2!22220) (t!42935 List!29371)) )
))
(declare-datatypes ((ListLongMap!19877 0))(
  ( (ListLongMap!19878 (toList!9954 List!29371)) )
))
(declare-fun contains!8072 (ListLongMap!19877 (_ BitVec 64)) Bool)

(assert (=> b!1292653 (not (contains!8072 (ListLongMap!19878 Nil!29368) k!1205))))

(declare-datatypes ((Unit!42808 0))(
  ( (Unit!42809) )
))
(declare-fun lt!579358 () Unit!42808)

(declare-fun emptyContainsNothing!126 ((_ BitVec 64)) Unit!42808)

(assert (=> b!1292653 (= lt!579358 (emptyContainsNothing!126 k!1205))))

(declare-fun b!1292654 () Bool)

(declare-fun res!858904 () Bool)

(assert (=> b!1292654 (=> (not res!858904) (not e!737780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292654 (= res!858904 (not (validKeyInArray!0 (select (arr!41405 _keys!1741) from!2144))))))

(declare-fun b!1292655 () Bool)

(declare-fun mapRes!53141 () Bool)

(assert (=> b!1292655 (= e!737779 (and e!737783 mapRes!53141))))

(declare-fun condMapEmpty!53141 () Bool)

(declare-fun mapDefault!53141 () ValueCell!16295)

