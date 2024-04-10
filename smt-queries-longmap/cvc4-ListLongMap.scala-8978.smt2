; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108632 () Bool)

(assert start!108632)

(declare-fun b_free!28145 () Bool)

(declare-fun b_next!28145 () Bool)

(assert (=> start!108632 (= b_free!28145 (not b_next!28145))))

(declare-fun tp!99550 () Bool)

(declare-fun b_and!46211 () Bool)

(assert (=> start!108632 (= tp!99550 b_and!46211)))

(declare-fun b!1282277 () Bool)

(declare-fun res!851732 () Bool)

(declare-fun e!732650 () Bool)

(assert (=> b!1282277 (=> (not res!851732) (not e!732650))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84640 0))(
  ( (array!84641 (arr!40822 (Array (_ BitVec 32) (_ BitVec 64))) (size!41372 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84640)

(assert (=> b!1282277 (= res!851732 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41372 _keys!1741))))))

(declare-fun b!1282278 () Bool)

(assert (=> b!1282278 (= e!732650 false)))

(declare-datatypes ((V!50149 0))(
  ( (V!50150 (val!16967 Int)) )
))
(declare-fun minValue!1387 () V!50149)

(declare-fun zeroValue!1387 () V!50149)

(declare-datatypes ((ValueCell!15994 0))(
  ( (ValueCellFull!15994 (v!19569 V!50149)) (EmptyCell!15994) )
))
(declare-datatypes ((array!84642 0))(
  ( (array!84643 (arr!40823 (Array (_ BitVec 32) ValueCell!15994)) (size!41373 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84642)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!576514 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21726 0))(
  ( (tuple2!21727 (_1!10874 (_ BitVec 64)) (_2!10874 V!50149)) )
))
(declare-datatypes ((List!28920 0))(
  ( (Nil!28917) (Cons!28916 (h!30125 tuple2!21726) (t!42464 List!28920)) )
))
(declare-datatypes ((ListLongMap!19383 0))(
  ( (ListLongMap!19384 (toList!9707 List!28920)) )
))
(declare-fun contains!7824 (ListLongMap!19383 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4791 (array!84640 array!84642 (_ BitVec 32) (_ BitVec 32) V!50149 V!50149 (_ BitVec 32) Int) ListLongMap!19383)

(assert (=> b!1282278 (= lt!576514 (contains!7824 (getCurrentListMap!4791 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52235 () Bool)

(declare-fun mapRes!52235 () Bool)

(declare-fun tp!99551 () Bool)

(declare-fun e!732648 () Bool)

(assert (=> mapNonEmpty!52235 (= mapRes!52235 (and tp!99551 e!732648))))

(declare-fun mapRest!52235 () (Array (_ BitVec 32) ValueCell!15994))

(declare-fun mapKey!52235 () (_ BitVec 32))

(declare-fun mapValue!52235 () ValueCell!15994)

(assert (=> mapNonEmpty!52235 (= (arr!40823 _values!1445) (store mapRest!52235 mapKey!52235 mapValue!52235))))

(declare-fun b!1282279 () Bool)

(declare-fun res!851736 () Bool)

(assert (=> b!1282279 (=> (not res!851736) (not e!732650))))

(declare-datatypes ((List!28921 0))(
  ( (Nil!28918) (Cons!28917 (h!30126 (_ BitVec 64)) (t!42465 List!28921)) )
))
(declare-fun arrayNoDuplicates!0 (array!84640 (_ BitVec 32) List!28921) Bool)

(assert (=> b!1282279 (= res!851736 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28918))))

(declare-fun b!1282280 () Bool)

(declare-fun res!851733 () Bool)

(assert (=> b!1282280 (=> (not res!851733) (not e!732650))))

(assert (=> b!1282280 (= res!851733 (and (= (size!41373 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41372 _keys!1741) (size!41373 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!851735 () Bool)

(assert (=> start!108632 (=> (not res!851735) (not e!732650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108632 (= res!851735 (validMask!0 mask!2175))))

(assert (=> start!108632 e!732650))

(declare-fun tp_is_empty!33785 () Bool)

(assert (=> start!108632 tp_is_empty!33785))

(assert (=> start!108632 true))

(declare-fun e!732646 () Bool)

(declare-fun array_inv!30971 (array!84642) Bool)

(assert (=> start!108632 (and (array_inv!30971 _values!1445) e!732646)))

(declare-fun array_inv!30972 (array!84640) Bool)

(assert (=> start!108632 (array_inv!30972 _keys!1741)))

(assert (=> start!108632 tp!99550))

(declare-fun b!1282281 () Bool)

(assert (=> b!1282281 (= e!732648 tp_is_empty!33785)))

(declare-fun b!1282282 () Bool)

(declare-fun e!732649 () Bool)

(assert (=> b!1282282 (= e!732649 tp_is_empty!33785)))

(declare-fun mapIsEmpty!52235 () Bool)

(assert (=> mapIsEmpty!52235 mapRes!52235))

(declare-fun b!1282283 () Bool)

(assert (=> b!1282283 (= e!732646 (and e!732649 mapRes!52235))))

(declare-fun condMapEmpty!52235 () Bool)

(declare-fun mapDefault!52235 () ValueCell!15994)

