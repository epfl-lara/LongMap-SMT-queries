; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42540 () Bool)

(assert start!42540)

(declare-fun b_free!11989 () Bool)

(declare-fun b_next!11989 () Bool)

(assert (=> start!42540 (= b_free!11989 (not b_next!11989))))

(declare-fun tp!42006 () Bool)

(declare-fun b_and!20443 () Bool)

(assert (=> start!42540 (= tp!42006 b_and!20443)))

(declare-fun b!474502 () Bool)

(declare-fun e!278529 () Bool)

(declare-fun tp_is_empty!13417 () Bool)

(assert (=> b!474502 (= e!278529 tp_is_empty!13417)))

(declare-fun b!474503 () Bool)

(declare-fun res!283423 () Bool)

(declare-fun e!278525 () Bool)

(assert (=> b!474503 (=> (not res!283423) (not e!278525))))

(declare-datatypes ((array!30569 0))(
  ( (array!30570 (arr!14702 (Array (_ BitVec 32) (_ BitVec 64))) (size!15055 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30569)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30569 (_ BitVec 32)) Bool)

(assert (=> b!474503 (= res!283423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21844 () Bool)

(declare-fun mapRes!21844 () Bool)

(declare-fun tp!42007 () Bool)

(assert (=> mapNonEmpty!21844 (= mapRes!21844 (and tp!42007 e!278529))))

(declare-datatypes ((V!18995 0))(
  ( (V!18996 (val!6753 Int)) )
))
(declare-datatypes ((ValueCell!6365 0))(
  ( (ValueCellFull!6365 (v!9040 V!18995)) (EmptyCell!6365) )
))
(declare-fun mapRest!21844 () (Array (_ BitVec 32) ValueCell!6365))

(declare-datatypes ((array!30571 0))(
  ( (array!30572 (arr!14703 (Array (_ BitVec 32) ValueCell!6365)) (size!15056 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30571)

(declare-fun mapKey!21844 () (_ BitVec 32))

(declare-fun mapValue!21844 () ValueCell!6365)

(assert (=> mapNonEmpty!21844 (= (arr!14703 _values!833) (store mapRest!21844 mapKey!21844 mapValue!21844))))

(declare-fun b!474504 () Bool)

(assert (=> b!474504 (= e!278525 false)))

(declare-fun zeroValue!794 () V!18995)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18995)

(declare-datatypes ((tuple2!8960 0))(
  ( (tuple2!8961 (_1!4491 (_ BitVec 64)) (_2!4491 V!18995)) )
))
(declare-datatypes ((List!9023 0))(
  ( (Nil!9020) (Cons!9019 (h!9875 tuple2!8960) (t!14988 List!9023)) )
))
(declare-datatypes ((ListLongMap!7863 0))(
  ( (ListLongMap!7864 (toList!3947 List!9023)) )
))
(declare-fun lt!216053 () ListLongMap!7863)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2114 (array!30569 array!30571 (_ BitVec 32) (_ BitVec 32) V!18995 V!18995 (_ BitVec 32) Int) ListLongMap!7863)

(assert (=> b!474504 (= lt!216053 (getCurrentListMapNoExtraKeys!2114 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216052 () ListLongMap!7863)

(declare-fun minValueBefore!38 () V!18995)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474504 (= lt!216052 (getCurrentListMapNoExtraKeys!2114 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474505 () Bool)

(declare-fun res!283425 () Bool)

(assert (=> b!474505 (=> (not res!283425) (not e!278525))))

(assert (=> b!474505 (= res!283425 (and (= (size!15056 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15055 _keys!1025) (size!15056 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474506 () Bool)

(declare-fun e!278526 () Bool)

(declare-fun e!278528 () Bool)

(assert (=> b!474506 (= e!278526 (and e!278528 mapRes!21844))))

(declare-fun condMapEmpty!21844 () Bool)

(declare-fun mapDefault!21844 () ValueCell!6365)

(assert (=> b!474506 (= condMapEmpty!21844 (= (arr!14703 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6365)) mapDefault!21844)))))

(declare-fun b!474507 () Bool)

(assert (=> b!474507 (= e!278528 tp_is_empty!13417)))

(declare-fun b!474508 () Bool)

(declare-fun res!283424 () Bool)

(assert (=> b!474508 (=> (not res!283424) (not e!278525))))

(declare-datatypes ((List!9024 0))(
  ( (Nil!9021) (Cons!9020 (h!9876 (_ BitVec 64)) (t!14989 List!9024)) )
))
(declare-fun arrayNoDuplicates!0 (array!30569 (_ BitVec 32) List!9024) Bool)

(assert (=> b!474508 (= res!283424 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9021))))

(declare-fun mapIsEmpty!21844 () Bool)

(assert (=> mapIsEmpty!21844 mapRes!21844))

(declare-fun res!283422 () Bool)

(assert (=> start!42540 (=> (not res!283422) (not e!278525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42540 (= res!283422 (validMask!0 mask!1365))))

(assert (=> start!42540 e!278525))

(assert (=> start!42540 tp_is_empty!13417))

(assert (=> start!42540 tp!42006))

(assert (=> start!42540 true))

(declare-fun array_inv!10690 (array!30569) Bool)

(assert (=> start!42540 (array_inv!10690 _keys!1025)))

(declare-fun array_inv!10691 (array!30571) Bool)

(assert (=> start!42540 (and (array_inv!10691 _values!833) e!278526)))

(assert (= (and start!42540 res!283422) b!474505))

(assert (= (and b!474505 res!283425) b!474503))

(assert (= (and b!474503 res!283423) b!474508))

(assert (= (and b!474508 res!283424) b!474504))

(assert (= (and b!474506 condMapEmpty!21844) mapIsEmpty!21844))

(assert (= (and b!474506 (not condMapEmpty!21844)) mapNonEmpty!21844))

(get-info :version)

(assert (= (and mapNonEmpty!21844 ((_ is ValueCellFull!6365) mapValue!21844)) b!474502))

(assert (= (and b!474506 ((_ is ValueCellFull!6365) mapDefault!21844)) b!474507))

(assert (= start!42540 b!474506))

(declare-fun m!456377 () Bool)

(assert (=> b!474503 m!456377))

(declare-fun m!456379 () Bool)

(assert (=> b!474508 m!456379))

(declare-fun m!456381 () Bool)

(assert (=> mapNonEmpty!21844 m!456381))

(declare-fun m!456383 () Bool)

(assert (=> start!42540 m!456383))

(declare-fun m!456385 () Bool)

(assert (=> start!42540 m!456385))

(declare-fun m!456387 () Bool)

(assert (=> start!42540 m!456387))

(declare-fun m!456389 () Bool)

(assert (=> b!474504 m!456389))

(declare-fun m!456391 () Bool)

(assert (=> b!474504 m!456391))

(check-sat b_and!20443 (not b_next!11989) (not start!42540) (not b!474503) (not mapNonEmpty!21844) (not b!474504) (not b!474508) tp_is_empty!13417)
(check-sat b_and!20443 (not b_next!11989))
