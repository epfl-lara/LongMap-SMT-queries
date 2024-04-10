; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131710 () Bool)

(assert start!131710)

(declare-fun res!1058447 () Bool)

(declare-fun e!858054 () Bool)

(assert (=> start!131710 (=> (not res!1058447) (not e!858054))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131710 (= res!1058447 (validMask!0 mask!926))))

(assert (=> start!131710 e!858054))

(assert (=> start!131710 true))

(declare-datatypes ((V!58709 0))(
  ( (V!58710 (val!18927 Int)) )
))
(declare-datatypes ((ValueCell!17939 0))(
  ( (ValueCellFull!17939 (v!21728 V!58709)) (EmptyCell!17939) )
))
(declare-datatypes ((array!102628 0))(
  ( (array!102629 (arr!49516 (Array (_ BitVec 32) ValueCell!17939)) (size!50066 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102628)

(declare-fun e!858052 () Bool)

(declare-fun array_inv!38525 (array!102628) Bool)

(assert (=> start!131710 (and (array_inv!38525 _values!470) e!858052)))

(declare-datatypes ((array!102630 0))(
  ( (array!102631 (arr!49517 (Array (_ BitVec 32) (_ BitVec 64))) (size!50067 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102630)

(declare-fun array_inv!38526 (array!102630) Bool)

(assert (=> start!131710 (array_inv!38526 _keys!618)))

(declare-fun mapNonEmpty!58252 () Bool)

(declare-fun mapRes!58252 () Bool)

(declare-fun tp!110779 () Bool)

(declare-fun e!858051 () Bool)

(assert (=> mapNonEmpty!58252 (= mapRes!58252 (and tp!110779 e!858051))))

(declare-fun mapValue!58252 () ValueCell!17939)

(declare-fun mapRest!58252 () (Array (_ BitVec 32) ValueCell!17939))

(declare-fun mapKey!58252 () (_ BitVec 32))

(assert (=> mapNonEmpty!58252 (= (arr!49516 _values!470) (store mapRest!58252 mapKey!58252 mapValue!58252))))

(declare-fun b!1542345 () Bool)

(declare-fun tp_is_empty!37699 () Bool)

(assert (=> b!1542345 (= e!858051 tp_is_empty!37699)))

(declare-fun mapIsEmpty!58252 () Bool)

(assert (=> mapIsEmpty!58252 mapRes!58252))

(declare-fun b!1542346 () Bool)

(declare-fun res!1058446 () Bool)

(assert (=> b!1542346 (=> (not res!1058446) (not e!858054))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542346 (= res!1058446 (and (= (size!50066 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50067 _keys!618) (size!50066 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542347 () Bool)

(declare-fun e!858050 () Bool)

(assert (=> b!1542347 (= e!858052 (and e!858050 mapRes!58252))))

(declare-fun condMapEmpty!58252 () Bool)

(declare-fun mapDefault!58252 () ValueCell!17939)

