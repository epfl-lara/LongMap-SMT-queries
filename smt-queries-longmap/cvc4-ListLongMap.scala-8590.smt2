; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104774 () Bool)

(assert start!104774)

(declare-fun b_free!26579 () Bool)

(declare-fun b_next!26579 () Bool)

(assert (=> start!104774 (= b_free!26579 (not b_next!26579))))

(declare-fun tp!93226 () Bool)

(declare-fun b_and!44347 () Bool)

(assert (=> start!104774 (= tp!93226 b_and!44347)))

(declare-fun b!1248969 () Bool)

(declare-fun res!833198 () Bool)

(declare-fun e!708798 () Bool)

(assert (=> b!1248969 (=> (not res!833198) (not e!708798))))

(declare-datatypes ((array!80648 0))(
  ( (array!80649 (arr!38891 (Array (_ BitVec 32) (_ BitVec 64))) (size!39427 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80648)

(declare-datatypes ((List!27601 0))(
  ( (Nil!27598) (Cons!27597 (h!28806 (_ BitVec 64)) (t!41072 List!27601)) )
))
(declare-fun arrayNoDuplicates!0 (array!80648 (_ BitVec 32) List!27601) Bool)

(assert (=> b!1248969 (= res!833198 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27598))))

(declare-fun b!1248970 () Bool)

(assert (=> b!1248970 (= e!708798 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((V!47339 0))(
  ( (V!47340 (val!15803 Int)) )
))
(declare-fun minValueAfter!43 () V!47339)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47339)

(declare-datatypes ((ValueCell!14977 0))(
  ( (ValueCellFull!14977 (v!18499 V!47339)) (EmptyCell!14977) )
))
(declare-datatypes ((array!80650 0))(
  ( (array!80651 (arr!38892 (Array (_ BitVec 32) ValueCell!14977)) (size!39428 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80650)

(declare-datatypes ((tuple2!20354 0))(
  ( (tuple2!20355 (_1!10188 (_ BitVec 64)) (_2!10188 V!47339)) )
))
(declare-datatypes ((List!27602 0))(
  ( (Nil!27599) (Cons!27598 (h!28807 tuple2!20354) (t!41073 List!27602)) )
))
(declare-datatypes ((ListLongMap!18227 0))(
  ( (ListLongMap!18228 (toList!9129 List!27602)) )
))
(declare-fun lt!563566 () ListLongMap!18227)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5536 (array!80648 array!80650 (_ BitVec 32) (_ BitVec 32) V!47339 V!47339 (_ BitVec 32) Int) ListLongMap!18227)

(assert (=> b!1248970 (= lt!563566 (getCurrentListMapNoExtraKeys!5536 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563565 () ListLongMap!18227)

(declare-fun minValueBefore!43 () V!47339)

(assert (=> b!1248970 (= lt!563565 (getCurrentListMapNoExtraKeys!5536 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248971 () Bool)

(declare-fun res!833196 () Bool)

(assert (=> b!1248971 (=> (not res!833196) (not e!708798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80648 (_ BitVec 32)) Bool)

(assert (=> b!1248971 (= res!833196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833197 () Bool)

(assert (=> start!104774 (=> (not res!833197) (not e!708798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104774 (= res!833197 (validMask!0 mask!1466))))

(assert (=> start!104774 e!708798))

(assert (=> start!104774 true))

(assert (=> start!104774 tp!93226))

(declare-fun tp_is_empty!31481 () Bool)

(assert (=> start!104774 tp_is_empty!31481))

(declare-fun array_inv!29679 (array!80648) Bool)

(assert (=> start!104774 (array_inv!29679 _keys!1118)))

(declare-fun e!708801 () Bool)

(declare-fun array_inv!29680 (array!80650) Bool)

(assert (=> start!104774 (and (array_inv!29680 _values!914) e!708801)))

(declare-fun b!1248972 () Bool)

(declare-fun res!833199 () Bool)

(assert (=> b!1248972 (=> (not res!833199) (not e!708798))))

(assert (=> b!1248972 (= res!833199 (and (= (size!39428 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39427 _keys!1118) (size!39428 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248973 () Bool)

(declare-fun e!708799 () Bool)

(declare-fun mapRes!48982 () Bool)

(assert (=> b!1248973 (= e!708801 (and e!708799 mapRes!48982))))

(declare-fun condMapEmpty!48982 () Bool)

(declare-fun mapDefault!48982 () ValueCell!14977)

