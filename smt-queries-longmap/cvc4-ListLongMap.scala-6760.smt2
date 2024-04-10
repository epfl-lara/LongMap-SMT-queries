; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84830 () Bool)

(assert start!84830)

(declare-fun b!991603 () Bool)

(declare-fun e!559261 () Bool)

(declare-fun tp_is_empty!23339 () Bool)

(assert (=> b!991603 (= e!559261 tp_is_empty!23339)))

(declare-fun mapNonEmpty!37071 () Bool)

(declare-fun mapRes!37071 () Bool)

(declare-fun tp!70142 () Bool)

(assert (=> mapNonEmpty!37071 (= mapRes!37071 (and tp!70142 e!559261))))

(declare-datatypes ((V!36101 0))(
  ( (V!36102 (val!11720 Int)) )
))
(declare-datatypes ((ValueCell!11188 0))(
  ( (ValueCellFull!11188 (v!14296 V!36101)) (EmptyCell!11188) )
))
(declare-fun mapValue!37071 () ValueCell!11188)

(declare-fun mapRest!37071 () (Array (_ BitVec 32) ValueCell!11188))

(declare-datatypes ((array!62643 0))(
  ( (array!62644 (arr!30169 (Array (_ BitVec 32) ValueCell!11188)) (size!30648 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62643)

(declare-fun mapKey!37071 () (_ BitVec 32))

(assert (=> mapNonEmpty!37071 (= (arr!30169 _values!1551) (store mapRest!37071 mapKey!37071 mapValue!37071))))

(declare-fun res!662821 () Bool)

(declare-fun e!559263 () Bool)

(assert (=> start!84830 (=> (not res!662821) (not e!559263))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84830 (= res!662821 (validMask!0 mask!2471))))

(assert (=> start!84830 e!559263))

(assert (=> start!84830 true))

(declare-fun e!559264 () Bool)

(declare-fun array_inv!23301 (array!62643) Bool)

(assert (=> start!84830 (and (array_inv!23301 _values!1551) e!559264)))

(declare-datatypes ((array!62645 0))(
  ( (array!62646 (arr!30170 (Array (_ BitVec 32) (_ BitVec 64))) (size!30649 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62645)

(declare-fun array_inv!23302 (array!62645) Bool)

(assert (=> start!84830 (array_inv!23302 _keys!1945)))

(declare-fun mapIsEmpty!37071 () Bool)

(assert (=> mapIsEmpty!37071 mapRes!37071))

(declare-fun b!991604 () Bool)

(declare-fun e!559260 () Bool)

(assert (=> b!991604 (= e!559260 tp_is_empty!23339)))

(declare-fun b!991605 () Bool)

(assert (=> b!991605 (= e!559264 (and e!559260 mapRes!37071))))

(declare-fun condMapEmpty!37071 () Bool)

(declare-fun mapDefault!37071 () ValueCell!11188)

