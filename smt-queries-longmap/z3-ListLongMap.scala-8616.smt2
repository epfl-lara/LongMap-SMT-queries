; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105186 () Bool)

(assert start!105186)

(declare-fun b_free!26731 () Bool)

(declare-fun b_next!26731 () Bool)

(assert (=> start!105186 (= b_free!26731 (not b_next!26731))))

(declare-fun tp!93689 () Bool)

(declare-fun b_and!44519 () Bool)

(assert (=> start!105186 (= tp!93689 b_and!44519)))

(declare-fun b!1252323 () Bool)

(declare-fun e!711155 () Bool)

(declare-fun e!711156 () Bool)

(assert (=> b!1252323 (= e!711155 (not e!711156))))

(declare-fun res!834931 () Bool)

(assert (=> b!1252323 (=> res!834931 e!711156)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252323 (= res!834931 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47543 0))(
  ( (V!47544 (val!15879 Int)) )
))
(declare-datatypes ((tuple2!20500 0))(
  ( (tuple2!20501 (_1!10261 (_ BitVec 64)) (_2!10261 V!47543)) )
))
(declare-datatypes ((List!27748 0))(
  ( (Nil!27745) (Cons!27744 (h!28962 tuple2!20500) (t!41215 List!27748)) )
))
(declare-datatypes ((ListLongMap!18381 0))(
  ( (ListLongMap!18382 (toList!9206 List!27748)) )
))
(declare-fun lt!565073 () ListLongMap!18381)

(declare-fun lt!565071 () ListLongMap!18381)

(assert (=> b!1252323 (= lt!565073 lt!565071)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47543)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47543)

(declare-datatypes ((array!80981 0))(
  ( (array!80982 (arr!39051 (Array (_ BitVec 32) (_ BitVec 64))) (size!39588 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80981)

(declare-datatypes ((ValueCell!15053 0))(
  ( (ValueCellFull!15053 (v!18572 V!47543)) (EmptyCell!15053) )
))
(declare-datatypes ((array!80983 0))(
  ( (array!80984 (arr!39052 (Array (_ BitVec 32) ValueCell!15053)) (size!39589 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80983)

(declare-fun minValueBefore!43 () V!47543)

(declare-datatypes ((Unit!41550 0))(
  ( (Unit!41551) )
))
(declare-fun lt!565072 () Unit!41550)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!949 (array!80981 array!80983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 V!47543 V!47543 (_ BitVec 32) Int) Unit!41550)

(assert (=> b!1252323 (= lt!565072 (lemmaNoChangeToArrayThenSameMapNoExtras!949 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5635 (array!80981 array!80983 (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 (_ BitVec 32) Int) ListLongMap!18381)

(assert (=> b!1252323 (= lt!565071 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252323 (= lt!565073 (getCurrentListMapNoExtraKeys!5635 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834936 () Bool)

(assert (=> start!105186 (=> (not res!834936) (not e!711155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105186 (= res!834936 (validMask!0 mask!1466))))

(assert (=> start!105186 e!711155))

(assert (=> start!105186 true))

(assert (=> start!105186 tp!93689))

(declare-fun tp_is_empty!31633 () Bool)

(assert (=> start!105186 tp_is_empty!31633))

(declare-fun array_inv!29907 (array!80981) Bool)

(assert (=> start!105186 (array_inv!29907 _keys!1118)))

(declare-fun e!711153 () Bool)

(declare-fun array_inv!29908 (array!80983) Bool)

(assert (=> start!105186 (and (array_inv!29908 _values!914) e!711153)))

(declare-fun b!1252324 () Bool)

(declare-fun res!834932 () Bool)

(assert (=> b!1252324 (=> (not res!834932) (not e!711155))))

(declare-datatypes ((List!27749 0))(
  ( (Nil!27746) (Cons!27745 (h!28963 (_ BitVec 64)) (t!41216 List!27749)) )
))
(declare-fun arrayNoDuplicates!0 (array!80981 (_ BitVec 32) List!27749) Bool)

(assert (=> b!1252324 (= res!834932 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27746))))

(declare-fun b!1252325 () Bool)

(declare-fun res!834934 () Bool)

(assert (=> b!1252325 (=> (not res!834934) (not e!711155))))

(assert (=> b!1252325 (= res!834934 (and (= (size!39589 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39588 _keys!1118) (size!39589 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252326 () Bool)

(declare-fun e!711151 () Bool)

(assert (=> b!1252326 (= e!711151 tp_is_empty!31633)))

(declare-fun b!1252327 () Bool)

(declare-fun e!711157 () Bool)

(assert (=> b!1252327 (= e!711157 true)))

(declare-fun lt!565075 () ListLongMap!18381)

(declare-fun -!1992 (ListLongMap!18381 (_ BitVec 64)) ListLongMap!18381)

(assert (=> b!1252327 (= (-!1992 lt!565075 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565075)))

(declare-fun lt!565074 () Unit!41550)

(declare-fun removeNotPresentStillSame!102 (ListLongMap!18381 (_ BitVec 64)) Unit!41550)

(assert (=> b!1252327 (= lt!565074 (removeNotPresentStillSame!102 lt!565075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252328 () Bool)

(assert (=> b!1252328 (= e!711156 e!711157)))

(declare-fun res!834935 () Bool)

(assert (=> b!1252328 (=> res!834935 e!711157)))

(declare-fun contains!7530 (ListLongMap!18381 (_ BitVec 64)) Bool)

(assert (=> b!1252328 (= res!834935 (contains!7530 lt!565075 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4466 (array!80981 array!80983 (_ BitVec 32) (_ BitVec 32) V!47543 V!47543 (_ BitVec 32) Int) ListLongMap!18381)

(assert (=> b!1252328 (= lt!565075 (getCurrentListMap!4466 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49216 () Bool)

(declare-fun mapRes!49216 () Bool)

(assert (=> mapIsEmpty!49216 mapRes!49216))

(declare-fun mapNonEmpty!49216 () Bool)

(declare-fun tp!93688 () Bool)

(declare-fun e!711154 () Bool)

(assert (=> mapNonEmpty!49216 (= mapRes!49216 (and tp!93688 e!711154))))

(declare-fun mapKey!49216 () (_ BitVec 32))

(declare-fun mapValue!49216 () ValueCell!15053)

(declare-fun mapRest!49216 () (Array (_ BitVec 32) ValueCell!15053))

(assert (=> mapNonEmpty!49216 (= (arr!39052 _values!914) (store mapRest!49216 mapKey!49216 mapValue!49216))))

(declare-fun b!1252329 () Bool)

(assert (=> b!1252329 (= e!711153 (and e!711151 mapRes!49216))))

(declare-fun condMapEmpty!49216 () Bool)

(declare-fun mapDefault!49216 () ValueCell!15053)

(assert (=> b!1252329 (= condMapEmpty!49216 (= (arr!39052 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15053)) mapDefault!49216)))))

(declare-fun b!1252330 () Bool)

(declare-fun res!834933 () Bool)

(assert (=> b!1252330 (=> (not res!834933) (not e!711155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80981 (_ BitVec 32)) Bool)

(assert (=> b!1252330 (= res!834933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252331 () Bool)

(assert (=> b!1252331 (= e!711154 tp_is_empty!31633)))

(assert (= (and start!105186 res!834936) b!1252325))

(assert (= (and b!1252325 res!834934) b!1252330))

(assert (= (and b!1252330 res!834933) b!1252324))

(assert (= (and b!1252324 res!834932) b!1252323))

(assert (= (and b!1252323 (not res!834931)) b!1252328))

(assert (= (and b!1252328 (not res!834935)) b!1252327))

(assert (= (and b!1252329 condMapEmpty!49216) mapIsEmpty!49216))

(assert (= (and b!1252329 (not condMapEmpty!49216)) mapNonEmpty!49216))

(get-info :version)

(assert (= (and mapNonEmpty!49216 ((_ is ValueCellFull!15053) mapValue!49216)) b!1252331))

(assert (= (and b!1252329 ((_ is ValueCellFull!15053) mapDefault!49216)) b!1252326))

(assert (= start!105186 b!1252329))

(declare-fun m!1153413 () Bool)

(assert (=> start!105186 m!1153413))

(declare-fun m!1153415 () Bool)

(assert (=> start!105186 m!1153415))

(declare-fun m!1153417 () Bool)

(assert (=> start!105186 m!1153417))

(declare-fun m!1153419 () Bool)

(assert (=> b!1252328 m!1153419))

(declare-fun m!1153421 () Bool)

(assert (=> b!1252328 m!1153421))

(declare-fun m!1153423 () Bool)

(assert (=> b!1252323 m!1153423))

(declare-fun m!1153425 () Bool)

(assert (=> b!1252323 m!1153425))

(declare-fun m!1153427 () Bool)

(assert (=> b!1252323 m!1153427))

(declare-fun m!1153429 () Bool)

(assert (=> b!1252324 m!1153429))

(declare-fun m!1153431 () Bool)

(assert (=> b!1252327 m!1153431))

(declare-fun m!1153433 () Bool)

(assert (=> b!1252327 m!1153433))

(declare-fun m!1153435 () Bool)

(assert (=> b!1252330 m!1153435))

(declare-fun m!1153437 () Bool)

(assert (=> mapNonEmpty!49216 m!1153437))

(check-sat (not b!1252330) (not start!105186) (not b!1252328) (not b!1252324) tp_is_empty!31633 (not b!1252323) (not mapNonEmpty!49216) (not b_next!26731) b_and!44519 (not b!1252327))
(check-sat b_and!44519 (not b_next!26731))
