; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94242 () Bool)

(assert start!94242)

(declare-fun b_free!21627 () Bool)

(declare-fun b_next!21627 () Bool)

(assert (=> start!94242 (= b_free!21627 (not b_next!21627))))

(declare-fun tp!76318 () Bool)

(declare-fun b_and!34387 () Bool)

(assert (=> start!94242 (= tp!76318 b_and!34387)))

(declare-fun b!1065777 () Bool)

(declare-fun e!607642 () Bool)

(declare-fun e!607643 () Bool)

(declare-fun mapRes!39841 () Bool)

(assert (=> b!1065777 (= e!607642 (and e!607643 mapRes!39841))))

(declare-fun condMapEmpty!39841 () Bool)

(declare-datatypes ((V!39051 0))(
  ( (V!39052 (val!12769 Int)) )
))
(declare-datatypes ((ValueCell!12015 0))(
  ( (ValueCellFull!12015 (v!15381 V!39051)) (EmptyCell!12015) )
))
(declare-datatypes ((array!67859 0))(
  ( (array!67860 (arr!32632 (Array (_ BitVec 32) ValueCell!12015)) (size!33168 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67859)

(declare-fun mapDefault!39841 () ValueCell!12015)

(assert (=> b!1065777 (= condMapEmpty!39841 (= (arr!32632 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12015)) mapDefault!39841)))))

(declare-fun mapNonEmpty!39841 () Bool)

(declare-fun tp!76319 () Bool)

(declare-fun e!607638 () Bool)

(assert (=> mapNonEmpty!39841 (= mapRes!39841 (and tp!76319 e!607638))))

(declare-fun mapValue!39841 () ValueCell!12015)

(declare-fun mapKey!39841 () (_ BitVec 32))

(declare-fun mapRest!39841 () (Array (_ BitVec 32) ValueCell!12015))

(assert (=> mapNonEmpty!39841 (= (arr!32632 _values!955) (store mapRest!39841 mapKey!39841 mapValue!39841))))

(declare-fun b!1065778 () Bool)

(declare-fun tp_is_empty!25437 () Bool)

(assert (=> b!1065778 (= e!607638 tp_is_empty!25437)))

(declare-fun b!1065779 () Bool)

(declare-fun res!711397 () Bool)

(declare-fun e!607640 () Bool)

(assert (=> b!1065779 (=> (not res!711397) (not e!607640))))

(declare-datatypes ((array!67861 0))(
  ( (array!67862 (arr!32633 (Array (_ BitVec 32) (_ BitVec 64))) (size!33169 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67861)

(declare-datatypes ((List!22755 0))(
  ( (Nil!22752) (Cons!22751 (h!23960 (_ BitVec 64)) (t!32074 List!22755)) )
))
(declare-fun arrayNoDuplicates!0 (array!67861 (_ BitVec 32) List!22755) Bool)

(assert (=> b!1065779 (= res!711397 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22752))))

(declare-fun res!711396 () Bool)

(assert (=> start!94242 (=> (not res!711396) (not e!607640))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94242 (= res!711396 (validMask!0 mask!1515))))

(assert (=> start!94242 e!607640))

(assert (=> start!94242 true))

(assert (=> start!94242 tp_is_empty!25437))

(declare-fun array_inv!25268 (array!67859) Bool)

(assert (=> start!94242 (and (array_inv!25268 _values!955) e!607642)))

(assert (=> start!94242 tp!76318))

(declare-fun array_inv!25269 (array!67861) Bool)

(assert (=> start!94242 (array_inv!25269 _keys!1163)))

(declare-fun b!1065780 () Bool)

(declare-fun res!711395 () Bool)

(assert (=> b!1065780 (=> (not res!711395) (not e!607640))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065780 (= res!711395 (and (= (size!33168 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33169 _keys!1163) (size!33168 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065781 () Bool)

(assert (=> b!1065781 (= e!607643 tp_is_empty!25437)))

(declare-fun mapIsEmpty!39841 () Bool)

(assert (=> mapIsEmpty!39841 mapRes!39841))

(declare-fun b!1065782 () Bool)

(declare-fun e!607639 () Bool)

(assert (=> b!1065782 (= e!607640 (not e!607639))))

(declare-fun res!711399 () Bool)

(assert (=> b!1065782 (=> res!711399 e!607639)))

(assert (=> b!1065782 (= res!711399 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16190 0))(
  ( (tuple2!16191 (_1!8106 (_ BitVec 64)) (_2!8106 V!39051)) )
))
(declare-datatypes ((List!22756 0))(
  ( (Nil!22753) (Cons!22752 (h!23961 tuple2!16190) (t!32075 List!22756)) )
))
(declare-datatypes ((ListLongMap!14159 0))(
  ( (ListLongMap!14160 (toList!7095 List!22756)) )
))
(declare-fun lt!470191 () ListLongMap!14159)

(declare-fun lt!470192 () ListLongMap!14159)

(assert (=> b!1065782 (= lt!470191 lt!470192)))

(declare-fun zeroValueBefore!47 () V!39051)

(declare-fun minValue!907 () V!39051)

(declare-datatypes ((Unit!34983 0))(
  ( (Unit!34984) )
))
(declare-fun lt!470188 () Unit!34983)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!718 (array!67861 array!67859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39051 V!39051 V!39051 V!39051 (_ BitVec 32) Int) Unit!34983)

(assert (=> b!1065782 (= lt!470188 (lemmaNoChangeToArrayThenSameMapNoExtras!718 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3681 (array!67861 array!67859 (_ BitVec 32) (_ BitVec 32) V!39051 V!39051 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1065782 (= lt!470192 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065782 (= lt!470191 (getCurrentListMapNoExtraKeys!3681 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065783 () Bool)

(declare-fun res!711398 () Bool)

(assert (=> b!1065783 (=> (not res!711398) (not e!607640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67861 (_ BitVec 32)) Bool)

(assert (=> b!1065783 (= res!711398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065784 () Bool)

(assert (=> b!1065784 (= e!607639 true)))

(declare-fun lt!470187 () ListLongMap!14159)

(declare-fun lt!470186 () ListLongMap!14159)

(declare-fun -!610 (ListLongMap!14159 (_ BitVec 64)) ListLongMap!14159)

(assert (=> b!1065784 (= lt!470187 (-!610 lt!470186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470193 () ListLongMap!14159)

(assert (=> b!1065784 (= (-!610 lt!470193 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470191)))

(declare-fun lt!470189 () Unit!34983)

(declare-fun addThenRemoveForNewKeyIsSame!19 (ListLongMap!14159 (_ BitVec 64) V!39051) Unit!34983)

(assert (=> b!1065784 (= lt!470189 (addThenRemoveForNewKeyIsSame!19 lt!470191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470190 () ListLongMap!14159)

(assert (=> b!1065784 (and (= lt!470186 lt!470193) (= lt!470190 lt!470192))))

(declare-fun +!3141 (ListLongMap!14159 tuple2!16190) ListLongMap!14159)

(assert (=> b!1065784 (= lt!470193 (+!3141 lt!470191 (tuple2!16191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4054 (array!67861 array!67859 (_ BitVec 32) (_ BitVec 32) V!39051 V!39051 (_ BitVec 32) Int) ListLongMap!14159)

(assert (=> b!1065784 (= lt!470190 (getCurrentListMap!4054 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065784 (= lt!470186 (getCurrentListMap!4054 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94242 res!711396) b!1065780))

(assert (= (and b!1065780 res!711395) b!1065783))

(assert (= (and b!1065783 res!711398) b!1065779))

(assert (= (and b!1065779 res!711397) b!1065782))

(assert (= (and b!1065782 (not res!711399)) b!1065784))

(assert (= (and b!1065777 condMapEmpty!39841) mapIsEmpty!39841))

(assert (= (and b!1065777 (not condMapEmpty!39841)) mapNonEmpty!39841))

(get-info :version)

(assert (= (and mapNonEmpty!39841 ((_ is ValueCellFull!12015) mapValue!39841)) b!1065778))

(assert (= (and b!1065777 ((_ is ValueCellFull!12015) mapDefault!39841)) b!1065781))

(assert (= start!94242 b!1065777))

(declare-fun m!984319 () Bool)

(assert (=> b!1065784 m!984319))

(declare-fun m!984321 () Bool)

(assert (=> b!1065784 m!984321))

(declare-fun m!984323 () Bool)

(assert (=> b!1065784 m!984323))

(declare-fun m!984325 () Bool)

(assert (=> b!1065784 m!984325))

(declare-fun m!984327 () Bool)

(assert (=> b!1065784 m!984327))

(declare-fun m!984329 () Bool)

(assert (=> b!1065784 m!984329))

(declare-fun m!984331 () Bool)

(assert (=> b!1065782 m!984331))

(declare-fun m!984333 () Bool)

(assert (=> b!1065782 m!984333))

(declare-fun m!984335 () Bool)

(assert (=> b!1065782 m!984335))

(declare-fun m!984337 () Bool)

(assert (=> b!1065783 m!984337))

(declare-fun m!984339 () Bool)

(assert (=> b!1065779 m!984339))

(declare-fun m!984341 () Bool)

(assert (=> start!94242 m!984341))

(declare-fun m!984343 () Bool)

(assert (=> start!94242 m!984343))

(declare-fun m!984345 () Bool)

(assert (=> start!94242 m!984345))

(declare-fun m!984347 () Bool)

(assert (=> mapNonEmpty!39841 m!984347))

(check-sat tp_is_empty!25437 (not b_next!21627) (not mapNonEmpty!39841) b_and!34387 (not b!1065784) (not b!1065783) (not b!1065782) (not b!1065779) (not start!94242))
(check-sat b_and!34387 (not b_next!21627))
