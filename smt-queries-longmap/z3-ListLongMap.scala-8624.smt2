; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105034 () Bool)

(assert start!105034)

(declare-fun b_free!26781 () Bool)

(declare-fun b_next!26781 () Bool)

(assert (=> start!105034 (= b_free!26781 (not b_next!26781))))

(declare-fun tp!93842 () Bool)

(declare-fun b_and!44577 () Bool)

(assert (=> start!105034 (= tp!93842 b_and!44577)))

(declare-fun b!1251822 () Bool)

(declare-fun res!834897 () Bool)

(declare-fun e!710902 () Bool)

(assert (=> b!1251822 (=> (not res!834897) (not e!710902))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81032 0))(
  ( (array!81033 (arr!39080 (Array (_ BitVec 32) (_ BitVec 64))) (size!39616 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81032)

(declare-datatypes ((V!47609 0))(
  ( (V!47610 (val!15904 Int)) )
))
(declare-datatypes ((ValueCell!15078 0))(
  ( (ValueCellFull!15078 (v!18602 V!47609)) (EmptyCell!15078) )
))
(declare-datatypes ((array!81034 0))(
  ( (array!81035 (arr!39081 (Array (_ BitVec 32) ValueCell!15078)) (size!39617 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81034)

(assert (=> b!1251822 (= res!834897 (and (= (size!39617 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39616 _keys!1118) (size!39617 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251823 () Bool)

(declare-fun res!834894 () Bool)

(assert (=> b!1251823 (=> (not res!834894) (not e!710902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81032 (_ BitVec 32)) Bool)

(assert (=> b!1251823 (= res!834894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251824 () Bool)

(assert (=> b!1251824 (= e!710902 (not true))))

(declare-datatypes ((tuple2!20510 0))(
  ( (tuple2!20511 (_1!10266 (_ BitVec 64)) (_2!10266 V!47609)) )
))
(declare-datatypes ((List!27741 0))(
  ( (Nil!27738) (Cons!27737 (h!28946 tuple2!20510) (t!41218 List!27741)) )
))
(declare-datatypes ((ListLongMap!18383 0))(
  ( (ListLongMap!18384 (toList!9207 List!27741)) )
))
(declare-fun lt!565059 () ListLongMap!18383)

(declare-fun lt!565058 () ListLongMap!18383)

(assert (=> b!1251824 (= lt!565059 lt!565058)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41603 0))(
  ( (Unit!41604) )
))
(declare-fun lt!565060 () Unit!41603)

(declare-fun minValueAfter!43 () V!47609)

(declare-fun zeroValue!871 () V!47609)

(declare-fun minValueBefore!43 () V!47609)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!967 (array!81032 array!81034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47609 V!47609 V!47609 V!47609 (_ BitVec 32) Int) Unit!41603)

(assert (=> b!1251824 (= lt!565060 (lemmaNoChangeToArrayThenSameMapNoExtras!967 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5603 (array!81032 array!81034 (_ BitVec 32) (_ BitVec 32) V!47609 V!47609 (_ BitVec 32) Int) ListLongMap!18383)

(assert (=> b!1251824 (= lt!565058 (getCurrentListMapNoExtraKeys!5603 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251824 (= lt!565059 (getCurrentListMapNoExtraKeys!5603 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251825 () Bool)

(declare-fun e!710903 () Bool)

(declare-fun tp_is_empty!31683 () Bool)

(assert (=> b!1251825 (= e!710903 tp_is_empty!31683)))

(declare-fun b!1251826 () Bool)

(declare-fun res!834895 () Bool)

(assert (=> b!1251826 (=> (not res!834895) (not e!710902))))

(declare-datatypes ((List!27742 0))(
  ( (Nil!27739) (Cons!27738 (h!28947 (_ BitVec 64)) (t!41219 List!27742)) )
))
(declare-fun arrayNoDuplicates!0 (array!81032 (_ BitVec 32) List!27742) Bool)

(assert (=> b!1251826 (= res!834895 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27739))))

(declare-fun b!1251827 () Bool)

(declare-fun e!710904 () Bool)

(declare-fun e!710901 () Bool)

(declare-fun mapRes!49294 () Bool)

(assert (=> b!1251827 (= e!710904 (and e!710901 mapRes!49294))))

(declare-fun condMapEmpty!49294 () Bool)

(declare-fun mapDefault!49294 () ValueCell!15078)

(assert (=> b!1251827 (= condMapEmpty!49294 (= (arr!39081 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15078)) mapDefault!49294)))))

(declare-fun mapNonEmpty!49294 () Bool)

(declare-fun tp!93841 () Bool)

(assert (=> mapNonEmpty!49294 (= mapRes!49294 (and tp!93841 e!710903))))

(declare-fun mapKey!49294 () (_ BitVec 32))

(declare-fun mapValue!49294 () ValueCell!15078)

(declare-fun mapRest!49294 () (Array (_ BitVec 32) ValueCell!15078))

(assert (=> mapNonEmpty!49294 (= (arr!39081 _values!914) (store mapRest!49294 mapKey!49294 mapValue!49294))))

(declare-fun mapIsEmpty!49294 () Bool)

(assert (=> mapIsEmpty!49294 mapRes!49294))

(declare-fun res!834896 () Bool)

(assert (=> start!105034 (=> (not res!834896) (not e!710902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105034 (= res!834896 (validMask!0 mask!1466))))

(assert (=> start!105034 e!710902))

(assert (=> start!105034 true))

(assert (=> start!105034 tp!93842))

(assert (=> start!105034 tp_is_empty!31683))

(declare-fun array_inv!29809 (array!81032) Bool)

(assert (=> start!105034 (array_inv!29809 _keys!1118)))

(declare-fun array_inv!29810 (array!81034) Bool)

(assert (=> start!105034 (and (array_inv!29810 _values!914) e!710904)))

(declare-fun b!1251828 () Bool)

(assert (=> b!1251828 (= e!710901 tp_is_empty!31683)))

(assert (= (and start!105034 res!834896) b!1251822))

(assert (= (and b!1251822 res!834897) b!1251823))

(assert (= (and b!1251823 res!834894) b!1251826))

(assert (= (and b!1251826 res!834895) b!1251824))

(assert (= (and b!1251827 condMapEmpty!49294) mapIsEmpty!49294))

(assert (= (and b!1251827 (not condMapEmpty!49294)) mapNonEmpty!49294))

(get-info :version)

(assert (= (and mapNonEmpty!49294 ((_ is ValueCellFull!15078) mapValue!49294)) b!1251825))

(assert (= (and b!1251827 ((_ is ValueCellFull!15078) mapDefault!49294)) b!1251828))

(assert (= start!105034 b!1251827))

(declare-fun m!1152545 () Bool)

(assert (=> b!1251826 m!1152545))

(declare-fun m!1152547 () Bool)

(assert (=> b!1251823 m!1152547))

(declare-fun m!1152549 () Bool)

(assert (=> mapNonEmpty!49294 m!1152549))

(declare-fun m!1152551 () Bool)

(assert (=> start!105034 m!1152551))

(declare-fun m!1152553 () Bool)

(assert (=> start!105034 m!1152553))

(declare-fun m!1152555 () Bool)

(assert (=> start!105034 m!1152555))

(declare-fun m!1152557 () Bool)

(assert (=> b!1251824 m!1152557))

(declare-fun m!1152559 () Bool)

(assert (=> b!1251824 m!1152559))

(declare-fun m!1152561 () Bool)

(assert (=> b!1251824 m!1152561))

(check-sat (not mapNonEmpty!49294) b_and!44577 tp_is_empty!31683 (not b!1251823) (not b_next!26781) (not b!1251824) (not start!105034) (not b!1251826))
(check-sat b_and!44577 (not b_next!26781))
