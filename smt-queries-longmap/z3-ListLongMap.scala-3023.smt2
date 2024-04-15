; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42478 () Bool)

(assert start!42478)

(declare-fun b_free!11947 () Bool)

(declare-fun b_next!11947 () Bool)

(assert (=> start!42478 (= b_free!11947 (not b_next!11947))))

(declare-fun tp!41878 () Bool)

(declare-fun b_and!20389 () Bool)

(assert (=> start!42478 (= tp!41878 b_and!20389)))

(declare-fun mapIsEmpty!21778 () Bool)

(declare-fun mapRes!21778 () Bool)

(assert (=> mapIsEmpty!21778 mapRes!21778))

(declare-fun b!473846 () Bool)

(declare-fun res!283057 () Bool)

(declare-fun e!278063 () Bool)

(assert (=> b!473846 (=> (not res!283057) (not e!278063))))

(declare-datatypes ((array!30487 0))(
  ( (array!30488 (arr!14662 (Array (_ BitVec 32) (_ BitVec 64))) (size!15015 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30487)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30487 (_ BitVec 32)) Bool)

(assert (=> b!473846 (= res!283057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473847 () Bool)

(declare-fun e!278064 () Bool)

(declare-fun tp_is_empty!13375 () Bool)

(assert (=> b!473847 (= e!278064 tp_is_empty!13375)))

(declare-fun b!473848 () Bool)

(declare-fun res!283060 () Bool)

(assert (=> b!473848 (=> (not res!283060) (not e!278063))))

(declare-datatypes ((List!8994 0))(
  ( (Nil!8991) (Cons!8990 (h!9846 (_ BitVec 64)) (t!14957 List!8994)) )
))
(declare-fun arrayNoDuplicates!0 (array!30487 (_ BitVec 32) List!8994) Bool)

(assert (=> b!473848 (= res!283060 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8991))))

(declare-fun b!473849 () Bool)

(declare-fun e!278066 () Bool)

(assert (=> b!473849 (= e!278066 true)))

(declare-datatypes ((V!18939 0))(
  ( (V!18940 (val!6732 Int)) )
))
(declare-datatypes ((tuple2!8930 0))(
  ( (tuple2!8931 (_1!4476 (_ BitVec 64)) (_2!4476 V!18939)) )
))
(declare-datatypes ((List!8995 0))(
  ( (Nil!8992) (Cons!8991 (h!9847 tuple2!8930) (t!14958 List!8995)) )
))
(declare-datatypes ((ListLongMap!7833 0))(
  ( (ListLongMap!7834 (toList!3932 List!8995)) )
))
(declare-fun lt!215560 () ListLongMap!7833)

(declare-fun lt!215558 () tuple2!8930)

(declare-fun minValueBefore!38 () V!18939)

(declare-fun +!1780 (ListLongMap!7833 tuple2!8930) ListLongMap!7833)

(assert (=> b!473849 (= (+!1780 lt!215560 lt!215558) (+!1780 (+!1780 lt!215560 (tuple2!8931 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215558))))

(declare-fun minValueAfter!38 () V!18939)

(assert (=> b!473849 (= lt!215558 (tuple2!8931 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13960 0))(
  ( (Unit!13961) )
))
(declare-fun lt!215559 () Unit!13960)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!159 (ListLongMap!7833 (_ BitVec 64) V!18939 V!18939) Unit!13960)

(assert (=> b!473849 (= lt!215559 (addSameAsAddTwiceSameKeyDiffValues!159 lt!215560 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215562 () ListLongMap!7833)

(declare-fun zeroValue!794 () V!18939)

(assert (=> b!473849 (= lt!215560 (+!1780 lt!215562 (tuple2!8931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215563 () ListLongMap!7833)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6344 0))(
  ( (ValueCellFull!6344 (v!9018 V!18939)) (EmptyCell!6344) )
))
(declare-datatypes ((array!30489 0))(
  ( (array!30490 (arr!14663 (Array (_ BitVec 32) ValueCell!6344)) (size!15016 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30489)

(declare-fun getCurrentListMap!2232 (array!30487 array!30489 (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 (_ BitVec 32) Int) ListLongMap!7833)

(assert (=> b!473849 (= lt!215563 (getCurrentListMap!2232 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215564 () ListLongMap!7833)

(assert (=> b!473849 (= lt!215564 (getCurrentListMap!2232 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21778 () Bool)

(declare-fun tp!41877 () Bool)

(declare-fun e!278068 () Bool)

(assert (=> mapNonEmpty!21778 (= mapRes!21778 (and tp!41877 e!278068))))

(declare-fun mapRest!21778 () (Array (_ BitVec 32) ValueCell!6344))

(declare-fun mapValue!21778 () ValueCell!6344)

(declare-fun mapKey!21778 () (_ BitVec 32))

(assert (=> mapNonEmpty!21778 (= (arr!14663 _values!833) (store mapRest!21778 mapKey!21778 mapValue!21778))))

(declare-fun res!283061 () Bool)

(assert (=> start!42478 (=> (not res!283061) (not e!278063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42478 (= res!283061 (validMask!0 mask!1365))))

(assert (=> start!42478 e!278063))

(assert (=> start!42478 tp_is_empty!13375))

(assert (=> start!42478 tp!41878))

(assert (=> start!42478 true))

(declare-fun array_inv!10664 (array!30487) Bool)

(assert (=> start!42478 (array_inv!10664 _keys!1025)))

(declare-fun e!278065 () Bool)

(declare-fun array_inv!10665 (array!30489) Bool)

(assert (=> start!42478 (and (array_inv!10665 _values!833) e!278065)))

(declare-fun b!473850 () Bool)

(assert (=> b!473850 (= e!278063 (not e!278066))))

(declare-fun res!283058 () Bool)

(assert (=> b!473850 (=> res!283058 e!278066)))

(assert (=> b!473850 (= res!283058 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215561 () ListLongMap!7833)

(assert (=> b!473850 (= lt!215562 lt!215561)))

(declare-fun lt!215565 () Unit!13960)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!256 (array!30487 array!30489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 V!18939 V!18939 (_ BitVec 32) Int) Unit!13960)

(assert (=> b!473850 (= lt!215565 (lemmaNoChangeToArrayThenSameMapNoExtras!256 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2099 (array!30487 array!30489 (_ BitVec 32) (_ BitVec 32) V!18939 V!18939 (_ BitVec 32) Int) ListLongMap!7833)

(assert (=> b!473850 (= lt!215561 (getCurrentListMapNoExtraKeys!2099 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473850 (= lt!215562 (getCurrentListMapNoExtraKeys!2099 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473851 () Bool)

(assert (=> b!473851 (= e!278065 (and e!278064 mapRes!21778))))

(declare-fun condMapEmpty!21778 () Bool)

(declare-fun mapDefault!21778 () ValueCell!6344)

(assert (=> b!473851 (= condMapEmpty!21778 (= (arr!14663 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6344)) mapDefault!21778)))))

(declare-fun b!473852 () Bool)

(declare-fun res!283059 () Bool)

(assert (=> b!473852 (=> (not res!283059) (not e!278063))))

(assert (=> b!473852 (= res!283059 (and (= (size!15016 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15015 _keys!1025) (size!15016 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473853 () Bool)

(assert (=> b!473853 (= e!278068 tp_is_empty!13375)))

(assert (= (and start!42478 res!283061) b!473852))

(assert (= (and b!473852 res!283059) b!473846))

(assert (= (and b!473846 res!283057) b!473848))

(assert (= (and b!473848 res!283060) b!473850))

(assert (= (and b!473850 (not res!283058)) b!473849))

(assert (= (and b!473851 condMapEmpty!21778) mapIsEmpty!21778))

(assert (= (and b!473851 (not condMapEmpty!21778)) mapNonEmpty!21778))

(get-info :version)

(assert (= (and mapNonEmpty!21778 ((_ is ValueCellFull!6344) mapValue!21778)) b!473853))

(assert (= (and b!473851 ((_ is ValueCellFull!6344) mapDefault!21778)) b!473847))

(assert (= start!42478 b!473851))

(declare-fun m!455631 () Bool)

(assert (=> mapNonEmpty!21778 m!455631))

(declare-fun m!455633 () Bool)

(assert (=> b!473849 m!455633))

(declare-fun m!455635 () Bool)

(assert (=> b!473849 m!455635))

(declare-fun m!455637 () Bool)

(assert (=> b!473849 m!455637))

(declare-fun m!455639 () Bool)

(assert (=> b!473849 m!455639))

(assert (=> b!473849 m!455635))

(declare-fun m!455641 () Bool)

(assert (=> b!473849 m!455641))

(declare-fun m!455643 () Bool)

(assert (=> b!473849 m!455643))

(declare-fun m!455645 () Bool)

(assert (=> b!473849 m!455645))

(declare-fun m!455647 () Bool)

(assert (=> b!473850 m!455647))

(declare-fun m!455649 () Bool)

(assert (=> b!473850 m!455649))

(declare-fun m!455651 () Bool)

(assert (=> b!473850 m!455651))

(declare-fun m!455653 () Bool)

(assert (=> b!473848 m!455653))

(declare-fun m!455655 () Bool)

(assert (=> start!42478 m!455655))

(declare-fun m!455657 () Bool)

(assert (=> start!42478 m!455657))

(declare-fun m!455659 () Bool)

(assert (=> start!42478 m!455659))

(declare-fun m!455661 () Bool)

(assert (=> b!473846 m!455661))

(check-sat (not b!473848) (not b_next!11947) tp_is_empty!13375 (not b!473849) (not start!42478) b_and!20389 (not b!473850) (not b!473846) (not mapNonEmpty!21778))
(check-sat b_and!20389 (not b_next!11947))
