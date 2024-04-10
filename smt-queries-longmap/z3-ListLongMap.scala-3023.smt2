; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42494 () Bool)

(assert start!42494)

(declare-fun b_free!11949 () Bool)

(declare-fun b_next!11949 () Bool)

(assert (=> start!42494 (= b_free!11949 (not b_next!11949))))

(declare-fun tp!41884 () Bool)

(declare-fun b_and!20417 () Bool)

(assert (=> start!42494 (= tp!41884 b_and!20417)))

(declare-fun b!474141 () Bool)

(declare-fun e!278255 () Bool)

(declare-fun tp_is_empty!13377 () Bool)

(assert (=> b!474141 (= e!278255 tp_is_empty!13377)))

(declare-fun res!283203 () Bool)

(declare-fun e!278257 () Bool)

(assert (=> start!42494 (=> (not res!283203) (not e!278257))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42494 (= res!283203 (validMask!0 mask!1365))))

(assert (=> start!42494 e!278257))

(assert (=> start!42494 tp_is_empty!13377))

(assert (=> start!42494 tp!41884))

(assert (=> start!42494 true))

(declare-datatypes ((array!30505 0))(
  ( (array!30506 (arr!14671 (Array (_ BitVec 32) (_ BitVec 64))) (size!15023 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30505)

(declare-fun array_inv!10586 (array!30505) Bool)

(assert (=> start!42494 (array_inv!10586 _keys!1025)))

(declare-datatypes ((V!18941 0))(
  ( (V!18942 (val!6733 Int)) )
))
(declare-datatypes ((ValueCell!6345 0))(
  ( (ValueCellFull!6345 (v!9025 V!18941)) (EmptyCell!6345) )
))
(declare-datatypes ((array!30507 0))(
  ( (array!30508 (arr!14672 (Array (_ BitVec 32) ValueCell!6345)) (size!15024 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30507)

(declare-fun e!278259 () Bool)

(declare-fun array_inv!10587 (array!30507) Bool)

(assert (=> start!42494 (and (array_inv!10587 _values!833) e!278259)))

(declare-fun b!474142 () Bool)

(declare-fun e!278256 () Bool)

(assert (=> b!474142 (= e!278256 true)))

(declare-datatypes ((tuple2!8876 0))(
  ( (tuple2!8877 (_1!4449 (_ BitVec 64)) (_2!4449 V!18941)) )
))
(declare-datatypes ((List!8955 0))(
  ( (Nil!8952) (Cons!8951 (h!9807 tuple2!8876) (t!14927 List!8955)) )
))
(declare-datatypes ((ListLongMap!7789 0))(
  ( (ListLongMap!7790 (toList!3910 List!8955)) )
))
(declare-fun lt!215817 () ListLongMap!7789)

(declare-fun lt!215819 () tuple2!8876)

(declare-fun minValueBefore!38 () V!18941)

(declare-fun +!1745 (ListLongMap!7789 tuple2!8876) ListLongMap!7789)

(assert (=> b!474142 (= (+!1745 lt!215817 lt!215819) (+!1745 (+!1745 lt!215817 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215819))))

(declare-fun minValueAfter!38 () V!18941)

(assert (=> b!474142 (= lt!215819 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13978 0))(
  ( (Unit!13979) )
))
(declare-fun lt!215823 () Unit!13978)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!154 (ListLongMap!7789 (_ BitVec 64) V!18941 V!18941) Unit!13978)

(assert (=> b!474142 (= lt!215823 (addSameAsAddTwiceSameKeyDiffValues!154 lt!215817 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215816 () ListLongMap!7789)

(declare-fun zeroValue!794 () V!18941)

(assert (=> b!474142 (= lt!215817 (+!1745 lt!215816 (tuple2!8877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215822 () ListLongMap!7789)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2274 (array!30505 array!30507 (_ BitVec 32) (_ BitVec 32) V!18941 V!18941 (_ BitVec 32) Int) ListLongMap!7789)

(assert (=> b!474142 (= lt!215822 (getCurrentListMap!2274 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215820 () ListLongMap!7789)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474142 (= lt!215820 (getCurrentListMap!2274 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474143 () Bool)

(declare-fun e!278258 () Bool)

(assert (=> b!474143 (= e!278258 tp_is_empty!13377)))

(declare-fun b!474144 () Bool)

(declare-fun res!283205 () Bool)

(assert (=> b!474144 (=> (not res!283205) (not e!278257))))

(assert (=> b!474144 (= res!283205 (and (= (size!15024 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15023 _keys!1025) (size!15024 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474145 () Bool)

(assert (=> b!474145 (= e!278257 (not e!278256))))

(declare-fun res!283201 () Bool)

(assert (=> b!474145 (=> res!283201 e!278256)))

(assert (=> b!474145 (= res!283201 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215818 () ListLongMap!7789)

(assert (=> b!474145 (= lt!215816 lt!215818)))

(declare-fun lt!215821 () Unit!13978)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!248 (array!30505 array!30507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18941 V!18941 V!18941 V!18941 (_ BitVec 32) Int) Unit!13978)

(assert (=> b!474145 (= lt!215821 (lemmaNoChangeToArrayThenSameMapNoExtras!248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2068 (array!30505 array!30507 (_ BitVec 32) (_ BitVec 32) V!18941 V!18941 (_ BitVec 32) Int) ListLongMap!7789)

(assert (=> b!474145 (= lt!215818 (getCurrentListMapNoExtraKeys!2068 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474145 (= lt!215816 (getCurrentListMapNoExtraKeys!2068 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474146 () Bool)

(declare-fun res!283202 () Bool)

(assert (=> b!474146 (=> (not res!283202) (not e!278257))))

(declare-datatypes ((List!8956 0))(
  ( (Nil!8953) (Cons!8952 (h!9808 (_ BitVec 64)) (t!14928 List!8956)) )
))
(declare-fun arrayNoDuplicates!0 (array!30505 (_ BitVec 32) List!8956) Bool)

(assert (=> b!474146 (= res!283202 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8953))))

(declare-fun b!474147 () Bool)

(declare-fun mapRes!21781 () Bool)

(assert (=> b!474147 (= e!278259 (and e!278258 mapRes!21781))))

(declare-fun condMapEmpty!21781 () Bool)

(declare-fun mapDefault!21781 () ValueCell!6345)

(assert (=> b!474147 (= condMapEmpty!21781 (= (arr!14672 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6345)) mapDefault!21781)))))

(declare-fun mapNonEmpty!21781 () Bool)

(declare-fun tp!41883 () Bool)

(assert (=> mapNonEmpty!21781 (= mapRes!21781 (and tp!41883 e!278255))))

(declare-fun mapValue!21781 () ValueCell!6345)

(declare-fun mapRest!21781 () (Array (_ BitVec 32) ValueCell!6345))

(declare-fun mapKey!21781 () (_ BitVec 32))

(assert (=> mapNonEmpty!21781 (= (arr!14672 _values!833) (store mapRest!21781 mapKey!21781 mapValue!21781))))

(declare-fun b!474148 () Bool)

(declare-fun res!283204 () Bool)

(assert (=> b!474148 (=> (not res!283204) (not e!278257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30505 (_ BitVec 32)) Bool)

(assert (=> b!474148 (= res!283204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21781 () Bool)

(assert (=> mapIsEmpty!21781 mapRes!21781))

(assert (= (and start!42494 res!283203) b!474144))

(assert (= (and b!474144 res!283205) b!474148))

(assert (= (and b!474148 res!283204) b!474146))

(assert (= (and b!474146 res!283202) b!474145))

(assert (= (and b!474145 (not res!283201)) b!474142))

(assert (= (and b!474147 condMapEmpty!21781) mapIsEmpty!21781))

(assert (= (and b!474147 (not condMapEmpty!21781)) mapNonEmpty!21781))

(get-info :version)

(assert (= (and mapNonEmpty!21781 ((_ is ValueCellFull!6345) mapValue!21781)) b!474141))

(assert (= (and b!474147 ((_ is ValueCellFull!6345) mapDefault!21781)) b!474143))

(assert (= start!42494 b!474147))

(declare-fun m!456397 () Bool)

(assert (=> b!474145 m!456397))

(declare-fun m!456399 () Bool)

(assert (=> b!474145 m!456399))

(declare-fun m!456401 () Bool)

(assert (=> b!474145 m!456401))

(declare-fun m!456403 () Bool)

(assert (=> b!474146 m!456403))

(declare-fun m!456405 () Bool)

(assert (=> start!42494 m!456405))

(declare-fun m!456407 () Bool)

(assert (=> start!42494 m!456407))

(declare-fun m!456409 () Bool)

(assert (=> start!42494 m!456409))

(declare-fun m!456411 () Bool)

(assert (=> mapNonEmpty!21781 m!456411))

(declare-fun m!456413 () Bool)

(assert (=> b!474148 m!456413))

(declare-fun m!456415 () Bool)

(assert (=> b!474142 m!456415))

(declare-fun m!456417 () Bool)

(assert (=> b!474142 m!456417))

(declare-fun m!456419 () Bool)

(assert (=> b!474142 m!456419))

(assert (=> b!474142 m!456419))

(declare-fun m!456421 () Bool)

(assert (=> b!474142 m!456421))

(declare-fun m!456423 () Bool)

(assert (=> b!474142 m!456423))

(declare-fun m!456425 () Bool)

(assert (=> b!474142 m!456425))

(declare-fun m!456427 () Bool)

(assert (=> b!474142 m!456427))

(check-sat (not b!474145) (not b_next!11949) (not mapNonEmpty!21781) b_and!20417 (not start!42494) (not b!474148) (not b!474146) (not b!474142) tp_is_empty!13377)
(check-sat b_and!20417 (not b_next!11949))
