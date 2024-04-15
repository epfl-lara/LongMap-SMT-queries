; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94804 () Bool)

(assert start!94804)

(declare-fun b_free!22039 () Bool)

(declare-fun b_next!22039 () Bool)

(assert (=> start!94804 (= b_free!22039 (not b_next!22039))))

(declare-fun tp!77579 () Bool)

(declare-fun b_and!34855 () Bool)

(assert (=> start!94804 (= tp!77579 b_and!34855)))

(declare-fun b!1071870 () Bool)

(declare-fun res!715025 () Bool)

(declare-fun e!612131 () Bool)

(assert (=> b!1071870 (=> (not res!715025) (not e!612131))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39601 0))(
  ( (V!39602 (val!12975 Int)) )
))
(declare-datatypes ((ValueCell!12221 0))(
  ( (ValueCellFull!12221 (v!15591 V!39601)) (EmptyCell!12221) )
))
(declare-datatypes ((array!68606 0))(
  ( (array!68607 (arr!32998 (Array (_ BitVec 32) ValueCell!12221)) (size!33536 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68606)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68608 0))(
  ( (array!68609 (arr!32999 (Array (_ BitVec 32) (_ BitVec 64))) (size!33537 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68608)

(assert (=> b!1071870 (= res!715025 (and (= (size!33536 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33537 _keys!1163) (size!33536 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071871 () Bool)

(declare-fun e!612132 () Bool)

(assert (=> b!1071871 (= e!612131 (not e!612132))))

(declare-fun res!715023 () Bool)

(assert (=> b!1071871 (=> res!715023 e!612132)))

(assert (=> b!1071871 (= res!715023 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16570 0))(
  ( (tuple2!16571 (_1!8296 (_ BitVec 64)) (_2!8296 V!39601)) )
))
(declare-datatypes ((List!23095 0))(
  ( (Nil!23092) (Cons!23091 (h!24300 tuple2!16570) (t!32421 List!23095)) )
))
(declare-datatypes ((ListLongMap!14539 0))(
  ( (ListLongMap!14540 (toList!7285 List!23095)) )
))
(declare-fun lt!474606 () ListLongMap!14539)

(declare-fun lt!474611 () ListLongMap!14539)

(assert (=> b!1071871 (= lt!474606 lt!474611)))

(declare-fun minValue!907 () V!39601)

(declare-datatypes ((Unit!35149 0))(
  ( (Unit!35150) )
))
(declare-fun lt!474604 () Unit!35149)

(declare-fun zeroValueBefore!47 () V!39601)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39601)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!862 (array!68608 array!68606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 V!39601 V!39601 (_ BitVec 32) Int) Unit!35149)

(assert (=> b!1071871 (= lt!474604 (lemmaNoChangeToArrayThenSameMapNoExtras!862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3868 (array!68608 array!68606 (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 (_ BitVec 32) Int) ListLongMap!14539)

(assert (=> b!1071871 (= lt!474611 (getCurrentListMapNoExtraKeys!3868 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071871 (= lt!474606 (getCurrentListMapNoExtraKeys!3868 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071872 () Bool)

(declare-fun res!715024 () Bool)

(assert (=> b!1071872 (=> (not res!715024) (not e!612131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68608 (_ BitVec 32)) Bool)

(assert (=> b!1071872 (= res!715024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071873 () Bool)

(declare-fun e!612134 () Bool)

(declare-fun tp_is_empty!25849 () Bool)

(assert (=> b!1071873 (= e!612134 tp_is_empty!25849)))

(declare-fun b!1071874 () Bool)

(declare-fun res!715022 () Bool)

(assert (=> b!1071874 (=> (not res!715022) (not e!612131))))

(declare-datatypes ((List!23096 0))(
  ( (Nil!23093) (Cons!23092 (h!24301 (_ BitVec 64)) (t!32422 List!23096)) )
))
(declare-fun arrayNoDuplicates!0 (array!68608 (_ BitVec 32) List!23096) Bool)

(assert (=> b!1071874 (= res!715022 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23093))))

(declare-fun mapNonEmpty!40483 () Bool)

(declare-fun mapRes!40483 () Bool)

(declare-fun tp!77578 () Bool)

(declare-fun e!612129 () Bool)

(assert (=> mapNonEmpty!40483 (= mapRes!40483 (and tp!77578 e!612129))))

(declare-fun mapValue!40483 () ValueCell!12221)

(declare-fun mapRest!40483 () (Array (_ BitVec 32) ValueCell!12221))

(declare-fun mapKey!40483 () (_ BitVec 32))

(assert (=> mapNonEmpty!40483 (= (arr!32998 _values!955) (store mapRest!40483 mapKey!40483 mapValue!40483))))

(declare-fun b!1071875 () Bool)

(declare-fun e!612130 () Bool)

(assert (=> b!1071875 (= e!612130 (and e!612134 mapRes!40483))))

(declare-fun condMapEmpty!40483 () Bool)

(declare-fun mapDefault!40483 () ValueCell!12221)

(assert (=> b!1071875 (= condMapEmpty!40483 (= (arr!32998 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12221)) mapDefault!40483)))))

(declare-fun mapIsEmpty!40483 () Bool)

(assert (=> mapIsEmpty!40483 mapRes!40483))

(declare-fun b!1071877 () Bool)

(assert (=> b!1071877 (= e!612129 tp_is_empty!25849)))

(declare-fun lt!474607 () tuple2!16570)

(declare-fun lt!474613 () ListLongMap!14539)

(declare-fun e!612128 () Bool)

(declare-fun b!1071878 () Bool)

(declare-fun +!3218 (ListLongMap!14539 tuple2!16570) ListLongMap!14539)

(assert (=> b!1071878 (= e!612128 (= lt!474613 (+!3218 lt!474611 lt!474607)))))

(declare-fun res!715026 () Bool)

(assert (=> start!94804 (=> (not res!715026) (not e!612131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94804 (= res!715026 (validMask!0 mask!1515))))

(assert (=> start!94804 e!612131))

(assert (=> start!94804 true))

(assert (=> start!94804 tp_is_empty!25849))

(declare-fun array_inv!25528 (array!68606) Bool)

(assert (=> start!94804 (and (array_inv!25528 _values!955) e!612130)))

(assert (=> start!94804 tp!77579))

(declare-fun array_inv!25529 (array!68608) Bool)

(assert (=> start!94804 (array_inv!25529 _keys!1163)))

(declare-fun b!1071876 () Bool)

(assert (=> b!1071876 (= e!612132 true)))

(declare-fun lt!474602 () ListLongMap!14539)

(declare-fun lt!474603 () ListLongMap!14539)

(declare-fun -!676 (ListLongMap!14539 (_ BitVec 64)) ListLongMap!14539)

(assert (=> b!1071876 (= lt!474602 (-!676 lt!474603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474605 () ListLongMap!14539)

(declare-fun lt!474601 () ListLongMap!14539)

(assert (=> b!1071876 (= lt!474605 lt!474601)))

(declare-fun lt!474609 () Unit!35149)

(declare-fun addCommutativeForDiffKeys!734 (ListLongMap!14539 (_ BitVec 64) V!39601 (_ BitVec 64) V!39601) Unit!35149)

(assert (=> b!1071876 (= lt!474609 (addCommutativeForDiffKeys!734 lt!474606 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474608 () ListLongMap!14539)

(assert (=> b!1071876 (= (-!676 lt!474601 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474608)))

(declare-fun lt!474610 () tuple2!16570)

(assert (=> b!1071876 (= lt!474601 (+!3218 lt!474608 lt!474610))))

(declare-fun lt!474612 () Unit!35149)

(declare-fun addThenRemoveForNewKeyIsSame!57 (ListLongMap!14539 (_ BitVec 64) V!39601) Unit!35149)

(assert (=> b!1071876 (= lt!474612 (addThenRemoveForNewKeyIsSame!57 lt!474608 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071876 (= lt!474608 (+!3218 lt!474606 lt!474607))))

(assert (=> b!1071876 e!612128))

(declare-fun res!715027 () Bool)

(assert (=> b!1071876 (=> (not res!715027) (not e!612128))))

(assert (=> b!1071876 (= res!715027 (= lt!474603 lt!474605))))

(assert (=> b!1071876 (= lt!474605 (+!3218 (+!3218 lt!474606 lt!474610) lt!474607))))

(assert (=> b!1071876 (= lt!474607 (tuple2!16571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071876 (= lt!474610 (tuple2!16571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4089 (array!68608 array!68606 (_ BitVec 32) (_ BitVec 32) V!39601 V!39601 (_ BitVec 32) Int) ListLongMap!14539)

(assert (=> b!1071876 (= lt!474613 (getCurrentListMap!4089 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071876 (= lt!474603 (getCurrentListMap!4089 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94804 res!715026) b!1071870))

(assert (= (and b!1071870 res!715025) b!1071872))

(assert (= (and b!1071872 res!715024) b!1071874))

(assert (= (and b!1071874 res!715022) b!1071871))

(assert (= (and b!1071871 (not res!715023)) b!1071876))

(assert (= (and b!1071876 res!715027) b!1071878))

(assert (= (and b!1071875 condMapEmpty!40483) mapIsEmpty!40483))

(assert (= (and b!1071875 (not condMapEmpty!40483)) mapNonEmpty!40483))

(get-info :version)

(assert (= (and mapNonEmpty!40483 ((_ is ValueCellFull!12221) mapValue!40483)) b!1071877))

(assert (= (and b!1071875 ((_ is ValueCellFull!12221) mapDefault!40483)) b!1071873))

(assert (= start!94804 b!1071875))

(declare-fun m!990147 () Bool)

(assert (=> mapNonEmpty!40483 m!990147))

(declare-fun m!990149 () Bool)

(assert (=> b!1071878 m!990149))

(declare-fun m!990151 () Bool)

(assert (=> b!1071871 m!990151))

(declare-fun m!990153 () Bool)

(assert (=> b!1071871 m!990153))

(declare-fun m!990155 () Bool)

(assert (=> b!1071871 m!990155))

(declare-fun m!990157 () Bool)

(assert (=> b!1071872 m!990157))

(declare-fun m!990159 () Bool)

(assert (=> start!94804 m!990159))

(declare-fun m!990161 () Bool)

(assert (=> start!94804 m!990161))

(declare-fun m!990163 () Bool)

(assert (=> start!94804 m!990163))

(declare-fun m!990165 () Bool)

(assert (=> b!1071876 m!990165))

(declare-fun m!990167 () Bool)

(assert (=> b!1071876 m!990167))

(declare-fun m!990169 () Bool)

(assert (=> b!1071876 m!990169))

(declare-fun m!990171 () Bool)

(assert (=> b!1071876 m!990171))

(declare-fun m!990173 () Bool)

(assert (=> b!1071876 m!990173))

(declare-fun m!990175 () Bool)

(assert (=> b!1071876 m!990175))

(declare-fun m!990177 () Bool)

(assert (=> b!1071876 m!990177))

(declare-fun m!990179 () Bool)

(assert (=> b!1071876 m!990179))

(declare-fun m!990181 () Bool)

(assert (=> b!1071876 m!990181))

(assert (=> b!1071876 m!990177))

(declare-fun m!990183 () Bool)

(assert (=> b!1071876 m!990183))

(declare-fun m!990185 () Bool)

(assert (=> b!1071874 m!990185))

(check-sat (not b!1071871) (not start!94804) b_and!34855 (not b!1071872) (not b_next!22039) (not b!1071874) (not b!1071876) (not b!1071878) (not mapNonEmpty!40483) tp_is_empty!25849)
(check-sat b_and!34855 (not b_next!22039))
