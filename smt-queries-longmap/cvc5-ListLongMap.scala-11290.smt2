; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131606 () Bool)

(assert start!131606)

(declare-fun b!1541615 () Bool)

(declare-fun e!857466 () Bool)

(declare-datatypes ((array!102498 0))(
  ( (array!102499 (arr!49455 (Array (_ BitVec 32) (_ BitVec 64))) (size!50005 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102498)

(assert (=> b!1541615 (= e!857466 (bvsgt #b00000000000000000000000000000000 (size!50005 _keys!618)))))

(declare-fun mapNonEmpty!58141 () Bool)

(declare-fun mapRes!58141 () Bool)

(declare-fun tp!110668 () Bool)

(declare-fun e!857469 () Bool)

(assert (=> mapNonEmpty!58141 (= mapRes!58141 (and tp!110668 e!857469))))

(declare-datatypes ((V!58621 0))(
  ( (V!58622 (val!18894 Int)) )
))
(declare-datatypes ((ValueCell!17906 0))(
  ( (ValueCellFull!17906 (v!21694 V!58621)) (EmptyCell!17906) )
))
(declare-fun mapRest!58141 () (Array (_ BitVec 32) ValueCell!17906))

(declare-datatypes ((array!102500 0))(
  ( (array!102501 (arr!49456 (Array (_ BitVec 32) ValueCell!17906)) (size!50006 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102500)

(declare-fun mapValue!58141 () ValueCell!17906)

(declare-fun mapKey!58141 () (_ BitVec 32))

(assert (=> mapNonEmpty!58141 (= (arr!49456 _values!470) (store mapRest!58141 mapKey!58141 mapValue!58141))))

(declare-fun mapIsEmpty!58141 () Bool)

(assert (=> mapIsEmpty!58141 mapRes!58141))

(declare-fun b!1541616 () Bool)

(declare-fun res!1058070 () Bool)

(assert (=> b!1541616 (=> (not res!1058070) (not e!857466))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1541616 (= res!1058070 (and (= (size!50006 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50005 _keys!618) (size!50006 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541617 () Bool)

(declare-fun tp_is_empty!37633 () Bool)

(assert (=> b!1541617 (= e!857469 tp_is_empty!37633)))

(declare-fun res!1058069 () Bool)

(assert (=> start!131606 (=> (not res!1058069) (not e!857466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131606 (= res!1058069 (validMask!0 mask!926))))

(assert (=> start!131606 e!857466))

(assert (=> start!131606 true))

(declare-fun e!857470 () Bool)

(declare-fun array_inv!38479 (array!102500) Bool)

(assert (=> start!131606 (and (array_inv!38479 _values!470) e!857470)))

(declare-fun array_inv!38480 (array!102498) Bool)

(assert (=> start!131606 (array_inv!38480 _keys!618)))

(declare-fun b!1541618 () Bool)

(declare-fun e!857467 () Bool)

(assert (=> b!1541618 (= e!857470 (and e!857467 mapRes!58141))))

(declare-fun condMapEmpty!58141 () Bool)

(declare-fun mapDefault!58141 () ValueCell!17906)

