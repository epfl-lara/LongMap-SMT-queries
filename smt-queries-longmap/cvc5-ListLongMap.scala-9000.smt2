; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108760 () Bool)

(assert start!108760)

(declare-fun b_free!28273 () Bool)

(declare-fun b_next!28273 () Bool)

(assert (=> start!108760 (= b_free!28273 (not b_next!28273))))

(declare-fun tp!99935 () Bool)

(declare-fun b_and!46339 () Bool)

(assert (=> start!108760 (= tp!99935 b_and!46339)))

(declare-fun mapIsEmpty!52427 () Bool)

(declare-fun mapRes!52427 () Bool)

(assert (=> mapIsEmpty!52427 mapRes!52427))

(declare-fun b!1284308 () Bool)

(declare-fun e!733609 () Bool)

(assert (=> b!1284308 (= e!733609 false)))

(declare-datatypes ((V!50321 0))(
  ( (V!50322 (val!17031 Int)) )
))
(declare-fun minValue!1387 () V!50321)

(declare-fun zeroValue!1387 () V!50321)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576796 () Bool)

(declare-datatypes ((ValueCell!16058 0))(
  ( (ValueCellFull!16058 (v!19633 V!50321)) (EmptyCell!16058) )
))
(declare-datatypes ((array!84884 0))(
  ( (array!84885 (arr!40944 (Array (_ BitVec 32) ValueCell!16058)) (size!41494 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84884)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84886 0))(
  ( (array!84887 (arr!40945 (Array (_ BitVec 32) (_ BitVec 64))) (size!41495 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84886)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21820 0))(
  ( (tuple2!21821 (_1!10921 (_ BitVec 64)) (_2!10921 V!50321)) )
))
(declare-datatypes ((List!29013 0))(
  ( (Nil!29010) (Cons!29009 (h!30218 tuple2!21820) (t!42557 List!29013)) )
))
(declare-datatypes ((ListLongMap!19477 0))(
  ( (ListLongMap!19478 (toList!9754 List!29013)) )
))
(declare-fun contains!7871 (ListLongMap!19477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4833 (array!84886 array!84884 (_ BitVec 32) (_ BitVec 32) V!50321 V!50321 (_ BitVec 32) Int) ListLongMap!19477)

(assert (=> b!1284308 (= lt!576796 (contains!7871 (getCurrentListMap!4833 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!853189 () Bool)

(assert (=> start!108760 (=> (not res!853189) (not e!733609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108760 (= res!853189 (validMask!0 mask!2175))))

(assert (=> start!108760 e!733609))

(declare-fun tp_is_empty!33913 () Bool)

(assert (=> start!108760 tp_is_empty!33913))

(assert (=> start!108760 true))

(declare-fun e!733608 () Bool)

(declare-fun array_inv!31053 (array!84884) Bool)

(assert (=> start!108760 (and (array_inv!31053 _values!1445) e!733608)))

(declare-fun array_inv!31054 (array!84886) Bool)

(assert (=> start!108760 (array_inv!31054 _keys!1741)))

(assert (=> start!108760 tp!99935))

(declare-fun b!1284309 () Bool)

(declare-fun e!733610 () Bool)

(assert (=> b!1284309 (= e!733608 (and e!733610 mapRes!52427))))

(declare-fun condMapEmpty!52427 () Bool)

(declare-fun mapDefault!52427 () ValueCell!16058)

