; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105102 () Bool)

(assert start!105102)

(declare-fun b_free!26839 () Bool)

(declare-fun b_next!26839 () Bool)

(assert (=> start!105102 (= b_free!26839 (not b_next!26839))))

(declare-fun tp!94018 () Bool)

(declare-fun b_and!44625 () Bool)

(assert (=> start!105102 (= tp!94018 b_and!44625)))

(declare-fun b!1252454 () Bool)

(declare-fun e!711370 () Bool)

(assert (=> b!1252454 (= e!711370 true)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47687 0))(
  ( (V!47688 (val!15933 Int)) )
))
(declare-fun zeroValue!871 () V!47687)

(declare-datatypes ((array!81067 0))(
  ( (array!81068 (arr!39097 (Array (_ BitVec 32) (_ BitVec 64))) (size!39635 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81067)

(declare-datatypes ((ValueCell!15107 0))(
  ( (ValueCellFull!15107 (v!18630 V!47687)) (EmptyCell!15107) )
))
(declare-datatypes ((array!81069 0))(
  ( (array!81070 (arr!39098 (Array (_ BitVec 32) ValueCell!15107)) (size!39636 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81069)

(declare-fun minValueBefore!43 () V!47687)

(declare-datatypes ((tuple2!20640 0))(
  ( (tuple2!20641 (_1!10331 (_ BitVec 64)) (_2!10331 V!47687)) )
))
(declare-datatypes ((List!27854 0))(
  ( (Nil!27851) (Cons!27850 (h!29059 tuple2!20640) (t!41324 List!27854)) )
))
(declare-datatypes ((ListLongMap!18513 0))(
  ( (ListLongMap!18514 (toList!9272 List!27854)) )
))
(declare-fun lt!565200 () ListLongMap!18513)

(declare-fun getCurrentListMap!4413 (array!81067 array!81069 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18513)

(assert (=> b!1252454 (= lt!565200 (getCurrentListMap!4413 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252456 () Bool)

(declare-fun e!711369 () Bool)

(declare-fun tp_is_empty!31741 () Bool)

(assert (=> b!1252456 (= e!711369 tp_is_empty!31741)))

(declare-fun b!1252457 () Bool)

(declare-fun res!835257 () Bool)

(declare-fun e!711367 () Bool)

(assert (=> b!1252457 (=> (not res!835257) (not e!711367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81067 (_ BitVec 32)) Bool)

(assert (=> b!1252457 (= res!835257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49384 () Bool)

(declare-fun mapRes!49384 () Bool)

(declare-fun tp!94019 () Bool)

(assert (=> mapNonEmpty!49384 (= mapRes!49384 (and tp!94019 e!711369))))

(declare-fun mapValue!49384 () ValueCell!15107)

(declare-fun mapRest!49384 () (Array (_ BitVec 32) ValueCell!15107))

(declare-fun mapKey!49384 () (_ BitVec 32))

(assert (=> mapNonEmpty!49384 (= (arr!39098 _values!914) (store mapRest!49384 mapKey!49384 mapValue!49384))))

(declare-fun b!1252458 () Bool)

(declare-fun res!835254 () Bool)

(assert (=> b!1252458 (=> (not res!835254) (not e!711367))))

(declare-datatypes ((List!27855 0))(
  ( (Nil!27852) (Cons!27851 (h!29060 (_ BitVec 64)) (t!41325 List!27855)) )
))
(declare-fun arrayNoDuplicates!0 (array!81067 (_ BitVec 32) List!27855) Bool)

(assert (=> b!1252458 (= res!835254 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27852))))

(declare-fun b!1252459 () Bool)

(declare-fun res!835255 () Bool)

(assert (=> b!1252459 (=> (not res!835255) (not e!711367))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252459 (= res!835255 (and (= (size!39636 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39635 _keys!1118) (size!39636 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49384 () Bool)

(assert (=> mapIsEmpty!49384 mapRes!49384))

(declare-fun b!1252460 () Bool)

(declare-fun e!711371 () Bool)

(declare-fun e!711368 () Bool)

(assert (=> b!1252460 (= e!711371 (and e!711368 mapRes!49384))))

(declare-fun condMapEmpty!49384 () Bool)

(declare-fun mapDefault!49384 () ValueCell!15107)

(assert (=> b!1252460 (= condMapEmpty!49384 (= (arr!39098 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15107)) mapDefault!49384)))))

(declare-fun b!1252461 () Bool)

(assert (=> b!1252461 (= e!711367 (not e!711370))))

(declare-fun res!835256 () Bool)

(assert (=> b!1252461 (=> res!835256 e!711370)))

(assert (=> b!1252461 (= res!835256 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565203 () ListLongMap!18513)

(declare-fun lt!565202 () ListLongMap!18513)

(assert (=> b!1252461 (= lt!565203 lt!565202)))

(declare-fun minValueAfter!43 () V!47687)

(declare-datatypes ((Unit!41510 0))(
  ( (Unit!41511) )
))
(declare-fun lt!565201 () Unit!41510)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!998 (array!81067 array!81069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 V!47687 V!47687 (_ BitVec 32) Int) Unit!41510)

(assert (=> b!1252461 (= lt!565201 (lemmaNoChangeToArrayThenSameMapNoExtras!998 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5676 (array!81067 array!81069 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18513)

(assert (=> b!1252461 (= lt!565202 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252461 (= lt!565203 (getCurrentListMapNoExtraKeys!5676 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!835253 () Bool)

(assert (=> start!105102 (=> (not res!835253) (not e!711367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105102 (= res!835253 (validMask!0 mask!1466))))

(assert (=> start!105102 e!711367))

(assert (=> start!105102 true))

(assert (=> start!105102 tp!94018))

(assert (=> start!105102 tp_is_empty!31741))

(declare-fun array_inv!29939 (array!81067) Bool)

(assert (=> start!105102 (array_inv!29939 _keys!1118)))

(declare-fun array_inv!29940 (array!81069) Bool)

(assert (=> start!105102 (and (array_inv!29940 _values!914) e!711371)))

(declare-fun b!1252455 () Bool)

(assert (=> b!1252455 (= e!711368 tp_is_empty!31741)))

(assert (= (and start!105102 res!835253) b!1252459))

(assert (= (and b!1252459 res!835255) b!1252457))

(assert (= (and b!1252457 res!835257) b!1252458))

(assert (= (and b!1252458 res!835254) b!1252461))

(assert (= (and b!1252461 (not res!835256)) b!1252454))

(assert (= (and b!1252460 condMapEmpty!49384) mapIsEmpty!49384))

(assert (= (and b!1252460 (not condMapEmpty!49384)) mapNonEmpty!49384))

(get-info :version)

(assert (= (and mapNonEmpty!49384 ((_ is ValueCellFull!15107) mapValue!49384)) b!1252456))

(assert (= (and b!1252460 ((_ is ValueCellFull!15107) mapDefault!49384)) b!1252455))

(assert (= start!105102 b!1252460))

(declare-fun m!1152625 () Bool)

(assert (=> mapNonEmpty!49384 m!1152625))

(declare-fun m!1152627 () Bool)

(assert (=> b!1252454 m!1152627))

(declare-fun m!1152629 () Bool)

(assert (=> b!1252457 m!1152629))

(declare-fun m!1152631 () Bool)

(assert (=> b!1252458 m!1152631))

(declare-fun m!1152633 () Bool)

(assert (=> b!1252461 m!1152633))

(declare-fun m!1152635 () Bool)

(assert (=> b!1252461 m!1152635))

(declare-fun m!1152637 () Bool)

(assert (=> b!1252461 m!1152637))

(declare-fun m!1152639 () Bool)

(assert (=> start!105102 m!1152639))

(declare-fun m!1152641 () Bool)

(assert (=> start!105102 m!1152641))

(declare-fun m!1152643 () Bool)

(assert (=> start!105102 m!1152643))

(check-sat (not start!105102) (not b!1252461) tp_is_empty!31741 (not b!1252457) b_and!44625 (not b!1252454) (not b!1252458) (not b_next!26839) (not mapNonEmpty!49384))
(check-sat b_and!44625 (not b_next!26839))
