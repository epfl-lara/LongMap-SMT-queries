; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72766 () Bool)

(assert start!72766)

(declare-fun mapNonEmpty!25325 () Bool)

(declare-fun mapRes!25325 () Bool)

(declare-fun tp!48643 () Bool)

(declare-fun e!471367 () Bool)

(assert (=> mapNonEmpty!25325 (= mapRes!25325 (and tp!48643 e!471367))))

(declare-datatypes ((V!26137 0))(
  ( (V!26138 (val!7956 Int)) )
))
(declare-datatypes ((ValueCell!7469 0))(
  ( (ValueCellFull!7469 (v!10381 V!26137)) (EmptyCell!7469) )
))
(declare-fun mapValue!25325 () ValueCell!7469)

(declare-fun mapRest!25325 () (Array (_ BitVec 32) ValueCell!7469))

(declare-fun mapKey!25325 () (_ BitVec 32))

(declare-datatypes ((array!47866 0))(
  ( (array!47867 (arr!22964 (Array (_ BitVec 32) ValueCell!7469)) (size!23404 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47866)

(assert (=> mapNonEmpty!25325 (= (arr!22964 _values!688) (store mapRest!25325 mapKey!25325 mapValue!25325))))

(declare-fun b!844508 () Bool)

(declare-fun e!471365 () Bool)

(declare-fun e!471366 () Bool)

(assert (=> b!844508 (= e!471365 (and e!471366 mapRes!25325))))

(declare-fun condMapEmpty!25325 () Bool)

(declare-fun mapDefault!25325 () ValueCell!7469)

