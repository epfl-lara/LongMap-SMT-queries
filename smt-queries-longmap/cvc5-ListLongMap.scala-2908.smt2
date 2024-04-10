; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41590 () Bool)

(assert start!41590)

(declare-fun b_free!11257 () Bool)

(declare-fun b_next!11257 () Bool)

(assert (=> start!41590 (= b_free!11257 (not b_next!11257))))

(declare-fun tp!39769 () Bool)

(declare-fun b_and!19597 () Bool)

(assert (=> start!41590 (= tp!39769 b_and!19597)))

(declare-fun mapIsEmpty!20704 () Bool)

(declare-fun mapRes!20704 () Bool)

(assert (=> mapIsEmpty!20704 mapRes!20704))

(declare-fun b!464546 () Bool)

(declare-fun res!277734 () Bool)

(declare-fun e!271376 () Bool)

(assert (=> b!464546 (=> (not res!277734) (not e!271376))))

(declare-datatypes ((array!29155 0))(
  ( (array!29156 (arr!14009 (Array (_ BitVec 32) (_ BitVec 64))) (size!14361 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29155)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29155 (_ BitVec 32)) Bool)

(assert (=> b!464546 (= res!277734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464547 () Bool)

(assert (=> b!464547 (= e!271376 (not true))))

(declare-datatypes ((V!18019 0))(
  ( (V!18020 (val!6387 Int)) )
))
(declare-datatypes ((tuple2!8364 0))(
  ( (tuple2!8365 (_1!4193 (_ BitVec 64)) (_2!4193 V!18019)) )
))
(declare-datatypes ((List!8459 0))(
  ( (Nil!8456) (Cons!8455 (h!9311 tuple2!8364) (t!14405 List!8459)) )
))
(declare-datatypes ((ListLongMap!7277 0))(
  ( (ListLongMap!7278 (toList!3654 List!8459)) )
))
(declare-fun lt!209762 () ListLongMap!7277)

(declare-fun lt!209760 () ListLongMap!7277)

(assert (=> b!464547 (= lt!209762 lt!209760)))

(declare-fun minValueBefore!38 () V!18019)

(declare-fun zeroValue!794 () V!18019)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13476 0))(
  ( (Unit!13477) )
))
(declare-fun lt!209761 () Unit!13476)

(declare-datatypes ((ValueCell!5999 0))(
  ( (ValueCellFull!5999 (v!8674 V!18019)) (EmptyCell!5999) )
))
(declare-datatypes ((array!29157 0))(
  ( (array!29158 (arr!14010 (Array (_ BitVec 32) ValueCell!5999)) (size!14362 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29157)

(declare-fun minValueAfter!38 () V!18019)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!14 (array!29155 array!29157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 V!18019 V!18019 (_ BitVec 32) Int) Unit!13476)

(assert (=> b!464547 (= lt!209761 (lemmaNoChangeToArrayThenSameMapNoExtras!14 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1834 (array!29155 array!29157 (_ BitVec 32) (_ BitVec 32) V!18019 V!18019 (_ BitVec 32) Int) ListLongMap!7277)

(assert (=> b!464547 (= lt!209760 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464547 (= lt!209762 (getCurrentListMapNoExtraKeys!1834 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464548 () Bool)

(declare-fun res!277736 () Bool)

(assert (=> b!464548 (=> (not res!277736) (not e!271376))))

(declare-datatypes ((List!8460 0))(
  ( (Nil!8457) (Cons!8456 (h!9312 (_ BitVec 64)) (t!14406 List!8460)) )
))
(declare-fun arrayNoDuplicates!0 (array!29155 (_ BitVec 32) List!8460) Bool)

(assert (=> b!464548 (= res!277736 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8457))))

(declare-fun mapNonEmpty!20704 () Bool)

(declare-fun tp!39768 () Bool)

(declare-fun e!271373 () Bool)

(assert (=> mapNonEmpty!20704 (= mapRes!20704 (and tp!39768 e!271373))))

(declare-fun mapRest!20704 () (Array (_ BitVec 32) ValueCell!5999))

(declare-fun mapValue!20704 () ValueCell!5999)

(declare-fun mapKey!20704 () (_ BitVec 32))

(assert (=> mapNonEmpty!20704 (= (arr!14010 _values!833) (store mapRest!20704 mapKey!20704 mapValue!20704))))

(declare-fun b!464549 () Bool)

(declare-fun res!277733 () Bool)

(assert (=> b!464549 (=> (not res!277733) (not e!271376))))

(assert (=> b!464549 (= res!277733 (and (= (size!14362 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14361 _keys!1025) (size!14362 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464550 () Bool)

(declare-fun tp_is_empty!12685 () Bool)

(assert (=> b!464550 (= e!271373 tp_is_empty!12685)))

(declare-fun b!464551 () Bool)

(declare-fun e!271377 () Bool)

(assert (=> b!464551 (= e!271377 tp_is_empty!12685)))

(declare-fun b!464545 () Bool)

(declare-fun e!271375 () Bool)

(assert (=> b!464545 (= e!271375 (and e!271377 mapRes!20704))))

(declare-fun condMapEmpty!20704 () Bool)

(declare-fun mapDefault!20704 () ValueCell!5999)

