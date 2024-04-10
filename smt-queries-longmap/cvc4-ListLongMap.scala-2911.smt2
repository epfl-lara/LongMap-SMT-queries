; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41626 () Bool)

(assert start!41626)

(declare-fun b_free!11279 () Bool)

(declare-fun b_next!11279 () Bool)

(assert (=> start!41626 (= b_free!11279 (not b_next!11279))))

(declare-fun tp!39838 () Bool)

(declare-fun b_and!19627 () Bool)

(assert (=> start!41626 (= tp!39838 b_and!19627)))

(declare-fun b!464861 () Bool)

(declare-fun res!277899 () Bool)

(declare-fun e!271596 () Bool)

(assert (=> b!464861 (=> (not res!277899) (not e!271596))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29199 0))(
  ( (array!29200 (arr!14030 (Array (_ BitVec 32) (_ BitVec 64))) (size!14382 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29199)

(declare-datatypes ((V!18047 0))(
  ( (V!18048 (val!6398 Int)) )
))
(declare-datatypes ((ValueCell!6010 0))(
  ( (ValueCellFull!6010 (v!8685 V!18047)) (EmptyCell!6010) )
))
(declare-datatypes ((array!29201 0))(
  ( (array!29202 (arr!14031 (Array (_ BitVec 32) ValueCell!6010)) (size!14383 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29201)

(assert (=> b!464861 (= res!277899 (and (= (size!14383 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14382 _keys!1025) (size!14383 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464862 () Bool)

(assert (=> b!464862 (= e!271596 (not true))))

(declare-datatypes ((tuple2!8382 0))(
  ( (tuple2!8383 (_1!4202 (_ BitVec 64)) (_2!4202 V!18047)) )
))
(declare-datatypes ((List!8474 0))(
  ( (Nil!8471) (Cons!8470 (h!9326 tuple2!8382) (t!14422 List!8474)) )
))
(declare-datatypes ((ListLongMap!7295 0))(
  ( (ListLongMap!7296 (toList!3663 List!8474)) )
))
(declare-fun lt!209900 () ListLongMap!7295)

(declare-fun lt!209899 () ListLongMap!7295)

(assert (=> b!464862 (= lt!209900 lt!209899)))

(declare-datatypes ((Unit!13494 0))(
  ( (Unit!13495) )
))
(declare-fun lt!209901 () Unit!13494)

(declare-fun minValueBefore!38 () V!18047)

(declare-fun zeroValue!794 () V!18047)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18047)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!23 (array!29199 array!29201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18047 V!18047 V!18047 V!18047 (_ BitVec 32) Int) Unit!13494)

(assert (=> b!464862 (= lt!209901 (lemmaNoChangeToArrayThenSameMapNoExtras!23 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1843 (array!29199 array!29201 (_ BitVec 32) (_ BitVec 32) V!18047 V!18047 (_ BitVec 32) Int) ListLongMap!7295)

(assert (=> b!464862 (= lt!209899 (getCurrentListMapNoExtraKeys!1843 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464862 (= lt!209900 (getCurrentListMapNoExtraKeys!1843 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20740 () Bool)

(declare-fun mapRes!20740 () Bool)

(assert (=> mapIsEmpty!20740 mapRes!20740))

(declare-fun b!464863 () Bool)

(declare-fun e!271597 () Bool)

(declare-fun tp_is_empty!12707 () Bool)

(assert (=> b!464863 (= e!271597 tp_is_empty!12707)))

(declare-fun res!277897 () Bool)

(assert (=> start!41626 (=> (not res!277897) (not e!271596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41626 (= res!277897 (validMask!0 mask!1365))))

(assert (=> start!41626 e!271596))

(assert (=> start!41626 tp_is_empty!12707))

(assert (=> start!41626 tp!39838))

(assert (=> start!41626 true))

(declare-fun array_inv!10132 (array!29199) Bool)

(assert (=> start!41626 (array_inv!10132 _keys!1025)))

(declare-fun e!271593 () Bool)

(declare-fun array_inv!10133 (array!29201) Bool)

(assert (=> start!41626 (and (array_inv!10133 _values!833) e!271593)))

(declare-fun b!464864 () Bool)

(assert (=> b!464864 (= e!271593 (and e!271597 mapRes!20740))))

(declare-fun condMapEmpty!20740 () Bool)

(declare-fun mapDefault!20740 () ValueCell!6010)

