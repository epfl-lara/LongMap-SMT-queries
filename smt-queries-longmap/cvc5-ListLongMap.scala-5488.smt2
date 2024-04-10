; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72712 () Bool)

(assert start!72712)

(declare-fun b!843941 () Bool)

(declare-fun e!470958 () Bool)

(declare-fun tp_is_empty!15763 () Bool)

(assert (=> b!843941 (= e!470958 tp_is_empty!15763)))

(declare-fun b!843942 () Bool)

(declare-fun e!470962 () Bool)

(declare-fun mapRes!25244 () Bool)

(assert (=> b!843942 (= e!470962 (and e!470958 mapRes!25244))))

(declare-fun condMapEmpty!25244 () Bool)

(declare-datatypes ((V!26065 0))(
  ( (V!26066 (val!7929 Int)) )
))
(declare-datatypes ((ValueCell!7442 0))(
  ( (ValueCellFull!7442 (v!10354 V!26065)) (EmptyCell!7442) )
))
(declare-datatypes ((array!47770 0))(
  ( (array!47771 (arr!22916 (Array (_ BitVec 32) ValueCell!7442)) (size!23356 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47770)

(declare-fun mapDefault!25244 () ValueCell!7442)

