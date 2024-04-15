; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105474 () Bool)

(assert start!105474)

(declare-fun b_free!27115 () Bool)

(declare-fun b_next!27115 () Bool)

(assert (=> start!105474 (= b_free!27115 (not b_next!27115))))

(declare-fun tp!94861 () Bool)

(declare-fun b_and!44953 () Bool)

(assert (=> start!105474 (= tp!94861 b_and!44953)))

(declare-fun b!1256544 () Bool)

(declare-fun res!837660 () Bool)

(declare-fun e!714363 () Bool)

(assert (=> b!1256544 (=> (not res!837660) (not e!714363))))

(declare-datatypes ((array!81603 0))(
  ( (array!81604 (arr!39360 (Array (_ BitVec 32) (_ BitVec 64))) (size!39898 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81603)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81603 (_ BitVec 32)) Bool)

(assert (=> b!1256544 (= res!837660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256546 () Bool)

(declare-fun e!714361 () Bool)

(assert (=> b!1256546 (= e!714361 true)))

(declare-datatypes ((V!48055 0))(
  ( (V!48056 (val!16071 Int)) )
))
(declare-datatypes ((tuple2!20844 0))(
  ( (tuple2!20845 (_1!10433 (_ BitVec 64)) (_2!10433 V!48055)) )
))
(declare-datatypes ((List!28052 0))(
  ( (Nil!28049) (Cons!28048 (h!29257 tuple2!20844) (t!41532 List!28052)) )
))
(declare-datatypes ((ListLongMap!18717 0))(
  ( (ListLongMap!18718 (toList!9374 List!28052)) )
))
(declare-fun lt!568082 () ListLongMap!18717)

(declare-fun -!2039 (ListLongMap!18717 (_ BitVec 64)) ListLongMap!18717)

(assert (=> b!1256546 (= (-!2039 lt!568082 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568082)))

(declare-datatypes ((Unit!41705 0))(
  ( (Unit!41706) )
))
(declare-fun lt!568083 () Unit!41705)

(declare-fun removeNotPresentStillSame!134 (ListLongMap!18717 (_ BitVec 64)) Unit!41705)

(assert (=> b!1256546 (= lt!568083 (removeNotPresentStillSame!134 lt!568082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256547 () Bool)

(declare-fun e!714362 () Bool)

(assert (=> b!1256547 (= e!714363 (not e!714362))))

(declare-fun res!837662 () Bool)

(assert (=> b!1256547 (=> res!837662 e!714362)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256547 (= res!837662 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568081 () ListLongMap!18717)

(declare-fun lt!568080 () ListLongMap!18717)

(assert (=> b!1256547 (= lt!568081 lt!568080)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48055)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48055)

(declare-datatypes ((ValueCell!15245 0))(
  ( (ValueCellFull!15245 (v!18771 V!48055)) (EmptyCell!15245) )
))
(declare-datatypes ((array!81605 0))(
  ( (array!81606 (arr!39361 (Array (_ BitVec 32) ValueCell!15245)) (size!39899 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81605)

(declare-fun minValueBefore!43 () V!48055)

(declare-fun lt!568079 () Unit!41705)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1081 (array!81603 array!81605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 V!48055 V!48055 (_ BitVec 32) Int) Unit!41705)

(assert (=> b!1256547 (= lt!568079 (lemmaNoChangeToArrayThenSameMapNoExtras!1081 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5759 (array!81603 array!81605 (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 (_ BitVec 32) Int) ListLongMap!18717)

(assert (=> b!1256547 (= lt!568080 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256547 (= lt!568081 (getCurrentListMapNoExtraKeys!5759 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256548 () Bool)

(declare-fun res!837659 () Bool)

(assert (=> b!1256548 (=> (not res!837659) (not e!714363))))

(assert (=> b!1256548 (= res!837659 (and (= (size!39899 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39898 _keys!1118) (size!39899 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256549 () Bool)

(declare-fun e!714359 () Bool)

(declare-fun e!714357 () Bool)

(declare-fun mapRes!49813 () Bool)

(assert (=> b!1256549 (= e!714359 (and e!714357 mapRes!49813))))

(declare-fun condMapEmpty!49813 () Bool)

(declare-fun mapDefault!49813 () ValueCell!15245)

(assert (=> b!1256549 (= condMapEmpty!49813 (= (arr!39361 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15245)) mapDefault!49813)))))

(declare-fun b!1256550 () Bool)

(declare-fun tp_is_empty!32017 () Bool)

(assert (=> b!1256550 (= e!714357 tp_is_empty!32017)))

(declare-fun mapNonEmpty!49813 () Bool)

(declare-fun tp!94862 () Bool)

(declare-fun e!714360 () Bool)

(assert (=> mapNonEmpty!49813 (= mapRes!49813 (and tp!94862 e!714360))))

(declare-fun mapRest!49813 () (Array (_ BitVec 32) ValueCell!15245))

(declare-fun mapKey!49813 () (_ BitVec 32))

(declare-fun mapValue!49813 () ValueCell!15245)

(assert (=> mapNonEmpty!49813 (= (arr!39361 _values!914) (store mapRest!49813 mapKey!49813 mapValue!49813))))

(declare-fun b!1256551 () Bool)

(assert (=> b!1256551 (= e!714360 tp_is_empty!32017)))

(declare-fun b!1256545 () Bool)

(declare-fun res!837661 () Bool)

(assert (=> b!1256545 (=> (not res!837661) (not e!714363))))

(declare-datatypes ((List!28053 0))(
  ( (Nil!28050) (Cons!28049 (h!29258 (_ BitVec 64)) (t!41533 List!28053)) )
))
(declare-fun arrayNoDuplicates!0 (array!81603 (_ BitVec 32) List!28053) Bool)

(assert (=> b!1256545 (= res!837661 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28050))))

(declare-fun res!837658 () Bool)

(assert (=> start!105474 (=> (not res!837658) (not e!714363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105474 (= res!837658 (validMask!0 mask!1466))))

(assert (=> start!105474 e!714363))

(assert (=> start!105474 true))

(assert (=> start!105474 tp!94861))

(assert (=> start!105474 tp_is_empty!32017))

(declare-fun array_inv!30121 (array!81603) Bool)

(assert (=> start!105474 (array_inv!30121 _keys!1118)))

(declare-fun array_inv!30122 (array!81605) Bool)

(assert (=> start!105474 (and (array_inv!30122 _values!914) e!714359)))

(declare-fun b!1256552 () Bool)

(assert (=> b!1256552 (= e!714362 e!714361)))

(declare-fun res!837657 () Bool)

(assert (=> b!1256552 (=> res!837657 e!714361)))

(declare-fun contains!7525 (ListLongMap!18717 (_ BitVec 64)) Bool)

(assert (=> b!1256552 (= res!837657 (contains!7525 lt!568082 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4484 (array!81603 array!81605 (_ BitVec 32) (_ BitVec 32) V!48055 V!48055 (_ BitVec 32) Int) ListLongMap!18717)

(assert (=> b!1256552 (= lt!568082 (getCurrentListMap!4484 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49813 () Bool)

(assert (=> mapIsEmpty!49813 mapRes!49813))

(assert (= (and start!105474 res!837658) b!1256548))

(assert (= (and b!1256548 res!837659) b!1256544))

(assert (= (and b!1256544 res!837660) b!1256545))

(assert (= (and b!1256545 res!837661) b!1256547))

(assert (= (and b!1256547 (not res!837662)) b!1256552))

(assert (= (and b!1256552 (not res!837657)) b!1256546))

(assert (= (and b!1256549 condMapEmpty!49813) mapIsEmpty!49813))

(assert (= (and b!1256549 (not condMapEmpty!49813)) mapNonEmpty!49813))

(get-info :version)

(assert (= (and mapNonEmpty!49813 ((_ is ValueCellFull!15245) mapValue!49813)) b!1256551))

(assert (= (and b!1256549 ((_ is ValueCellFull!15245) mapDefault!49813)) b!1256550))

(assert (= start!105474 b!1256549))

(declare-fun m!1156747 () Bool)

(assert (=> b!1256544 m!1156747))

(declare-fun m!1156749 () Bool)

(assert (=> mapNonEmpty!49813 m!1156749))

(declare-fun m!1156751 () Bool)

(assert (=> b!1256545 m!1156751))

(declare-fun m!1156753 () Bool)

(assert (=> b!1256546 m!1156753))

(declare-fun m!1156755 () Bool)

(assert (=> b!1256546 m!1156755))

(declare-fun m!1156757 () Bool)

(assert (=> b!1256547 m!1156757))

(declare-fun m!1156759 () Bool)

(assert (=> b!1256547 m!1156759))

(declare-fun m!1156761 () Bool)

(assert (=> b!1256547 m!1156761))

(declare-fun m!1156763 () Bool)

(assert (=> start!105474 m!1156763))

(declare-fun m!1156765 () Bool)

(assert (=> start!105474 m!1156765))

(declare-fun m!1156767 () Bool)

(assert (=> start!105474 m!1156767))

(declare-fun m!1156769 () Bool)

(assert (=> b!1256552 m!1156769))

(declare-fun m!1156771 () Bool)

(assert (=> b!1256552 m!1156771))

(check-sat (not b!1256546) (not b_next!27115) (not b!1256552) b_and!44953 (not b!1256544) (not b!1256547) (not mapNonEmpty!49813) tp_is_empty!32017 (not start!105474) (not b!1256545))
(check-sat b_and!44953 (not b_next!27115))
