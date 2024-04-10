; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131740 () Bool)

(assert start!131740)

(declare-fun b!1542615 () Bool)

(declare-fun e!858275 () Bool)

(declare-fun tp_is_empty!37729 () Bool)

(assert (=> b!1542615 (= e!858275 tp_is_empty!37729)))

(declare-fun b!1542616 () Bool)

(declare-fun res!1058581 () Bool)

(declare-fun e!858278 () Bool)

(assert (=> b!1542616 (=> (not res!1058581) (not e!858278))))

(declare-datatypes ((array!102688 0))(
  ( (array!102689 (arr!49546 (Array (_ BitVec 32) (_ BitVec 64))) (size!50096 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102688)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58749 0))(
  ( (V!58750 (val!18942 Int)) )
))
(declare-datatypes ((ValueCell!17954 0))(
  ( (ValueCellFull!17954 (v!21743 V!58749)) (EmptyCell!17954) )
))
(declare-datatypes ((array!102690 0))(
  ( (array!102691 (arr!49547 (Array (_ BitVec 32) ValueCell!17954)) (size!50097 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102690)

(assert (=> b!1542616 (= res!1058581 (and (= (size!50097 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50096 _keys!618) (size!50097 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58297 () Bool)

(declare-fun mapRes!58297 () Bool)

(assert (=> mapIsEmpty!58297 mapRes!58297))

(declare-fun mapNonEmpty!58297 () Bool)

(declare-fun tp!110824 () Bool)

(declare-fun e!858277 () Bool)

(assert (=> mapNonEmpty!58297 (= mapRes!58297 (and tp!110824 e!858277))))

(declare-fun mapValue!58297 () ValueCell!17954)

(declare-fun mapRest!58297 () (Array (_ BitVec 32) ValueCell!17954))

(declare-fun mapKey!58297 () (_ BitVec 32))

(assert (=> mapNonEmpty!58297 (= (arr!49547 _values!470) (store mapRest!58297 mapKey!58297 mapValue!58297))))

(declare-fun res!1058582 () Bool)

(assert (=> start!131740 (=> (not res!1058582) (not e!858278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131740 (= res!1058582 (validMask!0 mask!926))))

(assert (=> start!131740 e!858278))

(assert (=> start!131740 true))

(declare-fun e!858276 () Bool)

(declare-fun array_inv!38553 (array!102690) Bool)

(assert (=> start!131740 (and (array_inv!38553 _values!470) e!858276)))

(declare-fun array_inv!38554 (array!102688) Bool)

(assert (=> start!131740 (array_inv!38554 _keys!618)))

(declare-fun b!1542617 () Bool)

(assert (=> b!1542617 (= e!858277 tp_is_empty!37729)))

(declare-fun b!1542618 () Bool)

(assert (=> b!1542618 (= e!858276 (and e!858275 mapRes!58297))))

(declare-fun condMapEmpty!58297 () Bool)

(declare-fun mapDefault!58297 () ValueCell!17954)

