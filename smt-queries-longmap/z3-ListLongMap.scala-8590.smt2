; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104772 () Bool)

(assert start!104772)

(declare-fun b_free!26577 () Bool)

(declare-fun b_next!26577 () Bool)

(assert (=> start!104772 (= b_free!26577 (not b_next!26577))))

(declare-fun tp!93221 () Bool)

(declare-fun b_and!44345 () Bool)

(assert (=> start!104772 (= tp!93221 b_and!44345)))

(declare-fun res!833187 () Bool)

(declare-fun e!708783 () Bool)

(assert (=> start!104772 (=> (not res!833187) (not e!708783))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104772 (= res!833187 (validMask!0 mask!1466))))

(assert (=> start!104772 e!708783))

(assert (=> start!104772 true))

(assert (=> start!104772 tp!93221))

(declare-fun tp_is_empty!31479 () Bool)

(assert (=> start!104772 tp_is_empty!31479))

(declare-datatypes ((array!80644 0))(
  ( (array!80645 (arr!38889 (Array (_ BitVec 32) (_ BitVec 64))) (size!39425 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80644)

(declare-fun array_inv!29677 (array!80644) Bool)

(assert (=> start!104772 (array_inv!29677 _keys!1118)))

(declare-datatypes ((V!47337 0))(
  ( (V!47338 (val!15802 Int)) )
))
(declare-datatypes ((ValueCell!14976 0))(
  ( (ValueCellFull!14976 (v!18498 V!47337)) (EmptyCell!14976) )
))
(declare-datatypes ((array!80646 0))(
  ( (array!80647 (arr!38890 (Array (_ BitVec 32) ValueCell!14976)) (size!39426 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80646)

(declare-fun e!708784 () Bool)

(declare-fun array_inv!29678 (array!80646) Bool)

(assert (=> start!104772 (and (array_inv!29678 _values!914) e!708784)))

(declare-fun b!1248948 () Bool)

(declare-fun e!708785 () Bool)

(assert (=> b!1248948 (= e!708785 tp_is_empty!31479)))

(declare-fun b!1248949 () Bool)

(declare-fun e!708787 () Bool)

(declare-fun mapRes!48979 () Bool)

(assert (=> b!1248949 (= e!708784 (and e!708787 mapRes!48979))))

(declare-fun condMapEmpty!48979 () Bool)

(declare-fun mapDefault!48979 () ValueCell!14976)

(assert (=> b!1248949 (= condMapEmpty!48979 (= (arr!38890 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14976)) mapDefault!48979)))))

(declare-fun b!1248950 () Bool)

(declare-fun res!833186 () Bool)

(assert (=> b!1248950 (=> (not res!833186) (not e!708783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80644 (_ BitVec 32)) Bool)

(assert (=> b!1248950 (= res!833186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248951 () Bool)

(declare-fun res!833184 () Bool)

(assert (=> b!1248951 (=> (not res!833184) (not e!708783))))

(declare-datatypes ((List!27599 0))(
  ( (Nil!27596) (Cons!27595 (h!28804 (_ BitVec 64)) (t!41070 List!27599)) )
))
(declare-fun arrayNoDuplicates!0 (array!80644 (_ BitVec 32) List!27599) Bool)

(assert (=> b!1248951 (= res!833184 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27596))))

(declare-fun mapIsEmpty!48979 () Bool)

(assert (=> mapIsEmpty!48979 mapRes!48979))

(declare-fun b!1248952 () Bool)

(assert (=> b!1248952 (= e!708783 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47337)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47337)

(declare-datatypes ((tuple2!20352 0))(
  ( (tuple2!20353 (_1!10187 (_ BitVec 64)) (_2!10187 V!47337)) )
))
(declare-datatypes ((List!27600 0))(
  ( (Nil!27597) (Cons!27596 (h!28805 tuple2!20352) (t!41071 List!27600)) )
))
(declare-datatypes ((ListLongMap!18225 0))(
  ( (ListLongMap!18226 (toList!9128 List!27600)) )
))
(declare-fun lt!563560 () ListLongMap!18225)

(declare-fun getCurrentListMapNoExtraKeys!5535 (array!80644 array!80646 (_ BitVec 32) (_ BitVec 32) V!47337 V!47337 (_ BitVec 32) Int) ListLongMap!18225)

(assert (=> b!1248952 (= lt!563560 (getCurrentListMapNoExtraKeys!5535 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563559 () ListLongMap!18225)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47337)

(assert (=> b!1248952 (= lt!563559 (getCurrentListMapNoExtraKeys!5535 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248953 () Bool)

(assert (=> b!1248953 (= e!708787 tp_is_empty!31479)))

(declare-fun b!1248954 () Bool)

(declare-fun res!833185 () Bool)

(assert (=> b!1248954 (=> (not res!833185) (not e!708783))))

(assert (=> b!1248954 (= res!833185 (and (= (size!39426 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39425 _keys!1118) (size!39426 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48979 () Bool)

(declare-fun tp!93220 () Bool)

(assert (=> mapNonEmpty!48979 (= mapRes!48979 (and tp!93220 e!708785))))

(declare-fun mapKey!48979 () (_ BitVec 32))

(declare-fun mapRest!48979 () (Array (_ BitVec 32) ValueCell!14976))

(declare-fun mapValue!48979 () ValueCell!14976)

(assert (=> mapNonEmpty!48979 (= (arr!38890 _values!914) (store mapRest!48979 mapKey!48979 mapValue!48979))))

(assert (= (and start!104772 res!833187) b!1248954))

(assert (= (and b!1248954 res!833185) b!1248950))

(assert (= (and b!1248950 res!833186) b!1248951))

(assert (= (and b!1248951 res!833184) b!1248952))

(assert (= (and b!1248949 condMapEmpty!48979) mapIsEmpty!48979))

(assert (= (and b!1248949 (not condMapEmpty!48979)) mapNonEmpty!48979))

(get-info :version)

(assert (= (and mapNonEmpty!48979 ((_ is ValueCellFull!14976) mapValue!48979)) b!1248948))

(assert (= (and b!1248949 ((_ is ValueCellFull!14976) mapDefault!48979)) b!1248953))

(assert (= start!104772 b!1248949))

(declare-fun m!1149975 () Bool)

(assert (=> b!1248951 m!1149975))

(declare-fun m!1149977 () Bool)

(assert (=> start!104772 m!1149977))

(declare-fun m!1149979 () Bool)

(assert (=> start!104772 m!1149979))

(declare-fun m!1149981 () Bool)

(assert (=> start!104772 m!1149981))

(declare-fun m!1149983 () Bool)

(assert (=> mapNonEmpty!48979 m!1149983))

(declare-fun m!1149985 () Bool)

(assert (=> b!1248950 m!1149985))

(declare-fun m!1149987 () Bool)

(assert (=> b!1248952 m!1149987))

(declare-fun m!1149989 () Bool)

(assert (=> b!1248952 m!1149989))

(check-sat (not b!1248950) (not b!1248952) (not b_next!26577) (not start!104772) tp_is_empty!31479 (not b!1248951) (not mapNonEmpty!48979) b_and!44345)
(check-sat b_and!44345 (not b_next!26577))
