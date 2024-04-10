; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105262 () Bool)

(assert start!105262)

(declare-fun b_free!26957 () Bool)

(declare-fun b_next!26957 () Bool)

(assert (=> start!105262 (= b_free!26957 (not b_next!26957))))

(declare-fun tp!94379 () Bool)

(declare-fun b_and!44783 () Bool)

(assert (=> start!105262 (= tp!94379 b_and!44783)))

(declare-fun b!1254293 () Bool)

(declare-fun e!712699 () Bool)

(declare-fun tp_is_empty!31859 () Bool)

(assert (=> b!1254293 (= e!712699 tp_is_empty!31859)))

(declare-fun b!1254294 () Bool)

(declare-fun res!836328 () Bool)

(declare-fun e!712700 () Bool)

(assert (=> b!1254294 (=> (not res!836328) (not e!712700))))

(declare-datatypes ((array!81374 0))(
  ( (array!81375 (arr!39248 (Array (_ BitVec 32) (_ BitVec 64))) (size!39784 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81374)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81374 (_ BitVec 32)) Bool)

(assert (=> b!1254294 (= res!836328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254295 () Bool)

(declare-fun res!836327 () Bool)

(assert (=> b!1254295 (=> (not res!836327) (not e!712700))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47843 0))(
  ( (V!47844 (val!15992 Int)) )
))
(declare-datatypes ((ValueCell!15166 0))(
  ( (ValueCellFull!15166 (v!18691 V!47843)) (EmptyCell!15166) )
))
(declare-datatypes ((array!81376 0))(
  ( (array!81377 (arr!39249 (Array (_ BitVec 32) ValueCell!15166)) (size!39785 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81376)

(assert (=> b!1254295 (= res!836327 (and (= (size!39785 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39784 _keys!1118) (size!39785 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49567 () Bool)

(declare-fun mapRes!49567 () Bool)

(assert (=> mapIsEmpty!49567 mapRes!49567))

(declare-fun b!1254296 () Bool)

(declare-fun e!712697 () Bool)

(assert (=> b!1254296 (= e!712697 tp_is_empty!31859)))

(declare-fun b!1254297 () Bool)

(declare-fun res!836329 () Bool)

(assert (=> b!1254297 (=> (not res!836329) (not e!712700))))

(declare-datatypes ((List!27872 0))(
  ( (Nil!27869) (Cons!27868 (h!29077 (_ BitVec 64)) (t!41355 List!27872)) )
))
(declare-fun arrayNoDuplicates!0 (array!81374 (_ BitVec 32) List!27872) Bool)

(assert (=> b!1254297 (= res!836329 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27869))))

(declare-fun b!1254298 () Bool)

(declare-fun e!712698 () Bool)

(assert (=> b!1254298 (= e!712700 (not e!712698))))

(declare-fun res!836330 () Bool)

(assert (=> b!1254298 (=> res!836330 e!712698)))

(assert (=> b!1254298 (= res!836330 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20646 0))(
  ( (tuple2!20647 (_1!10334 (_ BitVec 64)) (_2!10334 V!47843)) )
))
(declare-datatypes ((List!27873 0))(
  ( (Nil!27870) (Cons!27869 (h!29078 tuple2!20646) (t!41356 List!27873)) )
))
(declare-datatypes ((ListLongMap!18519 0))(
  ( (ListLongMap!18520 (toList!9275 List!27873)) )
))
(declare-fun lt!566780 () ListLongMap!18519)

(declare-fun lt!566782 () ListLongMap!18519)

(assert (=> b!1254298 (= lt!566780 lt!566782)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41734 0))(
  ( (Unit!41735) )
))
(declare-fun lt!566781 () Unit!41734)

(declare-fun minValueAfter!43 () V!47843)

(declare-fun zeroValue!871 () V!47843)

(declare-fun minValueBefore!43 () V!47843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1026 (array!81374 array!81376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47843 V!47843 V!47843 V!47843 (_ BitVec 32) Int) Unit!41734)

(assert (=> b!1254298 (= lt!566781 (lemmaNoChangeToArrayThenSameMapNoExtras!1026 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5662 (array!81374 array!81376 (_ BitVec 32) (_ BitVec 32) V!47843 V!47843 (_ BitVec 32) Int) ListLongMap!18519)

(assert (=> b!1254298 (= lt!566782 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254298 (= lt!566780 (getCurrentListMapNoExtraKeys!5662 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49567 () Bool)

(declare-fun tp!94378 () Bool)

(assert (=> mapNonEmpty!49567 (= mapRes!49567 (and tp!94378 e!712699))))

(declare-fun mapValue!49567 () ValueCell!15166)

(declare-fun mapRest!49567 () (Array (_ BitVec 32) ValueCell!15166))

(declare-fun mapKey!49567 () (_ BitVec 32))

(assert (=> mapNonEmpty!49567 (= (arr!39249 _values!914) (store mapRest!49567 mapKey!49567 mapValue!49567))))

(declare-fun b!1254300 () Bool)

(declare-fun e!712696 () Bool)

(assert (=> b!1254300 (= e!712696 (and e!712697 mapRes!49567))))

(declare-fun condMapEmpty!49567 () Bool)

(declare-fun mapDefault!49567 () ValueCell!15166)

