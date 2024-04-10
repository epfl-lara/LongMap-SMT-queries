; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105252 () Bool)

(assert start!105252)

(declare-fun b_free!26947 () Bool)

(declare-fun b_next!26947 () Bool)

(assert (=> start!105252 (= b_free!26947 (not b_next!26947))))

(declare-fun tp!94349 () Bool)

(declare-fun b_and!44773 () Bool)

(assert (=> start!105252 (= tp!94349 b_and!44773)))

(declare-fun b!1254173 () Bool)

(declare-fun res!836255 () Bool)

(declare-fun e!712609 () Bool)

(assert (=> b!1254173 (=> (not res!836255) (not e!712609))))

(declare-datatypes ((array!81356 0))(
  ( (array!81357 (arr!39239 (Array (_ BitVec 32) (_ BitVec 64))) (size!39775 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81356)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81356 (_ BitVec 32)) Bool)

(assert (=> b!1254173 (= res!836255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254174 () Bool)

(declare-fun e!712606 () Bool)

(assert (=> b!1254174 (= e!712609 (not e!712606))))

(declare-fun res!836256 () Bool)

(assert (=> b!1254174 (=> res!836256 e!712606)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254174 (= res!836256 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47831 0))(
  ( (V!47832 (val!15987 Int)) )
))
(declare-datatypes ((tuple2!20638 0))(
  ( (tuple2!20639 (_1!10330 (_ BitVec 64)) (_2!10330 V!47831)) )
))
(declare-datatypes ((List!27865 0))(
  ( (Nil!27862) (Cons!27861 (h!29070 tuple2!20638) (t!41348 List!27865)) )
))
(declare-datatypes ((ListLongMap!18511 0))(
  ( (ListLongMap!18512 (toList!9271 List!27865)) )
))
(declare-fun lt!566662 () ListLongMap!18511)

(declare-fun lt!566658 () ListLongMap!18511)

(assert (=> b!1254174 (= lt!566662 lt!566658)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47831)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47831)

(declare-datatypes ((Unit!41726 0))(
  ( (Unit!41727) )
))
(declare-fun lt!566659 () Unit!41726)

(declare-datatypes ((ValueCell!15161 0))(
  ( (ValueCellFull!15161 (v!18686 V!47831)) (EmptyCell!15161) )
))
(declare-datatypes ((array!81358 0))(
  ( (array!81359 (arr!39240 (Array (_ BitVec 32) ValueCell!15161)) (size!39776 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81358)

(declare-fun minValueBefore!43 () V!47831)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1023 (array!81356 array!81358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 V!47831 V!47831 (_ BitVec 32) Int) Unit!41726)

(assert (=> b!1254174 (= lt!566659 (lemmaNoChangeToArrayThenSameMapNoExtras!1023 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5659 (array!81356 array!81358 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18511)

(assert (=> b!1254174 (= lt!566658 (getCurrentListMapNoExtraKeys!5659 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254174 (= lt!566662 (getCurrentListMapNoExtraKeys!5659 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836253 () Bool)

(assert (=> start!105252 (=> (not res!836253) (not e!712609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105252 (= res!836253 (validMask!0 mask!1466))))

(assert (=> start!105252 e!712609))

(assert (=> start!105252 true))

(assert (=> start!105252 tp!94349))

(declare-fun tp_is_empty!31849 () Bool)

(assert (=> start!105252 tp_is_empty!31849))

(declare-fun array_inv!29915 (array!81356) Bool)

(assert (=> start!105252 (array_inv!29915 _keys!1118)))

(declare-fun e!712607 () Bool)

(declare-fun array_inv!29916 (array!81358) Bool)

(assert (=> start!105252 (and (array_inv!29916 _values!914) e!712607)))

(declare-fun mapIsEmpty!49552 () Bool)

(declare-fun mapRes!49552 () Bool)

(assert (=> mapIsEmpty!49552 mapRes!49552))

(declare-fun b!1254175 () Bool)

(declare-fun e!712610 () Bool)

(assert (=> b!1254175 (= e!712610 tp_is_empty!31849)))

(declare-fun mapNonEmpty!49552 () Bool)

(declare-fun tp!94348 () Bool)

(declare-fun e!712605 () Bool)

(assert (=> mapNonEmpty!49552 (= mapRes!49552 (and tp!94348 e!712605))))

(declare-fun mapRest!49552 () (Array (_ BitVec 32) ValueCell!15161))

(declare-fun mapKey!49552 () (_ BitVec 32))

(declare-fun mapValue!49552 () ValueCell!15161)

(assert (=> mapNonEmpty!49552 (= (arr!39240 _values!914) (store mapRest!49552 mapKey!49552 mapValue!49552))))

(declare-fun b!1254176 () Bool)

(assert (=> b!1254176 (= e!712606 true)))

(declare-fun lt!566657 () ListLongMap!18511)

(declare-fun lt!566663 () ListLongMap!18511)

(declare-fun -!2044 (ListLongMap!18511 (_ BitVec 64)) ListLongMap!18511)

(assert (=> b!1254176 (= lt!566657 (-!2044 lt!566663 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566660 () ListLongMap!18511)

(assert (=> b!1254176 (= (-!2044 lt!566660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566662)))

(declare-fun lt!566664 () Unit!41726)

(declare-fun addThenRemoveForNewKeyIsSame!314 (ListLongMap!18511 (_ BitVec 64) V!47831) Unit!41726)

(assert (=> b!1254176 (= lt!566664 (addThenRemoveForNewKeyIsSame!314 lt!566662 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566661 () ListLongMap!18511)

(assert (=> b!1254176 (and (= lt!566663 lt!566660) (= lt!566661 lt!566658))))

(declare-fun +!4167 (ListLongMap!18511 tuple2!20638) ListLongMap!18511)

(assert (=> b!1254176 (= lt!566660 (+!4167 lt!566662 (tuple2!20639 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4515 (array!81356 array!81358 (_ BitVec 32) (_ BitVec 32) V!47831 V!47831 (_ BitVec 32) Int) ListLongMap!18511)

(assert (=> b!1254176 (= lt!566661 (getCurrentListMap!4515 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254176 (= lt!566663 (getCurrentListMap!4515 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254177 () Bool)

(declare-fun res!836252 () Bool)

(assert (=> b!1254177 (=> (not res!836252) (not e!712609))))

(declare-datatypes ((List!27866 0))(
  ( (Nil!27863) (Cons!27862 (h!29071 (_ BitVec 64)) (t!41349 List!27866)) )
))
(declare-fun arrayNoDuplicates!0 (array!81356 (_ BitVec 32) List!27866) Bool)

(assert (=> b!1254177 (= res!836252 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27863))))

(declare-fun b!1254178 () Bool)

(assert (=> b!1254178 (= e!712607 (and e!712610 mapRes!49552))))

(declare-fun condMapEmpty!49552 () Bool)

(declare-fun mapDefault!49552 () ValueCell!15161)

