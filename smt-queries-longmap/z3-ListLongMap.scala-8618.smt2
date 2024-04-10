; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104976 () Bool)

(assert start!104976)

(declare-fun b_free!26745 () Bool)

(declare-fun b_next!26745 () Bool)

(assert (=> start!104976 (= b_free!26745 (not b_next!26745))))

(declare-fun tp!93731 () Bool)

(declare-fun b_and!44531 () Bool)

(assert (=> start!104976 (= tp!93731 b_and!44531)))

(declare-fun b!1251207 () Bool)

(declare-fun res!834540 () Bool)

(declare-fun e!710454 () Bool)

(assert (=> b!1251207 (=> (not res!834540) (not e!710454))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80958 0))(
  ( (array!80959 (arr!39044 (Array (_ BitVec 32) (_ BitVec 64))) (size!39580 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80958)

(declare-datatypes ((V!47561 0))(
  ( (V!47562 (val!15886 Int)) )
))
(declare-datatypes ((ValueCell!15060 0))(
  ( (ValueCellFull!15060 (v!18583 V!47561)) (EmptyCell!15060) )
))
(declare-datatypes ((array!80960 0))(
  ( (array!80961 (arr!39045 (Array (_ BitVec 32) ValueCell!15060)) (size!39581 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80960)

(assert (=> b!1251207 (= res!834540 (and (= (size!39581 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39580 _keys!1118) (size!39581 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49237 () Bool)

(declare-fun mapRes!49237 () Bool)

(declare-fun tp!93730 () Bool)

(declare-fun e!710457 () Bool)

(assert (=> mapNonEmpty!49237 (= mapRes!49237 (and tp!93730 e!710457))))

(declare-fun mapRest!49237 () (Array (_ BitVec 32) ValueCell!15060))

(declare-fun mapKey!49237 () (_ BitVec 32))

(declare-fun mapValue!49237 () ValueCell!15060)

(assert (=> mapNonEmpty!49237 (= (arr!39045 _values!914) (store mapRest!49237 mapKey!49237 mapValue!49237))))

(declare-fun b!1251209 () Bool)

(declare-fun e!710452 () Bool)

(declare-fun e!710455 () Bool)

(assert (=> b!1251209 (= e!710452 (and e!710455 mapRes!49237))))

(declare-fun condMapEmpty!49237 () Bool)

(declare-fun mapDefault!49237 () ValueCell!15060)

(assert (=> b!1251209 (= condMapEmpty!49237 (= (arr!39045 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15060)) mapDefault!49237)))))

(declare-fun b!1251210 () Bool)

(declare-fun e!710456 () Bool)

(assert (=> b!1251210 (= e!710454 (not e!710456))))

(declare-fun res!834538 () Bool)

(assert (=> b!1251210 (=> res!834538 e!710456)))

(assert (=> b!1251210 (= res!834538 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20478 0))(
  ( (tuple2!20479 (_1!10250 (_ BitVec 64)) (_2!10250 V!47561)) )
))
(declare-datatypes ((List!27712 0))(
  ( (Nil!27709) (Cons!27708 (h!28917 tuple2!20478) (t!41187 List!27712)) )
))
(declare-datatypes ((ListLongMap!18351 0))(
  ( (ListLongMap!18352 (toList!9191 List!27712)) )
))
(declare-fun lt!564693 () ListLongMap!18351)

(declare-fun lt!564695 () ListLongMap!18351)

(assert (=> b!1251210 (= lt!564693 lt!564695)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47561)

(declare-fun zeroValue!871 () V!47561)

(declare-datatypes ((Unit!41571 0))(
  ( (Unit!41572) )
))
(declare-fun lt!564696 () Unit!41571)

(declare-fun minValueBefore!43 () V!47561)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!954 (array!80958 array!80960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47561 V!47561 V!47561 V!47561 (_ BitVec 32) Int) Unit!41571)

(assert (=> b!1251210 (= lt!564696 (lemmaNoChangeToArrayThenSameMapNoExtras!954 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5590 (array!80958 array!80960 (_ BitVec 32) (_ BitVec 32) V!47561 V!47561 (_ BitVec 32) Int) ListLongMap!18351)

(assert (=> b!1251210 (= lt!564695 (getCurrentListMapNoExtraKeys!5590 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251210 (= lt!564693 (getCurrentListMapNoExtraKeys!5590 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251211 () Bool)

(declare-fun tp_is_empty!31647 () Bool)

(assert (=> b!1251211 (= e!710455 tp_is_empty!31647)))

(declare-fun b!1251208 () Bool)

(declare-fun e!710453 () Bool)

(assert (=> b!1251208 (= e!710453 true)))

(declare-fun lt!564692 () ListLongMap!18351)

(declare-fun -!2013 (ListLongMap!18351 (_ BitVec 64)) ListLongMap!18351)

(assert (=> b!1251208 (= (-!2013 lt!564692 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564692)))

(declare-fun lt!564694 () Unit!41571)

(declare-fun removeNotPresentStillSame!108 (ListLongMap!18351 (_ BitVec 64)) Unit!41571)

(assert (=> b!1251208 (= lt!564694 (removeNotPresentStillSame!108 lt!564692 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!834537 () Bool)

(assert (=> start!104976 (=> (not res!834537) (not e!710454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104976 (= res!834537 (validMask!0 mask!1466))))

(assert (=> start!104976 e!710454))

(assert (=> start!104976 true))

(assert (=> start!104976 tp!93731))

(assert (=> start!104976 tp_is_empty!31647))

(declare-fun array_inv!29785 (array!80958) Bool)

(assert (=> start!104976 (array_inv!29785 _keys!1118)))

(declare-fun array_inv!29786 (array!80960) Bool)

(assert (=> start!104976 (and (array_inv!29786 _values!914) e!710452)))

(declare-fun b!1251212 () Bool)

(assert (=> b!1251212 (= e!710456 e!710453)))

(declare-fun res!834541 () Bool)

(assert (=> b!1251212 (=> res!834541 e!710453)))

(declare-fun contains!7503 (ListLongMap!18351 (_ BitVec 64)) Bool)

(assert (=> b!1251212 (= res!834541 (contains!7503 lt!564692 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4463 (array!80958 array!80960 (_ BitVec 32) (_ BitVec 32) V!47561 V!47561 (_ BitVec 32) Int) ListLongMap!18351)

(assert (=> b!1251212 (= lt!564692 (getCurrentListMap!4463 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49237 () Bool)

(assert (=> mapIsEmpty!49237 mapRes!49237))

(declare-fun b!1251213 () Bool)

(declare-fun res!834542 () Bool)

(assert (=> b!1251213 (=> (not res!834542) (not e!710454))))

(declare-datatypes ((List!27713 0))(
  ( (Nil!27710) (Cons!27709 (h!28918 (_ BitVec 64)) (t!41188 List!27713)) )
))
(declare-fun arrayNoDuplicates!0 (array!80958 (_ BitVec 32) List!27713) Bool)

(assert (=> b!1251213 (= res!834542 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27710))))

(declare-fun b!1251214 () Bool)

(assert (=> b!1251214 (= e!710457 tp_is_empty!31647)))

(declare-fun b!1251215 () Bool)

(declare-fun res!834539 () Bool)

(assert (=> b!1251215 (=> (not res!834539) (not e!710454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80958 (_ BitVec 32)) Bool)

(assert (=> b!1251215 (= res!834539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104976 res!834537) b!1251207))

(assert (= (and b!1251207 res!834540) b!1251215))

(assert (= (and b!1251215 res!834539) b!1251213))

(assert (= (and b!1251213 res!834542) b!1251210))

(assert (= (and b!1251210 (not res!834538)) b!1251212))

(assert (= (and b!1251212 (not res!834541)) b!1251208))

(assert (= (and b!1251209 condMapEmpty!49237) mapIsEmpty!49237))

(assert (= (and b!1251209 (not condMapEmpty!49237)) mapNonEmpty!49237))

(get-info :version)

(assert (= (and mapNonEmpty!49237 ((_ is ValueCellFull!15060) mapValue!49237)) b!1251214))

(assert (= (and b!1251209 ((_ is ValueCellFull!15060) mapDefault!49237)) b!1251211))

(assert (= start!104976 b!1251209))

(declare-fun m!1151983 () Bool)

(assert (=> b!1251212 m!1151983))

(declare-fun m!1151985 () Bool)

(assert (=> b!1251212 m!1151985))

(declare-fun m!1151987 () Bool)

(assert (=> mapNonEmpty!49237 m!1151987))

(declare-fun m!1151989 () Bool)

(assert (=> b!1251213 m!1151989))

(declare-fun m!1151991 () Bool)

(assert (=> b!1251215 m!1151991))

(declare-fun m!1151993 () Bool)

(assert (=> b!1251210 m!1151993))

(declare-fun m!1151995 () Bool)

(assert (=> b!1251210 m!1151995))

(declare-fun m!1151997 () Bool)

(assert (=> b!1251210 m!1151997))

(declare-fun m!1151999 () Bool)

(assert (=> b!1251208 m!1151999))

(declare-fun m!1152001 () Bool)

(assert (=> b!1251208 m!1152001))

(declare-fun m!1152003 () Bool)

(assert (=> start!104976 m!1152003))

(declare-fun m!1152005 () Bool)

(assert (=> start!104976 m!1152005))

(declare-fun m!1152007 () Bool)

(assert (=> start!104976 m!1152007))

(check-sat b_and!44531 (not b!1251210) (not b!1251208) (not mapNonEmpty!49237) (not start!104976) (not b!1251213) (not b!1251215) (not b_next!26745) tp_is_empty!31647 (not b!1251212))
(check-sat b_and!44531 (not b_next!26745))
