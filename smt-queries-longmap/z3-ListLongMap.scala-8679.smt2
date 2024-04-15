; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105468 () Bool)

(assert start!105468)

(declare-fun b_free!27109 () Bool)

(declare-fun b_next!27109 () Bool)

(assert (=> start!105468 (= b_free!27109 (not b_next!27109))))

(declare-fun tp!94844 () Bool)

(declare-fun b_and!44947 () Bool)

(assert (=> start!105468 (= tp!94844 b_and!44947)))

(declare-fun b!1256463 () Bool)

(declare-fun e!714296 () Bool)

(declare-fun tp_is_empty!32011 () Bool)

(assert (=> b!1256463 (= e!714296 tp_is_empty!32011)))

(declare-fun res!837608 () Bool)

(declare-fun e!714300 () Bool)

(assert (=> start!105468 (=> (not res!837608) (not e!714300))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105468 (= res!837608 (validMask!0 mask!1466))))

(assert (=> start!105468 e!714300))

(assert (=> start!105468 true))

(assert (=> start!105468 tp!94844))

(assert (=> start!105468 tp_is_empty!32011))

(declare-datatypes ((array!81591 0))(
  ( (array!81592 (arr!39354 (Array (_ BitVec 32) (_ BitVec 64))) (size!39892 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81591)

(declare-fun array_inv!30117 (array!81591) Bool)

(assert (=> start!105468 (array_inv!30117 _keys!1118)))

(declare-datatypes ((V!48047 0))(
  ( (V!48048 (val!16068 Int)) )
))
(declare-datatypes ((ValueCell!15242 0))(
  ( (ValueCellFull!15242 (v!18768 V!48047)) (EmptyCell!15242) )
))
(declare-datatypes ((array!81593 0))(
  ( (array!81594 (arr!39355 (Array (_ BitVec 32) ValueCell!15242)) (size!39893 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81593)

(declare-fun e!714297 () Bool)

(declare-fun array_inv!30118 (array!81593) Bool)

(assert (=> start!105468 (and (array_inv!30118 _values!914) e!714297)))

(declare-fun b!1256464 () Bool)

(declare-fun mapRes!49804 () Bool)

(assert (=> b!1256464 (= e!714297 (and e!714296 mapRes!49804))))

(declare-fun condMapEmpty!49804 () Bool)

(declare-fun mapDefault!49804 () ValueCell!15242)

(assert (=> b!1256464 (= condMapEmpty!49804 (= (arr!39355 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15242)) mapDefault!49804)))))

(declare-fun b!1256465 () Bool)

(declare-fun e!714298 () Bool)

(assert (=> b!1256465 (= e!714298 true)))

(declare-datatypes ((tuple2!20838 0))(
  ( (tuple2!20839 (_1!10430 (_ BitVec 64)) (_2!10430 V!48047)) )
))
(declare-datatypes ((List!28047 0))(
  ( (Nil!28044) (Cons!28043 (h!29252 tuple2!20838) (t!41527 List!28047)) )
))
(declare-datatypes ((ListLongMap!18711 0))(
  ( (ListLongMap!18712 (toList!9371 List!28047)) )
))
(declare-fun lt!568038 () ListLongMap!18711)

(declare-fun -!2037 (ListLongMap!18711 (_ BitVec 64)) ListLongMap!18711)

(assert (=> b!1256465 (= (-!2037 lt!568038 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568038)))

(declare-datatypes ((Unit!41701 0))(
  ( (Unit!41702) )
))
(declare-fun lt!568034 () Unit!41701)

(declare-fun removeNotPresentStillSame!132 (ListLongMap!18711 (_ BitVec 64)) Unit!41701)

(assert (=> b!1256465 (= lt!568034 (removeNotPresentStillSame!132 lt!568038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256466 () Bool)

(declare-fun res!837603 () Bool)

(assert (=> b!1256466 (=> (not res!837603) (not e!714300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81591 (_ BitVec 32)) Bool)

(assert (=> b!1256466 (= res!837603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256467 () Bool)

(declare-fun res!837606 () Bool)

(assert (=> b!1256467 (=> (not res!837606) (not e!714300))))

(declare-datatypes ((List!28048 0))(
  ( (Nil!28045) (Cons!28044 (h!29253 (_ BitVec 64)) (t!41528 List!28048)) )
))
(declare-fun arrayNoDuplicates!0 (array!81591 (_ BitVec 32) List!28048) Bool)

(assert (=> b!1256467 (= res!837606 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28045))))

(declare-fun b!1256468 () Bool)

(declare-fun e!714295 () Bool)

(assert (=> b!1256468 (= e!714295 tp_is_empty!32011)))

(declare-fun mapNonEmpty!49804 () Bool)

(declare-fun tp!94843 () Bool)

(assert (=> mapNonEmpty!49804 (= mapRes!49804 (and tp!94843 e!714295))))

(declare-fun mapKey!49804 () (_ BitVec 32))

(declare-fun mapValue!49804 () ValueCell!15242)

(declare-fun mapRest!49804 () (Array (_ BitVec 32) ValueCell!15242))

(assert (=> mapNonEmpty!49804 (= (arr!39355 _values!914) (store mapRest!49804 mapKey!49804 mapValue!49804))))

(declare-fun b!1256469 () Bool)

(declare-fun res!837605 () Bool)

(assert (=> b!1256469 (=> (not res!837605) (not e!714300))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256469 (= res!837605 (and (= (size!39893 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39892 _keys!1118) (size!39893 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256470 () Bool)

(declare-fun e!714294 () Bool)

(assert (=> b!1256470 (= e!714294 e!714298)))

(declare-fun res!837604 () Bool)

(assert (=> b!1256470 (=> res!837604 e!714298)))

(declare-fun contains!7522 (ListLongMap!18711 (_ BitVec 64)) Bool)

(assert (=> b!1256470 (= res!837604 (contains!7522 lt!568038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48047)

(declare-fun minValueBefore!43 () V!48047)

(declare-fun getCurrentListMap!4481 (array!81591 array!81593 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18711)

(assert (=> b!1256470 (= lt!568038 (getCurrentListMap!4481 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49804 () Bool)

(assert (=> mapIsEmpty!49804 mapRes!49804))

(declare-fun b!1256471 () Bool)

(assert (=> b!1256471 (= e!714300 (not e!714294))))

(declare-fun res!837607 () Bool)

(assert (=> b!1256471 (=> res!837607 e!714294)))

(assert (=> b!1256471 (= res!837607 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568037 () ListLongMap!18711)

(declare-fun lt!568036 () ListLongMap!18711)

(assert (=> b!1256471 (= lt!568037 lt!568036)))

(declare-fun minValueAfter!43 () V!48047)

(declare-fun lt!568035 () Unit!41701)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1080 (array!81591 array!81593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 V!48047 V!48047 (_ BitVec 32) Int) Unit!41701)

(assert (=> b!1256471 (= lt!568035 (lemmaNoChangeToArrayThenSameMapNoExtras!1080 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5758 (array!81591 array!81593 (_ BitVec 32) (_ BitVec 32) V!48047 V!48047 (_ BitVec 32) Int) ListLongMap!18711)

(assert (=> b!1256471 (= lt!568036 (getCurrentListMapNoExtraKeys!5758 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256471 (= lt!568037 (getCurrentListMapNoExtraKeys!5758 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105468 res!837608) b!1256469))

(assert (= (and b!1256469 res!837605) b!1256466))

(assert (= (and b!1256466 res!837603) b!1256467))

(assert (= (and b!1256467 res!837606) b!1256471))

(assert (= (and b!1256471 (not res!837607)) b!1256470))

(assert (= (and b!1256470 (not res!837604)) b!1256465))

(assert (= (and b!1256464 condMapEmpty!49804) mapIsEmpty!49804))

(assert (= (and b!1256464 (not condMapEmpty!49804)) mapNonEmpty!49804))

(get-info :version)

(assert (= (and mapNonEmpty!49804 ((_ is ValueCellFull!15242) mapValue!49804)) b!1256468))

(assert (= (and b!1256464 ((_ is ValueCellFull!15242) mapDefault!49804)) b!1256463))

(assert (= start!105468 b!1256464))

(declare-fun m!1156669 () Bool)

(assert (=> b!1256470 m!1156669))

(declare-fun m!1156671 () Bool)

(assert (=> b!1256470 m!1156671))

(declare-fun m!1156673 () Bool)

(assert (=> mapNonEmpty!49804 m!1156673))

(declare-fun m!1156675 () Bool)

(assert (=> b!1256466 m!1156675))

(declare-fun m!1156677 () Bool)

(assert (=> start!105468 m!1156677))

(declare-fun m!1156679 () Bool)

(assert (=> start!105468 m!1156679))

(declare-fun m!1156681 () Bool)

(assert (=> start!105468 m!1156681))

(declare-fun m!1156683 () Bool)

(assert (=> b!1256467 m!1156683))

(declare-fun m!1156685 () Bool)

(assert (=> b!1256465 m!1156685))

(declare-fun m!1156687 () Bool)

(assert (=> b!1256465 m!1156687))

(declare-fun m!1156689 () Bool)

(assert (=> b!1256471 m!1156689))

(declare-fun m!1156691 () Bool)

(assert (=> b!1256471 m!1156691))

(declare-fun m!1156693 () Bool)

(assert (=> b!1256471 m!1156693))

(check-sat (not b!1256470) (not mapNonEmpty!49804) tp_is_empty!32011 b_and!44947 (not b!1256467) (not b_next!27109) (not b!1256465) (not b!1256471) (not b!1256466) (not start!105468))
(check-sat b_and!44947 (not b_next!27109))
