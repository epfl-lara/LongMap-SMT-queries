; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105364 () Bool)

(assert start!105364)

(declare-fun b_free!27037 () Bool)

(declare-fun b_next!27037 () Bool)

(assert (=> start!105364 (= b_free!27037 (not b_next!27037))))

(declare-fun tp!94621 () Bool)

(declare-fun b_and!44875 () Bool)

(assert (=> start!105364 (= tp!94621 b_and!44875)))

(declare-fun mapNonEmpty!49690 () Bool)

(declare-fun mapRes!49690 () Bool)

(declare-fun tp!94622 () Bool)

(declare-fun e!713471 () Bool)

(assert (=> mapNonEmpty!49690 (= mapRes!49690 (and tp!94622 e!713471))))

(declare-datatypes ((V!47951 0))(
  ( (V!47952 (val!16032 Int)) )
))
(declare-datatypes ((ValueCell!15206 0))(
  ( (ValueCellFull!15206 (v!18732 V!47951)) (EmptyCell!15206) )
))
(declare-fun mapValue!49690 () ValueCell!15206)

(declare-fun mapKey!49690 () (_ BitVec 32))

(declare-datatypes ((array!81524 0))(
  ( (array!81525 (arr!39322 (Array (_ BitVec 32) ValueCell!15206)) (size!39858 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81524)

(declare-fun mapRest!49690 () (Array (_ BitVec 32) ValueCell!15206))

(assert (=> mapNonEmpty!49690 (= (arr!39322 _values!914) (store mapRest!49690 mapKey!49690 mapValue!49690))))

(declare-fun b!1255372 () Bool)

(declare-fun tp_is_empty!31939 () Bool)

(assert (=> b!1255372 (= e!713471 tp_is_empty!31939)))

(declare-fun b!1255373 () Bool)

(declare-fun e!713473 () Bool)

(assert (=> b!1255373 (= e!713473 (not true))))

(declare-datatypes ((tuple2!20702 0))(
  ( (tuple2!20703 (_1!10362 (_ BitVec 64)) (_2!10362 V!47951)) )
))
(declare-datatypes ((List!27925 0))(
  ( (Nil!27922) (Cons!27921 (h!29130 tuple2!20702) (t!41410 List!27925)) )
))
(declare-datatypes ((ListLongMap!18575 0))(
  ( (ListLongMap!18576 (toList!9303 List!27925)) )
))
(declare-fun lt!567551 () ListLongMap!18575)

(declare-fun lt!567552 () ListLongMap!18575)

(assert (=> b!1255373 (= lt!567551 lt!567552)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47951)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81526 0))(
  ( (array!81527 (arr!39323 (Array (_ BitVec 32) (_ BitVec 64))) (size!39859 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81526)

(declare-fun minValueBefore!43 () V!47951)

(declare-fun zeroValue!871 () V!47951)

(declare-datatypes ((Unit!41792 0))(
  ( (Unit!41793) )
))
(declare-fun lt!567550 () Unit!41792)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1052 (array!81526 array!81524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 V!47951 V!47951 (_ BitVec 32) Int) Unit!41792)

(assert (=> b!1255373 (= lt!567550 (lemmaNoChangeToArrayThenSameMapNoExtras!1052 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5688 (array!81526 array!81524 (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 (_ BitVec 32) Int) ListLongMap!18575)

(assert (=> b!1255373 (= lt!567552 (getCurrentListMapNoExtraKeys!5688 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255373 (= lt!567551 (getCurrentListMapNoExtraKeys!5688 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255374 () Bool)

(declare-fun e!713470 () Bool)

(assert (=> b!1255374 (= e!713470 tp_is_empty!31939)))

(declare-fun mapIsEmpty!49690 () Bool)

(assert (=> mapIsEmpty!49690 mapRes!49690))

(declare-fun b!1255375 () Bool)

(declare-fun e!713469 () Bool)

(assert (=> b!1255375 (= e!713469 (and e!713470 mapRes!49690))))

(declare-fun condMapEmpty!49690 () Bool)

(declare-fun mapDefault!49690 () ValueCell!15206)

