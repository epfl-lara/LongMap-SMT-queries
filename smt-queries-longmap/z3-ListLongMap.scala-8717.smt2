; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105770 () Bool)

(assert start!105770)

(declare-fun b_free!27337 () Bool)

(declare-fun b_next!27337 () Bool)

(assert (=> start!105770 (= b_free!27337 (not b_next!27337))))

(declare-fun tp!95540 () Bool)

(declare-fun b_and!45215 () Bool)

(assert (=> start!105770 (= tp!95540 b_and!45215)))

(declare-fun b!1259876 () Bool)

(declare-fun e!716815 () Bool)

(declare-fun e!716817 () Bool)

(assert (=> b!1259876 (= e!716815 (not e!716817))))

(declare-fun res!839650 () Bool)

(assert (=> b!1259876 (=> res!839650 e!716817)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259876 (= res!839650 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48351 0))(
  ( (V!48352 (val!16182 Int)) )
))
(declare-datatypes ((tuple2!21002 0))(
  ( (tuple2!21003 (_1!10512 (_ BitVec 64)) (_2!10512 V!48351)) )
))
(declare-datatypes ((List!28205 0))(
  ( (Nil!28202) (Cons!28201 (h!29410 tuple2!21002) (t!41693 List!28205)) )
))
(declare-datatypes ((ListLongMap!18875 0))(
  ( (ListLongMap!18876 (toList!9453 List!28205)) )
))
(declare-fun lt!570408 () ListLongMap!18875)

(declare-fun lt!570404 () ListLongMap!18875)

(assert (=> b!1259876 (= lt!570408 lt!570404)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41852 0))(
  ( (Unit!41853) )
))
(declare-fun lt!570412 () Unit!41852)

(declare-fun minValueAfter!43 () V!48351)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48351)

(declare-datatypes ((array!82023 0))(
  ( (array!82024 (arr!39566 (Array (_ BitVec 32) (_ BitVec 64))) (size!40104 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82023)

(declare-datatypes ((ValueCell!15356 0))(
  ( (ValueCellFull!15356 (v!18884 V!48351)) (EmptyCell!15356) )
))
(declare-datatypes ((array!82025 0))(
  ( (array!82026 (arr!39567 (Array (_ BitVec 32) ValueCell!15356)) (size!40105 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82025)

(declare-fun minValueBefore!43 () V!48351)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1146 (array!82023 array!82025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 V!48351 V!48351 (_ BitVec 32) Int) Unit!41852)

(assert (=> b!1259876 (= lt!570412 (lemmaNoChangeToArrayThenSameMapNoExtras!1146 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5824 (array!82023 array!82025 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18875)

(assert (=> b!1259876 (= lt!570404 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259876 (= lt!570408 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259877 () Bool)

(assert (=> b!1259877 (= e!716817 true)))

(declare-fun lt!570409 () ListLongMap!18875)

(declare-fun lt!570406 () ListLongMap!18875)

(declare-fun -!2072 (ListLongMap!18875 (_ BitVec 64)) ListLongMap!18875)

(assert (=> b!1259877 (= lt!570409 (-!2072 lt!570406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570413 () ListLongMap!18875)

(declare-fun lt!570411 () ListLongMap!18875)

(assert (=> b!1259877 (= (-!2072 lt!570413 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570411)))

(declare-fun lt!570410 () Unit!41852)

(declare-fun addThenRemoveForNewKeyIsSame!329 (ListLongMap!18875 (_ BitVec 64) V!48351) Unit!41852)

(assert (=> b!1259877 (= lt!570410 (addThenRemoveForNewKeyIsSame!329 lt!570411 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716821 () Bool)

(assert (=> b!1259877 e!716821))

(declare-fun res!839653 () Bool)

(assert (=> b!1259877 (=> (not res!839653) (not e!716821))))

(assert (=> b!1259877 (= res!839653 (= lt!570406 lt!570413))))

(declare-fun +!4254 (ListLongMap!18875 tuple2!21002) ListLongMap!18875)

(assert (=> b!1259877 (= lt!570413 (+!4254 lt!570411 (tuple2!21003 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570407 () tuple2!21002)

(assert (=> b!1259877 (= lt!570411 (+!4254 lt!570408 lt!570407))))

(assert (=> b!1259877 (= lt!570407 (tuple2!21003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570405 () ListLongMap!18875)

(declare-fun getCurrentListMap!4538 (array!82023 array!82025 (_ BitVec 32) (_ BitVec 32) V!48351 V!48351 (_ BitVec 32) Int) ListLongMap!18875)

(assert (=> b!1259877 (= lt!570405 (getCurrentListMap!4538 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259877 (= lt!570406 (getCurrentListMap!4538 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259878 () Bool)

(declare-fun e!716820 () Bool)

(declare-fun tp_is_empty!32239 () Bool)

(assert (=> b!1259878 (= e!716820 tp_is_empty!32239)))

(declare-fun b!1259879 () Bool)

(declare-fun res!839652 () Bool)

(assert (=> b!1259879 (=> (not res!839652) (not e!716815))))

(assert (=> b!1259879 (= res!839652 (and (= (size!40105 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40104 _keys!1118) (size!40105 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!839651 () Bool)

(assert (=> start!105770 (=> (not res!839651) (not e!716815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105770 (= res!839651 (validMask!0 mask!1466))))

(assert (=> start!105770 e!716815))

(assert (=> start!105770 true))

(assert (=> start!105770 tp!95540))

(assert (=> start!105770 tp_is_empty!32239))

(declare-fun array_inv!30269 (array!82023) Bool)

(assert (=> start!105770 (array_inv!30269 _keys!1118)))

(declare-fun e!716819 () Bool)

(declare-fun array_inv!30270 (array!82025) Bool)

(assert (=> start!105770 (and (array_inv!30270 _values!914) e!716819)))

(declare-fun b!1259880 () Bool)

(assert (=> b!1259880 (= e!716821 (= lt!570405 (+!4254 lt!570404 lt!570407)))))

(declare-fun b!1259881 () Bool)

(declare-fun res!839649 () Bool)

(assert (=> b!1259881 (=> (not res!839649) (not e!716815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82023 (_ BitVec 32)) Bool)

(assert (=> b!1259881 (= res!839649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50158 () Bool)

(declare-fun mapRes!50158 () Bool)

(assert (=> mapIsEmpty!50158 mapRes!50158))

(declare-fun mapNonEmpty!50158 () Bool)

(declare-fun tp!95539 () Bool)

(declare-fun e!716818 () Bool)

(assert (=> mapNonEmpty!50158 (= mapRes!50158 (and tp!95539 e!716818))))

(declare-fun mapKey!50158 () (_ BitVec 32))

(declare-fun mapRest!50158 () (Array (_ BitVec 32) ValueCell!15356))

(declare-fun mapValue!50158 () ValueCell!15356)

(assert (=> mapNonEmpty!50158 (= (arr!39567 _values!914) (store mapRest!50158 mapKey!50158 mapValue!50158))))

(declare-fun b!1259882 () Bool)

(declare-fun res!839648 () Bool)

(assert (=> b!1259882 (=> (not res!839648) (not e!716815))))

(declare-datatypes ((List!28206 0))(
  ( (Nil!28203) (Cons!28202 (h!29411 (_ BitVec 64)) (t!41694 List!28206)) )
))
(declare-fun arrayNoDuplicates!0 (array!82023 (_ BitVec 32) List!28206) Bool)

(assert (=> b!1259882 (= res!839648 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28203))))

(declare-fun b!1259883 () Bool)

(assert (=> b!1259883 (= e!716818 tp_is_empty!32239)))

(declare-fun b!1259884 () Bool)

(assert (=> b!1259884 (= e!716819 (and e!716820 mapRes!50158))))

(declare-fun condMapEmpty!50158 () Bool)

(declare-fun mapDefault!50158 () ValueCell!15356)

(assert (=> b!1259884 (= condMapEmpty!50158 (= (arr!39567 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15356)) mapDefault!50158)))))

(assert (= (and start!105770 res!839651) b!1259879))

(assert (= (and b!1259879 res!839652) b!1259881))

(assert (= (and b!1259881 res!839649) b!1259882))

(assert (= (and b!1259882 res!839648) b!1259876))

(assert (= (and b!1259876 (not res!839650)) b!1259877))

(assert (= (and b!1259877 res!839653) b!1259880))

(assert (= (and b!1259884 condMapEmpty!50158) mapIsEmpty!50158))

(assert (= (and b!1259884 (not condMapEmpty!50158)) mapNonEmpty!50158))

(get-info :version)

(assert (= (and mapNonEmpty!50158 ((_ is ValueCellFull!15356) mapValue!50158)) b!1259883))

(assert (= (and b!1259884 ((_ is ValueCellFull!15356) mapDefault!50158)) b!1259878))

(assert (= start!105770 b!1259884))

(declare-fun m!1160019 () Bool)

(assert (=> start!105770 m!1160019))

(declare-fun m!1160021 () Bool)

(assert (=> start!105770 m!1160021))

(declare-fun m!1160023 () Bool)

(assert (=> start!105770 m!1160023))

(declare-fun m!1160025 () Bool)

(assert (=> mapNonEmpty!50158 m!1160025))

(declare-fun m!1160027 () Bool)

(assert (=> b!1259880 m!1160027))

(declare-fun m!1160029 () Bool)

(assert (=> b!1259881 m!1160029))

(declare-fun m!1160031 () Bool)

(assert (=> b!1259876 m!1160031))

(declare-fun m!1160033 () Bool)

(assert (=> b!1259876 m!1160033))

(declare-fun m!1160035 () Bool)

(assert (=> b!1259876 m!1160035))

(declare-fun m!1160037 () Bool)

(assert (=> b!1259877 m!1160037))

(declare-fun m!1160039 () Bool)

(assert (=> b!1259877 m!1160039))

(declare-fun m!1160041 () Bool)

(assert (=> b!1259877 m!1160041))

(declare-fun m!1160043 () Bool)

(assert (=> b!1259877 m!1160043))

(declare-fun m!1160045 () Bool)

(assert (=> b!1259877 m!1160045))

(declare-fun m!1160047 () Bool)

(assert (=> b!1259877 m!1160047))

(declare-fun m!1160049 () Bool)

(assert (=> b!1259877 m!1160049))

(declare-fun m!1160051 () Bool)

(assert (=> b!1259882 m!1160051))

(check-sat (not b!1259877) (not b!1259882) (not b!1259876) tp_is_empty!32239 (not b!1259880) (not b_next!27337) (not mapNonEmpty!50158) (not start!105770) b_and!45215 (not b!1259881))
(check-sat b_and!45215 (not b_next!27337))
