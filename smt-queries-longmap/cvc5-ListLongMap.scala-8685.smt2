; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105508 () Bool)

(assert start!105508)

(declare-fun b_free!27145 () Bool)

(declare-fun b_next!27145 () Bool)

(assert (=> start!105508 (= b_free!27145 (not b_next!27145))))

(declare-fun tp!94952 () Bool)

(declare-fun b_and!45001 () Bool)

(assert (=> start!105508 (= tp!94952 b_and!45001)))

(declare-fun b!1257031 () Bool)

(declare-fun res!837968 () Bool)

(declare-fun e!714719 () Bool)

(assert (=> b!1257031 (=> (not res!837968) (not e!714719))))

(declare-datatypes ((array!81728 0))(
  ( (array!81729 (arr!39422 (Array (_ BitVec 32) (_ BitVec 64))) (size!39958 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81728)

(declare-datatypes ((List!27995 0))(
  ( (Nil!27992) (Cons!27991 (h!29200 (_ BitVec 64)) (t!41484 List!27995)) )
))
(declare-fun arrayNoDuplicates!0 (array!81728 (_ BitVec 32) List!27995) Bool)

(assert (=> b!1257031 (= res!837968 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27992))))

(declare-fun b!1257032 () Bool)

(declare-fun e!714722 () Bool)

(assert (=> b!1257032 (= e!714722 true)))

(declare-datatypes ((V!48095 0))(
  ( (V!48096 (val!16086 Int)) )
))
(declare-datatypes ((tuple2!20778 0))(
  ( (tuple2!20779 (_1!10400 (_ BitVec 64)) (_2!10400 V!48095)) )
))
(declare-datatypes ((List!27996 0))(
  ( (Nil!27993) (Cons!27992 (h!29201 tuple2!20778) (t!41485 List!27996)) )
))
(declare-datatypes ((ListLongMap!18651 0))(
  ( (ListLongMap!18652 (toList!9341 List!27996)) )
))
(declare-fun lt!568484 () ListLongMap!18651)

(declare-fun -!2089 (ListLongMap!18651 (_ BitVec 64)) ListLongMap!18651)

(assert (=> b!1257032 (= (-!2089 lt!568484 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568484)))

(declare-datatypes ((Unit!41866 0))(
  ( (Unit!41867) )
))
(declare-fun lt!568487 () Unit!41866)

(declare-fun removeNotPresentStillSame!142 (ListLongMap!18651 (_ BitVec 64)) Unit!41866)

(assert (=> b!1257032 (= lt!568487 (removeNotPresentStillSame!142 lt!568484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257033 () Bool)

(declare-fun e!714720 () Bool)

(declare-fun tp_is_empty!32047 () Bool)

(assert (=> b!1257033 (= e!714720 tp_is_empty!32047)))

(declare-fun b!1257034 () Bool)

(declare-fun e!714718 () Bool)

(assert (=> b!1257034 (= e!714718 e!714722)))

(declare-fun res!837969 () Bool)

(assert (=> b!1257034 (=> res!837969 e!714722)))

(declare-fun contains!7558 (ListLongMap!18651 (_ BitVec 64)) Bool)

(assert (=> b!1257034 (= res!837969 (contains!7558 lt!568484 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48095)

(declare-datatypes ((ValueCell!15260 0))(
  ( (ValueCellFull!15260 (v!18787 V!48095)) (EmptyCell!15260) )
))
(declare-datatypes ((array!81730 0))(
  ( (array!81731 (arr!39423 (Array (_ BitVec 32) ValueCell!15260)) (size!39959 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81730)

(declare-fun minValueBefore!43 () V!48095)

(declare-fun getCurrentListMap!4563 (array!81728 array!81730 (_ BitVec 32) (_ BitVec 32) V!48095 V!48095 (_ BitVec 32) Int) ListLongMap!18651)

(assert (=> b!1257034 (= lt!568484 (getCurrentListMap!4563 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!837967 () Bool)

(assert (=> start!105508 (=> (not res!837967) (not e!714719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105508 (= res!837967 (validMask!0 mask!1466))))

(assert (=> start!105508 e!714719))

(assert (=> start!105508 true))

(assert (=> start!105508 tp!94952))

(assert (=> start!105508 tp_is_empty!32047))

(declare-fun array_inv!30027 (array!81728) Bool)

(assert (=> start!105508 (array_inv!30027 _keys!1118)))

(declare-fun e!714723 () Bool)

(declare-fun array_inv!30028 (array!81730) Bool)

(assert (=> start!105508 (and (array_inv!30028 _values!914) e!714723)))

(declare-fun b!1257035 () Bool)

(declare-fun mapRes!49858 () Bool)

(assert (=> b!1257035 (= e!714723 (and e!714720 mapRes!49858))))

(declare-fun condMapEmpty!49858 () Bool)

(declare-fun mapDefault!49858 () ValueCell!15260)

