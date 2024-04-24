; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94962 () Bool)

(assert start!94962)

(declare-fun b_free!21979 () Bool)

(declare-fun b_next!21979 () Bool)

(assert (=> start!94962 (= b_free!21979 (not b_next!21979))))

(declare-fun tp!77395 () Bool)

(declare-fun b_and!34819 () Bool)

(assert (=> start!94962 (= tp!77395 b_and!34819)))

(declare-fun b!1072348 () Bool)

(declare-fun e!612328 () Bool)

(declare-fun e!612327 () Bool)

(assert (=> b!1072348 (= e!612328 (not e!612327))))

(declare-fun res!714985 () Bool)

(assert (=> b!1072348 (=> res!714985 e!612327)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072348 (= res!714985 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39521 0))(
  ( (V!39522 (val!12945 Int)) )
))
(declare-datatypes ((tuple2!16440 0))(
  ( (tuple2!16441 (_1!8231 (_ BitVec 64)) (_2!8231 V!39521)) )
))
(declare-datatypes ((List!23003 0))(
  ( (Nil!23000) (Cons!22999 (h!24217 tuple2!16440) (t!32328 List!23003)) )
))
(declare-datatypes ((ListLongMap!14417 0))(
  ( (ListLongMap!14418 (toList!7224 List!23003)) )
))
(declare-fun lt!473998 () ListLongMap!14417)

(declare-fun lt!473996 () ListLongMap!14417)

(assert (=> b!1072348 (= lt!473998 lt!473996)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39521)

(declare-datatypes ((Unit!35235 0))(
  ( (Unit!35236) )
))
(declare-fun lt!473993 () Unit!35235)

(declare-datatypes ((ValueCell!12191 0))(
  ( (ValueCellFull!12191 (v!15557 V!39521)) (EmptyCell!12191) )
))
(declare-datatypes ((array!68591 0))(
  ( (array!68592 (arr!32985 (Array (_ BitVec 32) ValueCell!12191)) (size!33522 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68591)

(declare-fun minValue!907 () V!39521)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39521)

(declare-datatypes ((array!68593 0))(
  ( (array!68594 (arr!32986 (Array (_ BitVec 32) (_ BitVec 64))) (size!33523 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68593)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!835 (array!68593 array!68591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 V!39521 V!39521 (_ BitVec 32) Int) Unit!35235)

(assert (=> b!1072348 (= lt!473993 (lemmaNoChangeToArrayThenSameMapNoExtras!835 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3832 (array!68593 array!68591 (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 (_ BitVec 32) Int) ListLongMap!14417)

(assert (=> b!1072348 (= lt!473996 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072348 (= lt!473998 (getCurrentListMapNoExtraKeys!3832 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072349 () Bool)

(declare-fun e!612325 () Bool)

(declare-fun tp_is_empty!25789 () Bool)

(assert (=> b!1072349 (= e!612325 tp_is_empty!25789)))

(declare-fun mapIsEmpty!40390 () Bool)

(declare-fun mapRes!40390 () Bool)

(assert (=> mapIsEmpty!40390 mapRes!40390))

(declare-fun res!714988 () Bool)

(assert (=> start!94962 (=> (not res!714988) (not e!612328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94962 (= res!714988 (validMask!0 mask!1515))))

(assert (=> start!94962 e!612328))

(assert (=> start!94962 true))

(assert (=> start!94962 tp_is_empty!25789))

(declare-fun e!612324 () Bool)

(declare-fun array_inv!25538 (array!68591) Bool)

(assert (=> start!94962 (and (array_inv!25538 _values!955) e!612324)))

(assert (=> start!94962 tp!77395))

(declare-fun array_inv!25539 (array!68593) Bool)

(assert (=> start!94962 (array_inv!25539 _keys!1163)))

(declare-fun b!1072350 () Bool)

(declare-fun e!612329 () Bool)

(assert (=> b!1072350 (= e!612329 tp_is_empty!25789)))

(declare-fun b!1072351 () Bool)

(declare-fun res!714986 () Bool)

(assert (=> b!1072351 (=> (not res!714986) (not e!612328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68593 (_ BitVec 32)) Bool)

(assert (=> b!1072351 (= res!714986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40390 () Bool)

(declare-fun tp!77396 () Bool)

(assert (=> mapNonEmpty!40390 (= mapRes!40390 (and tp!77396 e!612325))))

(declare-fun mapValue!40390 () ValueCell!12191)

(declare-fun mapRest!40390 () (Array (_ BitVec 32) ValueCell!12191))

(declare-fun mapKey!40390 () (_ BitVec 32))

(assert (=> mapNonEmpty!40390 (= (arr!32985 _values!955) (store mapRest!40390 mapKey!40390 mapValue!40390))))

(declare-fun e!612323 () Bool)

(declare-fun b!1072352 () Bool)

(declare-fun lt!473999 () tuple2!16440)

(declare-fun lt!473989 () ListLongMap!14417)

(declare-fun +!3188 (ListLongMap!14417 tuple2!16440) ListLongMap!14417)

(assert (=> b!1072352 (= e!612323 (= lt!473989 (+!3188 lt!473996 lt!473999)))))

(declare-fun b!1072353 () Bool)

(declare-fun res!714984 () Bool)

(assert (=> b!1072353 (=> (not res!714984) (not e!612328))))

(declare-datatypes ((List!23004 0))(
  ( (Nil!23001) (Cons!23000 (h!24218 (_ BitVec 64)) (t!32329 List!23004)) )
))
(declare-fun arrayNoDuplicates!0 (array!68593 (_ BitVec 32) List!23004) Bool)

(assert (=> b!1072353 (= res!714984 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23001))))

(declare-fun b!1072354 () Bool)

(assert (=> b!1072354 (= e!612327 true)))

(declare-fun lt!473995 () ListLongMap!14417)

(declare-fun lt!473990 () ListLongMap!14417)

(declare-fun -!662 (ListLongMap!14417 (_ BitVec 64)) ListLongMap!14417)

(assert (=> b!1072354 (= lt!473995 (-!662 lt!473990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474000 () ListLongMap!14417)

(declare-fun lt!473994 () ListLongMap!14417)

(assert (=> b!1072354 (= lt!474000 lt!473994)))

(declare-fun lt!473997 () Unit!35235)

(declare-fun addCommutativeForDiffKeys!719 (ListLongMap!14417 (_ BitVec 64) V!39521 (_ BitVec 64) V!39521) Unit!35235)

(assert (=> b!1072354 (= lt!473997 (addCommutativeForDiffKeys!719 lt!473998 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473991 () ListLongMap!14417)

(assert (=> b!1072354 (= (-!662 lt!473994 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473991)))

(declare-fun lt!473992 () tuple2!16440)

(assert (=> b!1072354 (= lt!473994 (+!3188 lt!473991 lt!473992))))

(declare-fun lt!474001 () Unit!35235)

(declare-fun addThenRemoveForNewKeyIsSame!37 (ListLongMap!14417 (_ BitVec 64) V!39521) Unit!35235)

(assert (=> b!1072354 (= lt!474001 (addThenRemoveForNewKeyIsSame!37 lt!473991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072354 (= lt!473991 (+!3188 lt!473998 lt!473999))))

(assert (=> b!1072354 e!612323))

(declare-fun res!714983 () Bool)

(assert (=> b!1072354 (=> (not res!714983) (not e!612323))))

(assert (=> b!1072354 (= res!714983 (= lt!473990 lt!474000))))

(assert (=> b!1072354 (= lt!474000 (+!3188 (+!3188 lt!473998 lt!473992) lt!473999))))

(assert (=> b!1072354 (= lt!473999 (tuple2!16441 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072354 (= lt!473992 (tuple2!16441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4123 (array!68593 array!68591 (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 (_ BitVec 32) Int) ListLongMap!14417)

(assert (=> b!1072354 (= lt!473989 (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072354 (= lt!473990 (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072355 () Bool)

(declare-fun res!714987 () Bool)

(assert (=> b!1072355 (=> (not res!714987) (not e!612328))))

(assert (=> b!1072355 (= res!714987 (and (= (size!33522 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33523 _keys!1163) (size!33522 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072356 () Bool)

(assert (=> b!1072356 (= e!612324 (and e!612329 mapRes!40390))))

(declare-fun condMapEmpty!40390 () Bool)

(declare-fun mapDefault!40390 () ValueCell!12191)

(assert (=> b!1072356 (= condMapEmpty!40390 (= (arr!32985 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12191)) mapDefault!40390)))))

(assert (= (and start!94962 res!714988) b!1072355))

(assert (= (and b!1072355 res!714987) b!1072351))

(assert (= (and b!1072351 res!714986) b!1072353))

(assert (= (and b!1072353 res!714984) b!1072348))

(assert (= (and b!1072348 (not res!714985)) b!1072354))

(assert (= (and b!1072354 res!714983) b!1072352))

(assert (= (and b!1072356 condMapEmpty!40390) mapIsEmpty!40390))

(assert (= (and b!1072356 (not condMapEmpty!40390)) mapNonEmpty!40390))

(get-info :version)

(assert (= (and mapNonEmpty!40390 ((_ is ValueCellFull!12191) mapValue!40390)) b!1072349))

(assert (= (and b!1072356 ((_ is ValueCellFull!12191) mapDefault!40390)) b!1072350))

(assert (= start!94962 b!1072356))

(declare-fun m!991001 () Bool)

(assert (=> start!94962 m!991001))

(declare-fun m!991003 () Bool)

(assert (=> start!94962 m!991003))

(declare-fun m!991005 () Bool)

(assert (=> start!94962 m!991005))

(declare-fun m!991007 () Bool)

(assert (=> b!1072354 m!991007))

(declare-fun m!991009 () Bool)

(assert (=> b!1072354 m!991009))

(declare-fun m!991011 () Bool)

(assert (=> b!1072354 m!991011))

(declare-fun m!991013 () Bool)

(assert (=> b!1072354 m!991013))

(declare-fun m!991015 () Bool)

(assert (=> b!1072354 m!991015))

(declare-fun m!991017 () Bool)

(assert (=> b!1072354 m!991017))

(declare-fun m!991019 () Bool)

(assert (=> b!1072354 m!991019))

(declare-fun m!991021 () Bool)

(assert (=> b!1072354 m!991021))

(declare-fun m!991023 () Bool)

(assert (=> b!1072354 m!991023))

(assert (=> b!1072354 m!991009))

(declare-fun m!991025 () Bool)

(assert (=> b!1072354 m!991025))

(declare-fun m!991027 () Bool)

(assert (=> mapNonEmpty!40390 m!991027))

(declare-fun m!991029 () Bool)

(assert (=> b!1072352 m!991029))

(declare-fun m!991031 () Bool)

(assert (=> b!1072348 m!991031))

(declare-fun m!991033 () Bool)

(assert (=> b!1072348 m!991033))

(declare-fun m!991035 () Bool)

(assert (=> b!1072348 m!991035))

(declare-fun m!991037 () Bool)

(assert (=> b!1072351 m!991037))

(declare-fun m!991039 () Bool)

(assert (=> b!1072353 m!991039))

(check-sat (not b!1072354) (not b!1072352) (not b!1072348) (not start!94962) (not b!1072351) (not mapNonEmpty!40390) tp_is_empty!25789 (not b!1072353) (not b_next!21979) b_and!34819)
(check-sat b_and!34819 (not b_next!21979))
