; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42342 () Bool)

(assert start!42342)

(declare-fun b_free!11833 () Bool)

(declare-fun b_next!11833 () Bool)

(assert (=> start!42342 (= b_free!11833 (not b_next!11833))))

(declare-fun tp!41529 () Bool)

(declare-fun b_and!20279 () Bool)

(assert (=> start!42342 (= tp!41529 b_and!20279)))

(declare-fun b!472420 () Bool)

(declare-fun res!282195 () Bool)

(declare-fun e!277007 () Bool)

(assert (=> b!472420 (=> (not res!282195) (not e!277007))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30279 0))(
  ( (array!30280 (arr!14560 (Array (_ BitVec 32) (_ BitVec 64))) (size!14912 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30279)

(declare-datatypes ((V!18787 0))(
  ( (V!18788 (val!6675 Int)) )
))
(declare-datatypes ((ValueCell!6287 0))(
  ( (ValueCellFull!6287 (v!8966 V!18787)) (EmptyCell!6287) )
))
(declare-datatypes ((array!30281 0))(
  ( (array!30282 (arr!14561 (Array (_ BitVec 32) ValueCell!6287)) (size!14913 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30281)

(assert (=> b!472420 (= res!282195 (and (= (size!14913 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14912 _keys!1025) (size!14913 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472421 () Bool)

(declare-fun e!277006 () Bool)

(assert (=> b!472421 (= e!277007 (not e!277006))))

(declare-fun res!282198 () Bool)

(assert (=> b!472421 (=> res!282198 e!277006)))

(assert (=> b!472421 (= res!282198 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8792 0))(
  ( (tuple2!8793 (_1!4407 (_ BitVec 64)) (_2!4407 V!18787)) )
))
(declare-datatypes ((List!8873 0))(
  ( (Nil!8870) (Cons!8869 (h!9725 tuple2!8792) (t!14841 List!8873)) )
))
(declare-datatypes ((ListLongMap!7705 0))(
  ( (ListLongMap!7706 (toList!3868 List!8873)) )
))
(declare-fun lt!214338 () ListLongMap!7705)

(declare-fun lt!214335 () ListLongMap!7705)

(assert (=> b!472421 (= lt!214338 lt!214335)))

(declare-datatypes ((Unit!13893 0))(
  ( (Unit!13894) )
))
(declare-fun lt!214336 () Unit!13893)

(declare-fun minValueBefore!38 () V!18787)

(declare-fun zeroValue!794 () V!18787)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!210 (array!30279 array!30281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 V!18787 V!18787 (_ BitVec 32) Int) Unit!13893)

(assert (=> b!472421 (= lt!214336 (lemmaNoChangeToArrayThenSameMapNoExtras!210 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2030 (array!30279 array!30281 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7705)

(assert (=> b!472421 (= lt!214335 (getCurrentListMapNoExtraKeys!2030 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472421 (= lt!214338 (getCurrentListMapNoExtraKeys!2030 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21601 () Bool)

(declare-fun mapRes!21601 () Bool)

(assert (=> mapIsEmpty!21601 mapRes!21601))

(declare-fun b!472423 () Bool)

(declare-fun res!282197 () Bool)

(assert (=> b!472423 (=> (not res!282197) (not e!277007))))

(declare-datatypes ((List!8874 0))(
  ( (Nil!8871) (Cons!8870 (h!9726 (_ BitVec 64)) (t!14842 List!8874)) )
))
(declare-fun arrayNoDuplicates!0 (array!30279 (_ BitVec 32) List!8874) Bool)

(assert (=> b!472423 (= res!282197 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8871))))

(declare-fun b!472424 () Bool)

(declare-fun res!282196 () Bool)

(assert (=> b!472424 (=> (not res!282196) (not e!277007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30279 (_ BitVec 32)) Bool)

(assert (=> b!472424 (= res!282196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472425 () Bool)

(declare-fun e!277009 () Bool)

(declare-fun tp_is_empty!13261 () Bool)

(assert (=> b!472425 (= e!277009 tp_is_empty!13261)))

(declare-fun b!472426 () Bool)

(declare-fun e!277004 () Bool)

(assert (=> b!472426 (= e!277004 tp_is_empty!13261)))

(declare-fun res!282194 () Bool)

(assert (=> start!42342 (=> (not res!282194) (not e!277007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42342 (= res!282194 (validMask!0 mask!1365))))

(assert (=> start!42342 e!277007))

(assert (=> start!42342 tp_is_empty!13261))

(assert (=> start!42342 tp!41529))

(assert (=> start!42342 true))

(declare-fun array_inv!10498 (array!30279) Bool)

(assert (=> start!42342 (array_inv!10498 _keys!1025)))

(declare-fun e!277005 () Bool)

(declare-fun array_inv!10499 (array!30281) Bool)

(assert (=> start!42342 (and (array_inv!10499 _values!833) e!277005)))

(declare-fun b!472422 () Bool)

(assert (=> b!472422 (= e!277006 true)))

(declare-fun lt!214337 () ListLongMap!7705)

(declare-fun getCurrentListMap!2238 (array!30279 array!30281 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7705)

(assert (=> b!472422 (= lt!214337 (getCurrentListMap!2238 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21601 () Bool)

(declare-fun tp!41530 () Bool)

(assert (=> mapNonEmpty!21601 (= mapRes!21601 (and tp!41530 e!277004))))

(declare-fun mapRest!21601 () (Array (_ BitVec 32) ValueCell!6287))

(declare-fun mapValue!21601 () ValueCell!6287)

(declare-fun mapKey!21601 () (_ BitVec 32))

(assert (=> mapNonEmpty!21601 (= (arr!14561 _values!833) (store mapRest!21601 mapKey!21601 mapValue!21601))))

(declare-fun b!472427 () Bool)

(assert (=> b!472427 (= e!277005 (and e!277009 mapRes!21601))))

(declare-fun condMapEmpty!21601 () Bool)

(declare-fun mapDefault!21601 () ValueCell!6287)

