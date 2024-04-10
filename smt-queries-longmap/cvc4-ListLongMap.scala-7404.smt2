; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94220 () Bool)

(assert start!94220)

(declare-fun b_free!21605 () Bool)

(declare-fun b_next!21605 () Bool)

(assert (=> start!94220 (= b_free!21605 (not b_next!21605))))

(declare-fun tp!76252 () Bool)

(declare-fun b_and!34365 () Bool)

(assert (=> start!94220 (= tp!76252 b_and!34365)))

(declare-fun b!1065513 () Bool)

(declare-fun res!711233 () Bool)

(declare-fun e!607443 () Bool)

(assert (=> b!1065513 (=> (not res!711233) (not e!607443))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39021 0))(
  ( (V!39022 (val!12758 Int)) )
))
(declare-datatypes ((ValueCell!12004 0))(
  ( (ValueCellFull!12004 (v!15370 V!39021)) (EmptyCell!12004) )
))
(declare-datatypes ((array!67817 0))(
  ( (array!67818 (arr!32611 (Array (_ BitVec 32) ValueCell!12004)) (size!33147 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67817)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67819 0))(
  ( (array!67820 (arr!32612 (Array (_ BitVec 32) (_ BitVec 64))) (size!33148 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67819)

(assert (=> b!1065513 (= res!711233 (and (= (size!33147 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33148 _keys!1163) (size!33147 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065514 () Bool)

(declare-fun e!607445 () Bool)

(declare-fun tp_is_empty!25415 () Bool)

(assert (=> b!1065514 (= e!607445 tp_is_empty!25415)))

(declare-fun b!1065515 () Bool)

(declare-fun e!607444 () Bool)

(assert (=> b!1065515 (= e!607444 true)))

(declare-datatypes ((tuple2!16170 0))(
  ( (tuple2!16171 (_1!8096 (_ BitVec 64)) (_2!8096 V!39021)) )
))
(declare-datatypes ((List!22738 0))(
  ( (Nil!22735) (Cons!22734 (h!23943 tuple2!16170) (t!32057 List!22738)) )
))
(declare-datatypes ((ListLongMap!14139 0))(
  ( (ListLongMap!14140 (toList!7085 List!22738)) )
))
(declare-fun lt!469923 () ListLongMap!14139)

(declare-fun lt!469929 () ListLongMap!14139)

(declare-fun -!600 (ListLongMap!14139 (_ BitVec 64)) ListLongMap!14139)

(assert (=> b!1065515 (= lt!469923 (-!600 lt!469929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469927 () ListLongMap!14139)

(declare-fun lt!469928 () ListLongMap!14139)

(assert (=> b!1065515 (= (-!600 lt!469927 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469928)))

(declare-datatypes ((Unit!34963 0))(
  ( (Unit!34964) )
))
(declare-fun lt!469922 () Unit!34963)

(declare-fun zeroValueBefore!47 () V!39021)

(declare-fun addThenRemoveForNewKeyIsSame!9 (ListLongMap!14139 (_ BitVec 64) V!39021) Unit!34963)

(assert (=> b!1065515 (= lt!469922 (addThenRemoveForNewKeyIsSame!9 lt!469928 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469924 () ListLongMap!14139)

(declare-fun lt!469926 () ListLongMap!14139)

(assert (=> b!1065515 (and (= lt!469929 lt!469927) (= lt!469926 lt!469924))))

(declare-fun +!3131 (ListLongMap!14139 tuple2!16170) ListLongMap!14139)

(assert (=> b!1065515 (= lt!469927 (+!3131 lt!469928 (tuple2!16171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39021)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39021)

(declare-fun getCurrentListMap!4044 (array!67819 array!67817 (_ BitVec 32) (_ BitVec 32) V!39021 V!39021 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1065515 (= lt!469926 (getCurrentListMap!4044 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065515 (= lt!469929 (getCurrentListMap!4044 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711234 () Bool)

(assert (=> start!94220 (=> (not res!711234) (not e!607443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94220 (= res!711234 (validMask!0 mask!1515))))

(assert (=> start!94220 e!607443))

(assert (=> start!94220 true))

(assert (=> start!94220 tp_is_empty!25415))

(declare-fun e!607440 () Bool)

(declare-fun array_inv!25252 (array!67817) Bool)

(assert (=> start!94220 (and (array_inv!25252 _values!955) e!607440)))

(assert (=> start!94220 tp!76252))

(declare-fun array_inv!25253 (array!67819) Bool)

(assert (=> start!94220 (array_inv!25253 _keys!1163)))

(declare-fun b!1065516 () Bool)

(assert (=> b!1065516 (= e!607443 (not e!607444))))

(declare-fun res!711230 () Bool)

(assert (=> b!1065516 (=> res!711230 e!607444)))

(assert (=> b!1065516 (= res!711230 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065516 (= lt!469928 lt!469924)))

(declare-fun lt!469925 () Unit!34963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!709 (array!67819 array!67817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39021 V!39021 V!39021 V!39021 (_ BitVec 32) Int) Unit!34963)

(assert (=> b!1065516 (= lt!469925 (lemmaNoChangeToArrayThenSameMapNoExtras!709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3672 (array!67819 array!67817 (_ BitVec 32) (_ BitVec 32) V!39021 V!39021 (_ BitVec 32) Int) ListLongMap!14139)

(assert (=> b!1065516 (= lt!469924 (getCurrentListMapNoExtraKeys!3672 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065516 (= lt!469928 (getCurrentListMapNoExtraKeys!3672 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065517 () Bool)

(declare-fun e!607442 () Bool)

(assert (=> b!1065517 (= e!607442 tp_is_empty!25415)))

(declare-fun mapIsEmpty!39808 () Bool)

(declare-fun mapRes!39808 () Bool)

(assert (=> mapIsEmpty!39808 mapRes!39808))

(declare-fun b!1065518 () Bool)

(declare-fun res!711232 () Bool)

(assert (=> b!1065518 (=> (not res!711232) (not e!607443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67819 (_ BitVec 32)) Bool)

(assert (=> b!1065518 (= res!711232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39808 () Bool)

(declare-fun tp!76253 () Bool)

(assert (=> mapNonEmpty!39808 (= mapRes!39808 (and tp!76253 e!607442))))

(declare-fun mapKey!39808 () (_ BitVec 32))

(declare-fun mapValue!39808 () ValueCell!12004)

(declare-fun mapRest!39808 () (Array (_ BitVec 32) ValueCell!12004))

(assert (=> mapNonEmpty!39808 (= (arr!32611 _values!955) (store mapRest!39808 mapKey!39808 mapValue!39808))))

(declare-fun b!1065519 () Bool)

(assert (=> b!1065519 (= e!607440 (and e!607445 mapRes!39808))))

(declare-fun condMapEmpty!39808 () Bool)

(declare-fun mapDefault!39808 () ValueCell!12004)

