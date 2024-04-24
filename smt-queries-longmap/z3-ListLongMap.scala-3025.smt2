; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42490 () Bool)

(assert start!42490)

(declare-fun b_free!11959 () Bool)

(declare-fun b_next!11959 () Bool)

(assert (=> start!42490 (= b_free!11959 (not b_next!11959))))

(declare-fun tp!41914 () Bool)

(declare-fun b_and!20437 () Bool)

(assert (=> start!42490 (= tp!41914 b_and!20437)))

(declare-fun res!283271 () Bool)

(declare-fun e!278307 () Bool)

(assert (=> start!42490 (=> (not res!283271) (not e!278307))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42490 (= res!283271 (validMask!0 mask!1365))))

(assert (=> start!42490 e!278307))

(declare-fun tp_is_empty!13387 () Bool)

(assert (=> start!42490 tp_is_empty!13387))

(assert (=> start!42490 tp!41914))

(assert (=> start!42490 true))

(declare-datatypes ((array!30500 0))(
  ( (array!30501 (arr!14668 (Array (_ BitVec 32) (_ BitVec 64))) (size!15020 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30500)

(declare-fun array_inv!10666 (array!30500) Bool)

(assert (=> start!42490 (array_inv!10666 _keys!1025)))

(declare-datatypes ((V!18955 0))(
  ( (V!18956 (val!6738 Int)) )
))
(declare-datatypes ((ValueCell!6350 0))(
  ( (ValueCellFull!6350 (v!9031 V!18955)) (EmptyCell!6350) )
))
(declare-datatypes ((array!30502 0))(
  ( (array!30503 (arr!14669 (Array (_ BitVec 32) ValueCell!6350)) (size!15021 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30502)

(declare-fun e!278306 () Bool)

(declare-fun array_inv!10667 (array!30502) Bool)

(assert (=> start!42490 (and (array_inv!10667 _values!833) e!278306)))

(declare-fun b!474200 () Bool)

(declare-fun res!283269 () Bool)

(assert (=> b!474200 (=> (not res!283269) (not e!278307))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474200 (= res!283269 (and (= (size!15021 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15020 _keys!1025) (size!15021 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474201 () Bool)

(declare-fun e!278308 () Bool)

(assert (=> b!474201 (= e!278308 true)))

(declare-datatypes ((tuple2!8806 0))(
  ( (tuple2!8807 (_1!4414 (_ BitVec 64)) (_2!4414 V!18955)) )
))
(declare-datatypes ((List!8868 0))(
  ( (Nil!8865) (Cons!8864 (h!9720 tuple2!8806) (t!14832 List!8868)) )
))
(declare-datatypes ((ListLongMap!7721 0))(
  ( (ListLongMap!7722 (toList!3876 List!8868)) )
))
(declare-fun lt!215954 () ListLongMap!7721)

(declare-fun lt!215948 () tuple2!8806)

(declare-fun minValueBefore!38 () V!18955)

(declare-fun +!1758 (ListLongMap!7721 tuple2!8806) ListLongMap!7721)

(assert (=> b!474201 (= (+!1758 lt!215954 lt!215948) (+!1758 (+!1758 lt!215954 (tuple2!8807 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215948))))

(declare-fun minValueAfter!38 () V!18955)

(assert (=> b!474201 (= lt!215948 (tuple2!8807 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13958 0))(
  ( (Unit!13959) )
))
(declare-fun lt!215949 () Unit!13958)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!160 (ListLongMap!7721 (_ BitVec 64) V!18955 V!18955) Unit!13958)

(assert (=> b!474201 (= lt!215949 (addSameAsAddTwiceSameKeyDiffValues!160 lt!215954 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215955 () ListLongMap!7721)

(declare-fun zeroValue!794 () V!18955)

(assert (=> b!474201 (= lt!215954 (+!1758 lt!215955 (tuple2!8807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215952 () ListLongMap!7721)

(declare-fun getCurrentListMap!2238 (array!30500 array!30502 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7721)

(assert (=> b!474201 (= lt!215952 (getCurrentListMap!2238 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215950 () ListLongMap!7721)

(assert (=> b!474201 (= lt!215950 (getCurrentListMap!2238 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474202 () Bool)

(declare-fun e!278311 () Bool)

(assert (=> b!474202 (= e!278311 tp_is_empty!13387)))

(declare-fun b!474203 () Bool)

(declare-fun res!283272 () Bool)

(assert (=> b!474203 (=> (not res!283272) (not e!278307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30500 (_ BitVec 32)) Bool)

(assert (=> b!474203 (= res!283272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21796 () Bool)

(declare-fun mapRes!21796 () Bool)

(assert (=> mapIsEmpty!21796 mapRes!21796))

(declare-fun b!474204 () Bool)

(assert (=> b!474204 (= e!278307 (not e!278308))))

(declare-fun res!283273 () Bool)

(assert (=> b!474204 (=> res!283273 e!278308)))

(assert (=> b!474204 (= res!283273 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215951 () ListLongMap!7721)

(assert (=> b!474204 (= lt!215955 lt!215951)))

(declare-fun lt!215953 () Unit!13958)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!245 (array!30500 array!30502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 V!18955 V!18955 (_ BitVec 32) Int) Unit!13958)

(assert (=> b!474204 (= lt!215953 (lemmaNoChangeToArrayThenSameMapNoExtras!245 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2085 (array!30500 array!30502 (_ BitVec 32) (_ BitVec 32) V!18955 V!18955 (_ BitVec 32) Int) ListLongMap!7721)

(assert (=> b!474204 (= lt!215951 (getCurrentListMapNoExtraKeys!2085 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474204 (= lt!215955 (getCurrentListMapNoExtraKeys!2085 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474205 () Bool)

(declare-fun res!283270 () Bool)

(assert (=> b!474205 (=> (not res!283270) (not e!278307))))

(declare-datatypes ((List!8869 0))(
  ( (Nil!8866) (Cons!8865 (h!9721 (_ BitVec 64)) (t!14833 List!8869)) )
))
(declare-fun arrayNoDuplicates!0 (array!30500 (_ BitVec 32) List!8869) Bool)

(assert (=> b!474205 (= res!283270 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8866))))

(declare-fun b!474206 () Bool)

(declare-fun e!278310 () Bool)

(assert (=> b!474206 (= e!278310 tp_is_empty!13387)))

(declare-fun b!474207 () Bool)

(assert (=> b!474207 (= e!278306 (and e!278310 mapRes!21796))))

(declare-fun condMapEmpty!21796 () Bool)

(declare-fun mapDefault!21796 () ValueCell!6350)

(assert (=> b!474207 (= condMapEmpty!21796 (= (arr!14669 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6350)) mapDefault!21796)))))

(declare-fun mapNonEmpty!21796 () Bool)

(declare-fun tp!41913 () Bool)

(assert (=> mapNonEmpty!21796 (= mapRes!21796 (and tp!41913 e!278311))))

(declare-fun mapRest!21796 () (Array (_ BitVec 32) ValueCell!6350))

(declare-fun mapKey!21796 () (_ BitVec 32))

(declare-fun mapValue!21796 () ValueCell!6350)

(assert (=> mapNonEmpty!21796 (= (arr!14669 _values!833) (store mapRest!21796 mapKey!21796 mapValue!21796))))

(assert (= (and start!42490 res!283271) b!474200))

(assert (= (and b!474200 res!283269) b!474203))

(assert (= (and b!474203 res!283272) b!474205))

(assert (= (and b!474205 res!283270) b!474204))

(assert (= (and b!474204 (not res!283273)) b!474201))

(assert (= (and b!474207 condMapEmpty!21796) mapIsEmpty!21796))

(assert (= (and b!474207 (not condMapEmpty!21796)) mapNonEmpty!21796))

(get-info :version)

(assert (= (and mapNonEmpty!21796 ((_ is ValueCellFull!6350) mapValue!21796)) b!474202))

(assert (= (and b!474207 ((_ is ValueCellFull!6350) mapDefault!21796)) b!474206))

(assert (= start!42490 b!474207))

(declare-fun m!456739 () Bool)

(assert (=> b!474201 m!456739))

(declare-fun m!456741 () Bool)

(assert (=> b!474201 m!456741))

(declare-fun m!456743 () Bool)

(assert (=> b!474201 m!456743))

(declare-fun m!456745 () Bool)

(assert (=> b!474201 m!456745))

(assert (=> b!474201 m!456745))

(declare-fun m!456747 () Bool)

(assert (=> b!474201 m!456747))

(declare-fun m!456749 () Bool)

(assert (=> b!474201 m!456749))

(declare-fun m!456751 () Bool)

(assert (=> b!474201 m!456751))

(declare-fun m!456753 () Bool)

(assert (=> start!42490 m!456753))

(declare-fun m!456755 () Bool)

(assert (=> start!42490 m!456755))

(declare-fun m!456757 () Bool)

(assert (=> start!42490 m!456757))

(declare-fun m!456759 () Bool)

(assert (=> b!474205 m!456759))

(declare-fun m!456761 () Bool)

(assert (=> mapNonEmpty!21796 m!456761))

(declare-fun m!456763 () Bool)

(assert (=> b!474203 m!456763))

(declare-fun m!456765 () Bool)

(assert (=> b!474204 m!456765))

(declare-fun m!456767 () Bool)

(assert (=> b!474204 m!456767))

(declare-fun m!456769 () Bool)

(assert (=> b!474204 m!456769))

(check-sat tp_is_empty!13387 (not start!42490) (not b_next!11959) (not b!474203) (not b!474205) b_and!20437 (not mapNonEmpty!21796) (not b!474204) (not b!474201))
(check-sat b_and!20437 (not b_next!11959))
