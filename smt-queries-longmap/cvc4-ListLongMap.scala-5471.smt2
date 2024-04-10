; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72614 () Bool)

(assert start!72614)

(declare-fun b!842912 () Bool)

(declare-fun e!470224 () Bool)

(declare-fun tp_is_empty!15665 () Bool)

(assert (=> b!842912 (= e!470224 tp_is_empty!15665)))

(declare-fun b!842913 () Bool)

(declare-fun e!470226 () Bool)

(assert (=> b!842913 (= e!470226 tp_is_empty!15665)))

(declare-fun b!842914 () Bool)

(declare-fun e!470227 () Bool)

(declare-fun mapRes!25097 () Bool)

(assert (=> b!842914 (= e!470227 (and e!470224 mapRes!25097))))

(declare-fun condMapEmpty!25097 () Bool)

(declare-datatypes ((V!25933 0))(
  ( (V!25934 (val!7880 Int)) )
))
(declare-datatypes ((ValueCell!7393 0))(
  ( (ValueCellFull!7393 (v!10305 V!25933)) (EmptyCell!7393) )
))
(declare-datatypes ((array!47596 0))(
  ( (array!47597 (arr!22829 (Array (_ BitVec 32) ValueCell!7393)) (size!23269 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47596)

(declare-fun mapDefault!25097 () ValueCell!7393)

