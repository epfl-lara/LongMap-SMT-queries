; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42392 () Bool)

(assert start!42392)

(declare-fun b_free!11881 () Bool)

(declare-fun b_next!11881 () Bool)

(assert (=> start!42392 (= b_free!11881 (not b_next!11881))))

(declare-fun tp!41676 () Bool)

(declare-fun b_and!20311 () Bool)

(assert (=> start!42392 (= tp!41676 b_and!20311)))

(declare-fun b!472873 () Bool)

(declare-fun e!277361 () Bool)

(declare-fun tp_is_empty!13309 () Bool)

(assert (=> b!472873 (= e!277361 tp_is_empty!13309)))

(declare-fun mapIsEmpty!21676 () Bool)

(declare-fun mapRes!21676 () Bool)

(assert (=> mapIsEmpty!21676 mapRes!21676))

(declare-fun b!472874 () Bool)

(declare-fun res!282485 () Bool)

(declare-fun e!277360 () Bool)

(assert (=> b!472874 (=> (not res!282485) (not e!277360))))

(declare-datatypes ((array!30357 0))(
  ( (array!30358 (arr!14598 (Array (_ BitVec 32) (_ BitVec 64))) (size!14951 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30357)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30357 (_ BitVec 32)) Bool)

(assert (=> b!472874 (= res!282485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472875 () Bool)

(declare-fun res!282486 () Bool)

(assert (=> b!472875 (=> (not res!282486) (not e!277360))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18851 0))(
  ( (V!18852 (val!6699 Int)) )
))
(declare-datatypes ((ValueCell!6311 0))(
  ( (ValueCellFull!6311 (v!8984 V!18851)) (EmptyCell!6311) )
))
(declare-datatypes ((array!30359 0))(
  ( (array!30360 (arr!14599 (Array (_ BitVec 32) ValueCell!6311)) (size!14952 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30359)

(assert (=> b!472875 (= res!282486 (and (= (size!14952 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14951 _keys!1025) (size!14952 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472876 () Bool)

(declare-fun res!282483 () Bool)

(assert (=> b!472876 (=> (not res!282483) (not e!277360))))

(declare-datatypes ((List!8941 0))(
  ( (Nil!8938) (Cons!8937 (h!9793 (_ BitVec 64)) (t!14902 List!8941)) )
))
(declare-fun arrayNoDuplicates!0 (array!30357 (_ BitVec 32) List!8941) Bool)

(assert (=> b!472876 (= res!282483 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8938))))

(declare-fun mapNonEmpty!21676 () Bool)

(declare-fun tp!41677 () Bool)

(assert (=> mapNonEmpty!21676 (= mapRes!21676 (and tp!41677 e!277361))))

(declare-fun mapRest!21676 () (Array (_ BitVec 32) ValueCell!6311))

(declare-fun mapKey!21676 () (_ BitVec 32))

(declare-fun mapValue!21676 () ValueCell!6311)

(assert (=> mapNonEmpty!21676 (= (arr!14599 _values!833) (store mapRest!21676 mapKey!21676 mapValue!21676))))

(declare-fun res!282487 () Bool)

(assert (=> start!42392 (=> (not res!282487) (not e!277360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42392 (= res!282487 (validMask!0 mask!1365))))

(assert (=> start!42392 e!277360))

(assert (=> start!42392 tp_is_empty!13309))

(assert (=> start!42392 tp!41676))

(assert (=> start!42392 true))

(declare-fun array_inv!10620 (array!30357) Bool)

(assert (=> start!42392 (array_inv!10620 _keys!1025)))

(declare-fun e!277358 () Bool)

(declare-fun array_inv!10621 (array!30359) Bool)

(assert (=> start!42392 (and (array_inv!10621 _values!833) e!277358)))

(declare-fun b!472877 () Bool)

(declare-fun e!277359 () Bool)

(assert (=> b!472877 (= e!277359 true)))

(declare-datatypes ((tuple2!8872 0))(
  ( (tuple2!8873 (_1!4447 (_ BitVec 64)) (_2!4447 V!18851)) )
))
(declare-datatypes ((List!8942 0))(
  ( (Nil!8939) (Cons!8938 (h!9794 tuple2!8872) (t!14903 List!8942)) )
))
(declare-datatypes ((ListLongMap!7775 0))(
  ( (ListLongMap!7776 (toList!3903 List!8942)) )
))
(declare-fun lt!214611 () ListLongMap!7775)

(declare-fun lt!214612 () tuple2!8872)

(declare-fun minValueBefore!38 () V!18851)

(declare-fun +!1755 (ListLongMap!7775 tuple2!8872) ListLongMap!7775)

(assert (=> b!472877 (= (+!1755 lt!214611 lt!214612) (+!1755 (+!1755 lt!214611 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214612))))

(declare-fun minValueAfter!38 () V!18851)

(assert (=> b!472877 (= lt!214612 (tuple2!8873 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13900 0))(
  ( (Unit!13901) )
))
(declare-fun lt!214617 () Unit!13900)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!134 (ListLongMap!7775 (_ BitVec 64) V!18851 V!18851) Unit!13900)

(assert (=> b!472877 (= lt!214617 (addSameAsAddTwiceSameKeyDiffValues!134 lt!214611 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214618 () ListLongMap!7775)

(declare-fun zeroValue!794 () V!18851)

(assert (=> b!472877 (= lt!214611 (+!1755 lt!214618 (tuple2!8873 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214614 () ListLongMap!7775)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2207 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 (_ BitVec 32) Int) ListLongMap!7775)

(assert (=> b!472877 (= lt!214614 (getCurrentListMap!2207 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214615 () ListLongMap!7775)

(assert (=> b!472877 (= lt!214615 (getCurrentListMap!2207 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472878 () Bool)

(assert (=> b!472878 (= e!277360 (not e!277359))))

(declare-fun res!282484 () Bool)

(assert (=> b!472878 (=> res!282484 e!277359)))

(assert (=> b!472878 (= res!282484 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214613 () ListLongMap!7775)

(assert (=> b!472878 (= lt!214618 lt!214613)))

(declare-fun lt!214616 () Unit!13900)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!230 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 V!18851 V!18851 (_ BitVec 32) Int) Unit!13900)

(assert (=> b!472878 (= lt!214616 (lemmaNoChangeToArrayThenSameMapNoExtras!230 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2073 (array!30357 array!30359 (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 (_ BitVec 32) Int) ListLongMap!7775)

(assert (=> b!472878 (= lt!214613 (getCurrentListMapNoExtraKeys!2073 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472878 (= lt!214618 (getCurrentListMapNoExtraKeys!2073 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472879 () Bool)

(declare-fun e!277357 () Bool)

(assert (=> b!472879 (= e!277357 tp_is_empty!13309)))

(declare-fun b!472880 () Bool)

(assert (=> b!472880 (= e!277358 (and e!277357 mapRes!21676))))

(declare-fun condMapEmpty!21676 () Bool)

(declare-fun mapDefault!21676 () ValueCell!6311)

(assert (=> b!472880 (= condMapEmpty!21676 (= (arr!14599 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6311)) mapDefault!21676)))))

(assert (= (and start!42392 res!282487) b!472875))

(assert (= (and b!472875 res!282486) b!472874))

(assert (= (and b!472874 res!282485) b!472876))

(assert (= (and b!472876 res!282483) b!472878))

(assert (= (and b!472878 (not res!282484)) b!472877))

(assert (= (and b!472880 condMapEmpty!21676) mapIsEmpty!21676))

(assert (= (and b!472880 (not condMapEmpty!21676)) mapNonEmpty!21676))

(get-info :version)

(assert (= (and mapNonEmpty!21676 ((_ is ValueCellFull!6311) mapValue!21676)) b!472873))

(assert (= (and b!472880 ((_ is ValueCellFull!6311) mapDefault!21676)) b!472879))

(assert (= start!42392 b!472880))

(declare-fun m!454363 () Bool)

(assert (=> b!472876 m!454363))

(declare-fun m!454365 () Bool)

(assert (=> b!472878 m!454365))

(declare-fun m!454367 () Bool)

(assert (=> b!472878 m!454367))

(declare-fun m!454369 () Bool)

(assert (=> b!472878 m!454369))

(declare-fun m!454371 () Bool)

(assert (=> start!42392 m!454371))

(declare-fun m!454373 () Bool)

(assert (=> start!42392 m!454373))

(declare-fun m!454375 () Bool)

(assert (=> start!42392 m!454375))

(declare-fun m!454377 () Bool)

(assert (=> mapNonEmpty!21676 m!454377))

(declare-fun m!454379 () Bool)

(assert (=> b!472877 m!454379))

(declare-fun m!454381 () Bool)

(assert (=> b!472877 m!454381))

(declare-fun m!454383 () Bool)

(assert (=> b!472877 m!454383))

(assert (=> b!472877 m!454379))

(declare-fun m!454385 () Bool)

(assert (=> b!472877 m!454385))

(declare-fun m!454387 () Bool)

(assert (=> b!472877 m!454387))

(declare-fun m!454389 () Bool)

(assert (=> b!472877 m!454389))

(declare-fun m!454391 () Bool)

(assert (=> b!472877 m!454391))

(declare-fun m!454393 () Bool)

(assert (=> b!472874 m!454393))

(check-sat tp_is_empty!13309 (not mapNonEmpty!21676) (not start!42392) b_and!20311 (not b!472874) (not b!472878) (not b_next!11881) (not b!472877) (not b!472876))
(check-sat b_and!20311 (not b_next!11881))
