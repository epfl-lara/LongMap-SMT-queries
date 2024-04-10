; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108490 () Bool)

(assert start!108490)

(declare-fun b_free!28037 () Bool)

(declare-fun b_next!28037 () Bool)

(assert (=> start!108490 (= b_free!28037 (not b_next!28037))))

(declare-fun tp!99221 () Bool)

(declare-fun b_and!46097 () Bool)

(assert (=> start!108490 (= tp!99221 b_and!46097)))

(declare-fun b!1280457 () Bool)

(declare-fun e!731645 () Bool)

(assert (=> b!1280457 (= e!731645 false)))

(declare-datatypes ((V!50005 0))(
  ( (V!50006 (val!16913 Int)) )
))
(declare-fun minValue!1387 () V!50005)

(declare-fun zeroValue!1387 () V!50005)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576128 () Bool)

(declare-datatypes ((ValueCell!15940 0))(
  ( (ValueCellFull!15940 (v!19513 V!50005)) (EmptyCell!15940) )
))
(declare-datatypes ((array!84432 0))(
  ( (array!84433 (arr!40720 (Array (_ BitVec 32) ValueCell!15940)) (size!41270 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84432)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84434 0))(
  ( (array!84435 (arr!40721 (Array (_ BitVec 32) (_ BitVec 64))) (size!41271 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84434)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21646 0))(
  ( (tuple2!21647 (_1!10834 (_ BitVec 64)) (_2!10834 V!50005)) )
))
(declare-datatypes ((List!28844 0))(
  ( (Nil!28841) (Cons!28840 (h!30049 tuple2!21646) (t!42384 List!28844)) )
))
(declare-datatypes ((ListLongMap!19303 0))(
  ( (ListLongMap!19304 (toList!9667 List!28844)) )
))
(declare-fun contains!7782 (ListLongMap!19303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4751 (array!84434 array!84432 (_ BitVec 32) (_ BitVec 32) V!50005 V!50005 (_ BitVec 32) Int) ListLongMap!19303)

(assert (=> b!1280457 (= lt!576128 (contains!7782 (getCurrentListMap!4751 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280458 () Bool)

(declare-fun res!850548 () Bool)

(assert (=> b!1280458 (=> (not res!850548) (not e!731645))))

(declare-datatypes ((List!28845 0))(
  ( (Nil!28842) (Cons!28841 (h!30050 (_ BitVec 64)) (t!42385 List!28845)) )
))
(declare-fun arrayNoDuplicates!0 (array!84434 (_ BitVec 32) List!28845) Bool)

(assert (=> b!1280458 (= res!850548 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28842))))

(declare-fun mapNonEmpty!52067 () Bool)

(declare-fun mapRes!52067 () Bool)

(declare-fun tp!99220 () Bool)

(declare-fun e!731644 () Bool)

(assert (=> mapNonEmpty!52067 (= mapRes!52067 (and tp!99220 e!731644))))

(declare-fun mapRest!52067 () (Array (_ BitVec 32) ValueCell!15940))

(declare-fun mapValue!52067 () ValueCell!15940)

(declare-fun mapKey!52067 () (_ BitVec 32))

(assert (=> mapNonEmpty!52067 (= (arr!40720 _values!1445) (store mapRest!52067 mapKey!52067 mapValue!52067))))

(declare-fun b!1280459 () Bool)

(declare-fun res!850547 () Bool)

(assert (=> b!1280459 (=> (not res!850547) (not e!731645))))

(assert (=> b!1280459 (= res!850547 (and (= (size!41270 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41271 _keys!1741) (size!41270 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280460 () Bool)

(declare-fun res!850550 () Bool)

(assert (=> b!1280460 (=> (not res!850550) (not e!731645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84434 (_ BitVec 32)) Bool)

(assert (=> b!1280460 (= res!850550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280461 () Bool)

(declare-fun tp_is_empty!33677 () Bool)

(assert (=> b!1280461 (= e!731644 tp_is_empty!33677)))

(declare-fun b!1280462 () Bool)

(declare-fun res!850546 () Bool)

(assert (=> b!1280462 (=> (not res!850546) (not e!731645))))

(assert (=> b!1280462 (= res!850546 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41271 _keys!1741))))))

(declare-fun b!1280463 () Bool)

(declare-fun e!731643 () Bool)

(declare-fun e!731641 () Bool)

(assert (=> b!1280463 (= e!731643 (and e!731641 mapRes!52067))))

(declare-fun condMapEmpty!52067 () Bool)

(declare-fun mapDefault!52067 () ValueCell!15940)

