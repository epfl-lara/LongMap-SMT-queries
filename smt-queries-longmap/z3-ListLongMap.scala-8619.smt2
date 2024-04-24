; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105204 () Bool)

(assert start!105204)

(declare-fun b_free!26749 () Bool)

(declare-fun b_next!26749 () Bool)

(assert (=> start!105204 (= b_free!26749 (not b_next!26749))))

(declare-fun tp!93742 () Bool)

(declare-fun b_and!44537 () Bool)

(assert (=> start!105204 (= tp!93742 b_and!44537)))

(declare-fun b!1252566 () Bool)

(declare-fun e!711345 () Bool)

(declare-fun e!711343 () Bool)

(assert (=> b!1252566 (= e!711345 e!711343)))

(declare-fun res!835093 () Bool)

(assert (=> b!1252566 (=> res!835093 e!711343)))

(declare-datatypes ((V!47567 0))(
  ( (V!47568 (val!15888 Int)) )
))
(declare-datatypes ((tuple2!20510 0))(
  ( (tuple2!20511 (_1!10266 (_ BitVec 64)) (_2!10266 V!47567)) )
))
(declare-datatypes ((List!27757 0))(
  ( (Nil!27754) (Cons!27753 (h!28971 tuple2!20510) (t!41224 List!27757)) )
))
(declare-datatypes ((ListLongMap!18391 0))(
  ( (ListLongMap!18392 (toList!9211 List!27757)) )
))
(declare-fun lt!565209 () ListLongMap!18391)

(declare-fun contains!7535 (ListLongMap!18391 (_ BitVec 64)) Bool)

(assert (=> b!1252566 (= res!835093 (contains!7535 lt!565209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47567)

(declare-datatypes ((array!81015 0))(
  ( (array!81016 (arr!39068 (Array (_ BitVec 32) (_ BitVec 64))) (size!39605 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81015)

(declare-datatypes ((ValueCell!15062 0))(
  ( (ValueCellFull!15062 (v!18581 V!47567)) (EmptyCell!15062) )
))
(declare-datatypes ((array!81017 0))(
  ( (array!81018 (arr!39069 (Array (_ BitVec 32) ValueCell!15062)) (size!39606 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81017)

(declare-fun minValueBefore!43 () V!47567)

(declare-fun getCurrentListMap!4471 (array!81015 array!81017 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18391)

(assert (=> b!1252566 (= lt!565209 (getCurrentListMap!4471 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49243 () Bool)

(declare-fun mapRes!49243 () Bool)

(assert (=> mapIsEmpty!49243 mapRes!49243))

(declare-fun b!1252567 () Bool)

(declare-fun e!711340 () Bool)

(declare-fun tp_is_empty!31651 () Bool)

(assert (=> b!1252567 (= e!711340 tp_is_empty!31651)))

(declare-fun mapNonEmpty!49243 () Bool)

(declare-fun tp!93743 () Bool)

(declare-fun e!711344 () Bool)

(assert (=> mapNonEmpty!49243 (= mapRes!49243 (and tp!93743 e!711344))))

(declare-fun mapValue!49243 () ValueCell!15062)

(declare-fun mapRest!49243 () (Array (_ BitVec 32) ValueCell!15062))

(declare-fun mapKey!49243 () (_ BitVec 32))

(assert (=> mapNonEmpty!49243 (= (arr!39069 _values!914) (store mapRest!49243 mapKey!49243 mapValue!49243))))

(declare-fun b!1252568 () Bool)

(declare-fun res!835094 () Bool)

(declare-fun e!711342 () Bool)

(assert (=> b!1252568 (=> (not res!835094) (not e!711342))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252568 (= res!835094 (and (= (size!39606 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39605 _keys!1118) (size!39606 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252569 () Bool)

(declare-fun res!835096 () Bool)

(assert (=> b!1252569 (=> (not res!835096) (not e!711342))))

(declare-datatypes ((List!27758 0))(
  ( (Nil!27755) (Cons!27754 (h!28972 (_ BitVec 64)) (t!41225 List!27758)) )
))
(declare-fun arrayNoDuplicates!0 (array!81015 (_ BitVec 32) List!27758) Bool)

(assert (=> b!1252569 (= res!835096 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27755))))

(declare-fun b!1252570 () Bool)

(assert (=> b!1252570 (= e!711342 (not e!711345))))

(declare-fun res!835095 () Bool)

(assert (=> b!1252570 (=> res!835095 e!711345)))

(assert (=> b!1252570 (= res!835095 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!565210 () ListLongMap!18391)

(declare-fun lt!565207 () ListLongMap!18391)

(assert (=> b!1252570 (= lt!565210 lt!565207)))

(declare-datatypes ((Unit!41560 0))(
  ( (Unit!41561) )
))
(declare-fun lt!565208 () Unit!41560)

(declare-fun minValueAfter!43 () V!47567)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!953 (array!81015 array!81017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 V!47567 V!47567 (_ BitVec 32) Int) Unit!41560)

(assert (=> b!1252570 (= lt!565208 (lemmaNoChangeToArrayThenSameMapNoExtras!953 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5639 (array!81015 array!81017 (_ BitVec 32) (_ BitVec 32) V!47567 V!47567 (_ BitVec 32) Int) ListLongMap!18391)

(assert (=> b!1252570 (= lt!565207 (getCurrentListMapNoExtraKeys!5639 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252570 (= lt!565210 (getCurrentListMapNoExtraKeys!5639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252571 () Bool)

(declare-fun res!835098 () Bool)

(assert (=> b!1252571 (=> (not res!835098) (not e!711342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81015 (_ BitVec 32)) Bool)

(assert (=> b!1252571 (= res!835098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252572 () Bool)

(declare-fun e!711346 () Bool)

(assert (=> b!1252572 (= e!711346 (and e!711340 mapRes!49243))))

(declare-fun condMapEmpty!49243 () Bool)

(declare-fun mapDefault!49243 () ValueCell!15062)

(assert (=> b!1252572 (= condMapEmpty!49243 (= (arr!39069 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15062)) mapDefault!49243)))))

(declare-fun b!1252573 () Bool)

(assert (=> b!1252573 (= e!711344 tp_is_empty!31651)))

(declare-fun res!835097 () Bool)

(assert (=> start!105204 (=> (not res!835097) (not e!711342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105204 (= res!835097 (validMask!0 mask!1466))))

(assert (=> start!105204 e!711342))

(assert (=> start!105204 true))

(assert (=> start!105204 tp!93742))

(assert (=> start!105204 tp_is_empty!31651))

(declare-fun array_inv!29917 (array!81015) Bool)

(assert (=> start!105204 (array_inv!29917 _keys!1118)))

(declare-fun array_inv!29918 (array!81017) Bool)

(assert (=> start!105204 (and (array_inv!29918 _values!914) e!711346)))

(declare-fun b!1252574 () Bool)

(assert (=> b!1252574 (= e!711343 true)))

(declare-fun -!1997 (ListLongMap!18391 (_ BitVec 64)) ListLongMap!18391)

(assert (=> b!1252574 (= (-!1997 lt!565209 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565209)))

(declare-fun lt!565206 () Unit!41560)

(declare-fun removeNotPresentStillSame!107 (ListLongMap!18391 (_ BitVec 64)) Unit!41560)

(assert (=> b!1252574 (= lt!565206 (removeNotPresentStillSame!107 lt!565209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105204 res!835097) b!1252568))

(assert (= (and b!1252568 res!835094) b!1252571))

(assert (= (and b!1252571 res!835098) b!1252569))

(assert (= (and b!1252569 res!835096) b!1252570))

(assert (= (and b!1252570 (not res!835095)) b!1252566))

(assert (= (and b!1252566 (not res!835093)) b!1252574))

(assert (= (and b!1252572 condMapEmpty!49243) mapIsEmpty!49243))

(assert (= (and b!1252572 (not condMapEmpty!49243)) mapNonEmpty!49243))

(get-info :version)

(assert (= (and mapNonEmpty!49243 ((_ is ValueCellFull!15062) mapValue!49243)) b!1252573))

(assert (= (and b!1252572 ((_ is ValueCellFull!15062) mapDefault!49243)) b!1252567))

(assert (= start!105204 b!1252572))

(declare-fun m!1153647 () Bool)

(assert (=> b!1252569 m!1153647))

(declare-fun m!1153649 () Bool)

(assert (=> start!105204 m!1153649))

(declare-fun m!1153651 () Bool)

(assert (=> start!105204 m!1153651))

(declare-fun m!1153653 () Bool)

(assert (=> start!105204 m!1153653))

(declare-fun m!1153655 () Bool)

(assert (=> b!1252566 m!1153655))

(declare-fun m!1153657 () Bool)

(assert (=> b!1252566 m!1153657))

(declare-fun m!1153659 () Bool)

(assert (=> b!1252574 m!1153659))

(declare-fun m!1153661 () Bool)

(assert (=> b!1252574 m!1153661))

(declare-fun m!1153663 () Bool)

(assert (=> b!1252571 m!1153663))

(declare-fun m!1153665 () Bool)

(assert (=> mapNonEmpty!49243 m!1153665))

(declare-fun m!1153667 () Bool)

(assert (=> b!1252570 m!1153667))

(declare-fun m!1153669 () Bool)

(assert (=> b!1252570 m!1153669))

(declare-fun m!1153671 () Bool)

(assert (=> b!1252570 m!1153671))

(check-sat (not start!105204) (not b_next!26749) (not b!1252566) (not b!1252570) (not b!1252574) (not mapNonEmpty!49243) tp_is_empty!31651 (not b!1252571) b_and!44537 (not b!1252569))
(check-sat b_and!44537 (not b_next!26749))
