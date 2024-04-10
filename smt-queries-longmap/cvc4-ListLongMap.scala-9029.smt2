; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108962 () Bool)

(assert start!108962)

(declare-fun b_free!28451 () Bool)

(declare-fun b_next!28451 () Bool)

(assert (=> start!108962 (= b_free!28451 (not b_next!28451))))

(declare-fun tp!100472 () Bool)

(declare-fun b_and!46541 () Bool)

(assert (=> start!108962 (= tp!100472 b_and!46541)))

(declare-fun b!1287465 () Bool)

(declare-fun res!855055 () Bool)

(declare-fun e!735260 () Bool)

(assert (=> b!1287465 (=> (not res!855055) (not e!735260))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85232 0))(
  ( (array!85233 (arr!41117 (Array (_ BitVec 32) (_ BitVec 64))) (size!41667 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85232)

(assert (=> b!1287465 (= res!855055 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41667 _keys!1741))))))

(declare-fun b!1287466 () Bool)

(declare-fun res!855057 () Bool)

(assert (=> b!1287466 (=> (not res!855057) (not e!735260))))

(declare-datatypes ((List!29144 0))(
  ( (Nil!29141) (Cons!29140 (h!30349 (_ BitVec 64)) (t!42708 List!29144)) )
))
(declare-fun arrayNoDuplicates!0 (array!85232 (_ BitVec 32) List!29144) Bool)

(assert (=> b!1287466 (= res!855057 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29141))))

(declare-fun b!1287467 () Bool)

(declare-fun res!855059 () Bool)

(assert (=> b!1287467 (=> (not res!855059) (not e!735260))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1287467 (= res!855059 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41667 _keys!1741))))))

(declare-fun mapIsEmpty!52697 () Bool)

(declare-fun mapRes!52697 () Bool)

(assert (=> mapIsEmpty!52697 mapRes!52697))

(declare-fun b!1287468 () Bool)

(declare-fun res!855054 () Bool)

(assert (=> b!1287468 (=> (not res!855054) (not e!735260))))

(declare-datatypes ((V!50557 0))(
  ( (V!50558 (val!17120 Int)) )
))
(declare-datatypes ((ValueCell!16147 0))(
  ( (ValueCellFull!16147 (v!19723 V!50557)) (EmptyCell!16147) )
))
(declare-datatypes ((array!85234 0))(
  ( (array!85235 (arr!41118 (Array (_ BitVec 32) ValueCell!16147)) (size!41668 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85234)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1287468 (= res!855054 (and (= (size!41668 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41667 _keys!1741) (size!41668 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287469 () Bool)

(declare-fun res!855056 () Bool)

(assert (=> b!1287469 (=> (not res!855056) (not e!735260))))

(declare-fun minValue!1387 () V!50557)

(declare-fun zeroValue!1387 () V!50557)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21964 0))(
  ( (tuple2!21965 (_1!10993 (_ BitVec 64)) (_2!10993 V!50557)) )
))
(declare-datatypes ((List!29145 0))(
  ( (Nil!29142) (Cons!29141 (h!30350 tuple2!21964) (t!42709 List!29145)) )
))
(declare-datatypes ((ListLongMap!19621 0))(
  ( (ListLongMap!19622 (toList!9826 List!29145)) )
))
(declare-fun contains!7944 (ListLongMap!19621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4900 (array!85232 array!85234 (_ BitVec 32) (_ BitVec 32) V!50557 V!50557 (_ BitVec 32) Int) ListLongMap!19621)

(assert (=> b!1287469 (= res!855056 (contains!7944 (getCurrentListMap!4900 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287470 () Bool)

(assert (=> b!1287470 (= e!735260 (not true))))

(assert (=> b!1287470 (not (contains!7944 (ListLongMap!19622 Nil!29142) k!1205))))

(declare-datatypes ((Unit!42576 0))(
  ( (Unit!42577) )
))
(declare-fun lt!577868 () Unit!42576)

(declare-fun emptyContainsNothing!17 ((_ BitVec 64)) Unit!42576)

(assert (=> b!1287470 (= lt!577868 (emptyContainsNothing!17 k!1205))))

(declare-fun b!1287471 () Bool)

(declare-fun res!855060 () Bool)

(assert (=> b!1287471 (=> (not res!855060) (not e!735260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287471 (= res!855060 (not (validKeyInArray!0 (select (arr!41117 _keys!1741) from!2144))))))

(declare-fun res!855053 () Bool)

(assert (=> start!108962 (=> (not res!855053) (not e!735260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108962 (= res!855053 (validMask!0 mask!2175))))

(assert (=> start!108962 e!735260))

(declare-fun tp_is_empty!34091 () Bool)

(assert (=> start!108962 tp_is_empty!34091))

(assert (=> start!108962 true))

(declare-fun e!735262 () Bool)

(declare-fun array_inv!31181 (array!85234) Bool)

(assert (=> start!108962 (and (array_inv!31181 _values!1445) e!735262)))

(declare-fun array_inv!31182 (array!85232) Bool)

(assert (=> start!108962 (array_inv!31182 _keys!1741)))

(assert (=> start!108962 tp!100472))

(declare-fun b!1287472 () Bool)

(declare-fun e!735263 () Bool)

(assert (=> b!1287472 (= e!735263 tp_is_empty!34091)))

(declare-fun b!1287473 () Bool)

(declare-fun res!855058 () Bool)

(assert (=> b!1287473 (=> (not res!855058) (not e!735260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85232 (_ BitVec 32)) Bool)

(assert (=> b!1287473 (= res!855058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287474 () Bool)

(declare-fun e!735261 () Bool)

(assert (=> b!1287474 (= e!735261 tp_is_empty!34091)))

(declare-fun b!1287475 () Bool)

(assert (=> b!1287475 (= e!735262 (and e!735261 mapRes!52697))))

(declare-fun condMapEmpty!52697 () Bool)

(declare-fun mapDefault!52697 () ValueCell!16147)

