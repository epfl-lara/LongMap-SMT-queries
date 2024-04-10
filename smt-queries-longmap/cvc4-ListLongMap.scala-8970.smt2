; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108550 () Bool)

(assert start!108550)

(declare-fun b_free!28097 () Bool)

(declare-fun b_next!28097 () Bool)

(assert (=> start!108550 (= b_free!28097 (not b_next!28097))))

(declare-fun tp!99401 () Bool)

(declare-fun b_and!46157 () Bool)

(assert (=> start!108550 (= tp!99401 b_and!46157)))

(declare-fun b!1281355 () Bool)

(declare-fun e!732091 () Bool)

(declare-fun tp_is_empty!33737 () Bool)

(assert (=> b!1281355 (= e!732091 tp_is_empty!33737)))

(declare-fun b!1281356 () Bool)

(declare-fun res!851180 () Bool)

(declare-fun e!732092 () Bool)

(assert (=> b!1281356 (=> (not res!851180) (not e!732092))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84544 0))(
  ( (array!84545 (arr!40776 (Array (_ BitVec 32) (_ BitVec 64))) (size!41326 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84544)

(assert (=> b!1281356 (= res!851180 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41326 _keys!1741)) (not (= (select (arr!40776 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1281357 () Bool)

(declare-fun res!851175 () Bool)

(assert (=> b!1281357 (=> (not res!851175) (not e!732092))))

(assert (=> b!1281357 (= res!851175 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41326 _keys!1741))))))

(declare-fun b!1281358 () Bool)

(declare-fun res!851179 () Bool)

(assert (=> b!1281358 (=> (not res!851179) (not e!732092))))

(declare-datatypes ((V!50085 0))(
  ( (V!50086 (val!16943 Int)) )
))
(declare-fun minValue!1387 () V!50085)

(declare-fun zeroValue!1387 () V!50085)

(declare-datatypes ((ValueCell!15970 0))(
  ( (ValueCellFull!15970 (v!19543 V!50085)) (EmptyCell!15970) )
))
(declare-datatypes ((array!84546 0))(
  ( (array!84547 (arr!40777 (Array (_ BitVec 32) ValueCell!15970)) (size!41327 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84546)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21692 0))(
  ( (tuple2!21693 (_1!10857 (_ BitVec 64)) (_2!10857 V!50085)) )
))
(declare-datatypes ((List!28886 0))(
  ( (Nil!28883) (Cons!28882 (h!30091 tuple2!21692) (t!42426 List!28886)) )
))
(declare-datatypes ((ListLongMap!19349 0))(
  ( (ListLongMap!19350 (toList!9690 List!28886)) )
))
(declare-fun contains!7805 (ListLongMap!19349 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4774 (array!84544 array!84546 (_ BitVec 32) (_ BitVec 32) V!50085 V!50085 (_ BitVec 32) Int) ListLongMap!19349)

(assert (=> b!1281358 (= res!851179 (contains!7805 (getCurrentListMap!4774 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1281359 () Bool)

(declare-fun e!732093 () Bool)

(assert (=> b!1281359 (= e!732093 tp_is_empty!33737)))

(declare-fun b!1281360 () Bool)

(assert (=> b!1281360 (= e!732092 (not true))))

(assert (=> b!1281360 (contains!7805 (getCurrentListMap!4774 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42437 0))(
  ( (Unit!42438) )
))
(declare-fun lt!576218 () Unit!42437)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!23 (array!84544 array!84546 (_ BitVec 32) (_ BitVec 32) V!50085 V!50085 (_ BitVec 64) (_ BitVec 32) Int) Unit!42437)

(assert (=> b!1281360 (= lt!576218 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!23 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun mapNonEmpty!52157 () Bool)

(declare-fun mapRes!52157 () Bool)

(declare-fun tp!99400 () Bool)

(assert (=> mapNonEmpty!52157 (= mapRes!52157 (and tp!99400 e!732093))))

(declare-fun mapKey!52157 () (_ BitVec 32))

(declare-fun mapRest!52157 () (Array (_ BitVec 32) ValueCell!15970))

(declare-fun mapValue!52157 () ValueCell!15970)

(assert (=> mapNonEmpty!52157 (= (arr!40777 _values!1445) (store mapRest!52157 mapKey!52157 mapValue!52157))))

(declare-fun mapIsEmpty!52157 () Bool)

(assert (=> mapIsEmpty!52157 mapRes!52157))

(declare-fun b!1281361 () Bool)

(declare-fun res!851177 () Bool)

(assert (=> b!1281361 (=> (not res!851177) (not e!732092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84544 (_ BitVec 32)) Bool)

(assert (=> b!1281361 (= res!851177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851178 () Bool)

(assert (=> start!108550 (=> (not res!851178) (not e!732092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108550 (= res!851178 (validMask!0 mask!2175))))

(assert (=> start!108550 e!732092))

(assert (=> start!108550 tp_is_empty!33737))

(assert (=> start!108550 true))

(declare-fun e!732094 () Bool)

(declare-fun array_inv!30941 (array!84546) Bool)

(assert (=> start!108550 (and (array_inv!30941 _values!1445) e!732094)))

(declare-fun array_inv!30942 (array!84544) Bool)

(assert (=> start!108550 (array_inv!30942 _keys!1741)))

(assert (=> start!108550 tp!99401))

(declare-fun b!1281362 () Bool)

(declare-fun res!851174 () Bool)

(assert (=> b!1281362 (=> (not res!851174) (not e!732092))))

(declare-datatypes ((List!28887 0))(
  ( (Nil!28884) (Cons!28883 (h!30092 (_ BitVec 64)) (t!42427 List!28887)) )
))
(declare-fun arrayNoDuplicates!0 (array!84544 (_ BitVec 32) List!28887) Bool)

(assert (=> b!1281362 (= res!851174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28884))))

(declare-fun b!1281363 () Bool)

(declare-fun res!851176 () Bool)

(assert (=> b!1281363 (=> (not res!851176) (not e!732092))))

(assert (=> b!1281363 (= res!851176 (and (= (size!41327 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41326 _keys!1741) (size!41327 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281364 () Bool)

(assert (=> b!1281364 (= e!732094 (and e!732091 mapRes!52157))))

(declare-fun condMapEmpty!52157 () Bool)

(declare-fun mapDefault!52157 () ValueCell!15970)

