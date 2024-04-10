; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94318 () Bool)

(assert start!94318)

(declare-fun b_free!21681 () Bool)

(declare-fun b_next!21681 () Bool)

(assert (=> start!94318 (= b_free!21681 (not b_next!21681))))

(declare-fun tp!76484 () Bool)

(declare-fun b_and!34453 () Bool)

(assert (=> start!94318 (= tp!76484 b_and!34453)))

(declare-fun b!1066609 () Bool)

(declare-fun e!608243 () Bool)

(declare-fun tp_is_empty!25491 () Bool)

(assert (=> b!1066609 (= e!608243 tp_is_empty!25491)))

(declare-fun b!1066610 () Bool)

(declare-fun e!608245 () Bool)

(declare-fun mapRes!39925 () Bool)

(assert (=> b!1066610 (= e!608245 (and e!608243 mapRes!39925))))

(declare-fun condMapEmpty!39925 () Bool)

(declare-datatypes ((V!39123 0))(
  ( (V!39124 (val!12796 Int)) )
))
(declare-datatypes ((ValueCell!12042 0))(
  ( (ValueCellFull!12042 (v!15409 V!39123)) (EmptyCell!12042) )
))
(declare-datatypes ((array!67967 0))(
  ( (array!67968 (arr!32685 (Array (_ BitVec 32) ValueCell!12042)) (size!33221 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67967)

(declare-fun mapDefault!39925 () ValueCell!12042)

(assert (=> b!1066610 (= condMapEmpty!39925 (= (arr!32685 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12042)) mapDefault!39925)))))

(declare-fun b!1066611 () Bool)

(declare-fun res!711883 () Bool)

(declare-fun e!608244 () Bool)

(assert (=> b!1066611 (=> (not res!711883) (not e!608244))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67969 0))(
  ( (array!67970 (arr!32686 (Array (_ BitVec 32) (_ BitVec 64))) (size!33222 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67969)

(assert (=> b!1066611 (= res!711883 (and (= (size!33221 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33222 _keys!1163) (size!33221 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066612 () Bool)

(declare-fun e!608246 () Bool)

(assert (=> b!1066612 (= e!608246 tp_is_empty!25491)))

(declare-fun b!1066613 () Bool)

(declare-fun res!711882 () Bool)

(assert (=> b!1066613 (=> (not res!711882) (not e!608244))))

(declare-datatypes ((List!22793 0))(
  ( (Nil!22790) (Cons!22789 (h!23998 (_ BitVec 64)) (t!32114 List!22793)) )
))
(declare-fun arrayNoDuplicates!0 (array!67969 (_ BitVec 32) List!22793) Bool)

(assert (=> b!1066613 (= res!711882 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22790))))

(declare-fun b!1066614 () Bool)

(declare-fun res!711886 () Bool)

(assert (=> b!1066614 (=> (not res!711886) (not e!608244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67969 (_ BitVec 32)) Bool)

(assert (=> b!1066614 (= res!711886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39925 () Bool)

(declare-fun tp!76483 () Bool)

(assert (=> mapNonEmpty!39925 (= mapRes!39925 (and tp!76483 e!608246))))

(declare-fun mapRest!39925 () (Array (_ BitVec 32) ValueCell!12042))

(declare-fun mapKey!39925 () (_ BitVec 32))

(declare-fun mapValue!39925 () ValueCell!12042)

(assert (=> mapNonEmpty!39925 (= (arr!32685 _values!955) (store mapRest!39925 mapKey!39925 mapValue!39925))))

(declare-fun mapIsEmpty!39925 () Bool)

(assert (=> mapIsEmpty!39925 mapRes!39925))

(declare-fun b!1066615 () Bool)

(declare-fun e!608247 () Bool)

(assert (=> b!1066615 (= e!608247 true)))

(declare-datatypes ((tuple2!16230 0))(
  ( (tuple2!16231 (_1!8126 (_ BitVec 64)) (_2!8126 V!39123)) )
))
(declare-datatypes ((List!22794 0))(
  ( (Nil!22791) (Cons!22790 (h!23999 tuple2!16230) (t!32115 List!22794)) )
))
(declare-datatypes ((ListLongMap!14199 0))(
  ( (ListLongMap!14200 (toList!7115 List!22794)) )
))
(declare-fun lt!470974 () ListLongMap!14199)

(declare-fun lt!470979 () ListLongMap!14199)

(declare-fun -!625 (ListLongMap!14199 (_ BitVec 64)) ListLongMap!14199)

(assert (=> b!1066615 (= lt!470974 (-!625 lt!470979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470978 () ListLongMap!14199)

(declare-fun lt!470972 () ListLongMap!14199)

(assert (=> b!1066615 (= (-!625 lt!470978 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470972)))

(declare-datatypes ((Unit!35025 0))(
  ( (Unit!35026) )
))
(declare-fun lt!470976 () Unit!35025)

(declare-fun zeroValueBefore!47 () V!39123)

(declare-fun addThenRemoveForNewKeyIsSame!34 (ListLongMap!14199 (_ BitVec 64) V!39123) Unit!35025)

(assert (=> b!1066615 (= lt!470976 (addThenRemoveForNewKeyIsSame!34 lt!470972 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470975 () ListLongMap!14199)

(declare-fun lt!470973 () ListLongMap!14199)

(assert (=> b!1066615 (and (= lt!470979 lt!470978) (= lt!470975 lt!470973))))

(declare-fun +!3156 (ListLongMap!14199 tuple2!16230) ListLongMap!14199)

(assert (=> b!1066615 (= lt!470978 (+!3156 lt!470972 (tuple2!16231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39123)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39123)

(declare-fun getCurrentListMap!4069 (array!67969 array!67967 (_ BitVec 32) (_ BitVec 32) V!39123 V!39123 (_ BitVec 32) Int) ListLongMap!14199)

(assert (=> b!1066615 (= lt!470975 (getCurrentListMap!4069 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066615 (= lt!470979 (getCurrentListMap!4069 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711884 () Bool)

(assert (=> start!94318 (=> (not res!711884) (not e!608244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94318 (= res!711884 (validMask!0 mask!1515))))

(assert (=> start!94318 e!608244))

(assert (=> start!94318 true))

(assert (=> start!94318 tp_is_empty!25491))

(declare-fun array_inv!25306 (array!67967) Bool)

(assert (=> start!94318 (and (array_inv!25306 _values!955) e!608245)))

(assert (=> start!94318 tp!76484))

(declare-fun array_inv!25307 (array!67969) Bool)

(assert (=> start!94318 (array_inv!25307 _keys!1163)))

(declare-fun b!1066616 () Bool)

(assert (=> b!1066616 (= e!608244 (not e!608247))))

(declare-fun res!711885 () Bool)

(assert (=> b!1066616 (=> res!711885 e!608247)))

(assert (=> b!1066616 (= res!711885 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066616 (= lt!470972 lt!470973)))

(declare-fun lt!470977 () Unit!35025)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!737 (array!67969 array!67967 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39123 V!39123 V!39123 V!39123 (_ BitVec 32) Int) Unit!35025)

(assert (=> b!1066616 (= lt!470977 (lemmaNoChangeToArrayThenSameMapNoExtras!737 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3700 (array!67969 array!67967 (_ BitVec 32) (_ BitVec 32) V!39123 V!39123 (_ BitVec 32) Int) ListLongMap!14199)

(assert (=> b!1066616 (= lt!470973 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066616 (= lt!470972 (getCurrentListMapNoExtraKeys!3700 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94318 res!711884) b!1066611))

(assert (= (and b!1066611 res!711883) b!1066614))

(assert (= (and b!1066614 res!711886) b!1066613))

(assert (= (and b!1066613 res!711882) b!1066616))

(assert (= (and b!1066616 (not res!711885)) b!1066615))

(assert (= (and b!1066610 condMapEmpty!39925) mapIsEmpty!39925))

(assert (= (and b!1066610 (not condMapEmpty!39925)) mapNonEmpty!39925))

(get-info :version)

(assert (= (and mapNonEmpty!39925 ((_ is ValueCellFull!12042) mapValue!39925)) b!1066612))

(assert (= (and b!1066610 ((_ is ValueCellFull!12042) mapDefault!39925)) b!1066609))

(assert (= start!94318 b!1066610))

(declare-fun m!985313 () Bool)

(assert (=> b!1066615 m!985313))

(declare-fun m!985315 () Bool)

(assert (=> b!1066615 m!985315))

(declare-fun m!985317 () Bool)

(assert (=> b!1066615 m!985317))

(declare-fun m!985319 () Bool)

(assert (=> b!1066615 m!985319))

(declare-fun m!985321 () Bool)

(assert (=> b!1066615 m!985321))

(declare-fun m!985323 () Bool)

(assert (=> b!1066615 m!985323))

(declare-fun m!985325 () Bool)

(assert (=> mapNonEmpty!39925 m!985325))

(declare-fun m!985327 () Bool)

(assert (=> b!1066616 m!985327))

(declare-fun m!985329 () Bool)

(assert (=> b!1066616 m!985329))

(declare-fun m!985331 () Bool)

(assert (=> b!1066616 m!985331))

(declare-fun m!985333 () Bool)

(assert (=> start!94318 m!985333))

(declare-fun m!985335 () Bool)

(assert (=> start!94318 m!985335))

(declare-fun m!985337 () Bool)

(assert (=> start!94318 m!985337))

(declare-fun m!985339 () Bool)

(assert (=> b!1066614 m!985339))

(declare-fun m!985341 () Bool)

(assert (=> b!1066613 m!985341))

(check-sat (not b!1066615) (not b!1066613) tp_is_empty!25491 (not b_next!21681) (not b!1066616) (not mapNonEmpty!39925) b_and!34453 (not b!1066614) (not start!94318))
(check-sat b_and!34453 (not b_next!21681))
