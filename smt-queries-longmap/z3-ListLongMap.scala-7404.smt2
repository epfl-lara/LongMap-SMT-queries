; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94210 () Bool)

(assert start!94210)

(declare-fun b_free!21601 () Bool)

(declare-fun b_next!21601 () Bool)

(assert (=> start!94210 (= b_free!21601 (not b_next!21601))))

(declare-fun tp!76240 () Bool)

(declare-fun b_and!34335 () Bool)

(assert (=> start!94210 (= tp!76240 b_and!34335)))

(declare-fun b!1065312 () Bool)

(declare-fun e!607313 () Bool)

(declare-fun tp_is_empty!25411 () Bool)

(assert (=> b!1065312 (= e!607313 tp_is_empty!25411)))

(declare-fun b!1065313 () Bool)

(declare-fun e!607312 () Bool)

(assert (=> b!1065313 (= e!607312 true)))

(declare-datatypes ((V!39017 0))(
  ( (V!39018 (val!12756 Int)) )
))
(declare-datatypes ((tuple2!16222 0))(
  ( (tuple2!16223 (_1!8122 (_ BitVec 64)) (_2!8122 V!39017)) )
))
(declare-datatypes ((List!22771 0))(
  ( (Nil!22768) (Cons!22767 (h!23976 tuple2!16222) (t!32081 List!22771)) )
))
(declare-datatypes ((ListLongMap!14191 0))(
  ( (ListLongMap!14192 (toList!7111 List!22771)) )
))
(declare-fun lt!469676 () ListLongMap!14191)

(declare-fun lt!469681 () ListLongMap!14191)

(declare-fun -!589 (ListLongMap!14191 (_ BitVec 64)) ListLongMap!14191)

(assert (=> b!1065313 (= lt!469676 (-!589 lt!469681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469677 () ListLongMap!14191)

(declare-fun lt!469675 () ListLongMap!14191)

(assert (=> b!1065313 (= (-!589 lt!469677 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469675)))

(declare-datatypes ((Unit!34808 0))(
  ( (Unit!34809) )
))
(declare-fun lt!469679 () Unit!34808)

(declare-fun zeroValueBefore!47 () V!39017)

(declare-fun addThenRemoveForNewKeyIsSame!7 (ListLongMap!14191 (_ BitVec 64) V!39017) Unit!34808)

(assert (=> b!1065313 (= lt!469679 (addThenRemoveForNewKeyIsSame!7 lt!469675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469678 () ListLongMap!14191)

(declare-fun lt!469674 () ListLongMap!14191)

(assert (=> b!1065313 (and (= lt!469681 lt!469677) (= lt!469678 lt!469674))))

(declare-fun +!3155 (ListLongMap!14191 tuple2!16222) ListLongMap!14191)

(assert (=> b!1065313 (= lt!469677 (+!3155 lt!469675 (tuple2!16223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12002 0))(
  ( (ValueCellFull!12002 (v!15367 V!39017)) (EmptyCell!12002) )
))
(declare-datatypes ((array!67752 0))(
  ( (array!67753 (arr!32579 (Array (_ BitVec 32) ValueCell!12002)) (size!33117 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67752)

(declare-fun minValue!907 () V!39017)

(declare-datatypes ((array!67754 0))(
  ( (array!67755 (arr!32580 (Array (_ BitVec 32) (_ BitVec 64))) (size!33118 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67754)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39017)

(declare-fun getCurrentListMap!3987 (array!67754 array!67752 (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 (_ BitVec 32) Int) ListLongMap!14191)

(assert (=> b!1065313 (= lt!469678 (getCurrentListMap!3987 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065313 (= lt!469681 (getCurrentListMap!3987 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39802 () Bool)

(declare-fun mapRes!39802 () Bool)

(assert (=> mapIsEmpty!39802 mapRes!39802))

(declare-fun b!1065314 () Bool)

(declare-fun e!607314 () Bool)

(assert (=> b!1065314 (= e!607314 (not e!607312))))

(declare-fun res!711131 () Bool)

(assert (=> b!1065314 (=> res!711131 e!607312)))

(assert (=> b!1065314 (= res!711131 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065314 (= lt!469675 lt!469674)))

(declare-fun lt!469680 () Unit!34808)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!707 (array!67754 array!67752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 V!39017 V!39017 (_ BitVec 32) Int) Unit!34808)

(assert (=> b!1065314 (= lt!469680 (lemmaNoChangeToArrayThenSameMapNoExtras!707 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3713 (array!67754 array!67752 (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 (_ BitVec 32) Int) ListLongMap!14191)

(assert (=> b!1065314 (= lt!469674 (getCurrentListMapNoExtraKeys!3713 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065314 (= lt!469675 (getCurrentListMapNoExtraKeys!3713 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711133 () Bool)

(assert (=> start!94210 (=> (not res!711133) (not e!607314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94210 (= res!711133 (validMask!0 mask!1515))))

(assert (=> start!94210 e!607314))

(assert (=> start!94210 true))

(assert (=> start!94210 tp_is_empty!25411))

(declare-fun e!607316 () Bool)

(declare-fun array_inv!25226 (array!67752) Bool)

(assert (=> start!94210 (and (array_inv!25226 _values!955) e!607316)))

(assert (=> start!94210 tp!76240))

(declare-fun array_inv!25227 (array!67754) Bool)

(assert (=> start!94210 (array_inv!25227 _keys!1163)))

(declare-fun b!1065315 () Bool)

(declare-fun res!711132 () Bool)

(assert (=> b!1065315 (=> (not res!711132) (not e!607314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67754 (_ BitVec 32)) Bool)

(assert (=> b!1065315 (= res!711132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39802 () Bool)

(declare-fun tp!76241 () Bool)

(declare-fun e!607311 () Bool)

(assert (=> mapNonEmpty!39802 (= mapRes!39802 (and tp!76241 e!607311))))

(declare-fun mapRest!39802 () (Array (_ BitVec 32) ValueCell!12002))

(declare-fun mapValue!39802 () ValueCell!12002)

(declare-fun mapKey!39802 () (_ BitVec 32))

(assert (=> mapNonEmpty!39802 (= (arr!32579 _values!955) (store mapRest!39802 mapKey!39802 mapValue!39802))))

(declare-fun b!1065316 () Bool)

(assert (=> b!1065316 (= e!607316 (and e!607313 mapRes!39802))))

(declare-fun condMapEmpty!39802 () Bool)

(declare-fun mapDefault!39802 () ValueCell!12002)

(assert (=> b!1065316 (= condMapEmpty!39802 (= (arr!32579 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12002)) mapDefault!39802)))))

(declare-fun b!1065317 () Bool)

(assert (=> b!1065317 (= e!607311 tp_is_empty!25411)))

(declare-fun b!1065318 () Bool)

(declare-fun res!711135 () Bool)

(assert (=> b!1065318 (=> (not res!711135) (not e!607314))))

(assert (=> b!1065318 (= res!711135 (and (= (size!33117 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33118 _keys!1163) (size!33117 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065319 () Bool)

(declare-fun res!711134 () Bool)

(assert (=> b!1065319 (=> (not res!711134) (not e!607314))))

(declare-datatypes ((List!22772 0))(
  ( (Nil!22769) (Cons!22768 (h!23977 (_ BitVec 64)) (t!32082 List!22772)) )
))
(declare-fun arrayNoDuplicates!0 (array!67754 (_ BitVec 32) List!22772) Bool)

(assert (=> b!1065319 (= res!711134 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22769))))

(assert (= (and start!94210 res!711133) b!1065318))

(assert (= (and b!1065318 res!711135) b!1065315))

(assert (= (and b!1065315 res!711132) b!1065319))

(assert (= (and b!1065319 res!711134) b!1065314))

(assert (= (and b!1065314 (not res!711131)) b!1065313))

(assert (= (and b!1065316 condMapEmpty!39802) mapIsEmpty!39802))

(assert (= (and b!1065316 (not condMapEmpty!39802)) mapNonEmpty!39802))

(get-info :version)

(assert (= (and mapNonEmpty!39802 ((_ is ValueCellFull!12002) mapValue!39802)) b!1065317))

(assert (= (and b!1065316 ((_ is ValueCellFull!12002) mapDefault!39802)) b!1065312))

(assert (= start!94210 b!1065316))

(declare-fun m!983303 () Bool)

(assert (=> b!1065313 m!983303))

(declare-fun m!983305 () Bool)

(assert (=> b!1065313 m!983305))

(declare-fun m!983307 () Bool)

(assert (=> b!1065313 m!983307))

(declare-fun m!983309 () Bool)

(assert (=> b!1065313 m!983309))

(declare-fun m!983311 () Bool)

(assert (=> b!1065313 m!983311))

(declare-fun m!983313 () Bool)

(assert (=> b!1065313 m!983313))

(declare-fun m!983315 () Bool)

(assert (=> mapNonEmpty!39802 m!983315))

(declare-fun m!983317 () Bool)

(assert (=> start!94210 m!983317))

(declare-fun m!983319 () Bool)

(assert (=> start!94210 m!983319))

(declare-fun m!983321 () Bool)

(assert (=> start!94210 m!983321))

(declare-fun m!983323 () Bool)

(assert (=> b!1065315 m!983323))

(declare-fun m!983325 () Bool)

(assert (=> b!1065319 m!983325))

(declare-fun m!983327 () Bool)

(assert (=> b!1065314 m!983327))

(declare-fun m!983329 () Bool)

(assert (=> b!1065314 m!983329))

(declare-fun m!983331 () Bool)

(assert (=> b!1065314 m!983331))

(check-sat (not b_next!21601) (not start!94210) (not b!1065314) (not b!1065319) b_and!34335 (not mapNonEmpty!39802) tp_is_empty!25411 (not b!1065315) (not b!1065313))
(check-sat b_and!34335 (not b_next!21601))
