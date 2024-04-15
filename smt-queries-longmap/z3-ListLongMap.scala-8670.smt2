; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105392 () Bool)

(assert start!105392)

(declare-fun b_free!27055 () Bool)

(declare-fun b_next!27055 () Bool)

(assert (=> start!105392 (= b_free!27055 (not b_next!27055))))

(declare-fun tp!94678 () Bool)

(declare-fun b_and!44883 () Bool)

(assert (=> start!105392 (= tp!94678 b_and!44883)))

(declare-fun b!1255577 () Bool)

(declare-fun res!837057 () Bool)

(declare-fun e!713627 () Bool)

(assert (=> b!1255577 (=> (not res!837057) (not e!713627))))

(declare-datatypes ((array!81485 0))(
  ( (array!81486 (arr!39302 (Array (_ BitVec 32) (_ BitVec 64))) (size!39840 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81485)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81485 (_ BitVec 32)) Bool)

(assert (=> b!1255577 (= res!837057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255578 () Bool)

(declare-fun res!837061 () Bool)

(assert (=> b!1255578 (=> (not res!837061) (not e!713627))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47975 0))(
  ( (V!47976 (val!16041 Int)) )
))
(declare-datatypes ((ValueCell!15215 0))(
  ( (ValueCellFull!15215 (v!18740 V!47975)) (EmptyCell!15215) )
))
(declare-datatypes ((array!81487 0))(
  ( (array!81488 (arr!39303 (Array (_ BitVec 32) ValueCell!15215)) (size!39841 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81487)

(assert (=> b!1255578 (= res!837061 (and (= (size!39841 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39840 _keys!1118) (size!39841 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255579 () Bool)

(declare-fun e!713631 () Bool)

(declare-fun tp_is_empty!31957 () Bool)

(assert (=> b!1255579 (= e!713631 tp_is_empty!31957)))

(declare-fun res!837058 () Bool)

(assert (=> start!105392 (=> (not res!837058) (not e!713627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105392 (= res!837058 (validMask!0 mask!1466))))

(assert (=> start!105392 e!713627))

(assert (=> start!105392 true))

(assert (=> start!105392 tp!94678))

(assert (=> start!105392 tp_is_empty!31957))

(declare-fun array_inv!30085 (array!81485) Bool)

(assert (=> start!105392 (array_inv!30085 _keys!1118)))

(declare-fun e!713628 () Bool)

(declare-fun array_inv!30086 (array!81487) Bool)

(assert (=> start!105392 (and (array_inv!30086 _values!914) e!713628)))

(declare-fun b!1255580 () Bool)

(declare-fun e!713630 () Bool)

(assert (=> b!1255580 (= e!713627 (not e!713630))))

(declare-fun res!837059 () Bool)

(assert (=> b!1255580 (=> res!837059 e!713630)))

(assert (=> b!1255580 (= res!837059 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!20796 0))(
  ( (tuple2!20797 (_1!10409 (_ BitVec 64)) (_2!10409 V!47975)) )
))
(declare-datatypes ((List!28007 0))(
  ( (Nil!28004) (Cons!28003 (h!29212 tuple2!20796) (t!41485 List!28007)) )
))
(declare-datatypes ((ListLongMap!18669 0))(
  ( (ListLongMap!18670 (toList!9350 List!28007)) )
))
(declare-fun lt!567508 () ListLongMap!18669)

(declare-fun lt!567505 () ListLongMap!18669)

(assert (=> b!1255580 (= lt!567508 lt!567505)))

(declare-datatypes ((Unit!41665 0))(
  ( (Unit!41666) )
))
(declare-fun lt!567506 () Unit!41665)

(declare-fun minValueAfter!43 () V!47975)

(declare-fun zeroValue!871 () V!47975)

(declare-fun minValueBefore!43 () V!47975)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1066 (array!81485 array!81487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 V!47975 V!47975 (_ BitVec 32) Int) Unit!41665)

(assert (=> b!1255580 (= lt!567506 (lemmaNoChangeToArrayThenSameMapNoExtras!1066 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5744 (array!81485 array!81487 (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 (_ BitVec 32) Int) ListLongMap!18669)

(assert (=> b!1255580 (= lt!567505 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255580 (= lt!567508 (getCurrentListMapNoExtraKeys!5744 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49720 () Bool)

(declare-fun mapRes!49720 () Bool)

(assert (=> mapIsEmpty!49720 mapRes!49720))

(declare-fun b!1255581 () Bool)

(declare-fun res!837056 () Bool)

(assert (=> b!1255581 (=> (not res!837056) (not e!713627))))

(declare-datatypes ((List!28008 0))(
  ( (Nil!28005) (Cons!28004 (h!29213 (_ BitVec 64)) (t!41486 List!28008)) )
))
(declare-fun arrayNoDuplicates!0 (array!81485 (_ BitVec 32) List!28008) Bool)

(assert (=> b!1255581 (= res!837056 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28005))))

(declare-fun b!1255582 () Bool)

(declare-fun e!713632 () Bool)

(assert (=> b!1255582 (= e!713630 e!713632)))

(declare-fun res!837060 () Bool)

(assert (=> b!1255582 (=> res!837060 e!713632)))

(declare-fun lt!567509 () ListLongMap!18669)

(declare-fun contains!7503 (ListLongMap!18669 (_ BitVec 64)) Bool)

(assert (=> b!1255582 (= res!837060 (contains!7503 lt!567509 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4463 (array!81485 array!81487 (_ BitVec 32) (_ BitVec 32) V!47975 V!47975 (_ BitVec 32) Int) ListLongMap!18669)

(assert (=> b!1255582 (= lt!567509 (getCurrentListMap!4463 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255583 () Bool)

(assert (=> b!1255583 (= e!713632 true)))

(declare-fun -!2022 (ListLongMap!18669 (_ BitVec 64)) ListLongMap!18669)

(assert (=> b!1255583 (= (-!2022 lt!567509 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567509)))

(declare-fun lt!567507 () Unit!41665)

(declare-fun removeNotPresentStillSame!117 (ListLongMap!18669 (_ BitVec 64)) Unit!41665)

(assert (=> b!1255583 (= lt!567507 (removeNotPresentStillSame!117 lt!567509 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1255584 () Bool)

(declare-fun e!713629 () Bool)

(assert (=> b!1255584 (= e!713629 tp_is_empty!31957)))

(declare-fun b!1255585 () Bool)

(assert (=> b!1255585 (= e!713628 (and e!713629 mapRes!49720))))

(declare-fun condMapEmpty!49720 () Bool)

(declare-fun mapDefault!49720 () ValueCell!15215)

(assert (=> b!1255585 (= condMapEmpty!49720 (= (arr!39303 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15215)) mapDefault!49720)))))

(declare-fun mapNonEmpty!49720 () Bool)

(declare-fun tp!94679 () Bool)

(assert (=> mapNonEmpty!49720 (= mapRes!49720 (and tp!94679 e!713631))))

(declare-fun mapRest!49720 () (Array (_ BitVec 32) ValueCell!15215))

(declare-fun mapKey!49720 () (_ BitVec 32))

(declare-fun mapValue!49720 () ValueCell!15215)

(assert (=> mapNonEmpty!49720 (= (arr!39303 _values!914) (store mapRest!49720 mapKey!49720 mapValue!49720))))

(assert (= (and start!105392 res!837058) b!1255578))

(assert (= (and b!1255578 res!837061) b!1255577))

(assert (= (and b!1255577 res!837057) b!1255581))

(assert (= (and b!1255581 res!837056) b!1255580))

(assert (= (and b!1255580 (not res!837059)) b!1255582))

(assert (= (and b!1255582 (not res!837060)) b!1255583))

(assert (= (and b!1255585 condMapEmpty!49720) mapIsEmpty!49720))

(assert (= (and b!1255585 (not condMapEmpty!49720)) mapNonEmpty!49720))

(get-info :version)

(assert (= (and mapNonEmpty!49720 ((_ is ValueCellFull!15215) mapValue!49720)) b!1255579))

(assert (= (and b!1255585 ((_ is ValueCellFull!15215) mapDefault!49720)) b!1255584))

(assert (= start!105392 b!1255585))

(declare-fun m!1155841 () Bool)

(assert (=> b!1255582 m!1155841))

(declare-fun m!1155843 () Bool)

(assert (=> b!1255582 m!1155843))

(declare-fun m!1155845 () Bool)

(assert (=> b!1255580 m!1155845))

(declare-fun m!1155847 () Bool)

(assert (=> b!1255580 m!1155847))

(declare-fun m!1155849 () Bool)

(assert (=> b!1255580 m!1155849))

(declare-fun m!1155851 () Bool)

(assert (=> b!1255577 m!1155851))

(declare-fun m!1155853 () Bool)

(assert (=> b!1255583 m!1155853))

(declare-fun m!1155855 () Bool)

(assert (=> b!1255583 m!1155855))

(declare-fun m!1155857 () Bool)

(assert (=> mapNonEmpty!49720 m!1155857))

(declare-fun m!1155859 () Bool)

(assert (=> start!105392 m!1155859))

(declare-fun m!1155861 () Bool)

(assert (=> start!105392 m!1155861))

(declare-fun m!1155863 () Bool)

(assert (=> start!105392 m!1155863))

(declare-fun m!1155865 () Bool)

(assert (=> b!1255581 m!1155865))

(check-sat tp_is_empty!31957 (not b!1255580) (not b_next!27055) (not mapNonEmpty!49720) b_and!44883 (not b!1255582) (not b!1255577) (not start!105392) (not b!1255581) (not b!1255583))
(check-sat b_and!44883 (not b_next!27055))
