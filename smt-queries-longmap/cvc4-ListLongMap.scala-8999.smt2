; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108758 () Bool)

(assert start!108758)

(declare-fun b_free!28271 () Bool)

(declare-fun b_next!28271 () Bool)

(assert (=> start!108758 (= b_free!28271 (not b_next!28271))))

(declare-fun tp!99928 () Bool)

(declare-fun b_and!46337 () Bool)

(assert (=> start!108758 (= tp!99928 b_and!46337)))

(declare-fun b!1284284 () Bool)

(declare-fun res!853172 () Bool)

(declare-fun e!733594 () Bool)

(assert (=> b!1284284 (=> (not res!853172) (not e!733594))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84880 0))(
  ( (array!84881 (arr!40942 (Array (_ BitVec 32) (_ BitVec 64))) (size!41492 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84880)

(assert (=> b!1284284 (= res!853172 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41492 _keys!1741))))))

(declare-fun mapNonEmpty!52424 () Bool)

(declare-fun mapRes!52424 () Bool)

(declare-fun tp!99929 () Bool)

(declare-fun e!733595 () Bool)

(assert (=> mapNonEmpty!52424 (= mapRes!52424 (and tp!99929 e!733595))))

(declare-datatypes ((V!50317 0))(
  ( (V!50318 (val!17030 Int)) )
))
(declare-datatypes ((ValueCell!16057 0))(
  ( (ValueCellFull!16057 (v!19632 V!50317)) (EmptyCell!16057) )
))
(declare-fun mapRest!52424 () (Array (_ BitVec 32) ValueCell!16057))

(declare-fun mapKey!52424 () (_ BitVec 32))

(declare-datatypes ((array!84882 0))(
  ( (array!84883 (arr!40943 (Array (_ BitVec 32) ValueCell!16057)) (size!41493 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84882)

(declare-fun mapValue!52424 () ValueCell!16057)

(assert (=> mapNonEmpty!52424 (= (arr!40943 _values!1445) (store mapRest!52424 mapKey!52424 mapValue!52424))))

(declare-fun b!1284285 () Bool)

(assert (=> b!1284285 (= e!733594 false)))

(declare-fun minValue!1387 () V!50317)

(declare-fun zeroValue!1387 () V!50317)

(declare-fun lt!576793 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21818 0))(
  ( (tuple2!21819 (_1!10920 (_ BitVec 64)) (_2!10920 V!50317)) )
))
(declare-datatypes ((List!29011 0))(
  ( (Nil!29008) (Cons!29007 (h!30216 tuple2!21818) (t!42555 List!29011)) )
))
(declare-datatypes ((ListLongMap!19475 0))(
  ( (ListLongMap!19476 (toList!9753 List!29011)) )
))
(declare-fun contains!7870 (ListLongMap!19475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4832 (array!84880 array!84882 (_ BitVec 32) (_ BitVec 32) V!50317 V!50317 (_ BitVec 32) Int) ListLongMap!19475)

(assert (=> b!1284285 (= lt!576793 (contains!7870 (getCurrentListMap!4832 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!853176 () Bool)

(assert (=> start!108758 (=> (not res!853176) (not e!733594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108758 (= res!853176 (validMask!0 mask!2175))))

(assert (=> start!108758 e!733594))

(declare-fun tp_is_empty!33911 () Bool)

(assert (=> start!108758 tp_is_empty!33911))

(assert (=> start!108758 true))

(declare-fun e!733591 () Bool)

(declare-fun array_inv!31051 (array!84882) Bool)

(assert (=> start!108758 (and (array_inv!31051 _values!1445) e!733591)))

(declare-fun array_inv!31052 (array!84880) Bool)

(assert (=> start!108758 (array_inv!31052 _keys!1741)))

(assert (=> start!108758 tp!99928))

(declare-fun mapIsEmpty!52424 () Bool)

(assert (=> mapIsEmpty!52424 mapRes!52424))

(declare-fun b!1284286 () Bool)

(assert (=> b!1284286 (= e!733595 tp_is_empty!33911)))

(declare-fun b!1284287 () Bool)

(declare-fun res!853174 () Bool)

(assert (=> b!1284287 (=> (not res!853174) (not e!733594))))

(declare-datatypes ((List!29012 0))(
  ( (Nil!29009) (Cons!29008 (h!30217 (_ BitVec 64)) (t!42556 List!29012)) )
))
(declare-fun arrayNoDuplicates!0 (array!84880 (_ BitVec 32) List!29012) Bool)

(assert (=> b!1284287 (= res!853174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29009))))

(declare-fun b!1284288 () Bool)

(declare-fun e!733593 () Bool)

(assert (=> b!1284288 (= e!733593 tp_is_empty!33911)))

(declare-fun b!1284289 () Bool)

(assert (=> b!1284289 (= e!733591 (and e!733593 mapRes!52424))))

(declare-fun condMapEmpty!52424 () Bool)

(declare-fun mapDefault!52424 () ValueCell!16057)

