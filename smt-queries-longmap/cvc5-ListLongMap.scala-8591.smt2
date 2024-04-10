; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104776 () Bool)

(assert start!104776)

(declare-fun b_free!26581 () Bool)

(declare-fun b_next!26581 () Bool)

(assert (=> start!104776 (= b_free!26581 (not b_next!26581))))

(declare-fun tp!93232 () Bool)

(declare-fun b_and!44349 () Bool)

(assert (=> start!104776 (= tp!93232 b_and!44349)))

(declare-fun b!1248990 () Bool)

(declare-fun e!708815 () Bool)

(assert (=> b!1248990 (= e!708815 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47343 0))(
  ( (V!47344 (val!15804 Int)) )
))
(declare-fun minValueAfter!43 () V!47343)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47343)

(declare-datatypes ((array!80652 0))(
  ( (array!80653 (arr!38893 (Array (_ BitVec 32) (_ BitVec 64))) (size!39429 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80652)

(declare-datatypes ((ValueCell!14978 0))(
  ( (ValueCellFull!14978 (v!18500 V!47343)) (EmptyCell!14978) )
))
(declare-datatypes ((array!80654 0))(
  ( (array!80655 (arr!38894 (Array (_ BitVec 32) ValueCell!14978)) (size!39430 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80654)

(declare-datatypes ((tuple2!20356 0))(
  ( (tuple2!20357 (_1!10189 (_ BitVec 64)) (_2!10189 V!47343)) )
))
(declare-datatypes ((List!27603 0))(
  ( (Nil!27600) (Cons!27599 (h!28808 tuple2!20356) (t!41074 List!27603)) )
))
(declare-datatypes ((ListLongMap!18229 0))(
  ( (ListLongMap!18230 (toList!9130 List!27603)) )
))
(declare-fun lt!563571 () ListLongMap!18229)

(declare-fun getCurrentListMapNoExtraKeys!5537 (array!80652 array!80654 (_ BitVec 32) (_ BitVec 32) V!47343 V!47343 (_ BitVec 32) Int) ListLongMap!18229)

(assert (=> b!1248990 (= lt!563571 (getCurrentListMapNoExtraKeys!5537 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563572 () ListLongMap!18229)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47343)

(assert (=> b!1248990 (= lt!563572 (getCurrentListMapNoExtraKeys!5537 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48985 () Bool)

(declare-fun mapRes!48985 () Bool)

(declare-fun tp!93233 () Bool)

(declare-fun e!708813 () Bool)

(assert (=> mapNonEmpty!48985 (= mapRes!48985 (and tp!93233 e!708813))))

(declare-fun mapKey!48985 () (_ BitVec 32))

(declare-fun mapValue!48985 () ValueCell!14978)

(declare-fun mapRest!48985 () (Array (_ BitVec 32) ValueCell!14978))

(assert (=> mapNonEmpty!48985 (= (arr!38894 _values!914) (store mapRest!48985 mapKey!48985 mapValue!48985))))

(declare-fun b!1248991 () Bool)

(declare-fun res!833210 () Bool)

(assert (=> b!1248991 (=> (not res!833210) (not e!708815))))

(assert (=> b!1248991 (= res!833210 (and (= (size!39430 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39429 _keys!1118) (size!39430 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48985 () Bool)

(assert (=> mapIsEmpty!48985 mapRes!48985))

(declare-fun res!833208 () Bool)

(assert (=> start!104776 (=> (not res!833208) (not e!708815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104776 (= res!833208 (validMask!0 mask!1466))))

(assert (=> start!104776 e!708815))

(assert (=> start!104776 true))

(assert (=> start!104776 tp!93232))

(declare-fun tp_is_empty!31483 () Bool)

(assert (=> start!104776 tp_is_empty!31483))

(declare-fun array_inv!29681 (array!80652) Bool)

(assert (=> start!104776 (array_inv!29681 _keys!1118)))

(declare-fun e!708814 () Bool)

(declare-fun array_inv!29682 (array!80654) Bool)

(assert (=> start!104776 (and (array_inv!29682 _values!914) e!708814)))

(declare-fun b!1248992 () Bool)

(declare-fun e!708816 () Bool)

(assert (=> b!1248992 (= e!708816 tp_is_empty!31483)))

(declare-fun b!1248993 () Bool)

(declare-fun res!833209 () Bool)

(assert (=> b!1248993 (=> (not res!833209) (not e!708815))))

(declare-datatypes ((List!27604 0))(
  ( (Nil!27601) (Cons!27600 (h!28809 (_ BitVec 64)) (t!41075 List!27604)) )
))
(declare-fun arrayNoDuplicates!0 (array!80652 (_ BitVec 32) List!27604) Bool)

(assert (=> b!1248993 (= res!833209 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27601))))

(declare-fun b!1248994 () Bool)

(assert (=> b!1248994 (= e!708813 tp_is_empty!31483)))

(declare-fun b!1248995 () Bool)

(declare-fun res!833211 () Bool)

(assert (=> b!1248995 (=> (not res!833211) (not e!708815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80652 (_ BitVec 32)) Bool)

(assert (=> b!1248995 (= res!833211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248996 () Bool)

(assert (=> b!1248996 (= e!708814 (and e!708816 mapRes!48985))))

(declare-fun condMapEmpty!48985 () Bool)

(declare-fun mapDefault!48985 () ValueCell!14978)

