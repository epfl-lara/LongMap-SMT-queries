; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104700 () Bool)

(assert start!104700)

(declare-fun b_free!26521 () Bool)

(declare-fun b_next!26521 () Bool)

(assert (=> start!104700 (= b_free!26521 (not b_next!26521))))

(declare-fun tp!93049 () Bool)

(declare-fun b_and!44267 () Bool)

(assert (=> start!104700 (= tp!93049 b_and!44267)))

(declare-fun mapIsEmpty!48892 () Bool)

(declare-fun mapRes!48892 () Bool)

(assert (=> mapIsEmpty!48892 mapRes!48892))

(declare-fun b!1248205 () Bool)

(declare-fun e!708270 () Bool)

(declare-fun tp_is_empty!31423 () Bool)

(assert (=> b!1248205 (= e!708270 tp_is_empty!31423)))

(declare-fun mapNonEmpty!48892 () Bool)

(declare-fun tp!93050 () Bool)

(declare-fun e!708272 () Bool)

(assert (=> mapNonEmpty!48892 (= mapRes!48892 (and tp!93050 e!708272))))

(declare-fun mapKey!48892 () (_ BitVec 32))

(declare-datatypes ((V!47263 0))(
  ( (V!47264 (val!15774 Int)) )
))
(declare-datatypes ((ValueCell!14948 0))(
  ( (ValueCellFull!14948 (v!18469 V!47263)) (EmptyCell!14948) )
))
(declare-fun mapRest!48892 () (Array (_ BitVec 32) ValueCell!14948))

(declare-fun mapValue!48892 () ValueCell!14948)

(declare-datatypes ((array!80453 0))(
  ( (array!80454 (arr!38795 (Array (_ BitVec 32) ValueCell!14948)) (size!39333 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80453)

(assert (=> mapNonEmpty!48892 (= (arr!38795 _values!914) (store mapRest!48892 mapKey!48892 mapValue!48892))))

(declare-fun b!1248207 () Bool)

(declare-fun res!832783 () Bool)

(declare-fun e!708273 () Bool)

(assert (=> b!1248207 (=> (not res!832783) (not e!708273))))

(declare-datatypes ((array!80455 0))(
  ( (array!80456 (arr!38796 (Array (_ BitVec 32) (_ BitVec 64))) (size!39334 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80455)

(declare-datatypes ((List!27627 0))(
  ( (Nil!27624) (Cons!27623 (h!28832 (_ BitVec 64)) (t!41087 List!27627)) )
))
(declare-fun arrayNoDuplicates!0 (array!80455 (_ BitVec 32) List!27627) Bool)

(assert (=> b!1248207 (= res!832783 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27624))))

(declare-fun b!1248208 () Bool)

(assert (=> b!1248208 (= e!708272 tp_is_empty!31423)))

(declare-fun b!1248209 () Bool)

(assert (=> b!1248209 (= e!708273 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47263)

(declare-datatypes ((tuple2!20398 0))(
  ( (tuple2!20399 (_1!10210 (_ BitVec 64)) (_2!10210 V!47263)) )
))
(declare-datatypes ((List!27628 0))(
  ( (Nil!27625) (Cons!27624 (h!28833 tuple2!20398) (t!41088 List!27628)) )
))
(declare-datatypes ((ListLongMap!18271 0))(
  ( (ListLongMap!18272 (toList!9151 List!27628)) )
))
(declare-fun lt!563207 () ListLongMap!18271)

(declare-fun minValueBefore!43 () V!47263)

(declare-fun getCurrentListMapNoExtraKeys!5568 (array!80455 array!80453 (_ BitVec 32) (_ BitVec 32) V!47263 V!47263 (_ BitVec 32) Int) ListLongMap!18271)

(assert (=> b!1248209 (= lt!563207 (getCurrentListMapNoExtraKeys!5568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248210 () Bool)

(declare-fun e!708271 () Bool)

(assert (=> b!1248210 (= e!708271 (and e!708270 mapRes!48892))))

(declare-fun condMapEmpty!48892 () Bool)

(declare-fun mapDefault!48892 () ValueCell!14948)

(assert (=> b!1248210 (= condMapEmpty!48892 (= (arr!38795 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14948)) mapDefault!48892)))))

(declare-fun b!1248211 () Bool)

(declare-fun res!832784 () Bool)

(assert (=> b!1248211 (=> (not res!832784) (not e!708273))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248211 (= res!832784 (and (= (size!39333 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39334 _keys!1118) (size!39333 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!832782 () Bool)

(assert (=> start!104700 (=> (not res!832782) (not e!708273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104700 (= res!832782 (validMask!0 mask!1466))))

(assert (=> start!104700 e!708273))

(assert (=> start!104700 true))

(assert (=> start!104700 tp!93049))

(assert (=> start!104700 tp_is_empty!31423))

(declare-fun array_inv!29743 (array!80455) Bool)

(assert (=> start!104700 (array_inv!29743 _keys!1118)))

(declare-fun array_inv!29744 (array!80453) Bool)

(assert (=> start!104700 (and (array_inv!29744 _values!914) e!708271)))

(declare-fun b!1248206 () Bool)

(declare-fun res!832781 () Bool)

(assert (=> b!1248206 (=> (not res!832781) (not e!708273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80455 (_ BitVec 32)) Bool)

(assert (=> b!1248206 (= res!832781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104700 res!832782) b!1248211))

(assert (= (and b!1248211 res!832784) b!1248206))

(assert (= (and b!1248206 res!832781) b!1248207))

(assert (= (and b!1248207 res!832783) b!1248209))

(assert (= (and b!1248210 condMapEmpty!48892) mapIsEmpty!48892))

(assert (= (and b!1248210 (not condMapEmpty!48892)) mapNonEmpty!48892))

(get-info :version)

(assert (= (and mapNonEmpty!48892 ((_ is ValueCellFull!14948) mapValue!48892)) b!1248208))

(assert (= (and b!1248210 ((_ is ValueCellFull!14948) mapDefault!48892)) b!1248205))

(assert (= start!104700 b!1248210))

(declare-fun m!1148981 () Bool)

(assert (=> b!1248207 m!1148981))

(declare-fun m!1148983 () Bool)

(assert (=> mapNonEmpty!48892 m!1148983))

(declare-fun m!1148985 () Bool)

(assert (=> b!1248206 m!1148985))

(declare-fun m!1148987 () Bool)

(assert (=> b!1248209 m!1148987))

(declare-fun m!1148989 () Bool)

(assert (=> start!104700 m!1148989))

(declare-fun m!1148991 () Bool)

(assert (=> start!104700 m!1148991))

(declare-fun m!1148993 () Bool)

(assert (=> start!104700 m!1148993))

(check-sat (not b_next!26521) b_and!44267 tp_is_empty!31423 (not b!1248207) (not b!1248209) (not mapNonEmpty!48892) (not b!1248206) (not start!104700))
(check-sat b_and!44267 (not b_next!26521))
