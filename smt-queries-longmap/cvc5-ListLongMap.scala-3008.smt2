; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42366 () Bool)

(assert start!42366)

(declare-fun b_free!11857 () Bool)

(declare-fun b_next!11857 () Bool)

(assert (=> start!42366 (= b_free!11857 (not b_next!11857))))

(declare-fun tp!41602 () Bool)

(declare-fun b_and!20303 () Bool)

(assert (=> start!42366 (= tp!41602 b_and!20303)))

(declare-fun b!472708 () Bool)

(declare-fun res!282376 () Bool)

(declare-fun e!277223 () Bool)

(assert (=> b!472708 (=> (not res!282376) (not e!277223))))

(declare-datatypes ((array!30327 0))(
  ( (array!30328 (arr!14584 (Array (_ BitVec 32) (_ BitVec 64))) (size!14936 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30327)

(declare-datatypes ((List!8889 0))(
  ( (Nil!8886) (Cons!8885 (h!9741 (_ BitVec 64)) (t!14857 List!8889)) )
))
(declare-fun arrayNoDuplicates!0 (array!30327 (_ BitVec 32) List!8889) Bool)

(assert (=> b!472708 (= res!282376 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8886))))

(declare-fun res!282375 () Bool)

(assert (=> start!42366 (=> (not res!282375) (not e!277223))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42366 (= res!282375 (validMask!0 mask!1365))))

(assert (=> start!42366 e!277223))

(declare-fun tp_is_empty!13285 () Bool)

(assert (=> start!42366 tp_is_empty!13285))

(assert (=> start!42366 tp!41602))

(assert (=> start!42366 true))

(declare-fun array_inv!10516 (array!30327) Bool)

(assert (=> start!42366 (array_inv!10516 _keys!1025)))

(declare-datatypes ((V!18819 0))(
  ( (V!18820 (val!6687 Int)) )
))
(declare-datatypes ((ValueCell!6299 0))(
  ( (ValueCellFull!6299 (v!8978 V!18819)) (EmptyCell!6299) )
))
(declare-datatypes ((array!30329 0))(
  ( (array!30330 (arr!14585 (Array (_ BitVec 32) ValueCell!6299)) (size!14937 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30329)

(declare-fun e!277224 () Bool)

(declare-fun array_inv!10517 (array!30329) Bool)

(assert (=> start!42366 (and (array_inv!10517 _values!833) e!277224)))

(declare-fun b!472709 () Bool)

(declare-fun e!277222 () Bool)

(assert (=> b!472709 (= e!277222 (bvsle #b00000000000000000000000000000000 (size!14936 _keys!1025)))))

(declare-datatypes ((tuple2!8806 0))(
  ( (tuple2!8807 (_1!4414 (_ BitVec 64)) (_2!4414 V!18819)) )
))
(declare-datatypes ((List!8890 0))(
  ( (Nil!8887) (Cons!8886 (h!9742 tuple2!8806) (t!14858 List!8890)) )
))
(declare-datatypes ((ListLongMap!7719 0))(
  ( (ListLongMap!7720 (toList!3875 List!8890)) )
))
(declare-fun lt!214480 () ListLongMap!7719)

(declare-fun minValueBefore!38 () V!18819)

(declare-fun zeroValue!794 () V!18819)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2244 (array!30327 array!30329 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7719)

(assert (=> b!472709 (= lt!214480 (getCurrentListMap!2244 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21637 () Bool)

(declare-fun mapRes!21637 () Bool)

(assert (=> mapIsEmpty!21637 mapRes!21637))

(declare-fun b!472710 () Bool)

(declare-fun e!277221 () Bool)

(assert (=> b!472710 (= e!277221 tp_is_empty!13285)))

(declare-fun b!472711 () Bool)

(declare-fun e!277220 () Bool)

(assert (=> b!472711 (= e!277220 tp_is_empty!13285)))

(declare-fun b!472712 () Bool)

(assert (=> b!472712 (= e!277223 (not e!277222))))

(declare-fun res!282374 () Bool)

(assert (=> b!472712 (=> res!282374 e!277222)))

(assert (=> b!472712 (= res!282374 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214479 () ListLongMap!7719)

(declare-fun lt!214481 () ListLongMap!7719)

(assert (=> b!472712 (= lt!214479 lt!214481)))

(declare-fun minValueAfter!38 () V!18819)

(declare-datatypes ((Unit!13905 0))(
  ( (Unit!13906) )
))
(declare-fun lt!214482 () Unit!13905)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!216 (array!30327 array!30329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 V!18819 V!18819 (_ BitVec 32) Int) Unit!13905)

(assert (=> b!472712 (= lt!214482 (lemmaNoChangeToArrayThenSameMapNoExtras!216 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2036 (array!30327 array!30329 (_ BitVec 32) (_ BitVec 32) V!18819 V!18819 (_ BitVec 32) Int) ListLongMap!7719)

(assert (=> b!472712 (= lt!214481 (getCurrentListMapNoExtraKeys!2036 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472712 (= lt!214479 (getCurrentListMapNoExtraKeys!2036 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21637 () Bool)

(declare-fun tp!41601 () Bool)

(assert (=> mapNonEmpty!21637 (= mapRes!21637 (and tp!41601 e!277220))))

(declare-fun mapRest!21637 () (Array (_ BitVec 32) ValueCell!6299))

(declare-fun mapKey!21637 () (_ BitVec 32))

(declare-fun mapValue!21637 () ValueCell!6299)

(assert (=> mapNonEmpty!21637 (= (arr!14585 _values!833) (store mapRest!21637 mapKey!21637 mapValue!21637))))

(declare-fun b!472713 () Bool)

(declare-fun res!282377 () Bool)

(assert (=> b!472713 (=> (not res!282377) (not e!277223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30327 (_ BitVec 32)) Bool)

(assert (=> b!472713 (= res!282377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472714 () Bool)

(assert (=> b!472714 (= e!277224 (and e!277221 mapRes!21637))))

(declare-fun condMapEmpty!21637 () Bool)

(declare-fun mapDefault!21637 () ValueCell!6299)

