; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105614 () Bool)

(assert start!105614)

(declare-fun b_free!27049 () Bool)

(declare-fun b_next!27049 () Bool)

(assert (=> start!105614 (= b_free!27049 (not b_next!27049))))

(declare-fun tp!94660 () Bool)

(declare-fun b_and!44897 () Bool)

(assert (=> start!105614 (= tp!94660 b_and!44897)))

(declare-fun b!1256890 () Bool)

(declare-fun e!714465 () Bool)

(declare-fun e!714468 () Bool)

(assert (=> b!1256890 (= e!714465 (not e!714468))))

(declare-fun res!837571 () Bool)

(assert (=> b!1256890 (=> res!837571 e!714468)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256890 (= res!837571 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47967 0))(
  ( (V!47968 (val!16038 Int)) )
))
(declare-datatypes ((tuple2!20732 0))(
  ( (tuple2!20733 (_1!10377 (_ BitVec 64)) (_2!10377 V!47967)) )
))
(declare-datatypes ((List!27964 0))(
  ( (Nil!27961) (Cons!27960 (h!29178 tuple2!20732) (t!41443 List!27964)) )
))
(declare-datatypes ((ListLongMap!18613 0))(
  ( (ListLongMap!18614 (toList!9322 List!27964)) )
))
(declare-fun lt!568133 () ListLongMap!18613)

(declare-fun lt!568131 () ListLongMap!18613)

(assert (=> b!1256890 (= lt!568133 lt!568131)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47967)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47967)

(declare-datatypes ((array!81595 0))(
  ( (array!81596 (arr!39352 (Array (_ BitVec 32) (_ BitVec 64))) (size!39889 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81595)

(declare-datatypes ((ValueCell!15212 0))(
  ( (ValueCellFull!15212 (v!18734 V!47967)) (EmptyCell!15212) )
))
(declare-datatypes ((array!81597 0))(
  ( (array!81598 (arr!39353 (Array (_ BitVec 32) ValueCell!15212)) (size!39890 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81597)

(declare-fun minValueBefore!43 () V!47967)

(declare-datatypes ((Unit!41785 0))(
  ( (Unit!41786) )
))
(declare-fun lt!568132 () Unit!41785)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1058 (array!81595 array!81597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 V!47967 V!47967 (_ BitVec 32) Int) Unit!41785)

(assert (=> b!1256890 (= lt!568132 (lemmaNoChangeToArrayThenSameMapNoExtras!1058 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5744 (array!81595 array!81597 (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 (_ BitVec 32) Int) ListLongMap!18613)

(assert (=> b!1256890 (= lt!568131 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256890 (= lt!568133 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256891 () Bool)

(declare-fun e!714464 () Bool)

(declare-fun tp_is_empty!31951 () Bool)

(assert (=> b!1256891 (= e!714464 tp_is_empty!31951)))

(declare-fun b!1256892 () Bool)

(declare-fun res!837569 () Bool)

(assert (=> b!1256892 (=> (not res!837569) (not e!714465))))

(assert (=> b!1256892 (= res!837569 (and (= (size!39890 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39889 _keys!1118) (size!39890 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49711 () Bool)

(declare-fun mapRes!49711 () Bool)

(declare-fun tp!94661 () Bool)

(assert (=> mapNonEmpty!49711 (= mapRes!49711 (and tp!94661 e!714464))))

(declare-fun mapValue!49711 () ValueCell!15212)

(declare-fun mapKey!49711 () (_ BitVec 32))

(declare-fun mapRest!49711 () (Array (_ BitVec 32) ValueCell!15212))

(assert (=> mapNonEmpty!49711 (= (arr!39353 _values!914) (store mapRest!49711 mapKey!49711 mapValue!49711))))

(declare-fun b!1256893 () Bool)

(declare-fun e!714463 () Bool)

(assert (=> b!1256893 (= e!714463 tp_is_empty!31951)))

(declare-fun b!1256895 () Bool)

(assert (=> b!1256895 (= e!714468 true)))

(declare-fun lt!568130 () Bool)

(declare-fun contains!7556 (ListLongMap!18613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4534 (array!81595 array!81597 (_ BitVec 32) (_ BitVec 32) V!47967 V!47967 (_ BitVec 32) Int) ListLongMap!18613)

(assert (=> b!1256895 (= lt!568130 (contains!7556 (getCurrentListMap!4534 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256896 () Bool)

(declare-fun res!837570 () Bool)

(assert (=> b!1256896 (=> (not res!837570) (not e!714465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81595 (_ BitVec 32)) Bool)

(assert (=> b!1256896 (= res!837570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!837573 () Bool)

(assert (=> start!105614 (=> (not res!837573) (not e!714465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105614 (= res!837573 (validMask!0 mask!1466))))

(assert (=> start!105614 e!714465))

(assert (=> start!105614 true))

(assert (=> start!105614 tp!94660))

(assert (=> start!105614 tp_is_empty!31951))

(declare-fun array_inv!30113 (array!81595) Bool)

(assert (=> start!105614 (array_inv!30113 _keys!1118)))

(declare-fun e!714466 () Bool)

(declare-fun array_inv!30114 (array!81597) Bool)

(assert (=> start!105614 (and (array_inv!30114 _values!914) e!714466)))

(declare-fun b!1256894 () Bool)

(assert (=> b!1256894 (= e!714466 (and e!714463 mapRes!49711))))

(declare-fun condMapEmpty!49711 () Bool)

(declare-fun mapDefault!49711 () ValueCell!15212)

(assert (=> b!1256894 (= condMapEmpty!49711 (= (arr!39353 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15212)) mapDefault!49711)))))

(declare-fun b!1256897 () Bool)

(declare-fun res!837572 () Bool)

(assert (=> b!1256897 (=> (not res!837572) (not e!714465))))

(declare-datatypes ((List!27965 0))(
  ( (Nil!27962) (Cons!27961 (h!29179 (_ BitVec 64)) (t!41444 List!27965)) )
))
(declare-fun arrayNoDuplicates!0 (array!81595 (_ BitVec 32) List!27965) Bool)

(assert (=> b!1256897 (= res!837572 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27962))))

(declare-fun mapIsEmpty!49711 () Bool)

(assert (=> mapIsEmpty!49711 mapRes!49711))

(assert (= (and start!105614 res!837573) b!1256892))

(assert (= (and b!1256892 res!837569) b!1256896))

(assert (= (and b!1256896 res!837570) b!1256897))

(assert (= (and b!1256897 res!837572) b!1256890))

(assert (= (and b!1256890 (not res!837571)) b!1256895))

(assert (= (and b!1256894 condMapEmpty!49711) mapIsEmpty!49711))

(assert (= (and b!1256894 (not condMapEmpty!49711)) mapNonEmpty!49711))

(get-info :version)

(assert (= (and mapNonEmpty!49711 ((_ is ValueCellFull!15212) mapValue!49711)) b!1256891))

(assert (= (and b!1256894 ((_ is ValueCellFull!15212) mapDefault!49711)) b!1256893))

(assert (= start!105614 b!1256894))

(declare-fun m!1157907 () Bool)

(assert (=> start!105614 m!1157907))

(declare-fun m!1157909 () Bool)

(assert (=> start!105614 m!1157909))

(declare-fun m!1157911 () Bool)

(assert (=> start!105614 m!1157911))

(declare-fun m!1157913 () Bool)

(assert (=> b!1256897 m!1157913))

(declare-fun m!1157915 () Bool)

(assert (=> b!1256896 m!1157915))

(declare-fun m!1157917 () Bool)

(assert (=> b!1256895 m!1157917))

(assert (=> b!1256895 m!1157917))

(declare-fun m!1157919 () Bool)

(assert (=> b!1256895 m!1157919))

(declare-fun m!1157921 () Bool)

(assert (=> b!1256890 m!1157921))

(declare-fun m!1157923 () Bool)

(assert (=> b!1256890 m!1157923))

(declare-fun m!1157925 () Bool)

(assert (=> b!1256890 m!1157925))

(declare-fun m!1157927 () Bool)

(assert (=> mapNonEmpty!49711 m!1157927))

(check-sat (not b!1256895) (not mapNonEmpty!49711) (not b!1256897) (not start!105614) tp_is_empty!31951 (not b!1256890) (not b!1256896) b_and!44897 (not b_next!27049))
(check-sat b_and!44897 (not b_next!27049))
