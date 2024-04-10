; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105360 () Bool)

(assert start!105360)

(declare-fun b_free!27033 () Bool)

(declare-fun b_next!27033 () Bool)

(assert (=> start!105360 (= b_free!27033 (not b_next!27033))))

(declare-fun tp!94610 () Bool)

(declare-fun b_and!44871 () Bool)

(assert (=> start!105360 (= tp!94610 b_and!44871)))

(declare-fun mapIsEmpty!49684 () Bool)

(declare-fun mapRes!49684 () Bool)

(assert (=> mapIsEmpty!49684 mapRes!49684))

(declare-fun b!1255330 () Bool)

(declare-fun res!836922 () Bool)

(declare-fun e!713443 () Bool)

(assert (=> b!1255330 (=> (not res!836922) (not e!713443))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81516 0))(
  ( (array!81517 (arr!39318 (Array (_ BitVec 32) (_ BitVec 64))) (size!39854 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81516)

(declare-datatypes ((V!47945 0))(
  ( (V!47946 (val!16030 Int)) )
))
(declare-datatypes ((ValueCell!15204 0))(
  ( (ValueCellFull!15204 (v!18730 V!47945)) (EmptyCell!15204) )
))
(declare-datatypes ((array!81518 0))(
  ( (array!81519 (arr!39319 (Array (_ BitVec 32) ValueCell!15204)) (size!39855 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81518)

(assert (=> b!1255330 (= res!836922 (and (= (size!39855 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39854 _keys!1118) (size!39855 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255331 () Bool)

(declare-fun res!836921 () Bool)

(assert (=> b!1255331 (=> (not res!836921) (not e!713443))))

(declare-datatypes ((List!27922 0))(
  ( (Nil!27919) (Cons!27918 (h!29127 (_ BitVec 64)) (t!41407 List!27922)) )
))
(declare-fun arrayNoDuplicates!0 (array!81516 (_ BitVec 32) List!27922) Bool)

(assert (=> b!1255331 (= res!836921 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27919))))

(declare-fun res!836923 () Bool)

(assert (=> start!105360 (=> (not res!836923) (not e!713443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105360 (= res!836923 (validMask!0 mask!1466))))

(assert (=> start!105360 e!713443))

(assert (=> start!105360 true))

(assert (=> start!105360 tp!94610))

(declare-fun tp_is_empty!31935 () Bool)

(assert (=> start!105360 tp_is_empty!31935))

(declare-fun array_inv!29961 (array!81516) Bool)

(assert (=> start!105360 (array_inv!29961 _keys!1118)))

(declare-fun e!713442 () Bool)

(declare-fun array_inv!29962 (array!81518) Bool)

(assert (=> start!105360 (and (array_inv!29962 _values!914) e!713442)))

(declare-fun b!1255332 () Bool)

(declare-fun e!713441 () Bool)

(assert (=> b!1255332 (= e!713441 tp_is_empty!31935)))

(declare-fun b!1255333 () Bool)

(assert (=> b!1255333 (= e!713442 (and e!713441 mapRes!49684))))

(declare-fun condMapEmpty!49684 () Bool)

(declare-fun mapDefault!49684 () ValueCell!15204)

(assert (=> b!1255333 (= condMapEmpty!49684 (= (arr!39319 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15204)) mapDefault!49684)))))

(declare-fun mapNonEmpty!49684 () Bool)

(declare-fun tp!94609 () Bool)

(declare-fun e!713440 () Bool)

(assert (=> mapNonEmpty!49684 (= mapRes!49684 (and tp!94609 e!713440))))

(declare-fun mapRest!49684 () (Array (_ BitVec 32) ValueCell!15204))

(declare-fun mapKey!49684 () (_ BitVec 32))

(declare-fun mapValue!49684 () ValueCell!15204)

(assert (=> mapNonEmpty!49684 (= (arr!39319 _values!914) (store mapRest!49684 mapKey!49684 mapValue!49684))))

(declare-fun b!1255334 () Bool)

(declare-fun res!836920 () Bool)

(assert (=> b!1255334 (=> (not res!836920) (not e!713443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81516 (_ BitVec 32)) Bool)

(assert (=> b!1255334 (= res!836920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255335 () Bool)

(assert (=> b!1255335 (= e!713443 (not true))))

(declare-datatypes ((tuple2!20698 0))(
  ( (tuple2!20699 (_1!10360 (_ BitVec 64)) (_2!10360 V!47945)) )
))
(declare-datatypes ((List!27923 0))(
  ( (Nil!27920) (Cons!27919 (h!29128 tuple2!20698) (t!41408 List!27923)) )
))
(declare-datatypes ((ListLongMap!18571 0))(
  ( (ListLongMap!18572 (toList!9301 List!27923)) )
))
(declare-fun lt!567534 () ListLongMap!18571)

(declare-fun lt!567533 () ListLongMap!18571)

(assert (=> b!1255335 (= lt!567534 lt!567533)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47945)

(declare-fun zeroValue!871 () V!47945)

(declare-datatypes ((Unit!41788 0))(
  ( (Unit!41789) )
))
(declare-fun lt!567532 () Unit!41788)

(declare-fun minValueBefore!43 () V!47945)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1050 (array!81516 array!81518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47945 V!47945 V!47945 V!47945 (_ BitVec 32) Int) Unit!41788)

(assert (=> b!1255335 (= lt!567532 (lemmaNoChangeToArrayThenSameMapNoExtras!1050 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5686 (array!81516 array!81518 (_ BitVec 32) (_ BitVec 32) V!47945 V!47945 (_ BitVec 32) Int) ListLongMap!18571)

(assert (=> b!1255335 (= lt!567533 (getCurrentListMapNoExtraKeys!5686 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255335 (= lt!567534 (getCurrentListMapNoExtraKeys!5686 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255336 () Bool)

(assert (=> b!1255336 (= e!713440 tp_is_empty!31935)))

(assert (= (and start!105360 res!836923) b!1255330))

(assert (= (and b!1255330 res!836922) b!1255334))

(assert (= (and b!1255334 res!836920) b!1255331))

(assert (= (and b!1255331 res!836921) b!1255335))

(assert (= (and b!1255333 condMapEmpty!49684) mapIsEmpty!49684))

(assert (= (and b!1255333 (not condMapEmpty!49684)) mapNonEmpty!49684))

(get-info :version)

(assert (= (and mapNonEmpty!49684 ((_ is ValueCellFull!15204) mapValue!49684)) b!1255336))

(assert (= (and b!1255333 ((_ is ValueCellFull!15204) mapDefault!49684)) b!1255332))

(assert (= start!105360 b!1255333))

(declare-fun m!1156085 () Bool)

(assert (=> start!105360 m!1156085))

(declare-fun m!1156087 () Bool)

(assert (=> start!105360 m!1156087))

(declare-fun m!1156089 () Bool)

(assert (=> start!105360 m!1156089))

(declare-fun m!1156091 () Bool)

(assert (=> b!1255335 m!1156091))

(declare-fun m!1156093 () Bool)

(assert (=> b!1255335 m!1156093))

(declare-fun m!1156095 () Bool)

(assert (=> b!1255335 m!1156095))

(declare-fun m!1156097 () Bool)

(assert (=> b!1255334 m!1156097))

(declare-fun m!1156099 () Bool)

(assert (=> mapNonEmpty!49684 m!1156099))

(declare-fun m!1156101 () Bool)

(assert (=> b!1255331 m!1156101))

(check-sat b_and!44871 (not b!1255334) (not b!1255335) (not start!105360) (not b_next!27033) (not mapNonEmpty!49684) (not b!1255331) tp_is_empty!31935)
(check-sat b_and!44871 (not b_next!27033))
