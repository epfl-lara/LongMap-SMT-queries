; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104760 () Bool)

(assert start!104760)

(declare-fun b_free!26569 () Bool)

(declare-fun b_next!26569 () Bool)

(assert (=> start!104760 (= b_free!26569 (not b_next!26569))))

(declare-fun tp!93196 () Bool)

(declare-fun b_and!44319 () Bool)

(assert (=> start!104760 (= tp!93196 b_and!44319)))

(declare-fun b!1248782 () Bool)

(declare-fun res!833098 () Bool)

(declare-fun e!708679 () Bool)

(assert (=> b!1248782 (=> (not res!833098) (not e!708679))))

(declare-datatypes ((array!80541 0))(
  ( (array!80542 (arr!38838 (Array (_ BitVec 32) (_ BitVec 64))) (size!39376 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80541)

(declare-datatypes ((List!27656 0))(
  ( (Nil!27653) (Cons!27652 (h!28861 (_ BitVec 64)) (t!41118 List!27656)) )
))
(declare-fun arrayNoDuplicates!0 (array!80541 (_ BitVec 32) List!27656) Bool)

(assert (=> b!1248782 (= res!833098 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27653))))

(declare-fun mapNonEmpty!48967 () Bool)

(declare-fun mapRes!48967 () Bool)

(declare-fun tp!93197 () Bool)

(declare-fun e!708682 () Bool)

(assert (=> mapNonEmpty!48967 (= mapRes!48967 (and tp!93197 e!708682))))

(declare-datatypes ((V!47327 0))(
  ( (V!47328 (val!15798 Int)) )
))
(declare-datatypes ((ValueCell!14972 0))(
  ( (ValueCellFull!14972 (v!18493 V!47327)) (EmptyCell!14972) )
))
(declare-fun mapRest!48967 () (Array (_ BitVec 32) ValueCell!14972))

(declare-fun mapKey!48967 () (_ BitVec 32))

(declare-datatypes ((array!80543 0))(
  ( (array!80544 (arr!38839 (Array (_ BitVec 32) ValueCell!14972)) (size!39377 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80543)

(declare-fun mapValue!48967 () ValueCell!14972)

(assert (=> mapNonEmpty!48967 (= (arr!38839 _values!914) (store mapRest!48967 mapKey!48967 mapValue!48967))))

(declare-fun b!1248783 () Bool)

(declare-fun e!708681 () Bool)

(declare-fun tp_is_empty!31471 () Bool)

(assert (=> b!1248783 (= e!708681 tp_is_empty!31471)))

(declare-fun b!1248784 () Bool)

(assert (=> b!1248784 (= e!708682 tp_is_empty!31471)))

(declare-fun mapIsEmpty!48967 () Bool)

(assert (=> mapIsEmpty!48967 mapRes!48967))

(declare-fun b!1248786 () Bool)

(declare-fun e!708678 () Bool)

(assert (=> b!1248786 (= e!708678 (and e!708681 mapRes!48967))))

(declare-fun condMapEmpty!48967 () Bool)

(declare-fun mapDefault!48967 () ValueCell!14972)

(assert (=> b!1248786 (= condMapEmpty!48967 (= (arr!38839 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14972)) mapDefault!48967)))))

(declare-fun b!1248787 () Bool)

(declare-fun res!833096 () Bool)

(assert (=> b!1248787 (=> (not res!833096) (not e!708679))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248787 (= res!833096 (and (= (size!39377 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39376 _keys!1118) (size!39377 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248788 () Bool)

(assert (=> b!1248788 (= e!708679 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47327)

(declare-fun zeroValue!871 () V!47327)

(declare-datatypes ((tuple2!20426 0))(
  ( (tuple2!20427 (_1!10224 (_ BitVec 64)) (_2!10224 V!47327)) )
))
(declare-datatypes ((List!27657 0))(
  ( (Nil!27654) (Cons!27653 (h!28862 tuple2!20426) (t!41119 List!27657)) )
))
(declare-datatypes ((ListLongMap!18299 0))(
  ( (ListLongMap!18300 (toList!9165 List!27657)) )
))
(declare-fun lt!563356 () ListLongMap!18299)

(declare-fun getCurrentListMapNoExtraKeys!5582 (array!80541 array!80543 (_ BitVec 32) (_ BitVec 32) V!47327 V!47327 (_ BitVec 32) Int) ListLongMap!18299)

(assert (=> b!1248788 (= lt!563356 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563357 () ListLongMap!18299)

(declare-fun minValueBefore!43 () V!47327)

(assert (=> b!1248788 (= lt!563357 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248785 () Bool)

(declare-fun res!833099 () Bool)

(assert (=> b!1248785 (=> (not res!833099) (not e!708679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80541 (_ BitVec 32)) Bool)

(assert (=> b!1248785 (= res!833099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833097 () Bool)

(assert (=> start!104760 (=> (not res!833097) (not e!708679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104760 (= res!833097 (validMask!0 mask!1466))))

(assert (=> start!104760 e!708679))

(assert (=> start!104760 true))

(assert (=> start!104760 tp!93196))

(assert (=> start!104760 tp_is_empty!31471))

(declare-fun array_inv!29775 (array!80541) Bool)

(assert (=> start!104760 (array_inv!29775 _keys!1118)))

(declare-fun array_inv!29776 (array!80543) Bool)

(assert (=> start!104760 (and (array_inv!29776 _values!914) e!708678)))

(assert (= (and start!104760 res!833097) b!1248787))

(assert (= (and b!1248787 res!833096) b!1248785))

(assert (= (and b!1248785 res!833099) b!1248782))

(assert (= (and b!1248782 res!833098) b!1248788))

(assert (= (and b!1248786 condMapEmpty!48967) mapIsEmpty!48967))

(assert (= (and b!1248786 (not condMapEmpty!48967)) mapNonEmpty!48967))

(get-info :version)

(assert (= (and mapNonEmpty!48967 ((_ is ValueCellFull!14972) mapValue!48967)) b!1248784))

(assert (= (and b!1248786 ((_ is ValueCellFull!14972) mapDefault!48967)) b!1248783))

(assert (= start!104760 b!1248786))

(declare-fun m!1149391 () Bool)

(assert (=> mapNonEmpty!48967 m!1149391))

(declare-fun m!1149393 () Bool)

(assert (=> b!1248788 m!1149393))

(declare-fun m!1149395 () Bool)

(assert (=> b!1248788 m!1149395))

(declare-fun m!1149397 () Bool)

(assert (=> b!1248785 m!1149397))

(declare-fun m!1149399 () Bool)

(assert (=> start!104760 m!1149399))

(declare-fun m!1149401 () Bool)

(assert (=> start!104760 m!1149401))

(declare-fun m!1149403 () Bool)

(assert (=> start!104760 m!1149403))

(declare-fun m!1149405 () Bool)

(assert (=> b!1248782 m!1149405))

(check-sat (not mapNonEmpty!48967) (not b!1248788) (not b!1248782) tp_is_empty!31471 (not b!1248785) b_and!44319 (not start!104760) (not b_next!26569))
(check-sat b_and!44319 (not b_next!26569))
