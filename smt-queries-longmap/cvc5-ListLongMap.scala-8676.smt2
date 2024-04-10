; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105432 () Bool)

(assert start!105432)

(declare-fun b_free!27091 () Bool)

(declare-fun b_next!27091 () Bool)

(assert (=> start!105432 (= b_free!27091 (not b_next!27091))))

(declare-fun tp!94787 () Bool)

(declare-fun b_and!44937 () Bool)

(assert (=> start!105432 (= tp!94787 b_and!44937)))

(declare-fun mapNonEmpty!49774 () Bool)

(declare-fun mapRes!49774 () Bool)

(declare-fun tp!94786 () Bool)

(declare-fun e!714053 () Bool)

(assert (=> mapNonEmpty!49774 (= mapRes!49774 (and tp!94786 e!714053))))

(declare-datatypes ((V!48023 0))(
  ( (V!48024 (val!16059 Int)) )
))
(declare-datatypes ((ValueCell!15233 0))(
  ( (ValueCellFull!15233 (v!18759 V!48023)) (EmptyCell!15233) )
))
(declare-fun mapRest!49774 () (Array (_ BitVec 32) ValueCell!15233))

(declare-fun mapValue!49774 () ValueCell!15233)

(declare-datatypes ((array!81628 0))(
  ( (array!81629 (arr!39373 (Array (_ BitVec 32) ValueCell!15233)) (size!39909 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81628)

(declare-fun mapKey!49774 () (_ BitVec 32))

(assert (=> mapNonEmpty!49774 (= (arr!39373 _values!914) (store mapRest!49774 mapKey!49774 mapValue!49774))))

(declare-fun b!1256146 () Bool)

(declare-fun e!714052 () Bool)

(declare-fun e!714054 () Bool)

(assert (=> b!1256146 (= e!714052 (not e!714054))))

(declare-fun res!837421 () Bool)

(assert (=> b!1256146 (=> res!837421 e!714054)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256146 (= res!837421 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20744 0))(
  ( (tuple2!20745 (_1!10383 (_ BitVec 64)) (_2!10383 V!48023)) )
))
(declare-datatypes ((List!27961 0))(
  ( (Nil!27958) (Cons!27957 (h!29166 tuple2!20744) (t!41448 List!27961)) )
))
(declare-datatypes ((ListLongMap!18617 0))(
  ( (ListLongMap!18618 (toList!9324 List!27961)) )
))
(declare-fun lt!567958 () ListLongMap!18617)

(declare-fun lt!567956 () ListLongMap!18617)

(assert (=> b!1256146 (= lt!567958 lt!567956)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41832 0))(
  ( (Unit!41833) )
))
(declare-fun lt!567955 () Unit!41832)

(declare-fun minValueAfter!43 () V!48023)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48023)

(declare-datatypes ((array!81630 0))(
  ( (array!81631 (arr!39374 (Array (_ BitVec 32) (_ BitVec 64))) (size!39910 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81630)

(declare-fun minValueBefore!43 () V!48023)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1071 (array!81630 array!81628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 V!48023 V!48023 (_ BitVec 32) Int) Unit!41832)

(assert (=> b!1256146 (= lt!567955 (lemmaNoChangeToArrayThenSameMapNoExtras!1071 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5707 (array!81630 array!81628 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1256146 (= lt!567956 (getCurrentListMapNoExtraKeys!5707 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256146 (= lt!567958 (getCurrentListMapNoExtraKeys!5707 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256147 () Bool)

(declare-fun e!714056 () Bool)

(declare-fun tp_is_empty!31993 () Bool)

(assert (=> b!1256147 (= e!714056 tp_is_empty!31993)))

(declare-fun b!1256148 () Bool)

(declare-fun e!714051 () Bool)

(assert (=> b!1256148 (= e!714054 e!714051)))

(declare-fun res!837424 () Bool)

(assert (=> b!1256148 (=> res!837424 e!714051)))

(declare-fun lt!567957 () ListLongMap!18617)

(declare-fun contains!7541 (ListLongMap!18617 (_ BitVec 64)) Bool)

(assert (=> b!1256148 (= res!837424 (contains!7541 lt!567957 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4547 (array!81630 array!81628 (_ BitVec 32) (_ BitVec 32) V!48023 V!48023 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1256148 (= lt!567957 (getCurrentListMap!4547 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256149 () Bool)

(declare-fun res!837422 () Bool)

(assert (=> b!1256149 (=> (not res!837422) (not e!714052))))

(assert (=> b!1256149 (= res!837422 (and (= (size!39909 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39910 _keys!1118) (size!39909 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256150 () Bool)

(declare-fun res!837423 () Bool)

(assert (=> b!1256150 (=> (not res!837423) (not e!714052))))

(declare-datatypes ((List!27962 0))(
  ( (Nil!27959) (Cons!27958 (h!29167 (_ BitVec 64)) (t!41449 List!27962)) )
))
(declare-fun arrayNoDuplicates!0 (array!81630 (_ BitVec 32) List!27962) Bool)

(assert (=> b!1256150 (= res!837423 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27959))))

(declare-fun b!1256151 () Bool)

(declare-fun e!714055 () Bool)

(assert (=> b!1256151 (= e!714055 (and e!714056 mapRes!49774))))

(declare-fun condMapEmpty!49774 () Bool)

(declare-fun mapDefault!49774 () ValueCell!15233)

