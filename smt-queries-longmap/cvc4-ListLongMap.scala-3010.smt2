; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42398 () Bool)

(assert start!42398)

(declare-fun b_free!11873 () Bool)

(declare-fun b_next!11873 () Bool)

(assert (=> start!42398 (= b_free!11873 (not b_next!11873))))

(declare-fun tp!41652 () Bool)

(declare-fun b_and!20329 () Bool)

(assert (=> start!42398 (= tp!41652 b_and!20329)))

(declare-fun b!473048 () Bool)

(declare-fun e!277458 () Bool)

(assert (=> b!473048 (= e!277458 true)))

(declare-datatypes ((V!18839 0))(
  ( (V!18840 (val!6695 Int)) )
))
(declare-datatypes ((tuple2!8820 0))(
  ( (tuple2!8821 (_1!4421 (_ BitVec 64)) (_2!4421 V!18839)) )
))
(declare-datatypes ((List!8904 0))(
  ( (Nil!8901) (Cons!8900 (h!9756 tuple2!8820) (t!14874 List!8904)) )
))
(declare-datatypes ((ListLongMap!7733 0))(
  ( (ListLongMap!7734 (toList!3882 List!8904)) )
))
(declare-fun lt!214756 () ListLongMap!7733)

(declare-fun lt!214751 () tuple2!8820)

(declare-fun minValueBefore!38 () V!18839)

(declare-fun +!1722 (ListLongMap!7733 tuple2!8820) ListLongMap!7733)

(assert (=> b!473048 (= (+!1722 lt!214756 lt!214751) (+!1722 (+!1722 lt!214756 (tuple2!8821 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214751))))

(declare-fun minValueAfter!38 () V!18839)

(assert (=> b!473048 (= lt!214751 (tuple2!8821 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13920 0))(
  ( (Unit!13921) )
))
(declare-fun lt!214750 () Unit!13920)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!131 (ListLongMap!7733 (_ BitVec 64) V!18839 V!18839) Unit!13920)

(assert (=> b!473048 (= lt!214750 (addSameAsAddTwiceSameKeyDiffValues!131 lt!214756 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214755 () ListLongMap!7733)

(declare-fun zeroValue!794 () V!18839)

(assert (=> b!473048 (= lt!214756 (+!1722 lt!214755 (tuple2!8821 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214752 () ListLongMap!7733)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30361 0))(
  ( (array!30362 (arr!14600 (Array (_ BitVec 32) (_ BitVec 64))) (size!14952 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30361)

(declare-datatypes ((ValueCell!6307 0))(
  ( (ValueCellFull!6307 (v!8986 V!18839)) (EmptyCell!6307) )
))
(declare-datatypes ((array!30363 0))(
  ( (array!30364 (arr!14601 (Array (_ BitVec 32) ValueCell!6307)) (size!14953 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30363)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2251 (array!30361 array!30363 (_ BitVec 32) (_ BitVec 32) V!18839 V!18839 (_ BitVec 32) Int) ListLongMap!7733)

(assert (=> b!473048 (= lt!214752 (getCurrentListMap!2251 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214749 () ListLongMap!7733)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473048 (= lt!214749 (getCurrentListMap!2251 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473049 () Bool)

(declare-fun e!277459 () Bool)

(declare-fun tp_is_empty!13301 () Bool)

(assert (=> b!473049 (= e!277459 tp_is_empty!13301)))

(declare-fun b!473050 () Bool)

(declare-fun res!282556 () Bool)

(declare-fun e!277462 () Bool)

(assert (=> b!473050 (=> (not res!282556) (not e!277462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30361 (_ BitVec 32)) Bool)

(assert (=> b!473050 (= res!282556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!282553 () Bool)

(assert (=> start!42398 (=> (not res!282553) (not e!277462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42398 (= res!282553 (validMask!0 mask!1365))))

(assert (=> start!42398 e!277462))

(assert (=> start!42398 tp_is_empty!13301))

(assert (=> start!42398 tp!41652))

(assert (=> start!42398 true))

(declare-fun array_inv!10530 (array!30361) Bool)

(assert (=> start!42398 (array_inv!10530 _keys!1025)))

(declare-fun e!277461 () Bool)

(declare-fun array_inv!10531 (array!30363) Bool)

(assert (=> start!42398 (and (array_inv!10531 _values!833) e!277461)))

(declare-fun mapIsEmpty!21664 () Bool)

(declare-fun mapRes!21664 () Bool)

(assert (=> mapIsEmpty!21664 mapRes!21664))

(declare-fun b!473051 () Bool)

(declare-fun res!282554 () Bool)

(assert (=> b!473051 (=> (not res!282554) (not e!277462))))

(assert (=> b!473051 (= res!282554 (and (= (size!14953 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14952 _keys!1025) (size!14953 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473052 () Bool)

(assert (=> b!473052 (= e!277462 (not e!277458))))

(declare-fun res!282555 () Bool)

(assert (=> b!473052 (=> res!282555 e!277458)))

(assert (=> b!473052 (= res!282555 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214754 () ListLongMap!7733)

(assert (=> b!473052 (= lt!214755 lt!214754)))

(declare-fun lt!214753 () Unit!13920)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!222 (array!30361 array!30363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18839 V!18839 V!18839 V!18839 (_ BitVec 32) Int) Unit!13920)

(assert (=> b!473052 (= lt!214753 (lemmaNoChangeToArrayThenSameMapNoExtras!222 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2042 (array!30361 array!30363 (_ BitVec 32) (_ BitVec 32) V!18839 V!18839 (_ BitVec 32) Int) ListLongMap!7733)

(assert (=> b!473052 (= lt!214754 (getCurrentListMapNoExtraKeys!2042 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473052 (= lt!214755 (getCurrentListMapNoExtraKeys!2042 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21664 () Bool)

(declare-fun tp!41653 () Bool)

(assert (=> mapNonEmpty!21664 (= mapRes!21664 (and tp!41653 e!277459))))

(declare-fun mapKey!21664 () (_ BitVec 32))

(declare-fun mapValue!21664 () ValueCell!6307)

(declare-fun mapRest!21664 () (Array (_ BitVec 32) ValueCell!6307))

(assert (=> mapNonEmpty!21664 (= (arr!14601 _values!833) (store mapRest!21664 mapKey!21664 mapValue!21664))))

(declare-fun b!473053 () Bool)

(declare-fun e!277463 () Bool)

(assert (=> b!473053 (= e!277463 tp_is_empty!13301)))

(declare-fun b!473054 () Bool)

(assert (=> b!473054 (= e!277461 (and e!277463 mapRes!21664))))

(declare-fun condMapEmpty!21664 () Bool)

(declare-fun mapDefault!21664 () ValueCell!6307)

