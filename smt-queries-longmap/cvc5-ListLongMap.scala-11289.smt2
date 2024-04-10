; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131594 () Bool)

(assert start!131594)

(declare-fun res!1058056 () Bool)

(declare-fun e!857418 () Bool)

(assert (=> start!131594 (=> (not res!1058056) (not e!857418))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131594 (= res!1058056 (validMask!0 mask!926))))

(assert (=> start!131594 e!857418))

(assert (=> start!131594 true))

(declare-datatypes ((V!58613 0))(
  ( (V!58614 (val!18891 Int)) )
))
(declare-datatypes ((ValueCell!17903 0))(
  ( (ValueCellFull!17903 (v!21691 V!58613)) (EmptyCell!17903) )
))
(declare-datatypes ((array!102486 0))(
  ( (array!102487 (arr!49450 (Array (_ BitVec 32) ValueCell!17903)) (size!50000 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102486)

(declare-fun e!857415 () Bool)

(declare-fun array_inv!38475 (array!102486) Bool)

(assert (=> start!131594 (and (array_inv!38475 _values!470) e!857415)))

(declare-datatypes ((array!102488 0))(
  ( (array!102489 (arr!49451 (Array (_ BitVec 32) (_ BitVec 64))) (size!50001 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102488)

(declare-fun array_inv!38476 (array!102488) Bool)

(assert (=> start!131594 (array_inv!38476 _keys!618)))

(declare-fun b!1541567 () Bool)

(declare-fun e!857419 () Bool)

(declare-fun tp_is_empty!37627 () Bool)

(assert (=> b!1541567 (= e!857419 tp_is_empty!37627)))

(declare-fun b!1541568 () Bool)

(declare-fun e!857416 () Bool)

(assert (=> b!1541568 (= e!857416 tp_is_empty!37627)))

(declare-fun mapNonEmpty!58129 () Bool)

(declare-fun mapRes!58129 () Bool)

(declare-fun tp!110656 () Bool)

(assert (=> mapNonEmpty!58129 (= mapRes!58129 (and tp!110656 e!857416))))

(declare-fun mapKey!58129 () (_ BitVec 32))

(declare-fun mapRest!58129 () (Array (_ BitVec 32) ValueCell!17903))

(declare-fun mapValue!58129 () ValueCell!17903)

(assert (=> mapNonEmpty!58129 (= (arr!49450 _values!470) (store mapRest!58129 mapKey!58129 mapValue!58129))))

(declare-fun mapIsEmpty!58129 () Bool)

(assert (=> mapIsEmpty!58129 mapRes!58129))

(declare-fun b!1541569 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541569 (= e!857418 (and (= (size!50000 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50001 _keys!618) (size!50000 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011) (= (size!50001 _keys!618) (bvadd #b00000000000000000000000000000001 mask!926)) (bvsgt #b00000000000000000000000000000000 (size!50001 _keys!618))))))

(declare-fun b!1541570 () Bool)

(assert (=> b!1541570 (= e!857415 (and e!857419 mapRes!58129))))

(declare-fun condMapEmpty!58129 () Bool)

(declare-fun mapDefault!58129 () ValueCell!17903)

