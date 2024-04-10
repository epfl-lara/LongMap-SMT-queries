; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94722 () Bool)

(assert start!94722)

(declare-fun b_free!21975 () Bool)

(declare-fun b_next!21975 () Bool)

(assert (=> start!94722 (= b_free!21975 (not b_next!21975))))

(declare-fun tp!77384 () Bool)

(declare-fun b_and!34805 () Bool)

(assert (=> start!94722 (= tp!77384 b_and!34805)))

(declare-fun b!1070967 () Bool)

(declare-fun res!714428 () Bool)

(declare-fun e!611430 () Bool)

(assert (=> b!1070967 (=> (not res!714428) (not e!611430))))

(declare-datatypes ((array!68547 0))(
  ( (array!68548 (arr!32969 (Array (_ BitVec 32) (_ BitVec 64))) (size!33505 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68547)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68547 (_ BitVec 32)) Bool)

(assert (=> b!1070967 (= res!714428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070968 () Bool)

(declare-fun e!611426 () Bool)

(declare-fun tp_is_empty!25785 () Bool)

(assert (=> b!1070968 (= e!611426 tp_is_empty!25785)))

(declare-fun b!1070969 () Bool)

(declare-datatypes ((V!39515 0))(
  ( (V!39516 (val!12943 Int)) )
))
(declare-datatypes ((tuple2!16466 0))(
  ( (tuple2!16467 (_1!8244 (_ BitVec 64)) (_2!8244 V!39515)) )
))
(declare-datatypes ((List!23007 0))(
  ( (Nil!23004) (Cons!23003 (h!24212 tuple2!16466) (t!32340 List!23007)) )
))
(declare-datatypes ((ListLongMap!14435 0))(
  ( (ListLongMap!14436 (toList!7233 List!23007)) )
))
(declare-fun lt!473415 () ListLongMap!14435)

(declare-fun lt!473414 () ListLongMap!14435)

(declare-fun e!611428 () Bool)

(declare-fun lt!473412 () tuple2!16466)

(declare-fun +!3168 (ListLongMap!14435 tuple2!16466) ListLongMap!14435)

(assert (=> b!1070969 (= e!611428 (= lt!473414 (+!3168 lt!473415 lt!473412)))))

(declare-fun b!1070970 () Bool)

(declare-fun e!611432 () Bool)

(declare-fun e!611427 () Bool)

(declare-fun mapRes!40384 () Bool)

(assert (=> b!1070970 (= e!611432 (and e!611427 mapRes!40384))))

(declare-fun condMapEmpty!40384 () Bool)

(declare-datatypes ((ValueCell!12189 0))(
  ( (ValueCellFull!12189 (v!15559 V!39515)) (EmptyCell!12189) )
))
(declare-datatypes ((array!68549 0))(
  ( (array!68550 (arr!32970 (Array (_ BitVec 32) ValueCell!12189)) (size!33506 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68549)

(declare-fun mapDefault!40384 () ValueCell!12189)

(assert (=> b!1070970 (= condMapEmpty!40384 (= (arr!32970 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12189)) mapDefault!40384)))))

(declare-fun mapNonEmpty!40384 () Bool)

(declare-fun tp!77383 () Bool)

(assert (=> mapNonEmpty!40384 (= mapRes!40384 (and tp!77383 e!611426))))

(declare-fun mapValue!40384 () ValueCell!12189)

(declare-fun mapRest!40384 () (Array (_ BitVec 32) ValueCell!12189))

(declare-fun mapKey!40384 () (_ BitVec 32))

(assert (=> mapNonEmpty!40384 (= (arr!32970 _values!955) (store mapRest!40384 mapKey!40384 mapValue!40384))))

(declare-fun res!714425 () Bool)

(assert (=> start!94722 (=> (not res!714425) (not e!611430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94722 (= res!714425 (validMask!0 mask!1515))))

(assert (=> start!94722 e!611430))

(assert (=> start!94722 true))

(assert (=> start!94722 tp_is_empty!25785))

(declare-fun array_inv!25498 (array!68549) Bool)

(assert (=> start!94722 (and (array_inv!25498 _values!955) e!611432)))

(assert (=> start!94722 tp!77384))

(declare-fun array_inv!25499 (array!68547) Bool)

(assert (=> start!94722 (array_inv!25499 _keys!1163)))

(declare-fun b!1070971 () Bool)

(declare-fun e!611431 () Bool)

(assert (=> b!1070971 (= e!611430 (not e!611431))))

(declare-fun res!714430 () Bool)

(assert (=> b!1070971 (=> res!714430 e!611431)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070971 (= res!714430 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473417 () ListLongMap!14435)

(assert (=> b!1070971 (= lt!473417 lt!473415)))

(declare-fun zeroValueBefore!47 () V!39515)

(declare-datatypes ((Unit!35262 0))(
  ( (Unit!35263) )
))
(declare-fun lt!473419 () Unit!35262)

(declare-fun minValue!907 () V!39515)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39515)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!844 (array!68547 array!68549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39515 V!39515 V!39515 V!39515 (_ BitVec 32) Int) Unit!35262)

(assert (=> b!1070971 (= lt!473419 (lemmaNoChangeToArrayThenSameMapNoExtras!844 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3807 (array!68547 array!68549 (_ BitVec 32) (_ BitVec 32) V!39515 V!39515 (_ BitVec 32) Int) ListLongMap!14435)

(assert (=> b!1070971 (= lt!473415 (getCurrentListMapNoExtraKeys!3807 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070971 (= lt!473417 (getCurrentListMapNoExtraKeys!3807 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070972 () Bool)

(assert (=> b!1070972 (= e!611427 tp_is_empty!25785)))

(declare-fun b!1070973 () Bool)

(declare-fun res!714426 () Bool)

(assert (=> b!1070973 (=> (not res!714426) (not e!611430))))

(assert (=> b!1070973 (= res!714426 (and (= (size!33506 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33505 _keys!1163) (size!33506 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40384 () Bool)

(assert (=> mapIsEmpty!40384 mapRes!40384))

(declare-fun b!1070974 () Bool)

(declare-fun res!714429 () Bool)

(assert (=> b!1070974 (=> (not res!714429) (not e!611430))))

(declare-datatypes ((List!23008 0))(
  ( (Nil!23005) (Cons!23004 (h!24213 (_ BitVec 64)) (t!32341 List!23008)) )
))
(declare-fun arrayNoDuplicates!0 (array!68547 (_ BitVec 32) List!23008) Bool)

(assert (=> b!1070974 (= res!714429 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23005))))

(declare-fun b!1070975 () Bool)

(assert (=> b!1070975 (= e!611431 true)))

(declare-fun lt!473413 () ListLongMap!14435)

(declare-fun lt!473418 () tuple2!16466)

(declare-fun -!669 (ListLongMap!14435 (_ BitVec 64)) ListLongMap!14435)

(assert (=> b!1070975 (= (-!669 (+!3168 lt!473413 lt!473418) #b0000000000000000000000000000000000000000000000000000000000000000) lt!473413)))

(declare-fun lt!473416 () Unit!35262)

(declare-fun addThenRemoveForNewKeyIsSame!39 (ListLongMap!14435 (_ BitVec 64) V!39515) Unit!35262)

(assert (=> b!1070975 (= lt!473416 (addThenRemoveForNewKeyIsSame!39 lt!473413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1070975 (= lt!473413 (+!3168 lt!473417 lt!473412))))

(assert (=> b!1070975 e!611428))

(declare-fun res!714427 () Bool)

(assert (=> b!1070975 (=> (not res!714427) (not e!611428))))

(declare-fun lt!473420 () ListLongMap!14435)

(assert (=> b!1070975 (= res!714427 (= lt!473420 (+!3168 (+!3168 lt!473417 lt!473418) lt!473412)))))

(assert (=> b!1070975 (= lt!473412 (tuple2!16467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070975 (= lt!473418 (tuple2!16467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4135 (array!68547 array!68549 (_ BitVec 32) (_ BitVec 32) V!39515 V!39515 (_ BitVec 32) Int) ListLongMap!14435)

(assert (=> b!1070975 (= lt!473414 (getCurrentListMap!4135 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070975 (= lt!473420 (getCurrentListMap!4135 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94722 res!714425) b!1070973))

(assert (= (and b!1070973 res!714426) b!1070967))

(assert (= (and b!1070967 res!714428) b!1070974))

(assert (= (and b!1070974 res!714429) b!1070971))

(assert (= (and b!1070971 (not res!714430)) b!1070975))

(assert (= (and b!1070975 res!714427) b!1070969))

(assert (= (and b!1070970 condMapEmpty!40384) mapIsEmpty!40384))

(assert (= (and b!1070970 (not condMapEmpty!40384)) mapNonEmpty!40384))

(get-info :version)

(assert (= (and mapNonEmpty!40384 ((_ is ValueCellFull!12189) mapValue!40384)) b!1070968))

(assert (= (and b!1070970 ((_ is ValueCellFull!12189) mapDefault!40384)) b!1070972))

(assert (= start!94722 b!1070970))

(declare-fun m!989257 () Bool)

(assert (=> b!1070974 m!989257))

(declare-fun m!989259 () Bool)

(assert (=> b!1070969 m!989259))

(declare-fun m!989261 () Bool)

(assert (=> b!1070971 m!989261))

(declare-fun m!989263 () Bool)

(assert (=> b!1070971 m!989263))

(declare-fun m!989265 () Bool)

(assert (=> b!1070971 m!989265))

(declare-fun m!989267 () Bool)

(assert (=> b!1070975 m!989267))

(declare-fun m!989269 () Bool)

(assert (=> b!1070975 m!989269))

(declare-fun m!989271 () Bool)

(assert (=> b!1070975 m!989271))

(declare-fun m!989273 () Bool)

(assert (=> b!1070975 m!989273))

(assert (=> b!1070975 m!989269))

(declare-fun m!989275 () Bool)

(assert (=> b!1070975 m!989275))

(declare-fun m!989277 () Bool)

(assert (=> b!1070975 m!989277))

(assert (=> b!1070975 m!989273))

(declare-fun m!989279 () Bool)

(assert (=> b!1070975 m!989279))

(declare-fun m!989281 () Bool)

(assert (=> b!1070975 m!989281))

(declare-fun m!989283 () Bool)

(assert (=> start!94722 m!989283))

(declare-fun m!989285 () Bool)

(assert (=> start!94722 m!989285))

(declare-fun m!989287 () Bool)

(assert (=> start!94722 m!989287))

(declare-fun m!989289 () Bool)

(assert (=> mapNonEmpty!40384 m!989289))

(declare-fun m!989291 () Bool)

(assert (=> b!1070967 m!989291))

(check-sat (not start!94722) tp_is_empty!25785 (not b!1070971) (not b!1070975) (not b!1070974) (not b!1070969) b_and!34805 (not b_next!21975) (not mapNonEmpty!40384) (not b!1070967))
(check-sat b_and!34805 (not b_next!21975))
