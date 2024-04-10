; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108552 () Bool)

(assert start!108552)

(declare-fun b_free!28099 () Bool)

(declare-fun b_next!28099 () Bool)

(assert (=> start!108552 (= b_free!28099 (not b_next!28099))))

(declare-fun tp!99407 () Bool)

(declare-fun b_and!46159 () Bool)

(assert (=> start!108552 (= tp!99407 b_and!46159)))

(declare-fun b!1281387 () Bool)

(declare-fun res!851197 () Bool)

(declare-fun e!732111 () Bool)

(assert (=> b!1281387 (=> (not res!851197) (not e!732111))))

(declare-datatypes ((V!50089 0))(
  ( (V!50090 (val!16944 Int)) )
))
(declare-fun zeroValue!1387 () V!50089)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15971 0))(
  ( (ValueCellFull!15971 (v!19544 V!50089)) (EmptyCell!15971) )
))
(declare-datatypes ((array!84548 0))(
  ( (array!84549 (arr!40778 (Array (_ BitVec 32) ValueCell!15971)) (size!41328 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84548)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84550 0))(
  ( (array!84551 (arr!40779 (Array (_ BitVec 32) (_ BitVec 64))) (size!41329 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84550)

(declare-fun minValue!1387 () V!50089)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21694 0))(
  ( (tuple2!21695 (_1!10858 (_ BitVec 64)) (_2!10858 V!50089)) )
))
(declare-datatypes ((List!28888 0))(
  ( (Nil!28885) (Cons!28884 (h!30093 tuple2!21694) (t!42428 List!28888)) )
))
(declare-datatypes ((ListLongMap!19351 0))(
  ( (ListLongMap!19352 (toList!9691 List!28888)) )
))
(declare-fun contains!7806 (ListLongMap!19351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4775 (array!84550 array!84548 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 32) Int) ListLongMap!19351)

(assert (=> b!1281387 (= res!851197 (contains!7806 (getCurrentListMap!4775 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52160 () Bool)

(declare-fun mapRes!52160 () Bool)

(assert (=> mapIsEmpty!52160 mapRes!52160))

(declare-fun b!1281388 () Bool)

(declare-fun res!851198 () Bool)

(assert (=> b!1281388 (=> (not res!851198) (not e!732111))))

(declare-datatypes ((List!28889 0))(
  ( (Nil!28886) (Cons!28885 (h!30094 (_ BitVec 64)) (t!42429 List!28889)) )
))
(declare-fun arrayNoDuplicates!0 (array!84550 (_ BitVec 32) List!28889) Bool)

(assert (=> b!1281388 (= res!851198 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28886))))

(declare-fun b!1281389 () Bool)

(declare-fun e!732109 () Bool)

(declare-fun tp_is_empty!33739 () Bool)

(assert (=> b!1281389 (= e!732109 tp_is_empty!33739)))

(declare-fun res!851201 () Bool)

(assert (=> start!108552 (=> (not res!851201) (not e!732111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108552 (= res!851201 (validMask!0 mask!2175))))

(assert (=> start!108552 e!732111))

(assert (=> start!108552 tp_is_empty!33739))

(assert (=> start!108552 true))

(declare-fun e!732112 () Bool)

(declare-fun array_inv!30943 (array!84548) Bool)

(assert (=> start!108552 (and (array_inv!30943 _values!1445) e!732112)))

(declare-fun array_inv!30944 (array!84550) Bool)

(assert (=> start!108552 (array_inv!30944 _keys!1741)))

(assert (=> start!108552 tp!99407))

(declare-fun b!1281390 () Bool)

(declare-fun e!732113 () Bool)

(assert (=> b!1281390 (= e!732113 true)))

(declare-fun arrayContainsKey!0 (array!84550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1281390 (arrayContainsKey!0 _keys!1741 k!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-datatypes ((Unit!42439 0))(
  ( (Unit!42440) )
))
(declare-fun lt!576224 () Unit!42439)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!632 (array!84550 array!84548 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42439)

(assert (=> b!1281390 (= lt!576224 (lemmaListMapContainsThenArrayContainsFrom!632 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1281391 () Bool)

(declare-fun e!732110 () Bool)

(assert (=> b!1281391 (= e!732110 tp_is_empty!33739)))

(declare-fun b!1281392 () Bool)

(declare-fun res!851202 () Bool)

(assert (=> b!1281392 (=> (not res!851202) (not e!732111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84550 (_ BitVec 32)) Bool)

(assert (=> b!1281392 (= res!851202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281393 () Bool)

(declare-fun res!851199 () Bool)

(assert (=> b!1281393 (=> (not res!851199) (not e!732111))))

(assert (=> b!1281393 (= res!851199 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41329 _keys!1741))))))

(declare-fun mapNonEmpty!52160 () Bool)

(declare-fun tp!99406 () Bool)

(assert (=> mapNonEmpty!52160 (= mapRes!52160 (and tp!99406 e!732109))))

(declare-fun mapRest!52160 () (Array (_ BitVec 32) ValueCell!15971))

(declare-fun mapValue!52160 () ValueCell!15971)

(declare-fun mapKey!52160 () (_ BitVec 32))

(assert (=> mapNonEmpty!52160 (= (arr!40778 _values!1445) (store mapRest!52160 mapKey!52160 mapValue!52160))))

(declare-fun b!1281394 () Bool)

(declare-fun res!851200 () Bool)

(assert (=> b!1281394 (=> (not res!851200) (not e!732111))))

(assert (=> b!1281394 (= res!851200 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41329 _keys!1741)) (not (= (select (arr!40779 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1281395 () Bool)

(assert (=> b!1281395 (= e!732111 (not e!732113))))

(declare-fun res!851204 () Bool)

(assert (=> b!1281395 (=> res!851204 e!732113)))

(assert (=> b!1281395 (= res!851204 (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000))))

(assert (=> b!1281395 (contains!7806 (getCurrentListMap!4775 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-fun lt!576223 () Unit!42439)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!24 (array!84550 array!84548 (_ BitVec 32) (_ BitVec 32) V!50089 V!50089 (_ BitVec 64) (_ BitVec 32) Int) Unit!42439)

(assert (=> b!1281395 (= lt!576223 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!24 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281396 () Bool)

(assert (=> b!1281396 (= e!732112 (and e!732110 mapRes!52160))))

(declare-fun condMapEmpty!52160 () Bool)

(declare-fun mapDefault!52160 () ValueCell!15971)

