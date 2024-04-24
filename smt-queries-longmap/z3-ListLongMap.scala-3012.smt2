; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42392 () Bool)

(assert start!42392)

(declare-fun b_free!11881 () Bool)

(declare-fun b_next!11881 () Bool)

(assert (=> start!42392 (= b_free!11881 (not b_next!11881))))

(declare-fun tp!41677 () Bool)

(declare-fun b_and!20347 () Bool)

(assert (=> start!42392 (= tp!41677 b_and!20347)))

(declare-fun mapNonEmpty!21676 () Bool)

(declare-fun mapRes!21676 () Bool)

(declare-fun tp!41676 () Bool)

(declare-fun e!277493 () Bool)

(assert (=> mapNonEmpty!21676 (= mapRes!21676 (and tp!41676 e!277493))))

(declare-datatypes ((V!18851 0))(
  ( (V!18852 (val!6699 Int)) )
))
(declare-datatypes ((ValueCell!6311 0))(
  ( (ValueCellFull!6311 (v!8991 V!18851)) (EmptyCell!6311) )
))
(declare-fun mapRest!21676 () (Array (_ BitVec 32) ValueCell!6311))

(declare-datatypes ((array!30358 0))(
  ( (array!30359 (arr!14598 (Array (_ BitVec 32) ValueCell!6311)) (size!14950 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30358)

(declare-fun mapValue!21676 () ValueCell!6311)

(declare-fun mapKey!21676 () (_ BitVec 32))

(assert (=> mapNonEmpty!21676 (= (arr!14598 _values!833) (store mapRest!21676 mapKey!21676 mapValue!21676))))

(declare-fun mapIsEmpty!21676 () Bool)

(assert (=> mapIsEmpty!21676 mapRes!21676))

(declare-fun b!473083 () Bool)

(declare-fun res!282609 () Bool)

(declare-fun e!277492 () Bool)

(assert (=> b!473083 (=> (not res!282609) (not e!277492))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30360 0))(
  ( (array!30361 (arr!14599 (Array (_ BitVec 32) (_ BitVec 64))) (size!14951 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30360)

(assert (=> b!473083 (= res!282609 (and (= (size!14950 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14951 _keys!1025) (size!14950 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473084 () Bool)

(declare-fun e!277491 () Bool)

(assert (=> b!473084 (= e!277491 true)))

(declare-datatypes ((tuple2!8752 0))(
  ( (tuple2!8753 (_1!4387 (_ BitVec 64)) (_2!4387 V!18851)) )
))
(declare-datatypes ((List!8815 0))(
  ( (Nil!8812) (Cons!8811 (h!9667 tuple2!8752) (t!14777 List!8815)) )
))
(declare-datatypes ((ListLongMap!7667 0))(
  ( (ListLongMap!7668 (toList!3849 List!8815)) )
))
(declare-fun lt!214864 () ListLongMap!7667)

(declare-fun lt!214857 () tuple2!8752)

(declare-fun minValueBefore!38 () V!18851)

(declare-fun +!1735 (ListLongMap!7667 tuple2!8752) ListLongMap!7667)

(assert (=> b!473084 (= (+!1735 lt!214864 lt!214857) (+!1735 (+!1735 lt!214864 (tuple2!8753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214857))))

(declare-fun minValueAfter!38 () V!18851)

(assert (=> b!473084 (= lt!214857 (tuple2!8753 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13902 0))(
  ( (Unit!13903) )
))
(declare-fun lt!214860 () Unit!13902)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!137 (ListLongMap!7667 (_ BitVec 64) V!18851 V!18851) Unit!13902)

(assert (=> b!473084 (= lt!214860 (addSameAsAddTwiceSameKeyDiffValues!137 lt!214864 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!214863 () ListLongMap!7667)

(declare-fun zeroValue!794 () V!18851)

(assert (=> b!473084 (= lt!214864 (+!1735 lt!214863 (tuple2!8753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!214861 () ListLongMap!7667)

(declare-fun getCurrentListMap!2215 (array!30360 array!30358 (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 (_ BitVec 32) Int) ListLongMap!7667)

(assert (=> b!473084 (= lt!214861 (getCurrentListMap!2215 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214862 () ListLongMap!7667)

(assert (=> b!473084 (= lt!214862 (getCurrentListMap!2215 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282606 () Bool)

(assert (=> start!42392 (=> (not res!282606) (not e!277492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42392 (= res!282606 (validMask!0 mask!1365))))

(assert (=> start!42392 e!277492))

(declare-fun tp_is_empty!13309 () Bool)

(assert (=> start!42392 tp_is_empty!13309))

(assert (=> start!42392 tp!41677))

(assert (=> start!42392 true))

(declare-fun array_inv!10612 (array!30360) Bool)

(assert (=> start!42392 (array_inv!10612 _keys!1025)))

(declare-fun e!277494 () Bool)

(declare-fun array_inv!10613 (array!30358) Bool)

(assert (=> start!42392 (and (array_inv!10613 _values!833) e!277494)))

(declare-fun b!473085 () Bool)

(declare-fun e!277495 () Bool)

(assert (=> b!473085 (= e!277495 tp_is_empty!13309)))

(declare-fun b!473086 () Bool)

(declare-fun res!282605 () Bool)

(assert (=> b!473086 (=> (not res!282605) (not e!277492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30360 (_ BitVec 32)) Bool)

(assert (=> b!473086 (= res!282605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473087 () Bool)

(declare-fun res!282607 () Bool)

(assert (=> b!473087 (=> (not res!282607) (not e!277492))))

(declare-datatypes ((List!8816 0))(
  ( (Nil!8813) (Cons!8812 (h!9668 (_ BitVec 64)) (t!14778 List!8816)) )
))
(declare-fun arrayNoDuplicates!0 (array!30360 (_ BitVec 32) List!8816) Bool)

(assert (=> b!473087 (= res!282607 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8813))))

(declare-fun b!473088 () Bool)

(assert (=> b!473088 (= e!277492 (not e!277491))))

(declare-fun res!282608 () Bool)

(assert (=> b!473088 (=> res!282608 e!277491)))

(assert (=> b!473088 (= res!282608 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214859 () ListLongMap!7667)

(assert (=> b!473088 (= lt!214863 lt!214859)))

(declare-fun lt!214858 () Unit!13902)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!218 (array!30360 array!30358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 V!18851 V!18851 (_ BitVec 32) Int) Unit!13902)

(assert (=> b!473088 (= lt!214858 (lemmaNoChangeToArrayThenSameMapNoExtras!218 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2058 (array!30360 array!30358 (_ BitVec 32) (_ BitVec 32) V!18851 V!18851 (_ BitVec 32) Int) ListLongMap!7667)

(assert (=> b!473088 (= lt!214859 (getCurrentListMapNoExtraKeys!2058 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473088 (= lt!214863 (getCurrentListMapNoExtraKeys!2058 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473089 () Bool)

(assert (=> b!473089 (= e!277493 tp_is_empty!13309)))

(declare-fun b!473090 () Bool)

(assert (=> b!473090 (= e!277494 (and e!277495 mapRes!21676))))

(declare-fun condMapEmpty!21676 () Bool)

(declare-fun mapDefault!21676 () ValueCell!6311)

(assert (=> b!473090 (= condMapEmpty!21676 (= (arr!14598 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6311)) mapDefault!21676)))))

(assert (= (and start!42392 res!282606) b!473083))

(assert (= (and b!473083 res!282609) b!473086))

(assert (= (and b!473086 res!282605) b!473087))

(assert (= (and b!473087 res!282607) b!473088))

(assert (= (and b!473088 (not res!282608)) b!473084))

(assert (= (and b!473090 condMapEmpty!21676) mapIsEmpty!21676))

(assert (= (and b!473090 (not condMapEmpty!21676)) mapNonEmpty!21676))

(get-info :version)

(assert (= (and mapNonEmpty!21676 ((_ is ValueCellFull!6311) mapValue!21676)) b!473089))

(assert (= (and b!473090 ((_ is ValueCellFull!6311) mapDefault!21676)) b!473085))

(assert (= start!42392 b!473090))

(declare-fun m!455279 () Bool)

(assert (=> start!42392 m!455279))

(declare-fun m!455281 () Bool)

(assert (=> start!42392 m!455281))

(declare-fun m!455283 () Bool)

(assert (=> start!42392 m!455283))

(declare-fun m!455285 () Bool)

(assert (=> mapNonEmpty!21676 m!455285))

(declare-fun m!455287 () Bool)

(assert (=> b!473084 m!455287))

(declare-fun m!455289 () Bool)

(assert (=> b!473084 m!455289))

(declare-fun m!455291 () Bool)

(assert (=> b!473084 m!455291))

(declare-fun m!455293 () Bool)

(assert (=> b!473084 m!455293))

(declare-fun m!455295 () Bool)

(assert (=> b!473084 m!455295))

(assert (=> b!473084 m!455291))

(declare-fun m!455297 () Bool)

(assert (=> b!473084 m!455297))

(declare-fun m!455299 () Bool)

(assert (=> b!473084 m!455299))

(declare-fun m!455301 () Bool)

(assert (=> b!473086 m!455301))

(declare-fun m!455303 () Bool)

(assert (=> b!473087 m!455303))

(declare-fun m!455305 () Bool)

(assert (=> b!473088 m!455305))

(declare-fun m!455307 () Bool)

(assert (=> b!473088 m!455307))

(declare-fun m!455309 () Bool)

(assert (=> b!473088 m!455309))

(check-sat (not b!473086) (not b!473084) (not b!473087) (not mapNonEmpty!21676) (not b_next!11881) b_and!20347 (not start!42392) tp_is_empty!13309 (not b!473088))
(check-sat b_and!20347 (not b_next!11881))
