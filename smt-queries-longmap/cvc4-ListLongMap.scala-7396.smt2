; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94156 () Bool)

(assert start!94156)

(declare-fun b_free!21557 () Bool)

(declare-fun b_next!21557 () Bool)

(assert (=> start!94156 (= b_free!21557 (not b_next!21557))))

(declare-fun tp!76105 () Bool)

(declare-fun b_and!34307 () Bool)

(assert (=> start!94156 (= tp!76105 b_and!34307)))

(declare-fun res!710805 () Bool)

(declare-fun e!606908 () Bool)

(assert (=> start!94156 (=> (not res!710805) (not e!606908))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94156 (= res!710805 (validMask!0 mask!1515))))

(assert (=> start!94156 e!606908))

(assert (=> start!94156 true))

(declare-fun tp_is_empty!25367 () Bool)

(assert (=> start!94156 tp_is_empty!25367))

(declare-datatypes ((V!38957 0))(
  ( (V!38958 (val!12734 Int)) )
))
(declare-datatypes ((ValueCell!11980 0))(
  ( (ValueCellFull!11980 (v!15346 V!38957)) (EmptyCell!11980) )
))
(declare-datatypes ((array!67719 0))(
  ( (array!67720 (arr!32563 (Array (_ BitVec 32) ValueCell!11980)) (size!33099 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67719)

(declare-fun e!606907 () Bool)

(declare-fun array_inv!25216 (array!67719) Bool)

(assert (=> start!94156 (and (array_inv!25216 _values!955) e!606907)))

(assert (=> start!94156 tp!76105))

(declare-datatypes ((array!67721 0))(
  ( (array!67722 (arr!32564 (Array (_ BitVec 32) (_ BitVec 64))) (size!33100 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67721)

(declare-fun array_inv!25217 (array!67721) Bool)

(assert (=> start!94156 (array_inv!25217 _keys!1163)))

(declare-fun b!1064780 () Bool)

(declare-fun res!710804 () Bool)

(assert (=> b!1064780 (=> (not res!710804) (not e!606908))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064780 (= res!710804 (and (= (size!33099 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33100 _keys!1163) (size!33099 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39733 () Bool)

(declare-fun mapRes!39733 () Bool)

(declare-fun tp!76106 () Bool)

(declare-fun e!606909 () Bool)

(assert (=> mapNonEmpty!39733 (= mapRes!39733 (and tp!76106 e!606909))))

(declare-fun mapKey!39733 () (_ BitVec 32))

(declare-fun mapValue!39733 () ValueCell!11980)

(declare-fun mapRest!39733 () (Array (_ BitVec 32) ValueCell!11980))

(assert (=> mapNonEmpty!39733 (= (arr!32563 _values!955) (store mapRest!39733 mapKey!39733 mapValue!39733))))

(declare-fun b!1064781 () Bool)

(declare-fun e!606906 () Bool)

(assert (=> b!1064781 (= e!606908 (not e!606906))))

(declare-fun res!710806 () Bool)

(assert (=> b!1064781 (=> res!710806 e!606906)))

(assert (=> b!1064781 (= res!710806 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16130 0))(
  ( (tuple2!16131 (_1!8076 (_ BitVec 64)) (_2!8076 V!38957)) )
))
(declare-datatypes ((List!22700 0))(
  ( (Nil!22697) (Cons!22696 (h!23905 tuple2!16130) (t!32017 List!22700)) )
))
(declare-datatypes ((ListLongMap!14099 0))(
  ( (ListLongMap!14100 (toList!7065 List!22700)) )
))
(declare-fun lt!469372 () ListLongMap!14099)

(declare-fun lt!469370 () ListLongMap!14099)

(assert (=> b!1064781 (= lt!469372 lt!469370)))

(declare-fun zeroValueBefore!47 () V!38957)

(declare-datatypes ((Unit!34924 0))(
  ( (Unit!34925) )
))
(declare-fun lt!469371 () Unit!34924)

(declare-fun minValue!907 () V!38957)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38957)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!691 (array!67721 array!67719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38957 V!38957 V!38957 V!38957 (_ BitVec 32) Int) Unit!34924)

(assert (=> b!1064781 (= lt!469371 (lemmaNoChangeToArrayThenSameMapNoExtras!691 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3654 (array!67721 array!67719 (_ BitVec 32) (_ BitVec 32) V!38957 V!38957 (_ BitVec 32) Int) ListLongMap!14099)

(assert (=> b!1064781 (= lt!469370 (getCurrentListMapNoExtraKeys!3654 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064781 (= lt!469372 (getCurrentListMapNoExtraKeys!3654 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064782 () Bool)

(assert (=> b!1064782 (= e!606909 tp_is_empty!25367)))

(declare-fun b!1064783 () Bool)

(declare-fun e!606910 () Bool)

(assert (=> b!1064783 (= e!606910 tp_is_empty!25367)))

(declare-fun b!1064784 () Bool)

(assert (=> b!1064784 (= e!606906 true)))

(declare-fun lt!469373 () ListLongMap!14099)

(declare-fun getCurrentListMap!4025 (array!67721 array!67719 (_ BitVec 32) (_ BitVec 32) V!38957 V!38957 (_ BitVec 32) Int) ListLongMap!14099)

(assert (=> b!1064784 (= lt!469373 (getCurrentListMap!4025 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064785 () Bool)

(declare-fun res!710803 () Bool)

(assert (=> b!1064785 (=> (not res!710803) (not e!606908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67721 (_ BitVec 32)) Bool)

(assert (=> b!1064785 (= res!710803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064786 () Bool)

(assert (=> b!1064786 (= e!606907 (and e!606910 mapRes!39733))))

(declare-fun condMapEmpty!39733 () Bool)

(declare-fun mapDefault!39733 () ValueCell!11980)

