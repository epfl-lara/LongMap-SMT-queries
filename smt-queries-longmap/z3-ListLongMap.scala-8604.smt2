; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104864 () Bool)

(assert start!104864)

(declare-fun b_free!26659 () Bool)

(declare-fun b_next!26659 () Bool)

(assert (=> start!104864 (= b_free!26659 (not b_next!26659))))

(declare-fun tp!93470 () Bool)

(declare-fun b_and!44417 () Bool)

(assert (=> start!104864 (= tp!93470 b_and!44417)))

(declare-fun b!1249814 () Bool)

(declare-fun res!833671 () Bool)

(declare-fun e!709410 () Bool)

(assert (=> b!1249814 (=> (not res!833671) (not e!709410))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80717 0))(
  ( (array!80718 (arr!38925 (Array (_ BitVec 32) (_ BitVec 64))) (size!39463 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80717)

(declare-datatypes ((V!47447 0))(
  ( (V!47448 (val!15843 Int)) )
))
(declare-datatypes ((ValueCell!15017 0))(
  ( (ValueCellFull!15017 (v!18538 V!47447)) (EmptyCell!15017) )
))
(declare-datatypes ((array!80719 0))(
  ( (array!80720 (arr!38926 (Array (_ BitVec 32) ValueCell!15017)) (size!39464 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80719)

(assert (=> b!1249814 (= res!833671 (and (= (size!39464 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39463 _keys!1118) (size!39464 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249815 () Bool)

(declare-fun e!709415 () Bool)

(declare-fun tp_is_empty!31561 () Bool)

(assert (=> b!1249815 (= e!709415 tp_is_empty!31561)))

(declare-fun b!1249816 () Bool)

(declare-fun res!833672 () Bool)

(assert (=> b!1249816 (=> (not res!833672) (not e!709410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80717 (_ BitVec 32)) Bool)

(assert (=> b!1249816 (= res!833672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249817 () Bool)

(declare-fun res!833670 () Bool)

(assert (=> b!1249817 (=> (not res!833670) (not e!709410))))

(declare-datatypes ((List!27717 0))(
  ( (Nil!27714) (Cons!27713 (h!28922 (_ BitVec 64)) (t!41181 List!27717)) )
))
(declare-fun arrayNoDuplicates!0 (array!80717 (_ BitVec 32) List!27717) Bool)

(assert (=> b!1249817 (= res!833670 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27714))))

(declare-fun b!1249818 () Bool)

(declare-fun e!709413 () Bool)

(declare-fun e!709411 () Bool)

(declare-fun mapRes!49105 () Bool)

(assert (=> b!1249818 (= e!709413 (and e!709411 mapRes!49105))))

(declare-fun condMapEmpty!49105 () Bool)

(declare-fun mapDefault!49105 () ValueCell!15017)

(assert (=> b!1249818 (= condMapEmpty!49105 (= (arr!38926 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15017)) mapDefault!49105)))))

(declare-fun mapIsEmpty!49105 () Bool)

(assert (=> mapIsEmpty!49105 mapRes!49105))

(declare-fun b!1249819 () Bool)

(assert (=> b!1249819 (= e!709411 tp_is_empty!31561)))

(declare-fun mapNonEmpty!49105 () Bool)

(declare-fun tp!93469 () Bool)

(assert (=> mapNonEmpty!49105 (= mapRes!49105 (and tp!93469 e!709415))))

(declare-fun mapRest!49105 () (Array (_ BitVec 32) ValueCell!15017))

(declare-fun mapValue!49105 () ValueCell!15017)

(declare-fun mapKey!49105 () (_ BitVec 32))

(assert (=> mapNonEmpty!49105 (= (arr!38926 _values!914) (store mapRest!49105 mapKey!49105 mapValue!49105))))

(declare-fun res!833669 () Bool)

(assert (=> start!104864 (=> (not res!833669) (not e!709410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104864 (= res!833669 (validMask!0 mask!1466))))

(assert (=> start!104864 e!709410))

(assert (=> start!104864 true))

(assert (=> start!104864 tp!93470))

(assert (=> start!104864 tp_is_empty!31561))

(declare-fun array_inv!29833 (array!80717) Bool)

(assert (=> start!104864 (array_inv!29833 _keys!1118)))

(declare-fun array_inv!29834 (array!80719) Bool)

(assert (=> start!104864 (and (array_inv!29834 _values!914) e!709413)))

(declare-fun b!1249820 () Bool)

(declare-fun e!709414 () Bool)

(assert (=> b!1249820 (= e!709414 true)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!563751 () Bool)

(declare-fun minValueBefore!43 () V!47447)

(declare-fun zeroValue!871 () V!47447)

(declare-datatypes ((tuple2!20488 0))(
  ( (tuple2!20489 (_1!10255 (_ BitVec 64)) (_2!10255 V!47447)) )
))
(declare-datatypes ((List!27718 0))(
  ( (Nil!27715) (Cons!27714 (h!28923 tuple2!20488) (t!41182 List!27718)) )
))
(declare-datatypes ((ListLongMap!18361 0))(
  ( (ListLongMap!18362 (toList!9196 List!27718)) )
))
(declare-fun contains!7446 (ListLongMap!18361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4373 (array!80717 array!80719 (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 (_ BitVec 32) Int) ListLongMap!18361)

(assert (=> b!1249820 (= lt!563751 (contains!7446 (getCurrentListMap!4373 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1249821 () Bool)

(assert (=> b!1249821 (= e!709410 (not e!709414))))

(declare-fun res!833673 () Bool)

(assert (=> b!1249821 (=> res!833673 e!709414)))

(assert (=> b!1249821 (= res!833673 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!563754 () ListLongMap!18361)

(declare-fun lt!563753 () ListLongMap!18361)

(assert (=> b!1249821 (= lt!563754 lt!563753)))

(declare-fun minValueAfter!43 () V!47447)

(declare-datatypes ((Unit!41360 0))(
  ( (Unit!41361) )
))
(declare-fun lt!563752 () Unit!41360)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!935 (array!80717 array!80719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 V!47447 V!47447 (_ BitVec 32) Int) Unit!41360)

(assert (=> b!1249821 (= lt!563752 (lemmaNoChangeToArrayThenSameMapNoExtras!935 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5613 (array!80717 array!80719 (_ BitVec 32) (_ BitVec 32) V!47447 V!47447 (_ BitVec 32) Int) ListLongMap!18361)

(assert (=> b!1249821 (= lt!563753 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249821 (= lt!563754 (getCurrentListMapNoExtraKeys!5613 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!104864 res!833669) b!1249814))

(assert (= (and b!1249814 res!833671) b!1249816))

(assert (= (and b!1249816 res!833672) b!1249817))

(assert (= (and b!1249817 res!833670) b!1249821))

(assert (= (and b!1249821 (not res!833673)) b!1249820))

(assert (= (and b!1249818 condMapEmpty!49105) mapIsEmpty!49105))

(assert (= (and b!1249818 (not condMapEmpty!49105)) mapNonEmpty!49105))

(get-info :version)

(assert (= (and mapNonEmpty!49105 ((_ is ValueCellFull!15017) mapValue!49105)) b!1249815))

(assert (= (and b!1249818 ((_ is ValueCellFull!15017) mapDefault!49105)) b!1249819))

(assert (= start!104864 b!1249818))

(declare-fun m!1150231 () Bool)

(assert (=> mapNonEmpty!49105 m!1150231))

(declare-fun m!1150233 () Bool)

(assert (=> b!1249821 m!1150233))

(declare-fun m!1150235 () Bool)

(assert (=> b!1249821 m!1150235))

(declare-fun m!1150237 () Bool)

(assert (=> b!1249821 m!1150237))

(declare-fun m!1150239 () Bool)

(assert (=> start!104864 m!1150239))

(declare-fun m!1150241 () Bool)

(assert (=> start!104864 m!1150241))

(declare-fun m!1150243 () Bool)

(assert (=> start!104864 m!1150243))

(declare-fun m!1150245 () Bool)

(assert (=> b!1249820 m!1150245))

(assert (=> b!1249820 m!1150245))

(declare-fun m!1150247 () Bool)

(assert (=> b!1249820 m!1150247))

(declare-fun m!1150249 () Bool)

(assert (=> b!1249817 m!1150249))

(declare-fun m!1150251 () Bool)

(assert (=> b!1249816 m!1150251))

(check-sat (not b!1249820) (not mapNonEmpty!49105) (not b!1249821) (not start!104864) (not b_next!26659) b_and!44417 tp_is_empty!31561 (not b!1249817) (not b!1249816))
(check-sat b_and!44417 (not b_next!26659))
