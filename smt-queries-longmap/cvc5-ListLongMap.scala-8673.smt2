; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105414 () Bool)

(assert start!105414)

(declare-fun b_free!27073 () Bool)

(declare-fun b_next!27073 () Bool)

(assert (=> start!105414 (= b_free!27073 (not b_next!27073))))

(declare-fun tp!94732 () Bool)

(declare-fun b_and!44919 () Bool)

(assert (=> start!105414 (= tp!94732 b_and!44919)))

(declare-fun b!1255902 () Bool)

(declare-fun e!713862 () Bool)

(declare-fun e!713866 () Bool)

(assert (=> b!1255902 (= e!713862 (not e!713866))))

(declare-fun res!837263 () Bool)

(assert (=> b!1255902 (=> res!837263 e!713866)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255902 (= res!837263 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47999 0))(
  ( (V!48000 (val!16050 Int)) )
))
(declare-datatypes ((tuple2!20728 0))(
  ( (tuple2!20729 (_1!10375 (_ BitVec 64)) (_2!10375 V!47999)) )
))
(declare-datatypes ((List!27948 0))(
  ( (Nil!27945) (Cons!27944 (h!29153 tuple2!20728) (t!41435 List!27948)) )
))
(declare-datatypes ((ListLongMap!18601 0))(
  ( (ListLongMap!18602 (toList!9316 List!27948)) )
))
(declare-fun lt!567823 () ListLongMap!18601)

(declare-fun lt!567821 () ListLongMap!18601)

(assert (=> b!1255902 (= lt!567823 lt!567821)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47999)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47999)

(declare-datatypes ((array!81592 0))(
  ( (array!81593 (arr!39355 (Array (_ BitVec 32) (_ BitVec 64))) (size!39891 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81592)

(declare-datatypes ((ValueCell!15224 0))(
  ( (ValueCellFull!15224 (v!18750 V!47999)) (EmptyCell!15224) )
))
(declare-datatypes ((array!81594 0))(
  ( (array!81595 (arr!39356 (Array (_ BitVec 32) ValueCell!15224)) (size!39892 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81594)

(declare-datatypes ((Unit!41818 0))(
  ( (Unit!41819) )
))
(declare-fun lt!567820 () Unit!41818)

(declare-fun minValueBefore!43 () V!47999)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1065 (array!81592 array!81594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 V!47999 V!47999 (_ BitVec 32) Int) Unit!41818)

(assert (=> b!1255902 (= lt!567820 (lemmaNoChangeToArrayThenSameMapNoExtras!1065 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5701 (array!81592 array!81594 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18601)

(assert (=> b!1255902 (= lt!567821 (getCurrentListMapNoExtraKeys!5701 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255902 (= lt!567823 (getCurrentListMapNoExtraKeys!5701 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255903 () Bool)

(declare-fun res!837262 () Bool)

(assert (=> b!1255903 (=> (not res!837262) (not e!713862))))

(assert (=> b!1255903 (= res!837262 (and (= (size!39892 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39891 _keys!1118) (size!39892 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255904 () Bool)

(declare-fun e!713863 () Bool)

(assert (=> b!1255904 (= e!713863 true)))

(declare-fun lt!567819 () ListLongMap!18601)

(declare-fun -!2069 (ListLongMap!18601 (_ BitVec 64)) ListLongMap!18601)

(assert (=> b!1255904 (= (-!2069 lt!567819 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567819)))

(declare-fun lt!567822 () Unit!41818)

(declare-fun removeNotPresentStillSame!122 (ListLongMap!18601 (_ BitVec 64)) Unit!41818)

(assert (=> b!1255904 (= lt!567822 (removeNotPresentStillSame!122 lt!567819 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255905 () Bool)

(declare-fun res!837261 () Bool)

(assert (=> b!1255905 (=> (not res!837261) (not e!713862))))

(declare-datatypes ((List!27949 0))(
  ( (Nil!27946) (Cons!27945 (h!29154 (_ BitVec 64)) (t!41436 List!27949)) )
))
(declare-fun arrayNoDuplicates!0 (array!81592 (_ BitVec 32) List!27949) Bool)

(assert (=> b!1255905 (= res!837261 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27946))))

(declare-fun res!837260 () Bool)

(assert (=> start!105414 (=> (not res!837260) (not e!713862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105414 (= res!837260 (validMask!0 mask!1466))))

(assert (=> start!105414 e!713862))

(assert (=> start!105414 true))

(assert (=> start!105414 tp!94732))

(declare-fun tp_is_empty!31975 () Bool)

(assert (=> start!105414 tp_is_empty!31975))

(declare-fun array_inv!29985 (array!81592) Bool)

(assert (=> start!105414 (array_inv!29985 _keys!1118)))

(declare-fun e!713864 () Bool)

(declare-fun array_inv!29986 (array!81594) Bool)

(assert (=> start!105414 (and (array_inv!29986 _values!914) e!713864)))

(declare-fun b!1255906 () Bool)

(assert (=> b!1255906 (= e!713866 e!713863)))

(declare-fun res!837259 () Bool)

(assert (=> b!1255906 (=> res!837259 e!713863)))

(declare-fun contains!7533 (ListLongMap!18601 (_ BitVec 64)) Bool)

(assert (=> b!1255906 (= res!837259 (contains!7533 lt!567819 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4539 (array!81592 array!81594 (_ BitVec 32) (_ BitVec 32) V!47999 V!47999 (_ BitVec 32) Int) ListLongMap!18601)

(assert (=> b!1255906 (= lt!567819 (getCurrentListMap!4539 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49747 () Bool)

(declare-fun mapRes!49747 () Bool)

(assert (=> mapIsEmpty!49747 mapRes!49747))

(declare-fun b!1255907 () Bool)

(declare-fun e!713861 () Bool)

(assert (=> b!1255907 (= e!713864 (and e!713861 mapRes!49747))))

(declare-fun condMapEmpty!49747 () Bool)

(declare-fun mapDefault!49747 () ValueCell!15224)

