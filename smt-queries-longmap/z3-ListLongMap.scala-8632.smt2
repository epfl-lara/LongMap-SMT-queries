; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105318 () Bool)

(assert start!105318)

(declare-fun b_free!26827 () Bool)

(declare-fun b_next!26827 () Bool)

(assert (=> start!105318 (= b_free!26827 (not b_next!26827))))

(declare-fun tp!93982 () Bool)

(declare-fun b_and!44633 () Bool)

(assert (=> start!105318 (= tp!93982 b_and!44633)))

(declare-fun b!1253697 () Bool)

(declare-fun res!835726 () Bool)

(declare-fun e!712151 () Bool)

(assert (=> b!1253697 (=> (not res!835726) (not e!712151))))

(declare-datatypes ((array!81167 0))(
  ( (array!81168 (arr!39142 (Array (_ BitVec 32) (_ BitVec 64))) (size!39679 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81167)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81167 (_ BitVec 32)) Bool)

(assert (=> b!1253697 (= res!835726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835727 () Bool)

(assert (=> start!105318 (=> (not res!835727) (not e!712151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105318 (= res!835727 (validMask!0 mask!1466))))

(assert (=> start!105318 e!712151))

(assert (=> start!105318 true))

(assert (=> start!105318 tp!93982))

(declare-fun tp_is_empty!31729 () Bool)

(assert (=> start!105318 tp_is_empty!31729))

(declare-fun array_inv!29965 (array!81167) Bool)

(assert (=> start!105318 (array_inv!29965 _keys!1118)))

(declare-datatypes ((V!47671 0))(
  ( (V!47672 (val!15927 Int)) )
))
(declare-datatypes ((ValueCell!15101 0))(
  ( (ValueCellFull!15101 (v!18621 V!47671)) (EmptyCell!15101) )
))
(declare-datatypes ((array!81169 0))(
  ( (array!81170 (arr!39143 (Array (_ BitVec 32) ValueCell!15101)) (size!39680 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81169)

(declare-fun e!712150 () Bool)

(declare-fun array_inv!29966 (array!81169) Bool)

(assert (=> start!105318 (and (array_inv!29966 _values!914) e!712150)))

(declare-fun b!1253698 () Bool)

(declare-fun e!712155 () Bool)

(assert (=> b!1253698 (= e!712155 tp_is_empty!31729)))

(declare-fun b!1253699 () Bool)

(declare-fun res!835723 () Bool)

(assert (=> b!1253699 (=> (not res!835723) (not e!712151))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253699 (= res!835723 (and (= (size!39680 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39679 _keys!1118) (size!39680 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49366 () Bool)

(declare-fun mapRes!49366 () Bool)

(assert (=> mapIsEmpty!49366 mapRes!49366))

(declare-fun b!1253700 () Bool)

(declare-fun e!712153 () Bool)

(assert (=> b!1253700 (= e!712151 (not e!712153))))

(declare-fun res!835724 () Bool)

(assert (=> b!1253700 (=> res!835724 e!712153)))

(assert (=> b!1253700 (= res!835724 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20562 0))(
  ( (tuple2!20563 (_1!10292 (_ BitVec 64)) (_2!10292 V!47671)) )
))
(declare-datatypes ((List!27809 0))(
  ( (Nil!27806) (Cons!27805 (h!29023 tuple2!20562) (t!41280 List!27809)) )
))
(declare-datatypes ((ListLongMap!18443 0))(
  ( (ListLongMap!18444 (toList!9237 List!27809)) )
))
(declare-fun lt!565792 () ListLongMap!18443)

(declare-fun lt!565794 () ListLongMap!18443)

(assert (=> b!1253700 (= lt!565792 lt!565794)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47671)

(declare-fun zeroValue!871 () V!47671)

(declare-datatypes ((Unit!41612 0))(
  ( (Unit!41613) )
))
(declare-fun lt!565791 () Unit!41612)

(declare-fun minValueBefore!43 () V!47671)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!978 (array!81167 array!81169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 V!47671 V!47671 (_ BitVec 32) Int) Unit!41612)

(assert (=> b!1253700 (= lt!565791 (lemmaNoChangeToArrayThenSameMapNoExtras!978 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5664 (array!81167 array!81169 (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 (_ BitVec 32) Int) ListLongMap!18443)

(assert (=> b!1253700 (= lt!565794 (getCurrentListMapNoExtraKeys!5664 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253700 (= lt!565792 (getCurrentListMapNoExtraKeys!5664 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253701 () Bool)

(assert (=> b!1253701 (= e!712153 true)))

(declare-fun lt!565793 () ListLongMap!18443)

(declare-fun getCurrentListMap!4478 (array!81167 array!81169 (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 (_ BitVec 32) Int) ListLongMap!18443)

(assert (=> b!1253701 (= lt!565793 (getCurrentListMap!4478 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253702 () Bool)

(declare-fun e!712152 () Bool)

(assert (=> b!1253702 (= e!712150 (and e!712152 mapRes!49366))))

(declare-fun condMapEmpty!49366 () Bool)

(declare-fun mapDefault!49366 () ValueCell!15101)

(assert (=> b!1253702 (= condMapEmpty!49366 (= (arr!39143 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15101)) mapDefault!49366)))))

(declare-fun b!1253703 () Bool)

(declare-fun res!835725 () Bool)

(assert (=> b!1253703 (=> (not res!835725) (not e!712151))))

(declare-datatypes ((List!27810 0))(
  ( (Nil!27807) (Cons!27806 (h!29024 (_ BitVec 64)) (t!41281 List!27810)) )
))
(declare-fun arrayNoDuplicates!0 (array!81167 (_ BitVec 32) List!27810) Bool)

(assert (=> b!1253703 (= res!835725 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27807))))

(declare-fun mapNonEmpty!49366 () Bool)

(declare-fun tp!93983 () Bool)

(assert (=> mapNonEmpty!49366 (= mapRes!49366 (and tp!93983 e!712155))))

(declare-fun mapKey!49366 () (_ BitVec 32))

(declare-fun mapValue!49366 () ValueCell!15101)

(declare-fun mapRest!49366 () (Array (_ BitVec 32) ValueCell!15101))

(assert (=> mapNonEmpty!49366 (= (arr!39143 _values!914) (store mapRest!49366 mapKey!49366 mapValue!49366))))

(declare-fun b!1253704 () Bool)

(assert (=> b!1253704 (= e!712152 tp_is_empty!31729)))

(assert (= (and start!105318 res!835727) b!1253699))

(assert (= (and b!1253699 res!835723) b!1253697))

(assert (= (and b!1253697 res!835726) b!1253703))

(assert (= (and b!1253703 res!835725) b!1253700))

(assert (= (and b!1253700 (not res!835724)) b!1253701))

(assert (= (and b!1253702 condMapEmpty!49366) mapIsEmpty!49366))

(assert (= (and b!1253702 (not condMapEmpty!49366)) mapNonEmpty!49366))

(get-info :version)

(assert (= (and mapNonEmpty!49366 ((_ is ValueCellFull!15101) mapValue!49366)) b!1253698))

(assert (= (and b!1253702 ((_ is ValueCellFull!15101) mapDefault!49366)) b!1253704))

(assert (= start!105318 b!1253702))

(declare-fun m!1154637 () Bool)

(assert (=> b!1253703 m!1154637))

(declare-fun m!1154639 () Bool)

(assert (=> b!1253697 m!1154639))

(declare-fun m!1154641 () Bool)

(assert (=> b!1253700 m!1154641))

(declare-fun m!1154643 () Bool)

(assert (=> b!1253700 m!1154643))

(declare-fun m!1154645 () Bool)

(assert (=> b!1253700 m!1154645))

(declare-fun m!1154647 () Bool)

(assert (=> mapNonEmpty!49366 m!1154647))

(declare-fun m!1154649 () Bool)

(assert (=> start!105318 m!1154649))

(declare-fun m!1154651 () Bool)

(assert (=> start!105318 m!1154651))

(declare-fun m!1154653 () Bool)

(assert (=> start!105318 m!1154653))

(declare-fun m!1154655 () Bool)

(assert (=> b!1253701 m!1154655))

(check-sat (not b!1253700) (not b_next!26827) (not start!105318) (not b!1253697) (not mapNonEmpty!49366) tp_is_empty!31729 (not b!1253701) b_and!44633 (not b!1253703))
(check-sat b_and!44633 (not b_next!26827))
