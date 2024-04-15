; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104790 () Bool)

(assert start!104790)

(declare-fun b_free!26599 () Bool)

(declare-fun b_next!26599 () Bool)

(assert (=> start!104790 (= b_free!26599 (not b_next!26599))))

(declare-fun tp!93287 () Bool)

(declare-fun b_and!44349 () Bool)

(assert (=> start!104790 (= tp!93287 b_and!44349)))

(declare-fun b!1249097 () Bool)

(declare-fun e!708904 () Bool)

(declare-fun tp_is_empty!31501 () Bool)

(assert (=> b!1249097 (= e!708904 tp_is_empty!31501)))

(declare-fun mapNonEmpty!49012 () Bool)

(declare-fun mapRes!49012 () Bool)

(declare-fun tp!93286 () Bool)

(declare-fun e!708905 () Bool)

(assert (=> mapNonEmpty!49012 (= mapRes!49012 (and tp!93286 e!708905))))

(declare-fun mapKey!49012 () (_ BitVec 32))

(declare-datatypes ((V!47367 0))(
  ( (V!47368 (val!15813 Int)) )
))
(declare-datatypes ((ValueCell!14987 0))(
  ( (ValueCellFull!14987 (v!18508 V!47367)) (EmptyCell!14987) )
))
(declare-datatypes ((array!80601 0))(
  ( (array!80602 (arr!38868 (Array (_ BitVec 32) ValueCell!14987)) (size!39406 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80601)

(declare-fun mapValue!49012 () ValueCell!14987)

(declare-fun mapRest!49012 () (Array (_ BitVec 32) ValueCell!14987))

(assert (=> mapNonEmpty!49012 (= (arr!38868 _values!914) (store mapRest!49012 mapKey!49012 mapValue!49012))))

(declare-fun b!1249098 () Bool)

(declare-fun e!708903 () Bool)

(assert (=> b!1249098 (= e!708903 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47367)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47367)

(declare-datatypes ((array!80603 0))(
  ( (array!80604 (arr!38869 (Array (_ BitVec 32) (_ BitVec 64))) (size!39407 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80603)

(declare-datatypes ((tuple2!20448 0))(
  ( (tuple2!20449 (_1!10235 (_ BitVec 64)) (_2!10235 V!47367)) )
))
(declare-datatypes ((List!27676 0))(
  ( (Nil!27673) (Cons!27672 (h!28881 tuple2!20448) (t!41138 List!27676)) )
))
(declare-datatypes ((ListLongMap!18321 0))(
  ( (ListLongMap!18322 (toList!9176 List!27676)) )
))
(declare-fun lt!563446 () ListLongMap!18321)

(declare-fun getCurrentListMapNoExtraKeys!5593 (array!80603 array!80601 (_ BitVec 32) (_ BitVec 32) V!47367 V!47367 (_ BitVec 32) Int) ListLongMap!18321)

(assert (=> b!1249098 (= lt!563446 (getCurrentListMapNoExtraKeys!5593 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563447 () ListLongMap!18321)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47367)

(assert (=> b!1249098 (= lt!563447 (getCurrentListMapNoExtraKeys!5593 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249099 () Bool)

(declare-fun res!833276 () Bool)

(assert (=> b!1249099 (=> (not res!833276) (not e!708903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80603 (_ BitVec 32)) Bool)

(assert (=> b!1249099 (= res!833276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249100 () Bool)

(assert (=> b!1249100 (= e!708905 tp_is_empty!31501)))

(declare-fun mapIsEmpty!49012 () Bool)

(assert (=> mapIsEmpty!49012 mapRes!49012))

(declare-fun res!833278 () Bool)

(assert (=> start!104790 (=> (not res!833278) (not e!708903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104790 (= res!833278 (validMask!0 mask!1466))))

(assert (=> start!104790 e!708903))

(assert (=> start!104790 true))

(assert (=> start!104790 tp!93287))

(assert (=> start!104790 tp_is_empty!31501))

(declare-fun array_inv!29799 (array!80603) Bool)

(assert (=> start!104790 (array_inv!29799 _keys!1118)))

(declare-fun e!708906 () Bool)

(declare-fun array_inv!29800 (array!80601) Bool)

(assert (=> start!104790 (and (array_inv!29800 _values!914) e!708906)))

(declare-fun b!1249101 () Bool)

(declare-fun res!833277 () Bool)

(assert (=> b!1249101 (=> (not res!833277) (not e!708903))))

(declare-datatypes ((List!27677 0))(
  ( (Nil!27674) (Cons!27673 (h!28882 (_ BitVec 64)) (t!41139 List!27677)) )
))
(declare-fun arrayNoDuplicates!0 (array!80603 (_ BitVec 32) List!27677) Bool)

(assert (=> b!1249101 (= res!833277 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27674))))

(declare-fun b!1249102 () Bool)

(declare-fun res!833279 () Bool)

(assert (=> b!1249102 (=> (not res!833279) (not e!708903))))

(assert (=> b!1249102 (= res!833279 (and (= (size!39406 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39407 _keys!1118) (size!39406 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249103 () Bool)

(assert (=> b!1249103 (= e!708906 (and e!708904 mapRes!49012))))

(declare-fun condMapEmpty!49012 () Bool)

(declare-fun mapDefault!49012 () ValueCell!14987)

(assert (=> b!1249103 (= condMapEmpty!49012 (= (arr!38868 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14987)) mapDefault!49012)))))

(assert (= (and start!104790 res!833278) b!1249102))

(assert (= (and b!1249102 res!833279) b!1249099))

(assert (= (and b!1249099 res!833276) b!1249101))

(assert (= (and b!1249101 res!833277) b!1249098))

(assert (= (and b!1249103 condMapEmpty!49012) mapIsEmpty!49012))

(assert (= (and b!1249103 (not condMapEmpty!49012)) mapNonEmpty!49012))

(get-info :version)

(assert (= (and mapNonEmpty!49012 ((_ is ValueCellFull!14987) mapValue!49012)) b!1249100))

(assert (= (and b!1249103 ((_ is ValueCellFull!14987) mapDefault!49012)) b!1249097))

(assert (= start!104790 b!1249103))

(declare-fun m!1149631 () Bool)

(assert (=> mapNonEmpty!49012 m!1149631))

(declare-fun m!1149633 () Bool)

(assert (=> start!104790 m!1149633))

(declare-fun m!1149635 () Bool)

(assert (=> start!104790 m!1149635))

(declare-fun m!1149637 () Bool)

(assert (=> start!104790 m!1149637))

(declare-fun m!1149639 () Bool)

(assert (=> b!1249098 m!1149639))

(declare-fun m!1149641 () Bool)

(assert (=> b!1249098 m!1149641))

(declare-fun m!1149643 () Bool)

(assert (=> b!1249099 m!1149643))

(declare-fun m!1149645 () Bool)

(assert (=> b!1249101 m!1149645))

(check-sat (not b!1249099) (not mapNonEmpty!49012) tp_is_empty!31501 (not b_next!26599) (not b!1249098) (not start!104790) (not b!1249101) b_and!44349)
(check-sat b_and!44349 (not b_next!26599))
