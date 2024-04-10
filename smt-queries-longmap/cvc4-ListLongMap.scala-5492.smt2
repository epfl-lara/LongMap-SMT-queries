; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72740 () Bool)

(assert start!72740)

(declare-fun mapNonEmpty!25286 () Bool)

(declare-fun mapRes!25286 () Bool)

(declare-fun tp!48604 () Bool)

(declare-fun e!471171 () Bool)

(assert (=> mapNonEmpty!25286 (= mapRes!25286 (and tp!48604 e!471171))))

(declare-fun mapKey!25286 () (_ BitVec 32))

(declare-datatypes ((V!26101 0))(
  ( (V!26102 (val!7943 Int)) )
))
(declare-datatypes ((ValueCell!7456 0))(
  ( (ValueCellFull!7456 (v!10368 V!26101)) (EmptyCell!7456) )
))
(declare-fun mapValue!25286 () ValueCell!7456)

(declare-datatypes ((array!47820 0))(
  ( (array!47821 (arr!22941 (Array (_ BitVec 32) ValueCell!7456)) (size!23381 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47820)

(declare-fun mapRest!25286 () (Array (_ BitVec 32) ValueCell!7456))

(assert (=> mapNonEmpty!25286 (= (arr!22941 _values!688) (store mapRest!25286 mapKey!25286 mapValue!25286))))

(declare-fun b!844235 () Bool)

(declare-fun e!471168 () Bool)

(declare-fun e!471170 () Bool)

(assert (=> b!844235 (= e!471168 (and e!471170 mapRes!25286))))

(declare-fun condMapEmpty!25286 () Bool)

(declare-fun mapDefault!25286 () ValueCell!7456)

