; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94750 () Bool)

(assert start!94750)

(declare-fun b_free!22009 () Bool)

(declare-fun b_next!22009 () Bool)

(assert (=> start!94750 (= b_free!22009 (not b_next!22009))))

(declare-fun tp!77485 () Bool)

(declare-fun b_and!34813 () Bool)

(assert (=> start!94750 (= tp!77485 b_and!34813)))

(declare-fun b!1071273 () Bool)

(declare-fun e!611693 () Bool)

(assert (=> b!1071273 (= e!611693 true)))

(declare-datatypes ((V!39561 0))(
  ( (V!39562 (val!12960 Int)) )
))
(declare-datatypes ((tuple2!16542 0))(
  ( (tuple2!16543 (_1!8282 (_ BitVec 64)) (_2!8282 V!39561)) )
))
(declare-datatypes ((List!23069 0))(
  ( (Nil!23066) (Cons!23065 (h!24274 tuple2!16542) (t!32393 List!23069)) )
))
(declare-datatypes ((ListLongMap!14511 0))(
  ( (ListLongMap!14512 (toList!7271 List!23069)) )
))
(declare-fun lt!473870 () ListLongMap!14511)

(declare-fun lt!473868 () ListLongMap!14511)

(declare-fun -!667 (ListLongMap!14511 (_ BitVec 64)) ListLongMap!14511)

(assert (=> b!1071273 (= lt!473870 (-!667 lt!473868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473866 () ListLongMap!14511)

(declare-fun lt!473861 () ListLongMap!14511)

(assert (=> b!1071273 (= lt!473866 lt!473861)))

(declare-fun zeroValueBefore!47 () V!39561)

(declare-datatypes ((Unit!35121 0))(
  ( (Unit!35122) )
))
(declare-fun lt!473860 () Unit!35121)

(declare-fun lt!473863 () ListLongMap!14511)

(declare-fun minValue!907 () V!39561)

(declare-fun addCommutativeForDiffKeys!725 (ListLongMap!14511 (_ BitVec 64) V!39561 (_ BitVec 64) V!39561) Unit!35121)

(assert (=> b!1071273 (= lt!473860 (addCommutativeForDiffKeys!725 lt!473863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473862 () ListLongMap!14511)

(assert (=> b!1071273 (= (-!667 lt!473861 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473862)))

(declare-fun lt!473859 () tuple2!16542)

(declare-fun +!3207 (ListLongMap!14511 tuple2!16542) ListLongMap!14511)

(assert (=> b!1071273 (= lt!473861 (+!3207 lt!473862 lt!473859))))

(declare-fun lt!473867 () Unit!35121)

(declare-fun addThenRemoveForNewKeyIsSame!48 (ListLongMap!14511 (_ BitVec 64) V!39561) Unit!35121)

(assert (=> b!1071273 (= lt!473867 (addThenRemoveForNewKeyIsSame!48 lt!473862 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473869 () tuple2!16542)

(assert (=> b!1071273 (= lt!473862 (+!3207 lt!473863 lt!473869))))

(declare-fun e!611696 () Bool)

(assert (=> b!1071273 e!611696))

(declare-fun res!714663 () Bool)

(assert (=> b!1071273 (=> (not res!714663) (not e!611696))))

(assert (=> b!1071273 (= res!714663 (= lt!473868 lt!473866))))

(assert (=> b!1071273 (= lt!473866 (+!3207 (+!3207 lt!473863 lt!473859) lt!473869))))

(assert (=> b!1071273 (= lt!473869 (tuple2!16543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071273 (= lt!473859 (tuple2!16543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!473865 () ListLongMap!14511)

(declare-datatypes ((ValueCell!12206 0))(
  ( (ValueCellFull!12206 (v!15575 V!39561)) (EmptyCell!12206) )
))
(declare-datatypes ((array!68548 0))(
  ( (array!68549 (arr!32970 (Array (_ BitVec 32) ValueCell!12206)) (size!33508 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68548)

(declare-datatypes ((array!68550 0))(
  ( (array!68551 (arr!32971 (Array (_ BitVec 32) (_ BitVec 64))) (size!33509 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68550)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39561)

(declare-fun getCurrentListMap!4080 (array!68550 array!68548 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14511)

(assert (=> b!1071273 (= lt!473865 (getCurrentListMap!4080 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071273 (= lt!473868 (getCurrentListMap!4080 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071274 () Bool)

(declare-fun e!611690 () Bool)

(declare-fun e!611691 () Bool)

(declare-fun mapRes!40435 () Bool)

(assert (=> b!1071274 (= e!611690 (and e!611691 mapRes!40435))))

(declare-fun condMapEmpty!40435 () Bool)

(declare-fun mapDefault!40435 () ValueCell!12206)

(assert (=> b!1071274 (= condMapEmpty!40435 (= (arr!32970 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12206)) mapDefault!40435)))))

(declare-fun b!1071275 () Bool)

(declare-fun e!611692 () Bool)

(assert (=> b!1071275 (= e!611692 (not e!611693))))

(declare-fun res!714662 () Bool)

(assert (=> b!1071275 (=> res!714662 e!611693)))

(assert (=> b!1071275 (= res!714662 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473871 () ListLongMap!14511)

(assert (=> b!1071275 (= lt!473863 lt!473871)))

(declare-fun lt!473864 () Unit!35121)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!849 (array!68550 array!68548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 V!39561 V!39561 (_ BitVec 32) Int) Unit!35121)

(assert (=> b!1071275 (= lt!473864 (lemmaNoChangeToArrayThenSameMapNoExtras!849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3855 (array!68550 array!68548 (_ BitVec 32) (_ BitVec 32) V!39561 V!39561 (_ BitVec 32) Int) ListLongMap!14511)

(assert (=> b!1071275 (= lt!473871 (getCurrentListMapNoExtraKeys!3855 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071275 (= lt!473863 (getCurrentListMapNoExtraKeys!3855 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40435 () Bool)

(assert (=> mapIsEmpty!40435 mapRes!40435))

(declare-fun b!1071277 () Bool)

(declare-fun e!611694 () Bool)

(declare-fun tp_is_empty!25819 () Bool)

(assert (=> b!1071277 (= e!611694 tp_is_empty!25819)))

(declare-fun b!1071278 () Bool)

(declare-fun res!714665 () Bool)

(assert (=> b!1071278 (=> (not res!714665) (not e!611692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68550 (_ BitVec 32)) Bool)

(assert (=> b!1071278 (= res!714665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071279 () Bool)

(declare-fun res!714666 () Bool)

(assert (=> b!1071279 (=> (not res!714666) (not e!611692))))

(assert (=> b!1071279 (= res!714666 (and (= (size!33508 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33509 _keys!1163) (size!33508 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071280 () Bool)

(declare-fun res!714667 () Bool)

(assert (=> b!1071280 (=> (not res!714667) (not e!611692))))

(declare-datatypes ((List!23070 0))(
  ( (Nil!23067) (Cons!23066 (h!24275 (_ BitVec 64)) (t!32394 List!23070)) )
))
(declare-fun arrayNoDuplicates!0 (array!68550 (_ BitVec 32) List!23070) Bool)

(assert (=> b!1071280 (= res!714667 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23067))))

(declare-fun b!1071276 () Bool)

(assert (=> b!1071276 (= e!611696 (= lt!473865 (+!3207 lt!473871 lt!473869)))))

(declare-fun res!714664 () Bool)

(assert (=> start!94750 (=> (not res!714664) (not e!611692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94750 (= res!714664 (validMask!0 mask!1515))))

(assert (=> start!94750 e!611692))

(assert (=> start!94750 true))

(assert (=> start!94750 tp_is_empty!25819))

(declare-fun array_inv!25504 (array!68548) Bool)

(assert (=> start!94750 (and (array_inv!25504 _values!955) e!611690)))

(assert (=> start!94750 tp!77485))

(declare-fun array_inv!25505 (array!68550) Bool)

(assert (=> start!94750 (array_inv!25505 _keys!1163)))

(declare-fun mapNonEmpty!40435 () Bool)

(declare-fun tp!77486 () Bool)

(assert (=> mapNonEmpty!40435 (= mapRes!40435 (and tp!77486 e!611694))))

(declare-fun mapKey!40435 () (_ BitVec 32))

(declare-fun mapRest!40435 () (Array (_ BitVec 32) ValueCell!12206))

(declare-fun mapValue!40435 () ValueCell!12206)

(assert (=> mapNonEmpty!40435 (= (arr!32970 _values!955) (store mapRest!40435 mapKey!40435 mapValue!40435))))

(declare-fun b!1071281 () Bool)

(assert (=> b!1071281 (= e!611691 tp_is_empty!25819)))

(assert (= (and start!94750 res!714664) b!1071279))

(assert (= (and b!1071279 res!714666) b!1071278))

(assert (= (and b!1071278 res!714665) b!1071280))

(assert (= (and b!1071280 res!714667) b!1071275))

(assert (= (and b!1071275 (not res!714662)) b!1071273))

(assert (= (and b!1071273 res!714663) b!1071276))

(assert (= (and b!1071274 condMapEmpty!40435) mapIsEmpty!40435))

(assert (= (and b!1071274 (not condMapEmpty!40435)) mapNonEmpty!40435))

(get-info :version)

(assert (= (and mapNonEmpty!40435 ((_ is ValueCellFull!12206) mapValue!40435)) b!1071277))

(assert (= (and b!1071274 ((_ is ValueCellFull!12206) mapDefault!40435)) b!1071281))

(assert (= start!94750 b!1071274))

(declare-fun m!989303 () Bool)

(assert (=> b!1071275 m!989303))

(declare-fun m!989305 () Bool)

(assert (=> b!1071275 m!989305))

(declare-fun m!989307 () Bool)

(assert (=> b!1071275 m!989307))

(declare-fun m!989309 () Bool)

(assert (=> start!94750 m!989309))

(declare-fun m!989311 () Bool)

(assert (=> start!94750 m!989311))

(declare-fun m!989313 () Bool)

(assert (=> start!94750 m!989313))

(declare-fun m!989315 () Bool)

(assert (=> b!1071278 m!989315))

(declare-fun m!989317 () Bool)

(assert (=> b!1071276 m!989317))

(declare-fun m!989319 () Bool)

(assert (=> b!1071280 m!989319))

(declare-fun m!989321 () Bool)

(assert (=> b!1071273 m!989321))

(declare-fun m!989323 () Bool)

(assert (=> b!1071273 m!989323))

(declare-fun m!989325 () Bool)

(assert (=> b!1071273 m!989325))

(declare-fun m!989327 () Bool)

(assert (=> b!1071273 m!989327))

(declare-fun m!989329 () Bool)

(assert (=> b!1071273 m!989329))

(declare-fun m!989331 () Bool)

(assert (=> b!1071273 m!989331))

(assert (=> b!1071273 m!989329))

(declare-fun m!989333 () Bool)

(assert (=> b!1071273 m!989333))

(declare-fun m!989335 () Bool)

(assert (=> b!1071273 m!989335))

(declare-fun m!989337 () Bool)

(assert (=> b!1071273 m!989337))

(declare-fun m!989339 () Bool)

(assert (=> b!1071273 m!989339))

(declare-fun m!989341 () Bool)

(assert (=> mapNonEmpty!40435 m!989341))

(check-sat (not b!1071278) tp_is_empty!25819 b_and!34813 (not b!1071280) (not b_next!22009) (not start!94750) (not b!1071276) (not mapNonEmpty!40435) (not b!1071273) (not b!1071275))
(check-sat b_and!34813 (not b_next!22009))
