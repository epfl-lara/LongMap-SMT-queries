; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72856 () Bool)

(assert start!72856)

(declare-fun b_free!13771 () Bool)

(declare-fun b_next!13771 () Bool)

(assert (=> start!72856 (= b_free!13771 (not b_next!13771))))

(declare-fun tp!48817 () Bool)

(declare-fun b_and!22857 () Bool)

(assert (=> start!72856 (= tp!48817 b_and!22857)))

(declare-fun mapIsEmpty!25460 () Bool)

(declare-fun mapRes!25460 () Bool)

(assert (=> mapIsEmpty!25460 mapRes!25460))

(declare-fun mapNonEmpty!25460 () Bool)

(declare-fun tp!48816 () Bool)

(declare-fun e!472041 () Bool)

(assert (=> mapNonEmpty!25460 (= mapRes!25460 (and tp!48816 e!472041))))

(declare-datatypes ((V!26257 0))(
  ( (V!26258 (val!8001 Int)) )
))
(declare-datatypes ((ValueCell!7514 0))(
  ( (ValueCellFull!7514 (v!10426 V!26257)) (EmptyCell!7514) )
))
(declare-fun mapValue!25460 () ValueCell!7514)

(declare-fun mapRest!25460 () (Array (_ BitVec 32) ValueCell!7514))

(declare-datatypes ((array!48034 0))(
  ( (array!48035 (arr!23048 (Array (_ BitVec 32) ValueCell!7514)) (size!23488 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48034)

(declare-fun mapKey!25460 () (_ BitVec 32))

(assert (=> mapNonEmpty!25460 (= (arr!23048 _values!688) (store mapRest!25460 mapKey!25460 mapValue!25460))))

(declare-fun b!845605 () Bool)

(declare-fun e!472038 () Bool)

(declare-fun e!472042 () Bool)

(assert (=> b!845605 (= e!472038 (and e!472042 mapRes!25460))))

(declare-fun condMapEmpty!25460 () Bool)

(declare-fun mapDefault!25460 () ValueCell!7514)

