; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104784 () Bool)

(assert start!104784)

(declare-fun b_free!26593 () Bool)

(declare-fun b_next!26593 () Bool)

(assert (=> start!104784 (= b_free!26593 (not b_next!26593))))

(declare-fun tp!93268 () Bool)

(declare-fun b_and!44343 () Bool)

(assert (=> start!104784 (= tp!93268 b_and!44343)))

(declare-fun b!1249034 () Bool)

(declare-fun res!833240 () Bool)

(declare-fun e!708860 () Bool)

(assert (=> b!1249034 (=> (not res!833240) (not e!708860))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80589 0))(
  ( (array!80590 (arr!38862 (Array (_ BitVec 32) (_ BitVec 64))) (size!39400 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80589)

(declare-datatypes ((V!47359 0))(
  ( (V!47360 (val!15810 Int)) )
))
(declare-datatypes ((ValueCell!14984 0))(
  ( (ValueCellFull!14984 (v!18505 V!47359)) (EmptyCell!14984) )
))
(declare-datatypes ((array!80591 0))(
  ( (array!80592 (arr!38863 (Array (_ BitVec 32) ValueCell!14984)) (size!39401 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80591)

(assert (=> b!1249034 (= res!833240 (and (= (size!39401 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39400 _keys!1118) (size!39401 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249035 () Bool)

(declare-fun res!833241 () Bool)

(assert (=> b!1249035 (=> (not res!833241) (not e!708860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80589 (_ BitVec 32)) Bool)

(assert (=> b!1249035 (= res!833241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249036 () Bool)

(assert (=> b!1249036 (= e!708860 false)))

(declare-datatypes ((tuple2!20444 0))(
  ( (tuple2!20445 (_1!10233 (_ BitVec 64)) (_2!10233 V!47359)) )
))
(declare-datatypes ((List!27671 0))(
  ( (Nil!27668) (Cons!27667 (h!28876 tuple2!20444) (t!41133 List!27671)) )
))
(declare-datatypes ((ListLongMap!18317 0))(
  ( (ListLongMap!18318 (toList!9174 List!27671)) )
))
(declare-fun lt!563429 () ListLongMap!18317)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47359)

(declare-fun zeroValue!871 () V!47359)

(declare-fun getCurrentListMapNoExtraKeys!5591 (array!80589 array!80591 (_ BitVec 32) (_ BitVec 32) V!47359 V!47359 (_ BitVec 32) Int) ListLongMap!18317)

(assert (=> b!1249036 (= lt!563429 (getCurrentListMapNoExtraKeys!5591 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!47359)

(declare-fun lt!563428 () ListLongMap!18317)

(assert (=> b!1249036 (= lt!563428 (getCurrentListMapNoExtraKeys!5591 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49003 () Bool)

(declare-fun mapRes!49003 () Bool)

(declare-fun tp!93269 () Bool)

(declare-fun e!708861 () Bool)

(assert (=> mapNonEmpty!49003 (= mapRes!49003 (and tp!93269 e!708861))))

(declare-fun mapKey!49003 () (_ BitVec 32))

(declare-fun mapRest!49003 () (Array (_ BitVec 32) ValueCell!14984))

(declare-fun mapValue!49003 () ValueCell!14984)

(assert (=> mapNonEmpty!49003 (= (arr!38863 _values!914) (store mapRest!49003 mapKey!49003 mapValue!49003))))

(declare-fun res!833243 () Bool)

(assert (=> start!104784 (=> (not res!833243) (not e!708860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104784 (= res!833243 (validMask!0 mask!1466))))

(assert (=> start!104784 e!708860))

(assert (=> start!104784 true))

(assert (=> start!104784 tp!93268))

(declare-fun tp_is_empty!31495 () Bool)

(assert (=> start!104784 tp_is_empty!31495))

(declare-fun array_inv!29793 (array!80589) Bool)

(assert (=> start!104784 (array_inv!29793 _keys!1118)))

(declare-fun e!708858 () Bool)

(declare-fun array_inv!29794 (array!80591) Bool)

(assert (=> start!104784 (and (array_inv!29794 _values!914) e!708858)))

(declare-fun b!1249037 () Bool)

(declare-fun res!833242 () Bool)

(assert (=> b!1249037 (=> (not res!833242) (not e!708860))))

(declare-datatypes ((List!27672 0))(
  ( (Nil!27669) (Cons!27668 (h!28877 (_ BitVec 64)) (t!41134 List!27672)) )
))
(declare-fun arrayNoDuplicates!0 (array!80589 (_ BitVec 32) List!27672) Bool)

(assert (=> b!1249037 (= res!833242 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27669))))

(declare-fun b!1249038 () Bool)

(assert (=> b!1249038 (= e!708861 tp_is_empty!31495)))

(declare-fun mapIsEmpty!49003 () Bool)

(assert (=> mapIsEmpty!49003 mapRes!49003))

(declare-fun b!1249039 () Bool)

(declare-fun e!708862 () Bool)

(assert (=> b!1249039 (= e!708862 tp_is_empty!31495)))

(declare-fun b!1249040 () Bool)

(assert (=> b!1249040 (= e!708858 (and e!708862 mapRes!49003))))

(declare-fun condMapEmpty!49003 () Bool)

(declare-fun mapDefault!49003 () ValueCell!14984)

(assert (=> b!1249040 (= condMapEmpty!49003 (= (arr!38863 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14984)) mapDefault!49003)))))

(assert (= (and start!104784 res!833243) b!1249034))

(assert (= (and b!1249034 res!833240) b!1249035))

(assert (= (and b!1249035 res!833241) b!1249037))

(assert (= (and b!1249037 res!833242) b!1249036))

(assert (= (and b!1249040 condMapEmpty!49003) mapIsEmpty!49003))

(assert (= (and b!1249040 (not condMapEmpty!49003)) mapNonEmpty!49003))

(get-info :version)

(assert (= (and mapNonEmpty!49003 ((_ is ValueCellFull!14984) mapValue!49003)) b!1249038))

(assert (= (and b!1249040 ((_ is ValueCellFull!14984) mapDefault!49003)) b!1249039))

(assert (= start!104784 b!1249040))

(declare-fun m!1149583 () Bool)

(assert (=> b!1249037 m!1149583))

(declare-fun m!1149585 () Bool)

(assert (=> start!104784 m!1149585))

(declare-fun m!1149587 () Bool)

(assert (=> start!104784 m!1149587))

(declare-fun m!1149589 () Bool)

(assert (=> start!104784 m!1149589))

(declare-fun m!1149591 () Bool)

(assert (=> b!1249036 m!1149591))

(declare-fun m!1149593 () Bool)

(assert (=> b!1249036 m!1149593))

(declare-fun m!1149595 () Bool)

(assert (=> mapNonEmpty!49003 m!1149595))

(declare-fun m!1149597 () Bool)

(assert (=> b!1249035 m!1149597))

(check-sat (not mapNonEmpty!49003) (not b!1249035) b_and!44343 (not b_next!26593) (not b!1249036) tp_is_empty!31495 (not b!1249037) (not start!104784))
(check-sat b_and!44343 (not b_next!26593))
