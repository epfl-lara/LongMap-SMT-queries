; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42464 () Bool)

(assert start!42464)

(declare-fun b_free!11919 () Bool)

(declare-fun b_next!11919 () Bool)

(assert (=> start!42464 (= b_free!11919 (not b_next!11919))))

(declare-fun tp!41793 () Bool)

(declare-fun b_and!20387 () Bool)

(assert (=> start!42464 (= tp!41793 b_and!20387)))

(declare-fun mapIsEmpty!21736 () Bool)

(declare-fun mapRes!21736 () Bool)

(assert (=> mapIsEmpty!21736 mapRes!21736))

(declare-fun b!473781 () Bool)

(declare-fun res!282980 () Bool)

(declare-fun e!277989 () Bool)

(assert (=> b!473781 (=> (not res!282980) (not e!277989))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30451 0))(
  ( (array!30452 (arr!14644 (Array (_ BitVec 32) (_ BitVec 64))) (size!14996 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30451)

(declare-datatypes ((V!18901 0))(
  ( (V!18902 (val!6718 Int)) )
))
(declare-datatypes ((ValueCell!6330 0))(
  ( (ValueCellFull!6330 (v!9010 V!18901)) (EmptyCell!6330) )
))
(declare-datatypes ((array!30453 0))(
  ( (array!30454 (arr!14645 (Array (_ BitVec 32) ValueCell!6330)) (size!14997 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30453)

(assert (=> b!473781 (= res!282980 (and (= (size!14997 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14996 _keys!1025) (size!14997 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473782 () Bool)

(declare-fun e!277988 () Bool)

(declare-fun tp_is_empty!13347 () Bool)

(assert (=> b!473782 (= e!277988 tp_is_empty!13347)))

(declare-fun b!473783 () Bool)

(declare-fun res!282978 () Bool)

(assert (=> b!473783 (=> (not res!282978) (not e!277989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30451 (_ BitVec 32)) Bool)

(assert (=> b!473783 (= res!282978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473784 () Bool)

(declare-fun res!282976 () Bool)

(assert (=> b!473784 (=> (not res!282976) (not e!277989))))

(declare-datatypes ((List!8935 0))(
  ( (Nil!8932) (Cons!8931 (h!9787 (_ BitVec 64)) (t!14907 List!8935)) )
))
(declare-fun arrayNoDuplicates!0 (array!30451 (_ BitVec 32) List!8935) Bool)

(assert (=> b!473784 (= res!282976 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8932))))

(declare-fun b!473785 () Bool)

(declare-fun e!277990 () Bool)

(assert (=> b!473785 (= e!277990 tp_is_empty!13347)))

(declare-fun res!282979 () Bool)

(assert (=> start!42464 (=> (not res!282979) (not e!277989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42464 (= res!282979 (validMask!0 mask!1365))))

(assert (=> start!42464 e!277989))

(assert (=> start!42464 tp_is_empty!13347))

(assert (=> start!42464 tp!41793))

(assert (=> start!42464 true))

(declare-fun array_inv!10566 (array!30451) Bool)

(assert (=> start!42464 (array_inv!10566 _keys!1025)))

(declare-fun e!277986 () Bool)

(declare-fun array_inv!10567 (array!30453) Bool)

(assert (=> start!42464 (and (array_inv!10567 _values!833) e!277986)))

(declare-fun b!473786 () Bool)

(assert (=> b!473786 (= e!277986 (and e!277990 mapRes!21736))))

(declare-fun condMapEmpty!21736 () Bool)

(declare-fun mapDefault!21736 () ValueCell!6330)

(assert (=> b!473786 (= condMapEmpty!21736 (= (arr!14645 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6330)) mapDefault!21736)))))

(declare-fun b!473787 () Bool)

(declare-fun e!277985 () Bool)

(assert (=> b!473787 (= e!277985 true)))

(declare-datatypes ((tuple2!8854 0))(
  ( (tuple2!8855 (_1!4438 (_ BitVec 64)) (_2!4438 V!18901)) )
))
(declare-datatypes ((List!8936 0))(
  ( (Nil!8933) (Cons!8932 (h!9788 tuple2!8854) (t!14908 List!8936)) )
))
(declare-datatypes ((ListLongMap!7767 0))(
  ( (ListLongMap!7768 (toList!3899 List!8936)) )
))
(declare-fun lt!215456 () ListLongMap!7767)

(declare-fun lt!215460 () tuple2!8854)

(declare-fun minValueBefore!38 () V!18901)

(declare-fun +!1735 (ListLongMap!7767 tuple2!8854) ListLongMap!7767)

(assert (=> b!473787 (= (+!1735 lt!215456 lt!215460) (+!1735 (+!1735 lt!215456 (tuple2!8855 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215460))))

(declare-fun minValueAfter!38 () V!18901)

(assert (=> b!473787 (= lt!215460 (tuple2!8855 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13956 0))(
  ( (Unit!13957) )
))
(declare-fun lt!215461 () Unit!13956)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!144 (ListLongMap!7767 (_ BitVec 64) V!18901 V!18901) Unit!13956)

(assert (=> b!473787 (= lt!215461 (addSameAsAddTwiceSameKeyDiffValues!144 lt!215456 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215463 () ListLongMap!7767)

(declare-fun zeroValue!794 () V!18901)

(assert (=> b!473787 (= lt!215456 (+!1735 lt!215463 (tuple2!8855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215459 () ListLongMap!7767)

(declare-fun getCurrentListMap!2264 (array!30451 array!30453 (_ BitVec 32) (_ BitVec 32) V!18901 V!18901 (_ BitVec 32) Int) ListLongMap!7767)

(assert (=> b!473787 (= lt!215459 (getCurrentListMap!2264 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215457 () ListLongMap!7767)

(assert (=> b!473787 (= lt!215457 (getCurrentListMap!2264 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473788 () Bool)

(assert (=> b!473788 (= e!277989 (not e!277985))))

(declare-fun res!282977 () Bool)

(assert (=> b!473788 (=> res!282977 e!277985)))

(assert (=> b!473788 (= res!282977 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215462 () ListLongMap!7767)

(assert (=> b!473788 (= lt!215463 lt!215462)))

(declare-fun lt!215458 () Unit!13956)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!239 (array!30451 array!30453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18901 V!18901 V!18901 V!18901 (_ BitVec 32) Int) Unit!13956)

(assert (=> b!473788 (= lt!215458 (lemmaNoChangeToArrayThenSameMapNoExtras!239 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2059 (array!30451 array!30453 (_ BitVec 32) (_ BitVec 32) V!18901 V!18901 (_ BitVec 32) Int) ListLongMap!7767)

(assert (=> b!473788 (= lt!215462 (getCurrentListMapNoExtraKeys!2059 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473788 (= lt!215463 (getCurrentListMapNoExtraKeys!2059 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21736 () Bool)

(declare-fun tp!41794 () Bool)

(assert (=> mapNonEmpty!21736 (= mapRes!21736 (and tp!41794 e!277988))))

(declare-fun mapKey!21736 () (_ BitVec 32))

(declare-fun mapValue!21736 () ValueCell!6330)

(declare-fun mapRest!21736 () (Array (_ BitVec 32) ValueCell!6330))

(assert (=> mapNonEmpty!21736 (= (arr!14645 _values!833) (store mapRest!21736 mapKey!21736 mapValue!21736))))

(assert (= (and start!42464 res!282979) b!473781))

(assert (= (and b!473781 res!282980) b!473783))

(assert (= (and b!473783 res!282978) b!473784))

(assert (= (and b!473784 res!282976) b!473788))

(assert (= (and b!473788 (not res!282977)) b!473787))

(assert (= (and b!473786 condMapEmpty!21736) mapIsEmpty!21736))

(assert (= (and b!473786 (not condMapEmpty!21736)) mapNonEmpty!21736))

(get-info :version)

(assert (= (and mapNonEmpty!21736 ((_ is ValueCellFull!6330) mapValue!21736)) b!473782))

(assert (= (and b!473786 ((_ is ValueCellFull!6330) mapDefault!21736)) b!473785))

(assert (= start!42464 b!473786))

(declare-fun m!455917 () Bool)

(assert (=> start!42464 m!455917))

(declare-fun m!455919 () Bool)

(assert (=> start!42464 m!455919))

(declare-fun m!455921 () Bool)

(assert (=> start!42464 m!455921))

(declare-fun m!455923 () Bool)

(assert (=> b!473783 m!455923))

(declare-fun m!455925 () Bool)

(assert (=> mapNonEmpty!21736 m!455925))

(declare-fun m!455927 () Bool)

(assert (=> b!473788 m!455927))

(declare-fun m!455929 () Bool)

(assert (=> b!473788 m!455929))

(declare-fun m!455931 () Bool)

(assert (=> b!473788 m!455931))

(declare-fun m!455933 () Bool)

(assert (=> b!473784 m!455933))

(declare-fun m!455935 () Bool)

(assert (=> b!473787 m!455935))

(declare-fun m!455937 () Bool)

(assert (=> b!473787 m!455937))

(declare-fun m!455939 () Bool)

(assert (=> b!473787 m!455939))

(assert (=> b!473787 m!455935))

(declare-fun m!455941 () Bool)

(assert (=> b!473787 m!455941))

(declare-fun m!455943 () Bool)

(assert (=> b!473787 m!455943))

(declare-fun m!455945 () Bool)

(assert (=> b!473787 m!455945))

(declare-fun m!455947 () Bool)

(assert (=> b!473787 m!455947))

(check-sat (not b!473787) (not b!473788) tp_is_empty!13347 (not start!42464) (not b!473784) b_and!20387 (not b_next!11919) (not b!473783) (not mapNonEmpty!21736))
(check-sat b_and!20387 (not b_next!11919))
