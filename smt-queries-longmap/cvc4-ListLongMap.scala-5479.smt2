; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72662 () Bool)

(assert start!72662)

(declare-fun b!843416 () Bool)

(declare-fun e!470584 () Bool)

(declare-fun tp_is_empty!15713 () Bool)

(assert (=> b!843416 (= e!470584 tp_is_empty!15713)))

(declare-fun b!843417 () Bool)

(declare-fun e!470587 () Bool)

(declare-fun mapRes!25169 () Bool)

(assert (=> b!843417 (= e!470587 (and e!470584 mapRes!25169))))

(declare-fun condMapEmpty!25169 () Bool)

(declare-datatypes ((V!25997 0))(
  ( (V!25998 (val!7904 Int)) )
))
(declare-datatypes ((ValueCell!7417 0))(
  ( (ValueCellFull!7417 (v!10329 V!25997)) (EmptyCell!7417) )
))
(declare-datatypes ((array!47678 0))(
  ( (array!47679 (arr!22870 (Array (_ BitVec 32) ValueCell!7417)) (size!23310 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47678)

(declare-fun mapDefault!25169 () ValueCell!7417)

