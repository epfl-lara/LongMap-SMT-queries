; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42236 () Bool)

(assert start!42236)

(declare-fun b_free!11755 () Bool)

(declare-fun b_next!11755 () Bool)

(assert (=> start!42236 (= b_free!11755 (not b_next!11755))))

(declare-fun tp!41293 () Bool)

(declare-fun b_and!20203 () Bool)

(assert (=> start!42236 (= tp!41293 b_and!20203)))

(declare-fun b!471417 () Bool)

(declare-fun res!281651 () Bool)

(declare-fun e!276288 () Bool)

(assert (=> b!471417 (=> (not res!281651) (not e!276288))))

(declare-datatypes ((array!30116 0))(
  ( (array!30117 (arr!14479 (Array (_ BitVec 32) (_ BitVec 64))) (size!14831 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30116)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30116 (_ BitVec 32)) Bool)

(assert (=> b!471417 (= res!281651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471418 () Bool)

(assert (=> b!471418 (= e!276288 (not true))))

(declare-datatypes ((V!18683 0))(
  ( (V!18684 (val!6636 Int)) )
))
(declare-datatypes ((tuple2!8660 0))(
  ( (tuple2!8661 (_1!4341 (_ BitVec 64)) (_2!4341 V!18683)) )
))
(declare-datatypes ((List!8730 0))(
  ( (Nil!8727) (Cons!8726 (h!9582 tuple2!8660) (t!14688 List!8730)) )
))
(declare-datatypes ((ListLongMap!7575 0))(
  ( (ListLongMap!7576 (toList!3803 List!8730)) )
))
(declare-fun lt!213919 () ListLongMap!7575)

(declare-fun lt!213918 () ListLongMap!7575)

(assert (=> b!471418 (= lt!213919 lt!213918)))

(declare-fun minValueBefore!38 () V!18683)

(declare-fun zeroValue!794 () V!18683)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6248 0))(
  ( (ValueCellFull!6248 (v!8928 V!18683)) (EmptyCell!6248) )
))
(declare-datatypes ((array!30118 0))(
  ( (array!30119 (arr!14480 (Array (_ BitVec 32) ValueCell!6248)) (size!14832 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30118)

(declare-fun minValueAfter!38 () V!18683)

(declare-datatypes ((Unit!13819 0))(
  ( (Unit!13820) )
))
(declare-fun lt!213920 () Unit!13819)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!178 (array!30116 array!30118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 V!18683 V!18683 (_ BitVec 32) Int) Unit!13819)

(assert (=> b!471418 (= lt!213920 (lemmaNoChangeToArrayThenSameMapNoExtras!178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2018 (array!30116 array!30118 (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 (_ BitVec 32) Int) ListLongMap!7575)

(assert (=> b!471418 (= lt!213918 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471418 (= lt!213919 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21481 () Bool)

(declare-fun mapRes!21481 () Bool)

(assert (=> mapIsEmpty!21481 mapRes!21481))

(declare-fun b!471419 () Bool)

(declare-fun e!276289 () Bool)

(declare-fun e!276290 () Bool)

(assert (=> b!471419 (= e!276289 (and e!276290 mapRes!21481))))

(declare-fun condMapEmpty!21481 () Bool)

(declare-fun mapDefault!21481 () ValueCell!6248)

(assert (=> b!471419 (= condMapEmpty!21481 (= (arr!14480 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6248)) mapDefault!21481)))))

(declare-fun b!471420 () Bool)

(declare-fun res!281650 () Bool)

(assert (=> b!471420 (=> (not res!281650) (not e!276288))))

(declare-datatypes ((List!8731 0))(
  ( (Nil!8728) (Cons!8727 (h!9583 (_ BitVec 64)) (t!14689 List!8731)) )
))
(declare-fun arrayNoDuplicates!0 (array!30116 (_ BitVec 32) List!8731) Bool)

(assert (=> b!471420 (= res!281650 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8728))))

(declare-fun b!471421 () Bool)

(declare-fun tp_is_empty!13183 () Bool)

(assert (=> b!471421 (= e!276290 tp_is_empty!13183)))

(declare-fun res!281653 () Bool)

(assert (=> start!42236 (=> (not res!281653) (not e!276288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42236 (= res!281653 (validMask!0 mask!1365))))

(assert (=> start!42236 e!276288))

(assert (=> start!42236 tp_is_empty!13183))

(assert (=> start!42236 tp!41293))

(assert (=> start!42236 true))

(declare-fun array_inv!10536 (array!30116) Bool)

(assert (=> start!42236 (array_inv!10536 _keys!1025)))

(declare-fun array_inv!10537 (array!30118) Bool)

(assert (=> start!42236 (and (array_inv!10537 _values!833) e!276289)))

(declare-fun b!471422 () Bool)

(declare-fun e!276287 () Bool)

(assert (=> b!471422 (= e!276287 tp_is_empty!13183)))

(declare-fun mapNonEmpty!21481 () Bool)

(declare-fun tp!41292 () Bool)

(assert (=> mapNonEmpty!21481 (= mapRes!21481 (and tp!41292 e!276287))))

(declare-fun mapRest!21481 () (Array (_ BitVec 32) ValueCell!6248))

(declare-fun mapValue!21481 () ValueCell!6248)

(declare-fun mapKey!21481 () (_ BitVec 32))

(assert (=> mapNonEmpty!21481 (= (arr!14480 _values!833) (store mapRest!21481 mapKey!21481 mapValue!21481))))

(declare-fun b!471423 () Bool)

(declare-fun res!281652 () Bool)

(assert (=> b!471423 (=> (not res!281652) (not e!276288))))

(assert (=> b!471423 (= res!281652 (and (= (size!14832 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14831 _keys!1025) (size!14832 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42236 res!281653) b!471423))

(assert (= (and b!471423 res!281652) b!471417))

(assert (= (and b!471417 res!281651) b!471420))

(assert (= (and b!471420 res!281650) b!471418))

(assert (= (and b!471419 condMapEmpty!21481) mapIsEmpty!21481))

(assert (= (and b!471419 (not condMapEmpty!21481)) mapNonEmpty!21481))

(get-info :version)

(assert (= (and mapNonEmpty!21481 ((_ is ValueCellFull!6248) mapValue!21481)) b!471422))

(assert (= (and b!471419 ((_ is ValueCellFull!6248) mapDefault!21481)) b!471421))

(assert (= start!42236 b!471419))

(declare-fun m!453787 () Bool)

(assert (=> mapNonEmpty!21481 m!453787))

(declare-fun m!453789 () Bool)

(assert (=> b!471420 m!453789))

(declare-fun m!453791 () Bool)

(assert (=> b!471418 m!453791))

(declare-fun m!453793 () Bool)

(assert (=> b!471418 m!453793))

(declare-fun m!453795 () Bool)

(assert (=> b!471418 m!453795))

(declare-fun m!453797 () Bool)

(assert (=> start!42236 m!453797))

(declare-fun m!453799 () Bool)

(assert (=> start!42236 m!453799))

(declare-fun m!453801 () Bool)

(assert (=> start!42236 m!453801))

(declare-fun m!453803 () Bool)

(assert (=> b!471417 m!453803))

(check-sat (not b_next!11755) (not start!42236) (not b!471418) (not b!471420) (not b!471417) (not mapNonEmpty!21481) tp_is_empty!13183 b_and!20203)
(check-sat b_and!20203 (not b_next!11755))
