; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105612 () Bool)

(assert start!105612)

(declare-fun b_free!27217 () Bool)

(declare-fun b_next!27217 () Bool)

(assert (=> start!105612 (= b_free!27217 (not b_next!27217))))

(declare-fun tp!95174 () Bool)

(declare-fun b_and!45073 () Bool)

(assert (=> start!105612 (= tp!95174 b_and!45073)))

(declare-fun b!1257999 () Bool)

(declare-fun e!715424 () Bool)

(assert (=> b!1257999 (= e!715424 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48191 0))(
  ( (V!48192 (val!16122 Int)) )
))
(declare-datatypes ((tuple2!20912 0))(
  ( (tuple2!20913 (_1!10467 (_ BitVec 64)) (_2!10467 V!48191)) )
))
(declare-datatypes ((List!28119 0))(
  ( (Nil!28116) (Cons!28115 (h!29324 tuple2!20912) (t!41603 List!28119)) )
))
(declare-datatypes ((ListLongMap!18785 0))(
  ( (ListLongMap!18786 (toList!9408 List!28119)) )
))
(declare-fun lt!568846 () ListLongMap!18785)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48191)

(declare-datatypes ((array!81793 0))(
  ( (array!81794 (arr!39453 (Array (_ BitVec 32) (_ BitVec 64))) (size!39991 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81793)

(declare-datatypes ((ValueCell!15296 0))(
  ( (ValueCellFull!15296 (v!18823 V!48191)) (EmptyCell!15296) )
))
(declare-datatypes ((array!81795 0))(
  ( (array!81796 (arr!39454 (Array (_ BitVec 32) ValueCell!15296)) (size!39992 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81795)

(declare-fun minValueBefore!43 () V!48191)

(declare-fun getCurrentListMap!4499 (array!81793 array!81795 (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 (_ BitVec 32) Int) ListLongMap!18785)

(assert (=> b!1257999 (= lt!568846 (getCurrentListMap!4499 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49972 () Bool)

(declare-fun mapRes!49972 () Bool)

(assert (=> mapIsEmpty!49972 mapRes!49972))

(declare-fun b!1258000 () Bool)

(declare-fun e!715421 () Bool)

(assert (=> b!1258000 (= e!715421 (not e!715424))))

(declare-fun res!838507 () Bool)

(assert (=> b!1258000 (=> res!838507 e!715424)))

(assert (=> b!1258000 (= res!838507 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!568845 () ListLongMap!18785)

(declare-fun lt!568844 () ListLongMap!18785)

(assert (=> b!1258000 (= lt!568845 lt!568844)))

(declare-fun minValueAfter!43 () V!48191)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41775 0))(
  ( (Unit!41776) )
))
(declare-fun lt!568847 () Unit!41775)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1112 (array!81793 array!81795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 V!48191 V!48191 (_ BitVec 32) Int) Unit!41775)

(assert (=> b!1258000 (= lt!568847 (lemmaNoChangeToArrayThenSameMapNoExtras!1112 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5790 (array!81793 array!81795 (_ BitVec 32) (_ BitVec 32) V!48191 V!48191 (_ BitVec 32) Int) ListLongMap!18785)

(assert (=> b!1258000 (= lt!568844 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258000 (= lt!568845 (getCurrentListMapNoExtraKeys!5790 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258001 () Bool)

(declare-fun res!838506 () Bool)

(assert (=> b!1258001 (=> (not res!838506) (not e!715421))))

(declare-datatypes ((List!28120 0))(
  ( (Nil!28117) (Cons!28116 (h!29325 (_ BitVec 64)) (t!41604 List!28120)) )
))
(declare-fun arrayNoDuplicates!0 (array!81793 (_ BitVec 32) List!28120) Bool)

(assert (=> b!1258001 (= res!838506 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28117))))

(declare-fun b!1258002 () Bool)

(declare-fun e!715423 () Bool)

(declare-fun tp_is_empty!32119 () Bool)

(assert (=> b!1258002 (= e!715423 tp_is_empty!32119)))

(declare-fun mapNonEmpty!49972 () Bool)

(declare-fun tp!95173 () Bool)

(declare-fun e!715419 () Bool)

(assert (=> mapNonEmpty!49972 (= mapRes!49972 (and tp!95173 e!715419))))

(declare-fun mapValue!49972 () ValueCell!15296)

(declare-fun mapKey!49972 () (_ BitVec 32))

(declare-fun mapRest!49972 () (Array (_ BitVec 32) ValueCell!15296))

(assert (=> mapNonEmpty!49972 (= (arr!39454 _values!914) (store mapRest!49972 mapKey!49972 mapValue!49972))))

(declare-fun b!1258004 () Bool)

(declare-fun res!838503 () Bool)

(assert (=> b!1258004 (=> (not res!838503) (not e!715421))))

(assert (=> b!1258004 (= res!838503 (and (= (size!39992 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39991 _keys!1118) (size!39992 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258005 () Bool)

(declare-fun res!838505 () Bool)

(assert (=> b!1258005 (=> (not res!838505) (not e!715421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81793 (_ BitVec 32)) Bool)

(assert (=> b!1258005 (= res!838505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258006 () Bool)

(assert (=> b!1258006 (= e!715419 tp_is_empty!32119)))

(declare-fun res!838504 () Bool)

(assert (=> start!105612 (=> (not res!838504) (not e!715421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105612 (= res!838504 (validMask!0 mask!1466))))

(assert (=> start!105612 e!715421))

(assert (=> start!105612 true))

(assert (=> start!105612 tp!95174))

(assert (=> start!105612 tp_is_empty!32119))

(declare-fun array_inv!30183 (array!81793) Bool)

(assert (=> start!105612 (array_inv!30183 _keys!1118)))

(declare-fun e!715420 () Bool)

(declare-fun array_inv!30184 (array!81795) Bool)

(assert (=> start!105612 (and (array_inv!30184 _values!914) e!715420)))

(declare-fun b!1258003 () Bool)

(assert (=> b!1258003 (= e!715420 (and e!715423 mapRes!49972))))

(declare-fun condMapEmpty!49972 () Bool)

(declare-fun mapDefault!49972 () ValueCell!15296)

(assert (=> b!1258003 (= condMapEmpty!49972 (= (arr!39454 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15296)) mapDefault!49972)))))

(assert (= (and start!105612 res!838504) b!1258004))

(assert (= (and b!1258004 res!838503) b!1258005))

(assert (= (and b!1258005 res!838505) b!1258001))

(assert (= (and b!1258001 res!838506) b!1258000))

(assert (= (and b!1258000 (not res!838507)) b!1257999))

(assert (= (and b!1258003 condMapEmpty!49972) mapIsEmpty!49972))

(assert (= (and b!1258003 (not condMapEmpty!49972)) mapNonEmpty!49972))

(get-info :version)

(assert (= (and mapNonEmpty!49972 ((_ is ValueCellFull!15296) mapValue!49972)) b!1258006))

(assert (= (and b!1258003 ((_ is ValueCellFull!15296) mapDefault!49972)) b!1258002))

(assert (= start!105612 b!1258003))

(declare-fun m!1158049 () Bool)

(assert (=> b!1258000 m!1158049))

(declare-fun m!1158051 () Bool)

(assert (=> b!1258000 m!1158051))

(declare-fun m!1158053 () Bool)

(assert (=> b!1258000 m!1158053))

(declare-fun m!1158055 () Bool)

(assert (=> start!105612 m!1158055))

(declare-fun m!1158057 () Bool)

(assert (=> start!105612 m!1158057))

(declare-fun m!1158059 () Bool)

(assert (=> start!105612 m!1158059))

(declare-fun m!1158061 () Bool)

(assert (=> b!1258005 m!1158061))

(declare-fun m!1158063 () Bool)

(assert (=> mapNonEmpty!49972 m!1158063))

(declare-fun m!1158065 () Bool)

(assert (=> b!1257999 m!1158065))

(declare-fun m!1158067 () Bool)

(assert (=> b!1258001 m!1158067))

(check-sat (not b!1257999) (not start!105612) (not mapNonEmpty!49972) (not b!1258001) (not b!1258005) (not b!1258000) tp_is_empty!32119 b_and!45073 (not b_next!27217))
(check-sat b_and!45073 (not b_next!27217))
