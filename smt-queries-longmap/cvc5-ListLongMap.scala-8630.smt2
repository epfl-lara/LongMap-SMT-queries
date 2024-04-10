; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105068 () Bool)

(assert start!105068)

(declare-fun b_free!26815 () Bool)

(declare-fun b_next!26815 () Bool)

(assert (=> start!105068 (= b_free!26815 (not b_next!26815))))

(declare-fun tp!93943 () Bool)

(declare-fun b_and!44611 () Bool)

(assert (=> start!105068 (= tp!93943 b_and!44611)))

(declare-fun mapIsEmpty!49345 () Bool)

(declare-fun mapRes!49345 () Bool)

(assert (=> mapIsEmpty!49345 mapRes!49345))

(declare-fun b!1252179 () Bool)

(declare-fun res!835098 () Bool)

(declare-fun e!711157 () Bool)

(assert (=> b!1252179 (=> (not res!835098) (not e!711157))))

(declare-datatypes ((array!81094 0))(
  ( (array!81095 (arr!39111 (Array (_ BitVec 32) (_ BitVec 64))) (size!39647 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81094)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81094 (_ BitVec 32)) Bool)

(assert (=> b!1252179 (= res!835098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835101 () Bool)

(assert (=> start!105068 (=> (not res!835101) (not e!711157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105068 (= res!835101 (validMask!0 mask!1466))))

(assert (=> start!105068 e!711157))

(assert (=> start!105068 true))

(assert (=> start!105068 tp!93943))

(declare-fun tp_is_empty!31717 () Bool)

(assert (=> start!105068 tp_is_empty!31717))

(declare-fun array_inv!29831 (array!81094) Bool)

(assert (=> start!105068 (array_inv!29831 _keys!1118)))

(declare-datatypes ((V!47655 0))(
  ( (V!47656 (val!15921 Int)) )
))
(declare-datatypes ((ValueCell!15095 0))(
  ( (ValueCellFull!15095 (v!18619 V!47655)) (EmptyCell!15095) )
))
(declare-datatypes ((array!81096 0))(
  ( (array!81097 (arr!39112 (Array (_ BitVec 32) ValueCell!15095)) (size!39648 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81096)

(declare-fun e!711156 () Bool)

(declare-fun array_inv!29832 (array!81096) Bool)

(assert (=> start!105068 (and (array_inv!29832 _values!914) e!711156)))

(declare-fun b!1252180 () Bool)

(declare-fun e!711159 () Bool)

(assert (=> b!1252180 (= e!711159 tp_is_empty!31717)))

(declare-fun b!1252181 () Bool)

(declare-fun res!835099 () Bool)

(assert (=> b!1252181 (=> (not res!835099) (not e!711157))))

(declare-datatypes ((List!27766 0))(
  ( (Nil!27763) (Cons!27762 (h!28971 (_ BitVec 64)) (t!41243 List!27766)) )
))
(declare-fun arrayNoDuplicates!0 (array!81094 (_ BitVec 32) List!27766) Bool)

(assert (=> b!1252181 (= res!835099 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27763))))

(declare-fun b!1252182 () Bool)

(assert (=> b!1252182 (= e!711157 (not true))))

(declare-datatypes ((tuple2!20534 0))(
  ( (tuple2!20535 (_1!10278 (_ BitVec 64)) (_2!10278 V!47655)) )
))
(declare-datatypes ((List!27767 0))(
  ( (Nil!27764) (Cons!27763 (h!28972 tuple2!20534) (t!41244 List!27767)) )
))
(declare-datatypes ((ListLongMap!18407 0))(
  ( (ListLongMap!18408 (toList!9219 List!27767)) )
))
(declare-fun lt!565212 () ListLongMap!18407)

(declare-fun lt!565211 () ListLongMap!18407)

(assert (=> b!1252182 (= lt!565212 lt!565211)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47655)

(declare-fun minValueBefore!43 () V!47655)

(declare-datatypes ((Unit!41627 0))(
  ( (Unit!41628) )
))
(declare-fun lt!565213 () Unit!41627)

(declare-fun minValueAfter!43 () V!47655)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!979 (array!81094 array!81096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 V!47655 V!47655 (_ BitVec 32) Int) Unit!41627)

(assert (=> b!1252182 (= lt!565213 (lemmaNoChangeToArrayThenSameMapNoExtras!979 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5615 (array!81094 array!81096 (_ BitVec 32) (_ BitVec 32) V!47655 V!47655 (_ BitVec 32) Int) ListLongMap!18407)

(assert (=> b!1252182 (= lt!565211 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252182 (= lt!565212 (getCurrentListMapNoExtraKeys!5615 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252183 () Bool)

(declare-fun e!711158 () Bool)

(assert (=> b!1252183 (= e!711158 tp_is_empty!31717)))

(declare-fun b!1252184 () Bool)

(declare-fun res!835100 () Bool)

(assert (=> b!1252184 (=> (not res!835100) (not e!711157))))

(assert (=> b!1252184 (= res!835100 (and (= (size!39648 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39647 _keys!1118) (size!39648 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49345 () Bool)

(declare-fun tp!93944 () Bool)

(assert (=> mapNonEmpty!49345 (= mapRes!49345 (and tp!93944 e!711158))))

(declare-fun mapRest!49345 () (Array (_ BitVec 32) ValueCell!15095))

(declare-fun mapValue!49345 () ValueCell!15095)

(declare-fun mapKey!49345 () (_ BitVec 32))

(assert (=> mapNonEmpty!49345 (= (arr!39112 _values!914) (store mapRest!49345 mapKey!49345 mapValue!49345))))

(declare-fun b!1252185 () Bool)

(assert (=> b!1252185 (= e!711156 (and e!711159 mapRes!49345))))

(declare-fun condMapEmpty!49345 () Bool)

(declare-fun mapDefault!49345 () ValueCell!15095)

