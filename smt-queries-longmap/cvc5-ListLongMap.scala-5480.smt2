; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72664 () Bool)

(assert start!72664)

(declare-fun b!843437 () Bool)

(declare-fun e!470600 () Bool)

(declare-fun tp_is_empty!15715 () Bool)

(assert (=> b!843437 (= e!470600 tp_is_empty!15715)))

(declare-fun b!843439 () Bool)

(declare-fun e!470598 () Bool)

(declare-fun e!470601 () Bool)

(declare-fun mapRes!25172 () Bool)

(assert (=> b!843439 (= e!470598 (and e!470601 mapRes!25172))))

(declare-fun condMapEmpty!25172 () Bool)

(declare-datatypes ((V!26001 0))(
  ( (V!26002 (val!7905 Int)) )
))
(declare-datatypes ((ValueCell!7418 0))(
  ( (ValueCellFull!7418 (v!10330 V!26001)) (EmptyCell!7418) )
))
(declare-datatypes ((array!47680 0))(
  ( (array!47681 (arr!22871 (Array (_ BitVec 32) ValueCell!7418)) (size!23311 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47680)

(declare-fun mapDefault!25172 () ValueCell!7418)

