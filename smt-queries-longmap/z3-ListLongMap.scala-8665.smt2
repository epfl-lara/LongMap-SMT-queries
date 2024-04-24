; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105576 () Bool)

(assert start!105576)

(declare-fun b_free!27025 () Bool)

(declare-fun b_next!27025 () Bool)

(assert (=> start!105576 (= b_free!27025 (not b_next!27025))))

(declare-fun tp!94586 () Bool)

(declare-fun b_and!44865 () Bool)

(assert (=> start!105576 (= tp!94586 b_and!44865)))

(declare-fun mapIsEmpty!49672 () Bool)

(declare-fun mapRes!49672 () Bool)

(assert (=> mapIsEmpty!49672 mapRes!49672))

(declare-fun b!1256551 () Bool)

(declare-fun res!837395 () Bool)

(declare-fun e!714226 () Bool)

(assert (=> b!1256551 (=> (not res!837395) (not e!714226))))

(declare-datatypes ((array!81549 0))(
  ( (array!81550 (arr!39330 (Array (_ BitVec 32) (_ BitVec 64))) (size!39867 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81549)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81549 (_ BitVec 32)) Bool)

(assert (=> b!1256551 (= res!837395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256552 () Bool)

(declare-fun e!714230 () Bool)

(declare-fun e!714229 () Bool)

(assert (=> b!1256552 (= e!714230 (and e!714229 mapRes!49672))))

(declare-fun condMapEmpty!49672 () Bool)

(declare-datatypes ((V!47935 0))(
  ( (V!47936 (val!16026 Int)) )
))
(declare-datatypes ((ValueCell!15200 0))(
  ( (ValueCellFull!15200 (v!18722 V!47935)) (EmptyCell!15200) )
))
(declare-datatypes ((array!81551 0))(
  ( (array!81552 (arr!39331 (Array (_ BitVec 32) ValueCell!15200)) (size!39868 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81551)

(declare-fun mapDefault!49672 () ValueCell!15200)

(assert (=> b!1256552 (= condMapEmpty!49672 (= (arr!39331 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15200)) mapDefault!49672)))))

(declare-fun res!837394 () Bool)

(assert (=> start!105576 (=> (not res!837394) (not e!714226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105576 (= res!837394 (validMask!0 mask!1466))))

(assert (=> start!105576 e!714226))

(assert (=> start!105576 true))

(assert (=> start!105576 tp!94586))

(declare-fun tp_is_empty!31927 () Bool)

(assert (=> start!105576 tp_is_empty!31927))

(declare-fun array_inv!30101 (array!81549) Bool)

(assert (=> start!105576 (array_inv!30101 _keys!1118)))

(declare-fun array_inv!30102 (array!81551) Bool)

(assert (=> start!105576 (and (array_inv!30102 _values!914) e!714230)))

(declare-fun mapNonEmpty!49672 () Bool)

(declare-fun tp!94585 () Bool)

(declare-fun e!714228 () Bool)

(assert (=> mapNonEmpty!49672 (= mapRes!49672 (and tp!94585 e!714228))))

(declare-fun mapValue!49672 () ValueCell!15200)

(declare-fun mapRest!49672 () (Array (_ BitVec 32) ValueCell!15200))

(declare-fun mapKey!49672 () (_ BitVec 32))

(assert (=> mapNonEmpty!49672 (= (arr!39331 _values!914) (store mapRest!49672 mapKey!49672 mapValue!49672))))

(declare-fun b!1256553 () Bool)

(assert (=> b!1256553 (= e!714229 tp_is_empty!31927)))

(declare-fun b!1256554 () Bool)

(assert (=> b!1256554 (= e!714226 (not true))))

(declare-datatypes ((tuple2!20718 0))(
  ( (tuple2!20719 (_1!10370 (_ BitVec 64)) (_2!10370 V!47935)) )
))
(declare-datatypes ((List!27953 0))(
  ( (Nil!27950) (Cons!27949 (h!29167 tuple2!20718) (t!41430 List!27953)) )
))
(declare-datatypes ((ListLongMap!18599 0))(
  ( (ListLongMap!18600 (toList!9315 List!27953)) )
))
(declare-fun lt!567981 () ListLongMap!18599)

(declare-fun lt!567982 () ListLongMap!18599)

(assert (=> b!1256554 (= lt!567981 lt!567982)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41771 0))(
  ( (Unit!41772) )
))
(declare-fun lt!567980 () Unit!41771)

(declare-fun minValueAfter!43 () V!47935)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47935)

(declare-fun minValueBefore!43 () V!47935)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1051 (array!81549 array!81551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 V!47935 V!47935 (_ BitVec 32) Int) Unit!41771)

(assert (=> b!1256554 (= lt!567980 (lemmaNoChangeToArrayThenSameMapNoExtras!1051 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5737 (array!81549 array!81551 (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 (_ BitVec 32) Int) ListLongMap!18599)

(assert (=> b!1256554 (= lt!567982 (getCurrentListMapNoExtraKeys!5737 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256554 (= lt!567981 (getCurrentListMapNoExtraKeys!5737 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256555 () Bool)

(assert (=> b!1256555 (= e!714228 tp_is_empty!31927)))

(declare-fun b!1256556 () Bool)

(declare-fun res!837393 () Bool)

(assert (=> b!1256556 (=> (not res!837393) (not e!714226))))

(declare-datatypes ((List!27954 0))(
  ( (Nil!27951) (Cons!27950 (h!29168 (_ BitVec 64)) (t!41431 List!27954)) )
))
(declare-fun arrayNoDuplicates!0 (array!81549 (_ BitVec 32) List!27954) Bool)

(assert (=> b!1256556 (= res!837393 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27951))))

(declare-fun b!1256557 () Bool)

(declare-fun res!837392 () Bool)

(assert (=> b!1256557 (=> (not res!837392) (not e!714226))))

(assert (=> b!1256557 (= res!837392 (and (= (size!39868 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39867 _keys!1118) (size!39868 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105576 res!837394) b!1256557))

(assert (= (and b!1256557 res!837392) b!1256551))

(assert (= (and b!1256551 res!837395) b!1256556))

(assert (= (and b!1256556 res!837393) b!1256554))

(assert (= (and b!1256552 condMapEmpty!49672) mapIsEmpty!49672))

(assert (= (and b!1256552 (not condMapEmpty!49672)) mapNonEmpty!49672))

(get-info :version)

(assert (= (and mapNonEmpty!49672 ((_ is ValueCellFull!15200) mapValue!49672)) b!1256555))

(assert (= (and b!1256552 ((_ is ValueCellFull!15200) mapDefault!49672)) b!1256553))

(assert (= start!105576 b!1256552))

(declare-fun m!1157625 () Bool)

(assert (=> b!1256556 m!1157625))

(declare-fun m!1157627 () Bool)

(assert (=> start!105576 m!1157627))

(declare-fun m!1157629 () Bool)

(assert (=> start!105576 m!1157629))

(declare-fun m!1157631 () Bool)

(assert (=> start!105576 m!1157631))

(declare-fun m!1157633 () Bool)

(assert (=> b!1256551 m!1157633))

(declare-fun m!1157635 () Bool)

(assert (=> b!1256554 m!1157635))

(declare-fun m!1157637 () Bool)

(assert (=> b!1256554 m!1157637))

(declare-fun m!1157639 () Bool)

(assert (=> b!1256554 m!1157639))

(declare-fun m!1157641 () Bool)

(assert (=> mapNonEmpty!49672 m!1157641))

(check-sat (not b_next!27025) (not start!105576) (not mapNonEmpty!49672) b_and!44865 (not b!1256551) (not b!1256556) tp_is_empty!31927 (not b!1256554))
(check-sat b_and!44865 (not b_next!27025))
