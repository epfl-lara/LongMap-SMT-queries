; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108462 () Bool)

(assert start!108462)

(declare-fun b_free!28009 () Bool)

(declare-fun b_next!28009 () Bool)

(assert (=> start!108462 (= b_free!28009 (not b_next!28009))))

(declare-fun tp!99137 () Bool)

(declare-fun b_and!46069 () Bool)

(assert (=> start!108462 (= tp!99137 b_and!46069)))

(declare-fun b!1280121 () Bool)

(declare-fun res!850337 () Bool)

(declare-fun e!731435 () Bool)

(assert (=> b!1280121 (=> (not res!850337) (not e!731435))))

(declare-datatypes ((array!84378 0))(
  ( (array!84379 (arr!40693 (Array (_ BitVec 32) (_ BitVec 64))) (size!41243 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84378)

(declare-datatypes ((List!28825 0))(
  ( (Nil!28822) (Cons!28821 (h!30030 (_ BitVec 64)) (t!42365 List!28825)) )
))
(declare-fun arrayNoDuplicates!0 (array!84378 (_ BitVec 32) List!28825) Bool)

(assert (=> b!1280121 (= res!850337 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28822))))

(declare-fun b!1280122 () Bool)

(declare-fun res!850340 () Bool)

(assert (=> b!1280122 (=> (not res!850340) (not e!731435))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84378 (_ BitVec 32)) Bool)

(assert (=> b!1280122 (= res!850340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280123 () Bool)

(declare-fun res!850338 () Bool)

(assert (=> b!1280123 (=> (not res!850338) (not e!731435))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280123 (= res!850338 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41243 _keys!1741))))))

(declare-fun res!850339 () Bool)

(assert (=> start!108462 (=> (not res!850339) (not e!731435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108462 (= res!850339 (validMask!0 mask!2175))))

(assert (=> start!108462 e!731435))

(declare-fun tp_is_empty!33649 () Bool)

(assert (=> start!108462 tp_is_empty!33649))

(assert (=> start!108462 true))

(declare-datatypes ((V!49969 0))(
  ( (V!49970 (val!16899 Int)) )
))
(declare-datatypes ((ValueCell!15926 0))(
  ( (ValueCellFull!15926 (v!19499 V!49969)) (EmptyCell!15926) )
))
(declare-datatypes ((array!84380 0))(
  ( (array!84381 (arr!40694 (Array (_ BitVec 32) ValueCell!15926)) (size!41244 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84380)

(declare-fun e!731434 () Bool)

(declare-fun array_inv!30887 (array!84380) Bool)

(assert (=> start!108462 (and (array_inv!30887 _values!1445) e!731434)))

(declare-fun array_inv!30888 (array!84378) Bool)

(assert (=> start!108462 (array_inv!30888 _keys!1741)))

(assert (=> start!108462 tp!99137))

(declare-fun b!1280124 () Bool)

(assert (=> b!1280124 (= e!731435 false)))

(declare-fun minValue!1387 () V!49969)

(declare-fun zeroValue!1387 () V!49969)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576086 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21626 0))(
  ( (tuple2!21627 (_1!10824 (_ BitVec 64)) (_2!10824 V!49969)) )
))
(declare-datatypes ((List!28826 0))(
  ( (Nil!28823) (Cons!28822 (h!30031 tuple2!21626) (t!42366 List!28826)) )
))
(declare-datatypes ((ListLongMap!19283 0))(
  ( (ListLongMap!19284 (toList!9657 List!28826)) )
))
(declare-fun contains!7772 (ListLongMap!19283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4741 (array!84378 array!84380 (_ BitVec 32) (_ BitVec 32) V!49969 V!49969 (_ BitVec 32) Int) ListLongMap!19283)

(assert (=> b!1280124 (= lt!576086 (contains!7772 (getCurrentListMap!4741 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280125 () Bool)

(declare-fun res!850336 () Bool)

(assert (=> b!1280125 (=> (not res!850336) (not e!731435))))

(assert (=> b!1280125 (= res!850336 (and (= (size!41244 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41243 _keys!1741) (size!41244 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280126 () Bool)

(declare-fun e!731432 () Bool)

(declare-fun mapRes!52025 () Bool)

(assert (=> b!1280126 (= e!731434 (and e!731432 mapRes!52025))))

(declare-fun condMapEmpty!52025 () Bool)

(declare-fun mapDefault!52025 () ValueCell!15926)

