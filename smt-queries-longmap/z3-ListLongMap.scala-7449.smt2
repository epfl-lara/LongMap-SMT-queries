; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94582 () Bool)

(assert start!94582)

(declare-fun b_free!21871 () Bool)

(declare-fun b_next!21871 () Bool)

(assert (=> start!94582 (= b_free!21871 (not b_next!21871))))

(declare-fun tp!77065 () Bool)

(declare-fun b_and!34657 () Bool)

(assert (=> start!94582 (= tp!77065 b_and!34657)))

(declare-fun mapIsEmpty!40222 () Bool)

(declare-fun mapRes!40222 () Bool)

(assert (=> mapIsEmpty!40222 mapRes!40222))

(declare-fun b!1069380 () Bool)

(declare-fun e!610296 () Bool)

(assert (=> b!1069380 (= e!610296 (not true))))

(declare-datatypes ((V!39377 0))(
  ( (V!39378 (val!12891 Int)) )
))
(declare-datatypes ((tuple2!16442 0))(
  ( (tuple2!16443 (_1!8232 (_ BitVec 64)) (_2!8232 V!39377)) )
))
(declare-datatypes ((List!22973 0))(
  ( (Nil!22970) (Cons!22969 (h!24178 tuple2!16442) (t!32293 List!22973)) )
))
(declare-datatypes ((ListLongMap!14411 0))(
  ( (ListLongMap!14412 (toList!7221 List!22973)) )
))
(declare-fun lt!472453 () ListLongMap!14411)

(declare-fun lt!472452 () ListLongMap!14411)

(assert (=> b!1069380 (= lt!472453 lt!472452)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12137 0))(
  ( (ValueCellFull!12137 (v!15506 V!39377)) (EmptyCell!12137) )
))
(declare-datatypes ((array!68284 0))(
  ( (array!68285 (arr!32840 (Array (_ BitVec 32) ValueCell!12137)) (size!33378 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68284)

(declare-fun minValue!907 () V!39377)

(declare-fun zeroValueBefore!47 () V!39377)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39377)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68286 0))(
  ( (array!68287 (arr!32841 (Array (_ BitVec 32) (_ BitVec 64))) (size!33379 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68286)

(declare-datatypes ((Unit!35030 0))(
  ( (Unit!35031) )
))
(declare-fun lt!472451 () Unit!35030)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!804 (array!68286 array!68284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39377 V!39377 V!39377 V!39377 (_ BitVec 32) Int) Unit!35030)

(assert (=> b!1069380 (= lt!472451 (lemmaNoChangeToArrayThenSameMapNoExtras!804 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3810 (array!68286 array!68284 (_ BitVec 32) (_ BitVec 32) V!39377 V!39377 (_ BitVec 32) Int) ListLongMap!14411)

(assert (=> b!1069380 (= lt!472452 (getCurrentListMapNoExtraKeys!3810 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069380 (= lt!472453 (getCurrentListMapNoExtraKeys!3810 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069381 () Bool)

(declare-fun res!713534 () Bool)

(assert (=> b!1069381 (=> (not res!713534) (not e!610296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68286 (_ BitVec 32)) Bool)

(assert (=> b!1069381 (= res!713534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069382 () Bool)

(declare-fun res!713535 () Bool)

(assert (=> b!1069382 (=> (not res!713535) (not e!610296))))

(declare-datatypes ((List!22974 0))(
  ( (Nil!22971) (Cons!22970 (h!24179 (_ BitVec 64)) (t!32294 List!22974)) )
))
(declare-fun arrayNoDuplicates!0 (array!68286 (_ BitVec 32) List!22974) Bool)

(assert (=> b!1069382 (= res!713535 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22971))))

(declare-fun b!1069383 () Bool)

(declare-fun e!610297 () Bool)

(declare-fun e!610299 () Bool)

(assert (=> b!1069383 (= e!610297 (and e!610299 mapRes!40222))))

(declare-fun condMapEmpty!40222 () Bool)

(declare-fun mapDefault!40222 () ValueCell!12137)

(assert (=> b!1069383 (= condMapEmpty!40222 (= (arr!32840 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12137)) mapDefault!40222)))))

(declare-fun b!1069384 () Bool)

(declare-fun tp_is_empty!25681 () Bool)

(assert (=> b!1069384 (= e!610299 tp_is_empty!25681)))

(declare-fun b!1069385 () Bool)

(declare-fun e!610295 () Bool)

(assert (=> b!1069385 (= e!610295 tp_is_empty!25681)))

(declare-fun b!1069386 () Bool)

(declare-fun res!713537 () Bool)

(assert (=> b!1069386 (=> (not res!713537) (not e!610296))))

(assert (=> b!1069386 (= res!713537 (and (= (size!33378 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33379 _keys!1163) (size!33378 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40222 () Bool)

(declare-fun tp!77066 () Bool)

(assert (=> mapNonEmpty!40222 (= mapRes!40222 (and tp!77066 e!610295))))

(declare-fun mapValue!40222 () ValueCell!12137)

(declare-fun mapRest!40222 () (Array (_ BitVec 32) ValueCell!12137))

(declare-fun mapKey!40222 () (_ BitVec 32))

(assert (=> mapNonEmpty!40222 (= (arr!32840 _values!955) (store mapRest!40222 mapKey!40222 mapValue!40222))))

(declare-fun res!713536 () Bool)

(assert (=> start!94582 (=> (not res!713536) (not e!610296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94582 (= res!713536 (validMask!0 mask!1515))))

(assert (=> start!94582 e!610296))

(assert (=> start!94582 true))

(assert (=> start!94582 tp_is_empty!25681))

(declare-fun array_inv!25416 (array!68284) Bool)

(assert (=> start!94582 (and (array_inv!25416 _values!955) e!610297)))

(assert (=> start!94582 tp!77065))

(declare-fun array_inv!25417 (array!68286) Bool)

(assert (=> start!94582 (array_inv!25417 _keys!1163)))

(assert (= (and start!94582 res!713536) b!1069386))

(assert (= (and b!1069386 res!713537) b!1069381))

(assert (= (and b!1069381 res!713534) b!1069382))

(assert (= (and b!1069382 res!713535) b!1069380))

(assert (= (and b!1069383 condMapEmpty!40222) mapIsEmpty!40222))

(assert (= (and b!1069383 (not condMapEmpty!40222)) mapNonEmpty!40222))

(get-info :version)

(assert (= (and mapNonEmpty!40222 ((_ is ValueCellFull!12137) mapValue!40222)) b!1069385))

(assert (= (and b!1069383 ((_ is ValueCellFull!12137) mapDefault!40222)) b!1069384))

(assert (= start!94582 b!1069383))

(declare-fun m!987403 () Bool)

(assert (=> b!1069380 m!987403))

(declare-fun m!987405 () Bool)

(assert (=> b!1069380 m!987405))

(declare-fun m!987407 () Bool)

(assert (=> b!1069380 m!987407))

(declare-fun m!987409 () Bool)

(assert (=> mapNonEmpty!40222 m!987409))

(declare-fun m!987411 () Bool)

(assert (=> b!1069382 m!987411))

(declare-fun m!987413 () Bool)

(assert (=> start!94582 m!987413))

(declare-fun m!987415 () Bool)

(assert (=> start!94582 m!987415))

(declare-fun m!987417 () Bool)

(assert (=> start!94582 m!987417))

(declare-fun m!987419 () Bool)

(assert (=> b!1069381 m!987419))

(check-sat (not b!1069380) (not b!1069381) (not b_next!21871) (not start!94582) (not b!1069382) b_and!34657 tp_is_empty!25681 (not mapNonEmpty!40222))
(check-sat b_and!34657 (not b_next!21871))
