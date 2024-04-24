; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105400 () Bool)

(assert start!105400)

(declare-fun b_free!26893 () Bool)

(declare-fun b_next!26893 () Bool)

(assert (=> start!105400 (= b_free!26893 (not b_next!26893))))

(declare-fun tp!94183 () Bool)

(declare-fun b_and!44709 () Bool)

(assert (=> start!105400 (= tp!94183 b_and!44709)))

(declare-fun b!1254646 () Bool)

(declare-fun res!836289 () Bool)

(declare-fun e!712848 () Bool)

(assert (=> b!1254646 (=> (not res!836289) (not e!712848))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81293 0))(
  ( (array!81294 (arr!39204 (Array (_ BitVec 32) (_ BitVec 64))) (size!39741 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81293)

(declare-datatypes ((V!47759 0))(
  ( (V!47760 (val!15960 Int)) )
))
(declare-datatypes ((ValueCell!15134 0))(
  ( (ValueCellFull!15134 (v!18654 V!47759)) (EmptyCell!15134) )
))
(declare-datatypes ((array!81295 0))(
  ( (array!81296 (arr!39205 (Array (_ BitVec 32) ValueCell!15134)) (size!39742 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81295)

(assert (=> b!1254646 (= res!836289 (and (= (size!39742 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39741 _keys!1118) (size!39742 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254647 () Bool)

(declare-fun e!712849 () Bool)

(assert (=> b!1254647 (= e!712848 (not e!712849))))

(declare-fun res!836288 () Bool)

(assert (=> b!1254647 (=> res!836288 e!712849)))

(assert (=> b!1254647 (= res!836288 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20612 0))(
  ( (tuple2!20613 (_1!10317 (_ BitVec 64)) (_2!10317 V!47759)) )
))
(declare-datatypes ((List!27850 0))(
  ( (Nil!27847) (Cons!27846 (h!29064 tuple2!20612) (t!41323 List!27850)) )
))
(declare-datatypes ((ListLongMap!18493 0))(
  ( (ListLongMap!18494 (toList!9262 List!27850)) )
))
(declare-fun lt!566356 () ListLongMap!18493)

(declare-fun lt!566361 () ListLongMap!18493)

(assert (=> b!1254647 (= lt!566356 lt!566361)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47759)

(declare-fun zeroValue!871 () V!47759)

(declare-datatypes ((Unit!41661 0))(
  ( (Unit!41662) )
))
(declare-fun lt!566357 () Unit!41661)

(declare-fun minValueBefore!43 () V!47759)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1001 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 V!47759 V!47759 (_ BitVec 32) Int) Unit!41661)

(assert (=> b!1254647 (= lt!566357 (lemmaNoChangeToArrayThenSameMapNoExtras!1001 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5687 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 (_ BitVec 32) Int) ListLongMap!18493)

(assert (=> b!1254647 (= lt!566361 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254647 (= lt!566356 (getCurrentListMapNoExtraKeys!5687 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254648 () Bool)

(declare-fun res!836285 () Bool)

(assert (=> b!1254648 (=> (not res!836285) (not e!712848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81293 (_ BitVec 32)) Bool)

(assert (=> b!1254648 (= res!836285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254649 () Bool)

(declare-fun res!836287 () Bool)

(assert (=> b!1254649 (=> (not res!836287) (not e!712848))))

(declare-datatypes ((List!27851 0))(
  ( (Nil!27848) (Cons!27847 (h!29065 (_ BitVec 64)) (t!41324 List!27851)) )
))
(declare-fun arrayNoDuplicates!0 (array!81293 (_ BitVec 32) List!27851) Bool)

(assert (=> b!1254649 (= res!836287 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27848))))

(declare-fun b!1254650 () Bool)

(declare-fun e!712851 () Bool)

(declare-fun e!712847 () Bool)

(declare-fun mapRes!49468 () Bool)

(assert (=> b!1254650 (= e!712851 (and e!712847 mapRes!49468))))

(declare-fun condMapEmpty!49468 () Bool)

(declare-fun mapDefault!49468 () ValueCell!15134)

(assert (=> b!1254650 (= condMapEmpty!49468 (= (arr!39205 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15134)) mapDefault!49468)))))

(declare-fun res!836286 () Bool)

(assert (=> start!105400 (=> (not res!836286) (not e!712848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105400 (= res!836286 (validMask!0 mask!1466))))

(assert (=> start!105400 e!712848))

(assert (=> start!105400 true))

(assert (=> start!105400 tp!94183))

(declare-fun tp_is_empty!31795 () Bool)

(assert (=> start!105400 tp_is_empty!31795))

(declare-fun array_inv!30005 (array!81293) Bool)

(assert (=> start!105400 (array_inv!30005 _keys!1118)))

(declare-fun array_inv!30006 (array!81295) Bool)

(assert (=> start!105400 (and (array_inv!30006 _values!914) e!712851)))

(declare-fun mapIsEmpty!49468 () Bool)

(assert (=> mapIsEmpty!49468 mapRes!49468))

(declare-fun b!1254651 () Bool)

(assert (=> b!1254651 (= e!712849 true)))

(declare-fun lt!566358 () ListLongMap!18493)

(declare-fun lt!566360 () ListLongMap!18493)

(declare-fun -!2005 (ListLongMap!18493 (_ BitVec 64)) ListLongMap!18493)

(assert (=> b!1254651 (= lt!566358 (-!2005 lt!566360 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566355 () ListLongMap!18493)

(assert (=> b!1254651 (= (-!2005 lt!566355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566356)))

(declare-fun lt!566359 () Unit!41661)

(declare-fun addThenRemoveForNewKeyIsSame!295 (ListLongMap!18493 (_ BitVec 64) V!47759) Unit!41661)

(assert (=> b!1254651 (= lt!566359 (addThenRemoveForNewKeyIsSame!295 lt!566356 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566362 () ListLongMap!18493)

(assert (=> b!1254651 (and (= lt!566360 lt!566355) (= lt!566362 lt!566361))))

(declare-fun +!4201 (ListLongMap!18493 tuple2!20612) ListLongMap!18493)

(assert (=> b!1254651 (= lt!566355 (+!4201 lt!566356 (tuple2!20613 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4498 (array!81293 array!81295 (_ BitVec 32) (_ BitVec 32) V!47759 V!47759 (_ BitVec 32) Int) ListLongMap!18493)

(assert (=> b!1254651 (= lt!566362 (getCurrentListMap!4498 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254651 (= lt!566360 (getCurrentListMap!4498 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49468 () Bool)

(declare-fun tp!94184 () Bool)

(declare-fun e!712852 () Bool)

(assert (=> mapNonEmpty!49468 (= mapRes!49468 (and tp!94184 e!712852))))

(declare-fun mapValue!49468 () ValueCell!15134)

(declare-fun mapKey!49468 () (_ BitVec 32))

(declare-fun mapRest!49468 () (Array (_ BitVec 32) ValueCell!15134))

(assert (=> mapNonEmpty!49468 (= (arr!39205 _values!914) (store mapRest!49468 mapKey!49468 mapValue!49468))))

(declare-fun b!1254652 () Bool)

(assert (=> b!1254652 (= e!712852 tp_is_empty!31795)))

(declare-fun b!1254653 () Bool)

(assert (=> b!1254653 (= e!712847 tp_is_empty!31795)))

(assert (= (and start!105400 res!836286) b!1254646))

(assert (= (and b!1254646 res!836289) b!1254648))

(assert (= (and b!1254648 res!836285) b!1254649))

(assert (= (and b!1254649 res!836287) b!1254647))

(assert (= (and b!1254647 (not res!836288)) b!1254651))

(assert (= (and b!1254650 condMapEmpty!49468) mapIsEmpty!49468))

(assert (= (and b!1254650 (not condMapEmpty!49468)) mapNonEmpty!49468))

(get-info :version)

(assert (= (and mapNonEmpty!49468 ((_ is ValueCellFull!15134) mapValue!49468)) b!1254652))

(assert (= (and b!1254650 ((_ is ValueCellFull!15134) mapDefault!49468)) b!1254653))

(assert (= start!105400 b!1254650))

(declare-fun m!1155457 () Bool)

(assert (=> mapNonEmpty!49468 m!1155457))

(declare-fun m!1155459 () Bool)

(assert (=> start!105400 m!1155459))

(declare-fun m!1155461 () Bool)

(assert (=> start!105400 m!1155461))

(declare-fun m!1155463 () Bool)

(assert (=> start!105400 m!1155463))

(declare-fun m!1155465 () Bool)

(assert (=> b!1254651 m!1155465))

(declare-fun m!1155467 () Bool)

(assert (=> b!1254651 m!1155467))

(declare-fun m!1155469 () Bool)

(assert (=> b!1254651 m!1155469))

(declare-fun m!1155471 () Bool)

(assert (=> b!1254651 m!1155471))

(declare-fun m!1155473 () Bool)

(assert (=> b!1254651 m!1155473))

(declare-fun m!1155475 () Bool)

(assert (=> b!1254651 m!1155475))

(declare-fun m!1155477 () Bool)

(assert (=> b!1254647 m!1155477))

(declare-fun m!1155479 () Bool)

(assert (=> b!1254647 m!1155479))

(declare-fun m!1155481 () Bool)

(assert (=> b!1254647 m!1155481))

(declare-fun m!1155483 () Bool)

(assert (=> b!1254648 m!1155483))

(declare-fun m!1155485 () Bool)

(assert (=> b!1254649 m!1155485))

(check-sat (not b!1254649) (not b!1254651) (not b!1254648) (not start!105400) (not b!1254647) tp_is_empty!31795 (not mapNonEmpty!49468) (not b_next!26893) b_and!44709)
(check-sat b_and!44709 (not b_next!26893))
