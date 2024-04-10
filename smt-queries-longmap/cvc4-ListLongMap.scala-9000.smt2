; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108764 () Bool)

(assert start!108764)

(declare-fun b_free!28277 () Bool)

(declare-fun b_next!28277 () Bool)

(assert (=> start!108764 (= b_free!28277 (not b_next!28277))))

(declare-fun tp!99947 () Bool)

(declare-fun b_and!46343 () Bool)

(assert (=> start!108764 (= tp!99947 b_and!46343)))

(declare-fun mapIsEmpty!52433 () Bool)

(declare-fun mapRes!52433 () Bool)

(assert (=> mapIsEmpty!52433 mapRes!52433))

(declare-fun b!1284356 () Bool)

(declare-fun res!853219 () Bool)

(declare-fun e!733638 () Bool)

(assert (=> b!1284356 (=> (not res!853219) (not e!733638))))

(declare-datatypes ((array!84892 0))(
  ( (array!84893 (arr!40948 (Array (_ BitVec 32) (_ BitVec 64))) (size!41498 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84892)

(declare-datatypes ((List!29016 0))(
  ( (Nil!29013) (Cons!29012 (h!30221 (_ BitVec 64)) (t!42560 List!29016)) )
))
(declare-fun arrayNoDuplicates!0 (array!84892 (_ BitVec 32) List!29016) Bool)

(assert (=> b!1284356 (= res!853219 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29013))))

(declare-fun b!1284357 () Bool)

(declare-fun e!733640 () Bool)

(declare-fun tp_is_empty!33917 () Bool)

(assert (=> b!1284357 (= e!733640 tp_is_empty!33917)))

(declare-fun b!1284358 () Bool)

(declare-fun e!733636 () Bool)

(assert (=> b!1284358 (= e!733636 tp_is_empty!33917)))

(declare-fun b!1284359 () Bool)

(declare-fun res!853218 () Bool)

(assert (=> b!1284359 (=> (not res!853218) (not e!733638))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284359 (= res!853218 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41498 _keys!1741))))))

(declare-fun mapNonEmpty!52433 () Bool)

(declare-fun tp!99946 () Bool)

(assert (=> mapNonEmpty!52433 (= mapRes!52433 (and tp!99946 e!733636))))

(declare-datatypes ((V!50325 0))(
  ( (V!50326 (val!17033 Int)) )
))
(declare-datatypes ((ValueCell!16060 0))(
  ( (ValueCellFull!16060 (v!19635 V!50325)) (EmptyCell!16060) )
))
(declare-fun mapRest!52433 () (Array (_ BitVec 32) ValueCell!16060))

(declare-datatypes ((array!84894 0))(
  ( (array!84895 (arr!40949 (Array (_ BitVec 32) ValueCell!16060)) (size!41499 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84894)

(declare-fun mapKey!52433 () (_ BitVec 32))

(declare-fun mapValue!52433 () ValueCell!16060)

(assert (=> mapNonEmpty!52433 (= (arr!40949 _values!1445) (store mapRest!52433 mapKey!52433 mapValue!52433))))

(declare-fun b!1284360 () Bool)

(declare-fun res!853220 () Bool)

(assert (=> b!1284360 (=> (not res!853220) (not e!733638))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284360 (= res!853220 (and (= (size!41499 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41498 _keys!1741) (size!41499 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284361 () Bool)

(assert (=> b!1284361 (= e!733638 false)))

(declare-fun minValue!1387 () V!50325)

(declare-fun zeroValue!1387 () V!50325)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576802 () Bool)

(declare-datatypes ((tuple2!21824 0))(
  ( (tuple2!21825 (_1!10923 (_ BitVec 64)) (_2!10923 V!50325)) )
))
(declare-datatypes ((List!29017 0))(
  ( (Nil!29014) (Cons!29013 (h!30222 tuple2!21824) (t!42561 List!29017)) )
))
(declare-datatypes ((ListLongMap!19481 0))(
  ( (ListLongMap!19482 (toList!9756 List!29017)) )
))
(declare-fun contains!7873 (ListLongMap!19481 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4835 (array!84892 array!84894 (_ BitVec 32) (_ BitVec 32) V!50325 V!50325 (_ BitVec 32) Int) ListLongMap!19481)

(assert (=> b!1284361 (= lt!576802 (contains!7873 (getCurrentListMap!4835 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284363 () Bool)

(declare-fun res!853217 () Bool)

(assert (=> b!1284363 (=> (not res!853217) (not e!733638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84892 (_ BitVec 32)) Bool)

(assert (=> b!1284363 (= res!853217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284362 () Bool)

(declare-fun e!733639 () Bool)

(assert (=> b!1284362 (= e!733639 (and e!733640 mapRes!52433))))

(declare-fun condMapEmpty!52433 () Bool)

(declare-fun mapDefault!52433 () ValueCell!16060)

