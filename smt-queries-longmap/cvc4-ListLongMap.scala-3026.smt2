; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42514 () Bool)

(assert start!42514)

(declare-fun b_free!11969 () Bool)

(declare-fun b_next!11969 () Bool)

(assert (=> start!42514 (= b_free!11969 (not b_next!11969))))

(declare-fun tp!41944 () Bool)

(declare-fun b_and!20437 () Bool)

(assert (=> start!42514 (= tp!41944 b_and!20437)))

(declare-fun b!474381 () Bool)

(declare-fun e!278439 () Bool)

(declare-fun tp_is_empty!13397 () Bool)

(assert (=> b!474381 (= e!278439 tp_is_empty!13397)))

(declare-fun b!474382 () Bool)

(declare-fun e!278437 () Bool)

(declare-fun e!278440 () Bool)

(assert (=> b!474382 (= e!278437 (not e!278440))))

(declare-fun res!283353 () Bool)

(assert (=> b!474382 (=> res!283353 e!278440)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474382 (= res!283353 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18967 0))(
  ( (V!18968 (val!6743 Int)) )
))
(declare-datatypes ((tuple2!8892 0))(
  ( (tuple2!8893 (_1!4457 (_ BitVec 64)) (_2!4457 V!18967)) )
))
(declare-datatypes ((List!8969 0))(
  ( (Nil!8966) (Cons!8965 (h!9821 tuple2!8892) (t!14941 List!8969)) )
))
(declare-datatypes ((ListLongMap!7805 0))(
  ( (ListLongMap!7806 (toList!3918 List!8969)) )
))
(declare-fun lt!216058 () ListLongMap!7805)

(declare-fun lt!216060 () ListLongMap!7805)

(assert (=> b!474382 (= lt!216058 lt!216060)))

(declare-fun minValueBefore!38 () V!18967)

(declare-fun zeroValue!794 () V!18967)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30541 0))(
  ( (array!30542 (arr!14689 (Array (_ BitVec 32) (_ BitVec 64))) (size!15041 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30541)

(declare-datatypes ((ValueCell!6355 0))(
  ( (ValueCellFull!6355 (v!9035 V!18967)) (EmptyCell!6355) )
))
(declare-datatypes ((array!30543 0))(
  ( (array!30544 (arr!14690 (Array (_ BitVec 32) ValueCell!6355)) (size!15042 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30543)

(declare-fun minValueAfter!38 () V!18967)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13994 0))(
  ( (Unit!13995) )
))
(declare-fun lt!216061 () Unit!13994)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!255 (array!30541 array!30543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18967 V!18967 V!18967 V!18967 (_ BitVec 32) Int) Unit!13994)

(assert (=> b!474382 (= lt!216061 (lemmaNoChangeToArrayThenSameMapNoExtras!255 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2075 (array!30541 array!30543 (_ BitVec 32) (_ BitVec 32) V!18967 V!18967 (_ BitVec 32) Int) ListLongMap!7805)

(assert (=> b!474382 (= lt!216060 (getCurrentListMapNoExtraKeys!2075 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474382 (= lt!216058 (getCurrentListMapNoExtraKeys!2075 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21811 () Bool)

(declare-fun mapRes!21811 () Bool)

(assert (=> mapIsEmpty!21811 mapRes!21811))

(declare-fun b!474383 () Bool)

(declare-fun res!283351 () Bool)

(assert (=> b!474383 (=> (not res!283351) (not e!278437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30541 (_ BitVec 32)) Bool)

(assert (=> b!474383 (= res!283351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474384 () Bool)

(assert (=> b!474384 (= e!278440 (bvsle #b00000000000000000000000000000000 (size!15041 _keys!1025)))))

(declare-fun lt!216059 () ListLongMap!7805)

(declare-fun lt!216057 () tuple2!8892)

(declare-fun +!1753 (ListLongMap!7805 tuple2!8892) ListLongMap!7805)

(assert (=> b!474384 (= (+!1753 lt!216059 lt!216057) (+!1753 (+!1753 lt!216059 (tuple2!8893 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216057))))

(assert (=> b!474384 (= lt!216057 (tuple2!8893 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!216056 () Unit!13994)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!162 (ListLongMap!7805 (_ BitVec 64) V!18967 V!18967) Unit!13994)

(assert (=> b!474384 (= lt!216056 (addSameAsAddTwiceSameKeyDiffValues!162 lt!216059 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474384 (= lt!216059 (+!1753 lt!216058 (tuple2!8893 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!216063 () ListLongMap!7805)

(declare-fun getCurrentListMap!2282 (array!30541 array!30543 (_ BitVec 32) (_ BitVec 32) V!18967 V!18967 (_ BitVec 32) Int) ListLongMap!7805)

(assert (=> b!474384 (= lt!216063 (getCurrentListMap!2282 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216062 () ListLongMap!7805)

(assert (=> b!474384 (= lt!216062 (getCurrentListMap!2282 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474385 () Bool)

(declare-fun e!278435 () Bool)

(assert (=> b!474385 (= e!278435 (and e!278439 mapRes!21811))))

(declare-fun condMapEmpty!21811 () Bool)

(declare-fun mapDefault!21811 () ValueCell!6355)

