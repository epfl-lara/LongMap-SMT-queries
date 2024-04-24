; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94916 () Bool)

(assert start!94916)

(declare-fun b_free!21949 () Bool)

(declare-fun b_next!21949 () Bool)

(assert (=> start!94916 (= b_free!21949 (not b_next!21949))))

(declare-fun tp!77302 () Bool)

(declare-fun b_and!34779 () Bool)

(assert (=> start!94916 (= tp!77302 b_and!34779)))

(declare-fun b!1071820 () Bool)

(declare-fun e!611941 () Bool)

(declare-fun e!611939 () Bool)

(assert (=> b!1071820 (= e!611941 (not e!611939))))

(declare-fun res!714684 () Bool)

(assert (=> b!1071820 (=> res!714684 e!611939)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071820 (= res!714684 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39481 0))(
  ( (V!39482 (val!12930 Int)) )
))
(declare-datatypes ((tuple2!16418 0))(
  ( (tuple2!16419 (_1!8220 (_ BitVec 64)) (_2!8220 V!39481)) )
))
(declare-datatypes ((List!22984 0))(
  ( (Nil!22981) (Cons!22980 (h!24198 tuple2!16418) (t!32307 List!22984)) )
))
(declare-datatypes ((ListLongMap!14395 0))(
  ( (ListLongMap!14396 (toList!7213 List!22984)) )
))
(declare-fun lt!473615 () ListLongMap!14395)

(declare-fun lt!473613 () ListLongMap!14395)

(assert (=> b!1071820 (= lt!473615 lt!473613)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39481)

(declare-datatypes ((ValueCell!12176 0))(
  ( (ValueCellFull!12176 (v!15542 V!39481)) (EmptyCell!12176) )
))
(declare-datatypes ((array!68533 0))(
  ( (array!68534 (arr!32957 (Array (_ BitVec 32) ValueCell!12176)) (size!33494 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68533)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39481)

(declare-fun minValue!907 () V!39481)

(declare-datatypes ((Unit!35212 0))(
  ( (Unit!35213) )
))
(declare-fun lt!473614 () Unit!35212)

(declare-datatypes ((array!68535 0))(
  ( (array!68536 (arr!32958 (Array (_ BitVec 32) (_ BitVec 64))) (size!33495 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68535)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!824 (array!68535 array!68533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 V!39481 V!39481 (_ BitVec 32) Int) Unit!35212)

(assert (=> b!1071820 (= lt!473614 (lemmaNoChangeToArrayThenSameMapNoExtras!824 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3821 (array!68535 array!68533 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1071820 (= lt!473613 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071820 (= lt!473615 (getCurrentListMapNoExtraKeys!3821 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40342 () Bool)

(declare-fun mapRes!40342 () Bool)

(declare-fun tp!77303 () Bool)

(declare-fun e!611943 () Bool)

(assert (=> mapNonEmpty!40342 (= mapRes!40342 (and tp!77303 e!611943))))

(declare-fun mapKey!40342 () (_ BitVec 32))

(declare-fun mapRest!40342 () (Array (_ BitVec 32) ValueCell!12176))

(declare-fun mapValue!40342 () ValueCell!12176)

(assert (=> mapNonEmpty!40342 (= (arr!32957 _values!955) (store mapRest!40342 mapKey!40342 mapValue!40342))))

(declare-fun mapIsEmpty!40342 () Bool)

(assert (=> mapIsEmpty!40342 mapRes!40342))

(declare-fun b!1071821 () Bool)

(assert (=> b!1071821 (= e!611939 true)))

(declare-fun lt!473616 () ListLongMap!14395)

(declare-fun getCurrentListMap!4114 (array!68535 array!68533 (_ BitVec 32) (_ BitVec 32) V!39481 V!39481 (_ BitVec 32) Int) ListLongMap!14395)

(assert (=> b!1071821 (= lt!473616 (getCurrentListMap!4114 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071822 () Bool)

(declare-fun res!714681 () Bool)

(assert (=> b!1071822 (=> (not res!714681) (not e!611941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68535 (_ BitVec 32)) Bool)

(assert (=> b!1071822 (= res!714681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071823 () Bool)

(declare-fun e!611944 () Bool)

(declare-fun tp_is_empty!25759 () Bool)

(assert (=> b!1071823 (= e!611944 tp_is_empty!25759)))

(declare-fun b!1071824 () Bool)

(declare-fun e!611942 () Bool)

(assert (=> b!1071824 (= e!611942 (and e!611944 mapRes!40342))))

(declare-fun condMapEmpty!40342 () Bool)

(declare-fun mapDefault!40342 () ValueCell!12176)

(assert (=> b!1071824 (= condMapEmpty!40342 (= (arr!32957 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12176)) mapDefault!40342)))))

(declare-fun b!1071825 () Bool)

(declare-fun res!714682 () Bool)

(assert (=> b!1071825 (=> (not res!714682) (not e!611941))))

(assert (=> b!1071825 (= res!714682 (and (= (size!33494 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33495 _keys!1163) (size!33494 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071826 () Bool)

(assert (=> b!1071826 (= e!611943 tp_is_empty!25759)))

(declare-fun res!714683 () Bool)

(assert (=> start!94916 (=> (not res!714683) (not e!611941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94916 (= res!714683 (validMask!0 mask!1515))))

(assert (=> start!94916 e!611941))

(assert (=> start!94916 true))

(assert (=> start!94916 tp_is_empty!25759))

(declare-fun array_inv!25524 (array!68533) Bool)

(assert (=> start!94916 (and (array_inv!25524 _values!955) e!611942)))

(assert (=> start!94916 tp!77302))

(declare-fun array_inv!25525 (array!68535) Bool)

(assert (=> start!94916 (array_inv!25525 _keys!1163)))

(declare-fun b!1071827 () Bool)

(declare-fun res!714680 () Bool)

(assert (=> b!1071827 (=> (not res!714680) (not e!611941))))

(declare-datatypes ((List!22985 0))(
  ( (Nil!22982) (Cons!22981 (h!24199 (_ BitVec 64)) (t!32308 List!22985)) )
))
(declare-fun arrayNoDuplicates!0 (array!68535 (_ BitVec 32) List!22985) Bool)

(assert (=> b!1071827 (= res!714680 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22982))))

(assert (= (and start!94916 res!714683) b!1071825))

(assert (= (and b!1071825 res!714682) b!1071822))

(assert (= (and b!1071822 res!714681) b!1071827))

(assert (= (and b!1071827 res!714680) b!1071820))

(assert (= (and b!1071820 (not res!714684)) b!1071821))

(assert (= (and b!1071824 condMapEmpty!40342) mapIsEmpty!40342))

(assert (= (and b!1071824 (not condMapEmpty!40342)) mapNonEmpty!40342))

(get-info :version)

(assert (= (and mapNonEmpty!40342 ((_ is ValueCellFull!12176) mapValue!40342)) b!1071826))

(assert (= (and b!1071824 ((_ is ValueCellFull!12176) mapDefault!40342)) b!1071823))

(assert (= start!94916 b!1071824))

(declare-fun m!990505 () Bool)

(assert (=> start!94916 m!990505))

(declare-fun m!990507 () Bool)

(assert (=> start!94916 m!990507))

(declare-fun m!990509 () Bool)

(assert (=> start!94916 m!990509))

(declare-fun m!990511 () Bool)

(assert (=> b!1071827 m!990511))

(declare-fun m!990513 () Bool)

(assert (=> b!1071821 m!990513))

(declare-fun m!990515 () Bool)

(assert (=> b!1071822 m!990515))

(declare-fun m!990517 () Bool)

(assert (=> b!1071820 m!990517))

(declare-fun m!990519 () Bool)

(assert (=> b!1071820 m!990519))

(declare-fun m!990521 () Bool)

(assert (=> b!1071820 m!990521))

(declare-fun m!990523 () Bool)

(assert (=> mapNonEmpty!40342 m!990523))

(check-sat tp_is_empty!25759 (not b!1071822) (not b!1071827) (not b!1071821) (not b_next!21949) (not b!1071820) (not start!94916) b_and!34779 (not mapNonEmpty!40342))
(check-sat b_and!34779 (not b_next!21949))
