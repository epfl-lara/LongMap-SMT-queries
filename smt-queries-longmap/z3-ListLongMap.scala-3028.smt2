; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42544 () Bool)

(assert start!42544)

(declare-fun b_free!11979 () Bool)

(declare-fun b_next!11979 () Bool)

(assert (=> start!42544 (= b_free!11979 (not b_next!11979))))

(declare-fun tp!41977 () Bool)

(declare-fun b_and!20459 () Bool)

(assert (=> start!42544 (= tp!41977 b_and!20459)))

(declare-fun mapNonEmpty!21829 () Bool)

(declare-fun mapRes!21829 () Bool)

(declare-fun tp!41976 () Bool)

(declare-fun e!278624 () Bool)

(assert (=> mapNonEmpty!21829 (= mapRes!21829 (and tp!41976 e!278624))))

(declare-datatypes ((V!18981 0))(
  ( (V!18982 (val!6748 Int)) )
))
(declare-datatypes ((ValueCell!6360 0))(
  ( (ValueCellFull!6360 (v!9041 V!18981)) (EmptyCell!6360) )
))
(declare-datatypes ((array!30561 0))(
  ( (array!30562 (arr!14698 (Array (_ BitVec 32) ValueCell!6360)) (size!15050 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30561)

(declare-fun mapRest!21829 () (Array (_ BitVec 32) ValueCell!6360))

(declare-fun mapValue!21829 () ValueCell!6360)

(declare-fun mapKey!21829 () (_ BitVec 32))

(assert (=> mapNonEmpty!21829 (= (arr!14698 _values!833) (store mapRest!21829 mapKey!21829 mapValue!21829))))

(declare-fun b!474669 () Bool)

(declare-fun e!278625 () Bool)

(assert (=> b!474669 (= e!278625 false)))

(declare-fun zeroValue!794 () V!18981)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!30563 0))(
  ( (array!30564 (arr!14699 (Array (_ BitVec 32) (_ BitVec 64))) (size!15051 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30563)

(declare-fun minValueAfter!38 () V!18981)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8900 0))(
  ( (tuple2!8901 (_1!4461 (_ BitVec 64)) (_2!4461 V!18981)) )
))
(declare-datatypes ((List!8976 0))(
  ( (Nil!8973) (Cons!8972 (h!9828 tuple2!8900) (t!14950 List!8976)) )
))
(declare-datatypes ((ListLongMap!7813 0))(
  ( (ListLongMap!7814 (toList!3922 List!8976)) )
))
(declare-fun lt!216257 () ListLongMap!7813)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2079 (array!30563 array!30561 (_ BitVec 32) (_ BitVec 32) V!18981 V!18981 (_ BitVec 32) Int) ListLongMap!7813)

(assert (=> b!474669 (= lt!216257 (getCurrentListMapNoExtraKeys!2079 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216256 () ListLongMap!7813)

(declare-fun minValueBefore!38 () V!18981)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474669 (= lt!216256 (getCurrentListMapNoExtraKeys!2079 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474670 () Bool)

(declare-fun e!278626 () Bool)

(declare-fun e!278628 () Bool)

(assert (=> b!474670 (= e!278626 (and e!278628 mapRes!21829))))

(declare-fun condMapEmpty!21829 () Bool)

(declare-fun mapDefault!21829 () ValueCell!6360)

(assert (=> b!474670 (= condMapEmpty!21829 (= (arr!14698 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6360)) mapDefault!21829)))))

(declare-fun b!474671 () Bool)

(declare-fun res!283494 () Bool)

(assert (=> b!474671 (=> (not res!283494) (not e!278625))))

(declare-datatypes ((List!8977 0))(
  ( (Nil!8974) (Cons!8973 (h!9829 (_ BitVec 64)) (t!14951 List!8977)) )
))
(declare-fun arrayNoDuplicates!0 (array!30563 (_ BitVec 32) List!8977) Bool)

(assert (=> b!474671 (= res!283494 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8974))))

(declare-fun b!474672 () Bool)

(declare-fun tp_is_empty!13407 () Bool)

(assert (=> b!474672 (= e!278624 tp_is_empty!13407)))

(declare-fun b!474673 () Bool)

(declare-fun res!283492 () Bool)

(assert (=> b!474673 (=> (not res!283492) (not e!278625))))

(assert (=> b!474673 (= res!283492 (and (= (size!15050 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15051 _keys!1025) (size!15050 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283491 () Bool)

(assert (=> start!42544 (=> (not res!283491) (not e!278625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42544 (= res!283491 (validMask!0 mask!1365))))

(assert (=> start!42544 e!278625))

(assert (=> start!42544 tp_is_empty!13407))

(assert (=> start!42544 tp!41977))

(assert (=> start!42544 true))

(declare-fun array_inv!10606 (array!30563) Bool)

(assert (=> start!42544 (array_inv!10606 _keys!1025)))

(declare-fun array_inv!10607 (array!30561) Bool)

(assert (=> start!42544 (and (array_inv!10607 _values!833) e!278626)))

(declare-fun b!474668 () Bool)

(declare-fun res!283493 () Bool)

(assert (=> b!474668 (=> (not res!283493) (not e!278625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30563 (_ BitVec 32)) Bool)

(assert (=> b!474668 (= res!283493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21829 () Bool)

(assert (=> mapIsEmpty!21829 mapRes!21829))

(declare-fun b!474674 () Bool)

(assert (=> b!474674 (= e!278628 tp_is_empty!13407)))

(assert (= (and start!42544 res!283491) b!474673))

(assert (= (and b!474673 res!283492) b!474668))

(assert (= (and b!474668 res!283493) b!474671))

(assert (= (and b!474671 res!283494) b!474669))

(assert (= (and b!474670 condMapEmpty!21829) mapIsEmpty!21829))

(assert (= (and b!474670 (not condMapEmpty!21829)) mapNonEmpty!21829))

(get-info :version)

(assert (= (and mapNonEmpty!21829 ((_ is ValueCellFull!6360) mapValue!21829)) b!474672))

(assert (= (and b!474670 ((_ is ValueCellFull!6360) mapDefault!21829)) b!474674))

(assert (= start!42544 b!474670))

(declare-fun m!457031 () Bool)

(assert (=> b!474668 m!457031))

(declare-fun m!457033 () Bool)

(assert (=> b!474669 m!457033))

(declare-fun m!457035 () Bool)

(assert (=> b!474669 m!457035))

(declare-fun m!457037 () Bool)

(assert (=> start!42544 m!457037))

(declare-fun m!457039 () Bool)

(assert (=> start!42544 m!457039))

(declare-fun m!457041 () Bool)

(assert (=> start!42544 m!457041))

(declare-fun m!457043 () Bool)

(assert (=> b!474671 m!457043))

(declare-fun m!457045 () Bool)

(assert (=> mapNonEmpty!21829 m!457045))

(check-sat (not b!474668) (not b_next!11979) (not b!474671) tp_is_empty!13407 b_and!20459 (not b!474669) (not start!42544) (not mapNonEmpty!21829))
(check-sat b_and!20459 (not b_next!11979))
