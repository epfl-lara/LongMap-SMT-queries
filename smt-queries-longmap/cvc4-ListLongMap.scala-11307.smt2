; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131750 () Bool)

(assert start!131750)

(declare-fun b!1542705 () Bool)

(declare-fun res!1058627 () Bool)

(declare-fun e!858351 () Bool)

(assert (=> b!1542705 (=> (not res!1058627) (not e!858351))))

(declare-datatypes ((array!102706 0))(
  ( (array!102707 (arr!49555 (Array (_ BitVec 32) (_ BitVec 64))) (size!50105 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102706)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58761 0))(
  ( (V!58762 (val!18947 Int)) )
))
(declare-datatypes ((ValueCell!17959 0))(
  ( (ValueCellFull!17959 (v!21748 V!58761)) (EmptyCell!17959) )
))
(declare-datatypes ((array!102708 0))(
  ( (array!102709 (arr!49556 (Array (_ BitVec 32) ValueCell!17959)) (size!50106 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102708)

(assert (=> b!1542705 (= res!1058627 (and (= (size!50106 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50105 _keys!618) (size!50106 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58312 () Bool)

(declare-fun mapRes!58312 () Bool)

(assert (=> mapIsEmpty!58312 mapRes!58312))

(declare-fun b!1542707 () Bool)

(declare-fun e!858354 () Bool)

(declare-fun tp_is_empty!37739 () Bool)

(assert (=> b!1542707 (= e!858354 tp_is_empty!37739)))

(declare-fun mapNonEmpty!58312 () Bool)

(declare-fun tp!110839 () Bool)

(declare-fun e!858353 () Bool)

(assert (=> mapNonEmpty!58312 (= mapRes!58312 (and tp!110839 e!858353))))

(declare-fun mapValue!58312 () ValueCell!17959)

(declare-fun mapRest!58312 () (Array (_ BitVec 32) ValueCell!17959))

(declare-fun mapKey!58312 () (_ BitVec 32))

(assert (=> mapNonEmpty!58312 (= (arr!49556 _values!470) (store mapRest!58312 mapKey!58312 mapValue!58312))))

(declare-fun b!1542708 () Bool)

(assert (=> b!1542708 (= e!858351 false)))

(declare-fun lt!665861 () Bool)

(declare-datatypes ((List!35888 0))(
  ( (Nil!35885) (Cons!35884 (h!37329 (_ BitVec 64)) (t!50582 List!35888)) )
))
(declare-fun arrayNoDuplicates!0 (array!102706 (_ BitVec 32) List!35888) Bool)

(assert (=> b!1542708 (= lt!665861 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35885))))

(declare-fun b!1542709 () Bool)

(declare-fun e!858352 () Bool)

(assert (=> b!1542709 (= e!858352 (and e!858354 mapRes!58312))))

(declare-fun condMapEmpty!58312 () Bool)

(declare-fun mapDefault!58312 () ValueCell!17959)

