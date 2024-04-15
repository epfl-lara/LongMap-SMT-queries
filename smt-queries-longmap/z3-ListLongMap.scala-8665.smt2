; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105348 () Bool)

(assert start!105348)

(declare-fun b_free!27025 () Bool)

(declare-fun b_next!27025 () Bool)

(assert (=> start!105348 (= b_free!27025 (not b_next!27025))))

(declare-fun tp!94586 () Bool)

(declare-fun b_and!44845 () Bool)

(assert (=> start!105348 (= tp!94586 b_and!44845)))

(declare-fun mapNonEmpty!49672 () Bool)

(declare-fun mapRes!49672 () Bool)

(declare-fun tp!94585 () Bool)

(declare-fun e!713338 () Bool)

(assert (=> mapNonEmpty!49672 (= mapRes!49672 (and tp!94585 e!713338))))

(declare-fun mapKey!49672 () (_ BitVec 32))

(declare-datatypes ((V!47935 0))(
  ( (V!47936 (val!16026 Int)) )
))
(declare-datatypes ((ValueCell!15200 0))(
  ( (ValueCellFull!15200 (v!18725 V!47935)) (EmptyCell!15200) )
))
(declare-fun mapRest!49672 () (Array (_ BitVec 32) ValueCell!15200))

(declare-fun mapValue!49672 () ValueCell!15200)

(declare-datatypes ((array!81429 0))(
  ( (array!81430 (arr!39275 (Array (_ BitVec 32) ValueCell!15200)) (size!39813 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81429)

(assert (=> mapNonEmpty!49672 (= (arr!39275 _values!914) (store mapRest!49672 mapKey!49672 mapValue!49672))))

(declare-fun b!1255164 () Bool)

(declare-fun res!836832 () Bool)

(declare-fun e!713336 () Bool)

(assert (=> b!1255164 (=> (not res!836832) (not e!713336))))

(declare-datatypes ((array!81431 0))(
  ( (array!81432 (arr!39276 (Array (_ BitVec 32) (_ BitVec 64))) (size!39814 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81431)

(declare-datatypes ((List!27984 0))(
  ( (Nil!27981) (Cons!27980 (h!29189 (_ BitVec 64)) (t!41460 List!27984)) )
))
(declare-fun arrayNoDuplicates!0 (array!81431 (_ BitVec 32) List!27984) Bool)

(assert (=> b!1255164 (= res!836832 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27981))))

(declare-fun b!1255165 () Bool)

(declare-fun res!836834 () Bool)

(assert (=> b!1255165 (=> (not res!836834) (not e!713336))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81431 (_ BitVec 32)) Bool)

(assert (=> b!1255165 (= res!836834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836835 () Bool)

(assert (=> start!105348 (=> (not res!836835) (not e!713336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105348 (= res!836835 (validMask!0 mask!1466))))

(assert (=> start!105348 e!713336))

(assert (=> start!105348 true))

(assert (=> start!105348 tp!94586))

(declare-fun tp_is_empty!31927 () Bool)

(assert (=> start!105348 tp_is_empty!31927))

(declare-fun array_inv!30065 (array!81431) Bool)

(assert (=> start!105348 (array_inv!30065 _keys!1118)))

(declare-fun e!713334 () Bool)

(declare-fun array_inv!30066 (array!81429) Bool)

(assert (=> start!105348 (and (array_inv!30066 _values!914) e!713334)))

(declare-fun mapIsEmpty!49672 () Bool)

(assert (=> mapIsEmpty!49672 mapRes!49672))

(declare-fun b!1255166 () Bool)

(assert (=> b!1255166 (= e!713336 (not true))))

(declare-datatypes ((tuple2!20774 0))(
  ( (tuple2!20775 (_1!10398 (_ BitVec 64)) (_2!10398 V!47935)) )
))
(declare-datatypes ((List!27985 0))(
  ( (Nil!27982) (Cons!27981 (h!29190 tuple2!20774) (t!41461 List!27985)) )
))
(declare-datatypes ((ListLongMap!18647 0))(
  ( (ListLongMap!18648 (toList!9339 List!27985)) )
))
(declare-fun lt!567318 () ListLongMap!18647)

(declare-fun lt!567319 () ListLongMap!18647)

(assert (=> b!1255166 (= lt!567318 lt!567319)))

(declare-datatypes ((Unit!41645 0))(
  ( (Unit!41646) )
))
(declare-fun lt!567317 () Unit!41645)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47935)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47935)

(declare-fun minValueBefore!43 () V!47935)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1056 (array!81431 array!81429 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 V!47935 V!47935 (_ BitVec 32) Int) Unit!41645)

(assert (=> b!1255166 (= lt!567317 (lemmaNoChangeToArrayThenSameMapNoExtras!1056 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5734 (array!81431 array!81429 (_ BitVec 32) (_ BitVec 32) V!47935 V!47935 (_ BitVec 32) Int) ListLongMap!18647)

(assert (=> b!1255166 (= lt!567319 (getCurrentListMapNoExtraKeys!5734 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255166 (= lt!567318 (getCurrentListMapNoExtraKeys!5734 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255167 () Bool)

(declare-fun res!836833 () Bool)

(assert (=> b!1255167 (=> (not res!836833) (not e!713336))))

(assert (=> b!1255167 (= res!836833 (and (= (size!39813 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39814 _keys!1118) (size!39813 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255168 () Bool)

(declare-fun e!713335 () Bool)

(assert (=> b!1255168 (= e!713334 (and e!713335 mapRes!49672))))

(declare-fun condMapEmpty!49672 () Bool)

(declare-fun mapDefault!49672 () ValueCell!15200)

(assert (=> b!1255168 (= condMapEmpty!49672 (= (arr!39275 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15200)) mapDefault!49672)))))

(declare-fun b!1255169 () Bool)

(assert (=> b!1255169 (= e!713338 tp_is_empty!31927)))

(declare-fun b!1255170 () Bool)

(assert (=> b!1255170 (= e!713335 tp_is_empty!31927)))

(assert (= (and start!105348 res!836835) b!1255167))

(assert (= (and b!1255167 res!836833) b!1255165))

(assert (= (and b!1255165 res!836834) b!1255164))

(assert (= (and b!1255164 res!836832) b!1255166))

(assert (= (and b!1255168 condMapEmpty!49672) mapIsEmpty!49672))

(assert (= (and b!1255168 (not condMapEmpty!49672)) mapNonEmpty!49672))

(get-info :version)

(assert (= (and mapNonEmpty!49672 ((_ is ValueCellFull!15200) mapValue!49672)) b!1255169))

(assert (= (and b!1255168 ((_ is ValueCellFull!15200) mapDefault!49672)) b!1255170))

(assert (= start!105348 b!1255168))

(declare-fun m!1155493 () Bool)

(assert (=> b!1255165 m!1155493))

(declare-fun m!1155495 () Bool)

(assert (=> b!1255166 m!1155495))

(declare-fun m!1155497 () Bool)

(assert (=> b!1255166 m!1155497))

(declare-fun m!1155499 () Bool)

(assert (=> b!1255166 m!1155499))

(declare-fun m!1155501 () Bool)

(assert (=> mapNonEmpty!49672 m!1155501))

(declare-fun m!1155503 () Bool)

(assert (=> b!1255164 m!1155503))

(declare-fun m!1155505 () Bool)

(assert (=> start!105348 m!1155505))

(declare-fun m!1155507 () Bool)

(assert (=> start!105348 m!1155507))

(declare-fun m!1155509 () Bool)

(assert (=> start!105348 m!1155509))

(check-sat (not b!1255166) (not mapNonEmpty!49672) (not b_next!27025) tp_is_empty!31927 b_and!44845 (not start!105348) (not b!1255164) (not b!1255165))
(check-sat b_and!44845 (not b_next!27025))
