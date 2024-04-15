; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105108 () Bool)

(assert start!105108)

(declare-fun b_free!26845 () Bool)

(declare-fun b_next!26845 () Bool)

(assert (=> start!105108 (= b_free!26845 (not b_next!26845))))

(declare-fun tp!94036 () Bool)

(declare-fun b_and!44631 () Bool)

(assert (=> start!105108 (= tp!94036 b_and!44631)))

(declare-fun res!835299 () Bool)

(declare-fun e!711424 () Bool)

(assert (=> start!105108 (=> (not res!835299) (not e!711424))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105108 (= res!835299 (validMask!0 mask!1466))))

(assert (=> start!105108 e!711424))

(assert (=> start!105108 true))

(assert (=> start!105108 tp!94036))

(declare-fun tp_is_empty!31747 () Bool)

(assert (=> start!105108 tp_is_empty!31747))

(declare-datatypes ((array!81079 0))(
  ( (array!81080 (arr!39103 (Array (_ BitVec 32) (_ BitVec 64))) (size!39641 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81079)

(declare-fun array_inv!29943 (array!81079) Bool)

(assert (=> start!105108 (array_inv!29943 _keys!1118)))

(declare-datatypes ((V!47695 0))(
  ( (V!47696 (val!15936 Int)) )
))
(declare-datatypes ((ValueCell!15110 0))(
  ( (ValueCellFull!15110 (v!18633 V!47695)) (EmptyCell!15110) )
))
(declare-datatypes ((array!81081 0))(
  ( (array!81082 (arr!39104 (Array (_ BitVec 32) ValueCell!15110)) (size!39642 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81081)

(declare-fun e!711423 () Bool)

(declare-fun array_inv!29944 (array!81081) Bool)

(assert (=> start!105108 (and (array_inv!29944 _values!914) e!711423)))

(declare-fun b!1252526 () Bool)

(declare-fun e!711421 () Bool)

(assert (=> b!1252526 (= e!711421 tp_is_empty!31747)))

(declare-fun b!1252527 () Bool)

(declare-fun res!835300 () Bool)

(assert (=> b!1252527 (=> (not res!835300) (not e!711424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81079 (_ BitVec 32)) Bool)

(assert (=> b!1252527 (= res!835300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252528 () Bool)

(declare-fun mapRes!49393 () Bool)

(assert (=> b!1252528 (= e!711423 (and e!711421 mapRes!49393))))

(declare-fun condMapEmpty!49393 () Bool)

(declare-fun mapDefault!49393 () ValueCell!15110)

(assert (=> b!1252528 (= condMapEmpty!49393 (= (arr!39104 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15110)) mapDefault!49393)))))

(declare-fun b!1252529 () Bool)

(declare-fun res!835301 () Bool)

(assert (=> b!1252529 (=> (not res!835301) (not e!711424))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252529 (= res!835301 (and (= (size!39642 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39641 _keys!1118) (size!39642 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252530 () Bool)

(declare-fun e!711425 () Bool)

(assert (=> b!1252530 (= e!711424 (not e!711425))))

(declare-fun res!835298 () Bool)

(assert (=> b!1252530 (=> res!835298 e!711425)))

(assert (=> b!1252530 (= res!835298 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20646 0))(
  ( (tuple2!20647 (_1!10334 (_ BitVec 64)) (_2!10334 V!47695)) )
))
(declare-datatypes ((List!27859 0))(
  ( (Nil!27856) (Cons!27855 (h!29064 tuple2!20646) (t!41329 List!27859)) )
))
(declare-datatypes ((ListLongMap!18519 0))(
  ( (ListLongMap!18520 (toList!9275 List!27859)) )
))
(declare-fun lt!565236 () ListLongMap!18519)

(declare-fun lt!565238 () ListLongMap!18519)

(assert (=> b!1252530 (= lt!565236 lt!565238)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47695)

(declare-datatypes ((Unit!41516 0))(
  ( (Unit!41517) )
))
(declare-fun lt!565239 () Unit!41516)

(declare-fun zeroValue!871 () V!47695)

(declare-fun minValueBefore!43 () V!47695)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1001 (array!81079 array!81081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 V!47695 V!47695 (_ BitVec 32) Int) Unit!41516)

(assert (=> b!1252530 (= lt!565239 (lemmaNoChangeToArrayThenSameMapNoExtras!1001 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5679 (array!81079 array!81081 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18519)

(assert (=> b!1252530 (= lt!565238 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252530 (= lt!565236 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252531 () Bool)

(declare-fun e!711420 () Bool)

(assert (=> b!1252531 (= e!711420 tp_is_empty!31747)))

(declare-fun mapNonEmpty!49393 () Bool)

(declare-fun tp!94037 () Bool)

(assert (=> mapNonEmpty!49393 (= mapRes!49393 (and tp!94037 e!711420))))

(declare-fun mapRest!49393 () (Array (_ BitVec 32) ValueCell!15110))

(declare-fun mapValue!49393 () ValueCell!15110)

(declare-fun mapKey!49393 () (_ BitVec 32))

(assert (=> mapNonEmpty!49393 (= (arr!39104 _values!914) (store mapRest!49393 mapKey!49393 mapValue!49393))))

(declare-fun b!1252532 () Bool)

(declare-fun res!835302 () Bool)

(assert (=> b!1252532 (=> (not res!835302) (not e!711424))))

(declare-datatypes ((List!27860 0))(
  ( (Nil!27857) (Cons!27856 (h!29065 (_ BitVec 64)) (t!41330 List!27860)) )
))
(declare-fun arrayNoDuplicates!0 (array!81079 (_ BitVec 32) List!27860) Bool)

(assert (=> b!1252532 (= res!835302 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27857))))

(declare-fun mapIsEmpty!49393 () Bool)

(assert (=> mapIsEmpty!49393 mapRes!49393))

(declare-fun b!1252533 () Bool)

(assert (=> b!1252533 (= e!711425 true)))

(declare-fun lt!565237 () ListLongMap!18519)

(declare-fun getCurrentListMap!4415 (array!81079 array!81081 (_ BitVec 32) (_ BitVec 32) V!47695 V!47695 (_ BitVec 32) Int) ListLongMap!18519)

(assert (=> b!1252533 (= lt!565237 (getCurrentListMap!4415 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105108 res!835299) b!1252529))

(assert (= (and b!1252529 res!835301) b!1252527))

(assert (= (and b!1252527 res!835300) b!1252532))

(assert (= (and b!1252532 res!835302) b!1252530))

(assert (= (and b!1252530 (not res!835298)) b!1252533))

(assert (= (and b!1252528 condMapEmpty!49393) mapIsEmpty!49393))

(assert (= (and b!1252528 (not condMapEmpty!49393)) mapNonEmpty!49393))

(get-info :version)

(assert (= (and mapNonEmpty!49393 ((_ is ValueCellFull!15110) mapValue!49393)) b!1252531))

(assert (= (and b!1252528 ((_ is ValueCellFull!15110) mapDefault!49393)) b!1252526))

(assert (= start!105108 b!1252528))

(declare-fun m!1152685 () Bool)

(assert (=> b!1252532 m!1152685))

(declare-fun m!1152687 () Bool)

(assert (=> mapNonEmpty!49393 m!1152687))

(declare-fun m!1152689 () Bool)

(assert (=> b!1252527 m!1152689))

(declare-fun m!1152691 () Bool)

(assert (=> b!1252530 m!1152691))

(declare-fun m!1152693 () Bool)

(assert (=> b!1252530 m!1152693))

(declare-fun m!1152695 () Bool)

(assert (=> b!1252530 m!1152695))

(declare-fun m!1152697 () Bool)

(assert (=> start!105108 m!1152697))

(declare-fun m!1152699 () Bool)

(assert (=> start!105108 m!1152699))

(declare-fun m!1152701 () Bool)

(assert (=> start!105108 m!1152701))

(declare-fun m!1152703 () Bool)

(assert (=> b!1252533 m!1152703))

(check-sat (not b!1252527) (not b_next!26845) (not b!1252533) (not start!105108) b_and!44631 tp_is_empty!31747 (not b!1252530) (not b!1252532) (not mapNonEmpty!49393))
(check-sat b_and!44631 (not b_next!26845))
