; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105368 () Bool)

(assert start!105368)

(declare-fun b_free!27041 () Bool)

(declare-fun b_next!27041 () Bool)

(assert (=> start!105368 (= b_free!27041 (not b_next!27041))))

(declare-fun tp!94634 () Bool)

(declare-fun b_and!44879 () Bool)

(assert (=> start!105368 (= tp!94634 b_and!44879)))

(declare-fun b!1255414 () Bool)

(declare-fun res!836968 () Bool)

(declare-fun e!713499 () Bool)

(assert (=> b!1255414 (=> (not res!836968) (not e!713499))))

(declare-datatypes ((array!81532 0))(
  ( (array!81533 (arr!39326 (Array (_ BitVec 32) (_ BitVec 64))) (size!39862 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81532)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81532 (_ BitVec 32)) Bool)

(assert (=> b!1255414 (= res!836968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255415 () Bool)

(declare-fun e!713500 () Bool)

(declare-fun tp_is_empty!31943 () Bool)

(assert (=> b!1255415 (= e!713500 tp_is_empty!31943)))

(declare-fun mapIsEmpty!49696 () Bool)

(declare-fun mapRes!49696 () Bool)

(assert (=> mapIsEmpty!49696 mapRes!49696))

(declare-fun b!1255417 () Bool)

(assert (=> b!1255417 (= e!713499 (not true))))

(declare-datatypes ((V!47955 0))(
  ( (V!47956 (val!16034 Int)) )
))
(declare-datatypes ((tuple2!20706 0))(
  ( (tuple2!20707 (_1!10364 (_ BitVec 64)) (_2!10364 V!47955)) )
))
(declare-datatypes ((List!27928 0))(
  ( (Nil!27925) (Cons!27924 (h!29133 tuple2!20706) (t!41413 List!27928)) )
))
(declare-datatypes ((ListLongMap!18579 0))(
  ( (ListLongMap!18580 (toList!9305 List!27928)) )
))
(declare-fun lt!567569 () ListLongMap!18579)

(declare-fun lt!567570 () ListLongMap!18579)

(assert (=> b!1255417 (= lt!567569 lt!567570)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47955)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47955)

(declare-datatypes ((ValueCell!15208 0))(
  ( (ValueCellFull!15208 (v!18734 V!47955)) (EmptyCell!15208) )
))
(declare-datatypes ((array!81534 0))(
  ( (array!81535 (arr!39327 (Array (_ BitVec 32) ValueCell!15208)) (size!39863 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81534)

(declare-datatypes ((Unit!41796 0))(
  ( (Unit!41797) )
))
(declare-fun lt!567568 () Unit!41796)

(declare-fun minValueBefore!43 () V!47955)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1054 (array!81532 array!81534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47955 V!47955 V!47955 V!47955 (_ BitVec 32) Int) Unit!41796)

(assert (=> b!1255417 (= lt!567568 (lemmaNoChangeToArrayThenSameMapNoExtras!1054 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5690 (array!81532 array!81534 (_ BitVec 32) (_ BitVec 32) V!47955 V!47955 (_ BitVec 32) Int) ListLongMap!18579)

(assert (=> b!1255417 (= lt!567570 (getCurrentListMapNoExtraKeys!5690 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255417 (= lt!567569 (getCurrentListMapNoExtraKeys!5690 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255418 () Bool)

(declare-fun res!836969 () Bool)

(assert (=> b!1255418 (=> (not res!836969) (not e!713499))))

(declare-datatypes ((List!27929 0))(
  ( (Nil!27926) (Cons!27925 (h!29134 (_ BitVec 64)) (t!41414 List!27929)) )
))
(declare-fun arrayNoDuplicates!0 (array!81532 (_ BitVec 32) List!27929) Bool)

(assert (=> b!1255418 (= res!836969 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27926))))

(declare-fun mapNonEmpty!49696 () Bool)

(declare-fun tp!94633 () Bool)

(declare-fun e!713501 () Bool)

(assert (=> mapNonEmpty!49696 (= mapRes!49696 (and tp!94633 e!713501))))

(declare-fun mapKey!49696 () (_ BitVec 32))

(declare-fun mapRest!49696 () (Array (_ BitVec 32) ValueCell!15208))

(declare-fun mapValue!49696 () ValueCell!15208)

(assert (=> mapNonEmpty!49696 (= (arr!39327 _values!914) (store mapRest!49696 mapKey!49696 mapValue!49696))))

(declare-fun b!1255419 () Bool)

(declare-fun res!836971 () Bool)

(assert (=> b!1255419 (=> (not res!836971) (not e!713499))))

(assert (=> b!1255419 (= res!836971 (and (= (size!39863 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39862 _keys!1118) (size!39863 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255420 () Bool)

(assert (=> b!1255420 (= e!713501 tp_is_empty!31943)))

(declare-fun b!1255416 () Bool)

(declare-fun e!713503 () Bool)

(assert (=> b!1255416 (= e!713503 (and e!713500 mapRes!49696))))

(declare-fun condMapEmpty!49696 () Bool)

(declare-fun mapDefault!49696 () ValueCell!15208)

