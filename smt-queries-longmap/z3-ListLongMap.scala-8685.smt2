; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105510 () Bool)

(assert start!105510)

(declare-fun b_free!27147 () Bool)

(declare-fun b_next!27147 () Bool)

(assert (=> start!105510 (= b_free!27147 (not b_next!27147))))

(declare-fun tp!94957 () Bool)

(declare-fun b_and!45003 () Bool)

(assert (=> start!105510 (= tp!94957 b_and!45003)))

(declare-fun b!1257058 () Bool)

(declare-fun e!714742 () Bool)

(declare-fun e!714741 () Bool)

(assert (=> b!1257058 (= e!714742 (not e!714741))))

(declare-fun res!837990 () Bool)

(assert (=> b!1257058 (=> res!837990 e!714741)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257058 (= res!837990 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48097 0))(
  ( (V!48098 (val!16087 Int)) )
))
(declare-datatypes ((tuple2!20780 0))(
  ( (tuple2!20781 (_1!10401 (_ BitVec 64)) (_2!10401 V!48097)) )
))
(declare-datatypes ((List!27997 0))(
  ( (Nil!27994) (Cons!27993 (h!29202 tuple2!20780) (t!41486 List!27997)) )
))
(declare-datatypes ((ListLongMap!18653 0))(
  ( (ListLongMap!18654 (toList!9342 List!27997)) )
))
(declare-fun lt!568500 () ListLongMap!18653)

(declare-fun lt!568501 () ListLongMap!18653)

(assert (=> b!1257058 (= lt!568500 lt!568501)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48097)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48097)

(declare-datatypes ((array!81732 0))(
  ( (array!81733 (arr!39424 (Array (_ BitVec 32) (_ BitVec 64))) (size!39960 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81732)

(declare-datatypes ((ValueCell!15261 0))(
  ( (ValueCellFull!15261 (v!18788 V!48097)) (EmptyCell!15261) )
))
(declare-datatypes ((array!81734 0))(
  ( (array!81735 (arr!39425 (Array (_ BitVec 32) ValueCell!15261)) (size!39961 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81734)

(declare-datatypes ((Unit!41868 0))(
  ( (Unit!41869) )
))
(declare-fun lt!568499 () Unit!41868)

(declare-fun minValueBefore!43 () V!48097)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1087 (array!81732 array!81734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48097 V!48097 V!48097 V!48097 (_ BitVec 32) Int) Unit!41868)

(assert (=> b!1257058 (= lt!568499 (lemmaNoChangeToArrayThenSameMapNoExtras!1087 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5723 (array!81732 array!81734 (_ BitVec 32) (_ BitVec 32) V!48097 V!48097 (_ BitVec 32) Int) ListLongMap!18653)

(assert (=> b!1257058 (= lt!568501 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257058 (= lt!568500 (getCurrentListMapNoExtraKeys!5723 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837987 () Bool)

(assert (=> start!105510 (=> (not res!837987) (not e!714742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105510 (= res!837987 (validMask!0 mask!1466))))

(assert (=> start!105510 e!714742))

(assert (=> start!105510 true))

(assert (=> start!105510 tp!94957))

(declare-fun tp_is_empty!32049 () Bool)

(assert (=> start!105510 tp_is_empty!32049))

(declare-fun array_inv!30029 (array!81732) Bool)

(assert (=> start!105510 (array_inv!30029 _keys!1118)))

(declare-fun e!714744 () Bool)

(declare-fun array_inv!30030 (array!81734) Bool)

(assert (=> start!105510 (and (array_inv!30030 _values!914) e!714744)))

(declare-fun mapIsEmpty!49861 () Bool)

(declare-fun mapRes!49861 () Bool)

(assert (=> mapIsEmpty!49861 mapRes!49861))

(declare-fun mapNonEmpty!49861 () Bool)

(declare-fun tp!94958 () Bool)

(declare-fun e!714738 () Bool)

(assert (=> mapNonEmpty!49861 (= mapRes!49861 (and tp!94958 e!714738))))

(declare-fun mapRest!49861 () (Array (_ BitVec 32) ValueCell!15261))

(declare-fun mapKey!49861 () (_ BitVec 32))

(declare-fun mapValue!49861 () ValueCell!15261)

(assert (=> mapNonEmpty!49861 (= (arr!39425 _values!914) (store mapRest!49861 mapKey!49861 mapValue!49861))))

(declare-fun b!1257059 () Bool)

(declare-fun e!714740 () Bool)

(assert (=> b!1257059 (= e!714740 tp_is_empty!32049)))

(declare-fun b!1257060 () Bool)

(assert (=> b!1257060 (= e!714738 tp_is_empty!32049)))

(declare-fun b!1257061 () Bool)

(assert (=> b!1257061 (= e!714744 (and e!714740 mapRes!49861))))

(declare-fun condMapEmpty!49861 () Bool)

(declare-fun mapDefault!49861 () ValueCell!15261)

(assert (=> b!1257061 (= condMapEmpty!49861 (= (arr!39425 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15261)) mapDefault!49861)))))

(declare-fun b!1257062 () Bool)

(declare-fun res!837985 () Bool)

(assert (=> b!1257062 (=> (not res!837985) (not e!714742))))

(assert (=> b!1257062 (= res!837985 (and (= (size!39961 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39960 _keys!1118) (size!39961 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257063 () Bool)

(declare-fun e!714739 () Bool)

(assert (=> b!1257063 (= e!714741 e!714739)))

(declare-fun res!837986 () Bool)

(assert (=> b!1257063 (=> res!837986 e!714739)))

(declare-fun lt!568502 () ListLongMap!18653)

(declare-fun contains!7559 (ListLongMap!18653 (_ BitVec 64)) Bool)

(assert (=> b!1257063 (= res!837986 (contains!7559 lt!568502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4564 (array!81732 array!81734 (_ BitVec 32) (_ BitVec 32) V!48097 V!48097 (_ BitVec 32) Int) ListLongMap!18653)

(assert (=> b!1257063 (= lt!568502 (getCurrentListMap!4564 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257064 () Bool)

(declare-fun res!837989 () Bool)

(assert (=> b!1257064 (=> (not res!837989) (not e!714742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81732 (_ BitVec 32)) Bool)

(assert (=> b!1257064 (= res!837989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257065 () Bool)

(declare-fun res!837988 () Bool)

(assert (=> b!1257065 (=> (not res!837988) (not e!714742))))

(declare-datatypes ((List!27998 0))(
  ( (Nil!27995) (Cons!27994 (h!29203 (_ BitVec 64)) (t!41487 List!27998)) )
))
(declare-fun arrayNoDuplicates!0 (array!81732 (_ BitVec 32) List!27998) Bool)

(assert (=> b!1257065 (= res!837988 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27995))))

(declare-fun b!1257066 () Bool)

(assert (=> b!1257066 (= e!714739 true)))

(declare-fun -!2090 (ListLongMap!18653 (_ BitVec 64)) ListLongMap!18653)

(assert (=> b!1257066 (= (-!2090 lt!568502 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568502)))

(declare-fun lt!568498 () Unit!41868)

(declare-fun removeNotPresentStillSame!143 (ListLongMap!18653 (_ BitVec 64)) Unit!41868)

(assert (=> b!1257066 (= lt!568498 (removeNotPresentStillSame!143 lt!568502 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105510 res!837987) b!1257062))

(assert (= (and b!1257062 res!837985) b!1257064))

(assert (= (and b!1257064 res!837989) b!1257065))

(assert (= (and b!1257065 res!837988) b!1257058))

(assert (= (and b!1257058 (not res!837990)) b!1257063))

(assert (= (and b!1257063 (not res!837986)) b!1257066))

(assert (= (and b!1257061 condMapEmpty!49861) mapIsEmpty!49861))

(assert (= (and b!1257061 (not condMapEmpty!49861)) mapNonEmpty!49861))

(get-info :version)

(assert (= (and mapNonEmpty!49861 ((_ is ValueCellFull!15261) mapValue!49861)) b!1257060))

(assert (= (and b!1257061 ((_ is ValueCellFull!15261) mapDefault!49861)) b!1257059))

(assert (= start!105510 b!1257061))

(declare-fun m!1157683 () Bool)

(assert (=> b!1257066 m!1157683))

(declare-fun m!1157685 () Bool)

(assert (=> b!1257066 m!1157685))

(declare-fun m!1157687 () Bool)

(assert (=> b!1257065 m!1157687))

(declare-fun m!1157689 () Bool)

(assert (=> b!1257063 m!1157689))

(declare-fun m!1157691 () Bool)

(assert (=> b!1257063 m!1157691))

(declare-fun m!1157693 () Bool)

(assert (=> b!1257064 m!1157693))

(declare-fun m!1157695 () Bool)

(assert (=> mapNonEmpty!49861 m!1157695))

(declare-fun m!1157697 () Bool)

(assert (=> b!1257058 m!1157697))

(declare-fun m!1157699 () Bool)

(assert (=> b!1257058 m!1157699))

(declare-fun m!1157701 () Bool)

(assert (=> b!1257058 m!1157701))

(declare-fun m!1157703 () Bool)

(assert (=> start!105510 m!1157703))

(declare-fun m!1157705 () Bool)

(assert (=> start!105510 m!1157705))

(declare-fun m!1157707 () Bool)

(assert (=> start!105510 m!1157707))

(check-sat (not b!1257058) (not b!1257064) b_and!45003 (not mapNonEmpty!49861) (not b_next!27147) (not b!1257066) (not b!1257063) (not b!1257065) (not start!105510) tp_is_empty!32049)
(check-sat b_and!45003 (not b_next!27147))
