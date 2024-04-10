; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94314 () Bool)

(assert start!94314)

(declare-fun b_free!21677 () Bool)

(declare-fun b_next!21677 () Bool)

(assert (=> start!94314 (= b_free!21677 (not b_next!21677))))

(declare-fun tp!76471 () Bool)

(declare-fun b_and!34449 () Bool)

(assert (=> start!94314 (= tp!76471 b_and!34449)))

(declare-fun res!711856 () Bool)

(declare-fun e!608212 () Bool)

(assert (=> start!94314 (=> (not res!711856) (not e!608212))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94314 (= res!711856 (validMask!0 mask!1515))))

(assert (=> start!94314 e!608212))

(assert (=> start!94314 true))

(declare-fun tp_is_empty!25487 () Bool)

(assert (=> start!94314 tp_is_empty!25487))

(declare-datatypes ((V!39117 0))(
  ( (V!39118 (val!12794 Int)) )
))
(declare-datatypes ((ValueCell!12040 0))(
  ( (ValueCellFull!12040 (v!15407 V!39117)) (EmptyCell!12040) )
))
(declare-datatypes ((array!67959 0))(
  ( (array!67960 (arr!32681 (Array (_ BitVec 32) ValueCell!12040)) (size!33217 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67959)

(declare-fun e!608207 () Bool)

(declare-fun array_inv!25304 (array!67959) Bool)

(assert (=> start!94314 (and (array_inv!25304 _values!955) e!608207)))

(assert (=> start!94314 tp!76471))

(declare-datatypes ((array!67961 0))(
  ( (array!67962 (arr!32682 (Array (_ BitVec 32) (_ BitVec 64))) (size!33218 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67961)

(declare-fun array_inv!25305 (array!67961) Bool)

(assert (=> start!94314 (array_inv!25305 _keys!1163)))

(declare-fun b!1066561 () Bool)

(declare-fun e!608209 () Bool)

(assert (=> b!1066561 (= e!608209 true)))

(declare-datatypes ((tuple2!16228 0))(
  ( (tuple2!16229 (_1!8125 (_ BitVec 64)) (_2!8125 V!39117)) )
))
(declare-datatypes ((List!22791 0))(
  ( (Nil!22788) (Cons!22787 (h!23996 tuple2!16228) (t!32112 List!22791)) )
))
(declare-datatypes ((ListLongMap!14197 0))(
  ( (ListLongMap!14198 (toList!7114 List!22791)) )
))
(declare-fun lt!470927 () ListLongMap!14197)

(declare-fun lt!470926 () ListLongMap!14197)

(declare-fun -!624 (ListLongMap!14197 (_ BitVec 64)) ListLongMap!14197)

(assert (=> b!1066561 (= lt!470927 (-!624 lt!470926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470924 () ListLongMap!14197)

(declare-fun lt!470929 () ListLongMap!14197)

(assert (=> b!1066561 (= (-!624 lt!470924 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470929)))

(declare-datatypes ((Unit!35023 0))(
  ( (Unit!35024) )
))
(declare-fun lt!470931 () Unit!35023)

(declare-fun zeroValueBefore!47 () V!39117)

(declare-fun addThenRemoveForNewKeyIsSame!33 (ListLongMap!14197 (_ BitVec 64) V!39117) Unit!35023)

(assert (=> b!1066561 (= lt!470931 (addThenRemoveForNewKeyIsSame!33 lt!470929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470928 () ListLongMap!14197)

(declare-fun lt!470930 () ListLongMap!14197)

(assert (=> b!1066561 (and (= lt!470926 lt!470924) (= lt!470928 lt!470930))))

(declare-fun +!3155 (ListLongMap!14197 tuple2!16228) ListLongMap!14197)

(assert (=> b!1066561 (= lt!470924 (+!3155 lt!470929 (tuple2!16229 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39117)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39117)

(declare-fun getCurrentListMap!4068 (array!67961 array!67959 (_ BitVec 32) (_ BitVec 32) V!39117 V!39117 (_ BitVec 32) Int) ListLongMap!14197)

(assert (=> b!1066561 (= lt!470928 (getCurrentListMap!4068 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066561 (= lt!470926 (getCurrentListMap!4068 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066562 () Bool)

(declare-fun res!711854 () Bool)

(assert (=> b!1066562 (=> (not res!711854) (not e!608212))))

(assert (=> b!1066562 (= res!711854 (and (= (size!33217 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33218 _keys!1163) (size!33217 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066563 () Bool)

(declare-fun e!608211 () Bool)

(assert (=> b!1066563 (= e!608211 tp_is_empty!25487)))

(declare-fun b!1066564 () Bool)

(declare-fun res!711855 () Bool)

(assert (=> b!1066564 (=> (not res!711855) (not e!608212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67961 (_ BitVec 32)) Bool)

(assert (=> b!1066564 (= res!711855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39919 () Bool)

(declare-fun mapRes!39919 () Bool)

(declare-fun tp!76472 () Bool)

(assert (=> mapNonEmpty!39919 (= mapRes!39919 (and tp!76472 e!608211))))

(declare-fun mapValue!39919 () ValueCell!12040)

(declare-fun mapKey!39919 () (_ BitVec 32))

(declare-fun mapRest!39919 () (Array (_ BitVec 32) ValueCell!12040))

(assert (=> mapNonEmpty!39919 (= (arr!32681 _values!955) (store mapRest!39919 mapKey!39919 mapValue!39919))))

(declare-fun b!1066565 () Bool)

(assert (=> b!1066565 (= e!608212 (not e!608209))))

(declare-fun res!711853 () Bool)

(assert (=> b!1066565 (=> res!711853 e!608209)))

(assert (=> b!1066565 (= res!711853 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066565 (= lt!470929 lt!470930)))

(declare-fun lt!470925 () Unit!35023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!736 (array!67961 array!67959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39117 V!39117 V!39117 V!39117 (_ BitVec 32) Int) Unit!35023)

(assert (=> b!1066565 (= lt!470925 (lemmaNoChangeToArrayThenSameMapNoExtras!736 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3699 (array!67961 array!67959 (_ BitVec 32) (_ BitVec 32) V!39117 V!39117 (_ BitVec 32) Int) ListLongMap!14197)

(assert (=> b!1066565 (= lt!470930 (getCurrentListMapNoExtraKeys!3699 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066565 (= lt!470929 (getCurrentListMapNoExtraKeys!3699 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066566 () Bool)

(declare-fun e!608208 () Bool)

(assert (=> b!1066566 (= e!608208 tp_is_empty!25487)))

(declare-fun b!1066567 () Bool)

(declare-fun res!711852 () Bool)

(assert (=> b!1066567 (=> (not res!711852) (not e!608212))))

(declare-datatypes ((List!22792 0))(
  ( (Nil!22789) (Cons!22788 (h!23997 (_ BitVec 64)) (t!32113 List!22792)) )
))
(declare-fun arrayNoDuplicates!0 (array!67961 (_ BitVec 32) List!22792) Bool)

(assert (=> b!1066567 (= res!711852 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22789))))

(declare-fun b!1066568 () Bool)

(assert (=> b!1066568 (= e!608207 (and e!608208 mapRes!39919))))

(declare-fun condMapEmpty!39919 () Bool)

(declare-fun mapDefault!39919 () ValueCell!12040)

