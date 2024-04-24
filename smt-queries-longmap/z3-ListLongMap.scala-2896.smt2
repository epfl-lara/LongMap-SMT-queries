; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41504 () Bool)

(assert start!41504)

(declare-fun b_free!11185 () Bool)

(declare-fun b_next!11185 () Bool)

(assert (=> start!41504 (= b_free!11185 (not b_next!11185))))

(declare-fun tp!39553 () Bool)

(declare-fun b_and!19535 () Bool)

(assert (=> start!41504 (= tp!39553 b_and!19535)))

(declare-fun b!463728 () Bool)

(declare-fun res!277295 () Bool)

(declare-fun e!270794 () Bool)

(assert (=> b!463728 (=> (not res!277295) (not e!270794))))

(declare-datatypes ((array!29020 0))(
  ( (array!29021 (arr!13941 (Array (_ BitVec 32) (_ BitVec 64))) (size!14293 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29020)

(declare-datatypes ((List!8344 0))(
  ( (Nil!8341) (Cons!8340 (h!9196 (_ BitVec 64)) (t!14282 List!8344)) )
))
(declare-fun arrayNoDuplicates!0 (array!29020 (_ BitVec 32) List!8344) Bool)

(assert (=> b!463728 (= res!277295 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8341))))

(declare-fun b!463729 () Bool)

(declare-fun res!277297 () Bool)

(assert (=> b!463729 (=> (not res!277297) (not e!270794))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!17923 0))(
  ( (V!17924 (val!6351 Int)) )
))
(declare-datatypes ((ValueCell!5963 0))(
  ( (ValueCellFull!5963 (v!8639 V!17923)) (EmptyCell!5963) )
))
(declare-datatypes ((array!29022 0))(
  ( (array!29023 (arr!13942 (Array (_ BitVec 32) ValueCell!5963)) (size!14294 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29022)

(assert (=> b!463729 (= res!277297 (and (= (size!14294 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14293 _keys!1025) (size!14294 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463730 () Bool)

(declare-fun e!270795 () Bool)

(declare-fun e!270796 () Bool)

(declare-fun mapRes!20596 () Bool)

(assert (=> b!463730 (= e!270795 (and e!270796 mapRes!20596))))

(declare-fun condMapEmpty!20596 () Bool)

(declare-fun mapDefault!20596 () ValueCell!5963)

(assert (=> b!463730 (= condMapEmpty!20596 (= (arr!13942 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5963)) mapDefault!20596)))))

(declare-fun mapNonEmpty!20596 () Bool)

(declare-fun tp!39552 () Bool)

(declare-fun e!270798 () Bool)

(assert (=> mapNonEmpty!20596 (= mapRes!20596 (and tp!39552 e!270798))))

(declare-fun mapRest!20596 () (Array (_ BitVec 32) ValueCell!5963))

(declare-fun mapKey!20596 () (_ BitVec 32))

(declare-fun mapValue!20596 () ValueCell!5963)

(assert (=> mapNonEmpty!20596 (= (arr!13942 _values!833) (store mapRest!20596 mapKey!20596 mapValue!20596))))

(declare-fun b!463731 () Bool)

(declare-fun tp_is_empty!12613 () Bool)

(assert (=> b!463731 (= e!270798 tp_is_empty!12613)))

(declare-fun b!463732 () Bool)

(assert (=> b!463732 (= e!270794 false)))

(declare-fun zeroValue!794 () V!17923)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8264 0))(
  ( (tuple2!8265 (_1!4143 (_ BitVec 64)) (_2!4143 V!17923)) )
))
(declare-datatypes ((List!8345 0))(
  ( (Nil!8342) (Cons!8341 (h!9197 tuple2!8264) (t!14283 List!8345)) )
))
(declare-datatypes ((ListLongMap!7179 0))(
  ( (ListLongMap!7180 (toList!3605 List!8345)) )
))
(declare-fun lt!209491 () ListLongMap!7179)

(declare-fun minValueAfter!38 () V!17923)

(declare-fun getCurrentListMapNoExtraKeys!1832 (array!29020 array!29022 (_ BitVec 32) (_ BitVec 32) V!17923 V!17923 (_ BitVec 32) Int) ListLongMap!7179)

(assert (=> b!463732 (= lt!209491 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17923)

(declare-fun lt!209492 () ListLongMap!7179)

(assert (=> b!463732 (= lt!209492 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463733 () Bool)

(declare-fun res!277296 () Bool)

(assert (=> b!463733 (=> (not res!277296) (not e!270794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29020 (_ BitVec 32)) Bool)

(assert (=> b!463733 (= res!277296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463734 () Bool)

(assert (=> b!463734 (= e!270796 tp_is_empty!12613)))

(declare-fun res!277294 () Bool)

(assert (=> start!41504 (=> (not res!277294) (not e!270794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41504 (= res!277294 (validMask!0 mask!1365))))

(assert (=> start!41504 e!270794))

(assert (=> start!41504 tp_is_empty!12613))

(assert (=> start!41504 tp!39553))

(assert (=> start!41504 true))

(declare-fun array_inv!10156 (array!29020) Bool)

(assert (=> start!41504 (array_inv!10156 _keys!1025)))

(declare-fun array_inv!10157 (array!29022) Bool)

(assert (=> start!41504 (and (array_inv!10157 _values!833) e!270795)))

(declare-fun mapIsEmpty!20596 () Bool)

(assert (=> mapIsEmpty!20596 mapRes!20596))

(assert (= (and start!41504 res!277294) b!463729))

(assert (= (and b!463729 res!277297) b!463733))

(assert (= (and b!463733 res!277296) b!463728))

(assert (= (and b!463728 res!277295) b!463732))

(assert (= (and b!463730 condMapEmpty!20596) mapIsEmpty!20596))

(assert (= (and b!463730 (not condMapEmpty!20596)) mapNonEmpty!20596))

(get-info :version)

(assert (= (and mapNonEmpty!20596 ((_ is ValueCellFull!5963) mapValue!20596)) b!463731))

(assert (= (and b!463730 ((_ is ValueCellFull!5963) mapDefault!20596)) b!463734))

(assert (= start!41504 b!463730))

(declare-fun m!446479 () Bool)

(assert (=> mapNonEmpty!20596 m!446479))

(declare-fun m!446481 () Bool)

(assert (=> b!463733 m!446481))

(declare-fun m!446483 () Bool)

(assert (=> b!463728 m!446483))

(declare-fun m!446485 () Bool)

(assert (=> b!463732 m!446485))

(declare-fun m!446487 () Bool)

(assert (=> b!463732 m!446487))

(declare-fun m!446489 () Bool)

(assert (=> start!41504 m!446489))

(declare-fun m!446491 () Bool)

(assert (=> start!41504 m!446491))

(declare-fun m!446493 () Bool)

(assert (=> start!41504 m!446493))

(check-sat (not b!463732) b_and!19535 (not b_next!11185) (not b!463733) (not mapNonEmpty!20596) (not b!463728) (not start!41504) tp_is_empty!12613)
(check-sat b_and!19535 (not b_next!11185))
