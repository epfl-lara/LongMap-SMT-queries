; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104978 () Bool)

(assert start!104978)

(declare-fun b_free!26747 () Bool)

(declare-fun b_next!26747 () Bool)

(assert (=> start!104978 (= b_free!26747 (not b_next!26747))))

(declare-fun tp!93736 () Bool)

(declare-fun b_and!44533 () Bool)

(assert (=> start!104978 (= tp!93736 b_and!44533)))

(declare-fun mapNonEmpty!49240 () Bool)

(declare-fun mapRes!49240 () Bool)

(declare-fun tp!93737 () Bool)

(declare-fun e!710477 () Bool)

(assert (=> mapNonEmpty!49240 (= mapRes!49240 (and tp!93737 e!710477))))

(declare-datatypes ((V!47563 0))(
  ( (V!47564 (val!15887 Int)) )
))
(declare-datatypes ((ValueCell!15061 0))(
  ( (ValueCellFull!15061 (v!18584 V!47563)) (EmptyCell!15061) )
))
(declare-fun mapRest!49240 () (Array (_ BitVec 32) ValueCell!15061))

(declare-fun mapKey!49240 () (_ BitVec 32))

(declare-datatypes ((array!80962 0))(
  ( (array!80963 (arr!39046 (Array (_ BitVec 32) ValueCell!15061)) (size!39582 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80962)

(declare-fun mapValue!49240 () ValueCell!15061)

(assert (=> mapNonEmpty!49240 (= (arr!39046 _values!914) (store mapRest!49240 mapKey!49240 mapValue!49240))))

(declare-fun res!834560 () Bool)

(declare-fun e!710473 () Bool)

(assert (=> start!104978 (=> (not res!834560) (not e!710473))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104978 (= res!834560 (validMask!0 mask!1466))))

(assert (=> start!104978 e!710473))

(assert (=> start!104978 true))

(assert (=> start!104978 tp!93736))

(declare-fun tp_is_empty!31649 () Bool)

(assert (=> start!104978 tp_is_empty!31649))

(declare-datatypes ((array!80964 0))(
  ( (array!80965 (arr!39047 (Array (_ BitVec 32) (_ BitVec 64))) (size!39583 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80964)

(declare-fun array_inv!29787 (array!80964) Bool)

(assert (=> start!104978 (array_inv!29787 _keys!1118)))

(declare-fun e!710474 () Bool)

(declare-fun array_inv!29788 (array!80962) Bool)

(assert (=> start!104978 (and (array_inv!29788 _values!914) e!710474)))

(declare-fun mapIsEmpty!49240 () Bool)

(assert (=> mapIsEmpty!49240 mapRes!49240))

(declare-fun b!1251234 () Bool)

(declare-fun e!710472 () Bool)

(assert (=> b!1251234 (= e!710472 true)))

(declare-datatypes ((tuple2!20480 0))(
  ( (tuple2!20481 (_1!10251 (_ BitVec 64)) (_2!10251 V!47563)) )
))
(declare-datatypes ((List!27714 0))(
  ( (Nil!27711) (Cons!27710 (h!28919 tuple2!20480) (t!41189 List!27714)) )
))
(declare-datatypes ((ListLongMap!18353 0))(
  ( (ListLongMap!18354 (toList!9192 List!27714)) )
))
(declare-fun lt!564708 () ListLongMap!18353)

(declare-fun -!2014 (ListLongMap!18353 (_ BitVec 64)) ListLongMap!18353)

(assert (=> b!1251234 (= (-!2014 lt!564708 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564708)))

(declare-datatypes ((Unit!41573 0))(
  ( (Unit!41574) )
))
(declare-fun lt!564709 () Unit!41573)

(declare-fun removeNotPresentStillSame!109 (ListLongMap!18353 (_ BitVec 64)) Unit!41573)

(assert (=> b!1251234 (= lt!564709 (removeNotPresentStillSame!109 lt!564708 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251235 () Bool)

(declare-fun res!834559 () Bool)

(assert (=> b!1251235 (=> (not res!834559) (not e!710473))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251235 (= res!834559 (and (= (size!39582 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39583 _keys!1118) (size!39582 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251236 () Bool)

(assert (=> b!1251236 (= e!710477 tp_is_empty!31649)))

(declare-fun b!1251237 () Bool)

(declare-fun e!710476 () Bool)

(assert (=> b!1251237 (= e!710476 tp_is_empty!31649)))

(declare-fun b!1251238 () Bool)

(declare-fun res!834558 () Bool)

(assert (=> b!1251238 (=> (not res!834558) (not e!710473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80964 (_ BitVec 32)) Bool)

(assert (=> b!1251238 (= res!834558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251239 () Bool)

(declare-fun res!834556 () Bool)

(assert (=> b!1251239 (=> (not res!834556) (not e!710473))))

(declare-datatypes ((List!27715 0))(
  ( (Nil!27712) (Cons!27711 (h!28920 (_ BitVec 64)) (t!41190 List!27715)) )
))
(declare-fun arrayNoDuplicates!0 (array!80964 (_ BitVec 32) List!27715) Bool)

(assert (=> b!1251239 (= res!834556 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27712))))

(declare-fun b!1251240 () Bool)

(declare-fun e!710475 () Bool)

(assert (=> b!1251240 (= e!710473 (not e!710475))))

(declare-fun res!834555 () Bool)

(assert (=> b!1251240 (=> res!834555 e!710475)))

(assert (=> b!1251240 (= res!834555 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564711 () ListLongMap!18353)

(declare-fun lt!564710 () ListLongMap!18353)

(assert (=> b!1251240 (= lt!564711 lt!564710)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47563)

(declare-fun lt!564707 () Unit!41573)

(declare-fun minValueBefore!43 () V!47563)

(declare-fun zeroValue!871 () V!47563)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!955 (array!80964 array!80962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47563 V!47563 V!47563 V!47563 (_ BitVec 32) Int) Unit!41573)

(assert (=> b!1251240 (= lt!564707 (lemmaNoChangeToArrayThenSameMapNoExtras!955 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5591 (array!80964 array!80962 (_ BitVec 32) (_ BitVec 32) V!47563 V!47563 (_ BitVec 32) Int) ListLongMap!18353)

(assert (=> b!1251240 (= lt!564710 (getCurrentListMapNoExtraKeys!5591 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251240 (= lt!564711 (getCurrentListMapNoExtraKeys!5591 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251241 () Bool)

(assert (=> b!1251241 (= e!710474 (and e!710476 mapRes!49240))))

(declare-fun condMapEmpty!49240 () Bool)

(declare-fun mapDefault!49240 () ValueCell!15061)

