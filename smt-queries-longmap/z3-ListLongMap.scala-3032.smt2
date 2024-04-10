; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42568 () Bool)

(assert start!42568)

(declare-fun b_free!12003 () Bool)

(declare-fun b_next!12003 () Bool)

(assert (=> start!42568 (= b_free!12003 (not b_next!12003))))

(declare-fun tp!42049 () Bool)

(declare-fun b_and!20483 () Bool)

(assert (=> start!42568 (= tp!42049 b_and!20483)))

(declare-fun b!474920 () Bool)

(declare-fun e!278804 () Bool)

(declare-fun tp_is_empty!13431 () Bool)

(assert (=> b!474920 (= e!278804 tp_is_empty!13431)))

(declare-fun mapNonEmpty!21865 () Bool)

(declare-fun mapRes!21865 () Bool)

(declare-fun tp!42048 () Bool)

(declare-fun e!278805 () Bool)

(assert (=> mapNonEmpty!21865 (= mapRes!21865 (and tp!42048 e!278805))))

(declare-datatypes ((V!19013 0))(
  ( (V!19014 (val!6760 Int)) )
))
(declare-datatypes ((ValueCell!6372 0))(
  ( (ValueCellFull!6372 (v!9053 V!19013)) (EmptyCell!6372) )
))
(declare-datatypes ((array!30605 0))(
  ( (array!30606 (arr!14720 (Array (_ BitVec 32) ValueCell!6372)) (size!15072 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30605)

(declare-fun mapValue!21865 () ValueCell!6372)

(declare-fun mapKey!21865 () (_ BitVec 32))

(declare-fun mapRest!21865 () (Array (_ BitVec 32) ValueCell!6372))

(assert (=> mapNonEmpty!21865 (= (arr!14720 _values!833) (store mapRest!21865 mapKey!21865 mapValue!21865))))

(declare-fun b!474921 () Bool)

(declare-fun res!283636 () Bool)

(declare-fun e!278807 () Bool)

(assert (=> b!474921 (=> (not res!283636) (not e!278807))))

(declare-datatypes ((array!30607 0))(
  ( (array!30608 (arr!14721 (Array (_ BitVec 32) (_ BitVec 64))) (size!15073 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30607)

(declare-datatypes ((List!8993 0))(
  ( (Nil!8990) (Cons!8989 (h!9845 (_ BitVec 64)) (t!14967 List!8993)) )
))
(declare-fun arrayNoDuplicates!0 (array!30607 (_ BitVec 32) List!8993) Bool)

(assert (=> b!474921 (= res!283636 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8990))))

(declare-fun res!283635 () Bool)

(assert (=> start!42568 (=> (not res!283635) (not e!278807))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42568 (= res!283635 (validMask!0 mask!1365))))

(assert (=> start!42568 e!278807))

(assert (=> start!42568 tp_is_empty!13431))

(assert (=> start!42568 tp!42049))

(assert (=> start!42568 true))

(declare-fun array_inv!10622 (array!30607) Bool)

(assert (=> start!42568 (array_inv!10622 _keys!1025)))

(declare-fun e!278806 () Bool)

(declare-fun array_inv!10623 (array!30605) Bool)

(assert (=> start!42568 (and (array_inv!10623 _values!833) e!278806)))

(declare-fun b!474922 () Bool)

(assert (=> b!474922 (= e!278806 (and e!278804 mapRes!21865))))

(declare-fun condMapEmpty!21865 () Bool)

(declare-fun mapDefault!21865 () ValueCell!6372)

(assert (=> b!474922 (= condMapEmpty!21865 (= (arr!14720 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6372)) mapDefault!21865)))))

(declare-fun b!474923 () Bool)

(assert (=> b!474923 (= e!278805 tp_is_empty!13431)))

(declare-fun b!474924 () Bool)

(declare-fun res!283637 () Bool)

(assert (=> b!474924 (=> (not res!283637) (not e!278807))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474924 (= res!283637 (and (= (size!15072 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15073 _keys!1025) (size!15072 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21865 () Bool)

(assert (=> mapIsEmpty!21865 mapRes!21865))

(declare-fun b!474925 () Bool)

(declare-fun res!283638 () Bool)

(assert (=> b!474925 (=> (not res!283638) (not e!278807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30607 (_ BitVec 32)) Bool)

(assert (=> b!474925 (= res!283638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474926 () Bool)

(assert (=> b!474926 (= e!278807 false)))

(declare-fun zeroValue!794 () V!19013)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19013)

(declare-datatypes ((tuple2!8918 0))(
  ( (tuple2!8919 (_1!4470 (_ BitVec 64)) (_2!4470 V!19013)) )
))
(declare-datatypes ((List!8994 0))(
  ( (Nil!8991) (Cons!8990 (h!9846 tuple2!8918) (t!14968 List!8994)) )
))
(declare-datatypes ((ListLongMap!7831 0))(
  ( (ListLongMap!7832 (toList!3931 List!8994)) )
))
(declare-fun lt!216329 () ListLongMap!7831)

(declare-fun getCurrentListMapNoExtraKeys!2088 (array!30607 array!30605 (_ BitVec 32) (_ BitVec 32) V!19013 V!19013 (_ BitVec 32) Int) ListLongMap!7831)

(assert (=> b!474926 (= lt!216329 (getCurrentListMapNoExtraKeys!2088 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19013)

(declare-fun lt!216328 () ListLongMap!7831)

(assert (=> b!474926 (= lt!216328 (getCurrentListMapNoExtraKeys!2088 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42568 res!283635) b!474924))

(assert (= (and b!474924 res!283637) b!474925))

(assert (= (and b!474925 res!283638) b!474921))

(assert (= (and b!474921 res!283636) b!474926))

(assert (= (and b!474922 condMapEmpty!21865) mapIsEmpty!21865))

(assert (= (and b!474922 (not condMapEmpty!21865)) mapNonEmpty!21865))

(get-info :version)

(assert (= (and mapNonEmpty!21865 ((_ is ValueCellFull!6372) mapValue!21865)) b!474923))

(assert (= (and b!474922 ((_ is ValueCellFull!6372) mapDefault!21865)) b!474920))

(assert (= start!42568 b!474922))

(declare-fun m!457223 () Bool)

(assert (=> b!474925 m!457223))

(declare-fun m!457225 () Bool)

(assert (=> b!474921 m!457225))

(declare-fun m!457227 () Bool)

(assert (=> mapNonEmpty!21865 m!457227))

(declare-fun m!457229 () Bool)

(assert (=> b!474926 m!457229))

(declare-fun m!457231 () Bool)

(assert (=> b!474926 m!457231))

(declare-fun m!457233 () Bool)

(assert (=> start!42568 m!457233))

(declare-fun m!457235 () Bool)

(assert (=> start!42568 m!457235))

(declare-fun m!457237 () Bool)

(assert (=> start!42568 m!457237))

(check-sat (not b!474925) b_and!20483 tp_is_empty!13431 (not b!474926) (not mapNonEmpty!21865) (not start!42568) (not b_next!12003) (not b!474921))
(check-sat b_and!20483 (not b_next!12003))
