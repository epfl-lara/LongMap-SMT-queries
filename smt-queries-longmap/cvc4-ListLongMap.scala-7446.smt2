; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94552 () Bool)

(assert start!94552)

(declare-fun b_free!21857 () Bool)

(declare-fun b_next!21857 () Bool)

(assert (=> start!94552 (= b_free!21857 (not b_next!21857))))

(declare-fun tp!77021 () Bool)

(declare-fun b_and!34659 () Bool)

(assert (=> start!94552 (= tp!77021 b_and!34659)))

(declare-fun b!1069227 () Bool)

(declare-fun e!610187 () Bool)

(declare-datatypes ((array!68311 0))(
  ( (array!68312 (arr!32854 (Array (_ BitVec 32) (_ BitVec 64))) (size!33390 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68311)

(assert (=> b!1069227 (= e!610187 (bvsle #b00000000000000000000000000000000 (size!33390 _keys!1163)))))

(declare-datatypes ((V!39357 0))(
  ( (V!39358 (val!12884 Int)) )
))
(declare-datatypes ((tuple2!16376 0))(
  ( (tuple2!16377 (_1!8199 (_ BitVec 64)) (_2!8199 V!39357)) )
))
(declare-datatypes ((List!22921 0))(
  ( (Nil!22918) (Cons!22917 (h!24126 tuple2!16376) (t!32248 List!22921)) )
))
(declare-datatypes ((ListLongMap!14345 0))(
  ( (ListLongMap!14346 (toList!7188 List!22921)) )
))
(declare-fun lt!472462 () ListLongMap!14345)

(declare-fun -!667 (ListLongMap!14345 (_ BitVec 64)) ListLongMap!14345)

(assert (=> b!1069227 (= (-!667 lt!472462 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472462)))

(declare-datatypes ((Unit!35173 0))(
  ( (Unit!35174) )
))
(declare-fun lt!472464 () Unit!35173)

(declare-fun removeNotPresentStillSame!77 (ListLongMap!14345 (_ BitVec 64)) Unit!35173)

(assert (=> b!1069227 (= lt!472464 (removeNotPresentStillSame!77 lt!472462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!713461 () Bool)

(declare-fun e!610183 () Bool)

(assert (=> start!94552 (=> (not res!713461) (not e!610183))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94552 (= res!713461 (validMask!0 mask!1515))))

(assert (=> start!94552 e!610183))

(assert (=> start!94552 true))

(declare-fun tp_is_empty!25667 () Bool)

(assert (=> start!94552 tp_is_empty!25667))

(declare-datatypes ((ValueCell!12130 0))(
  ( (ValueCellFull!12130 (v!15499 V!39357)) (EmptyCell!12130) )
))
(declare-datatypes ((array!68313 0))(
  ( (array!68314 (arr!32855 (Array (_ BitVec 32) ValueCell!12130)) (size!33391 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68313)

(declare-fun e!610181 () Bool)

(declare-fun array_inv!25428 (array!68313) Bool)

(assert (=> start!94552 (and (array_inv!25428 _values!955) e!610181)))

(assert (=> start!94552 tp!77021))

(declare-fun array_inv!25429 (array!68311) Bool)

(assert (=> start!94552 (array_inv!25429 _keys!1163)))

(declare-fun b!1069228 () Bool)

(declare-fun e!610182 () Bool)

(assert (=> b!1069228 (= e!610182 e!610187)))

(declare-fun res!713458 () Bool)

(assert (=> b!1069228 (=> res!713458 e!610187)))

(declare-fun contains!6315 (ListLongMap!14345 (_ BitVec 64)) Bool)

(assert (=> b!1069228 (= res!713458 (contains!6315 lt!472462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39357)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39357)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4111 (array!68311 array!68313 (_ BitVec 32) (_ BitVec 32) V!39357 V!39357 (_ BitVec 32) Int) ListLongMap!14345)

(assert (=> b!1069228 (= lt!472462 (getCurrentListMap!4111 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069229 () Bool)

(assert (=> b!1069229 (= e!610183 (not e!610182))))

(declare-fun res!713457 () Bool)

(assert (=> b!1069229 (=> res!713457 e!610182)))

(assert (=> b!1069229 (= res!713457 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472463 () ListLongMap!14345)

(declare-fun lt!472465 () ListLongMap!14345)

(assert (=> b!1069229 (= lt!472463 lt!472465)))

(declare-fun lt!472466 () Unit!35173)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39357)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!801 (array!68311 array!68313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39357 V!39357 V!39357 V!39357 (_ BitVec 32) Int) Unit!35173)

(assert (=> b!1069229 (= lt!472466 (lemmaNoChangeToArrayThenSameMapNoExtras!801 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3764 (array!68311 array!68313 (_ BitVec 32) (_ BitVec 32) V!39357 V!39357 (_ BitVec 32) Int) ListLongMap!14345)

(assert (=> b!1069229 (= lt!472465 (getCurrentListMapNoExtraKeys!3764 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069229 (= lt!472463 (getCurrentListMapNoExtraKeys!3764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069230 () Bool)

(declare-fun res!713456 () Bool)

(assert (=> b!1069230 (=> (not res!713456) (not e!610183))))

(declare-datatypes ((List!22922 0))(
  ( (Nil!22919) (Cons!22918 (h!24127 (_ BitVec 64)) (t!32249 List!22922)) )
))
(declare-fun arrayNoDuplicates!0 (array!68311 (_ BitVec 32) List!22922) Bool)

(assert (=> b!1069230 (= res!713456 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22919))))

(declare-fun mapNonEmpty!40198 () Bool)

(declare-fun mapRes!40198 () Bool)

(declare-fun tp!77020 () Bool)

(declare-fun e!610185 () Bool)

(assert (=> mapNonEmpty!40198 (= mapRes!40198 (and tp!77020 e!610185))))

(declare-fun mapRest!40198 () (Array (_ BitVec 32) ValueCell!12130))

(declare-fun mapValue!40198 () ValueCell!12130)

(declare-fun mapKey!40198 () (_ BitVec 32))

(assert (=> mapNonEmpty!40198 (= (arr!32855 _values!955) (store mapRest!40198 mapKey!40198 mapValue!40198))))

(declare-fun b!1069231 () Bool)

(declare-fun e!610184 () Bool)

(assert (=> b!1069231 (= e!610184 tp_is_empty!25667)))

(declare-fun b!1069232 () Bool)

(assert (=> b!1069232 (= e!610185 tp_is_empty!25667)))

(declare-fun b!1069233 () Bool)

(declare-fun res!713459 () Bool)

(assert (=> b!1069233 (=> (not res!713459) (not e!610183))))

(assert (=> b!1069233 (= res!713459 (and (= (size!33391 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33390 _keys!1163) (size!33391 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40198 () Bool)

(assert (=> mapIsEmpty!40198 mapRes!40198))

(declare-fun b!1069234 () Bool)

(declare-fun res!713460 () Bool)

(assert (=> b!1069234 (=> (not res!713460) (not e!610183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68311 (_ BitVec 32)) Bool)

(assert (=> b!1069234 (= res!713460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069235 () Bool)

(assert (=> b!1069235 (= e!610181 (and e!610184 mapRes!40198))))

(declare-fun condMapEmpty!40198 () Bool)

(declare-fun mapDefault!40198 () ValueCell!12130)

