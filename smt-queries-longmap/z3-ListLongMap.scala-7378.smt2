; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94002 () Bool)

(assert start!94002)

(declare-fun b_free!21445 () Bool)

(declare-fun b_next!21445 () Bool)

(assert (=> start!94002 (= b_free!21445 (not b_next!21445))))

(declare-fun tp!75763 () Bool)

(declare-fun b_and!34151 () Bool)

(assert (=> start!94002 (= tp!75763 b_and!34151)))

(declare-fun mapIsEmpty!39559 () Bool)

(declare-fun mapRes!39559 () Bool)

(assert (=> mapIsEmpty!39559 mapRes!39559))

(declare-fun b!1063088 () Bool)

(declare-fun res!709849 () Bool)

(declare-fun e!605699 () Bool)

(assert (=> b!1063088 (=> (not res!709849) (not e!605699))))

(declare-datatypes ((array!67450 0))(
  ( (array!67451 (arr!32431 (Array (_ BitVec 32) (_ BitVec 64))) (size!32969 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67450)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67450 (_ BitVec 32)) Bool)

(assert (=> b!1063088 (= res!709849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063089 () Bool)

(declare-fun e!605697 () Bool)

(declare-fun e!605698 () Bool)

(assert (=> b!1063089 (= e!605697 (and e!605698 mapRes!39559))))

(declare-fun condMapEmpty!39559 () Bool)

(declare-datatypes ((V!38809 0))(
  ( (V!38810 (val!12678 Int)) )
))
(declare-datatypes ((ValueCell!11924 0))(
  ( (ValueCellFull!11924 (v!15288 V!38809)) (EmptyCell!11924) )
))
(declare-datatypes ((array!67452 0))(
  ( (array!67453 (arr!32432 (Array (_ BitVec 32) ValueCell!11924)) (size!32970 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67452)

(declare-fun mapDefault!39559 () ValueCell!11924)

(assert (=> b!1063089 (= condMapEmpty!39559 (= (arr!32432 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11924)) mapDefault!39559)))))

(declare-fun b!1063090 () Bool)

(declare-fun e!605702 () Bool)

(declare-fun tp_is_empty!25255 () Bool)

(assert (=> b!1063090 (= e!605702 tp_is_empty!25255)))

(declare-fun b!1063091 () Bool)

(declare-fun e!605701 () Bool)

(declare-fun e!605700 () Bool)

(assert (=> b!1063091 (= e!605701 e!605700)))

(declare-fun res!709854 () Bool)

(assert (=> b!1063091 (=> res!709854 e!605700)))

(declare-datatypes ((tuple2!16112 0))(
  ( (tuple2!16113 (_1!8067 (_ BitVec 64)) (_2!8067 V!38809)) )
))
(declare-datatypes ((List!22660 0))(
  ( (Nil!22657) (Cons!22656 (h!23865 tuple2!16112) (t!31964 List!22660)) )
))
(declare-datatypes ((ListLongMap!14081 0))(
  ( (ListLongMap!14082 (toList!7056 List!22660)) )
))
(declare-fun lt!468385 () ListLongMap!14081)

(declare-fun contains!6225 (ListLongMap!14081 (_ BitVec 64)) Bool)

(assert (=> b!1063091 (= res!709854 (contains!6225 lt!468385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38809)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38809)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3956 (array!67450 array!67452 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14081)

(assert (=> b!1063091 (= lt!468385 (getCurrentListMap!3956 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063092 () Bool)

(assert (=> b!1063092 (= e!605700 true)))

(declare-fun -!574 (ListLongMap!14081 (_ BitVec 64)) ListLongMap!14081)

(assert (=> b!1063092 (= (-!574 lt!468385 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468385)))

(declare-datatypes ((Unit!34701 0))(
  ( (Unit!34702) )
))
(declare-fun lt!468383 () Unit!34701)

(declare-fun removeNotPresentStillSame!26 (ListLongMap!14081 (_ BitVec 64)) Unit!34701)

(assert (=> b!1063092 (= lt!468383 (removeNotPresentStillSame!26 lt!468385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063093 () Bool)

(assert (=> b!1063093 (= e!605699 (not e!605701))))

(declare-fun res!709851 () Bool)

(assert (=> b!1063093 (=> res!709851 e!605701)))

(assert (=> b!1063093 (= res!709851 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468384 () ListLongMap!14081)

(declare-fun lt!468381 () ListLongMap!14081)

(assert (=> b!1063093 (= lt!468384 lt!468381)))

(declare-fun lt!468382 () Unit!34701)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38809)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!656 (array!67450 array!67452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 V!38809 V!38809 (_ BitVec 32) Int) Unit!34701)

(assert (=> b!1063093 (= lt!468382 (lemmaNoChangeToArrayThenSameMapNoExtras!656 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3662 (array!67450 array!67452 (_ BitVec 32) (_ BitVec 32) V!38809 V!38809 (_ BitVec 32) Int) ListLongMap!14081)

(assert (=> b!1063093 (= lt!468381 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063093 (= lt!468384 (getCurrentListMapNoExtraKeys!3662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063094 () Bool)

(declare-fun res!709852 () Bool)

(assert (=> b!1063094 (=> (not res!709852) (not e!605699))))

(declare-datatypes ((List!22661 0))(
  ( (Nil!22658) (Cons!22657 (h!23866 (_ BitVec 64)) (t!31965 List!22661)) )
))
(declare-fun arrayNoDuplicates!0 (array!67450 (_ BitVec 32) List!22661) Bool)

(assert (=> b!1063094 (= res!709852 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22658))))

(declare-fun res!709850 () Bool)

(assert (=> start!94002 (=> (not res!709850) (not e!605699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94002 (= res!709850 (validMask!0 mask!1515))))

(assert (=> start!94002 e!605699))

(assert (=> start!94002 true))

(assert (=> start!94002 tp_is_empty!25255))

(declare-fun array_inv!25124 (array!67452) Bool)

(assert (=> start!94002 (and (array_inv!25124 _values!955) e!605697)))

(assert (=> start!94002 tp!75763))

(declare-fun array_inv!25125 (array!67450) Bool)

(assert (=> start!94002 (array_inv!25125 _keys!1163)))

(declare-fun b!1063095 () Bool)

(assert (=> b!1063095 (= e!605698 tp_is_empty!25255)))

(declare-fun mapNonEmpty!39559 () Bool)

(declare-fun tp!75764 () Bool)

(assert (=> mapNonEmpty!39559 (= mapRes!39559 (and tp!75764 e!605702))))

(declare-fun mapKey!39559 () (_ BitVec 32))

(declare-fun mapValue!39559 () ValueCell!11924)

(declare-fun mapRest!39559 () (Array (_ BitVec 32) ValueCell!11924))

(assert (=> mapNonEmpty!39559 (= (arr!32432 _values!955) (store mapRest!39559 mapKey!39559 mapValue!39559))))

(declare-fun b!1063096 () Bool)

(declare-fun res!709853 () Bool)

(assert (=> b!1063096 (=> (not res!709853) (not e!605699))))

(assert (=> b!1063096 (= res!709853 (and (= (size!32970 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32969 _keys!1163) (size!32970 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94002 res!709850) b!1063096))

(assert (= (and b!1063096 res!709853) b!1063088))

(assert (= (and b!1063088 res!709849) b!1063094))

(assert (= (and b!1063094 res!709852) b!1063093))

(assert (= (and b!1063093 (not res!709851)) b!1063091))

(assert (= (and b!1063091 (not res!709854)) b!1063092))

(assert (= (and b!1063089 condMapEmpty!39559) mapIsEmpty!39559))

(assert (= (and b!1063089 (not condMapEmpty!39559)) mapNonEmpty!39559))

(get-info :version)

(assert (= (and mapNonEmpty!39559 ((_ is ValueCellFull!11924) mapValue!39559)) b!1063090))

(assert (= (and b!1063089 ((_ is ValueCellFull!11924) mapDefault!39559)) b!1063095))

(assert (= start!94002 b!1063089))

(declare-fun m!981313 () Bool)

(assert (=> b!1063093 m!981313))

(declare-fun m!981315 () Bool)

(assert (=> b!1063093 m!981315))

(declare-fun m!981317 () Bool)

(assert (=> b!1063093 m!981317))

(declare-fun m!981319 () Bool)

(assert (=> b!1063092 m!981319))

(declare-fun m!981321 () Bool)

(assert (=> b!1063092 m!981321))

(declare-fun m!981323 () Bool)

(assert (=> b!1063088 m!981323))

(declare-fun m!981325 () Bool)

(assert (=> b!1063094 m!981325))

(declare-fun m!981327 () Bool)

(assert (=> start!94002 m!981327))

(declare-fun m!981329 () Bool)

(assert (=> start!94002 m!981329))

(declare-fun m!981331 () Bool)

(assert (=> start!94002 m!981331))

(declare-fun m!981333 () Bool)

(assert (=> b!1063091 m!981333))

(declare-fun m!981335 () Bool)

(assert (=> b!1063091 m!981335))

(declare-fun m!981337 () Bool)

(assert (=> mapNonEmpty!39559 m!981337))

(check-sat (not b_next!21445) (not b!1063091) (not b!1063094) (not b!1063093) (not mapNonEmpty!39559) (not b!1063092) (not b!1063088) (not start!94002) b_and!34151 tp_is_empty!25255)
(check-sat b_and!34151 (not b_next!21445))
