; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41668 () Bool)

(assert start!41668)

(declare-fun b_free!11321 () Bool)

(declare-fun b_next!11321 () Bool)

(assert (=> start!41668 (= b_free!11321 (not b_next!11321))))

(declare-fun tp!39964 () Bool)

(declare-fun b_and!19669 () Bool)

(assert (=> start!41668 (= tp!39964 b_and!19669)))

(declare-fun b!465302 () Bool)

(declare-fun res!278149 () Bool)

(declare-fun e!271908 () Bool)

(assert (=> b!465302 (=> (not res!278149) (not e!271908))))

(declare-datatypes ((array!29281 0))(
  ( (array!29282 (arr!14071 (Array (_ BitVec 32) (_ BitVec 64))) (size!14423 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29281)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29281 (_ BitVec 32)) Bool)

(assert (=> b!465302 (= res!278149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465303 () Bool)

(declare-fun e!271909 () Bool)

(declare-fun tp_is_empty!12749 () Bool)

(assert (=> b!465303 (= e!271909 tp_is_empty!12749)))

(declare-fun b!465304 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465304 (= e!271908 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14423 _keys!1025)))))))

(declare-datatypes ((V!18103 0))(
  ( (V!18104 (val!6419 Int)) )
))
(declare-datatypes ((tuple2!8410 0))(
  ( (tuple2!8411 (_1!4216 (_ BitVec 64)) (_2!4216 V!18103)) )
))
(declare-datatypes ((List!8504 0))(
  ( (Nil!8501) (Cons!8500 (h!9356 tuple2!8410) (t!14452 List!8504)) )
))
(declare-datatypes ((ListLongMap!7323 0))(
  ( (ListLongMap!7324 (toList!3677 List!8504)) )
))
(declare-fun lt!210088 () ListLongMap!7323)

(declare-fun lt!210090 () ListLongMap!7323)

(assert (=> b!465304 (= lt!210088 lt!210090)))

(declare-fun minValueBefore!38 () V!18103)

(declare-datatypes ((Unit!13522 0))(
  ( (Unit!13523) )
))
(declare-fun lt!210089 () Unit!13522)

(declare-fun zeroValue!794 () V!18103)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6031 0))(
  ( (ValueCellFull!6031 (v!8706 V!18103)) (EmptyCell!6031) )
))
(declare-datatypes ((array!29283 0))(
  ( (array!29284 (arr!14072 (Array (_ BitVec 32) ValueCell!6031)) (size!14424 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29283)

(declare-fun minValueAfter!38 () V!18103)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!37 (array!29281 array!29283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18103 V!18103 V!18103 V!18103 (_ BitVec 32) Int) Unit!13522)

(assert (=> b!465304 (= lt!210089 (lemmaNoChangeToArrayThenSameMapNoExtras!37 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1857 (array!29281 array!29283 (_ BitVec 32) (_ BitVec 32) V!18103 V!18103 (_ BitVec 32) Int) ListLongMap!7323)

(assert (=> b!465304 (= lt!210090 (getCurrentListMapNoExtraKeys!1857 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465304 (= lt!210088 (getCurrentListMapNoExtraKeys!1857 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20803 () Bool)

(declare-fun mapRes!20803 () Bool)

(declare-fun tp!39963 () Bool)

(assert (=> mapNonEmpty!20803 (= mapRes!20803 (and tp!39963 e!271909))))

(declare-fun mapKey!20803 () (_ BitVec 32))

(declare-fun mapValue!20803 () ValueCell!6031)

(declare-fun mapRest!20803 () (Array (_ BitVec 32) ValueCell!6031))

(assert (=> mapNonEmpty!20803 (= (arr!14072 _values!833) (store mapRest!20803 mapKey!20803 mapValue!20803))))

(declare-fun res!278150 () Bool)

(assert (=> start!41668 (=> (not res!278150) (not e!271908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41668 (= res!278150 (validMask!0 mask!1365))))

(assert (=> start!41668 e!271908))

(assert (=> start!41668 tp_is_empty!12749))

(assert (=> start!41668 tp!39964))

(assert (=> start!41668 true))

(declare-fun array_inv!10168 (array!29281) Bool)

(assert (=> start!41668 (array_inv!10168 _keys!1025)))

(declare-fun e!271912 () Bool)

(declare-fun array_inv!10169 (array!29283) Bool)

(assert (=> start!41668 (and (array_inv!10169 _values!833) e!271912)))

(declare-fun b!465305 () Bool)

(declare-fun res!278151 () Bool)

(assert (=> b!465305 (=> (not res!278151) (not e!271908))))

(assert (=> b!465305 (= res!278151 (and (= (size!14424 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14423 _keys!1025) (size!14424 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465306 () Bool)

(declare-fun e!271910 () Bool)

(assert (=> b!465306 (= e!271910 tp_is_empty!12749)))

(declare-fun b!465307 () Bool)

(assert (=> b!465307 (= e!271912 (and e!271910 mapRes!20803))))

(declare-fun condMapEmpty!20803 () Bool)

(declare-fun mapDefault!20803 () ValueCell!6031)

