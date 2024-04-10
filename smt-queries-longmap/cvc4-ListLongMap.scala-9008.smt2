; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108812 () Bool)

(assert start!108812)

(declare-fun b_free!28325 () Bool)

(declare-fun b_next!28325 () Bool)

(assert (=> start!108812 (= b_free!28325 (not b_next!28325))))

(declare-fun tp!100090 () Bool)

(declare-fun b_and!46391 () Bool)

(assert (=> start!108812 (= tp!100090 b_and!46391)))

(declare-fun b!1284991 () Bool)

(declare-fun e!733999 () Bool)

(assert (=> b!1284991 (= e!733999 false)))

(declare-datatypes ((V!50389 0))(
  ( (V!50390 (val!17057 Int)) )
))
(declare-fun zeroValue!1387 () V!50389)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16084 0))(
  ( (ValueCellFull!16084 (v!19659 V!50389)) (EmptyCell!16084) )
))
(declare-datatypes ((array!84988 0))(
  ( (array!84989 (arr!40996 (Array (_ BitVec 32) ValueCell!16084)) (size!41546 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84988)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576865 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84990 0))(
  ( (array!84991 (arr!40997 (Array (_ BitVec 32) (_ BitVec 64))) (size!41547 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84990)

(declare-fun minValue!1387 () V!50389)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21856 0))(
  ( (tuple2!21857 (_1!10939 (_ BitVec 64)) (_2!10939 V!50389)) )
))
(declare-datatypes ((List!29050 0))(
  ( (Nil!29047) (Cons!29046 (h!30255 tuple2!21856) (t!42594 List!29050)) )
))
(declare-datatypes ((ListLongMap!19513 0))(
  ( (ListLongMap!19514 (toList!9772 List!29050)) )
))
(declare-fun contains!7889 (ListLongMap!19513 (_ BitVec 64)) Bool)

(declare-fun +!4303 (ListLongMap!19513 tuple2!21856) ListLongMap!19513)

(declare-fun getCurrentListMapNoExtraKeys!5933 (array!84990 array!84988 (_ BitVec 32) (_ BitVec 32) V!50389 V!50389 (_ BitVec 32) Int) ListLongMap!19513)

(assert (=> b!1284991 (= lt!576865 (contains!7889 (+!4303 (getCurrentListMapNoExtraKeys!5933 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun b!1284992 () Bool)

(declare-fun e!734000 () Bool)

(declare-fun e!733996 () Bool)

(declare-fun mapRes!52505 () Bool)

(assert (=> b!1284992 (= e!734000 (and e!733996 mapRes!52505))))

(declare-fun condMapEmpty!52505 () Bool)

(declare-fun mapDefault!52505 () ValueCell!16084)

