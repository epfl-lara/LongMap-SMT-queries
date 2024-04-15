; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104706 () Bool)

(assert start!104706)

(declare-fun b_free!26527 () Bool)

(declare-fun b_next!26527 () Bool)

(assert (=> start!104706 (= b_free!26527 (not b_next!26527))))

(declare-fun tp!93068 () Bool)

(declare-fun b_and!44273 () Bool)

(assert (=> start!104706 (= tp!93068 b_and!44273)))

(declare-fun res!832819 () Bool)

(declare-fun e!708318 () Bool)

(assert (=> start!104706 (=> (not res!832819) (not e!708318))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104706 (= res!832819 (validMask!0 mask!1466))))

(assert (=> start!104706 e!708318))

(assert (=> start!104706 true))

(assert (=> start!104706 tp!93068))

(declare-fun tp_is_empty!31429 () Bool)

(assert (=> start!104706 tp_is_empty!31429))

(declare-datatypes ((array!80465 0))(
  ( (array!80466 (arr!38801 (Array (_ BitVec 32) (_ BitVec 64))) (size!39339 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80465)

(declare-fun array_inv!29747 (array!80465) Bool)

(assert (=> start!104706 (array_inv!29747 _keys!1118)))

(declare-datatypes ((V!47271 0))(
  ( (V!47272 (val!15777 Int)) )
))
(declare-datatypes ((ValueCell!14951 0))(
  ( (ValueCellFull!14951 (v!18472 V!47271)) (EmptyCell!14951) )
))
(declare-datatypes ((array!80467 0))(
  ( (array!80468 (arr!38802 (Array (_ BitVec 32) ValueCell!14951)) (size!39340 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80467)

(declare-fun e!708316 () Bool)

(declare-fun array_inv!29748 (array!80467) Bool)

(assert (=> start!104706 (and (array_inv!29748 _values!914) e!708316)))

(declare-fun b!1248268 () Bool)

(assert (=> b!1248268 (= e!708318 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47271)

(declare-fun minValueBefore!43 () V!47271)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20402 0))(
  ( (tuple2!20403 (_1!10212 (_ BitVec 64)) (_2!10212 V!47271)) )
))
(declare-datatypes ((List!27631 0))(
  ( (Nil!27628) (Cons!27627 (h!28836 tuple2!20402) (t!41091 List!27631)) )
))
(declare-datatypes ((ListLongMap!18275 0))(
  ( (ListLongMap!18276 (toList!9153 List!27631)) )
))
(declare-fun lt!563216 () ListLongMap!18275)

(declare-fun getCurrentListMapNoExtraKeys!5570 (array!80465 array!80467 (_ BitVec 32) (_ BitVec 32) V!47271 V!47271 (_ BitVec 32) Int) ListLongMap!18275)

(assert (=> b!1248268 (= lt!563216 (getCurrentListMapNoExtraKeys!5570 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248269 () Bool)

(declare-fun res!832820 () Bool)

(assert (=> b!1248269 (=> (not res!832820) (not e!708318))))

(declare-datatypes ((List!27632 0))(
  ( (Nil!27629) (Cons!27628 (h!28837 (_ BitVec 64)) (t!41092 List!27632)) )
))
(declare-fun arrayNoDuplicates!0 (array!80465 (_ BitVec 32) List!27632) Bool)

(assert (=> b!1248269 (= res!832820 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27629))))

(declare-fun mapNonEmpty!48901 () Bool)

(declare-fun mapRes!48901 () Bool)

(declare-fun tp!93067 () Bool)

(declare-fun e!708319 () Bool)

(assert (=> mapNonEmpty!48901 (= mapRes!48901 (and tp!93067 e!708319))))

(declare-fun mapValue!48901 () ValueCell!14951)

(declare-fun mapRest!48901 () (Array (_ BitVec 32) ValueCell!14951))

(declare-fun mapKey!48901 () (_ BitVec 32))

(assert (=> mapNonEmpty!48901 (= (arr!38802 _values!914) (store mapRest!48901 mapKey!48901 mapValue!48901))))

(declare-fun b!1248270 () Bool)

(declare-fun e!708315 () Bool)

(assert (=> b!1248270 (= e!708316 (and e!708315 mapRes!48901))))

(declare-fun condMapEmpty!48901 () Bool)

(declare-fun mapDefault!48901 () ValueCell!14951)

(assert (=> b!1248270 (= condMapEmpty!48901 (= (arr!38802 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14951)) mapDefault!48901)))))

(declare-fun b!1248271 () Bool)

(declare-fun res!832818 () Bool)

(assert (=> b!1248271 (=> (not res!832818) (not e!708318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80465 (_ BitVec 32)) Bool)

(assert (=> b!1248271 (= res!832818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248272 () Bool)

(declare-fun res!832817 () Bool)

(assert (=> b!1248272 (=> (not res!832817) (not e!708318))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248272 (= res!832817 (and (= (size!39340 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39339 _keys!1118) (size!39340 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248273 () Bool)

(assert (=> b!1248273 (= e!708315 tp_is_empty!31429)))

(declare-fun b!1248274 () Bool)

(assert (=> b!1248274 (= e!708319 tp_is_empty!31429)))

(declare-fun mapIsEmpty!48901 () Bool)

(assert (=> mapIsEmpty!48901 mapRes!48901))

(assert (= (and start!104706 res!832819) b!1248272))

(assert (= (and b!1248272 res!832817) b!1248271))

(assert (= (and b!1248271 res!832818) b!1248269))

(assert (= (and b!1248269 res!832820) b!1248268))

(assert (= (and b!1248270 condMapEmpty!48901) mapIsEmpty!48901))

(assert (= (and b!1248270 (not condMapEmpty!48901)) mapNonEmpty!48901))

(get-info :version)

(assert (= (and mapNonEmpty!48901 ((_ is ValueCellFull!14951) mapValue!48901)) b!1248274))

(assert (= (and b!1248270 ((_ is ValueCellFull!14951) mapDefault!48901)) b!1248273))

(assert (= start!104706 b!1248270))

(declare-fun m!1149023 () Bool)

(assert (=> b!1248268 m!1149023))

(declare-fun m!1149025 () Bool)

(assert (=> start!104706 m!1149025))

(declare-fun m!1149027 () Bool)

(assert (=> start!104706 m!1149027))

(declare-fun m!1149029 () Bool)

(assert (=> start!104706 m!1149029))

(declare-fun m!1149031 () Bool)

(assert (=> mapNonEmpty!48901 m!1149031))

(declare-fun m!1149033 () Bool)

(assert (=> b!1248271 m!1149033))

(declare-fun m!1149035 () Bool)

(assert (=> b!1248269 m!1149035))

(check-sat b_and!44273 (not b_next!26527) (not b!1248271) (not b!1248268) (not mapNonEmpty!48901) (not b!1248269) tp_is_empty!31429 (not start!104706))
(check-sat b_and!44273 (not b_next!26527))
