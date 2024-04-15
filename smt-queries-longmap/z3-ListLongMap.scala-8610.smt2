; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104900 () Bool)

(assert start!104900)

(declare-fun b_free!26695 () Bool)

(declare-fun b_next!26695 () Bool)

(assert (=> start!104900 (= b_free!26695 (not b_next!26695))))

(declare-fun tp!93578 () Bool)

(declare-fun b_and!44453 () Bool)

(assert (=> start!104900 (= tp!93578 b_and!44453)))

(declare-fun b!1250293 () Bool)

(declare-fun res!833988 () Bool)

(declare-fun e!709784 () Bool)

(assert (=> b!1250293 (=> (not res!833988) (not e!709784))))

(declare-datatypes ((array!80783 0))(
  ( (array!80784 (arr!38958 (Array (_ BitVec 32) (_ BitVec 64))) (size!39496 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80783)

(declare-datatypes ((List!27745 0))(
  ( (Nil!27742) (Cons!27741 (h!28950 (_ BitVec 64)) (t!41209 List!27745)) )
))
(declare-fun arrayNoDuplicates!0 (array!80783 (_ BitVec 32) List!27745) Bool)

(assert (=> b!1250293 (= res!833988 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27742))))

(declare-fun b!1250294 () Bool)

(declare-fun e!709783 () Bool)

(declare-fun tp_is_empty!31597 () Bool)

(assert (=> b!1250294 (= e!709783 tp_is_empty!31597)))

(declare-fun mapNonEmpty!49159 () Bool)

(declare-fun mapRes!49159 () Bool)

(declare-fun tp!93577 () Bool)

(declare-fun e!709785 () Bool)

(assert (=> mapNonEmpty!49159 (= mapRes!49159 (and tp!93577 e!709785))))

(declare-datatypes ((V!47495 0))(
  ( (V!47496 (val!15861 Int)) )
))
(declare-datatypes ((ValueCell!15035 0))(
  ( (ValueCellFull!15035 (v!18556 V!47495)) (EmptyCell!15035) )
))
(declare-fun mapRest!49159 () (Array (_ BitVec 32) ValueCell!15035))

(declare-datatypes ((array!80785 0))(
  ( (array!80786 (arr!38959 (Array (_ BitVec 32) ValueCell!15035)) (size!39497 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80785)

(declare-fun mapKey!49159 () (_ BitVec 32))

(declare-fun mapValue!49159 () ValueCell!15035)

(assert (=> mapNonEmpty!49159 (= (arr!38959 _values!914) (store mapRest!49159 mapKey!49159 mapValue!49159))))

(declare-fun b!1250295 () Bool)

(declare-fun res!833986 () Bool)

(assert (=> b!1250295 (=> (not res!833986) (not e!709784))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1250295 (= res!833986 (and (= (size!39497 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39496 _keys!1118) (size!39497 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833989 () Bool)

(assert (=> start!104900 (=> (not res!833989) (not e!709784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104900 (= res!833989 (validMask!0 mask!1466))))

(assert (=> start!104900 e!709784))

(assert (=> start!104900 true))

(assert (=> start!104900 tp!93578))

(assert (=> start!104900 tp_is_empty!31597))

(declare-fun array_inv!29849 (array!80783) Bool)

(assert (=> start!104900 (array_inv!29849 _keys!1118)))

(declare-fun e!709787 () Bool)

(declare-fun array_inv!29850 (array!80785) Bool)

(assert (=> start!104900 (and (array_inv!29850 _values!914) e!709787)))

(declare-fun b!1250296 () Bool)

(declare-fun res!833987 () Bool)

(assert (=> b!1250296 (=> (not res!833987) (not e!709784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80783 (_ BitVec 32)) Bool)

(assert (=> b!1250296 (= res!833987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250297 () Bool)

(declare-fun e!709781 () Bool)

(declare-fun e!709782 () Bool)

(assert (=> b!1250297 (= e!709781 e!709782)))

(declare-fun res!833990 () Bool)

(assert (=> b!1250297 (=> res!833990 e!709782)))

(declare-datatypes ((tuple2!20520 0))(
  ( (tuple2!20521 (_1!10271 (_ BitVec 64)) (_2!10271 V!47495)) )
))
(declare-datatypes ((List!27746 0))(
  ( (Nil!27743) (Cons!27742 (h!28951 tuple2!20520) (t!41210 List!27746)) )
))
(declare-datatypes ((ListLongMap!18393 0))(
  ( (ListLongMap!18394 (toList!9212 List!27746)) )
))
(declare-fun lt!564016 () ListLongMap!18393)

(declare-fun contains!7458 (ListLongMap!18393 (_ BitVec 64)) Bool)

(assert (=> b!1250297 (= res!833990 (contains!7458 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47495)

(declare-fun minValueBefore!43 () V!47495)

(declare-fun getCurrentListMap!4385 (array!80783 array!80785 (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 (_ BitVec 32) Int) ListLongMap!18393)

(assert (=> b!1250297 (= lt!564016 (getCurrentListMap!4385 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250298 () Bool)

(assert (=> b!1250298 (= e!709782 true)))

(declare-fun -!1958 (ListLongMap!18393 (_ BitVec 64)) ListLongMap!18393)

(assert (=> b!1250298 (= (-!1958 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564016)))

(declare-datatypes ((Unit!41388 0))(
  ( (Unit!41389) )
))
(declare-fun lt!564018 () Unit!41388)

(declare-fun removeNotPresentStillSame!86 (ListLongMap!18393 (_ BitVec 64)) Unit!41388)

(assert (=> b!1250298 (= lt!564018 (removeNotPresentStillSame!86 lt!564016 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250299 () Bool)

(assert (=> b!1250299 (= e!709785 tp_is_empty!31597)))

(declare-fun b!1250300 () Bool)

(assert (=> b!1250300 (= e!709784 (not e!709781))))

(declare-fun res!833991 () Bool)

(assert (=> b!1250300 (=> res!833991 e!709781)))

(assert (=> b!1250300 (= res!833991 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564014 () ListLongMap!18393)

(declare-fun lt!564017 () ListLongMap!18393)

(assert (=> b!1250300 (= lt!564014 lt!564017)))

(declare-fun minValueAfter!43 () V!47495)

(declare-fun lt!564015 () Unit!41388)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!945 (array!80783 array!80785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 V!47495 V!47495 (_ BitVec 32) Int) Unit!41388)

(assert (=> b!1250300 (= lt!564015 (lemmaNoChangeToArrayThenSameMapNoExtras!945 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5623 (array!80783 array!80785 (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 (_ BitVec 32) Int) ListLongMap!18393)

(assert (=> b!1250300 (= lt!564017 (getCurrentListMapNoExtraKeys!5623 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250300 (= lt!564014 (getCurrentListMapNoExtraKeys!5623 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250301 () Bool)

(assert (=> b!1250301 (= e!709787 (and e!709783 mapRes!49159))))

(declare-fun condMapEmpty!49159 () Bool)

(declare-fun mapDefault!49159 () ValueCell!15035)

(assert (=> b!1250301 (= condMapEmpty!49159 (= (arr!38959 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15035)) mapDefault!49159)))))

(declare-fun mapIsEmpty!49159 () Bool)

(assert (=> mapIsEmpty!49159 mapRes!49159))

(assert (= (and start!104900 res!833989) b!1250295))

(assert (= (and b!1250295 res!833986) b!1250296))

(assert (= (and b!1250296 res!833987) b!1250293))

(assert (= (and b!1250293 res!833988) b!1250300))

(assert (= (and b!1250300 (not res!833991)) b!1250297))

(assert (= (and b!1250297 (not res!833990)) b!1250298))

(assert (= (and b!1250301 condMapEmpty!49159) mapIsEmpty!49159))

(assert (= (and b!1250301 (not condMapEmpty!49159)) mapNonEmpty!49159))

(get-info :version)

(assert (= (and mapNonEmpty!49159 ((_ is ValueCellFull!15035) mapValue!49159)) b!1250299))

(assert (= (and b!1250301 ((_ is ValueCellFull!15035) mapDefault!49159)) b!1250294))

(assert (= start!104900 b!1250301))

(declare-fun m!1150687 () Bool)

(assert (=> b!1250297 m!1150687))

(declare-fun m!1150689 () Bool)

(assert (=> b!1250297 m!1150689))

(declare-fun m!1150691 () Bool)

(assert (=> b!1250296 m!1150691))

(declare-fun m!1150693 () Bool)

(assert (=> start!104900 m!1150693))

(declare-fun m!1150695 () Bool)

(assert (=> start!104900 m!1150695))

(declare-fun m!1150697 () Bool)

(assert (=> start!104900 m!1150697))

(declare-fun m!1150699 () Bool)

(assert (=> mapNonEmpty!49159 m!1150699))

(declare-fun m!1150701 () Bool)

(assert (=> b!1250298 m!1150701))

(declare-fun m!1150703 () Bool)

(assert (=> b!1250298 m!1150703))

(declare-fun m!1150705 () Bool)

(assert (=> b!1250300 m!1150705))

(declare-fun m!1150707 () Bool)

(assert (=> b!1250300 m!1150707))

(declare-fun m!1150709 () Bool)

(assert (=> b!1250300 m!1150709))

(declare-fun m!1150711 () Bool)

(assert (=> b!1250293 m!1150711))

(check-sat (not mapNonEmpty!49159) b_and!44453 (not b!1250297) (not b!1250296) (not b!1250293) (not start!104900) tp_is_empty!31597 (not b!1250298) (not b_next!26695) (not b!1250300))
(check-sat b_and!44453 (not b_next!26695))
