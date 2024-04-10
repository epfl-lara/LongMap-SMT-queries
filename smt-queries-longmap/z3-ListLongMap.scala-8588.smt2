; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104760 () Bool)

(assert start!104760)

(declare-fun b_free!26565 () Bool)

(declare-fun b_next!26565 () Bool)

(assert (=> start!104760 (= b_free!26565 (not b_next!26565))))

(declare-fun tp!93185 () Bool)

(declare-fun b_and!44333 () Bool)

(assert (=> start!104760 (= tp!93185 b_and!44333)))

(declare-fun b!1248822 () Bool)

(declare-fun res!833114 () Bool)

(declare-fun e!708695 () Bool)

(assert (=> b!1248822 (=> (not res!833114) (not e!708695))))

(declare-datatypes ((array!80620 0))(
  ( (array!80621 (arr!38877 (Array (_ BitVec 32) (_ BitVec 64))) (size!39413 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80620)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80620 (_ BitVec 32)) Bool)

(assert (=> b!1248822 (= res!833114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833115 () Bool)

(assert (=> start!104760 (=> (not res!833115) (not e!708695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104760 (= res!833115 (validMask!0 mask!1466))))

(assert (=> start!104760 e!708695))

(assert (=> start!104760 true))

(assert (=> start!104760 tp!93185))

(declare-fun tp_is_empty!31467 () Bool)

(assert (=> start!104760 tp_is_empty!31467))

(declare-fun array_inv!29669 (array!80620) Bool)

(assert (=> start!104760 (array_inv!29669 _keys!1118)))

(declare-datatypes ((V!47321 0))(
  ( (V!47322 (val!15796 Int)) )
))
(declare-datatypes ((ValueCell!14970 0))(
  ( (ValueCellFull!14970 (v!18492 V!47321)) (EmptyCell!14970) )
))
(declare-datatypes ((array!80622 0))(
  ( (array!80623 (arr!38878 (Array (_ BitVec 32) ValueCell!14970)) (size!39414 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80622)

(declare-fun e!708697 () Bool)

(declare-fun array_inv!29670 (array!80622) Bool)

(assert (=> start!104760 (and (array_inv!29670 _values!914) e!708697)))

(declare-fun mapIsEmpty!48961 () Bool)

(declare-fun mapRes!48961 () Bool)

(assert (=> mapIsEmpty!48961 mapRes!48961))

(declare-fun b!1248823 () Bool)

(declare-fun e!708693 () Bool)

(assert (=> b!1248823 (= e!708697 (and e!708693 mapRes!48961))))

(declare-fun condMapEmpty!48961 () Bool)

(declare-fun mapDefault!48961 () ValueCell!14970)

(assert (=> b!1248823 (= condMapEmpty!48961 (= (arr!38878 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14970)) mapDefault!48961)))))

(declare-fun b!1248824 () Bool)

(assert (=> b!1248824 (= e!708695 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47321)

(declare-datatypes ((tuple2!20342 0))(
  ( (tuple2!20343 (_1!10182 (_ BitVec 64)) (_2!10182 V!47321)) )
))
(declare-datatypes ((List!27589 0))(
  ( (Nil!27586) (Cons!27585 (h!28794 tuple2!20342) (t!41060 List!27589)) )
))
(declare-datatypes ((ListLongMap!18215 0))(
  ( (ListLongMap!18216 (toList!9123 List!27589)) )
))
(declare-fun lt!563524 () ListLongMap!18215)

(declare-fun minValueAfter!43 () V!47321)

(declare-fun getCurrentListMapNoExtraKeys!5530 (array!80620 array!80622 (_ BitVec 32) (_ BitVec 32) V!47321 V!47321 (_ BitVec 32) Int) ListLongMap!18215)

(assert (=> b!1248824 (= lt!563524 (getCurrentListMapNoExtraKeys!5530 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47321)

(declare-fun lt!563523 () ListLongMap!18215)

(assert (=> b!1248824 (= lt!563523 (getCurrentListMapNoExtraKeys!5530 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48961 () Bool)

(declare-fun tp!93184 () Bool)

(declare-fun e!708696 () Bool)

(assert (=> mapNonEmpty!48961 (= mapRes!48961 (and tp!93184 e!708696))))

(declare-fun mapRest!48961 () (Array (_ BitVec 32) ValueCell!14970))

(declare-fun mapKey!48961 () (_ BitVec 32))

(declare-fun mapValue!48961 () ValueCell!14970)

(assert (=> mapNonEmpty!48961 (= (arr!38878 _values!914) (store mapRest!48961 mapKey!48961 mapValue!48961))))

(declare-fun b!1248825 () Bool)

(assert (=> b!1248825 (= e!708693 tp_is_empty!31467)))

(declare-fun b!1248826 () Bool)

(declare-fun res!833113 () Bool)

(assert (=> b!1248826 (=> (not res!833113) (not e!708695))))

(declare-datatypes ((List!27590 0))(
  ( (Nil!27587) (Cons!27586 (h!28795 (_ BitVec 64)) (t!41061 List!27590)) )
))
(declare-fun arrayNoDuplicates!0 (array!80620 (_ BitVec 32) List!27590) Bool)

(assert (=> b!1248826 (= res!833113 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27587))))

(declare-fun b!1248827 () Bool)

(assert (=> b!1248827 (= e!708696 tp_is_empty!31467)))

(declare-fun b!1248828 () Bool)

(declare-fun res!833112 () Bool)

(assert (=> b!1248828 (=> (not res!833112) (not e!708695))))

(assert (=> b!1248828 (= res!833112 (and (= (size!39414 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39413 _keys!1118) (size!39414 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104760 res!833115) b!1248828))

(assert (= (and b!1248828 res!833112) b!1248822))

(assert (= (and b!1248822 res!833114) b!1248826))

(assert (= (and b!1248826 res!833113) b!1248824))

(assert (= (and b!1248823 condMapEmpty!48961) mapIsEmpty!48961))

(assert (= (and b!1248823 (not condMapEmpty!48961)) mapNonEmpty!48961))

(get-info :version)

(assert (= (and mapNonEmpty!48961 ((_ is ValueCellFull!14970) mapValue!48961)) b!1248827))

(assert (= (and b!1248823 ((_ is ValueCellFull!14970) mapDefault!48961)) b!1248825))

(assert (= start!104760 b!1248823))

(declare-fun m!1149879 () Bool)

(assert (=> b!1248822 m!1149879))

(declare-fun m!1149881 () Bool)

(assert (=> b!1248824 m!1149881))

(declare-fun m!1149883 () Bool)

(assert (=> b!1248824 m!1149883))

(declare-fun m!1149885 () Bool)

(assert (=> b!1248826 m!1149885))

(declare-fun m!1149887 () Bool)

(assert (=> start!104760 m!1149887))

(declare-fun m!1149889 () Bool)

(assert (=> start!104760 m!1149889))

(declare-fun m!1149891 () Bool)

(assert (=> start!104760 m!1149891))

(declare-fun m!1149893 () Bool)

(assert (=> mapNonEmpty!48961 m!1149893))

(check-sat tp_is_empty!31467 (not b!1248826) (not start!104760) (not mapNonEmpty!48961) b_and!44333 (not b_next!26565) (not b!1248822) (not b!1248824))
(check-sat b_and!44333 (not b_next!26565))
