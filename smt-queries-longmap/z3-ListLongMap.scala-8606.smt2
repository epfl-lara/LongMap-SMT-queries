; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105104 () Bool)

(assert start!105104)

(declare-fun b_free!26671 () Bool)

(declare-fun b_next!26671 () Bool)

(assert (=> start!105104 (= b_free!26671 (not b_next!26671))))

(declare-fun tp!93506 () Bool)

(declare-fun b_and!44449 () Bool)

(assert (=> start!105104 (= tp!93506 b_and!44449)))

(declare-fun b!1251356 () Bool)

(declare-fun res!834334 () Bool)

(declare-fun e!710426 () Bool)

(assert (=> b!1251356 (=> (not res!834334) (not e!710426))))

(declare-datatypes ((array!80865 0))(
  ( (array!80866 (arr!38994 (Array (_ BitVec 32) (_ BitVec 64))) (size!39531 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80865)

(declare-datatypes ((List!27701 0))(
  ( (Nil!27698) (Cons!27697 (h!28915 (_ BitVec 64)) (t!41166 List!27701)) )
))
(declare-fun arrayNoDuplicates!0 (array!80865 (_ BitVec 32) List!27701) Bool)

(assert (=> b!1251356 (= res!834334 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27698))))

(declare-fun b!1251357 () Bool)

(declare-fun e!710423 () Bool)

(assert (=> b!1251357 (= e!710426 (not e!710423))))

(declare-fun res!834335 () Bool)

(assert (=> b!1251357 (=> res!834335 e!710423)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251357 (= res!834335 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47463 0))(
  ( (V!47464 (val!15849 Int)) )
))
(declare-datatypes ((tuple2!20448 0))(
  ( (tuple2!20449 (_1!10235 (_ BitVec 64)) (_2!10235 V!47463)) )
))
(declare-datatypes ((List!27702 0))(
  ( (Nil!27699) (Cons!27698 (h!28916 tuple2!20448) (t!41167 List!27702)) )
))
(declare-datatypes ((ListLongMap!18329 0))(
  ( (ListLongMap!18330 (toList!9180 List!27702)) )
))
(declare-fun lt!564497 () ListLongMap!18329)

(declare-fun lt!564498 () ListLongMap!18329)

(assert (=> b!1251357 (= lt!564497 lt!564498)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41500 0))(
  ( (Unit!41501) )
))
(declare-fun lt!564500 () Unit!41500)

(declare-fun minValueAfter!43 () V!47463)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47463)

(declare-datatypes ((ValueCell!15023 0))(
  ( (ValueCellFull!15023 (v!18541 V!47463)) (EmptyCell!15023) )
))
(declare-datatypes ((array!80867 0))(
  ( (array!80868 (arr!38995 (Array (_ BitVec 32) ValueCell!15023)) (size!39532 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80867)

(declare-fun minValueBefore!43 () V!47463)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!929 (array!80865 array!80867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 V!47463 V!47463 (_ BitVec 32) Int) Unit!41500)

(assert (=> b!1251357 (= lt!564500 (lemmaNoChangeToArrayThenSameMapNoExtras!929 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5615 (array!80865 array!80867 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18329)

(assert (=> b!1251357 (= lt!564498 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251357 (= lt!564497 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251358 () Bool)

(declare-fun e!710427 () Bool)

(declare-fun e!710421 () Bool)

(declare-fun mapRes!49123 () Bool)

(assert (=> b!1251358 (= e!710427 (and e!710421 mapRes!49123))))

(declare-fun condMapEmpty!49123 () Bool)

(declare-fun mapDefault!49123 () ValueCell!15023)

(assert (=> b!1251358 (= condMapEmpty!49123 (= (arr!38995 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15023)) mapDefault!49123)))))

(declare-fun mapIsEmpty!49123 () Bool)

(assert (=> mapIsEmpty!49123 mapRes!49123))

(declare-fun mapNonEmpty!49123 () Bool)

(declare-fun tp!93505 () Bool)

(declare-fun e!710422 () Bool)

(assert (=> mapNonEmpty!49123 (= mapRes!49123 (and tp!93505 e!710422))))

(declare-fun mapRest!49123 () (Array (_ BitVec 32) ValueCell!15023))

(declare-fun mapValue!49123 () ValueCell!15023)

(declare-fun mapKey!49123 () (_ BitVec 32))

(assert (=> mapNonEmpty!49123 (= (arr!38995 _values!914) (store mapRest!49123 mapKey!49123 mapValue!49123))))

(declare-fun b!1251359 () Bool)

(declare-fun e!710424 () Bool)

(assert (=> b!1251359 (= e!710424 true)))

(declare-fun lt!564501 () ListLongMap!18329)

(declare-fun -!1972 (ListLongMap!18329 (_ BitVec 64)) ListLongMap!18329)

(assert (=> b!1251359 (= (-!1972 lt!564501 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564501)))

(declare-fun lt!564499 () Unit!41500)

(declare-fun removeNotPresentStillSame!82 (ListLongMap!18329 (_ BitVec 64)) Unit!41500)

(assert (=> b!1251359 (= lt!564499 (removeNotPresentStillSame!82 lt!564501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834332 () Bool)

(assert (=> start!105104 (=> (not res!834332) (not e!710426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105104 (= res!834332 (validMask!0 mask!1466))))

(assert (=> start!105104 e!710426))

(assert (=> start!105104 true))

(assert (=> start!105104 tp!93506))

(declare-fun tp_is_empty!31573 () Bool)

(assert (=> start!105104 tp_is_empty!31573))

(declare-fun array_inv!29867 (array!80865) Bool)

(assert (=> start!105104 (array_inv!29867 _keys!1118)))

(declare-fun array_inv!29868 (array!80867) Bool)

(assert (=> start!105104 (and (array_inv!29868 _values!914) e!710427)))

(declare-fun b!1251360 () Bool)

(assert (=> b!1251360 (= e!710421 tp_is_empty!31573)))

(declare-fun b!1251361 () Bool)

(declare-fun res!834333 () Bool)

(assert (=> b!1251361 (=> (not res!834333) (not e!710426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80865 (_ BitVec 32)) Bool)

(assert (=> b!1251361 (= res!834333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251362 () Bool)

(declare-fun res!834331 () Bool)

(assert (=> b!1251362 (=> (not res!834331) (not e!710426))))

(assert (=> b!1251362 (= res!834331 (and (= (size!39532 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39531 _keys!1118) (size!39532 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251363 () Bool)

(assert (=> b!1251363 (= e!710423 e!710424)))

(declare-fun res!834330 () Bool)

(assert (=> b!1251363 (=> res!834330 e!710424)))

(declare-fun contains!7510 (ListLongMap!18329 (_ BitVec 64)) Bool)

(assert (=> b!1251363 (= res!834330 (contains!7510 lt!564501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4447 (array!80865 array!80867 (_ BitVec 32) (_ BitVec 32) V!47463 V!47463 (_ BitVec 32) Int) ListLongMap!18329)

(assert (=> b!1251363 (= lt!564501 (getCurrentListMap!4447 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251364 () Bool)

(assert (=> b!1251364 (= e!710422 tp_is_empty!31573)))

(assert (= (and start!105104 res!834332) b!1251362))

(assert (= (and b!1251362 res!834331) b!1251361))

(assert (= (and b!1251361 res!834333) b!1251356))

(assert (= (and b!1251356 res!834334) b!1251357))

(assert (= (and b!1251357 (not res!834335)) b!1251363))

(assert (= (and b!1251363 (not res!834330)) b!1251359))

(assert (= (and b!1251358 condMapEmpty!49123) mapIsEmpty!49123))

(assert (= (and b!1251358 (not condMapEmpty!49123)) mapNonEmpty!49123))

(get-info :version)

(assert (= (and mapNonEmpty!49123 ((_ is ValueCellFull!15023) mapValue!49123)) b!1251364))

(assert (= (and b!1251358 ((_ is ValueCellFull!15023) mapDefault!49123)) b!1251360))

(assert (= start!105104 b!1251358))

(declare-fun m!1152507 () Bool)

(assert (=> b!1251357 m!1152507))

(declare-fun m!1152509 () Bool)

(assert (=> b!1251357 m!1152509))

(declare-fun m!1152511 () Bool)

(assert (=> b!1251357 m!1152511))

(declare-fun m!1152513 () Bool)

(assert (=> b!1251361 m!1152513))

(declare-fun m!1152515 () Bool)

(assert (=> b!1251363 m!1152515))

(declare-fun m!1152517 () Bool)

(assert (=> b!1251363 m!1152517))

(declare-fun m!1152519 () Bool)

(assert (=> b!1251356 m!1152519))

(declare-fun m!1152521 () Bool)

(assert (=> mapNonEmpty!49123 m!1152521))

(declare-fun m!1152523 () Bool)

(assert (=> start!105104 m!1152523))

(declare-fun m!1152525 () Bool)

(assert (=> start!105104 m!1152525))

(declare-fun m!1152527 () Bool)

(assert (=> start!105104 m!1152527))

(declare-fun m!1152529 () Bool)

(assert (=> b!1251359 m!1152529))

(declare-fun m!1152531 () Bool)

(assert (=> b!1251359 m!1152531))

(check-sat b_and!44449 (not start!105104) tp_is_empty!31573 (not b!1251361) (not b!1251357) (not b_next!26671) (not mapNonEmpty!49123) (not b!1251359) (not b!1251363) (not b!1251356))
(check-sat b_and!44449 (not b_next!26671))
