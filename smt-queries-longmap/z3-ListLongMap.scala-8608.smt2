; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104888 () Bool)

(assert start!104888)

(declare-fun b_free!26683 () Bool)

(declare-fun b_next!26683 () Bool)

(assert (=> start!104888 (= b_free!26683 (not b_next!26683))))

(declare-fun tp!93542 () Bool)

(declare-fun b_and!44441 () Bool)

(assert (=> start!104888 (= tp!93542 b_and!44441)))

(declare-fun mapIsEmpty!49141 () Bool)

(declare-fun mapRes!49141 () Bool)

(assert (=> mapIsEmpty!49141 mapRes!49141))

(declare-fun b!1250131 () Bool)

(declare-fun e!709660 () Bool)

(declare-fun e!709656 () Bool)

(assert (=> b!1250131 (= e!709660 e!709656)))

(declare-fun res!833880 () Bool)

(assert (=> b!1250131 (=> res!833880 e!709656)))

(declare-datatypes ((V!47479 0))(
  ( (V!47480 (val!15855 Int)) )
))
(declare-datatypes ((tuple2!20508 0))(
  ( (tuple2!20509 (_1!10265 (_ BitVec 64)) (_2!10265 V!47479)) )
))
(declare-datatypes ((List!27733 0))(
  ( (Nil!27730) (Cons!27729 (h!28938 tuple2!20508) (t!41197 List!27733)) )
))
(declare-datatypes ((ListLongMap!18381 0))(
  ( (ListLongMap!18382 (toList!9206 List!27733)) )
))
(declare-fun lt!563927 () ListLongMap!18381)

(declare-fun contains!7453 (ListLongMap!18381 (_ BitVec 64)) Bool)

(assert (=> b!1250131 (= res!833880 (contains!7453 lt!563927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47479)

(declare-datatypes ((array!80759 0))(
  ( (array!80760 (arr!38946 (Array (_ BitVec 32) (_ BitVec 64))) (size!39484 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80759)

(declare-fun minValueBefore!43 () V!47479)

(declare-datatypes ((ValueCell!15029 0))(
  ( (ValueCellFull!15029 (v!18550 V!47479)) (EmptyCell!15029) )
))
(declare-datatypes ((array!80761 0))(
  ( (array!80762 (arr!38947 (Array (_ BitVec 32) ValueCell!15029)) (size!39485 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80761)

(declare-fun getCurrentListMap!4380 (array!80759 array!80761 (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 (_ BitVec 32) Int) ListLongMap!18381)

(assert (=> b!1250131 (= lt!563927 (getCurrentListMap!4380 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833882 () Bool)

(declare-fun e!709661 () Bool)

(assert (=> start!104888 (=> (not res!833882) (not e!709661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104888 (= res!833882 (validMask!0 mask!1466))))

(assert (=> start!104888 e!709661))

(assert (=> start!104888 true))

(assert (=> start!104888 tp!93542))

(declare-fun tp_is_empty!31585 () Bool)

(assert (=> start!104888 tp_is_empty!31585))

(declare-fun array_inv!29843 (array!80759) Bool)

(assert (=> start!104888 (array_inv!29843 _keys!1118)))

(declare-fun e!709658 () Bool)

(declare-fun array_inv!29844 (array!80761) Bool)

(assert (=> start!104888 (and (array_inv!29844 _values!914) e!709658)))

(declare-fun b!1250132 () Bool)

(assert (=> b!1250132 (= e!709656 true)))

(declare-fun -!1953 (ListLongMap!18381 (_ BitVec 64)) ListLongMap!18381)

(assert (=> b!1250132 (= (-!1953 lt!563927 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563927)))

(declare-datatypes ((Unit!41378 0))(
  ( (Unit!41379) )
))
(declare-fun lt!563924 () Unit!41378)

(declare-fun removeNotPresentStillSame!81 (ListLongMap!18381 (_ BitVec 64)) Unit!41378)

(assert (=> b!1250132 (= lt!563924 (removeNotPresentStillSame!81 lt!563927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250133 () Bool)

(declare-fun res!833881 () Bool)

(assert (=> b!1250133 (=> (not res!833881) (not e!709661))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250133 (= res!833881 (and (= (size!39485 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39484 _keys!1118) (size!39485 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49141 () Bool)

(declare-fun tp!93541 () Bool)

(declare-fun e!709659 () Bool)

(assert (=> mapNonEmpty!49141 (= mapRes!49141 (and tp!93541 e!709659))))

(declare-fun mapRest!49141 () (Array (_ BitVec 32) ValueCell!15029))

(declare-fun mapKey!49141 () (_ BitVec 32))

(declare-fun mapValue!49141 () ValueCell!15029)

(assert (=> mapNonEmpty!49141 (= (arr!38947 _values!914) (store mapRest!49141 mapKey!49141 mapValue!49141))))

(declare-fun b!1250134 () Bool)

(declare-fun res!833883 () Bool)

(assert (=> b!1250134 (=> (not res!833883) (not e!709661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80759 (_ BitVec 32)) Bool)

(assert (=> b!1250134 (= res!833883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250135 () Bool)

(assert (=> b!1250135 (= e!709661 (not e!709660))))

(declare-fun res!833879 () Bool)

(assert (=> b!1250135 (=> res!833879 e!709660)))

(assert (=> b!1250135 (= res!833879 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!563926 () ListLongMap!18381)

(declare-fun lt!563925 () ListLongMap!18381)

(assert (=> b!1250135 (= lt!563926 lt!563925)))

(declare-fun lt!563928 () Unit!41378)

(declare-fun minValueAfter!43 () V!47479)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!942 (array!80759 array!80761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 V!47479 V!47479 (_ BitVec 32) Int) Unit!41378)

(assert (=> b!1250135 (= lt!563928 (lemmaNoChangeToArrayThenSameMapNoExtras!942 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5620 (array!80759 array!80761 (_ BitVec 32) (_ BitVec 32) V!47479 V!47479 (_ BitVec 32) Int) ListLongMap!18381)

(assert (=> b!1250135 (= lt!563925 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250135 (= lt!563926 (getCurrentListMapNoExtraKeys!5620 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250136 () Bool)

(declare-fun e!709657 () Bool)

(assert (=> b!1250136 (= e!709658 (and e!709657 mapRes!49141))))

(declare-fun condMapEmpty!49141 () Bool)

(declare-fun mapDefault!49141 () ValueCell!15029)

(assert (=> b!1250136 (= condMapEmpty!49141 (= (arr!38947 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15029)) mapDefault!49141)))))

(declare-fun b!1250137 () Bool)

(assert (=> b!1250137 (= e!709657 tp_is_empty!31585)))

(declare-fun b!1250138 () Bool)

(declare-fun res!833878 () Bool)

(assert (=> b!1250138 (=> (not res!833878) (not e!709661))))

(declare-datatypes ((List!27734 0))(
  ( (Nil!27731) (Cons!27730 (h!28939 (_ BitVec 64)) (t!41198 List!27734)) )
))
(declare-fun arrayNoDuplicates!0 (array!80759 (_ BitVec 32) List!27734) Bool)

(assert (=> b!1250138 (= res!833878 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27731))))

(declare-fun b!1250139 () Bool)

(assert (=> b!1250139 (= e!709659 tp_is_empty!31585)))

(assert (= (and start!104888 res!833882) b!1250133))

(assert (= (and b!1250133 res!833881) b!1250134))

(assert (= (and b!1250134 res!833883) b!1250138))

(assert (= (and b!1250138 res!833878) b!1250135))

(assert (= (and b!1250135 (not res!833879)) b!1250131))

(assert (= (and b!1250131 (not res!833880)) b!1250132))

(assert (= (and b!1250136 condMapEmpty!49141) mapIsEmpty!49141))

(assert (= (and b!1250136 (not condMapEmpty!49141)) mapNonEmpty!49141))

(get-info :version)

(assert (= (and mapNonEmpty!49141 ((_ is ValueCellFull!15029) mapValue!49141)) b!1250139))

(assert (= (and b!1250136 ((_ is ValueCellFull!15029) mapDefault!49141)) b!1250137))

(assert (= start!104888 b!1250136))

(declare-fun m!1150531 () Bool)

(assert (=> start!104888 m!1150531))

(declare-fun m!1150533 () Bool)

(assert (=> start!104888 m!1150533))

(declare-fun m!1150535 () Bool)

(assert (=> start!104888 m!1150535))

(declare-fun m!1150537 () Bool)

(assert (=> b!1250138 m!1150537))

(declare-fun m!1150539 () Bool)

(assert (=> b!1250132 m!1150539))

(declare-fun m!1150541 () Bool)

(assert (=> b!1250132 m!1150541))

(declare-fun m!1150543 () Bool)

(assert (=> b!1250131 m!1150543))

(declare-fun m!1150545 () Bool)

(assert (=> b!1250131 m!1150545))

(declare-fun m!1150547 () Bool)

(assert (=> b!1250134 m!1150547))

(declare-fun m!1150549 () Bool)

(assert (=> b!1250135 m!1150549))

(declare-fun m!1150551 () Bool)

(assert (=> b!1250135 m!1150551))

(declare-fun m!1150553 () Bool)

(assert (=> b!1250135 m!1150553))

(declare-fun m!1150555 () Bool)

(assert (=> mapNonEmpty!49141 m!1150555))

(check-sat tp_is_empty!31585 (not start!104888) (not b!1250131) (not mapNonEmpty!49141) b_and!44441 (not b!1250132) (not b!1250138) (not b!1250134) (not b!1250135) (not b_next!26683))
(check-sat b_and!44441 (not b_next!26683))
