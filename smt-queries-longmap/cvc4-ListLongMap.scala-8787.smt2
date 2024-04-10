; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106912 () Bool)

(assert start!106912)

(declare-fun b!1268113 () Bool)

(declare-fun e!722535 () Bool)

(declare-datatypes ((array!82544 0))(
  ( (array!82545 (arr!39813 (Array (_ BitVec 32) (_ BitVec 64))) (size!40349 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82544)

(assert (=> b!1268113 (= e!722535 (bvsgt #b00000000000000000000000000000000 (size!40349 _keys!1364)))))

(declare-fun mapIsEmpty!50527 () Bool)

(declare-fun mapRes!50527 () Bool)

(assert (=> mapIsEmpty!50527 mapRes!50527))

(declare-fun mapNonEmpty!50527 () Bool)

(declare-fun tp!96706 () Bool)

(declare-fun e!722536 () Bool)

(assert (=> mapNonEmpty!50527 (= mapRes!50527 (and tp!96706 e!722536))))

(declare-datatypes ((V!48711 0))(
  ( (V!48712 (val!16394 Int)) )
))
(declare-datatypes ((ValueCell!15466 0))(
  ( (ValueCellFull!15466 (v!19030 V!48711)) (EmptyCell!15466) )
))
(declare-datatypes ((array!82546 0))(
  ( (array!82547 (arr!39814 (Array (_ BitVec 32) ValueCell!15466)) (size!40350 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82546)

(declare-fun mapRest!50527 () (Array (_ BitVec 32) ValueCell!15466))

(declare-fun mapValue!50527 () ValueCell!15466)

(declare-fun mapKey!50527 () (_ BitVec 32))

(assert (=> mapNonEmpty!50527 (= (arr!39814 _values!1134) (store mapRest!50527 mapKey!50527 mapValue!50527))))

(declare-fun b!1268114 () Bool)

(declare-fun e!722538 () Bool)

(declare-fun e!722537 () Bool)

(assert (=> b!1268114 (= e!722538 (and e!722537 mapRes!50527))))

(declare-fun condMapEmpty!50527 () Bool)

(declare-fun mapDefault!50527 () ValueCell!15466)

