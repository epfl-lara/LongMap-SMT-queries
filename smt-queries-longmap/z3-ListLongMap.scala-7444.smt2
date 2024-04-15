; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94530 () Bool)

(assert start!94530)

(declare-fun b_free!21841 () Bool)

(declare-fun b_next!21841 () Bool)

(assert (=> start!94530 (= b_free!21841 (not b_next!21841))))

(declare-fun tp!76972 () Bool)

(declare-fun b_and!34617 () Bool)

(assert (=> start!94530 (= tp!76972 b_and!34617)))

(declare-fun b!1068858 () Bool)

(declare-fun e!609923 () Bool)

(declare-fun tp_is_empty!25651 () Bool)

(assert (=> b!1068858 (= e!609923 tp_is_empty!25651)))

(declare-fun b!1068859 () Bool)

(declare-fun res!713245 () Bool)

(declare-fun e!609926 () Bool)

(assert (=> b!1068859 (=> (not res!713245) (not e!609926))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39337 0))(
  ( (V!39338 (val!12876 Int)) )
))
(declare-datatypes ((ValueCell!12122 0))(
  ( (ValueCellFull!12122 (v!15490 V!39337)) (EmptyCell!12122) )
))
(declare-datatypes ((array!68222 0))(
  ( (array!68223 (arr!32810 (Array (_ BitVec 32) ValueCell!12122)) (size!33348 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68222)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68224 0))(
  ( (array!68225 (arr!32811 (Array (_ BitVec 32) (_ BitVec 64))) (size!33349 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68224)

(assert (=> b!1068859 (= res!713245 (and (= (size!33348 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33349 _keys!1163) (size!33348 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!713248 () Bool)

(assert (=> start!94530 (=> (not res!713248) (not e!609926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94530 (= res!713248 (validMask!0 mask!1515))))

(assert (=> start!94530 e!609926))

(assert (=> start!94530 true))

(assert (=> start!94530 tp_is_empty!25651))

(declare-fun e!609921 () Bool)

(declare-fun array_inv!25394 (array!68222) Bool)

(assert (=> start!94530 (and (array_inv!25394 _values!955) e!609921)))

(assert (=> start!94530 tp!76972))

(declare-fun array_inv!25395 (array!68224) Bool)

(assert (=> start!94530 (array_inv!25395 _keys!1163)))

(declare-fun mapNonEmpty!40174 () Bool)

(declare-fun mapRes!40174 () Bool)

(declare-fun tp!76973 () Bool)

(declare-fun e!609925 () Bool)

(assert (=> mapNonEmpty!40174 (= mapRes!40174 (and tp!76973 e!609925))))

(declare-fun mapRest!40174 () (Array (_ BitVec 32) ValueCell!12122))

(declare-fun mapKey!40174 () (_ BitVec 32))

(declare-fun mapValue!40174 () ValueCell!12122)

(assert (=> mapNonEmpty!40174 (= (arr!32810 _values!955) (store mapRest!40174 mapKey!40174 mapValue!40174))))

(declare-fun b!1068860 () Bool)

(declare-fun res!713243 () Bool)

(assert (=> b!1068860 (=> (not res!713243) (not e!609926))))

(declare-datatypes ((List!22951 0))(
  ( (Nil!22948) (Cons!22947 (h!24156 (_ BitVec 64)) (t!32269 List!22951)) )
))
(declare-fun arrayNoDuplicates!0 (array!68224 (_ BitVec 32) List!22951) Bool)

(assert (=> b!1068860 (= res!713243 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22948))))

(declare-fun mapIsEmpty!40174 () Bool)

(assert (=> mapIsEmpty!40174 mapRes!40174))

(declare-fun b!1068861 () Bool)

(declare-fun res!713244 () Bool)

(assert (=> b!1068861 (=> (not res!713244) (not e!609926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68224 (_ BitVec 32)) Bool)

(assert (=> b!1068861 (= res!713244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068862 () Bool)

(assert (=> b!1068862 (= e!609925 tp_is_empty!25651)))

(declare-fun b!1068863 () Bool)

(assert (=> b!1068863 (= e!609921 (and e!609923 mapRes!40174))))

(declare-fun condMapEmpty!40174 () Bool)

(declare-fun mapDefault!40174 () ValueCell!12122)

(assert (=> b!1068863 (= condMapEmpty!40174 (= (arr!32810 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12122)) mapDefault!40174)))))

(declare-fun b!1068864 () Bool)

(declare-fun e!609924 () Bool)

(declare-fun e!609922 () Bool)

(assert (=> b!1068864 (= e!609924 e!609922)))

(declare-fun res!713246 () Bool)

(assert (=> b!1068864 (=> res!713246 e!609922)))

(declare-datatypes ((tuple2!16414 0))(
  ( (tuple2!16415 (_1!8218 (_ BitVec 64)) (_2!8218 V!39337)) )
))
(declare-datatypes ((List!22952 0))(
  ( (Nil!22949) (Cons!22948 (h!24157 tuple2!16414) (t!32270 List!22952)) )
))
(declare-datatypes ((ListLongMap!14383 0))(
  ( (ListLongMap!14384 (toList!7207 List!22952)) )
))
(declare-fun lt!472145 () ListLongMap!14383)

(declare-fun contains!6278 (ListLongMap!14383 (_ BitVec 64)) Bool)

(assert (=> b!1068864 (= res!713246 (contains!6278 lt!472145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39337)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39337)

(declare-fun getCurrentListMap!4046 (array!68224 array!68222 (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 (_ BitVec 32) Int) ListLongMap!14383)

(assert (=> b!1068864 (= lt!472145 (getCurrentListMap!4046 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068865 () Bool)

(assert (=> b!1068865 (= e!609926 (not e!609924))))

(declare-fun res!713247 () Bool)

(assert (=> b!1068865 (=> res!713247 e!609924)))

(assert (=> b!1068865 (= res!713247 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472142 () ListLongMap!14383)

(declare-fun lt!472144 () ListLongMap!14383)

(assert (=> b!1068865 (= lt!472142 lt!472144)))

(declare-datatypes ((Unit!35002 0))(
  ( (Unit!35003) )
))
(declare-fun lt!472143 () Unit!35002)

(declare-fun zeroValueAfter!47 () V!39337)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!791 (array!68224 array!68222 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 V!39337 V!39337 (_ BitVec 32) Int) Unit!35002)

(assert (=> b!1068865 (= lt!472143 (lemmaNoChangeToArrayThenSameMapNoExtras!791 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3797 (array!68224 array!68222 (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 (_ BitVec 32) Int) ListLongMap!14383)

(assert (=> b!1068865 (= lt!472144 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068865 (= lt!472142 (getCurrentListMapNoExtraKeys!3797 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068866 () Bool)

(assert (=> b!1068866 (= e!609922 true)))

(declare-fun -!649 (ListLongMap!14383 (_ BitVec 64)) ListLongMap!14383)

(assert (=> b!1068866 (= (-!649 lt!472145 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472145)))

(declare-fun lt!472146 () Unit!35002)

(declare-fun removeNotPresentStillSame!66 (ListLongMap!14383 (_ BitVec 64)) Unit!35002)

(assert (=> b!1068866 (= lt!472146 (removeNotPresentStillSame!66 lt!472145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94530 res!713248) b!1068859))

(assert (= (and b!1068859 res!713245) b!1068861))

(assert (= (and b!1068861 res!713244) b!1068860))

(assert (= (and b!1068860 res!713243) b!1068865))

(assert (= (and b!1068865 (not res!713247)) b!1068864))

(assert (= (and b!1068864 (not res!713246)) b!1068866))

(assert (= (and b!1068863 condMapEmpty!40174) mapIsEmpty!40174))

(assert (= (and b!1068863 (not condMapEmpty!40174)) mapNonEmpty!40174))

(get-info :version)

(assert (= (and mapNonEmpty!40174 ((_ is ValueCellFull!12122) mapValue!40174)) b!1068862))

(assert (= (and b!1068863 ((_ is ValueCellFull!12122) mapDefault!40174)) b!1068858))

(assert (= start!94530 b!1068863))

(declare-fun m!986935 () Bool)

(assert (=> b!1068865 m!986935))

(declare-fun m!986937 () Bool)

(assert (=> b!1068865 m!986937))

(declare-fun m!986939 () Bool)

(assert (=> b!1068865 m!986939))

(declare-fun m!986941 () Bool)

(assert (=> mapNonEmpty!40174 m!986941))

(declare-fun m!986943 () Bool)

(assert (=> start!94530 m!986943))

(declare-fun m!986945 () Bool)

(assert (=> start!94530 m!986945))

(declare-fun m!986947 () Bool)

(assert (=> start!94530 m!986947))

(declare-fun m!986949 () Bool)

(assert (=> b!1068866 m!986949))

(declare-fun m!986951 () Bool)

(assert (=> b!1068866 m!986951))

(declare-fun m!986953 () Bool)

(assert (=> b!1068861 m!986953))

(declare-fun m!986955 () Bool)

(assert (=> b!1068864 m!986955))

(declare-fun m!986957 () Bool)

(assert (=> b!1068864 m!986957))

(declare-fun m!986959 () Bool)

(assert (=> b!1068860 m!986959))

(check-sat (not b!1068865) (not b!1068861) (not b!1068866) (not start!94530) (not mapNonEmpty!40174) (not b!1068864) (not b_next!21841) (not b!1068860) tp_is_empty!25651 b_and!34617)
(check-sat b_and!34617 (not b_next!21841))
