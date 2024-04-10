; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72620 () Bool)

(assert start!72620)

(declare-fun mapNonEmpty!25106 () Bool)

(declare-fun mapRes!25106 () Bool)

(declare-fun tp!48424 () Bool)

(declare-fun e!470271 () Bool)

(assert (=> mapNonEmpty!25106 (= mapRes!25106 (and tp!48424 e!470271))))

(declare-fun mapKey!25106 () (_ BitVec 32))

(declare-datatypes ((V!25941 0))(
  ( (V!25942 (val!7883 Int)) )
))
(declare-datatypes ((ValueCell!7396 0))(
  ( (ValueCellFull!7396 (v!10308 V!25941)) (EmptyCell!7396) )
))
(declare-fun mapValue!25106 () ValueCell!7396)

(declare-fun mapRest!25106 () (Array (_ BitVec 32) ValueCell!7396))

(declare-datatypes ((array!47606 0))(
  ( (array!47607 (arr!22834 (Array (_ BitVec 32) ValueCell!7396)) (size!23274 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47606)

(assert (=> mapNonEmpty!25106 (= (arr!22834 _values!688) (store mapRest!25106 mapKey!25106 mapValue!25106))))

(declare-fun b!842975 () Bool)

(declare-fun e!470272 () Bool)

(declare-fun e!470268 () Bool)

(assert (=> b!842975 (= e!470272 (and e!470268 mapRes!25106))))

(declare-fun condMapEmpty!25106 () Bool)

(declare-fun mapDefault!25106 () ValueCell!7396)

