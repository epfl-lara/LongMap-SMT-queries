; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105864 () Bool)

(assert start!105864)

(declare-fun b_free!27241 () Bool)

(declare-fun b_next!27241 () Bool)

(assert (=> start!105864 (= b_free!27241 (not b_next!27241))))

(declare-fun tp!95246 () Bool)

(declare-fun b_and!45117 () Bool)

(assert (=> start!105864 (= tp!95246 b_and!45117)))

(declare-fun b!1259674 () Bool)

(declare-fun e!716529 () Bool)

(declare-fun e!716530 () Bool)

(assert (=> b!1259674 (= e!716529 (not e!716530))))

(declare-fun res!839243 () Bool)

(assert (=> b!1259674 (=> res!839243 e!716530)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259674 (= res!839243 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48223 0))(
  ( (V!48224 (val!16134 Int)) )
))
(declare-datatypes ((tuple2!20864 0))(
  ( (tuple2!20865 (_1!10443 (_ BitVec 64)) (_2!10443 V!48223)) )
))
(declare-datatypes ((List!28094 0))(
  ( (Nil!28091) (Cons!28090 (h!29308 tuple2!20864) (t!41579 List!28094)) )
))
(declare-datatypes ((ListLongMap!18745 0))(
  ( (ListLongMap!18746 (toList!9388 List!28094)) )
))
(declare-fun lt!569651 () ListLongMap!18745)

(declare-fun lt!569652 () ListLongMap!18745)

(assert (=> b!1259674 (= lt!569651 lt!569652)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48223)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48223)

(declare-datatypes ((array!81961 0))(
  ( (array!81962 (arr!39532 (Array (_ BitVec 32) (_ BitVec 64))) (size!40069 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81961)

(declare-datatypes ((ValueCell!15308 0))(
  ( (ValueCellFull!15308 (v!18832 V!48223)) (EmptyCell!15308) )
))
(declare-datatypes ((array!81963 0))(
  ( (array!81964 (arr!39533 (Array (_ BitVec 32) ValueCell!15308)) (size!40070 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81963)

(declare-datatypes ((Unit!41919 0))(
  ( (Unit!41920) )
))
(declare-fun lt!569653 () Unit!41919)

(declare-fun minValueBefore!43 () V!48223)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1118 (array!81961 array!81963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 V!48223 V!48223 (_ BitVec 32) Int) Unit!41919)

(assert (=> b!1259674 (= lt!569653 (lemmaNoChangeToArrayThenSameMapNoExtras!1118 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5804 (array!81961 array!81963 (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1259674 (= lt!569652 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259674 (= lt!569651 (getCurrentListMapNoExtraKeys!5804 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259675 () Bool)

(assert (=> b!1259675 (= e!716530 true)))

(declare-fun lt!569654 () ListLongMap!18745)

(declare-fun getCurrentListMap!4576 (array!81961 array!81963 (_ BitVec 32) (_ BitVec 32) V!48223 V!48223 (_ BitVec 32) Int) ListLongMap!18745)

(assert (=> b!1259675 (= lt!569654 (getCurrentListMap!4576 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50008 () Bool)

(declare-fun mapRes!50008 () Bool)

(assert (=> mapIsEmpty!50008 mapRes!50008))

(declare-fun b!1259676 () Bool)

(declare-fun e!716528 () Bool)

(declare-fun tp_is_empty!32143 () Bool)

(assert (=> b!1259676 (= e!716528 tp_is_empty!32143)))

(declare-fun b!1259677 () Bool)

(declare-fun e!716531 () Bool)

(assert (=> b!1259677 (= e!716531 (and e!716528 mapRes!50008))))

(declare-fun condMapEmpty!50008 () Bool)

(declare-fun mapDefault!50008 () ValueCell!15308)

(assert (=> b!1259677 (= condMapEmpty!50008 (= (arr!39533 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15308)) mapDefault!50008)))))

(declare-fun b!1259678 () Bool)

(declare-fun res!839246 () Bool)

(assert (=> b!1259678 (=> (not res!839246) (not e!716529))))

(assert (=> b!1259678 (= res!839246 (and (= (size!40070 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40069 _keys!1118) (size!40070 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259679 () Bool)

(declare-fun e!716532 () Bool)

(assert (=> b!1259679 (= e!716532 tp_is_empty!32143)))

(declare-fun mapNonEmpty!50008 () Bool)

(declare-fun tp!95245 () Bool)

(assert (=> mapNonEmpty!50008 (= mapRes!50008 (and tp!95245 e!716532))))

(declare-fun mapRest!50008 () (Array (_ BitVec 32) ValueCell!15308))

(declare-fun mapKey!50008 () (_ BitVec 32))

(declare-fun mapValue!50008 () ValueCell!15308)

(assert (=> mapNonEmpty!50008 (= (arr!39533 _values!914) (store mapRest!50008 mapKey!50008 mapValue!50008))))

(declare-fun b!1259680 () Bool)

(declare-fun res!839247 () Bool)

(assert (=> b!1259680 (=> (not res!839247) (not e!716529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81961 (_ BitVec 32)) Bool)

(assert (=> b!1259680 (= res!839247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259681 () Bool)

(declare-fun res!839245 () Bool)

(assert (=> b!1259681 (=> (not res!839245) (not e!716529))))

(declare-datatypes ((List!28095 0))(
  ( (Nil!28092) (Cons!28091 (h!29309 (_ BitVec 64)) (t!41580 List!28095)) )
))
(declare-fun arrayNoDuplicates!0 (array!81961 (_ BitVec 32) List!28095) Bool)

(assert (=> b!1259681 (= res!839245 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28092))))

(declare-fun res!839244 () Bool)

(assert (=> start!105864 (=> (not res!839244) (not e!716529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105864 (= res!839244 (validMask!0 mask!1466))))

(assert (=> start!105864 e!716529))

(assert (=> start!105864 true))

(assert (=> start!105864 tp!95246))

(assert (=> start!105864 tp_is_empty!32143))

(declare-fun array_inv!30247 (array!81961) Bool)

(assert (=> start!105864 (array_inv!30247 _keys!1118)))

(declare-fun array_inv!30248 (array!81963) Bool)

(assert (=> start!105864 (and (array_inv!30248 _values!914) e!716531)))

(assert (= (and start!105864 res!839244) b!1259678))

(assert (= (and b!1259678 res!839246) b!1259680))

(assert (= (and b!1259680 res!839247) b!1259681))

(assert (= (and b!1259681 res!839245) b!1259674))

(assert (= (and b!1259674 (not res!839243)) b!1259675))

(assert (= (and b!1259677 condMapEmpty!50008) mapIsEmpty!50008))

(assert (= (and b!1259677 (not condMapEmpty!50008)) mapNonEmpty!50008))

(get-info :version)

(assert (= (and mapNonEmpty!50008 ((_ is ValueCellFull!15308) mapValue!50008)) b!1259679))

(assert (= (and b!1259677 ((_ is ValueCellFull!15308) mapDefault!50008)) b!1259676))

(assert (= start!105864 b!1259677))

(declare-fun m!1160421 () Bool)

(assert (=> b!1259680 m!1160421))

(declare-fun m!1160423 () Bool)

(assert (=> mapNonEmpty!50008 m!1160423))

(declare-fun m!1160425 () Bool)

(assert (=> b!1259681 m!1160425))

(declare-fun m!1160427 () Bool)

(assert (=> b!1259674 m!1160427))

(declare-fun m!1160429 () Bool)

(assert (=> b!1259674 m!1160429))

(declare-fun m!1160431 () Bool)

(assert (=> b!1259674 m!1160431))

(declare-fun m!1160433 () Bool)

(assert (=> start!105864 m!1160433))

(declare-fun m!1160435 () Bool)

(assert (=> start!105864 m!1160435))

(declare-fun m!1160437 () Bool)

(assert (=> start!105864 m!1160437))

(declare-fun m!1160439 () Bool)

(assert (=> b!1259675 m!1160439))

(check-sat (not b!1259680) b_and!45117 (not b!1259681) (not b!1259675) (not b_next!27241) tp_is_empty!32143 (not mapNonEmpty!50008) (not b!1259674) (not start!105864))
(check-sat b_and!45117 (not b_next!27241))
