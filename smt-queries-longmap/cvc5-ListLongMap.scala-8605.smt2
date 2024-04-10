; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104874 () Bool)

(assert start!104874)

(declare-fun b_free!26665 () Bool)

(declare-fun b_next!26665 () Bool)

(assert (=> start!104874 (= b_free!26665 (not b_next!26665))))

(declare-fun tp!93488 () Bool)

(declare-fun b_and!44441 () Bool)

(assert (=> start!104874 (= tp!93488 b_and!44441)))

(declare-fun res!833760 () Bool)

(declare-fun e!709515 () Bool)

(assert (=> start!104874 (=> (not res!833760) (not e!709515))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104874 (= res!833760 (validMask!0 mask!1466))))

(assert (=> start!104874 e!709515))

(assert (=> start!104874 true))

(assert (=> start!104874 tp!93488))

(declare-fun tp_is_empty!31567 () Bool)

(assert (=> start!104874 tp_is_empty!31567))

(declare-datatypes ((array!80804 0))(
  ( (array!80805 (arr!38968 (Array (_ BitVec 32) (_ BitVec 64))) (size!39504 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80804)

(declare-fun array_inv!29733 (array!80804) Bool)

(assert (=> start!104874 (array_inv!29733 _keys!1118)))

(declare-datatypes ((V!47455 0))(
  ( (V!47456 (val!15846 Int)) )
))
(declare-datatypes ((ValueCell!15020 0))(
  ( (ValueCellFull!15020 (v!18542 V!47455)) (EmptyCell!15020) )
))
(declare-datatypes ((array!80806 0))(
  ( (array!80807 (arr!38969 (Array (_ BitVec 32) ValueCell!15020)) (size!39505 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80806)

(declare-fun e!709511 () Bool)

(declare-fun array_inv!29734 (array!80806) Bool)

(assert (=> start!104874 (and (array_inv!29734 _values!914) e!709511)))

(declare-fun b!1249970 () Bool)

(declare-fun res!833757 () Bool)

(assert (=> b!1249970 (=> (not res!833757) (not e!709515))))

(declare-datatypes ((List!27652 0))(
  ( (Nil!27649) (Cons!27648 (h!28857 (_ BitVec 64)) (t!41125 List!27652)) )
))
(declare-fun arrayNoDuplicates!0 (array!80804 (_ BitVec 32) List!27652) Bool)

(assert (=> b!1249970 (= res!833757 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27649))))

(declare-fun b!1249971 () Bool)

(declare-fun res!833761 () Bool)

(assert (=> b!1249971 (=> (not res!833761) (not e!709515))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249971 (= res!833761 (and (= (size!39505 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39504 _keys!1118) (size!39505 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249972 () Bool)

(declare-fun res!833758 () Bool)

(assert (=> b!1249972 (=> (not res!833758) (not e!709515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80804 (_ BitVec 32)) Bool)

(assert (=> b!1249972 (= res!833758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249973 () Bool)

(declare-fun e!709514 () Bool)

(assert (=> b!1249973 (= e!709515 (not e!709514))))

(declare-fun res!833756 () Bool)

(assert (=> b!1249973 (=> res!833756 e!709514)))

(assert (=> b!1249973 (= res!833756 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20408 0))(
  ( (tuple2!20409 (_1!10215 (_ BitVec 64)) (_2!10215 V!47455)) )
))
(declare-datatypes ((List!27653 0))(
  ( (Nil!27650) (Cons!27649 (h!28858 tuple2!20408) (t!41126 List!27653)) )
))
(declare-datatypes ((ListLongMap!18281 0))(
  ( (ListLongMap!18282 (toList!9156 List!27653)) )
))
(declare-fun lt!563968 () ListLongMap!18281)

(declare-fun lt!563972 () ListLongMap!18281)

(assert (=> b!1249973 (= lt!563968 lt!563972)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47455)

(declare-fun zeroValue!871 () V!47455)

(declare-fun minValueBefore!43 () V!47455)

(declare-datatypes ((Unit!41509 0))(
  ( (Unit!41510) )
))
(declare-fun lt!563969 () Unit!41509)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!927 (array!80804 array!80806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 V!47455 V!47455 (_ BitVec 32) Int) Unit!41509)

(assert (=> b!1249973 (= lt!563969 (lemmaNoChangeToArrayThenSameMapNoExtras!927 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5563 (array!80804 array!80806 (_ BitVec 32) (_ BitVec 32) V!47455 V!47455 (_ BitVec 32) Int) ListLongMap!18281)

(assert (=> b!1249973 (= lt!563972 (getCurrentListMapNoExtraKeys!5563 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249973 (= lt!563968 (getCurrentListMapNoExtraKeys!5563 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249974 () Bool)

(declare-fun e!709512 () Bool)

(assert (=> b!1249974 (= e!709512 tp_is_empty!31567)))

(declare-fun b!1249975 () Bool)

(declare-fun e!709517 () Bool)

(assert (=> b!1249975 (= e!709517 true)))

(declare-fun lt!563971 () ListLongMap!18281)

(declare-fun -!1988 (ListLongMap!18281 (_ BitVec 64)) ListLongMap!18281)

(assert (=> b!1249975 (= (-!1988 lt!563971 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563971)))

(declare-fun lt!563970 () Unit!41509)

(declare-fun removeNotPresentStillSame!83 (ListLongMap!18281 (_ BitVec 64)) Unit!41509)

(assert (=> b!1249975 (= lt!563970 (removeNotPresentStillSame!83 lt!563971 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!49114 () Bool)

(declare-fun mapRes!49114 () Bool)

(declare-fun tp!93487 () Bool)

(declare-fun e!709513 () Bool)

(assert (=> mapNonEmpty!49114 (= mapRes!49114 (and tp!93487 e!709513))))

(declare-fun mapKey!49114 () (_ BitVec 32))

(declare-fun mapRest!49114 () (Array (_ BitVec 32) ValueCell!15020))

(declare-fun mapValue!49114 () ValueCell!15020)

(assert (=> mapNonEmpty!49114 (= (arr!38969 _values!914) (store mapRest!49114 mapKey!49114 mapValue!49114))))

(declare-fun b!1249976 () Bool)

(assert (=> b!1249976 (= e!709511 (and e!709512 mapRes!49114))))

(declare-fun condMapEmpty!49114 () Bool)

(declare-fun mapDefault!49114 () ValueCell!15020)

