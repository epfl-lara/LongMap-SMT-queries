; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42386 () Bool)

(assert start!42386)

(declare-fun b_free!11875 () Bool)

(declare-fun b_next!11875 () Bool)

(assert (=> start!42386 (= b_free!11875 (not b_next!11875))))

(declare-fun tp!41659 () Bool)

(declare-fun b_and!20305 () Bool)

(assert (=> start!42386 (= tp!41659 b_and!20305)))

(declare-fun b!472801 () Bool)

(declare-fun res!282438 () Bool)

(declare-fun e!277304 () Bool)

(assert (=> b!472801 (=> (not res!282438) (not e!277304))))

(declare-datatypes ((array!30345 0))(
  ( (array!30346 (arr!14592 (Array (_ BitVec 32) (_ BitVec 64))) (size!14945 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30345)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30345 (_ BitVec 32)) Bool)

(assert (=> b!472801 (= res!282438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472802 () Bool)

(declare-fun e!277305 () Bool)

(declare-fun tp_is_empty!13303 () Bool)

(assert (=> b!472802 (= e!277305 tp_is_empty!13303)))

(declare-fun b!472803 () Bool)

(declare-fun e!277302 () Bool)

(assert (=> b!472803 (= e!277304 (not e!277302))))

(declare-fun res!282439 () Bool)

(assert (=> b!472803 (=> res!282439 e!277302)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472803 (= res!282439 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18843 0))(
  ( (V!18844 (val!6696 Int)) )
))
(declare-datatypes ((tuple2!8866 0))(
  ( (tuple2!8867 (_1!4444 (_ BitVec 64)) (_2!4444 V!18843)) )
))
(declare-datatypes ((List!8935 0))(
  ( (Nil!8932) (Cons!8931 (h!9787 tuple2!8866) (t!14896 List!8935)) )
))
(declare-datatypes ((ListLongMap!7769 0))(
  ( (ListLongMap!7770 (toList!3900 List!8935)) )
))
(declare-fun lt!214546 () ListLongMap!7769)

(declare-fun lt!214539 () ListLongMap!7769)

(assert (=> b!472803 (= lt!214546 lt!214539)))

(declare-fun zeroValue!794 () V!18843)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18843)

(declare-datatypes ((Unit!13894 0))(
  ( (Unit!13895) )
))
(declare-fun lt!214544 () Unit!13894)

(declare-datatypes ((ValueCell!6308 0))(
  ( (ValueCellFull!6308 (v!8981 V!18843)) (EmptyCell!6308) )
))
(declare-datatypes ((array!30347 0))(
  ( (array!30348 (arr!14593 (Array (_ BitVec 32) ValueCell!6308)) (size!14946 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30347)

(declare-fun minValueAfter!38 () V!18843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!228 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 V!18843 V!18843 (_ BitVec 32) Int) Unit!13894)

(assert (=> b!472803 (= lt!214544 (lemmaNoChangeToArrayThenSameMapNoExtras!228 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2071 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 (_ BitVec 32) Int) ListLongMap!7769)

(assert (=> b!472803 (= lt!214539 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472803 (= lt!214546 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282441 () Bool)

(assert (=> start!42386 (=> (not res!282441) (not e!277304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42386 (= res!282441 (validMask!0 mask!1365))))

(assert (=> start!42386 e!277304))

(assert (=> start!42386 tp_is_empty!13303))

(assert (=> start!42386 tp!41659))

(assert (=> start!42386 true))

(declare-fun array_inv!10614 (array!30345) Bool)

(assert (=> start!42386 (array_inv!10614 _keys!1025)))

(declare-fun e!277307 () Bool)

(declare-fun array_inv!10615 (array!30347) Bool)

(assert (=> start!42386 (and (array_inv!10615 _values!833) e!277307)))

(declare-fun mapIsEmpty!21667 () Bool)

(declare-fun mapRes!21667 () Bool)

(assert (=> mapIsEmpty!21667 mapRes!21667))

(declare-fun mapNonEmpty!21667 () Bool)

(declare-fun tp!41658 () Bool)

(assert (=> mapNonEmpty!21667 (= mapRes!21667 (and tp!41658 e!277305))))

(declare-fun mapValue!21667 () ValueCell!6308)

(declare-fun mapKey!21667 () (_ BitVec 32))

(declare-fun mapRest!21667 () (Array (_ BitVec 32) ValueCell!6308))

(assert (=> mapNonEmpty!21667 (= (arr!14593 _values!833) (store mapRest!21667 mapKey!21667 mapValue!21667))))

(declare-fun b!472804 () Bool)

(declare-fun res!282440 () Bool)

(assert (=> b!472804 (=> (not res!282440) (not e!277304))))

(declare-datatypes ((List!8936 0))(
  ( (Nil!8933) (Cons!8932 (h!9788 (_ BitVec 64)) (t!14897 List!8936)) )
))
(declare-fun arrayNoDuplicates!0 (array!30345 (_ BitVec 32) List!8936) Bool)

(assert (=> b!472804 (= res!282440 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8933))))

(declare-fun b!472805 () Bool)

(assert (=> b!472805 (= e!277302 true)))

(declare-fun lt!214545 () ListLongMap!7769)

(declare-fun lt!214540 () tuple2!8866)

(declare-fun +!1752 (ListLongMap!7769 tuple2!8866) ListLongMap!7769)

(assert (=> b!472805 (= (+!1752 lt!214545 lt!214540) (+!1752 (+!1752 lt!214545 (tuple2!8867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214540))))

(assert (=> b!472805 (= lt!214540 (tuple2!8867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214542 () Unit!13894)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!131 (ListLongMap!7769 (_ BitVec 64) V!18843 V!18843) Unit!13894)

(assert (=> b!472805 (= lt!214542 (addSameAsAddTwiceSameKeyDiffValues!131 lt!214545 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472805 (= lt!214545 (+!1752 lt!214546 (tuple2!8867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214541 () ListLongMap!7769)

(declare-fun getCurrentListMap!2204 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) V!18843 V!18843 (_ BitVec 32) Int) ListLongMap!7769)

(assert (=> b!472805 (= lt!214541 (getCurrentListMap!2204 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214543 () ListLongMap!7769)

(assert (=> b!472805 (= lt!214543 (getCurrentListMap!2204 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472806 () Bool)

(declare-fun e!277306 () Bool)

(assert (=> b!472806 (= e!277307 (and e!277306 mapRes!21667))))

(declare-fun condMapEmpty!21667 () Bool)

(declare-fun mapDefault!21667 () ValueCell!6308)

(assert (=> b!472806 (= condMapEmpty!21667 (= (arr!14593 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6308)) mapDefault!21667)))))

(declare-fun b!472807 () Bool)

(declare-fun res!282442 () Bool)

(assert (=> b!472807 (=> (not res!282442) (not e!277304))))

(assert (=> b!472807 (= res!282442 (and (= (size!14946 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14945 _keys!1025) (size!14946 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472808 () Bool)

(assert (=> b!472808 (= e!277306 tp_is_empty!13303)))

(assert (= (and start!42386 res!282441) b!472807))

(assert (= (and b!472807 res!282442) b!472801))

(assert (= (and b!472801 res!282438) b!472804))

(assert (= (and b!472804 res!282440) b!472803))

(assert (= (and b!472803 (not res!282439)) b!472805))

(assert (= (and b!472806 condMapEmpty!21667) mapIsEmpty!21667))

(assert (= (and b!472806 (not condMapEmpty!21667)) mapNonEmpty!21667))

(get-info :version)

(assert (= (and mapNonEmpty!21667 ((_ is ValueCellFull!6308) mapValue!21667)) b!472802))

(assert (= (and b!472806 ((_ is ValueCellFull!6308) mapDefault!21667)) b!472808))

(assert (= start!42386 b!472806))

(declare-fun m!454267 () Bool)

(assert (=> b!472801 m!454267))

(declare-fun m!454269 () Bool)

(assert (=> b!472803 m!454269))

(declare-fun m!454271 () Bool)

(assert (=> b!472803 m!454271))

(declare-fun m!454273 () Bool)

(assert (=> b!472803 m!454273))

(declare-fun m!454275 () Bool)

(assert (=> b!472804 m!454275))

(declare-fun m!454277 () Bool)

(assert (=> start!42386 m!454277))

(declare-fun m!454279 () Bool)

(assert (=> start!42386 m!454279))

(declare-fun m!454281 () Bool)

(assert (=> start!42386 m!454281))

(declare-fun m!454283 () Bool)

(assert (=> b!472805 m!454283))

(declare-fun m!454285 () Bool)

(assert (=> b!472805 m!454285))

(declare-fun m!454287 () Bool)

(assert (=> b!472805 m!454287))

(assert (=> b!472805 m!454285))

(declare-fun m!454289 () Bool)

(assert (=> b!472805 m!454289))

(declare-fun m!454291 () Bool)

(assert (=> b!472805 m!454291))

(declare-fun m!454293 () Bool)

(assert (=> b!472805 m!454293))

(declare-fun m!454295 () Bool)

(assert (=> b!472805 m!454295))

(declare-fun m!454297 () Bool)

(assert (=> mapNonEmpty!21667 m!454297))

(check-sat (not b!472805) (not b_next!11875) (not b!472801) (not b!472803) (not b!472804) b_and!20305 (not start!42386) (not mapNonEmpty!21667) tp_is_empty!13303)
(check-sat b_and!20305 (not b_next!11875))
