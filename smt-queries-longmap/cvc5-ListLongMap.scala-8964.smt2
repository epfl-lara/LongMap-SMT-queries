; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108510 () Bool)

(assert start!108510)

(declare-fun b_free!28057 () Bool)

(declare-fun b_next!28057 () Bool)

(assert (=> start!108510 (= b_free!28057 (not b_next!28057))))

(declare-fun tp!99281 () Bool)

(declare-fun b_and!46117 () Bool)

(assert (=> start!108510 (= tp!99281 b_and!46117)))

(declare-fun b!1280755 () Bool)

(declare-fun res!850756 () Bool)

(declare-fun e!731793 () Bool)

(assert (=> b!1280755 (=> (not res!850756) (not e!731793))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84470 0))(
  ( (array!84471 (arr!40739 (Array (_ BitVec 32) (_ BitVec 64))) (size!41289 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84470)

(assert (=> b!1280755 (= res!850756 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41289 _keys!1741)) (not (= (select (arr!40739 _keys!1741) from!2144) k!1205))))))

(declare-fun mapNonEmpty!52097 () Bool)

(declare-fun mapRes!52097 () Bool)

(declare-fun tp!99280 () Bool)

(declare-fun e!731792 () Bool)

(assert (=> mapNonEmpty!52097 (= mapRes!52097 (and tp!99280 e!731792))))

(declare-datatypes ((V!50033 0))(
  ( (V!50034 (val!16923 Int)) )
))
(declare-datatypes ((ValueCell!15950 0))(
  ( (ValueCellFull!15950 (v!19523 V!50033)) (EmptyCell!15950) )
))
(declare-fun mapRest!52097 () (Array (_ BitVec 32) ValueCell!15950))

(declare-fun mapValue!52097 () ValueCell!15950)

(declare-fun mapKey!52097 () (_ BitVec 32))

(declare-datatypes ((array!84472 0))(
  ( (array!84473 (arr!40740 (Array (_ BitVec 32) ValueCell!15950)) (size!41290 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84472)

(assert (=> mapNonEmpty!52097 (= (arr!40740 _values!1445) (store mapRest!52097 mapKey!52097 mapValue!52097))))

(declare-fun b!1280756 () Bool)

(assert (=> b!1280756 (= e!731793 (not true))))

(declare-fun minValue!1387 () V!50033)

(declare-fun zeroValue!1387 () V!50033)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21664 0))(
  ( (tuple2!21665 (_1!10843 (_ BitVec 64)) (_2!10843 V!50033)) )
))
(declare-datatypes ((List!28860 0))(
  ( (Nil!28857) (Cons!28856 (h!30065 tuple2!21664) (t!42400 List!28860)) )
))
(declare-datatypes ((ListLongMap!19321 0))(
  ( (ListLongMap!19322 (toList!9676 List!28860)) )
))
(declare-fun contains!7791 (ListLongMap!19321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4760 (array!84470 array!84472 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 32) Int) ListLongMap!19321)

(assert (=> b!1280756 (contains!7791 (getCurrentListMap!4760 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42409 0))(
  ( (Unit!42410) )
))
(declare-fun lt!576158 () Unit!42409)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!9 (array!84470 array!84472 (_ BitVec 32) (_ BitVec 32) V!50033 V!50033 (_ BitVec 64) (_ BitVec 32) Int) Unit!42409)

(assert (=> b!1280756 (= lt!576158 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!9 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280757 () Bool)

(declare-fun res!850760 () Bool)

(assert (=> b!1280757 (=> (not res!850760) (not e!731793))))

(assert (=> b!1280757 (= res!850760 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41289 _keys!1741))))))

(declare-fun b!1280758 () Bool)

(declare-fun e!731791 () Bool)

(declare-fun tp_is_empty!33697 () Bool)

(assert (=> b!1280758 (= e!731791 tp_is_empty!33697)))

(declare-fun mapIsEmpty!52097 () Bool)

(assert (=> mapIsEmpty!52097 mapRes!52097))

(declare-fun b!1280759 () Bool)

(declare-fun res!850759 () Bool)

(assert (=> b!1280759 (=> (not res!850759) (not e!731793))))

(assert (=> b!1280759 (= res!850759 (contains!7791 (getCurrentListMap!4760 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1280760 () Bool)

(declare-fun e!731795 () Bool)

(assert (=> b!1280760 (= e!731795 (and e!731791 mapRes!52097))))

(declare-fun condMapEmpty!52097 () Bool)

(declare-fun mapDefault!52097 () ValueCell!15950)

