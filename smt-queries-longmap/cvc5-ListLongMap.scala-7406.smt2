; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94228 () Bool)

(assert start!94228)

(declare-fun b_free!21613 () Bool)

(declare-fun b_next!21613 () Bool)

(assert (=> start!94228 (= b_free!21613 (not b_next!21613))))

(declare-fun tp!76276 () Bool)

(declare-fun b_and!34373 () Bool)

(assert (=> start!94228 (= tp!76276 b_and!34373)))

(declare-fun b!1065609 () Bool)

(declare-fun e!607515 () Bool)

(declare-fun tp_is_empty!25423 () Bool)

(assert (=> b!1065609 (= e!607515 tp_is_empty!25423)))

(declare-fun b!1065610 () Bool)

(declare-fun res!711290 () Bool)

(declare-fun e!607512 () Bool)

(assert (=> b!1065610 (=> (not res!711290) (not e!607512))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((V!39033 0))(
  ( (V!39034 (val!12762 Int)) )
))
(declare-datatypes ((ValueCell!12008 0))(
  ( (ValueCellFull!12008 (v!15374 V!39033)) (EmptyCell!12008) )
))
(declare-datatypes ((array!67833 0))(
  ( (array!67834 (arr!32619 (Array (_ BitVec 32) ValueCell!12008)) (size!33155 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67833)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67835 0))(
  ( (array!67836 (arr!32620 (Array (_ BitVec 32) (_ BitVec 64))) (size!33156 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67835)

(assert (=> b!1065610 (= res!711290 (and (= (size!33155 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33156 _keys!1163) (size!33155 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065611 () Bool)

(declare-fun res!711291 () Bool)

(assert (=> b!1065611 (=> (not res!711291) (not e!607512))))

(declare-datatypes ((List!22744 0))(
  ( (Nil!22741) (Cons!22740 (h!23949 (_ BitVec 64)) (t!32063 List!22744)) )
))
(declare-fun arrayNoDuplicates!0 (array!67835 (_ BitVec 32) List!22744) Bool)

(assert (=> b!1065611 (= res!711291 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22741))))

(declare-fun res!711293 () Bool)

(assert (=> start!94228 (=> (not res!711293) (not e!607512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94228 (= res!711293 (validMask!0 mask!1515))))

(assert (=> start!94228 e!607512))

(assert (=> start!94228 true))

(assert (=> start!94228 tp_is_empty!25423))

(declare-fun e!607516 () Bool)

(declare-fun array_inv!25258 (array!67833) Bool)

(assert (=> start!94228 (and (array_inv!25258 _values!955) e!607516)))

(assert (=> start!94228 tp!76276))

(declare-fun array_inv!25259 (array!67835) Bool)

(assert (=> start!94228 (array_inv!25259 _keys!1163)))

(declare-fun b!1065612 () Bool)

(declare-fun e!607514 () Bool)

(assert (=> b!1065612 (= e!607514 true)))

(declare-datatypes ((tuple2!16178 0))(
  ( (tuple2!16179 (_1!8100 (_ BitVec 64)) (_2!8100 V!39033)) )
))
(declare-datatypes ((List!22745 0))(
  ( (Nil!22742) (Cons!22741 (h!23950 tuple2!16178) (t!32064 List!22745)) )
))
(declare-datatypes ((ListLongMap!14147 0))(
  ( (ListLongMap!14148 (toList!7089 List!22745)) )
))
(declare-fun lt!470018 () ListLongMap!14147)

(declare-fun lt!470020 () ListLongMap!14147)

(declare-fun -!604 (ListLongMap!14147 (_ BitVec 64)) ListLongMap!14147)

(assert (=> b!1065612 (= lt!470018 (-!604 lt!470020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470025 () ListLongMap!14147)

(declare-fun lt!470022 () ListLongMap!14147)

(assert (=> b!1065612 (= (-!604 lt!470025 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470022)))

(declare-datatypes ((Unit!34971 0))(
  ( (Unit!34972) )
))
(declare-fun lt!470019 () Unit!34971)

(declare-fun zeroValueBefore!47 () V!39033)

(declare-fun addThenRemoveForNewKeyIsSame!13 (ListLongMap!14147 (_ BitVec 64) V!39033) Unit!34971)

(assert (=> b!1065612 (= lt!470019 (addThenRemoveForNewKeyIsSame!13 lt!470022 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470021 () ListLongMap!14147)

(declare-fun lt!470024 () ListLongMap!14147)

(assert (=> b!1065612 (and (= lt!470020 lt!470025) (= lt!470024 lt!470021))))

(declare-fun +!3135 (ListLongMap!14147 tuple2!16178) ListLongMap!14147)

(assert (=> b!1065612 (= lt!470025 (+!3135 lt!470022 (tuple2!16179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39033)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39033)

(declare-fun getCurrentListMap!4048 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1065612 (= lt!470024 (getCurrentListMap!4048 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065612 (= lt!470020 (getCurrentListMap!4048 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065613 () Bool)

(assert (=> b!1065613 (= e!607512 (not e!607514))))

(declare-fun res!711294 () Bool)

(assert (=> b!1065613 (=> res!711294 e!607514)))

(assert (=> b!1065613 (= res!711294 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065613 (= lt!470022 lt!470021)))

(declare-fun lt!470023 () Unit!34971)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!712 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 V!39033 V!39033 (_ BitVec 32) Int) Unit!34971)

(assert (=> b!1065613 (= lt!470023 (lemmaNoChangeToArrayThenSameMapNoExtras!712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3675 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1065613 (= lt!470021 (getCurrentListMapNoExtraKeys!3675 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065613 (= lt!470022 (getCurrentListMapNoExtraKeys!3675 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39820 () Bool)

(declare-fun mapRes!39820 () Bool)

(declare-fun tp!76277 () Bool)

(assert (=> mapNonEmpty!39820 (= mapRes!39820 (and tp!76277 e!607515))))

(declare-fun mapKey!39820 () (_ BitVec 32))

(declare-fun mapValue!39820 () ValueCell!12008)

(declare-fun mapRest!39820 () (Array (_ BitVec 32) ValueCell!12008))

(assert (=> mapNonEmpty!39820 (= (arr!32619 _values!955) (store mapRest!39820 mapKey!39820 mapValue!39820))))

(declare-fun b!1065614 () Bool)

(declare-fun res!711292 () Bool)

(assert (=> b!1065614 (=> (not res!711292) (not e!607512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67835 (_ BitVec 32)) Bool)

(assert (=> b!1065614 (= res!711292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39820 () Bool)

(assert (=> mapIsEmpty!39820 mapRes!39820))

(declare-fun b!1065615 () Bool)

(declare-fun e!607513 () Bool)

(assert (=> b!1065615 (= e!607516 (and e!607513 mapRes!39820))))

(declare-fun condMapEmpty!39820 () Bool)

(declare-fun mapDefault!39820 () ValueCell!12008)

