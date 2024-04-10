; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104802 () Bool)

(assert start!104802)

(declare-fun b_free!26607 () Bool)

(declare-fun b_next!26607 () Bool)

(assert (=> start!104802 (= b_free!26607 (not b_next!26607))))

(declare-fun tp!93310 () Bool)

(declare-fun b_and!44375 () Bool)

(assert (=> start!104802 (= tp!93310 b_and!44375)))

(declare-fun b!1249263 () Bool)

(declare-fun res!833364 () Bool)

(declare-fun e!709008 () Bool)

(assert (=> b!1249263 (=> (not res!833364) (not e!709008))))

(declare-datatypes ((array!80700 0))(
  ( (array!80701 (arr!38917 (Array (_ BitVec 32) (_ BitVec 64))) (size!39453 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80700)

(declare-datatypes ((List!27622 0))(
  ( (Nil!27619) (Cons!27618 (h!28827 (_ BitVec 64)) (t!41093 List!27622)) )
))
(declare-fun arrayNoDuplicates!0 (array!80700 (_ BitVec 32) List!27622) Bool)

(assert (=> b!1249263 (= res!833364 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27619))))

(declare-fun mapNonEmpty!49024 () Bool)

(declare-fun mapRes!49024 () Bool)

(declare-fun tp!93311 () Bool)

(declare-fun e!709010 () Bool)

(assert (=> mapNonEmpty!49024 (= mapRes!49024 (and tp!93311 e!709010))))

(declare-fun mapKey!49024 () (_ BitVec 32))

(declare-datatypes ((V!47377 0))(
  ( (V!47378 (val!15817 Int)) )
))
(declare-datatypes ((ValueCell!14991 0))(
  ( (ValueCellFull!14991 (v!18513 V!47377)) (EmptyCell!14991) )
))
(declare-fun mapRest!49024 () (Array (_ BitVec 32) ValueCell!14991))

(declare-datatypes ((array!80702 0))(
  ( (array!80703 (arr!38918 (Array (_ BitVec 32) ValueCell!14991)) (size!39454 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80702)

(declare-fun mapValue!49024 () ValueCell!14991)

(assert (=> mapNonEmpty!49024 (= (arr!38918 _values!914) (store mapRest!49024 mapKey!49024 mapValue!49024))))

(declare-fun b!1249264 () Bool)

(declare-fun e!709012 () Bool)

(declare-fun e!709011 () Bool)

(assert (=> b!1249264 (= e!709012 (and e!709011 mapRes!49024))))

(declare-fun condMapEmpty!49024 () Bool)

(declare-fun mapDefault!49024 () ValueCell!14991)

(assert (=> b!1249264 (= condMapEmpty!49024 (= (arr!38918 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14991)) mapDefault!49024)))))

(declare-fun b!1249265 () Bool)

(declare-fun tp_is_empty!31509 () Bool)

(assert (=> b!1249265 (= e!709011 tp_is_empty!31509)))

(declare-fun b!1249266 () Bool)

(assert (=> b!1249266 (= e!709010 tp_is_empty!31509)))

(declare-fun b!1249267 () Bool)

(declare-fun res!833367 () Bool)

(assert (=> b!1249267 (=> (not res!833367) (not e!709008))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80700 (_ BitVec 32)) Bool)

(assert (=> b!1249267 (= res!833367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49024 () Bool)

(assert (=> mapIsEmpty!49024 mapRes!49024))

(declare-fun res!833365 () Bool)

(assert (=> start!104802 (=> (not res!833365) (not e!709008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104802 (= res!833365 (validMask!0 mask!1466))))

(assert (=> start!104802 e!709008))

(assert (=> start!104802 true))

(assert (=> start!104802 tp!93310))

(assert (=> start!104802 tp_is_empty!31509))

(declare-fun array_inv!29699 (array!80700) Bool)

(assert (=> start!104802 (array_inv!29699 _keys!1118)))

(declare-fun array_inv!29700 (array!80702) Bool)

(assert (=> start!104802 (and (array_inv!29700 _values!914) e!709012)))

(declare-fun b!1249268 () Bool)

(declare-fun res!833366 () Bool)

(assert (=> b!1249268 (=> (not res!833366) (not e!709008))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249268 (= res!833366 (and (= (size!39454 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39453 _keys!1118) (size!39454 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249269 () Bool)

(assert (=> b!1249269 (= e!709008 (not true))))

(declare-datatypes ((tuple2!20378 0))(
  ( (tuple2!20379 (_1!10200 (_ BitVec 64)) (_2!10200 V!47377)) )
))
(declare-datatypes ((List!27623 0))(
  ( (Nil!27620) (Cons!27619 (h!28828 tuple2!20378) (t!41094 List!27623)) )
))
(declare-datatypes ((ListLongMap!18251 0))(
  ( (ListLongMap!18252 (toList!9141 List!27623)) )
))
(declare-fun lt!563654 () ListLongMap!18251)

(declare-fun lt!563656 () ListLongMap!18251)

(assert (=> b!1249269 (= lt!563654 lt!563656)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41479 0))(
  ( (Unit!41480) )
))
(declare-fun lt!563655 () Unit!41479)

(declare-fun minValueAfter!43 () V!47377)

(declare-fun zeroValue!871 () V!47377)

(declare-fun minValueBefore!43 () V!47377)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!912 (array!80700 array!80702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47377 V!47377 V!47377 V!47377 (_ BitVec 32) Int) Unit!41479)

(assert (=> b!1249269 (= lt!563655 (lemmaNoChangeToArrayThenSameMapNoExtras!912 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5548 (array!80700 array!80702 (_ BitVec 32) (_ BitVec 32) V!47377 V!47377 (_ BitVec 32) Int) ListLongMap!18251)

(assert (=> b!1249269 (= lt!563656 (getCurrentListMapNoExtraKeys!5548 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249269 (= lt!563654 (getCurrentListMapNoExtraKeys!5548 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104802 res!833365) b!1249268))

(assert (= (and b!1249268 res!833366) b!1249267))

(assert (= (and b!1249267 res!833367) b!1249263))

(assert (= (and b!1249263 res!833364) b!1249269))

(assert (= (and b!1249264 condMapEmpty!49024) mapIsEmpty!49024))

(assert (= (and b!1249264 (not condMapEmpty!49024)) mapNonEmpty!49024))

(get-info :version)

(assert (= (and mapNonEmpty!49024 ((_ is ValueCellFull!14991) mapValue!49024)) b!1249266))

(assert (= (and b!1249264 ((_ is ValueCellFull!14991) mapDefault!49024)) b!1249265))

(assert (= start!104802 b!1249264))

(declare-fun m!1150217 () Bool)

(assert (=> b!1249267 m!1150217))

(declare-fun m!1150219 () Bool)

(assert (=> mapNonEmpty!49024 m!1150219))

(declare-fun m!1150221 () Bool)

(assert (=> b!1249263 m!1150221))

(declare-fun m!1150223 () Bool)

(assert (=> start!104802 m!1150223))

(declare-fun m!1150225 () Bool)

(assert (=> start!104802 m!1150225))

(declare-fun m!1150227 () Bool)

(assert (=> start!104802 m!1150227))

(declare-fun m!1150229 () Bool)

(assert (=> b!1249269 m!1150229))

(declare-fun m!1150231 () Bool)

(assert (=> b!1249269 m!1150231))

(declare-fun m!1150233 () Bool)

(assert (=> b!1249269 m!1150233))

(check-sat (not b!1249263) (not b!1249267) tp_is_empty!31509 (not mapNonEmpty!49024) (not start!104802) (not b!1249269) b_and!44375 (not b_next!26607))
(check-sat b_and!44375 (not b_next!26607))
