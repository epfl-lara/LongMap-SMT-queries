; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42546 () Bool)

(assert start!42546)

(declare-fun b_free!11995 () Bool)

(declare-fun b_next!11995 () Bool)

(assert (=> start!42546 (= b_free!11995 (not b_next!11995))))

(declare-fun tp!42025 () Bool)

(declare-fun b_and!20449 () Bool)

(assert (=> start!42546 (= tp!42025 b_and!20449)))

(declare-fun b!474565 () Bool)

(declare-fun e!278571 () Bool)

(assert (=> b!474565 (= e!278571 false)))

(declare-datatypes ((V!19003 0))(
  ( (V!19004 (val!6756 Int)) )
))
(declare-fun zeroValue!794 () V!19003)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8962 0))(
  ( (tuple2!8963 (_1!4492 (_ BitVec 64)) (_2!4492 V!19003)) )
))
(declare-datatypes ((List!9025 0))(
  ( (Nil!9022) (Cons!9021 (h!9877 tuple2!8962) (t!14990 List!9025)) )
))
(declare-datatypes ((ListLongMap!7865 0))(
  ( (ListLongMap!7866 (toList!3948 List!9025)) )
))
(declare-fun lt!216070 () ListLongMap!7865)

(declare-datatypes ((array!30577 0))(
  ( (array!30578 (arr!14706 (Array (_ BitVec 32) (_ BitVec 64))) (size!15059 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30577)

(declare-datatypes ((ValueCell!6368 0))(
  ( (ValueCellFull!6368 (v!9043 V!19003)) (EmptyCell!6368) )
))
(declare-datatypes ((array!30579 0))(
  ( (array!30580 (arr!14707 (Array (_ BitVec 32) ValueCell!6368)) (size!15060 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30579)

(declare-fun minValueAfter!38 () V!19003)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2115 (array!30577 array!30579 (_ BitVec 32) (_ BitVec 32) V!19003 V!19003 (_ BitVec 32) Int) ListLongMap!7865)

(assert (=> b!474565 (= lt!216070 (getCurrentListMapNoExtraKeys!2115 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216071 () ListLongMap!7865)

(declare-fun minValueBefore!38 () V!19003)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474565 (= lt!216071 (getCurrentListMapNoExtraKeys!2115 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21853 () Bool)

(declare-fun mapRes!21853 () Bool)

(declare-fun tp!42024 () Bool)

(declare-fun e!278570 () Bool)

(assert (=> mapNonEmpty!21853 (= mapRes!21853 (and tp!42024 e!278570))))

(declare-fun mapKey!21853 () (_ BitVec 32))

(declare-fun mapValue!21853 () ValueCell!6368)

(declare-fun mapRest!21853 () (Array (_ BitVec 32) ValueCell!6368))

(assert (=> mapNonEmpty!21853 (= (arr!14707 _values!833) (store mapRest!21853 mapKey!21853 mapValue!21853))))

(declare-fun b!474566 () Bool)

(declare-fun e!278572 () Bool)

(declare-fun e!278574 () Bool)

(assert (=> b!474566 (= e!278572 (and e!278574 mapRes!21853))))

(declare-fun condMapEmpty!21853 () Bool)

(declare-fun mapDefault!21853 () ValueCell!6368)

(assert (=> b!474566 (= condMapEmpty!21853 (= (arr!14707 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6368)) mapDefault!21853)))))

(declare-fun res!283459 () Bool)

(assert (=> start!42546 (=> (not res!283459) (not e!278571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42546 (= res!283459 (validMask!0 mask!1365))))

(assert (=> start!42546 e!278571))

(declare-fun tp_is_empty!13423 () Bool)

(assert (=> start!42546 tp_is_empty!13423))

(assert (=> start!42546 tp!42025))

(assert (=> start!42546 true))

(declare-fun array_inv!10692 (array!30577) Bool)

(assert (=> start!42546 (array_inv!10692 _keys!1025)))

(declare-fun array_inv!10693 (array!30579) Bool)

(assert (=> start!42546 (and (array_inv!10693 _values!833) e!278572)))

(declare-fun b!474567 () Bool)

(declare-fun res!283461 () Bool)

(assert (=> b!474567 (=> (not res!283461) (not e!278571))))

(declare-datatypes ((List!9026 0))(
  ( (Nil!9023) (Cons!9022 (h!9878 (_ BitVec 64)) (t!14991 List!9026)) )
))
(declare-fun arrayNoDuplicates!0 (array!30577 (_ BitVec 32) List!9026) Bool)

(assert (=> b!474567 (= res!283461 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9023))))

(declare-fun mapIsEmpty!21853 () Bool)

(assert (=> mapIsEmpty!21853 mapRes!21853))

(declare-fun b!474568 () Bool)

(declare-fun res!283458 () Bool)

(assert (=> b!474568 (=> (not res!283458) (not e!278571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30577 (_ BitVec 32)) Bool)

(assert (=> b!474568 (= res!283458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474569 () Bool)

(assert (=> b!474569 (= e!278570 tp_is_empty!13423)))

(declare-fun b!474570 () Bool)

(assert (=> b!474570 (= e!278574 tp_is_empty!13423)))

(declare-fun b!474571 () Bool)

(declare-fun res!283460 () Bool)

(assert (=> b!474571 (=> (not res!283460) (not e!278571))))

(assert (=> b!474571 (= res!283460 (and (= (size!15060 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15059 _keys!1025) (size!15060 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42546 res!283459) b!474571))

(assert (= (and b!474571 res!283460) b!474568))

(assert (= (and b!474568 res!283458) b!474567))

(assert (= (and b!474567 res!283461) b!474565))

(assert (= (and b!474566 condMapEmpty!21853) mapIsEmpty!21853))

(assert (= (and b!474566 (not condMapEmpty!21853)) mapNonEmpty!21853))

(get-info :version)

(assert (= (and mapNonEmpty!21853 ((_ is ValueCellFull!6368) mapValue!21853)) b!474569))

(assert (= (and b!474566 ((_ is ValueCellFull!6368) mapDefault!21853)) b!474570))

(assert (= start!42546 b!474566))

(declare-fun m!456425 () Bool)

(assert (=> mapNonEmpty!21853 m!456425))

(declare-fun m!456427 () Bool)

(assert (=> b!474565 m!456427))

(declare-fun m!456429 () Bool)

(assert (=> b!474565 m!456429))

(declare-fun m!456431 () Bool)

(assert (=> start!42546 m!456431))

(declare-fun m!456433 () Bool)

(assert (=> start!42546 m!456433))

(declare-fun m!456435 () Bool)

(assert (=> start!42546 m!456435))

(declare-fun m!456437 () Bool)

(assert (=> b!474567 m!456437))

(declare-fun m!456439 () Bool)

(assert (=> b!474568 m!456439))

(check-sat (not start!42546) (not b_next!11995) (not b!474568) tp_is_empty!13423 (not mapNonEmpty!21853) (not b!474565) b_and!20449 (not b!474567))
(check-sat b_and!20449 (not b_next!11995))
