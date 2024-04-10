; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41634 () Bool)

(assert start!41634)

(declare-fun b_free!11287 () Bool)

(declare-fun b_next!11287 () Bool)

(assert (=> start!41634 (= b_free!11287 (not b_next!11287))))

(declare-fun tp!39862 () Bool)

(declare-fun b_and!19635 () Bool)

(assert (=> start!41634 (= tp!39862 b_and!19635)))

(declare-fun b!464945 () Bool)

(declare-fun res!277944 () Bool)

(declare-fun e!271655 () Bool)

(assert (=> b!464945 (=> (not res!277944) (not e!271655))))

(declare-datatypes ((array!29215 0))(
  ( (array!29216 (arr!14038 (Array (_ BitVec 32) (_ BitVec 64))) (size!14390 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29215)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29215 (_ BitVec 32)) Bool)

(assert (=> b!464945 (= res!277944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464946 () Bool)

(assert (=> b!464946 (= e!271655 (not true))))

(declare-datatypes ((V!18059 0))(
  ( (V!18060 (val!6402 Int)) )
))
(declare-datatypes ((tuple2!8388 0))(
  ( (tuple2!8389 (_1!4205 (_ BitVec 64)) (_2!4205 V!18059)) )
))
(declare-datatypes ((List!8479 0))(
  ( (Nil!8476) (Cons!8475 (h!9331 tuple2!8388) (t!14427 List!8479)) )
))
(declare-datatypes ((ListLongMap!7301 0))(
  ( (ListLongMap!7302 (toList!3666 List!8479)) )
))
(declare-fun lt!209937 () ListLongMap!7301)

(declare-fun lt!209935 () ListLongMap!7301)

(assert (=> b!464946 (= lt!209937 lt!209935)))

(declare-fun minValueBefore!38 () V!18059)

(declare-fun zeroValue!794 () V!18059)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13500 0))(
  ( (Unit!13501) )
))
(declare-fun lt!209936 () Unit!13500)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6014 0))(
  ( (ValueCellFull!6014 (v!8689 V!18059)) (EmptyCell!6014) )
))
(declare-datatypes ((array!29217 0))(
  ( (array!29218 (arr!14039 (Array (_ BitVec 32) ValueCell!6014)) (size!14391 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29217)

(declare-fun minValueAfter!38 () V!18059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!26 (array!29215 array!29217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 V!18059 V!18059 (_ BitVec 32) Int) Unit!13500)

(assert (=> b!464946 (= lt!209936 (lemmaNoChangeToArrayThenSameMapNoExtras!26 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1846 (array!29215 array!29217 (_ BitVec 32) (_ BitVec 32) V!18059 V!18059 (_ BitVec 32) Int) ListLongMap!7301)

(assert (=> b!464946 (= lt!209935 (getCurrentListMapNoExtraKeys!1846 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464946 (= lt!209937 (getCurrentListMapNoExtraKeys!1846 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464947 () Bool)

(declare-fun e!271656 () Bool)

(declare-fun tp_is_empty!12715 () Bool)

(assert (=> b!464947 (= e!271656 tp_is_empty!12715)))

(declare-fun b!464948 () Bool)

(declare-fun e!271653 () Bool)

(assert (=> b!464948 (= e!271653 tp_is_empty!12715)))

(declare-fun b!464949 () Bool)

(declare-fun res!277946 () Bool)

(assert (=> b!464949 (=> (not res!277946) (not e!271655))))

(declare-datatypes ((List!8480 0))(
  ( (Nil!8477) (Cons!8476 (h!9332 (_ BitVec 64)) (t!14428 List!8480)) )
))
(declare-fun arrayNoDuplicates!0 (array!29215 (_ BitVec 32) List!8480) Bool)

(assert (=> b!464949 (= res!277946 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8477))))

(declare-fun b!464950 () Bool)

(declare-fun res!277945 () Bool)

(assert (=> b!464950 (=> (not res!277945) (not e!271655))))

(assert (=> b!464950 (= res!277945 (and (= (size!14391 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14390 _keys!1025) (size!14391 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277947 () Bool)

(assert (=> start!41634 (=> (not res!277947) (not e!271655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41634 (= res!277947 (validMask!0 mask!1365))))

(assert (=> start!41634 e!271655))

(assert (=> start!41634 tp_is_empty!12715))

(assert (=> start!41634 tp!39862))

(assert (=> start!41634 true))

(declare-fun array_inv!10140 (array!29215) Bool)

(assert (=> start!41634 (array_inv!10140 _keys!1025)))

(declare-fun e!271657 () Bool)

(declare-fun array_inv!10141 (array!29217) Bool)

(assert (=> start!41634 (and (array_inv!10141 _values!833) e!271657)))

(declare-fun mapIsEmpty!20752 () Bool)

(declare-fun mapRes!20752 () Bool)

(assert (=> mapIsEmpty!20752 mapRes!20752))

(declare-fun b!464951 () Bool)

(assert (=> b!464951 (= e!271657 (and e!271653 mapRes!20752))))

(declare-fun condMapEmpty!20752 () Bool)

(declare-fun mapDefault!20752 () ValueCell!6014)

