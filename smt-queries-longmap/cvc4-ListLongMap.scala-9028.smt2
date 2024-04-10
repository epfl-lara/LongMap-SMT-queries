; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108956 () Bool)

(assert start!108956)

(declare-fun b_free!28445 () Bool)

(declare-fun b_next!28445 () Bool)

(assert (=> start!108956 (= b_free!28445 (not b_next!28445))))

(declare-fun tp!100453 () Bool)

(declare-fun b_and!46535 () Bool)

(assert (=> start!108956 (= tp!100453 b_and!46535)))

(declare-fun b!1287366 () Bool)

(declare-fun res!854982 () Bool)

(declare-fun e!735218 () Bool)

(assert (=> b!1287366 (=> (not res!854982) (not e!735218))))

(declare-datatypes ((V!50549 0))(
  ( (V!50550 (val!17117 Int)) )
))
(declare-fun minValue!1387 () V!50549)

(declare-fun zeroValue!1387 () V!50549)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16144 0))(
  ( (ValueCellFull!16144 (v!19720 V!50549)) (EmptyCell!16144) )
))
(declare-datatypes ((array!85220 0))(
  ( (array!85221 (arr!41111 (Array (_ BitVec 32) ValueCell!16144)) (size!41661 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85220)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85222 0))(
  ( (array!85223 (arr!41112 (Array (_ BitVec 32) (_ BitVec 64))) (size!41662 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85222)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21958 0))(
  ( (tuple2!21959 (_1!10990 (_ BitVec 64)) (_2!10990 V!50549)) )
))
(declare-datatypes ((List!29140 0))(
  ( (Nil!29137) (Cons!29136 (h!30345 tuple2!21958) (t!42704 List!29140)) )
))
(declare-datatypes ((ListLongMap!19615 0))(
  ( (ListLongMap!19616 (toList!9823 List!29140)) )
))
(declare-fun contains!7941 (ListLongMap!19615 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4897 (array!85222 array!85220 (_ BitVec 32) (_ BitVec 32) V!50549 V!50549 (_ BitVec 32) Int) ListLongMap!19615)

(assert (=> b!1287366 (= res!854982 (contains!7941 (getCurrentListMap!4897 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287367 () Bool)

(declare-fun res!854988 () Bool)

(assert (=> b!1287367 (=> (not res!854988) (not e!735218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85222 (_ BitVec 32)) Bool)

(assert (=> b!1287367 (= res!854988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!854981 () Bool)

(assert (=> start!108956 (=> (not res!854981) (not e!735218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108956 (= res!854981 (validMask!0 mask!2175))))

(assert (=> start!108956 e!735218))

(declare-fun tp_is_empty!34085 () Bool)

(assert (=> start!108956 tp_is_empty!34085))

(assert (=> start!108956 true))

(declare-fun e!735214 () Bool)

(declare-fun array_inv!31175 (array!85220) Bool)

(assert (=> start!108956 (and (array_inv!31175 _values!1445) e!735214)))

(declare-fun array_inv!31176 (array!85222) Bool)

(assert (=> start!108956 (array_inv!31176 _keys!1741)))

(assert (=> start!108956 tp!100453))

(declare-fun b!1287368 () Bool)

(declare-fun e!735216 () Bool)

(declare-fun mapRes!52688 () Bool)

(assert (=> b!1287368 (= e!735214 (and e!735216 mapRes!52688))))

(declare-fun condMapEmpty!52688 () Bool)

(declare-fun mapDefault!52688 () ValueCell!16144)

