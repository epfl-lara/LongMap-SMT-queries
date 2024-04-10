; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105078 () Bool)

(assert start!105078)

(declare-fun b_free!26825 () Bool)

(declare-fun b_next!26825 () Bool)

(assert (=> start!105078 (= b_free!26825 (not b_next!26825))))

(declare-fun tp!93974 () Bool)

(declare-fun b_and!44621 () Bool)

(assert (=> start!105078 (= tp!93974 b_and!44621)))

(declare-fun res!835159 () Bool)

(declare-fun e!711233 () Bool)

(assert (=> start!105078 (=> (not res!835159) (not e!711233))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105078 (= res!835159 (validMask!0 mask!1466))))

(assert (=> start!105078 e!711233))

(assert (=> start!105078 true))

(assert (=> start!105078 tp!93974))

(declare-fun tp_is_empty!31727 () Bool)

(assert (=> start!105078 tp_is_empty!31727))

(declare-datatypes ((array!81114 0))(
  ( (array!81115 (arr!39121 (Array (_ BitVec 32) (_ BitVec 64))) (size!39657 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81114)

(declare-fun array_inv!29837 (array!81114) Bool)

(assert (=> start!105078 (array_inv!29837 _keys!1118)))

(declare-datatypes ((V!47667 0))(
  ( (V!47668 (val!15926 Int)) )
))
(declare-datatypes ((ValueCell!15100 0))(
  ( (ValueCellFull!15100 (v!18624 V!47667)) (EmptyCell!15100) )
))
(declare-datatypes ((array!81116 0))(
  ( (array!81117 (arr!39122 (Array (_ BitVec 32) ValueCell!15100)) (size!39658 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81116)

(declare-fun e!711235 () Bool)

(declare-fun array_inv!29838 (array!81116) Bool)

(assert (=> start!105078 (and (array_inv!29838 _values!914) e!711235)))

(declare-fun b!1252284 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252284 (= e!711233 (not (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!39657 _keys!1118)))))))

(declare-datatypes ((tuple2!20542 0))(
  ( (tuple2!20543 (_1!10282 (_ BitVec 64)) (_2!10282 V!47667)) )
))
(declare-datatypes ((List!27774 0))(
  ( (Nil!27771) (Cons!27770 (h!28979 tuple2!20542) (t!41251 List!27774)) )
))
(declare-datatypes ((ListLongMap!18415 0))(
  ( (ListLongMap!18416 (toList!9223 List!27774)) )
))
(declare-fun lt!565256 () ListLongMap!18415)

(declare-fun lt!565258 () ListLongMap!18415)

(assert (=> b!1252284 (= lt!565256 lt!565258)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47667)

(declare-fun zeroValue!871 () V!47667)

(declare-fun minValueBefore!43 () V!47667)

(declare-datatypes ((Unit!41635 0))(
  ( (Unit!41636) )
))
(declare-fun lt!565257 () Unit!41635)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!983 (array!81114 array!81116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47667 V!47667 V!47667 V!47667 (_ BitVec 32) Int) Unit!41635)

(assert (=> b!1252284 (= lt!565257 (lemmaNoChangeToArrayThenSameMapNoExtras!983 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5619 (array!81114 array!81116 (_ BitVec 32) (_ BitVec 32) V!47667 V!47667 (_ BitVec 32) Int) ListLongMap!18415)

(assert (=> b!1252284 (= lt!565258 (getCurrentListMapNoExtraKeys!5619 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252284 (= lt!565256 (getCurrentListMapNoExtraKeys!5619 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252285 () Bool)

(declare-fun res!835160 () Bool)

(assert (=> b!1252285 (=> (not res!835160) (not e!711233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81114 (_ BitVec 32)) Bool)

(assert (=> b!1252285 (= res!835160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49360 () Bool)

(declare-fun mapRes!49360 () Bool)

(declare-fun tp!93973 () Bool)

(declare-fun e!711232 () Bool)

(assert (=> mapNonEmpty!49360 (= mapRes!49360 (and tp!93973 e!711232))))

(declare-fun mapKey!49360 () (_ BitVec 32))

(declare-fun mapValue!49360 () ValueCell!15100)

(declare-fun mapRest!49360 () (Array (_ BitVec 32) ValueCell!15100))

(assert (=> mapNonEmpty!49360 (= (arr!39122 _values!914) (store mapRest!49360 mapKey!49360 mapValue!49360))))

(declare-fun b!1252286 () Bool)

(declare-fun res!835158 () Bool)

(assert (=> b!1252286 (=> (not res!835158) (not e!711233))))

(assert (=> b!1252286 (= res!835158 (and (= (size!39658 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39657 _keys!1118) (size!39658 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49360 () Bool)

(assert (=> mapIsEmpty!49360 mapRes!49360))

(declare-fun b!1252287 () Bool)

(declare-fun res!835161 () Bool)

(assert (=> b!1252287 (=> (not res!835161) (not e!711233))))

(declare-datatypes ((List!27775 0))(
  ( (Nil!27772) (Cons!27771 (h!28980 (_ BitVec 64)) (t!41252 List!27775)) )
))
(declare-fun arrayNoDuplicates!0 (array!81114 (_ BitVec 32) List!27775) Bool)

(assert (=> b!1252287 (= res!835161 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27772))))

(declare-fun b!1252288 () Bool)

(declare-fun e!711234 () Bool)

(assert (=> b!1252288 (= e!711235 (and e!711234 mapRes!49360))))

(declare-fun condMapEmpty!49360 () Bool)

(declare-fun mapDefault!49360 () ValueCell!15100)

