; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72646 () Bool)

(assert start!72646)

(declare-fun b!843248 () Bool)

(declare-fun e!470464 () Bool)

(declare-fun tp_is_empty!15697 () Bool)

(assert (=> b!843248 (= e!470464 tp_is_empty!15697)))

(declare-fun mapNonEmpty!25145 () Bool)

(declare-fun mapRes!25145 () Bool)

(declare-fun tp!48463 () Bool)

(declare-fun e!470465 () Bool)

(assert (=> mapNonEmpty!25145 (= mapRes!25145 (and tp!48463 e!470465))))

(declare-datatypes ((V!25977 0))(
  ( (V!25978 (val!7896 Int)) )
))
(declare-datatypes ((ValueCell!7409 0))(
  ( (ValueCellFull!7409 (v!10321 V!25977)) (EmptyCell!7409) )
))
(declare-fun mapRest!25145 () (Array (_ BitVec 32) ValueCell!7409))

(declare-fun mapValue!25145 () ValueCell!7409)

(declare-fun mapKey!25145 () (_ BitVec 32))

(declare-datatypes ((array!47650 0))(
  ( (array!47651 (arr!22856 (Array (_ BitVec 32) ValueCell!7409)) (size!23296 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47650)

(assert (=> mapNonEmpty!25145 (= (arr!22856 _values!688) (store mapRest!25145 mapKey!25145 mapValue!25145))))

(declare-fun b!843249 () Bool)

(declare-fun res!573051 () Bool)

(declare-fun e!470466 () Bool)

(assert (=> b!843249 (=> (not res!573051) (not e!470466))))

(declare-datatypes ((array!47652 0))(
  ( (array!47653 (arr!22857 (Array (_ BitVec 32) (_ BitVec 64))) (size!23297 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47652)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47652 (_ BitVec 32)) Bool)

(assert (=> b!843249 (= res!573051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843250 () Bool)

(declare-fun e!470467 () Bool)

(assert (=> b!843250 (= e!470467 (and e!470464 mapRes!25145))))

(declare-fun condMapEmpty!25145 () Bool)

(declare-fun mapDefault!25145 () ValueCell!7409)

