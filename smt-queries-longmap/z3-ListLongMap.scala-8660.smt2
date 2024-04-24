; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105546 () Bool)

(assert start!105546)

(declare-fun b_free!26995 () Bool)

(declare-fun b_next!26995 () Bool)

(assert (=> start!105546 (= b_free!26995 (not b_next!26995))))

(declare-fun tp!94495 () Bool)

(declare-fun b_and!44835 () Bool)

(assert (=> start!105546 (= tp!94495 b_and!44835)))

(declare-fun b!1256236 () Bool)

(declare-fun e!714002 () Bool)

(assert (=> b!1256236 (= e!714002 (not true))))

(declare-datatypes ((V!47895 0))(
  ( (V!47896 (val!16011 Int)) )
))
(declare-datatypes ((tuple2!20696 0))(
  ( (tuple2!20697 (_1!10359 (_ BitVec 64)) (_2!10359 V!47895)) )
))
(declare-datatypes ((List!27931 0))(
  ( (Nil!27928) (Cons!27927 (h!29145 tuple2!20696) (t!41408 List!27931)) )
))
(declare-datatypes ((ListLongMap!18577 0))(
  ( (ListLongMap!18578 (toList!9304 List!27931)) )
))
(declare-fun lt!567846 () ListLongMap!18577)

(declare-fun lt!567845 () ListLongMap!18577)

(assert (=> b!1256236 (= lt!567846 lt!567845)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41749 0))(
  ( (Unit!41750) )
))
(declare-fun lt!567847 () Unit!41749)

(declare-fun minValueAfter!43 () V!47895)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47895)

(declare-datatypes ((array!81495 0))(
  ( (array!81496 (arr!39303 (Array (_ BitVec 32) (_ BitVec 64))) (size!39840 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81495)

(declare-datatypes ((ValueCell!15185 0))(
  ( (ValueCellFull!15185 (v!18707 V!47895)) (EmptyCell!15185) )
))
(declare-datatypes ((array!81497 0))(
  ( (array!81498 (arr!39304 (Array (_ BitVec 32) ValueCell!15185)) (size!39841 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81497)

(declare-fun minValueBefore!43 () V!47895)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1040 (array!81495 array!81497 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 V!47895 V!47895 (_ BitVec 32) Int) Unit!41749)

(assert (=> b!1256236 (= lt!567847 (lemmaNoChangeToArrayThenSameMapNoExtras!1040 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5726 (array!81495 array!81497 (_ BitVec 32) (_ BitVec 32) V!47895 V!47895 (_ BitVec 32) Int) ListLongMap!18577)

(assert (=> b!1256236 (= lt!567845 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256236 (= lt!567846 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256237 () Bool)

(declare-fun res!837214 () Bool)

(assert (=> b!1256237 (=> (not res!837214) (not e!714002))))

(declare-datatypes ((List!27932 0))(
  ( (Nil!27929) (Cons!27928 (h!29146 (_ BitVec 64)) (t!41409 List!27932)) )
))
(declare-fun arrayNoDuplicates!0 (array!81495 (_ BitVec 32) List!27932) Bool)

(assert (=> b!1256237 (= res!837214 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27929))))

(declare-fun b!1256238 () Bool)

(declare-fun res!837213 () Bool)

(assert (=> b!1256238 (=> (not res!837213) (not e!714002))))

(assert (=> b!1256238 (= res!837213 (and (= (size!39841 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39840 _keys!1118) (size!39841 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49627 () Bool)

(declare-fun mapRes!49627 () Bool)

(assert (=> mapIsEmpty!49627 mapRes!49627))

(declare-fun b!1256239 () Bool)

(declare-fun res!837212 () Bool)

(assert (=> b!1256239 (=> (not res!837212) (not e!714002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81495 (_ BitVec 32)) Bool)

(assert (=> b!1256239 (= res!837212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256240 () Bool)

(declare-fun e!714005 () Bool)

(declare-fun tp_is_empty!31897 () Bool)

(assert (=> b!1256240 (= e!714005 tp_is_empty!31897)))

(declare-fun res!837215 () Bool)

(assert (=> start!105546 (=> (not res!837215) (not e!714002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105546 (= res!837215 (validMask!0 mask!1466))))

(assert (=> start!105546 e!714002))

(assert (=> start!105546 true))

(assert (=> start!105546 tp!94495))

(assert (=> start!105546 tp_is_empty!31897))

(declare-fun array_inv!30081 (array!81495) Bool)

(assert (=> start!105546 (array_inv!30081 _keys!1118)))

(declare-fun e!714004 () Bool)

(declare-fun array_inv!30082 (array!81497) Bool)

(assert (=> start!105546 (and (array_inv!30082 _values!914) e!714004)))

(declare-fun mapNonEmpty!49627 () Bool)

(declare-fun tp!94496 () Bool)

(assert (=> mapNonEmpty!49627 (= mapRes!49627 (and tp!94496 e!714005))))

(declare-fun mapKey!49627 () (_ BitVec 32))

(declare-fun mapValue!49627 () ValueCell!15185)

(declare-fun mapRest!49627 () (Array (_ BitVec 32) ValueCell!15185))

(assert (=> mapNonEmpty!49627 (= (arr!39304 _values!914) (store mapRest!49627 mapKey!49627 mapValue!49627))))

(declare-fun b!1256241 () Bool)

(declare-fun e!714003 () Bool)

(assert (=> b!1256241 (= e!714003 tp_is_empty!31897)))

(declare-fun b!1256242 () Bool)

(assert (=> b!1256242 (= e!714004 (and e!714003 mapRes!49627))))

(declare-fun condMapEmpty!49627 () Bool)

(declare-fun mapDefault!49627 () ValueCell!15185)

(assert (=> b!1256242 (= condMapEmpty!49627 (= (arr!39304 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15185)) mapDefault!49627)))))

(assert (= (and start!105546 res!837215) b!1256238))

(assert (= (and b!1256238 res!837213) b!1256239))

(assert (= (and b!1256239 res!837212) b!1256237))

(assert (= (and b!1256237 res!837214) b!1256236))

(assert (= (and b!1256242 condMapEmpty!49627) mapIsEmpty!49627))

(assert (= (and b!1256242 (not condMapEmpty!49627)) mapNonEmpty!49627))

(get-info :version)

(assert (= (and mapNonEmpty!49627 ((_ is ValueCellFull!15185) mapValue!49627)) b!1256240))

(assert (= (and b!1256242 ((_ is ValueCellFull!15185) mapDefault!49627)) b!1256241))

(assert (= start!105546 b!1256242))

(declare-fun m!1157355 () Bool)

(assert (=> mapNonEmpty!49627 m!1157355))

(declare-fun m!1157357 () Bool)

(assert (=> start!105546 m!1157357))

(declare-fun m!1157359 () Bool)

(assert (=> start!105546 m!1157359))

(declare-fun m!1157361 () Bool)

(assert (=> start!105546 m!1157361))

(declare-fun m!1157363 () Bool)

(assert (=> b!1256237 m!1157363))

(declare-fun m!1157365 () Bool)

(assert (=> b!1256236 m!1157365))

(declare-fun m!1157367 () Bool)

(assert (=> b!1256236 m!1157367))

(declare-fun m!1157369 () Bool)

(assert (=> b!1256236 m!1157369))

(declare-fun m!1157371 () Bool)

(assert (=> b!1256239 m!1157371))

(check-sat (not b!1256237) (not b!1256236) (not b!1256239) tp_is_empty!31897 b_and!44835 (not start!105546) (not mapNonEmpty!49627) (not b_next!26995))
(check-sat b_and!44835 (not b_next!26995))
