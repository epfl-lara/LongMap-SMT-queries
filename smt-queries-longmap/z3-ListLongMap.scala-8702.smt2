; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105648 () Bool)

(assert start!105648)

(declare-fun b_free!27249 () Bool)

(declare-fun b_next!27249 () Bool)

(assert (=> start!105648 (= b_free!27249 (not b_next!27249))))

(declare-fun tp!95270 () Bool)

(declare-fun b_and!45123 () Bool)

(assert (=> start!105648 (= tp!95270 b_and!45123)))

(declare-fun b!1258465 () Bool)

(declare-fun res!838784 () Bool)

(declare-fun e!715754 () Bool)

(assert (=> b!1258465 (=> (not res!838784) (not e!715754))))

(declare-datatypes ((array!81922 0))(
  ( (array!81923 (arr!39517 (Array (_ BitVec 32) (_ BitVec 64))) (size!40053 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81922)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81922 (_ BitVec 32)) Bool)

(assert (=> b!1258465 (= res!838784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258466 () Bool)

(declare-fun e!715753 () Bool)

(declare-fun e!715752 () Bool)

(declare-fun mapRes!50020 () Bool)

(assert (=> b!1258466 (= e!715753 (and e!715752 mapRes!50020))))

(declare-fun condMapEmpty!50020 () Bool)

(declare-datatypes ((V!48233 0))(
  ( (V!48234 (val!16138 Int)) )
))
(declare-datatypes ((ValueCell!15312 0))(
  ( (ValueCellFull!15312 (v!18840 V!48233)) (EmptyCell!15312) )
))
(declare-datatypes ((array!81924 0))(
  ( (array!81925 (arr!39518 (Array (_ BitVec 32) ValueCell!15312)) (size!40054 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81924)

(declare-fun mapDefault!50020 () ValueCell!15312)

(assert (=> b!1258466 (= condMapEmpty!50020 (= (arr!39518 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15312)) mapDefault!50020)))))

(declare-fun b!1258467 () Bool)

(declare-fun tp_is_empty!32151 () Bool)

(assert (=> b!1258467 (= e!715752 tp_is_empty!32151)))

(declare-fun res!838786 () Bool)

(assert (=> start!105648 (=> (not res!838786) (not e!715754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105648 (= res!838786 (validMask!0 mask!1466))))

(assert (=> start!105648 e!715754))

(assert (=> start!105648 true))

(assert (=> start!105648 tp!95270))

(assert (=> start!105648 tp_is_empty!32151))

(declare-fun array_inv!30095 (array!81922) Bool)

(assert (=> start!105648 (array_inv!30095 _keys!1118)))

(declare-fun array_inv!30096 (array!81924) Bool)

(assert (=> start!105648 (and (array_inv!30096 _values!914) e!715753)))

(declare-fun b!1258468 () Bool)

(declare-fun res!838783 () Bool)

(assert (=> b!1258468 (=> (not res!838783) (not e!715754))))

(declare-datatypes ((List!28059 0))(
  ( (Nil!28056) (Cons!28055 (h!29264 (_ BitVec 64)) (t!41552 List!28059)) )
))
(declare-fun arrayNoDuplicates!0 (array!81922 (_ BitVec 32) List!28059) Bool)

(assert (=> b!1258468 (= res!838783 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28056))))

(declare-fun b!1258469 () Bool)

(declare-fun res!838785 () Bool)

(assert (=> b!1258469 (=> (not res!838785) (not e!715754))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258469 (= res!838785 (and (= (size!40054 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40053 _keys!1118) (size!40054 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258470 () Bool)

(declare-fun e!715755 () Bool)

(assert (=> b!1258470 (= e!715755 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48233)

(declare-datatypes ((tuple2!20844 0))(
  ( (tuple2!20845 (_1!10433 (_ BitVec 64)) (_2!10433 V!48233)) )
))
(declare-datatypes ((List!28060 0))(
  ( (Nil!28057) (Cons!28056 (h!29265 tuple2!20844) (t!41553 List!28060)) )
))
(declare-datatypes ((ListLongMap!18717 0))(
  ( (ListLongMap!18718 (toList!9374 List!28060)) )
))
(declare-fun lt!569216 () ListLongMap!18717)

(declare-fun minValueBefore!43 () V!48233)

(declare-fun getCurrentListMap!4579 (array!81922 array!81924 (_ BitVec 32) (_ BitVec 32) V!48233 V!48233 (_ BitVec 32) Int) ListLongMap!18717)

(assert (=> b!1258470 (= lt!569216 (getCurrentListMap!4579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50020 () Bool)

(declare-fun tp!95269 () Bool)

(declare-fun e!715756 () Bool)

(assert (=> mapNonEmpty!50020 (= mapRes!50020 (and tp!95269 e!715756))))

(declare-fun mapKey!50020 () (_ BitVec 32))

(declare-fun mapRest!50020 () (Array (_ BitVec 32) ValueCell!15312))

(declare-fun mapValue!50020 () ValueCell!15312)

(assert (=> mapNonEmpty!50020 (= (arr!39518 _values!914) (store mapRest!50020 mapKey!50020 mapValue!50020))))

(declare-fun b!1258471 () Bool)

(assert (=> b!1258471 (= e!715754 (not e!715755))))

(declare-fun res!838787 () Bool)

(assert (=> b!1258471 (=> res!838787 e!715755)))

(assert (=> b!1258471 (= res!838787 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569218 () ListLongMap!18717)

(declare-fun lt!569217 () ListLongMap!18717)

(assert (=> b!1258471 (= lt!569218 lt!569217)))

(declare-fun minValueAfter!43 () V!48233)

(declare-datatypes ((Unit!41930 0))(
  ( (Unit!41931) )
))
(declare-fun lt!569215 () Unit!41930)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1115 (array!81922 array!81924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48233 V!48233 V!48233 V!48233 (_ BitVec 32) Int) Unit!41930)

(assert (=> b!1258471 (= lt!569215 (lemmaNoChangeToArrayThenSameMapNoExtras!1115 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5751 (array!81922 array!81924 (_ BitVec 32) (_ BitVec 32) V!48233 V!48233 (_ BitVec 32) Int) ListLongMap!18717)

(assert (=> b!1258471 (= lt!569217 (getCurrentListMapNoExtraKeys!5751 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258471 (= lt!569218 (getCurrentListMapNoExtraKeys!5751 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50020 () Bool)

(assert (=> mapIsEmpty!50020 mapRes!50020))

(declare-fun b!1258472 () Bool)

(assert (=> b!1258472 (= e!715756 tp_is_empty!32151)))

(assert (= (and start!105648 res!838786) b!1258469))

(assert (= (and b!1258469 res!838785) b!1258465))

(assert (= (and b!1258465 res!838784) b!1258468))

(assert (= (and b!1258468 res!838783) b!1258471))

(assert (= (and b!1258471 (not res!838787)) b!1258470))

(assert (= (and b!1258466 condMapEmpty!50020) mapIsEmpty!50020))

(assert (= (and b!1258466 (not condMapEmpty!50020)) mapNonEmpty!50020))

(get-info :version)

(assert (= (and mapNonEmpty!50020 ((_ is ValueCellFull!15312) mapValue!50020)) b!1258472))

(assert (= (and b!1258466 ((_ is ValueCellFull!15312) mapDefault!50020)) b!1258467))

(assert (= start!105648 b!1258466))

(declare-fun m!1158889 () Bool)

(assert (=> b!1258465 m!1158889))

(declare-fun m!1158891 () Bool)

(assert (=> b!1258471 m!1158891))

(declare-fun m!1158893 () Bool)

(assert (=> b!1258471 m!1158893))

(declare-fun m!1158895 () Bool)

(assert (=> b!1258471 m!1158895))

(declare-fun m!1158897 () Bool)

(assert (=> b!1258470 m!1158897))

(declare-fun m!1158899 () Bool)

(assert (=> b!1258468 m!1158899))

(declare-fun m!1158901 () Bool)

(assert (=> mapNonEmpty!50020 m!1158901))

(declare-fun m!1158903 () Bool)

(assert (=> start!105648 m!1158903))

(declare-fun m!1158905 () Bool)

(assert (=> start!105648 m!1158905))

(declare-fun m!1158907 () Bool)

(assert (=> start!105648 m!1158907))

(check-sat (not b!1258470) (not b!1258465) (not start!105648) (not mapNonEmpty!50020) (not b!1258468) tp_is_empty!32151 (not b_next!27249) b_and!45123 (not b!1258471))
(check-sat b_and!45123 (not b_next!27249))
