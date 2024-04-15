; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95230 () Bool)

(assert start!95230)

(declare-fun b_free!22237 () Bool)

(declare-fun b_next!22237 () Bool)

(assert (=> start!95230 (= b_free!22237 (not b_next!22237))))

(declare-fun tp!78209 () Bool)

(declare-fun b_and!35189 () Bool)

(assert (=> start!95230 (= tp!78209 b_and!35189)))

(declare-fun b!1076318 () Bool)

(declare-fun e!615243 () Bool)

(declare-fun tp_is_empty!26047 () Bool)

(assert (=> b!1076318 (= e!615243 tp_is_empty!26047)))

(declare-fun b!1076319 () Bool)

(declare-fun res!717396 () Bool)

(declare-fun e!615242 () Bool)

(assert (=> b!1076319 (=> (not res!717396) (not e!615242))))

(declare-datatypes ((array!69002 0))(
  ( (array!69003 (arr!33184 (Array (_ BitVec 32) (_ BitVec 64))) (size!33722 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69002)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69002 (_ BitVec 32)) Bool)

(assert (=> b!1076319 (= res!717396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076320 () Bool)

(declare-fun res!717393 () Bool)

(assert (=> b!1076320 (=> (not res!717393) (not e!615242))))

(declare-datatypes ((V!39865 0))(
  ( (V!39866 (val!13074 Int)) )
))
(declare-datatypes ((ValueCell!12320 0))(
  ( (ValueCellFull!12320 (v!15701 V!39865)) (EmptyCell!12320) )
))
(declare-datatypes ((array!69004 0))(
  ( (array!69005 (arr!33185 (Array (_ BitVec 32) ValueCell!12320)) (size!33723 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69004)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076320 (= res!717393 (and (= (size!33723 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33722 _keys!1163) (size!33723 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40816 () Bool)

(declare-fun mapRes!40816 () Bool)

(assert (=> mapIsEmpty!40816 mapRes!40816))

(declare-fun b!1076322 () Bool)

(declare-fun e!615241 () Bool)

(assert (=> b!1076322 (= e!615242 (not e!615241))))

(declare-fun res!717395 () Bool)

(assert (=> b!1076322 (=> res!717395 e!615241)))

(assert (=> b!1076322 (= res!717395 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16728 0))(
  ( (tuple2!16729 (_1!8375 (_ BitVec 64)) (_2!8375 V!39865)) )
))
(declare-datatypes ((List!23244 0))(
  ( (Nil!23241) (Cons!23240 (h!24449 tuple2!16728) (t!32594 List!23244)) )
))
(declare-datatypes ((ListLongMap!14697 0))(
  ( (ListLongMap!14698 (toList!7364 List!23244)) )
))
(declare-fun lt!477981 () ListLongMap!14697)

(declare-fun lt!477982 () ListLongMap!14697)

(assert (=> b!1076322 (= lt!477981 lt!477982)))

(declare-fun zeroValueBefore!47 () V!39865)

(declare-datatypes ((Unit!35281 0))(
  ( (Unit!35282) )
))
(declare-fun lt!477978 () Unit!35281)

(declare-fun minValue!907 () V!39865)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39865)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!912 (array!69002 array!69004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 V!39865 V!39865 (_ BitVec 32) Int) Unit!35281)

(assert (=> b!1076322 (= lt!477978 (lemmaNoChangeToArrayThenSameMapNoExtras!912 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3940 (array!69002 array!69004 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14697)

(assert (=> b!1076322 (= lt!477982 (getCurrentListMapNoExtraKeys!3940 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076322 (= lt!477981 (getCurrentListMapNoExtraKeys!3940 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40816 () Bool)

(declare-fun tp!78208 () Bool)

(declare-fun e!615238 () Bool)

(assert (=> mapNonEmpty!40816 (= mapRes!40816 (and tp!78208 e!615238))))

(declare-fun mapKey!40816 () (_ BitVec 32))

(declare-fun mapValue!40816 () ValueCell!12320)

(declare-fun mapRest!40816 () (Array (_ BitVec 32) ValueCell!12320))

(assert (=> mapNonEmpty!40816 (= (arr!33185 _values!955) (store mapRest!40816 mapKey!40816 mapValue!40816))))

(declare-fun b!1076323 () Bool)

(declare-fun e!615240 () Bool)

(assert (=> b!1076323 (= e!615240 (and e!615243 mapRes!40816))))

(declare-fun condMapEmpty!40816 () Bool)

(declare-fun mapDefault!40816 () ValueCell!12320)

(assert (=> b!1076323 (= condMapEmpty!40816 (= (arr!33185 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12320)) mapDefault!40816)))))

(declare-fun b!1076324 () Bool)

(declare-fun res!717391 () Bool)

(assert (=> b!1076324 (=> (not res!717391) (not e!615242))))

(declare-datatypes ((List!23245 0))(
  ( (Nil!23242) (Cons!23241 (h!24450 (_ BitVec 64)) (t!32595 List!23245)) )
))
(declare-fun arrayNoDuplicates!0 (array!69002 (_ BitVec 32) List!23245) Bool)

(assert (=> b!1076324 (= res!717391 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23242))))

(declare-fun b!1076325 () Bool)

(assert (=> b!1076325 (= e!615238 tp_is_empty!26047)))

(declare-fun b!1076326 () Bool)

(declare-fun e!615239 () Bool)

(declare-fun lt!477979 () ListLongMap!14697)

(declare-fun lt!477973 () tuple2!16728)

(declare-fun +!3263 (ListLongMap!14697 tuple2!16728) ListLongMap!14697)

(assert (=> b!1076326 (= e!615239 (= lt!477979 (+!3263 lt!477982 lt!477973)))))

(declare-fun res!717392 () Bool)

(assert (=> start!95230 (=> (not res!717392) (not e!615242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95230 (= res!717392 (validMask!0 mask!1515))))

(assert (=> start!95230 e!615242))

(assert (=> start!95230 true))

(assert (=> start!95230 tp_is_empty!26047))

(declare-fun array_inv!25668 (array!69004) Bool)

(assert (=> start!95230 (and (array_inv!25668 _values!955) e!615240)))

(assert (=> start!95230 tp!78209))

(declare-fun array_inv!25669 (array!69002) Bool)

(assert (=> start!95230 (array_inv!25669 _keys!1163)))

(declare-fun b!1076321 () Bool)

(declare-fun lt!477975 () ListLongMap!14697)

(declare-fun -!700 (ListLongMap!14697 (_ BitVec 64)) ListLongMap!14697)

(assert (=> b!1076321 (= e!615241 (= (-!700 lt!477975 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477979))))

(declare-fun lt!477984 () ListLongMap!14697)

(declare-fun lt!477983 () ListLongMap!14697)

(assert (=> b!1076321 (= lt!477984 lt!477983)))

(declare-fun lt!477977 () Unit!35281)

(declare-fun addCommutativeForDiffKeys!749 (ListLongMap!14697 (_ BitVec 64) V!39865 (_ BitVec 64) V!39865) Unit!35281)

(assert (=> b!1076321 (= lt!477977 (addCommutativeForDiffKeys!749 lt!477981 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!477980 () ListLongMap!14697)

(assert (=> b!1076321 (= (-!700 lt!477983 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477980)))

(declare-fun lt!477974 () tuple2!16728)

(assert (=> b!1076321 (= lt!477983 (+!3263 lt!477980 lt!477974))))

(declare-fun lt!477976 () Unit!35281)

(declare-fun addThenRemoveForNewKeyIsSame!78 (ListLongMap!14697 (_ BitVec 64) V!39865) Unit!35281)

(assert (=> b!1076321 (= lt!477976 (addThenRemoveForNewKeyIsSame!78 lt!477980 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1076321 (= lt!477980 (+!3263 lt!477981 lt!477973))))

(assert (=> b!1076321 e!615239))

(declare-fun res!717394 () Bool)

(assert (=> b!1076321 (=> (not res!717394) (not e!615239))))

(assert (=> b!1076321 (= res!717394 (= lt!477975 lt!477984))))

(assert (=> b!1076321 (= lt!477984 (+!3263 (+!3263 lt!477981 lt!477974) lt!477973))))

(assert (=> b!1076321 (= lt!477973 (tuple2!16729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076321 (= lt!477974 (tuple2!16729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4132 (array!69002 array!69004 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14697)

(assert (=> b!1076321 (= lt!477979 (getCurrentListMap!4132 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076321 (= lt!477975 (getCurrentListMap!4132 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95230 res!717392) b!1076320))

(assert (= (and b!1076320 res!717393) b!1076319))

(assert (= (and b!1076319 res!717396) b!1076324))

(assert (= (and b!1076324 res!717391) b!1076322))

(assert (= (and b!1076322 (not res!717395)) b!1076321))

(assert (= (and b!1076321 res!717394) b!1076326))

(assert (= (and b!1076323 condMapEmpty!40816) mapIsEmpty!40816))

(assert (= (and b!1076323 (not condMapEmpty!40816)) mapNonEmpty!40816))

(get-info :version)

(assert (= (and mapNonEmpty!40816 ((_ is ValueCellFull!12320) mapValue!40816)) b!1076325))

(assert (= (and b!1076323 ((_ is ValueCellFull!12320) mapDefault!40816)) b!1076318))

(assert (= start!95230 b!1076323))

(declare-fun m!994757 () Bool)

(assert (=> b!1076321 m!994757))

(declare-fun m!994759 () Bool)

(assert (=> b!1076321 m!994759))

(declare-fun m!994761 () Bool)

(assert (=> b!1076321 m!994761))

(declare-fun m!994763 () Bool)

(assert (=> b!1076321 m!994763))

(declare-fun m!994765 () Bool)

(assert (=> b!1076321 m!994765))

(declare-fun m!994767 () Bool)

(assert (=> b!1076321 m!994767))

(declare-fun m!994769 () Bool)

(assert (=> b!1076321 m!994769))

(assert (=> b!1076321 m!994759))

(declare-fun m!994771 () Bool)

(assert (=> b!1076321 m!994771))

(declare-fun m!994773 () Bool)

(assert (=> b!1076321 m!994773))

(declare-fun m!994775 () Bool)

(assert (=> b!1076321 m!994775))

(declare-fun m!994777 () Bool)

(assert (=> b!1076322 m!994777))

(declare-fun m!994779 () Bool)

(assert (=> b!1076322 m!994779))

(declare-fun m!994781 () Bool)

(assert (=> b!1076322 m!994781))

(declare-fun m!994783 () Bool)

(assert (=> b!1076324 m!994783))

(declare-fun m!994785 () Bool)

(assert (=> b!1076326 m!994785))

(declare-fun m!994787 () Bool)

(assert (=> mapNonEmpty!40816 m!994787))

(declare-fun m!994789 () Bool)

(assert (=> start!95230 m!994789))

(declare-fun m!994791 () Bool)

(assert (=> start!95230 m!994791))

(declare-fun m!994793 () Bool)

(assert (=> start!95230 m!994793))

(declare-fun m!994795 () Bool)

(assert (=> b!1076319 m!994795))

(check-sat (not b!1076324) (not b_next!22237) b_and!35189 (not b!1076321) (not mapNonEmpty!40816) (not start!95230) (not b!1076322) tp_is_empty!26047 (not b!1076326) (not b!1076319))
(check-sat b_and!35189 (not b_next!22237))
