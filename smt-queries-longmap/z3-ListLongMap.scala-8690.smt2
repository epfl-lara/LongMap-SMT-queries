; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105556 () Bool)

(assert start!105556)

(declare-fun b_free!27175 () Bool)

(declare-fun b_next!27175 () Bool)

(assert (=> start!105556 (= b_free!27175 (not b_next!27175))))

(declare-fun tp!95044 () Bool)

(declare-fun b_and!45023 () Bool)

(assert (=> start!105556 (= tp!95044 b_and!45023)))

(declare-fun b!1257471 () Bool)

(declare-fun res!838218 () Bool)

(declare-fun e!715051 () Bool)

(assert (=> b!1257471 (=> (not res!838218) (not e!715051))))

(declare-datatypes ((array!81713 0))(
  ( (array!81714 (arr!39414 (Array (_ BitVec 32) (_ BitVec 64))) (size!39952 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81713)

(declare-datatypes ((List!28094 0))(
  ( (Nil!28091) (Cons!28090 (h!29299 (_ BitVec 64)) (t!41576 List!28094)) )
))
(declare-fun arrayNoDuplicates!0 (array!81713 (_ BitVec 32) List!28094) Bool)

(assert (=> b!1257471 (= res!838218 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28091))))

(declare-fun b!1257472 () Bool)

(declare-fun e!715047 () Bool)

(declare-fun tp_is_empty!32077 () Bool)

(assert (=> b!1257472 (= e!715047 tp_is_empty!32077)))

(declare-fun mapIsEmpty!49906 () Bool)

(declare-fun mapRes!49906 () Bool)

(assert (=> mapIsEmpty!49906 mapRes!49906))

(declare-fun mapNonEmpty!49906 () Bool)

(declare-fun tp!95045 () Bool)

(assert (=> mapNonEmpty!49906 (= mapRes!49906 (and tp!95045 e!715047))))

(declare-datatypes ((V!48135 0))(
  ( (V!48136 (val!16101 Int)) )
))
(declare-datatypes ((ValueCell!15275 0))(
  ( (ValueCellFull!15275 (v!18802 V!48135)) (EmptyCell!15275) )
))
(declare-fun mapValue!49906 () ValueCell!15275)

(declare-fun mapRest!49906 () (Array (_ BitVec 32) ValueCell!15275))

(declare-datatypes ((array!81715 0))(
  ( (array!81716 (arr!39415 (Array (_ BitVec 32) ValueCell!15275)) (size!39953 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81715)

(declare-fun mapKey!49906 () (_ BitVec 32))

(assert (=> mapNonEmpty!49906 (= (arr!39415 _values!914) (store mapRest!49906 mapKey!49906 mapValue!49906))))

(declare-fun b!1257473 () Bool)

(declare-fun res!838221 () Bool)

(assert (=> b!1257473 (=> (not res!838221) (not e!715051))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81713 (_ BitVec 32)) Bool)

(assert (=> b!1257473 (= res!838221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257474 () Bool)

(declare-fun e!715050 () Bool)

(declare-fun e!715048 () Bool)

(assert (=> b!1257474 (= e!715050 (and e!715048 mapRes!49906))))

(declare-fun condMapEmpty!49906 () Bool)

(declare-fun mapDefault!49906 () ValueCell!15275)

(assert (=> b!1257474 (= condMapEmpty!49906 (= (arr!39415 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15275)) mapDefault!49906)))))

(declare-fun b!1257475 () Bool)

(assert (=> b!1257475 (= e!715048 tp_is_empty!32077)))

(declare-fun b!1257476 () Bool)

(assert (=> b!1257476 (= e!715051 (not true))))

(declare-datatypes ((tuple2!20886 0))(
  ( (tuple2!20887 (_1!10454 (_ BitVec 64)) (_2!10454 V!48135)) )
))
(declare-datatypes ((List!28095 0))(
  ( (Nil!28092) (Cons!28091 (h!29300 tuple2!20886) (t!41577 List!28095)) )
))
(declare-datatypes ((ListLongMap!18759 0))(
  ( (ListLongMap!18760 (toList!9395 List!28095)) )
))
(declare-fun lt!568614 () ListLongMap!18759)

(declare-fun lt!568613 () ListLongMap!18759)

(assert (=> b!1257476 (= lt!568614 lt!568613)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48135)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48135)

(declare-fun minValueBefore!43 () V!48135)

(declare-datatypes ((Unit!41749 0))(
  ( (Unit!41750) )
))
(declare-fun lt!568615 () Unit!41749)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1099 (array!81713 array!81715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48135 V!48135 V!48135 V!48135 (_ BitVec 32) Int) Unit!41749)

(assert (=> b!1257476 (= lt!568615 (lemmaNoChangeToArrayThenSameMapNoExtras!1099 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5777 (array!81713 array!81715 (_ BitVec 32) (_ BitVec 32) V!48135 V!48135 (_ BitVec 32) Int) ListLongMap!18759)

(assert (=> b!1257476 (= lt!568613 (getCurrentListMapNoExtraKeys!5777 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257476 (= lt!568614 (getCurrentListMapNoExtraKeys!5777 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257477 () Bool)

(declare-fun res!838219 () Bool)

(assert (=> b!1257477 (=> (not res!838219) (not e!715051))))

(assert (=> b!1257477 (= res!838219 (and (= (size!39953 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39952 _keys!1118) (size!39953 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!838220 () Bool)

(assert (=> start!105556 (=> (not res!838220) (not e!715051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105556 (= res!838220 (validMask!0 mask!1466))))

(assert (=> start!105556 e!715051))

(assert (=> start!105556 true))

(assert (=> start!105556 tp!95044))

(assert (=> start!105556 tp_is_empty!32077))

(declare-fun array_inv!30157 (array!81713) Bool)

(assert (=> start!105556 (array_inv!30157 _keys!1118)))

(declare-fun array_inv!30158 (array!81715) Bool)

(assert (=> start!105556 (and (array_inv!30158 _values!914) e!715050)))

(assert (= (and start!105556 res!838220) b!1257477))

(assert (= (and b!1257477 res!838219) b!1257473))

(assert (= (and b!1257473 res!838221) b!1257471))

(assert (= (and b!1257471 res!838218) b!1257476))

(assert (= (and b!1257474 condMapEmpty!49906) mapIsEmpty!49906))

(assert (= (and b!1257474 (not condMapEmpty!49906)) mapNonEmpty!49906))

(get-info :version)

(assert (= (and mapNonEmpty!49906 ((_ is ValueCellFull!15275) mapValue!49906)) b!1257472))

(assert (= (and b!1257474 ((_ is ValueCellFull!15275) mapDefault!49906)) b!1257475))

(assert (= start!105556 b!1257474))

(declare-fun m!1157605 () Bool)

(assert (=> b!1257471 m!1157605))

(declare-fun m!1157607 () Bool)

(assert (=> mapNonEmpty!49906 m!1157607))

(declare-fun m!1157609 () Bool)

(assert (=> b!1257476 m!1157609))

(declare-fun m!1157611 () Bool)

(assert (=> b!1257476 m!1157611))

(declare-fun m!1157613 () Bool)

(assert (=> b!1257476 m!1157613))

(declare-fun m!1157615 () Bool)

(assert (=> b!1257473 m!1157615))

(declare-fun m!1157617 () Bool)

(assert (=> start!105556 m!1157617))

(declare-fun m!1157619 () Bool)

(assert (=> start!105556 m!1157619))

(declare-fun m!1157621 () Bool)

(assert (=> start!105556 m!1157621))

(check-sat tp_is_empty!32077 b_and!45023 (not start!105556) (not b_next!27175) (not b!1257476) (not b!1257471) (not mapNonEmpty!49906) (not b!1257473))
(check-sat b_and!45023 (not b_next!27175))
