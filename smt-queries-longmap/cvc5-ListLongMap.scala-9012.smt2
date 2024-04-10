; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108832 () Bool)

(assert start!108832)

(declare-fun b_free!28345 () Bool)

(declare-fun b_next!28345 () Bool)

(assert (=> start!108832 (= b_free!28345 (not b_next!28345))))

(declare-fun tp!100150 () Bool)

(declare-fun b_and!46411 () Bool)

(assert (=> start!108832 (= tp!100150 b_and!46411)))

(declare-fun b!1285271 () Bool)

(declare-fun res!853830 () Bool)

(declare-fun e!734150 () Bool)

(assert (=> b!1285271 (=> (not res!853830) (not e!734150))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85028 0))(
  ( (array!85029 (arr!41016 (Array (_ BitVec 32) (_ BitVec 64))) (size!41566 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85028)

(assert (=> b!1285271 (= res!853830 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41566 _keys!1741))))))

(declare-fun b!1285272 () Bool)

(assert (=> b!1285272 (= e!734150 false)))

(declare-datatypes ((V!50417 0))(
  ( (V!50418 (val!17067 Int)) )
))
(declare-fun minValue!1387 () V!50417)

(declare-fun zeroValue!1387 () V!50417)

(declare-fun lt!576895 () Bool)

(declare-datatypes ((ValueCell!16094 0))(
  ( (ValueCellFull!16094 (v!19669 V!50417)) (EmptyCell!16094) )
))
(declare-datatypes ((array!85030 0))(
  ( (array!85031 (arr!41017 (Array (_ BitVec 32) ValueCell!16094)) (size!41567 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85030)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21876 0))(
  ( (tuple2!21877 (_1!10949 (_ BitVec 64)) (_2!10949 V!50417)) )
))
(declare-datatypes ((List!29068 0))(
  ( (Nil!29065) (Cons!29064 (h!30273 tuple2!21876) (t!42612 List!29068)) )
))
(declare-datatypes ((ListLongMap!19533 0))(
  ( (ListLongMap!19534 (toList!9782 List!29068)) )
))
(declare-fun contains!7899 (ListLongMap!19533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4860 (array!85028 array!85030 (_ BitVec 32) (_ BitVec 32) V!50417 V!50417 (_ BitVec 32) Int) ListLongMap!19533)

(assert (=> b!1285272 (= lt!576895 (contains!7899 (getCurrentListMap!4860 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285273 () Bool)

(declare-fun e!734147 () Bool)

(declare-fun e!734146 () Bool)

(declare-fun mapRes!52535 () Bool)

(assert (=> b!1285273 (= e!734147 (and e!734146 mapRes!52535))))

(declare-fun condMapEmpty!52535 () Bool)

(declare-fun mapDefault!52535 () ValueCell!16094)

