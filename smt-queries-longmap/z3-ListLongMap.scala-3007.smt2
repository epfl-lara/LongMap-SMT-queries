; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42346 () Bool)

(assert start!42346)

(declare-fun b_free!11851 () Bool)

(declare-fun b_next!11851 () Bool)

(assert (=> start!42346 (= b_free!11851 (not b_next!11851))))

(declare-fun tp!41584 () Bool)

(declare-fun b_and!20271 () Bool)

(assert (=> start!42346 (= tp!41584 b_and!20271)))

(declare-fun b!472365 () Bool)

(declare-fun e!276992 () Bool)

(declare-fun e!276993 () Bool)

(declare-fun mapRes!21628 () Bool)

(assert (=> b!472365 (= e!276992 (and e!276993 mapRes!21628))))

(declare-fun condMapEmpty!21628 () Bool)

(declare-datatypes ((V!18811 0))(
  ( (V!18812 (val!6684 Int)) )
))
(declare-datatypes ((ValueCell!6296 0))(
  ( (ValueCellFull!6296 (v!8969 V!18811)) (EmptyCell!6296) )
))
(declare-datatypes ((array!30299 0))(
  ( (array!30300 (arr!14570 (Array (_ BitVec 32) ValueCell!6296)) (size!14923 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30299)

(declare-fun mapDefault!21628 () ValueCell!6296)

(assert (=> b!472365 (= condMapEmpty!21628 (= (arr!14570 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6296)) mapDefault!21628)))))

(declare-fun mapNonEmpty!21628 () Bool)

(declare-fun tp!41583 () Bool)

(declare-fun e!276995 () Bool)

(assert (=> mapNonEmpty!21628 (= mapRes!21628 (and tp!41583 e!276995))))

(declare-fun mapRest!21628 () (Array (_ BitVec 32) ValueCell!6296))

(declare-fun mapValue!21628 () ValueCell!6296)

(declare-fun mapKey!21628 () (_ BitVec 32))

(assert (=> mapNonEmpty!21628 (= (arr!14570 _values!833) (store mapRest!21628 mapKey!21628 mapValue!21628))))

(declare-fun mapIsEmpty!21628 () Bool)

(assert (=> mapIsEmpty!21628 mapRes!21628))

(declare-fun b!472366 () Bool)

(declare-fun res!282204 () Bool)

(declare-fun e!276996 () Bool)

(assert (=> b!472366 (=> (not res!282204) (not e!276996))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30301 0))(
  ( (array!30302 (arr!14571 (Array (_ BitVec 32) (_ BitVec 64))) (size!14924 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30301)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472366 (= res!282204 (and (= (size!14923 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14924 _keys!1025) (size!14923 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472367 () Bool)

(declare-fun tp_is_empty!13279 () Bool)

(assert (=> b!472367 (= e!276995 tp_is_empty!13279)))

(declare-fun res!282201 () Bool)

(assert (=> start!42346 (=> (not res!282201) (not e!276996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42346 (= res!282201 (validMask!0 mask!1365))))

(assert (=> start!42346 e!276996))

(assert (=> start!42346 tp_is_empty!13279))

(assert (=> start!42346 tp!41584))

(assert (=> start!42346 true))

(declare-fun array_inv!10596 (array!30301) Bool)

(assert (=> start!42346 (array_inv!10596 _keys!1025)))

(declare-fun array_inv!10597 (array!30299) Bool)

(assert (=> start!42346 (and (array_inv!10597 _values!833) e!276992)))

(declare-fun b!472368 () Bool)

(declare-fun e!276997 () Bool)

(assert (=> b!472368 (= e!276997 true)))

(declare-fun minValueBefore!38 () V!18811)

(declare-fun zeroValue!794 () V!18811)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8848 0))(
  ( (tuple2!8849 (_1!4435 (_ BitVec 64)) (_2!4435 V!18811)) )
))
(declare-datatypes ((List!8917 0))(
  ( (Nil!8914) (Cons!8913 (h!9769 tuple2!8848) (t!14876 List!8917)) )
))
(declare-datatypes ((ListLongMap!7751 0))(
  ( (ListLongMap!7752 (toList!3891 List!8917)) )
))
(declare-fun lt!214211 () ListLongMap!7751)

(declare-fun getCurrentListMap!2195 (array!30301 array!30299 (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 (_ BitVec 32) Int) ListLongMap!7751)

(assert (=> b!472368 (= lt!214211 (getCurrentListMap!2195 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472369 () Bool)

(declare-fun res!282202 () Bool)

(assert (=> b!472369 (=> (not res!282202) (not e!276996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30301 (_ BitVec 32)) Bool)

(assert (=> b!472369 (= res!282202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472370 () Bool)

(assert (=> b!472370 (= e!276993 tp_is_empty!13279)))

(declare-fun b!472371 () Bool)

(assert (=> b!472371 (= e!276996 (not e!276997))))

(declare-fun res!282200 () Bool)

(assert (=> b!472371 (=> res!282200 e!276997)))

(assert (=> b!472371 (= res!282200 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214209 () ListLongMap!7751)

(declare-fun lt!214210 () ListLongMap!7751)

(assert (=> b!472371 (= lt!214209 lt!214210)))

(declare-fun minValueAfter!38 () V!18811)

(declare-datatypes ((Unit!13875 0))(
  ( (Unit!13876) )
))
(declare-fun lt!214212 () Unit!13875)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!219 (array!30301 array!30299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 V!18811 V!18811 (_ BitVec 32) Int) Unit!13875)

(assert (=> b!472371 (= lt!214212 (lemmaNoChangeToArrayThenSameMapNoExtras!219 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2062 (array!30301 array!30299 (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 (_ BitVec 32) Int) ListLongMap!7751)

(assert (=> b!472371 (= lt!214210 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472371 (= lt!214209 (getCurrentListMapNoExtraKeys!2062 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472372 () Bool)

(declare-fun res!282203 () Bool)

(assert (=> b!472372 (=> (not res!282203) (not e!276996))))

(declare-datatypes ((List!8918 0))(
  ( (Nil!8915) (Cons!8914 (h!9770 (_ BitVec 64)) (t!14877 List!8918)) )
))
(declare-fun arrayNoDuplicates!0 (array!30301 (_ BitVec 32) List!8918) Bool)

(assert (=> b!472372 (= res!282203 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8915))))

(assert (= (and start!42346 res!282201) b!472366))

(assert (= (and b!472366 res!282204) b!472369))

(assert (= (and b!472369 res!282202) b!472372))

(assert (= (and b!472372 res!282203) b!472371))

(assert (= (and b!472371 (not res!282200)) b!472368))

(assert (= (and b!472365 condMapEmpty!21628) mapIsEmpty!21628))

(assert (= (and b!472365 (not condMapEmpty!21628)) mapNonEmpty!21628))

(get-info :version)

(assert (= (and mapNonEmpty!21628 ((_ is ValueCellFull!6296) mapValue!21628)) b!472367))

(assert (= (and b!472365 ((_ is ValueCellFull!6296) mapDefault!21628)) b!472370))

(assert (= start!42346 b!472365))

(declare-fun m!453843 () Bool)

(assert (=> b!472371 m!453843))

(declare-fun m!453845 () Bool)

(assert (=> b!472371 m!453845))

(declare-fun m!453847 () Bool)

(assert (=> b!472371 m!453847))

(declare-fun m!453849 () Bool)

(assert (=> b!472368 m!453849))

(declare-fun m!453851 () Bool)

(assert (=> mapNonEmpty!21628 m!453851))

(declare-fun m!453853 () Bool)

(assert (=> b!472372 m!453853))

(declare-fun m!453855 () Bool)

(assert (=> start!42346 m!453855))

(declare-fun m!453857 () Bool)

(assert (=> start!42346 m!453857))

(declare-fun m!453859 () Bool)

(assert (=> start!42346 m!453859))

(declare-fun m!453861 () Bool)

(assert (=> b!472369 m!453861))

(check-sat (not b_next!11851) (not b!472371) (not mapNonEmpty!21628) (not b!472368) (not b!472369) (not b!472372) (not start!42346) tp_is_empty!13279 b_and!20271)
(check-sat b_and!20271 (not b_next!11851))
