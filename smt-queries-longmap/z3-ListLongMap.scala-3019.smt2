; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42454 () Bool)

(assert start!42454)

(declare-fun b_free!11923 () Bool)

(declare-fun b_next!11923 () Bool)

(assert (=> start!42454 (= b_free!11923 (not b_next!11923))))

(declare-fun tp!41805 () Bool)

(declare-fun b_and!20365 () Bool)

(assert (=> start!42454 (= tp!41805 b_and!20365)))

(declare-fun b!473558 () Bool)

(declare-fun res!282878 () Bool)

(declare-fun e!277850 () Bool)

(assert (=> b!473558 (=> (not res!282878) (not e!277850))))

(declare-datatypes ((array!30441 0))(
  ( (array!30442 (arr!14639 (Array (_ BitVec 32) (_ BitVec 64))) (size!14992 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30441)

(declare-datatypes ((List!8974 0))(
  ( (Nil!8971) (Cons!8970 (h!9826 (_ BitVec 64)) (t!14937 List!8974)) )
))
(declare-fun arrayNoDuplicates!0 (array!30441 (_ BitVec 32) List!8974) Bool)

(assert (=> b!473558 (= res!282878 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8971))))

(declare-fun b!473559 () Bool)

(declare-fun res!282879 () Bool)

(assert (=> b!473559 (=> (not res!282879) (not e!277850))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18907 0))(
  ( (V!18908 (val!6720 Int)) )
))
(declare-datatypes ((ValueCell!6332 0))(
  ( (ValueCellFull!6332 (v!9006 V!18907)) (EmptyCell!6332) )
))
(declare-datatypes ((array!30443 0))(
  ( (array!30444 (arr!14640 (Array (_ BitVec 32) ValueCell!6332)) (size!14993 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30443)

(assert (=> b!473559 (= res!282879 (and (= (size!14993 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14992 _keys!1025) (size!14993 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21742 () Bool)

(declare-fun mapRes!21742 () Bool)

(assert (=> mapIsEmpty!21742 mapRes!21742))

(declare-fun b!473560 () Bool)

(declare-fun e!277847 () Bool)

(declare-fun tp_is_empty!13351 () Bool)

(assert (=> b!473560 (= e!277847 tp_is_empty!13351)))

(declare-fun b!473561 () Bool)

(declare-fun e!277851 () Bool)

(assert (=> b!473561 (= e!277851 (and e!277847 mapRes!21742))))

(declare-fun condMapEmpty!21742 () Bool)

(declare-fun mapDefault!21742 () ValueCell!6332)

(assert (=> b!473561 (= condMapEmpty!21742 (= (arr!14640 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6332)) mapDefault!21742)))))

(declare-fun b!473562 () Bool)

(declare-fun e!277849 () Bool)

(assert (=> b!473562 (= e!277849 tp_is_empty!13351)))

(declare-fun res!282880 () Bool)

(assert (=> start!42454 (=> (not res!282880) (not e!277850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42454 (= res!282880 (validMask!0 mask!1365))))

(assert (=> start!42454 e!277850))

(assert (=> start!42454 tp_is_empty!13351))

(assert (=> start!42454 tp!41805))

(assert (=> start!42454 true))

(declare-fun array_inv!10648 (array!30441) Bool)

(assert (=> start!42454 (array_inv!10648 _keys!1025)))

(declare-fun array_inv!10649 (array!30443) Bool)

(assert (=> start!42454 (and (array_inv!10649 _values!833) e!277851)))

(declare-fun b!473563 () Bool)

(declare-fun e!277852 () Bool)

(assert (=> b!473563 (= e!277850 (not e!277852))))

(declare-fun res!282877 () Bool)

(assert (=> b!473563 (=> res!282877 e!277852)))

(assert (=> b!473563 (= res!282877 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8908 0))(
  ( (tuple2!8909 (_1!4465 (_ BitVec 64)) (_2!4465 V!18907)) )
))
(declare-datatypes ((List!8975 0))(
  ( (Nil!8972) (Cons!8971 (h!9827 tuple2!8908) (t!14938 List!8975)) )
))
(declare-datatypes ((ListLongMap!7811 0))(
  ( (ListLongMap!7812 (toList!3921 List!8975)) )
))
(declare-fun lt!215275 () ListLongMap!7811)

(declare-fun lt!215274 () ListLongMap!7811)

(assert (=> b!473563 (= lt!215275 lt!215274)))

(declare-fun minValueBefore!38 () V!18907)

(declare-fun zeroValue!794 () V!18907)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13938 0))(
  ( (Unit!13939) )
))
(declare-fun lt!215273 () Unit!13938)

(declare-fun minValueAfter!38 () V!18907)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!246 (array!30441 array!30443 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 V!18907 V!18907 (_ BitVec 32) Int) Unit!13938)

(assert (=> b!473563 (= lt!215273 (lemmaNoChangeToArrayThenSameMapNoExtras!246 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2089 (array!30441 array!30443 (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 (_ BitVec 32) Int) ListLongMap!7811)

(assert (=> b!473563 (= lt!215274 (getCurrentListMapNoExtraKeys!2089 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473563 (= lt!215275 (getCurrentListMapNoExtraKeys!2089 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21742 () Bool)

(declare-fun tp!41806 () Bool)

(assert (=> mapNonEmpty!21742 (= mapRes!21742 (and tp!41806 e!277849))))

(declare-fun mapRest!21742 () (Array (_ BitVec 32) ValueCell!6332))

(declare-fun mapKey!21742 () (_ BitVec 32))

(declare-fun mapValue!21742 () ValueCell!6332)

(assert (=> mapNonEmpty!21742 (= (arr!14640 _values!833) (store mapRest!21742 mapKey!21742 mapValue!21742))))

(declare-fun b!473564 () Bool)

(declare-fun res!282881 () Bool)

(assert (=> b!473564 (=> (not res!282881) (not e!277850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30441 (_ BitVec 32)) Bool)

(assert (=> b!473564 (= res!282881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473565 () Bool)

(assert (=> b!473565 (= e!277852 true)))

(declare-fun lt!215277 () ListLongMap!7811)

(declare-fun lt!215272 () tuple2!8908)

(declare-fun +!1771 (ListLongMap!7811 tuple2!8908) ListLongMap!7811)

(assert (=> b!473565 (= (+!1771 lt!215277 lt!215272) (+!1771 (+!1771 lt!215277 (tuple2!8909 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215272))))

(assert (=> b!473565 (= lt!215272 (tuple2!8909 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215270 () Unit!13938)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!150 (ListLongMap!7811 (_ BitVec 64) V!18907 V!18907) Unit!13938)

(assert (=> b!473565 (= lt!215270 (addSameAsAddTwiceSameKeyDiffValues!150 lt!215277 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473565 (= lt!215277 (+!1771 lt!215275 (tuple2!8909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215276 () ListLongMap!7811)

(declare-fun getCurrentListMap!2223 (array!30441 array!30443 (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 (_ BitVec 32) Int) ListLongMap!7811)

(assert (=> b!473565 (= lt!215276 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215271 () ListLongMap!7811)

(assert (=> b!473565 (= lt!215271 (getCurrentListMap!2223 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42454 res!282880) b!473559))

(assert (= (and b!473559 res!282879) b!473564))

(assert (= (and b!473564 res!282881) b!473558))

(assert (= (and b!473558 res!282878) b!473563))

(assert (= (and b!473563 (not res!282877)) b!473565))

(assert (= (and b!473561 condMapEmpty!21742) mapIsEmpty!21742))

(assert (= (and b!473561 (not condMapEmpty!21742)) mapNonEmpty!21742))

(get-info :version)

(assert (= (and mapNonEmpty!21742 ((_ is ValueCellFull!6332) mapValue!21742)) b!473562))

(assert (= (and b!473561 ((_ is ValueCellFull!6332) mapDefault!21742)) b!473560))

(assert (= start!42454 b!473561))

(declare-fun m!455247 () Bool)

(assert (=> b!473563 m!455247))

(declare-fun m!455249 () Bool)

(assert (=> b!473563 m!455249))

(declare-fun m!455251 () Bool)

(assert (=> b!473563 m!455251))

(declare-fun m!455253 () Bool)

(assert (=> b!473564 m!455253))

(declare-fun m!455255 () Bool)

(assert (=> b!473558 m!455255))

(declare-fun m!455257 () Bool)

(assert (=> start!42454 m!455257))

(declare-fun m!455259 () Bool)

(assert (=> start!42454 m!455259))

(declare-fun m!455261 () Bool)

(assert (=> start!42454 m!455261))

(declare-fun m!455263 () Bool)

(assert (=> mapNonEmpty!21742 m!455263))

(declare-fun m!455265 () Bool)

(assert (=> b!473565 m!455265))

(declare-fun m!455267 () Bool)

(assert (=> b!473565 m!455267))

(declare-fun m!455269 () Bool)

(assert (=> b!473565 m!455269))

(declare-fun m!455271 () Bool)

(assert (=> b!473565 m!455271))

(declare-fun m!455273 () Bool)

(assert (=> b!473565 m!455273))

(declare-fun m!455275 () Bool)

(assert (=> b!473565 m!455275))

(declare-fun m!455277 () Bool)

(assert (=> b!473565 m!455277))

(assert (=> b!473565 m!455275))

(check-sat b_and!20365 (not b!473558) tp_is_empty!13351 (not mapNonEmpty!21742) (not start!42454) (not b_next!11923) (not b!473563) (not b!473565) (not b!473564))
(check-sat b_and!20365 (not b_next!11923))
