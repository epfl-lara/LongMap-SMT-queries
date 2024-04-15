; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104754 () Bool)

(assert start!104754)

(declare-fun b_free!26563 () Bool)

(declare-fun b_next!26563 () Bool)

(assert (=> start!104754 (= b_free!26563 (not b_next!26563))))

(declare-fun tp!93179 () Bool)

(declare-fun b_and!44313 () Bool)

(assert (=> start!104754 (= tp!93179 b_and!44313)))

(declare-fun b!1248719 () Bool)

(declare-fun e!708635 () Bool)

(declare-fun tp_is_empty!31465 () Bool)

(assert (=> b!1248719 (= e!708635 tp_is_empty!31465)))

(declare-fun b!1248720 () Bool)

(declare-fun e!708634 () Bool)

(declare-fun e!708636 () Bool)

(declare-fun mapRes!48958 () Bool)

(assert (=> b!1248720 (= e!708634 (and e!708636 mapRes!48958))))

(declare-fun condMapEmpty!48958 () Bool)

(declare-datatypes ((V!47319 0))(
  ( (V!47320 (val!15795 Int)) )
))
(declare-datatypes ((ValueCell!14969 0))(
  ( (ValueCellFull!14969 (v!18490 V!47319)) (EmptyCell!14969) )
))
(declare-datatypes ((array!80529 0))(
  ( (array!80530 (arr!38832 (Array (_ BitVec 32) ValueCell!14969)) (size!39370 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80529)

(declare-fun mapDefault!48958 () ValueCell!14969)

(assert (=> b!1248720 (= condMapEmpty!48958 (= (arr!38832 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14969)) mapDefault!48958)))))

(declare-fun mapNonEmpty!48958 () Bool)

(declare-fun tp!93178 () Bool)

(assert (=> mapNonEmpty!48958 (= mapRes!48958 (and tp!93178 e!708635))))

(declare-fun mapKey!48958 () (_ BitVec 32))

(declare-fun mapRest!48958 () (Array (_ BitVec 32) ValueCell!14969))

(declare-fun mapValue!48958 () ValueCell!14969)

(assert (=> mapNonEmpty!48958 (= (arr!38832 _values!914) (store mapRest!48958 mapKey!48958 mapValue!48958))))

(declare-fun b!1248721 () Bool)

(assert (=> b!1248721 (= e!708636 tp_is_empty!31465)))

(declare-fun mapIsEmpty!48958 () Bool)

(assert (=> mapIsEmpty!48958 mapRes!48958))

(declare-fun b!1248722 () Bool)

(declare-fun res!833060 () Bool)

(declare-fun e!708633 () Bool)

(assert (=> b!1248722 (=> (not res!833060) (not e!708633))))

(declare-datatypes ((array!80531 0))(
  ( (array!80532 (arr!38833 (Array (_ BitVec 32) (_ BitVec 64))) (size!39371 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80531)

(declare-datatypes ((List!27651 0))(
  ( (Nil!27648) (Cons!27647 (h!28856 (_ BitVec 64)) (t!41113 List!27651)) )
))
(declare-fun arrayNoDuplicates!0 (array!80531 (_ BitVec 32) List!27651) Bool)

(assert (=> b!1248722 (= res!833060 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27648))))

(declare-fun b!1248723 () Bool)

(assert (=> b!1248723 (= e!708633 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun minValueAfter!43 () V!47319)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47319)

(declare-datatypes ((tuple2!20420 0))(
  ( (tuple2!20421 (_1!10221 (_ BitVec 64)) (_2!10221 V!47319)) )
))
(declare-datatypes ((List!27652 0))(
  ( (Nil!27649) (Cons!27648 (h!28857 tuple2!20420) (t!41114 List!27652)) )
))
(declare-datatypes ((ListLongMap!18293 0))(
  ( (ListLongMap!18294 (toList!9162 List!27652)) )
))
(declare-fun lt!563338 () ListLongMap!18293)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5579 (array!80531 array!80529 (_ BitVec 32) (_ BitVec 32) V!47319 V!47319 (_ BitVec 32) Int) ListLongMap!18293)

(assert (=> b!1248723 (= lt!563338 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47319)

(declare-fun lt!563339 () ListLongMap!18293)

(assert (=> b!1248723 (= lt!563339 (getCurrentListMapNoExtraKeys!5579 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248724 () Bool)

(declare-fun res!833063 () Bool)

(assert (=> b!1248724 (=> (not res!833063) (not e!708633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80531 (_ BitVec 32)) Bool)

(assert (=> b!1248724 (= res!833063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248725 () Bool)

(declare-fun res!833062 () Bool)

(assert (=> b!1248725 (=> (not res!833062) (not e!708633))))

(assert (=> b!1248725 (= res!833062 (and (= (size!39370 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39371 _keys!1118) (size!39370 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833061 () Bool)

(assert (=> start!104754 (=> (not res!833061) (not e!708633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104754 (= res!833061 (validMask!0 mask!1466))))

(assert (=> start!104754 e!708633))

(assert (=> start!104754 true))

(assert (=> start!104754 tp!93179))

(assert (=> start!104754 tp_is_empty!31465))

(declare-fun array_inv!29769 (array!80531) Bool)

(assert (=> start!104754 (array_inv!29769 _keys!1118)))

(declare-fun array_inv!29770 (array!80529) Bool)

(assert (=> start!104754 (and (array_inv!29770 _values!914) e!708634)))

(assert (= (and start!104754 res!833061) b!1248725))

(assert (= (and b!1248725 res!833062) b!1248724))

(assert (= (and b!1248724 res!833063) b!1248722))

(assert (= (and b!1248722 res!833060) b!1248723))

(assert (= (and b!1248720 condMapEmpty!48958) mapIsEmpty!48958))

(assert (= (and b!1248720 (not condMapEmpty!48958)) mapNonEmpty!48958))

(get-info :version)

(assert (= (and mapNonEmpty!48958 ((_ is ValueCellFull!14969) mapValue!48958)) b!1248719))

(assert (= (and b!1248720 ((_ is ValueCellFull!14969) mapDefault!48958)) b!1248721))

(assert (= start!104754 b!1248720))

(declare-fun m!1149343 () Bool)

(assert (=> mapNonEmpty!48958 m!1149343))

(declare-fun m!1149345 () Bool)

(assert (=> b!1248724 m!1149345))

(declare-fun m!1149347 () Bool)

(assert (=> b!1248723 m!1149347))

(declare-fun m!1149349 () Bool)

(assert (=> b!1248723 m!1149349))

(declare-fun m!1149351 () Bool)

(assert (=> b!1248722 m!1149351))

(declare-fun m!1149353 () Bool)

(assert (=> start!104754 m!1149353))

(declare-fun m!1149355 () Bool)

(assert (=> start!104754 m!1149355))

(declare-fun m!1149357 () Bool)

(assert (=> start!104754 m!1149357))

(check-sat (not b_next!26563) (not b!1248724) tp_is_empty!31465 (not mapNonEmpty!48958) (not b!1248723) b_and!44313 (not start!104754) (not b!1248722))
(check-sat b_and!44313 (not b_next!26563))
