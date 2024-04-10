; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108658 () Bool)

(assert start!108658)

(declare-fun b_free!28171 () Bool)

(declare-fun b_next!28171 () Bool)

(assert (=> start!108658 (= b_free!28171 (not b_next!28171))))

(declare-fun tp!99629 () Bool)

(declare-fun b_and!46237 () Bool)

(assert (=> start!108658 (= tp!99629 b_and!46237)))

(declare-fun b!1282589 () Bool)

(declare-fun e!732843 () Bool)

(declare-fun tp_is_empty!33811 () Bool)

(assert (=> b!1282589 (= e!732843 tp_is_empty!33811)))

(declare-fun b!1282590 () Bool)

(declare-fun e!732841 () Bool)

(assert (=> b!1282590 (= e!732841 false)))

(declare-datatypes ((V!50185 0))(
  ( (V!50186 (val!16980 Int)) )
))
(declare-fun minValue!1387 () V!50185)

(declare-fun zeroValue!1387 () V!50185)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576553 () Bool)

(declare-datatypes ((ValueCell!16007 0))(
  ( (ValueCellFull!16007 (v!19582 V!50185)) (EmptyCell!16007) )
))
(declare-datatypes ((array!84692 0))(
  ( (array!84693 (arr!40848 (Array (_ BitVec 32) ValueCell!16007)) (size!41398 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84692)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84694 0))(
  ( (array!84695 (arr!40849 (Array (_ BitVec 32) (_ BitVec 64))) (size!41399 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84694)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!21744 0))(
  ( (tuple2!21745 (_1!10883 (_ BitVec 64)) (_2!10883 V!50185)) )
))
(declare-datatypes ((List!28941 0))(
  ( (Nil!28938) (Cons!28937 (h!30146 tuple2!21744) (t!42485 List!28941)) )
))
(declare-datatypes ((ListLongMap!19401 0))(
  ( (ListLongMap!19402 (toList!9716 List!28941)) )
))
(declare-fun contains!7833 (ListLongMap!19401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4800 (array!84694 array!84692 (_ BitVec 32) (_ BitVec 32) V!50185 V!50185 (_ BitVec 32) Int) ListLongMap!19401)

(assert (=> b!1282590 (= lt!576553 (contains!7833 (getCurrentListMap!4800 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1282591 () Bool)

(declare-fun e!732844 () Bool)

(declare-fun mapRes!52274 () Bool)

(assert (=> b!1282591 (= e!732844 (and e!732843 mapRes!52274))))

(declare-fun condMapEmpty!52274 () Bool)

(declare-fun mapDefault!52274 () ValueCell!16007)

