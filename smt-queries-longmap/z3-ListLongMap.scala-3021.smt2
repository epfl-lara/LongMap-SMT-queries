; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42466 () Bool)

(assert start!42466)

(declare-fun b_free!11935 () Bool)

(declare-fun b_next!11935 () Bool)

(assert (=> start!42466 (= b_free!11935 (not b_next!11935))))

(declare-fun tp!41842 () Bool)

(declare-fun b_and!20413 () Bool)

(assert (=> start!42466 (= tp!41842 b_and!20413)))

(declare-fun b!473912 () Bool)

(declare-fun e!278094 () Bool)

(assert (=> b!473912 (= e!278094 true)))

(declare-datatypes ((V!18923 0))(
  ( (V!18924 (val!6726 Int)) )
))
(declare-datatypes ((tuple2!8792 0))(
  ( (tuple2!8793 (_1!4407 (_ BitVec 64)) (_2!4407 V!18923)) )
))
(declare-datatypes ((List!8853 0))(
  ( (Nil!8850) (Cons!8849 (h!9705 tuple2!8792) (t!14817 List!8853)) )
))
(declare-datatypes ((ListLongMap!7707 0))(
  ( (ListLongMap!7708 (toList!3869 List!8853)) )
))
(declare-fun lt!215660 () ListLongMap!7707)

(declare-fun lt!215664 () tuple2!8792)

(declare-fun minValueBefore!38 () V!18923)

(declare-fun +!1751 (ListLongMap!7707 tuple2!8792) ListLongMap!7707)

(assert (=> b!473912 (= (+!1751 lt!215660 lt!215664) (+!1751 (+!1751 lt!215660 (tuple2!8793 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215664))))

(declare-fun minValueAfter!38 () V!18923)

(assert (=> b!473912 (= lt!215664 (tuple2!8793 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13944 0))(
  ( (Unit!13945) )
))
(declare-fun lt!215667 () Unit!13944)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!153 (ListLongMap!7707 (_ BitVec 64) V!18923 V!18923) Unit!13944)

(assert (=> b!473912 (= lt!215667 (addSameAsAddTwiceSameKeyDiffValues!153 lt!215660 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215666 () ListLongMap!7707)

(declare-fun zeroValue!794 () V!18923)

(assert (=> b!473912 (= lt!215660 (+!1751 lt!215666 (tuple2!8793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215665 () ListLongMap!7707)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30456 0))(
  ( (array!30457 (arr!14646 (Array (_ BitVec 32) (_ BitVec 64))) (size!14998 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30456)

(declare-datatypes ((ValueCell!6338 0))(
  ( (ValueCellFull!6338 (v!9019 V!18923)) (EmptyCell!6338) )
))
(declare-datatypes ((array!30458 0))(
  ( (array!30459 (arr!14647 (Array (_ BitVec 32) ValueCell!6338)) (size!14999 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30458)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2231 (array!30456 array!30458 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7707)

(assert (=> b!473912 (= lt!215665 (getCurrentListMap!2231 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215661 () ListLongMap!7707)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473912 (= lt!215661 (getCurrentListMap!2231 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473913 () Bool)

(declare-fun e!278095 () Bool)

(assert (=> b!473913 (= e!278095 (not e!278094))))

(declare-fun res!283092 () Bool)

(assert (=> b!473913 (=> res!283092 e!278094)))

(assert (=> b!473913 (= res!283092 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215663 () ListLongMap!7707)

(assert (=> b!473913 (= lt!215666 lt!215663)))

(declare-fun lt!215662 () Unit!13944)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!238 (array!30456 array!30458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 V!18923 V!18923 (_ BitVec 32) Int) Unit!13944)

(assert (=> b!473913 (= lt!215662 (lemmaNoChangeToArrayThenSameMapNoExtras!238 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2078 (array!30456 array!30458 (_ BitVec 32) (_ BitVec 32) V!18923 V!18923 (_ BitVec 32) Int) ListLongMap!7707)

(assert (=> b!473913 (= lt!215663 (getCurrentListMapNoExtraKeys!2078 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473913 (= lt!215666 (getCurrentListMapNoExtraKeys!2078 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473914 () Bool)

(declare-fun e!278091 () Bool)

(declare-fun tp_is_empty!13363 () Bool)

(assert (=> b!473914 (= e!278091 tp_is_empty!13363)))

(declare-fun b!473915 () Bool)

(declare-fun res!283089 () Bool)

(assert (=> b!473915 (=> (not res!283089) (not e!278095))))

(declare-datatypes ((List!8854 0))(
  ( (Nil!8851) (Cons!8850 (h!9706 (_ BitVec 64)) (t!14818 List!8854)) )
))
(declare-fun arrayNoDuplicates!0 (array!30456 (_ BitVec 32) List!8854) Bool)

(assert (=> b!473915 (= res!283089 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8851))))

(declare-fun b!473916 () Bool)

(declare-fun res!283090 () Bool)

(assert (=> b!473916 (=> (not res!283090) (not e!278095))))

(assert (=> b!473916 (= res!283090 (and (= (size!14999 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14998 _keys!1025) (size!14999 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473917 () Bool)

(declare-fun e!278092 () Bool)

(assert (=> b!473917 (= e!278092 tp_is_empty!13363)))

(declare-fun mapIsEmpty!21760 () Bool)

(declare-fun mapRes!21760 () Bool)

(assert (=> mapIsEmpty!21760 mapRes!21760))

(declare-fun mapNonEmpty!21760 () Bool)

(declare-fun tp!41841 () Bool)

(assert (=> mapNonEmpty!21760 (= mapRes!21760 (and tp!41841 e!278091))))

(declare-fun mapKey!21760 () (_ BitVec 32))

(declare-fun mapValue!21760 () ValueCell!6338)

(declare-fun mapRest!21760 () (Array (_ BitVec 32) ValueCell!6338))

(assert (=> mapNonEmpty!21760 (= (arr!14647 _values!833) (store mapRest!21760 mapKey!21760 mapValue!21760))))

(declare-fun b!473919 () Bool)

(declare-fun e!278093 () Bool)

(assert (=> b!473919 (= e!278093 (and e!278092 mapRes!21760))))

(declare-fun condMapEmpty!21760 () Bool)

(declare-fun mapDefault!21760 () ValueCell!6338)

(assert (=> b!473919 (= condMapEmpty!21760 (= (arr!14647 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6338)) mapDefault!21760)))))

(declare-fun b!473918 () Bool)

(declare-fun res!283091 () Bool)

(assert (=> b!473918 (=> (not res!283091) (not e!278095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30456 (_ BitVec 32)) Bool)

(assert (=> b!473918 (= res!283091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283093 () Bool)

(assert (=> start!42466 (=> (not res!283093) (not e!278095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42466 (= res!283093 (validMask!0 mask!1365))))

(assert (=> start!42466 e!278095))

(assert (=> start!42466 tp_is_empty!13363))

(assert (=> start!42466 tp!41842))

(assert (=> start!42466 true))

(declare-fun array_inv!10650 (array!30456) Bool)

(assert (=> start!42466 (array_inv!10650 _keys!1025)))

(declare-fun array_inv!10651 (array!30458) Bool)

(assert (=> start!42466 (and (array_inv!10651 _values!833) e!278093)))

(assert (= (and start!42466 res!283093) b!473916))

(assert (= (and b!473916 res!283090) b!473918))

(assert (= (and b!473918 res!283091) b!473915))

(assert (= (and b!473915 res!283089) b!473913))

(assert (= (and b!473913 (not res!283092)) b!473912))

(assert (= (and b!473919 condMapEmpty!21760) mapIsEmpty!21760))

(assert (= (and b!473919 (not condMapEmpty!21760)) mapNonEmpty!21760))

(get-info :version)

(assert (= (and mapNonEmpty!21760 ((_ is ValueCellFull!6338) mapValue!21760)) b!473914))

(assert (= (and b!473919 ((_ is ValueCellFull!6338) mapDefault!21760)) b!473917))

(assert (= start!42466 b!473919))

(declare-fun m!456355 () Bool)

(assert (=> mapNonEmpty!21760 m!456355))

(declare-fun m!456357 () Bool)

(assert (=> start!42466 m!456357))

(declare-fun m!456359 () Bool)

(assert (=> start!42466 m!456359))

(declare-fun m!456361 () Bool)

(assert (=> start!42466 m!456361))

(declare-fun m!456363 () Bool)

(assert (=> b!473912 m!456363))

(declare-fun m!456365 () Bool)

(assert (=> b!473912 m!456365))

(declare-fun m!456367 () Bool)

(assert (=> b!473912 m!456367))

(declare-fun m!456369 () Bool)

(assert (=> b!473912 m!456369))

(assert (=> b!473912 m!456365))

(declare-fun m!456371 () Bool)

(assert (=> b!473912 m!456371))

(declare-fun m!456373 () Bool)

(assert (=> b!473912 m!456373))

(declare-fun m!456375 () Bool)

(assert (=> b!473912 m!456375))

(declare-fun m!456377 () Bool)

(assert (=> b!473915 m!456377))

(declare-fun m!456379 () Bool)

(assert (=> b!473913 m!456379))

(declare-fun m!456381 () Bool)

(assert (=> b!473913 m!456381))

(declare-fun m!456383 () Bool)

(assert (=> b!473913 m!456383))

(declare-fun m!456385 () Bool)

(assert (=> b!473918 m!456385))

(check-sat (not b_next!11935) b_and!20413 tp_is_empty!13363 (not mapNonEmpty!21760) (not b!473913) (not b!473912) (not start!42466) (not b!473915) (not b!473918))
(check-sat b_and!20413 (not b_next!11935))
