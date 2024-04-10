; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72782 () Bool)

(assert start!72782)

(declare-fun mapNonEmpty!25349 () Bool)

(declare-fun mapRes!25349 () Bool)

(declare-fun tp!48667 () Bool)

(declare-fun e!471484 () Bool)

(assert (=> mapNonEmpty!25349 (= mapRes!25349 (and tp!48667 e!471484))))

(declare-fun mapKey!25349 () (_ BitVec 32))

(declare-datatypes ((V!26157 0))(
  ( (V!26158 (val!7964 Int)) )
))
(declare-datatypes ((ValueCell!7477 0))(
  ( (ValueCellFull!7477 (v!10389 V!26157)) (EmptyCell!7477) )
))
(declare-fun mapRest!25349 () (Array (_ BitVec 32) ValueCell!7477))

(declare-fun mapValue!25349 () ValueCell!7477)

(declare-datatypes ((array!47896 0))(
  ( (array!47897 (arr!22979 (Array (_ BitVec 32) ValueCell!7477)) (size!23419 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47896)

(assert (=> mapNonEmpty!25349 (= (arr!22979 _values!688) (store mapRest!25349 mapKey!25349 mapValue!25349))))

(declare-fun b!844676 () Bool)

(declare-fun e!471487 () Bool)

(declare-fun e!471486 () Bool)

(assert (=> b!844676 (= e!471487 (and e!471486 mapRes!25349))))

(declare-fun condMapEmpty!25349 () Bool)

(declare-fun mapDefault!25349 () ValueCell!7477)

