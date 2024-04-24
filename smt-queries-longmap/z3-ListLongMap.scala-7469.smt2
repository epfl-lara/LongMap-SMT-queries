; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94974 () Bool)

(assert start!94974)

(declare-fun b_free!21991 () Bool)

(declare-fun b_next!21991 () Bool)

(assert (=> start!94974 (= b_free!21991 (not b_next!21991))))

(declare-fun tp!77431 () Bool)

(declare-fun b_and!34831 () Bool)

(assert (=> start!94974 (= tp!77431 b_and!34831)))

(declare-fun b!1072510 () Bool)

(declare-fun res!715091 () Bool)

(declare-fun e!612455 () Bool)

(assert (=> b!1072510 (=> (not res!715091) (not e!612455))))

(declare-datatypes ((array!68615 0))(
  ( (array!68616 (arr!32997 (Array (_ BitVec 32) (_ BitVec 64))) (size!33534 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68615)

(declare-datatypes ((List!23013 0))(
  ( (Nil!23010) (Cons!23009 (h!24227 (_ BitVec 64)) (t!32338 List!23013)) )
))
(declare-fun arrayNoDuplicates!0 (array!68615 (_ BitVec 32) List!23013) Bool)

(assert (=> b!1072510 (= res!715091 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23010))))

(declare-fun b!1072511 () Bool)

(declare-fun res!715092 () Bool)

(assert (=> b!1072511 (=> (not res!715092) (not e!612455))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68615 (_ BitVec 32)) Bool)

(assert (=> b!1072511 (= res!715092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072512 () Bool)

(declare-fun res!715096 () Bool)

(assert (=> b!1072512 (=> (not res!715096) (not e!612455))))

(declare-datatypes ((V!39537 0))(
  ( (V!39538 (val!12951 Int)) )
))
(declare-datatypes ((ValueCell!12197 0))(
  ( (ValueCellFull!12197 (v!15563 V!39537)) (EmptyCell!12197) )
))
(declare-datatypes ((array!68617 0))(
  ( (array!68618 (arr!32998 (Array (_ BitVec 32) ValueCell!12197)) (size!33535 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68617)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072512 (= res!715096 (and (= (size!33535 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33534 _keys!1163) (size!33535 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072513 () Bool)

(declare-fun e!612450 () Bool)

(declare-fun e!612453 () Bool)

(declare-fun mapRes!40408 () Bool)

(assert (=> b!1072513 (= e!612450 (and e!612453 mapRes!40408))))

(declare-fun condMapEmpty!40408 () Bool)

(declare-fun mapDefault!40408 () ValueCell!12197)

(assert (=> b!1072513 (= condMapEmpty!40408 (= (arr!32998 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12197)) mapDefault!40408)))))

(declare-fun mapNonEmpty!40408 () Bool)

(declare-fun tp!77432 () Bool)

(declare-fun e!612454 () Bool)

(assert (=> mapNonEmpty!40408 (= mapRes!40408 (and tp!77432 e!612454))))

(declare-fun mapRest!40408 () (Array (_ BitVec 32) ValueCell!12197))

(declare-fun mapKey!40408 () (_ BitVec 32))

(declare-fun mapValue!40408 () ValueCell!12197)

(assert (=> mapNonEmpty!40408 (= (arr!32998 _values!955) (store mapRest!40408 mapKey!40408 mapValue!40408))))

(declare-fun b!1072514 () Bool)

(declare-fun tp_is_empty!25801 () Bool)

(assert (=> b!1072514 (= e!612453 tp_is_empty!25801)))

(declare-datatypes ((tuple2!16452 0))(
  ( (tuple2!16453 (_1!8237 (_ BitVec 64)) (_2!8237 V!39537)) )
))
(declare-fun lt!474229 () tuple2!16452)

(declare-datatypes ((List!23014 0))(
  ( (Nil!23011) (Cons!23010 (h!24228 tuple2!16452) (t!32339 List!23014)) )
))
(declare-datatypes ((ListLongMap!14429 0))(
  ( (ListLongMap!14430 (toList!7230 List!23014)) )
))
(declare-fun lt!474225 () ListLongMap!14429)

(declare-fun lt!474230 () ListLongMap!14429)

(declare-fun b!1072515 () Bool)

(declare-fun e!612451 () Bool)

(declare-fun +!3194 (ListLongMap!14429 tuple2!16452) ListLongMap!14429)

(assert (=> b!1072515 (= e!612451 (= lt!474230 (+!3194 lt!474225 lt!474229)))))

(declare-fun b!1072516 () Bool)

(assert (=> b!1072516 (= e!612454 tp_is_empty!25801)))

(declare-fun b!1072517 () Bool)

(declare-fun e!612449 () Bool)

(assert (=> b!1072517 (= e!612449 true)))

(declare-fun lt!474224 () ListLongMap!14429)

(declare-fun lt!474226 () ListLongMap!14429)

(declare-fun -!667 (ListLongMap!14429 (_ BitVec 64)) ListLongMap!14429)

(assert (=> b!1072517 (= lt!474224 (-!667 lt!474226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474227 () ListLongMap!14429)

(declare-fun lt!474232 () ListLongMap!14429)

(assert (=> b!1072517 (= lt!474227 lt!474232)))

(declare-fun lt!474231 () ListLongMap!14429)

(declare-fun minValue!907 () V!39537)

(declare-fun zeroValueBefore!47 () V!39537)

(declare-datatypes ((Unit!35247 0))(
  ( (Unit!35248) )
))
(declare-fun lt!474234 () Unit!35247)

(declare-fun addCommutativeForDiffKeys!724 (ListLongMap!14429 (_ BitVec 64) V!39537 (_ BitVec 64) V!39537) Unit!35247)

(assert (=> b!1072517 (= lt!474234 (addCommutativeForDiffKeys!724 lt!474231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474233 () ListLongMap!14429)

(assert (=> b!1072517 (= (-!667 lt!474232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474233)))

(declare-fun lt!474235 () tuple2!16452)

(assert (=> b!1072517 (= lt!474232 (+!3194 lt!474233 lt!474235))))

(declare-fun lt!474228 () Unit!35247)

(declare-fun addThenRemoveForNewKeyIsSame!42 (ListLongMap!14429 (_ BitVec 64) V!39537) Unit!35247)

(assert (=> b!1072517 (= lt!474228 (addThenRemoveForNewKeyIsSame!42 lt!474233 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072517 (= lt!474233 (+!3194 lt!474231 lt!474229))))

(assert (=> b!1072517 e!612451))

(declare-fun res!715095 () Bool)

(assert (=> b!1072517 (=> (not res!715095) (not e!612451))))

(assert (=> b!1072517 (= res!715095 (= lt!474226 lt!474227))))

(assert (=> b!1072517 (= lt!474227 (+!3194 (+!3194 lt!474231 lt!474235) lt!474229))))

(assert (=> b!1072517 (= lt!474229 (tuple2!16453 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072517 (= lt!474235 (tuple2!16453 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39537)

(declare-fun getCurrentListMap!4128 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 (_ BitVec 32) Int) ListLongMap!14429)

(assert (=> b!1072517 (= lt!474230 (getCurrentListMap!4128 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072517 (= lt!474226 (getCurrentListMap!4128 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072518 () Bool)

(assert (=> b!1072518 (= e!612455 (not e!612449))))

(declare-fun res!715094 () Bool)

(assert (=> b!1072518 (=> res!715094 e!612449)))

(assert (=> b!1072518 (= res!715094 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072518 (= lt!474231 lt!474225)))

(declare-fun lt!474223 () Unit!35247)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!840 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 V!39537 V!39537 (_ BitVec 32) Int) Unit!35247)

(assert (=> b!1072518 (= lt!474223 (lemmaNoChangeToArrayThenSameMapNoExtras!840 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3837 (array!68615 array!68617 (_ BitVec 32) (_ BitVec 32) V!39537 V!39537 (_ BitVec 32) Int) ListLongMap!14429)

(assert (=> b!1072518 (= lt!474225 (getCurrentListMapNoExtraKeys!3837 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072518 (= lt!474231 (getCurrentListMapNoExtraKeys!3837 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40408 () Bool)

(assert (=> mapIsEmpty!40408 mapRes!40408))

(declare-fun res!715093 () Bool)

(assert (=> start!94974 (=> (not res!715093) (not e!612455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94974 (= res!715093 (validMask!0 mask!1515))))

(assert (=> start!94974 e!612455))

(assert (=> start!94974 true))

(assert (=> start!94974 tp_is_empty!25801))

(declare-fun array_inv!25548 (array!68617) Bool)

(assert (=> start!94974 (and (array_inv!25548 _values!955) e!612450)))

(assert (=> start!94974 tp!77431))

(declare-fun array_inv!25549 (array!68615) Bool)

(assert (=> start!94974 (array_inv!25549 _keys!1163)))

(assert (= (and start!94974 res!715093) b!1072512))

(assert (= (and b!1072512 res!715096) b!1072511))

(assert (= (and b!1072511 res!715092) b!1072510))

(assert (= (and b!1072510 res!715091) b!1072518))

(assert (= (and b!1072518 (not res!715094)) b!1072517))

(assert (= (and b!1072517 res!715095) b!1072515))

(assert (= (and b!1072513 condMapEmpty!40408) mapIsEmpty!40408))

(assert (= (and b!1072513 (not condMapEmpty!40408)) mapNonEmpty!40408))

(get-info :version)

(assert (= (and mapNonEmpty!40408 ((_ is ValueCellFull!12197) mapValue!40408)) b!1072516))

(assert (= (and b!1072513 ((_ is ValueCellFull!12197) mapDefault!40408)) b!1072514))

(assert (= start!94974 b!1072513))

(declare-fun m!991241 () Bool)

(assert (=> b!1072518 m!991241))

(declare-fun m!991243 () Bool)

(assert (=> b!1072518 m!991243))

(declare-fun m!991245 () Bool)

(assert (=> b!1072518 m!991245))

(declare-fun m!991247 () Bool)

(assert (=> b!1072517 m!991247))

(declare-fun m!991249 () Bool)

(assert (=> b!1072517 m!991249))

(declare-fun m!991251 () Bool)

(assert (=> b!1072517 m!991251))

(declare-fun m!991253 () Bool)

(assert (=> b!1072517 m!991253))

(declare-fun m!991255 () Bool)

(assert (=> b!1072517 m!991255))

(assert (=> b!1072517 m!991247))

(declare-fun m!991257 () Bool)

(assert (=> b!1072517 m!991257))

(declare-fun m!991259 () Bool)

(assert (=> b!1072517 m!991259))

(declare-fun m!991261 () Bool)

(assert (=> b!1072517 m!991261))

(declare-fun m!991263 () Bool)

(assert (=> b!1072517 m!991263))

(declare-fun m!991265 () Bool)

(assert (=> b!1072517 m!991265))

(declare-fun m!991267 () Bool)

(assert (=> b!1072515 m!991267))

(declare-fun m!991269 () Bool)

(assert (=> start!94974 m!991269))

(declare-fun m!991271 () Bool)

(assert (=> start!94974 m!991271))

(declare-fun m!991273 () Bool)

(assert (=> start!94974 m!991273))

(declare-fun m!991275 () Bool)

(assert (=> b!1072510 m!991275))

(declare-fun m!991277 () Bool)

(assert (=> mapNonEmpty!40408 m!991277))

(declare-fun m!991279 () Bool)

(assert (=> b!1072511 m!991279))

(check-sat (not start!94974) (not mapNonEmpty!40408) (not b!1072511) b_and!34831 (not b!1072518) (not b_next!21991) tp_is_empty!25801 (not b!1072510) (not b!1072515) (not b!1072517))
(check-sat b_and!34831 (not b_next!21991))
