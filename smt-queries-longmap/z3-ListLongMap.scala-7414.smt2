; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94292 () Bool)

(assert start!94292)

(declare-fun b_free!21661 () Bool)

(declare-fun b_next!21661 () Bool)

(assert (=> start!94292 (= b_free!21661 (not b_next!21661))))

(declare-fun tp!76423 () Bool)

(declare-fun b_and!34407 () Bool)

(assert (=> start!94292 (= tp!76423 b_and!34407)))

(declare-fun b!1066216 () Bool)

(declare-fun e!607971 () Bool)

(assert (=> b!1066216 (= e!607971 true)))

(declare-datatypes ((V!39097 0))(
  ( (V!39098 (val!12786 Int)) )
))
(declare-datatypes ((tuple2!16270 0))(
  ( (tuple2!16271 (_1!8146 (_ BitVec 64)) (_2!8146 V!39097)) )
))
(declare-datatypes ((List!22815 0))(
  ( (Nil!22812) (Cons!22811 (h!24020 tuple2!16270) (t!32127 List!22815)) )
))
(declare-datatypes ((ListLongMap!14239 0))(
  ( (ListLongMap!14240 (toList!7135 List!22815)) )
))
(declare-fun lt!470539 () ListLongMap!14239)

(declare-fun lt!470537 () ListLongMap!14239)

(declare-fun -!607 (ListLongMap!14239 (_ BitVec 64)) ListLongMap!14239)

(assert (=> b!1066216 (= lt!470539 (-!607 lt!470537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470535 () ListLongMap!14239)

(declare-fun lt!470536 () ListLongMap!14239)

(assert (=> b!1066216 (= (-!607 lt!470535 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470536)))

(declare-datatypes ((Unit!34858 0))(
  ( (Unit!34859) )
))
(declare-fun lt!470532 () Unit!34858)

(declare-fun zeroValueBefore!47 () V!39097)

(declare-fun addThenRemoveForNewKeyIsSame!25 (ListLongMap!14239 (_ BitVec 64) V!39097) Unit!34858)

(assert (=> b!1066216 (= lt!470532 (addThenRemoveForNewKeyIsSame!25 lt!470536 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470533 () ListLongMap!14239)

(declare-fun lt!470538 () ListLongMap!14239)

(assert (=> b!1066216 (and (= lt!470537 lt!470535) (= lt!470533 lt!470538))))

(declare-fun +!3173 (ListLongMap!14239 tuple2!16270) ListLongMap!14239)

(assert (=> b!1066216 (= lt!470535 (+!3173 lt!470536 (tuple2!16271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12032 0))(
  ( (ValueCellFull!12032 (v!15398 V!39097)) (EmptyCell!12032) )
))
(declare-datatypes ((array!67868 0))(
  ( (array!67869 (arr!32636 (Array (_ BitVec 32) ValueCell!12032)) (size!33174 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67868)

(declare-fun minValue!907 () V!39097)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39097)

(declare-datatypes ((array!67870 0))(
  ( (array!67871 (arr!32637 (Array (_ BitVec 32) (_ BitVec 64))) (size!33175 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67870)

(declare-fun getCurrentListMap!4005 (array!67870 array!67868 (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 (_ BitVec 32) Int) ListLongMap!14239)

(assert (=> b!1066216 (= lt!470533 (getCurrentListMap!4005 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066216 (= lt!470537 (getCurrentListMap!4005 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066217 () Bool)

(declare-fun e!607975 () Bool)

(declare-fun e!607974 () Bool)

(declare-fun mapRes!39895 () Bool)

(assert (=> b!1066217 (= e!607975 (and e!607974 mapRes!39895))))

(declare-fun condMapEmpty!39895 () Bool)

(declare-fun mapDefault!39895 () ValueCell!12032)

(assert (=> b!1066217 (= condMapEmpty!39895 (= (arr!32636 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12032)) mapDefault!39895)))))

(declare-fun b!1066218 () Bool)

(declare-fun res!711666 () Bool)

(declare-fun e!607970 () Bool)

(assert (=> b!1066218 (=> (not res!711666) (not e!607970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67870 (_ BitVec 32)) Bool)

(assert (=> b!1066218 (= res!711666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!711664 () Bool)

(assert (=> start!94292 (=> (not res!711664) (not e!607970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94292 (= res!711664 (validMask!0 mask!1515))))

(assert (=> start!94292 e!607970))

(assert (=> start!94292 true))

(declare-fun tp_is_empty!25471 () Bool)

(assert (=> start!94292 tp_is_empty!25471))

(declare-fun array_inv!25264 (array!67868) Bool)

(assert (=> start!94292 (and (array_inv!25264 _values!955) e!607975)))

(assert (=> start!94292 tp!76423))

(declare-fun array_inv!25265 (array!67870) Bool)

(assert (=> start!94292 (array_inv!25265 _keys!1163)))

(declare-fun mapNonEmpty!39895 () Bool)

(declare-fun tp!76424 () Bool)

(declare-fun e!607972 () Bool)

(assert (=> mapNonEmpty!39895 (= mapRes!39895 (and tp!76424 e!607972))))

(declare-fun mapKey!39895 () (_ BitVec 32))

(declare-fun mapValue!39895 () ValueCell!12032)

(declare-fun mapRest!39895 () (Array (_ BitVec 32) ValueCell!12032))

(assert (=> mapNonEmpty!39895 (= (arr!32636 _values!955) (store mapRest!39895 mapKey!39895 mapValue!39895))))

(declare-fun mapIsEmpty!39895 () Bool)

(assert (=> mapIsEmpty!39895 mapRes!39895))

(declare-fun b!1066219 () Bool)

(assert (=> b!1066219 (= e!607974 tp_is_empty!25471)))

(declare-fun b!1066220 () Bool)

(declare-fun res!711665 () Bool)

(assert (=> b!1066220 (=> (not res!711665) (not e!607970))))

(declare-datatypes ((List!22816 0))(
  ( (Nil!22813) (Cons!22812 (h!24021 (_ BitVec 64)) (t!32128 List!22816)) )
))
(declare-fun arrayNoDuplicates!0 (array!67870 (_ BitVec 32) List!22816) Bool)

(assert (=> b!1066220 (= res!711665 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22813))))

(declare-fun b!1066221 () Bool)

(assert (=> b!1066221 (= e!607970 (not e!607971))))

(declare-fun res!711667 () Bool)

(assert (=> b!1066221 (=> res!711667 e!607971)))

(assert (=> b!1066221 (= res!711667 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066221 (= lt!470536 lt!470538)))

(declare-fun lt!470534 () Unit!34858)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!728 (array!67870 array!67868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 V!39097 V!39097 (_ BitVec 32) Int) Unit!34858)

(assert (=> b!1066221 (= lt!470534 (lemmaNoChangeToArrayThenSameMapNoExtras!728 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3734 (array!67870 array!67868 (_ BitVec 32) (_ BitVec 32) V!39097 V!39097 (_ BitVec 32) Int) ListLongMap!14239)

(assert (=> b!1066221 (= lt!470538 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066221 (= lt!470536 (getCurrentListMapNoExtraKeys!3734 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066222 () Bool)

(assert (=> b!1066222 (= e!607972 tp_is_empty!25471)))

(declare-fun b!1066223 () Bool)

(declare-fun res!711663 () Bool)

(assert (=> b!1066223 (=> (not res!711663) (not e!607970))))

(assert (=> b!1066223 (= res!711663 (and (= (size!33174 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33175 _keys!1163) (size!33174 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94292 res!711664) b!1066223))

(assert (= (and b!1066223 res!711663) b!1066218))

(assert (= (and b!1066218 res!711666) b!1066220))

(assert (= (and b!1066220 res!711665) b!1066221))

(assert (= (and b!1066221 (not res!711667)) b!1066216))

(assert (= (and b!1066217 condMapEmpty!39895) mapIsEmpty!39895))

(assert (= (and b!1066217 (not condMapEmpty!39895)) mapNonEmpty!39895))

(get-info :version)

(assert (= (and mapNonEmpty!39895 ((_ is ValueCellFull!12032) mapValue!39895)) b!1066222))

(assert (= (and b!1066217 ((_ is ValueCellFull!12032) mapDefault!39895)) b!1066219))

(assert (= start!94292 b!1066217))

(declare-fun m!984387 () Bool)

(assert (=> b!1066218 m!984387))

(declare-fun m!984389 () Bool)

(assert (=> b!1066216 m!984389))

(declare-fun m!984391 () Bool)

(assert (=> b!1066216 m!984391))

(declare-fun m!984393 () Bool)

(assert (=> b!1066216 m!984393))

(declare-fun m!984395 () Bool)

(assert (=> b!1066216 m!984395))

(declare-fun m!984397 () Bool)

(assert (=> b!1066216 m!984397))

(declare-fun m!984399 () Bool)

(assert (=> b!1066216 m!984399))

(declare-fun m!984401 () Bool)

(assert (=> b!1066220 m!984401))

(declare-fun m!984403 () Bool)

(assert (=> mapNonEmpty!39895 m!984403))

(declare-fun m!984405 () Bool)

(assert (=> start!94292 m!984405))

(declare-fun m!984407 () Bool)

(assert (=> start!94292 m!984407))

(declare-fun m!984409 () Bool)

(assert (=> start!94292 m!984409))

(declare-fun m!984411 () Bool)

(assert (=> b!1066221 m!984411))

(declare-fun m!984413 () Bool)

(assert (=> b!1066221 m!984413))

(declare-fun m!984415 () Bool)

(assert (=> b!1066221 m!984415))

(check-sat b_and!34407 (not b!1066218) (not b!1066221) (not mapNonEmpty!39895) (not start!94292) (not b!1066216) (not b!1066220) tp_is_empty!25471 (not b_next!21661))
(check-sat b_and!34407 (not b_next!21661))
