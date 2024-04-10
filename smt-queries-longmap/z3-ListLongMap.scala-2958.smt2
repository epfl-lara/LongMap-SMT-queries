; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41986 () Bool)

(assert start!41986)

(declare-fun b_free!11559 () Bool)

(declare-fun b_next!11559 () Bool)

(assert (=> start!41986 (= b_free!11559 (not b_next!11559))))

(declare-fun tp!40693 () Bool)

(declare-fun b_and!19957 () Bool)

(assert (=> start!41986 (= tp!40693 b_and!19957)))

(declare-fun b!468762 () Bool)

(declare-fun e!274393 () Bool)

(assert (=> b!468762 (= e!274393 true)))

(declare-datatypes ((V!18421 0))(
  ( (V!18422 (val!6538 Int)) )
))
(declare-datatypes ((tuple2!8598 0))(
  ( (tuple2!8599 (_1!4310 (_ BitVec 64)) (_2!4310 V!18421)) )
))
(declare-datatypes ((List!8682 0))(
  ( (Nil!8679) (Cons!8678 (h!9534 tuple2!8598) (t!14640 List!8682)) )
))
(declare-datatypes ((ListLongMap!7511 0))(
  ( (ListLongMap!7512 (toList!3771 List!8682)) )
))
(declare-fun lt!212126 () ListLongMap!7511)

(declare-fun lt!212127 () tuple2!8598)

(declare-fun minValueBefore!38 () V!18421)

(declare-fun +!1682 (ListLongMap!7511 tuple2!8598) ListLongMap!7511)

(assert (=> b!468762 (= (+!1682 lt!212126 lt!212127) (+!1682 (+!1682 lt!212126 (tuple2!8599 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212127))))

(declare-fun minValueAfter!38 () V!18421)

(assert (=> b!468762 (= lt!212127 (tuple2!8599 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13697 0))(
  ( (Unit!13698) )
))
(declare-fun lt!212128 () Unit!13697)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!95 (ListLongMap!7511 (_ BitVec 64) V!18421 V!18421) Unit!13697)

(assert (=> b!468762 (= lt!212128 (addSameAsAddTwiceSameKeyDiffValues!95 lt!212126 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18421)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212122 () ListLongMap!7511)

(declare-datatypes ((array!29749 0))(
  ( (array!29750 (arr!14300 (Array (_ BitVec 32) (_ BitVec 64))) (size!14652 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29749)

(declare-datatypes ((ValueCell!6150 0))(
  ( (ValueCellFull!6150 (v!8827 V!18421)) (EmptyCell!6150) )
))
(declare-datatypes ((array!29751 0))(
  ( (array!29752 (arr!14301 (Array (_ BitVec 32) ValueCell!6150)) (size!14653 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29751)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2196 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) V!18421 V!18421 (_ BitVec 32) Int) ListLongMap!7511)

(assert (=> b!468762 (= lt!212122 (getCurrentListMap!2196 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212125 () ListLongMap!7511)

(assert (=> b!468762 (= lt!212125 (getCurrentListMap!2196 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468763 () Bool)

(declare-fun e!274392 () Bool)

(declare-fun tp_is_empty!12987 () Bool)

(assert (=> b!468763 (= e!274392 tp_is_empty!12987)))

(declare-fun res!280136 () Bool)

(declare-fun e!274395 () Bool)

(assert (=> start!41986 (=> (not res!280136) (not e!274395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41986 (= res!280136 (validMask!0 mask!1365))))

(assert (=> start!41986 e!274395))

(assert (=> start!41986 tp_is_empty!12987))

(assert (=> start!41986 tp!40693))

(assert (=> start!41986 true))

(declare-fun array_inv!10322 (array!29749) Bool)

(assert (=> start!41986 (array_inv!10322 _keys!1025)))

(declare-fun e!274394 () Bool)

(declare-fun array_inv!10323 (array!29751) Bool)

(assert (=> start!41986 (and (array_inv!10323 _values!833) e!274394)))

(declare-fun b!468764 () Bool)

(assert (=> b!468764 (= e!274395 (not e!274393))))

(declare-fun res!280137 () Bool)

(assert (=> b!468764 (=> res!280137 e!274393)))

(assert (=> b!468764 (= res!280137 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212123 () ListLongMap!7511)

(assert (=> b!468764 (= lt!212126 lt!212123)))

(declare-fun lt!212124 () Unit!13697)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!121 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18421 V!18421 V!18421 V!18421 (_ BitVec 32) Int) Unit!13697)

(assert (=> b!468764 (= lt!212124 (lemmaNoChangeToArrayThenSameMapNoExtras!121 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1941 (array!29749 array!29751 (_ BitVec 32) (_ BitVec 32) V!18421 V!18421 (_ BitVec 32) Int) ListLongMap!7511)

(assert (=> b!468764 (= lt!212123 (getCurrentListMapNoExtraKeys!1941 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468764 (= lt!212126 (getCurrentListMapNoExtraKeys!1941 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21175 () Bool)

(declare-fun mapRes!21175 () Bool)

(assert (=> mapIsEmpty!21175 mapRes!21175))

(declare-fun b!468765 () Bool)

(declare-fun res!280135 () Bool)

(assert (=> b!468765 (=> (not res!280135) (not e!274395))))

(declare-datatypes ((List!8683 0))(
  ( (Nil!8680) (Cons!8679 (h!9535 (_ BitVec 64)) (t!14641 List!8683)) )
))
(declare-fun arrayNoDuplicates!0 (array!29749 (_ BitVec 32) List!8683) Bool)

(assert (=> b!468765 (= res!280135 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8680))))

(declare-fun b!468766 () Bool)

(declare-fun res!280138 () Bool)

(assert (=> b!468766 (=> (not res!280138) (not e!274395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29749 (_ BitVec 32)) Bool)

(assert (=> b!468766 (= res!280138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21175 () Bool)

(declare-fun tp!40692 () Bool)

(assert (=> mapNonEmpty!21175 (= mapRes!21175 (and tp!40692 e!274392))))

(declare-fun mapValue!21175 () ValueCell!6150)

(declare-fun mapKey!21175 () (_ BitVec 32))

(declare-fun mapRest!21175 () (Array (_ BitVec 32) ValueCell!6150))

(assert (=> mapNonEmpty!21175 (= (arr!14301 _values!833) (store mapRest!21175 mapKey!21175 mapValue!21175))))

(declare-fun b!468767 () Bool)

(declare-fun e!274397 () Bool)

(assert (=> b!468767 (= e!274397 tp_is_empty!12987)))

(declare-fun b!468768 () Bool)

(assert (=> b!468768 (= e!274394 (and e!274397 mapRes!21175))))

(declare-fun condMapEmpty!21175 () Bool)

(declare-fun mapDefault!21175 () ValueCell!6150)

(assert (=> b!468768 (= condMapEmpty!21175 (= (arr!14301 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6150)) mapDefault!21175)))))

(declare-fun b!468769 () Bool)

(declare-fun res!280139 () Bool)

(assert (=> b!468769 (=> (not res!280139) (not e!274395))))

(assert (=> b!468769 (= res!280139 (and (= (size!14653 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14652 _keys!1025) (size!14653 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41986 res!280136) b!468769))

(assert (= (and b!468769 res!280139) b!468766))

(assert (= (and b!468766 res!280138) b!468765))

(assert (= (and b!468765 res!280135) b!468764))

(assert (= (and b!468764 (not res!280137)) b!468762))

(assert (= (and b!468768 condMapEmpty!21175) mapIsEmpty!21175))

(assert (= (and b!468768 (not condMapEmpty!21175)) mapNonEmpty!21175))

(get-info :version)

(assert (= (and mapNonEmpty!21175 ((_ is ValueCellFull!6150) mapValue!21175)) b!468763))

(assert (= (and b!468768 ((_ is ValueCellFull!6150) mapDefault!21175)) b!468767))

(assert (= start!41986 b!468768))

(declare-fun m!450781 () Bool)

(assert (=> mapNonEmpty!21175 m!450781))

(declare-fun m!450783 () Bool)

(assert (=> b!468765 m!450783))

(declare-fun m!450785 () Bool)

(assert (=> start!41986 m!450785))

(declare-fun m!450787 () Bool)

(assert (=> start!41986 m!450787))

(declare-fun m!450789 () Bool)

(assert (=> start!41986 m!450789))

(declare-fun m!450791 () Bool)

(assert (=> b!468762 m!450791))

(declare-fun m!450793 () Bool)

(assert (=> b!468762 m!450793))

(declare-fun m!450795 () Bool)

(assert (=> b!468762 m!450795))

(assert (=> b!468762 m!450791))

(declare-fun m!450797 () Bool)

(assert (=> b!468762 m!450797))

(declare-fun m!450799 () Bool)

(assert (=> b!468762 m!450799))

(declare-fun m!450801 () Bool)

(assert (=> b!468762 m!450801))

(declare-fun m!450803 () Bool)

(assert (=> b!468764 m!450803))

(declare-fun m!450805 () Bool)

(assert (=> b!468764 m!450805))

(declare-fun m!450807 () Bool)

(assert (=> b!468764 m!450807))

(declare-fun m!450809 () Bool)

(assert (=> b!468766 m!450809))

(check-sat (not mapNonEmpty!21175) tp_is_empty!12987 (not b!468766) (not b!468765) (not start!41986) (not b!468762) (not b!468764) (not b_next!11559) b_and!19957)
(check-sat b_and!19957 (not b_next!11559))
