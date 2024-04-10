; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104968 () Bool)

(assert start!104968)

(declare-fun b_free!26737 () Bool)

(declare-fun b_next!26737 () Bool)

(assert (=> start!104968 (= b_free!26737 (not b_next!26737))))

(declare-fun tp!93706 () Bool)

(declare-fun b_and!44523 () Bool)

(assert (=> start!104968 (= tp!93706 b_and!44523)))

(declare-fun b!1251099 () Bool)

(declare-fun e!710369 () Bool)

(declare-fun e!710373 () Bool)

(assert (=> b!1251099 (= e!710369 (not e!710373))))

(declare-fun res!834466 () Bool)

(assert (=> b!1251099 (=> res!834466 e!710373)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251099 (= res!834466 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47551 0))(
  ( (V!47552 (val!15882 Int)) )
))
(declare-datatypes ((tuple2!20470 0))(
  ( (tuple2!20471 (_1!10246 (_ BitVec 64)) (_2!10246 V!47551)) )
))
(declare-datatypes ((List!27705 0))(
  ( (Nil!27702) (Cons!27701 (h!28910 tuple2!20470) (t!41180 List!27705)) )
))
(declare-datatypes ((ListLongMap!18343 0))(
  ( (ListLongMap!18344 (toList!9187 List!27705)) )
))
(declare-fun lt!564633 () ListLongMap!18343)

(declare-fun lt!564635 () ListLongMap!18343)

(assert (=> b!1251099 (= lt!564633 lt!564635)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47551)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47551)

(declare-datatypes ((array!80942 0))(
  ( (array!80943 (arr!39036 (Array (_ BitVec 32) (_ BitVec 64))) (size!39572 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80942)

(declare-datatypes ((ValueCell!15056 0))(
  ( (ValueCellFull!15056 (v!18579 V!47551)) (EmptyCell!15056) )
))
(declare-datatypes ((array!80944 0))(
  ( (array!80945 (arr!39037 (Array (_ BitVec 32) ValueCell!15056)) (size!39573 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80944)

(declare-datatypes ((Unit!41563 0))(
  ( (Unit!41564) )
))
(declare-fun lt!564636 () Unit!41563)

(declare-fun minValueBefore!43 () V!47551)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!950 (array!80942 array!80944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 V!47551 V!47551 (_ BitVec 32) Int) Unit!41563)

(assert (=> b!1251099 (= lt!564636 (lemmaNoChangeToArrayThenSameMapNoExtras!950 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5586 (array!80942 array!80944 (_ BitVec 32) (_ BitVec 32) V!47551 V!47551 (_ BitVec 32) Int) ListLongMap!18343)

(assert (=> b!1251099 (= lt!564635 (getCurrentListMapNoExtraKeys!5586 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251099 (= lt!564633 (getCurrentListMapNoExtraKeys!5586 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251100 () Bool)

(declare-fun e!710367 () Bool)

(declare-fun tp_is_empty!31639 () Bool)

(assert (=> b!1251100 (= e!710367 tp_is_empty!31639)))

(declare-fun res!834467 () Bool)

(assert (=> start!104968 (=> (not res!834467) (not e!710369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104968 (= res!834467 (validMask!0 mask!1466))))

(assert (=> start!104968 e!710369))

(assert (=> start!104968 true))

(assert (=> start!104968 tp!93706))

(assert (=> start!104968 tp_is_empty!31639))

(declare-fun array_inv!29777 (array!80942) Bool)

(assert (=> start!104968 (array_inv!29777 _keys!1118)))

(declare-fun e!710370 () Bool)

(declare-fun array_inv!29778 (array!80944) Bool)

(assert (=> start!104968 (and (array_inv!29778 _values!914) e!710370)))

(declare-fun b!1251101 () Bool)

(declare-fun res!834470 () Bool)

(assert (=> b!1251101 (=> (not res!834470) (not e!710369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80942 (_ BitVec 32)) Bool)

(assert (=> b!1251101 (= res!834470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251102 () Bool)

(declare-fun e!710368 () Bool)

(assert (=> b!1251102 (= e!710368 true)))

(declare-fun lt!564632 () ListLongMap!18343)

(declare-fun -!2010 (ListLongMap!18343 (_ BitVec 64)) ListLongMap!18343)

(assert (=> b!1251102 (= (-!2010 lt!564632 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564632)))

(declare-fun lt!564634 () Unit!41563)

(declare-fun removeNotPresentStillSame!105 (ListLongMap!18343 (_ BitVec 64)) Unit!41563)

(assert (=> b!1251102 (= lt!564634 (removeNotPresentStillSame!105 lt!564632 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251103 () Bool)

(declare-fun res!834468 () Bool)

(assert (=> b!1251103 (=> (not res!834468) (not e!710369))))

(declare-datatypes ((List!27706 0))(
  ( (Nil!27703) (Cons!27702 (h!28911 (_ BitVec 64)) (t!41181 List!27706)) )
))
(declare-fun arrayNoDuplicates!0 (array!80942 (_ BitVec 32) List!27706) Bool)

(assert (=> b!1251103 (= res!834468 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27703))))

(declare-fun b!1251104 () Bool)

(declare-fun res!834469 () Bool)

(assert (=> b!1251104 (=> (not res!834469) (not e!710369))))

(assert (=> b!1251104 (= res!834469 (and (= (size!39573 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39572 _keys!1118) (size!39573 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251105 () Bool)

(declare-fun e!710371 () Bool)

(assert (=> b!1251105 (= e!710371 tp_is_empty!31639)))

(declare-fun mapIsEmpty!49225 () Bool)

(declare-fun mapRes!49225 () Bool)

(assert (=> mapIsEmpty!49225 mapRes!49225))

(declare-fun mapNonEmpty!49225 () Bool)

(declare-fun tp!93707 () Bool)

(assert (=> mapNonEmpty!49225 (= mapRes!49225 (and tp!93707 e!710371))))

(declare-fun mapRest!49225 () (Array (_ BitVec 32) ValueCell!15056))

(declare-fun mapValue!49225 () ValueCell!15056)

(declare-fun mapKey!49225 () (_ BitVec 32))

(assert (=> mapNonEmpty!49225 (= (arr!39037 _values!914) (store mapRest!49225 mapKey!49225 mapValue!49225))))

(declare-fun b!1251106 () Bool)

(assert (=> b!1251106 (= e!710370 (and e!710367 mapRes!49225))))

(declare-fun condMapEmpty!49225 () Bool)

(declare-fun mapDefault!49225 () ValueCell!15056)

