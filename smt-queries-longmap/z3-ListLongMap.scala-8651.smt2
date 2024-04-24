; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105470 () Bool)

(assert start!105470)

(declare-fun b_free!26941 () Bool)

(declare-fun b_next!26941 () Bool)

(assert (=> start!105470 (= b_free!26941 (not b_next!26941))))

(declare-fun tp!94331 () Bool)

(declare-fun b_and!44769 () Bool)

(assert (=> start!105470 (= tp!94331 b_and!44769)))

(declare-fun mapNonEmpty!49543 () Bool)

(declare-fun mapRes!49543 () Bool)

(declare-fun tp!94330 () Bool)

(declare-fun e!713400 () Bool)

(assert (=> mapNonEmpty!49543 (= mapRes!49543 (and tp!94330 e!713400))))

(declare-datatypes ((V!47823 0))(
  ( (V!47824 (val!15984 Int)) )
))
(declare-datatypes ((ValueCell!15158 0))(
  ( (ValueCellFull!15158 (v!18679 V!47823)) (EmptyCell!15158) )
))
(declare-fun mapValue!49543 () ValueCell!15158)

(declare-datatypes ((array!81389 0))(
  ( (array!81390 (arr!39251 (Array (_ BitVec 32) ValueCell!15158)) (size!39788 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81389)

(declare-fun mapKey!49543 () (_ BitVec 32))

(declare-fun mapRest!49543 () (Array (_ BitVec 32) ValueCell!15158))

(assert (=> mapNonEmpty!49543 (= (arr!39251 _values!914) (store mapRest!49543 mapKey!49543 mapValue!49543))))

(declare-fun b!1255406 () Bool)

(declare-fun tp_is_empty!31843 () Bool)

(assert (=> b!1255406 (= e!713400 tp_is_empty!31843)))

(declare-fun mapIsEmpty!49543 () Bool)

(assert (=> mapIsEmpty!49543 mapRes!49543))

(declare-fun b!1255407 () Bool)

(declare-fun e!713403 () Bool)

(assert (=> b!1255407 (= e!713403 true)))

(declare-datatypes ((tuple2!20654 0))(
  ( (tuple2!20655 (_1!10338 (_ BitVec 64)) (_2!10338 V!47823)) )
))
(declare-datatypes ((List!27892 0))(
  ( (Nil!27889) (Cons!27888 (h!29106 tuple2!20654) (t!41367 List!27892)) )
))
(declare-datatypes ((ListLongMap!18535 0))(
  ( (ListLongMap!18536 (toList!9283 List!27892)) )
))
(declare-fun lt!567075 () ListLongMap!18535)

(declare-fun lt!567074 () ListLongMap!18535)

(declare-fun -!2023 (ListLongMap!18535 (_ BitVec 64)) ListLongMap!18535)

(assert (=> b!1255407 (= lt!567075 (-!2023 lt!567074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567069 () ListLongMap!18535)

(declare-fun lt!567070 () ListLongMap!18535)

(assert (=> b!1255407 (= (-!2023 lt!567069 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567070)))

(declare-datatypes ((Unit!41705 0))(
  ( (Unit!41706) )
))
(declare-fun lt!567072 () Unit!41705)

(declare-fun minValueBefore!43 () V!47823)

(declare-fun addThenRemoveForNewKeyIsSame!313 (ListLongMap!18535 (_ BitVec 64) V!47823) Unit!41705)

(assert (=> b!1255407 (= lt!567072 (addThenRemoveForNewKeyIsSame!313 lt!567070 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567071 () ListLongMap!18535)

(declare-fun lt!567076 () ListLongMap!18535)

(assert (=> b!1255407 (and (= lt!567074 lt!567069) (= lt!567071 lt!567076))))

(declare-fun +!4219 (ListLongMap!18535 tuple2!20654) ListLongMap!18535)

(assert (=> b!1255407 (= lt!567069 (+!4219 lt!567070 (tuple2!20655 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47823)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47823)

(declare-datatypes ((array!81391 0))(
  ( (array!81392 (arr!39252 (Array (_ BitVec 32) (_ BitVec 64))) (size!39789 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81391)

(declare-fun getCurrentListMap!4516 (array!81391 array!81389 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18535)

(assert (=> b!1255407 (= lt!567071 (getCurrentListMap!4516 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255407 (= lt!567074 (getCurrentListMap!4516 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255409 () Bool)

(declare-fun res!836727 () Bool)

(declare-fun e!713402 () Bool)

(assert (=> b!1255409 (=> (not res!836727) (not e!713402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81391 (_ BitVec 32)) Bool)

(assert (=> b!1255409 (= res!836727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255410 () Bool)

(declare-fun e!713398 () Bool)

(assert (=> b!1255410 (= e!713398 tp_is_empty!31843)))

(declare-fun b!1255411 () Bool)

(declare-fun e!713399 () Bool)

(assert (=> b!1255411 (= e!713399 (and e!713398 mapRes!49543))))

(declare-fun condMapEmpty!49543 () Bool)

(declare-fun mapDefault!49543 () ValueCell!15158)

(assert (=> b!1255411 (= condMapEmpty!49543 (= (arr!39251 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15158)) mapDefault!49543)))))

(declare-fun res!836728 () Bool)

(assert (=> start!105470 (=> (not res!836728) (not e!713402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105470 (= res!836728 (validMask!0 mask!1466))))

(assert (=> start!105470 e!713402))

(assert (=> start!105470 true))

(assert (=> start!105470 tp!94331))

(assert (=> start!105470 tp_is_empty!31843))

(declare-fun array_inv!30041 (array!81391) Bool)

(assert (=> start!105470 (array_inv!30041 _keys!1118)))

(declare-fun array_inv!30042 (array!81389) Bool)

(assert (=> start!105470 (and (array_inv!30042 _values!914) e!713399)))

(declare-fun b!1255408 () Bool)

(assert (=> b!1255408 (= e!713402 (not e!713403))))

(declare-fun res!836730 () Bool)

(assert (=> b!1255408 (=> res!836730 e!713403)))

(assert (=> b!1255408 (= res!836730 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255408 (= lt!567070 lt!567076)))

(declare-fun lt!567073 () Unit!41705)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1021 (array!81391 array!81389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 V!47823 V!47823 (_ BitVec 32) Int) Unit!41705)

(assert (=> b!1255408 (= lt!567073 (lemmaNoChangeToArrayThenSameMapNoExtras!1021 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5707 (array!81391 array!81389 (_ BitVec 32) (_ BitVec 32) V!47823 V!47823 (_ BitVec 32) Int) ListLongMap!18535)

(assert (=> b!1255408 (= lt!567076 (getCurrentListMapNoExtraKeys!5707 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255408 (= lt!567070 (getCurrentListMapNoExtraKeys!5707 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255412 () Bool)

(declare-fun res!836729 () Bool)

(assert (=> b!1255412 (=> (not res!836729) (not e!713402))))

(assert (=> b!1255412 (= res!836729 (and (= (size!39788 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39789 _keys!1118) (size!39788 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255413 () Bool)

(declare-fun res!836731 () Bool)

(assert (=> b!1255413 (=> (not res!836731) (not e!713402))))

(declare-datatypes ((List!27893 0))(
  ( (Nil!27890) (Cons!27889 (h!29107 (_ BitVec 64)) (t!41368 List!27893)) )
))
(declare-fun arrayNoDuplicates!0 (array!81391 (_ BitVec 32) List!27893) Bool)

(assert (=> b!1255413 (= res!836731 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27890))))

(assert (= (and start!105470 res!836728) b!1255412))

(assert (= (and b!1255412 res!836729) b!1255409))

(assert (= (and b!1255409 res!836727) b!1255413))

(assert (= (and b!1255413 res!836731) b!1255408))

(assert (= (and b!1255408 (not res!836730)) b!1255407))

(assert (= (and b!1255411 condMapEmpty!49543) mapIsEmpty!49543))

(assert (= (and b!1255411 (not condMapEmpty!49543)) mapNonEmpty!49543))

(get-info :version)

(assert (= (and mapNonEmpty!49543 ((_ is ValueCellFull!15158) mapValue!49543)) b!1255406))

(assert (= (and b!1255411 ((_ is ValueCellFull!15158) mapDefault!49543)) b!1255410))

(assert (= start!105470 b!1255411))

(declare-fun m!1156361 () Bool)

(assert (=> mapNonEmpty!49543 m!1156361))

(declare-fun m!1156363 () Bool)

(assert (=> b!1255407 m!1156363))

(declare-fun m!1156365 () Bool)

(assert (=> b!1255407 m!1156365))

(declare-fun m!1156367 () Bool)

(assert (=> b!1255407 m!1156367))

(declare-fun m!1156369 () Bool)

(assert (=> b!1255407 m!1156369))

(declare-fun m!1156371 () Bool)

(assert (=> b!1255407 m!1156371))

(declare-fun m!1156373 () Bool)

(assert (=> b!1255407 m!1156373))

(declare-fun m!1156375 () Bool)

(assert (=> start!105470 m!1156375))

(declare-fun m!1156377 () Bool)

(assert (=> start!105470 m!1156377))

(declare-fun m!1156379 () Bool)

(assert (=> start!105470 m!1156379))

(declare-fun m!1156381 () Bool)

(assert (=> b!1255409 m!1156381))

(declare-fun m!1156383 () Bool)

(assert (=> b!1255408 m!1156383))

(declare-fun m!1156385 () Bool)

(assert (=> b!1255408 m!1156385))

(declare-fun m!1156387 () Bool)

(assert (=> b!1255408 m!1156387))

(declare-fun m!1156389 () Bool)

(assert (=> b!1255413 m!1156389))

(check-sat b_and!44769 (not b!1255413) (not b!1255407) tp_is_empty!31843 (not b!1255408) (not mapNonEmpty!49543) (not start!105470) (not b!1255409) (not b_next!26941))
(check-sat b_and!44769 (not b_next!26941))
