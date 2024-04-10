; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35914 () Bool)

(assert start!35914)

(declare-datatypes ((array!20249 0))(
  ( (array!20250 (arr!9617 (Array (_ BitVec 32) (_ BitVec 64))) (size!9969 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20249)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun e!221055 () Bool)

(declare-fun b!361073 () Bool)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12111 0))(
  ( (V!12112 (val!4220 Int)) )
))
(declare-datatypes ((ValueCell!3832 0))(
  ( (ValueCellFull!3832 (v!6414 V!12111)) (EmptyCell!3832) )
))
(declare-datatypes ((array!20251 0))(
  ( (array!20252 (arr!9618 (Array (_ BitVec 32) ValueCell!3832)) (size!9970 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20251)

(assert (=> b!361073 (= e!221055 (and (= (size!9970 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9969 _keys!1541) (size!9970 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011) (= (size!9969 _keys!1541) (bvadd #b00000000000000000000000000000001 mask!1943)) (bvsgt #b00000000000000000000000000000000 (size!9969 _keys!1541))))))

(declare-fun mapNonEmpty!14037 () Bool)

(declare-fun mapRes!14037 () Bool)

(declare-fun tp!28113 () Bool)

(declare-fun e!221053 () Bool)

(assert (=> mapNonEmpty!14037 (= mapRes!14037 (and tp!28113 e!221053))))

(declare-fun mapKey!14037 () (_ BitVec 32))

(declare-fun mapValue!14037 () ValueCell!3832)

(declare-fun mapRest!14037 () (Array (_ BitVec 32) ValueCell!3832))

(assert (=> mapNonEmpty!14037 (= (arr!9618 _values!1277) (store mapRest!14037 mapKey!14037 mapValue!14037))))

(declare-fun b!361074 () Bool)

(declare-fun e!221054 () Bool)

(declare-fun tp_is_empty!8351 () Bool)

(assert (=> b!361074 (= e!221054 tp_is_empty!8351)))

(declare-fun mapIsEmpty!14037 () Bool)

(assert (=> mapIsEmpty!14037 mapRes!14037))

(declare-fun b!361075 () Bool)

(assert (=> b!361075 (= e!221053 tp_is_empty!8351)))

(declare-fun b!361076 () Bool)

(declare-fun e!221056 () Bool)

(assert (=> b!361076 (= e!221056 (and e!221054 mapRes!14037))))

(declare-fun condMapEmpty!14037 () Bool)

(declare-fun mapDefault!14037 () ValueCell!3832)

