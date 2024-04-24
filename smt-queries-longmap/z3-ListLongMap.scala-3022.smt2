; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42472 () Bool)

(assert start!42472)

(declare-fun b_free!11941 () Bool)

(declare-fun b_next!11941 () Bool)

(assert (=> start!42472 (= b_free!11941 (not b_next!11941))))

(declare-fun tp!41859 () Bool)

(declare-fun b_and!20419 () Bool)

(assert (=> start!42472 (= tp!41859 b_and!20419)))

(declare-fun b!473984 () Bool)

(declare-fun e!278144 () Bool)

(declare-fun e!278148 () Bool)

(assert (=> b!473984 (= e!278144 (not e!278148))))

(declare-fun res!283134 () Bool)

(assert (=> b!473984 (=> res!283134 e!278148)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473984 (= res!283134 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18931 0))(
  ( (V!18932 (val!6729 Int)) )
))
(declare-datatypes ((tuple2!8796 0))(
  ( (tuple2!8797 (_1!4409 (_ BitVec 64)) (_2!4409 V!18931)) )
))
(declare-datatypes ((List!8857 0))(
  ( (Nil!8854) (Cons!8853 (h!9709 tuple2!8796) (t!14821 List!8857)) )
))
(declare-datatypes ((ListLongMap!7711 0))(
  ( (ListLongMap!7712 (toList!3871 List!8857)) )
))
(declare-fun lt!215738 () ListLongMap!7711)

(declare-fun lt!215737 () ListLongMap!7711)

(assert (=> b!473984 (= lt!215738 lt!215737)))

(declare-fun minValueBefore!38 () V!18931)

(declare-fun zeroValue!794 () V!18931)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13948 0))(
  ( (Unit!13949) )
))
(declare-fun lt!215734 () Unit!13948)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30468 0))(
  ( (array!30469 (arr!14652 (Array (_ BitVec 32) (_ BitVec 64))) (size!15004 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30468)

(declare-datatypes ((ValueCell!6341 0))(
  ( (ValueCellFull!6341 (v!9022 V!18931)) (EmptyCell!6341) )
))
(declare-datatypes ((array!30470 0))(
  ( (array!30471 (arr!14653 (Array (_ BitVec 32) ValueCell!6341)) (size!15005 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30470)

(declare-fun minValueAfter!38 () V!18931)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!240 (array!30468 array!30470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 V!18931 V!18931 (_ BitVec 32) Int) Unit!13948)

(assert (=> b!473984 (= lt!215734 (lemmaNoChangeToArrayThenSameMapNoExtras!240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2080 (array!30468 array!30470 (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 (_ BitVec 32) Int) ListLongMap!7711)

(assert (=> b!473984 (= lt!215737 (getCurrentListMapNoExtraKeys!2080 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473984 (= lt!215738 (getCurrentListMapNoExtraKeys!2080 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473985 () Bool)

(declare-fun e!278147 () Bool)

(declare-fun tp_is_empty!13369 () Bool)

(assert (=> b!473985 (= e!278147 tp_is_empty!13369)))

(declare-fun b!473986 () Bool)

(assert (=> b!473986 (= e!278148 true)))

(declare-fun lt!215732 () ListLongMap!7711)

(declare-fun lt!215736 () tuple2!8796)

(declare-fun +!1753 (ListLongMap!7711 tuple2!8796) ListLongMap!7711)

(assert (=> b!473986 (= (+!1753 lt!215732 lt!215736) (+!1753 (+!1753 lt!215732 (tuple2!8797 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215736))))

(assert (=> b!473986 (= lt!215736 (tuple2!8797 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215735 () Unit!13948)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!155 (ListLongMap!7711 (_ BitVec 64) V!18931 V!18931) Unit!13948)

(assert (=> b!473986 (= lt!215735 (addSameAsAddTwiceSameKeyDiffValues!155 lt!215732 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473986 (= lt!215732 (+!1753 lt!215738 (tuple2!8797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215739 () ListLongMap!7711)

(declare-fun getCurrentListMap!2233 (array!30468 array!30470 (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 (_ BitVec 32) Int) ListLongMap!7711)

(assert (=> b!473986 (= lt!215739 (getCurrentListMap!2233 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215733 () ListLongMap!7711)

(assert (=> b!473986 (= lt!215733 (getCurrentListMap!2233 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473987 () Bool)

(declare-fun res!283136 () Bool)

(assert (=> b!473987 (=> (not res!283136) (not e!278144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30468 (_ BitVec 32)) Bool)

(assert (=> b!473987 (= res!283136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21769 () Bool)

(declare-fun mapRes!21769 () Bool)

(assert (=> mapIsEmpty!21769 mapRes!21769))

(declare-fun res!283137 () Bool)

(assert (=> start!42472 (=> (not res!283137) (not e!278144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42472 (= res!283137 (validMask!0 mask!1365))))

(assert (=> start!42472 e!278144))

(assert (=> start!42472 tp_is_empty!13369))

(assert (=> start!42472 tp!41859))

(assert (=> start!42472 true))

(declare-fun array_inv!10654 (array!30468) Bool)

(assert (=> start!42472 (array_inv!10654 _keys!1025)))

(declare-fun e!278145 () Bool)

(declare-fun array_inv!10655 (array!30470) Bool)

(assert (=> start!42472 (and (array_inv!10655 _values!833) e!278145)))

(declare-fun b!473988 () Bool)

(declare-fun e!278149 () Bool)

(assert (=> b!473988 (= e!278149 tp_is_empty!13369)))

(declare-fun b!473989 () Bool)

(assert (=> b!473989 (= e!278145 (and e!278149 mapRes!21769))))

(declare-fun condMapEmpty!21769 () Bool)

(declare-fun mapDefault!21769 () ValueCell!6341)

(assert (=> b!473989 (= condMapEmpty!21769 (= (arr!14653 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6341)) mapDefault!21769)))))

(declare-fun mapNonEmpty!21769 () Bool)

(declare-fun tp!41860 () Bool)

(assert (=> mapNonEmpty!21769 (= mapRes!21769 (and tp!41860 e!278147))))

(declare-fun mapValue!21769 () ValueCell!6341)

(declare-fun mapRest!21769 () (Array (_ BitVec 32) ValueCell!6341))

(declare-fun mapKey!21769 () (_ BitVec 32))

(assert (=> mapNonEmpty!21769 (= (arr!14653 _values!833) (store mapRest!21769 mapKey!21769 mapValue!21769))))

(declare-fun b!473990 () Bool)

(declare-fun res!283135 () Bool)

(assert (=> b!473990 (=> (not res!283135) (not e!278144))))

(assert (=> b!473990 (= res!283135 (and (= (size!15005 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15004 _keys!1025) (size!15005 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473991 () Bool)

(declare-fun res!283138 () Bool)

(assert (=> b!473991 (=> (not res!283138) (not e!278144))))

(declare-datatypes ((List!8858 0))(
  ( (Nil!8855) (Cons!8854 (h!9710 (_ BitVec 64)) (t!14822 List!8858)) )
))
(declare-fun arrayNoDuplicates!0 (array!30468 (_ BitVec 32) List!8858) Bool)

(assert (=> b!473991 (= res!283138 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8855))))

(assert (= (and start!42472 res!283137) b!473990))

(assert (= (and b!473990 res!283135) b!473987))

(assert (= (and b!473987 res!283136) b!473991))

(assert (= (and b!473991 res!283138) b!473984))

(assert (= (and b!473984 (not res!283134)) b!473986))

(assert (= (and b!473989 condMapEmpty!21769) mapIsEmpty!21769))

(assert (= (and b!473989 (not condMapEmpty!21769)) mapNonEmpty!21769))

(get-info :version)

(assert (= (and mapNonEmpty!21769 ((_ is ValueCellFull!6341) mapValue!21769)) b!473985))

(assert (= (and b!473989 ((_ is ValueCellFull!6341) mapDefault!21769)) b!473988))

(assert (= start!42472 b!473989))

(declare-fun m!456451 () Bool)

(assert (=> mapNonEmpty!21769 m!456451))

(declare-fun m!456453 () Bool)

(assert (=> b!473991 m!456453))

(declare-fun m!456455 () Bool)

(assert (=> b!473986 m!456455))

(declare-fun m!456457 () Bool)

(assert (=> b!473986 m!456457))

(declare-fun m!456459 () Bool)

(assert (=> b!473986 m!456459))

(declare-fun m!456461 () Bool)

(assert (=> b!473986 m!456461))

(declare-fun m!456463 () Bool)

(assert (=> b!473986 m!456463))

(declare-fun m!456465 () Bool)

(assert (=> b!473986 m!456465))

(assert (=> b!473986 m!456459))

(declare-fun m!456467 () Bool)

(assert (=> b!473986 m!456467))

(declare-fun m!456469 () Bool)

(assert (=> b!473984 m!456469))

(declare-fun m!456471 () Bool)

(assert (=> b!473984 m!456471))

(declare-fun m!456473 () Bool)

(assert (=> b!473984 m!456473))

(declare-fun m!456475 () Bool)

(assert (=> start!42472 m!456475))

(declare-fun m!456477 () Bool)

(assert (=> start!42472 m!456477))

(declare-fun m!456479 () Bool)

(assert (=> start!42472 m!456479))

(declare-fun m!456481 () Bool)

(assert (=> b!473987 m!456481))

(check-sat (not b!473984) b_and!20419 tp_is_empty!13369 (not b!473991) (not b_next!11941) (not b!473987) (not b!473986) (not mapNonEmpty!21769) (not start!42472))
(check-sat b_and!20419 (not b_next!11941))
