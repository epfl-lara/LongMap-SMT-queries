; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94476 () Bool)

(assert start!94476)

(declare-fun b_free!21625 () Bool)

(declare-fun b_next!21625 () Bool)

(assert (=> start!94476 (= b_free!21625 (not b_next!21625))))

(declare-fun tp!76312 () Bool)

(declare-fun b_and!34395 () Bool)

(assert (=> start!94476 (= tp!76312 b_and!34395)))

(declare-fun b!1067080 () Bool)

(declare-fun e!608479 () Bool)

(declare-fun tp_is_empty!25435 () Bool)

(assert (=> b!1067080 (= e!608479 tp_is_empty!25435)))

(declare-fun b!1067081 () Bool)

(declare-fun e!608480 () Bool)

(declare-fun e!608478 () Bool)

(assert (=> b!1067081 (= e!608480 (not e!608478))))

(declare-fun res!711906 () Bool)

(assert (=> b!1067081 (=> res!711906 e!608478)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067081 (= res!711906 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39049 0))(
  ( (V!39050 (val!12768 Int)) )
))
(declare-datatypes ((tuple2!16170 0))(
  ( (tuple2!16171 (_1!8096 (_ BitVec 64)) (_2!8096 V!39049)) )
))
(declare-datatypes ((List!22739 0))(
  ( (Nil!22736) (Cons!22735 (h!23953 tuple2!16170) (t!32050 List!22739)) )
))
(declare-datatypes ((ListLongMap!14147 0))(
  ( (ListLongMap!14148 (toList!7089 List!22739)) )
))
(declare-fun lt!470682 () ListLongMap!14147)

(declare-fun lt!470684 () ListLongMap!14147)

(assert (=> b!1067081 (= lt!470682 lt!470684)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39049)

(declare-datatypes ((ValueCell!12014 0))(
  ( (ValueCellFull!12014 (v!15376 V!39049)) (EmptyCell!12014) )
))
(declare-datatypes ((array!67905 0))(
  ( (array!67906 (arr!32649 (Array (_ BitVec 32) ValueCell!12014)) (size!33186 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67905)

(declare-fun minValue!907 () V!39049)

(declare-datatypes ((Unit!34972 0))(
  ( (Unit!34973) )
))
(declare-fun lt!470680 () Unit!34972)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39049)

(declare-datatypes ((array!67907 0))(
  ( (array!67908 (arr!32650 (Array (_ BitVec 32) (_ BitVec 64))) (size!33187 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67907)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!715 (array!67907 array!67905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 V!39049 V!39049 (_ BitVec 32) Int) Unit!34972)

(assert (=> b!1067081 (= lt!470680 (lemmaNoChangeToArrayThenSameMapNoExtras!715 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3712 (array!67907 array!67905 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1067081 (= lt!470684 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067081 (= lt!470682 (getCurrentListMapNoExtraKeys!3712 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39838 () Bool)

(declare-fun mapRes!39838 () Bool)

(declare-fun tp!76313 () Bool)

(declare-fun e!608475 () Bool)

(assert (=> mapNonEmpty!39838 (= mapRes!39838 (and tp!76313 e!608475))))

(declare-fun mapRest!39838 () (Array (_ BitVec 32) ValueCell!12014))

(declare-fun mapKey!39838 () (_ BitVec 32))

(declare-fun mapValue!39838 () ValueCell!12014)

(assert (=> mapNonEmpty!39838 (= (arr!32649 _values!955) (store mapRest!39838 mapKey!39838 mapValue!39838))))

(declare-fun res!711902 () Bool)

(assert (=> start!94476 (=> (not res!711902) (not e!608480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94476 (= res!711902 (validMask!0 mask!1515))))

(assert (=> start!94476 e!608480))

(assert (=> start!94476 true))

(assert (=> start!94476 tp_is_empty!25435))

(declare-fun e!608476 () Bool)

(declare-fun array_inv!25304 (array!67905) Bool)

(assert (=> start!94476 (and (array_inv!25304 _values!955) e!608476)))

(assert (=> start!94476 tp!76312))

(declare-fun array_inv!25305 (array!67907) Bool)

(assert (=> start!94476 (array_inv!25305 _keys!1163)))

(declare-fun b!1067082 () Bool)

(assert (=> b!1067082 (= e!608476 (and e!608479 mapRes!39838))))

(declare-fun condMapEmpty!39838 () Bool)

(declare-fun mapDefault!39838 () ValueCell!12014)

(assert (=> b!1067082 (= condMapEmpty!39838 (= (arr!32649 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12014)) mapDefault!39838)))))

(declare-fun b!1067083 () Bool)

(assert (=> b!1067083 (= e!608478 true)))

(declare-fun lt!470681 () ListLongMap!14147)

(declare-fun lt!470678 () ListLongMap!14147)

(declare-fun -!608 (ListLongMap!14147 (_ BitVec 64)) ListLongMap!14147)

(assert (=> b!1067083 (= lt!470681 (-!608 lt!470678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470683 () ListLongMap!14147)

(assert (=> b!1067083 (= (-!608 lt!470683 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470682)))

(declare-fun lt!470677 () Unit!34972)

(declare-fun addThenRemoveForNewKeyIsSame!18 (ListLongMap!14147 (_ BitVec 64) V!39049) Unit!34972)

(assert (=> b!1067083 (= lt!470677 (addThenRemoveForNewKeyIsSame!18 lt!470682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470679 () ListLongMap!14147)

(assert (=> b!1067083 (and (= lt!470678 lt!470683) (= lt!470679 lt!470684))))

(declare-fun +!3161 (ListLongMap!14147 tuple2!16170) ListLongMap!14147)

(assert (=> b!1067083 (= lt!470683 (+!3161 lt!470682 (tuple2!16171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4042 (array!67907 array!67905 (_ BitVec 32) (_ BitVec 32) V!39049 V!39049 (_ BitVec 32) Int) ListLongMap!14147)

(assert (=> b!1067083 (= lt!470679 (getCurrentListMap!4042 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067083 (= lt!470678 (getCurrentListMap!4042 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067084 () Bool)

(assert (=> b!1067084 (= e!608475 tp_is_empty!25435)))

(declare-fun b!1067085 () Bool)

(declare-fun res!711905 () Bool)

(assert (=> b!1067085 (=> (not res!711905) (not e!608480))))

(assert (=> b!1067085 (= res!711905 (and (= (size!33186 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33187 _keys!1163) (size!33186 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067086 () Bool)

(declare-fun res!711903 () Bool)

(assert (=> b!1067086 (=> (not res!711903) (not e!608480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67907 (_ BitVec 32)) Bool)

(assert (=> b!1067086 (= res!711903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39838 () Bool)

(assert (=> mapIsEmpty!39838 mapRes!39838))

(declare-fun b!1067087 () Bool)

(declare-fun res!711904 () Bool)

(assert (=> b!1067087 (=> (not res!711904) (not e!608480))))

(declare-datatypes ((List!22740 0))(
  ( (Nil!22737) (Cons!22736 (h!23954 (_ BitVec 64)) (t!32051 List!22740)) )
))
(declare-fun arrayNoDuplicates!0 (array!67907 (_ BitVec 32) List!22740) Bool)

(assert (=> b!1067087 (= res!711904 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22737))))

(assert (= (and start!94476 res!711902) b!1067085))

(assert (= (and b!1067085 res!711905) b!1067086))

(assert (= (and b!1067086 res!711903) b!1067087))

(assert (= (and b!1067087 res!711904) b!1067081))

(assert (= (and b!1067081 (not res!711906)) b!1067083))

(assert (= (and b!1067082 condMapEmpty!39838) mapIsEmpty!39838))

(assert (= (and b!1067082 (not condMapEmpty!39838)) mapNonEmpty!39838))

(get-info :version)

(assert (= (and mapNonEmpty!39838 ((_ is ValueCellFull!12014) mapValue!39838)) b!1067084))

(assert (= (and b!1067082 ((_ is ValueCellFull!12014) mapDefault!39838)) b!1067080))

(assert (= start!94476 b!1067082))

(declare-fun m!985961 () Bool)

(assert (=> b!1067086 m!985961))

(declare-fun m!985963 () Bool)

(assert (=> b!1067081 m!985963))

(declare-fun m!985965 () Bool)

(assert (=> b!1067081 m!985965))

(declare-fun m!985967 () Bool)

(assert (=> b!1067081 m!985967))

(declare-fun m!985969 () Bool)

(assert (=> mapNonEmpty!39838 m!985969))

(declare-fun m!985971 () Bool)

(assert (=> start!94476 m!985971))

(declare-fun m!985973 () Bool)

(assert (=> start!94476 m!985973))

(declare-fun m!985975 () Bool)

(assert (=> start!94476 m!985975))

(declare-fun m!985977 () Bool)

(assert (=> b!1067087 m!985977))

(declare-fun m!985979 () Bool)

(assert (=> b!1067083 m!985979))

(declare-fun m!985981 () Bool)

(assert (=> b!1067083 m!985981))

(declare-fun m!985983 () Bool)

(assert (=> b!1067083 m!985983))

(declare-fun m!985985 () Bool)

(assert (=> b!1067083 m!985985))

(declare-fun m!985987 () Bool)

(assert (=> b!1067083 m!985987))

(declare-fun m!985989 () Bool)

(assert (=> b!1067083 m!985989))

(check-sat tp_is_empty!25435 (not b!1067081) (not b!1067086) (not mapNonEmpty!39838) b_and!34395 (not b_next!21625) (not b!1067083) (not start!94476) (not b!1067087))
(check-sat b_and!34395 (not b_next!21625))
