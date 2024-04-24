; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105012 () Bool)

(assert start!105012)

(declare-fun b_free!26593 () Bool)

(declare-fun b_next!26593 () Bool)

(assert (=> start!105012 (= b_free!26593 (not b_next!26593))))

(declare-fun tp!93269 () Bool)

(declare-fun b_and!44363 () Bool)

(assert (=> start!105012 (= tp!93269 b_and!44363)))

(declare-fun b!1250421 () Bool)

(declare-fun res!833801 () Bool)

(declare-fun e!709750 () Bool)

(assert (=> b!1250421 (=> (not res!833801) (not e!709750))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80709 0))(
  ( (array!80710 (arr!38917 (Array (_ BitVec 32) (_ BitVec 64))) (size!39454 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80709)

(declare-datatypes ((V!47359 0))(
  ( (V!47360 (val!15810 Int)) )
))
(declare-datatypes ((ValueCell!14984 0))(
  ( (ValueCellFull!14984 (v!18502 V!47359)) (EmptyCell!14984) )
))
(declare-datatypes ((array!80711 0))(
  ( (array!80712 (arr!38918 (Array (_ BitVec 32) ValueCell!14984)) (size!39455 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80711)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250421 (= res!833801 (and (= (size!39455 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39454 _keys!1118) (size!39455 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250422 () Bool)

(declare-fun e!709754 () Bool)

(declare-fun tp_is_empty!31495 () Bool)

(assert (=> b!1250422 (= e!709754 tp_is_empty!31495)))

(declare-fun mapIsEmpty!49003 () Bool)

(declare-fun mapRes!49003 () Bool)

(assert (=> mapIsEmpty!49003 mapRes!49003))

(declare-fun mapNonEmpty!49003 () Bool)

(declare-fun tp!93268 () Bool)

(declare-fun e!709751 () Bool)

(assert (=> mapNonEmpty!49003 (= mapRes!49003 (and tp!93268 e!709751))))

(declare-fun mapRest!49003 () (Array (_ BitVec 32) ValueCell!14984))

(declare-fun mapValue!49003 () ValueCell!14984)

(declare-fun mapKey!49003 () (_ BitVec 32))

(assert (=> mapNonEmpty!49003 (= (arr!38918 _values!914) (store mapRest!49003 mapKey!49003 mapValue!49003))))

(declare-fun b!1250423 () Bool)

(declare-fun res!833803 () Bool)

(assert (=> b!1250423 (=> (not res!833803) (not e!709750))))

(declare-datatypes ((List!27645 0))(
  ( (Nil!27642) (Cons!27641 (h!28859 (_ BitVec 64)) (t!41108 List!27645)) )
))
(declare-fun arrayNoDuplicates!0 (array!80709 (_ BitVec 32) List!27645) Bool)

(assert (=> b!1250423 (= res!833803 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27642))))

(declare-fun b!1250424 () Bool)

(declare-fun res!833802 () Bool)

(assert (=> b!1250424 (=> (not res!833802) (not e!709750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80709 (_ BitVec 32)) Bool)

(assert (=> b!1250424 (= res!833802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250425 () Bool)

(declare-fun e!709753 () Bool)

(assert (=> b!1250425 (= e!709753 (and e!709754 mapRes!49003))))

(declare-fun condMapEmpty!49003 () Bool)

(declare-fun mapDefault!49003 () ValueCell!14984)

(assert (=> b!1250425 (= condMapEmpty!49003 (= (arr!38918 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14984)) mapDefault!49003)))))

(declare-fun b!1250426 () Bool)

(assert (=> b!1250426 (= e!709751 tp_is_empty!31495)))

(declare-fun res!833800 () Bool)

(assert (=> start!105012 (=> (not res!833800) (not e!709750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105012 (= res!833800 (validMask!0 mask!1466))))

(assert (=> start!105012 e!709750))

(assert (=> start!105012 true))

(assert (=> start!105012 tp!93269))

(assert (=> start!105012 tp_is_empty!31495))

(declare-fun array_inv!29807 (array!80709) Bool)

(assert (=> start!105012 (array_inv!29807 _keys!1118)))

(declare-fun array_inv!29808 (array!80711) Bool)

(assert (=> start!105012 (and (array_inv!29808 _values!914) e!709753)))

(declare-fun b!1250427 () Bool)

(assert (=> b!1250427 (= e!709750 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20392 0))(
  ( (tuple2!20393 (_1!10207 (_ BitVec 64)) (_2!10207 V!47359)) )
))
(declare-datatypes ((List!27646 0))(
  ( (Nil!27643) (Cons!27642 (h!28860 tuple2!20392) (t!41109 List!27646)) )
))
(declare-datatypes ((ListLongMap!18273 0))(
  ( (ListLongMap!18274 (toList!9152 List!27646)) )
))
(declare-fun lt!564091 () ListLongMap!18273)

(declare-fun minValueAfter!43 () V!47359)

(declare-fun zeroValue!871 () V!47359)

(declare-fun getCurrentListMapNoExtraKeys!5587 (array!80709 array!80711 (_ BitVec 32) (_ BitVec 32) V!47359 V!47359 (_ BitVec 32) Int) ListLongMap!18273)

(assert (=> b!1250427 (= lt!564091 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564092 () ListLongMap!18273)

(declare-fun minValueBefore!43 () V!47359)

(assert (=> b!1250427 (= lt!564092 (getCurrentListMapNoExtraKeys!5587 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105012 res!833800) b!1250421))

(assert (= (and b!1250421 res!833801) b!1250424))

(assert (= (and b!1250424 res!833802) b!1250423))

(assert (= (and b!1250423 res!833803) b!1250427))

(assert (= (and b!1250425 condMapEmpty!49003) mapIsEmpty!49003))

(assert (= (and b!1250425 (not condMapEmpty!49003)) mapNonEmpty!49003))

(get-info :version)

(assert (= (and mapNonEmpty!49003 ((_ is ValueCellFull!14984) mapValue!49003)) b!1250426))

(assert (= (and b!1250425 ((_ is ValueCellFull!14984) mapDefault!49003)) b!1250422))

(assert (= start!105012 b!1250425))

(declare-fun m!1151715 () Bool)

(assert (=> b!1250424 m!1151715))

(declare-fun m!1151717 () Bool)

(assert (=> mapNonEmpty!49003 m!1151717))

(declare-fun m!1151719 () Bool)

(assert (=> b!1250423 m!1151719))

(declare-fun m!1151721 () Bool)

(assert (=> start!105012 m!1151721))

(declare-fun m!1151723 () Bool)

(assert (=> start!105012 m!1151723))

(declare-fun m!1151725 () Bool)

(assert (=> start!105012 m!1151725))

(declare-fun m!1151727 () Bool)

(assert (=> b!1250427 m!1151727))

(declare-fun m!1151729 () Bool)

(assert (=> b!1250427 m!1151729))

(check-sat (not mapNonEmpty!49003) (not b!1250427) (not b_next!26593) (not b!1250423) (not b!1250424) (not start!105012) b_and!44363 tp_is_empty!31495)
(check-sat b_and!44363 (not b_next!26593))
