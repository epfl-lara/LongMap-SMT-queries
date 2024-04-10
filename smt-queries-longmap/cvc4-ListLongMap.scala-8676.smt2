; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105436 () Bool)

(assert start!105436)

(declare-fun b_free!27095 () Bool)

(declare-fun b_next!27095 () Bool)

(assert (=> start!105436 (= b_free!27095 (not b_next!27095))))

(declare-fun tp!94799 () Bool)

(declare-fun b_and!44941 () Bool)

(assert (=> start!105436 (= tp!94799 b_and!44941)))

(declare-fun mapIsEmpty!49780 () Bool)

(declare-fun mapRes!49780 () Bool)

(assert (=> mapIsEmpty!49780 mapRes!49780))

(declare-fun b!1256199 () Bool)

(declare-fun e!714092 () Bool)

(assert (=> b!1256199 (= e!714092 true)))

(declare-datatypes ((V!48027 0))(
  ( (V!48028 (val!16061 Int)) )
))
(declare-datatypes ((tuple2!20748 0))(
  ( (tuple2!20749 (_1!10385 (_ BitVec 64)) (_2!10385 V!48027)) )
))
(declare-datatypes ((List!27965 0))(
  ( (Nil!27962) (Cons!27961 (h!29170 tuple2!20748) (t!41452 List!27965)) )
))
(declare-datatypes ((ListLongMap!18621 0))(
  ( (ListLongMap!18622 (toList!9326 List!27965)) )
))
(declare-fun lt!567985 () ListLongMap!18621)

(declare-fun -!2077 (ListLongMap!18621 (_ BitVec 64)) ListLongMap!18621)

(assert (=> b!1256199 (= (-!2077 lt!567985 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567985)))

(declare-datatypes ((Unit!41836 0))(
  ( (Unit!41837) )
))
(declare-fun lt!567984 () Unit!41836)

(declare-fun removeNotPresentStillSame!130 (ListLongMap!18621 (_ BitVec 64)) Unit!41836)

(assert (=> b!1256199 (= lt!567984 (removeNotPresentStillSame!130 lt!567985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256200 () Bool)

(declare-fun res!837458 () Bool)

(declare-fun e!714093 () Bool)

(assert (=> b!1256200 (=> (not res!837458) (not e!714093))))

(declare-datatypes ((array!81636 0))(
  ( (array!81637 (arr!39377 (Array (_ BitVec 32) (_ BitVec 64))) (size!39913 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81636)

(declare-datatypes ((List!27966 0))(
  ( (Nil!27963) (Cons!27962 (h!29171 (_ BitVec 64)) (t!41453 List!27966)) )
))
(declare-fun arrayNoDuplicates!0 (array!81636 (_ BitVec 32) List!27966) Bool)

(assert (=> b!1256200 (= res!837458 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27963))))

(declare-fun b!1256201 () Bool)

(declare-fun res!837459 () Bool)

(assert (=> b!1256201 (=> (not res!837459) (not e!714093))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15235 0))(
  ( (ValueCellFull!15235 (v!18761 V!48027)) (EmptyCell!15235) )
))
(declare-datatypes ((array!81638 0))(
  ( (array!81639 (arr!39378 (Array (_ BitVec 32) ValueCell!15235)) (size!39914 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81638)

(assert (=> b!1256201 (= res!837459 (and (= (size!39914 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39913 _keys!1118) (size!39914 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49780 () Bool)

(declare-fun tp!94798 () Bool)

(declare-fun e!714098 () Bool)

(assert (=> mapNonEmpty!49780 (= mapRes!49780 (and tp!94798 e!714098))))

(declare-fun mapKey!49780 () (_ BitVec 32))

(declare-fun mapValue!49780 () ValueCell!15235)

(declare-fun mapRest!49780 () (Array (_ BitVec 32) ValueCell!15235))

(assert (=> mapNonEmpty!49780 (= (arr!39378 _values!914) (store mapRest!49780 mapKey!49780 mapValue!49780))))

(declare-fun b!1256202 () Bool)

(declare-fun e!714097 () Bool)

(assert (=> b!1256202 (= e!714093 (not e!714097))))

(declare-fun res!837461 () Bool)

(assert (=> b!1256202 (=> res!837461 e!714097)))

(assert (=> b!1256202 (= res!837461 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567986 () ListLongMap!18621)

(declare-fun lt!567988 () ListLongMap!18621)

(assert (=> b!1256202 (= lt!567986 lt!567988)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48027)

(declare-fun minValueBefore!43 () V!48027)

(declare-fun lt!567987 () Unit!41836)

(declare-fun minValueAfter!43 () V!48027)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1073 (array!81636 array!81638 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48027 V!48027 V!48027 V!48027 (_ BitVec 32) Int) Unit!41836)

(assert (=> b!1256202 (= lt!567987 (lemmaNoChangeToArrayThenSameMapNoExtras!1073 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5709 (array!81636 array!81638 (_ BitVec 32) (_ BitVec 32) V!48027 V!48027 (_ BitVec 32) Int) ListLongMap!18621)

(assert (=> b!1256202 (= lt!567988 (getCurrentListMapNoExtraKeys!5709 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256202 (= lt!567986 (getCurrentListMapNoExtraKeys!5709 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256203 () Bool)

(assert (=> b!1256203 (= e!714097 e!714092)))

(declare-fun res!837460 () Bool)

(assert (=> b!1256203 (=> res!837460 e!714092)))

(declare-fun contains!7543 (ListLongMap!18621 (_ BitVec 64)) Bool)

(assert (=> b!1256203 (= res!837460 (contains!7543 lt!567985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4549 (array!81636 array!81638 (_ BitVec 32) (_ BitVec 32) V!48027 V!48027 (_ BitVec 32) Int) ListLongMap!18621)

(assert (=> b!1256203 (= lt!567985 (getCurrentListMap!4549 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256204 () Bool)

(declare-fun e!714095 () Bool)

(declare-fun e!714096 () Bool)

(assert (=> b!1256204 (= e!714095 (and e!714096 mapRes!49780))))

(declare-fun condMapEmpty!49780 () Bool)

(declare-fun mapDefault!49780 () ValueCell!15235)

