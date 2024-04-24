; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104982 () Bool)

(assert start!104982)

(declare-fun b_free!26563 () Bool)

(declare-fun b_next!26563 () Bool)

(assert (=> start!104982 (= b_free!26563 (not b_next!26563))))

(declare-fun tp!93178 () Bool)

(declare-fun b_and!44333 () Bool)

(assert (=> start!104982 (= tp!93178 b_and!44333)))

(declare-fun b!1250106 () Bool)

(declare-fun res!833622 () Bool)

(declare-fun e!709528 () Bool)

(assert (=> b!1250106 (=> (not res!833622) (not e!709528))))

(declare-datatypes ((array!80651 0))(
  ( (array!80652 (arr!38888 (Array (_ BitVec 32) (_ BitVec 64))) (size!39425 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80651)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80651 (_ BitVec 32)) Bool)

(assert (=> b!1250106 (= res!833622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48958 () Bool)

(declare-fun mapRes!48958 () Bool)

(declare-fun tp!93179 () Bool)

(declare-fun e!709526 () Bool)

(assert (=> mapNonEmpty!48958 (= mapRes!48958 (and tp!93179 e!709526))))

(declare-datatypes ((V!47319 0))(
  ( (V!47320 (val!15795 Int)) )
))
(declare-datatypes ((ValueCell!14969 0))(
  ( (ValueCellFull!14969 (v!18487 V!47319)) (EmptyCell!14969) )
))
(declare-fun mapValue!48958 () ValueCell!14969)

(declare-fun mapRest!48958 () (Array (_ BitVec 32) ValueCell!14969))

(declare-datatypes ((array!80653 0))(
  ( (array!80654 (arr!38889 (Array (_ BitVec 32) ValueCell!14969)) (size!39426 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80653)

(declare-fun mapKey!48958 () (_ BitVec 32))

(assert (=> mapNonEmpty!48958 (= (arr!38889 _values!914) (store mapRest!48958 mapKey!48958 mapValue!48958))))

(declare-fun b!1250108 () Bool)

(declare-fun tp_is_empty!31465 () Bool)

(assert (=> b!1250108 (= e!709526 tp_is_empty!31465)))

(declare-fun b!1250109 () Bool)

(assert (=> b!1250109 (= e!709528 false)))

(declare-datatypes ((tuple2!20368 0))(
  ( (tuple2!20369 (_1!10195 (_ BitVec 64)) (_2!10195 V!47319)) )
))
(declare-datatypes ((List!27622 0))(
  ( (Nil!27619) (Cons!27618 (h!28836 tuple2!20368) (t!41085 List!27622)) )
))
(declare-datatypes ((ListLongMap!18249 0))(
  ( (ListLongMap!18250 (toList!9140 List!27622)) )
))
(declare-fun lt!564002 () ListLongMap!18249)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47319)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47319)

(declare-fun getCurrentListMapNoExtraKeys!5575 (array!80651 array!80653 (_ BitVec 32) (_ BitVec 32) V!47319 V!47319 (_ BitVec 32) Int) ListLongMap!18249)

(assert (=> b!1250109 (= lt!564002 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!564001 () ListLongMap!18249)

(declare-fun minValueBefore!43 () V!47319)

(assert (=> b!1250109 (= lt!564001 (getCurrentListMapNoExtraKeys!5575 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250110 () Bool)

(declare-fun res!833620 () Bool)

(assert (=> b!1250110 (=> (not res!833620) (not e!709528))))

(assert (=> b!1250110 (= res!833620 (and (= (size!39426 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39425 _keys!1118) (size!39426 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250111 () Bool)

(declare-fun res!833621 () Bool)

(assert (=> b!1250111 (=> (not res!833621) (not e!709528))))

(declare-datatypes ((List!27623 0))(
  ( (Nil!27620) (Cons!27619 (h!28837 (_ BitVec 64)) (t!41086 List!27623)) )
))
(declare-fun arrayNoDuplicates!0 (array!80651 (_ BitVec 32) List!27623) Bool)

(assert (=> b!1250111 (= res!833621 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27620))))

(declare-fun res!833623 () Bool)

(assert (=> start!104982 (=> (not res!833623) (not e!709528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104982 (= res!833623 (validMask!0 mask!1466))))

(assert (=> start!104982 e!709528))

(assert (=> start!104982 true))

(assert (=> start!104982 tp!93178))

(assert (=> start!104982 tp_is_empty!31465))

(declare-fun array_inv!29785 (array!80651) Bool)

(assert (=> start!104982 (array_inv!29785 _keys!1118)))

(declare-fun e!709529 () Bool)

(declare-fun array_inv!29786 (array!80653) Bool)

(assert (=> start!104982 (and (array_inv!29786 _values!914) e!709529)))

(declare-fun b!1250107 () Bool)

(declare-fun e!709527 () Bool)

(assert (=> b!1250107 (= e!709527 tp_is_empty!31465)))

(declare-fun b!1250112 () Bool)

(assert (=> b!1250112 (= e!709529 (and e!709527 mapRes!48958))))

(declare-fun condMapEmpty!48958 () Bool)

(declare-fun mapDefault!48958 () ValueCell!14969)

(assert (=> b!1250112 (= condMapEmpty!48958 (= (arr!38889 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14969)) mapDefault!48958)))))

(declare-fun mapIsEmpty!48958 () Bool)

(assert (=> mapIsEmpty!48958 mapRes!48958))

(assert (= (and start!104982 res!833623) b!1250110))

(assert (= (and b!1250110 res!833620) b!1250106))

(assert (= (and b!1250106 res!833622) b!1250111))

(assert (= (and b!1250111 res!833621) b!1250109))

(assert (= (and b!1250112 condMapEmpty!48958) mapIsEmpty!48958))

(assert (= (and b!1250112 (not condMapEmpty!48958)) mapNonEmpty!48958))

(get-info :version)

(assert (= (and mapNonEmpty!48958 ((_ is ValueCellFull!14969) mapValue!48958)) b!1250108))

(assert (= (and b!1250112 ((_ is ValueCellFull!14969) mapDefault!48958)) b!1250107))

(assert (= start!104982 b!1250112))

(declare-fun m!1151475 () Bool)

(assert (=> mapNonEmpty!48958 m!1151475))

(declare-fun m!1151477 () Bool)

(assert (=> b!1250109 m!1151477))

(declare-fun m!1151479 () Bool)

(assert (=> b!1250109 m!1151479))

(declare-fun m!1151481 () Bool)

(assert (=> start!104982 m!1151481))

(declare-fun m!1151483 () Bool)

(assert (=> start!104982 m!1151483))

(declare-fun m!1151485 () Bool)

(assert (=> start!104982 m!1151485))

(declare-fun m!1151487 () Bool)

(assert (=> b!1250111 m!1151487))

(declare-fun m!1151489 () Bool)

(assert (=> b!1250106 m!1151489))

(check-sat b_and!44333 (not b_next!26563) (not b!1250111) (not b!1250109) (not mapNonEmpty!48958) tp_is_empty!31465 (not start!104982) (not b!1250106))
(check-sat b_and!44333 (not b_next!26563))
