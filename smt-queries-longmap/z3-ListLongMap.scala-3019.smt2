; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42470 () Bool)

(assert start!42470)

(declare-fun b_free!11925 () Bool)

(declare-fun b_next!11925 () Bool)

(assert (=> start!42470 (= b_free!11925 (not b_next!11925))))

(declare-fun tp!41811 () Bool)

(declare-fun b_and!20393 () Bool)

(assert (=> start!42470 (= tp!41811 b_and!20393)))

(declare-fun res!283021 () Bool)

(declare-fun e!278041 () Bool)

(assert (=> start!42470 (=> (not res!283021) (not e!278041))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42470 (= res!283021 (validMask!0 mask!1365))))

(assert (=> start!42470 e!278041))

(declare-fun tp_is_empty!13353 () Bool)

(assert (=> start!42470 tp_is_empty!13353))

(assert (=> start!42470 tp!41811))

(assert (=> start!42470 true))

(declare-datatypes ((array!30463 0))(
  ( (array!30464 (arr!14650 (Array (_ BitVec 32) (_ BitVec 64))) (size!15002 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30463)

(declare-fun array_inv!10568 (array!30463) Bool)

(assert (=> start!42470 (array_inv!10568 _keys!1025)))

(declare-datatypes ((V!18909 0))(
  ( (V!18910 (val!6721 Int)) )
))
(declare-datatypes ((ValueCell!6333 0))(
  ( (ValueCellFull!6333 (v!9013 V!18909)) (EmptyCell!6333) )
))
(declare-datatypes ((array!30465 0))(
  ( (array!30466 (arr!14651 (Array (_ BitVec 32) ValueCell!6333)) (size!15003 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30465)

(declare-fun e!278039 () Bool)

(declare-fun array_inv!10569 (array!30465) Bool)

(assert (=> start!42470 (and (array_inv!10569 _values!833) e!278039)))

(declare-fun mapNonEmpty!21745 () Bool)

(declare-fun mapRes!21745 () Bool)

(declare-fun tp!41812 () Bool)

(declare-fun e!278042 () Bool)

(assert (=> mapNonEmpty!21745 (= mapRes!21745 (and tp!41812 e!278042))))

(declare-fun mapValue!21745 () ValueCell!6333)

(declare-fun mapKey!21745 () (_ BitVec 32))

(declare-fun mapRest!21745 () (Array (_ BitVec 32) ValueCell!6333))

(assert (=> mapNonEmpty!21745 (= (arr!14651 _values!833) (store mapRest!21745 mapKey!21745 mapValue!21745))))

(declare-fun b!473853 () Bool)

(declare-fun e!278040 () Bool)

(assert (=> b!473853 (= e!278040 tp_is_empty!13353)))

(declare-fun b!473854 () Bool)

(declare-fun e!278043 () Bool)

(assert (=> b!473854 (= e!278041 (not e!278043))))

(declare-fun res!283022 () Bool)

(assert (=> b!473854 (=> res!283022 e!278043)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473854 (= res!283022 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8860 0))(
  ( (tuple2!8861 (_1!4441 (_ BitVec 64)) (_2!4441 V!18909)) )
))
(declare-datatypes ((List!8939 0))(
  ( (Nil!8936) (Cons!8935 (h!9791 tuple2!8860) (t!14911 List!8939)) )
))
(declare-datatypes ((ListLongMap!7773 0))(
  ( (ListLongMap!7774 (toList!3902 List!8939)) )
))
(declare-fun lt!215529 () ListLongMap!7773)

(declare-fun lt!215535 () ListLongMap!7773)

(assert (=> b!473854 (= lt!215529 lt!215535)))

(declare-datatypes ((Unit!13962 0))(
  ( (Unit!13963) )
))
(declare-fun lt!215533 () Unit!13962)

(declare-fun minValueBefore!38 () V!18909)

(declare-fun zeroValue!794 () V!18909)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18909)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!241 (array!30463 array!30465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18909 V!18909 V!18909 V!18909 (_ BitVec 32) Int) Unit!13962)

(assert (=> b!473854 (= lt!215533 (lemmaNoChangeToArrayThenSameMapNoExtras!241 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2061 (array!30463 array!30465 (_ BitVec 32) (_ BitVec 32) V!18909 V!18909 (_ BitVec 32) Int) ListLongMap!7773)

(assert (=> b!473854 (= lt!215535 (getCurrentListMapNoExtraKeys!2061 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473854 (= lt!215529 (getCurrentListMapNoExtraKeys!2061 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473855 () Bool)

(assert (=> b!473855 (= e!278042 tp_is_empty!13353)))

(declare-fun b!473856 () Bool)

(assert (=> b!473856 (= e!278043 true)))

(declare-fun lt!215532 () ListLongMap!7773)

(declare-fun lt!215530 () tuple2!8860)

(declare-fun +!1737 (ListLongMap!7773 tuple2!8860) ListLongMap!7773)

(assert (=> b!473856 (= (+!1737 lt!215532 lt!215530) (+!1737 (+!1737 lt!215532 (tuple2!8861 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215530))))

(assert (=> b!473856 (= lt!215530 (tuple2!8861 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215528 () Unit!13962)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!146 (ListLongMap!7773 (_ BitVec 64) V!18909 V!18909) Unit!13962)

(assert (=> b!473856 (= lt!215528 (addSameAsAddTwiceSameKeyDiffValues!146 lt!215532 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473856 (= lt!215532 (+!1737 lt!215529 (tuple2!8861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215531 () ListLongMap!7773)

(declare-fun getCurrentListMap!2266 (array!30463 array!30465 (_ BitVec 32) (_ BitVec 32) V!18909 V!18909 (_ BitVec 32) Int) ListLongMap!7773)

(assert (=> b!473856 (= lt!215531 (getCurrentListMap!2266 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215534 () ListLongMap!7773)

(assert (=> b!473856 (= lt!215534 (getCurrentListMap!2266 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473857 () Bool)

(assert (=> b!473857 (= e!278039 (and e!278040 mapRes!21745))))

(declare-fun condMapEmpty!21745 () Bool)

(declare-fun mapDefault!21745 () ValueCell!6333)

(assert (=> b!473857 (= condMapEmpty!21745 (= (arr!14651 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6333)) mapDefault!21745)))))

(declare-fun b!473858 () Bool)

(declare-fun res!283025 () Bool)

(assert (=> b!473858 (=> (not res!283025) (not e!278041))))

(assert (=> b!473858 (= res!283025 (and (= (size!15003 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15002 _keys!1025) (size!15003 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473859 () Bool)

(declare-fun res!283023 () Bool)

(assert (=> b!473859 (=> (not res!283023) (not e!278041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30463 (_ BitVec 32)) Bool)

(assert (=> b!473859 (= res!283023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473860 () Bool)

(declare-fun res!283024 () Bool)

(assert (=> b!473860 (=> (not res!283024) (not e!278041))))

(declare-datatypes ((List!8940 0))(
  ( (Nil!8937) (Cons!8936 (h!9792 (_ BitVec 64)) (t!14912 List!8940)) )
))
(declare-fun arrayNoDuplicates!0 (array!30463 (_ BitVec 32) List!8940) Bool)

(assert (=> b!473860 (= res!283024 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8937))))

(declare-fun mapIsEmpty!21745 () Bool)

(assert (=> mapIsEmpty!21745 mapRes!21745))

(assert (= (and start!42470 res!283021) b!473858))

(assert (= (and b!473858 res!283025) b!473859))

(assert (= (and b!473859 res!283023) b!473860))

(assert (= (and b!473860 res!283024) b!473854))

(assert (= (and b!473854 (not res!283022)) b!473856))

(assert (= (and b!473857 condMapEmpty!21745) mapIsEmpty!21745))

(assert (= (and b!473857 (not condMapEmpty!21745)) mapNonEmpty!21745))

(get-info :version)

(assert (= (and mapNonEmpty!21745 ((_ is ValueCellFull!6333) mapValue!21745)) b!473855))

(assert (= (and b!473857 ((_ is ValueCellFull!6333) mapDefault!21745)) b!473853))

(assert (= start!42470 b!473857))

(declare-fun m!456013 () Bool)

(assert (=> b!473860 m!456013))

(declare-fun m!456015 () Bool)

(assert (=> start!42470 m!456015))

(declare-fun m!456017 () Bool)

(assert (=> start!42470 m!456017))

(declare-fun m!456019 () Bool)

(assert (=> start!42470 m!456019))

(declare-fun m!456021 () Bool)

(assert (=> mapNonEmpty!21745 m!456021))

(declare-fun m!456023 () Bool)

(assert (=> b!473856 m!456023))

(declare-fun m!456025 () Bool)

(assert (=> b!473856 m!456025))

(declare-fun m!456027 () Bool)

(assert (=> b!473856 m!456027))

(declare-fun m!456029 () Bool)

(assert (=> b!473856 m!456029))

(assert (=> b!473856 m!456025))

(declare-fun m!456031 () Bool)

(assert (=> b!473856 m!456031))

(declare-fun m!456033 () Bool)

(assert (=> b!473856 m!456033))

(declare-fun m!456035 () Bool)

(assert (=> b!473856 m!456035))

(declare-fun m!456037 () Bool)

(assert (=> b!473854 m!456037))

(declare-fun m!456039 () Bool)

(assert (=> b!473854 m!456039))

(declare-fun m!456041 () Bool)

(assert (=> b!473854 m!456041))

(declare-fun m!456043 () Bool)

(assert (=> b!473859 m!456043))

(check-sat b_and!20393 (not start!42470) tp_is_empty!13353 (not b_next!11925) (not b!473859) (not b!473854) (not mapNonEmpty!21745) (not b!473856) (not b!473860))
(check-sat b_and!20393 (not b_next!11925))
