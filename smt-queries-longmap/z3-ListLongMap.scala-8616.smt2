; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104964 () Bool)

(assert start!104964)

(declare-fun b_free!26733 () Bool)

(declare-fun b_next!26733 () Bool)

(assert (=> start!104964 (= b_free!26733 (not b_next!26733))))

(declare-fun tp!93695 () Bool)

(declare-fun b_and!44519 () Bool)

(assert (=> start!104964 (= tp!93695 b_and!44519)))

(declare-fun b!1251045 () Bool)

(declare-fun e!710330 () Bool)

(declare-fun e!710328 () Bool)

(assert (=> b!1251045 (= e!710330 (not e!710328))))

(declare-fun res!834432 () Bool)

(assert (=> b!1251045 (=> res!834432 e!710328)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251045 (= res!834432 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47545 0))(
  ( (V!47546 (val!15880 Int)) )
))
(declare-datatypes ((tuple2!20466 0))(
  ( (tuple2!20467 (_1!10244 (_ BitVec 64)) (_2!10244 V!47545)) )
))
(declare-datatypes ((List!27702 0))(
  ( (Nil!27699) (Cons!27698 (h!28907 tuple2!20466) (t!41177 List!27702)) )
))
(declare-datatypes ((ListLongMap!18339 0))(
  ( (ListLongMap!18340 (toList!9185 List!27702)) )
))
(declare-fun lt!564605 () ListLongMap!18339)

(declare-fun lt!564603 () ListLongMap!18339)

(assert (=> b!1251045 (= lt!564605 lt!564603)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47545)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47545)

(declare-datatypes ((array!80934 0))(
  ( (array!80935 (arr!39032 (Array (_ BitVec 32) (_ BitVec 64))) (size!39568 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80934)

(declare-datatypes ((ValueCell!15054 0))(
  ( (ValueCellFull!15054 (v!18577 V!47545)) (EmptyCell!15054) )
))
(declare-datatypes ((array!80936 0))(
  ( (array!80937 (arr!39033 (Array (_ BitVec 32) ValueCell!15054)) (size!39569 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80936)

(declare-fun minValueBefore!43 () V!47545)

(declare-datatypes ((Unit!41559 0))(
  ( (Unit!41560) )
))
(declare-fun lt!564606 () Unit!41559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!948 (array!80934 array!80936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47545 V!47545 V!47545 V!47545 (_ BitVec 32) Int) Unit!41559)

(assert (=> b!1251045 (= lt!564606 (lemmaNoChangeToArrayThenSameMapNoExtras!948 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5584 (array!80934 array!80936 (_ BitVec 32) (_ BitVec 32) V!47545 V!47545 (_ BitVec 32) Int) ListLongMap!18339)

(assert (=> b!1251045 (= lt!564603 (getCurrentListMapNoExtraKeys!5584 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251045 (= lt!564605 (getCurrentListMapNoExtraKeys!5584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251046 () Bool)

(declare-fun res!834430 () Bool)

(assert (=> b!1251046 (=> (not res!834430) (not e!710330))))

(declare-datatypes ((List!27703 0))(
  ( (Nil!27700) (Cons!27699 (h!28908 (_ BitVec 64)) (t!41178 List!27703)) )
))
(declare-fun arrayNoDuplicates!0 (array!80934 (_ BitVec 32) List!27703) Bool)

(assert (=> b!1251046 (= res!834430 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27700))))

(declare-fun res!834434 () Bool)

(assert (=> start!104964 (=> (not res!834434) (not e!710330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104964 (= res!834434 (validMask!0 mask!1466))))

(assert (=> start!104964 e!710330))

(assert (=> start!104964 true))

(assert (=> start!104964 tp!93695))

(declare-fun tp_is_empty!31635 () Bool)

(assert (=> start!104964 tp_is_empty!31635))

(declare-fun array_inv!29773 (array!80934) Bool)

(assert (=> start!104964 (array_inv!29773 _keys!1118)))

(declare-fun e!710327 () Bool)

(declare-fun array_inv!29774 (array!80936) Bool)

(assert (=> start!104964 (and (array_inv!29774 _values!914) e!710327)))

(declare-fun b!1251047 () Bool)

(declare-fun res!834429 () Bool)

(assert (=> b!1251047 (=> (not res!834429) (not e!710330))))

(assert (=> b!1251047 (= res!834429 (and (= (size!39569 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39568 _keys!1118) (size!39569 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251048 () Bool)

(declare-fun e!710329 () Bool)

(assert (=> b!1251048 (= e!710329 tp_is_empty!31635)))

(declare-fun b!1251049 () Bool)

(declare-fun res!834433 () Bool)

(assert (=> b!1251049 (=> (not res!834433) (not e!710330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80934 (_ BitVec 32)) Bool)

(assert (=> b!1251049 (= res!834433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251050 () Bool)

(declare-fun mapRes!49219 () Bool)

(assert (=> b!1251050 (= e!710327 (and e!710329 mapRes!49219))))

(declare-fun condMapEmpty!49219 () Bool)

(declare-fun mapDefault!49219 () ValueCell!15054)

(assert (=> b!1251050 (= condMapEmpty!49219 (= (arr!39033 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15054)) mapDefault!49219)))))

(declare-fun b!1251051 () Bool)

(declare-fun e!710326 () Bool)

(assert (=> b!1251051 (= e!710328 e!710326)))

(declare-fun res!834431 () Bool)

(assert (=> b!1251051 (=> res!834431 e!710326)))

(declare-fun lt!564604 () ListLongMap!18339)

(declare-fun contains!7498 (ListLongMap!18339 (_ BitVec 64)) Bool)

(assert (=> b!1251051 (= res!834431 (contains!7498 lt!564604 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4458 (array!80934 array!80936 (_ BitVec 32) (_ BitVec 32) V!47545 V!47545 (_ BitVec 32) Int) ListLongMap!18339)

(assert (=> b!1251051 (= lt!564604 (getCurrentListMap!4458 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49219 () Bool)

(declare-fun tp!93694 () Bool)

(declare-fun e!710331 () Bool)

(assert (=> mapNonEmpty!49219 (= mapRes!49219 (and tp!93694 e!710331))))

(declare-fun mapKey!49219 () (_ BitVec 32))

(declare-fun mapRest!49219 () (Array (_ BitVec 32) ValueCell!15054))

(declare-fun mapValue!49219 () ValueCell!15054)

(assert (=> mapNonEmpty!49219 (= (arr!39033 _values!914) (store mapRest!49219 mapKey!49219 mapValue!49219))))

(declare-fun b!1251052 () Bool)

(assert (=> b!1251052 (= e!710326 true)))

(declare-fun -!2008 (ListLongMap!18339 (_ BitVec 64)) ListLongMap!18339)

(assert (=> b!1251052 (= (-!2008 lt!564604 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564604)))

(declare-fun lt!564602 () Unit!41559)

(declare-fun removeNotPresentStillSame!103 (ListLongMap!18339 (_ BitVec 64)) Unit!41559)

(assert (=> b!1251052 (= lt!564602 (removeNotPresentStillSame!103 lt!564604 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251053 () Bool)

(assert (=> b!1251053 (= e!710331 tp_is_empty!31635)))

(declare-fun mapIsEmpty!49219 () Bool)

(assert (=> mapIsEmpty!49219 mapRes!49219))

(assert (= (and start!104964 res!834434) b!1251047))

(assert (= (and b!1251047 res!834429) b!1251049))

(assert (= (and b!1251049 res!834433) b!1251046))

(assert (= (and b!1251046 res!834430) b!1251045))

(assert (= (and b!1251045 (not res!834432)) b!1251051))

(assert (= (and b!1251051 (not res!834431)) b!1251052))

(assert (= (and b!1251050 condMapEmpty!49219) mapIsEmpty!49219))

(assert (= (and b!1251050 (not condMapEmpty!49219)) mapNonEmpty!49219))

(get-info :version)

(assert (= (and mapNonEmpty!49219 ((_ is ValueCellFull!15054) mapValue!49219)) b!1251053))

(assert (= (and b!1251050 ((_ is ValueCellFull!15054) mapDefault!49219)) b!1251048))

(assert (= start!104964 b!1251050))

(declare-fun m!1151827 () Bool)

(assert (=> mapNonEmpty!49219 m!1151827))

(declare-fun m!1151829 () Bool)

(assert (=> b!1251045 m!1151829))

(declare-fun m!1151831 () Bool)

(assert (=> b!1251045 m!1151831))

(declare-fun m!1151833 () Bool)

(assert (=> b!1251045 m!1151833))

(declare-fun m!1151835 () Bool)

(assert (=> start!104964 m!1151835))

(declare-fun m!1151837 () Bool)

(assert (=> start!104964 m!1151837))

(declare-fun m!1151839 () Bool)

(assert (=> start!104964 m!1151839))

(declare-fun m!1151841 () Bool)

(assert (=> b!1251052 m!1151841))

(declare-fun m!1151843 () Bool)

(assert (=> b!1251052 m!1151843))

(declare-fun m!1151845 () Bool)

(assert (=> b!1251046 m!1151845))

(declare-fun m!1151847 () Bool)

(assert (=> b!1251051 m!1151847))

(declare-fun m!1151849 () Bool)

(assert (=> b!1251051 m!1151849))

(declare-fun m!1151851 () Bool)

(assert (=> b!1251049 m!1151851))

(check-sat (not b!1251051) (not start!104964) (not mapNonEmpty!49219) (not b!1251046) (not b!1251052) (not b!1251045) b_and!44519 tp_is_empty!31635 (not b!1251049) (not b_next!26733))
(check-sat b_and!44519 (not b_next!26733))
