; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35008 () Bool)

(assert start!35008)

(declare-fun b_free!7697 () Bool)

(declare-fun b_next!7697 () Bool)

(assert (=> start!35008 (= b_free!7697 (not b_next!7697))))

(declare-fun tp!26669 () Bool)

(declare-fun b_and!14927 () Bool)

(assert (=> start!35008 (= tp!26669 b_and!14927)))

(declare-fun b!350745 () Bool)

(declare-fun e!214827 () Bool)

(declare-fun tp_is_empty!7649 () Bool)

(assert (=> b!350745 (= e!214827 tp_is_empty!7649)))

(declare-fun b!350746 () Bool)

(declare-fun res!194420 () Bool)

(declare-fun e!214830 () Bool)

(assert (=> b!350746 (=> (not res!194420) (not e!214830))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11175 0))(
  ( (V!11176 (val!3869 Int)) )
))
(declare-datatypes ((ValueCell!3481 0))(
  ( (ValueCellFull!3481 (v!6056 V!11175)) (EmptyCell!3481) )
))
(declare-datatypes ((array!18885 0))(
  ( (array!18886 (arr!8948 (Array (_ BitVec 32) ValueCell!3481)) (size!9300 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18885)

(declare-datatypes ((array!18887 0))(
  ( (array!18888 (arr!8949 (Array (_ BitVec 32) (_ BitVec 64))) (size!9301 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18887)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!350746 (= res!194420 (and (= (size!9300 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9301 _keys!1895) (size!9300 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12945 () Bool)

(declare-fun mapRes!12945 () Bool)

(declare-fun tp!26670 () Bool)

(assert (=> mapNonEmpty!12945 (= mapRes!12945 (and tp!26670 e!214827))))

(declare-fun mapRest!12945 () (Array (_ BitVec 32) ValueCell!3481))

(declare-fun mapValue!12945 () ValueCell!3481)

(declare-fun mapKey!12945 () (_ BitVec 32))

(assert (=> mapNonEmpty!12945 (= (arr!8948 _values!1525) (store mapRest!12945 mapKey!12945 mapValue!12945))))

(declare-fun b!350747 () Bool)

(declare-fun e!214831 () Bool)

(declare-fun e!214828 () Bool)

(assert (=> b!350747 (= e!214831 (and e!214828 mapRes!12945))))

(declare-fun condMapEmpty!12945 () Bool)

(declare-fun mapDefault!12945 () ValueCell!3481)

