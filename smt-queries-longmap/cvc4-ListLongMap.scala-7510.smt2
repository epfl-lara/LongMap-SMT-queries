; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95240 () Bool)

(assert start!95240)

(declare-fun b_free!22241 () Bool)

(declare-fun b_next!22241 () Bool)

(assert (=> start!95240 (= b_free!22241 (not b_next!22241))))

(declare-fun tp!78220 () Bool)

(declare-fun b_and!35219 () Bool)

(assert (=> start!95240 (= tp!78220 b_and!35219)))

(declare-fun mapIsEmpty!40822 () Bool)

(declare-fun mapRes!40822 () Bool)

(assert (=> mapIsEmpty!40822 mapRes!40822))

(declare-fun mapNonEmpty!40822 () Bool)

(declare-fun tp!78221 () Bool)

(declare-fun e!615377 () Bool)

(assert (=> mapNonEmpty!40822 (= mapRes!40822 (and tp!78221 e!615377))))

(declare-datatypes ((V!39869 0))(
  ( (V!39870 (val!13076 Int)) )
))
(declare-datatypes ((ValueCell!12322 0))(
  ( (ValueCellFull!12322 (v!15704 V!39869)) (EmptyCell!12322) )
))
(declare-fun mapRest!40822 () (Array (_ BitVec 32) ValueCell!12322))

(declare-fun mapKey!40822 () (_ BitVec 32))

(declare-fun mapValue!40822 () ValueCell!12322)

(declare-datatypes ((array!69073 0))(
  ( (array!69074 (arr!33219 (Array (_ BitVec 32) ValueCell!12322)) (size!33755 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69073)

(assert (=> mapNonEmpty!40822 (= (arr!33219 _values!955) (store mapRest!40822 mapKey!40822 mapValue!40822))))

(declare-fun b!1076525 () Bool)

(declare-fun res!717496 () Bool)

(declare-fun e!615376 () Bool)

(assert (=> b!1076525 (=> (not res!717496) (not e!615376))))

(declare-datatypes ((array!69075 0))(
  ( (array!69076 (arr!33220 (Array (_ BitVec 32) (_ BitVec 64))) (size!33756 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69075)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69075 (_ BitVec 32)) Bool)

(assert (=> b!1076525 (= res!717496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-datatypes ((tuple2!16662 0))(
  ( (tuple2!16663 (_1!8342 (_ BitVec 64)) (_2!8342 V!39869)) )
))
(declare-datatypes ((List!23196 0))(
  ( (Nil!23193) (Cons!23192 (h!24401 tuple2!16662) (t!32555 List!23196)) )
))
(declare-datatypes ((ListLongMap!14631 0))(
  ( (ListLongMap!14632 (toList!7331 List!23196)) )
))
(declare-fun lt!478255 () ListLongMap!14631)

(declare-fun lt!478256 () tuple2!16662)

(declare-fun b!1076526 () Bool)

(declare-fun lt!478252 () ListLongMap!14631)

(declare-fun e!615374 () Bool)

(declare-fun +!3236 (ListLongMap!14631 tuple2!16662) ListLongMap!14631)

(assert (=> b!1076526 (= e!615374 (= lt!478255 (+!3236 lt!478252 lt!478256)))))

(declare-fun b!1076527 () Bool)

(declare-fun tp_is_empty!26051 () Bool)

(assert (=> b!1076527 (= e!615377 tp_is_empty!26051)))

(declare-fun b!1076528 () Bool)

(declare-fun res!717497 () Bool)

(assert (=> b!1076528 (=> (not res!717497) (not e!615376))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076528 (= res!717497 (and (= (size!33755 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33756 _keys!1163) (size!33755 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076529 () Bool)

(declare-fun e!615372 () Bool)

(assert (=> b!1076529 (= e!615372 tp_is_empty!26051)))

(declare-fun b!1076530 () Bool)

(declare-fun e!615378 () Bool)

(assert (=> b!1076530 (= e!615378 (and e!615372 mapRes!40822))))

(declare-fun condMapEmpty!40822 () Bool)

(declare-fun mapDefault!40822 () ValueCell!12322)

