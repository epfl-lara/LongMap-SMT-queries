; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105352 () Bool)

(assert start!105352)

(declare-fun b_free!27025 () Bool)

(declare-fun b_next!27025 () Bool)

(assert (=> start!105352 (= b_free!27025 (not b_next!27025))))

(declare-fun tp!94586 () Bool)

(declare-fun b_and!44863 () Bool)

(assert (=> start!105352 (= tp!94586 b_and!44863)))

(declare-fun mapNonEmpty!49672 () Bool)

(declare-fun mapRes!49672 () Bool)

(declare-fun tp!94585 () Bool)

(declare-fun e!713383 () Bool)

(assert (=> mapNonEmpty!49672 (= mapRes!49672 (and tp!94585 e!713383))))

(declare-datatypes ((V!47935 0))(
  ( (V!47936 (val!16026 Int)) )
))
(declare-datatypes ((ValueCell!15200 0))(
  ( (ValueCellFull!15200 (v!18726 V!47935)) (EmptyCell!15200) )
))
(declare-fun mapRest!49672 () (Array (_ BitVec 32) ValueCell!15200))

(declare-datatypes ((array!81500 0))(
  ( (array!81501 (arr!39310 (Array (_ BitVec 32) ValueCell!15200)) (size!39846 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81500)

(declare-fun mapValue!49672 () ValueCell!15200)

(declare-fun mapKey!49672 () (_ BitVec 32))

(assert (=> mapNonEmpty!49672 (= (arr!39310 _values!914) (store mapRest!49672 mapKey!49672 mapValue!49672))))

(declare-fun b!1255247 () Bool)

(declare-fun e!713380 () Bool)

(assert (=> b!1255247 (= e!713380 (not true))))

(declare-datatypes ((tuple2!20694 0))(
  ( (tuple2!20695 (_1!10358 (_ BitVec 64)) (_2!10358 V!47935)) )
))
(declare-datatypes ((List!27916 0))(
  ( (Nil!27913) (Cons!27912 (h!29121 tuple2!20694) (t!41401 List!27916)) )
))
(declare-datatypes ((ListLongMap!18567 0))(
  ( (ListLongMap!18568 (toList!9299 List!27916)) )
))
(declare-fun lt!567496 () ListLongMap!18567)

(declare-fun lt!567497 () ListLongMap!18567)

(assert (=> b!1255247 (= lt!567496 lt!567497)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47935)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47935)

(declare-datatypes ((array!81502 0))(
  ( (array!81503 (arr!39311 (Array (_ BitVec 32) (_ BitVec 64))) (size!39847 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81502)

(declare-fun minValueBefore!43 () V!47935)

(declare-datatypes ((Unit!41784 0))(
  ( (Unit!41785) )
))
(declare-fun lt!567498 () Unit!41784)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1048 (array!81502 array!81500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 V!47935 V!47935 (_ BitVec 32) Int) Unit!41784)

(assert (=> b!1255247 (= lt!567498 (lemmaNoChangeToArrayThenSameMapNoExtras!1048 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5684 (array!81502 array!81500 (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 (_ BitVec 32) Int) ListLongMap!18567)

(assert (=> b!1255247 (= lt!567497 (getCurrentListMapNoExtraKeys!5684 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255247 (= lt!567496 (getCurrentListMapNoExtraKeys!5684 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255248 () Bool)

(declare-fun res!836873 () Bool)

(assert (=> b!1255248 (=> (not res!836873) (not e!713380))))

(declare-datatypes ((List!27917 0))(
  ( (Nil!27914) (Cons!27913 (h!29122 (_ BitVec 64)) (t!41402 List!27917)) )
))
(declare-fun arrayNoDuplicates!0 (array!81502 (_ BitVec 32) List!27917) Bool)

(assert (=> b!1255248 (= res!836873 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27914))))

(declare-fun mapIsEmpty!49672 () Bool)

(assert (=> mapIsEmpty!49672 mapRes!49672))

(declare-fun b!1255249 () Bool)

(declare-fun res!836874 () Bool)

(assert (=> b!1255249 (=> (not res!836874) (not e!713380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81502 (_ BitVec 32)) Bool)

(assert (=> b!1255249 (= res!836874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255250 () Bool)

(declare-fun res!836872 () Bool)

(assert (=> b!1255250 (=> (not res!836872) (not e!713380))))

(assert (=> b!1255250 (= res!836872 (and (= (size!39846 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39847 _keys!1118) (size!39846 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255251 () Bool)

(declare-fun tp_is_empty!31927 () Bool)

(assert (=> b!1255251 (= e!713383 tp_is_empty!31927)))

(declare-fun b!1255252 () Bool)

(declare-fun e!713381 () Bool)

(assert (=> b!1255252 (= e!713381 tp_is_empty!31927)))

(declare-fun b!1255246 () Bool)

(declare-fun e!713382 () Bool)

(assert (=> b!1255246 (= e!713382 (and e!713381 mapRes!49672))))

(declare-fun condMapEmpty!49672 () Bool)

(declare-fun mapDefault!49672 () ValueCell!15200)

