; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41844 () Bool)

(assert start!41844)

(declare-fun b_free!11461 () Bool)

(declare-fun b_next!11461 () Bool)

(assert (=> start!41844 (= b_free!11461 (not b_next!11461))))

(declare-fun tp!40392 () Bool)

(declare-fun b_and!19851 () Bool)

(assert (=> start!41844 (= tp!40392 b_and!19851)))

(declare-fun b!467326 () Bool)

(declare-fun e!273356 () Bool)

(assert (=> b!467326 (= e!273356 (not true))))

(declare-datatypes ((V!18291 0))(
  ( (V!18292 (val!6489 Int)) )
))
(declare-datatypes ((tuple2!8452 0))(
  ( (tuple2!8453 (_1!4237 (_ BitVec 64)) (_2!4237 V!18291)) )
))
(declare-datatypes ((List!8531 0))(
  ( (Nil!8528) (Cons!8527 (h!9383 tuple2!8452) (t!14477 List!8531)) )
))
(declare-datatypes ((ListLongMap!7367 0))(
  ( (ListLongMap!7368 (toList!3699 List!8531)) )
))
(declare-fun lt!211339 () ListLongMap!7367)

(declare-fun lt!211340 () ListLongMap!7367)

(assert (=> b!467326 (= lt!211339 lt!211340)))

(declare-fun minValueBefore!38 () V!18291)

(declare-fun zeroValue!794 () V!18291)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13610 0))(
  ( (Unit!13611) )
))
(declare-fun lt!211338 () Unit!13610)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29548 0))(
  ( (array!29549 (arr!14201 (Array (_ BitVec 32) (_ BitVec 64))) (size!14553 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29548)

(declare-datatypes ((ValueCell!6101 0))(
  ( (ValueCellFull!6101 (v!8779 V!18291)) (EmptyCell!6101) )
))
(declare-datatypes ((array!29550 0))(
  ( (array!29551 (arr!14202 (Array (_ BitVec 32) ValueCell!6101)) (size!14554 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29550)

(declare-fun minValueAfter!38 () V!18291)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!81 (array!29548 array!29550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18291 V!18291 V!18291 V!18291 (_ BitVec 32) Int) Unit!13610)

(assert (=> b!467326 (= lt!211338 (lemmaNoChangeToArrayThenSameMapNoExtras!81 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1921 (array!29548 array!29550 (_ BitVec 32) (_ BitVec 32) V!18291 V!18291 (_ BitVec 32) Int) ListLongMap!7367)

(assert (=> b!467326 (= lt!211340 (getCurrentListMapNoExtraKeys!1921 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467326 (= lt!211339 (getCurrentListMapNoExtraKeys!1921 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21022 () Bool)

(declare-fun mapRes!21022 () Bool)

(assert (=> mapIsEmpty!21022 mapRes!21022))

(declare-fun b!467327 () Bool)

(declare-fun e!273358 () Bool)

(declare-fun tp_is_empty!12889 () Bool)

(assert (=> b!467327 (= e!273358 tp_is_empty!12889)))

(declare-fun b!467328 () Bool)

(declare-fun res!279341 () Bool)

(assert (=> b!467328 (=> (not res!279341) (not e!273356))))

(assert (=> b!467328 (= res!279341 (and (= (size!14554 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14553 _keys!1025) (size!14554 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467329 () Bool)

(declare-fun res!279340 () Bool)

(assert (=> b!467329 (=> (not res!279340) (not e!273356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29548 (_ BitVec 32)) Bool)

(assert (=> b!467329 (= res!279340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467330 () Bool)

(declare-fun res!279338 () Bool)

(assert (=> b!467330 (=> (not res!279338) (not e!273356))))

(declare-datatypes ((List!8532 0))(
  ( (Nil!8529) (Cons!8528 (h!9384 (_ BitVec 64)) (t!14478 List!8532)) )
))
(declare-fun arrayNoDuplicates!0 (array!29548 (_ BitVec 32) List!8532) Bool)

(assert (=> b!467330 (= res!279338 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8529))))

(declare-fun res!279339 () Bool)

(assert (=> start!41844 (=> (not res!279339) (not e!273356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41844 (= res!279339 (validMask!0 mask!1365))))

(assert (=> start!41844 e!273356))

(assert (=> start!41844 tp_is_empty!12889))

(assert (=> start!41844 tp!40392))

(assert (=> start!41844 true))

(declare-fun array_inv!10342 (array!29548) Bool)

(assert (=> start!41844 (array_inv!10342 _keys!1025)))

(declare-fun e!273360 () Bool)

(declare-fun array_inv!10343 (array!29550) Bool)

(assert (=> start!41844 (and (array_inv!10343 _values!833) e!273360)))

(declare-fun mapNonEmpty!21022 () Bool)

(declare-fun tp!40393 () Bool)

(assert (=> mapNonEmpty!21022 (= mapRes!21022 (and tp!40393 e!273358))))

(declare-fun mapRest!21022 () (Array (_ BitVec 32) ValueCell!6101))

(declare-fun mapKey!21022 () (_ BitVec 32))

(declare-fun mapValue!21022 () ValueCell!6101)

(assert (=> mapNonEmpty!21022 (= (arr!14202 _values!833) (store mapRest!21022 mapKey!21022 mapValue!21022))))

(declare-fun b!467331 () Bool)

(declare-fun e!273359 () Bool)

(assert (=> b!467331 (= e!273359 tp_is_empty!12889)))

(declare-fun b!467332 () Bool)

(assert (=> b!467332 (= e!273360 (and e!273359 mapRes!21022))))

(declare-fun condMapEmpty!21022 () Bool)

(declare-fun mapDefault!21022 () ValueCell!6101)

(assert (=> b!467332 (= condMapEmpty!21022 (= (arr!14202 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6101)) mapDefault!21022)))))

(assert (= (and start!41844 res!279339) b!467328))

(assert (= (and b!467328 res!279341) b!467329))

(assert (= (and b!467329 res!279340) b!467330))

(assert (= (and b!467330 res!279338) b!467326))

(assert (= (and b!467332 condMapEmpty!21022) mapIsEmpty!21022))

(assert (= (and b!467332 (not condMapEmpty!21022)) mapNonEmpty!21022))

(get-info :version)

(assert (= (and mapNonEmpty!21022 ((_ is ValueCellFull!6101) mapValue!21022)) b!467327))

(assert (= (and b!467332 ((_ is ValueCellFull!6101) mapDefault!21022)) b!467331))

(assert (= start!41844 b!467332))

(declare-fun m!449729 () Bool)

(assert (=> b!467330 m!449729))

(declare-fun m!449731 () Bool)

(assert (=> b!467329 m!449731))

(declare-fun m!449733 () Bool)

(assert (=> b!467326 m!449733))

(declare-fun m!449735 () Bool)

(assert (=> b!467326 m!449735))

(declare-fun m!449737 () Bool)

(assert (=> b!467326 m!449737))

(declare-fun m!449739 () Bool)

(assert (=> mapNonEmpty!21022 m!449739))

(declare-fun m!449741 () Bool)

(assert (=> start!41844 m!449741))

(declare-fun m!449743 () Bool)

(assert (=> start!41844 m!449743))

(declare-fun m!449745 () Bool)

(assert (=> start!41844 m!449745))

(check-sat tp_is_empty!12889 b_and!19851 (not mapNonEmpty!21022) (not b_next!11461) (not b!467329) (not b!467330) (not b!467326) (not start!41844))
(check-sat b_and!19851 (not b_next!11461))
