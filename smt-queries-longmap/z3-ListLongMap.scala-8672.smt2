; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105404 () Bool)

(assert start!105404)

(declare-fun b_free!27067 () Bool)

(declare-fun b_next!27067 () Bool)

(assert (=> start!105404 (= b_free!27067 (not b_next!27067))))

(declare-fun tp!94714 () Bool)

(declare-fun b_and!44895 () Bool)

(assert (=> start!105404 (= tp!94714 b_and!44895)))

(declare-fun b!1255739 () Bool)

(declare-fun res!837164 () Bool)

(declare-fun e!713755 () Bool)

(assert (=> b!1255739 (=> (not res!837164) (not e!713755))))

(declare-datatypes ((array!81509 0))(
  ( (array!81510 (arr!39314 (Array (_ BitVec 32) (_ BitVec 64))) (size!39852 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81509)

(declare-datatypes ((List!28015 0))(
  ( (Nil!28012) (Cons!28011 (h!29220 (_ BitVec 64)) (t!41493 List!28015)) )
))
(declare-fun arrayNoDuplicates!0 (array!81509 (_ BitVec 32) List!28015) Bool)

(assert (=> b!1255739 (= res!837164 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28012))))

(declare-fun b!1255740 () Bool)

(declare-fun e!713757 () Bool)

(declare-fun e!713753 () Bool)

(declare-fun mapRes!49738 () Bool)

(assert (=> b!1255740 (= e!713757 (and e!713753 mapRes!49738))))

(declare-fun condMapEmpty!49738 () Bool)

(declare-datatypes ((V!47991 0))(
  ( (V!47992 (val!16047 Int)) )
))
(declare-datatypes ((ValueCell!15221 0))(
  ( (ValueCellFull!15221 (v!18746 V!47991)) (EmptyCell!15221) )
))
(declare-datatypes ((array!81511 0))(
  ( (array!81512 (arr!39315 (Array (_ BitVec 32) ValueCell!15221)) (size!39853 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81511)

(declare-fun mapDefault!49738 () ValueCell!15221)

(assert (=> b!1255740 (= condMapEmpty!49738 (= (arr!39315 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15221)) mapDefault!49738)))))

(declare-fun b!1255742 () Bool)

(declare-fun res!837167 () Bool)

(assert (=> b!1255742 (=> (not res!837167) (not e!713755))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81509 (_ BitVec 32)) Bool)

(assert (=> b!1255742 (= res!837167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255743 () Bool)

(declare-fun e!713754 () Bool)

(assert (=> b!1255743 (= e!713755 (not e!713754))))

(declare-fun res!837169 () Bool)

(assert (=> b!1255743 (=> res!837169 e!713754)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255743 (= res!837169 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20804 0))(
  ( (tuple2!20805 (_1!10413 (_ BitVec 64)) (_2!10413 V!47991)) )
))
(declare-datatypes ((List!28016 0))(
  ( (Nil!28013) (Cons!28012 (h!29221 tuple2!20804) (t!41494 List!28016)) )
))
(declare-datatypes ((ListLongMap!18677 0))(
  ( (ListLongMap!18678 (toList!9354 List!28016)) )
))
(declare-fun lt!567598 () ListLongMap!18677)

(declare-fun lt!567597 () ListLongMap!18677)

(assert (=> b!1255743 (= lt!567598 lt!567597)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47991)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47991)

(declare-fun minValueBefore!43 () V!47991)

(declare-datatypes ((Unit!41673 0))(
  ( (Unit!41674) )
))
(declare-fun lt!567599 () Unit!41673)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1069 (array!81509 array!81511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 V!47991 V!47991 (_ BitVec 32) Int) Unit!41673)

(assert (=> b!1255743 (= lt!567599 (lemmaNoChangeToArrayThenSameMapNoExtras!1069 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5747 (array!81509 array!81511 (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 (_ BitVec 32) Int) ListLongMap!18677)

(assert (=> b!1255743 (= lt!567597 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255743 (= lt!567598 (getCurrentListMapNoExtraKeys!5747 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49738 () Bool)

(assert (=> mapIsEmpty!49738 mapRes!49738))

(declare-fun b!1255744 () Bool)

(declare-fun res!837165 () Bool)

(assert (=> b!1255744 (=> (not res!837165) (not e!713755))))

(assert (=> b!1255744 (= res!837165 (and (= (size!39853 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39852 _keys!1118) (size!39853 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255745 () Bool)

(declare-fun e!713759 () Bool)

(assert (=> b!1255745 (= e!713759 true)))

(declare-fun lt!567596 () ListLongMap!18677)

(declare-fun -!2026 (ListLongMap!18677 (_ BitVec 64)) ListLongMap!18677)

(assert (=> b!1255745 (= (-!2026 lt!567596 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567596)))

(declare-fun lt!567595 () Unit!41673)

(declare-fun removeNotPresentStillSame!121 (ListLongMap!18677 (_ BitVec 64)) Unit!41673)

(assert (=> b!1255745 (= lt!567595 (removeNotPresentStillSame!121 lt!567596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255746 () Bool)

(assert (=> b!1255746 (= e!713754 e!713759)))

(declare-fun res!837166 () Bool)

(assert (=> b!1255746 (=> res!837166 e!713759)))

(declare-fun contains!7506 (ListLongMap!18677 (_ BitVec 64)) Bool)

(assert (=> b!1255746 (= res!837166 (contains!7506 lt!567596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4466 (array!81509 array!81511 (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 (_ BitVec 32) Int) ListLongMap!18677)

(assert (=> b!1255746 (= lt!567596 (getCurrentListMap!4466 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255747 () Bool)

(declare-fun tp_is_empty!31969 () Bool)

(assert (=> b!1255747 (= e!713753 tp_is_empty!31969)))

(declare-fun mapNonEmpty!49738 () Bool)

(declare-fun tp!94715 () Bool)

(declare-fun e!713758 () Bool)

(assert (=> mapNonEmpty!49738 (= mapRes!49738 (and tp!94715 e!713758))))

(declare-fun mapRest!49738 () (Array (_ BitVec 32) ValueCell!15221))

(declare-fun mapValue!49738 () ValueCell!15221)

(declare-fun mapKey!49738 () (_ BitVec 32))

(assert (=> mapNonEmpty!49738 (= (arr!39315 _values!914) (store mapRest!49738 mapKey!49738 mapValue!49738))))

(declare-fun b!1255741 () Bool)

(assert (=> b!1255741 (= e!713758 tp_is_empty!31969)))

(declare-fun res!837168 () Bool)

(assert (=> start!105404 (=> (not res!837168) (not e!713755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105404 (= res!837168 (validMask!0 mask!1466))))

(assert (=> start!105404 e!713755))

(assert (=> start!105404 true))

(assert (=> start!105404 tp!94714))

(assert (=> start!105404 tp_is_empty!31969))

(declare-fun array_inv!30091 (array!81509) Bool)

(assert (=> start!105404 (array_inv!30091 _keys!1118)))

(declare-fun array_inv!30092 (array!81511) Bool)

(assert (=> start!105404 (and (array_inv!30092 _values!914) e!713757)))

(assert (= (and start!105404 res!837168) b!1255744))

(assert (= (and b!1255744 res!837165) b!1255742))

(assert (= (and b!1255742 res!837167) b!1255739))

(assert (= (and b!1255739 res!837164) b!1255743))

(assert (= (and b!1255743 (not res!837169)) b!1255746))

(assert (= (and b!1255746 (not res!837166)) b!1255745))

(assert (= (and b!1255740 condMapEmpty!49738) mapIsEmpty!49738))

(assert (= (and b!1255740 (not condMapEmpty!49738)) mapNonEmpty!49738))

(get-info :version)

(assert (= (and mapNonEmpty!49738 ((_ is ValueCellFull!15221) mapValue!49738)) b!1255741))

(assert (= (and b!1255740 ((_ is ValueCellFull!15221) mapDefault!49738)) b!1255747))

(assert (= start!105404 b!1255740))

(declare-fun m!1155997 () Bool)

(assert (=> b!1255742 m!1155997))

(declare-fun m!1155999 () Bool)

(assert (=> b!1255739 m!1155999))

(declare-fun m!1156001 () Bool)

(assert (=> b!1255743 m!1156001))

(declare-fun m!1156003 () Bool)

(assert (=> b!1255743 m!1156003))

(declare-fun m!1156005 () Bool)

(assert (=> b!1255743 m!1156005))

(declare-fun m!1156007 () Bool)

(assert (=> mapNonEmpty!49738 m!1156007))

(declare-fun m!1156009 () Bool)

(assert (=> start!105404 m!1156009))

(declare-fun m!1156011 () Bool)

(assert (=> start!105404 m!1156011))

(declare-fun m!1156013 () Bool)

(assert (=> start!105404 m!1156013))

(declare-fun m!1156015 () Bool)

(assert (=> b!1255746 m!1156015))

(declare-fun m!1156017 () Bool)

(assert (=> b!1255746 m!1156017))

(declare-fun m!1156019 () Bool)

(assert (=> b!1255745 m!1156019))

(declare-fun m!1156021 () Bool)

(assert (=> b!1255745 m!1156021))

(check-sat tp_is_empty!31969 (not start!105404) (not b!1255742) b_and!44895 (not b!1255746) (not b_next!27067) (not b!1255739) (not mapNonEmpty!49738) (not b!1255745) (not b!1255743))
(check-sat b_and!44895 (not b_next!27067))
