; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94772 () Bool)

(assert start!94772)

(declare-fun b_free!21841 () Bool)

(declare-fun b_next!21841 () Bool)

(assert (=> start!94772 (= b_free!21841 (not b_next!21841))))

(declare-fun tp!76973 () Bool)

(declare-fun b_and!34653 () Bool)

(assert (=> start!94772 (= tp!76973 b_and!34653)))

(declare-fun b!1070338 () Bool)

(declare-fun e!610869 () Bool)

(declare-fun tp_is_empty!25651 () Bool)

(assert (=> b!1070338 (= e!610869 tp_is_empty!25651)))

(declare-fun b!1070339 () Bool)

(declare-fun e!610874 () Bool)

(declare-fun e!610873 () Bool)

(assert (=> b!1070339 (= e!610874 e!610873)))

(declare-fun res!713835 () Bool)

(assert (=> b!1070339 (=> res!713835 e!610873)))

(declare-datatypes ((V!39337 0))(
  ( (V!39338 (val!12876 Int)) )
))
(declare-datatypes ((tuple2!16340 0))(
  ( (tuple2!16341 (_1!8181 (_ BitVec 64)) (_2!8181 V!39337)) )
))
(declare-datatypes ((List!22907 0))(
  ( (Nil!22904) (Cons!22903 (h!24121 tuple2!16340) (t!32226 List!22907)) )
))
(declare-datatypes ((ListLongMap!14317 0))(
  ( (ListLongMap!14318 (toList!7174 List!22907)) )
))
(declare-fun lt!472859 () ListLongMap!14317)

(declare-fun contains!6334 (ListLongMap!14317 (_ BitVec 64)) Bool)

(assert (=> b!1070339 (= res!713835 (contains!6334 lt!472859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39337)

(declare-datatypes ((ValueCell!12122 0))(
  ( (ValueCellFull!12122 (v!15487 V!39337)) (EmptyCell!12122) )
))
(declare-datatypes ((array!68325 0))(
  ( (array!68326 (arr!32855 (Array (_ BitVec 32) ValueCell!12122)) (size!33392 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68325)

(declare-fun defaultEntry!963 () Int)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!39337)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68327 0))(
  ( (array!68328 (arr!32856 (Array (_ BitVec 32) (_ BitVec 64))) (size!33393 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68327)

(declare-fun getCurrentListMap!4096 (array!68327 array!68325 (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 (_ BitVec 32) Int) ListLongMap!14317)

(assert (=> b!1070339 (= lt!472859 (getCurrentListMap!4096 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40174 () Bool)

(declare-fun mapRes!40174 () Bool)

(assert (=> mapIsEmpty!40174 mapRes!40174))

(declare-fun res!713837 () Bool)

(declare-fun e!610872 () Bool)

(assert (=> start!94772 (=> (not res!713837) (not e!610872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94772 (= res!713837 (validMask!0 mask!1515))))

(assert (=> start!94772 e!610872))

(assert (=> start!94772 true))

(assert (=> start!94772 tp_is_empty!25651))

(declare-fun e!610870 () Bool)

(declare-fun array_inv!25452 (array!68325) Bool)

(assert (=> start!94772 (and (array_inv!25452 _values!955) e!610870)))

(assert (=> start!94772 tp!76973))

(declare-fun array_inv!25453 (array!68327) Bool)

(assert (=> start!94772 (array_inv!25453 _keys!1163)))

(declare-fun b!1070340 () Bool)

(declare-fun e!610868 () Bool)

(assert (=> b!1070340 (= e!610870 (and e!610868 mapRes!40174))))

(declare-fun condMapEmpty!40174 () Bool)

(declare-fun mapDefault!40174 () ValueCell!12122)

(assert (=> b!1070340 (= condMapEmpty!40174 (= (arr!32855 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12122)) mapDefault!40174)))))

(declare-fun b!1070341 () Bool)

(declare-fun res!713838 () Bool)

(assert (=> b!1070341 (=> (not res!713838) (not e!610872))))

(declare-datatypes ((List!22908 0))(
  ( (Nil!22905) (Cons!22904 (h!24122 (_ BitVec 64)) (t!32227 List!22908)) )
))
(declare-fun arrayNoDuplicates!0 (array!68327 (_ BitVec 32) List!22908) Bool)

(assert (=> b!1070341 (= res!713838 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22905))))

(declare-fun b!1070342 () Bool)

(declare-fun res!713834 () Bool)

(assert (=> b!1070342 (=> (not res!713834) (not e!610872))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1070342 (= res!713834 (and (= (size!33392 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33393 _keys!1163) (size!33392 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070343 () Bool)

(assert (=> b!1070343 (= e!610868 tp_is_empty!25651)))

(declare-fun mapNonEmpty!40174 () Bool)

(declare-fun tp!76972 () Bool)

(assert (=> mapNonEmpty!40174 (= mapRes!40174 (and tp!76972 e!610869))))

(declare-fun mapRest!40174 () (Array (_ BitVec 32) ValueCell!12122))

(declare-fun mapKey!40174 () (_ BitVec 32))

(declare-fun mapValue!40174 () ValueCell!12122)

(assert (=> mapNonEmpty!40174 (= (arr!32855 _values!955) (store mapRest!40174 mapKey!40174 mapValue!40174))))

(declare-fun b!1070344 () Bool)

(assert (=> b!1070344 (= e!610872 (not e!610874))))

(declare-fun res!713839 () Bool)

(assert (=> b!1070344 (=> res!713839 e!610874)))

(assert (=> b!1070344 (= res!713839 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472857 () ListLongMap!14317)

(declare-fun lt!472858 () ListLongMap!14317)

(assert (=> b!1070344 (= lt!472857 lt!472858)))

(declare-datatypes ((Unit!35140 0))(
  ( (Unit!35141) )
))
(declare-fun lt!472861 () Unit!35140)

(declare-fun zeroValueAfter!47 () V!39337)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!789 (array!68327 array!68325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 V!39337 V!39337 (_ BitVec 32) Int) Unit!35140)

(assert (=> b!1070344 (= lt!472861 (lemmaNoChangeToArrayThenSameMapNoExtras!789 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3786 (array!68327 array!68325 (_ BitVec 32) (_ BitVec 32) V!39337 V!39337 (_ BitVec 32) Int) ListLongMap!14317)

(assert (=> b!1070344 (= lt!472858 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070344 (= lt!472857 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070345 () Bool)

(declare-fun res!713836 () Bool)

(assert (=> b!1070345 (=> (not res!713836) (not e!610872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68327 (_ BitVec 32)) Bool)

(assert (=> b!1070345 (= res!713836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070346 () Bool)

(assert (=> b!1070346 (= e!610873 true)))

(declare-fun -!656 (ListLongMap!14317 (_ BitVec 64)) ListLongMap!14317)

(assert (=> b!1070346 (= (-!656 lt!472859 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472859)))

(declare-fun lt!472860 () Unit!35140)

(declare-fun removeNotPresentStillSame!73 (ListLongMap!14317 (_ BitVec 64)) Unit!35140)

(assert (=> b!1070346 (= lt!472860 (removeNotPresentStillSame!73 lt!472859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94772 res!713837) b!1070342))

(assert (= (and b!1070342 res!713834) b!1070345))

(assert (= (and b!1070345 res!713836) b!1070341))

(assert (= (and b!1070341 res!713838) b!1070344))

(assert (= (and b!1070344 (not res!713839)) b!1070339))

(assert (= (and b!1070339 (not res!713835)) b!1070346))

(assert (= (and b!1070340 condMapEmpty!40174) mapIsEmpty!40174))

(assert (= (and b!1070340 (not condMapEmpty!40174)) mapNonEmpty!40174))

(get-info :version)

(assert (= (and mapNonEmpty!40174 ((_ is ValueCellFull!12122) mapValue!40174)) b!1070338))

(assert (= (and b!1070340 ((_ is ValueCellFull!12122) mapDefault!40174)) b!1070343))

(assert (= start!94772 b!1070340))

(declare-fun m!989233 () Bool)

(assert (=> start!94772 m!989233))

(declare-fun m!989235 () Bool)

(assert (=> start!94772 m!989235))

(declare-fun m!989237 () Bool)

(assert (=> start!94772 m!989237))

(declare-fun m!989239 () Bool)

(assert (=> b!1070345 m!989239))

(declare-fun m!989241 () Bool)

(assert (=> b!1070344 m!989241))

(declare-fun m!989243 () Bool)

(assert (=> b!1070344 m!989243))

(declare-fun m!989245 () Bool)

(assert (=> b!1070344 m!989245))

(declare-fun m!989247 () Bool)

(assert (=> b!1070341 m!989247))

(declare-fun m!989249 () Bool)

(assert (=> mapNonEmpty!40174 m!989249))

(declare-fun m!989251 () Bool)

(assert (=> b!1070339 m!989251))

(declare-fun m!989253 () Bool)

(assert (=> b!1070339 m!989253))

(declare-fun m!989255 () Bool)

(assert (=> b!1070346 m!989255))

(declare-fun m!989257 () Bool)

(assert (=> b!1070346 m!989257))

(check-sat b_and!34653 (not b!1070345) (not b_next!21841) (not start!94772) (not b!1070346) tp_is_empty!25651 (not b!1070344) (not b!1070341) (not mapNonEmpty!40174) (not b!1070339))
(check-sat b_and!34653 (not b_next!21841))
