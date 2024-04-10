; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42556 () Bool)

(assert start!42556)

(declare-fun b_free!11991 () Bool)

(declare-fun b_next!11991 () Bool)

(assert (=> start!42556 (= b_free!11991 (not b_next!11991))))

(declare-fun tp!42012 () Bool)

(declare-fun b_and!20471 () Bool)

(assert (=> start!42556 (= tp!42012 b_and!20471)))

(declare-fun b!474794 () Bool)

(declare-fun e!278715 () Bool)

(declare-fun tp_is_empty!13419 () Bool)

(assert (=> b!474794 (= e!278715 tp_is_empty!13419)))

(declare-fun b!474795 () Bool)

(declare-fun res!283566 () Bool)

(declare-fun e!278717 () Bool)

(assert (=> b!474795 (=> (not res!283566) (not e!278717))))

(declare-datatypes ((array!30583 0))(
  ( (array!30584 (arr!14709 (Array (_ BitVec 32) (_ BitVec 64))) (size!15061 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30583)

(declare-datatypes ((List!8985 0))(
  ( (Nil!8982) (Cons!8981 (h!9837 (_ BitVec 64)) (t!14959 List!8985)) )
))
(declare-fun arrayNoDuplicates!0 (array!30583 (_ BitVec 32) List!8985) Bool)

(assert (=> b!474795 (= res!283566 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8982))))

(declare-fun mapNonEmpty!21847 () Bool)

(declare-fun mapRes!21847 () Bool)

(declare-fun tp!42013 () Bool)

(declare-fun e!278716 () Bool)

(assert (=> mapNonEmpty!21847 (= mapRes!21847 (and tp!42013 e!278716))))

(declare-datatypes ((V!18997 0))(
  ( (V!18998 (val!6754 Int)) )
))
(declare-datatypes ((ValueCell!6366 0))(
  ( (ValueCellFull!6366 (v!9047 V!18997)) (EmptyCell!6366) )
))
(declare-fun mapRest!21847 () (Array (_ BitVec 32) ValueCell!6366))

(declare-datatypes ((array!30585 0))(
  ( (array!30586 (arr!14710 (Array (_ BitVec 32) ValueCell!6366)) (size!15062 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30585)

(declare-fun mapValue!21847 () ValueCell!6366)

(declare-fun mapKey!21847 () (_ BitVec 32))

(assert (=> mapNonEmpty!21847 (= (arr!14710 _values!833) (store mapRest!21847 mapKey!21847 mapValue!21847))))

(declare-fun mapIsEmpty!21847 () Bool)

(assert (=> mapIsEmpty!21847 mapRes!21847))

(declare-fun b!474796 () Bool)

(assert (=> b!474796 (= e!278716 tp_is_empty!13419)))

(declare-fun b!474797 () Bool)

(declare-fun e!278718 () Bool)

(assert (=> b!474797 (= e!278718 (and e!278715 mapRes!21847))))

(declare-fun condMapEmpty!21847 () Bool)

(declare-fun mapDefault!21847 () ValueCell!6366)

(assert (=> b!474797 (= condMapEmpty!21847 (= (arr!14710 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6366)) mapDefault!21847)))))

(declare-fun res!283564 () Bool)

(assert (=> start!42556 (=> (not res!283564) (not e!278717))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42556 (= res!283564 (validMask!0 mask!1365))))

(assert (=> start!42556 e!278717))

(assert (=> start!42556 tp_is_empty!13419))

(assert (=> start!42556 tp!42012))

(assert (=> start!42556 true))

(declare-fun array_inv!10612 (array!30583) Bool)

(assert (=> start!42556 (array_inv!10612 _keys!1025)))

(declare-fun array_inv!10613 (array!30585) Bool)

(assert (=> start!42556 (and (array_inv!10613 _values!833) e!278718)))

(declare-fun b!474798 () Bool)

(declare-fun res!283563 () Bool)

(assert (=> b!474798 (=> (not res!283563) (not e!278717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30583 (_ BitVec 32)) Bool)

(assert (=> b!474798 (= res!283563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474799 () Bool)

(assert (=> b!474799 (= e!278717 false)))

(declare-datatypes ((tuple2!8910 0))(
  ( (tuple2!8911 (_1!4466 (_ BitVec 64)) (_2!4466 V!18997)) )
))
(declare-datatypes ((List!8986 0))(
  ( (Nil!8983) (Cons!8982 (h!9838 tuple2!8910) (t!14960 List!8986)) )
))
(declare-datatypes ((ListLongMap!7823 0))(
  ( (ListLongMap!7824 (toList!3927 List!8986)) )
))
(declare-fun lt!216292 () ListLongMap!7823)

(declare-fun zeroValue!794 () V!18997)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18997)

(declare-fun getCurrentListMapNoExtraKeys!2084 (array!30583 array!30585 (_ BitVec 32) (_ BitVec 32) V!18997 V!18997 (_ BitVec 32) Int) ListLongMap!7823)

(assert (=> b!474799 (= lt!216292 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18997)

(declare-fun lt!216293 () ListLongMap!7823)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474799 (= lt!216293 (getCurrentListMapNoExtraKeys!2084 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474800 () Bool)

(declare-fun res!283565 () Bool)

(assert (=> b!474800 (=> (not res!283565) (not e!278717))))

(assert (=> b!474800 (= res!283565 (and (= (size!15062 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15061 _keys!1025) (size!15062 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42556 res!283564) b!474800))

(assert (= (and b!474800 res!283565) b!474798))

(assert (= (and b!474798 res!283563) b!474795))

(assert (= (and b!474795 res!283566) b!474799))

(assert (= (and b!474797 condMapEmpty!21847) mapIsEmpty!21847))

(assert (= (and b!474797 (not condMapEmpty!21847)) mapNonEmpty!21847))

(get-info :version)

(assert (= (and mapNonEmpty!21847 ((_ is ValueCellFull!6366) mapValue!21847)) b!474796))

(assert (= (and b!474797 ((_ is ValueCellFull!6366) mapDefault!21847)) b!474794))

(assert (= start!42556 b!474797))

(declare-fun m!457127 () Bool)

(assert (=> mapNonEmpty!21847 m!457127))

(declare-fun m!457129 () Bool)

(assert (=> b!474799 m!457129))

(declare-fun m!457131 () Bool)

(assert (=> b!474799 m!457131))

(declare-fun m!457133 () Bool)

(assert (=> b!474795 m!457133))

(declare-fun m!457135 () Bool)

(assert (=> b!474798 m!457135))

(declare-fun m!457137 () Bool)

(assert (=> start!42556 m!457137))

(declare-fun m!457139 () Bool)

(assert (=> start!42556 m!457139))

(declare-fun m!457141 () Bool)

(assert (=> start!42556 m!457141))

(check-sat (not start!42556) b_and!20471 (not mapNonEmpty!21847) (not b!474799) tp_is_empty!13419 (not b_next!11991) (not b!474798) (not b!474795))
(check-sat b_and!20471 (not b_next!11991))
