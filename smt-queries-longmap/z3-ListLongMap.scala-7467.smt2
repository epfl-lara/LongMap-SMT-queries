; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94720 () Bool)

(assert start!94720)

(declare-fun b_free!21979 () Bool)

(declare-fun b_next!21979 () Bool)

(assert (=> start!94720 (= b_free!21979 (not b_next!21979))))

(declare-fun tp!77395 () Bool)

(declare-fun b_and!34783 () Bool)

(assert (=> start!94720 (= tp!77395 b_and!34783)))

(declare-fun b!1070868 () Bool)

(declare-fun res!714393 () Bool)

(declare-fun e!611378 () Bool)

(assert (=> b!1070868 (=> (not res!714393) (not e!611378))))

(declare-datatypes ((array!68490 0))(
  ( (array!68491 (arr!32941 (Array (_ BitVec 32) (_ BitVec 64))) (size!33479 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68490)

(declare-datatypes ((List!23045 0))(
  ( (Nil!23042) (Cons!23041 (h!24250 (_ BitVec 64)) (t!32369 List!23045)) )
))
(declare-fun arrayNoDuplicates!0 (array!68490 (_ BitVec 32) List!23045) Bool)

(assert (=> b!1070868 (= res!714393 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23042))))

(declare-fun b!1070869 () Bool)

(declare-fun e!611379 () Bool)

(declare-fun e!611381 () Bool)

(declare-fun mapRes!40390 () Bool)

(assert (=> b!1070869 (= e!611379 (and e!611381 mapRes!40390))))

(declare-fun condMapEmpty!40390 () Bool)

(declare-datatypes ((V!39521 0))(
  ( (V!39522 (val!12945 Int)) )
))
(declare-datatypes ((ValueCell!12191 0))(
  ( (ValueCellFull!12191 (v!15560 V!39521)) (EmptyCell!12191) )
))
(declare-datatypes ((array!68492 0))(
  ( (array!68493 (arr!32942 (Array (_ BitVec 32) ValueCell!12191)) (size!33480 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68492)

(declare-fun mapDefault!40390 () ValueCell!12191)

(assert (=> b!1070869 (= condMapEmpty!40390 (= (arr!32942 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12191)) mapDefault!40390)))))

(declare-fun mapIsEmpty!40390 () Bool)

(assert (=> mapIsEmpty!40390 mapRes!40390))

(declare-fun b!1070870 () Bool)

(declare-fun tp_is_empty!25789 () Bool)

(assert (=> b!1070870 (= e!611381 tp_is_empty!25789)))

(declare-fun res!714397 () Bool)

(assert (=> start!94720 (=> (not res!714397) (not e!611378))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94720 (= res!714397 (validMask!0 mask!1515))))

(assert (=> start!94720 e!611378))

(assert (=> start!94720 true))

(assert (=> start!94720 tp_is_empty!25789))

(declare-fun array_inv!25484 (array!68492) Bool)

(assert (=> start!94720 (and (array_inv!25484 _values!955) e!611379)))

(assert (=> start!94720 tp!77395))

(declare-fun array_inv!25485 (array!68490) Bool)

(assert (=> start!94720 (array_inv!25485 _keys!1163)))

(declare-fun b!1070871 () Bool)

(declare-fun res!714392 () Bool)

(assert (=> b!1070871 (=> (not res!714392) (not e!611378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68490 (_ BitVec 32)) Bool)

(assert (=> b!1070871 (= res!714392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070872 () Bool)

(declare-fun e!611380 () Bool)

(assert (=> b!1070872 (= e!611380 tp_is_empty!25789)))

(declare-fun mapNonEmpty!40390 () Bool)

(declare-fun tp!77396 () Bool)

(assert (=> mapNonEmpty!40390 (= mapRes!40390 (and tp!77396 e!611380))))

(declare-fun mapKey!40390 () (_ BitVec 32))

(declare-fun mapValue!40390 () ValueCell!12191)

(declare-fun mapRest!40390 () (Array (_ BitVec 32) ValueCell!12191))

(assert (=> mapNonEmpty!40390 (= (arr!32942 _values!955) (store mapRest!40390 mapKey!40390 mapValue!40390))))

(declare-fun b!1070873 () Bool)

(declare-fun e!611377 () Bool)

(assert (=> b!1070873 (= e!611378 (not e!611377))))

(declare-fun res!714395 () Bool)

(assert (=> b!1070873 (=> res!714395 e!611377)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070873 (= res!714395 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16516 0))(
  ( (tuple2!16517 (_1!8269 (_ BitVec 64)) (_2!8269 V!39521)) )
))
(declare-datatypes ((List!23046 0))(
  ( (Nil!23043) (Cons!23042 (h!24251 tuple2!16516) (t!32370 List!23046)) )
))
(declare-datatypes ((ListLongMap!14485 0))(
  ( (ListLongMap!14486 (toList!7258 List!23046)) )
))
(declare-fun lt!473278 () ListLongMap!14485)

(declare-fun lt!473274 () ListLongMap!14485)

(assert (=> b!1070873 (= lt!473278 lt!473274)))

(declare-fun zeroValueBefore!47 () V!39521)

(declare-datatypes ((Unit!35097 0))(
  ( (Unit!35098) )
))
(declare-fun lt!473277 () Unit!35097)

(declare-fun minValue!907 () V!39521)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39521)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!837 (array!68490 array!68492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 V!39521 V!39521 (_ BitVec 32) Int) Unit!35097)

(assert (=> b!1070873 (= lt!473277 (lemmaNoChangeToArrayThenSameMapNoExtras!837 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3843 (array!68490 array!68492 (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 (_ BitVec 32) Int) ListLongMap!14485)

(assert (=> b!1070873 (= lt!473274 (getCurrentListMapNoExtraKeys!3843 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070873 (= lt!473278 (getCurrentListMapNoExtraKeys!3843 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070874 () Bool)

(assert (=> b!1070874 (= e!611377 true)))

(declare-fun lt!473283 () ListLongMap!14485)

(declare-fun lt!473279 () ListLongMap!14485)

(declare-fun -!657 (ListLongMap!14485 (_ BitVec 64)) ListLongMap!14485)

(assert (=> b!1070874 (= lt!473283 (-!657 lt!473279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473276 () ListLongMap!14485)

(declare-fun lt!473282 () ListLongMap!14485)

(assert (=> b!1070874 (= lt!473276 lt!473282)))

(declare-fun lt!473285 () Unit!35097)

(declare-fun addCommutativeForDiffKeys!715 (ListLongMap!14485 (_ BitVec 64) V!39521 (_ BitVec 64) V!39521) Unit!35097)

(assert (=> b!1070874 (= lt!473285 (addCommutativeForDiffKeys!715 lt!473278 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473275 () ListLongMap!14485)

(assert (=> b!1070874 (= (-!657 lt!473282 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473275)))

(declare-fun lt!473284 () tuple2!16516)

(declare-fun +!3194 (ListLongMap!14485 tuple2!16516) ListLongMap!14485)

(assert (=> b!1070874 (= lt!473282 (+!3194 lt!473275 lt!473284))))

(declare-fun lt!473281 () Unit!35097)

(declare-fun addThenRemoveForNewKeyIsSame!38 (ListLongMap!14485 (_ BitVec 64) V!39521) Unit!35097)

(assert (=> b!1070874 (= lt!473281 (addThenRemoveForNewKeyIsSame!38 lt!473275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473286 () tuple2!16516)

(assert (=> b!1070874 (= lt!473275 (+!3194 lt!473278 lt!473286))))

(declare-fun e!611376 () Bool)

(assert (=> b!1070874 e!611376))

(declare-fun res!714394 () Bool)

(assert (=> b!1070874 (=> (not res!714394) (not e!611376))))

(assert (=> b!1070874 (= res!714394 (= lt!473279 lt!473276))))

(assert (=> b!1070874 (= lt!473276 (+!3194 (+!3194 lt!473278 lt!473284) lt!473286))))

(assert (=> b!1070874 (= lt!473286 (tuple2!16517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070874 (= lt!473284 (tuple2!16517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473280 () ListLongMap!14485)

(declare-fun getCurrentListMap!4070 (array!68490 array!68492 (_ BitVec 32) (_ BitVec 32) V!39521 V!39521 (_ BitVec 32) Int) ListLongMap!14485)

(assert (=> b!1070874 (= lt!473280 (getCurrentListMap!4070 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070874 (= lt!473279 (getCurrentListMap!4070 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070875 () Bool)

(declare-fun res!714396 () Bool)

(assert (=> b!1070875 (=> (not res!714396) (not e!611378))))

(assert (=> b!1070875 (= res!714396 (and (= (size!33480 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33479 _keys!1163) (size!33480 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070876 () Bool)

(assert (=> b!1070876 (= e!611376 (= lt!473280 (+!3194 lt!473274 lt!473286)))))

(assert (= (and start!94720 res!714397) b!1070875))

(assert (= (and b!1070875 res!714396) b!1070871))

(assert (= (and b!1070871 res!714392) b!1070868))

(assert (= (and b!1070868 res!714393) b!1070873))

(assert (= (and b!1070873 (not res!714395)) b!1070874))

(assert (= (and b!1070874 res!714394) b!1070876))

(assert (= (and b!1070869 condMapEmpty!40390) mapIsEmpty!40390))

(assert (= (and b!1070869 (not condMapEmpty!40390)) mapNonEmpty!40390))

(get-info :version)

(assert (= (and mapNonEmpty!40390 ((_ is ValueCellFull!12191) mapValue!40390)) b!1070872))

(assert (= (and b!1070869 ((_ is ValueCellFull!12191) mapDefault!40390)) b!1070870))

(assert (= start!94720 b!1070869))

(declare-fun m!988703 () Bool)

(assert (=> start!94720 m!988703))

(declare-fun m!988705 () Bool)

(assert (=> start!94720 m!988705))

(declare-fun m!988707 () Bool)

(assert (=> start!94720 m!988707))

(declare-fun m!988709 () Bool)

(assert (=> b!1070871 m!988709))

(declare-fun m!988711 () Bool)

(assert (=> b!1070876 m!988711))

(declare-fun m!988713 () Bool)

(assert (=> b!1070873 m!988713))

(declare-fun m!988715 () Bool)

(assert (=> b!1070873 m!988715))

(declare-fun m!988717 () Bool)

(assert (=> b!1070873 m!988717))

(declare-fun m!988719 () Bool)

(assert (=> mapNonEmpty!40390 m!988719))

(declare-fun m!988721 () Bool)

(assert (=> b!1070868 m!988721))

(declare-fun m!988723 () Bool)

(assert (=> b!1070874 m!988723))

(declare-fun m!988725 () Bool)

(assert (=> b!1070874 m!988725))

(declare-fun m!988727 () Bool)

(assert (=> b!1070874 m!988727))

(declare-fun m!988729 () Bool)

(assert (=> b!1070874 m!988729))

(declare-fun m!988731 () Bool)

(assert (=> b!1070874 m!988731))

(declare-fun m!988733 () Bool)

(assert (=> b!1070874 m!988733))

(declare-fun m!988735 () Bool)

(assert (=> b!1070874 m!988735))

(declare-fun m!988737 () Bool)

(assert (=> b!1070874 m!988737))

(declare-fun m!988739 () Bool)

(assert (=> b!1070874 m!988739))

(assert (=> b!1070874 m!988725))

(declare-fun m!988741 () Bool)

(assert (=> b!1070874 m!988741))

(check-sat (not b!1070871) (not start!94720) (not b!1070876) tp_is_empty!25789 b_and!34783 (not mapNonEmpty!40390) (not b_next!21979) (not b!1070874) (not b!1070873) (not b!1070868))
(check-sat b_and!34783 (not b_next!21979))
