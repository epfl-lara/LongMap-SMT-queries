; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95238 () Bool)

(assert start!95238)

(declare-fun b_free!22239 () Bool)

(declare-fun b_next!22239 () Bool)

(assert (=> start!95238 (= b_free!22239 (not b_next!22239))))

(declare-fun tp!78215 () Bool)

(declare-fun b_and!35217 () Bool)

(assert (=> start!95238 (= tp!78215 b_and!35217)))

(declare-fun b!1076498 () Bool)

(declare-fun e!615353 () Bool)

(declare-datatypes ((V!39867 0))(
  ( (V!39868 (val!13075 Int)) )
))
(declare-datatypes ((tuple2!16660 0))(
  ( (tuple2!16661 (_1!8341 (_ BitVec 64)) (_2!8341 V!39867)) )
))
(declare-datatypes ((List!23194 0))(
  ( (Nil!23191) (Cons!23190 (h!24399 tuple2!16660) (t!32553 List!23194)) )
))
(declare-datatypes ((ListLongMap!14629 0))(
  ( (ListLongMap!14630 (toList!7330 List!23194)) )
))
(declare-fun lt!478217 () ListLongMap!14629)

(declare-fun lt!478210 () ListLongMap!14629)

(declare-fun -!718 (ListLongMap!14629 (_ BitVec 64)) ListLongMap!14629)

(assert (=> b!1076498 (= e!615353 (= (-!718 lt!478217 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478210))))

(declare-fun lt!478219 () ListLongMap!14629)

(declare-fun lt!478212 () ListLongMap!14629)

(assert (=> b!1076498 (= lt!478219 lt!478212)))

(declare-fun lt!478220 () ListLongMap!14629)

(declare-fun zeroValueBefore!47 () V!39867)

(declare-datatypes ((Unit!35438 0))(
  ( (Unit!35439) )
))
(declare-fun lt!478215 () Unit!35438)

(declare-fun minValue!907 () V!39867)

(declare-fun addCommutativeForDiffKeys!752 (ListLongMap!14629 (_ BitVec 64) V!39867 (_ BitVec 64) V!39867) Unit!35438)

(assert (=> b!1076498 (= lt!478215 (addCommutativeForDiffKeys!752 lt!478220 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478218 () ListLongMap!14629)

(assert (=> b!1076498 (= (-!718 lt!478212 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478218)))

(declare-fun lt!478211 () tuple2!16660)

(declare-fun +!3235 (ListLongMap!14629 tuple2!16660) ListLongMap!14629)

(assert (=> b!1076498 (= lt!478212 (+!3235 lt!478218 lt!478211))))

(declare-fun lt!478209 () Unit!35438)

(declare-fun addThenRemoveForNewKeyIsSame!83 (ListLongMap!14629 (_ BitVec 64) V!39867) Unit!35438)

(assert (=> b!1076498 (= lt!478209 (addThenRemoveForNewKeyIsSame!83 lt!478218 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478214 () tuple2!16660)

(assert (=> b!1076498 (= lt!478218 (+!3235 lt!478220 lt!478214))))

(declare-fun e!615356 () Bool)

(assert (=> b!1076498 e!615356))

(declare-fun res!717481 () Bool)

(assert (=> b!1076498 (=> (not res!717481) (not e!615356))))

(assert (=> b!1076498 (= res!717481 (= lt!478217 lt!478219))))

(assert (=> b!1076498 (= lt!478219 (+!3235 (+!3235 lt!478220 lt!478211) lt!478214))))

(assert (=> b!1076498 (= lt!478214 (tuple2!16661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076498 (= lt!478211 (tuple2!16661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12321 0))(
  ( (ValueCellFull!12321 (v!15703 V!39867)) (EmptyCell!12321) )
))
(declare-datatypes ((array!69069 0))(
  ( (array!69070 (arr!33217 (Array (_ BitVec 32) ValueCell!12321)) (size!33753 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69069)

(declare-datatypes ((array!69071 0))(
  ( (array!69072 (arr!33218 (Array (_ BitVec 32) (_ BitVec 64))) (size!33754 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69071)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39867)

(declare-fun getCurrentListMap!4198 (array!69071 array!69069 (_ BitVec 32) (_ BitVec 32) V!39867 V!39867 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1076498 (= lt!478210 (getCurrentListMap!4198 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076498 (= lt!478217 (getCurrentListMap!4198 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076499 () Bool)

(declare-fun e!615354 () Bool)

(declare-fun e!615351 () Bool)

(declare-fun mapRes!40819 () Bool)

(assert (=> b!1076499 (= e!615354 (and e!615351 mapRes!40819))))

(declare-fun condMapEmpty!40819 () Bool)

(declare-fun mapDefault!40819 () ValueCell!12321)

(assert (=> b!1076499 (= condMapEmpty!40819 (= (arr!33217 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12321)) mapDefault!40819)))))

(declare-fun res!717482 () Bool)

(declare-fun e!615357 () Bool)

(assert (=> start!95238 (=> (not res!717482) (not e!615357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95238 (= res!717482 (validMask!0 mask!1515))))

(assert (=> start!95238 e!615357))

(assert (=> start!95238 true))

(declare-fun tp_is_empty!26049 () Bool)

(assert (=> start!95238 tp_is_empty!26049))

(declare-fun array_inv!25664 (array!69069) Bool)

(assert (=> start!95238 (and (array_inv!25664 _values!955) e!615354)))

(assert (=> start!95238 tp!78215))

(declare-fun array_inv!25665 (array!69071) Bool)

(assert (=> start!95238 (array_inv!25665 _keys!1163)))

(declare-fun mapNonEmpty!40819 () Bool)

(declare-fun tp!78214 () Bool)

(declare-fun e!615352 () Bool)

(assert (=> mapNonEmpty!40819 (= mapRes!40819 (and tp!78214 e!615352))))

(declare-fun mapKey!40819 () (_ BitVec 32))

(declare-fun mapRest!40819 () (Array (_ BitVec 32) ValueCell!12321))

(declare-fun mapValue!40819 () ValueCell!12321)

(assert (=> mapNonEmpty!40819 (= (arr!33217 _values!955) (store mapRest!40819 mapKey!40819 mapValue!40819))))

(declare-fun mapIsEmpty!40819 () Bool)

(assert (=> mapIsEmpty!40819 mapRes!40819))

(declare-fun b!1076500 () Bool)

(assert (=> b!1076500 (= e!615352 tp_is_empty!26049)))

(declare-fun b!1076501 () Bool)

(assert (=> b!1076501 (= e!615357 (not e!615353))))

(declare-fun res!717479 () Bool)

(assert (=> b!1076501 (=> res!717479 e!615353)))

(assert (=> b!1076501 (= res!717479 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478216 () ListLongMap!14629)

(assert (=> b!1076501 (= lt!478220 lt!478216)))

(declare-fun lt!478213 () Unit!35438)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!907 (array!69071 array!69069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39867 V!39867 V!39867 V!39867 (_ BitVec 32) Int) Unit!35438)

(assert (=> b!1076501 (= lt!478213 (lemmaNoChangeToArrayThenSameMapNoExtras!907 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3891 (array!69071 array!69069 (_ BitVec 32) (_ BitVec 32) V!39867 V!39867 (_ BitVec 32) Int) ListLongMap!14629)

(assert (=> b!1076501 (= lt!478216 (getCurrentListMapNoExtraKeys!3891 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076501 (= lt!478220 (getCurrentListMapNoExtraKeys!3891 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076502 () Bool)

(assert (=> b!1076502 (= e!615356 (= lt!478210 (+!3235 lt!478216 lt!478214)))))

(declare-fun b!1076503 () Bool)

(declare-fun res!717480 () Bool)

(assert (=> b!1076503 (=> (not res!717480) (not e!615357))))

(declare-datatypes ((List!23195 0))(
  ( (Nil!23192) (Cons!23191 (h!24400 (_ BitVec 64)) (t!32554 List!23195)) )
))
(declare-fun arrayNoDuplicates!0 (array!69071 (_ BitVec 32) List!23195) Bool)

(assert (=> b!1076503 (= res!717480 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23192))))

(declare-fun b!1076504 () Bool)

(declare-fun res!717483 () Bool)

(assert (=> b!1076504 (=> (not res!717483) (not e!615357))))

(assert (=> b!1076504 (= res!717483 (and (= (size!33753 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33754 _keys!1163) (size!33753 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076505 () Bool)

(assert (=> b!1076505 (= e!615351 tp_is_empty!26049)))

(declare-fun b!1076506 () Bool)

(declare-fun res!717478 () Bool)

(assert (=> b!1076506 (=> (not res!717478) (not e!615357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69071 (_ BitVec 32)) Bool)

(assert (=> b!1076506 (= res!717478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95238 res!717482) b!1076504))

(assert (= (and b!1076504 res!717483) b!1076506))

(assert (= (and b!1076506 res!717478) b!1076503))

(assert (= (and b!1076503 res!717480) b!1076501))

(assert (= (and b!1076501 (not res!717479)) b!1076498))

(assert (= (and b!1076498 res!717481) b!1076502))

(assert (= (and b!1076499 condMapEmpty!40819) mapIsEmpty!40819))

(assert (= (and b!1076499 (not condMapEmpty!40819)) mapNonEmpty!40819))

(get-info :version)

(assert (= (and mapNonEmpty!40819 ((_ is ValueCellFull!12321) mapValue!40819)) b!1076500))

(assert (= (and b!1076499 ((_ is ValueCellFull!12321) mapDefault!40819)) b!1076505))

(assert (= start!95238 b!1076499))

(declare-fun m!995423 () Bool)

(assert (=> b!1076501 m!995423))

(declare-fun m!995425 () Bool)

(assert (=> b!1076501 m!995425))

(declare-fun m!995427 () Bool)

(assert (=> b!1076501 m!995427))

(declare-fun m!995429 () Bool)

(assert (=> b!1076502 m!995429))

(declare-fun m!995431 () Bool)

(assert (=> b!1076503 m!995431))

(declare-fun m!995433 () Bool)

(assert (=> b!1076498 m!995433))

(declare-fun m!995435 () Bool)

(assert (=> b!1076498 m!995435))

(declare-fun m!995437 () Bool)

(assert (=> b!1076498 m!995437))

(declare-fun m!995439 () Bool)

(assert (=> b!1076498 m!995439))

(declare-fun m!995441 () Bool)

(assert (=> b!1076498 m!995441))

(declare-fun m!995443 () Bool)

(assert (=> b!1076498 m!995443))

(assert (=> b!1076498 m!995437))

(declare-fun m!995445 () Bool)

(assert (=> b!1076498 m!995445))

(declare-fun m!995447 () Bool)

(assert (=> b!1076498 m!995447))

(declare-fun m!995449 () Bool)

(assert (=> b!1076498 m!995449))

(declare-fun m!995451 () Bool)

(assert (=> b!1076498 m!995451))

(declare-fun m!995453 () Bool)

(assert (=> mapNonEmpty!40819 m!995453))

(declare-fun m!995455 () Bool)

(assert (=> start!95238 m!995455))

(declare-fun m!995457 () Bool)

(assert (=> start!95238 m!995457))

(declare-fun m!995459 () Bool)

(assert (=> start!95238 m!995459))

(declare-fun m!995461 () Bool)

(assert (=> b!1076506 m!995461))

(check-sat (not b!1076501) (not start!95238) (not b!1076502) (not b!1076498) (not b!1076503) (not b_next!22239) tp_is_empty!26049 (not mapNonEmpty!40819) b_and!35217 (not b!1076506))
(check-sat b_and!35217 (not b_next!22239))
