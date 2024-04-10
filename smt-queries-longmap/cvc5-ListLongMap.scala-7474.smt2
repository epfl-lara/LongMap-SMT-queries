; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94768 () Bool)

(assert start!94768)

(declare-fun b_free!22021 () Bool)

(declare-fun b_next!22021 () Bool)

(assert (=> start!94768 (= b_free!22021 (not b_next!22021))))

(declare-fun tp!77522 () Bool)

(declare-fun b_and!34851 () Bool)

(assert (=> start!94768 (= tp!77522 b_and!34851)))

(declare-datatypes ((V!39577 0))(
  ( (V!39578 (val!12966 Int)) )
))
(declare-datatypes ((tuple2!16506 0))(
  ( (tuple2!16507 (_1!8264 (_ BitVec 64)) (_2!8264 V!39577)) )
))
(declare-fun lt!474295 () tuple2!16506)

(declare-fun b!1071588 () Bool)

(declare-datatypes ((List!23045 0))(
  ( (Nil!23042) (Cons!23041 (h!24250 tuple2!16506) (t!32378 List!23045)) )
))
(declare-datatypes ((ListLongMap!14475 0))(
  ( (ListLongMap!14476 (toList!7253 List!23045)) )
))
(declare-fun lt!474299 () ListLongMap!14475)

(declare-fun e!611914 () Bool)

(declare-fun lt!474301 () ListLongMap!14475)

(declare-fun +!3188 (ListLongMap!14475 tuple2!16506) ListLongMap!14475)

(assert (=> b!1071588 (= e!611914 (= lt!474301 (+!3188 lt!474299 lt!474295)))))

(declare-fun mapIsEmpty!40453 () Bool)

(declare-fun mapRes!40453 () Bool)

(assert (=> mapIsEmpty!40453 mapRes!40453))

(declare-fun b!1071589 () Bool)

(declare-fun e!611915 () Bool)

(declare-fun e!611913 () Bool)

(assert (=> b!1071589 (= e!611915 (and e!611913 mapRes!40453))))

(declare-fun condMapEmpty!40453 () Bool)

(declare-datatypes ((ValueCell!12212 0))(
  ( (ValueCellFull!12212 (v!15582 V!39577)) (EmptyCell!12212) )
))
(declare-datatypes ((array!68635 0))(
  ( (array!68636 (arr!33013 (Array (_ BitVec 32) ValueCell!12212)) (size!33549 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68635)

(declare-fun mapDefault!40453 () ValueCell!12212)

