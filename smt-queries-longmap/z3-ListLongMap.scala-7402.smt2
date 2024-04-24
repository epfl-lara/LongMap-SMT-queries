; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94440 () Bool)

(assert start!94440)

(declare-fun b_free!21589 () Bool)

(declare-fun b_next!21589 () Bool)

(assert (=> start!94440 (= b_free!21589 (not b_next!21589))))

(declare-fun tp!76204 () Bool)

(declare-fun b_and!34359 () Bool)

(assert (=> start!94440 (= tp!76204 b_and!34359)))

(declare-fun b!1066648 () Bool)

(declare-fun e!608154 () Bool)

(declare-fun e!608155 () Bool)

(assert (=> b!1066648 (= e!608154 (not e!608155))))

(declare-fun res!711633 () Bool)

(assert (=> b!1066648 (=> res!711633 e!608155)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066648 (= res!711633 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39001 0))(
  ( (V!39002 (val!12750 Int)) )
))
(declare-datatypes ((tuple2!16140 0))(
  ( (tuple2!16141 (_1!8081 (_ BitVec 64)) (_2!8081 V!39001)) )
))
(declare-datatypes ((List!22712 0))(
  ( (Nil!22709) (Cons!22708 (h!23926 tuple2!16140) (t!32023 List!22712)) )
))
(declare-datatypes ((ListLongMap!14117 0))(
  ( (ListLongMap!14118 (toList!7074 List!22712)) )
))
(declare-fun lt!470247 () ListLongMap!14117)

(declare-fun lt!470249 () ListLongMap!14117)

(assert (=> b!1066648 (= lt!470247 lt!470249)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39001)

(declare-datatypes ((Unit!34942 0))(
  ( (Unit!34943) )
))
(declare-fun lt!470250 () Unit!34942)

(declare-datatypes ((ValueCell!11996 0))(
  ( (ValueCellFull!11996 (v!15358 V!39001)) (EmptyCell!11996) )
))
(declare-datatypes ((array!67833 0))(
  ( (array!67834 (arr!32613 (Array (_ BitVec 32) ValueCell!11996)) (size!33150 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67833)

(declare-fun minValue!907 () V!39001)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39001)

(declare-datatypes ((array!67835 0))(
  ( (array!67836 (arr!32614 (Array (_ BitVec 32) (_ BitVec 64))) (size!33151 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67835)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!705 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 V!39001 V!39001 (_ BitVec 32) Int) Unit!34942)

(assert (=> b!1066648 (= lt!470250 (lemmaNoChangeToArrayThenSameMapNoExtras!705 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3702 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 (_ BitVec 32) Int) ListLongMap!14117)

(assert (=> b!1066648 (= lt!470249 (getCurrentListMapNoExtraKeys!3702 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066648 (= lt!470247 (getCurrentListMapNoExtraKeys!3702 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39784 () Bool)

(declare-fun mapRes!39784 () Bool)

(assert (=> mapIsEmpty!39784 mapRes!39784))

(declare-fun res!711632 () Bool)

(assert (=> start!94440 (=> (not res!711632) (not e!608154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94440 (= res!711632 (validMask!0 mask!1515))))

(assert (=> start!94440 e!608154))

(assert (=> start!94440 true))

(declare-fun tp_is_empty!25399 () Bool)

(assert (=> start!94440 tp_is_empty!25399))

(declare-fun e!608156 () Bool)

(declare-fun array_inv!25278 (array!67833) Bool)

(assert (=> start!94440 (and (array_inv!25278 _values!955) e!608156)))

(assert (=> start!94440 tp!76204))

(declare-fun array_inv!25279 (array!67835) Bool)

(assert (=> start!94440 (array_inv!25279 _keys!1163)))

(declare-fun b!1066649 () Bool)

(declare-fun e!608152 () Bool)

(assert (=> b!1066649 (= e!608152 tp_is_empty!25399)))

(declare-fun b!1066650 () Bool)

(assert (=> b!1066650 (= e!608156 (and e!608152 mapRes!39784))))

(declare-fun condMapEmpty!39784 () Bool)

(declare-fun mapDefault!39784 () ValueCell!11996)

(assert (=> b!1066650 (= condMapEmpty!39784 (= (arr!32613 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11996)) mapDefault!39784)))))

(declare-fun mapNonEmpty!39784 () Bool)

(declare-fun tp!76205 () Bool)

(declare-fun e!608153 () Bool)

(assert (=> mapNonEmpty!39784 (= mapRes!39784 (and tp!76205 e!608153))))

(declare-fun mapValue!39784 () ValueCell!11996)

(declare-fun mapRest!39784 () (Array (_ BitVec 32) ValueCell!11996))

(declare-fun mapKey!39784 () (_ BitVec 32))

(assert (=> mapNonEmpty!39784 (= (arr!32613 _values!955) (store mapRest!39784 mapKey!39784 mapValue!39784))))

(declare-fun b!1066651 () Bool)

(declare-fun res!711634 () Bool)

(assert (=> b!1066651 (=> (not res!711634) (not e!608154))))

(declare-datatypes ((List!22713 0))(
  ( (Nil!22710) (Cons!22709 (h!23927 (_ BitVec 64)) (t!32024 List!22713)) )
))
(declare-fun arrayNoDuplicates!0 (array!67835 (_ BitVec 32) List!22713) Bool)

(assert (=> b!1066651 (= res!711634 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22710))))

(declare-fun b!1066652 () Bool)

(declare-fun res!711636 () Bool)

(assert (=> b!1066652 (=> (not res!711636) (not e!608154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67835 (_ BitVec 32)) Bool)

(assert (=> b!1066652 (= res!711636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066653 () Bool)

(assert (=> b!1066653 (= e!608153 tp_is_empty!25399)))

(declare-fun b!1066654 () Bool)

(assert (=> b!1066654 (= e!608155 true)))

(declare-fun lt!470251 () ListLongMap!14117)

(declare-fun lt!470246 () ListLongMap!14117)

(declare-fun -!594 (ListLongMap!14117 (_ BitVec 64)) ListLongMap!14117)

(assert (=> b!1066654 (= lt!470251 (-!594 lt!470246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470248 () ListLongMap!14117)

(assert (=> b!1066654 (= (-!594 lt!470248 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470247)))

(declare-fun lt!470245 () Unit!34942)

(declare-fun addThenRemoveForNewKeyIsSame!4 (ListLongMap!14117 (_ BitVec 64) V!39001) Unit!34942)

(assert (=> b!1066654 (= lt!470245 (addThenRemoveForNewKeyIsSame!4 lt!470247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470252 () ListLongMap!14117)

(assert (=> b!1066654 (and (= lt!470246 lt!470248) (= lt!470252 lt!470249))))

(declare-fun +!3147 (ListLongMap!14117 tuple2!16140) ListLongMap!14117)

(assert (=> b!1066654 (= lt!470248 (+!3147 lt!470247 (tuple2!16141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4028 (array!67835 array!67833 (_ BitVec 32) (_ BitVec 32) V!39001 V!39001 (_ BitVec 32) Int) ListLongMap!14117)

(assert (=> b!1066654 (= lt!470252 (getCurrentListMap!4028 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066654 (= lt!470246 (getCurrentListMap!4028 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066655 () Bool)

(declare-fun res!711635 () Bool)

(assert (=> b!1066655 (=> (not res!711635) (not e!608154))))

(assert (=> b!1066655 (= res!711635 (and (= (size!33150 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33151 _keys!1163) (size!33150 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94440 res!711632) b!1066655))

(assert (= (and b!1066655 res!711635) b!1066652))

(assert (= (and b!1066652 res!711636) b!1066651))

(assert (= (and b!1066651 res!711634) b!1066648))

(assert (= (and b!1066648 (not res!711633)) b!1066654))

(assert (= (and b!1066650 condMapEmpty!39784) mapIsEmpty!39784))

(assert (= (and b!1066650 (not condMapEmpty!39784)) mapNonEmpty!39784))

(get-info :version)

(assert (= (and mapNonEmpty!39784 ((_ is ValueCellFull!11996) mapValue!39784)) b!1066653))

(assert (= (and b!1066650 ((_ is ValueCellFull!11996) mapDefault!39784)) b!1066649))

(assert (= start!94440 b!1066650))

(declare-fun m!985421 () Bool)

(assert (=> b!1066652 m!985421))

(declare-fun m!985423 () Bool)

(assert (=> b!1066651 m!985423))

(declare-fun m!985425 () Bool)

(assert (=> start!94440 m!985425))

(declare-fun m!985427 () Bool)

(assert (=> start!94440 m!985427))

(declare-fun m!985429 () Bool)

(assert (=> start!94440 m!985429))

(declare-fun m!985431 () Bool)

(assert (=> b!1066654 m!985431))

(declare-fun m!985433 () Bool)

(assert (=> b!1066654 m!985433))

(declare-fun m!985435 () Bool)

(assert (=> b!1066654 m!985435))

(declare-fun m!985437 () Bool)

(assert (=> b!1066654 m!985437))

(declare-fun m!985439 () Bool)

(assert (=> b!1066654 m!985439))

(declare-fun m!985441 () Bool)

(assert (=> b!1066654 m!985441))

(declare-fun m!985443 () Bool)

(assert (=> mapNonEmpty!39784 m!985443))

(declare-fun m!985445 () Bool)

(assert (=> b!1066648 m!985445))

(declare-fun m!985447 () Bool)

(assert (=> b!1066648 m!985447))

(declare-fun m!985449 () Bool)

(assert (=> b!1066648 m!985449))

(check-sat (not mapNonEmpty!39784) (not b!1066654) (not b_next!21589) (not start!94440) (not b!1066651) tp_is_empty!25399 (not b!1066652) (not b!1066648) b_and!34359)
(check-sat b_and!34359 (not b_next!21589))
