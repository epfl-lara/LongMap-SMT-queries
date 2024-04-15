; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42582 () Bool)

(assert start!42582)

(declare-fun b_free!12031 () Bool)

(declare-fun b_next!12031 () Bool)

(assert (=> start!42582 (= b_free!12031 (not b_next!12031))))

(declare-fun tp!42132 () Bool)

(declare-fun b_and!20485 () Bool)

(assert (=> start!42582 (= tp!42132 b_and!20485)))

(declare-fun b!474943 () Bool)

(declare-fun e!278843 () Bool)

(declare-fun tp_is_empty!13459 () Bool)

(assert (=> b!474943 (= e!278843 tp_is_empty!13459)))

(declare-fun b!474944 () Bool)

(declare-fun res!283676 () Bool)

(declare-fun e!278841 () Bool)

(assert (=> b!474944 (=> (not res!283676) (not e!278841))))

(declare-datatypes ((array!30647 0))(
  ( (array!30648 (arr!14741 (Array (_ BitVec 32) (_ BitVec 64))) (size!15094 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30647)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30647 (_ BitVec 32)) Bool)

(assert (=> b!474944 (= res!283676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474945 () Bool)

(declare-fun res!283674 () Bool)

(assert (=> b!474945 (=> (not res!283674) (not e!278841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!19051 0))(
  ( (V!19052 (val!6774 Int)) )
))
(declare-datatypes ((ValueCell!6386 0))(
  ( (ValueCellFull!6386 (v!9061 V!19051)) (EmptyCell!6386) )
))
(declare-datatypes ((array!30649 0))(
  ( (array!30650 (arr!14742 (Array (_ BitVec 32) ValueCell!6386)) (size!15095 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30649)

(assert (=> b!474945 (= res!283674 (and (= (size!15095 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15094 _keys!1025) (size!15095 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283675 () Bool)

(assert (=> start!42582 (=> (not res!283675) (not e!278841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42582 (= res!283675 (validMask!0 mask!1365))))

(assert (=> start!42582 e!278841))

(assert (=> start!42582 tp_is_empty!13459))

(assert (=> start!42582 tp!42132))

(assert (=> start!42582 true))

(declare-fun array_inv!10720 (array!30647) Bool)

(assert (=> start!42582 (array_inv!10720 _keys!1025)))

(declare-fun e!278842 () Bool)

(declare-fun array_inv!10721 (array!30649) Bool)

(assert (=> start!42582 (and (array_inv!10721 _values!833) e!278842)))

(declare-fun b!474946 () Bool)

(declare-fun mapRes!21907 () Bool)

(assert (=> b!474946 (= e!278842 (and e!278843 mapRes!21907))))

(declare-fun condMapEmpty!21907 () Bool)

(declare-fun mapDefault!21907 () ValueCell!6386)

(assert (=> b!474946 (= condMapEmpty!21907 (= (arr!14742 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6386)) mapDefault!21907)))))

(declare-fun mapIsEmpty!21907 () Bool)

(assert (=> mapIsEmpty!21907 mapRes!21907))

(declare-fun b!474947 () Bool)

(declare-fun e!278840 () Bool)

(assert (=> b!474947 (= e!278840 tp_is_empty!13459)))

(declare-fun mapNonEmpty!21907 () Bool)

(declare-fun tp!42133 () Bool)

(assert (=> mapNonEmpty!21907 (= mapRes!21907 (and tp!42133 e!278840))))

(declare-fun mapKey!21907 () (_ BitVec 32))

(declare-fun mapRest!21907 () (Array (_ BitVec 32) ValueCell!6386))

(declare-fun mapValue!21907 () ValueCell!6386)

(assert (=> mapNonEmpty!21907 (= (arr!14742 _values!833) (store mapRest!21907 mapKey!21907 mapValue!21907))))

(declare-fun b!474948 () Bool)

(assert (=> b!474948 (= e!278841 false)))

(declare-datatypes ((tuple2!8992 0))(
  ( (tuple2!8993 (_1!4507 (_ BitVec 64)) (_2!4507 V!19051)) )
))
(declare-datatypes ((List!9053 0))(
  ( (Nil!9050) (Cons!9049 (h!9905 tuple2!8992) (t!15018 List!9053)) )
))
(declare-datatypes ((ListLongMap!7895 0))(
  ( (ListLongMap!7896 (toList!3963 List!9053)) )
))
(declare-fun lt!216179 () ListLongMap!7895)

(declare-fun zeroValue!794 () V!19051)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19051)

(declare-fun getCurrentListMapNoExtraKeys!2130 (array!30647 array!30649 (_ BitVec 32) (_ BitVec 32) V!19051 V!19051 (_ BitVec 32) Int) ListLongMap!7895)

(assert (=> b!474948 (= lt!216179 (getCurrentListMapNoExtraKeys!2130 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19051)

(declare-fun lt!216178 () ListLongMap!7895)

(assert (=> b!474948 (= lt!216178 (getCurrentListMapNoExtraKeys!2130 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474949 () Bool)

(declare-fun res!283677 () Bool)

(assert (=> b!474949 (=> (not res!283677) (not e!278841))))

(declare-datatypes ((List!9054 0))(
  ( (Nil!9051) (Cons!9050 (h!9906 (_ BitVec 64)) (t!15019 List!9054)) )
))
(declare-fun arrayNoDuplicates!0 (array!30647 (_ BitVec 32) List!9054) Bool)

(assert (=> b!474949 (= res!283677 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9051))))

(assert (= (and start!42582 res!283675) b!474945))

(assert (= (and b!474945 res!283674) b!474944))

(assert (= (and b!474944 res!283676) b!474949))

(assert (= (and b!474949 res!283677) b!474948))

(assert (= (and b!474946 condMapEmpty!21907) mapIsEmpty!21907))

(assert (= (and b!474946 (not condMapEmpty!21907)) mapNonEmpty!21907))

(get-info :version)

(assert (= (and mapNonEmpty!21907 ((_ is ValueCellFull!6386) mapValue!21907)) b!474947))

(assert (= (and b!474946 ((_ is ValueCellFull!6386) mapDefault!21907)) b!474943))

(assert (= start!42582 b!474946))

(declare-fun m!456713 () Bool)

(assert (=> mapNonEmpty!21907 m!456713))

(declare-fun m!456715 () Bool)

(assert (=> b!474949 m!456715))

(declare-fun m!456717 () Bool)

(assert (=> b!474948 m!456717))

(declare-fun m!456719 () Bool)

(assert (=> b!474948 m!456719))

(declare-fun m!456721 () Bool)

(assert (=> start!42582 m!456721))

(declare-fun m!456723 () Bool)

(assert (=> start!42582 m!456723))

(declare-fun m!456725 () Bool)

(assert (=> start!42582 m!456725))

(declare-fun m!456727 () Bool)

(assert (=> b!474944 m!456727))

(check-sat tp_is_empty!13459 (not b!474944) (not mapNonEmpty!21907) (not start!42582) (not b_next!12031) (not b!474948) (not b!474949) b_and!20485)
(check-sat b_and!20485 (not b_next!12031))
