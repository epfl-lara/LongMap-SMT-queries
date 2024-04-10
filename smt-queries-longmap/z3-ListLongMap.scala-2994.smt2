; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42270 () Bool)

(assert start!42270)

(declare-fun b_free!11775 () Bool)

(declare-fun b_next!11775 () Bool)

(assert (=> start!42270 (= b_free!11775 (not b_next!11775))))

(declare-fun tp!41352 () Bool)

(declare-fun b_and!20213 () Bool)

(assert (=> start!42270 (= tp!41352 b_and!20213)))

(declare-fun b!471688 () Bool)

(declare-fun e!276479 () Bool)

(assert (=> b!471688 (= e!276479 (not true))))

(declare-datatypes ((V!18709 0))(
  ( (V!18710 (val!6646 Int)) )
))
(declare-datatypes ((tuple2!8746 0))(
  ( (tuple2!8747 (_1!4384 (_ BitVec 64)) (_2!4384 V!18709)) )
))
(declare-datatypes ((List!8829 0))(
  ( (Nil!8826) (Cons!8825 (h!9681 tuple2!8746) (t!14795 List!8829)) )
))
(declare-datatypes ((ListLongMap!7659 0))(
  ( (ListLongMap!7660 (toList!3845 List!8829)) )
))
(declare-fun lt!213997 () ListLongMap!7659)

(declare-fun lt!213998 () ListLongMap!7659)

(assert (=> b!471688 (= lt!213997 lt!213998)))

(declare-fun minValueBefore!38 () V!18709)

(declare-fun zeroValue!794 () V!18709)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30167 0))(
  ( (array!30168 (arr!14505 (Array (_ BitVec 32) (_ BitVec 64))) (size!14857 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30167)

(declare-datatypes ((ValueCell!6258 0))(
  ( (ValueCellFull!6258 (v!8937 V!18709)) (EmptyCell!6258) )
))
(declare-datatypes ((array!30169 0))(
  ( (array!30170 (arr!14506 (Array (_ BitVec 32) ValueCell!6258)) (size!14858 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30169)

(declare-fun minValueAfter!38 () V!18709)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13849 0))(
  ( (Unit!13850) )
))
(declare-fun lt!213996 () Unit!13849)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!188 (array!30167 array!30169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18709 V!18709 V!18709 V!18709 (_ BitVec 32) Int) Unit!13849)

(assert (=> b!471688 (= lt!213996 (lemmaNoChangeToArrayThenSameMapNoExtras!188 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2008 (array!30167 array!30169 (_ BitVec 32) (_ BitVec 32) V!18709 V!18709 (_ BitVec 32) Int) ListLongMap!7659)

(assert (=> b!471688 (= lt!213998 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471688 (= lt!213997 (getCurrentListMapNoExtraKeys!2008 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21511 () Bool)

(declare-fun mapRes!21511 () Bool)

(declare-fun tp!41353 () Bool)

(declare-fun e!276480 () Bool)

(assert (=> mapNonEmpty!21511 (= mapRes!21511 (and tp!41353 e!276480))))

(declare-fun mapKey!21511 () (_ BitVec 32))

(declare-fun mapValue!21511 () ValueCell!6258)

(declare-fun mapRest!21511 () (Array (_ BitVec 32) ValueCell!6258))

(assert (=> mapNonEmpty!21511 (= (arr!14506 _values!833) (store mapRest!21511 mapKey!21511 mapValue!21511))))

(declare-fun b!471689 () Bool)

(declare-fun res!281779 () Bool)

(assert (=> b!471689 (=> (not res!281779) (not e!276479))))

(declare-datatypes ((List!8830 0))(
  ( (Nil!8827) (Cons!8826 (h!9682 (_ BitVec 64)) (t!14796 List!8830)) )
))
(declare-fun arrayNoDuplicates!0 (array!30167 (_ BitVec 32) List!8830) Bool)

(assert (=> b!471689 (= res!281779 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8827))))

(declare-fun b!471690 () Bool)

(declare-fun e!276478 () Bool)

(declare-fun tp_is_empty!13203 () Bool)

(assert (=> b!471690 (= e!276478 tp_is_empty!13203)))

(declare-fun res!281778 () Bool)

(assert (=> start!42270 (=> (not res!281778) (not e!276479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42270 (= res!281778 (validMask!0 mask!1365))))

(assert (=> start!42270 e!276479))

(assert (=> start!42270 tp_is_empty!13203))

(assert (=> start!42270 tp!41352))

(assert (=> start!42270 true))

(declare-fun array_inv!10456 (array!30167) Bool)

(assert (=> start!42270 (array_inv!10456 _keys!1025)))

(declare-fun e!276476 () Bool)

(declare-fun array_inv!10457 (array!30169) Bool)

(assert (=> start!42270 (and (array_inv!10457 _values!833) e!276476)))

(declare-fun b!471691 () Bool)

(assert (=> b!471691 (= e!276480 tp_is_empty!13203)))

(declare-fun b!471692 () Bool)

(declare-fun res!281780 () Bool)

(assert (=> b!471692 (=> (not res!281780) (not e!276479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30167 (_ BitVec 32)) Bool)

(assert (=> b!471692 (= res!281780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471693 () Bool)

(declare-fun res!281777 () Bool)

(assert (=> b!471693 (=> (not res!281777) (not e!276479))))

(assert (=> b!471693 (= res!281777 (and (= (size!14858 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14857 _keys!1025) (size!14858 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471694 () Bool)

(assert (=> b!471694 (= e!276476 (and e!276478 mapRes!21511))))

(declare-fun condMapEmpty!21511 () Bool)

(declare-fun mapDefault!21511 () ValueCell!6258)

(assert (=> b!471694 (= condMapEmpty!21511 (= (arr!14506 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6258)) mapDefault!21511)))))

(declare-fun mapIsEmpty!21511 () Bool)

(assert (=> mapIsEmpty!21511 mapRes!21511))

(assert (= (and start!42270 res!281778) b!471693))

(assert (= (and b!471693 res!281777) b!471692))

(assert (= (and b!471692 res!281780) b!471689))

(assert (= (and b!471689 res!281779) b!471688))

(assert (= (and b!471694 condMapEmpty!21511) mapIsEmpty!21511))

(assert (= (and b!471694 (not condMapEmpty!21511)) mapNonEmpty!21511))

(get-info :version)

(assert (= (and mapNonEmpty!21511 ((_ is ValueCellFull!6258) mapValue!21511)) b!471691))

(assert (= (and b!471694 ((_ is ValueCellFull!6258) mapDefault!21511)) b!471690))

(assert (= start!42270 b!471694))

(declare-fun m!453785 () Bool)

(assert (=> b!471688 m!453785))

(declare-fun m!453787 () Bool)

(assert (=> b!471688 m!453787))

(declare-fun m!453789 () Bool)

(assert (=> b!471688 m!453789))

(declare-fun m!453791 () Bool)

(assert (=> b!471689 m!453791))

(declare-fun m!453793 () Bool)

(assert (=> b!471692 m!453793))

(declare-fun m!453795 () Bool)

(assert (=> start!42270 m!453795))

(declare-fun m!453797 () Bool)

(assert (=> start!42270 m!453797))

(declare-fun m!453799 () Bool)

(assert (=> start!42270 m!453799))

(declare-fun m!453801 () Bool)

(assert (=> mapNonEmpty!21511 m!453801))

(check-sat b_and!20213 (not b!471689) (not mapNonEmpty!21511) (not b!471688) (not start!42270) (not b!471692) tp_is_empty!13203 (not b_next!11775))
(check-sat b_and!20213 (not b_next!11775))
