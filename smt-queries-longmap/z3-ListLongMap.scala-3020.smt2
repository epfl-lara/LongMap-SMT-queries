; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42460 () Bool)

(assert start!42460)

(declare-fun b_free!11929 () Bool)

(declare-fun b_next!11929 () Bool)

(assert (=> start!42460 (= b_free!11929 (not b_next!11929))))

(declare-fun tp!41824 () Bool)

(declare-fun b_and!20371 () Bool)

(assert (=> start!42460 (= tp!41824 b_and!20371)))

(declare-fun res!282926 () Bool)

(declare-fun e!277903 () Bool)

(assert (=> start!42460 (=> (not res!282926) (not e!277903))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42460 (= res!282926 (validMask!0 mask!1365))))

(assert (=> start!42460 e!277903))

(declare-fun tp_is_empty!13357 () Bool)

(assert (=> start!42460 tp_is_empty!13357))

(assert (=> start!42460 tp!41824))

(assert (=> start!42460 true))

(declare-datatypes ((array!30453 0))(
  ( (array!30454 (arr!14645 (Array (_ BitVec 32) (_ BitVec 64))) (size!14998 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30453)

(declare-fun array_inv!10654 (array!30453) Bool)

(assert (=> start!42460 (array_inv!10654 _keys!1025)))

(declare-datatypes ((V!18915 0))(
  ( (V!18916 (val!6723 Int)) )
))
(declare-datatypes ((ValueCell!6335 0))(
  ( (ValueCellFull!6335 (v!9009 V!18915)) (EmptyCell!6335) )
))
(declare-datatypes ((array!30455 0))(
  ( (array!30456 (arr!14646 (Array (_ BitVec 32) ValueCell!6335)) (size!14999 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30455)

(declare-fun e!277906 () Bool)

(declare-fun array_inv!10655 (array!30455) Bool)

(assert (=> start!42460 (and (array_inv!10655 _values!833) e!277906)))

(declare-fun b!473630 () Bool)

(declare-fun e!277902 () Bool)

(assert (=> b!473630 (= e!277902 true)))

(declare-datatypes ((tuple2!8914 0))(
  ( (tuple2!8915 (_1!4468 (_ BitVec 64)) (_2!4468 V!18915)) )
))
(declare-datatypes ((List!8979 0))(
  ( (Nil!8976) (Cons!8975 (h!9831 tuple2!8914) (t!14942 List!8979)) )
))
(declare-datatypes ((ListLongMap!7817 0))(
  ( (ListLongMap!7818 (toList!3924 List!8979)) )
))
(declare-fun lt!215346 () ListLongMap!7817)

(declare-fun lt!215348 () tuple2!8914)

(declare-fun minValueBefore!38 () V!18915)

(declare-fun +!1773 (ListLongMap!7817 tuple2!8914) ListLongMap!7817)

(assert (=> b!473630 (= (+!1773 lt!215346 lt!215348) (+!1773 (+!1773 lt!215346 (tuple2!8915 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215348))))

(declare-fun minValueAfter!38 () V!18915)

(assert (=> b!473630 (= lt!215348 (tuple2!8915 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13944 0))(
  ( (Unit!13945) )
))
(declare-fun lt!215343 () Unit!13944)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!152 (ListLongMap!7817 (_ BitVec 64) V!18915 V!18915) Unit!13944)

(assert (=> b!473630 (= lt!215343 (addSameAsAddTwiceSameKeyDiffValues!152 lt!215346 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215344 () ListLongMap!7817)

(declare-fun zeroValue!794 () V!18915)

(assert (=> b!473630 (= lt!215346 (+!1773 lt!215344 (tuple2!8915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lt!215345 () ListLongMap!7817)

(declare-fun getCurrentListMap!2225 (array!30453 array!30455 (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 (_ BitVec 32) Int) ListLongMap!7817)

(assert (=> b!473630 (= lt!215345 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215342 () ListLongMap!7817)

(assert (=> b!473630 (= lt!215342 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473631 () Bool)

(assert (=> b!473631 (= e!277903 (not e!277902))))

(declare-fun res!282922 () Bool)

(assert (=> b!473631 (=> res!282922 e!277902)))

(assert (=> b!473631 (= res!282922 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215347 () ListLongMap!7817)

(assert (=> b!473631 (= lt!215344 lt!215347)))

(declare-fun lt!215349 () Unit!13944)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!249 (array!30453 array!30455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 V!18915 V!18915 (_ BitVec 32) Int) Unit!13944)

(assert (=> b!473631 (= lt!215349 (lemmaNoChangeToArrayThenSameMapNoExtras!249 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2092 (array!30453 array!30455 (_ BitVec 32) (_ BitVec 32) V!18915 V!18915 (_ BitVec 32) Int) ListLongMap!7817)

(assert (=> b!473631 (= lt!215347 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473631 (= lt!215344 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21751 () Bool)

(declare-fun mapRes!21751 () Bool)

(declare-fun tp!41823 () Bool)

(declare-fun e!277904 () Bool)

(assert (=> mapNonEmpty!21751 (= mapRes!21751 (and tp!41823 e!277904))))

(declare-fun mapKey!21751 () (_ BitVec 32))

(declare-fun mapRest!21751 () (Array (_ BitVec 32) ValueCell!6335))

(declare-fun mapValue!21751 () ValueCell!6335)

(assert (=> mapNonEmpty!21751 (= (arr!14646 _values!833) (store mapRest!21751 mapKey!21751 mapValue!21751))))

(declare-fun b!473632 () Bool)

(declare-fun res!282924 () Bool)

(assert (=> b!473632 (=> (not res!282924) (not e!277903))))

(assert (=> b!473632 (= res!282924 (and (= (size!14999 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14998 _keys!1025) (size!14999 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21751 () Bool)

(assert (=> mapIsEmpty!21751 mapRes!21751))

(declare-fun b!473633 () Bool)

(declare-fun e!277901 () Bool)

(assert (=> b!473633 (= e!277901 tp_is_empty!13357)))

(declare-fun b!473634 () Bool)

(declare-fun res!282923 () Bool)

(assert (=> b!473634 (=> (not res!282923) (not e!277903))))

(declare-datatypes ((List!8980 0))(
  ( (Nil!8977) (Cons!8976 (h!9832 (_ BitVec 64)) (t!14943 List!8980)) )
))
(declare-fun arrayNoDuplicates!0 (array!30453 (_ BitVec 32) List!8980) Bool)

(assert (=> b!473634 (= res!282923 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8977))))

(declare-fun b!473635 () Bool)

(declare-fun res!282925 () Bool)

(assert (=> b!473635 (=> (not res!282925) (not e!277903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30453 (_ BitVec 32)) Bool)

(assert (=> b!473635 (= res!282925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473636 () Bool)

(assert (=> b!473636 (= e!277906 (and e!277901 mapRes!21751))))

(declare-fun condMapEmpty!21751 () Bool)

(declare-fun mapDefault!21751 () ValueCell!6335)

(assert (=> b!473636 (= condMapEmpty!21751 (= (arr!14646 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6335)) mapDefault!21751)))))

(declare-fun b!473637 () Bool)

(assert (=> b!473637 (= e!277904 tp_is_empty!13357)))

(assert (= (and start!42460 res!282926) b!473632))

(assert (= (and b!473632 res!282924) b!473635))

(assert (= (and b!473635 res!282925) b!473634))

(assert (= (and b!473634 res!282923) b!473631))

(assert (= (and b!473631 (not res!282922)) b!473630))

(assert (= (and b!473636 condMapEmpty!21751) mapIsEmpty!21751))

(assert (= (and b!473636 (not condMapEmpty!21751)) mapNonEmpty!21751))

(get-info :version)

(assert (= (and mapNonEmpty!21751 ((_ is ValueCellFull!6335) mapValue!21751)) b!473637))

(assert (= (and b!473636 ((_ is ValueCellFull!6335) mapDefault!21751)) b!473633))

(assert (= start!42460 b!473636))

(declare-fun m!455343 () Bool)

(assert (=> b!473630 m!455343))

(declare-fun m!455345 () Bool)

(assert (=> b!473630 m!455345))

(declare-fun m!455347 () Bool)

(assert (=> b!473630 m!455347))

(declare-fun m!455349 () Bool)

(assert (=> b!473630 m!455349))

(assert (=> b!473630 m!455347))

(declare-fun m!455351 () Bool)

(assert (=> b!473630 m!455351))

(declare-fun m!455353 () Bool)

(assert (=> b!473630 m!455353))

(declare-fun m!455355 () Bool)

(assert (=> b!473630 m!455355))

(declare-fun m!455357 () Bool)

(assert (=> start!42460 m!455357))

(declare-fun m!455359 () Bool)

(assert (=> start!42460 m!455359))

(declare-fun m!455361 () Bool)

(assert (=> start!42460 m!455361))

(declare-fun m!455363 () Bool)

(assert (=> b!473634 m!455363))

(declare-fun m!455365 () Bool)

(assert (=> mapNonEmpty!21751 m!455365))

(declare-fun m!455367 () Bool)

(assert (=> b!473631 m!455367))

(declare-fun m!455369 () Bool)

(assert (=> b!473631 m!455369))

(declare-fun m!455371 () Bool)

(assert (=> b!473631 m!455371))

(declare-fun m!455373 () Bool)

(assert (=> b!473635 m!455373))

(check-sat (not b!473631) (not b!473635) (not b!473634) (not mapNonEmpty!21751) tp_is_empty!13357 (not start!42460) (not b_next!11929) b_and!20371 (not b!473630))
(check-sat b_and!20371 (not b_next!11929))
