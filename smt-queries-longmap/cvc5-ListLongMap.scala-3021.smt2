; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42480 () Bool)

(assert start!42480)

(declare-fun b_free!11935 () Bool)

(declare-fun b_next!11935 () Bool)

(assert (=> start!42480 (= b_free!11935 (not b_next!11935))))

(declare-fun tp!41841 () Bool)

(declare-fun b_and!20403 () Bool)

(assert (=> start!42480 (= tp!41841 b_and!20403)))

(declare-fun b!473973 () Bool)

(declare-fun e!278133 () Bool)

(declare-fun e!278129 () Bool)

(assert (=> b!473973 (= e!278133 (not e!278129))))

(declare-fun res!283098 () Bool)

(assert (=> b!473973 (=> res!283098 e!278129)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473973 (= res!283098 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18923 0))(
  ( (V!18924 (val!6726 Int)) )
))
(declare-datatypes ((tuple2!8868 0))(
  ( (tuple2!8869 (_1!4445 (_ BitVec 64)) (_2!4445 V!18923)) )
))
(declare-datatypes ((List!8947 0))(
  ( (Nil!8944) (Cons!8943 (h!9799 tuple2!8868) (t!14919 List!8947)) )
))
(declare-datatypes ((ListLongMap!7781 0))(
  ( (ListLongMap!7782 (toList!3906 List!8947)) )
))
(declare-fun lt!215655 () ListLongMap!7781)

(declare-fun lt!215649 () ListLongMap!7781)

(assert (=> b!473973 (= lt!215655 lt!215649)))

(declare-fun minValueBefore!38 () V!18923)

(declare-fun zeroValue!794 () V!18923)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13970 0))(
  ( (Unit!13971) )
))
(declare-fun lt!215652 () Unit!13970)

(declare-datatypes ((array!30481 0))(
  ( (array!30482 (arr!14659 (Array (_ BitVec 32) (_ BitVec 64))) (size!15011 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30481)

(declare-datatypes ((ValueCell!6338 0))(
  ( (ValueCellFull!6338 (v!9018 V!18923)) (EmptyCell!6338) )
))
(declare-datatypes ((array!30483 0))(
  ( (array!30484 (arr!14660 (Array (_ BitVec 32) ValueCell!6338)) (size!15012 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30483)

(declare-fun minValueAfter!38 () V!18923)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!245 (array!30481 array!30483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 V!18923 V!18923 (_ BitVec 32) Int) Unit!13970)

(assert (=> b!473973 (= lt!215652 (lemmaNoChangeToArrayThenSameMapNoExtras!245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2065 (array!30481 array!30483 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7781)

(assert (=> b!473973 (= lt!215649 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473973 (= lt!215655 (getCurrentListMapNoExtraKeys!2065 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283099 () Bool)

(assert (=> start!42480 (=> (not res!283099) (not e!278133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42480 (= res!283099 (validMask!0 mask!1365))))

(assert (=> start!42480 e!278133))

(declare-fun tp_is_empty!13363 () Bool)

(assert (=> start!42480 tp_is_empty!13363))

(assert (=> start!42480 tp!41841))

(assert (=> start!42480 true))

(declare-fun array_inv!10576 (array!30481) Bool)

(assert (=> start!42480 (array_inv!10576 _keys!1025)))

(declare-fun e!278130 () Bool)

(declare-fun array_inv!10577 (array!30483) Bool)

(assert (=> start!42480 (and (array_inv!10577 _values!833) e!278130)))

(declare-fun b!473974 () Bool)

(declare-fun res!283096 () Bool)

(assert (=> b!473974 (=> (not res!283096) (not e!278133))))

(assert (=> b!473974 (= res!283096 (and (= (size!15012 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15011 _keys!1025) (size!15012 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473975 () Bool)

(declare-fun res!283100 () Bool)

(assert (=> b!473975 (=> (not res!283100) (not e!278133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30481 (_ BitVec 32)) Bool)

(assert (=> b!473975 (= res!283100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473976 () Bool)

(declare-fun res!283097 () Bool)

(assert (=> b!473976 (=> (not res!283097) (not e!278133))))

(declare-datatypes ((List!8948 0))(
  ( (Nil!8945) (Cons!8944 (h!9800 (_ BitVec 64)) (t!14920 List!8948)) )
))
(declare-fun arrayNoDuplicates!0 (array!30481 (_ BitVec 32) List!8948) Bool)

(assert (=> b!473976 (= res!283097 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8945))))

(declare-fun mapIsEmpty!21760 () Bool)

(declare-fun mapRes!21760 () Bool)

(assert (=> mapIsEmpty!21760 mapRes!21760))

(declare-fun b!473977 () Bool)

(declare-fun e!278131 () Bool)

(assert (=> b!473977 (= e!278131 tp_is_empty!13363)))

(declare-fun b!473978 () Bool)

(assert (=> b!473978 (= e!278129 true)))

(declare-fun lt!215650 () ListLongMap!7781)

(declare-fun lt!215648 () tuple2!8868)

(declare-fun +!1741 (ListLongMap!7781 tuple2!8868) ListLongMap!7781)

(assert (=> b!473978 (= (+!1741 lt!215650 lt!215648) (+!1741 (+!1741 lt!215650 (tuple2!8869 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215648))))

(assert (=> b!473978 (= lt!215648 (tuple2!8869 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215651 () Unit!13970)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!150 (ListLongMap!7781 (_ BitVec 64) V!18923 V!18923) Unit!13970)

(assert (=> b!473978 (= lt!215651 (addSameAsAddTwiceSameKeyDiffValues!150 lt!215650 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473978 (= lt!215650 (+!1741 lt!215655 (tuple2!8869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215653 () ListLongMap!7781)

(declare-fun getCurrentListMap!2270 (array!30481 array!30483 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7781)

(assert (=> b!473978 (= lt!215653 (getCurrentListMap!2270 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215654 () ListLongMap!7781)

(assert (=> b!473978 (= lt!215654 (getCurrentListMap!2270 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473979 () Bool)

(assert (=> b!473979 (= e!278130 (and e!278131 mapRes!21760))))

(declare-fun condMapEmpty!21760 () Bool)

(declare-fun mapDefault!21760 () ValueCell!6338)

