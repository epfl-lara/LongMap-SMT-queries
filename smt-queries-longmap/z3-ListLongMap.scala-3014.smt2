; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42420 () Bool)

(assert start!42420)

(declare-fun b_free!11895 () Bool)

(declare-fun b_next!11895 () Bool)

(assert (=> start!42420 (= b_free!11895 (not b_next!11895))))

(declare-fun tp!41719 () Bool)

(declare-fun b_and!20351 () Bool)

(assert (=> start!42420 (= tp!41719 b_and!20351)))

(declare-fun b!473312 () Bool)

(declare-fun e!277659 () Bool)

(declare-fun e!277660 () Bool)

(assert (=> b!473312 (= e!277659 (not e!277660))))

(declare-fun res!282717 () Bool)

(assert (=> b!473312 (=> res!282717 e!277660)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473312 (= res!282717 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18869 0))(
  ( (V!18870 (val!6706 Int)) )
))
(declare-datatypes ((tuple2!8834 0))(
  ( (tuple2!8835 (_1!4428 (_ BitVec 64)) (_2!4428 V!18869)) )
))
(declare-datatypes ((List!8916 0))(
  ( (Nil!8913) (Cons!8912 (h!9768 tuple2!8834) (t!14886 List!8916)) )
))
(declare-datatypes ((ListLongMap!7747 0))(
  ( (ListLongMap!7748 (toList!3889 List!8916)) )
))
(declare-fun lt!215016 () ListLongMap!7747)

(declare-fun lt!215018 () ListLongMap!7747)

(assert (=> b!473312 (= lt!215016 lt!215018)))

(declare-fun minValueBefore!38 () V!18869)

(declare-fun zeroValue!794 () V!18869)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30403 0))(
  ( (array!30404 (arr!14621 (Array (_ BitVec 32) (_ BitVec 64))) (size!14973 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30403)

(declare-datatypes ((ValueCell!6318 0))(
  ( (ValueCellFull!6318 (v!8997 V!18869)) (EmptyCell!6318) )
))
(declare-datatypes ((array!30405 0))(
  ( (array!30406 (arr!14622 (Array (_ BitVec 32) ValueCell!6318)) (size!14974 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30405)

(declare-fun minValueAfter!38 () V!18869)

(declare-datatypes ((Unit!13934 0))(
  ( (Unit!13935) )
))
(declare-fun lt!215020 () Unit!13934)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!229 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18869 V!18869 V!18869 V!18869 (_ BitVec 32) Int) Unit!13934)

(assert (=> b!473312 (= lt!215020 (lemmaNoChangeToArrayThenSameMapNoExtras!229 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2049 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) V!18869 V!18869 (_ BitVec 32) Int) ListLongMap!7747)

(assert (=> b!473312 (= lt!215018 (getCurrentListMapNoExtraKeys!2049 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473312 (= lt!215016 (getCurrentListMapNoExtraKeys!2049 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473313 () Bool)

(declare-fun e!277658 () Bool)

(declare-fun tp_is_empty!13323 () Bool)

(assert (=> b!473313 (= e!277658 tp_is_empty!13323)))

(declare-fun mapIsEmpty!21697 () Bool)

(declare-fun mapRes!21697 () Bool)

(assert (=> mapIsEmpty!21697 mapRes!21697))

(declare-fun b!473315 () Bool)

(declare-fun res!282719 () Bool)

(assert (=> b!473315 (=> (not res!282719) (not e!277659))))

(assert (=> b!473315 (= res!282719 (and (= (size!14974 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14973 _keys!1025) (size!14974 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473316 () Bool)

(declare-fun res!282720 () Bool)

(assert (=> b!473316 (=> (not res!282720) (not e!277659))))

(declare-datatypes ((List!8917 0))(
  ( (Nil!8914) (Cons!8913 (h!9769 (_ BitVec 64)) (t!14887 List!8917)) )
))
(declare-fun arrayNoDuplicates!0 (array!30403 (_ BitVec 32) List!8917) Bool)

(assert (=> b!473316 (= res!282720 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8914))))

(declare-fun mapNonEmpty!21697 () Bool)

(declare-fun tp!41718 () Bool)

(assert (=> mapNonEmpty!21697 (= mapRes!21697 (and tp!41718 e!277658))))

(declare-fun mapValue!21697 () ValueCell!6318)

(declare-fun mapKey!21697 () (_ BitVec 32))

(declare-fun mapRest!21697 () (Array (_ BitVec 32) ValueCell!6318))

(assert (=> mapNonEmpty!21697 (= (arr!14622 _values!833) (store mapRest!21697 mapKey!21697 mapValue!21697))))

(declare-fun b!473317 () Bool)

(declare-fun res!282721 () Bool)

(assert (=> b!473317 (=> (not res!282721) (not e!277659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30403 (_ BitVec 32)) Bool)

(assert (=> b!473317 (= res!282721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!282718 () Bool)

(assert (=> start!42420 (=> (not res!282718) (not e!277659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42420 (= res!282718 (validMask!0 mask!1365))))

(assert (=> start!42420 e!277659))

(assert (=> start!42420 tp_is_empty!13323))

(assert (=> start!42420 tp!41719))

(assert (=> start!42420 true))

(declare-fun array_inv!10548 (array!30403) Bool)

(assert (=> start!42420 (array_inv!10548 _keys!1025)))

(declare-fun e!277657 () Bool)

(declare-fun array_inv!10549 (array!30405) Bool)

(assert (=> start!42420 (and (array_inv!10549 _values!833) e!277657)))

(declare-fun b!473314 () Bool)

(declare-fun e!277661 () Bool)

(assert (=> b!473314 (= e!277657 (and e!277661 mapRes!21697))))

(declare-fun condMapEmpty!21697 () Bool)

(declare-fun mapDefault!21697 () ValueCell!6318)

(assert (=> b!473314 (= condMapEmpty!21697 (= (arr!14622 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6318)) mapDefault!21697)))))

(declare-fun b!473318 () Bool)

(assert (=> b!473318 (= e!277661 tp_is_empty!13323)))

(declare-fun b!473319 () Bool)

(assert (=> b!473319 (= e!277660 true)))

(declare-fun lt!215019 () ListLongMap!7747)

(declare-fun lt!215017 () tuple2!8834)

(declare-fun +!1728 (ListLongMap!7747 tuple2!8834) ListLongMap!7747)

(assert (=> b!473319 (= (+!1728 lt!215019 lt!215017) (+!1728 (+!1728 lt!215019 (tuple2!8835 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215017))))

(assert (=> b!473319 (= lt!215017 (tuple2!8835 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215015 () Unit!13934)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!137 (ListLongMap!7747 (_ BitVec 64) V!18869 V!18869) Unit!13934)

(assert (=> b!473319 (= lt!215015 (addSameAsAddTwiceSameKeyDiffValues!137 lt!215019 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473319 (= lt!215019 (+!1728 lt!215016 (tuple2!8835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215014 () ListLongMap!7747)

(declare-fun getCurrentListMap!2257 (array!30403 array!30405 (_ BitVec 32) (_ BitVec 32) V!18869 V!18869 (_ BitVec 32) Int) ListLongMap!7747)

(assert (=> b!473319 (= lt!215014 (getCurrentListMap!2257 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215013 () ListLongMap!7747)

(assert (=> b!473319 (= lt!215013 (getCurrentListMap!2257 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42420 res!282718) b!473315))

(assert (= (and b!473315 res!282719) b!473317))

(assert (= (and b!473317 res!282721) b!473316))

(assert (= (and b!473316 res!282720) b!473312))

(assert (= (and b!473312 (not res!282717)) b!473319))

(assert (= (and b!473314 condMapEmpty!21697) mapIsEmpty!21697))

(assert (= (and b!473314 (not condMapEmpty!21697)) mapNonEmpty!21697))

(get-info :version)

(assert (= (and mapNonEmpty!21697 ((_ is ValueCellFull!6318) mapValue!21697)) b!473313))

(assert (= (and b!473314 ((_ is ValueCellFull!6318) mapDefault!21697)) b!473318))

(assert (= start!42420 b!473314))

(declare-fun m!455321 () Bool)

(assert (=> mapNonEmpty!21697 m!455321))

(declare-fun m!455323 () Bool)

(assert (=> b!473317 m!455323))

(declare-fun m!455325 () Bool)

(assert (=> start!42420 m!455325))

(declare-fun m!455327 () Bool)

(assert (=> start!42420 m!455327))

(declare-fun m!455329 () Bool)

(assert (=> start!42420 m!455329))

(declare-fun m!455331 () Bool)

(assert (=> b!473316 m!455331))

(declare-fun m!455333 () Bool)

(assert (=> b!473312 m!455333))

(declare-fun m!455335 () Bool)

(assert (=> b!473312 m!455335))

(declare-fun m!455337 () Bool)

(assert (=> b!473312 m!455337))

(declare-fun m!455339 () Bool)

(assert (=> b!473319 m!455339))

(declare-fun m!455341 () Bool)

(assert (=> b!473319 m!455341))

(assert (=> b!473319 m!455341))

(declare-fun m!455343 () Bool)

(assert (=> b!473319 m!455343))

(declare-fun m!455345 () Bool)

(assert (=> b!473319 m!455345))

(declare-fun m!455347 () Bool)

(assert (=> b!473319 m!455347))

(declare-fun m!455349 () Bool)

(assert (=> b!473319 m!455349))

(declare-fun m!455351 () Bool)

(assert (=> b!473319 m!455351))

(check-sat (not mapNonEmpty!21697) b_and!20351 (not b!473316) (not b_next!11895) tp_is_empty!13323 (not start!42420) (not b!473317) (not b!473312) (not b!473319))
(check-sat b_and!20351 (not b_next!11895))
