; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72674 () Bool)

(assert start!72674)

(declare-fun b!843542 () Bool)

(declare-fun e!470677 () Bool)

(declare-fun tp_is_empty!15725 () Bool)

(assert (=> b!843542 (= e!470677 tp_is_empty!15725)))

(declare-fun b!843543 () Bool)

(declare-fun e!470676 () Bool)

(declare-fun mapRes!25187 () Bool)

(assert (=> b!843543 (= e!470676 (and e!470677 mapRes!25187))))

(declare-fun condMapEmpty!25187 () Bool)

(declare-datatypes ((V!26013 0))(
  ( (V!26014 (val!7910 Int)) )
))
(declare-datatypes ((ValueCell!7423 0))(
  ( (ValueCellFull!7423 (v!10335 V!26013)) (EmptyCell!7423) )
))
(declare-datatypes ((array!47698 0))(
  ( (array!47699 (arr!22880 (Array (_ BitVec 32) ValueCell!7423)) (size!23320 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47698)

(declare-fun mapDefault!25187 () ValueCell!7423)

