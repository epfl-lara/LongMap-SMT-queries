; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95094 () Bool)

(assert start!95094)

(declare-fun b_free!22191 () Bool)

(declare-fun b_next!22191 () Bool)

(assert (=> start!95094 (= b_free!22191 (not b_next!22191))))

(declare-fun tp!78055 () Bool)

(declare-fun b_and!35111 () Bool)

(assert (=> start!95094 (= tp!78055 b_and!35111)))

(declare-fun b!1074991 () Bool)

(declare-fun e!614314 () Bool)

(declare-fun e!614315 () Bool)

(declare-fun mapRes!40732 () Bool)

(assert (=> b!1074991 (= e!614314 (and e!614315 mapRes!40732))))

(declare-fun condMapEmpty!40732 () Bool)

(declare-datatypes ((V!39803 0))(
  ( (V!39804 (val!13051 Int)) )
))
(declare-datatypes ((ValueCell!12297 0))(
  ( (ValueCellFull!12297 (v!15674 V!39803)) (EmptyCell!12297) )
))
(declare-datatypes ((array!68971 0))(
  ( (array!68972 (arr!33173 (Array (_ BitVec 32) ValueCell!12297)) (size!33709 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68971)

(declare-fun mapDefault!40732 () ValueCell!12297)

(assert (=> b!1074991 (= condMapEmpty!40732 (= (arr!33173 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12297)) mapDefault!40732)))))

(declare-fun b!1074992 () Bool)

(declare-fun tp_is_empty!26001 () Bool)

(assert (=> b!1074992 (= e!614315 tp_is_empty!26001)))

(declare-fun b!1074993 () Bool)

(declare-fun res!716706 () Bool)

(declare-fun e!614318 () Bool)

(assert (=> b!1074993 (=> (not res!716706) (not e!614318))))

(declare-datatypes ((array!68973 0))(
  ( (array!68974 (arr!33174 (Array (_ BitVec 32) (_ BitVec 64))) (size!33710 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68973)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68973 (_ BitVec 32)) Bool)

(assert (=> b!1074993 (= res!716706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074994 () Bool)

(declare-fun e!614317 () Bool)

(declare-datatypes ((tuple2!16628 0))(
  ( (tuple2!16629 (_1!8325 (_ BitVec 64)) (_2!8325 V!39803)) )
))
(declare-datatypes ((List!23163 0))(
  ( (Nil!23160) (Cons!23159 (h!24368 tuple2!16628) (t!32512 List!23163)) )
))
(declare-datatypes ((ListLongMap!14597 0))(
  ( (ListLongMap!14598 (toList!7314 List!23163)) )
))
(declare-fun lt!477054 () ListLongMap!14597)

(declare-fun lt!477055 () ListLongMap!14597)

(declare-fun -!710 (ListLongMap!14597 (_ BitVec 64)) ListLongMap!14597)

(assert (=> b!1074994 (= e!614317 (= (-!710 lt!477054 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477055))))

(declare-fun lt!477052 () ListLongMap!14597)

(declare-fun lt!477051 () ListLongMap!14597)

(assert (=> b!1074994 (= (-!710 lt!477052 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477051)))

(declare-datatypes ((Unit!35396 0))(
  ( (Unit!35397) )
))
(declare-fun lt!477050 () Unit!35396)

(declare-fun zeroValueBefore!47 () V!39803)

(declare-fun addThenRemoveForNewKeyIsSame!77 (ListLongMap!14597 (_ BitVec 64) V!39803) Unit!35396)

(assert (=> b!1074994 (= lt!477050 (addThenRemoveForNewKeyIsSame!77 lt!477051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!477053 () ListLongMap!14597)

(assert (=> b!1074994 (and (= lt!477054 lt!477052) (= lt!477055 lt!477053))))

(declare-fun +!3222 (ListLongMap!14597 tuple2!16628) ListLongMap!14597)

(assert (=> b!1074994 (= lt!477052 (+!3222 lt!477051 (tuple2!16629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39803)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39803)

(declare-fun getCurrentListMap!4183 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) V!39803 V!39803 (_ BitVec 32) Int) ListLongMap!14597)

(assert (=> b!1074994 (= lt!477055 (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074994 (= lt!477054 (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40732 () Bool)

(declare-fun tp!78056 () Bool)

(declare-fun e!614316 () Bool)

(assert (=> mapNonEmpty!40732 (= mapRes!40732 (and tp!78056 e!614316))))

(declare-fun mapKey!40732 () (_ BitVec 32))

(declare-fun mapRest!40732 () (Array (_ BitVec 32) ValueCell!12297))

(declare-fun mapValue!40732 () ValueCell!12297)

(assert (=> mapNonEmpty!40732 (= (arr!33173 _values!955) (store mapRest!40732 mapKey!40732 mapValue!40732))))

(declare-fun b!1074995 () Bool)

(assert (=> b!1074995 (= e!614318 (not e!614317))))

(declare-fun res!716704 () Bool)

(assert (=> b!1074995 (=> res!716704 e!614317)))

(assert (=> b!1074995 (= res!716704 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074995 (= lt!477051 lt!477053)))

(declare-fun lt!477056 () Unit!35396)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!893 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39803 V!39803 V!39803 V!39803 (_ BitVec 32) Int) Unit!35396)

(assert (=> b!1074995 (= lt!477056 (lemmaNoChangeToArrayThenSameMapNoExtras!893 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3877 (array!68973 array!68971 (_ BitVec 32) (_ BitVec 32) V!39803 V!39803 (_ BitVec 32) Int) ListLongMap!14597)

(assert (=> b!1074995 (= lt!477053 (getCurrentListMapNoExtraKeys!3877 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074995 (= lt!477051 (getCurrentListMapNoExtraKeys!3877 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!716703 () Bool)

(assert (=> start!95094 (=> (not res!716703) (not e!614318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95094 (= res!716703 (validMask!0 mask!1515))))

(assert (=> start!95094 e!614318))

(assert (=> start!95094 true))

(assert (=> start!95094 tp_is_empty!26001))

(declare-fun array_inv!25638 (array!68971) Bool)

(assert (=> start!95094 (and (array_inv!25638 _values!955) e!614314)))

(assert (=> start!95094 tp!78055))

(declare-fun array_inv!25639 (array!68973) Bool)

(assert (=> start!95094 (array_inv!25639 _keys!1163)))

(declare-fun b!1074996 () Bool)

(declare-fun res!716705 () Bool)

(assert (=> b!1074996 (=> (not res!716705) (not e!614318))))

(assert (=> b!1074996 (= res!716705 (and (= (size!33709 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33710 _keys!1163) (size!33709 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074997 () Bool)

(assert (=> b!1074997 (= e!614316 tp_is_empty!26001)))

(declare-fun b!1074998 () Bool)

(declare-fun res!716707 () Bool)

(assert (=> b!1074998 (=> (not res!716707) (not e!614318))))

(declare-datatypes ((List!23164 0))(
  ( (Nil!23161) (Cons!23160 (h!24369 (_ BitVec 64)) (t!32513 List!23164)) )
))
(declare-fun arrayNoDuplicates!0 (array!68973 (_ BitVec 32) List!23164) Bool)

(assert (=> b!1074998 (= res!716707 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23161))))

(declare-fun mapIsEmpty!40732 () Bool)

(assert (=> mapIsEmpty!40732 mapRes!40732))

(assert (= (and start!95094 res!716703) b!1074996))

(assert (= (and b!1074996 res!716705) b!1074993))

(assert (= (and b!1074993 res!716706) b!1074998))

(assert (= (and b!1074998 res!716707) b!1074995))

(assert (= (and b!1074995 (not res!716704)) b!1074994))

(assert (= (and b!1074991 condMapEmpty!40732) mapIsEmpty!40732))

(assert (= (and b!1074991 (not condMapEmpty!40732)) mapNonEmpty!40732))

(get-info :version)

(assert (= (and mapNonEmpty!40732 ((_ is ValueCellFull!12297) mapValue!40732)) b!1074997))

(assert (= (and b!1074991 ((_ is ValueCellFull!12297) mapDefault!40732)) b!1074992))

(assert (= start!95094 b!1074991))

(declare-fun m!993835 () Bool)

(assert (=> start!95094 m!993835))

(declare-fun m!993837 () Bool)

(assert (=> start!95094 m!993837))

(declare-fun m!993839 () Bool)

(assert (=> start!95094 m!993839))

(declare-fun m!993841 () Bool)

(assert (=> b!1074993 m!993841))

(declare-fun m!993843 () Bool)

(assert (=> b!1074998 m!993843))

(declare-fun m!993845 () Bool)

(assert (=> mapNonEmpty!40732 m!993845))

(declare-fun m!993847 () Bool)

(assert (=> b!1074994 m!993847))

(declare-fun m!993849 () Bool)

(assert (=> b!1074994 m!993849))

(declare-fun m!993851 () Bool)

(assert (=> b!1074994 m!993851))

(declare-fun m!993853 () Bool)

(assert (=> b!1074994 m!993853))

(declare-fun m!993855 () Bool)

(assert (=> b!1074994 m!993855))

(declare-fun m!993857 () Bool)

(assert (=> b!1074994 m!993857))

(declare-fun m!993859 () Bool)

(assert (=> b!1074995 m!993859))

(declare-fun m!993861 () Bool)

(assert (=> b!1074995 m!993861))

(declare-fun m!993863 () Bool)

(assert (=> b!1074995 m!993863))

(check-sat (not start!95094) (not b!1074994) tp_is_empty!26001 (not b_next!22191) (not b!1074998) (not mapNonEmpty!40732) b_and!35111 (not b!1074995) (not b!1074993))
(check-sat b_and!35111 (not b_next!22191))
