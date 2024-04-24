; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42374 () Bool)

(assert start!42374)

(declare-fun b_free!11863 () Bool)

(declare-fun b_next!11863 () Bool)

(assert (=> start!42374 (= b_free!11863 (not b_next!11863))))

(declare-fun tp!41623 () Bool)

(declare-fun b_and!20329 () Bool)

(assert (=> start!42374 (= tp!41623 b_and!20329)))

(declare-fun b!472867 () Bool)

(declare-fun res!282473 () Bool)

(declare-fun e!277333 () Bool)

(assert (=> b!472867 (=> (not res!282473) (not e!277333))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30328 0))(
  ( (array!30329 (arr!14583 (Array (_ BitVec 32) (_ BitVec 64))) (size!14935 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30328)

(declare-datatypes ((V!18827 0))(
  ( (V!18828 (val!6690 Int)) )
))
(declare-datatypes ((ValueCell!6302 0))(
  ( (ValueCellFull!6302 (v!8982 V!18827)) (EmptyCell!6302) )
))
(declare-datatypes ((array!30330 0))(
  ( (array!30331 (arr!14584 (Array (_ BitVec 32) ValueCell!6302)) (size!14936 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30330)

(assert (=> b!472867 (= res!282473 (and (= (size!14936 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14935 _keys!1025) (size!14936 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282472 () Bool)

(assert (=> start!42374 (=> (not res!282472) (not e!277333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42374 (= res!282472 (validMask!0 mask!1365))))

(assert (=> start!42374 e!277333))

(declare-fun tp_is_empty!13291 () Bool)

(assert (=> start!42374 tp_is_empty!13291))

(assert (=> start!42374 tp!41623))

(assert (=> start!42374 true))

(declare-fun array_inv!10602 (array!30328) Bool)

(assert (=> start!42374 (array_inv!10602 _keys!1025)))

(declare-fun e!277329 () Bool)

(declare-fun array_inv!10603 (array!30330) Bool)

(assert (=> start!42374 (and (array_inv!10603 _values!833) e!277329)))

(declare-fun b!472868 () Bool)

(declare-fun e!277332 () Bool)

(assert (=> b!472868 (= e!277332 tp_is_empty!13291)))

(declare-fun b!472869 () Bool)

(declare-fun e!277334 () Bool)

(assert (=> b!472869 (= e!277333 (not e!277334))))

(declare-fun res!282471 () Bool)

(assert (=> b!472869 (=> res!282471 e!277334)))

(assert (=> b!472869 (= res!282471 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8740 0))(
  ( (tuple2!8741 (_1!4381 (_ BitVec 64)) (_2!4381 V!18827)) )
))
(declare-datatypes ((List!8803 0))(
  ( (Nil!8800) (Cons!8799 (h!9655 tuple2!8740) (t!14765 List!8803)) )
))
(declare-datatypes ((ListLongMap!7655 0))(
  ( (ListLongMap!7656 (toList!3843 List!8803)) )
))
(declare-fun lt!214646 () ListLongMap!7655)

(declare-fun lt!214648 () ListLongMap!7655)

(assert (=> b!472869 (= lt!214646 lt!214648)))

(declare-datatypes ((Unit!13890 0))(
  ( (Unit!13891) )
))
(declare-fun lt!214641 () Unit!13890)

(declare-fun minValueBefore!38 () V!18827)

(declare-fun zeroValue!794 () V!18827)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18827)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!213 (array!30328 array!30330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 V!18827 V!18827 (_ BitVec 32) Int) Unit!13890)

(assert (=> b!472869 (= lt!214641 (lemmaNoChangeToArrayThenSameMapNoExtras!213 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2053 (array!30328 array!30330 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7655)

(assert (=> b!472869 (= lt!214648 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472869 (= lt!214646 (getCurrentListMapNoExtraKeys!2053 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472870 () Bool)

(declare-fun e!277331 () Bool)

(assert (=> b!472870 (= e!277331 tp_is_empty!13291)))

(declare-fun mapNonEmpty!21649 () Bool)

(declare-fun mapRes!21649 () Bool)

(declare-fun tp!41622 () Bool)

(assert (=> mapNonEmpty!21649 (= mapRes!21649 (and tp!41622 e!277332))))

(declare-fun mapRest!21649 () (Array (_ BitVec 32) ValueCell!6302))

(declare-fun mapValue!21649 () ValueCell!6302)

(declare-fun mapKey!21649 () (_ BitVec 32))

(assert (=> mapNonEmpty!21649 (= (arr!14584 _values!833) (store mapRest!21649 mapKey!21649 mapValue!21649))))

(declare-fun b!472871 () Bool)

(assert (=> b!472871 (= e!277329 (and e!277331 mapRes!21649))))

(declare-fun condMapEmpty!21649 () Bool)

(declare-fun mapDefault!21649 () ValueCell!6302)

(assert (=> b!472871 (= condMapEmpty!21649 (= (arr!14584 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6302)) mapDefault!21649)))))

(declare-fun mapIsEmpty!21649 () Bool)

(assert (=> mapIsEmpty!21649 mapRes!21649))

(declare-fun b!472872 () Bool)

(declare-fun res!282470 () Bool)

(assert (=> b!472872 (=> (not res!282470) (not e!277333))))

(declare-datatypes ((List!8804 0))(
  ( (Nil!8801) (Cons!8800 (h!9656 (_ BitVec 64)) (t!14766 List!8804)) )
))
(declare-fun arrayNoDuplicates!0 (array!30328 (_ BitVec 32) List!8804) Bool)

(assert (=> b!472872 (= res!282470 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8801))))

(declare-fun b!472873 () Bool)

(declare-fun res!282474 () Bool)

(assert (=> b!472873 (=> (not res!282474) (not e!277333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30328 (_ BitVec 32)) Bool)

(assert (=> b!472873 (= res!282474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472874 () Bool)

(assert (=> b!472874 (= e!277334 true)))

(declare-fun lt!214645 () ListLongMap!7655)

(declare-fun lt!214647 () tuple2!8740)

(declare-fun +!1729 (ListLongMap!7655 tuple2!8740) ListLongMap!7655)

(assert (=> b!472874 (= (+!1729 lt!214645 lt!214647) (+!1729 (+!1729 lt!214645 (tuple2!8741 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214647))))

(assert (=> b!472874 (= lt!214647 (tuple2!8741 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214642 () Unit!13890)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!131 (ListLongMap!7655 (_ BitVec 64) V!18827 V!18827) Unit!13890)

(assert (=> b!472874 (= lt!214642 (addSameAsAddTwiceSameKeyDiffValues!131 lt!214645 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472874 (= lt!214645 (+!1729 lt!214646 (tuple2!8741 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214644 () ListLongMap!7655)

(declare-fun getCurrentListMap!2209 (array!30328 array!30330 (_ BitVec 32) (_ BitVec 32) V!18827 V!18827 (_ BitVec 32) Int) ListLongMap!7655)

(assert (=> b!472874 (= lt!214644 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214643 () ListLongMap!7655)

(assert (=> b!472874 (= lt!214643 (getCurrentListMap!2209 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42374 res!282472) b!472867))

(assert (= (and b!472867 res!282473) b!472873))

(assert (= (and b!472873 res!282474) b!472872))

(assert (= (and b!472872 res!282470) b!472869))

(assert (= (and b!472869 (not res!282471)) b!472874))

(assert (= (and b!472871 condMapEmpty!21649) mapIsEmpty!21649))

(assert (= (and b!472871 (not condMapEmpty!21649)) mapNonEmpty!21649))

(get-info :version)

(assert (= (and mapNonEmpty!21649 ((_ is ValueCellFull!6302) mapValue!21649)) b!472868))

(assert (= (and b!472871 ((_ is ValueCellFull!6302) mapDefault!21649)) b!472870))

(assert (= start!42374 b!472871))

(declare-fun m!454991 () Bool)

(assert (=> b!472869 m!454991))

(declare-fun m!454993 () Bool)

(assert (=> b!472869 m!454993))

(declare-fun m!454995 () Bool)

(assert (=> b!472869 m!454995))

(declare-fun m!454997 () Bool)

(assert (=> mapNonEmpty!21649 m!454997))

(declare-fun m!454999 () Bool)

(assert (=> b!472874 m!454999))

(declare-fun m!455001 () Bool)

(assert (=> b!472874 m!455001))

(assert (=> b!472874 m!454999))

(declare-fun m!455003 () Bool)

(assert (=> b!472874 m!455003))

(declare-fun m!455005 () Bool)

(assert (=> b!472874 m!455005))

(declare-fun m!455007 () Bool)

(assert (=> b!472874 m!455007))

(declare-fun m!455009 () Bool)

(assert (=> b!472874 m!455009))

(declare-fun m!455011 () Bool)

(assert (=> b!472874 m!455011))

(declare-fun m!455013 () Bool)

(assert (=> b!472873 m!455013))

(declare-fun m!455015 () Bool)

(assert (=> b!472872 m!455015))

(declare-fun m!455017 () Bool)

(assert (=> start!42374 m!455017))

(declare-fun m!455019 () Bool)

(assert (=> start!42374 m!455019))

(declare-fun m!455021 () Bool)

(assert (=> start!42374 m!455021))

(check-sat (not mapNonEmpty!21649) (not start!42374) (not b!472873) (not b!472869) b_and!20329 tp_is_empty!13291 (not b!472874) (not b_next!11863) (not b!472872))
(check-sat b_and!20329 (not b_next!11863))
