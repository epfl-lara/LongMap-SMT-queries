; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104832 () Bool)

(assert start!104832)

(declare-fun b_free!26641 () Bool)

(declare-fun b_next!26641 () Bool)

(assert (=> start!104832 (= b_free!26641 (not b_next!26641))))

(declare-fun tp!93412 () Bool)

(declare-fun b_and!44391 () Bool)

(assert (=> start!104832 (= tp!93412 b_and!44391)))

(declare-fun b!1249538 () Bool)

(declare-fun e!709220 () Bool)

(declare-fun tp_is_empty!31543 () Bool)

(assert (=> b!1249538 (= e!709220 tp_is_empty!31543)))

(declare-fun b!1249539 () Bool)

(declare-fun e!709222 () Bool)

(assert (=> b!1249539 (= e!709222 tp_is_empty!31543)))

(declare-fun mapIsEmpty!49075 () Bool)

(declare-fun mapRes!49075 () Bool)

(assert (=> mapIsEmpty!49075 mapRes!49075))

(declare-fun b!1249540 () Bool)

(declare-fun res!833531 () Bool)

(declare-fun e!709219 () Bool)

(assert (=> b!1249540 (=> (not res!833531) (not e!709219))))

(declare-datatypes ((array!80679 0))(
  ( (array!80680 (arr!38907 (Array (_ BitVec 32) (_ BitVec 64))) (size!39445 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80679)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80679 (_ BitVec 32)) Bool)

(assert (=> b!1249540 (= res!833531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833530 () Bool)

(assert (=> start!104832 (=> (not res!833530) (not e!709219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104832 (= res!833530 (validMask!0 mask!1466))))

(assert (=> start!104832 e!709219))

(assert (=> start!104832 true))

(assert (=> start!104832 tp!93412))

(assert (=> start!104832 tp_is_empty!31543))

(declare-fun array_inv!29823 (array!80679) Bool)

(assert (=> start!104832 (array_inv!29823 _keys!1118)))

(declare-datatypes ((V!47423 0))(
  ( (V!47424 (val!15834 Int)) )
))
(declare-datatypes ((ValueCell!15008 0))(
  ( (ValueCellFull!15008 (v!18529 V!47423)) (EmptyCell!15008) )
))
(declare-datatypes ((array!80681 0))(
  ( (array!80682 (arr!38908 (Array (_ BitVec 32) ValueCell!15008)) (size!39446 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80681)

(declare-fun e!709218 () Bool)

(declare-fun array_inv!29824 (array!80681) Bool)

(assert (=> start!104832 (and (array_inv!29824 _values!914) e!709218)))

(declare-fun b!1249541 () Bool)

(declare-fun res!833529 () Bool)

(assert (=> b!1249541 (=> (not res!833529) (not e!709219))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249541 (= res!833529 (and (= (size!39446 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39445 _keys!1118) (size!39446 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249542 () Bool)

(declare-fun res!833528 () Bool)

(assert (=> b!1249542 (=> (not res!833528) (not e!709219))))

(declare-datatypes ((List!27703 0))(
  ( (Nil!27700) (Cons!27699 (h!28908 (_ BitVec 64)) (t!41165 List!27703)) )
))
(declare-fun arrayNoDuplicates!0 (array!80679 (_ BitVec 32) List!27703) Bool)

(assert (=> b!1249542 (= res!833528 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27700))))

(declare-fun b!1249543 () Bool)

(assert (=> b!1249543 (= e!709219 (not true))))

(declare-datatypes ((tuple2!20476 0))(
  ( (tuple2!20477 (_1!10249 (_ BitVec 64)) (_2!10249 V!47423)) )
))
(declare-datatypes ((List!27704 0))(
  ( (Nil!27701) (Cons!27700 (h!28909 tuple2!20476) (t!41166 List!27704)) )
))
(declare-datatypes ((ListLongMap!18349 0))(
  ( (ListLongMap!18350 (toList!9190 List!27704)) )
))
(declare-fun lt!563630 () ListLongMap!18349)

(declare-fun lt!563628 () ListLongMap!18349)

(assert (=> b!1249543 (= lt!563630 lt!563628)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47423)

(declare-fun zeroValue!871 () V!47423)

(declare-fun minValueBefore!43 () V!47423)

(declare-datatypes ((Unit!41348 0))(
  ( (Unit!41349) )
))
(declare-fun lt!563629 () Unit!41348)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!929 (array!80679 array!80681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47423 V!47423 V!47423 V!47423 (_ BitVec 32) Int) Unit!41348)

(assert (=> b!1249543 (= lt!563629 (lemmaNoChangeToArrayThenSameMapNoExtras!929 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5607 (array!80679 array!80681 (_ BitVec 32) (_ BitVec 32) V!47423 V!47423 (_ BitVec 32) Int) ListLongMap!18349)

(assert (=> b!1249543 (= lt!563628 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249543 (= lt!563630 (getCurrentListMapNoExtraKeys!5607 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49075 () Bool)

(declare-fun tp!93413 () Bool)

(assert (=> mapNonEmpty!49075 (= mapRes!49075 (and tp!93413 e!709222))))

(declare-fun mapRest!49075 () (Array (_ BitVec 32) ValueCell!15008))

(declare-fun mapKey!49075 () (_ BitVec 32))

(declare-fun mapValue!49075 () ValueCell!15008)

(assert (=> mapNonEmpty!49075 (= (arr!38908 _values!914) (store mapRest!49075 mapKey!49075 mapValue!49075))))

(declare-fun b!1249544 () Bool)

(assert (=> b!1249544 (= e!709218 (and e!709220 mapRes!49075))))

(declare-fun condMapEmpty!49075 () Bool)

(declare-fun mapDefault!49075 () ValueCell!15008)

(assert (=> b!1249544 (= condMapEmpty!49075 (= (arr!38908 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15008)) mapDefault!49075)))))

(assert (= (and start!104832 res!833530) b!1249541))

(assert (= (and b!1249541 res!833529) b!1249540))

(assert (= (and b!1249540 res!833531) b!1249542))

(assert (= (and b!1249542 res!833528) b!1249543))

(assert (= (and b!1249544 condMapEmpty!49075) mapIsEmpty!49075))

(assert (= (and b!1249544 (not condMapEmpty!49075)) mapNonEmpty!49075))

(get-info :version)

(assert (= (and mapNonEmpty!49075 ((_ is ValueCellFull!15008) mapValue!49075)) b!1249539))

(assert (= (and b!1249544 ((_ is ValueCellFull!15008) mapDefault!49075)) b!1249538))

(assert (= start!104832 b!1249544))

(declare-fun m!1150003 () Bool)

(assert (=> mapNonEmpty!49075 m!1150003))

(declare-fun m!1150005 () Bool)

(assert (=> start!104832 m!1150005))

(declare-fun m!1150007 () Bool)

(assert (=> start!104832 m!1150007))

(declare-fun m!1150009 () Bool)

(assert (=> start!104832 m!1150009))

(declare-fun m!1150011 () Bool)

(assert (=> b!1249543 m!1150011))

(declare-fun m!1150013 () Bool)

(assert (=> b!1249543 m!1150013))

(declare-fun m!1150015 () Bool)

(assert (=> b!1249543 m!1150015))

(declare-fun m!1150017 () Bool)

(assert (=> b!1249542 m!1150017))

(declare-fun m!1150019 () Bool)

(assert (=> b!1249540 m!1150019))

(check-sat (not mapNonEmpty!49075) b_and!44391 (not start!104832) (not b!1249542) tp_is_empty!31543 (not b!1249540) (not b_next!26641) (not b!1249543))
(check-sat b_and!44391 (not b_next!26641))
