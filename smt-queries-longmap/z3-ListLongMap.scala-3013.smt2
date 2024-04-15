; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42398 () Bool)

(assert start!42398)

(declare-fun b_free!11887 () Bool)

(declare-fun b_next!11887 () Bool)

(assert (=> start!42398 (= b_free!11887 (not b_next!11887))))

(declare-fun tp!41695 () Bool)

(declare-fun b_and!20317 () Bool)

(assert (=> start!42398 (= tp!41695 b_and!20317)))

(declare-fun b!472945 () Bool)

(declare-fun res!282528 () Bool)

(declare-fun e!277415 () Bool)

(assert (=> b!472945 (=> (not res!282528) (not e!277415))))

(declare-datatypes ((array!30367 0))(
  ( (array!30368 (arr!14603 (Array (_ BitVec 32) (_ BitVec 64))) (size!14956 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30367)

(declare-datatypes ((List!8945 0))(
  ( (Nil!8942) (Cons!8941 (h!9797 (_ BitVec 64)) (t!14906 List!8945)) )
))
(declare-fun arrayNoDuplicates!0 (array!30367 (_ BitVec 32) List!8945) Bool)

(assert (=> b!472945 (= res!282528 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8942))))

(declare-fun b!472946 () Bool)

(declare-fun e!277411 () Bool)

(assert (=> b!472946 (= e!277415 (not e!277411))))

(declare-fun res!282532 () Bool)

(assert (=> b!472946 (=> res!282532 e!277411)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472946 (= res!282532 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18859 0))(
  ( (V!18860 (val!6702 Int)) )
))
(declare-datatypes ((tuple2!8876 0))(
  ( (tuple2!8877 (_1!4449 (_ BitVec 64)) (_2!4449 V!18859)) )
))
(declare-datatypes ((List!8946 0))(
  ( (Nil!8943) (Cons!8942 (h!9798 tuple2!8876) (t!14907 List!8946)) )
))
(declare-datatypes ((ListLongMap!7779 0))(
  ( (ListLongMap!7780 (toList!3905 List!8946)) )
))
(declare-fun lt!214683 () ListLongMap!7779)

(declare-fun lt!214688 () ListLongMap!7779)

(assert (=> b!472946 (= lt!214683 lt!214688)))

(declare-fun minValueBefore!38 () V!18859)

(declare-fun zeroValue!794 () V!18859)

(declare-datatypes ((Unit!13904 0))(
  ( (Unit!13905) )
))
(declare-fun lt!214684 () Unit!13904)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6314 0))(
  ( (ValueCellFull!6314 (v!8987 V!18859)) (EmptyCell!6314) )
))
(declare-datatypes ((array!30369 0))(
  ( (array!30370 (arr!14604 (Array (_ BitVec 32) ValueCell!6314)) (size!14957 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30369)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18859)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!232 (array!30367 array!30369 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 V!18859 V!18859 (_ BitVec 32) Int) Unit!13904)

(assert (=> b!472946 (= lt!214684 (lemmaNoChangeToArrayThenSameMapNoExtras!232 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2075 (array!30367 array!30369 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!472946 (= lt!214688 (getCurrentListMapNoExtraKeys!2075 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472946 (= lt!214683 (getCurrentListMapNoExtraKeys!2075 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472947 () Bool)

(declare-fun e!277413 () Bool)

(declare-fun e!277410 () Bool)

(declare-fun mapRes!21685 () Bool)

(assert (=> b!472947 (= e!277413 (and e!277410 mapRes!21685))))

(declare-fun condMapEmpty!21685 () Bool)

(declare-fun mapDefault!21685 () ValueCell!6314)

(assert (=> b!472947 (= condMapEmpty!21685 (= (arr!14604 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6314)) mapDefault!21685)))))

(declare-fun b!472948 () Bool)

(assert (=> b!472948 (= e!277411 true)))

(declare-fun lt!214689 () ListLongMap!7779)

(declare-fun lt!214686 () tuple2!8876)

(declare-fun +!1757 (ListLongMap!7779 tuple2!8876) ListLongMap!7779)

(assert (=> b!472948 (= (+!1757 lt!214689 lt!214686) (+!1757 (+!1757 lt!214689 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214686))))

(assert (=> b!472948 (= lt!214686 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214687 () Unit!13904)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!136 (ListLongMap!7779 (_ BitVec 64) V!18859 V!18859) Unit!13904)

(assert (=> b!472948 (= lt!214687 (addSameAsAddTwiceSameKeyDiffValues!136 lt!214689 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472948 (= lt!214689 (+!1757 lt!214683 (tuple2!8877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214690 () ListLongMap!7779)

(declare-fun getCurrentListMap!2209 (array!30367 array!30369 (_ BitVec 32) (_ BitVec 32) V!18859 V!18859 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!472948 (= lt!214690 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214685 () ListLongMap!7779)

(assert (=> b!472948 (= lt!214685 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472949 () Bool)

(declare-fun res!282531 () Bool)

(assert (=> b!472949 (=> (not res!282531) (not e!277415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30367 (_ BitVec 32)) Bool)

(assert (=> b!472949 (= res!282531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472950 () Bool)

(declare-fun tp_is_empty!13315 () Bool)

(assert (=> b!472950 (= e!277410 tp_is_empty!13315)))

(declare-fun res!282530 () Bool)

(assert (=> start!42398 (=> (not res!282530) (not e!277415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42398 (= res!282530 (validMask!0 mask!1365))))

(assert (=> start!42398 e!277415))

(assert (=> start!42398 tp_is_empty!13315))

(assert (=> start!42398 tp!41695))

(assert (=> start!42398 true))

(declare-fun array_inv!10624 (array!30367) Bool)

(assert (=> start!42398 (array_inv!10624 _keys!1025)))

(declare-fun array_inv!10625 (array!30369) Bool)

(assert (=> start!42398 (and (array_inv!10625 _values!833) e!277413)))

(declare-fun mapIsEmpty!21685 () Bool)

(assert (=> mapIsEmpty!21685 mapRes!21685))

(declare-fun b!472951 () Bool)

(declare-fun e!277414 () Bool)

(assert (=> b!472951 (= e!277414 tp_is_empty!13315)))

(declare-fun mapNonEmpty!21685 () Bool)

(declare-fun tp!41694 () Bool)

(assert (=> mapNonEmpty!21685 (= mapRes!21685 (and tp!41694 e!277414))))

(declare-fun mapValue!21685 () ValueCell!6314)

(declare-fun mapRest!21685 () (Array (_ BitVec 32) ValueCell!6314))

(declare-fun mapKey!21685 () (_ BitVec 32))

(assert (=> mapNonEmpty!21685 (= (arr!14604 _values!833) (store mapRest!21685 mapKey!21685 mapValue!21685))))

(declare-fun b!472952 () Bool)

(declare-fun res!282529 () Bool)

(assert (=> b!472952 (=> (not res!282529) (not e!277415))))

(assert (=> b!472952 (= res!282529 (and (= (size!14957 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14956 _keys!1025) (size!14957 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42398 res!282530) b!472952))

(assert (= (and b!472952 res!282529) b!472949))

(assert (= (and b!472949 res!282531) b!472945))

(assert (= (and b!472945 res!282528) b!472946))

(assert (= (and b!472946 (not res!282532)) b!472948))

(assert (= (and b!472947 condMapEmpty!21685) mapIsEmpty!21685))

(assert (= (and b!472947 (not condMapEmpty!21685)) mapNonEmpty!21685))

(get-info :version)

(assert (= (and mapNonEmpty!21685 ((_ is ValueCellFull!6314) mapValue!21685)) b!472951))

(assert (= (and b!472947 ((_ is ValueCellFull!6314) mapDefault!21685)) b!472950))

(assert (= start!42398 b!472947))

(declare-fun m!454459 () Bool)

(assert (=> b!472946 m!454459))

(declare-fun m!454461 () Bool)

(assert (=> b!472946 m!454461))

(declare-fun m!454463 () Bool)

(assert (=> b!472946 m!454463))

(declare-fun m!454465 () Bool)

(assert (=> start!42398 m!454465))

(declare-fun m!454467 () Bool)

(assert (=> start!42398 m!454467))

(declare-fun m!454469 () Bool)

(assert (=> start!42398 m!454469))

(declare-fun m!454471 () Bool)

(assert (=> b!472948 m!454471))

(declare-fun m!454473 () Bool)

(assert (=> b!472948 m!454473))

(declare-fun m!454475 () Bool)

(assert (=> b!472948 m!454475))

(assert (=> b!472948 m!454471))

(declare-fun m!454477 () Bool)

(assert (=> b!472948 m!454477))

(declare-fun m!454479 () Bool)

(assert (=> b!472948 m!454479))

(declare-fun m!454481 () Bool)

(assert (=> b!472948 m!454481))

(declare-fun m!454483 () Bool)

(assert (=> b!472948 m!454483))

(declare-fun m!454485 () Bool)

(assert (=> b!472945 m!454485))

(declare-fun m!454487 () Bool)

(assert (=> mapNonEmpty!21685 m!454487))

(declare-fun m!454489 () Bool)

(assert (=> b!472949 m!454489))

(check-sat (not mapNonEmpty!21685) (not start!42398) (not b!472945) (not b!472946) (not b_next!11887) tp_is_empty!13315 (not b!472949) b_and!20317 (not b!472948))
(check-sat b_and!20317 (not b_next!11887))
