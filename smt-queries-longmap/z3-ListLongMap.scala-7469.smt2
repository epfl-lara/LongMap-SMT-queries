; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94732 () Bool)

(assert start!94732)

(declare-fun b_free!21991 () Bool)

(declare-fun b_next!21991 () Bool)

(assert (=> start!94732 (= b_free!21991 (not b_next!21991))))

(declare-fun tp!77431 () Bool)

(declare-fun b_and!34795 () Bool)

(assert (=> start!94732 (= tp!77431 b_and!34795)))

(declare-fun b!1071030 () Bool)

(declare-fun res!714505 () Bool)

(declare-fun e!611502 () Bool)

(assert (=> b!1071030 (=> (not res!714505) (not e!611502))))

(declare-datatypes ((array!68514 0))(
  ( (array!68515 (arr!32953 (Array (_ BitVec 32) (_ BitVec 64))) (size!33491 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68514)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68514 (_ BitVec 32)) Bool)

(assert (=> b!1071030 (= res!714505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071031 () Bool)

(declare-fun e!611506 () Bool)

(assert (=> b!1071031 (= e!611502 (not e!611506))))

(declare-fun res!714500 () Bool)

(assert (=> b!1071031 (=> res!714500 e!611506)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071031 (= res!714500 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39537 0))(
  ( (V!39538 (val!12951 Int)) )
))
(declare-datatypes ((tuple2!16528 0))(
  ( (tuple2!16529 (_1!8275 (_ BitVec 64)) (_2!8275 V!39537)) )
))
(declare-datatypes ((List!23057 0))(
  ( (Nil!23054) (Cons!23053 (h!24262 tuple2!16528) (t!32381 List!23057)) )
))
(declare-datatypes ((ListLongMap!14497 0))(
  ( (ListLongMap!14498 (toList!7264 List!23057)) )
))
(declare-fun lt!473518 () ListLongMap!14497)

(declare-fun lt!473517 () ListLongMap!14497)

(assert (=> b!1071031 (= lt!473518 lt!473517)))

(declare-fun zeroValueBefore!47 () V!39537)

(declare-datatypes ((ValueCell!12197 0))(
  ( (ValueCellFull!12197 (v!15566 V!39537)) (EmptyCell!12197) )
))
(declare-datatypes ((array!68516 0))(
  ( (array!68517 (arr!32954 (Array (_ BitVec 32) ValueCell!12197)) (size!33492 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68516)

(declare-fun minValue!907 () V!39537)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39537)

(declare-datatypes ((Unit!35109 0))(
  ( (Unit!35110) )
))
(declare-fun lt!473519 () Unit!35109)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!843 (array!68514 array!68516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 V!39537 V!39537 (_ BitVec 32) Int) Unit!35109)

(assert (=> b!1071031 (= lt!473519 (lemmaNoChangeToArrayThenSameMapNoExtras!843 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3849 (array!68514 array!68516 (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 (_ BitVec 32) Int) ListLongMap!14497)

(assert (=> b!1071031 (= lt!473517 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071031 (= lt!473518 (getCurrentListMapNoExtraKeys!3849 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473511 () ListLongMap!14497)

(declare-fun e!611505 () Bool)

(declare-fun lt!473512 () tuple2!16528)

(declare-fun b!1071032 () Bool)

(declare-fun +!3200 (ListLongMap!14497 tuple2!16528) ListLongMap!14497)

(assert (=> b!1071032 (= e!611505 (= lt!473511 (+!3200 lt!473517 lt!473512)))))

(declare-fun b!1071033 () Bool)

(declare-fun res!714502 () Bool)

(assert (=> b!1071033 (=> (not res!714502) (not e!611502))))

(assert (=> b!1071033 (= res!714502 (and (= (size!33492 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33491 _keys!1163) (size!33492 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071034 () Bool)

(declare-fun e!611503 () Bool)

(declare-fun tp_is_empty!25801 () Bool)

(assert (=> b!1071034 (= e!611503 tp_is_empty!25801)))

(declare-fun b!1071035 () Bool)

(assert (=> b!1071035 (= e!611506 true)))

(declare-fun lt!473513 () ListLongMap!14497)

(declare-fun lt!473510 () ListLongMap!14497)

(declare-fun -!661 (ListLongMap!14497 (_ BitVec 64)) ListLongMap!14497)

(assert (=> b!1071035 (= lt!473513 (-!661 lt!473510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473509 () ListLongMap!14497)

(declare-fun lt!473515 () ListLongMap!14497)

(assert (=> b!1071035 (= lt!473509 lt!473515)))

(declare-fun lt!473514 () Unit!35109)

(declare-fun addCommutativeForDiffKeys!719 (ListLongMap!14497 (_ BitVec 64) V!39537 (_ BitVec 64) V!39537) Unit!35109)

(assert (=> b!1071035 (= lt!473514 (addCommutativeForDiffKeys!719 lt!473518 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473520 () ListLongMap!14497)

(assert (=> b!1071035 (= (-!661 lt!473515 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473520)))

(declare-fun lt!473508 () tuple2!16528)

(assert (=> b!1071035 (= lt!473515 (+!3200 lt!473520 lt!473508))))

(declare-fun lt!473516 () Unit!35109)

(declare-fun addThenRemoveForNewKeyIsSame!42 (ListLongMap!14497 (_ BitVec 64) V!39537) Unit!35109)

(assert (=> b!1071035 (= lt!473516 (addThenRemoveForNewKeyIsSame!42 lt!473520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071035 (= lt!473520 (+!3200 lt!473518 lt!473512))))

(assert (=> b!1071035 e!611505))

(declare-fun res!714501 () Bool)

(assert (=> b!1071035 (=> (not res!714501) (not e!611505))))

(assert (=> b!1071035 (= res!714501 (= lt!473510 lt!473509))))

(assert (=> b!1071035 (= lt!473509 (+!3200 (+!3200 lt!473518 lt!473508) lt!473512))))

(assert (=> b!1071035 (= lt!473512 (tuple2!16529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071035 (= lt!473508 (tuple2!16529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4074 (array!68514 array!68516 (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 (_ BitVec 32) Int) ListLongMap!14497)

(assert (=> b!1071035 (= lt!473511 (getCurrentListMap!4074 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071035 (= lt!473510 (getCurrentListMap!4074 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071036 () Bool)

(declare-fun e!611501 () Bool)

(assert (=> b!1071036 (= e!611501 tp_is_empty!25801)))

(declare-fun res!714503 () Bool)

(assert (=> start!94732 (=> (not res!714503) (not e!611502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94732 (= res!714503 (validMask!0 mask!1515))))

(assert (=> start!94732 e!611502))

(assert (=> start!94732 true))

(assert (=> start!94732 tp_is_empty!25801))

(declare-fun e!611507 () Bool)

(declare-fun array_inv!25494 (array!68516) Bool)

(assert (=> start!94732 (and (array_inv!25494 _values!955) e!611507)))

(assert (=> start!94732 tp!77431))

(declare-fun array_inv!25495 (array!68514) Bool)

(assert (=> start!94732 (array_inv!25495 _keys!1163)))

(declare-fun mapNonEmpty!40408 () Bool)

(declare-fun mapRes!40408 () Bool)

(declare-fun tp!77432 () Bool)

(assert (=> mapNonEmpty!40408 (= mapRes!40408 (and tp!77432 e!611501))))

(declare-fun mapRest!40408 () (Array (_ BitVec 32) ValueCell!12197))

(declare-fun mapKey!40408 () (_ BitVec 32))

(declare-fun mapValue!40408 () ValueCell!12197)

(assert (=> mapNonEmpty!40408 (= (arr!32954 _values!955) (store mapRest!40408 mapKey!40408 mapValue!40408))))

(declare-fun b!1071037 () Bool)

(declare-fun res!714504 () Bool)

(assert (=> b!1071037 (=> (not res!714504) (not e!611502))))

(declare-datatypes ((List!23058 0))(
  ( (Nil!23055) (Cons!23054 (h!24263 (_ BitVec 64)) (t!32382 List!23058)) )
))
(declare-fun arrayNoDuplicates!0 (array!68514 (_ BitVec 32) List!23058) Bool)

(assert (=> b!1071037 (= res!714504 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23055))))

(declare-fun mapIsEmpty!40408 () Bool)

(assert (=> mapIsEmpty!40408 mapRes!40408))

(declare-fun b!1071038 () Bool)

(assert (=> b!1071038 (= e!611507 (and e!611503 mapRes!40408))))

(declare-fun condMapEmpty!40408 () Bool)

(declare-fun mapDefault!40408 () ValueCell!12197)

(assert (=> b!1071038 (= condMapEmpty!40408 (= (arr!32954 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12197)) mapDefault!40408)))))

(assert (= (and start!94732 res!714503) b!1071033))

(assert (= (and b!1071033 res!714502) b!1071030))

(assert (= (and b!1071030 res!714505) b!1071037))

(assert (= (and b!1071037 res!714504) b!1071031))

(assert (= (and b!1071031 (not res!714500)) b!1071035))

(assert (= (and b!1071035 res!714501) b!1071032))

(assert (= (and b!1071038 condMapEmpty!40408) mapIsEmpty!40408))

(assert (= (and b!1071038 (not condMapEmpty!40408)) mapNonEmpty!40408))

(get-info :version)

(assert (= (and mapNonEmpty!40408 ((_ is ValueCellFull!12197) mapValue!40408)) b!1071036))

(assert (= (and b!1071038 ((_ is ValueCellFull!12197) mapDefault!40408)) b!1071034))

(assert (= start!94732 b!1071038))

(declare-fun m!988943 () Bool)

(assert (=> start!94732 m!988943))

(declare-fun m!988945 () Bool)

(assert (=> start!94732 m!988945))

(declare-fun m!988947 () Bool)

(assert (=> start!94732 m!988947))

(declare-fun m!988949 () Bool)

(assert (=> b!1071030 m!988949))

(declare-fun m!988951 () Bool)

(assert (=> b!1071035 m!988951))

(assert (=> b!1071035 m!988951))

(declare-fun m!988953 () Bool)

(assert (=> b!1071035 m!988953))

(declare-fun m!988955 () Bool)

(assert (=> b!1071035 m!988955))

(declare-fun m!988957 () Bool)

(assert (=> b!1071035 m!988957))

(declare-fun m!988959 () Bool)

(assert (=> b!1071035 m!988959))

(declare-fun m!988961 () Bool)

(assert (=> b!1071035 m!988961))

(declare-fun m!988963 () Bool)

(assert (=> b!1071035 m!988963))

(declare-fun m!988965 () Bool)

(assert (=> b!1071035 m!988965))

(declare-fun m!988967 () Bool)

(assert (=> b!1071035 m!988967))

(declare-fun m!988969 () Bool)

(assert (=> b!1071035 m!988969))

(declare-fun m!988971 () Bool)

(assert (=> b!1071032 m!988971))

(declare-fun m!988973 () Bool)

(assert (=> mapNonEmpty!40408 m!988973))

(declare-fun m!988975 () Bool)

(assert (=> b!1071031 m!988975))

(declare-fun m!988977 () Bool)

(assert (=> b!1071031 m!988977))

(declare-fun m!988979 () Bool)

(assert (=> b!1071031 m!988979))

(declare-fun m!988981 () Bool)

(assert (=> b!1071037 m!988981))

(check-sat (not b!1071037) (not b!1071031) b_and!34795 (not b!1071035) (not b!1071032) (not start!94732) (not b!1071030) (not mapNonEmpty!40408) tp_is_empty!25801 (not b_next!21991))
(check-sat b_and!34795 (not b_next!21991))
