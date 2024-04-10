; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104790 () Bool)

(assert start!104790)

(declare-fun b_free!26595 () Bool)

(declare-fun b_next!26595 () Bool)

(assert (=> start!104790 (= b_free!26595 (not b_next!26595))))

(declare-fun tp!93274 () Bool)

(declare-fun b_and!44363 () Bool)

(assert (=> start!104790 (= tp!93274 b_and!44363)))

(declare-fun b!1249137 () Bool)

(declare-fun res!833295 () Bool)

(declare-fun e!708920 () Bool)

(assert (=> b!1249137 (=> (not res!833295) (not e!708920))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80678 0))(
  ( (array!80679 (arr!38906 (Array (_ BitVec 32) (_ BitVec 64))) (size!39442 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80678)

(declare-datatypes ((V!47361 0))(
  ( (V!47362 (val!15811 Int)) )
))
(declare-datatypes ((ValueCell!14985 0))(
  ( (ValueCellFull!14985 (v!18507 V!47361)) (EmptyCell!14985) )
))
(declare-datatypes ((array!80680 0))(
  ( (array!80681 (arr!38907 (Array (_ BitVec 32) ValueCell!14985)) (size!39443 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80680)

(assert (=> b!1249137 (= res!833295 (and (= (size!39443 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39442 _keys!1118) (size!39443 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249138 () Bool)

(declare-fun e!708921 () Bool)

(declare-fun tp_is_empty!31497 () Bool)

(assert (=> b!1249138 (= e!708921 tp_is_empty!31497)))

(declare-fun mapNonEmpty!49006 () Bool)

(declare-fun mapRes!49006 () Bool)

(declare-fun tp!93275 () Bool)

(assert (=> mapNonEmpty!49006 (= mapRes!49006 (and tp!93275 e!708921))))

(declare-fun mapKey!49006 () (_ BitVec 32))

(declare-fun mapRest!49006 () (Array (_ BitVec 32) ValueCell!14985))

(declare-fun mapValue!49006 () ValueCell!14985)

(assert (=> mapNonEmpty!49006 (= (arr!38907 _values!914) (store mapRest!49006 mapKey!49006 mapValue!49006))))

(declare-fun b!1249139 () Bool)

(declare-fun res!833293 () Bool)

(assert (=> b!1249139 (=> (not res!833293) (not e!708920))))

(declare-datatypes ((List!27614 0))(
  ( (Nil!27611) (Cons!27610 (h!28819 (_ BitVec 64)) (t!41085 List!27614)) )
))
(declare-fun arrayNoDuplicates!0 (array!80678 (_ BitVec 32) List!27614) Bool)

(assert (=> b!1249139 (= res!833293 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27611))))

(declare-fun b!1249140 () Bool)

(assert (=> b!1249140 (= e!708920 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47361)

(declare-fun zeroValue!871 () V!47361)

(declare-datatypes ((tuple2!20368 0))(
  ( (tuple2!20369 (_1!10195 (_ BitVec 64)) (_2!10195 V!47361)) )
))
(declare-datatypes ((List!27615 0))(
  ( (Nil!27612) (Cons!27611 (h!28820 tuple2!20368) (t!41086 List!27615)) )
))
(declare-datatypes ((ListLongMap!18241 0))(
  ( (ListLongMap!18242 (toList!9136 List!27615)) )
))
(declare-fun lt!563613 () ListLongMap!18241)

(declare-fun getCurrentListMapNoExtraKeys!5543 (array!80678 array!80680 (_ BitVec 32) (_ BitVec 32) V!47361 V!47361 (_ BitVec 32) Int) ListLongMap!18241)

(assert (=> b!1249140 (= lt!563613 (getCurrentListMapNoExtraKeys!5543 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563614 () ListLongMap!18241)

(declare-fun minValueBefore!43 () V!47361)

(assert (=> b!1249140 (= lt!563614 (getCurrentListMapNoExtraKeys!5543 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249141 () Bool)

(declare-fun res!833292 () Bool)

(assert (=> b!1249141 (=> (not res!833292) (not e!708920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80678 (_ BitVec 32)) Bool)

(assert (=> b!1249141 (= res!833292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49006 () Bool)

(assert (=> mapIsEmpty!49006 mapRes!49006))

(declare-fun b!1249142 () Bool)

(declare-fun e!708922 () Bool)

(declare-fun e!708918 () Bool)

(assert (=> b!1249142 (= e!708922 (and e!708918 mapRes!49006))))

(declare-fun condMapEmpty!49006 () Bool)

(declare-fun mapDefault!49006 () ValueCell!14985)

(assert (=> b!1249142 (= condMapEmpty!49006 (= (arr!38907 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14985)) mapDefault!49006)))))

(declare-fun b!1249143 () Bool)

(assert (=> b!1249143 (= e!708918 tp_is_empty!31497)))

(declare-fun res!833294 () Bool)

(assert (=> start!104790 (=> (not res!833294) (not e!708920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104790 (= res!833294 (validMask!0 mask!1466))))

(assert (=> start!104790 e!708920))

(assert (=> start!104790 true))

(assert (=> start!104790 tp!93274))

(assert (=> start!104790 tp_is_empty!31497))

(declare-fun array_inv!29693 (array!80678) Bool)

(assert (=> start!104790 (array_inv!29693 _keys!1118)))

(declare-fun array_inv!29694 (array!80680) Bool)

(assert (=> start!104790 (and (array_inv!29694 _values!914) e!708922)))

(assert (= (and start!104790 res!833294) b!1249137))

(assert (= (and b!1249137 res!833295) b!1249141))

(assert (= (and b!1249141 res!833292) b!1249139))

(assert (= (and b!1249139 res!833293) b!1249140))

(assert (= (and b!1249142 condMapEmpty!49006) mapIsEmpty!49006))

(assert (= (and b!1249142 (not condMapEmpty!49006)) mapNonEmpty!49006))

(get-info :version)

(assert (= (and mapNonEmpty!49006 ((_ is ValueCellFull!14985) mapValue!49006)) b!1249138))

(assert (= (and b!1249142 ((_ is ValueCellFull!14985) mapDefault!49006)) b!1249143))

(assert (= start!104790 b!1249142))

(declare-fun m!1150119 () Bool)

(assert (=> b!1249141 m!1150119))

(declare-fun m!1150121 () Bool)

(assert (=> b!1249140 m!1150121))

(declare-fun m!1150123 () Bool)

(assert (=> b!1249140 m!1150123))

(declare-fun m!1150125 () Bool)

(assert (=> start!104790 m!1150125))

(declare-fun m!1150127 () Bool)

(assert (=> start!104790 m!1150127))

(declare-fun m!1150129 () Bool)

(assert (=> start!104790 m!1150129))

(declare-fun m!1150131 () Bool)

(assert (=> b!1249139 m!1150131))

(declare-fun m!1150133 () Bool)

(assert (=> mapNonEmpty!49006 m!1150133))

(check-sat (not b_next!26595) b_and!44363 (not mapNonEmpty!49006) (not start!104790) (not b!1249139) (not b!1249141) (not b!1249140) tp_is_empty!31497)
(check-sat b_and!44363 (not b_next!26595))
