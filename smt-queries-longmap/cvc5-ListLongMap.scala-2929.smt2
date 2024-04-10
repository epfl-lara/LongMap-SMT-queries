; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41762 () Bool)

(assert start!41762)

(declare-fun b_free!11383 () Bool)

(declare-fun b_next!11383 () Bool)

(assert (=> start!41762 (= b_free!11383 (not b_next!11383))))

(declare-fun tp!40155 () Bool)

(declare-fun b_and!19751 () Bool)

(assert (=> start!41762 (= tp!40155 b_and!19751)))

(declare-fun b!466314 () Bool)

(declare-fun e!272632 () Bool)

(declare-fun e!272630 () Bool)

(assert (=> b!466314 (= e!272632 (not e!272630))))

(declare-fun res!278725 () Bool)

(assert (=> b!466314 (=> res!278725 e!272630)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!466314 (= res!278725 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18187 0))(
  ( (V!18188 (val!6450 Int)) )
))
(declare-datatypes ((tuple2!8454 0))(
  ( (tuple2!8455 (_1!4238 (_ BitVec 64)) (_2!4238 V!18187)) )
))
(declare-datatypes ((List!8546 0))(
  ( (Nil!8543) (Cons!8542 (h!9398 tuple2!8454) (t!14498 List!8546)) )
))
(declare-datatypes ((ListLongMap!7367 0))(
  ( (ListLongMap!7368 (toList!3699 List!8546)) )
))
(declare-fun lt!210714 () ListLongMap!7367)

(declare-fun lt!210717 () ListLongMap!7367)

(assert (=> b!466314 (= lt!210714 lt!210717)))

(declare-fun minValueBefore!38 () V!18187)

(declare-fun zeroValue!794 () V!18187)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13564 0))(
  ( (Unit!13565) )
))
(declare-fun lt!210715 () Unit!13564)

(declare-datatypes ((array!29405 0))(
  ( (array!29406 (arr!14131 (Array (_ BitVec 32) (_ BitVec 64))) (size!14483 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29405)

(declare-datatypes ((ValueCell!6062 0))(
  ( (ValueCellFull!6062 (v!8738 V!18187)) (EmptyCell!6062) )
))
(declare-datatypes ((array!29407 0))(
  ( (array!29408 (arr!14132 (Array (_ BitVec 32) ValueCell!6062)) (size!14484 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29407)

(declare-fun minValueAfter!38 () V!18187)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!57 (array!29405 array!29407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 V!18187 V!18187 (_ BitVec 32) Int) Unit!13564)

(assert (=> b!466314 (= lt!210715 (lemmaNoChangeToArrayThenSameMapNoExtras!57 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1877 (array!29405 array!29407 (_ BitVec 32) (_ BitVec 32) V!18187 V!18187 (_ BitVec 32) Int) ListLongMap!7367)

(assert (=> b!466314 (= lt!210717 (getCurrentListMapNoExtraKeys!1877 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466314 (= lt!210714 (getCurrentListMapNoExtraKeys!1877 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466315 () Bool)

(declare-fun e!272633 () Bool)

(declare-fun tp_is_empty!12811 () Bool)

(assert (=> b!466315 (= e!272633 tp_is_empty!12811)))

(declare-fun b!466316 () Bool)

(declare-fun res!278727 () Bool)

(assert (=> b!466316 (=> (not res!278727) (not e!272632))))

(assert (=> b!466316 (= res!278727 (and (= (size!14484 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14483 _keys!1025) (size!14484 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466317 () Bool)

(declare-fun res!278729 () Bool)

(assert (=> b!466317 (=> (not res!278729) (not e!272632))))

(declare-datatypes ((List!8547 0))(
  ( (Nil!8544) (Cons!8543 (h!9399 (_ BitVec 64)) (t!14499 List!8547)) )
))
(declare-fun arrayNoDuplicates!0 (array!29405 (_ BitVec 32) List!8547) Bool)

(assert (=> b!466317 (= res!278729 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8544))))

(declare-fun b!466318 () Bool)

(declare-fun res!278726 () Bool)

(assert (=> b!466318 (=> (not res!278726) (not e!272632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29405 (_ BitVec 32)) Bool)

(assert (=> b!466318 (= res!278726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466319 () Bool)

(declare-fun e!272635 () Bool)

(declare-fun mapRes!20902 () Bool)

(assert (=> b!466319 (= e!272635 (and e!272633 mapRes!20902))))

(declare-fun condMapEmpty!20902 () Bool)

(declare-fun mapDefault!20902 () ValueCell!6062)

