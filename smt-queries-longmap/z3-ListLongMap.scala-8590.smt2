; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104994 () Bool)

(assert start!104994)

(declare-fun b_free!26575 () Bool)

(declare-fun b_next!26575 () Bool)

(assert (=> start!104994 (= b_free!26575 (not b_next!26575))))

(declare-fun tp!93215 () Bool)

(declare-fun b_and!44345 () Bool)

(assert (=> start!104994 (= tp!93215 b_and!44345)))

(declare-fun res!833695 () Bool)

(declare-fun e!709615 () Bool)

(assert (=> start!104994 (=> (not res!833695) (not e!709615))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104994 (= res!833695 (validMask!0 mask!1466))))

(assert (=> start!104994 e!709615))

(assert (=> start!104994 true))

(assert (=> start!104994 tp!93215))

(declare-fun tp_is_empty!31477 () Bool)

(assert (=> start!104994 tp_is_empty!31477))

(declare-datatypes ((array!80675 0))(
  ( (array!80676 (arr!38900 (Array (_ BitVec 32) (_ BitVec 64))) (size!39437 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80675)

(declare-fun array_inv!29791 (array!80675) Bool)

(assert (=> start!104994 (array_inv!29791 _keys!1118)))

(declare-datatypes ((V!47335 0))(
  ( (V!47336 (val!15801 Int)) )
))
(declare-datatypes ((ValueCell!14975 0))(
  ( (ValueCellFull!14975 (v!18493 V!47335)) (EmptyCell!14975) )
))
(declare-datatypes ((array!80677 0))(
  ( (array!80678 (arr!38901 (Array (_ BitVec 32) ValueCell!14975)) (size!39438 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80677)

(declare-fun e!709619 () Bool)

(declare-fun array_inv!29792 (array!80677) Bool)

(assert (=> start!104994 (and (array_inv!29792 _values!914) e!709619)))

(declare-fun mapNonEmpty!48976 () Bool)

(declare-fun mapRes!48976 () Bool)

(declare-fun tp!93214 () Bool)

(declare-fun e!709617 () Bool)

(assert (=> mapNonEmpty!48976 (= mapRes!48976 (and tp!93214 e!709617))))

(declare-fun mapKey!48976 () (_ BitVec 32))

(declare-fun mapValue!48976 () ValueCell!14975)

(declare-fun mapRest!48976 () (Array (_ BitVec 32) ValueCell!14975))

(assert (=> mapNonEmpty!48976 (= (arr!38901 _values!914) (store mapRest!48976 mapKey!48976 mapValue!48976))))

(declare-fun b!1250232 () Bool)

(declare-fun res!833692 () Bool)

(assert (=> b!1250232 (=> (not res!833692) (not e!709615))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250232 (= res!833692 (and (= (size!39438 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39437 _keys!1118) (size!39438 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250233 () Bool)

(declare-fun res!833694 () Bool)

(assert (=> b!1250233 (=> (not res!833694) (not e!709615))))

(declare-datatypes ((List!27631 0))(
  ( (Nil!27628) (Cons!27627 (h!28845 (_ BitVec 64)) (t!41094 List!27631)) )
))
(declare-fun arrayNoDuplicates!0 (array!80675 (_ BitVec 32) List!27631) Bool)

(assert (=> b!1250233 (= res!833694 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27628))))

(declare-fun b!1250234 () Bool)

(declare-fun res!833693 () Bool)

(assert (=> b!1250234 (=> (not res!833693) (not e!709615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80675 (_ BitVec 32)) Bool)

(assert (=> b!1250234 (= res!833693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250235 () Bool)

(assert (=> b!1250235 (= e!709615 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47335)

(declare-fun zeroValue!871 () V!47335)

(declare-datatypes ((tuple2!20378 0))(
  ( (tuple2!20379 (_1!10200 (_ BitVec 64)) (_2!10200 V!47335)) )
))
(declare-datatypes ((List!27632 0))(
  ( (Nil!27629) (Cons!27628 (h!28846 tuple2!20378) (t!41095 List!27632)) )
))
(declare-datatypes ((ListLongMap!18259 0))(
  ( (ListLongMap!18260 (toList!9145 List!27632)) )
))
(declare-fun lt!564037 () ListLongMap!18259)

(declare-fun getCurrentListMapNoExtraKeys!5580 (array!80675 array!80677 (_ BitVec 32) (_ BitVec 32) V!47335 V!47335 (_ BitVec 32) Int) ListLongMap!18259)

(assert (=> b!1250235 (= lt!564037 (getCurrentListMapNoExtraKeys!5580 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564038 () ListLongMap!18259)

(declare-fun minValueBefore!43 () V!47335)

(assert (=> b!1250235 (= lt!564038 (getCurrentListMapNoExtraKeys!5580 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250236 () Bool)

(assert (=> b!1250236 (= e!709617 tp_is_empty!31477)))

(declare-fun b!1250237 () Bool)

(declare-fun e!709618 () Bool)

(assert (=> b!1250237 (= e!709619 (and e!709618 mapRes!48976))))

(declare-fun condMapEmpty!48976 () Bool)

(declare-fun mapDefault!48976 () ValueCell!14975)

(assert (=> b!1250237 (= condMapEmpty!48976 (= (arr!38901 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14975)) mapDefault!48976)))))

(declare-fun mapIsEmpty!48976 () Bool)

(assert (=> mapIsEmpty!48976 mapRes!48976))

(declare-fun b!1250238 () Bool)

(assert (=> b!1250238 (= e!709618 tp_is_empty!31477)))

(assert (= (and start!104994 res!833695) b!1250232))

(assert (= (and b!1250232 res!833692) b!1250234))

(assert (= (and b!1250234 res!833693) b!1250233))

(assert (= (and b!1250233 res!833694) b!1250235))

(assert (= (and b!1250237 condMapEmpty!48976) mapIsEmpty!48976))

(assert (= (and b!1250237 (not condMapEmpty!48976)) mapNonEmpty!48976))

(get-info :version)

(assert (= (and mapNonEmpty!48976 ((_ is ValueCellFull!14975) mapValue!48976)) b!1250236))

(assert (= (and b!1250237 ((_ is ValueCellFull!14975) mapDefault!48976)) b!1250238))

(assert (= start!104994 b!1250237))

(declare-fun m!1151571 () Bool)

(assert (=> start!104994 m!1151571))

(declare-fun m!1151573 () Bool)

(assert (=> start!104994 m!1151573))

(declare-fun m!1151575 () Bool)

(assert (=> start!104994 m!1151575))

(declare-fun m!1151577 () Bool)

(assert (=> mapNonEmpty!48976 m!1151577))

(declare-fun m!1151579 () Bool)

(assert (=> b!1250233 m!1151579))

(declare-fun m!1151581 () Bool)

(assert (=> b!1250234 m!1151581))

(declare-fun m!1151583 () Bool)

(assert (=> b!1250235 m!1151583))

(declare-fun m!1151585 () Bool)

(assert (=> b!1250235 m!1151585))

(check-sat (not b!1250233) (not mapNonEmpty!48976) (not b!1250234) (not start!104994) b_and!44345 tp_is_empty!31477 (not b!1250235) (not b_next!26575))
(check-sat b_and!44345 (not b_next!26575))
