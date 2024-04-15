; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94828 () Bool)

(assert start!94828)

(declare-fun b_free!22063 () Bool)

(declare-fun b_next!22063 () Bool)

(assert (=> start!94828 (= b_free!22063 (not b_next!22063))))

(declare-fun tp!77651 () Bool)

(declare-fun b_and!34879 () Bool)

(assert (=> start!94828 (= tp!77651 b_and!34879)))

(declare-fun b!1072194 () Bool)

(declare-fun e!612386 () Bool)

(declare-fun tp_is_empty!25873 () Bool)

(assert (=> b!1072194 (= e!612386 tp_is_empty!25873)))

(declare-fun b!1072195 () Bool)

(declare-fun e!612381 () Bool)

(assert (=> b!1072195 (= e!612381 true)))

(declare-datatypes ((V!39633 0))(
  ( (V!39634 (val!12987 Int)) )
))
(declare-datatypes ((tuple2!16594 0))(
  ( (tuple2!16595 (_1!8308 (_ BitVec 64)) (_2!8308 V!39633)) )
))
(declare-datatypes ((List!23117 0))(
  ( (Nil!23114) (Cons!23113 (h!24322 tuple2!16594) (t!32443 List!23117)) )
))
(declare-datatypes ((ListLongMap!14563 0))(
  ( (ListLongMap!14564 (toList!7297 List!23117)) )
))
(declare-fun lt!475071 () ListLongMap!14563)

(declare-fun lt!475079 () ListLongMap!14563)

(declare-fun -!684 (ListLongMap!14563 (_ BitVec 64)) ListLongMap!14563)

(assert (=> b!1072195 (= lt!475071 (-!684 lt!475079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475070 () ListLongMap!14563)

(declare-fun lt!475072 () ListLongMap!14563)

(assert (=> b!1072195 (= lt!475070 lt!475072)))

(declare-fun zeroValueBefore!47 () V!39633)

(declare-datatypes ((Unit!35171 0))(
  ( (Unit!35172) )
))
(declare-fun lt!475078 () Unit!35171)

(declare-fun minValue!907 () V!39633)

(declare-fun lt!475069 () ListLongMap!14563)

(declare-fun addCommutativeForDiffKeys!742 (ListLongMap!14563 (_ BitVec 64) V!39633 (_ BitVec 64) V!39633) Unit!35171)

(assert (=> b!1072195 (= lt!475078 (addCommutativeForDiffKeys!742 lt!475069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475077 () ListLongMap!14563)

(assert (=> b!1072195 (= (-!684 lt!475072 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475077)))

(declare-fun lt!475081 () tuple2!16594)

(declare-fun +!3229 (ListLongMap!14563 tuple2!16594) ListLongMap!14563)

(assert (=> b!1072195 (= lt!475072 (+!3229 lt!475077 lt!475081))))

(declare-fun lt!475073 () Unit!35171)

(declare-fun addThenRemoveForNewKeyIsSame!65 (ListLongMap!14563 (_ BitVec 64) V!39633) Unit!35171)

(assert (=> b!1072195 (= lt!475073 (addThenRemoveForNewKeyIsSame!65 lt!475077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!475074 () tuple2!16594)

(assert (=> b!1072195 (= lt!475077 (+!3229 lt!475069 lt!475074))))

(declare-fun e!612380 () Bool)

(assert (=> b!1072195 e!612380))

(declare-fun res!715241 () Bool)

(assert (=> b!1072195 (=> (not res!715241) (not e!612380))))

(assert (=> b!1072195 (= res!715241 (= lt!475079 lt!475070))))

(assert (=> b!1072195 (= lt!475070 (+!3229 (+!3229 lt!475069 lt!475081) lt!475074))))

(assert (=> b!1072195 (= lt!475074 (tuple2!16595 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072195 (= lt!475081 (tuple2!16595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!475080 () ListLongMap!14563)

(declare-datatypes ((ValueCell!12233 0))(
  ( (ValueCellFull!12233 (v!15603 V!39633)) (EmptyCell!12233) )
))
(declare-datatypes ((array!68654 0))(
  ( (array!68655 (arr!33022 (Array (_ BitVec 32) ValueCell!12233)) (size!33560 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68654)

(declare-datatypes ((array!68656 0))(
  ( (array!68657 (arr!33023 (Array (_ BitVec 32) (_ BitVec 64))) (size!33561 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68656)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39633)

(declare-fun getCurrentListMap!4097 (array!68656 array!68654 (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 (_ BitVec 32) Int) ListLongMap!14563)

(assert (=> b!1072195 (= lt!475080 (getCurrentListMap!4097 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072195 (= lt!475079 (getCurrentListMap!4097 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072196 () Bool)

(declare-fun res!715240 () Bool)

(declare-fun e!612385 () Bool)

(assert (=> b!1072196 (=> (not res!715240) (not e!612385))))

(assert (=> b!1072196 (= res!715240 (and (= (size!33560 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33561 _keys!1163) (size!33560 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!475076 () ListLongMap!14563)

(declare-fun b!1072198 () Bool)

(assert (=> b!1072198 (= e!612380 (= lt!475080 (+!3229 lt!475076 lt!475074)))))

(declare-fun b!1072199 () Bool)

(declare-fun e!612382 () Bool)

(declare-fun e!612383 () Bool)

(declare-fun mapRes!40519 () Bool)

(assert (=> b!1072199 (= e!612382 (and e!612383 mapRes!40519))))

(declare-fun condMapEmpty!40519 () Bool)

(declare-fun mapDefault!40519 () ValueCell!12233)

(assert (=> b!1072199 (= condMapEmpty!40519 (= (arr!33022 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12233)) mapDefault!40519)))))

(declare-fun mapIsEmpty!40519 () Bool)

(assert (=> mapIsEmpty!40519 mapRes!40519))

(declare-fun b!1072200 () Bool)

(declare-fun res!715242 () Bool)

(assert (=> b!1072200 (=> (not res!715242) (not e!612385))))

(declare-datatypes ((List!23118 0))(
  ( (Nil!23115) (Cons!23114 (h!24323 (_ BitVec 64)) (t!32444 List!23118)) )
))
(declare-fun arrayNoDuplicates!0 (array!68656 (_ BitVec 32) List!23118) Bool)

(assert (=> b!1072200 (= res!715242 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23115))))

(declare-fun b!1072201 () Bool)

(assert (=> b!1072201 (= e!612385 (not e!612381))))

(declare-fun res!715238 () Bool)

(assert (=> b!1072201 (=> res!715238 e!612381)))

(assert (=> b!1072201 (= res!715238 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072201 (= lt!475069 lt!475076)))

(declare-fun lt!475075 () Unit!35171)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!873 (array!68656 array!68654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 V!39633 V!39633 (_ BitVec 32) Int) Unit!35171)

(assert (=> b!1072201 (= lt!475075 (lemmaNoChangeToArrayThenSameMapNoExtras!873 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3879 (array!68656 array!68654 (_ BitVec 32) (_ BitVec 32) V!39633 V!39633 (_ BitVec 32) Int) ListLongMap!14563)

(assert (=> b!1072201 (= lt!475076 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072201 (= lt!475069 (getCurrentListMapNoExtraKeys!3879 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40519 () Bool)

(declare-fun tp!77650 () Bool)

(assert (=> mapNonEmpty!40519 (= mapRes!40519 (and tp!77650 e!612386))))

(declare-fun mapKey!40519 () (_ BitVec 32))

(declare-fun mapValue!40519 () ValueCell!12233)

(declare-fun mapRest!40519 () (Array (_ BitVec 32) ValueCell!12233))

(assert (=> mapNonEmpty!40519 (= (arr!33022 _values!955) (store mapRest!40519 mapKey!40519 mapValue!40519))))

(declare-fun b!1072202 () Bool)

(assert (=> b!1072202 (= e!612383 tp_is_empty!25873)))

(declare-fun b!1072197 () Bool)

(declare-fun res!715243 () Bool)

(assert (=> b!1072197 (=> (not res!715243) (not e!612385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68656 (_ BitVec 32)) Bool)

(assert (=> b!1072197 (= res!715243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715239 () Bool)

(assert (=> start!94828 (=> (not res!715239) (not e!612385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94828 (= res!715239 (validMask!0 mask!1515))))

(assert (=> start!94828 e!612385))

(assert (=> start!94828 true))

(assert (=> start!94828 tp_is_empty!25873))

(declare-fun array_inv!25550 (array!68654) Bool)

(assert (=> start!94828 (and (array_inv!25550 _values!955) e!612382)))

(assert (=> start!94828 tp!77651))

(declare-fun array_inv!25551 (array!68656) Bool)

(assert (=> start!94828 (array_inv!25551 _keys!1163)))

(assert (= (and start!94828 res!715239) b!1072196))

(assert (= (and b!1072196 res!715240) b!1072197))

(assert (= (and b!1072197 res!715243) b!1072200))

(assert (= (and b!1072200 res!715242) b!1072201))

(assert (= (and b!1072201 (not res!715238)) b!1072195))

(assert (= (and b!1072195 res!715241) b!1072198))

(assert (= (and b!1072199 condMapEmpty!40519) mapIsEmpty!40519))

(assert (= (and b!1072199 (not condMapEmpty!40519)) mapNonEmpty!40519))

(get-info :version)

(assert (= (and mapNonEmpty!40519 ((_ is ValueCellFull!12233) mapValue!40519)) b!1072194))

(assert (= (and b!1072199 ((_ is ValueCellFull!12233) mapDefault!40519)) b!1072202))

(assert (= start!94828 b!1072199))

(declare-fun m!990627 () Bool)

(assert (=> start!94828 m!990627))

(declare-fun m!990629 () Bool)

(assert (=> start!94828 m!990629))

(declare-fun m!990631 () Bool)

(assert (=> start!94828 m!990631))

(declare-fun m!990633 () Bool)

(assert (=> b!1072198 m!990633))

(declare-fun m!990635 () Bool)

(assert (=> b!1072197 m!990635))

(declare-fun m!990637 () Bool)

(assert (=> b!1072200 m!990637))

(declare-fun m!990639 () Bool)

(assert (=> b!1072201 m!990639))

(declare-fun m!990641 () Bool)

(assert (=> b!1072201 m!990641))

(declare-fun m!990643 () Bool)

(assert (=> b!1072201 m!990643))

(declare-fun m!990645 () Bool)

(assert (=> mapNonEmpty!40519 m!990645))

(declare-fun m!990647 () Bool)

(assert (=> b!1072195 m!990647))

(declare-fun m!990649 () Bool)

(assert (=> b!1072195 m!990649))

(declare-fun m!990651 () Bool)

(assert (=> b!1072195 m!990651))

(declare-fun m!990653 () Bool)

(assert (=> b!1072195 m!990653))

(declare-fun m!990655 () Bool)

(assert (=> b!1072195 m!990655))

(declare-fun m!990657 () Bool)

(assert (=> b!1072195 m!990657))

(declare-fun m!990659 () Bool)

(assert (=> b!1072195 m!990659))

(assert (=> b!1072195 m!990649))

(declare-fun m!990661 () Bool)

(assert (=> b!1072195 m!990661))

(declare-fun m!990663 () Bool)

(assert (=> b!1072195 m!990663))

(declare-fun m!990665 () Bool)

(assert (=> b!1072195 m!990665))

(check-sat (not b!1072197) (not b_next!22063) tp_is_empty!25873 (not start!94828) b_and!34879 (not b!1072200) (not mapNonEmpty!40519) (not b!1072198) (not b!1072195) (not b!1072201))
(check-sat b_and!34879 (not b_next!22063))
