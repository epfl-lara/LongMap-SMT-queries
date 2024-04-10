; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42466 () Bool)

(assert start!42466)

(declare-fun b_free!11921 () Bool)

(declare-fun b_next!11921 () Bool)

(assert (=> start!42466 (= b_free!11921 (not b_next!11921))))

(declare-fun tp!41800 () Bool)

(declare-fun b_and!20389 () Bool)

(assert (=> start!42466 (= tp!41800 b_and!20389)))

(declare-fun b!473805 () Bool)

(declare-fun res!282993 () Bool)

(declare-fun e!278004 () Bool)

(assert (=> b!473805 (=> (not res!282993) (not e!278004))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30455 0))(
  ( (array!30456 (arr!14646 (Array (_ BitVec 32) (_ BitVec 64))) (size!14998 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30455)

(declare-datatypes ((V!18903 0))(
  ( (V!18904 (val!6719 Int)) )
))
(declare-datatypes ((ValueCell!6331 0))(
  ( (ValueCellFull!6331 (v!9011 V!18903)) (EmptyCell!6331) )
))
(declare-datatypes ((array!30457 0))(
  ( (array!30458 (arr!14647 (Array (_ BitVec 32) ValueCell!6331)) (size!14999 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30457)

(assert (=> b!473805 (= res!282993 (and (= (size!14999 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14998 _keys!1025) (size!14999 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473806 () Bool)

(declare-fun e!278005 () Bool)

(assert (=> b!473806 (= e!278004 (not e!278005))))

(declare-fun res!282991 () Bool)

(assert (=> b!473806 (=> res!282991 e!278005)))

(assert (=> b!473806 (= res!282991 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8856 0))(
  ( (tuple2!8857 (_1!4439 (_ BitVec 64)) (_2!4439 V!18903)) )
))
(declare-datatypes ((List!8937 0))(
  ( (Nil!8934) (Cons!8933 (h!9789 tuple2!8856) (t!14909 List!8937)) )
))
(declare-datatypes ((ListLongMap!7769 0))(
  ( (ListLongMap!7770 (toList!3900 List!8937)) )
))
(declare-fun lt!215481 () ListLongMap!7769)

(declare-fun lt!215487 () ListLongMap!7769)

(assert (=> b!473806 (= lt!215481 lt!215487)))

(declare-fun minValueBefore!38 () V!18903)

(declare-fun zeroValue!794 () V!18903)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18903)

(declare-datatypes ((Unit!13958 0))(
  ( (Unit!13959) )
))
(declare-fun lt!215482 () Unit!13958)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!240 (array!30455 array!30457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18903 V!18903 V!18903 V!18903 (_ BitVec 32) Int) Unit!13958)

(assert (=> b!473806 (= lt!215482 (lemmaNoChangeToArrayThenSameMapNoExtras!240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2060 (array!30455 array!30457 (_ BitVec 32) (_ BitVec 32) V!18903 V!18903 (_ BitVec 32) Int) ListLongMap!7769)

(assert (=> b!473806 (= lt!215487 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473806 (= lt!215481 (getCurrentListMapNoExtraKeys!2060 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473807 () Bool)

(declare-fun e!278003 () Bool)

(declare-fun tp_is_empty!13349 () Bool)

(assert (=> b!473807 (= e!278003 tp_is_empty!13349)))

(declare-fun b!473808 () Bool)

(declare-fun res!282995 () Bool)

(assert (=> b!473808 (=> (not res!282995) (not e!278004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30455 (_ BitVec 32)) Bool)

(assert (=> b!473808 (= res!282995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473809 () Bool)

(declare-fun e!278006 () Bool)

(declare-fun e!278007 () Bool)

(declare-fun mapRes!21739 () Bool)

(assert (=> b!473809 (= e!278006 (and e!278007 mapRes!21739))))

(declare-fun condMapEmpty!21739 () Bool)

(declare-fun mapDefault!21739 () ValueCell!6331)

