; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105332 () Bool)

(assert start!105332)

(declare-fun b_free!27005 () Bool)

(declare-fun b_next!27005 () Bool)

(assert (=> start!105332 (= b_free!27005 (not b_next!27005))))

(declare-fun tp!94525 () Bool)

(declare-fun b_and!44843 () Bool)

(assert (=> start!105332 (= tp!94525 b_and!44843)))

(declare-fun b!1255036 () Bool)

(declare-fun e!713231 () Bool)

(declare-fun tp_is_empty!31907 () Bool)

(assert (=> b!1255036 (= e!713231 tp_is_empty!31907)))

(declare-fun b!1255037 () Bool)

(declare-fun res!836752 () Bool)

(declare-fun e!713230 () Bool)

(assert (=> b!1255037 (=> (not res!836752) (not e!713230))))

(declare-datatypes ((array!81466 0))(
  ( (array!81467 (arr!39293 (Array (_ BitVec 32) (_ BitVec 64))) (size!39829 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81466)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81466 (_ BitVec 32)) Bool)

(assert (=> b!1255037 (= res!836752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255039 () Bool)

(assert (=> b!1255039 (= e!713230 (not true))))

(declare-datatypes ((V!47907 0))(
  ( (V!47908 (val!16016 Int)) )
))
(declare-datatypes ((tuple2!20686 0))(
  ( (tuple2!20687 (_1!10354 (_ BitVec 64)) (_2!10354 V!47907)) )
))
(declare-datatypes ((List!27909 0))(
  ( (Nil!27906) (Cons!27905 (h!29114 tuple2!20686) (t!41394 List!27909)) )
))
(declare-datatypes ((ListLongMap!18559 0))(
  ( (ListLongMap!18560 (toList!9295 List!27909)) )
))
(declare-fun lt!567406 () ListLongMap!18559)

(declare-fun lt!567407 () ListLongMap!18559)

(assert (=> b!1255039 (= lt!567406 lt!567407)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41776 0))(
  ( (Unit!41777) )
))
(declare-fun lt!567408 () Unit!41776)

(declare-fun minValueAfter!43 () V!47907)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47907)

(declare-datatypes ((ValueCell!15190 0))(
  ( (ValueCellFull!15190 (v!18716 V!47907)) (EmptyCell!15190) )
))
(declare-datatypes ((array!81468 0))(
  ( (array!81469 (arr!39294 (Array (_ BitVec 32) ValueCell!15190)) (size!39830 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81468)

(declare-fun minValueBefore!43 () V!47907)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1044 (array!81466 array!81468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47907 V!47907 V!47907 V!47907 (_ BitVec 32) Int) Unit!41776)

(assert (=> b!1255039 (= lt!567408 (lemmaNoChangeToArrayThenSameMapNoExtras!1044 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5680 (array!81466 array!81468 (_ BitVec 32) (_ BitVec 32) V!47907 V!47907 (_ BitVec 32) Int) ListLongMap!18559)

(assert (=> b!1255039 (= lt!567407 (getCurrentListMapNoExtraKeys!5680 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255039 (= lt!567406 (getCurrentListMapNoExtraKeys!5680 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255040 () Bool)

(declare-fun res!836753 () Bool)

(assert (=> b!1255040 (=> (not res!836753) (not e!713230))))

(assert (=> b!1255040 (= res!836753 (and (= (size!39830 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39829 _keys!1118) (size!39830 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49642 () Bool)

(declare-fun mapRes!49642 () Bool)

(declare-fun tp!94526 () Bool)

(declare-fun e!713233 () Bool)

(assert (=> mapNonEmpty!49642 (= mapRes!49642 (and tp!94526 e!713233))))

(declare-fun mapRest!49642 () (Array (_ BitVec 32) ValueCell!15190))

(declare-fun mapKey!49642 () (_ BitVec 32))

(declare-fun mapValue!49642 () ValueCell!15190)

(assert (=> mapNonEmpty!49642 (= (arr!39294 _values!914) (store mapRest!49642 mapKey!49642 mapValue!49642))))

(declare-fun b!1255041 () Bool)

(declare-fun e!713229 () Bool)

(assert (=> b!1255041 (= e!713229 (and e!713231 mapRes!49642))))

(declare-fun condMapEmpty!49642 () Bool)

(declare-fun mapDefault!49642 () ValueCell!15190)

