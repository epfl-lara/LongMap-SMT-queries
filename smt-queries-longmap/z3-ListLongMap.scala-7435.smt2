; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94454 () Bool)

(assert start!94454)

(declare-fun b_free!21787 () Bool)

(declare-fun b_next!21787 () Bool)

(assert (=> start!94454 (= b_free!21787 (not b_next!21787))))

(declare-fun tp!76808 () Bool)

(declare-fun b_and!34553 () Bool)

(assert (=> start!94454 (= tp!76808 b_and!34553)))

(declare-fun b!1067972 () Bool)

(declare-fun e!609256 () Bool)

(declare-fun tp_is_empty!25597 () Bool)

(assert (=> b!1067972 (= e!609256 tp_is_empty!25597)))

(declare-fun mapNonEmpty!40090 () Bool)

(declare-fun mapRes!40090 () Bool)

(declare-fun tp!76807 () Bool)

(declare-fun e!609255 () Bool)

(assert (=> mapNonEmpty!40090 (= mapRes!40090 (and tp!76807 e!609255))))

(declare-datatypes ((V!39265 0))(
  ( (V!39266 (val!12849 Int)) )
))
(declare-datatypes ((ValueCell!12095 0))(
  ( (ValueCellFull!12095 (v!15462 V!39265)) (EmptyCell!12095) )
))
(declare-fun mapRest!40090 () (Array (_ BitVec 32) ValueCell!12095))

(declare-fun mapValue!40090 () ValueCell!12095)

(declare-fun mapKey!40090 () (_ BitVec 32))

(declare-datatypes ((array!68120 0))(
  ( (array!68121 (arr!32760 (Array (_ BitVec 32) ValueCell!12095)) (size!33298 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68120)

(assert (=> mapNonEmpty!40090 (= (arr!32760 _values!955) (store mapRest!40090 mapKey!40090 mapValue!40090))))

(declare-fun b!1067973 () Bool)

(declare-fun e!609253 () Bool)

(declare-fun e!609254 () Bool)

(assert (=> b!1067973 (= e!609253 (not e!609254))))

(declare-fun res!712701 () Bool)

(assert (=> b!1067973 (=> res!712701 e!609254)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067973 (= res!712701 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16372 0))(
  ( (tuple2!16373 (_1!8197 (_ BitVec 64)) (_2!8197 V!39265)) )
))
(declare-datatypes ((List!22910 0))(
  ( (Nil!22907) (Cons!22906 (h!24115 tuple2!16372) (t!32226 List!22910)) )
))
(declare-datatypes ((ListLongMap!14341 0))(
  ( (ListLongMap!14342 (toList!7186 List!22910)) )
))
(declare-fun lt!471616 () ListLongMap!14341)

(declare-fun lt!471614 () ListLongMap!14341)

(assert (=> b!1067973 (= lt!471616 lt!471614)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39265)

(declare-datatypes ((Unit!34960 0))(
  ( (Unit!34961) )
))
(declare-fun lt!471613 () Unit!34960)

(declare-fun minValue!907 () V!39265)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39265)

(declare-datatypes ((array!68122 0))(
  ( (array!68123 (arr!32761 (Array (_ BitVec 32) (_ BitVec 64))) (size!33299 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68122)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!773 (array!68122 array!68120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 V!39265 V!39265 (_ BitVec 32) Int) Unit!34960)

(assert (=> b!1067973 (= lt!471613 (lemmaNoChangeToArrayThenSameMapNoExtras!773 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3779 (array!68122 array!68120 (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 (_ BitVec 32) Int) ListLongMap!14341)

(assert (=> b!1067973 (= lt!471614 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067973 (= lt!471616 (getCurrentListMapNoExtraKeys!3779 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067974 () Bool)

(declare-fun e!609258 () Bool)

(assert (=> b!1067974 (= e!609254 e!609258)))

(declare-fun res!712700 () Bool)

(assert (=> b!1067974 (=> res!712700 e!609258)))

(declare-fun lt!471617 () ListLongMap!14341)

(declare-fun contains!6260 (ListLongMap!14341 (_ BitVec 64)) Bool)

(assert (=> b!1067974 (= res!712700 (contains!6260 lt!471617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4029 (array!68122 array!68120 (_ BitVec 32) (_ BitVec 32) V!39265 V!39265 (_ BitVec 32) Int) ListLongMap!14341)

(assert (=> b!1067974 (= lt!471617 (getCurrentListMap!4029 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067975 () Bool)

(declare-fun e!609259 () Bool)

(assert (=> b!1067975 (= e!609259 (and e!609256 mapRes!40090))))

(declare-fun condMapEmpty!40090 () Bool)

(declare-fun mapDefault!40090 () ValueCell!12095)

(assert (=> b!1067975 (= condMapEmpty!40090 (= (arr!32760 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12095)) mapDefault!40090)))))

(declare-fun res!712696 () Bool)

(assert (=> start!94454 (=> (not res!712696) (not e!609253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94454 (= res!712696 (validMask!0 mask!1515))))

(assert (=> start!94454 e!609253))

(assert (=> start!94454 true))

(assert (=> start!94454 tp_is_empty!25597))

(declare-fun array_inv!25360 (array!68120) Bool)

(assert (=> start!94454 (and (array_inv!25360 _values!955) e!609259)))

(assert (=> start!94454 tp!76808))

(declare-fun array_inv!25361 (array!68122) Bool)

(assert (=> start!94454 (array_inv!25361 _keys!1163)))

(declare-fun mapIsEmpty!40090 () Bool)

(assert (=> mapIsEmpty!40090 mapRes!40090))

(declare-fun b!1067976 () Bool)

(declare-fun res!712698 () Bool)

(assert (=> b!1067976 (=> (not res!712698) (not e!609253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68122 (_ BitVec 32)) Bool)

(assert (=> b!1067976 (= res!712698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067977 () Bool)

(declare-fun res!712699 () Bool)

(assert (=> b!1067977 (=> (not res!712699) (not e!609253))))

(assert (=> b!1067977 (= res!712699 (and (= (size!33298 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33299 _keys!1163) (size!33298 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067978 () Bool)

(assert (=> b!1067978 (= e!609255 tp_is_empty!25597)))

(declare-fun b!1067979 () Bool)

(declare-fun res!712697 () Bool)

(assert (=> b!1067979 (=> (not res!712697) (not e!609253))))

(declare-datatypes ((List!22911 0))(
  ( (Nil!22908) (Cons!22907 (h!24116 (_ BitVec 64)) (t!32227 List!22911)) )
))
(declare-fun arrayNoDuplicates!0 (array!68122 (_ BitVec 32) List!22911) Bool)

(assert (=> b!1067979 (= res!712697 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22908))))

(declare-fun b!1067980 () Bool)

(assert (=> b!1067980 (= e!609258 true)))

(declare-fun -!631 (ListLongMap!14341 (_ BitVec 64)) ListLongMap!14341)

(assert (=> b!1067980 (= (-!631 lt!471617 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471617)))

(declare-fun lt!471615 () Unit!34960)

(declare-fun removeNotPresentStillSame!48 (ListLongMap!14341 (_ BitVec 64)) Unit!34960)

(assert (=> b!1067980 (= lt!471615 (removeNotPresentStillSame!48 lt!471617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94454 res!712696) b!1067977))

(assert (= (and b!1067977 res!712699) b!1067976))

(assert (= (and b!1067976 res!712698) b!1067979))

(assert (= (and b!1067979 res!712697) b!1067973))

(assert (= (and b!1067973 (not res!712701)) b!1067974))

(assert (= (and b!1067974 (not res!712700)) b!1067980))

(assert (= (and b!1067975 condMapEmpty!40090) mapIsEmpty!40090))

(assert (= (and b!1067975 (not condMapEmpty!40090)) mapNonEmpty!40090))

(get-info :version)

(assert (= (and mapNonEmpty!40090 ((_ is ValueCellFull!12095) mapValue!40090)) b!1067978))

(assert (= (and b!1067975 ((_ is ValueCellFull!12095) mapDefault!40090)) b!1067972))

(assert (= start!94454 b!1067975))

(declare-fun m!986107 () Bool)

(assert (=> mapNonEmpty!40090 m!986107))

(declare-fun m!986109 () Bool)

(assert (=> start!94454 m!986109))

(declare-fun m!986111 () Bool)

(assert (=> start!94454 m!986111))

(declare-fun m!986113 () Bool)

(assert (=> start!94454 m!986113))

(declare-fun m!986115 () Bool)

(assert (=> b!1067976 m!986115))

(declare-fun m!986117 () Bool)

(assert (=> b!1067980 m!986117))

(declare-fun m!986119 () Bool)

(assert (=> b!1067980 m!986119))

(declare-fun m!986121 () Bool)

(assert (=> b!1067979 m!986121))

(declare-fun m!986123 () Bool)

(assert (=> b!1067973 m!986123))

(declare-fun m!986125 () Bool)

(assert (=> b!1067973 m!986125))

(declare-fun m!986127 () Bool)

(assert (=> b!1067973 m!986127))

(declare-fun m!986129 () Bool)

(assert (=> b!1067974 m!986129))

(declare-fun m!986131 () Bool)

(assert (=> b!1067974 m!986131))

(check-sat (not b!1067980) (not start!94454) (not b!1067973) tp_is_empty!25597 (not b!1067976) (not b!1067979) (not mapNonEmpty!40090) b_and!34553 (not b_next!21787) (not b!1067974))
(check-sat b_and!34553 (not b_next!21787))
