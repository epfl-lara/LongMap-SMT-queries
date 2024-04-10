; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109100 () Bool)

(assert start!109100)

(declare-fun b_free!28589 () Bool)

(declare-fun b_next!28589 () Bool)

(assert (=> start!109100 (= b_free!28589 (not b_next!28589))))

(declare-fun tp!100886 () Bool)

(declare-fun b_and!46679 () Bool)

(assert (=> start!109100 (= tp!100886 b_and!46679)))

(declare-fun b!1289885 () Bool)

(declare-fun res!856854 () Bool)

(declare-fun e!736442 () Bool)

(assert (=> b!1289885 (=> (not res!856854) (not e!736442))))

(declare-datatypes ((array!85500 0))(
  ( (array!85501 (arr!41251 (Array (_ BitVec 32) (_ BitVec 64))) (size!41801 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85500)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289885 (= res!856854 (not (validKeyInArray!0 (select (arr!41251 _keys!1741) from!2144))))))

(declare-fun b!1289886 () Bool)

(declare-fun res!856860 () Bool)

(assert (=> b!1289886 (=> (not res!856860) (not e!736442))))

(declare-datatypes ((V!50741 0))(
  ( (V!50742 (val!17189 Int)) )
))
(declare-fun minValue!1387 () V!50741)

(declare-fun zeroValue!1387 () V!50741)

(declare-datatypes ((ValueCell!16216 0))(
  ( (ValueCellFull!16216 (v!19792 V!50741)) (EmptyCell!16216) )
))
(declare-datatypes ((array!85502 0))(
  ( (array!85503 (arr!41252 (Array (_ BitVec 32) ValueCell!16216)) (size!41802 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85502)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22082 0))(
  ( (tuple2!22083 (_1!11052 (_ BitVec 64)) (_2!11052 V!50741)) )
))
(declare-datatypes ((List!29250 0))(
  ( (Nil!29247) (Cons!29246 (h!30455 tuple2!22082) (t!42814 List!29250)) )
))
(declare-datatypes ((ListLongMap!19739 0))(
  ( (ListLongMap!19740 (toList!9885 List!29250)) )
))
(declare-fun contains!8003 (ListLongMap!19739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4945 (array!85500 array!85502 (_ BitVec 32) (_ BitVec 32) V!50741 V!50741 (_ BitVec 32) Int) ListLongMap!19739)

(assert (=> b!1289886 (= res!856860 (contains!8003 (getCurrentListMap!4945 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289887 () Bool)

(declare-fun e!736438 () Bool)

(declare-fun e!736441 () Bool)

(declare-fun mapRes!52904 () Bool)

(assert (=> b!1289887 (= e!736438 (and e!736441 mapRes!52904))))

(declare-fun condMapEmpty!52904 () Bool)

(declare-fun mapDefault!52904 () ValueCell!16216)

