; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105808 () Bool)

(assert start!105808)

(declare-fun b_free!27371 () Bool)

(declare-fun b_next!27371 () Bool)

(assert (=> start!105808 (= b_free!27371 (not b_next!27371))))

(declare-fun tp!95641 () Bool)

(declare-fun b_and!45267 () Bool)

(assert (=> start!105808 (= tp!95641 b_and!45267)))

(declare-fun mapIsEmpty!50209 () Bool)

(declare-fun mapRes!50209 () Bool)

(assert (=> mapIsEmpty!50209 mapRes!50209))

(declare-fun b!1260417 () Bool)

(declare-fun res!839997 () Bool)

(declare-fun e!717218 () Bool)

(assert (=> b!1260417 (=> (not res!839997) (not e!717218))))

(declare-datatypes ((array!82164 0))(
  ( (array!82165 (arr!39636 (Array (_ BitVec 32) (_ BitVec 64))) (size!40172 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82164)

(declare-datatypes ((List!28156 0))(
  ( (Nil!28153) (Cons!28152 (h!29361 (_ BitVec 64)) (t!41653 List!28156)) )
))
(declare-fun arrayNoDuplicates!0 (array!82164 (_ BitVec 32) List!28156) Bool)

(assert (=> b!1260417 (= res!839997 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28153))))

(declare-fun b!1260418 () Bool)

(declare-fun e!717222 () Bool)

(assert (=> b!1260418 (= e!717222 true)))

(declare-datatypes ((V!48395 0))(
  ( (V!48396 (val!16199 Int)) )
))
(declare-datatypes ((tuple2!20958 0))(
  ( (tuple2!20959 (_1!10490 (_ BitVec 64)) (_2!10490 V!48395)) )
))
(declare-datatypes ((List!28157 0))(
  ( (Nil!28154) (Cons!28153 (h!29362 tuple2!20958) (t!41654 List!28157)) )
))
(declare-datatypes ((ListLongMap!18831 0))(
  ( (ListLongMap!18832 (toList!9431 List!28157)) )
))
(declare-fun lt!571096 () ListLongMap!18831)

(declare-fun lt!571093 () ListLongMap!18831)

(declare-fun -!2135 (ListLongMap!18831 (_ BitVec 64)) ListLongMap!18831)

(assert (=> b!1260418 (= lt!571096 (-!2135 lt!571093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571099 () ListLongMap!18831)

(declare-fun lt!571102 () ListLongMap!18831)

(assert (=> b!1260418 (= (-!2135 lt!571099 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571102)))

(declare-datatypes ((Unit!42045 0))(
  ( (Unit!42046) )
))
(declare-fun lt!571097 () Unit!42045)

(declare-fun minValueBefore!43 () V!48395)

(declare-fun addThenRemoveForNewKeyIsSame!372 (ListLongMap!18831 (_ BitVec 64) V!48395) Unit!42045)

(assert (=> b!1260418 (= lt!571097 (addThenRemoveForNewKeyIsSame!372 lt!571102 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717223 () Bool)

(assert (=> b!1260418 e!717223))

(declare-fun res!839994 () Bool)

(assert (=> b!1260418 (=> (not res!839994) (not e!717223))))

(assert (=> b!1260418 (= res!839994 (= lt!571093 lt!571099))))

(declare-fun +!4234 (ListLongMap!18831 tuple2!20958) ListLongMap!18831)

(assert (=> b!1260418 (= lt!571099 (+!4234 lt!571102 (tuple2!20959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571098 () ListLongMap!18831)

(declare-fun lt!571094 () tuple2!20958)

(assert (=> b!1260418 (= lt!571102 (+!4234 lt!571098 lt!571094))))

(declare-fun zeroValue!871 () V!48395)

(assert (=> b!1260418 (= lt!571094 (tuple2!20959 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48395)

(declare-datatypes ((ValueCell!15373 0))(
  ( (ValueCellFull!15373 (v!18902 V!48395)) (EmptyCell!15373) )
))
(declare-datatypes ((array!82166 0))(
  ( (array!82167 (arr!39637 (Array (_ BitVec 32) ValueCell!15373)) (size!40173 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82166)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!571095 () ListLongMap!18831)

(declare-fun getCurrentListMap!4626 (array!82164 array!82166 (_ BitVec 32) (_ BitVec 32) V!48395 V!48395 (_ BitVec 32) Int) ListLongMap!18831)

(assert (=> b!1260418 (= lt!571095 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260418 (= lt!571093 (getCurrentListMap!4626 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260419 () Bool)

(declare-fun res!839995 () Bool)

(assert (=> b!1260419 (=> (not res!839995) (not e!717218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82164 (_ BitVec 32)) Bool)

(assert (=> b!1260419 (= res!839995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260420 () Bool)

(declare-fun e!717221 () Bool)

(declare-fun e!717217 () Bool)

(assert (=> b!1260420 (= e!717221 (and e!717217 mapRes!50209))))

(declare-fun condMapEmpty!50209 () Bool)

(declare-fun mapDefault!50209 () ValueCell!15373)

