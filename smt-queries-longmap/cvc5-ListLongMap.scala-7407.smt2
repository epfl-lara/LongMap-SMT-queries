; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94234 () Bool)

(assert start!94234)

(declare-fun b_free!21619 () Bool)

(declare-fun b_next!21619 () Bool)

(assert (=> start!94234 (= b_free!21619 (not b_next!21619))))

(declare-fun tp!76295 () Bool)

(declare-fun b_and!34379 () Bool)

(assert (=> start!94234 (= tp!76295 b_and!34379)))

(declare-fun b!1065681 () Bool)

(declare-fun e!607571 () Bool)

(declare-fun e!607568 () Bool)

(assert (=> b!1065681 (= e!607571 (not e!607568))))

(declare-fun res!711337 () Bool)

(assert (=> b!1065681 (=> res!711337 e!607568)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065681 (= res!711337 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39041 0))(
  ( (V!39042 (val!12765 Int)) )
))
(declare-datatypes ((tuple2!16182 0))(
  ( (tuple2!16183 (_1!8102 (_ BitVec 64)) (_2!8102 V!39041)) )
))
(declare-datatypes ((List!22748 0))(
  ( (Nil!22745) (Cons!22744 (h!23953 tuple2!16182) (t!32067 List!22748)) )
))
(declare-datatypes ((ListLongMap!14151 0))(
  ( (ListLongMap!14152 (toList!7091 List!22748)) )
))
(declare-fun lt!470090 () ListLongMap!14151)

(declare-fun lt!470096 () ListLongMap!14151)

(assert (=> b!1065681 (= lt!470090 lt!470096)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12011 0))(
  ( (ValueCellFull!12011 (v!15377 V!39041)) (EmptyCell!12011) )
))
(declare-datatypes ((array!67843 0))(
  ( (array!67844 (arr!32624 (Array (_ BitVec 32) ValueCell!12011)) (size!33160 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67843)

(declare-fun minValue!907 () V!39041)

(declare-datatypes ((Unit!34975 0))(
  ( (Unit!34976) )
))
(declare-fun lt!470097 () Unit!34975)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39041)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39041)

(declare-datatypes ((array!67845 0))(
  ( (array!67846 (arr!32625 (Array (_ BitVec 32) (_ BitVec 64))) (size!33161 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67845)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!714 (array!67845 array!67843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 V!39041 V!39041 (_ BitVec 32) Int) Unit!34975)

(assert (=> b!1065681 (= lt!470097 (lemmaNoChangeToArrayThenSameMapNoExtras!714 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3677 (array!67845 array!67843 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14151)

(assert (=> b!1065681 (= lt!470096 (getCurrentListMapNoExtraKeys!3677 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065681 (= lt!470090 (getCurrentListMapNoExtraKeys!3677 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065682 () Bool)

(declare-fun res!711339 () Bool)

(assert (=> b!1065682 (=> (not res!711339) (not e!607571))))

(assert (=> b!1065682 (= res!711339 (and (= (size!33160 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33161 _keys!1163) (size!33160 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!711336 () Bool)

(assert (=> start!94234 (=> (not res!711336) (not e!607571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94234 (= res!711336 (validMask!0 mask!1515))))

(assert (=> start!94234 e!607571))

(assert (=> start!94234 true))

(declare-fun tp_is_empty!25429 () Bool)

(assert (=> start!94234 tp_is_empty!25429))

(declare-fun e!607569 () Bool)

(declare-fun array_inv!25262 (array!67843) Bool)

(assert (=> start!94234 (and (array_inv!25262 _values!955) e!607569)))

(assert (=> start!94234 tp!76295))

(declare-fun array_inv!25263 (array!67845) Bool)

(assert (=> start!94234 (array_inv!25263 _keys!1163)))

(declare-fun b!1065683 () Bool)

(assert (=> b!1065683 (= e!607568 true)))

(declare-fun lt!470092 () ListLongMap!14151)

(declare-fun lt!470095 () ListLongMap!14151)

(declare-fun -!606 (ListLongMap!14151 (_ BitVec 64)) ListLongMap!14151)

(assert (=> b!1065683 (= lt!470092 (-!606 lt!470095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470091 () ListLongMap!14151)

(assert (=> b!1065683 (= (-!606 lt!470091 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470090)))

(declare-fun lt!470094 () Unit!34975)

(declare-fun addThenRemoveForNewKeyIsSame!15 (ListLongMap!14151 (_ BitVec 64) V!39041) Unit!34975)

(assert (=> b!1065683 (= lt!470094 (addThenRemoveForNewKeyIsSame!15 lt!470090 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470093 () ListLongMap!14151)

(assert (=> b!1065683 (and (= lt!470095 lt!470091) (= lt!470093 lt!470096))))

(declare-fun +!3137 (ListLongMap!14151 tuple2!16182) ListLongMap!14151)

(assert (=> b!1065683 (= lt!470091 (+!3137 lt!470090 (tuple2!16183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4050 (array!67845 array!67843 (_ BitVec 32) (_ BitVec 32) V!39041 V!39041 (_ BitVec 32) Int) ListLongMap!14151)

(assert (=> b!1065683 (= lt!470093 (getCurrentListMap!4050 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065683 (= lt!470095 (getCurrentListMap!4050 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065684 () Bool)

(declare-fun e!607570 () Bool)

(assert (=> b!1065684 (= e!607570 tp_is_empty!25429)))

(declare-fun mapNonEmpty!39829 () Bool)

(declare-fun mapRes!39829 () Bool)

(declare-fun tp!76294 () Bool)

(declare-fun e!607567 () Bool)

(assert (=> mapNonEmpty!39829 (= mapRes!39829 (and tp!76294 e!607567))))

(declare-fun mapValue!39829 () ValueCell!12011)

(declare-fun mapRest!39829 () (Array (_ BitVec 32) ValueCell!12011))

(declare-fun mapKey!39829 () (_ BitVec 32))

(assert (=> mapNonEmpty!39829 (= (arr!32624 _values!955) (store mapRest!39829 mapKey!39829 mapValue!39829))))

(declare-fun b!1065685 () Bool)

(declare-fun res!711338 () Bool)

(assert (=> b!1065685 (=> (not res!711338) (not e!607571))))

(declare-datatypes ((List!22749 0))(
  ( (Nil!22746) (Cons!22745 (h!23954 (_ BitVec 64)) (t!32068 List!22749)) )
))
(declare-fun arrayNoDuplicates!0 (array!67845 (_ BitVec 32) List!22749) Bool)

(assert (=> b!1065685 (= res!711338 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22746))))

(declare-fun mapIsEmpty!39829 () Bool)

(assert (=> mapIsEmpty!39829 mapRes!39829))

(declare-fun b!1065686 () Bool)

(declare-fun res!711335 () Bool)

(assert (=> b!1065686 (=> (not res!711335) (not e!607571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67845 (_ BitVec 32)) Bool)

(assert (=> b!1065686 (= res!711335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065687 () Bool)

(assert (=> b!1065687 (= e!607567 tp_is_empty!25429)))

(declare-fun b!1065688 () Bool)

(assert (=> b!1065688 (= e!607569 (and e!607570 mapRes!39829))))

(declare-fun condMapEmpty!39829 () Bool)

(declare-fun mapDefault!39829 () ValueCell!12011)

