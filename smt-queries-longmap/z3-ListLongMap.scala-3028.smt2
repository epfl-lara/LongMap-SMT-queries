; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42528 () Bool)

(assert start!42528)

(declare-fun b_free!11977 () Bool)

(declare-fun b_next!11977 () Bool)

(assert (=> start!42528 (= b_free!11977 (not b_next!11977))))

(declare-fun tp!41970 () Bool)

(declare-fun b_and!20431 () Bool)

(assert (=> start!42528 (= tp!41970 b_and!20431)))

(declare-fun b!474376 () Bool)

(declare-fun e!278437 () Bool)

(declare-fun tp_is_empty!13405 () Bool)

(assert (=> b!474376 (= e!278437 tp_is_empty!13405)))

(declare-fun b!474377 () Bool)

(declare-fun e!278436 () Bool)

(declare-fun e!278438 () Bool)

(declare-fun mapRes!21826 () Bool)

(assert (=> b!474377 (= e!278436 (and e!278438 mapRes!21826))))

(declare-fun condMapEmpty!21826 () Bool)

(declare-datatypes ((V!18979 0))(
  ( (V!18980 (val!6747 Int)) )
))
(declare-datatypes ((ValueCell!6359 0))(
  ( (ValueCellFull!6359 (v!9034 V!18979)) (EmptyCell!6359) )
))
(declare-datatypes ((array!30545 0))(
  ( (array!30546 (arr!14690 (Array (_ BitVec 32) ValueCell!6359)) (size!15043 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30545)

(declare-fun mapDefault!21826 () ValueCell!6359)

(assert (=> b!474377 (= condMapEmpty!21826 (= (arr!14690 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6359)) mapDefault!21826)))))

(declare-fun mapIsEmpty!21826 () Bool)

(assert (=> mapIsEmpty!21826 mapRes!21826))

(declare-fun b!474378 () Bool)

(assert (=> b!474378 (= e!278438 tp_is_empty!13405)))

(declare-fun b!474379 () Bool)

(declare-fun res!283352 () Bool)

(declare-fun e!278439 () Bool)

(assert (=> b!474379 (=> (not res!283352) (not e!278439))))

(declare-datatypes ((array!30547 0))(
  ( (array!30548 (arr!14691 (Array (_ BitVec 32) (_ BitVec 64))) (size!15044 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30547)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30547 (_ BitVec 32)) Bool)

(assert (=> b!474379 (= res!283352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474380 () Bool)

(declare-fun res!283353 () Bool)

(assert (=> b!474380 (=> (not res!283353) (not e!278439))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474380 (= res!283353 (and (= (size!15043 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15044 _keys!1025) (size!15043 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21826 () Bool)

(declare-fun tp!41971 () Bool)

(assert (=> mapNonEmpty!21826 (= mapRes!21826 (and tp!41971 e!278437))))

(declare-fun mapKey!21826 () (_ BitVec 32))

(declare-fun mapValue!21826 () ValueCell!6359)

(declare-fun mapRest!21826 () (Array (_ BitVec 32) ValueCell!6359))

(assert (=> mapNonEmpty!21826 (= (arr!14690 _values!833) (store mapRest!21826 mapKey!21826 mapValue!21826))))

(declare-fun b!474382 () Bool)

(assert (=> b!474382 (= e!278439 false)))

(declare-fun zeroValue!794 () V!18979)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8952 0))(
  ( (tuple2!8953 (_1!4487 (_ BitVec 64)) (_2!4487 V!18979)) )
))
(declare-datatypes ((List!9014 0))(
  ( (Nil!9011) (Cons!9010 (h!9866 tuple2!8952) (t!14979 List!9014)) )
))
(declare-datatypes ((ListLongMap!7855 0))(
  ( (ListLongMap!7856 (toList!3943 List!9014)) )
))
(declare-fun lt!216016 () ListLongMap!7855)

(declare-fun minValueAfter!38 () V!18979)

(declare-fun getCurrentListMapNoExtraKeys!2110 (array!30547 array!30545 (_ BitVec 32) (_ BitVec 32) V!18979 V!18979 (_ BitVec 32) Int) ListLongMap!7855)

(assert (=> b!474382 (= lt!216016 (getCurrentListMapNoExtraKeys!2110 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18979)

(declare-fun lt!216017 () ListLongMap!7855)

(assert (=> b!474382 (= lt!216017 (getCurrentListMapNoExtraKeys!2110 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474381 () Bool)

(declare-fun res!283351 () Bool)

(assert (=> b!474381 (=> (not res!283351) (not e!278439))))

(declare-datatypes ((List!9015 0))(
  ( (Nil!9012) (Cons!9011 (h!9867 (_ BitVec 64)) (t!14980 List!9015)) )
))
(declare-fun arrayNoDuplicates!0 (array!30547 (_ BitVec 32) List!9015) Bool)

(assert (=> b!474381 (= res!283351 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9012))))

(declare-fun res!283350 () Bool)

(assert (=> start!42528 (=> (not res!283350) (not e!278439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42528 (= res!283350 (validMask!0 mask!1365))))

(assert (=> start!42528 e!278439))

(assert (=> start!42528 tp_is_empty!13405))

(assert (=> start!42528 tp!41970))

(assert (=> start!42528 true))

(declare-fun array_inv!10680 (array!30547) Bool)

(assert (=> start!42528 (array_inv!10680 _keys!1025)))

(declare-fun array_inv!10681 (array!30545) Bool)

(assert (=> start!42528 (and (array_inv!10681 _values!833) e!278436)))

(assert (= (and start!42528 res!283350) b!474380))

(assert (= (and b!474380 res!283353) b!474379))

(assert (= (and b!474379 res!283352) b!474381))

(assert (= (and b!474381 res!283351) b!474382))

(assert (= (and b!474377 condMapEmpty!21826) mapIsEmpty!21826))

(assert (= (and b!474377 (not condMapEmpty!21826)) mapNonEmpty!21826))

(get-info :version)

(assert (= (and mapNonEmpty!21826 ((_ is ValueCellFull!6359) mapValue!21826)) b!474376))

(assert (= (and b!474377 ((_ is ValueCellFull!6359) mapDefault!21826)) b!474378))

(assert (= start!42528 b!474377))

(declare-fun m!456281 () Bool)

(assert (=> b!474381 m!456281))

(declare-fun m!456283 () Bool)

(assert (=> b!474379 m!456283))

(declare-fun m!456285 () Bool)

(assert (=> b!474382 m!456285))

(declare-fun m!456287 () Bool)

(assert (=> b!474382 m!456287))

(declare-fun m!456289 () Bool)

(assert (=> start!42528 m!456289))

(declare-fun m!456291 () Bool)

(assert (=> start!42528 m!456291))

(declare-fun m!456293 () Bool)

(assert (=> start!42528 m!456293))

(declare-fun m!456295 () Bool)

(assert (=> mapNonEmpty!21826 m!456295))

(check-sat (not b!474381) (not b!474382) (not b_next!11977) (not start!42528) (not mapNonEmpty!21826) b_and!20431 (not b!474379) tp_is_empty!13405)
(check-sat b_and!20431 (not b_next!11977))
