; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94240 () Bool)

(assert start!94240)

(declare-fun b_free!21625 () Bool)

(declare-fun b_next!21625 () Bool)

(assert (=> start!94240 (= b_free!21625 (not b_next!21625))))

(declare-fun tp!76313 () Bool)

(declare-fun b_and!34385 () Bool)

(assert (=> start!94240 (= tp!76313 b_and!34385)))

(declare-fun b!1065753 () Bool)

(declare-fun e!607623 () Bool)

(declare-fun e!607622 () Bool)

(assert (=> b!1065753 (= e!607623 (not e!607622))))

(declare-fun res!711382 () Bool)

(assert (=> b!1065753 (=> res!711382 e!607622)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065753 (= res!711382 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39049 0))(
  ( (V!39050 (val!12768 Int)) )
))
(declare-datatypes ((tuple2!16188 0))(
  ( (tuple2!16189 (_1!8105 (_ BitVec 64)) (_2!8105 V!39049)) )
))
(declare-datatypes ((List!22754 0))(
  ( (Nil!22751) (Cons!22750 (h!23959 tuple2!16188) (t!32073 List!22754)) )
))
(declare-datatypes ((ListLongMap!14157 0))(
  ( (ListLongMap!14158 (toList!7094 List!22754)) )
))
(declare-fun lt!470166 () ListLongMap!14157)

(declare-fun lt!470165 () ListLongMap!14157)

(assert (=> b!1065753 (= lt!470166 lt!470165)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!34981 0))(
  ( (Unit!34982) )
))
(declare-fun lt!470167 () Unit!34981)

(declare-datatypes ((ValueCell!12014 0))(
  ( (ValueCellFull!12014 (v!15380 V!39049)) (EmptyCell!12014) )
))
(declare-datatypes ((array!67855 0))(
  ( (array!67856 (arr!32630 (Array (_ BitVec 32) ValueCell!12014)) (size!33166 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67855)

(declare-fun minValue!907 () V!39049)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39049)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39049)

(declare-datatypes ((array!67857 0))(
  ( (array!67858 (arr!32631 (Array (_ BitVec 32) (_ BitVec 64))) (size!33167 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67857)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!717 (array!67857 array!67855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 V!39049 V!39049 (_ BitVec 32) Int) Unit!34981)

(assert (=> b!1065753 (= lt!470167 (lemmaNoChangeToArrayThenSameMapNoExtras!717 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3680 (array!67857 array!67855 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14157)

(assert (=> b!1065753 (= lt!470165 (getCurrentListMapNoExtraKeys!3680 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065753 (= lt!470166 (getCurrentListMapNoExtraKeys!3680 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065754 () Bool)

(assert (=> b!1065754 (= e!607622 true)))

(declare-fun lt!470162 () ListLongMap!14157)

(declare-fun lt!470163 () ListLongMap!14157)

(declare-fun -!609 (ListLongMap!14157 (_ BitVec 64)) ListLongMap!14157)

(assert (=> b!1065754 (= lt!470162 (-!609 lt!470163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470164 () ListLongMap!14157)

(assert (=> b!1065754 (= (-!609 lt!470164 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470166)))

(declare-fun lt!470169 () Unit!34981)

(declare-fun addThenRemoveForNewKeyIsSame!18 (ListLongMap!14157 (_ BitVec 64) V!39049) Unit!34981)

(assert (=> b!1065754 (= lt!470169 (addThenRemoveForNewKeyIsSame!18 lt!470166 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470168 () ListLongMap!14157)

(assert (=> b!1065754 (and (= lt!470163 lt!470164) (= lt!470168 lt!470165))))

(declare-fun +!3140 (ListLongMap!14157 tuple2!16188) ListLongMap!14157)

(assert (=> b!1065754 (= lt!470164 (+!3140 lt!470166 (tuple2!16189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4053 (array!67857 array!67855 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14157)

(assert (=> b!1065754 (= lt!470168 (getCurrentListMap!4053 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065754 (= lt!470163 (getCurrentListMap!4053 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065755 () Bool)

(declare-fun e!607624 () Bool)

(declare-fun e!607621 () Bool)

(declare-fun mapRes!39838 () Bool)

(assert (=> b!1065755 (= e!607624 (and e!607621 mapRes!39838))))

(declare-fun condMapEmpty!39838 () Bool)

(declare-fun mapDefault!39838 () ValueCell!12014)

