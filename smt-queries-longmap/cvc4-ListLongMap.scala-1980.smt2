; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34768 () Bool)

(assert start!34768)

(declare-fun b_free!7553 () Bool)

(declare-fun b_next!7553 () Bool)

(assert (=> start!34768 (= b_free!7553 (not b_next!7553))))

(declare-fun tp!26226 () Bool)

(declare-fun b_and!14775 () Bool)

(assert (=> start!34768 (= tp!26226 b_and!14775)))

(declare-fun mapNonEmpty!12717 () Bool)

(declare-fun mapRes!12717 () Bool)

(declare-fun tp!26225 () Bool)

(declare-fun e!213038 () Bool)

(assert (=> mapNonEmpty!12717 (= mapRes!12717 (and tp!26225 e!213038))))

(declare-datatypes ((V!10983 0))(
  ( (V!10984 (val!3797 Int)) )
))
(declare-datatypes ((ValueCell!3409 0))(
  ( (ValueCellFull!3409 (v!5980 V!10983)) (EmptyCell!3409) )
))
(declare-fun mapRest!12717 () (Array (_ BitVec 32) ValueCell!3409))

(declare-fun mapKey!12717 () (_ BitVec 32))

(declare-datatypes ((array!18601 0))(
  ( (array!18602 (arr!8810 (Array (_ BitVec 32) ValueCell!3409)) (size!9162 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18601)

(declare-fun mapValue!12717 () ValueCell!3409)

(assert (=> mapNonEmpty!12717 (= (arr!8810 _values!1525) (store mapRest!12717 mapKey!12717 mapValue!12717))))

(declare-fun b!347683 () Bool)

(declare-fun e!213034 () Bool)

(declare-fun e!213036 () Bool)

(assert (=> b!347683 (= e!213034 (and e!213036 mapRes!12717))))

(declare-fun condMapEmpty!12717 () Bool)

(declare-fun mapDefault!12717 () ValueCell!3409)

