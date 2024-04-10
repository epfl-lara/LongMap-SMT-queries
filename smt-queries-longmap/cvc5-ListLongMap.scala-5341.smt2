; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71372 () Bool)

(assert start!71372)

(declare-fun b_free!13453 () Bool)

(declare-fun b_next!13453 () Bool)

(assert (=> start!71372 (= b_free!13453 (not b_next!13453))))

(declare-fun tp!47133 () Bool)

(declare-fun b_and!22435 () Bool)

(assert (=> start!71372 (= tp!47133 b_and!22435)))

(declare-fun mapNonEmpty!24385 () Bool)

(declare-fun mapRes!24385 () Bool)

(declare-fun tp!47134 () Bool)

(declare-fun e!461949 () Bool)

(assert (=> mapNonEmpty!24385 (= mapRes!24385 (and tp!47134 e!461949))))

(declare-datatypes ((V!25219 0))(
  ( (V!25220 (val!7629 Int)) )
))
(declare-datatypes ((ValueCell!7166 0))(
  ( (ValueCellFull!7166 (v!10067 V!25219)) (EmptyCell!7166) )
))
(declare-datatypes ((array!46492 0))(
  ( (array!46493 (arr!22286 (Array (_ BitVec 32) ValueCell!7166)) (size!22707 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46492)

(declare-fun mapRest!24385 () (Array (_ BitVec 32) ValueCell!7166))

(declare-fun mapValue!24385 () ValueCell!7166)

(declare-fun mapKey!24385 () (_ BitVec 32))

(assert (=> mapNonEmpty!24385 (= (arr!22286 _values!788) (store mapRest!24385 mapKey!24385 mapValue!24385))))

(declare-fun b!828895 () Bool)

(declare-fun e!461950 () Bool)

(declare-fun tp_is_empty!15163 () Bool)

(assert (=> b!828895 (= e!461950 tp_is_empty!15163)))

(declare-fun b!828896 () Bool)

(assert (=> b!828896 (= e!461949 tp_is_empty!15163)))

(declare-fun b!828897 () Bool)

(declare-fun e!461955 () Bool)

(assert (=> b!828897 (= e!461955 (and e!461950 mapRes!24385))))

(declare-fun condMapEmpty!24385 () Bool)

(declare-fun mapDefault!24385 () ValueCell!7166)

