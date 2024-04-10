; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19958 () Bool)

(assert start!19958)

(declare-fun b!195767 () Bool)

(declare-fun e!128843 () Bool)

(declare-fun tp_is_empty!4517 () Bool)

(assert (=> b!195767 (= e!128843 tp_is_empty!4517)))

(declare-fun b!195768 () Bool)

(declare-fun e!128844 () Bool)

(assert (=> b!195768 (= e!128844 tp_is_empty!4517)))

(declare-fun mapNonEmpty!7829 () Bool)

(declare-fun mapRes!7829 () Bool)

(declare-fun tp!17117 () Bool)

(assert (=> mapNonEmpty!7829 (= mapRes!7829 (and tp!17117 e!128844))))

(declare-fun mapKey!7829 () (_ BitVec 32))

(declare-datatypes ((V!5669 0))(
  ( (V!5670 (val!2303 Int)) )
))
(declare-datatypes ((ValueCell!1915 0))(
  ( (ValueCellFull!1915 (v!4272 V!5669)) (EmptyCell!1915) )
))
(declare-datatypes ((array!8291 0))(
  ( (array!8292 (arr!3901 (Array (_ BitVec 32) ValueCell!1915)) (size!4226 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8291)

(declare-fun mapValue!7829 () ValueCell!1915)

(declare-fun mapRest!7829 () (Array (_ BitVec 32) ValueCell!1915))

(assert (=> mapNonEmpty!7829 (= (arr!3901 _values!649) (store mapRest!7829 mapKey!7829 mapValue!7829))))

(declare-fun mapIsEmpty!7829 () Bool)

(assert (=> mapIsEmpty!7829 mapRes!7829))

(declare-fun b!195770 () Bool)

(declare-fun e!128841 () Bool)

(assert (=> b!195770 (= e!128841 (and e!128843 mapRes!7829))))

(declare-fun condMapEmpty!7829 () Bool)

(declare-fun mapDefault!7829 () ValueCell!1915)

