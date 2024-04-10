; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94280 () Bool)

(assert start!94280)

(declare-fun b_free!21643 () Bool)

(declare-fun b_next!21643 () Bool)

(assert (=> start!94280 (= b_free!21643 (not b_next!21643))))

(declare-fun tp!76370 () Bool)

(declare-fun b_and!34415 () Bool)

(assert (=> start!94280 (= tp!76370 b_and!34415)))

(declare-fun b!1066153 () Bool)

(declare-fun res!711601 () Bool)

(declare-fun e!607904 () Bool)

(assert (=> b!1066153 (=> (not res!711601) (not e!607904))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39073 0))(
  ( (V!39074 (val!12777 Int)) )
))
(declare-datatypes ((ValueCell!12023 0))(
  ( (ValueCellFull!12023 (v!15390 V!39073)) (EmptyCell!12023) )
))
(declare-datatypes ((array!67891 0))(
  ( (array!67892 (arr!32647 (Array (_ BitVec 32) ValueCell!12023)) (size!33183 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67891)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67893 0))(
  ( (array!67894 (arr!32648 (Array (_ BitVec 32) (_ BitVec 64))) (size!33184 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67893)

(assert (=> b!1066153 (= res!711601 (and (= (size!33183 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33184 _keys!1163) (size!33183 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39868 () Bool)

(declare-fun mapRes!39868 () Bool)

(declare-fun tp!76369 () Bool)

(declare-fun e!607902 () Bool)

(assert (=> mapNonEmpty!39868 (= mapRes!39868 (and tp!76369 e!607902))))

(declare-fun mapValue!39868 () ValueCell!12023)

(declare-fun mapRest!39868 () (Array (_ BitVec 32) ValueCell!12023))

(declare-fun mapKey!39868 () (_ BitVec 32))

(assert (=> mapNonEmpty!39868 (= (arr!32647 _values!955) (store mapRest!39868 mapKey!39868 mapValue!39868))))

(declare-fun b!1066154 () Bool)

(declare-fun e!607901 () Bool)

(assert (=> b!1066154 (= e!607904 (not e!607901))))

(declare-fun res!711599 () Bool)

(assert (=> b!1066154 (=> res!711599 e!607901)))

(assert (=> b!1066154 (= res!711599 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16200 0))(
  ( (tuple2!16201 (_1!8111 (_ BitVec 64)) (_2!8111 V!39073)) )
))
(declare-datatypes ((List!22764 0))(
  ( (Nil!22761) (Cons!22760 (h!23969 tuple2!16200) (t!32085 List!22764)) )
))
(declare-datatypes ((ListLongMap!14169 0))(
  ( (ListLongMap!14170 (toList!7100 List!22764)) )
))
(declare-fun lt!470519 () ListLongMap!14169)

(declare-fun lt!470520 () ListLongMap!14169)

(assert (=> b!1066154 (= lt!470519 lt!470520)))

(declare-fun zeroValueBefore!47 () V!39073)

(declare-datatypes ((Unit!34995 0))(
  ( (Unit!34996) )
))
(declare-fun lt!470522 () Unit!34995)

(declare-fun minValue!907 () V!39073)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39073)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!723 (array!67893 array!67891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 V!39073 V!39073 (_ BitVec 32) Int) Unit!34995)

(assert (=> b!1066154 (= lt!470522 (lemmaNoChangeToArrayThenSameMapNoExtras!723 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3686 (array!67893 array!67891 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1066154 (= lt!470520 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066154 (= lt!470519 (getCurrentListMapNoExtraKeys!3686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066155 () Bool)

(declare-fun res!711598 () Bool)

(assert (=> b!1066155 (=> (not res!711598) (not e!607904))))

(declare-datatypes ((List!22765 0))(
  ( (Nil!22762) (Cons!22761 (h!23970 (_ BitVec 64)) (t!32086 List!22765)) )
))
(declare-fun arrayNoDuplicates!0 (array!67893 (_ BitVec 32) List!22765) Bool)

(assert (=> b!1066155 (= res!711598 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22762))))

(declare-fun b!1066156 () Bool)

(declare-fun tp_is_empty!25453 () Bool)

(assert (=> b!1066156 (= e!607902 tp_is_empty!25453)))

(declare-fun b!1066157 () Bool)

(assert (=> b!1066157 (= e!607901 true)))

(declare-fun lt!470517 () ListLongMap!14169)

(declare-fun lt!470516 () ListLongMap!14169)

(declare-fun -!613 (ListLongMap!14169 (_ BitVec 64)) ListLongMap!14169)

(assert (=> b!1066157 (= lt!470517 (-!613 lt!470516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470518 () ListLongMap!14169)

(assert (=> b!1066157 (= (-!613 lt!470518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470519)))

(declare-fun lt!470521 () Unit!34995)

(declare-fun addThenRemoveForNewKeyIsSame!22 (ListLongMap!14169 (_ BitVec 64) V!39073) Unit!34995)

(assert (=> b!1066157 (= lt!470521 (addThenRemoveForNewKeyIsSame!22 lt!470519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470523 () ListLongMap!14169)

(assert (=> b!1066157 (and (= lt!470516 lt!470518) (= lt!470523 lt!470520))))

(declare-fun +!3144 (ListLongMap!14169 tuple2!16200) ListLongMap!14169)

(assert (=> b!1066157 (= lt!470518 (+!3144 lt!470519 (tuple2!16201 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4057 (array!67893 array!67891 (_ BitVec 32) (_ BitVec 32) V!39073 V!39073 (_ BitVec 32) Int) ListLongMap!14169)

(assert (=> b!1066157 (= lt!470523 (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066157 (= lt!470516 (getCurrentListMap!4057 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711600 () Bool)

(assert (=> start!94280 (=> (not res!711600) (not e!607904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94280 (= res!711600 (validMask!0 mask!1515))))

(assert (=> start!94280 e!607904))

(assert (=> start!94280 true))

(assert (=> start!94280 tp_is_empty!25453))

(declare-fun e!607906 () Bool)

(declare-fun array_inv!25278 (array!67891) Bool)

(assert (=> start!94280 (and (array_inv!25278 _values!955) e!607906)))

(assert (=> start!94280 tp!76370))

(declare-fun array_inv!25279 (array!67893) Bool)

(assert (=> start!94280 (array_inv!25279 _keys!1163)))

(declare-fun b!1066158 () Bool)

(declare-fun res!711597 () Bool)

(assert (=> b!1066158 (=> (not res!711597) (not e!607904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67893 (_ BitVec 32)) Bool)

(assert (=> b!1066158 (= res!711597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39868 () Bool)

(assert (=> mapIsEmpty!39868 mapRes!39868))

(declare-fun b!1066159 () Bool)

(declare-fun e!607903 () Bool)

(assert (=> b!1066159 (= e!607906 (and e!607903 mapRes!39868))))

(declare-fun condMapEmpty!39868 () Bool)

(declare-fun mapDefault!39868 () ValueCell!12023)

