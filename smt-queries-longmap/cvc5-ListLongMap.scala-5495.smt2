; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72754 () Bool)

(assert start!72754)

(declare-fun b!844382 () Bool)

(declare-fun e!471276 () Bool)

(declare-fun tp_is_empty!15805 () Bool)

(assert (=> b!844382 (= e!471276 tp_is_empty!15805)))

(declare-fun b!844383 () Bool)

(declare-fun e!471274 () Bool)

(declare-fun e!471273 () Bool)

(declare-fun mapRes!25307 () Bool)

(assert (=> b!844383 (= e!471274 (and e!471273 mapRes!25307))))

(declare-fun condMapEmpty!25307 () Bool)

(declare-datatypes ((V!26121 0))(
  ( (V!26122 (val!7950 Int)) )
))
(declare-datatypes ((ValueCell!7463 0))(
  ( (ValueCellFull!7463 (v!10375 V!26121)) (EmptyCell!7463) )
))
(declare-datatypes ((array!47844 0))(
  ( (array!47845 (arr!22953 (Array (_ BitVec 32) ValueCell!7463)) (size!23393 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47844)

(declare-fun mapDefault!25307 () ValueCell!7463)

