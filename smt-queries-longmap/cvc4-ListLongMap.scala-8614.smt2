; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104954 () Bool)

(assert start!104954)

(declare-fun b_free!26723 () Bool)

(declare-fun b_next!26723 () Bool)

(assert (=> start!104954 (= b_free!26723 (not b_next!26723))))

(declare-fun tp!93665 () Bool)

(declare-fun b_and!44509 () Bool)

(assert (=> start!104954 (= tp!93665 b_and!44509)))

(declare-fun b!1250910 () Bool)

(declare-fun e!710225 () Bool)

(assert (=> b!1250910 (= e!710225 true)))

(declare-datatypes ((V!47531 0))(
  ( (V!47532 (val!15875 Int)) )
))
(declare-datatypes ((tuple2!20460 0))(
  ( (tuple2!20461 (_1!10241 (_ BitVec 64)) (_2!10241 V!47531)) )
))
(declare-datatypes ((List!27698 0))(
  ( (Nil!27695) (Cons!27694 (h!28903 tuple2!20460) (t!41173 List!27698)) )
))
(declare-datatypes ((ListLongMap!18333 0))(
  ( (ListLongMap!18334 (toList!9182 List!27698)) )
))
(declare-fun lt!564529 () ListLongMap!18333)

(declare-fun -!2006 (ListLongMap!18333 (_ BitVec 64)) ListLongMap!18333)

(assert (=> b!1250910 (= (-!2006 lt!564529 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564529)))

(declare-datatypes ((Unit!41555 0))(
  ( (Unit!41556) )
))
(declare-fun lt!564530 () Unit!41555)

(declare-fun removeNotPresentStillSame!101 (ListLongMap!18333 (_ BitVec 64)) Unit!41555)

(assert (=> b!1250910 (= lt!564530 (removeNotPresentStillSame!101 lt!564529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250912 () Bool)

(declare-fun e!710224 () Bool)

(assert (=> b!1250912 (= e!710224 e!710225)))

(declare-fun res!834342 () Bool)

(assert (=> b!1250912 (=> res!834342 e!710225)))

(declare-fun contains!7495 (ListLongMap!18333 (_ BitVec 64)) Bool)

(assert (=> b!1250912 (= res!834342 (contains!7495 lt!564529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47531)

(declare-datatypes ((array!80918 0))(
  ( (array!80919 (arr!39024 (Array (_ BitVec 32) (_ BitVec 64))) (size!39560 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80918)

(declare-datatypes ((ValueCell!15049 0))(
  ( (ValueCellFull!15049 (v!18572 V!47531)) (EmptyCell!15049) )
))
(declare-datatypes ((array!80920 0))(
  ( (array!80921 (arr!39025 (Array (_ BitVec 32) ValueCell!15049)) (size!39561 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80920)

(declare-fun minValueBefore!43 () V!47531)

(declare-fun getCurrentListMap!4455 (array!80918 array!80920 (_ BitVec 32) (_ BitVec 32) V!47531 V!47531 (_ BitVec 32) Int) ListLongMap!18333)

(assert (=> b!1250912 (= lt!564529 (getCurrentListMap!4455 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250913 () Bool)

(declare-fun res!834341 () Bool)

(declare-fun e!710222 () Bool)

(assert (=> b!1250913 (=> (not res!834341) (not e!710222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80918 (_ BitVec 32)) Bool)

(assert (=> b!1250913 (= res!834341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250914 () Bool)

(declare-fun res!834343 () Bool)

(assert (=> b!1250914 (=> (not res!834343) (not e!710222))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250914 (= res!834343 (and (= (size!39561 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39560 _keys!1118) (size!39561 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49204 () Bool)

(declare-fun mapRes!49204 () Bool)

(assert (=> mapIsEmpty!49204 mapRes!49204))

(declare-fun b!1250915 () Bool)

(assert (=> b!1250915 (= e!710222 (not e!710224))))

(declare-fun res!834339 () Bool)

(assert (=> b!1250915 (=> res!834339 e!710224)))

(assert (=> b!1250915 (= res!834339 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564528 () ListLongMap!18333)

(declare-fun lt!564527 () ListLongMap!18333)

(assert (=> b!1250915 (= lt!564528 lt!564527)))

(declare-fun lt!564531 () Unit!41555)

(declare-fun minValueAfter!43 () V!47531)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!946 (array!80918 array!80920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47531 V!47531 V!47531 V!47531 (_ BitVec 32) Int) Unit!41555)

(assert (=> b!1250915 (= lt!564531 (lemmaNoChangeToArrayThenSameMapNoExtras!946 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5582 (array!80918 array!80920 (_ BitVec 32) (_ BitVec 32) V!47531 V!47531 (_ BitVec 32) Int) ListLongMap!18333)

(assert (=> b!1250915 (= lt!564527 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250915 (= lt!564528 (getCurrentListMapNoExtraKeys!5582 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49204 () Bool)

(declare-fun tp!93664 () Bool)

(declare-fun e!710221 () Bool)

(assert (=> mapNonEmpty!49204 (= mapRes!49204 (and tp!93664 e!710221))))

(declare-fun mapKey!49204 () (_ BitVec 32))

(declare-fun mapValue!49204 () ValueCell!15049)

(declare-fun mapRest!49204 () (Array (_ BitVec 32) ValueCell!15049))

(assert (=> mapNonEmpty!49204 (= (arr!39025 _values!914) (store mapRest!49204 mapKey!49204 mapValue!49204))))

(declare-fun b!1250916 () Bool)

(declare-fun e!710220 () Bool)

(declare-fun e!710223 () Bool)

(assert (=> b!1250916 (= e!710220 (and e!710223 mapRes!49204))))

(declare-fun condMapEmpty!49204 () Bool)

(declare-fun mapDefault!49204 () ValueCell!15049)

