; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72314 () Bool)

(assert start!72314)

(declare-fun mapIsEmpty!24647 () Bool)

(declare-fun mapRes!24647 () Bool)

(assert (=> mapIsEmpty!24647 mapRes!24647))

(declare-fun mapNonEmpty!24647 () Bool)

(declare-fun tp!47641 () Bool)

(declare-fun e!467653 () Bool)

(assert (=> mapNonEmpty!24647 (= mapRes!24647 (and tp!47641 e!467653))))

(declare-datatypes ((V!25533 0))(
  ( (V!25534 (val!7730 Int)) )
))
(declare-datatypes ((ValueCell!7243 0))(
  ( (ValueCellFull!7243 (v!10155 V!25533)) (EmptyCell!7243) )
))
(declare-fun mapRest!24647 () (Array (_ BitVec 32) ValueCell!7243))

(declare-fun mapValue!24647 () ValueCell!7243)

(declare-fun mapKey!24647 () (_ BitVec 32))

(declare-datatypes ((array!47026 0))(
  ( (array!47027 (arr!22544 (Array (_ BitVec 32) ValueCell!7243)) (size!22984 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47026)

(assert (=> mapNonEmpty!24647 (= (arr!22544 _values!688) (store mapRest!24647 mapKey!24647 mapValue!24647))))

(declare-fun b!837818 () Bool)

(declare-fun e!467651 () Bool)

(assert (=> b!837818 (= e!467651 false)))

(declare-fun lt!380614 () Bool)

(declare-datatypes ((array!47028 0))(
  ( (array!47029 (arr!22545 (Array (_ BitVec 32) (_ BitVec 64))) (size!22985 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47028)

(declare-datatypes ((List!16039 0))(
  ( (Nil!16036) (Cons!16035 (h!17166 (_ BitVec 64)) (t!22410 List!16039)) )
))
(declare-fun arrayNoDuplicates!0 (array!47028 (_ BitVec 32) List!16039) Bool)

(assert (=> b!837818 (= lt!380614 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16036))))

(declare-fun b!837819 () Bool)

(declare-fun e!467649 () Bool)

(declare-fun e!467652 () Bool)

(assert (=> b!837819 (= e!467649 (and e!467652 mapRes!24647))))

(declare-fun condMapEmpty!24647 () Bool)

(declare-fun mapDefault!24647 () ValueCell!7243)

