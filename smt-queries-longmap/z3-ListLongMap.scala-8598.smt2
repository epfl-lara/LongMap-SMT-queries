; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104820 () Bool)

(assert start!104820)

(declare-fun b_free!26625 () Bool)

(declare-fun b_next!26625 () Bool)

(assert (=> start!104820 (= b_free!26625 (not b_next!26625))))

(declare-fun tp!93365 () Bool)

(declare-fun b_and!44393 () Bool)

(assert (=> start!104820 (= tp!93365 b_and!44393)))

(declare-fun mapIsEmpty!49051 () Bool)

(declare-fun mapRes!49051 () Bool)

(assert (=> mapIsEmpty!49051 mapRes!49051))

(declare-fun res!833474 () Bool)

(declare-fun e!709146 () Bool)

(assert (=> start!104820 (=> (not res!833474) (not e!709146))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104820 (= res!833474 (validMask!0 mask!1466))))

(assert (=> start!104820 e!709146))

(assert (=> start!104820 true))

(assert (=> start!104820 tp!93365))

(declare-fun tp_is_empty!31527 () Bool)

(assert (=> start!104820 tp_is_empty!31527))

(declare-datatypes ((array!80736 0))(
  ( (array!80737 (arr!38935 (Array (_ BitVec 32) (_ BitVec 64))) (size!39471 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80736)

(declare-fun array_inv!29713 (array!80736) Bool)

(assert (=> start!104820 (array_inv!29713 _keys!1118)))

(declare-datatypes ((V!47401 0))(
  ( (V!47402 (val!15826 Int)) )
))
(declare-datatypes ((ValueCell!15000 0))(
  ( (ValueCellFull!15000 (v!18522 V!47401)) (EmptyCell!15000) )
))
(declare-datatypes ((array!80738 0))(
  ( (array!80739 (arr!38936 (Array (_ BitVec 32) ValueCell!15000)) (size!39472 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80738)

(declare-fun e!709145 () Bool)

(declare-fun array_inv!29714 (array!80738) Bool)

(assert (=> start!104820 (and (array_inv!29714 _values!914) e!709145)))

(declare-fun b!1249452 () Bool)

(declare-fun e!709143 () Bool)

(assert (=> b!1249452 (= e!709143 tp_is_empty!31527)))

(declare-fun b!1249453 () Bool)

(declare-fun res!833472 () Bool)

(assert (=> b!1249453 (=> (not res!833472) (not e!709146))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249453 (= res!833472 (and (= (size!39472 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39471 _keys!1118) (size!39472 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249454 () Bool)

(declare-fun res!833473 () Bool)

(assert (=> b!1249454 (=> (not res!833473) (not e!709146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80736 (_ BitVec 32)) Bool)

(assert (=> b!1249454 (= res!833473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249455 () Bool)

(declare-fun e!709144 () Bool)

(assert (=> b!1249455 (= e!709144 tp_is_empty!31527)))

(declare-fun b!1249456 () Bool)

(declare-fun res!833475 () Bool)

(assert (=> b!1249456 (=> (not res!833475) (not e!709146))))

(declare-datatypes ((List!27633 0))(
  ( (Nil!27630) (Cons!27629 (h!28838 (_ BitVec 64)) (t!41104 List!27633)) )
))
(declare-fun arrayNoDuplicates!0 (array!80736 (_ BitVec 32) List!27633) Bool)

(assert (=> b!1249456 (= res!833475 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27630))))

(declare-fun b!1249457 () Bool)

(assert (=> b!1249457 (= e!709145 (and e!709143 mapRes!49051))))

(declare-fun condMapEmpty!49051 () Bool)

(declare-fun mapDefault!49051 () ValueCell!15000)

(assert (=> b!1249457 (= condMapEmpty!49051 (= (arr!38936 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15000)) mapDefault!49051)))))

(declare-fun mapNonEmpty!49051 () Bool)

(declare-fun tp!93364 () Bool)

(assert (=> mapNonEmpty!49051 (= mapRes!49051 (and tp!93364 e!709144))))

(declare-fun mapRest!49051 () (Array (_ BitVec 32) ValueCell!15000))

(declare-fun mapValue!49051 () ValueCell!15000)

(declare-fun mapKey!49051 () (_ BitVec 32))

(assert (=> mapNonEmpty!49051 (= (arr!38936 _values!914) (store mapRest!49051 mapKey!49051 mapValue!49051))))

(declare-fun b!1249458 () Bool)

(assert (=> b!1249458 (= e!709146 (not true))))

(declare-datatypes ((tuple2!20390 0))(
  ( (tuple2!20391 (_1!10206 (_ BitVec 64)) (_2!10206 V!47401)) )
))
(declare-datatypes ((List!27634 0))(
  ( (Nil!27631) (Cons!27630 (h!28839 tuple2!20390) (t!41105 List!27634)) )
))
(declare-datatypes ((ListLongMap!18263 0))(
  ( (ListLongMap!18264 (toList!9147 List!27634)) )
))
(declare-fun lt!563736 () ListLongMap!18263)

(declare-fun lt!563735 () ListLongMap!18263)

(assert (=> b!1249458 (= lt!563736 lt!563735)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41491 0))(
  ( (Unit!41492) )
))
(declare-fun lt!563737 () Unit!41491)

(declare-fun minValueAfter!43 () V!47401)

(declare-fun zeroValue!871 () V!47401)

(declare-fun minValueBefore!43 () V!47401)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!918 (array!80736 array!80738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47401 V!47401 V!47401 V!47401 (_ BitVec 32) Int) Unit!41491)

(assert (=> b!1249458 (= lt!563737 (lemmaNoChangeToArrayThenSameMapNoExtras!918 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5554 (array!80736 array!80738 (_ BitVec 32) (_ BitVec 32) V!47401 V!47401 (_ BitVec 32) Int) ListLongMap!18263)

(assert (=> b!1249458 (= lt!563735 (getCurrentListMapNoExtraKeys!5554 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249458 (= lt!563736 (getCurrentListMapNoExtraKeys!5554 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104820 res!833474) b!1249453))

(assert (= (and b!1249453 res!833472) b!1249454))

(assert (= (and b!1249454 res!833473) b!1249456))

(assert (= (and b!1249456 res!833475) b!1249458))

(assert (= (and b!1249457 condMapEmpty!49051) mapIsEmpty!49051))

(assert (= (and b!1249457 (not condMapEmpty!49051)) mapNonEmpty!49051))

(get-info :version)

(assert (= (and mapNonEmpty!49051 ((_ is ValueCellFull!15000) mapValue!49051)) b!1249455))

(assert (= (and b!1249457 ((_ is ValueCellFull!15000) mapDefault!49051)) b!1249452))

(assert (= start!104820 b!1249457))

(declare-fun m!1150379 () Bool)

(assert (=> b!1249456 m!1150379))

(declare-fun m!1150381 () Bool)

(assert (=> b!1249454 m!1150381))

(declare-fun m!1150383 () Bool)

(assert (=> start!104820 m!1150383))

(declare-fun m!1150385 () Bool)

(assert (=> start!104820 m!1150385))

(declare-fun m!1150387 () Bool)

(assert (=> start!104820 m!1150387))

(declare-fun m!1150389 () Bool)

(assert (=> b!1249458 m!1150389))

(declare-fun m!1150391 () Bool)

(assert (=> b!1249458 m!1150391))

(declare-fun m!1150393 () Bool)

(assert (=> b!1249458 m!1150393))

(declare-fun m!1150395 () Bool)

(assert (=> mapNonEmpty!49051 m!1150395))

(check-sat tp_is_empty!31527 b_and!44393 (not b!1249456) (not b_next!26625) (not b!1249458) (not start!104820) (not mapNonEmpty!49051) (not b!1249454))
(check-sat b_and!44393 (not b_next!26625))
