; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108602 () Bool)

(assert start!108602)

(declare-fun b_free!28129 () Bool)

(declare-fun b_next!28129 () Bool)

(assert (=> start!108602 (= b_free!28129 (not b_next!28129))))

(declare-fun tp!99499 () Bool)

(declare-fun b_and!46193 () Bool)

(assert (=> start!108602 (= tp!99499 b_and!46193)))

(declare-fun b!1281969 () Bool)

(declare-fun res!851565 () Bool)

(declare-fun e!732457 () Bool)

(assert (=> b!1281969 (=> (not res!851565) (not e!732457))))

(declare-datatypes ((array!84606 0))(
  ( (array!84607 (arr!40806 (Array (_ BitVec 32) (_ BitVec 64))) (size!41356 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84606)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84606 (_ BitVec 32)) Bool)

(assert (=> b!1281969 (= res!851565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281970 () Bool)

(declare-fun res!851562 () Bool)

(assert (=> b!1281970 (=> (not res!851562) (not e!732457))))

(declare-datatypes ((V!50129 0))(
  ( (V!50130 (val!16959 Int)) )
))
(declare-datatypes ((ValueCell!15986 0))(
  ( (ValueCellFull!15986 (v!19560 V!50129)) (EmptyCell!15986) )
))
(declare-datatypes ((array!84608 0))(
  ( (array!84609 (arr!40807 (Array (_ BitVec 32) ValueCell!15986)) (size!41357 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84608)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281970 (= res!851562 (and (= (size!41357 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41356 _keys!1741) (size!41357 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281971 () Bool)

(declare-fun e!732455 () Bool)

(declare-fun tp_is_empty!33769 () Bool)

(assert (=> b!1281971 (= e!732455 tp_is_empty!33769)))

(declare-fun b!1281972 () Bool)

(declare-fun res!851564 () Bool)

(assert (=> b!1281972 (=> (not res!851564) (not e!732457))))

(declare-fun minValue!1387 () V!50129)

(declare-fun zeroValue!1387 () V!50129)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21716 0))(
  ( (tuple2!21717 (_1!10869 (_ BitVec 64)) (_2!10869 V!50129)) )
))
(declare-datatypes ((List!28909 0))(
  ( (Nil!28906) (Cons!28905 (h!30114 tuple2!21716) (t!42451 List!28909)) )
))
(declare-datatypes ((ListLongMap!19373 0))(
  ( (ListLongMap!19374 (toList!9702 List!28909)) )
))
(declare-fun contains!7818 (ListLongMap!19373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4786 (array!84606 array!84608 (_ BitVec 32) (_ BitVec 32) V!50129 V!50129 (_ BitVec 32) Int) ListLongMap!19373)

(assert (=> b!1281972 (= res!851564 (contains!7818 (getCurrentListMap!4786 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!52208 () Bool)

(declare-fun mapRes!52208 () Bool)

(assert (=> mapIsEmpty!52208 mapRes!52208))

(declare-fun b!1281973 () Bool)

(declare-fun res!851560 () Bool)

(assert (=> b!1281973 (=> (not res!851560) (not e!732457))))

(declare-datatypes ((List!28910 0))(
  ( (Nil!28907) (Cons!28906 (h!30115 (_ BitVec 64)) (t!42452 List!28910)) )
))
(declare-fun arrayNoDuplicates!0 (array!84606 (_ BitVec 32) List!28910) Bool)

(assert (=> b!1281973 (= res!851560 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28907))))

(declare-fun res!851563 () Bool)

(assert (=> start!108602 (=> (not res!851563) (not e!732457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108602 (= res!851563 (validMask!0 mask!2175))))

(assert (=> start!108602 e!732457))

(assert (=> start!108602 tp_is_empty!33769))

(assert (=> start!108602 true))

(declare-fun e!732456 () Bool)

(declare-fun array_inv!30963 (array!84608) Bool)

(assert (=> start!108602 (and (array_inv!30963 _values!1445) e!732456)))

(declare-fun array_inv!30964 (array!84606) Bool)

(assert (=> start!108602 (array_inv!30964 _keys!1741)))

(assert (=> start!108602 tp!99499))

(declare-fun b!1281974 () Bool)

(declare-fun res!851561 () Bool)

(assert (=> b!1281974 (=> (not res!851561) (not e!732457))))

(assert (=> b!1281974 (= res!851561 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41356 _keys!1741))))))

(declare-fun b!1281975 () Bool)

(assert (=> b!1281975 (= e!732457 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41356 _keys!1741)) (= (select (arr!40806 _keys!1741) from!2144) k!1205) (bvsge (size!41356 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!52208 () Bool)

(declare-fun tp!99500 () Bool)

(declare-fun e!732454 () Bool)

(assert (=> mapNonEmpty!52208 (= mapRes!52208 (and tp!99500 e!732454))))

(declare-fun mapRest!52208 () (Array (_ BitVec 32) ValueCell!15986))

(declare-fun mapValue!52208 () ValueCell!15986)

(declare-fun mapKey!52208 () (_ BitVec 32))

(assert (=> mapNonEmpty!52208 (= (arr!40807 _values!1445) (store mapRest!52208 mapKey!52208 mapValue!52208))))

(declare-fun b!1281976 () Bool)

(assert (=> b!1281976 (= e!732454 tp_is_empty!33769)))

(declare-fun b!1281977 () Bool)

(assert (=> b!1281977 (= e!732456 (and e!732455 mapRes!52208))))

(declare-fun condMapEmpty!52208 () Bool)

(declare-fun mapDefault!52208 () ValueCell!15986)

