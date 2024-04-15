; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105568 () Bool)

(assert start!105568)

(declare-fun b_free!27187 () Bool)

(declare-fun b_next!27187 () Bool)

(assert (=> start!105568 (= b_free!27187 (not b_next!27187))))

(declare-fun tp!95080 () Bool)

(declare-fun b_and!45035 () Bool)

(assert (=> start!105568 (= tp!95080 b_and!45035)))

(declare-fun b!1257597 () Bool)

(declare-fun res!838293 () Bool)

(declare-fun e!715139 () Bool)

(assert (=> b!1257597 (=> (not res!838293) (not e!715139))))

(declare-datatypes ((array!81735 0))(
  ( (array!81736 (arr!39425 (Array (_ BitVec 32) (_ BitVec 64))) (size!39963 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81735)

(declare-datatypes ((List!28101 0))(
  ( (Nil!28098) (Cons!28097 (h!29306 (_ BitVec 64)) (t!41583 List!28101)) )
))
(declare-fun arrayNoDuplicates!0 (array!81735 (_ BitVec 32) List!28101) Bool)

(assert (=> b!1257597 (= res!838293 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28098))))

(declare-fun b!1257598 () Bool)

(declare-fun res!838292 () Bool)

(assert (=> b!1257598 (=> (not res!838292) (not e!715139))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81735 (_ BitVec 32)) Bool)

(assert (=> b!1257598 (= res!838292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257599 () Bool)

(declare-fun e!715137 () Bool)

(declare-fun tp_is_empty!32089 () Bool)

(assert (=> b!1257599 (= e!715137 tp_is_empty!32089)))

(declare-fun b!1257600 () Bool)

(assert (=> b!1257600 (= e!715139 (not true))))

(declare-datatypes ((V!48151 0))(
  ( (V!48152 (val!16107 Int)) )
))
(declare-datatypes ((tuple2!20894 0))(
  ( (tuple2!20895 (_1!10458 (_ BitVec 64)) (_2!10458 V!48151)) )
))
(declare-datatypes ((List!28102 0))(
  ( (Nil!28099) (Cons!28098 (h!29307 tuple2!20894) (t!41584 List!28102)) )
))
(declare-datatypes ((ListLongMap!18767 0))(
  ( (ListLongMap!18768 (toList!9399 List!28102)) )
))
(declare-fun lt!568667 () ListLongMap!18767)

(declare-fun lt!568668 () ListLongMap!18767)

(assert (=> b!1257600 (= lt!568667 lt!568668)))

(declare-datatypes ((Unit!41757 0))(
  ( (Unit!41758) )
))
(declare-fun lt!568669 () Unit!41757)

(declare-fun minValueAfter!43 () V!48151)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48151)

(declare-datatypes ((ValueCell!15281 0))(
  ( (ValueCellFull!15281 (v!18808 V!48151)) (EmptyCell!15281) )
))
(declare-datatypes ((array!81737 0))(
  ( (array!81738 (arr!39426 (Array (_ BitVec 32) ValueCell!15281)) (size!39964 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81737)

(declare-fun minValueBefore!43 () V!48151)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1103 (array!81735 array!81737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48151 V!48151 V!48151 V!48151 (_ BitVec 32) Int) Unit!41757)

(assert (=> b!1257600 (= lt!568669 (lemmaNoChangeToArrayThenSameMapNoExtras!1103 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5781 (array!81735 array!81737 (_ BitVec 32) (_ BitVec 32) V!48151 V!48151 (_ BitVec 32) Int) ListLongMap!18767)

(assert (=> b!1257600 (= lt!568668 (getCurrentListMapNoExtraKeys!5781 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257600 (= lt!568667 (getCurrentListMapNoExtraKeys!5781 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257601 () Bool)

(declare-fun e!715138 () Bool)

(assert (=> b!1257601 (= e!715138 tp_is_empty!32089)))

(declare-fun mapIsEmpty!49924 () Bool)

(declare-fun mapRes!49924 () Bool)

(assert (=> mapIsEmpty!49924 mapRes!49924))

(declare-fun b!1257602 () Bool)

(declare-fun e!715140 () Bool)

(assert (=> b!1257602 (= e!715140 (and e!715138 mapRes!49924))))

(declare-fun condMapEmpty!49924 () Bool)

(declare-fun mapDefault!49924 () ValueCell!15281)

(assert (=> b!1257602 (= condMapEmpty!49924 (= (arr!39426 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15281)) mapDefault!49924)))))

(declare-fun b!1257603 () Bool)

(declare-fun res!838291 () Bool)

(assert (=> b!1257603 (=> (not res!838291) (not e!715139))))

(assert (=> b!1257603 (= res!838291 (and (= (size!39964 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39963 _keys!1118) (size!39964 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49924 () Bool)

(declare-fun tp!95081 () Bool)

(assert (=> mapNonEmpty!49924 (= mapRes!49924 (and tp!95081 e!715137))))

(declare-fun mapRest!49924 () (Array (_ BitVec 32) ValueCell!15281))

(declare-fun mapValue!49924 () ValueCell!15281)

(declare-fun mapKey!49924 () (_ BitVec 32))

(assert (=> mapNonEmpty!49924 (= (arr!39426 _values!914) (store mapRest!49924 mapKey!49924 mapValue!49924))))

(declare-fun res!838290 () Bool)

(assert (=> start!105568 (=> (not res!838290) (not e!715139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105568 (= res!838290 (validMask!0 mask!1466))))

(assert (=> start!105568 e!715139))

(assert (=> start!105568 true))

(assert (=> start!105568 tp!95080))

(assert (=> start!105568 tp_is_empty!32089))

(declare-fun array_inv!30163 (array!81735) Bool)

(assert (=> start!105568 (array_inv!30163 _keys!1118)))

(declare-fun array_inv!30164 (array!81737) Bool)

(assert (=> start!105568 (and (array_inv!30164 _values!914) e!715140)))

(assert (= (and start!105568 res!838290) b!1257603))

(assert (= (and b!1257603 res!838291) b!1257598))

(assert (= (and b!1257598 res!838292) b!1257597))

(assert (= (and b!1257597 res!838293) b!1257600))

(assert (= (and b!1257602 condMapEmpty!49924) mapIsEmpty!49924))

(assert (= (and b!1257602 (not condMapEmpty!49924)) mapNonEmpty!49924))

(get-info :version)

(assert (= (and mapNonEmpty!49924 ((_ is ValueCellFull!15281) mapValue!49924)) b!1257599))

(assert (= (and b!1257602 ((_ is ValueCellFull!15281) mapDefault!49924)) b!1257601))

(assert (= start!105568 b!1257602))

(declare-fun m!1157713 () Bool)

(assert (=> mapNonEmpty!49924 m!1157713))

(declare-fun m!1157715 () Bool)

(assert (=> b!1257600 m!1157715))

(declare-fun m!1157717 () Bool)

(assert (=> b!1257600 m!1157717))

(declare-fun m!1157719 () Bool)

(assert (=> b!1257600 m!1157719))

(declare-fun m!1157721 () Bool)

(assert (=> start!105568 m!1157721))

(declare-fun m!1157723 () Bool)

(assert (=> start!105568 m!1157723))

(declare-fun m!1157725 () Bool)

(assert (=> start!105568 m!1157725))

(declare-fun m!1157727 () Bool)

(assert (=> b!1257598 m!1157727))

(declare-fun m!1157729 () Bool)

(assert (=> b!1257597 m!1157729))

(check-sat (not b!1257600) (not mapNonEmpty!49924) b_and!45035 (not b!1257598) tp_is_empty!32089 (not start!105568) (not b!1257597) (not b_next!27187))
(check-sat b_and!45035 (not b_next!27187))
