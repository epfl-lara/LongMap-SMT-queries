; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94208 () Bool)

(assert start!94208)

(declare-fun b_free!21593 () Bool)

(declare-fun b_next!21593 () Bool)

(assert (=> start!94208 (= b_free!21593 (not b_next!21593))))

(declare-fun tp!76216 () Bool)

(declare-fun b_and!34353 () Bool)

(assert (=> start!94208 (= tp!76216 b_and!34353)))

(declare-fun b!1065369 () Bool)

(declare-fun res!711140 () Bool)

(declare-fun e!607336 () Bool)

(assert (=> b!1065369 (=> (not res!711140) (not e!607336))))

(declare-datatypes ((array!67793 0))(
  ( (array!67794 (arr!32599 (Array (_ BitVec 32) (_ BitVec 64))) (size!33135 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67793)

(declare-datatypes ((List!22728 0))(
  ( (Nil!22725) (Cons!22724 (h!23933 (_ BitVec 64)) (t!32047 List!22728)) )
))
(declare-fun arrayNoDuplicates!0 (array!67793 (_ BitVec 32) List!22728) Bool)

(assert (=> b!1065369 (= res!711140 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22725))))

(declare-fun b!1065370 () Bool)

(declare-fun e!607333 () Bool)

(assert (=> b!1065370 (= e!607336 (not e!607333))))

(declare-fun res!711143 () Bool)

(assert (=> b!1065370 (=> res!711143 e!607333)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065370 (= res!711143 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39005 0))(
  ( (V!39006 (val!12752 Int)) )
))
(declare-datatypes ((tuple2!16160 0))(
  ( (tuple2!16161 (_1!8091 (_ BitVec 64)) (_2!8091 V!39005)) )
))
(declare-datatypes ((List!22729 0))(
  ( (Nil!22726) (Cons!22725 (h!23934 tuple2!16160) (t!32048 List!22729)) )
))
(declare-datatypes ((ListLongMap!14129 0))(
  ( (ListLongMap!14130 (toList!7080 List!22729)) )
))
(declare-fun lt!469781 () ListLongMap!14129)

(declare-fun lt!469778 () ListLongMap!14129)

(assert (=> b!1065370 (= lt!469781 lt!469778)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39005)

(declare-datatypes ((Unit!34953 0))(
  ( (Unit!34954) )
))
(declare-fun lt!469780 () Unit!34953)

(declare-datatypes ((ValueCell!11998 0))(
  ( (ValueCellFull!11998 (v!15364 V!39005)) (EmptyCell!11998) )
))
(declare-datatypes ((array!67795 0))(
  ( (array!67796 (arr!32600 (Array (_ BitVec 32) ValueCell!11998)) (size!33136 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67795)

(declare-fun minValue!907 () V!39005)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39005)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!705 (array!67793 array!67795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39005 V!39005 V!39005 V!39005 (_ BitVec 32) Int) Unit!34953)

(assert (=> b!1065370 (= lt!469780 (lemmaNoChangeToArrayThenSameMapNoExtras!705 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3668 (array!67793 array!67795 (_ BitVec 32) (_ BitVec 32) V!39005 V!39005 (_ BitVec 32) Int) ListLongMap!14129)

(assert (=> b!1065370 (= lt!469778 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065370 (= lt!469781 (getCurrentListMapNoExtraKeys!3668 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065371 () Bool)

(assert (=> b!1065371 (= e!607333 true)))

(declare-fun lt!469785 () ListLongMap!14129)

(declare-fun lt!469779 () ListLongMap!14129)

(declare-fun -!595 (ListLongMap!14129 (_ BitVec 64)) ListLongMap!14129)

(assert (=> b!1065371 (= lt!469785 (-!595 lt!469779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469784 () ListLongMap!14129)

(assert (=> b!1065371 (= (-!595 lt!469784 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469781)))

(declare-fun lt!469783 () Unit!34953)

(declare-fun addThenRemoveForNewKeyIsSame!4 (ListLongMap!14129 (_ BitVec 64) V!39005) Unit!34953)

(assert (=> b!1065371 (= lt!469783 (addThenRemoveForNewKeyIsSame!4 lt!469781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469782 () ListLongMap!14129)

(assert (=> b!1065371 (and (= lt!469779 lt!469784) (= lt!469782 lt!469778))))

(declare-fun +!3126 (ListLongMap!14129 tuple2!16160) ListLongMap!14129)

(assert (=> b!1065371 (= lt!469784 (+!3126 lt!469781 (tuple2!16161 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4039 (array!67793 array!67795 (_ BitVec 32) (_ BitVec 32) V!39005 V!39005 (_ BitVec 32) Int) ListLongMap!14129)

(assert (=> b!1065371 (= lt!469782 (getCurrentListMap!4039 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065371 (= lt!469779 (getCurrentListMap!4039 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711142 () Bool)

(assert (=> start!94208 (=> (not res!711142) (not e!607336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94208 (= res!711142 (validMask!0 mask!1515))))

(assert (=> start!94208 e!607336))

(assert (=> start!94208 true))

(declare-fun tp_is_empty!25403 () Bool)

(assert (=> start!94208 tp_is_empty!25403))

(declare-fun e!607335 () Bool)

(declare-fun array_inv!25242 (array!67795) Bool)

(assert (=> start!94208 (and (array_inv!25242 _values!955) e!607335)))

(assert (=> start!94208 tp!76216))

(declare-fun array_inv!25243 (array!67793) Bool)

(assert (=> start!94208 (array_inv!25243 _keys!1163)))

(declare-fun b!1065372 () Bool)

(declare-fun e!607337 () Bool)

(declare-fun mapRes!39790 () Bool)

(assert (=> b!1065372 (= e!607335 (and e!607337 mapRes!39790))))

(declare-fun condMapEmpty!39790 () Bool)

(declare-fun mapDefault!39790 () ValueCell!11998)

