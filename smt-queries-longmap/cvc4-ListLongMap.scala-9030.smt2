; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108968 () Bool)

(assert start!108968)

(declare-fun b_free!28457 () Bool)

(declare-fun b_next!28457 () Bool)

(assert (=> start!108968 (= b_free!28457 (not b_next!28457))))

(declare-fun tp!100489 () Bool)

(declare-fun b_and!46547 () Bool)

(assert (=> start!108968 (= tp!100489 b_and!46547)))

(declare-fun b!1287564 () Bool)

(declare-fun res!855125 () Bool)

(declare-fun e!735304 () Bool)

(assert (=> b!1287564 (=> (not res!855125) (not e!735304))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85244 0))(
  ( (array!85245 (arr!41123 (Array (_ BitVec 32) (_ BitVec 64))) (size!41673 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85244)

(assert (=> b!1287564 (= res!855125 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41673 _keys!1741))))))

(declare-fun b!1287565 () Bool)

(assert (=> b!1287565 (= e!735304 (not true))))

(declare-datatypes ((V!50565 0))(
  ( (V!50566 (val!17123 Int)) )
))
(declare-datatypes ((tuple2!21970 0))(
  ( (tuple2!21971 (_1!10996 (_ BitVec 64)) (_2!10996 V!50565)) )
))
(declare-datatypes ((List!29150 0))(
  ( (Nil!29147) (Cons!29146 (h!30355 tuple2!21970) (t!42714 List!29150)) )
))
(declare-datatypes ((ListLongMap!19627 0))(
  ( (ListLongMap!19628 (toList!9829 List!29150)) )
))
(declare-fun contains!7947 (ListLongMap!19627 (_ BitVec 64)) Bool)

(assert (=> b!1287565 (not (contains!7947 (ListLongMap!19628 Nil!29147) k!1205))))

(declare-datatypes ((Unit!42580 0))(
  ( (Unit!42581) )
))
(declare-fun lt!577877 () Unit!42580)

(declare-fun emptyContainsNothing!19 ((_ BitVec 64)) Unit!42580)

(assert (=> b!1287565 (= lt!577877 (emptyContainsNothing!19 k!1205))))

(declare-fun b!1287566 () Bool)

(declare-fun e!735305 () Bool)

(declare-fun tp_is_empty!34097 () Bool)

(assert (=> b!1287566 (= e!735305 tp_is_empty!34097)))

(declare-fun b!1287567 () Bool)

(declare-fun e!735306 () Bool)

(assert (=> b!1287567 (= e!735306 tp_is_empty!34097)))

(declare-fun b!1287568 () Bool)

(declare-fun res!855126 () Bool)

(assert (=> b!1287568 (=> (not res!855126) (not e!735304))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85244 (_ BitVec 32)) Bool)

(assert (=> b!1287568 (= res!855126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287569 () Bool)

(declare-fun e!735307 () Bool)

(declare-fun mapRes!52706 () Bool)

(assert (=> b!1287569 (= e!735307 (and e!735305 mapRes!52706))))

(declare-fun condMapEmpty!52706 () Bool)

(declare-datatypes ((ValueCell!16150 0))(
  ( (ValueCellFull!16150 (v!19726 V!50565)) (EmptyCell!16150) )
))
(declare-datatypes ((array!85246 0))(
  ( (array!85247 (arr!41124 (Array (_ BitVec 32) ValueCell!16150)) (size!41674 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85246)

(declare-fun mapDefault!52706 () ValueCell!16150)

