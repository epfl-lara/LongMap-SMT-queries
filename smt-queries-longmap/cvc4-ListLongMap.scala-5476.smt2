; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72644 () Bool)

(assert start!72644)

(declare-fun mapNonEmpty!25142 () Bool)

(declare-fun mapRes!25142 () Bool)

(declare-fun tp!48460 () Bool)

(declare-fun e!470448 () Bool)

(assert (=> mapNonEmpty!25142 (= mapRes!25142 (and tp!48460 e!470448))))

(declare-fun mapKey!25142 () (_ BitVec 32))

(declare-datatypes ((V!25973 0))(
  ( (V!25974 (val!7895 Int)) )
))
(declare-datatypes ((ValueCell!7408 0))(
  ( (ValueCellFull!7408 (v!10320 V!25973)) (EmptyCell!7408) )
))
(declare-fun mapRest!25142 () (Array (_ BitVec 32) ValueCell!7408))

(declare-fun mapValue!25142 () ValueCell!7408)

(declare-datatypes ((array!47648 0))(
  ( (array!47649 (arr!22855 (Array (_ BitVec 32) ValueCell!7408)) (size!23295 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47648)

(assert (=> mapNonEmpty!25142 (= (arr!22855 _values!688) (store mapRest!25142 mapKey!25142 mapValue!25142))))

(declare-fun b!843227 () Bool)

(declare-fun e!470449 () Bool)

(declare-fun e!470451 () Bool)

(assert (=> b!843227 (= e!470449 (and e!470451 mapRes!25142))))

(declare-fun condMapEmpty!25142 () Bool)

(declare-fun mapDefault!25142 () ValueCell!7408)

