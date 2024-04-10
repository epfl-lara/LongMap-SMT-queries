; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94292 () Bool)

(assert start!94292)

(declare-fun b_free!21655 () Bool)

(declare-fun b_next!21655 () Bool)

(assert (=> start!94292 (= b_free!21655 (not b_next!21655))))

(declare-fun tp!76406 () Bool)

(declare-fun b_and!34427 () Bool)

(assert (=> start!94292 (= tp!76406 b_and!34427)))

(declare-fun b!1066297 () Bool)

(declare-fun res!711691 () Bool)

(declare-fun e!608014 () Bool)

(assert (=> b!1066297 (=> (not res!711691) (not e!608014))))

(declare-datatypes ((array!67915 0))(
  ( (array!67916 (arr!32659 (Array (_ BitVec 32) (_ BitVec 64))) (size!33195 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67915)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67915 (_ BitVec 32)) Bool)

(assert (=> b!1066297 (= res!711691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39886 () Bool)

(declare-fun mapRes!39886 () Bool)

(assert (=> mapIsEmpty!39886 mapRes!39886))

(declare-fun res!711688 () Bool)

(assert (=> start!94292 (=> (not res!711688) (not e!608014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94292 (= res!711688 (validMask!0 mask!1515))))

(assert (=> start!94292 e!608014))

(assert (=> start!94292 true))

(declare-fun tp_is_empty!25465 () Bool)

(assert (=> start!94292 tp_is_empty!25465))

(declare-datatypes ((V!39089 0))(
  ( (V!39090 (val!12783 Int)) )
))
(declare-datatypes ((ValueCell!12029 0))(
  ( (ValueCellFull!12029 (v!15396 V!39089)) (EmptyCell!12029) )
))
(declare-datatypes ((array!67917 0))(
  ( (array!67918 (arr!32660 (Array (_ BitVec 32) ValueCell!12029)) (size!33196 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67917)

(declare-fun e!608013 () Bool)

(declare-fun array_inv!25286 (array!67917) Bool)

(assert (=> start!94292 (and (array_inv!25286 _values!955) e!608013)))

(assert (=> start!94292 tp!76406))

(declare-fun array_inv!25287 (array!67915) Bool)

(assert (=> start!94292 (array_inv!25287 _keys!1163)))

(declare-fun b!1066298 () Bool)

(declare-fun e!608009 () Bool)

(assert (=> b!1066298 (= e!608014 (not e!608009))))

(declare-fun res!711689 () Bool)

(assert (=> b!1066298 (=> res!711689 e!608009)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066298 (= res!711689 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16210 0))(
  ( (tuple2!16211 (_1!8116 (_ BitVec 64)) (_2!8116 V!39089)) )
))
(declare-datatypes ((List!22773 0))(
  ( (Nil!22770) (Cons!22769 (h!23978 tuple2!16210) (t!32094 List!22773)) )
))
(declare-datatypes ((ListLongMap!14179 0))(
  ( (ListLongMap!14180 (toList!7105 List!22773)) )
))
(declare-fun lt!470663 () ListLongMap!14179)

(declare-fun lt!470661 () ListLongMap!14179)

(assert (=> b!1066298 (= lt!470663 lt!470661)))

(declare-fun zeroValueBefore!47 () V!39089)

(declare-datatypes ((Unit!35005 0))(
  ( (Unit!35006) )
))
(declare-fun lt!470666 () Unit!35005)

(declare-fun minValue!907 () V!39089)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39089)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!728 (array!67915 array!67917 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 V!39089 V!39089 (_ BitVec 32) Int) Unit!35005)

(assert (=> b!1066298 (= lt!470666 (lemmaNoChangeToArrayThenSameMapNoExtras!728 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3691 (array!67915 array!67917 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14179)

(assert (=> b!1066298 (= lt!470661 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066298 (= lt!470663 (getCurrentListMapNoExtraKeys!3691 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066299 () Bool)

(declare-fun res!711690 () Bool)

(assert (=> b!1066299 (=> (not res!711690) (not e!608014))))

(assert (=> b!1066299 (= res!711690 (and (= (size!33196 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33195 _keys!1163) (size!33196 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066300 () Bool)

(declare-fun res!711687 () Bool)

(assert (=> b!1066300 (=> (not res!711687) (not e!608014))))

(declare-datatypes ((List!22774 0))(
  ( (Nil!22771) (Cons!22770 (h!23979 (_ BitVec 64)) (t!32095 List!22774)) )
))
(declare-fun arrayNoDuplicates!0 (array!67915 (_ BitVec 32) List!22774) Bool)

(assert (=> b!1066300 (= res!711687 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22771))))

(declare-fun b!1066301 () Bool)

(declare-fun e!608011 () Bool)

(assert (=> b!1066301 (= e!608011 tp_is_empty!25465)))

(declare-fun b!1066302 () Bool)

(declare-fun e!608012 () Bool)

(assert (=> b!1066302 (= e!608012 tp_is_empty!25465)))

(declare-fun b!1066303 () Bool)

(assert (=> b!1066303 (= e!608009 true)))

(declare-fun lt!470660 () ListLongMap!14179)

(declare-fun lt!470664 () ListLongMap!14179)

(declare-fun -!617 (ListLongMap!14179 (_ BitVec 64)) ListLongMap!14179)

(assert (=> b!1066303 (= lt!470660 (-!617 lt!470664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470662 () ListLongMap!14179)

(assert (=> b!1066303 (= (-!617 lt!470662 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470663)))

(declare-fun lt!470665 () Unit!35005)

(declare-fun addThenRemoveForNewKeyIsSame!26 (ListLongMap!14179 (_ BitVec 64) V!39089) Unit!35005)

(assert (=> b!1066303 (= lt!470665 (addThenRemoveForNewKeyIsSame!26 lt!470663 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470667 () ListLongMap!14179)

(assert (=> b!1066303 (and (= lt!470664 lt!470662) (= lt!470667 lt!470661))))

(declare-fun +!3148 (ListLongMap!14179 tuple2!16210) ListLongMap!14179)

(assert (=> b!1066303 (= lt!470662 (+!3148 lt!470663 (tuple2!16211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4061 (array!67915 array!67917 (_ BitVec 32) (_ BitVec 32) V!39089 V!39089 (_ BitVec 32) Int) ListLongMap!14179)

(assert (=> b!1066303 (= lt!470667 (getCurrentListMap!4061 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066303 (= lt!470664 (getCurrentListMap!4061 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066304 () Bool)

(assert (=> b!1066304 (= e!608013 (and e!608011 mapRes!39886))))

(declare-fun condMapEmpty!39886 () Bool)

(declare-fun mapDefault!39886 () ValueCell!12029)

