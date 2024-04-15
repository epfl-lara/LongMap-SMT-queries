; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105324 () Bool)

(assert start!105324)

(declare-fun b_free!27001 () Bool)

(declare-fun b_next!27001 () Bool)

(assert (=> start!105324 (= b_free!27001 (not b_next!27001))))

(declare-fun tp!94514 () Bool)

(declare-fun b_and!44821 () Bool)

(assert (=> start!105324 (= tp!94514 b_and!44821)))

(declare-fun b!1254912 () Bool)

(declare-fun res!836690 () Bool)

(declare-fun e!713154 () Bool)

(assert (=> b!1254912 (=> (not res!836690) (not e!713154))))

(declare-datatypes ((array!81383 0))(
  ( (array!81384 (arr!39252 (Array (_ BitVec 32) (_ BitVec 64))) (size!39790 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81383)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81383 (_ BitVec 32)) Bool)

(assert (=> b!1254912 (= res!836690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836689 () Bool)

(assert (=> start!105324 (=> (not res!836689) (not e!713154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105324 (= res!836689 (validMask!0 mask!1466))))

(assert (=> start!105324 e!713154))

(assert (=> start!105324 true))

(assert (=> start!105324 tp!94514))

(declare-fun tp_is_empty!31903 () Bool)

(assert (=> start!105324 tp_is_empty!31903))

(declare-fun array_inv!30049 (array!81383) Bool)

(assert (=> start!105324 (array_inv!30049 _keys!1118)))

(declare-datatypes ((V!47903 0))(
  ( (V!47904 (val!16014 Int)) )
))
(declare-datatypes ((ValueCell!15188 0))(
  ( (ValueCellFull!15188 (v!18713 V!47903)) (EmptyCell!15188) )
))
(declare-datatypes ((array!81385 0))(
  ( (array!81386 (arr!39253 (Array (_ BitVec 32) ValueCell!15188)) (size!39791 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81385)

(declare-fun e!713155 () Bool)

(declare-fun array_inv!30050 (array!81385) Bool)

(assert (=> start!105324 (and (array_inv!30050 _values!914) e!713155)))

(declare-fun b!1254913 () Bool)

(declare-fun res!836691 () Bool)

(assert (=> b!1254913 (=> (not res!836691) (not e!713154))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254913 (= res!836691 (and (= (size!39791 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39790 _keys!1118) (size!39791 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254914 () Bool)

(assert (=> b!1254914 (= e!713154 (not true))))

(declare-datatypes ((tuple2!20758 0))(
  ( (tuple2!20759 (_1!10390 (_ BitVec 64)) (_2!10390 V!47903)) )
))
(declare-datatypes ((List!27968 0))(
  ( (Nil!27965) (Cons!27964 (h!29173 tuple2!20758) (t!41444 List!27968)) )
))
(declare-datatypes ((ListLongMap!18631 0))(
  ( (ListLongMap!18632 (toList!9331 List!27968)) )
))
(declare-fun lt!567211 () ListLongMap!18631)

(declare-fun lt!567209 () ListLongMap!18631)

(assert (=> b!1254914 (= lt!567211 lt!567209)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47903)

(declare-datatypes ((Unit!41629 0))(
  ( (Unit!41630) )
))
(declare-fun lt!567210 () Unit!41629)

(declare-fun zeroValue!871 () V!47903)

(declare-fun minValueBefore!43 () V!47903)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1048 (array!81383 array!81385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47903 V!47903 V!47903 V!47903 (_ BitVec 32) Int) Unit!41629)

(assert (=> b!1254914 (= lt!567210 (lemmaNoChangeToArrayThenSameMapNoExtras!1048 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5726 (array!81383 array!81385 (_ BitVec 32) (_ BitVec 32) V!47903 V!47903 (_ BitVec 32) Int) ListLongMap!18631)

(assert (=> b!1254914 (= lt!567209 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254914 (= lt!567211 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254915 () Bool)

(declare-fun res!836688 () Bool)

(assert (=> b!1254915 (=> (not res!836688) (not e!713154))))

(declare-datatypes ((List!27969 0))(
  ( (Nil!27966) (Cons!27965 (h!29174 (_ BitVec 64)) (t!41445 List!27969)) )
))
(declare-fun arrayNoDuplicates!0 (array!81383 (_ BitVec 32) List!27969) Bool)

(assert (=> b!1254915 (= res!836688 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27966))))

(declare-fun mapIsEmpty!49636 () Bool)

(declare-fun mapRes!49636 () Bool)

(assert (=> mapIsEmpty!49636 mapRes!49636))

(declare-fun b!1254916 () Bool)

(declare-fun e!713156 () Bool)

(assert (=> b!1254916 (= e!713156 tp_is_empty!31903)))

(declare-fun b!1254917 () Bool)

(assert (=> b!1254917 (= e!713155 (and e!713156 mapRes!49636))))

(declare-fun condMapEmpty!49636 () Bool)

(declare-fun mapDefault!49636 () ValueCell!15188)

(assert (=> b!1254917 (= condMapEmpty!49636 (= (arr!39253 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15188)) mapDefault!49636)))))

(declare-fun b!1254918 () Bool)

(declare-fun e!713158 () Bool)

(assert (=> b!1254918 (= e!713158 tp_is_empty!31903)))

(declare-fun mapNonEmpty!49636 () Bool)

(declare-fun tp!94513 () Bool)

(assert (=> mapNonEmpty!49636 (= mapRes!49636 (and tp!94513 e!713158))))

(declare-fun mapValue!49636 () ValueCell!15188)

(declare-fun mapKey!49636 () (_ BitVec 32))

(declare-fun mapRest!49636 () (Array (_ BitVec 32) ValueCell!15188))

(assert (=> mapNonEmpty!49636 (= (arr!39253 _values!914) (store mapRest!49636 mapKey!49636 mapValue!49636))))

(assert (= (and start!105324 res!836689) b!1254913))

(assert (= (and b!1254913 res!836691) b!1254912))

(assert (= (and b!1254912 res!836690) b!1254915))

(assert (= (and b!1254915 res!836688) b!1254914))

(assert (= (and b!1254917 condMapEmpty!49636) mapIsEmpty!49636))

(assert (= (and b!1254917 (not condMapEmpty!49636)) mapNonEmpty!49636))

(get-info :version)

(assert (= (and mapNonEmpty!49636 ((_ is ValueCellFull!15188) mapValue!49636)) b!1254918))

(assert (= (and b!1254917 ((_ is ValueCellFull!15188) mapDefault!49636)) b!1254916))

(assert (= start!105324 b!1254917))

(declare-fun m!1155277 () Bool)

(assert (=> b!1254912 m!1155277))

(declare-fun m!1155279 () Bool)

(assert (=> mapNonEmpty!49636 m!1155279))

(declare-fun m!1155281 () Bool)

(assert (=> b!1254915 m!1155281))

(declare-fun m!1155283 () Bool)

(assert (=> b!1254914 m!1155283))

(declare-fun m!1155285 () Bool)

(assert (=> b!1254914 m!1155285))

(declare-fun m!1155287 () Bool)

(assert (=> b!1254914 m!1155287))

(declare-fun m!1155289 () Bool)

(assert (=> start!105324 m!1155289))

(declare-fun m!1155291 () Bool)

(assert (=> start!105324 m!1155291))

(declare-fun m!1155293 () Bool)

(assert (=> start!105324 m!1155293))

(check-sat (not b!1254915) (not b_next!27001) (not b!1254914) (not mapNonEmpty!49636) (not start!105324) tp_is_empty!31903 (not b!1254912) b_and!44821)
(check-sat b_and!44821 (not b_next!27001))
