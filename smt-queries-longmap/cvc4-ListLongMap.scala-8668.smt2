; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105374 () Bool)

(assert start!105374)

(declare-fun b_free!27047 () Bool)

(declare-fun b_next!27047 () Bool)

(assert (=> start!105374 (= b_free!27047 (not b_next!27047))))

(declare-fun tp!94651 () Bool)

(declare-fun b_and!44885 () Bool)

(assert (=> start!105374 (= tp!94651 b_and!44885)))

(declare-fun b!1255477 () Bool)

(declare-fun res!837006 () Bool)

(declare-fun e!713545 () Bool)

(assert (=> b!1255477 (=> (not res!837006) (not e!713545))))

(declare-datatypes ((array!81542 0))(
  ( (array!81543 (arr!39331 (Array (_ BitVec 32) (_ BitVec 64))) (size!39867 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81542)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81542 (_ BitVec 32)) Bool)

(assert (=> b!1255477 (= res!837006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49705 () Bool)

(declare-fun mapRes!49705 () Bool)

(declare-fun tp!94652 () Bool)

(declare-fun e!713548 () Bool)

(assert (=> mapNonEmpty!49705 (= mapRes!49705 (and tp!94652 e!713548))))

(declare-datatypes ((V!47963 0))(
  ( (V!47964 (val!16037 Int)) )
))
(declare-datatypes ((ValueCell!15211 0))(
  ( (ValueCellFull!15211 (v!18737 V!47963)) (EmptyCell!15211) )
))
(declare-fun mapValue!49705 () ValueCell!15211)

(declare-fun mapRest!49705 () (Array (_ BitVec 32) ValueCell!15211))

(declare-datatypes ((array!81544 0))(
  ( (array!81545 (arr!39332 (Array (_ BitVec 32) ValueCell!15211)) (size!39868 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81544)

(declare-fun mapKey!49705 () (_ BitVec 32))

(assert (=> mapNonEmpty!49705 (= (arr!39332 _values!914) (store mapRest!49705 mapKey!49705 mapValue!49705))))

(declare-fun b!1255478 () Bool)

(declare-fun res!837005 () Bool)

(assert (=> b!1255478 (=> (not res!837005) (not e!713545))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1255478 (= res!837005 (and (= (size!39868 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39867 _keys!1118) (size!39868 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255479 () Bool)

(assert (=> b!1255479 (= e!713545 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!39867 _keys!1118)))))))

(declare-datatypes ((tuple2!20710 0))(
  ( (tuple2!20711 (_1!10366 (_ BitVec 64)) (_2!10366 V!47963)) )
))
(declare-datatypes ((List!27932 0))(
  ( (Nil!27929) (Cons!27928 (h!29137 tuple2!20710) (t!41417 List!27932)) )
))
(declare-datatypes ((ListLongMap!18583 0))(
  ( (ListLongMap!18584 (toList!9307 List!27932)) )
))
(declare-fun lt!567597 () ListLongMap!18583)

(declare-fun lt!567595 () ListLongMap!18583)

(assert (=> b!1255479 (= lt!567597 lt!567595)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41800 0))(
  ( (Unit!41801) )
))
(declare-fun lt!567596 () Unit!41800)

(declare-fun minValueAfter!43 () V!47963)

(declare-fun zeroValue!871 () V!47963)

(declare-fun minValueBefore!43 () V!47963)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1056 (array!81542 array!81544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47963 V!47963 V!47963 V!47963 (_ BitVec 32) Int) Unit!41800)

(assert (=> b!1255479 (= lt!567596 (lemmaNoChangeToArrayThenSameMapNoExtras!1056 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5692 (array!81542 array!81544 (_ BitVec 32) (_ BitVec 32) V!47963 V!47963 (_ BitVec 32) Int) ListLongMap!18583)

(assert (=> b!1255479 (= lt!567595 (getCurrentListMapNoExtraKeys!5692 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255479 (= lt!567597 (getCurrentListMapNoExtraKeys!5692 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255480 () Bool)

(declare-fun tp_is_empty!31949 () Bool)

(assert (=> b!1255480 (= e!713548 tp_is_empty!31949)))

(declare-fun res!837007 () Bool)

(assert (=> start!105374 (=> (not res!837007) (not e!713545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105374 (= res!837007 (validMask!0 mask!1466))))

(assert (=> start!105374 e!713545))

(assert (=> start!105374 true))

(assert (=> start!105374 tp!94651))

(assert (=> start!105374 tp_is_empty!31949))

(declare-fun array_inv!29969 (array!81542) Bool)

(assert (=> start!105374 (array_inv!29969 _keys!1118)))

(declare-fun e!713546 () Bool)

(declare-fun array_inv!29970 (array!81544) Bool)

(assert (=> start!105374 (and (array_inv!29970 _values!914) e!713546)))

(declare-fun b!1255481 () Bool)

(declare-fun e!713547 () Bool)

(assert (=> b!1255481 (= e!713547 tp_is_empty!31949)))

(declare-fun b!1255482 () Bool)

(assert (=> b!1255482 (= e!713546 (and e!713547 mapRes!49705))))

(declare-fun condMapEmpty!49705 () Bool)

(declare-fun mapDefault!49705 () ValueCell!15211)

