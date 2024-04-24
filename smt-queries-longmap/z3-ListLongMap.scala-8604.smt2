; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105092 () Bool)

(assert start!105092)

(declare-fun b_free!26659 () Bool)

(declare-fun b_next!26659 () Bool)

(assert (=> start!105092 (= b_free!26659 (not b_next!26659))))

(declare-fun tp!93469 () Bool)

(declare-fun b_and!44437 () Bool)

(assert (=> start!105092 (= tp!93469 b_and!44437)))

(declare-fun b!1251201 () Bool)

(declare-fun e!710302 () Bool)

(declare-fun tp_is_empty!31561 () Bool)

(assert (=> b!1251201 (= e!710302 tp_is_empty!31561)))

(declare-fun mapNonEmpty!49105 () Bool)

(declare-fun mapRes!49105 () Bool)

(declare-fun tp!93470 () Bool)

(declare-fun e!710306 () Bool)

(assert (=> mapNonEmpty!49105 (= mapRes!49105 (and tp!93470 e!710306))))

(declare-datatypes ((V!47447 0))(
  ( (V!47448 (val!15843 Int)) )
))
(declare-datatypes ((ValueCell!15017 0))(
  ( (ValueCellFull!15017 (v!18535 V!47447)) (EmptyCell!15017) )
))
(declare-datatypes ((array!80841 0))(
  ( (array!80842 (arr!38982 (Array (_ BitVec 32) ValueCell!15017)) (size!39519 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80841)

(declare-fun mapKey!49105 () (_ BitVec 32))

(declare-fun mapRest!49105 () (Array (_ BitVec 32) ValueCell!15017))

(declare-fun mapValue!49105 () ValueCell!15017)

(assert (=> mapNonEmpty!49105 (= (arr!38982 _values!914) (store mapRest!49105 mapKey!49105 mapValue!49105))))

(declare-fun b!1251202 () Bool)

(declare-fun res!834233 () Bool)

(declare-fun e!710303 () Bool)

(assert (=> b!1251202 (=> (not res!834233) (not e!710303))))

(declare-datatypes ((array!80843 0))(
  ( (array!80844 (arr!38983 (Array (_ BitVec 32) (_ BitVec 64))) (size!39520 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80843)

(declare-datatypes ((List!27691 0))(
  ( (Nil!27688) (Cons!27687 (h!28905 (_ BitVec 64)) (t!41156 List!27691)) )
))
(declare-fun arrayNoDuplicates!0 (array!80843 (_ BitVec 32) List!27691) Bool)

(assert (=> b!1251202 (= res!834233 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27688))))

(declare-fun mapIsEmpty!49105 () Bool)

(assert (=> mapIsEmpty!49105 mapRes!49105))

(declare-fun b!1251203 () Bool)

(declare-fun e!710304 () Bool)

(assert (=> b!1251203 (= e!710303 (not e!710304))))

(declare-fun res!834230 () Bool)

(assert (=> b!1251203 (=> res!834230 e!710304)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251203 (= res!834230 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20438 0))(
  ( (tuple2!20439 (_1!10230 (_ BitVec 64)) (_2!10230 V!47447)) )
))
(declare-datatypes ((List!27692 0))(
  ( (Nil!27689) (Cons!27688 (h!28906 tuple2!20438) (t!41157 List!27692)) )
))
(declare-datatypes ((ListLongMap!18319 0))(
  ( (ListLongMap!18320 (toList!9175 List!27692)) )
))
(declare-fun lt!564417 () ListLongMap!18319)

(declare-fun lt!564414 () ListLongMap!18319)

(assert (=> b!1251203 (= lt!564417 lt!564414)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47447)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47447)

(declare-fun minValueBefore!43 () V!47447)

(declare-datatypes ((Unit!41490 0))(
  ( (Unit!41491) )
))
(declare-fun lt!564416 () Unit!41490)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!924 (array!80843 array!80841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 V!47447 V!47447 (_ BitVec 32) Int) Unit!41490)

(assert (=> b!1251203 (= lt!564416 (lemmaNoChangeToArrayThenSameMapNoExtras!924 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5610 (array!80843 array!80841 (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 (_ BitVec 32) Int) ListLongMap!18319)

(assert (=> b!1251203 (= lt!564414 (getCurrentListMapNoExtraKeys!5610 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251203 (= lt!564417 (getCurrentListMapNoExtraKeys!5610 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834231 () Bool)

(assert (=> start!105092 (=> (not res!834231) (not e!710303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105092 (= res!834231 (validMask!0 mask!1466))))

(assert (=> start!105092 e!710303))

(assert (=> start!105092 true))

(assert (=> start!105092 tp!93469))

(assert (=> start!105092 tp_is_empty!31561))

(declare-fun array_inv!29855 (array!80843) Bool)

(assert (=> start!105092 (array_inv!29855 _keys!1118)))

(declare-fun e!710305 () Bool)

(declare-fun array_inv!29856 (array!80841) Bool)

(assert (=> start!105092 (and (array_inv!29856 _values!914) e!710305)))

(declare-fun b!1251204 () Bool)

(declare-fun res!834229 () Bool)

(assert (=> b!1251204 (=> (not res!834229) (not e!710303))))

(assert (=> b!1251204 (= res!834229 (and (= (size!39519 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39520 _keys!1118) (size!39519 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251205 () Bool)

(assert (=> b!1251205 (= e!710305 (and e!710302 mapRes!49105))))

(declare-fun condMapEmpty!49105 () Bool)

(declare-fun mapDefault!49105 () ValueCell!15017)

(assert (=> b!1251205 (= condMapEmpty!49105 (= (arr!38982 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15017)) mapDefault!49105)))))

(declare-fun b!1251206 () Bool)

(assert (=> b!1251206 (= e!710304 true)))

(declare-fun lt!564415 () Bool)

(declare-fun contains!7505 (ListLongMap!18319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4442 (array!80843 array!80841 (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 (_ BitVec 32) Int) ListLongMap!18319)

(assert (=> b!1251206 (= lt!564415 (contains!7505 (getCurrentListMap!4442 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251207 () Bool)

(assert (=> b!1251207 (= e!710306 tp_is_empty!31561)))

(declare-fun b!1251208 () Bool)

(declare-fun res!834232 () Bool)

(assert (=> b!1251208 (=> (not res!834232) (not e!710303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80843 (_ BitVec 32)) Bool)

(assert (=> b!1251208 (= res!834232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105092 res!834231) b!1251204))

(assert (= (and b!1251204 res!834229) b!1251208))

(assert (= (and b!1251208 res!834232) b!1251202))

(assert (= (and b!1251202 res!834233) b!1251203))

(assert (= (and b!1251203 (not res!834230)) b!1251206))

(assert (= (and b!1251205 condMapEmpty!49105) mapIsEmpty!49105))

(assert (= (and b!1251205 (not condMapEmpty!49105)) mapNonEmpty!49105))

(get-info :version)

(assert (= (and mapNonEmpty!49105 ((_ is ValueCellFull!15017) mapValue!49105)) b!1251207))

(assert (= (and b!1251205 ((_ is ValueCellFull!15017) mapDefault!49105)) b!1251201))

(assert (= start!105092 b!1251205))

(declare-fun m!1152363 () Bool)

(assert (=> b!1251208 m!1152363))

(declare-fun m!1152365 () Bool)

(assert (=> b!1251206 m!1152365))

(assert (=> b!1251206 m!1152365))

(declare-fun m!1152367 () Bool)

(assert (=> b!1251206 m!1152367))

(declare-fun m!1152369 () Bool)

(assert (=> b!1251203 m!1152369))

(declare-fun m!1152371 () Bool)

(assert (=> b!1251203 m!1152371))

(declare-fun m!1152373 () Bool)

(assert (=> b!1251203 m!1152373))

(declare-fun m!1152375 () Bool)

(assert (=> start!105092 m!1152375))

(declare-fun m!1152377 () Bool)

(assert (=> start!105092 m!1152377))

(declare-fun m!1152379 () Bool)

(assert (=> start!105092 m!1152379))

(declare-fun m!1152381 () Bool)

(assert (=> b!1251202 m!1152381))

(declare-fun m!1152383 () Bool)

(assert (=> mapNonEmpty!49105 m!1152383))

(check-sat (not b!1251208) (not start!105092) (not mapNonEmpty!49105) (not b!1251203) (not b_next!26659) (not b!1251206) tp_is_empty!31561 b_and!44437 (not b!1251202))
(check-sat b_and!44437 (not b_next!26659))
