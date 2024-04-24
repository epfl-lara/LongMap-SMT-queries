; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105018 () Bool)

(assert start!105018)

(declare-fun b_free!26599 () Bool)

(declare-fun b_next!26599 () Bool)

(assert (=> start!105018 (= b_free!26599 (not b_next!26599))))

(declare-fun tp!93287 () Bool)

(declare-fun b_and!44369 () Bool)

(assert (=> start!105018 (= tp!93287 b_and!44369)))

(declare-fun b!1250484 () Bool)

(declare-fun res!833837 () Bool)

(declare-fun e!709797 () Bool)

(assert (=> b!1250484 (=> (not res!833837) (not e!709797))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80721 0))(
  ( (array!80722 (arr!38923 (Array (_ BitVec 32) (_ BitVec 64))) (size!39460 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80721)

(declare-datatypes ((V!47367 0))(
  ( (V!47368 (val!15813 Int)) )
))
(declare-datatypes ((ValueCell!14987 0))(
  ( (ValueCellFull!14987 (v!18505 V!47367)) (EmptyCell!14987) )
))
(declare-datatypes ((array!80723 0))(
  ( (array!80724 (arr!38924 (Array (_ BitVec 32) ValueCell!14987)) (size!39461 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80723)

(assert (=> b!1250484 (= res!833837 (and (= (size!39461 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39460 _keys!1118) (size!39461 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49012 () Bool)

(declare-fun mapRes!49012 () Bool)

(declare-fun tp!93286 () Bool)

(declare-fun e!709798 () Bool)

(assert (=> mapNonEmpty!49012 (= mapRes!49012 (and tp!93286 e!709798))))

(declare-fun mapValue!49012 () ValueCell!14987)

(declare-fun mapKey!49012 () (_ BitVec 32))

(declare-fun mapRest!49012 () (Array (_ BitVec 32) ValueCell!14987))

(assert (=> mapNonEmpty!49012 (= (arr!38924 _values!914) (store mapRest!49012 mapKey!49012 mapValue!49012))))

(declare-fun mapIsEmpty!49012 () Bool)

(assert (=> mapIsEmpty!49012 mapRes!49012))

(declare-fun b!1250485 () Bool)

(assert (=> b!1250485 (= e!709797 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20394 0))(
  ( (tuple2!20395 (_1!10208 (_ BitVec 64)) (_2!10208 V!47367)) )
))
(declare-datatypes ((List!27648 0))(
  ( (Nil!27645) (Cons!27644 (h!28862 tuple2!20394) (t!41111 List!27648)) )
))
(declare-datatypes ((ListLongMap!18275 0))(
  ( (ListLongMap!18276 (toList!9153 List!27648)) )
))
(declare-fun lt!564110 () ListLongMap!18275)

(declare-fun minValueAfter!43 () V!47367)

(declare-fun zeroValue!871 () V!47367)

(declare-fun getCurrentListMapNoExtraKeys!5588 (array!80721 array!80723 (_ BitVec 32) (_ BitVec 32) V!47367 V!47367 (_ BitVec 32) Int) ListLongMap!18275)

(assert (=> b!1250485 (= lt!564110 (getCurrentListMapNoExtraKeys!5588 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564109 () ListLongMap!18275)

(declare-fun minValueBefore!43 () V!47367)

(assert (=> b!1250485 (= lt!564109 (getCurrentListMapNoExtraKeys!5588 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250486 () Bool)

(declare-fun res!833839 () Bool)

(assert (=> b!1250486 (=> (not res!833839) (not e!709797))))

(declare-datatypes ((List!27649 0))(
  ( (Nil!27646) (Cons!27645 (h!28863 (_ BitVec 64)) (t!41112 List!27649)) )
))
(declare-fun arrayNoDuplicates!0 (array!80721 (_ BitVec 32) List!27649) Bool)

(assert (=> b!1250486 (= res!833839 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27646))))

(declare-fun b!1250487 () Bool)

(declare-fun res!833836 () Bool)

(assert (=> b!1250487 (=> (not res!833836) (not e!709797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80721 (_ BitVec 32)) Bool)

(assert (=> b!1250487 (= res!833836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250489 () Bool)

(declare-fun e!709799 () Bool)

(declare-fun e!709796 () Bool)

(assert (=> b!1250489 (= e!709799 (and e!709796 mapRes!49012))))

(declare-fun condMapEmpty!49012 () Bool)

(declare-fun mapDefault!49012 () ValueCell!14987)

(assert (=> b!1250489 (= condMapEmpty!49012 (= (arr!38924 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14987)) mapDefault!49012)))))

(declare-fun b!1250490 () Bool)

(declare-fun tp_is_empty!31501 () Bool)

(assert (=> b!1250490 (= e!709796 tp_is_empty!31501)))

(declare-fun b!1250488 () Bool)

(assert (=> b!1250488 (= e!709798 tp_is_empty!31501)))

(declare-fun res!833838 () Bool)

(assert (=> start!105018 (=> (not res!833838) (not e!709797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105018 (= res!833838 (validMask!0 mask!1466))))

(assert (=> start!105018 e!709797))

(assert (=> start!105018 true))

(assert (=> start!105018 tp!93287))

(assert (=> start!105018 tp_is_empty!31501))

(declare-fun array_inv!29811 (array!80721) Bool)

(assert (=> start!105018 (array_inv!29811 _keys!1118)))

(declare-fun array_inv!29812 (array!80723) Bool)

(assert (=> start!105018 (and (array_inv!29812 _values!914) e!709799)))

(assert (= (and start!105018 res!833838) b!1250484))

(assert (= (and b!1250484 res!833837) b!1250487))

(assert (= (and b!1250487 res!833836) b!1250486))

(assert (= (and b!1250486 res!833839) b!1250485))

(assert (= (and b!1250489 condMapEmpty!49012) mapIsEmpty!49012))

(assert (= (and b!1250489 (not condMapEmpty!49012)) mapNonEmpty!49012))

(get-info :version)

(assert (= (and mapNonEmpty!49012 ((_ is ValueCellFull!14987) mapValue!49012)) b!1250488))

(assert (= (and b!1250489 ((_ is ValueCellFull!14987) mapDefault!49012)) b!1250490))

(assert (= start!105018 b!1250489))

(declare-fun m!1151763 () Bool)

(assert (=> b!1250485 m!1151763))

(declare-fun m!1151765 () Bool)

(assert (=> b!1250485 m!1151765))

(declare-fun m!1151767 () Bool)

(assert (=> b!1250486 m!1151767))

(declare-fun m!1151769 () Bool)

(assert (=> start!105018 m!1151769))

(declare-fun m!1151771 () Bool)

(assert (=> start!105018 m!1151771))

(declare-fun m!1151773 () Bool)

(assert (=> start!105018 m!1151773))

(declare-fun m!1151775 () Bool)

(assert (=> b!1250487 m!1151775))

(declare-fun m!1151777 () Bool)

(assert (=> mapNonEmpty!49012 m!1151777))

(check-sat (not b!1250486) (not mapNonEmpty!49012) (not b_next!26599) (not start!105018) (not b!1250485) b_and!44369 tp_is_empty!31501 (not b!1250487))
(check-sat b_and!44369 (not b_next!26599))
