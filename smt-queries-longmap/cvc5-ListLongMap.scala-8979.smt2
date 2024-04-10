; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108634 () Bool)

(assert start!108634)

(declare-fun b_free!28147 () Bool)

(declare-fun b_next!28147 () Bool)

(assert (=> start!108634 (= b_free!28147 (not b_next!28147))))

(declare-fun tp!99556 () Bool)

(declare-fun b_and!46213 () Bool)

(assert (=> start!108634 (= tp!99556 b_and!46213)))

(declare-fun res!851747 () Bool)

(declare-fun e!732664 () Bool)

(assert (=> start!108634 (=> (not res!851747) (not e!732664))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108634 (= res!851747 (validMask!0 mask!2175))))

(assert (=> start!108634 e!732664))

(declare-fun tp_is_empty!33787 () Bool)

(assert (=> start!108634 tp_is_empty!33787))

(assert (=> start!108634 true))

(declare-datatypes ((V!50153 0))(
  ( (V!50154 (val!16968 Int)) )
))
(declare-datatypes ((ValueCell!15995 0))(
  ( (ValueCellFull!15995 (v!19570 V!50153)) (EmptyCell!15995) )
))
(declare-datatypes ((array!84644 0))(
  ( (array!84645 (arr!40824 (Array (_ BitVec 32) ValueCell!15995)) (size!41374 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84644)

(declare-fun e!732665 () Bool)

(declare-fun array_inv!30973 (array!84644) Bool)

(assert (=> start!108634 (and (array_inv!30973 _values!1445) e!732665)))

(declare-datatypes ((array!84646 0))(
  ( (array!84647 (arr!40825 (Array (_ BitVec 32) (_ BitVec 64))) (size!41375 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84646)

(declare-fun array_inv!30974 (array!84646) Bool)

(assert (=> start!108634 (array_inv!30974 _keys!1741)))

(assert (=> start!108634 tp!99556))

(declare-fun b!1282301 () Bool)

(declare-fun res!851751 () Bool)

(assert (=> b!1282301 (=> (not res!851751) (not e!732664))))

(declare-datatypes ((List!28922 0))(
  ( (Nil!28919) (Cons!28918 (h!30127 (_ BitVec 64)) (t!42466 List!28922)) )
))
(declare-fun arrayNoDuplicates!0 (array!84646 (_ BitVec 32) List!28922) Bool)

(assert (=> b!1282301 (= res!851751 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28919))))

(declare-fun b!1282302 () Bool)

(declare-fun res!851750 () Bool)

(assert (=> b!1282302 (=> (not res!851750) (not e!732664))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1282302 (= res!851750 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41375 _keys!1741))))))

(declare-fun b!1282303 () Bool)

(assert (=> b!1282303 (= e!732664 false)))

(declare-fun minValue!1387 () V!50153)

(declare-fun zeroValue!1387 () V!50153)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun lt!576517 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21728 0))(
  ( (tuple2!21729 (_1!10875 (_ BitVec 64)) (_2!10875 V!50153)) )
))
(declare-datatypes ((List!28923 0))(
  ( (Nil!28920) (Cons!28919 (h!30128 tuple2!21728) (t!42467 List!28923)) )
))
(declare-datatypes ((ListLongMap!19385 0))(
  ( (ListLongMap!19386 (toList!9708 List!28923)) )
))
(declare-fun contains!7825 (ListLongMap!19385 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4792 (array!84646 array!84644 (_ BitVec 32) (_ BitVec 32) V!50153 V!50153 (_ BitVec 32) Int) ListLongMap!19385)

(assert (=> b!1282303 (= lt!576517 (contains!7825 (getCurrentListMap!4792 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1282304 () Bool)

(declare-fun e!732663 () Bool)

(assert (=> b!1282304 (= e!732663 tp_is_empty!33787)))

(declare-fun mapNonEmpty!52238 () Bool)

(declare-fun mapRes!52238 () Bool)

(declare-fun tp!99557 () Bool)

(declare-fun e!732661 () Bool)

(assert (=> mapNonEmpty!52238 (= mapRes!52238 (and tp!99557 e!732661))))

(declare-fun mapKey!52238 () (_ BitVec 32))

(declare-fun mapRest!52238 () (Array (_ BitVec 32) ValueCell!15995))

(declare-fun mapValue!52238 () ValueCell!15995)

(assert (=> mapNonEmpty!52238 (= (arr!40824 _values!1445) (store mapRest!52238 mapKey!52238 mapValue!52238))))

(declare-fun b!1282305 () Bool)

(declare-fun res!851749 () Bool)

(assert (=> b!1282305 (=> (not res!851749) (not e!732664))))

(assert (=> b!1282305 (= res!851749 (and (= (size!41374 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41375 _keys!1741) (size!41374 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282306 () Bool)

(declare-fun res!851748 () Bool)

(assert (=> b!1282306 (=> (not res!851748) (not e!732664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84646 (_ BitVec 32)) Bool)

(assert (=> b!1282306 (= res!851748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1282307 () Bool)

(assert (=> b!1282307 (= e!732665 (and e!732663 mapRes!52238))))

(declare-fun condMapEmpty!52238 () Bool)

(declare-fun mapDefault!52238 () ValueCell!15995)

