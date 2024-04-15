; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104826 () Bool)

(assert start!104826)

(declare-fun b_free!26635 () Bool)

(declare-fun b_next!26635 () Bool)

(assert (=> start!104826 (= b_free!26635 (not b_next!26635))))

(declare-fun tp!93394 () Bool)

(declare-fun b_and!44385 () Bool)

(assert (=> start!104826 (= tp!93394 b_and!44385)))

(declare-fun b!1249475 () Bool)

(declare-fun e!709176 () Bool)

(assert (=> b!1249475 (= e!709176 (not true))))

(declare-datatypes ((V!47415 0))(
  ( (V!47416 (val!15831 Int)) )
))
(declare-datatypes ((tuple2!20472 0))(
  ( (tuple2!20473 (_1!10247 (_ BitVec 64)) (_2!10247 V!47415)) )
))
(declare-datatypes ((List!27699 0))(
  ( (Nil!27696) (Cons!27695 (h!28904 tuple2!20472) (t!41161 List!27699)) )
))
(declare-datatypes ((ListLongMap!18345 0))(
  ( (ListLongMap!18346 (toList!9188 List!27699)) )
))
(declare-fun lt!563601 () ListLongMap!18345)

(declare-fun lt!563603 () ListLongMap!18345)

(assert (=> b!1249475 (= lt!563601 lt!563603)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47415)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41344 0))(
  ( (Unit!41345) )
))
(declare-fun lt!563602 () Unit!41344)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47415)

(declare-datatypes ((array!80669 0))(
  ( (array!80670 (arr!38902 (Array (_ BitVec 32) (_ BitVec 64))) (size!39440 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80669)

(declare-datatypes ((ValueCell!15005 0))(
  ( (ValueCellFull!15005 (v!18526 V!47415)) (EmptyCell!15005) )
))
(declare-datatypes ((array!80671 0))(
  ( (array!80672 (arr!38903 (Array (_ BitVec 32) ValueCell!15005)) (size!39441 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80671)

(declare-fun minValueBefore!43 () V!47415)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!927 (array!80669 array!80671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47415 V!47415 V!47415 V!47415 (_ BitVec 32) Int) Unit!41344)

(assert (=> b!1249475 (= lt!563602 (lemmaNoChangeToArrayThenSameMapNoExtras!927 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5605 (array!80669 array!80671 (_ BitVec 32) (_ BitVec 32) V!47415 V!47415 (_ BitVec 32) Int) ListLongMap!18345)

(assert (=> b!1249475 (= lt!563603 (getCurrentListMapNoExtraKeys!5605 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249475 (= lt!563601 (getCurrentListMapNoExtraKeys!5605 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249476 () Bool)

(declare-fun e!709177 () Bool)

(declare-fun tp_is_empty!31537 () Bool)

(assert (=> b!1249476 (= e!709177 tp_is_empty!31537)))

(declare-fun b!1249477 () Bool)

(declare-fun res!833492 () Bool)

(assert (=> b!1249477 (=> (not res!833492) (not e!709176))))

(assert (=> b!1249477 (= res!833492 (and (= (size!39441 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39440 _keys!1118) (size!39441 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49066 () Bool)

(declare-fun mapRes!49066 () Bool)

(assert (=> mapIsEmpty!49066 mapRes!49066))

(declare-fun b!1249478 () Bool)

(declare-fun e!709175 () Bool)

(assert (=> b!1249478 (= e!709175 (and e!709177 mapRes!49066))))

(declare-fun condMapEmpty!49066 () Bool)

(declare-fun mapDefault!49066 () ValueCell!15005)

(assert (=> b!1249478 (= condMapEmpty!49066 (= (arr!38903 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15005)) mapDefault!49066)))))

(declare-fun b!1249479 () Bool)

(declare-fun e!709173 () Bool)

(assert (=> b!1249479 (= e!709173 tp_is_empty!31537)))

(declare-fun b!1249480 () Bool)

(declare-fun res!833493 () Bool)

(assert (=> b!1249480 (=> (not res!833493) (not e!709176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80669 (_ BitVec 32)) Bool)

(assert (=> b!1249480 (= res!833493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49066 () Bool)

(declare-fun tp!93395 () Bool)

(assert (=> mapNonEmpty!49066 (= mapRes!49066 (and tp!93395 e!709173))))

(declare-fun mapValue!49066 () ValueCell!15005)

(declare-fun mapKey!49066 () (_ BitVec 32))

(declare-fun mapRest!49066 () (Array (_ BitVec 32) ValueCell!15005))

(assert (=> mapNonEmpty!49066 (= (arr!38903 _values!914) (store mapRest!49066 mapKey!49066 mapValue!49066))))

(declare-fun res!833494 () Bool)

(assert (=> start!104826 (=> (not res!833494) (not e!709176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104826 (= res!833494 (validMask!0 mask!1466))))

(assert (=> start!104826 e!709176))

(assert (=> start!104826 true))

(assert (=> start!104826 tp!93394))

(assert (=> start!104826 tp_is_empty!31537))

(declare-fun array_inv!29819 (array!80669) Bool)

(assert (=> start!104826 (array_inv!29819 _keys!1118)))

(declare-fun array_inv!29820 (array!80671) Bool)

(assert (=> start!104826 (and (array_inv!29820 _values!914) e!709175)))

(declare-fun b!1249481 () Bool)

(declare-fun res!833495 () Bool)

(assert (=> b!1249481 (=> (not res!833495) (not e!709176))))

(declare-datatypes ((List!27700 0))(
  ( (Nil!27697) (Cons!27696 (h!28905 (_ BitVec 64)) (t!41162 List!27700)) )
))
(declare-fun arrayNoDuplicates!0 (array!80669 (_ BitVec 32) List!27700) Bool)

(assert (=> b!1249481 (= res!833495 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27697))))

(assert (= (and start!104826 res!833494) b!1249477))

(assert (= (and b!1249477 res!833492) b!1249480))

(assert (= (and b!1249480 res!833493) b!1249481))

(assert (= (and b!1249481 res!833495) b!1249475))

(assert (= (and b!1249478 condMapEmpty!49066) mapIsEmpty!49066))

(assert (= (and b!1249478 (not condMapEmpty!49066)) mapNonEmpty!49066))

(get-info :version)

(assert (= (and mapNonEmpty!49066 ((_ is ValueCellFull!15005) mapValue!49066)) b!1249479))

(assert (= (and b!1249478 ((_ is ValueCellFull!15005) mapDefault!49066)) b!1249476))

(assert (= start!104826 b!1249478))

(declare-fun m!1149949 () Bool)

(assert (=> mapNonEmpty!49066 m!1149949))

(declare-fun m!1149951 () Bool)

(assert (=> b!1249481 m!1149951))

(declare-fun m!1149953 () Bool)

(assert (=> start!104826 m!1149953))

(declare-fun m!1149955 () Bool)

(assert (=> start!104826 m!1149955))

(declare-fun m!1149957 () Bool)

(assert (=> start!104826 m!1149957))

(declare-fun m!1149959 () Bool)

(assert (=> b!1249480 m!1149959))

(declare-fun m!1149961 () Bool)

(assert (=> b!1249475 m!1149961))

(declare-fun m!1149963 () Bool)

(assert (=> b!1249475 m!1149963))

(declare-fun m!1149965 () Bool)

(assert (=> b!1249475 m!1149965))

(check-sat (not start!104826) b_and!44385 (not b!1249480) tp_is_empty!31537 (not mapNonEmpty!49066) (not b_next!26635) (not b!1249475) (not b!1249481))
(check-sat b_and!44385 (not b_next!26635))
