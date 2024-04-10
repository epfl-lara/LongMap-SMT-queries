; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42488 () Bool)

(assert start!42488)

(declare-fun b_free!11943 () Bool)

(declare-fun b_next!11943 () Bool)

(assert (=> start!42488 (= b_free!11943 (not b_next!11943))))

(declare-fun tp!41865 () Bool)

(declare-fun b_and!20411 () Bool)

(assert (=> start!42488 (= tp!41865 b_and!20411)))

(declare-fun mapNonEmpty!21772 () Bool)

(declare-fun mapRes!21772 () Bool)

(declare-fun tp!41866 () Bool)

(declare-fun e!278204 () Bool)

(assert (=> mapNonEmpty!21772 (= mapRes!21772 (and tp!41866 e!278204))))

(declare-datatypes ((V!18933 0))(
  ( (V!18934 (val!6730 Int)) )
))
(declare-datatypes ((ValueCell!6342 0))(
  ( (ValueCellFull!6342 (v!9022 V!18933)) (EmptyCell!6342) )
))
(declare-fun mapRest!21772 () (Array (_ BitVec 32) ValueCell!6342))

(declare-datatypes ((array!30495 0))(
  ( (array!30496 (arr!14666 (Array (_ BitVec 32) ValueCell!6342)) (size!15018 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30495)

(declare-fun mapKey!21772 () (_ BitVec 32))

(declare-fun mapValue!21772 () ValueCell!6342)

(assert (=> mapNonEmpty!21772 (= (arr!14666 _values!833) (store mapRest!21772 mapKey!21772 mapValue!21772))))

(declare-fun res!283156 () Bool)

(declare-fun e!278203 () Bool)

(assert (=> start!42488 (=> (not res!283156) (not e!278203))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42488 (= res!283156 (validMask!0 mask!1365))))

(assert (=> start!42488 e!278203))

(declare-fun tp_is_empty!13371 () Bool)

(assert (=> start!42488 tp_is_empty!13371))

(assert (=> start!42488 tp!41865))

(assert (=> start!42488 true))

(declare-datatypes ((array!30497 0))(
  ( (array!30498 (arr!14667 (Array (_ BitVec 32) (_ BitVec 64))) (size!15019 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30497)

(declare-fun array_inv!10582 (array!30497) Bool)

(assert (=> start!42488 (array_inv!10582 _keys!1025)))

(declare-fun e!278206 () Bool)

(declare-fun array_inv!10583 (array!30495) Bool)

(assert (=> start!42488 (and (array_inv!10583 _values!833) e!278206)))

(declare-fun b!474069 () Bool)

(declare-fun res!283157 () Bool)

(assert (=> b!474069 (=> (not res!283157) (not e!278203))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474069 (= res!283157 (and (= (size!15018 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15019 _keys!1025) (size!15018 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474070 () Bool)

(declare-fun e!278202 () Bool)

(assert (=> b!474070 (= e!278202 true)))

(declare-datatypes ((tuple2!8874 0))(
  ( (tuple2!8875 (_1!4448 (_ BitVec 64)) (_2!4448 V!18933)) )
))
(declare-datatypes ((List!8953 0))(
  ( (Nil!8950) (Cons!8949 (h!9805 tuple2!8874) (t!14925 List!8953)) )
))
(declare-datatypes ((ListLongMap!7787 0))(
  ( (ListLongMap!7788 (toList!3909 List!8953)) )
))
(declare-fun lt!215749 () ListLongMap!7787)

(declare-fun lt!215750 () tuple2!8874)

(declare-fun minValueBefore!38 () V!18933)

(declare-fun +!1744 (ListLongMap!7787 tuple2!8874) ListLongMap!7787)

(assert (=> b!474070 (= (+!1744 lt!215749 lt!215750) (+!1744 (+!1744 lt!215749 (tuple2!8875 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215750))))

(declare-fun minValueAfter!38 () V!18933)

(assert (=> b!474070 (= lt!215750 (tuple2!8875 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13976 0))(
  ( (Unit!13977) )
))
(declare-fun lt!215746 () Unit!13976)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!153 (ListLongMap!7787 (_ BitVec 64) V!18933 V!18933) Unit!13976)

(assert (=> b!474070 (= lt!215746 (addSameAsAddTwiceSameKeyDiffValues!153 lt!215749 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215745 () ListLongMap!7787)

(declare-fun zeroValue!794 () V!18933)

(assert (=> b!474070 (= lt!215749 (+!1744 lt!215745 (tuple2!8875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215747 () ListLongMap!7787)

(declare-fun getCurrentListMap!2273 (array!30497 array!30495 (_ BitVec 32) (_ BitVec 32) V!18933 V!18933 (_ BitVec 32) Int) ListLongMap!7787)

(assert (=> b!474070 (= lt!215747 (getCurrentListMap!2273 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215744 () ListLongMap!7787)

(assert (=> b!474070 (= lt!215744 (getCurrentListMap!2273 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474071 () Bool)

(assert (=> b!474071 (= e!278203 (not e!278202))))

(declare-fun res!283160 () Bool)

(assert (=> b!474071 (=> res!283160 e!278202)))

(assert (=> b!474071 (= res!283160 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215748 () ListLongMap!7787)

(assert (=> b!474071 (= lt!215745 lt!215748)))

(declare-fun lt!215751 () Unit!13976)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!247 (array!30497 array!30495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18933 V!18933 V!18933 V!18933 (_ BitVec 32) Int) Unit!13976)

(assert (=> b!474071 (= lt!215751 (lemmaNoChangeToArrayThenSameMapNoExtras!247 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2067 (array!30497 array!30495 (_ BitVec 32) (_ BitVec 32) V!18933 V!18933 (_ BitVec 32) Int) ListLongMap!7787)

(assert (=> b!474071 (= lt!215748 (getCurrentListMapNoExtraKeys!2067 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474071 (= lt!215745 (getCurrentListMapNoExtraKeys!2067 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474072 () Bool)

(assert (=> b!474072 (= e!278204 tp_is_empty!13371)))

(declare-fun b!474073 () Bool)

(declare-fun e!278201 () Bool)

(assert (=> b!474073 (= e!278206 (and e!278201 mapRes!21772))))

(declare-fun condMapEmpty!21772 () Bool)

(declare-fun mapDefault!21772 () ValueCell!6342)

(assert (=> b!474073 (= condMapEmpty!21772 (= (arr!14666 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6342)) mapDefault!21772)))))

(declare-fun mapIsEmpty!21772 () Bool)

(assert (=> mapIsEmpty!21772 mapRes!21772))

(declare-fun b!474074 () Bool)

(declare-fun res!283158 () Bool)

(assert (=> b!474074 (=> (not res!283158) (not e!278203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30497 (_ BitVec 32)) Bool)

(assert (=> b!474074 (= res!283158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474075 () Bool)

(declare-fun res!283159 () Bool)

(assert (=> b!474075 (=> (not res!283159) (not e!278203))))

(declare-datatypes ((List!8954 0))(
  ( (Nil!8951) (Cons!8950 (h!9806 (_ BitVec 64)) (t!14926 List!8954)) )
))
(declare-fun arrayNoDuplicates!0 (array!30497 (_ BitVec 32) List!8954) Bool)

(assert (=> b!474075 (= res!283159 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8951))))

(declare-fun b!474076 () Bool)

(assert (=> b!474076 (= e!278201 tp_is_empty!13371)))

(assert (= (and start!42488 res!283156) b!474069))

(assert (= (and b!474069 res!283157) b!474074))

(assert (= (and b!474074 res!283158) b!474075))

(assert (= (and b!474075 res!283159) b!474071))

(assert (= (and b!474071 (not res!283160)) b!474070))

(assert (= (and b!474073 condMapEmpty!21772) mapIsEmpty!21772))

(assert (= (and b!474073 (not condMapEmpty!21772)) mapNonEmpty!21772))

(get-info :version)

(assert (= (and mapNonEmpty!21772 ((_ is ValueCellFull!6342) mapValue!21772)) b!474072))

(assert (= (and b!474073 ((_ is ValueCellFull!6342) mapDefault!21772)) b!474076))

(assert (= start!42488 b!474073))

(declare-fun m!456301 () Bool)

(assert (=> start!42488 m!456301))

(declare-fun m!456303 () Bool)

(assert (=> start!42488 m!456303))

(declare-fun m!456305 () Bool)

(assert (=> start!42488 m!456305))

(declare-fun m!456307 () Bool)

(assert (=> b!474075 m!456307))

(declare-fun m!456309 () Bool)

(assert (=> mapNonEmpty!21772 m!456309))

(declare-fun m!456311 () Bool)

(assert (=> b!474074 m!456311))

(declare-fun m!456313 () Bool)

(assert (=> b!474070 m!456313))

(declare-fun m!456315 () Bool)

(assert (=> b!474070 m!456315))

(declare-fun m!456317 () Bool)

(assert (=> b!474070 m!456317))

(declare-fun m!456319 () Bool)

(assert (=> b!474070 m!456319))

(declare-fun m!456321 () Bool)

(assert (=> b!474070 m!456321))

(assert (=> b!474070 m!456317))

(declare-fun m!456323 () Bool)

(assert (=> b!474070 m!456323))

(declare-fun m!456325 () Bool)

(assert (=> b!474070 m!456325))

(declare-fun m!456327 () Bool)

(assert (=> b!474071 m!456327))

(declare-fun m!456329 () Bool)

(assert (=> b!474071 m!456329))

(declare-fun m!456331 () Bool)

(assert (=> b!474071 m!456331))

(check-sat (not b!474070) (not b!474075) (not b_next!11943) (not mapNonEmpty!21772) b_and!20411 (not b!474074) (not start!42488) (not b!474071) tp_is_empty!13371)
(check-sat b_and!20411 (not b_next!11943))
