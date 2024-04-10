; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105098 () Bool)

(assert start!105098)

(declare-fun b_free!26831 () Bool)

(declare-fun b_next!26831 () Bool)

(assert (=> start!105098 (= b_free!26831 (not b_next!26831))))

(declare-fun tp!93994 () Bool)

(declare-fun b_and!44635 () Bool)

(assert (=> start!105098 (= tp!93994 b_and!44635)))

(declare-fun b!1252440 () Bool)

(declare-fun res!835237 () Bool)

(declare-fun e!711342 () Bool)

(assert (=> b!1252440 (=> (not res!835237) (not e!711342))))

(declare-datatypes ((array!81128 0))(
  ( (array!81129 (arr!39127 (Array (_ BitVec 32) (_ BitVec 64))) (size!39663 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81128)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81128 (_ BitVec 32)) Bool)

(assert (=> b!1252440 (= res!835237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49372 () Bool)

(declare-fun mapRes!49372 () Bool)

(assert (=> mapIsEmpty!49372 mapRes!49372))

(declare-fun b!1252441 () Bool)

(declare-fun e!711344 () Bool)

(assert (=> b!1252441 (= e!711344 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47675 0))(
  ( (V!47676 (val!15929 Int)) )
))
(declare-datatypes ((tuple2!20546 0))(
  ( (tuple2!20547 (_1!10284 (_ BitVec 64)) (_2!10284 V!47675)) )
))
(declare-datatypes ((List!27778 0))(
  ( (Nil!27775) (Cons!27774 (h!28983 tuple2!20546) (t!41257 List!27778)) )
))
(declare-datatypes ((ListLongMap!18419 0))(
  ( (ListLongMap!18420 (toList!9225 List!27778)) )
))
(declare-fun lt!565333 () ListLongMap!18419)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47675)

(declare-datatypes ((ValueCell!15103 0))(
  ( (ValueCellFull!15103 (v!18627 V!47675)) (EmptyCell!15103) )
))
(declare-datatypes ((array!81130 0))(
  ( (array!81131 (arr!39128 (Array (_ BitVec 32) ValueCell!15103)) (size!39664 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81130)

(declare-fun minValueBefore!43 () V!47675)

(declare-fun getCurrentListMap!4473 (array!81128 array!81130 (_ BitVec 32) (_ BitVec 32) V!47675 V!47675 (_ BitVec 32) Int) ListLongMap!18419)

(assert (=> b!1252441 (= lt!565333 (getCurrentListMap!4473 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252442 () Bool)

(declare-fun res!835233 () Bool)

(assert (=> b!1252442 (=> (not res!835233) (not e!711342))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252442 (= res!835233 (and (= (size!39664 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39663 _keys!1118) (size!39664 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835235 () Bool)

(assert (=> start!105098 (=> (not res!835235) (not e!711342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105098 (= res!835235 (validMask!0 mask!1466))))

(assert (=> start!105098 e!711342))

(assert (=> start!105098 true))

(assert (=> start!105098 tp!93994))

(declare-fun tp_is_empty!31733 () Bool)

(assert (=> start!105098 tp_is_empty!31733))

(declare-fun array_inv!29843 (array!81128) Bool)

(assert (=> start!105098 (array_inv!29843 _keys!1118)))

(declare-fun e!711340 () Bool)

(declare-fun array_inv!29844 (array!81130) Bool)

(assert (=> start!105098 (and (array_inv!29844 _values!914) e!711340)))

(declare-fun mapNonEmpty!49372 () Bool)

(declare-fun tp!93995 () Bool)

(declare-fun e!711343 () Bool)

(assert (=> mapNonEmpty!49372 (= mapRes!49372 (and tp!93995 e!711343))))

(declare-fun mapKey!49372 () (_ BitVec 32))

(declare-fun mapRest!49372 () (Array (_ BitVec 32) ValueCell!15103))

(declare-fun mapValue!49372 () ValueCell!15103)

(assert (=> mapNonEmpty!49372 (= (arr!39128 _values!914) (store mapRest!49372 mapKey!49372 mapValue!49372))))

(declare-fun b!1252443 () Bool)

(assert (=> b!1252443 (= e!711342 (not e!711344))))

(declare-fun res!835236 () Bool)

(assert (=> b!1252443 (=> res!835236 e!711344)))

(assert (=> b!1252443 (= res!835236 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565334 () ListLongMap!18419)

(declare-fun lt!565331 () ListLongMap!18419)

(assert (=> b!1252443 (= lt!565334 lt!565331)))

(declare-fun minValueAfter!43 () V!47675)

(declare-datatypes ((Unit!41639 0))(
  ( (Unit!41640) )
))
(declare-fun lt!565332 () Unit!41639)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!985 (array!81128 array!81130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47675 V!47675 V!47675 V!47675 (_ BitVec 32) Int) Unit!41639)

(assert (=> b!1252443 (= lt!565332 (lemmaNoChangeToArrayThenSameMapNoExtras!985 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5621 (array!81128 array!81130 (_ BitVec 32) (_ BitVec 32) V!47675 V!47675 (_ BitVec 32) Int) ListLongMap!18419)

(assert (=> b!1252443 (= lt!565331 (getCurrentListMapNoExtraKeys!5621 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252443 (= lt!565334 (getCurrentListMapNoExtraKeys!5621 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252444 () Bool)

(declare-fun e!711341 () Bool)

(assert (=> b!1252444 (= e!711341 tp_is_empty!31733)))

(declare-fun b!1252445 () Bool)

(assert (=> b!1252445 (= e!711343 tp_is_empty!31733)))

(declare-fun b!1252446 () Bool)

(declare-fun res!835234 () Bool)

(assert (=> b!1252446 (=> (not res!835234) (not e!711342))))

(declare-datatypes ((List!27779 0))(
  ( (Nil!27776) (Cons!27775 (h!28984 (_ BitVec 64)) (t!41258 List!27779)) )
))
(declare-fun arrayNoDuplicates!0 (array!81128 (_ BitVec 32) List!27779) Bool)

(assert (=> b!1252446 (= res!835234 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27776))))

(declare-fun b!1252447 () Bool)

(assert (=> b!1252447 (= e!711340 (and e!711341 mapRes!49372))))

(declare-fun condMapEmpty!49372 () Bool)

(declare-fun mapDefault!49372 () ValueCell!15103)

