; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108600 () Bool)

(assert start!108600)

(declare-fun b_free!28127 () Bool)

(declare-fun b_next!28127 () Bool)

(assert (=> start!108600 (= b_free!28127 (not b_next!28127))))

(declare-fun tp!99494 () Bool)

(declare-fun b_and!46191 () Bool)

(assert (=> start!108600 (= tp!99494 b_and!46191)))

(declare-fun res!851546 () Bool)

(declare-fun e!732440 () Bool)

(assert (=> start!108600 (=> (not res!851546) (not e!732440))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108600 (= res!851546 (validMask!0 mask!2175))))

(assert (=> start!108600 e!732440))

(declare-fun tp_is_empty!33767 () Bool)

(assert (=> start!108600 tp_is_empty!33767))

(assert (=> start!108600 true))

(declare-datatypes ((V!50125 0))(
  ( (V!50126 (val!16958 Int)) )
))
(declare-datatypes ((ValueCell!15985 0))(
  ( (ValueCellFull!15985 (v!19559 V!50125)) (EmptyCell!15985) )
))
(declare-datatypes ((array!84602 0))(
  ( (array!84603 (arr!40804 (Array (_ BitVec 32) ValueCell!15985)) (size!41354 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84602)

(declare-fun e!732442 () Bool)

(declare-fun array_inv!30961 (array!84602) Bool)

(assert (=> start!108600 (and (array_inv!30961 _values!1445) e!732442)))

(declare-datatypes ((array!84604 0))(
  ( (array!84605 (arr!40805 (Array (_ BitVec 32) (_ BitVec 64))) (size!41355 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84604)

(declare-fun array_inv!30962 (array!84604) Bool)

(assert (=> start!108600 (array_inv!30962 _keys!1741)))

(assert (=> start!108600 tp!99494))

(declare-fun b!1281943 () Bool)

(declare-fun e!732439 () Bool)

(assert (=> b!1281943 (= e!732439 tp_is_empty!33767)))

(declare-fun b!1281944 () Bool)

(declare-fun res!851544 () Bool)

(assert (=> b!1281944 (=> (not res!851544) (not e!732440))))

(declare-datatypes ((List!28908 0))(
  ( (Nil!28905) (Cons!28904 (h!30113 (_ BitVec 64)) (t!42450 List!28908)) )
))
(declare-fun arrayNoDuplicates!0 (array!84604 (_ BitVec 32) List!28908) Bool)

(assert (=> b!1281944 (= res!851544 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28905))))

(declare-fun b!1281945 () Bool)

(declare-fun res!851543 () Bool)

(assert (=> b!1281945 (=> (not res!851543) (not e!732440))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281945 (= res!851543 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41355 _keys!1741))))))

(declare-fun b!1281946 () Bool)

(declare-fun mapRes!52205 () Bool)

(assert (=> b!1281946 (= e!732442 (and e!732439 mapRes!52205))))

(declare-fun condMapEmpty!52205 () Bool)

(declare-fun mapDefault!52205 () ValueCell!15985)

