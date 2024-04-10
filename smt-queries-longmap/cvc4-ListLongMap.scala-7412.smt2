; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94290 () Bool)

(assert start!94290)

(declare-fun b_free!21653 () Bool)

(declare-fun b_next!21653 () Bool)

(assert (=> start!94290 (= b_free!21653 (not b_next!21653))))

(declare-fun tp!76400 () Bool)

(declare-fun b_and!34425 () Bool)

(assert (=> start!94290 (= tp!76400 b_and!34425)))

(declare-fun mapIsEmpty!39883 () Bool)

(declare-fun mapRes!39883 () Bool)

(assert (=> mapIsEmpty!39883 mapRes!39883))

(declare-fun b!1066274 () Bool)

(declare-fun e!607994 () Bool)

(declare-fun tp_is_empty!25463 () Bool)

(assert (=> b!1066274 (= e!607994 tp_is_empty!25463)))

(declare-fun b!1066275 () Bool)

(declare-fun res!711675 () Bool)

(declare-fun e!607995 () Bool)

(assert (=> b!1066275 (=> (not res!711675) (not e!607995))))

(declare-datatypes ((array!67911 0))(
  ( (array!67912 (arr!32657 (Array (_ BitVec 32) (_ BitVec 64))) (size!33193 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67911)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67911 (_ BitVec 32)) Bool)

(assert (=> b!1066275 (= res!711675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066276 () Bool)

(declare-fun res!711672 () Bool)

(assert (=> b!1066276 (=> (not res!711672) (not e!607995))))

(declare-datatypes ((V!39085 0))(
  ( (V!39086 (val!12782 Int)) )
))
(declare-datatypes ((ValueCell!12028 0))(
  ( (ValueCellFull!12028 (v!15395 V!39085)) (EmptyCell!12028) )
))
(declare-datatypes ((array!67913 0))(
  ( (array!67914 (arr!32658 (Array (_ BitVec 32) ValueCell!12028)) (size!33194 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67913)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066276 (= res!711672 (and (= (size!33194 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33193 _keys!1163) (size!33194 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066277 () Bool)

(declare-fun e!607996 () Bool)

(assert (=> b!1066277 (= e!607995 (not e!607996))))

(declare-fun res!711674 () Bool)

(assert (=> b!1066277 (=> res!711674 e!607996)))

(assert (=> b!1066277 (= res!711674 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16208 0))(
  ( (tuple2!16209 (_1!8115 (_ BitVec 64)) (_2!8115 V!39085)) )
))
(declare-datatypes ((List!22772 0))(
  ( (Nil!22769) (Cons!22768 (h!23977 tuple2!16208) (t!32093 List!22772)) )
))
(declare-datatypes ((ListLongMap!14177 0))(
  ( (ListLongMap!14178 (toList!7104 List!22772)) )
))
(declare-fun lt!470639 () ListLongMap!14177)

(declare-fun lt!470643 () ListLongMap!14177)

(assert (=> b!1066277 (= lt!470639 lt!470643)))

(declare-datatypes ((Unit!35003 0))(
  ( (Unit!35004) )
))
(declare-fun lt!470636 () Unit!35003)

(declare-fun zeroValueBefore!47 () V!39085)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39085)

(declare-fun minValue!907 () V!39085)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!727 (array!67911 array!67913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39085 V!39085 V!39085 V!39085 (_ BitVec 32) Int) Unit!35003)

(assert (=> b!1066277 (= lt!470636 (lemmaNoChangeToArrayThenSameMapNoExtras!727 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3690 (array!67911 array!67913 (_ BitVec 32) (_ BitVec 32) V!39085 V!39085 (_ BitVec 32) Int) ListLongMap!14177)

(assert (=> b!1066277 (= lt!470643 (getCurrentListMapNoExtraKeys!3690 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066277 (= lt!470639 (getCurrentListMapNoExtraKeys!3690 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711676 () Bool)

(assert (=> start!94290 (=> (not res!711676) (not e!607995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94290 (= res!711676 (validMask!0 mask!1515))))

(assert (=> start!94290 e!607995))

(assert (=> start!94290 true))

(assert (=> start!94290 tp_is_empty!25463))

(declare-fun e!607991 () Bool)

(declare-fun array_inv!25284 (array!67913) Bool)

(assert (=> start!94290 (and (array_inv!25284 _values!955) e!607991)))

(assert (=> start!94290 tp!76400))

(declare-fun array_inv!25285 (array!67911) Bool)

(assert (=> start!94290 (array_inv!25285 _keys!1163)))

(declare-fun b!1066273 () Bool)

(assert (=> b!1066273 (= e!607996 true)))

(declare-fun lt!470641 () ListLongMap!14177)

(declare-fun lt!470640 () ListLongMap!14177)

(declare-fun -!616 (ListLongMap!14177 (_ BitVec 64)) ListLongMap!14177)

(assert (=> b!1066273 (= lt!470641 (-!616 lt!470640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470637 () ListLongMap!14177)

(assert (=> b!1066273 (= (-!616 lt!470637 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470639)))

(declare-fun lt!470642 () Unit!35003)

(declare-fun addThenRemoveForNewKeyIsSame!25 (ListLongMap!14177 (_ BitVec 64) V!39085) Unit!35003)

(assert (=> b!1066273 (= lt!470642 (addThenRemoveForNewKeyIsSame!25 lt!470639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470638 () ListLongMap!14177)

(assert (=> b!1066273 (and (= lt!470640 lt!470637) (= lt!470638 lt!470643))))

(declare-fun +!3147 (ListLongMap!14177 tuple2!16208) ListLongMap!14177)

(assert (=> b!1066273 (= lt!470637 (+!3147 lt!470639 (tuple2!16209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4060 (array!67911 array!67913 (_ BitVec 32) (_ BitVec 32) V!39085 V!39085 (_ BitVec 32) Int) ListLongMap!14177)

(assert (=> b!1066273 (= lt!470638 (getCurrentListMap!4060 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066273 (= lt!470640 (getCurrentListMap!4060 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066278 () Bool)

(assert (=> b!1066278 (= e!607991 (and e!607994 mapRes!39883))))

(declare-fun condMapEmpty!39883 () Bool)

(declare-fun mapDefault!39883 () ValueCell!12028)

