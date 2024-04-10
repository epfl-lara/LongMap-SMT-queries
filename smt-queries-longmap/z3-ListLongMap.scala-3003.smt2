; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42338 () Bool)

(assert start!42338)

(declare-fun b_free!11829 () Bool)

(declare-fun b_next!11829 () Bool)

(assert (=> start!42338 (= b_free!11829 (not b_next!11829))))

(declare-fun tp!41517 () Bool)

(declare-fun b_and!20275 () Bool)

(assert (=> start!42338 (= tp!41517 b_and!20275)))

(declare-fun b!472372 () Bool)

(declare-fun e!276972 () Bool)

(declare-fun tp_is_empty!13257 () Bool)

(assert (=> b!472372 (= e!276972 tp_is_empty!13257)))

(declare-fun b!472373 () Bool)

(declare-fun res!282168 () Bool)

(declare-fun e!276973 () Bool)

(assert (=> b!472373 (=> (not res!282168) (not e!276973))))

(declare-datatypes ((array!30271 0))(
  ( (array!30272 (arr!14556 (Array (_ BitVec 32) (_ BitVec 64))) (size!14908 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30271)

(declare-datatypes ((List!8869 0))(
  ( (Nil!8866) (Cons!8865 (h!9721 (_ BitVec 64)) (t!14837 List!8869)) )
))
(declare-fun arrayNoDuplicates!0 (array!30271 (_ BitVec 32) List!8869) Bool)

(assert (=> b!472373 (= res!282168 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8866))))

(declare-fun b!472374 () Bool)

(declare-fun e!276968 () Bool)

(declare-fun e!276969 () Bool)

(declare-fun mapRes!21595 () Bool)

(assert (=> b!472374 (= e!276968 (and e!276969 mapRes!21595))))

(declare-fun condMapEmpty!21595 () Bool)

(declare-datatypes ((V!18781 0))(
  ( (V!18782 (val!6673 Int)) )
))
(declare-datatypes ((ValueCell!6285 0))(
  ( (ValueCellFull!6285 (v!8964 V!18781)) (EmptyCell!6285) )
))
(declare-datatypes ((array!30273 0))(
  ( (array!30274 (arr!14557 (Array (_ BitVec 32) ValueCell!6285)) (size!14909 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30273)

(declare-fun mapDefault!21595 () ValueCell!6285)

(assert (=> b!472374 (= condMapEmpty!21595 (= (arr!14557 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6285)) mapDefault!21595)))))

(declare-fun b!472375 () Bool)

(declare-fun res!282165 () Bool)

(assert (=> b!472375 (=> (not res!282165) (not e!276973))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30271 (_ BitVec 32)) Bool)

(assert (=> b!472375 (= res!282165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21595 () Bool)

(assert (=> mapIsEmpty!21595 mapRes!21595))

(declare-fun b!472376 () Bool)

(declare-fun e!276970 () Bool)

(assert (=> b!472376 (= e!276973 (not e!276970))))

(declare-fun res!282166 () Bool)

(assert (=> b!472376 (=> res!282166 e!276970)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472376 (= res!282166 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8788 0))(
  ( (tuple2!8789 (_1!4405 (_ BitVec 64)) (_2!4405 V!18781)) )
))
(declare-datatypes ((List!8870 0))(
  ( (Nil!8867) (Cons!8866 (h!9722 tuple2!8788) (t!14838 List!8870)) )
))
(declare-datatypes ((ListLongMap!7701 0))(
  ( (ListLongMap!7702 (toList!3866 List!8870)) )
))
(declare-fun lt!214311 () ListLongMap!7701)

(declare-fun lt!214313 () ListLongMap!7701)

(assert (=> b!472376 (= lt!214311 lt!214313)))

(declare-fun minValueBefore!38 () V!18781)

(declare-fun zeroValue!794 () V!18781)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13889 0))(
  ( (Unit!13890) )
))
(declare-fun lt!214312 () Unit!13889)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18781)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!208 (array!30271 array!30273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18781 V!18781 V!18781 V!18781 (_ BitVec 32) Int) Unit!13889)

(assert (=> b!472376 (= lt!214312 (lemmaNoChangeToArrayThenSameMapNoExtras!208 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2028 (array!30271 array!30273 (_ BitVec 32) (_ BitVec 32) V!18781 V!18781 (_ BitVec 32) Int) ListLongMap!7701)

(assert (=> b!472376 (= lt!214313 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472376 (= lt!214311 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282167 () Bool)

(assert (=> start!42338 (=> (not res!282167) (not e!276973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42338 (= res!282167 (validMask!0 mask!1365))))

(assert (=> start!42338 e!276973))

(assert (=> start!42338 tp_is_empty!13257))

(assert (=> start!42338 tp!41517))

(assert (=> start!42338 true))

(declare-fun array_inv!10496 (array!30271) Bool)

(assert (=> start!42338 (array_inv!10496 _keys!1025)))

(declare-fun array_inv!10497 (array!30273) Bool)

(assert (=> start!42338 (and (array_inv!10497 _values!833) e!276968)))

(declare-fun b!472377 () Bool)

(declare-fun res!282164 () Bool)

(assert (=> b!472377 (=> (not res!282164) (not e!276973))))

(assert (=> b!472377 (= res!282164 (and (= (size!14909 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14908 _keys!1025) (size!14909 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472378 () Bool)

(assert (=> b!472378 (= e!276969 tp_is_empty!13257)))

(declare-fun mapNonEmpty!21595 () Bool)

(declare-fun tp!41518 () Bool)

(assert (=> mapNonEmpty!21595 (= mapRes!21595 (and tp!41518 e!276972))))

(declare-fun mapKey!21595 () (_ BitVec 32))

(declare-fun mapRest!21595 () (Array (_ BitVec 32) ValueCell!6285))

(declare-fun mapValue!21595 () ValueCell!6285)

(assert (=> mapNonEmpty!21595 (= (arr!14557 _values!833) (store mapRest!21595 mapKey!21595 mapValue!21595))))

(declare-fun b!472379 () Bool)

(assert (=> b!472379 (= e!276970 true)))

(declare-fun lt!214314 () ListLongMap!7701)

(declare-fun getCurrentListMap!2236 (array!30271 array!30273 (_ BitVec 32) (_ BitVec 32) V!18781 V!18781 (_ BitVec 32) Int) ListLongMap!7701)

(assert (=> b!472379 (= lt!214314 (getCurrentListMap!2236 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42338 res!282167) b!472377))

(assert (= (and b!472377 res!282164) b!472375))

(assert (= (and b!472375 res!282165) b!472373))

(assert (= (and b!472373 res!282168) b!472376))

(assert (= (and b!472376 (not res!282166)) b!472379))

(assert (= (and b!472374 condMapEmpty!21595) mapIsEmpty!21595))

(assert (= (and b!472374 (not condMapEmpty!21595)) mapNonEmpty!21595))

(get-info :version)

(assert (= (and mapNonEmpty!21595 ((_ is ValueCellFull!6285) mapValue!21595)) b!472372))

(assert (= (and b!472374 ((_ is ValueCellFull!6285) mapDefault!21595)) b!472378))

(assert (= start!42338 b!472374))

(declare-fun m!454357 () Bool)

(assert (=> b!472376 m!454357))

(declare-fun m!454359 () Bool)

(assert (=> b!472376 m!454359))

(declare-fun m!454361 () Bool)

(assert (=> b!472376 m!454361))

(declare-fun m!454363 () Bool)

(assert (=> mapNonEmpty!21595 m!454363))

(declare-fun m!454365 () Bool)

(assert (=> b!472379 m!454365))

(declare-fun m!454367 () Bool)

(assert (=> b!472373 m!454367))

(declare-fun m!454369 () Bool)

(assert (=> start!42338 m!454369))

(declare-fun m!454371 () Bool)

(assert (=> start!42338 m!454371))

(declare-fun m!454373 () Bool)

(assert (=> start!42338 m!454373))

(declare-fun m!454375 () Bool)

(assert (=> b!472375 m!454375))

(check-sat tp_is_empty!13257 (not b!472376) (not start!42338) b_and!20275 (not b!472375) (not b!472373) (not b!472379) (not mapNonEmpty!21595) (not b_next!11829))
(check-sat b_and!20275 (not b_next!11829))
