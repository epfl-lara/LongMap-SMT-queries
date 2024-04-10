; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105124 () Bool)

(assert start!105124)

(declare-fun b_free!26857 () Bool)

(declare-fun b_next!26857 () Bool)

(assert (=> start!105124 (= b_free!26857 (not b_next!26857))))

(declare-fun tp!94073 () Bool)

(declare-fun b_and!44661 () Bool)

(assert (=> start!105124 (= tp!94073 b_and!44661)))

(declare-fun b!1252752 () Bool)

(declare-fun e!711576 () Bool)

(declare-fun tp_is_empty!31759 () Bool)

(assert (=> b!1252752 (= e!711576 tp_is_empty!31759)))

(declare-fun res!835432 () Bool)

(declare-fun e!711577 () Bool)

(assert (=> start!105124 (=> (not res!835432) (not e!711577))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105124 (= res!835432 (validMask!0 mask!1466))))

(assert (=> start!105124 e!711577))

(assert (=> start!105124 true))

(assert (=> start!105124 tp!94073))

(assert (=> start!105124 tp_is_empty!31759))

(declare-datatypes ((array!81180 0))(
  ( (array!81181 (arr!39153 (Array (_ BitVec 32) (_ BitVec 64))) (size!39689 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81180)

(declare-fun array_inv!29859 (array!81180) Bool)

(assert (=> start!105124 (array_inv!29859 _keys!1118)))

(declare-datatypes ((V!47711 0))(
  ( (V!47712 (val!15942 Int)) )
))
(declare-datatypes ((ValueCell!15116 0))(
  ( (ValueCellFull!15116 (v!18640 V!47711)) (EmptyCell!15116) )
))
(declare-datatypes ((array!81182 0))(
  ( (array!81183 (arr!39154 (Array (_ BitVec 32) ValueCell!15116)) (size!39690 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81182)

(declare-fun e!711573 () Bool)

(declare-fun array_inv!29860 (array!81182) Bool)

(assert (=> start!105124 (and (array_inv!29860 _values!914) e!711573)))

(declare-fun b!1252753 () Bool)

(declare-fun e!711578 () Bool)

(assert (=> b!1252753 (= e!711577 (not e!711578))))

(declare-fun res!835430 () Bool)

(assert (=> b!1252753 (=> res!835430 e!711578)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252753 (= res!835430 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20566 0))(
  ( (tuple2!20567 (_1!10294 (_ BitVec 64)) (_2!10294 V!47711)) )
))
(declare-datatypes ((List!27799 0))(
  ( (Nil!27796) (Cons!27795 (h!29004 tuple2!20566) (t!41278 List!27799)) )
))
(declare-datatypes ((ListLongMap!18439 0))(
  ( (ListLongMap!18440 (toList!9235 List!27799)) )
))
(declare-fun lt!565490 () ListLongMap!18439)

(declare-fun lt!565488 () ListLongMap!18439)

(assert (=> b!1252753 (= lt!565490 lt!565488)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47711)

(declare-fun zeroValue!871 () V!47711)

(declare-fun minValueBefore!43 () V!47711)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41657 0))(
  ( (Unit!41658) )
))
(declare-fun lt!565487 () Unit!41657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!994 (array!81180 array!81182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 V!47711 V!47711 (_ BitVec 32) Int) Unit!41657)

(assert (=> b!1252753 (= lt!565487 (lemmaNoChangeToArrayThenSameMapNoExtras!994 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5630 (array!81180 array!81182 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18439)

(assert (=> b!1252753 (= lt!565488 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252753 (= lt!565490 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252754 () Bool)

(declare-fun res!835429 () Bool)

(assert (=> b!1252754 (=> (not res!835429) (not e!711577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81180 (_ BitVec 32)) Bool)

(assert (=> b!1252754 (= res!835429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252755 () Bool)

(declare-fun e!711574 () Bool)

(assert (=> b!1252755 (= e!711574 tp_is_empty!31759)))

(declare-fun b!1252756 () Bool)

(assert (=> b!1252756 (= e!711578 true)))

(declare-fun lt!565489 () ListLongMap!18439)

(declare-fun getCurrentListMap!4483 (array!81180 array!81182 (_ BitVec 32) (_ BitVec 32) V!47711 V!47711 (_ BitVec 32) Int) ListLongMap!18439)

(assert (=> b!1252756 (= lt!565489 (getCurrentListMap!4483 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252757 () Bool)

(declare-fun res!835428 () Bool)

(assert (=> b!1252757 (=> (not res!835428) (not e!711577))))

(assert (=> b!1252757 (= res!835428 (and (= (size!39690 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39689 _keys!1118) (size!39690 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252758 () Bool)

(declare-fun mapRes!49411 () Bool)

(assert (=> b!1252758 (= e!711573 (and e!711576 mapRes!49411))))

(declare-fun condMapEmpty!49411 () Bool)

(declare-fun mapDefault!49411 () ValueCell!15116)

