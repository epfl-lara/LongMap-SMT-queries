; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105204 () Bool)

(assert start!105204)

(declare-fun b_free!26921 () Bool)

(declare-fun b_next!26921 () Bool)

(assert (=> start!105204 (= b_free!26921 (not b_next!26921))))

(declare-fun tp!94267 () Bool)

(declare-fun b_and!44735 () Bool)

(assert (=> start!105204 (= tp!94267 b_and!44735)))

(declare-fun mapIsEmpty!49510 () Bool)

(declare-fun mapRes!49510 () Bool)

(assert (=> mapIsEmpty!49510 mapRes!49510))

(declare-fun mapNonEmpty!49510 () Bool)

(declare-fun tp!94268 () Bool)

(declare-fun e!712252 () Bool)

(assert (=> mapNonEmpty!49510 (= mapRes!49510 (and tp!94268 e!712252))))

(declare-datatypes ((V!47795 0))(
  ( (V!47796 (val!15974 Int)) )
))
(declare-datatypes ((ValueCell!15148 0))(
  ( (ValueCellFull!15148 (v!18672 V!47795)) (EmptyCell!15148) )
))
(declare-fun mapValue!49510 () ValueCell!15148)

(declare-fun mapKey!49510 () (_ BitVec 32))

(declare-datatypes ((array!81304 0))(
  ( (array!81305 (arr!39214 (Array (_ BitVec 32) ValueCell!15148)) (size!39750 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81304)

(declare-fun mapRest!49510 () (Array (_ BitVec 32) ValueCell!15148))

(assert (=> mapNonEmpty!49510 (= (arr!39214 _values!914) (store mapRest!49510 mapKey!49510 mapValue!49510))))

(declare-fun b!1253677 () Bool)

(declare-fun e!712257 () Bool)

(declare-fun tp_is_empty!31823 () Bool)

(assert (=> b!1253677 (= e!712257 tp_is_empty!31823)))

(declare-fun b!1253678 () Bool)

(declare-fun res!835978 () Bool)

(declare-fun e!712256 () Bool)

(assert (=> b!1253678 (=> (not res!835978) (not e!712256))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81306 0))(
  ( (array!81307 (arr!39215 (Array (_ BitVec 32) (_ BitVec 64))) (size!39751 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81306)

(assert (=> b!1253678 (= res!835978 (and (= (size!39750 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39751 _keys!1118) (size!39750 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253679 () Bool)

(declare-fun e!712253 () Bool)

(assert (=> b!1253679 (= e!712253 true)))

(declare-datatypes ((tuple2!20616 0))(
  ( (tuple2!20617 (_1!10319 (_ BitVec 64)) (_2!10319 V!47795)) )
))
(declare-datatypes ((List!27846 0))(
  ( (Nil!27843) (Cons!27842 (h!29051 tuple2!20616) (t!41327 List!27846)) )
))
(declare-datatypes ((ListLongMap!18489 0))(
  ( (ListLongMap!18490 (toList!9260 List!27846)) )
))
(declare-fun lt!566208 () ListLongMap!18489)

(declare-fun lt!566213 () ListLongMap!18489)

(declare-fun -!2033 (ListLongMap!18489 (_ BitVec 64)) ListLongMap!18489)

(assert (=> b!1253679 (= lt!566208 (-!2033 lt!566213 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566210 () ListLongMap!18489)

(declare-fun lt!566211 () ListLongMap!18489)

(assert (=> b!1253679 (= (-!2033 lt!566210 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566211)))

(declare-datatypes ((Unit!41702 0))(
  ( (Unit!41703) )
))
(declare-fun lt!566212 () Unit!41702)

(declare-fun minValueBefore!43 () V!47795)

(declare-fun addThenRemoveForNewKeyIsSame!303 (ListLongMap!18489 (_ BitVec 64) V!47795) Unit!41702)

(assert (=> b!1253679 (= lt!566212 (addThenRemoveForNewKeyIsSame!303 lt!566211 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566214 () ListLongMap!18489)

(declare-fun lt!566209 () ListLongMap!18489)

(assert (=> b!1253679 (and (= lt!566213 lt!566210) (= lt!566209 lt!566214))))

(declare-fun +!4156 (ListLongMap!18489 tuple2!20616) ListLongMap!18489)

(assert (=> b!1253679 (= lt!566210 (+!4156 lt!566211 (tuple2!20617 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47795)

(declare-fun zeroValue!871 () V!47795)

(declare-fun getCurrentListMap!4504 (array!81306 array!81304 (_ BitVec 32) (_ BitVec 32) V!47795 V!47795 (_ BitVec 32) Int) ListLongMap!18489)

(assert (=> b!1253679 (= lt!566209 (getCurrentListMap!4504 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253679 (= lt!566213 (getCurrentListMap!4504 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253680 () Bool)

(declare-fun e!712254 () Bool)

(assert (=> b!1253680 (= e!712254 (and e!712257 mapRes!49510))))

(declare-fun condMapEmpty!49510 () Bool)

(declare-fun mapDefault!49510 () ValueCell!15148)

