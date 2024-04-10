; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41534 () Bool)

(assert start!41534)

(declare-fun b_free!11201 () Bool)

(declare-fun b_next!11201 () Bool)

(assert (=> start!41534 (= b_free!11201 (not b_next!11201))))

(declare-fun tp!39601 () Bool)

(declare-fun b_and!19541 () Bool)

(assert (=> start!41534 (= tp!39601 b_and!19541)))

(declare-fun b!463957 () Bool)

(declare-fun res!277400 () Bool)

(declare-fun e!270954 () Bool)

(assert (=> b!463957 (=> (not res!277400) (not e!270954))))

(declare-datatypes ((array!29047 0))(
  ( (array!29048 (arr!13955 (Array (_ BitVec 32) (_ BitVec 64))) (size!14307 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29047)

(declare-datatypes ((List!8425 0))(
  ( (Nil!8422) (Cons!8421 (h!9277 (_ BitVec 64)) (t!14371 List!8425)) )
))
(declare-fun arrayNoDuplicates!0 (array!29047 (_ BitVec 32) List!8425) Bool)

(assert (=> b!463957 (= res!277400 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8422))))

(declare-fun b!463958 () Bool)

(declare-fun res!277398 () Bool)

(assert (=> b!463958 (=> (not res!277398) (not e!270954))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17943 0))(
  ( (V!17944 (val!6359 Int)) )
))
(declare-datatypes ((ValueCell!5971 0))(
  ( (ValueCellFull!5971 (v!8646 V!17943)) (EmptyCell!5971) )
))
(declare-datatypes ((array!29049 0))(
  ( (array!29050 (arr!13956 (Array (_ BitVec 32) ValueCell!5971)) (size!14308 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29049)

(assert (=> b!463958 (= res!277398 (and (= (size!14308 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14307 _keys!1025) (size!14308 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20620 () Bool)

(declare-fun mapRes!20620 () Bool)

(declare-fun tp!39600 () Bool)

(declare-fun e!270955 () Bool)

(assert (=> mapNonEmpty!20620 (= mapRes!20620 (and tp!39600 e!270955))))

(declare-fun mapRest!20620 () (Array (_ BitVec 32) ValueCell!5971))

(declare-fun mapValue!20620 () ValueCell!5971)

(declare-fun mapKey!20620 () (_ BitVec 32))

(assert (=> mapNonEmpty!20620 (= (arr!13956 _values!833) (store mapRest!20620 mapKey!20620 mapValue!20620))))

(declare-fun b!463959 () Bool)

(declare-fun e!270953 () Bool)

(declare-fun tp_is_empty!12629 () Bool)

(assert (=> b!463959 (= e!270953 tp_is_empty!12629)))

(declare-fun b!463960 () Bool)

(assert (=> b!463960 (= e!270954 false)))

(declare-fun zeroValue!794 () V!17943)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8330 0))(
  ( (tuple2!8331 (_1!4176 (_ BitVec 64)) (_2!4176 V!17943)) )
))
(declare-datatypes ((List!8426 0))(
  ( (Nil!8423) (Cons!8422 (h!9278 tuple2!8330) (t!14372 List!8426)) )
))
(declare-datatypes ((ListLongMap!7243 0))(
  ( (ListLongMap!7244 (toList!3637 List!8426)) )
))
(declare-fun lt!209528 () ListLongMap!7243)

(declare-fun minValueAfter!38 () V!17943)

(declare-fun getCurrentListMapNoExtraKeys!1817 (array!29047 array!29049 (_ BitVec 32) (_ BitVec 32) V!17943 V!17943 (_ BitVec 32) Int) ListLongMap!7243)

(assert (=> b!463960 (= lt!209528 (getCurrentListMapNoExtraKeys!1817 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17943)

(declare-fun lt!209527 () ListLongMap!7243)

(assert (=> b!463960 (= lt!209527 (getCurrentListMapNoExtraKeys!1817 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463961 () Bool)

(declare-fun res!277399 () Bool)

(assert (=> b!463961 (=> (not res!277399) (not e!270954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29047 (_ BitVec 32)) Bool)

(assert (=> b!463961 (= res!277399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20620 () Bool)

(assert (=> mapIsEmpty!20620 mapRes!20620))

(declare-fun res!277397 () Bool)

(assert (=> start!41534 (=> (not res!277397) (not e!270954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41534 (= res!277397 (validMask!0 mask!1365))))

(assert (=> start!41534 e!270954))

(assert (=> start!41534 tp_is_empty!12629))

(assert (=> start!41534 tp!39601))

(assert (=> start!41534 true))

(declare-fun array_inv!10086 (array!29047) Bool)

(assert (=> start!41534 (array_inv!10086 _keys!1025)))

(declare-fun e!270957 () Bool)

(declare-fun array_inv!10087 (array!29049) Bool)

(assert (=> start!41534 (and (array_inv!10087 _values!833) e!270957)))

(declare-fun b!463962 () Bool)

(assert (=> b!463962 (= e!270955 tp_is_empty!12629)))

(declare-fun b!463963 () Bool)

(assert (=> b!463963 (= e!270957 (and e!270953 mapRes!20620))))

(declare-fun condMapEmpty!20620 () Bool)

(declare-fun mapDefault!20620 () ValueCell!5971)

