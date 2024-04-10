; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105362 () Bool)

(assert start!105362)

(declare-fun b_free!27035 () Bool)

(declare-fun b_next!27035 () Bool)

(assert (=> start!105362 (= b_free!27035 (not b_next!27035))))

(declare-fun tp!94615 () Bool)

(declare-fun b_and!44873 () Bool)

(assert (=> start!105362 (= tp!94615 b_and!44873)))

(declare-fun b!1255351 () Bool)

(declare-fun res!836935 () Bool)

(declare-fun e!713457 () Bool)

(assert (=> b!1255351 (=> (not res!836935) (not e!713457))))

(declare-datatypes ((array!81520 0))(
  ( (array!81521 (arr!39320 (Array (_ BitVec 32) (_ BitVec 64))) (size!39856 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81520)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81520 (_ BitVec 32)) Bool)

(assert (=> b!1255351 (= res!836935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49687 () Bool)

(declare-fun mapRes!49687 () Bool)

(assert (=> mapIsEmpty!49687 mapRes!49687))

(declare-fun b!1255352 () Bool)

(assert (=> b!1255352 (= e!713457 (not true))))

(declare-datatypes ((V!47947 0))(
  ( (V!47948 (val!16031 Int)) )
))
(declare-datatypes ((tuple2!20700 0))(
  ( (tuple2!20701 (_1!10361 (_ BitVec 64)) (_2!10361 V!47947)) )
))
(declare-datatypes ((List!27924 0))(
  ( (Nil!27921) (Cons!27920 (h!29129 tuple2!20700) (t!41409 List!27924)) )
))
(declare-datatypes ((ListLongMap!18573 0))(
  ( (ListLongMap!18574 (toList!9302 List!27924)) )
))
(declare-fun lt!567543 () ListLongMap!18573)

(declare-fun lt!567542 () ListLongMap!18573)

(assert (=> b!1255352 (= lt!567543 lt!567542)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47947)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47947)

(declare-datatypes ((ValueCell!15205 0))(
  ( (ValueCellFull!15205 (v!18731 V!47947)) (EmptyCell!15205) )
))
(declare-datatypes ((array!81522 0))(
  ( (array!81523 (arr!39321 (Array (_ BitVec 32) ValueCell!15205)) (size!39857 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81522)

(declare-fun minValueBefore!43 () V!47947)

(declare-datatypes ((Unit!41790 0))(
  ( (Unit!41791) )
))
(declare-fun lt!567541 () Unit!41790)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1051 (array!81520 array!81522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47947 V!47947 V!47947 V!47947 (_ BitVec 32) Int) Unit!41790)

(assert (=> b!1255352 (= lt!567541 (lemmaNoChangeToArrayThenSameMapNoExtras!1051 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5687 (array!81520 array!81522 (_ BitVec 32) (_ BitVec 32) V!47947 V!47947 (_ BitVec 32) Int) ListLongMap!18573)

(assert (=> b!1255352 (= lt!567542 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255352 (= lt!567543 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255353 () Bool)

(declare-fun e!713458 () Bool)

(declare-fun tp_is_empty!31937 () Bool)

(assert (=> b!1255353 (= e!713458 tp_is_empty!31937)))

(declare-fun res!836933 () Bool)

(assert (=> start!105362 (=> (not res!836933) (not e!713457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105362 (= res!836933 (validMask!0 mask!1466))))

(assert (=> start!105362 e!713457))

(assert (=> start!105362 true))

(assert (=> start!105362 tp!94615))

(assert (=> start!105362 tp_is_empty!31937))

(declare-fun array_inv!29963 (array!81520) Bool)

(assert (=> start!105362 (array_inv!29963 _keys!1118)))

(declare-fun e!713455 () Bool)

(declare-fun array_inv!29964 (array!81522) Bool)

(assert (=> start!105362 (and (array_inv!29964 _values!914) e!713455)))

(declare-fun b!1255354 () Bool)

(declare-fun res!836934 () Bool)

(assert (=> b!1255354 (=> (not res!836934) (not e!713457))))

(assert (=> b!1255354 (= res!836934 (and (= (size!39857 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39856 _keys!1118) (size!39857 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49687 () Bool)

(declare-fun tp!94616 () Bool)

(declare-fun e!713454 () Bool)

(assert (=> mapNonEmpty!49687 (= mapRes!49687 (and tp!94616 e!713454))))

(declare-fun mapRest!49687 () (Array (_ BitVec 32) ValueCell!15205))

(declare-fun mapKey!49687 () (_ BitVec 32))

(declare-fun mapValue!49687 () ValueCell!15205)

(assert (=> mapNonEmpty!49687 (= (arr!39321 _values!914) (store mapRest!49687 mapKey!49687 mapValue!49687))))

(declare-fun b!1255355 () Bool)

(assert (=> b!1255355 (= e!713455 (and e!713458 mapRes!49687))))

(declare-fun condMapEmpty!49687 () Bool)

(declare-fun mapDefault!49687 () ValueCell!15205)

