; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94468 () Bool)

(assert start!94468)

(declare-fun b_free!21795 () Bool)

(declare-fun b_next!21795 () Bool)

(assert (=> start!94468 (= b_free!21795 (not b_next!21795))))

(declare-fun tp!76832 () Bool)

(declare-fun b_and!34587 () Bool)

(assert (=> start!94468 (= tp!76832 b_and!34587)))

(declare-fun b!1068233 () Bool)

(declare-fun e!609436 () Bool)

(declare-fun e!609432 () Bool)

(assert (=> b!1068233 (= e!609436 e!609432)))

(declare-fun res!712838 () Bool)

(assert (=> b!1068233 (=> res!712838 e!609432)))

(declare-datatypes ((V!39275 0))(
  ( (V!39276 (val!12853 Int)) )
))
(declare-datatypes ((tuple2!16324 0))(
  ( (tuple2!16325 (_1!8173 (_ BitVec 64)) (_2!8173 V!39275)) )
))
(declare-datatypes ((List!22876 0))(
  ( (Nil!22873) (Cons!22872 (h!24081 tuple2!16324) (t!32201 List!22876)) )
))
(declare-datatypes ((ListLongMap!14293 0))(
  ( (ListLongMap!14294 (toList!7162 List!22876)) )
))
(declare-fun lt!471874 () ListLongMap!14293)

(declare-fun contains!6293 (ListLongMap!14293 (_ BitVec 64)) Bool)

(assert (=> b!1068233 (= res!712838 (contains!6293 lt!471874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39275)

(declare-datatypes ((ValueCell!12099 0))(
  ( (ValueCellFull!12099 (v!15467 V!39275)) (EmptyCell!12099) )
))
(declare-datatypes ((array!68191 0))(
  ( (array!68192 (arr!32795 (Array (_ BitVec 32) ValueCell!12099)) (size!33331 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68191)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39275)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68193 0))(
  ( (array!68194 (arr!32796 (Array (_ BitVec 32) (_ BitVec 64))) (size!33332 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68193)

(declare-fun getCurrentListMap!4090 (array!68193 array!68191 (_ BitVec 32) (_ BitVec 32) V!39275 V!39275 (_ BitVec 32) Int) ListLongMap!14293)

(assert (=> b!1068233 (= lt!471874 (getCurrentListMap!4090 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40102 () Bool)

(declare-fun mapRes!40102 () Bool)

(assert (=> mapIsEmpty!40102 mapRes!40102))

(declare-fun b!1068234 () Bool)

(declare-fun res!712841 () Bool)

(declare-fun e!609430 () Bool)

(assert (=> b!1068234 (=> (not res!712841) (not e!609430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68193 (_ BitVec 32)) Bool)

(assert (=> b!1068234 (= res!712841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068235 () Bool)

(declare-fun e!609433 () Bool)

(declare-fun tp_is_empty!25605 () Bool)

(assert (=> b!1068235 (= e!609433 tp_is_empty!25605)))

(declare-fun b!1068236 () Bool)

(assert (=> b!1068236 (= e!609430 (not e!609436))))

(declare-fun res!712837 () Bool)

(assert (=> b!1068236 (=> res!712837 e!609436)))

(assert (=> b!1068236 (= res!712837 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471876 () ListLongMap!14293)

(declare-fun lt!471873 () ListLongMap!14293)

(assert (=> b!1068236 (= lt!471876 lt!471873)))

(declare-datatypes ((Unit!35121 0))(
  ( (Unit!35122) )
))
(declare-fun lt!471877 () Unit!35121)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39275)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!779 (array!68193 array!68191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39275 V!39275 V!39275 V!39275 (_ BitVec 32) Int) Unit!35121)

(assert (=> b!1068236 (= lt!471877 (lemmaNoChangeToArrayThenSameMapNoExtras!779 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3742 (array!68193 array!68191 (_ BitVec 32) (_ BitVec 32) V!39275 V!39275 (_ BitVec 32) Int) ListLongMap!14293)

(assert (=> b!1068236 (= lt!471873 (getCurrentListMapNoExtraKeys!3742 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068236 (= lt!471876 (getCurrentListMapNoExtraKeys!3742 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068237 () Bool)

(declare-fun res!712839 () Bool)

(assert (=> b!1068237 (=> (not res!712839) (not e!609430))))

(declare-datatypes ((List!22877 0))(
  ( (Nil!22874) (Cons!22873 (h!24082 (_ BitVec 64)) (t!32202 List!22877)) )
))
(declare-fun arrayNoDuplicates!0 (array!68193 (_ BitVec 32) List!22877) Bool)

(assert (=> b!1068237 (= res!712839 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22874))))

(declare-fun b!1068238 () Bool)

(declare-fun res!712842 () Bool)

(assert (=> b!1068238 (=> (not res!712842) (not e!609430))))

(assert (=> b!1068238 (= res!712842 (and (= (size!33331 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33332 _keys!1163) (size!33331 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40102 () Bool)

(declare-fun tp!76831 () Bool)

(declare-fun e!609434 () Bool)

(assert (=> mapNonEmpty!40102 (= mapRes!40102 (and tp!76831 e!609434))))

(declare-fun mapKey!40102 () (_ BitVec 32))

(declare-fun mapRest!40102 () (Array (_ BitVec 32) ValueCell!12099))

(declare-fun mapValue!40102 () ValueCell!12099)

(assert (=> mapNonEmpty!40102 (= (arr!32795 _values!955) (store mapRest!40102 mapKey!40102 mapValue!40102))))

(declare-fun b!1068240 () Bool)

(declare-fun e!609435 () Bool)

(assert (=> b!1068240 (= e!609435 (and e!609433 mapRes!40102))))

(declare-fun condMapEmpty!40102 () Bool)

(declare-fun mapDefault!40102 () ValueCell!12099)

(assert (=> b!1068240 (= condMapEmpty!40102 (= (arr!32795 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12099)) mapDefault!40102)))))

(declare-fun b!1068241 () Bool)

(assert (=> b!1068241 (= e!609432 true)))

(declare-fun -!645 (ListLongMap!14293 (_ BitVec 64)) ListLongMap!14293)

(assert (=> b!1068241 (= (-!645 lt!471874 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471874)))

(declare-fun lt!471875 () Unit!35121)

(declare-fun removeNotPresentStillSame!55 (ListLongMap!14293 (_ BitVec 64)) Unit!35121)

(assert (=> b!1068241 (= lt!471875 (removeNotPresentStillSame!55 lt!471874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!712840 () Bool)

(assert (=> start!94468 (=> (not res!712840) (not e!609430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94468 (= res!712840 (validMask!0 mask!1515))))

(assert (=> start!94468 e!609430))

(assert (=> start!94468 true))

(assert (=> start!94468 tp_is_empty!25605))

(declare-fun array_inv!25388 (array!68191) Bool)

(assert (=> start!94468 (and (array_inv!25388 _values!955) e!609435)))

(assert (=> start!94468 tp!76832))

(declare-fun array_inv!25389 (array!68193) Bool)

(assert (=> start!94468 (array_inv!25389 _keys!1163)))

(declare-fun b!1068239 () Bool)

(assert (=> b!1068239 (= e!609434 tp_is_empty!25605)))

(assert (= (and start!94468 res!712840) b!1068238))

(assert (= (and b!1068238 res!712842) b!1068234))

(assert (= (and b!1068234 res!712841) b!1068237))

(assert (= (and b!1068237 res!712839) b!1068236))

(assert (= (and b!1068236 (not res!712837)) b!1068233))

(assert (= (and b!1068233 (not res!712838)) b!1068241))

(assert (= (and b!1068240 condMapEmpty!40102) mapIsEmpty!40102))

(assert (= (and b!1068240 (not condMapEmpty!40102)) mapNonEmpty!40102))

(get-info :version)

(assert (= (and mapNonEmpty!40102 ((_ is ValueCellFull!12099) mapValue!40102)) b!1068239))

(assert (= (and b!1068240 ((_ is ValueCellFull!12099) mapDefault!40102)) b!1068235))

(assert (= start!94468 b!1068240))

(declare-fun m!986837 () Bool)

(assert (=> b!1068236 m!986837))

(declare-fun m!986839 () Bool)

(assert (=> b!1068236 m!986839))

(declare-fun m!986841 () Bool)

(assert (=> b!1068236 m!986841))

(declare-fun m!986843 () Bool)

(assert (=> b!1068241 m!986843))

(declare-fun m!986845 () Bool)

(assert (=> b!1068241 m!986845))

(declare-fun m!986847 () Bool)

(assert (=> b!1068233 m!986847))

(declare-fun m!986849 () Bool)

(assert (=> b!1068233 m!986849))

(declare-fun m!986851 () Bool)

(assert (=> mapNonEmpty!40102 m!986851))

(declare-fun m!986853 () Bool)

(assert (=> b!1068237 m!986853))

(declare-fun m!986855 () Bool)

(assert (=> b!1068234 m!986855))

(declare-fun m!986857 () Bool)

(assert (=> start!94468 m!986857))

(declare-fun m!986859 () Bool)

(assert (=> start!94468 m!986859))

(declare-fun m!986861 () Bool)

(assert (=> start!94468 m!986861))

(check-sat tp_is_empty!25605 (not b!1068241) (not b_next!21795) (not start!94468) (not mapNonEmpty!40102) (not b!1068236) (not b!1068233) (not b!1068234) b_and!34587 (not b!1068237))
(check-sat b_and!34587 (not b_next!21795))
