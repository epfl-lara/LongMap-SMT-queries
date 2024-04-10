; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42042 () Bool)

(assert start!42042)

(declare-fun b_free!11595 () Bool)

(declare-fun b_next!11595 () Bool)

(assert (=> start!42042 (= b_free!11595 (not b_next!11595))))

(declare-fun tp!40804 () Bool)

(declare-fun b_and!20005 () Bool)

(assert (=> start!42042 (= tp!40804 b_and!20005)))

(declare-fun b!469373 () Bool)

(declare-fun e!274831 () Bool)

(assert (=> b!469373 (= e!274831 true)))

(declare-datatypes ((V!18469 0))(
  ( (V!18470 (val!6556 Int)) )
))
(declare-datatypes ((tuple2!8626 0))(
  ( (tuple2!8627 (_1!4324 (_ BitVec 64)) (_2!4324 V!18469)) )
))
(declare-datatypes ((List!8707 0))(
  ( (Nil!8704) (Cons!8703 (h!9559 tuple2!8626) (t!14667 List!8707)) )
))
(declare-datatypes ((ListLongMap!7539 0))(
  ( (ListLongMap!7540 (toList!3785 List!8707)) )
))
(declare-fun lt!212654 () ListLongMap!7539)

(declare-fun lt!212656 () tuple2!8626)

(declare-fun minValueBefore!38 () V!18469)

(declare-fun +!1694 (ListLongMap!7539 tuple2!8626) ListLongMap!7539)

(assert (=> b!469373 (= (+!1694 lt!212654 lt!212656) (+!1694 (+!1694 lt!212654 (tuple2!8627 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212656))))

(declare-fun minValueAfter!38 () V!18469)

(assert (=> b!469373 (= lt!212656 (tuple2!8627 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13727 0))(
  ( (Unit!13728) )
))
(declare-fun lt!212655 () Unit!13727)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!107 (ListLongMap!7539 (_ BitVec 64) V!18469 V!18469) Unit!13727)

(assert (=> b!469373 (= lt!212655 (addSameAsAddTwiceSameKeyDiffValues!107 lt!212654 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18469)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29819 0))(
  ( (array!29820 (arr!14334 (Array (_ BitVec 32) (_ BitVec 64))) (size!14686 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29819)

(declare-datatypes ((ValueCell!6168 0))(
  ( (ValueCellFull!6168 (v!8846 V!18469)) (EmptyCell!6168) )
))
(declare-datatypes ((array!29821 0))(
  ( (array!29822 (arr!14335 (Array (_ BitVec 32) ValueCell!6168)) (size!14687 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29821)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lt!212653 () ListLongMap!7539)

(declare-fun getCurrentListMap!2208 (array!29819 array!29821 (_ BitVec 32) (_ BitVec 32) V!18469 V!18469 (_ BitVec 32) Int) ListLongMap!7539)

(assert (=> b!469373 (= lt!212653 (getCurrentListMap!2208 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212652 () ListLongMap!7539)

(assert (=> b!469373 (= lt!212652 (getCurrentListMap!2208 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!280483 () Bool)

(declare-fun e!274833 () Bool)

(assert (=> start!42042 (=> (not res!280483) (not e!274833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42042 (= res!280483 (validMask!0 mask!1365))))

(assert (=> start!42042 e!274833))

(declare-fun tp_is_empty!13023 () Bool)

(assert (=> start!42042 tp_is_empty!13023))

(assert (=> start!42042 tp!40804))

(assert (=> start!42042 true))

(declare-fun array_inv!10346 (array!29819) Bool)

(assert (=> start!42042 (array_inv!10346 _keys!1025)))

(declare-fun e!274829 () Bool)

(declare-fun array_inv!10347 (array!29821) Bool)

(assert (=> start!42042 (and (array_inv!10347 _values!833) e!274829)))

(declare-fun b!469374 () Bool)

(declare-fun e!274828 () Bool)

(declare-fun mapRes!21232 () Bool)

(assert (=> b!469374 (= e!274829 (and e!274828 mapRes!21232))))

(declare-fun condMapEmpty!21232 () Bool)

(declare-fun mapDefault!21232 () ValueCell!6168)

(assert (=> b!469374 (= condMapEmpty!21232 (= (arr!14335 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6168)) mapDefault!21232)))))

(declare-fun mapNonEmpty!21232 () Bool)

(declare-fun tp!40803 () Bool)

(declare-fun e!274832 () Bool)

(assert (=> mapNonEmpty!21232 (= mapRes!21232 (and tp!40803 e!274832))))

(declare-fun mapValue!21232 () ValueCell!6168)

(declare-fun mapKey!21232 () (_ BitVec 32))

(declare-fun mapRest!21232 () (Array (_ BitVec 32) ValueCell!6168))

(assert (=> mapNonEmpty!21232 (= (arr!14335 _values!833) (store mapRest!21232 mapKey!21232 mapValue!21232))))

(declare-fun mapIsEmpty!21232 () Bool)

(assert (=> mapIsEmpty!21232 mapRes!21232))

(declare-fun b!469375 () Bool)

(declare-fun res!280484 () Bool)

(assert (=> b!469375 (=> (not res!280484) (not e!274833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29819 (_ BitVec 32)) Bool)

(assert (=> b!469375 (= res!280484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469376 () Bool)

(assert (=> b!469376 (= e!274828 tp_is_empty!13023)))

(declare-fun b!469377 () Bool)

(declare-fun res!280482 () Bool)

(assert (=> b!469377 (=> (not res!280482) (not e!274833))))

(declare-datatypes ((List!8708 0))(
  ( (Nil!8705) (Cons!8704 (h!9560 (_ BitVec 64)) (t!14668 List!8708)) )
))
(declare-fun arrayNoDuplicates!0 (array!29819 (_ BitVec 32) List!8708) Bool)

(assert (=> b!469377 (= res!280482 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8705))))

(declare-fun b!469378 () Bool)

(assert (=> b!469378 (= e!274832 tp_is_empty!13023)))

(declare-fun b!469379 () Bool)

(assert (=> b!469379 (= e!274833 (not e!274831))))

(declare-fun res!280486 () Bool)

(assert (=> b!469379 (=> res!280486 e!274831)))

(assert (=> b!469379 (= res!280486 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212657 () ListLongMap!7539)

(assert (=> b!469379 (= lt!212654 lt!212657)))

(declare-fun lt!212651 () Unit!13727)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!133 (array!29819 array!29821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18469 V!18469 V!18469 V!18469 (_ BitVec 32) Int) Unit!13727)

(assert (=> b!469379 (= lt!212651 (lemmaNoChangeToArrayThenSameMapNoExtras!133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1953 (array!29819 array!29821 (_ BitVec 32) (_ BitVec 32) V!18469 V!18469 (_ BitVec 32) Int) ListLongMap!7539)

(assert (=> b!469379 (= lt!212657 (getCurrentListMapNoExtraKeys!1953 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469379 (= lt!212654 (getCurrentListMapNoExtraKeys!1953 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469380 () Bool)

(declare-fun res!280485 () Bool)

(assert (=> b!469380 (=> (not res!280485) (not e!274833))))

(assert (=> b!469380 (= res!280485 (and (= (size!14687 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14686 _keys!1025) (size!14687 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42042 res!280483) b!469380))

(assert (= (and b!469380 res!280485) b!469375))

(assert (= (and b!469375 res!280484) b!469377))

(assert (= (and b!469377 res!280482) b!469379))

(assert (= (and b!469379 (not res!280486)) b!469373))

(assert (= (and b!469374 condMapEmpty!21232) mapIsEmpty!21232))

(assert (= (and b!469374 (not condMapEmpty!21232)) mapNonEmpty!21232))

(get-info :version)

(assert (= (and mapNonEmpty!21232 ((_ is ValueCellFull!6168) mapValue!21232)) b!469378))

(assert (= (and b!469374 ((_ is ValueCellFull!6168) mapDefault!21232)) b!469376))

(assert (= start!42042 b!469374))

(declare-fun m!451521 () Bool)

(assert (=> mapNonEmpty!21232 m!451521))

(declare-fun m!451523 () Bool)

(assert (=> b!469379 m!451523))

(declare-fun m!451525 () Bool)

(assert (=> b!469379 m!451525))

(declare-fun m!451527 () Bool)

(assert (=> b!469379 m!451527))

(declare-fun m!451529 () Bool)

(assert (=> b!469373 m!451529))

(declare-fun m!451531 () Bool)

(assert (=> b!469373 m!451531))

(declare-fun m!451533 () Bool)

(assert (=> b!469373 m!451533))

(assert (=> b!469373 m!451531))

(declare-fun m!451535 () Bool)

(assert (=> b!469373 m!451535))

(declare-fun m!451537 () Bool)

(assert (=> b!469373 m!451537))

(declare-fun m!451539 () Bool)

(assert (=> b!469373 m!451539))

(declare-fun m!451541 () Bool)

(assert (=> start!42042 m!451541))

(declare-fun m!451543 () Bool)

(assert (=> start!42042 m!451543))

(declare-fun m!451545 () Bool)

(assert (=> start!42042 m!451545))

(declare-fun m!451547 () Bool)

(assert (=> b!469375 m!451547))

(declare-fun m!451549 () Bool)

(assert (=> b!469377 m!451549))

(check-sat (not start!42042) (not b!469379) (not b!469373) tp_is_empty!13023 b_and!20005 (not b_next!11595) (not b!469375) (not mapNonEmpty!21232) (not b!469377))
(check-sat b_and!20005 (not b_next!11595))
