; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108778 () Bool)

(assert start!108778)

(declare-fun b_free!28291 () Bool)

(declare-fun b_next!28291 () Bool)

(assert (=> start!108778 (= b_free!28291 (not b_next!28291))))

(declare-fun tp!99989 () Bool)

(declare-fun b_and!46357 () Bool)

(assert (=> start!108778 (= tp!99989 b_and!46357)))

(declare-fun res!853326 () Bool)

(declare-fun e!733744 () Bool)

(assert (=> start!108778 (=> (not res!853326) (not e!733744))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108778 (= res!853326 (validMask!0 mask!2175))))

(assert (=> start!108778 e!733744))

(declare-fun tp_is_empty!33931 () Bool)

(assert (=> start!108778 tp_is_empty!33931))

(assert (=> start!108778 true))

(declare-datatypes ((V!50345 0))(
  ( (V!50346 (val!17040 Int)) )
))
(declare-datatypes ((ValueCell!16067 0))(
  ( (ValueCellFull!16067 (v!19642 V!50345)) (EmptyCell!16067) )
))
(declare-datatypes ((array!84920 0))(
  ( (array!84921 (arr!40962 (Array (_ BitVec 32) ValueCell!16067)) (size!41512 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84920)

(declare-fun e!733745 () Bool)

(declare-fun array_inv!31069 (array!84920) Bool)

(assert (=> start!108778 (and (array_inv!31069 _values!1445) e!733745)))

(declare-datatypes ((array!84922 0))(
  ( (array!84923 (arr!40963 (Array (_ BitVec 32) (_ BitVec 64))) (size!41513 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84922)

(declare-fun array_inv!31070 (array!84922) Bool)

(assert (=> start!108778 (array_inv!31070 _keys!1741)))

(assert (=> start!108778 tp!99989))

(declare-fun b!1284524 () Bool)

(declare-fun res!853322 () Bool)

(assert (=> b!1284524 (=> (not res!853322) (not e!733744))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284524 (= res!853322 (and (= (size!41512 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41513 _keys!1741) (size!41512 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284525 () Bool)

(declare-fun e!733742 () Bool)

(assert (=> b!1284525 (= e!733742 tp_is_empty!33931)))

(declare-fun b!1284526 () Bool)

(declare-fun res!853325 () Bool)

(assert (=> b!1284526 (=> (not res!853325) (not e!733744))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284526 (= res!853325 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41513 _keys!1741))))))

(declare-fun b!1284527 () Bool)

(declare-fun res!853323 () Bool)

(assert (=> b!1284527 (=> (not res!853323) (not e!733744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84922 (_ BitVec 32)) Bool)

(assert (=> b!1284527 (= res!853323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284528 () Bool)

(declare-fun res!853324 () Bool)

(assert (=> b!1284528 (=> (not res!853324) (not e!733744))))

(declare-datatypes ((List!29027 0))(
  ( (Nil!29024) (Cons!29023 (h!30232 (_ BitVec 64)) (t!42571 List!29027)) )
))
(declare-fun arrayNoDuplicates!0 (array!84922 (_ BitVec 32) List!29027) Bool)

(assert (=> b!1284528 (= res!853324 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29024))))

(declare-fun mapIsEmpty!52454 () Bool)

(declare-fun mapRes!52454 () Bool)

(assert (=> mapIsEmpty!52454 mapRes!52454))

(declare-fun mapNonEmpty!52454 () Bool)

(declare-fun tp!99988 () Bool)

(declare-fun e!733741 () Bool)

(assert (=> mapNonEmpty!52454 (= mapRes!52454 (and tp!99988 e!733741))))

(declare-fun mapValue!52454 () ValueCell!16067)

(declare-fun mapKey!52454 () (_ BitVec 32))

(declare-fun mapRest!52454 () (Array (_ BitVec 32) ValueCell!16067))

(assert (=> mapNonEmpty!52454 (= (arr!40962 _values!1445) (store mapRest!52454 mapKey!52454 mapValue!52454))))

(declare-fun b!1284529 () Bool)

(assert (=> b!1284529 (= e!733744 false)))

(declare-fun minValue!1387 () V!50345)

(declare-fun zeroValue!1387 () V!50345)

(declare-fun lt!576823 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21834 0))(
  ( (tuple2!21835 (_1!10928 (_ BitVec 64)) (_2!10928 V!50345)) )
))
(declare-datatypes ((List!29028 0))(
  ( (Nil!29025) (Cons!29024 (h!30233 tuple2!21834) (t!42572 List!29028)) )
))
(declare-datatypes ((ListLongMap!19491 0))(
  ( (ListLongMap!19492 (toList!9761 List!29028)) )
))
(declare-fun contains!7878 (ListLongMap!19491 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4840 (array!84922 array!84920 (_ BitVec 32) (_ BitVec 32) V!50345 V!50345 (_ BitVec 32) Int) ListLongMap!19491)

(assert (=> b!1284529 (= lt!576823 (contains!7878 (getCurrentListMap!4840 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284530 () Bool)

(assert (=> b!1284530 (= e!733741 tp_is_empty!33931)))

(declare-fun b!1284531 () Bool)

(assert (=> b!1284531 (= e!733745 (and e!733742 mapRes!52454))))

(declare-fun condMapEmpty!52454 () Bool)

(declare-fun mapDefault!52454 () ValueCell!16067)

