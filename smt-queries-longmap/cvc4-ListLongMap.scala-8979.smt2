; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108638 () Bool)

(assert start!108638)

(declare-fun b_free!28151 () Bool)

(declare-fun b_next!28151 () Bool)

(assert (=> start!108638 (= b_free!28151 (not b_next!28151))))

(declare-fun tp!99569 () Bool)

(declare-fun b_and!46217 () Bool)

(assert (=> start!108638 (= tp!99569 b_and!46217)))

(declare-fun b!1282349 () Bool)

(declare-fun res!851780 () Bool)

(declare-fun e!732694 () Bool)

(assert (=> b!1282349 (=> (not res!851780) (not e!732694))))

(declare-datatypes ((array!84652 0))(
  ( (array!84653 (arr!40828 (Array (_ BitVec 32) (_ BitVec 64))) (size!41378 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84652)

(declare-datatypes ((List!28926 0))(
  ( (Nil!28923) (Cons!28922 (h!30131 (_ BitVec 64)) (t!42470 List!28926)) )
))
(declare-fun arrayNoDuplicates!0 (array!84652 (_ BitVec 32) List!28926) Bool)

(assert (=> b!1282349 (= res!851780 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28923))))

(declare-fun b!1282350 () Bool)

(declare-fun e!732692 () Bool)

(declare-fun tp_is_empty!33791 () Bool)

(assert (=> b!1282350 (= e!732692 tp_is_empty!33791)))

(declare-fun b!1282351 () Bool)

(assert (=> b!1282351 (= e!732694 false)))

(declare-datatypes ((V!50157 0))(
  ( (V!50158 (val!16970 Int)) )
))
(declare-fun minValue!1387 () V!50157)

(declare-fun zeroValue!1387 () V!50157)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun lt!576523 () Bool)

(declare-datatypes ((ValueCell!15997 0))(
  ( (ValueCellFull!15997 (v!19572 V!50157)) (EmptyCell!15997) )
))
(declare-datatypes ((array!84654 0))(
  ( (array!84655 (arr!40829 (Array (_ BitVec 32) ValueCell!15997)) (size!41379 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84654)

(declare-datatypes ((tuple2!21732 0))(
  ( (tuple2!21733 (_1!10877 (_ BitVec 64)) (_2!10877 V!50157)) )
))
(declare-datatypes ((List!28927 0))(
  ( (Nil!28924) (Cons!28923 (h!30132 tuple2!21732) (t!42471 List!28927)) )
))
(declare-datatypes ((ListLongMap!19389 0))(
  ( (ListLongMap!19390 (toList!9710 List!28927)) )
))
(declare-fun contains!7827 (ListLongMap!19389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4794 (array!84652 array!84654 (_ BitVec 32) (_ BitVec 32) V!50157 V!50157 (_ BitVec 32) Int) ListLongMap!19389)

(assert (=> b!1282351 (= lt!576523 (contains!7827 (getCurrentListMap!4794 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1282352 () Bool)

(declare-fun e!732691 () Bool)

(assert (=> b!1282352 (= e!732691 tp_is_empty!33791)))

(declare-fun b!1282354 () Bool)

(declare-fun res!851781 () Bool)

(assert (=> b!1282354 (=> (not res!851781) (not e!732694))))

(assert (=> b!1282354 (= res!851781 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41378 _keys!1741))))))

(declare-fun mapNonEmpty!52244 () Bool)

(declare-fun mapRes!52244 () Bool)

(declare-fun tp!99568 () Bool)

(assert (=> mapNonEmpty!52244 (= mapRes!52244 (and tp!99568 e!732692))))

(declare-fun mapRest!52244 () (Array (_ BitVec 32) ValueCell!15997))

(declare-fun mapKey!52244 () (_ BitVec 32))

(declare-fun mapValue!52244 () ValueCell!15997)

(assert (=> mapNonEmpty!52244 (= (arr!40829 _values!1445) (store mapRest!52244 mapKey!52244 mapValue!52244))))

(declare-fun mapIsEmpty!52244 () Bool)

(assert (=> mapIsEmpty!52244 mapRes!52244))

(declare-fun b!1282353 () Bool)

(declare-fun res!851777 () Bool)

(assert (=> b!1282353 (=> (not res!851777) (not e!732694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84652 (_ BitVec 32)) Bool)

(assert (=> b!1282353 (= res!851777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!851778 () Bool)

(assert (=> start!108638 (=> (not res!851778) (not e!732694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108638 (= res!851778 (validMask!0 mask!2175))))

(assert (=> start!108638 e!732694))

(assert (=> start!108638 tp_is_empty!33791))

(assert (=> start!108638 true))

(declare-fun e!732693 () Bool)

(declare-fun array_inv!30977 (array!84654) Bool)

(assert (=> start!108638 (and (array_inv!30977 _values!1445) e!732693)))

(declare-fun array_inv!30978 (array!84652) Bool)

(assert (=> start!108638 (array_inv!30978 _keys!1741)))

(assert (=> start!108638 tp!99569))

(declare-fun b!1282355 () Bool)

(declare-fun res!851779 () Bool)

(assert (=> b!1282355 (=> (not res!851779) (not e!732694))))

(assert (=> b!1282355 (= res!851779 (and (= (size!41379 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41378 _keys!1741) (size!41379 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1282356 () Bool)

(assert (=> b!1282356 (= e!732693 (and e!732691 mapRes!52244))))

(declare-fun condMapEmpty!52244 () Bool)

(declare-fun mapDefault!52244 () ValueCell!15997)

