; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94320 () Bool)

(assert start!94320)

(declare-fun b_free!21499 () Bool)

(declare-fun b_next!21499 () Bool)

(assert (=> start!94320 (= b_free!21499 (not b_next!21499))))

(declare-fun tp!75928 () Bool)

(declare-fun b_and!34251 () Bool)

(assert (=> start!94320 (= tp!75928 b_and!34251)))

(declare-fun mapIsEmpty!39643 () Bool)

(declare-fun mapRes!39643 () Bool)

(assert (=> mapIsEmpty!39643 mapRes!39643))

(declare-fun b!1065360 () Bool)

(declare-fun res!710896 () Bool)

(declare-fun e!607220 () Bool)

(assert (=> b!1065360 (=> (not res!710896) (not e!607220))))

(declare-datatypes ((array!67663 0))(
  ( (array!67664 (arr!32530 (Array (_ BitVec 32) (_ BitVec 64))) (size!33067 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67663)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67663 (_ BitVec 32)) Bool)

(assert (=> b!1065360 (= res!710896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065361 () Bool)

(declare-fun res!710894 () Bool)

(assert (=> b!1065361 (=> (not res!710894) (not e!607220))))

(declare-datatypes ((V!38881 0))(
  ( (V!38882 (val!12705 Int)) )
))
(declare-datatypes ((ValueCell!11951 0))(
  ( (ValueCellFull!11951 (v!15313 V!38881)) (EmptyCell!11951) )
))
(declare-datatypes ((array!67665 0))(
  ( (array!67666 (arr!32531 (Array (_ BitVec 32) ValueCell!11951)) (size!33068 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67665)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065361 (= res!710894 (and (= (size!33068 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33067 _keys!1163) (size!33068 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065362 () Bool)

(declare-fun e!607217 () Bool)

(declare-fun e!607218 () Bool)

(assert (=> b!1065362 (= e!607217 (and e!607218 mapRes!39643))))

(declare-fun condMapEmpty!39643 () Bool)

(declare-fun mapDefault!39643 () ValueCell!11951)

(assert (=> b!1065362 (= condMapEmpty!39643 (= (arr!32531 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11951)) mapDefault!39643)))))

(declare-fun b!1065363 () Bool)

(declare-fun tp_is_empty!25309 () Bool)

(assert (=> b!1065363 (= e!607218 tp_is_empty!25309)))

(declare-fun res!710895 () Bool)

(assert (=> start!94320 (=> (not res!710895) (not e!607220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94320 (= res!710895 (validMask!0 mask!1515))))

(assert (=> start!94320 e!607220))

(assert (=> start!94320 true))

(assert (=> start!94320 tp_is_empty!25309))

(declare-fun array_inv!25210 (array!67665) Bool)

(assert (=> start!94320 (and (array_inv!25210 _values!955) e!607217)))

(assert (=> start!94320 tp!75928))

(declare-fun array_inv!25211 (array!67663) Bool)

(assert (=> start!94320 (array_inv!25211 _keys!1163)))

(declare-fun b!1065364 () Bool)

(declare-fun res!710893 () Bool)

(assert (=> b!1065364 (=> (not res!710893) (not e!607220))))

(declare-datatypes ((List!22650 0))(
  ( (Nil!22647) (Cons!22646 (h!23864 (_ BitVec 64)) (t!31957 List!22650)) )
))
(declare-fun arrayNoDuplicates!0 (array!67663 (_ BitVec 32) List!22650) Bool)

(assert (=> b!1065364 (= res!710893 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22647))))

(declare-fun b!1065365 () Bool)

(assert (=> b!1065365 (= e!607220 (not true))))

(declare-datatypes ((tuple2!16078 0))(
  ( (tuple2!16079 (_1!8050 (_ BitVec 64)) (_2!8050 V!38881)) )
))
(declare-datatypes ((List!22651 0))(
  ( (Nil!22648) (Cons!22647 (h!23865 tuple2!16078) (t!31958 List!22651)) )
))
(declare-datatypes ((ListLongMap!14055 0))(
  ( (ListLongMap!14056 (toList!7043 List!22651)) )
))
(declare-fun lt!469531 () ListLongMap!14055)

(declare-fun lt!469532 () ListLongMap!14055)

(assert (=> b!1065365 (= lt!469531 lt!469532)))

(declare-fun zeroValueBefore!47 () V!38881)

(declare-datatypes ((Unit!34889 0))(
  ( (Unit!34890) )
))
(declare-fun lt!469533 () Unit!34889)

(declare-fun minValue!907 () V!38881)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38881)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!680 (array!67663 array!67665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 V!38881 V!38881 (_ BitVec 32) Int) Unit!34889)

(assert (=> b!1065365 (= lt!469533 (lemmaNoChangeToArrayThenSameMapNoExtras!680 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3677 (array!67663 array!67665 (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 (_ BitVec 32) Int) ListLongMap!14055)

(assert (=> b!1065365 (= lt!469532 (getCurrentListMapNoExtraKeys!3677 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065365 (= lt!469531 (getCurrentListMapNoExtraKeys!3677 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39643 () Bool)

(declare-fun tp!75929 () Bool)

(declare-fun e!607221 () Bool)

(assert (=> mapNonEmpty!39643 (= mapRes!39643 (and tp!75929 e!607221))))

(declare-fun mapKey!39643 () (_ BitVec 32))

(declare-fun mapRest!39643 () (Array (_ BitVec 32) ValueCell!11951))

(declare-fun mapValue!39643 () ValueCell!11951)

(assert (=> mapNonEmpty!39643 (= (arr!32531 _values!955) (store mapRest!39643 mapKey!39643 mapValue!39643))))

(declare-fun b!1065366 () Bool)

(assert (=> b!1065366 (= e!607221 tp_is_empty!25309)))

(assert (= (and start!94320 res!710895) b!1065361))

(assert (= (and b!1065361 res!710894) b!1065360))

(assert (= (and b!1065360 res!710896) b!1065364))

(assert (= (and b!1065364 res!710893) b!1065365))

(assert (= (and b!1065362 condMapEmpty!39643) mapIsEmpty!39643))

(assert (= (and b!1065362 (not condMapEmpty!39643)) mapNonEmpty!39643))

(get-info :version)

(assert (= (and mapNonEmpty!39643 ((_ is ValueCellFull!11951) mapValue!39643)) b!1065366))

(assert (= (and b!1065362 ((_ is ValueCellFull!11951) mapDefault!39643)) b!1065363))

(assert (= start!94320 b!1065362))

(declare-fun m!984319 () Bool)

(assert (=> start!94320 m!984319))

(declare-fun m!984321 () Bool)

(assert (=> start!94320 m!984321))

(declare-fun m!984323 () Bool)

(assert (=> start!94320 m!984323))

(declare-fun m!984325 () Bool)

(assert (=> b!1065365 m!984325))

(declare-fun m!984327 () Bool)

(assert (=> b!1065365 m!984327))

(declare-fun m!984329 () Bool)

(assert (=> b!1065365 m!984329))

(declare-fun m!984331 () Bool)

(assert (=> b!1065364 m!984331))

(declare-fun m!984333 () Bool)

(assert (=> mapNonEmpty!39643 m!984333))

(declare-fun m!984335 () Bool)

(assert (=> b!1065360 m!984335))

(check-sat (not mapNonEmpty!39643) tp_is_empty!25309 (not b!1065364) (not b!1065365) (not b_next!21499) (not b!1065360) b_and!34251 (not start!94320))
(check-sat b_and!34251 (not b_next!21499))
