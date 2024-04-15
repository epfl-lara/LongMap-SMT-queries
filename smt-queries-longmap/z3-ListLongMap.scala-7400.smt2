; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94186 () Bool)

(assert start!94186)

(declare-fun b_free!21577 () Bool)

(declare-fun b_next!21577 () Bool)

(assert (=> start!94186 (= b_free!21577 (not b_next!21577))))

(declare-fun tp!76168 () Bool)

(declare-fun b_and!34311 () Bool)

(assert (=> start!94186 (= tp!76168 b_and!34311)))

(declare-fun b!1065017 () Bool)

(declare-fun e!607094 () Bool)

(assert (=> b!1065017 (= e!607094 true)))

(declare-fun lt!469400 () Bool)

(declare-datatypes ((V!38985 0))(
  ( (V!38986 (val!12744 Int)) )
))
(declare-datatypes ((tuple2!16202 0))(
  ( (tuple2!16203 (_1!8112 (_ BitVec 64)) (_2!8112 V!38985)) )
))
(declare-datatypes ((List!22752 0))(
  ( (Nil!22749) (Cons!22748 (h!23957 tuple2!16202) (t!32062 List!22752)) )
))
(declare-datatypes ((ListLongMap!14171 0))(
  ( (ListLongMap!14172 (toList!7101 List!22752)) )
))
(declare-fun lt!469405 () ListLongMap!14171)

(declare-fun contains!6237 (ListLongMap!14171 (_ BitVec 64)) Bool)

(assert (=> b!1065017 (= lt!469400 (contains!6237 lt!469405 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!607088 () Bool)

(assert (=> b!1065017 e!607088))

(declare-fun res!710947 () Bool)

(assert (=> b!1065017 (=> (not res!710947) (not e!607088))))

(declare-fun zeroValueBefore!47 () V!38985)

(declare-fun lt!469402 () ListLongMap!14171)

(declare-fun +!3147 (ListLongMap!14171 tuple2!16202) ListLongMap!14171)

(assert (=> b!1065017 (= res!710947 (= lt!469402 (+!3147 lt!469405 (tuple2!16203 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!469404 () ListLongMap!14171)

(declare-datatypes ((ValueCell!11990 0))(
  ( (ValueCellFull!11990 (v!15355 V!38985)) (EmptyCell!11990) )
))
(declare-datatypes ((array!67708 0))(
  ( (array!67709 (arr!32557 (Array (_ BitVec 32) ValueCell!11990)) (size!33095 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67708)

(declare-fun minValue!907 () V!38985)

(declare-datatypes ((array!67710 0))(
  ( (array!67711 (arr!32558 (Array (_ BitVec 32) (_ BitVec 64))) (size!33096 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67710)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38985)

(declare-fun getCurrentListMap!3979 (array!67710 array!67708 (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1065017 (= lt!469404 (getCurrentListMap!3979 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065017 (= lt!469402 (getCurrentListMap!3979 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065018 () Bool)

(declare-fun res!710944 () Bool)

(declare-fun e!607089 () Bool)

(assert (=> b!1065018 (=> (not res!710944) (not e!607089))))

(assert (=> b!1065018 (= res!710944 (and (= (size!33095 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33096 _keys!1163) (size!33095 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065019 () Bool)

(assert (=> b!1065019 (= e!607089 (not e!607094))))

(declare-fun res!710949 () Bool)

(assert (=> b!1065019 (=> res!710949 e!607094)))

(assert (=> b!1065019 (= res!710949 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469401 () ListLongMap!14171)

(assert (=> b!1065019 (= lt!469405 lt!469401)))

(declare-datatypes ((Unit!34790 0))(
  ( (Unit!34791) )
))
(declare-fun lt!469403 () Unit!34790)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!699 (array!67710 array!67708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 V!38985 V!38985 (_ BitVec 32) Int) Unit!34790)

(assert (=> b!1065019 (= lt!469403 (lemmaNoChangeToArrayThenSameMapNoExtras!699 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3705 (array!67710 array!67708 (_ BitVec 32) (_ BitVec 32) V!38985 V!38985 (_ BitVec 32) Int) ListLongMap!14171)

(assert (=> b!1065019 (= lt!469401 (getCurrentListMapNoExtraKeys!3705 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065019 (= lt!469405 (getCurrentListMapNoExtraKeys!3705 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065020 () Bool)

(declare-fun e!607092 () Bool)

(declare-fun e!607093 () Bool)

(declare-fun mapRes!39766 () Bool)

(assert (=> b!1065020 (= e!607092 (and e!607093 mapRes!39766))))

(declare-fun condMapEmpty!39766 () Bool)

(declare-fun mapDefault!39766 () ValueCell!11990)

(assert (=> b!1065020 (= condMapEmpty!39766 (= (arr!32557 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11990)) mapDefault!39766)))))

(declare-fun b!1065021 () Bool)

(declare-fun e!607090 () Bool)

(declare-fun tp_is_empty!25387 () Bool)

(assert (=> b!1065021 (= e!607090 tp_is_empty!25387)))

(declare-fun b!1065022 () Bool)

(assert (=> b!1065022 (= e!607093 tp_is_empty!25387)))

(declare-fun res!710948 () Bool)

(assert (=> start!94186 (=> (not res!710948) (not e!607089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94186 (= res!710948 (validMask!0 mask!1515))))

(assert (=> start!94186 e!607089))

(assert (=> start!94186 true))

(assert (=> start!94186 tp_is_empty!25387))

(declare-fun array_inv!25210 (array!67708) Bool)

(assert (=> start!94186 (and (array_inv!25210 _values!955) e!607092)))

(assert (=> start!94186 tp!76168))

(declare-fun array_inv!25211 (array!67710) Bool)

(assert (=> start!94186 (array_inv!25211 _keys!1163)))

(declare-fun mapNonEmpty!39766 () Bool)

(declare-fun tp!76169 () Bool)

(assert (=> mapNonEmpty!39766 (= mapRes!39766 (and tp!76169 e!607090))))

(declare-fun mapKey!39766 () (_ BitVec 32))

(declare-fun mapRest!39766 () (Array (_ BitVec 32) ValueCell!11990))

(declare-fun mapValue!39766 () ValueCell!11990)

(assert (=> mapNonEmpty!39766 (= (arr!32557 _values!955) (store mapRest!39766 mapKey!39766 mapValue!39766))))

(declare-fun b!1065023 () Bool)

(assert (=> b!1065023 (= e!607088 (= lt!469404 lt!469401))))

(declare-fun b!1065024 () Bool)

(declare-fun res!710945 () Bool)

(assert (=> b!1065024 (=> (not res!710945) (not e!607089))))

(declare-datatypes ((List!22753 0))(
  ( (Nil!22750) (Cons!22749 (h!23958 (_ BitVec 64)) (t!32063 List!22753)) )
))
(declare-fun arrayNoDuplicates!0 (array!67710 (_ BitVec 32) List!22753) Bool)

(assert (=> b!1065024 (= res!710945 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22750))))

(declare-fun mapIsEmpty!39766 () Bool)

(assert (=> mapIsEmpty!39766 mapRes!39766))

(declare-fun b!1065025 () Bool)

(declare-fun res!710946 () Bool)

(assert (=> b!1065025 (=> (not res!710946) (not e!607089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67710 (_ BitVec 32)) Bool)

(assert (=> b!1065025 (= res!710946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94186 res!710948) b!1065018))

(assert (= (and b!1065018 res!710944) b!1065025))

(assert (= (and b!1065025 res!710946) b!1065024))

(assert (= (and b!1065024 res!710945) b!1065019))

(assert (= (and b!1065019 (not res!710949)) b!1065017))

(assert (= (and b!1065017 res!710947) b!1065023))

(assert (= (and b!1065020 condMapEmpty!39766) mapIsEmpty!39766))

(assert (= (and b!1065020 (not condMapEmpty!39766)) mapNonEmpty!39766))

(get-info :version)

(assert (= (and mapNonEmpty!39766 ((_ is ValueCellFull!11990) mapValue!39766)) b!1065021))

(assert (= (and b!1065020 ((_ is ValueCellFull!11990) mapDefault!39766)) b!1065022))

(assert (= start!94186 b!1065020))

(declare-fun m!982955 () Bool)

(assert (=> b!1065019 m!982955))

(declare-fun m!982957 () Bool)

(assert (=> b!1065019 m!982957))

(declare-fun m!982959 () Bool)

(assert (=> b!1065019 m!982959))

(declare-fun m!982961 () Bool)

(assert (=> mapNonEmpty!39766 m!982961))

(declare-fun m!982963 () Bool)

(assert (=> start!94186 m!982963))

(declare-fun m!982965 () Bool)

(assert (=> start!94186 m!982965))

(declare-fun m!982967 () Bool)

(assert (=> start!94186 m!982967))

(declare-fun m!982969 () Bool)

(assert (=> b!1065024 m!982969))

(declare-fun m!982971 () Bool)

(assert (=> b!1065025 m!982971))

(declare-fun m!982973 () Bool)

(assert (=> b!1065017 m!982973))

(declare-fun m!982975 () Bool)

(assert (=> b!1065017 m!982975))

(declare-fun m!982977 () Bool)

(assert (=> b!1065017 m!982977))

(declare-fun m!982979 () Bool)

(assert (=> b!1065017 m!982979))

(check-sat (not mapNonEmpty!39766) tp_is_empty!25387 (not b_next!21577) (not b!1065019) (not b!1065025) (not b!1065024) (not b!1065017) b_and!34311 (not start!94186))
(check-sat b_and!34311 (not b_next!21577))
