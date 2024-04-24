; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94510 () Bool)

(assert start!94510)

(declare-fun b_free!21637 () Bool)

(declare-fun b_next!21637 () Bool)

(assert (=> start!94510 (= b_free!21637 (not b_next!21637))))

(declare-fun tp!76351 () Bool)

(declare-fun b_and!34419 () Bool)

(assert (=> start!94510 (= tp!76351 b_and!34419)))

(declare-fun b!1067408 () Bool)

(declare-fun res!712075 () Bool)

(declare-fun e!608706 () Bool)

(assert (=> b!1067408 (=> (not res!712075) (not e!608706))))

(declare-datatypes ((array!67927 0))(
  ( (array!67928 (arr!32659 (Array (_ BitVec 32) (_ BitVec 64))) (size!33196 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67927)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67927 (_ BitVec 32)) Bool)

(assert (=> b!1067408 (= res!712075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067409 () Bool)

(declare-fun e!608704 () Bool)

(declare-fun tp_is_empty!25447 () Bool)

(assert (=> b!1067409 (= e!608704 tp_is_empty!25447)))

(declare-fun res!712078 () Bool)

(assert (=> start!94510 (=> (not res!712078) (not e!608706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94510 (= res!712078 (validMask!0 mask!1515))))

(assert (=> start!94510 e!608706))

(assert (=> start!94510 true))

(assert (=> start!94510 tp_is_empty!25447))

(declare-datatypes ((V!39065 0))(
  ( (V!39066 (val!12774 Int)) )
))
(declare-datatypes ((ValueCell!12020 0))(
  ( (ValueCellFull!12020 (v!15383 V!39065)) (EmptyCell!12020) )
))
(declare-datatypes ((array!67929 0))(
  ( (array!67930 (arr!32660 (Array (_ BitVec 32) ValueCell!12020)) (size!33197 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67929)

(declare-fun e!608703 () Bool)

(declare-fun array_inv!25310 (array!67929) Bool)

(assert (=> start!94510 (and (array_inv!25310 _values!955) e!608703)))

(assert (=> start!94510 tp!76351))

(declare-fun array_inv!25311 (array!67927) Bool)

(assert (=> start!94510 (array_inv!25311 _keys!1163)))

(declare-fun b!1067410 () Bool)

(declare-fun e!608705 () Bool)

(assert (=> b!1067410 (= e!608706 (not e!608705))))

(declare-fun res!712077 () Bool)

(assert (=> b!1067410 (=> res!712077 e!608705)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067410 (= res!712077 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16178 0))(
  ( (tuple2!16179 (_1!8100 (_ BitVec 64)) (_2!8100 V!39065)) )
))
(declare-datatypes ((List!22746 0))(
  ( (Nil!22743) (Cons!22742 (h!23960 tuple2!16178) (t!32059 List!22746)) )
))
(declare-datatypes ((ListLongMap!14155 0))(
  ( (ListLongMap!14156 (toList!7093 List!22746)) )
))
(declare-fun lt!470966 () ListLongMap!14155)

(declare-fun lt!470965 () ListLongMap!14155)

(assert (=> b!1067410 (= lt!470966 lt!470965)))

(declare-fun zeroValueBefore!47 () V!39065)

(declare-datatypes ((Unit!34982 0))(
  ( (Unit!34983) )
))
(declare-fun lt!470964 () Unit!34982)

(declare-fun minValue!907 () V!39065)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39065)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!719 (array!67927 array!67929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 V!39065 V!39065 (_ BitVec 32) Int) Unit!34982)

(assert (=> b!1067410 (= lt!470964 (lemmaNoChangeToArrayThenSameMapNoExtras!719 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3716 (array!67927 array!67929 (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 (_ BitVec 32) Int) ListLongMap!14155)

(assert (=> b!1067410 (= lt!470965 (getCurrentListMapNoExtraKeys!3716 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067410 (= lt!470966 (getCurrentListMapNoExtraKeys!3716 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067411 () Bool)

(declare-fun e!608702 () Bool)

(assert (=> b!1067411 (= e!608702 tp_is_empty!25447)))

(declare-fun b!1067412 () Bool)

(declare-fun res!712076 () Bool)

(assert (=> b!1067412 (=> (not res!712076) (not e!608706))))

(declare-datatypes ((List!22747 0))(
  ( (Nil!22744) (Cons!22743 (h!23961 (_ BitVec 64)) (t!32060 List!22747)) )
))
(declare-fun arrayNoDuplicates!0 (array!67927 (_ BitVec 32) List!22747) Bool)

(assert (=> b!1067412 (= res!712076 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22744))))

(declare-fun b!1067413 () Bool)

(assert (=> b!1067413 (= e!608705 true)))

(declare-fun lt!470963 () ListLongMap!14155)

(declare-fun lt!470959 () ListLongMap!14155)

(declare-fun -!610 (ListLongMap!14155 (_ BitVec 64)) ListLongMap!14155)

(assert (=> b!1067413 (= lt!470963 (-!610 lt!470959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470960 () ListLongMap!14155)

(assert (=> b!1067413 (= (-!610 lt!470960 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470966)))

(declare-fun lt!470961 () Unit!34982)

(declare-fun addThenRemoveForNewKeyIsSame!20 (ListLongMap!14155 (_ BitVec 64) V!39065) Unit!34982)

(assert (=> b!1067413 (= lt!470961 (addThenRemoveForNewKeyIsSame!20 lt!470966 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470962 () ListLongMap!14155)

(assert (=> b!1067413 (and (= lt!470959 lt!470960) (= lt!470962 lt!470965))))

(declare-fun +!3163 (ListLongMap!14155 tuple2!16178) ListLongMap!14155)

(assert (=> b!1067413 (= lt!470960 (+!3163 lt!470966 (tuple2!16179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4044 (array!67927 array!67929 (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 (_ BitVec 32) Int) ListLongMap!14155)

(assert (=> b!1067413 (= lt!470962 (getCurrentListMap!4044 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067413 (= lt!470959 (getCurrentListMap!4044 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067414 () Bool)

(declare-fun res!712074 () Bool)

(assert (=> b!1067414 (=> (not res!712074) (not e!608706))))

(assert (=> b!1067414 (= res!712074 (and (= (size!33197 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33196 _keys!1163) (size!33197 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067415 () Bool)

(declare-fun mapRes!39859 () Bool)

(assert (=> b!1067415 (= e!608703 (and e!608704 mapRes!39859))))

(declare-fun condMapEmpty!39859 () Bool)

(declare-fun mapDefault!39859 () ValueCell!12020)

(assert (=> b!1067415 (= condMapEmpty!39859 (= (arr!32660 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12020)) mapDefault!39859)))))

(declare-fun mapNonEmpty!39859 () Bool)

(declare-fun tp!76352 () Bool)

(assert (=> mapNonEmpty!39859 (= mapRes!39859 (and tp!76352 e!608702))))

(declare-fun mapKey!39859 () (_ BitVec 32))

(declare-fun mapRest!39859 () (Array (_ BitVec 32) ValueCell!12020))

(declare-fun mapValue!39859 () ValueCell!12020)

(assert (=> mapNonEmpty!39859 (= (arr!32660 _values!955) (store mapRest!39859 mapKey!39859 mapValue!39859))))

(declare-fun mapIsEmpty!39859 () Bool)

(assert (=> mapIsEmpty!39859 mapRes!39859))

(assert (= (and start!94510 res!712078) b!1067414))

(assert (= (and b!1067414 res!712074) b!1067408))

(assert (= (and b!1067408 res!712075) b!1067412))

(assert (= (and b!1067412 res!712076) b!1067410))

(assert (= (and b!1067410 (not res!712077)) b!1067413))

(assert (= (and b!1067415 condMapEmpty!39859) mapIsEmpty!39859))

(assert (= (and b!1067415 (not condMapEmpty!39859)) mapNonEmpty!39859))

(get-info :version)

(assert (= (and mapNonEmpty!39859 ((_ is ValueCellFull!12020) mapValue!39859)) b!1067411))

(assert (= (and b!1067415 ((_ is ValueCellFull!12020) mapDefault!39859)) b!1067409))

(assert (= start!94510 b!1067415))

(declare-fun m!986325 () Bool)

(assert (=> b!1067408 m!986325))

(declare-fun m!986327 () Bool)

(assert (=> mapNonEmpty!39859 m!986327))

(declare-fun m!986329 () Bool)

(assert (=> start!94510 m!986329))

(declare-fun m!986331 () Bool)

(assert (=> start!94510 m!986331))

(declare-fun m!986333 () Bool)

(assert (=> start!94510 m!986333))

(declare-fun m!986335 () Bool)

(assert (=> b!1067410 m!986335))

(declare-fun m!986337 () Bool)

(assert (=> b!1067410 m!986337))

(declare-fun m!986339 () Bool)

(assert (=> b!1067410 m!986339))

(declare-fun m!986341 () Bool)

(assert (=> b!1067412 m!986341))

(declare-fun m!986343 () Bool)

(assert (=> b!1067413 m!986343))

(declare-fun m!986345 () Bool)

(assert (=> b!1067413 m!986345))

(declare-fun m!986347 () Bool)

(assert (=> b!1067413 m!986347))

(declare-fun m!986349 () Bool)

(assert (=> b!1067413 m!986349))

(declare-fun m!986351 () Bool)

(assert (=> b!1067413 m!986351))

(declare-fun m!986353 () Bool)

(assert (=> b!1067413 m!986353))

(check-sat b_and!34419 (not b!1067412) (not b!1067410) tp_is_empty!25447 (not start!94510) (not b_next!21637) (not b!1067408) (not b!1067413) (not mapNonEmpty!39859))
(check-sat b_and!34419 (not b_next!21637))
