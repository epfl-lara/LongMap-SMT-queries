; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41504 () Bool)

(assert start!41504)

(declare-fun b_free!11185 () Bool)

(declare-fun b_next!11185 () Bool)

(assert (=> start!41504 (= b_free!11185 (not b_next!11185))))

(declare-fun tp!39552 () Bool)

(declare-fun b_and!19499 () Bool)

(assert (=> start!41504 (= tp!39552 b_and!19499)))

(declare-fun b!463518 () Bool)

(declare-fun e!270659 () Bool)

(declare-fun tp_is_empty!12613 () Bool)

(assert (=> b!463518 (= e!270659 tp_is_empty!12613)))

(declare-fun b!463519 () Bool)

(declare-fun e!270662 () Bool)

(assert (=> b!463519 (= e!270662 tp_is_empty!12613)))

(declare-fun mapNonEmpty!20596 () Bool)

(declare-fun mapRes!20596 () Bool)

(declare-fun tp!39553 () Bool)

(assert (=> mapNonEmpty!20596 (= mapRes!20596 (and tp!39553 e!270659))))

(declare-fun mapKey!20596 () (_ BitVec 32))

(declare-datatypes ((V!17923 0))(
  ( (V!17924 (val!6351 Int)) )
))
(declare-datatypes ((ValueCell!5963 0))(
  ( (ValueCellFull!5963 (v!8632 V!17923)) (EmptyCell!5963) )
))
(declare-fun mapValue!20596 () ValueCell!5963)

(declare-fun mapRest!20596 () (Array (_ BitVec 32) ValueCell!5963))

(declare-datatypes ((array!29017 0))(
  ( (array!29018 (arr!13940 (Array (_ BitVec 32) ValueCell!5963)) (size!14293 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29017)

(assert (=> mapNonEmpty!20596 (= (arr!13940 _values!833) (store mapRest!20596 mapKey!20596 mapValue!20596))))

(declare-fun mapIsEmpty!20596 () Bool)

(assert (=> mapIsEmpty!20596 mapRes!20596))

(declare-fun res!277172 () Bool)

(declare-fun e!270661 () Bool)

(assert (=> start!41504 (=> (not res!277172) (not e!270661))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41504 (= res!277172 (validMask!0 mask!1365))))

(assert (=> start!41504 e!270661))

(assert (=> start!41504 tp_is_empty!12613))

(assert (=> start!41504 tp!39552))

(assert (=> start!41504 true))

(declare-datatypes ((array!29019 0))(
  ( (array!29020 (arr!13941 (Array (_ BitVec 32) (_ BitVec 64))) (size!14294 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29019)

(declare-fun array_inv!10146 (array!29019) Bool)

(assert (=> start!41504 (array_inv!10146 _keys!1025)))

(declare-fun e!270663 () Bool)

(declare-fun array_inv!10147 (array!29017) Bool)

(assert (=> start!41504 (and (array_inv!10147 _values!833) e!270663)))

(declare-fun b!463520 () Bool)

(declare-fun res!277173 () Bool)

(assert (=> b!463520 (=> (not res!277173) (not e!270661))))

(declare-datatypes ((List!8436 0))(
  ( (Nil!8433) (Cons!8432 (h!9288 (_ BitVec 64)) (t!14373 List!8436)) )
))
(declare-fun arrayNoDuplicates!0 (array!29019 (_ BitVec 32) List!8436) Bool)

(assert (=> b!463520 (= res!277173 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8433))))

(declare-fun b!463521 () Bool)

(assert (=> b!463521 (= e!270663 (and e!270662 mapRes!20596))))

(declare-fun condMapEmpty!20596 () Bool)

(declare-fun mapDefault!20596 () ValueCell!5963)

(assert (=> b!463521 (= condMapEmpty!20596 (= (arr!13940 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5963)) mapDefault!20596)))))

(declare-fun b!463522 () Bool)

(declare-fun res!277175 () Bool)

(assert (=> b!463522 (=> (not res!277175) (not e!270661))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463522 (= res!277175 (and (= (size!14293 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14294 _keys!1025) (size!14293 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463523 () Bool)

(declare-fun res!277174 () Bool)

(assert (=> b!463523 (=> (not res!277174) (not e!270661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29019 (_ BitVec 32)) Bool)

(assert (=> b!463523 (= res!277174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463524 () Bool)

(assert (=> b!463524 (= e!270661 false)))

(declare-fun zeroValue!794 () V!17923)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8350 0))(
  ( (tuple2!8351 (_1!4186 (_ BitVec 64)) (_2!4186 V!17923)) )
))
(declare-datatypes ((List!8437 0))(
  ( (Nil!8434) (Cons!8433 (h!9289 tuple2!8350) (t!14374 List!8437)) )
))
(declare-datatypes ((ListLongMap!7253 0))(
  ( (ListLongMap!7254 (toList!3642 List!8437)) )
))
(declare-fun lt!209246 () ListLongMap!7253)

(declare-fun minValueAfter!38 () V!17923)

(declare-fun getCurrentListMapNoExtraKeys!1834 (array!29019 array!29017 (_ BitVec 32) (_ BitVec 32) V!17923 V!17923 (_ BitVec 32) Int) ListLongMap!7253)

(assert (=> b!463524 (= lt!209246 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17923)

(declare-fun lt!209245 () ListLongMap!7253)

(assert (=> b!463524 (= lt!209245 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41504 res!277172) b!463522))

(assert (= (and b!463522 res!277175) b!463523))

(assert (= (and b!463523 res!277174) b!463520))

(assert (= (and b!463520 res!277173) b!463524))

(assert (= (and b!463521 condMapEmpty!20596) mapIsEmpty!20596))

(assert (= (and b!463521 (not condMapEmpty!20596)) mapNonEmpty!20596))

(get-info :version)

(assert (= (and mapNonEmpty!20596 ((_ is ValueCellFull!5963) mapValue!20596)) b!463518))

(assert (= (and b!463521 ((_ is ValueCellFull!5963) mapDefault!20596)) b!463519))

(assert (= start!41504 b!463521))

(declare-fun m!445563 () Bool)

(assert (=> b!463524 m!445563))

(declare-fun m!445565 () Bool)

(assert (=> b!463524 m!445565))

(declare-fun m!445567 () Bool)

(assert (=> start!41504 m!445567))

(declare-fun m!445569 () Bool)

(assert (=> start!41504 m!445569))

(declare-fun m!445571 () Bool)

(assert (=> start!41504 m!445571))

(declare-fun m!445573 () Bool)

(assert (=> b!463523 m!445573))

(declare-fun m!445575 () Bool)

(assert (=> mapNonEmpty!20596 m!445575))

(declare-fun m!445577 () Bool)

(assert (=> b!463520 m!445577))

(check-sat (not b!463524) (not b_next!11185) (not start!41504) (not b!463520) (not b!463523) tp_is_empty!12613 (not mapNonEmpty!20596) b_and!19499)
(check-sat b_and!19499 (not b_next!11185))
