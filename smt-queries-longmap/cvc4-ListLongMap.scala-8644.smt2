; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105186 () Bool)

(assert start!105186)

(declare-fun b_free!26903 () Bool)

(declare-fun b_next!26903 () Bool)

(assert (=> start!105186 (= b_free!26903 (not b_next!26903))))

(declare-fun tp!94213 () Bool)

(declare-fun b_and!44717 () Bool)

(assert (=> start!105186 (= tp!94213 b_and!44717)))

(declare-fun b!1253461 () Bool)

(declare-fun res!835844 () Bool)

(declare-fun e!712095 () Bool)

(assert (=> b!1253461 (=> (not res!835844) (not e!712095))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81268 0))(
  ( (array!81269 (arr!39196 (Array (_ BitVec 32) (_ BitVec 64))) (size!39732 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81268)

(declare-datatypes ((V!47771 0))(
  ( (V!47772 (val!15965 Int)) )
))
(declare-datatypes ((ValueCell!15139 0))(
  ( (ValueCellFull!15139 (v!18663 V!47771)) (EmptyCell!15139) )
))
(declare-datatypes ((array!81270 0))(
  ( (array!81271 (arr!39197 (Array (_ BitVec 32) ValueCell!15139)) (size!39733 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81270)

(assert (=> b!1253461 (= res!835844 (and (= (size!39733 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39732 _keys!1118) (size!39733 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253462 () Bool)

(declare-fun e!712094 () Bool)

(declare-fun tp_is_empty!31805 () Bool)

(assert (=> b!1253462 (= e!712094 tp_is_empty!31805)))

(declare-fun b!1253463 () Bool)

(declare-fun res!835841 () Bool)

(assert (=> b!1253463 (=> (not res!835841) (not e!712095))))

(declare-datatypes ((List!27833 0))(
  ( (Nil!27830) (Cons!27829 (h!29038 (_ BitVec 64)) (t!41314 List!27833)) )
))
(declare-fun arrayNoDuplicates!0 (array!81268 (_ BitVec 32) List!27833) Bool)

(assert (=> b!1253463 (= res!835841 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27830))))

(declare-fun mapIsEmpty!49483 () Bool)

(declare-fun mapRes!49483 () Bool)

(assert (=> mapIsEmpty!49483 mapRes!49483))

(declare-fun mapNonEmpty!49483 () Bool)

(declare-fun tp!94214 () Bool)

(assert (=> mapNonEmpty!49483 (= mapRes!49483 (and tp!94214 e!712094))))

(declare-fun mapValue!49483 () ValueCell!15139)

(declare-fun mapKey!49483 () (_ BitVec 32))

(declare-fun mapRest!49483 () (Array (_ BitVec 32) ValueCell!15139))

(assert (=> mapNonEmpty!49483 (= (arr!39197 _values!914) (store mapRest!49483 mapKey!49483 mapValue!49483))))

(declare-fun b!1253464 () Bool)

(declare-fun e!712093 () Bool)

(assert (=> b!1253464 (= e!712093 true)))

(declare-datatypes ((tuple2!20604 0))(
  ( (tuple2!20605 (_1!10313 (_ BitVec 64)) (_2!10313 V!47771)) )
))
(declare-datatypes ((List!27834 0))(
  ( (Nil!27831) (Cons!27830 (h!29039 tuple2!20604) (t!41315 List!27834)) )
))
(declare-datatypes ((ListLongMap!18477 0))(
  ( (ListLongMap!18478 (toList!9254 List!27834)) )
))
(declare-fun lt!565994 () ListLongMap!18477)

(declare-fun lt!565993 () ListLongMap!18477)

(declare-fun -!2027 (ListLongMap!18477 (_ BitVec 64)) ListLongMap!18477)

(assert (=> b!1253464 (= lt!565994 (-!2027 lt!565993 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565996 () ListLongMap!18477)

(declare-fun lt!565992 () ListLongMap!18477)

(assert (=> b!1253464 (= (-!2027 lt!565996 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565992)))

(declare-datatypes ((Unit!41690 0))(
  ( (Unit!41691) )
))
(declare-fun lt!565991 () Unit!41690)

(declare-fun minValueBefore!43 () V!47771)

(declare-fun addThenRemoveForNewKeyIsSame!297 (ListLongMap!18477 (_ BitVec 64) V!47771) Unit!41690)

(assert (=> b!1253464 (= lt!565991 (addThenRemoveForNewKeyIsSame!297 lt!565992 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565998 () ListLongMap!18477)

(declare-fun lt!565997 () ListLongMap!18477)

(assert (=> b!1253464 (and (= lt!565993 lt!565996) (= lt!565997 lt!565998))))

(declare-fun +!4150 (ListLongMap!18477 tuple2!20604) ListLongMap!18477)

(assert (=> b!1253464 (= lt!565996 (+!4150 lt!565992 (tuple2!20605 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun minValueAfter!43 () V!47771)

(declare-fun zeroValue!871 () V!47771)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4498 (array!81268 array!81270 (_ BitVec 32) (_ BitVec 32) V!47771 V!47771 (_ BitVec 32) Int) ListLongMap!18477)

(assert (=> b!1253464 (= lt!565997 (getCurrentListMap!4498 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253464 (= lt!565993 (getCurrentListMap!4498 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253465 () Bool)

(assert (=> b!1253465 (= e!712095 (not e!712093))))

(declare-fun res!835843 () Bool)

(assert (=> b!1253465 (=> res!835843 e!712093)))

(assert (=> b!1253465 (= res!835843 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253465 (= lt!565992 lt!565998)))

(declare-fun lt!565995 () Unit!41690)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1009 (array!81268 array!81270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47771 V!47771 V!47771 V!47771 (_ BitVec 32) Int) Unit!41690)

(assert (=> b!1253465 (= lt!565995 (lemmaNoChangeToArrayThenSameMapNoExtras!1009 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5645 (array!81268 array!81270 (_ BitVec 32) (_ BitVec 32) V!47771 V!47771 (_ BitVec 32) Int) ListLongMap!18477)

(assert (=> b!1253465 (= lt!565998 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253465 (= lt!565992 (getCurrentListMapNoExtraKeys!5645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253467 () Bool)

(declare-fun res!835840 () Bool)

(assert (=> b!1253467 (=> (not res!835840) (not e!712095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81268 (_ BitVec 32)) Bool)

(assert (=> b!1253467 (= res!835840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253468 () Bool)

(declare-fun e!712090 () Bool)

(declare-fun e!712092 () Bool)

(assert (=> b!1253468 (= e!712090 (and e!712092 mapRes!49483))))

(declare-fun condMapEmpty!49483 () Bool)

(declare-fun mapDefault!49483 () ValueCell!15139)

