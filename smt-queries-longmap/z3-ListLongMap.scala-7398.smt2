; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94400 () Bool)

(assert start!94400)

(declare-fun b_free!21565 () Bool)

(declare-fun b_next!21565 () Bool)

(assert (=> start!94400 (= b_free!21565 (not b_next!21565))))

(declare-fun tp!76129 () Bool)

(declare-fun b_and!34325 () Bool)

(assert (=> start!94400 (= tp!76129 b_and!34325)))

(declare-fun b!1066203 () Bool)

(declare-fun res!711387 () Bool)

(declare-fun e!607832 () Bool)

(assert (=> b!1066203 (=> (not res!711387) (not e!607832))))

(declare-datatypes ((array!67791 0))(
  ( (array!67792 (arr!32593 (Array (_ BitVec 32) (_ BitVec 64))) (size!33130 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67791)

(declare-datatypes ((List!22699 0))(
  ( (Nil!22696) (Cons!22695 (h!23913 (_ BitVec 64)) (t!32008 List!22699)) )
))
(declare-fun arrayNoDuplicates!0 (array!67791 (_ BitVec 32) List!22699) Bool)

(assert (=> b!1066203 (= res!711387 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22696))))

(declare-fun b!1066204 () Bool)

(declare-fun e!607833 () Bool)

(assert (=> b!1066204 (= e!607832 (not e!607833))))

(declare-fun res!711386 () Bool)

(assert (=> b!1066204 (=> res!711386 e!607833)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066204 (= res!711386 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38969 0))(
  ( (V!38970 (val!12738 Int)) )
))
(declare-datatypes ((tuple2!16126 0))(
  ( (tuple2!16127 (_1!8074 (_ BitVec 64)) (_2!8074 V!38969)) )
))
(declare-datatypes ((List!22700 0))(
  ( (Nil!22697) (Cons!22696 (h!23914 tuple2!16126) (t!32009 List!22700)) )
))
(declare-datatypes ((ListLongMap!14103 0))(
  ( (ListLongMap!14104 (toList!7067 List!22700)) )
))
(declare-fun lt!469934 () ListLongMap!14103)

(declare-fun lt!469935 () ListLongMap!14103)

(assert (=> b!1066204 (= lt!469934 lt!469935)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38969)

(declare-datatypes ((Unit!34927 0))(
  ( (Unit!34928) )
))
(declare-fun lt!469936 () Unit!34927)

(declare-datatypes ((ValueCell!11984 0))(
  ( (ValueCellFull!11984 (v!15346 V!38969)) (EmptyCell!11984) )
))
(declare-datatypes ((array!67793 0))(
  ( (array!67794 (arr!32594 (Array (_ BitVec 32) ValueCell!11984)) (size!33131 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67793)

(declare-fun minValue!907 () V!38969)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38969)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!699 (array!67791 array!67793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 V!38969 V!38969 (_ BitVec 32) Int) Unit!34927)

(assert (=> b!1066204 (= lt!469936 (lemmaNoChangeToArrayThenSameMapNoExtras!699 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3696 (array!67791 array!67793 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14103)

(assert (=> b!1066204 (= lt!469935 (getCurrentListMapNoExtraKeys!3696 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066204 (= lt!469934 (getCurrentListMapNoExtraKeys!3696 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066206 () Bool)

(declare-fun res!711388 () Bool)

(assert (=> b!1066206 (=> (not res!711388) (not e!607832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67791 (_ BitVec 32)) Bool)

(assert (=> b!1066206 (= res!711388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39745 () Bool)

(declare-fun mapRes!39745 () Bool)

(declare-fun tp!76130 () Bool)

(declare-fun e!607834 () Bool)

(assert (=> mapNonEmpty!39745 (= mapRes!39745 (and tp!76130 e!607834))))

(declare-fun mapRest!39745 () (Array (_ BitVec 32) ValueCell!11984))

(declare-fun mapKey!39745 () (_ BitVec 32))

(declare-fun mapValue!39745 () ValueCell!11984)

(assert (=> mapNonEmpty!39745 (= (arr!32594 _values!955) (store mapRest!39745 mapKey!39745 mapValue!39745))))

(declare-fun b!1066207 () Bool)

(assert (=> b!1066207 (= e!607833 true)))

(declare-fun lt!469933 () ListLongMap!14103)

(declare-fun getCurrentListMap!4021 (array!67791 array!67793 (_ BitVec 32) (_ BitVec 32) V!38969 V!38969 (_ BitVec 32) Int) ListLongMap!14103)

(assert (=> b!1066207 (= lt!469933 (getCurrentListMap!4021 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066208 () Bool)

(declare-fun res!711389 () Bool)

(assert (=> b!1066208 (=> (not res!711389) (not e!607832))))

(assert (=> b!1066208 (= res!711389 (and (= (size!33131 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33130 _keys!1163) (size!33131 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066209 () Bool)

(declare-fun e!607837 () Bool)

(declare-fun e!607835 () Bool)

(assert (=> b!1066209 (= e!607837 (and e!607835 mapRes!39745))))

(declare-fun condMapEmpty!39745 () Bool)

(declare-fun mapDefault!39745 () ValueCell!11984)

(assert (=> b!1066209 (= condMapEmpty!39745 (= (arr!32594 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11984)) mapDefault!39745)))))

(declare-fun res!711385 () Bool)

(assert (=> start!94400 (=> (not res!711385) (not e!607832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94400 (= res!711385 (validMask!0 mask!1515))))

(assert (=> start!94400 e!607832))

(assert (=> start!94400 true))

(declare-fun tp_is_empty!25375 () Bool)

(assert (=> start!94400 tp_is_empty!25375))

(declare-fun array_inv!25264 (array!67793) Bool)

(assert (=> start!94400 (and (array_inv!25264 _values!955) e!607837)))

(assert (=> start!94400 tp!76129))

(declare-fun array_inv!25265 (array!67791) Bool)

(assert (=> start!94400 (array_inv!25265 _keys!1163)))

(declare-fun b!1066205 () Bool)

(assert (=> b!1066205 (= e!607834 tp_is_empty!25375)))

(declare-fun b!1066210 () Bool)

(assert (=> b!1066210 (= e!607835 tp_is_empty!25375)))

(declare-fun mapIsEmpty!39745 () Bool)

(assert (=> mapIsEmpty!39745 mapRes!39745))

(assert (= (and start!94400 res!711385) b!1066208))

(assert (= (and b!1066208 res!711389) b!1066206))

(assert (= (and b!1066206 res!711388) b!1066203))

(assert (= (and b!1066203 res!711387) b!1066204))

(assert (= (and b!1066204 (not res!711386)) b!1066207))

(assert (= (and b!1066209 condMapEmpty!39745) mapIsEmpty!39745))

(assert (= (and b!1066209 (not condMapEmpty!39745)) mapNonEmpty!39745))

(get-info :version)

(assert (= (and mapNonEmpty!39745 ((_ is ValueCellFull!11984) mapValue!39745)) b!1066205))

(assert (= (and b!1066209 ((_ is ValueCellFull!11984) mapDefault!39745)) b!1066210))

(assert (= start!94400 b!1066209))

(declare-fun m!985021 () Bool)

(assert (=> b!1066206 m!985021))

(declare-fun m!985023 () Bool)

(assert (=> mapNonEmpty!39745 m!985023))

(declare-fun m!985025 () Bool)

(assert (=> b!1066207 m!985025))

(declare-fun m!985027 () Bool)

(assert (=> b!1066203 m!985027))

(declare-fun m!985029 () Bool)

(assert (=> start!94400 m!985029))

(declare-fun m!985031 () Bool)

(assert (=> start!94400 m!985031))

(declare-fun m!985033 () Bool)

(assert (=> start!94400 m!985033))

(declare-fun m!985035 () Bool)

(assert (=> b!1066204 m!985035))

(declare-fun m!985037 () Bool)

(assert (=> b!1066204 m!985037))

(declare-fun m!985039 () Bool)

(assert (=> b!1066204 m!985039))

(check-sat (not b!1066207) (not start!94400) (not b!1066206) tp_is_empty!25375 (not mapNonEmpty!39745) (not b!1066204) (not b!1066203) b_and!34325 (not b_next!21565))
(check-sat b_and!34325 (not b_next!21565))
